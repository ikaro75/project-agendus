/*
 * Enlazado con jquery.pi.session.js
 * Envia saludo dependendiendo de la hora y muestra la fecha actual.
 */
package mx.edu.ilce.intranet.utilerias;

import java.util.*;

/**
 * Clase para recuperar fecha y cambiar mensaje de saludo dependiendo la hora.
 * @author ILCE
 */
public class Saludo {
    
    //Fecha
        private int dia;
        private int diasem;
        private int mes;
        private int anio;
        
    //Hora
        private int hora;
        private int minuto;
        private String rsaludo;
    
     /**
     * Constructor de la clase para inicializar
     */
    public Saludo(){
            Calendar ahora = Calendar.getInstance();
            dia = ahora.get(Calendar.DAY_OF_MONTH);
            diasem = ahora.get(Calendar.DAY_OF_WEEK);
            mes = ahora.get(Calendar.MONTH)+1;
            anio = ahora.get(Calendar.YEAR);
            hora = ahora.get(Calendar.HOUR_OF_DAY);
            minuto = ahora.get(Calendar.MINUTE);
        }
        
     /**
     * Verifica la hora y establece el mensaje de saludo.
     * @return Mensaje de saludo
     */
    public String msaludo(){
            String s;
            //Seleccion de saludo
            if(hora<12){
                s = "Buenos días";
            }else if(hora<18){
                s = "Buenas tardes";
            }else{
                s = "Buenas noches";
            }
            return s;
        }
        
    /**
    * Verifica la fecha y la traduce al español.
    * @return Fecha
    */
    public String mfecha(){
            String smes="a",sdiasem="b",sf="c";
            //Formato de la fecha
            switch(mes){
                case 1:
                    smes = "Enero";
                break;
                case 2:
                    smes = "Febrero";
                break;
                case 3:
                    smes = "Marzo";
                break;
                case 4:
                    smes = "Abril";
                break;
                case 5:
                    smes = "Mayo";
                break;
                case 6:
                    smes = "Junio";
                break;
                case 7:
                    smes = "Julio";
                break;
                case 8:
                    smes = "Agosto";
                break;
                case 9:
                    smes = "Sptiembre";
                break;
                case 10:
                    smes = "Octubre";
                break;
                case 11:
                    smes = "Noviembre";
                break;
                case 12:
                    smes = "Diciembre";
                break;   
            }
            switch(diasem){
                case 2:
                    sdiasem = "Lunes";
                break;
                case 3:
                    sdiasem = "Martes";
                break;
                case 4:
                    sdiasem = "Miercoles";
                break;
                case 5:
                    sdiasem = "Jueves";
                break;
                case 6:
                    sdiasem = "Viernes";
                break;
                case 7:
                    sdiasem = "Sabado";
                break;
                case 1:
                    sdiasem = "Domingo";
                break;
            }
            sf="Hoy es "+sdiasem+", "+dia+" de "+smes+" del "+anio;
            return sf;
        }
}
