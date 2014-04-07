/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.edu.ilce.intranet.promocion;

import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;
import mx.edu.ilce.intranet.mail.Mail;
import mx.edu.ilce.intranet.modelo.Conexion;
import mx.edu.ilce.intranet.modelo.Consulta;
import mx.edu.ilce.intranet.modelo.Fallo;
import mx.edu.ilce.intranet.modelo.Usuario;

/**
 *
 * @author Daniel
 */
public class ProductoProyecto extends Consulta {

    private Integer claveProductoProyecto;
    private Integer claveProyecto;
    private Integer claveProducto;
    private Integer claveArea;
    private Date fechaCotizacion;
    private Integer cantidad;
    private Float precioUnitario;
    private Float costoDirecto;
    private Float costoIndirecto;
    private Float factorCostoOperacion;
    private Float factorRecuperacion;
    private Float factorRiesgo;
    private Float importe;
    private Integer claveImpuesto;
    private Integer claveMoneda;
    private Float tipoCambio;
    private Integer claveEmpleado;
    private Date fechaInicialReal;
    private Date fechaInicialPlaneada;
    private Date fechaFinalReal;
    private Date fechaFinalPlaneadaProducto;
    private Integer orden;
    private Integer claveEstatusProductoProyecto;

    public Integer getClaveProductoProyecto() {
        return claveProductoProyecto;
    }

    public void setClaveProductoProyecto(Integer claveProductoProyecto) {
        this.claveProductoProyecto = claveProductoProyecto;
    }

    public Integer getClaveProyecto() {
        return claveProyecto;
    }

    public void setClaveProyecto(Integer claveProyecto) {
        this.claveProyecto = claveProyecto;
    }

    public Integer getClaveProducto() {
        return claveProducto;
    }

    public void setClaveProducto(Integer claveProducto) {
        this.claveProducto = claveProducto;
    }

    public Integer getClaveArea() {
        return claveArea;
    }

    public void setClaveArea(Integer claveArea) {
        this.claveArea = claveArea;
    }

    public Date getFechaCotizacion() {
        return fechaCotizacion;
    }

    public void setFechaCotizacion(Date fechaCotizacion) {
        this.fechaCotizacion = fechaCotizacion;
    }

    public Integer getCantidad() {
        return cantidad;
    }

    public void setCantidad(Integer cantidad) {
        this.cantidad = cantidad;
    }

    public Float getPrecioUnitario() {
        return precioUnitario;
    }

    public void setPrecioUnitario(Float precioUnitario) {
        this.precioUnitario = precioUnitario;
    }

    public Float getCostoDirecto() {
        return costoDirecto;
    }

    public void setCostoDirecto(Float costoDirecto) {
        this.costoDirecto = costoDirecto;
    }

    public Float getCostoIndirecto() {
        return costoIndirecto;
    }

    public void setCostoIndirecto(Float costoIndirecto) {
        this.costoIndirecto = costoIndirecto;
    }

    public Float getFactorCostoOperacion() {
        return factorCostoOperacion;
    }

    public void setFactorCostoOperacion(Float factorCostoOperacion) {
        this.factorCostoOperacion = factorCostoOperacion;
    }

    public Float getFactorRecuperacion() {
        return factorRecuperacion;
    }

    public void setFactorRecuperacion(Float factorRecuperacion) {
        this.factorRecuperacion = factorRecuperacion;
    }

    public Float getFactorRiesgo() {
        return factorRiesgo;
    }

    public void setFactorRiesgo(Float factorRiesgo) {
        this.factorRiesgo = factorRiesgo;
    }

    public Float getImporte() {
        return importe;
    }

    public void setImporte(Float importe) {
        this.importe = importe;
    }

    public Integer getClaveImpuesto() {
        return claveImpuesto;
    }

    public void setClaveImpuesto(Integer claveImpuesto) {
        this.claveImpuesto = claveImpuesto;
    }

    public Integer getClaveMoneda() {
        return claveMoneda;
    }

    public void setClaveMoneda(Integer claveMoneda) {
        this.claveMoneda = claveMoneda;
    }

    public Float getTipoCambio() {
        return tipoCambio;
    }

    public void setTipoCambio(Float tipoCambio) {
        this.tipoCambio = tipoCambio;
    }

    public Integer getClaveEmpleado() {
        return claveEmpleado;
    }

    public void setClaveEmpleado(Integer claveEmpleado) {
        this.claveEmpleado = claveEmpleado;
    }

    public Date getFechaInicialReal() {
        return fechaInicialReal;
    }

    public void setFechaInicialReal(Date fechaInicialReal) {
        this.fechaInicialReal = fechaInicialReal;
    }

    public Date getFechaInicialPlaneada() {
        return fechaInicialPlaneada;
    }

    public void setFechaInicialPlaneada(Date fechaInicialPlaneada) {
        this.fechaInicialPlaneada = fechaInicialPlaneada;
    }

    public Date getFechaFinalReal() {
        return fechaFinalReal;
    }

    public void setFechaFinalReal(Date fechaFinalReal) {
        this.fechaFinalReal = fechaFinalReal;
    }

    public Date getFechaFinalPlaneadaProducto() {
        return fechaFinalPlaneadaProducto;
    }

    public void setFechaFinalPlaneadaProducto(Date fechaFinalPlaneadaProducto) {
        this.fechaFinalPlaneadaProducto = fechaFinalPlaneadaProducto;
    }

    public Integer getOrden() {
        return orden;
    }

    public void setOrden(Integer orden) {
        this.orden = orden;
    }

    public Integer getClaveEstatusProductoProyecto() {
        return claveEstatusProductoProyecto;
    }

    public void setClaveEstatusProductoProyecto(Integer claveEstatusProductoProyecto) {
        this.claveEstatusProductoProyecto = claveEstatusProductoProyecto;
    }

    /**
     * Constructor de la clase actividad
     *
     * @param claveActividad Clave de la actividad.
     * @param cx Conexión a la base de datos.
     */
    public ProductoProyecto(Integer claveProductoProyecto, Usuario usuario) {
        super.setUsuario(usuario);
        this.claveProductoProyecto = claveProductoProyecto;
        try {
            ResultSet rs = super.getUsuario().getCx().getRs("select * from pryct_producto_proyecto where clave_producto_proyecto=".concat(claveProductoProyecto.toString()));

            if (rs.next()) {

                this.claveProductoProyecto = rs.getInt("clave_producto_proyecto");
                this.claveProyecto = rs.getInt("clave_proyecto");
                this.claveProducto = rs.getInt("clave_producto");
                this.claveArea = rs.getInt("clave_area");
                this.fechaCotizacion = rs.getDate("fecha_cotizacion");
                this.cantidad = rs.getInt("cantidad");
                this.precioUnitario = rs.getFloat("precio_unitario");
                this.costoDirecto = rs.getFloat("costo_directo");
                this.costoIndirecto = rs.getFloat("costo_indirecto");
                this.factorCostoOperacion = rs.getFloat("factor_costo_operacion");
                this.factorRecuperacion = rs.getFloat("factor_recuperacion");
                this.factorRiesgo = rs.getFloat("factor_riesgo");
                this.importe = rs.getFloat("importe");
                this.claveImpuesto = rs.getInt("clave_impuesto");
                this.claveMoneda = rs.getInt("clave_moneda");
                this.tipoCambio = rs.getFloat("tipo_cambio");
                this.claveEmpleado = rs.getInt("clave_empleado");
                this.fechaInicialReal = rs.getDate("fecha_inicial_real");
                this.fechaInicialPlaneada = rs.getDate("fecha_inicial_planeada");
                this.fechaFinalReal = rs.getDate("fecha_final_real");
                this.fechaFinalPlaneadaProducto = rs.getDate("fecha_final_planeada_producto");
                this.orden = rs.getInt("orden");
                this.claveEstatusProductoProyecto = rs.getInt("clave_estatus_producto_proyecto");

            } else {
                throw new Fallo("Error al recuperar el producto especificado");
            }

        } catch (Exception e) {
        }
    }

    /**
     * Constructor de la clave actividad que envia la consulta y la conexón
     *
     * @param c Parametro donde se envía la consulta
     * @param cx Parametro para la conexión
     * @throws Fallo Envía el fallo o error
     */
    public ProductoProyecto(Consulta c) throws Fallo {
        super.setAccion(c.getAccion());
        super.setCampos(c.getCampos());
        super.setClaveAplicacion(c.getClaveAplicacion());
        super.setClaveForma(c.getClaveForma());
        super.setClaveConsulta(c.getClaveConsulta());
        super.setClavePerfil(c.getClavePerfil());
        super.setIdx(c.getIdx());
        super.setLimiteDeRegistros(c.getLimiteDeRegistros());
        super.setLlavePrimaria(c.getLlavePrimaria());
        super.setNumeroDeRegistros(c.getNumeroDeRegistros());
        super.setOrdx(c.getOrdx());
        super.setPagina(c.getPagina());
        super.setPk(c.getPk());
        super.setRegistros(c.getRegistros());
        super.setSQL(c.getSQL());
        super.setTabla(c.getTabla());
        super.setW(c.getW());
        super.setUsuario(c.getUsuario());

        StringBuilder q = new StringBuilder();

        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");

        try {

            if (c.getCampos().get("clave_producto_proyecto").getValor() != null) {
                this.claveProductoProyecto = Integer.parseInt(c.getCampos().get("clave_producto_proyecto").getValor());
            } else {
                if (c.getPk() != null && !c.getPk().equals("")) {
                    this.claveProductoProyecto = Integer.parseInt(c.getPk());
                } else {
                    throw new Fallo("No se especificó la clave del producto, verifique");
                }
            }

            if (c.getCampos().get("clave_proyecto").getValor() != null && !c.getAccion().equals("delete") && !c.getCampos().get("clave_proyecto").getValor().equals("")) {
                this.claveProyecto = Integer.parseInt(c.getCampos().get("clave_proyecto").getValor());
            } else {
                if (c.getAccion().equals("update")) {
                    if (c.getCampos().get("clave_proyecto").getValorOriginal() != null) {
                        this.claveProyecto = Integer.parseInt(c.getCampos().get("clave_proyecto").getValorOriginal());
                    } else {
                        throw new Fallo("No se especificó el proyecto, verifique");
                    }
                } else {
                    throw new Fallo("No se especificó el proyecto, verifique");
                }
            }

            if (c.getCampos().get("clave_producto").getValor() != null && !c.getAccion().equals("delete") && !c.getCampos().get("clave_producto").getValor().equals("")) {
                this.claveProducto = Integer.parseInt(c.getCampos().get("clave_producto").getValor());
            } else {
                if (c.getAccion().equals("update")) {
                    if (c.getCampos().get("clave_producto").getValorOriginal() != null) {
                        this.claveProducto = Integer.parseInt(c.getCampos().get("clave_producto").getValorOriginal());
                    } else {
                        throw new Fallo("No se especificó el producto, verifique");
                    }
                } else {
                    throw new Fallo("No se especificó el producto, verifique");
                }
            }

            if (c.getCampos().get("clave_area").getValor() != null && !c.getAccion().equals("delete") && !c.getCampos().get("clave_area").getValor().equals("")) {
                this.claveArea = Integer.parseInt(c.getCampos().get("clave_area").getValor());
            } else {
                if (c.getAccion().equals("update")) {
                    if (c.getCampos().get("clave_area").getValorOriginal() != null) {
                        this.claveArea = Integer.parseInt(c.getCampos().get("clave_area").getValorOriginal());
                    } else {
                        throw new Fallo("No se especificó el área, verifique");
                    }
                } else {
                    throw new Fallo("No se especificó el área, verifique");
                }
            }

            if (c.getCampos().get("fecha_cotizacion") != null) {
                if (c.getCampos().get("fecha_cotizacion").getValor() != null && !c.getAccion().equals("delete") && !c.getCampos().get("fecha_cotizacion").getValor().equals("")) {
                    this.fechaCotizacion = formatter.parse(c.getCampos().get("fecha_cotizacion").getValor());
                } else {
                    if (c.getAccion().equals("update")) {
                        if (c.getCampos().get("fecha_cotizacion").getValorOriginal() != null) {
                            this.fechaCotizacion = formatter.parse(c.getCampos().get("fecha_cotizacion").getValor());
                        } else {
                            throw new Fallo("No se especificó la fecha de cotización, verifique");
                        }
                    } else {
                        throw new Fallo("No se especificó fecha de cotización, verifique");
                    }
                }
            }

            if (c.getCampos().get("cantidad").getValor() != null && !c.getAccion().equals("delete") && !c.getCampos().get("cantidad").getValor().equals("")) {
                this.cantidad = Integer.parseInt(c.getCampos().get("cantidad").getValor());
            } else {
                if (c.getAccion().equals("update")) {
                    if (c.getCampos().get("cantidad").getValorOriginal() != null) {
                        this.cantidad = Integer.parseInt(c.getCampos().get("cantidad").getValor());
                    } else {
                        throw new Fallo("No se especificó la cantidad, verifique");
                    }
                } else {
                    throw new Fallo("No se especificó la cantidad, verifique");
                }
            }

            if (c.getCampos().get("precio_unitario").getValor() != null && !c.getAccion().equals("delete") && !c.getCampos().get("precio_unitario").getValor().equals("")) {
                this.precioUnitario = Float.parseFloat(c.getCampos().get("precio_unitario").getValor());
            } else {
                if (c.getAccion().equals("update")) {
                    if (c.getCampos().get("precio_unitario").getValorOriginal() != null) {
                        this.precioUnitario = Float.parseFloat(c.getCampos().get("precio_unitario").getValor());
                    } else {
                        throw new Fallo("No se especificó el precio unitario, verifique");
                    }
                } else {
                    throw new Fallo("No se especificó el precio unitario, verifique");
                }
            }


            if (c.getCampos().get("costo_directo").getValor() != null && !c.getAccion().equals("delete") && !c.getCampos().get("costo_directo").getValor().equals("")) {
                this.costoDirecto = Float.parseFloat(c.getCampos().get("costo_directo").getValor());
            } else {
                if (c.getAccion().equals("update")) {
                    if (c.getCampos().get("costo_directo").getValorOriginal() != null) {
                        this.costoDirecto = Float.parseFloat(c.getCampos().get("costo_directo").getValor());
                    } else {
                        throw new Fallo("No se especificó el costo directo, verifique");
                    }
                } else {
                    throw new Fallo("No se especificó el costo directo, verifique");
                }
            }

            if (c.getCampos().get("costo_indirecto")!=null) {
                if (c.getCampos().get("costo_indirecto").getValor() != null && !c.getAccion().equals("delete") && !c.getCampos().get("costo_indirecto").getValor().equals("")) {
                    this.costoIndirecto = Float.parseFloat(c.getCampos().get("costo_indirecto").getValor());
                } else {
                    if (c.getAccion().equals("update")) {
                        if (c.getCampos().get("costo_indirecto").getValorOriginal() != null) {
                            this.costoIndirecto = Float.parseFloat(c.getCampos().get("costo_indirecto").getValor());
                        }
                    }
                }
            }
            
            if (c.getCampos().get("factor_costo_operacion").getValor() != null && !c.getAccion().equals("delete") && !c.getCampos().get("factor_costo_operacion").getValor().equals("")) {
                this.factorCostoOperacion = Float.parseFloat(c.getCampos().get("factor_costo_operacion").getValor());
            } else {
                if (c.getAccion().equals("update")) {
                    if (c.getCampos().get("factor_costo_operacion").getValorOriginal() != null) {
                        this.factorCostoOperacion = Float.parseFloat(c.getCampos().get("factor_costo_operacion").getValor());
                    } else {
                        throw new Fallo("No se especificó el factor del costo de operación, verifique");
                    }
                } else {
                    throw new Fallo("No se especificó el factor del costo de operación, verifique");
                }
            }

            if (c.getCampos().get("factor_recuperacion").getValor() != null && !c.getAccion().equals("delete") && !c.getCampos().get("factor_recuperacion").getValor().equals("")) {
                this.factorRecuperacion = Float.parseFloat(c.getCampos().get("factor_recuperacion").getValor());
            } else {
                if (c.getAccion().equals("update")) {
                    if (c.getCampos().get("factor_recuperacion").getValorOriginal() != null) {
                        this.factorRecuperacion = Float.parseFloat(c.getCampos().get("factor_recuperacion").getValor());
                    } else {
                        throw new Fallo("No se especificó el factor de recuperación, verifique");
                    }
                } else {
                    throw new Fallo("No se especificó el factor de recuperación, verifique");
                }
            }

            if (c.getCampos().get("factor_riesgo").getValor() != null && !c.getAccion().equals("delete") && !c.getCampos().get("factor_riesgo").getValor().equals("")) {
                this.factorRiesgo = Float.parseFloat(c.getCampos().get("factor_riesgo").getValor());
            } else {
                if (c.getAccion().equals("update")) {
                    if (c.getCampos().get("factor_riesgo").getValorOriginal() != null) {
                        this.factorRiesgo = Float.parseFloat(c.getCampos().get("factor_riesgo").getValor());
                    } else {
                        throw new Fallo("No se especificó el factor de riesgo, verifique");
                    }
                } else {
                    throw new Fallo("No se especificó el factor de riesgo, verifique");
                }
            }

            if (c.getCampos().get("importe").getValor() != null && !c.getAccion().equals("delete") && !c.getCampos().get("importe").getValor().equals("")) {
                this.importe = Float.parseFloat(c.getCampos().get("importe").getValor());
            } else {
                if (c.getAccion().equals("update")) {
                    if (c.getCampos().get("importe").getValorOriginal() != null) {
                        this.importe = Float.parseFloat(c.getCampos().get("importe").getValor());
                    } else {
                        throw new Fallo("No se especificó el importe, verifique");
                    }
                } else {
                    throw new Fallo("No se especificó el importe, verifique");
                }
            }

            if (c.getCampos().get("clave_impuesto").getValor() != null && !c.getAccion().equals("delete") && !c.getCampos().get("clave_impuesto").getValor().equals("")) {
                this.claveImpuesto = Integer.parseInt(c.getCampos().get("clave_impuesto").getValor());
            } else {
                if (c.getAccion().equals("update")) {
                    if (c.getCampos().get("clave_impuesto").getValorOriginal() != null) {
                        this.claveImpuesto = Integer.parseInt(c.getCampos().get("clave_impuesto").getValor());
                    } else {
                        throw new Fallo("No se especificó la clave del impuesto, verifique");
                    }
                } else {
                    throw new Fallo("No se especificó la clave del impuesto, verifique");
                }
            }

            if (c.getCampos().get("clave_moneda").getValor() != null && !c.getAccion().equals("delete") && !c.getCampos().get("clave_moneda").getValor().equals("")) {
                this.claveMoneda = Integer.parseInt(c.getCampos().get("clave_moneda").getValor());
            } else {
                if (c.getAccion().equals("update")) {
                    if (c.getCampos().get("clave_moneda").getValorOriginal() != null) {
                        this.claveMoneda = Integer.parseInt(c.getCampos().get("clave_moneda").getValor());
                    } else {
                        throw new Fallo("No se especificó la moneda, verifique");
                    }
                } else {
                    throw new Fallo("No se especificó la moneda, verifique");
                }
            }

            if (c.getCampos().get("tipo_cambio").getValor() != null && !c.getAccion().equals("delete") && !c.getCampos().get("tipo_cambio").getValor().equals("")) {
                this.tipoCambio = Float.parseFloat(c.getCampos().get("tipo_cambio").getValor());
            } else {
                if (c.getAccion().equals("update")) {
                    if (c.getCampos().get("tipo_cambio").getValorOriginal() != null) {
                        this.tipoCambio = Float.parseFloat(c.getCampos().get("tipo_cambio").getValor());
                    } else {
                        throw new Fallo("No se especificó el tipo de cambio, verifique");
                    }
                } else {
                    throw new Fallo("No se especificó el tipo de cambio, verifique");
                }
            }

            if (c.getCampos().get("clave_empleado").getValor() != null && !c.getAccion().equals("delete") && !c.getCampos().get("clave_empleado").getValor().equals("")) {
                this.claveEmpleado = Integer.parseInt(c.getCampos().get("clave_empleado").getValor());
            } else {
                if (c.getAccion().equals("update")) {
                    if (c.getCampos().get("clave_empleado").getValorOriginal() != null) {
                        this.claveEmpleado = Integer.parseInt(c.getCampos().get("clave_empleado").getValor());
                    } else {
                        throw new Fallo("No se especificó el empleado, verifique");
                    }
                } else {
                    throw new Fallo("No se especificó el empleado, verifique");
                }
            }
            
            if (c.getCampos().get("fecha_inicial_real")!=null) {
                if (c.getCampos().get("fecha_inicial_real").getValor() != null && !c.getAccion().equals("delete") && !c.getCampos().get("fecha_inicial_real").getValor().equals("")) {
                    this.fechaInicialReal = formatter.parse(c.getCampos().get("fecha_inicial_real").getValor());
                } else {
                    if (c.getAccion().equals("update")) {
                        if (c.getCampos().get("fecha_inicial_real").getValorOriginal() != null) {
                            this.fechaInicialReal = formatter.parse(c.getCampos().get("fecha_inicial_real").getValor());
                        }
                    }
                }
            }
            
            if (c.getCampos().get("fecha_inicial_planeada")!=null) {
                if (c.getCampos().get("fecha_inicial_planeada").getValor() != null && !c.getAccion().equals("delete") && !c.getCampos().get("fecha_inicial_planeada").getValor().equals("")) {
                    this.fechaInicialPlaneada = formatter.parse(c.getCampos().get("fecha_inicial_planeada").getValor());
                } else {
                    if (c.getAccion().equals("update")) {
                        if (c.getCampos().get("fecha_inicial_planeada").getValorOriginal() != null) {
                            this.fechaInicialPlaneada = formatter.parse(c.getCampos().get("fecha_inicial_planeada").getValor());
                        }
                    }
                }
            }
            
            if (c.getCampos().get("fecha_final_real")!=null) {
                if (c.getCampos().get("fecha_final_real").getValor() != null && !c.getAccion().equals("delete") && !c.getCampos().get("fecha_final_real").getValor().equals("")) {
                    this.fechaFinalReal = formatter.parse(c.getCampos().get("fecha_final_real").getValor());
                } else {
                    if (c.getAccion().equals("update")) {
                        if (c.getCampos().get("fecha_final_real").getValorOriginal() != null) {
                            this.fechaFinalReal = formatter.parse(c.getCampos().get("fecha_final_real").getValor());
                        }
                    }
                }
            }
            
            if (c.getCampos().get("fecha_final_planeada_producto")!=null) {
                if (c.getCampos().get("fecha_final_planeada_producto").getValor() != null && !c.getAccion().equals("delete") && !c.getCampos().get("fecha_final_planeada_producto").getValor().equals("")) {
                    this.fechaFinalPlaneadaProducto = formatter.parse(c.getCampos().get("fecha_final_planeada_producto").getValor());
                } else {
                    if (c.getAccion().equals("update")) {
                        if (c.getCampos().get("fecha_final_planeada_producto").getValorOriginal() != null) {
                            this.fechaFinalPlaneadaProducto = formatter.parse(c.getCampos().get("fecha_final_planeada_producto").getValor());
                        }
                    }
                }
            }
            
            if (c.getCampos().get("orden")!=null) {
                if (c.getCampos().get("orden").getValor() != null && !c.getAccion().equals("delete") && !c.getCampos().get("orden").getValor().equals("")) {
                    this.orden = Integer.parseInt(c.getCampos().get("orden").getValor());
                } else {
                    if (c.getAccion().equals("update")) {
                        if (c.getCampos().get("orden").getValorOriginal() != null) {
                            this.orden = Integer.parseInt(c.getCampos().get("orden").getValor());
                        }
                    }
                }
            }
            
            if (c.getCampos().get("clave_estatus_producto_proyecto").getValor() != null && !c.getAccion().equals("delete") && !c.getCampos().get("clave_estatus_producto_proyecto").getValor().equals("")) {
                this.claveEstatusProductoProyecto = Integer.parseInt(c.getCampos().get("clave_estatus_producto_proyecto").getValor());
            } else {
                if (c.getAccion().equals("update")) {
                    if (c.getCampos().get("clave_estatus_producto_proyecto").getValorOriginal() != null) {
                        this.claveEstatusProductoProyecto = Integer.parseInt(c.getCampos().get("clave_estatus_producto_proyecto").getValor());
                    } else {
                        throw new Fallo("No se especificó el empleado, verifique");
                    }
                } else {
                    throw new Fallo("No se especificó el empleado, verifique");
                }
           }

        } catch (Exception e) {
            throw new Fallo(e.getMessage());
        }
    }

    /**
     * Inserta registro de la actividad los permisos del administrador, las
     * consultas relacionadas a la forma para mostrar el grid, crear el
     * formulario de inserción y actualización, y presentar la información de
     * actividades recientes, así como el diccionario de datos de la forma para
     * el perfil de administrador
     *
     * @param claveEmpleado
     * @param ip
     * @param browser
     * @param forma
     * @param cx
     * @return
     * @throws Fallo
     */
    public String insert() throws Fallo {
        StringBuilder s = new StringBuilder();
        StringBuilder resultado = new StringBuilder();
        Conexion oDb = new Conexion(super.getUsuario().getCx().getServer(), super.getUsuario().getCx().getDb(), super.getUsuario().getCx().getUser(), super.getUsuario().getCx().getPw(), super.getUsuario().getCx().getDbType());
        ResultSet rs = null;
        resultado.append(super.insert(true));

        if (resultado.toString().split("<error>").length > 1) {
            oDb.cierraConexion();
            oDb = null;
            throw new Fallo(resultado.toString().split("<error><!\\[")[1].replaceAll("CDATA\\[", "").replaceAll("]]></error>", ""));
        }


        this.claveProductoProyecto = Integer.parseInt(resultado.toString().split("<pk>")[1].substring(0, resultado.toString().split("<pk>")[1].indexOf("</pk>")));
        //1. Extrae los recursos del producto
        try {
            rs = oDb.getRs("select * from prdts_producto_insumo where clave_producto=".concat(this.claveProducto.toString()));
            while (rs.next()) {
                s = new StringBuilder();
                s.append("INSERT INTO pryct_producto_recurso")
                        .append("(clave_producto_proyecto, clave_tipo_recurso, clave_recurso, cantidad,costo_unitario,")
                        .append("clave_impuesto, costo_total, horas_desarrollo, clave_moneda, tipo_cambio,")
                        .append("clave_estatus_producto_recurso, fecha_inicial, fecha_final)")
                        .append(" VALUES (").append(this.claveProductoProyecto).append(",").append(rs.getString("clave_tipo_insumo") ).append(",")
                        .append(rs.getString("clave_insumo")).append(",")
                        .append(rs.getString("cantidad")).append(",").append(rs.getString("costo_unitario")).append(",")
                        .append(rs.getString("clave_impuestos")).append(",").append(rs.getString("costo_total")).append(",")
                        .append(rs.getString("horas_desarrollo")).append(",").append(rs.getString("clave_moneda")).append(",")
                        .append(rs.getString("tipo_cambio")).append(",").append(rs.getString("clave_estatus")).append(",")
                        .append(rs.getString("fecha_inicial")==null?"null":"'".concat(rs.getString("fecha_inicial")).concat("'")).append(",")
                        .append(rs.getString("fecha_final")==null?"null":"'".concat(rs.getString("fecha_final")).concat("'")).append(")");

                resultado.append("<insert_pryct_producto_recurso>").append(s).append("</insert_pryct_producto_recurso>");
                oDb.execute(s.toString());
                
            }

            //Actualiza el estatus del entregable a "Recursos definidos"
            resultado.append("<update_pryct_producto_proyecto>").append(s).append("</update_pryct_producto_proyecto>");                
            oDb.execute("UPDATE pryct_producto_proyecto SET clave_estatus_producto_proyecto=2 WHERE clave_producto_proyecto=".concat(this.claveProductoProyecto.toString()));
        } catch (Exception ex) {
            resultado.append("<error>").append(ex.getMessage()).append("</error>");
            throw new Fallo(ex.getMessage());
        } finally {
            oDb.cierraConexion();
            oDb = null;
        }

        return resultado.toString();
    }
}
