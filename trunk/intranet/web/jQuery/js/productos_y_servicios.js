var clave_producto;
var clave_producto_recurso;
var clave_tipo_recurso;

function prdts_producto_init() {
    clave_producto =$(xml).find("clave_producto")[0].childNodes[0].data;
    
    if (clave_producto == "") {
        clave_producto = "0";
    }
}

function prdts_producto_recurso_init() {
    clave_producto_recurso = $(xml).find("clave_producto_recurso")[0].childNodes[0].data;
    clave_tipo_recurso = $(xml).find("clave_tipo_recurso")[0].childNodes[0].data;

    if (clave_producto_recurso == "") {
        clave_producto_recurso = "0";
    }

    if (clave_tipo_recurso != "") {
        if (clave_tipo_recurso == "1") { //Si se trata de recursos humanos...
            setXMLInSelect3("clave_recurso", 354, "foreign", "", "clave_tipo_recurso=" + clave_tipo_recurso);
            $("#td_horas_desarrollo").parent().show();
            $("#td_horas_desarrollo").html("Horas de desarrollo");
            $("#td_fecha_inicial").parent().show();
            $("#td_fecha_final").parent().show();            
        } else if (clave_tipo_recurso == "2") { //Si se trata de recursos materiales...
            setXMLInSelect3("clave_recurso", 354, "foreign", "", "clave_tipo_recurso=" + clave_tipo_recurso);
            $("#td_horas_desarrollo").parent().hide();
            $("#td_fecha_inicial").parent().hide();
            $("#td_fecha_final").parent().hide();            
        } else if (clave_tipo_recurso == "3") { //Si se trata de servicios externos...
            setXMLInSelect3("clave_recurso", 354, "foreign", "", "clave_tipo_recurso=" + clave_tipo_recurso);
            $("#td_horas_desarrollo").parent().hide();
            $("#td_fecha_inicial").parent().hide();
            $("#td_fecha_final").parent().hide();            
        } else if (clave_tipo_recurso == "5") { //Si se trata de viáticos...
            setXMLInSelect3("clave_recurso", 354, "foreign", "", "clave_tipo_recurso=" + clave_tipo_recurso);
            $("#td_horas_desarrollo").parent().hide();
            $("#td_fecha_inicial").parent().show();
            $("#td_fecha_final").parent().show();            
        } else if (clave_tipo_recurso == 5) {
            /*Llena el select de recursos con los viáticos del cátalogo */
            setXMLInSelect3("clave_recurso", 354, "foreign", null, "clave_tipo_recurso=" + claveTipoRecurso);
            $("#td_horas_desarrollo").html("Días");
            $("#td_horas_desarrollo").parent().show();
            $("#td_fecha_inicial").parent().hide();
            $("#td_fecha_final").parent().hide();
        } else if (clave_tipo_recurso == 6) {
            /*Llena el select de recursos con los viáticos del cátalogo */
            setXMLInSelect3("clave_recurso", 354, "foreign", null, "clave_tipo_recurso=" + claveTipoRecurso);
            $("#td_horas_desarrollo").parent().show();
            $("#td_horas_desarrollo").html("Horas de desarrollo");
            $("#td_fecha_inicial").parent().show();
            $("#td_fecha_final").parent().show();
        }
    }

    $("#form_38_404_" + clave_producto_recurso + " #clave_tipo_recurso").change(function() {
        if (this.value == "1") { //Si se trata de recursos humanos...
            setXMLInSelect3("clave_recurso", 354, "foreign", "", "clave_tipo_recurso=" + $(this).val());
            $("#td_horas_desarrollo").parent().show();
            $("#td_fecha_inicial").parent().show();
            $("#td_fecha_final").parent().show();            
        } else if (this.value == "2") { //Si se trata de recursos materiales...
            setXMLInSelect3("clave_recurso", 354, "foreign", "", "clave_tipo_recurso=" + $(this).val());
            $("#td_horas_desarrollo").parent().hide();
            $("#td_fecha_inicial").parent().hide();
            $("#td_fecha_final").parent().hide();        
        } else if (this.value == "3") { //Si se trata de servicios externos...
            setXMLInSelect3("clave_recurso", 354, "foreign", "", "clave_tipo_recurso=" + $(this).val());
            $("#td_horas_desarrollo").parent().hide();
            $("#td_fecha_inicial").parent().hide();
            $("#td_fecha_final").parent().hide();            
        } else if (this.value == "4") { //Si se trata de servicios externos...
           setXMLInSelect3("clave_recurso", 354, "foreign", null, "clave_tipo_recurso=" + $(this).val());
            $("#td_horas_desarrollo").parent().hide();
            $("#td_fecha_inicial").parent().show();
            $("#td_fecha_final").parent().show();       
        } else if (this.value == "5") { //Si se trata de viáticos...
            setXMLInSelect3("clave_recurso", 354, "foreign", "", "clave_tipo_recurso=" + $(this).val());
            $("#td_horas_desarrollo").parent().show();
            $("#td_fecha_inicial").parent().hide();
            $("#td_fecha_final").parent().hide();            
        } else if (this.value == "6") { //Si se trata de viáticos...
            setXMLInSelect3("clave_recurso", 354, "foreign", "", "clave_tipo_recurso=" + $(this).val());
            $("#td_horas_desarrollo").parent().show();
            $("#td_fecha_inicial").parent().show();
            $("#td_fecha_final").parent().show();        
        }
    });

    $("#form_38_404_" + clave_producto_recurso + " #clave_recurso").change(function() {
        if ($(this).val() != "") {
            $.ajax(
                    {
                        url: "control?$cmd=plain&$cf=354&$pk=" + $(this).val() + "&$ta=select&$w=clave_recurso=" + $(this).val(),
                        dataType: ($.browser.msie) ? "text" : "xml",
                        success: function(data) {
                            if (typeof data == "string") {
                                xmlProductoRecurso = new ActiveXObject("Microsoft.XMLDOM");
                                xmlProductoRecurso.async = false;
                                xmlProductoRecurso.validateOnParse = "true";
                                xmlProductoRecurso.loadXML(data);
                                if (xmlProductoRecurso.parseError.errorCode > 0) {
                                    alert("Error de compilación xml:" + xmlProductoRecurso.parseError.errorCode + "\nParse reason:" + xmlProductoRecurso.parseError.reason + "\nLinea:" + xmlProductoRecurso.parseError.line);
                                }
                            }
                            else {
                                xmlProductoRecurso = data;
                            }

                            $("#form_38_404_" + clave_producto_recurso + " #costo_unitario").val(formatCurrency($(xmlProductoRecurso).find("importe").text()));
                            $("#form_38_404_" + clave_producto_recurso + " #clave_impuesto option[value=" + $(xmlProductoRecurso).find("clave_impuesto").text() + "]").attr("selected", "selected");
                            $("#form_38_404_" + clave_producto_recurso + " #costo_total").val(formatCurrency($(xmlProductoRecurso).find("importe").text()));
                            $("#form_38_404_" + clave_producto_recurso + " #clave_moneda option[value=" + $(xmlProductoRecurso).find("clave_moneda").text() + "]").attr("selected", "selected");
                            $("#form_38_404_" + clave_producto_recurso + " #tipo_cambio").val(formatCurrency($(xmlProductoRecurso).find("tipo_cambio").text()));

                            /*xmlCategoriaInsumo.                
                             5. Si se trata de una categoria sin subcategorias deben de recuperarse los componentes asociados al insumo
                             y crear los controles para su captura*/

                        },
                        error: function(xhr, err) {
                            alert("Error al recuperar recurso. " + xhr.readyState + "\nstatus: " + xhr.status + "\responseText:" + xhr.responseText);
                        }
                    });
        }

    });

    $("#costo_unitario,#cantidad,#clave_impuestos,#horas_desarrollo").change(function() {
        /*Quita formato a numeros para efectuar operaciones */
        var IVA = parseFloat($("#clave_impuestos option:selected").html().split("-")[1]) / 100;
        $("#costo_unitario").val($("#costo_unitario").val().replace(/,/g, "").replace(/\$/g, ""));
        nuevo_importe = Math.round(parseFloat($("#costo_unitario").val()) * $("#cantidad").val() * (1 + IVA) * 100) / 100;
        costoTotal = parseFloat($("#costo_unitario").val()) * parseFloat($("#cantidad").val()) * parseFloat($("#horas_desarrollo").val() * (1 + IVA));
        
        $("#costo_total").val(formatCurrency(costoTotal));
        $("#costo_unitario").val(formatCurrency$("#costo_unitario").val());
    });
    
    $("#horas_desarrollo").val($("#horas_desarrollo").val().replace(/,/g,"").replace(/\$/g,"")).unbind("focus").unbind("blur").removeClass("money");
}


function prdts_producto_recurso_ongridComplete() {
    $.ajax(
            {
                url: "control?$cmd=plain&$cf=404&$pk=0&$ta=report&$w=clave_producto=" + clave_producto,
                dataType: ($.browser.msie) ? "text" : "xml",
                success: function(data) {
                    if (typeof data == "string") {
                        xmlProductoRecurso = new ActiveXObject("Microsoft.XMLDOM");
                        xmlProductoRecurso.async = false;
                        xmlProductoRecurso.validateOnParse = "true";
                        xmlProductoRecurso.loadXML(data);
                        if (xmlProductoRecurso.parseError.errorCode > 0) {
                            alert("Error de compilación xml:" + xmlProductoRecurso.parseError.errorCode + "\nParse reason:" + xmlProductoRecurso.parseError.reason + "\nLinea:" + xmlProductoRecurso.parseError.line);
                        }
                    }
                    else {
                        xmlProductoRecurso = data;
                    }

                    $("#form_38_351_" + clave_producto + " #importe").val(formatCurrency($(xmlProductoRecurso).find("costo_total").text()));
                    /*xmlCategoriaInsumo.                
                     5. Si se trata de una categoria sin subcategorias deben de recuperarse los componentes asociados al insumo
                     y crear los controles para su captura*/

                },
                error: function(xhr, err) {
                    alert("Error al recuperar recurso. " + xhr.readyState + "\nstatus: " + xhr.status + "\responseText:" + xhr.responseText);
                }
            });
}