<?xml version="1.0" encoding="UTF-8"?><%@ page contentType="text/xml; charset=UTF-8" pageEncoding="UTF-8" 
%><%@page import="mx.edu.ilce.intranet.modelo.Usuario" 
%><%@page import="mx.edu.ilce.intranet.modelo.Consulta" 
%><%@page import="mx.edu.ilce.intranet.modelo.Fallo" 
%><%@page import="java.util.Date" 
%><%@page import="java.text.SimpleDateFormat"
%><%@page import="mx.edu.ilce.intranet.utilerias.Utilerias"
%><respuesta>
<%  
    String mensaje = "";
    StringBuilder resultado = new StringBuilder();
    Integer claveTipoEvento = 1;
    Integer claveUsuario = 0;
    Usuario user = null;
    Usuario u = null;
    Consulta cnsAsistenciaEmpleado;
    Date fechaActual =null;
    String fechaActualFormat = "";
    
    user = (Usuario) request.getSession().getAttribute("usuario");

    if (user == null) {
        request.getRequestDispatcher("/login.jsp?$app=timeclock").forward(request, response);
    }  
    
    //2. Sincroniza el reloj con el servidor de la BD
    if (request.getParameter("id") == null || request.getParameter("id").equals(""))  {
        try {
            %><fecha><%=new SimpleDateFormat("yyyy,MM,dd,HH,mm,ss").format(Utilerias.getDateServidor(user))%></fecha><%
        } catch(Exception e) {
           %><error><%=e.getMessage()%></error><%
        }    
    } else {
        try {  
            claveUsuario = Integer.parseInt(request.getParameter("id"));
            
            //1. Verifica si existe el usuario
            u = new Usuario();
            u.setCx(user.getCx());
            u.setClave(claveUsuario);

            //3. Verifica si en ese dia hay otro registro del empleado con clave_tipo_evento=1 , entonces clave_tipo_evento=4
            if (u.getClaveTipoEventoUltimoRegistro()==1) {
                claveTipoEvento = 4;
            } else {
                claveTipoEvento = 1;
            }

            //4. Inserta registro
            cnsAsistenciaEmpleado = new Consulta(330, "insert", "0", "", user);
            cnsAsistenciaEmpleado.getCampos().get("clave_empleado").setValor(claveUsuario.toString());
            cnsAsistenciaEmpleado.getCampos().get("fecha_registro").setValor("%ahora");
            cnsAsistenciaEmpleado.getCampos().get("clave_tipo_evento").setValor(claveTipoEvento.toString());

            resultado.append(cnsAsistenciaEmpleado.insert(true));
            %><%=resultado%><%
            %><mensaje><![CDATA[<div style='width: 80%;margin-left: auto;margin-right: auto;text-align: center;margin-top: 40px;display: block;'><table style='margin-left: auto;margin-right: auto;'><tr><td><img src='<%=u.getFoto()%>' style='margin-right: 10px; border-color: #000'/><td><td><%=u.getNombre()%> <%=u.getApellidos()%><br><span style='color:#000'><% if (claveTipoEvento==1) {%>Entrada<%} else {%>Salida<%}%></span></td></tr></table></div>]]></mensaje><%            
       } catch(NumberFormatException n) {
           %><error><![CDATA[<br>Clave no válida, verifique]]></error><%
       } catch (Exception e) {
           if (e.getMessage().contains("Communications link failure")) {
               %><error><![CDATA[<br>Error de comunicación, verifique que cuenta con una conexión a la red]]></error><%
           } else if(e.getMessage().contains("Usuario no encontrado")) {
               %><error><![CDATA[<br>No se encontró al empleado especificado, verifique]]></error><%
           } else {
               %><error><![CDATA[<%=e.getMessage()%>]]></error><%
           }               
       }        
    }
    /*
     * 
                    * 
    if ((request.getParameter("id") == null || request.getParameter("id")=="") && !mensaje.equals("") ) {
        mensaje = "Por favor, pase su código por el dispositivo lector";      
    } else {
       try {  
            claveUsuario = Integer.parseInt(request.getParameter("id"));
            
            //1. Verifica si existe el usuario
            u = new Usuario();
            u.setCx(user.getCx());
            u.setClave(claveUsuario);

            //3. Verifica si en ese dia hay otro registro del empleado con clave_tipo_evento=1 , entonces clave_tipo_evento=4
            if (u.isChecoHoyEntrada()) {
                claveTipoEvento = 4;
            }

            //4. Inserta registro
            cnsAsistenciaEmpleado = new Consulta(330, "insert", "0", "", user);
            cnsAsistenciaEmpleado.getCampos().get("clave_empleado").setValor(claveUsuario.toString());
            cnsAsistenciaEmpleado.getCampos().get("fecha_registro").setValor("%ahora");
            cnsAsistenciaEmpleado.getCampos().get("clave_tipo_evento").setValor(claveTipoEvento.toString());

            resultado.append(cnsAsistenciaEmpleado.insert(true));
       } catch(NumberFormatException n) {
           mensaje ="Clave no válida, verifique";
       } catch (Exception e) {
           mensaje = e.getMessage();
       }
       
       if (mensaje.equals("")) {
            if (claveTipoEvento == 1) {
                 mensaje= "<span style='color:#000'>".concat(u.getNombre()).concat(" ").concat(u.getApellidos()).concat("</span><br>Entrada");
            } else {
                 mensaje= "<span style='color:#000'>".concat(u.getNombre()).concat(" ").concat(u.getApellidos()).concat("</span><br>Salida");
            } 
       }
    } */
%></respuesta>