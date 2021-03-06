/* 
 * Plugin de jQuery para cargar forma a través de un plugin
 * 
 */
( function($) {
    $.fn.reportParameter = function(opc){

        $.fn.reportParameter.settings = {
            titulo:"",
            app:"",
            forma:"",
            xmlUrl : "control?$cmd=parameter" , // "srvControl" "xml_tests/forma.app.xml",
            reporte: "",
            filtroForaneo: "",
            top: 122,
            height:700,
            width:650,
            events:[],
            error:""
        };

        // Devuelvo la lista de objetos jQuery
        return this.each( function(){
            $.fn.reportParameter.options = $.extend($.fn.reportParameter.settings, opc);
            obj = $(this);
            $.fn.reportParameter.getGUI(obj);          
        });
 
    };
   
    
    $.fn.reportParameter.getGUI = function(obj){
        //Crea clave unica para forma
        var formSuffix =$.fn.reportParameter.options.app + "_" + $.fn.reportParameter.options.forma;
        var sDialogo="";
        var sMainDivTabs="";
        var sDivTabs="";
        var sUlTabs="";
        var sBotonera="";
        //1. Primero crear el HTML necesario para contruir la interfaz de las relaciones
       
        sMainDivTabs="<div id='formTab_" + formSuffix +"' " + 
        "' app='" + $.fn.reportParameter.options.app +
        "' forma='" + $.fn.reportParameter.options.forma +
        "' >";

        sButtonCaption='Ejecutar reporte';

        sUlTabs+="<ul><li><a href='#divFormGeneral_" + formSuffix +"'>Inserte los parámetros solicitados</a></li></ul>";
        sDivTabs+="<div id='divFormGeneral_" + formSuffix +"' >" +
        "<div align='center'><br /><br />Cargando informaci&oacute;n... <br /> <br />"+
        "<img src='img/loading.gif' />"+
        "</div>"+
        "</div>";
    
        sBotonera+="<div align='right' style='clear:left'><table style='width:100%'><tr><td align='left' id='tdEstatus_" +formSuffix+"' class='estatus_bar'>&nbsp;</td><td align='right'>" +
        "<div><input type='button' style='float: right;' class='formButton' id='btnGuardar_" + formSuffix +"' value='" + sButtonCaption + "' /></div></td></tr></table></div>";
                    
        sMainDivTabs+=sUlTabs+sDivTabs+sBotonera+"</div>";
        sDialogo+="<div id='dlgModal_"+ formSuffix + "' title='" + $.fn.reportParameter.options.titulo +"'>" + sMainDivTabs + "</div>";
        obj.append(sDialogo);
        $.fn.reportParameter.setFormObjects();
        
    };
    
    $.fn.reportParameter.setFormObjects = function(){  
   
        var formSuffix =$.fn.reportParameter.options.app + "_" + $.fn.reportParameter.options.forma + "_" + $.fn.reportParameter.options.pk;
        var gridSuffix =$.fn.reportParameter.options.app + "_" + $.fn.reportParameter.options.forma + "_0";// + $.fn.reportParameter.options.datestamp;
            
        $.ajax(
        {   
            url: $.fn.reportParameter.options.xmlUrl + "&$cf=266&$pk=0&$ta=select&$w=clave_reporte=" + $.fn.reportParameter.options.reporte,
            dataType: ($.browser.msie) ? "text" : "xml",
            success:  function(data){
                if (typeof data == "string") {
                    xml = new ActiveXObject("Microsoft.XMLDOM");
                    xml.async = false;
                    xml.validateOnParse="true";
                    xml.loadXML(data);
                    if (xml.parseError.errorCode>0) {
                        alert("Error de compilación xml:" + xml.parseError.errorCode +"\nParse reason:" + xml.parseError.reason + "\nLinea:" + xml.parseError.line);
                    }
                }
                else {
                    xml = data;
                }
            
                /*Verifica el estatus de error*/
                var oError=$(xml).find("error");
                if (oError.length>0) {
                    var sDescripcionError=oError.text();
                    $("#grid_"+gridSuffix+"_toppager_right").children(0).html(sDescripcionError);
                    $("#dlgModal_"+ formSuffix).remove();
                    if (sDescripcionError.indexOf("No hay consulta definida para la forma", 0)>-1 && $("#_cp_").val()=="1") {
                        if (confirm("No hay una consulta establecida para dicha función, ¿desea configurarla?"))
                            $("body").formqueue({
                                app: 1,
                                forma:8,
                                datestamp:$.fn.reportParameter.options.datestamp,
                                modo:"insert",
                                columnas:1,
                                pk:0,
                                filtroForaneo:"2=clave_aplicacion=1&3=clave_forma="+$.fn.reportParameter.options.forma+"&4=clave_perfil=1&5=clave_forma="+$.fn.reportParameter.options.forma+"&6=tipo_accion='lookup'",
                                height:"500",
                                width:"500",
                                originatingObject:"",
                                showRelationships:false                        
                            }); 
                    }
                    else
                        alert(sDescripcionError);
                    
                    $("#divwait").dialog( "close" );                 
                    return false;
                }
                
                formSuffix =$.fn.reportParameter.options.app + "_" + $.fn.reportParameter.options.forma;
                
                //Se genera el HTML de la forma general 
                $("#divFormGeneral_" + formSuffix).html($.fn.reportParameter.handleForm(xml));
                
                //Aplica el codigo proveniente del XML y que aplica en la forma
                evento=$(xml).find('configuracion_forma').find('evento').text();
                if (evento!="")
                    $.globalEval(evento);
              
                //Ahora carga los eventos relacionados con los campos
                for (i=1; i<$.fn.reportParameter.options.events.length; i++) {
                    if ($.fn.reportParameter.options.events[i]!=undefined && $.fn.reportParameter.options.events[i]!="" )
                        $.globalEval($.fn.reportParameter.options.events[i]);
                }
                
                var oForm=$("#form_" + formSuffix);
                
                //Activa los tooltips para ayuda 
                $(".tooltipField").tooltip({
                    bodyHandler: function() {
                        return $(this).attr("ayuda");
                    },
                    showURL: false,
                    extraClass: "pretty", 
                    fixPNG: true
                });
                
                //Se asigan evento al botón agregar comentario
                
                //Se asigna evento al botón de guardar
                $("#btnGuardar_"+ formSuffix).button().click(function() {
                    nApp=this.id.split("_")[1];
                    nForma=this.id.split("_")[2];

                    formSuffix =this.id.split("_")[1] + "_" + this.id.split("_")[2];

                    $("#btnGuardar_"+formSuffix).disabled=true;
                    //Actualiza el estatus bar
                    $("#tdEstatus_" +formSuffix).html("<img src='img/throbber.gif'>&nbsp;Validando informacion...");
                        
                    //Valida que traiga al menos un dato:
                    sData = "";
                    oCampos =oForm.serializeArray();
                    $.each(oCampos, function(i, oCampo){
                        sTipoDato=$("#form_1_330 #" + oCampos[i].name).attr("tipo_dato");
                        if (sTipoDato!=undefined) {
                            sNombreCampo=oCampo.name.replace("_"+formSuffix,"");
                            if ($.trim(oCampo.value)!="" && 
                                sNombreCampo!="$ta" &&
                                sNombreCampo!="$ca" &&
                                sNombreCampo!="$cf" &&
                                sNombreCampo!="$pk" && 
                                sNombreCampo!="clave_reporte" && 
                                sNombreCampo!="_e")
                                if (sTipoDato=="varchar" || sTipoDato=="text")
                                    sData+="&$p=" + sTipoDato.substring(0, 1) + '|' +sNombreCampo+" like '"+oCampo.value + "%'";
                                else if (sTipoDato=="smalldatetime" || sTipoDato=="datetime" )
                                    sData+="&$p=d|" +sNombreCampo+"="+oCampo.value;
                                else
                                    sData+= "&$p=" + sTipoDato.substring(0, 1) + "|" + sNombreCampo+"="+oCampo.value + "";
                        }
                    });
                        
                        
                    if (sData=="") {
                        alert("Es necesario especificar valor a los parámetros, verifique");
                        $("#tdEstatus_" +formSuffix).html(" Es necesario especificar valor a los parámetros, verifique");
                    } else {
                        var caracteristicas = "height=800,width=800,scrollTo,resizable=1,scrollbars=1,location=0";
                        window.open("control?$cmd=report&$cr=" +  $("#clave_reporte").val() + sData, "_blank", caracteristicas);
                    }

                    $("#dlgModal_"+ formSuffix).dialog("destroy");
                    $("#dlgModal_"+ formSuffix).remove();
                    return false;                        
                        
                });
               
                
                //Fuerza a que se haga scroll a la página
                $("html, body").animate({
                    scrollTop: $("#top").offset().top + "px"
                }, {
                    duration: 0,
                    easing: "swing"
                });
                
                //Se crea el diálogo con el HTML completo
                $("#dlgModal_"+ formSuffix).dialog({
                    modal: true,
                    title: $.fn.reportParameter.options.titulo,    
                    /*height:$.fn.reportParameter.options.height, */
                    top:document.body.scrollTop+350,
                    width:$.fn.reportParameter.options.width,
                    open: function(event, ui) { 
                        $(this).dialog( "option", "position","center" ); 
                    },
                    close: function(event, ui) {
                        $(this).dialog("destroy");
                        $(this).remove();
                    }
                    
                });
            
                //Se crean los tabs
                $("#formTab_" + formSuffix).tabs();
                  
                // Se ocultan los mensajes de validación
                oForm.find('.obligatorio').each(function() {
                    $("#msgvalida_" + this.name).hide();
                });

                //Se ocultan los campos con clase invisible
                //$(".invisible").hide().next().hide();
             
                $(".fecha").datepicker({
                    dateFormat: 'dd/mm/yy',
                    dayNamesMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sa'],
                    monthNames: ['Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre']
                });
                
                $(".fechayhora").datetimepicker({
                    dateFormat: 'dd/mm/yy',
                    dayNamesMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sa'],
                    monthNames: ['Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'],
                    timeOnlyTitle: 'Seleccione hora',
                    timeText: 'Hora seleccionada',
                    hourText: 'Hora',
                    minuteText: 'Minutos',
                    secondText: 'Segundos',
                    currentText: 'Ahora',
                    closeText: 'Cerrar'
                });
                

                $(".money").calculator({
                    useThemeRoller: true,
                    prompt: 'Calculadora',
                    showOn: 'operator'
                }).focus(function() {
                    $(this).val($(this).val().replace(/,/g,"").replace(/\$/g,""));
                }).blur(function() {
                    $(this).val(formatCurrency($(this).val()));
                });
                
                //Se activan el click de las liga orientadas a editar definiciones de campo
                if ($("#_cp_").val()=="1") {
                    $(".edit_field").die("click", edita_diccionario)
                    $(".edit_field").live("click", edita_diccionario)
                }
                //Función para editar diccionario desde la liga del alias
                function edita_diccionario() {
                    aId= this.id.split("-");
                    nApp=aId[1]; 
                    nForma=aId[2];
                    nPk=aId[3];
                         
                    //Si la forma ya está presente aborta llamado
                    if ($("#dlgModal_" + nApp + "_"+ nForma + "_" + nPk).length>0)
                        return false;
                         
                    sModo="update";
                    if (nPk==0)
                        sModo="insert"
                             
                    $("body").form({
                        app: nApp,
                        forma:13,
                        datestamp:obj.attr("datestamp"),
                        modo:sModo,
                        titulo: "Diccionario de datos ",
                        columnas:1,
                        pk:nPk,
                        filtroForaneo:aId[4],
                        height:"500",
                        width:"90%",
                        originatingObject: obj.id,
                        updateControl:obj.id
                    });       
                        
                    return true;
                }
                
                function validateForm(formData, jqForm, options) { 
                    var bCompleto=true;
                    
                    $(jqForm[0]).find('.obligatorio').each(function() {
                       
                        if ($.trim(this.value)=="" && $(this).attr("type")!="checkbox") {
                            $("#td_" + this.name).addClass("errorencampo")
                            $(this).addClass("errorencampo");
                            $("#msgvalida_" + this.name).show();
                            bCompleto=false;
                        }
                        else if ($(this).attr("type")=="checkbox" && !this.checked)  {
                            $("#td_" + this.name).addClass("errorencampo")
                            $(this).addClass("errorencampo");
                            $("#msgvalida_" + this.name).show();
                            bCompleto=false;                            
                        }
                        else {
                            $("#td_" + this.name).removeClass("errorencampo")
                            $("#msgvalida_" + this.name).hide();
                            $(this).removeClass("errorencampo");
                        }
                    });
                    
                    if (!bCompleto){
                        $("#tdEstatus_" +formSuffix).html("Falta dato obligatorio, verifique");
                        return false;
                    }
                    else {
                        $("#tdEstatus_" +formSuffix).html("<img src='img/throbber.gif'>&nbsp;Enviando informaci&oacute;n...");
                        return true;
                    }                        
                }
                
                //Cierra el dialogo de espera
                $("#divwait").dialog( "close" );                

            },
            error:function(xhr,err){
                $("#grid_"+gridSuffix+"_toppager_right").children(0).html("Error al recuperar la forma");
                $("#dlgModal_"+ formSuffix).remove();
                
                //Cierra el dialogo de espera
                $("#divwait").dialog( "close" );                

                alert("Error al recuperar forma: "+xhr.readyState+"\nstatus: "+xhr.status + "\responseText:"+ xhr.responseText);          
            }
        });
    }


    $.fn.reportParameter.handleForm = function(xml){
        var sRenglon='';
        var nFormaForanea=0;
        var sSuffix= '_' + $.fn.reportParameter.options.app  + '_' + $.fn.reportParameter.options.forma;
        var oParametros= $(xml).find("registro");
        var tabIndex=1;
        var nReporte=0;
        sInvisibleInputs="";

        oParametros.each(function(){
            sValorPredeterminado="";
            oParametro=$(this);
            //sTipoCampo= oParametro.children().attr("tipo_dato").toLowerCase();
            if (oParametro.find('evento')[0].childNodes[0].data!="")
                $.fn.reportParameter.options.events[tabIndex-1]=oParametro.find('evento').text();
            
            //Genera etiqueta
            nClave_parametro=(oParametro.find('clave_parametro')[0].childNodes[0].data==undefined)?0:oParametro.find('clave_parametro')[0].childNodes[0].data;
            sParametro =oParametro.find('parametro')[0].childNodes[0].data;
            sAlias=oParametro.find('alias')[0].childNodes[0].data;
            sValorPredeterminado=oParametro.find('valor_predeterminado')[0].childNodes[0].data;
            bVisible=oParametro.find('visible')[0].childNodes[0].data;
            sAyuda=oParametro.find('ayuda')[0].childNodes[0].data;
            nReporte=oParametro.find('clave_reporte')[0].childNodes[0].data;
            nObligatorio=oParametro.find('obligatorio')[0].childNodes[0].data;
            sTipoCampo= oParametro.find('tipo_dato')[0].childNodes[0].data;
             
            if (bVisible=='0' || bVisible=='') {
                sInvisibleInputs+='<input type="hidden" ' + 'id="' + oParametro[0].nodeName + '" name="' + oParametro[0].nodeName + '" value="'
                sInvisibleInputs+=(sValorPredeterminado!="")?eval(sValorPredeterminado):"";
               
                sInvisibleInputs+='" />';
                return true;
            }
                
            sRenglon += '<td id="td_' + sParametro + '" ';
            sRenglon += ' class="etiqueta_forma1' 
            if (bVisible=='0')
                sRenglon +=' invisible';
                
            sRenglon += '">';    
                    
            if (sAlias!='') {
                if ($("#_cp_").val()=="1") 
                    sRenglon+="<a id='lnkEditFieldDef-1-13-"+nClave_parametro+"-2=clave_aplicacion="+$.fn.reportParameter.options.app+"3=clave_forma=" + $.fn.reportParameter.options.forma +"' href='#' class='edit_field' title='Haga clic aqui para abrir su definici&oacute;n en el diccionario de datos'>"+sAlias+"</a>"
                else{    
                    //Establece la seudoclase para mostrar la ayuda
                    if (sAyuda!="")
                        sRenglon+="<a class='tooltipField' ayuda='" +sAyuda+ "' href='#'>"+ sAlias+"</a>";
                    else    
                        sRenglon+=sAlias;
                }    
            }
            else {
                sRenglon+="<a id='lnkEditFieldDef-1-13-"+nClave_parametro+"-2=clave_aplicacion="+$.fn.reportParameter.options.app+"3=clave_forma=" + $.fn.reportParameter.options.forma +"' href='#' class='edit_field' title='El campo no cuenta con alias, haga clic aqui para abrir su definici&oacute;n en el diccionario de datos'>"+oParametro[0].nodeName+"</a>";
            }

            //Verifica si el campo es obligatorio para incluir la leyenda en el alias
            if (nObligatorio=="1")  {
                sRenglon += ' (<span id="msgvalida_' + sParametro + '">Obligatorio</span>*)</td>'
            }
            else {
                sRenglon += '</td>'
            }
            
            //Genera liga para forma foranea
            var nFormaForanea=$(this).find('clave_forma_foranea')[0].childNodes[0].data;
            if (nFormaForanea!=undefined && nFormaForanea!="") {
                sRenglon+='<td class="etiqueta_forma_control1"><select tipo_dato="' + sTipoCampo + '" tabindex="' + tabIndex + '" class="singleInput'


                //Establece seudoclase a select
                if (oParametro.find('obligatorio')[0].childNodes[0].data=="1")  {
                    sRenglon+=' obligatorio" '
                }
                else {
                    sRenglon+='" '
                }

                //sRenglon+='id="' + sParametro + sSuffix + '" name="' + sParametro + sSuffix + '" >';
                sRenglon+='id="' + sParametro + '" name="' + sParametro + '" >';
                oCamposForaneos=oParametro.find('registro_clave_forma_foranea')
                
                oCamposForaneos.each(
                    function(){
                        oCampoForaneo=$(this);
                        sRenglon +="<option ";
                        
                        if (sValorPredeterminado!="") {
                            if(eval(sValorPredeterminado)==oCampoForaneo.children()[0].childNodes[0].data)
                                sRenglon +="selected='selected'";
                        }

                        if (oParametro[0].childNodes[0].data==oCampoForaneo.children()[0].childNodes[0].data)
                            sRenglon +="selected='selected'";
                        sRenglon +=" value='" + oCampoForaneo.children()[0].childNodes[0].data  +"' >" + oCampoForaneo.children()[1].childNodes[0].data + "</option>";
                    }
                    )
                                
                sRenglon +='</select></td>|';
            }
            else {
                if (oParametro.find('tipo_control').text()=="textarea" || sTipoCampo=="text") {
                    sRenglon+='<td class="etiqueta_forma_control1">' +
                    '<textarea tabindex="' + tabIndex + '" rows="10" tipo_dato="'+ sTipoCampo + '" ';
                       
                    sWidgetButton="";

                    if (sTipoCampo=='money' ) {
                        sRenglon+='class="inputWidgeted1';
                        sWidgetButton='<div class="widgetbutton" tipo="calculator_buton" control="' + sParametro + sSuffix +'"></div>';
                        sRenglon +="<div class='widgetbutton' tipo='foreign_toolbar' control='" + sParametro + "' forma='" + nFormaForanea + "' titulo_agregar='Nuevo " + sAlias.toLowerCase() + "' titulo_editar='Editar " + sAlias.toLowerCase() + "' ></div>";
                    } else if (sTipoCampo=='datetime') {
                        sRenglon+='class="inputWidgeted1';
                        sWidgetButton='<div class="widgetbutton" tipo="calendar_buton" control="' + sParametro + sSuffix +'"></div>';
                    }
                    else
                        sRenglon+='class="singleInput';

                    //Establece la marca de obligatorio con la seudoclase obligatorio
                    if (oParametro.find('obligatorio').text()=="1")  
                        sRenglon+=' obligatorio"';
                    else 
                        sRenglon+='"';

                    //sRenglon += ' id="' + sParametro + sSuffix + '" name="' +  sParametro + sSuffix + '" ' +
                    sRenglon += ' id="' + sParametro + '" name="' +  sParametro + '" >';
                    
                    sRenglon+=(sValorPredeterminado!="")?eval(sValorPredeterminado):"";

                    
                    sRenglon+='</textarea>';

                    
                    sRenglon+='</td>|';
                }
                else if ($(this).find('tipo_control').text()=="checkbox" || sTipoCampo=="bit") {
                    sRenglon += '<td class="etiqueta_forma_control1">' +
                    '<div style="width:10px; margin: 0px; padding: 0px"><input type="checkbox" value="1" tabindex="' + tabIndex +
                    '" id="'+ sParametro+ '" name="' + sParametro + '" ';
                     
                    // Establece la marca de obligatorio con la seudoclase obligatorio
                    if ($.fn.reportParameter.options.modo!="lookup" && oParametro.find('obligatorio').text()=="1")  {
                        sRenglon+='class="singleInput obligatorio" ';
                    }
                    else {
                        sRenglon+='class="singleInput" ';
                    }
                    
                    sRenglon+=((sValorPredeterminado=='1')?'checked="checked" ':'')  + ' /></div></td>|';
                } else if ($(this).find('tipo_control').text()=="file" && oParametro[0].childNodes[0].data!="" ) {
                    //sOnChangeEvent="if (this.checked) $('#td_"+ sParametro +"').html('<input tipo_dato=varchar id="+sParametro+" name="+sParametro+" class=singleInput type=file >');";
                    sOnChangeEvent="if (!this.checked){$('#td_"+ sParametro +"').next().html('<input tipo_dato=varchar id="+sParametro+" name="+sParametro+" class=singleInput type=file >');}";
                    sRenglon += '<td class="etiqueta_forma_control1" style="text-align:left">' + 
                    '<input type="checkbox" value="1" checked="checked" onChange="javascript:' + sOnChangeEvent + '" /><a href="/plataforma/temp/'+$("#_ce_").val()+'/'+oParametro[0].childNodes[0].data + '" target="_blank">'+oParametro[0].childNodes[0].data.substring(oParametro[0].childNodes[0].data.lastIndexOf("/")+1)+'</a><input type="hidden" name="' + sParametro + '" id="'+ sParametro + '" value="'+oParametro[0].childNodes[0].data.substring(oParametro[0].childNodes[0].data.lastIndexOf("/")+1)+'" /></td>|';
                            
                }  
                else {
                    sRenglon += '<td class="etiqueta_forma_control1">' + 
                    '<input tipo_dato="' + sTipoCampo + '" id="'+ sParametro + '" name="' + sParametro + '" ' +
                    'tabindex="' + tabIndex + '" ';
                    sWidgetButton="";

                    if (sTipoCampo=='money') {
                        sRenglon+='class="inputWidgeted1';
                        sWidgetButton='<div class="widgetbutton" tipo="calculator_button" control="' + sParametro +'"></div>';
                    } else if (sTipoCampo=='datetime') {
                        sRenglon+='class="inputWidgeted1';
                        sWidgetButton='<div class="widgetbutton" tipo="calendar_button" control="' + sParametro +'"></div>';
                    }
                    else
                        sRenglon+='class="singleInput';

                    if (oParametro.find('obligatorio').text()=="1")
                        sRenglon +=' obligatorio';
                    

                    if (sTipoCampo=="datetime" )
                        sRenglon +=' fechayhora';
                    else if (sTipoCampo=="smalldatetime")
                        sRenglon +=' fecha';
                    else  if (sTipoCampo=="money")
                        sRenglon +=' money';


                    sRenglon +='" type="text" value="' + ((sValorPredeterminado!="")?(eval(sValorPredeterminado)):"") +  '" ';

                    //Validación para inputs estandar de acuerdo al tipo de datos del campo
                    if (sTipoCampo=="int" /*|| sTipoCampo=="money"*/) {
                        sRenglon+=" onBlur='javascript:check_number(this)'";
                    }
                    else if (sTipoCampo=="date") {
                        sRenglon+=" onBlur='javascript:check_date(this)' "
                    }

                    sRenglon+= ' />' + sWidgetButton + ' </td>|';
                }
            }
            tabIndex++;
        }) //oParametros.each

        //Distribución en columnas
        sRenglon=sRenglon.substring(0,sRenglon.length-1);
        var aRows=sRenglon.split('|');
        var aRowsWithTextAreas=[]; 
        var nCols=1;
        var nRows = Math.round(aRows.length/nCols);
        var sForm="";
        var i;
        for (i=0; i<nRows; i++) {
            sForm+="<tr >";

            sForm+=aRows[i].replace(/etiqueta_forma_control1/g,"etiqueta_forma_control"+nCols).replace(/etiqueta_forma1/g,"etiqueta_forma"+nCols).replace(/inputWidgeted1/g,"inputWidgeted"+nCols);
            if (aRows.length>nRows+i && nCols>1) {
                sForm+="<td>&nbsp;</td>"+aRows[nRows+i].replace(/etiqueta_forma_control1/g,"etiqueta_forma_control"+nCols).replace(/etiqueta_forma1/g,"etiqueta_forma"+nCols).replace(/inputWidgeted1/g,"inputWidgeted"+nCols);
            }
            sForm+="</tr>";
        }

        if (nCols>1) {
            for (i=0; i<aRowsWithTextAreas.length; i++) {
                sForm+="<tr >"+aRowsWithTextAreas[i].replace(/class="etiqueta_forma_control1"/g,'class="etiqueta_forma_control'+nCols+'" colspan="4"').replace(/etiqueta_forma1/g,"etiqueta_forma"+nCols).replace(/inputWidgeted1/g,"inputWidgeted"+nCols)+"</tr>";
            }
        }
        
        //Llena la primer pestaña con la forma de la entidad principal
        var formSuffix =$.fn.reportParameter.options.app + "_" + $.fn.reportParameter.options.forma;
        sForm="<form class='forma' id='form_" + formSuffix + "' name='form_"  + formSuffix + "' method='POST' ><table class='forma'>" + sForm + "</table>"+
        sInvisibleInputs +
        "<input type='hidden' id='clave_reporte' name='clave_reporte' value='" + nReporte + "' />" +
        "</form>"
        
        return sForm;
    }  
})(jQuery);