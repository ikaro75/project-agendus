/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
 tinyMCE.init({
	mode : "none",
	theme : "modern",
	editor_selector : "wysiwyg"
});

$(document).ready(function() {

    //Despliega dialogo modal para evitar acciones del usuario mientras se cargan primeros grids
    //puesto que causa conflictos
    $("#_status_").val("Inicializando");
    $("#divwait").dialog({
            height: 140,
            modal: true,
            autoOpen: true,
            closeOnEscape:false
    });
        
    /*$('#switcher').themeswitcher({
    			imgpath: "images/"
    		}); */
    $("#tabs").tabs().bind('tabsselect', function(e, ui) {
            if (ui.index == 1)
               $('#agenda').fullCalendar('rerenderEvents');
    });
   
    //Crea menú de aplicaciones de acuerdo al perfil
    $(".appmenu").appmenu();
    $("#sessionMenu").sessionmenu();  
    
}); //close $(