/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function be_forma_init() {
    clave_forma = $(xml).find("registro").find("clave_forma")[0].firstChild.data;
    
    if (clave_forma=="") {
        clave_forma="0";
    }
    
    if ($("#form_1_3_" + clave_forma + " #tabla").val() != "") {
        setXMLInSelect3("form_1_3_" + clave_forma + " #llave_primaria", -2, "update", $("#tabla").val());
        llave = $(xml).find("registro").find("llave_primaria")[0].childNodes[0].data;
        $("#form_1_3_" + clave_forma + " #llave_primaria option[value=" + llave + "]").attr("selected", true);
    } 
    
    $("#form_1_3_" + clave_forma + " #tabla").change(function() {
        if ($("#form_1_3_" + clave_forma + " #tabla").val() != "")
            setXMLInSelect3("form_1_3_" + clave_forma + " #llave_primaria", -2, "update", $(this).val());
     });
        
    if (!$('#muestra_formas_foraneas').is(':checked')) {
        $("#td_clave_tipo_presentacion_forma_foranea a").hide();
        $("#clave_tipo_presentacion_forma_foranea").hide();
    }

    $('#muestra_formas_foraneas').click(function() {
        if ($(this).is(':checked')) {
            $("#td_clave_tipo_presentacion_forma_foranea a").show();
            $("#clave_tipo_presentacion_forma_foranea").show();
        } else {
            $("#td_clave_tipo_presentacion_forma_foranea a").hide();
            $("#clave_tipo_presentacion_forma_foranea").hide();
        }
    });
}

function be_aplicacion_grid_init() {

    $("a.export_link").click(function() {
        aplicacion = (this).id.split("-")[0];
        $("#_cache_").val(aplicacion);
        $("body").form({
            app: aplicacion,
            forma: 292,
            modo: "insert",
            pk: 0,
            width: "600"
        });
    });
}

function importa_init() {
    $("#clave_aplicacion").val($("#_cache_").val());
    $("#_cache_").val("");
    aplicacion = $("#clave_aplicacion").val();

    $("#btnGuardar_" + aplicacion + "_292_0").parent().html("<input type='button' style='float: right;' class='formButton' id='btnImporta' value='Importar'>");
    $("#btnImporta").button().click(function() {
        //  mandar a llamar con la función de jquery ajax el jsp

        $.ajax(
                {
                    url: "control?$cmd=import&$app=" + $("#clave_aplicacion").val() + "&$prefijo_tablas=" + escape($("#tabla").val()),
                    dataType: ($.browser.msie) ? "text" : "xml",
                    success: function(data) {
                        if (typeof data == "string") {
                            xmlResultImport = new ActiveXObject("Microsoft.XMLDOM");
                            xmlResultImport.async = false;
                            xmlResultImport.validateOnParse = "true";
                            xmlResultImport.loadXML(data);
                            if (xmlResultImport.parseError.errorCode > 0) {
                                alert("Error de compilación xml:" + xmlResultImport.parseError.errorCode + "\nParse reason:" + xmlResultImport.parseError.reason + "\nLinea:" + xmlResultImport.parseError.line);
                            }
                        }
                        else {
                            xmlResultImport = data;
                        }

                        if ($(xmlResultImport).find("error").length > 0) {
                            alert($(xmlResultImport).find("error").text());
                            $("#tdEstatus_28_292_0").html($(xmlResultImport).find("error").text());
                        } else {
                            alert($(xmlResultImport).find("resumen").text());
                            $("#dlgModal_28_292_0").remove();
                        }
                    },
                    error: function(xhr, err) {
                    }
                });
    });
}