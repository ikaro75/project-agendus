/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function mis_pendientes_init() {
    //Se debe de permitir agendar a otro usuario
    
    nActividad = $(xml).find("registro").find("clave_actividad")[0].firstChild.data;
    if (nActividad=="")
        nActividad="0";
    
    if ($("#btnGuardar_1_101_" + nActividad).parent().html().indexOf("<!-- InicioOpciones -->")>-1) {
        $("#btnGuardar_1_101_" + nActividad).parent().html($("#btnGuardar_1_101_" + nActividad).parent().html().replace("<!-- InicioOpciones -->","<input type='button' value='Asignar actividad a contacto' id='btnAgendaAOtroUsuario' />"));
    } else {
        $("#btnGuardar_1_101_" + nActividad).parent().html($("#btnGuardar_1_101_" + nActividad).parent().html().replace('<input class="formButton" id="opciones_1_101_' + nActividad + '" value="Opciones" type="button"><input class="formButton" id="btnMenuOpciones_1_101_' + nActividad + '" value="" type="button">',"<input type='button' value='Asignar actividad a contacto' id='btnAgendaAOtroUsuario' />"));
        $("#btnGuardar_1_101_" + nActividad).parent().html($("#btnGuardar_1_101_" + nActividad).parent().html().replace('<ul><!-- GuardarYReiniciar --><!-- Duplicar --><!-- GuardarComoPlantilla --><!-- AplicarPlantilla --><!-- InsertarComentario --><li><a id="btnEliminar_1_101_'+ nActividad +'">Eliminar</a></li></ul>',''));
    }
    
    $("#td_clave_empleado_asignado").parent().hide();
    $($("#clave_empleado_asignado option")[0]).val($("#_ce_").val());
    
    $("#btnAgendaAOtroUsuario").button().click(function() {
        if ($(this).val()=="Asignar actividad a contacto") {
            $($("#clave_empleado_asignado option")[0]).val("");
            $("#td_clave_empleado_asignado").parent().show();
            $(this).val("Quitar asignación a contacto"); }
        else {
            $($("#clave_empleado_asignado option")[0]).val($("#_ce_").val()).attr("selected",true);
            $("#td_clave_empleado_asignado").parent().hide();
            $(this).val('Asignar actividad a contacto');
        }    
        
    });
}

function mis_pendientes_ongridcomplete() {
    // Quita eventos anteriores 
    $(".gridlink").unbind("click");
    
    /*var source = {
                  url: 'events.jsp',
                  type: 'GET'
            }*/
            
    /*$('#agenda').fullCalendar('rerenderEvents');        
    $('#agenda').fullCalendar('refetchEvents');*/

    /*$('#agenda').fullCalendar('removeEvents');
    $('#agenda').fullCalendar('addEventSource', source );
    $('#agenda').fullCalendar('rerenderEvents');
    calEvent = source;*/
    
                
    /*$(".fc-event-inner").unbind("click");
    $(".fc-event-inner").click(function() { 
       
                              
        $("body").form({
                app: nApp,
                forma:nEntidad,
                datestamp:$(this).attr("datestamp"),
                modo:"update",
                titulo: $.fn.appgrid.options.leyendas[1],
                columnas:1,
                pk:nPK,
                filtroForaneo:"2=clave_aplicacion=" + nEditingApp + "&3="+$(this).attr("wsParameters"),
                height:"500",
                width:"80%",
                originatingObject: $(this).id,
                showRelationships:$(this).attr("callFormWithRelationships"),
                updateControl:sUpdateControl
            });
        });*/

}

function compartir_actividades_init() {
    //Se sustituye el campo clave_tipo_entidad de tipo text por un checkbox
    nActividadContacto= $(xml).find("registro").find("clave_actividad_contacto")[0].firstChild.data;
    nContacto = $(xml).find("registro").find("clave_contacto")[0].firstChild.data;
    
    if (nActividadContacto=="") {
        $("#clave_tipo_entidad").parent().html("<input type='checkbox' id='clave_tipo_entidad' value='1' style='float: left;' />");
        $("#td_clave_grupo").parent().hide();
        $("#clave_grupo").removeClass("obligatorio");  
    } else {
        if (nContacto=="") {
            $("#clave_tipo_entidad").parent().html("<input type='checkbox' id='clave_tipo_entidad' value='1' style='float: left;' checked='checked' />");
            $("#td_clave_contacto").parent().hide();
            $("#clave_contacto").removeClass("obligatorio");
        }
    }
    
    $("#clave_tipo_entidad").click(function() { 
        if ($(this).attr("checked")) {
            $("#td_clave_contacto").parent().hide();
            $("#td_clave_grupo").parent().show();
            $("#clave_contacto").removeClass("obligatorio");
            $("#clave_grupo").addClass("obligatorio");
            $("#clave_contacto option:selected").removeAttr("selected");
            $("#clave_contacto").next().find("input").val("");
        } else {
            $("#td_clave_contacto").parent().show();
            $("#td_clave_grupo").parent().hide();
            $("#clave_contacto").addClass("obligatorio");
            $("#clave_grupo").removeClass("obligatorio");
            $("#clave_grupo option:selected").removeAttr("selected");
        }
    });
    
}