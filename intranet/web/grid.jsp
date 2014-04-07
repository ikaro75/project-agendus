<?xml version='1.0' encoding='ISO-8859-1'?><%@ page contentType="text/xml; charset=UTF-8" pageEncoding="UTF-8"
%><%@page import="java.util.ArrayList" 
%><%@page import="mx.edu.ilce.intranet.modelo.*" 
%><%@page import="java.text.DecimalFormat"
%><%@page import="java.text.NumberFormat"
%><%@page import="java.text.SimpleDateFormat"
%><%@page import="mx.edu.ilce.intranet.reporte.*"
%><%@page import="java.util.LinkedHashMap"
%><%@page import="mx.edu.ilce.intranet.backend.Forma"%><% 

    response.setContentType("text/xml;charset=ISO-8859-1");
    request.setCharacterEncoding("ISO-8859-1");

    String error = ""; 
    int forma = 0;;
    String tipoAccion = "";
    String dp = "body";
    String w = "";
    String source = "";
    Integer pagina = 1;  
    Integer registros = 50;
    StringBuilder sidx = new StringBuilder("");
    String sord = "desc";
    Forma frmTemp = new Forma();
    LinkedHashMap <String,Campo> campos;
    ArrayList<ArrayList> aRegistros;

    int pk = 0;

    Usuario user = (Usuario) request.getSession().getAttribute("usuario");

    if (user == null) {
        request.getRequestDispatcher("/index.jsp");
    }

    try {
        if (request.getParameter("$cf") != null) {
            try {
                forma = Integer.parseInt(request.getParameter("$cf"));
            } catch (Exception e) {
                throw new Fallo("El parámetro $cf no es válido, verifique");
            }
        } else {
            throw new Fallo("Falta parámetro $cf");
        }

        if (request.getParameter("$ta") == null) {
            throw new Fallo("Falta parámetro $ta");
        } else {
            tipoAccion = request.getParameter("$ta");
        }

        if (request.getParameter("$pk") != null) {
            try {
                pk = Integer.parseInt(request.getParameter("$pk"));
            } catch (Exception e) {
                throw new Fallo("El parámetro $pk no es válido, verifique");
            }
        }

        if (request.getParameter("$w") != null) {
            w = request.getParameter("$w");
        }

        if (request.getParameter("$dp") != null) {
            dp = request.getParameter("$dp");
        }

        try {
            if (request.getParameter("page") != null) {
                pagina = Integer.parseInt(request.getParameter("page"));
            }
        } catch (Exception e) {
            throw new Fallo("El parámetro page no es válido, verifique");
        }

        try {
            if (request.getParameter("rows") != null) {
                registros = Integer.parseInt(request.getParameter("rows"));
            }
        } catch (Exception e) {
            error = "El parámetro rows no es válido, verifique";
        }

        if (request.getParameter("sidx") != null) {
            String[] aSidx = request.getParameter("sidx").toString().split("_");
            for (int i = 0; i < aSidx.length - 3; i++) {
                sidx.append(aSidx[i]);
                if (i < aSidx.length - 4) {
                    sidx.append("_");
                }
            }
        }

        if (request.getParameter("sord") != null) {
            sord = request.getParameter("sord");
        }
        
        frmTemp = new Forma(new Consulta(forma, tipoAccion, String.valueOf(pk), w, user, registros, pagina, sidx.toString(), sord),false);
        frmTemp.setDefinicionDelGrid(dp.equals("header") ? true : false);
        source = frmTemp.getSQL();
        error = "";
    } catch (Fallo f) {
        error = f.getMessage();

    } catch (Exception e) {
        error = e.getMessage();
    } finally {
%><qry>
    <sql><![CDATA[<%=source.replaceAll("\\[", "\\\\\\[") %>]]></sql>
    <%
        if (error == null) {
            error = "";
        }
        if (!error.equals("")) {%>
    <error><![CDATA[<%=error%>]]></error>
</qry><%
            return;
        }
    }
%><permisos><% if (frmTemp.isSelect()) {%>
    <permiso><clave_permiso>1</clave_permiso></permiso><%}
        if (frmTemp.isInsert()) {%>
    <permiso><clave_permiso>2</clave_permiso></permiso>    <%}
        if (frmTemp.isUpdate()) {%>
    <permiso><clave_permiso>3</clave_permiso></permiso><%}
        if (frmTemp.isDelete()) {%>
    <permiso><clave_permiso>4</clave_permiso></permiso><%}
        if (frmTemp.isSensitiveData()) {%>
    <permiso><clave_permiso>5</clave_permiso></permiso><% }
        if (frmTemp.isReport()) {%>
    <permiso><clave_permiso>6</clave_permiso></permiso><% }%>
</permisos>
<configuracion_grid>
    <alias_tab><![CDATA[<%=frmTemp.getAliasTab()%>]]></alias_tab>
    <evento_grid tipo=""><![CDATA[<%=frmTemp.getEventoGrid()%>]]></evento_grid>
    <instrucciones><![CDATA[<%=frmTemp.getInstrucciones()%>]]></instrucciones>
    <forma><![CDATA[<%=frmTemp.getForma()%>]]></forma>
    <muestra_formas_foraneas><![CDATA[<%=frmTemp.isMuestraFormasForeaneas()%>]]></muestra_formas_foraneas>
</configuracion_grid><%
    if (frmTemp.isReport()) {%>
<reportes><%
    //Recupera de la base de datos los reportes y los coloca en la propiedad reporte de la forma del usuario
    ArrayList<Reporte> reportes = frmTemp.getReportes();

    //Se ejecuta el primer reporte de la lista por default
    for (Reporte r : reportes) {
    %><reporte id="<%=r.getClaveReporte()%>"><![CDATA[<%=r.getReporte()%>]]></reporte><%
        }
    %></reportes>
    <%}

        try {
            campos = frmTemp.getCampos();
            aRegistros = frmTemp.getRegistros();
        } catch (Exception e) {
            error = e.getMessage();%>
<error><%=error%></error></qry>
<% return;
    }

double total_paginas=0;
      
 if( frmTemp.getNumeroDeRegistros() >0 ) {
	total_paginas = Math.ceil(frmTemp.getNumeroDeRegistros()/registros);
        if ((frmTemp.getNumeroDeRegistros() % registros)>0)
                total_paginas+=1;
} else {
	total_paginas = 0;
}   
%>
<rows>
    <page><%=pagina%></page>
    <total><%= total_paginas %></total>
    <records><%=frmTemp.getNumeroDeRegistros()%></records>
    <column_definition><%
        for (Campo campo : campos.values()) {
            int k = 0;
        %>
        <<%=campo.getNombre()%> tipo_dato="<%=campo.getTipoDato()%>">
        <alias_campo><![CDATA[<%=campo.getAlias()%>]]></alias_campo>
        <obligatorio><%=campo.getObligatorio()%></obligatorio>
        <clave_tipo_control><![CDATA[<%=campo.getClaveTipoControl()%>]]></clave_tipo_control>
        <evento><![CDATA[<%=campo.getEvento()%>]]></evento>
        <clave_forma_foranea><%=campo.getClaveFormaForanea()%></clave_forma_foranea>
        <filtro_foraneo><%=campo.getFiltroForaneo()%></filtro_foraneo>
        <edita_forma_foranea><%=campo.getEditaFormaForanea()%></edita_forma_foranea>
        <no_permitir_valor_foraneo_nulo><%=campo.getNoPermitirValorForaneoNulo()%></no_permitir_valor_foraneo_nulo>
        <ayuda><![CDATA[<%=campo.getAyuda()%>]]></ayuda>
        <dato_sensible><%=campo.getDatoSensible()%></dato_sensible>
        <activo><%=campo.getActivo()%></activo>
        <tamano><%=campo.getTamano()%></tamano>
        <visible><%=campo.getVisible()%></visible>
        <valor_predeterminado><![CDATA[<%=campo.getValorPredeterminado()%>]]></valor_predeterminado>
        <justificar_cambio><%=campo.getJustificarCambio()%></justificar_cambio>
        <usado_para_agrupar><%=campo.getUsadoParaAgrupar()%></usado_para_agrupar>
        </<%=campo.getNombre()%>><%
                k++;
            }
        %>
    </column_definition><%
        if (!dp.equals("header")) {
            NumberFormat nfMoney = new DecimalFormat("$###,###,###,##0.00");
            NumberFormat nfReal = new DecimalFormat("###,###,###,##0.00");
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            SimpleDateFormat sd = new SimpleDateFormat("yyyy/MM/dd hh:mm");

            for (ArrayList registro : aRegistros) {
    %>
    <row><%
        int k = 0;
        String resultado = "";
        Object aKeySet[]=campos.keySet().toArray();

        for (Object dato : registro) {
            if (dato != null) {
                if (k>=aKeySet.length) {
                    break;
                }
                
                if (campos.get(aKeySet[k]).getTipoDato().toLowerCase().equals("money") || campos.get(aKeySet[k]).getTipoDato().toLowerCase().equals("decimal")) {
                    resultado = nfMoney.format(dato);
                } else if (campos.get(aKeySet[k]).getTipoDato().toLowerCase().equals("double")) {
                    resultado = nfReal.format(dato);
                } else if (campos.get(aKeySet[k]).getTipoDato().toLowerCase().equals("smalldatetime")) {
                    resultado = sdf.format(dato);
                } else if (campos.get(aKeySet[k]).getTipoDato().toLowerCase().equals("datetime")) {
                    resultado = sd.format(dato);
                } else if (request.getParameter("$removeTags") != null) {//Elimina las ligas de la descripción de actividad
                    resultado = dato.toString().replaceAll("\\<a.*?>", "").replaceAll("\\</a>", "");
                } else {
                    resultado = dato.toString();
                }
            } else {
                resultado = "";
            }
        %>
        <cell><![CDATA[<%=resultado%>]]></cell><%
                k++;
            }
        %>
    </row><%
            }

        }
    %></rows>
</qry>