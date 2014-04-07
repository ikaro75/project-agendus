<%@page import="mx.edu.ilce.intranet.modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%  Usuario user;
    user = (Usuario) request.getSession().getAttribute("usuario");

    if (user == null) {
        request.getRequestDispatcher("/login.jsp?$app=timeclock").forward(request, response);
    }  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title id="title">Registro de entradas y salidas</title>
        <link href="img/ilce.ico" type="image/x-icon" rel="shortcut icon" />

        <link type="text/css" href="css/start/jquery.ui.all.css"  rel="stylesheet"/>
        <link type="text/css" href="css/reloj.css"  rel="stylesheet"/>
        <script type="text/javascript" src="jQuery/js/jquery-1.7.2.min.js" /></script>
        <script type="text/javascript" src="jQuery/js/reloj.js" /></script>
        <script type="text/javascript" src="jQuery/js/screenfull.js" ></script>
    </head>
    <body>
        <img src="img/logo_intranet_4.png">
    	<div id="contenedor">
            <header id="cabecera">
                <div class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all">
                    <h1 align="center">Registro de entradas y salidas</h1>
                </div>
            </header>
            <div id="reloj">

                <br><br><br><input type="hidden" value="" id="fechaActual" />
                <div class="clock">
                    <div id="Date"></div>
                    <ul >
                        <li id="hrs"></li>
                        <li id="point">:</li>
                        <li id="min"></li>
                        <li id="point">:</li>
                        <li id="seg"></li>
                    </ul>
                </div>
            </div>
            <div id="contenido" style="width:100%; margin-top: 10px;">
                <div id="mensaje" class="spanTexto2"><br>Inicializando reloj</div>
            </div>
        </div>
    </body>
</html>