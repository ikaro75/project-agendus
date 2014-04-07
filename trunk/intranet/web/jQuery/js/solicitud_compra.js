function solicitud_compra_init() {
    
}

function solicitud_compra_detalle_init() {
    /*clave_producto_proyecto=$(xml).find("registro").find("clave_producto_proyecto")[0].childNodes[0].data;
    clave_producto_insumo=$(xml).find("registro").find("clave_producto_insumo")[0].childNodes[0].data;
    
    if (clave_producto_proyecto!="") {
        setXMLInSelect3("clave_producto_insumo",404,"foreign","","clave_tipo_insumo=2 AND clave_producto_proyecto="+clave_producto_proyecto);
        $("#clave_producto_insumo option[value="+clave_producto_insumo +"]").attr("selected", true);
    }
    
    $("#clave_producto_proyecto").change(function() {
        //Llena clave insumo
        setXMLInSelect3("clave_producto_insumo",404,"foreign","","clave_tipo_insumo=2 AND clave_producto_proyecto="+$(this).val())
    });

    $("#clave_producto_insumo").change(function() {
        //Copia el puesto en el campo correspondiente
        $("#puesto").val($('#clave_producto_insumo option:selected').html());
    });*/
    var clave_orden = $(xml).find("registro").find("clave_orden")[0].childNodes[0].data;
    
    if (clave_orden=="") {
        clave_orden="0";
    }
    
    $("#clave_area_tecnica").change( function() { 
        if ($("#clave_area_tecnica").val()==""){
            $("#clave_estatus option[value=13]").val(1);
            $("#clave_estatus option[value=14]").val(1);
        }

        if ($("#clave_area_tecnica").val()==1){
            $("#clave_estatus option[value=1]").val(13);
            $("#clave_estatus option[value=14]").val(13);
        }
        else if ($("#clave_area_tecnica").val()==2){
            $("#clave_estatus option[value=1]").val(14);
            $("#clave_estatus option[value=13]").val(14);
        }
     });
     
     $("#clave_producto_recurso").change(function() {
         if ($(this).val()!="") {
                $.ajax(
                {   
                    url: "control?$cmd=plain&$cf=404&$pk="+ $(this).val()+"&$ta=select&$w=clave_producto_recurso="+$(this).val(),
                    dataType: ($.browser.msie) ? "text" : "xml",
                    success:  function(data){
                        if (typeof data == "string") {
                            xmlProductoRecurso = new ActiveXObject("Microsoft.XMLDOM");
                            xmlProductoRecurso.async = false;
                            xmlProductoRecurso.validateOnParse="true";
                            xmlProductoRecurso.loadXML(data);
                            if (xmlProductoRecurso.parseError.errorCode>0) {
                                alert("Error de compilación xml:" + xmlProductoRecurso.parseError.errorCode +"\nParse reason:" + xmlProductoRecurso.parseError.reason + "\nLinea:" + xmlProductoRecurso.parseError.line);
                            }
                        }
                        else {
                            xmlProductoRecurso = data;
                        }
                        
                        $("#form_36_452_"+clave_orden+" #descripcion").val($(xmlProductoRecurso).find("clave_insumo").text());
                        $("#form_36_452_"+clave_orden+" #cantidad").val($(xmlProductoRecurso).find("cantidad").text());
                        $("#form_36_452_"+clave_orden+" #clave_unidad option[value=" + $(xmlProductoRecurso).find("clave_unidad").text()+"]").attr("selected", "selected");
                        $("#form_36_452_"+clave_orden+" #clave_impuesto option[value="+ $(xmlProductoRecurso).find("codigo_impuesto").text() +"]").attr("selected", "selected");
                        $("#form_36_452_"+clave_orden+" #clave_moneda option[value="+ $(xmlProductoRecurso).find("clave_monedas").text() +"]").attr("selected", "selected");
                        $("#form_36_452_"+clave_orden+" #precio_unitario").val(formatCurrency($(xmlProductoRecurso).find("costo_unitario").text()));
                        $("#form_36_452_"+clave_orden+" #tipo_cambio").val(formatCurrency($(xmlProductoRecurso).find("tipo_cambio").text()));
                        $("#form_36_452_"+clave_orden+" #total").val(formatCurrency($(xmlProductoRecurso).find("costo_total").text()));
                        
                        /*xmlCategoriaInsumo.                
                        5. Si se trata de una categoria sin subcategorias deben de recuperarse los componentes asociados al insumo
                        y crear los controles para su captura*/

                    },
                    error:function(xhr,err){
                        alert("Error al recuperar recurso. "+xhr.readyState+"\nstatus: "+xhr.status + "\responseText:"+ xhr.responseText);          
                    }
                });        
        }
     });
}