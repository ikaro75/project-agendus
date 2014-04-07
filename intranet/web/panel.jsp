<%@ page import="mx.edu.ilce.intranet.modelo.*" %><%
    Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
    if (usuario == null) {
        request.getRequestDispatcher("/login.jsp"); 
    }
%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>AdministraX</title>

        <!-- librerias para cargar dialogo  -->
        <script type="text/javascript" src="jQuery/js/jquery-1.7.2.min.js"></script>
        <script type="text/javascript" src="jQuery/js/jquery-ui-1.8.21.custom.min.js"></script>

        <!-- app portlets -->
        <script type="text/javascript" src="jQuery/js/jquery.appportlet.js" ></script>
        <script type="text/javascript" src="jQuery/js/jquery.pi.portletlog.js" ></script>
        <script type="text/javascript" src="jQuery/js/jquery.pi.portletfilter.js" ></script>
        <script type="text/javascript" src="jQuery/js/jquery.pi.portletreport.js" ></script>

        <!-- Cookie -->
        <script type="text/javascript"  src="jQuery/js/jquery.cookie.js" ></script>

        <!-- jqGrid -->
        <script type="text/javascript" src="jQuery/js/grid.locale-es.js" ></script>
        <script type="text/javascript" src="jQuery/js/jquery.jqGrid.min.js"></script>
        <script type="text/javascript" src="jQuery/js/grid.subgrid.js"></script>
        <script type="text/javascript" src="jQuery/js/jquery.jstree.js"></script>


        <!--Datetime picker -->
        <script src="jQuery/js/jquery-ui-timepicker-addon.js" type="text/javascript"></script>

        <!-- Calculator -->
        <script type="text/javascript" src="jQuery/js/jquery.calculator.min.js" ></script>
        <script type="text/javascript" src="jQuery/js/jquery.calculator-es.js" ></script>

        <!-- Menu -->
        <script src="jQuery/js/jquery.ui.menu.js" type="text/javascript"></script>

        <!-- Carrousel -->
        <script type="text/javascript" src="jQuery/js/agile_carousel.alpha.js"></script>

        <!-- Tooltip -->
        <script src="jQuery/js/jquery.tooltip.min.js" type="text/javascript"></script>

        <!-- form plugin para considerar uploads  -->
        <script type="text/javascript" src="jQuery/js/jquery.form.js"></script>
        
        <script type="text/javascript" src="jQuery/js/finanzax.js"></script>

        <link rel="stylesheet" type="text/css" media="screen" href="css/agile_carousel.css" />
        <link rel="stylesheet" type="text/css" media="screen" href="css/redmond/jquery.ui.all.css" />
        <link rel="stylesheet" type="text/css" media="screen" href="jQuery/js/jqGrid/css/ui.jqgrid.css"/>
        <link rel="stylesheet" type="text/css" media="screen" href="css/jquery.tooltip.css"/>
        <link rel="stylesheet" type="text/css" media="screen" href="css/style.css"/>
        <link rel="stylesheet" type="text/css" media="screen" href="css/vista.css"/>
        <link rel="stylesheet" type="text/css" media="screen" href="css/calculator/jquery.calculator.css"/>
        <link rel="stylesheet" type="text/css" media="screen" href="jQuery/js/jwysiwyg-master/jquery.wysiwyg.css" />


        <script src="jQuery/js/funciones.js" type="text/javascript"></script>
        <script src="jQuery/js/jquery.pi.desktop.js" type="text/javascript"></script>
        <script src="jQuery/js/jquery.pi.gridqueue.js" type="text/javascript"></script>
        <script src="jQuery/js/jquery.pi.field_toolbar.js" type="text/javascript"></script>
        <script src="jQuery/js/jquery.pi.session.js" type="text/javascript"></script>
        <script src="jQuery/js/jquery.pi.form.js" type="text/javascript"></script>
        <script src="jQuery/js/jquery.pi.formqueue.js" type="text/javascript"></script>
        <script src="jQuery/js/jquery.pi.accordion.js" type="text/javascript"></script>
        <script src="jQuery/js/jquery.pi.tab.js" type="text/javascript"></script>
        <script src="jQuery/js/jquery.pi.grid.js" type="text/javascript"></script>
        <script src="jQuery/js/jquery.pi.treeMenu.js" type="text/javascript"></script>
        <script src="jQuery/js/jquery.pi.appmenu.js" type="text/javascript"></script>
        <script src="jQuery/js/jquery.pi.comments.js" type="text/javascript"></script>
        <script src="jQuery/js/jquery.timeago.js" type="text/javascript"></script>
        <script src="jQuery/js/jquery.timeago.es.js" type="text/javascript"></script>
        
        <script type="text/javascript" src="jQuery/js/jwysiwyg-master/jquery.wysiwyg.js"></script>
        <script type="text/javascript" src="jQuery/js/sets/html/set.js"></script>
        
        <script src="jQuery/js/vista.js" type="text/javascript"></script>
    </head>
    <body id="top">
        <!-- <script type="text/javascript"
                src="http://jqueryui.com/themeroller/themeswitchertool/">
        </script> -->
        <div id="banner">
            <div style="float: left; position: relative; ">
                <br />
                <img src="img/administrax_logo.png" class="logo_plataforma"/></div>
            <div id="sessionMenu" style="float: right; position: relative; "></div>
        </div>
        <!-- 
        <div class="menus_plataforma">
            <div id="app_menu" style="float:left">
                <div>
                    <a href='#' id='menu_inicio' >Inicio</a>
                    <a href='#' id='menu_aplicaciones' >Aplicaciones</a>
                    <a href='#' id='menu_splitter' >&nbsp;</a>
                    <a href='#' id='menu_mapa' >Mapa del sitio</a>
                    <a href='#' id='menu_ayuda' >Ayuda</a>
                    <a href='#' id='menu_contacto' >Contacto</a>
                </div>
                <ul id="apps">
                </ul>    
            </div>
        </div>
        -->
        <div id="tabcontainer">
            <div id="tabs">
                <div style="padding-right: 5px; float: right; padding-top: 3px; position: relative; top: -30px; width:300px"><input id='txtBusquedaGlobal' type='text' style="clear:none; float:left"/>
                    <div id="switcher"  style="float:right"></div>
                </div>
                <div class="column ui-sortable">
                    <div class="portlet">
                        <div class="portlet-header">Aplicaciones</div>
                        <div class="portlet-content">
                            <p>Bienvenid@ a AdministraX, esperamos que esta herramienta sea de su utilidad</p>
                        </div>
                    </div>
                </div>
<div id="tabAplicaciones">
                <div id="appMenu_0" aplicacion="0"></div><br/>
                <div id="tab_0" style="height: 150%;">
                    <ul>
                        <li><a href='#tabMisAplicaciones'>C�mo usar mis aplicaciones</a></li>
                    </ul>
                    <div id='tabMisAplicaciones'>
                        <div id='divCarouselMisAplicaciones'>
                            <div id='ayudaComoUsarMisAplicaciones'>
                                <table >
                                    <tr>
                                        <td colspan='2'>
                                            <h3>Comienza a usar tus aplicaciones</h3>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <img src='img/como_usar_aplicaciones.png'  class='helpScreen'/>
                                        </td>
                                        <td class='instrucciones'>
                                            <p class='instrucciones'>
                                                En este espacio puedes abrir tus aplicaciones, para comenzar haz lo siguiente:</p>
                                            <ol>
                                                <li class='instrucciones'>Ve a la pesta�a "Aplicaciones"</li>
                                                <li class='instrucciones'>Haz clic en el bot�n de la aplicaci�n que deseas abrir; inmediatamente despu�s se abrir� una pesta�a con el nombre de la aplicaci�n seleccionada con el cat�logo principal</li>
                                            </ol>        
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div id='ayudaComoAgregarUnRegistro'>
                                <table >
                                    <tr>
                                        <td colspan='2'>
                                            <h3>Agrega un registro nuevo al cat�logo</h3>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <img src='img/como_agregar_registros.png'  class='helpScreen' />
                                        </td>
                                        <td class='instrucciones'>
                                            <p class='instrucciones'>
                                                Para agregar un registro sigue los siguientes pasos:</p>
                                            <ol>
                                                <li>Haz clic encima del bot�n <span class='ui-icon ui-icon-plus' style='display:inline-block'></span>de la barra de herramientas del cat�logo. <br />
                                                    La p�gina desplegar� una ventana solicitando la informaci�n que se requiere para agregar el nuevo registro. Los campos marcados con (*) son obligatorios.
                                                </li>
                                                <li>Ingresa los datos conforme se solicitan</li>
                                                <li>Presiona el bot�n "Guardar"; esto cerrara la ventana e incorporar� el nuevo registro al cat�logo. </li>
                                            </ol>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div id='ayudaComoEditarUnRegistro'>
                                <table >
                                    <tr>
                                        <td colspan='2'>
                                            <h3>Edita un registro del cat�logo</h3>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <img src='img/como_editar_registros.png' class='helpScreen' />
                                        </td>
                                        <td class='instrucciones'>
                                            <p class='instrucciones'>
                                                Para editar un registro sigue los siguientes pasos:</p>
                                            <ol>
                                                <li>Selecciona del cat�logo el registro que deseas editar.</li>    
                                                <li>Haz clic encima del bot�n <span class='ui-icon ui-icon-pencil' style='display:inline-block'></span>de la barra de herramientas del cat�logo. <br />
                                                    La p�gina desplegar� una ventana con la informaci�n del registro seleccionado para que lo edites. 
                                                </li>
                                                <li>Edita los campos necesarios,  aquellos marcados con (*) son obligatorios.</li>
                                                <li>Presiona el bot�n "Guardar"; esto cerrara la ventana y actualizar� el registro</li>
                                            </ol>                                        
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div id='ayudaComoEliminarUnRegistro'>
                                <table >
                                    <tr>
                                        <td colspan='2'>
                                            <h3>Elimina un registro del cat�logo</h3>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <img src='img/como_eliminar_registros.png' class='helpScreen' />
                                        </td>
                                        <td class='instrucciones'>
                                            <p class='instrucciones'>
                                                Para eliminar un registro sigue los siguientes pasos:</p>
                                            <ol>
                                                <li>Selecciona del cat�logo el registro que deseas eliminar.</li>    
                                                <li>Haz clic encima del bot�n <span class='ui-icon ui-icon-trash' style='display:inline-block'></span>de la barra de herramientas del cat�logo. <br />
                                                    La p�gina solicitar� que confirmes la eliminaci�n. 
                                                </li>
                                                <li>Presiona OK en el dialogo de confirmaci�n para proceder con el borrado</li>
                                            </ol>                                        
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div id='ayudaComoFiltrarRegistros'>
                                <table >
                                    <tr>
                                        <td colspan='2'>
                                            <h3>Filtra los registros del cat�logo</h3>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <img src='img/como_filtrar_registros.png' class='helpScreen' />
                                        </td>
                                        <td class='instrucciones'>
                                            <p class='instrucciones'>
                                                Filtra para encontrar el conjunto de registros que cumplen con tus criterios de filtrado. Para filtrar registros sigue los siguientes pasos:</p>
                                            <ol> 
                                                <li>Haz clic encima del bot�n <span class='ui-icon ui-icon-search' style='display:inline-block'></span>de la barra de herramientas del cat�logo. <br />
                                                    La p�gina desplegar� una ventana para ingresar los criterios de filtrado 
                                                </li>
                                                <li>Ingresa al menos un criterio de filtrado; puedes seleccionar m�s de uno. Mientras m�s criterios utilices m�s reducida ser� el resultado de la b�squeda.</li>
                                                <li>Si deseas guardar el filtro para su posterior uso, asignale un nombre en el campo <a href="javascript:void(0);" class="tooltipLink" id="img/guardar_filtro_como.png">Guardar filtro como</a>:"; recuperalo posteriormente en el men� <a href="javascript:void(0);" class="tooltipLink" id="img/mis_filtros.png">"Mis filtros"</a> que se encuentra a la izquierda del cat�logo. </li>
                                                <li>Presiona el bot�n "Buscar"; esto cerrar� la ventana y mostrar� el resultado en el cat�logo. Para remover el filtro y restaurar los registros haz clic encima de la liga (Quitar filtro) que se encuentra junto al titulo del cat�logo." </li>
                                            </ol>                                        
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div id='ayudaComoAgregarCatalogoAFavoritos'>
                                <table >
                                    <tr>
                                        <td colspan='2'>
                                            <h3>Agrega a tus favoritos los cat�logos que utilizas m�s frecuentemente</h3>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <img src='img/favoritos.png'  class='helpScreen'/>
                                        </td>
                                        <td class='instrucciones'>
                                            <p class='instrucciones'>
                                                Puedes agregar a la pesta�a de inicio los cat�logos que utilizas m�s frecuentemente en "Mis favoritos", para agregar un favorito haz lo siguiente:</p>
                                            <ol>
                                                <li class='instrucciones'>Ve a la pesta�a "Aplicaciones"</li>
                                                <li class='instrucciones'>Haz clic en el bot�n de la aplicaci�n que deseas abrir</li>
                                                <li class='instrucciones'>Haz clic en el bot�n <span class='ui-icon ui-icon-star' style='display:inline-block'></span> de la barra de herramientas del cat�logo que deseas hacer tu favorito</li>
                                            </ol>        
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>       
                </div>
            </div>                
            </div>
            <div id="tabAyuda">
                <div id="divCarouselAyuda">
                    <div id="ayudaIndice">
                        <table>
                            <tr>
                                <td>
                                    <h2 class="instrucciones">Indice de temas de ayuda</h2>
                                </td>
                            </tr>
                            <tr>
                                <td class="instrucciones">
                                    <div style="text-align: center;">
                                        <table style="margin: 0 auto;text-align: left;">
                                            <tr>
                                                <td style="vertical-align:top;  text-align: left; width:450px">
                                                    <p class="instrucciones">
                                                        <ol> 
                                                            <li><a href="#" class="lnkAyuda" id="ayuda-2">Vistazo general al sistema</a></li>
                                                            <li><a href="#" class="lnkAyuda" id="ayuda-3">Inicio</a></li>
                                                            <li><a href="#" class="lnkAyuda" id="ayuda-4">Aplicaciones</a></li>
                                                            <li><a href="#" class="lnkAyuda" id="ayuda-14">Mapa del sitio</a></li>
                                                        </ol>            
                                                    </p> 
                                                </td>
                                                <td>
                                                    <img src='img/portada_ayuda.png' style='border: 1px'  class='helpScreen'></img>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </td>                                    
                            </tr>
                        </table>
                    </div>
                    <div id="ayudaVistazo">
                        <table>
                            <tr>
                                <td>
                                    <h2 class="instrucciones">Vistazo general al sistema</h2>
                                </td>
                            </tr>
                            <tr>
                                <td class="instrucciones">
                                    <p class="instrucciones">
                                        La plataforma cuenta con 5 partes principales: <br />
                                        <ul>
                                            <li>Inicio: en donde se encuentran las pesta�as "Pendientes" y "Favoritos".
                                                <ul>
                                                    <li>En "Pendientes" puedes ver y atender tus actividades</li>
                                                    <li>En "Favoritos" puedes tener los cat�logos que uses con mayor frecuencia a la mano</li>
                                                </ul>
                                            </li>
                                            <li>Aplicaciones: aqu� encontrar�s los m�dulos que conforman la plataforma. Cada aplicaci�n cuenta con un cat�logo principal y del cual se desprenden otros cat�logos relacionados en forma de kardex.</li>
                                            <li>Mapa del sitio: es el listado con las ligas hacia todos las partes de la plataforma.</li>
                                            <li>Ayuda: contiene el �ndice del manual en l�nea.</li>
                                            <li>Contacto: aqu� se presenta la informaci�n para contactar al administrador de la plataforma.</li>
                                        </ul>
                                    </p>
                                    <p class="instrucciones">
                                        Por otra parte, los cat�logos se presentan en una cuadr�cula y dependiendo de los permisos de tu perfil se mostrar�n botones para insertar <span class='ui-icon ui-icon-plus' style='display:inline-block'></span> , editar <span class='ui-icon ui-icon-pencil' style='display:inline-block'></span>, eliminar<span class='ui-icon ui-icon-trash' style='display:inline-block'></span>, hacer b�squedas de registros<span class='ui-icon ui-icon-search' style='display:inline-block'></span>, asi como abrir el kardex<span class='ui-icon ui-icon-newwin' style='display:inline-block'></span> con los cat�logos relacionados al registro seleccionado.
                                    </p>
                                </td>                                    
                            </tr>
                        </table>
                    </div>
                    <div id="ayudaInicio">
                        <table>
                            <tr>
                                <td>
                                    <h2 class="instrucciones">Inicio</h2>
                                </td>
                            </tr>
                            <tr>
                                <td class="instrucciones">
                                    <p class="instrucciones">
                                        Dentro de la pesta�a "Inicio"  hay otras dos pesta�as: "Pendientes" y "Favoritos". <br />
                                        En "Pendientes" puedes ver las actividades por realizar as� como la liga para ingresar los datos propios del pendiente; cada perfil tiene sus propios pendientes, y son configurados por el administrador del sistema. <br /><br/>
                                        En "Favoritos" podr�s acceder a cat�logos que marcaste como favoritos, evitando navegar en las aplicaciones.
                                    </p>
                                    <p class="instrucciones">
                                        <strong>Temas relacionados</strong>
                                        <ul>
                                            <li><a href="#" class="lnkAyuda" id="ayuda-4">Agrega a tus favoritos los cat�logos que m�s utilizas </a></li>
                                            <li><a href="#" class="lnkAyuda" id="ayuda-5">Elimina los favoritos que ya no utilizas</a></li>
                                        </ul>
                                    </p> 
                                </td>                                    
                            </tr>
                        </table>
                    </div>
                </div>
            </div>             
        </div>
        <input type="hidden" name="_ce_" id="_ce_" value="<%=usuario.getClave()%>" />
        <input type="hidden" name="_cp_" id="_cp_" value="<%=usuario.getClavePerfil()%>" />
        <input type="hidden" name="_cp_" id="_ca_" value="<%=usuario.getClaveArea()%>" />
        <input type="hidden" name="_gq_" id="_gq_" value="" />
        <input type="hidden" name="_gado_" id="_gado_" value="true" />
        <div id="divwait" title="Espere un momento, por favor"><br /><p style="text-align: center"><img src='img/throbber.gif' /><br /><br />&nbsp;Cargando preferencias del usuario</p></div>
    </body>
</html>