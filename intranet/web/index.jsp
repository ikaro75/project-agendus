<%@page import="mx.edu.ilce.intranet.modelo.*"%>
<%
    Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
    if (usuario == null) {
        request.getRequestDispatcher("/login.jsp");
    }
%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
        <title>intranet 2.0 / ILCE</title>
        <link href="img/ilce.ico" type="image/x-icon" rel="shortcut icon" />

    </head>
    <script>
        window.location="login.jsp";
    </script>    
</html>
