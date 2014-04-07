/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.edu.ilce.intranet.controlador;

import mx.edu.ilce.intranet.modelo.Conexion;
import mx.edu.ilce.intranet.modelo.Usuario;
import mx.edu.ilce.intranet.modelo.Fallo;
import mx.edu.ilce.intranet.mail.Mail;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mx.edu.ilce.intranet.reporte.Reporte;


/**
 *  Clase encargada de procesar solicitudes de los usuarios a través del protocolo HTTP
 *  Administra lo relacionado a las sesiones y de redireccionar hacia los diferentes recursos del sistema
 *  Esta clase es la capa controladora
 */
public class Controlador extends HttpServlet {

    String sNextAction = "";

    /** 
     * Procesa y valida las peticiones de los usuarios hechas a través de los métodos <code>GET</code> y <code>POST</code>
     * del protocolo HTTP,
     * gestiona el manejo de sesión de usuarios y redirecciona a los recursos del sistema
     * @param request request del servlet 
     * @param response response del servlet 
     * @throws ServletException si ocurre un error específico del servlet
     * @throws IOException si ocurre un error de E/S
     * @throws Fallo Un fallo en la respuesta del controlador
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Fallo {
        response.setContentType("text/xml; charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
        response.setDateHeader("Expires", 0);   
        //response.setContentType("text/xml;charset=ISO-8859-1");
        request.setCharacterEncoding("UTF8");

        String cmd = request.getParameter("$cmd");
        try {
            if (cmd == null) {
                sNextAction = "<error><![CDATA[Falta comando, verifique]]></error>";
            } else {
                
                if (cmd.equals("testconnection")) {
                    Conexion cx = new Conexion();
                    if (cx.getDbType()==mx.edu.ilce.intranet.modelo.Conexion.DbType.MYSQL) {
                        sNextAction="<mensaje><![CDATA[connection string = jdbc:mysql://".concat(cx.getServer()).concat("/").concat(cx.getDb()).concat(",").concat(cx.getUser()).concat(",").concat(cx.getPw()).concat("]]></mensaje>");
                        cx.getRs("select 'Hola mundo' as mensaje");
                    } else if (cx.getDbType()==mx.edu.ilce.intranet.modelo.Conexion.DbType.MSSQL) {
                        sNextAction="<mensaje><![CDATA[connection string = jdbc:sqlserver://".concat(cx.getServer()).concat(";databaseName=").concat(cx.getDb()).concat(";selectMethod=cursor;").concat(cx.getUser()).concat(",").concat(cx.getPw()).concat("]]></mensaje>");
                        cx.getRs("select Hola mundo' as mensaje");
                    } else if (cx.getDbType()==mx.edu.ilce.intranet.modelo.Conexion.DbType.ORACLE) {
                        sNextAction="<mensaje><![CDATA[connection string = jdbc:oracle:thin:".concat(cx.getUser()).concat("/").concat(cx.getPw()).concat("@").concat(cx.getServer()).concat(":").concat(cx.getDb()).concat("]]></mensaje>");
                        cx.getRs("select 'Hola mundo' as mensaje from dual");
                    }
                    sNextAction+="<mensaje><![CDATA[conexión exitosa]]></mensaje>";
                } else if (cmd.equals("login")) /* inicia comando login */ {
                    Usuario usuario = new Usuario();
                    usuario.setIp(request.getRemoteAddr());
                    usuario.setNavegador(request.getHeader("user-agent"));
                    String aParametros[] = {"email", "password"};
                    sNextAction = valida_parametros(request, aParametros);
                    if (sNextAction.equals("")) {
                        Conexion cx = new Conexion();
                        int nUsuario = cx.getLogin(request.getParameter("email"), request.getParameter("password"));

                        if (nUsuario != 0) {
                            usuario.setCx(cx);
                            usuario.setClave(nUsuario);
                            usuario.setSesion(request.getSession().getId());
                            request.getSession().setAttribute("usuario", usuario);

                            if (request.getParameter("$app") == null) {
                                sNextAction="<mensaje><![CDATA[Usuario validado]]></mensaje>";
                                
                                if (request.getParameter("url") != null) {
                                     request.getRequestDispatcher(request.getParameter("url")).forward(request, response);
                                } else {
                                    
                                    response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
                                    response.setHeader("Location", "/intranet/vista.jsp");
                                    response.setContentType("text/html");
                                    //response.sendRedirect("/intranet-movil/noticias.jsp");
                                    return;
                                    
                                    //request.getRequestDispatcher("/promocion.jsp").forward(request, response);
                                }
                                
                            } else if (request.getParameter("$app").equals("monitor")) {
                                sNextAction="<mensaje><![CDATA[Usuario validado]]></mensaje>";
                                request.getRequestDispatcher("/monitor.jsp").forward(request, response);
                            } else if (request.getParameter("$app").equals("timeclock")) {
                                sNextAction="<mensaje><![CDATA[Usuario validado]]></mensaje>";
                                request.getRequestDispatcher("/timeclock.jsp").forward(request, response);
                            }
                            else if (request.getParameter("$app").equals("timeclock")) {
                                sNextAction="<mensaje><![CDATA[Usuario validado]]></mensaje>";
                                request.getRequestDispatcher("/timeclock.jsp").forward(request, response);
                            }
                            
                        } else {
                            sNextAction="<mensaje><![CDATA[Usuario y/o password incorrecto, verifique]]></mensaje>";
                            request.getSession().setAttribute("mensaje_login", "Usuario y/o password incorrecto, verifique");
                            request.getRequestDispatcher("/login.jsp").forward(request, response);
                        }
                    }
                } else if (cmd.equals("recoverpw")) {
                    Usuario usuario = new Usuario();
                    Conexion cx = new Conexion();
                    usuario.setCx(cx);
                    usuario.setIp(request.getRemoteAddr());
                    usuario.setNavegador(request.getHeader("user-agent"));
                    String aParametros[] = {"email"};
                    sNextAction = valida_parametros(request, aParametros);
                    if (sNextAction.equals("")) {
                        String p = usuario.recuperaPassword(request.getParameter("email"));
                        if (p.equals("")) {
                            sNextAction = "El correo especificado no está registrado, verifique";
                        } else {
                            try {
                                Mail userMail = new Mail();
                                userMail.sendEmail("Administrador_de_SIAP_2.0",
                                        request.getParameter("email"),
                                        "Contraseña recuperada",
                                        "Se esta enviado el siguiente correo como respuesta a su solicitud de recuperación de contraseña.\n\nUsuario:".concat(request.getParameter("email")).concat("\n Password:").concat(p).concat("\n\nAdministrador del SIAP 2.0"),
                                        "");
                                sNextAction = "Su contraseña fue enviada a su correo registrado, verifique";
                            } catch (Exception e) {
                                sNextAction = "<error_mail>".concat(e.getMessage()).concat("</error_mail>");
                            }
                        }
                    }

                } else if (cmd.equals("logout")) {
                    Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
                    usuario.logOut(usuario.getCx());
                    usuario = null;
                    request.getSession().removeAttribute("usuario");
                    request.getSession().setAttribute("mensaje_login", "Sesión finalizada");
                    request.getRequestDispatcher("/login.jsp").forward(request, response);
                } else {
                    //Verifica que la clave de usuario esté activa
                    if (request.getSession().getAttribute("usuario") == null) {
                        request.getRequestDispatcher("/login.jsp").forward(request, response);
                    } else {
                        /* comandos para presentar informacion */
                        if (cmd.equals("vista")) { //Carga jsp indicado
                            request.getRequestDispatcher("/vista.jsp").forward(request, response);
                        } else if (cmd.equals("form")) { //Carga jsp indicado
                            request.getRequestDispatcher("/form.jsp").forward(request, response);
                        } else if (cmd.equals("parameter")) { //xml sin diccionario de datos
                            request.getRequestDispatcher("/parameter.jsp").forward(request, response);
                        } else if (cmd.equals("plain")) { //xml sin diccionario de datos
                            request.getRequestDispatcher("/plain.jsp").forward(request, response);
                        } else if (cmd.equals("grid")) { //xml para contruir el grid
                            request.getRequestDispatcher("/grid.jsp").forward(request, response);
                        } else if (cmd.equals("sesion")) { //xml para menú de sesión
                            request.getRequestDispatcher("/sesion.jsp").forward(request, response);
                        } else if (cmd.equals("app")) { // xml para menú de aplicaciones
                            request.getRequestDispatcher("/app.jsp").forward(request, response);
                        } else if (cmd.equals("post")) { // xml para menú de aplicaciones
                            request.getRequestDispatcher("/new_post.jsp").forward(request, response);
                        } else if (cmd.equals("register")) {/* gestión de inserciones y actualizaciones */

                            if (request.getContentType() != null) {
                                if (request.getContentType().contains("multipart/form-data;")) {
                                    request.getRequestDispatcher("/upload.jsp").forward(request, response);

                                } else {
                                    request.getRequestDispatcher("/register.jsp").forward(request, response);
                                }
                            } else {
                                request.getRequestDispatcher("/register.jsp").forward(request, response);
                            }

                        } else if (cmd.equals("excel")) {/* gestión de inserciones y actualizaciones */
                            request.getRequestDispatcher("/excel.jsp").forward(request, response);
                        } else if (cmd.equals("report")) {/* controlador de reportes html */
                            String aParametros[] = {"$cr"};
                            sNextAction = valida_parametros(request, aParametros);

                            //El parámetro $tg define a qué jsp se debe redireccionar
                            if (sNextAction.equals("")) {
                                //Si se indica que $tg es el primero, no se sabe qué tipo de reporte se trata;
                                //en este caso el controlador detecta el tipo del primer reporte
                                Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
                                Reporte r = new Reporte();
                                r.setClaveReporte(Integer.parseInt(request.getParameter("$cr")), usuario.getClavePerfil(), usuario.getCx());
                                //Se redirecciona al jsp correcto de acuerdo al tipo de gráfico
                                request.getRequestDispatcher("/".concat(r.getJsp()).concat(".jsp")).forward(request, response);
                            }

                        }/* Comandos para validar consultas */ else if (cmd.equals("validate")) {
                            request.getRequestDispatcher("/validate.jsp").forward(request, response);
                        } else if (cmd.equals("mail")) {
                            String aParametros[] = {"from", "to", "subject", "message"};
                            sNextAction = valida_parametros(request, aParametros);
                            if (sNextAction.equals("")) {
                                try {
                                    Mail userMail = new Mail();
                                    userMail.sendEmail(request.getParameter("from"),
                                            request.getParameter("to"),
                                            request.getParameter("subject"),
                                            request.getParameter("message"),
                                            request.getParameter("filename"));
                                    sNextAction = "<![CDATA[Envío exitoso]]>";
                                } catch (Exception e) {
                                    sNextAction = "<error_mail>".concat(e.getMessage()).concat("</error_mail>");
                                }

                            } // if (sNextAction.equals(""))
                        } //if (cmd.equals("sendmail"))
                        else if (cmd.equals("import")) {
                            request.getRequestDispatcher("/import.jsp").forward(request, response);
                        }
                        else {
                            sNextAction = "<error><![CDATA[Comando no válido]]></error>";
                        }
                    }  //else de  if (request.getSession().getAttribute("usuario")==null)  
                } //else de comandos que requieren de sesión
            } //if (cmd==null) ... else
        } catch (Fallo f) {
            if (f.getMessage().equals("Usuario no encontrado")) {
                request.getSession().setAttribute("mensaje_login", "Usuario y/o password incorrecto, verifique");
            } else {
                sNextAction+="<error><![CDATA[".concat(f.getMessage()).concat("]]></error>");
                request.getSession().setAttribute("mensaje_login", f.getMessage());
            }
            
            if (!cmd.equals("testconnection"))
                request.getRequestDispatcher("/login.jsp").forward(request, response);

        } catch (Exception e) {
            sNextAction = "<error>".concat(e.getMessage()).concat("</error>");
        } finally {
            PrintWriter out = response.getWriter();
            /* Termina comando login */
            out.print("<?xml version='1.0' encoding='UTF-8'?>");
            out.print("<respuesta>");
            out.print("<cmd type='" + cmd + "' />");
            out.print(sNextAction);
            out.print("</respuesta>");
            out.close();
        }
    }

    String valida_parametros(HttpServletRequest request, String args[]) {
        String s = "";
        int i;
        for (i = 0; i < args.length; i++) {
            if (request.getParameter(args[i]) == null) {
                s = "<error><![CDATA[Falta el parámetro " + args[i] + ", verifique]]></error>";
                break;
            }
        }
        return s;
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception e) {
        }

    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception e) {
        }

    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Capa controladora del proycto CECyTEM";
    }// </editor-fold>
    
}
