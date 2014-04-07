var horas = 0;
var minutos = 0;
var segundos = 0;
var dn = "a.m.";
                        
$(document).ready(function() { 
    
    getServerTime();
    
    setInterval( function() {
        segundos++;
        
        if (segundos == 60) {
            segundos = 0;
            minutos++;
            if (minutos == 60) {
                minutos = 0;
                horas++;
                if (horas == 24) {
                    horas = 0;
                }
            }
        }
        $("#hrs").html(( horas < 10 ? "0" : "" ) + horas);
        $("#min").html(( minutos < 10 ? "0" : "" ) + minutos);
        $("#seg").html(( segundos < 10 ? "0" : "" ) + segundos);
        $("#segundostranscurridos").val(parseInt($("#segundostranscurridos").val())+1);
        
        $("#id").focus();
    },1000);
    
    $(document).click(function () {
        if (screenfull.enabled) {
           screenfull.request();
        }
    });
    
    function md(e) { 
        try { 
            if (event.button==2||event.button==3) return false; 
        } catch (e) { 
            if (e.which == 3) return false; 
        } 
    }
    document.oncontextmenu = function() { return false; }
    document.ondragstart = function() { return false; }
    document.onmousedown = md;
    
    //Para no perder la sesión cada 10 minutos se va a sincroniczar el reloj 
    setInterval("getServerTime()", 1000*60*2);
}); 

function getServerTime() {
    $.ajax(
            {
                url: "timeclock_ws.jsp",
                dataType: ($.browser.msie) ? "text" : "xml",
                success: function(data) {
                    if (typeof data == "string") {
                        xmlResult = new ActiveXObject("Microsoft.XMLDOM");
                        xmlResult.async = false;
                        xmlResult.validateOnParse = "true";
                        xmlResult.loadXML(data);
                        if (xmlResult.parseError.errorCode > 0) {
                            alert("Error de compilación xml:" + xmlResult.parseError.errorCode + "\nParse reason:" + xmlResult.parseError.reason + "\nLinea:" + xmlResult.parseError.line);
                        }
                    }
                    else {
                        xmlResult = data;
                    }

                    if ($(xmlResult).find("error").length > 0) {
                        $("#mensaje").html($(xmlResult).find("error").text());
                    } else {
                        $("#fechaActual").val($(xmlResult).find("fecha").text())
                        restableceLector();
                                   
                        // Crear dos variables con los nombres de los meses y los nombres de los dias de la semana
                        var nombreMes = [ "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre" ]; 
                        var nombreDia= ["Domingo","Lunes","Martes","Miércoles","Jueves","Viernes","Sábado"]

                        // Creamos el objeto fechaActual deDate 
                        var anio = parseInt($('#fechaActual').val().split(",")[0]);
                        var mes = parseInt($('#fechaActual').val().split(",")[1])-1;
                        var dia = parseInt($('#fechaActual').val().split(",")[2]);
                        var hr = parseInt($('#fechaActual').val().split(",")[3]);
                        var min = parseInt($('#fechaActual').val().split(",")[4]);
                        var seg = parseInt($('#fechaActual').val().split(",")[5]);

                        var fechaActual = new Date(anio,mes,dia,hr,min,seg);

                        // Mostramos la fecha en la jsp   
                        $('#Date').html(nombreDia[fechaActual.getDay()] + ", " + fechaActual.getDate() + ' de ' + nombreMes[fechaActual.getMonth()] + ' del ' + fechaActual.getFullYear());

                        horas = fechaActual.getHours();
                        minutos = fechaActual.getMinutes();
                        segundos = fechaActual.getSeconds();
                        dn = "a.m.";                        
                    }
                },
                error: function(xhr, err) {
                }
            });
}

function getEmpleado (claveEmpleado) {
 $.ajax(
            {
                url: "timeclock_ws.jsp?id="+claveEmpleado,
                dataType: ($.browser.msie) ? "text" : "xml",
                success: function(data) {
                    if (typeof data == "string") {
                        xmlResult = new ActiveXObject("Microsoft.XMLDOM");
                        xmlResult.async = false;
                        xmlResult.validateOnParse = "true";
                        xmlResult.loadXML(data);
                        if (xmlResult.parseError.errorCode > 0) {
                            alert("Error de compilación xml:" + xmlResult.parseError.errorCode + "\nParse reason:" + xmlResult.parseError.reason + "\nLinea:" + xmlResult.parseError.line);
                        }
                    }
                    else {
                        xmlResult = data;
                    }

                    if ($(xmlResult).find("error").length > 0) {
                        $("#mensaje").html($(xmlResult).find("error").text());
                    } else {
                        $("#fechaActual").val($(xmlResult).find("fecha").text())
                        $("#mensaje").html($(xmlResult).find("mensaje").text())
                    }
                    
                    //En 5 segundos se reestablece el mensaje
                    setTimeout("restableceLector()",5000);                    
                },
                error: function(xhr, err) {
                }
            });    
}

function restableceLector(){ 
    $("#mensaje").html('<br>Por favor, pase el código por el dispositivo lector<input type="text" id="id" name="id" class="lineablanca" style="border: none; background: transparent; display: block; margin: auto auto"/><input type="hidden" id="segundostranscurridos" value="0"/>');
    $("#id").unbind("click").keypress(function( event ) {
        if ( event.which == 13 ) {
           event.preventDefault();
           getEmpleado ($(this).val())
        }
    }); 
}