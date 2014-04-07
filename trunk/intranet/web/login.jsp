<%
    String mensaje=(String) request.getSession().getAttribute("mensaje_login");
    request.setCharacterEncoding("UTF8");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 
        <link type="text/css" href="css/start/jquery.ui.all.css"  rel="stylesheet"/>
        <link type="text/css" href="css/vista.css" rel="stylesheet" />
        <link type="text/css" href="css/agile_carousel.css" rel="stylesheet"/>
        <script type="text/javascript" src="jQuery/js/jquery-1.7.2.min.js"></script>
        <script type="text/javascript" src="jQuery/js/jquery-ui-1.8.21.custom.min.js"></script>
        <script type="text/javascript" src="jQuery/js/login.js"></script>
        <script type="text/javascript" src="jQuery/js/agile_carousel.alpha.js"></script>
        <title> ILCE / intranet 2.0 - Iniciar sesi&oacute;n</title>
        <link href="img/ilce.ico" type="image/x-icon" rel="shortcut icon" />
        <style>
            .agile_carousel .numbered_button {
               float:none !important;
            }
        </style>
    </head>

    <body class="loginBackground" style="background: url(img/abstract-wavy-lines.png); background-size:100% 100%; background-repeat:no-repeat;";>
        <p>&nbsp;</p>
        <table width="35%" border="0" cellpadding="5" cellspacing="0" style="margin-left:30px;">
            <tr>
                <td>
                    <br /><br />
                    <div align="center">
                        <table style="width:600px">
                            <tr>
                                <td colspan="2" style="text-align: center"><img src="img/logo_intranet.png" /> </td>
                            </tr>
                        </table>
                    </div>
                    <br /><br/>
                </td>
            </tr>
            <tr>
                <td>
                    <div id="divCarousel">
                        <div id="divLogin">
                            <form action="control?$cmd=login" method="post" name="frmLogin" id="frmLogin">
                                <table width="75%" border="0" align="center" cellpadding="5" cellspacing="0">
                                    <tr>
                                        <td width="48%" ><div id="usuario" align="right" class="etiqueta_forma">Usuario</div></td>
                                        <td width="52%"><div align="right">
                                                <input name="email" type="text" id="email" size="24" />
                                            </div></td>
                                    </tr>
                                    <tr>
                                        <td ><div id="contrasena" align="right" class="etiqueta_forma">Contrase&ntilde;a</div></td>
                                        <td><div align="right">
                                                <input name="password" type="password" id="password" size="24" />
                                                <% if (request.getParameter("$app")!=null) { %>
                                                <input name="$app" type="hidden" id="$app"  value="<%=request.getParameter("$app")%>"/>
                                                <% } 
                                                   if (request.getParameter("url")!=null) { %>
                                                <input name="url" type="hidden" id="url"  value="<%=request.getParameter("url")%>"/>
                                                <% } %>
                                            </div></td>
                                    </tr>
                                    <tr>
                                        <td><div align="right">
                                            </div></td>
                                        <td><div align="right">
                                                <button id="iniciarsesion">Iniciar sesi&oacute;n</button>
                                            </div></td>
                                    </tr>
                                    <% if (mensaje!=null) { 
                                        if (!mensaje.equals("")) { %>
                                    <tr>
                                        <td colspan="2">
                                            <div class="ui-widget" id="divMsgLogin">
                                                <div class="ui-state-error ui-corner-all" style="padding: 0 .7em;">
                                                    <p id="msjLogin"><span class="ui-icon ui-icon-alert" style="float: left; margin-right: 0.3em;"></span><%=mensaje%></p>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                  <% } } %>
                                </table>
                            </form>
                        </div>
                        <div id="divLostPw">
                            <table width="75%" border="0" align="center" cellpadding="5" cellspacing="0">
                                <tr>
                                    <td width="48%"><div id="usuario" align="right" class="etiqueta_forma">Usuario</div></td>
                                    <td width="52%"><div align="right">
                                            <input name="rc" type="text" id="rc" size="24" />
                                        </div></td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <div align="right">
                                            <button id="btnRecuperarPw">Recuperar contrase&ntilde;a</button>
                                        </div></td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <div class="ui-widget" id="divMsjRecuperaPW">
                                            <div class="ui-state-error ui-corner-all" style="padding: 0 .7em;">
                                                <p id="msjRecuperaPW"><span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span><strong></strong></p>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
    </body>
</html>
<% request.getSession().setAttribute("mensaje_login","");%>
