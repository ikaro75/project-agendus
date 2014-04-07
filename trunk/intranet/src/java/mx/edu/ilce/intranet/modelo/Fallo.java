/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.edu.ilce.intranet.modelo;

/**
 * Se encarga de reportar errores en la aplicación
 */
public class Fallo extends Exception {
    Fallo(){}
    
    /**
     * Constructor
     * @param mensaje   mensaje de error presentado
     */
    public Fallo(String mensaje){
        super(mensaje);
    }
}
