package mx.edu.ilce.intranet.modelo;

import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Recupera las consultas de las formas, las resuelve basándose en el perfil del usuario y en sus reglas de reemplazo y 
 * las ejecuta asociando los campos con el diccionario de datos correspondiente.
 * También maneja opciones de paginación de registros
 */
public class Consulta {

    private Integer claveConsulta;
    private Integer clavePerfil;
    private Integer claveAplicacion;
    private Integer claveForma;
    private String accion;
    private String sql;
    private String tabla;
    private String llavePrimaria;
    private String pk;
    private String w;
    LinkedHashMap /*<String, Campo>*/ campos = new LinkedHashMap /*<String, Campo>*/();
    private ArrayList<ArrayList> registros = new ArrayList<ArrayList>();
    private int numeroDeRegistros;
    private int limiteDeRegistros;
    private int pagina;
    private String idx;
    private String ordx;
    private Usuario usuario = new Usuario();
    /**
     * Recupera clave de la aplicacion desde donde se genera la consulta
     * @return Clave de la aplicación
     */
    public Integer getClaveAplicacion() {
        return claveAplicacion;
    }

    /**
     * Establece clave de la aplicacion desde donde se genera la consulta
     * @param claveAplicacion   Clave de la aplicación
     */
    public void setClaveAplicacion(Integer claveAplicacion) {
        this.claveAplicacion = claveAplicacion;
    }

    /**
     * Recupera clave del perfil del usuario que ejecuta la consulta
     * @return Clave del perfil
     */
    public Integer getClavePerfil() {
        return clavePerfil;
    }

    /**
     * Establece clave del perfil del usuario que ejecuta la consulta
     * @param clavePerfil   Clave del perfil
     */
    public void setClavePerfil(Integer clavePerfil) {
        this.clavePerfil = clavePerfil;
    }

    /**
     * Recupera llave primaria de la consulta   
     * @return  Llave primaria de la consulta
     */
    public Integer getClaveConsulta() {
        return claveConsulta;
    }

    /**
     * Establece llave primaria de la consulta 
     * @param claveConsulta Llave primaria de la consulta
     */
    public void setClaveConsulta(Integer claveConsulta) {
        this.claveConsulta = claveConsulta;
    }

    /**
     * Establece tipo de consulta, estas pueden ser: SELECT (Ejecuta select para crear grid), INSERT (ejecuta consulta vacía
     * con el fin de recuperar solo los metadatos con los que se construirá el formulario de inserción), UPDATE (ejecuta consulta
     * filtrada por llave primaria con el fin de construir el formulario de actualización) y LOG (ejecuta consulta que contiene
     * la actividad reciente relacionada a un catálogo)
     * @param accion    Tipo de consulta
     */
    public void setAccion(String accion) {
        this.accion = accion;
    }

    /**
     * Ejecuta consulta previamenta resuelta, asocia los campos con sus definiciones en el diccionario de datos
     * y agrega los registros de la consulta en el ArrayList registros del objeto Consulta
     * @param cx        Objeto de tipo <code>mx.edu.ilce.intranet.modelo.Conexión</code> con los detalles de la base de datos
     * @throws Fallo    si ocurre algún problema relacionado con la base de datos
     */
    public void setCampos() throws Fallo {

        Campo fdCampo;
        ResultSet oRs = null;
        ResultSet rsFieldDictionary;
        int nCols;
        StringBuilder qryCampos = new StringBuilder("");
        Conexion oDb = new Conexion (this.usuario.getCx().getServer(), this.usuario.getCx().getDb(), this.usuario.getCx().getUser(), this.usuario.getCx().getPw(), this.usuario.getCx().getDbType());
        Boolean autoIncrement = false;
        Boolean autoIncrementLocated = false;
        try {

            oRs = oDb.getRs(this.sql);

            for (int i = 0; i < oRs.getMetaData().getColumnCount(); i++) {
                String dataType = "";
                if (oDb.getDbType() == Conexion.DbType.MYSQL) {
                    if (oRs.getMetaData().getColumnTypeName(i + 1).equals("VARCHAR") && oRs.getMetaData().getColumnDisplaySize(i + 1) > 255) {
                        dataType = "TEXT";
                    } else {
                        dataType = oRs.getMetaData().getColumnTypeName(i + 1);
                    }
                } else if (oDb.getDbType() == Conexion.DbType.MSSQL) {   
                    dataType = oRs.getMetaData().getColumnTypeName(i + 1);
                } else if (oDb.getDbType() == Conexion.DbType.ORACLE) {
                    if (oRs.getMetaData().getColumnTypeName(i + 1).equals("CLOB")) {
                        dataType ="TEXT"; } 
                    else if (oRs.getMetaData().getColumnTypeName(i + 1).equals("VARCHAR2")) {
                        dataType ="varchar";  }
                    else if (oRs.getMetaData().getColumnTypeName(i + 1).equals("NUMBER") && oRs.getMetaData().getPrecision(i + 1)==3) {
                        dataType ="bit"; }
                    else if (oRs.getMetaData().getColumnTypeName(i + 1).equals("NUMBER") && (oRs.getMetaData().getPrecision(i + 1)==10 || oRs.getMetaData().getPrecision(i + 1)==38)) {
                        dataType ="int"; }
                    else {
                        dataType =oRs.getMetaData().getColumnTypeName(i + 1);  }
                }   
                
                //Debido a que no existe la propiedad isAutoIncrement en ORACLE es necesario hacer la búsqueda del trigger que cumple con esta función
                if (oDb.getDbType() == Conexion.DbType.ORACLE) {
                    if (!autoIncrementLocated) {
                        ResultSet triggerRs = oDb.getRs("SELECT COUNT(TRIGGER_NAME) as triggers FROM SYS.ALL_TRIGGERS WHERE trigger_name='".concat(this.tabla.toUpperCase().replaceAll("A", "").replaceAll("E", "").replaceAll("I", "").replaceAll("O", "").replaceAll("U", "")).concat(oRs.getMetaData().getColumnLabel(i + 1).replaceAll("A", "").replaceAll("E", "").replaceAll("I", "").replaceAll("O", "").replaceAll("U", "")).concat("_PK'"));
                        if (triggerRs.next()){
                            if (triggerRs.getInt("triggers")>0){
                                autoIncrement=true;
                                autoIncrementLocated=true;
                            } else {
                                autoIncrement=false;
                            }
                        } else {
                            autoIncrement=false;
                        }

                        triggerRs.close();
                        triggerRs = null;
                    } else {
                        autoIncrement=false;
                    }
                } else {
                        autoIncrement = oRs.getMetaData().isAutoIncrement(i + 1);
                 }
                //select * from SYS.ALL_TRIGGERS where trigger_name= oRs.getMetaData().getColumnLabel(i + 1) _PK_TRG'
                
                fdCampo = new Campo(oRs.getMetaData().getColumnLabel(i + 1).toLowerCase(), dataType, autoIncrement);
                qryCampos = new StringBuilder("").append("SELECT * FROM be_campo_forma WHERE clave_forma=").append(this.claveForma).append(" AND campo='").append(fdCampo.getNombre()).append("' AND clave_perfil=").append(this.clavePerfil);
                rsFieldDictionary = oDb.getRs(qryCampos.toString());
                if (rsFieldDictionary.next()) {
                    fdCampo.setClave(rsFieldDictionary.getInt("clave_campo"));
                    fdCampo.setAlias(rsFieldDictionary.getString("alias_campo"));
                    fdCampo.setObligatorio(rsFieldDictionary.getByte("obligatorio"));
                    fdCampo.setClaveTipoControl(rsFieldDictionary.getInt("clave_tipo_control"));
                    fdCampo.setEvento(rsFieldDictionary.getString("evento"));
                    fdCampo.setClaveFormaForanea(rsFieldDictionary.getInt("clave_forma_foranea"));
                    fdCampo.setFiltroForaneo(rsFieldDictionary.getString("filtro_foraneo"));
                    fdCampo.setEditaFormaForanea(rsFieldDictionary.getByte("edita_forma_foranea"));
                    fdCampo.setNoPermitirValorForaneoNulo(rsFieldDictionary.getByte("no_permitir_valor_foraneo_nulo"));
                    fdCampo.setAyuda(rsFieldDictionary.getString("ayuda"));
                    fdCampo.setDatoSensible(rsFieldDictionary.getByte("dato_sensible"));
                    fdCampo.setActivo(rsFieldDictionary.getByte("activo"));
                    fdCampo.setTamano(rsFieldDictionary.getInt("tamano"));
                    fdCampo.setVisible(rsFieldDictionary.getByte("visible"));
                    fdCampo.setValorPredeterminado(rsFieldDictionary.getString("valor_predeterminado"));
                    fdCampo.setJustificarCambio(rsFieldDictionary.getByte("justificar_cambio"));
                    fdCampo.setUsadoParaAgrupar(rsFieldDictionary.getByte("usado_para_agrupar"));
                    fdCampo.setCargaDatoForaneosRetrasada(rsFieldDictionary.getByte("carga_dato_foraneos_retrasada"));
                    
                }
                
                rsFieldDictionary.close();
                this.campos.put(oRs.getMetaData().getColumnLabel(i + 1).toLowerCase(), fdCampo);
            }
            /* Recupera datos del qry */
            nCols = oRs.getMetaData().getColumnCount();
            setRegistros(new ArrayList<ArrayList>());
            while (oRs.next()) {
                ArrayList<Object> row = new ArrayList<Object>();
                for (int i = 0; i < nCols; i++) {
                    if (oDb.getDbType() == Conexion.DbType.ORACLE && oRs.getMetaData().getColumnTypeName(i + 1).equals("CLOB")) {
                        row.add(oRs.getString(i + 1));
                    } else {
                        row.add(oRs.getObject(i + 1));
                    }    
                }
                this.registros.add(row);
            }

            /* Cierra recordset */
            oRs.close();
        } catch (Exception e) {
            System.out.println(e.getStackTrace());
            throw new Fallo("Error al ejecutar consulta ".concat(this.sql).concat(" ").concat(e.toString()));
        } finally {
            oDb.cierraConexion();
            oDb = null;
        }
    }

    /**
     * Establece la forma con la que está asocaida la consulta
     * @param claveForma    Clave de la forma
     */
    public void setClaveForma(Integer claveForma) {
        this.claveForma = claveForma;
    }

    /**
     * Establece los registros asociados a la consulta
     * @param registros ArrayList de ArrayList de objetos
     */
    public void setRegistros(ArrayList<ArrayList> registros) {
        this.registros = registros;
    }

    /**
     * Establece la sentencia SQL de acuerdo a los parátros proporcionados:
     * @param cx                Objeto de tipo <code>mx.edu.ilce.intranet.modelo.Conexión</code> con los detalles de la base de datos
     * @param claveForma        Clave de la forma
     * @param accion            Tipo de consulta
     * @param pk                Valor de la llave primaria
     * @param w                 Clausula WHERE
     * @param reglasDeReemplazo Valores que deberán sustituirse de acuerdo al perfil de cada usuario
     * @return                  Sentencia SQL resuelta
     * @throws Fallo            si ocurre un error relacionado con la base de datos
     */
    /*public String setSQL(Conexion cx, int claveForma, String accion, String pk, String w, Usuario usuario) throws Fallo {
        String select = "";
        String where = "";
        String orderby = "";
        Conexion oDb = new Conexion(cx.getServer(), cx.getDb(), cx.getUser(), cx.getPw(), cx.getDbType());

        ResultSet oRs;
        setClaveForma(claveForma);
        setAccion(accion);
        setPk(pk);
        setW(w);

        try {
            String s = "";
            /* Recupera sql del qry */
            /*if (claveForma > 0) {
                s = "select clave_consulta,tabla, llave_primaria, consulta from "
                    + " be_consulta_forma, be_forma "
                    + " where "
                    + " be_forma.clave_forma=" + claveForma + " AND "
                    + " be_forma.clave_forma=be_consulta_forma.clave_forma AND "
                    + " be_consulta_forma.tipo_accion='" + accion + "'  AND "
                    + " be_consulta_forma.clave_perfil=%clave_perfil"
                        .replace("%clave_empleado", usuario.getClave().toString())
                        .replace("%clave_area", usuario.getClaveArea().toString())
                        .replace("%clave_perfil", usuario.getClavePerfil().toString());
            } else {
                s = "select clave_consulta, '(tabla de sistema)' as tabla, '()' as llave_primaria, consulta from "
                        + "be_consulta_forma where clave_forma=" + claveForma + " AND tipo_accion='" + accion + "'";
            }

            oRs = oDb.getRs(s);

            if (oRs == null) { // No se pudo establecer conexión
                return "";
            }

            if (!oRs.next()) {
                throw new Fallo("No hay consulta definida para la forma " + claveForma + " y acción " + accion);
            } else {
                this.claveConsulta = oRs.getInt("clave_consulta");
                select = oRs.getString("consulta");
                this.sql = select;
                this.tabla = oRs.getString("tabla");
                this.llavePrimaria = oRs.getString("llave_primaria");
            }

            oRs.close();

            if (w == null) {
                w = "";
            }

            /*SQLParser p = new SQLParser(this.sql);
            
            if (!p.isUnion) {
            if (!w.equals("")) {
            p.getSelect().setWhere(w);
            }
            this.sql=p.toString();
            }*/

            //Se busca el último from
            /*int lastPos = this.sql.toLowerCase().lastIndexOf("from");

            //Si la consulta incluye un order by, se divide la consulta en dos para incorporar el where
            if (select.toLowerCase().contains("order by")) {
                select = select.substring(0, this.sql.toLowerCase().lastIndexOf("order by"));
                orderby = "ORDER BY " + this.sql.toLowerCase().split("order by")[1];
            }

            if (select.substring(lastPos).toLowerCase().contains("where") && !w.equals("")) {
                select += " and " + w;
            } else if (!w.equals("")) {
                select += " where  " + w;
            }

            this.sql = select + " " + orderby;

            /*Reemplaza el valor de PK en la query obtenida */
            /*this.sql = this.sql.replaceAll("\\$pk", String.valueOf(getPk()));

            /*Otras reglas de reemplazo*/
            /*this.sql = aplicaReglasDeReemplazo(this.sql);

            return this.sql;

        } catch (Exception e) {
            throw new Fallo(e.toString());
        } finally {
            oDb.cierraConexion();
            oDb = null;
        }

    }*/

    /**
     * Recupera la sentencia SQL
     * @return  Sentencia SQL
     */
    public String getSQL() {
        return sql;
    }

    /**
     * Recupera el nombre del campo de la llave primaria
     * @return  Nombre del campo de la llave primaria
     */
    public String getLlavePrimaria() {
        return llavePrimaria;
    }

    /**
     * Establece el nombre del campo de la llave primaria
     * @param llavePrimaria Nombre del campo de la llave primaria
     */
    public void setLlavePrimaria(String llavePrimaria) {
        this.llavePrimaria = llavePrimaria;
    }

    /**
     * Recupera el nombre de la tabla asociada a la consulta
     * @return  Nombre de tabla
     */
    public String getTabla() {
        return tabla;
    }

    /**
     * Establece el nombre de la tabla asociada a la consulta
     * @param tabla Nombre de tabla
     */
    public void setTabla(String tabla) {
        this.tabla = tabla;
    }

    /**
     * Recupera el tipo de consulta
     * @return Tipo de consulta
     */
    public String getAccion() {
        return accion;
    }

    /**
     * Recupera campos
     * @return HashMap con campos
     */
    public LinkedHashMap<String, Campo> getCampos() {
        return campos;
    }

    /**
     * Establece campos
     * @param campos  HashMap con campos
     */
    public void setCampos(LinkedHashMap<String, Campo> campos) {
        this.campos = campos;
    }

    /**
     * Recupera la clave de la forma asociada a la consulta
     * @return Clave de la forma
     */
    public Integer getClaveForma() {
        return claveForma;
    }

    /**
     * Recupera los registros de la consulta
     * @return Registros de la consulta guardados en un  <code>ArrayList<ArrayList></code> de objetos
     */ 
    public ArrayList<ArrayList> getRegistros() {
        return registros;
    }

    /**
     * Establece registros de la consulta extrayendolos de la base de datos
     * @param cx        Objeto de tipo <code>mx.edu.ilce.intranet.modelo.Conexión</code> con los detalles de la base de datos
     * @throws Fallo    si ocurre un error relacionado con la base de datos
     */
    public void setRegistros() throws Fallo {
        int nCols = 0;
        this.registros.clear();
        ResultSet oRs;
        Conexion oDb = new Conexion (this.usuario.getCx().getServer(), this.usuario.getCx().getDb(), this.usuario.getCx().getUser(), this.usuario.getCx().getPw(), this.usuario.getCx().getDbType());

        try {
            oRs = oDb.getRs(this.sql);

            /* Recupera datos del qry */
            nCols = oRs.getMetaData().getColumnCount();
            while (oRs.next()) {
                ArrayList<Object> row = new ArrayList<Object>();
                for (int i = 0; i < nCols; i++) {
                    row.add(oRs.getObject(i + 1));
                }
                this.registros.add(row);
            }

            /* Cierra recordset */
            oRs.close();

        } catch (Exception e) {
            throw new Fallo(e.toString());
        } finally {
            oDb.cierraConexion();
            oDb = null;
        }

    }

    /**
     * Establece sentencia SQL
     * @param sql
     */
    public void setSQL(String sql) {
        this.sql = sql;
    }

    /**
     * Recupera nombre de llave primaria 
     * @return Nombre de llave primaria
     */
    public String getPk() {
        return pk;
    }

    /**
     * Establece nombre de llave primaria 
     * @param pk Nombre de llave primaria
     */
    public void setPk(String pk) {
        this.pk = pk;
    }

    /**
     * Recupera clausula WHERE de la sentencia asociada a la consulta
     * @return Cláusula WHERE 
     */
    public String getW() {
        return w;
    }

    /**
     * Establece clausula WHERE de la sentencia asociada a la consulta
     * @param w Cláusula WHERE 
     */
    public void setW(String w) {
        this.w = w;
    }

    /**
     * Recupera límite de registros o tamaño de página
     * @return Límite de registros
     */
    public int getLimiteDeRegistros() {
        return limiteDeRegistros;
    }

    /**
     * Establece límite de registros o tamaño de página
     * @param limiteDeRegistros Límite de registros
     */
    public void setLimiteDeRegistros(int limiteDeRegistros) {
        this.limiteDeRegistros = limiteDeRegistros;
    }

    /**
     * Recupera número de página a extraer
     * @return Número de página a extraer
     */
    public int getPagina() {
        return pagina;
    }

    /**
     * Establece número de página a extraer
     * @param pagina Número de página a extraer
     */
    public void setPagina(int pagina) {
        this.pagina = pagina;
    }

    /**
     * Recupera columna de ordenamiento de la consulta
     * @return Nombre de campo
     */
    public String getIdx() {
        return idx;
    }

    /**
     * Establece columna de ordenamiento de la consulta 
     * @param idx Nombre de campo
     */
    public void setIdx(String idx) {
        this.idx = idx;
    }

    /**
     * Recupera tipo de ordenamiento de la consulta: ASC (ascendente) o DESC (descendente)
     * @return  Tipo de ordenamiento
     */
    public String getOrdx() {
        return ordx;
    }

    /**
     * Establece tipo de ordenamiento de la consulta: ASC (ascendente) o DESC (descendente)
     * @param ordx Tipo de ordenamiento
     */
    public void setOrdx(String ordx) {
        this.ordx = ordx;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    /**
     * Recupera número de registros que contiene la consulta
     * @return Número de registros
     */
    public int getNumeroDeRegistros() {
        return numeroDeRegistros;
    }

    /**
     * Establece número de registros que contiene la consulta
     * @param numeroDeRegistros Número de registros
     */
    public void setNumeroDeRegistros(int numeroDeRegistros) {
        this.numeroDeRegistros = numeroDeRegistros;
    }

    /**
     * Constructor sin parámetros
     */
    public Consulta() {
    }

    /**
     * Ejecuta <code>INSERT</code> relacionado con la consulta, previamente deben haber sido llenados y validados los campos, 
     * cuenta con la opción para no ejecutar la sentencia sino solo generarla y devolverla, en caso de que se ejecute, también 
     * se registra la operación en la bitácora
     * @param claveEmpleado Clave del empleado que efectua el INSERT
     * @param ip            Dirección IP del empleado que efectua el INSERT
     * @param browser       Navegador con el que se efectua el INSERT
     * @param forma         Clave de la forma asociada a la consulta
     * @param cx            Objeto de tipo <code>mx.edu.ilce.intranet.modelo.Conexión</code> con los detalles de la base de datos
     * @param ejecuta       Bandera que indica si se deberá ejecutar la sentencia o solo se regresará el código del INSERT
     * @return              Codigo XML con la sentencia SQL de la operación efectuada; en caso de que se ejecuté también devolverá la llave primaria, así como la descripción de errores y warnings
     * @throws Fallo        si ocurre un error relacionado a la base de datos
     */
    public String insert(boolean ejecuta) throws Fallo {

        ResultSet oRs;
        Integer claveRegistro;
        StringBuilder resultadoXML = new StringBuilder("<insert><![CDATA[");
        StringBuilder s = new StringBuilder("INSERT INTO ").append(this.tabla).append(" (");
        StringBuilder sValues = new StringBuilder("VALUES(");
        Conexion oDb = new Conexion (this.usuario.getCx().getServer(), this.usuario.getCx().getDb(), this.usuario.getCx().getUser(), this.usuario.getCx().getPw(), this.usuario.getCx().getDbType());
        Calendar calendario = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");
        
        int i = 0;
        Set set = this.campos.entrySet();
        Iterator it = set.iterator();
        
        while(it.hasNext()) {
            Map.Entry me = (Map.Entry)it.next();
            Campo campo= (Campo) me.getValue();
            
            if (campo.isAutoIncrement() || campo.valor == null) {
                i++;
                continue;
            }

            s.append(campo.nombre);

            if (campo.tipoDato.toLowerCase().equals("varchar")
                    || campo.tipoDato.toLowerCase().equals("text")) {
                if (campo.valor.equals("")) {
                    sValues.append("null");
                } else {
                    sValues.append("'").append(campo.valor.toString().replace("'", "''")).append("'");
                }
            } else if (campo.tipoDato.toLowerCase().equals("smalldatetime") || campo.tipoDato.toLowerCase().equals("date")) {
                if (campo.valor.equals("")) {
                    sValues.append("null");
                } else if(campo.valor.toLowerCase().equals("%ahora")) {
                    if  (oDb.getDbType() == Conexion.DbType.ORACLE) {
                        sValues.append("(SELECT SYSDATE FROM DUAL)");
                    } else if (oDb.getDbType() == Conexion.DbType.MSSQL) {
                        sValues.append("GETDATE()");
                    } else if (oDb.getDbType() == Conexion.DbType.MYSQL) {
                        sValues.append("CURDATE()");
                    }
                }
                else {
                    String[] fecha = campo.valor.toString().split("/");
                    
                    if  (oDb.getDbType() == Conexion.DbType.ORACLE) {
                        sValues.append("TO_DATE('").append(fecha[2].concat("/").concat(fecha[1]).concat("/").concat(fecha[0])).append("','YYYY/MM/DD')");    
                    } else {
                        sValues.append("'").append(fecha[2].concat("/").concat(fecha[1]).concat("/").concat(fecha[0])).append("'");
                    }

                }
            } else if ( campo.tipoDato.toLowerCase().equals("datetime")) {
                if (campo.valor.equals("")) {
                    sValues.append("null");
                } else if(campo.valor.toLowerCase().equals("%ahora")) {
                    if  (oDb.getDbType() == Conexion.DbType.ORACLE) {
                        sValues.append("(SELECT SYSDATE FROM DUAL)");
                    } else if (oDb.getDbType() == Conexion.DbType.MSSQL) {
                        sValues.append("GETDATE()");
                    } else if (oDb.getDbType() == Conexion.DbType.MYSQL) {
                        sValues.append("CONCAT(CURRENT_DATE(),' ',CURRENT_TIME())");
                    }
                } else {
                    String[] fechayhora = campo.valor.toString().split(" ");
                    String[] fecha =fechayhora[0].split("/");
                    
                    if (fechayhora.length==1) {
                        sValues.append("'").append(fecha[2].concat("/").concat(fecha[1]).concat("/").concat(fecha[0])).append(" 00:00").append("'");
                    }
                    else if (fechayhora.length==2) {
                        sValues.append("'").append(fecha[2].concat("/").concat(fecha[1]).concat("/").concat(fecha[0])).append(" ").append(fechayhora[1]).append("'");
                    }        
                }                
            } else {
                if (campo.valor.equals("")) {
                    sValues.append("null");
                } else {
                    sValues.append(campo.valor);
                }
            }

            if (i < this.campos.size() - 1) {
                s.append(",");
                sValues.append(",");
            } else {
                s.append(")");
                sValues.append(")");
            }

            i++;            
        }

        if (s.substring(s.length() - 1).equals(",")) {
            s.deleteCharAt(s.length() - 1);
            s.append(")");
        }

        if (sValues.substring(sValues.length() - 1).equals(",")) {
            sValues.deleteCharAt(sValues.length() - 1);
            sValues.append(")");
        }

        s.append(sValues);
        
        if (!ejecuta) {
            return s.toString(); 
        }
        
        resultadoXML.append(s).append("]]></insert>");

        try {

            if (oDb.getDbType() == Conexion.DbType.MSSQL) {
                oDb.execute("SET DATEFORMAT YMD");
            }

            oRs = oDb.execute(s.toString());
            if (oRs != null) {

                if (oRs.next()) {
                    claveRegistro = oRs.getInt(1);
                    resultadoXML.append("<pk>").append(claveRegistro).append("</pk>");
                    this.pk = claveRegistro.toString();
                    
                    //Que la clave forma esté en nulo significa que se está insertando la forma
                    if (this.getClaveForma() == null)
                        this.setClaveForma(claveRegistro);
                    
                    //Inserta en bitácora
                    if (usuario.getCx().getDbType() == Conexion.DbType.MYSQL) {
                        oDb.execute("INSERT INTO be_bitacora (clave_empleado,fecha,clave_tipo_evento,ip,navegador,clave_forma,clave_registro) "
                                + "VALUES(" + this.usuario.getClave() + ", CONCAT(CURRENT_DATE(),' ',CURRENT_TIME()),2,'" + this.usuario.getIp() + "','" + this.usuario.getNavegador() + "','" + this.getClaveForma() + "','" + claveRegistro + "')");
                    } else if (this.usuario.getCx().getDbType() == Conexion.DbType.MSSQL) {
                        oDb.execute("INSERT INTO be_bitacora (clave_empleado,fecha,clave_tipo_evento,ip,navegador,clave_forma,clave_registro) "
                                + "VALUES(" + this.usuario.getClave() + ",GETDATE(),2,'" + this.usuario.getIp() + "','" + this.usuario.getNavegador() + "','" + this.getClaveForma() + "','" + claveRegistro + "')");
                    } else if (this.usuario.getCx().getDbType() == Conexion.DbType.ORACLE) {
                        oDb.execute("INSERT INTO be_bitacora (clave_empleado,fecha,clave_tipo_evento,ip,navegador,clave_forma,clave_registro) "
                        + "VALUES(" + this.usuario.getClave() + ",(SELECT CURRENT_DATE  FROM dual),3,'" + this.usuario.getIp() + "','" + this.usuario.getNavegador() + "','" + this.getClaveForma() + "','" + pk + "')");                
                    }                 

                } else {
                    throw new Fallo("Error al recuperar clave de bitacora");
                }

            }


        } catch (Exception e) {
            if (e.getMessage().contains("Duplicate entry")) {
                resultadoXML.append("<error><![CDATA[").append("Registro duplicado").append("]]></error>");
            } else {
                resultadoXML.append("<error><![CDATA[").append(e.toString()).append("]]></error>");
            }            
            throw new Fallo(e.toString());
        } finally {

            oDb.cierraConexion();
            oDb = null;
            return resultadoXML.toString();
        }
    }

    /**
     * Ejecuta <code>UPDATE</code> relacionado con la consulta, previamente deben haber sido llenados y validados los campos
     * cuenta con la opción para no ejecutar la sentencia sino solo generarla y devolverla, en caso de que se ejecute, también 
     * se registra la operación así como el detalle de los cambios en la bitácora
     * @param claveEmpleado Clave del empleado que efectua el UPDATE
     * @param ip            Dirección IP del empleado que efectua el UPDATE
     * @param browser       Navegador con el que se efectua el UPDATE
     * @param forma         Clave de la forma asociada a la consulta
     * @param cx            Objeto de tipo <code>mx.edu.ilce.intranet.modelo.Conexión</code> con los detalles de la base de datos
     * @param ejecuta       Bandera que indica si se deberá ejecutar la sentencia o solo se regresará el código del UPDATE
     * @return              Codigo XML con la sentencia SQL de la operación efectuada; en caso de que se ejecuté también devolverá la llave primaria, así como la descripción de errores y warnings
     * @throws Fallo        si ocurre un error relacionado a la base de datos

     */
    public String update(boolean ejecuta) throws Fallo {
        ResultSet oRs;
        int claveBitacora;
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        Conexion oDb = new Conexion (this.usuario.getCx().getServer(), this.usuario.getCx().getDb(), this.usuario.getCx().getUser(), this.usuario.getCx().getPw(), this.usuario.getCx().getDbType());
        StringBuilder resultadoXML = new StringBuilder("<update><![CDATA[");
        StringBuilder s = new StringBuilder("UPDATE ").append(this.tabla).append(" SET ");
        int i = 0;
        Set set = this.campos.entrySet();
        Iterator it = set.iterator();
        
        while(it.hasNext()) {
            Map.Entry me = (Map.Entry)it.next();
            Campo campo= (Campo) me.getValue();
            
            if (campo.isAutoIncrement() || campo.valor == null) {
                i++;
                continue;
            }

            s.append(campo.nombre);

            if (campo.tipoDato.toLowerCase().equals("varchar")
                    || campo.tipoDato.toLowerCase().equals("text")
                    || campo.tipoDato.toLowerCase().equals("char")) {
                if (campo.valor.equals("")) {
                    s.append("=null");
                } else {
                    s.append("='").append(campo.valor.toString().replaceAll("'", "''")).append("'");
                }
            } else if (campo.tipoDato.toLowerCase().equals("smalldatetime") || campo.tipoDato.toLowerCase().equals("date")) {
                if (campo.valor.equals("")) {
                    s.append("=null");
                } else if(campo.valor.toLowerCase().equals("%ahora")) {
                    if  (oDb.getDbType() == Conexion.DbType.ORACLE) {
                        s.append("=(SELECT SYSDATE FROM DUAL)");
                    } else if (oDb.getDbType() == Conexion.DbType.MSSQL) {
                        s.append("=GETDATE()");
                    } else if (oDb.getDbType() == Conexion.DbType.MYSQL) {
                        s.append("=CURDATE()");
                    }
                } else {
                    String[] fecha = campo.valor.toString().split("/");
                    
                    if  (oDb.getDbType() == Conexion.DbType.ORACLE) {
                        s.append("=TO_DATE('").append(fecha[2].concat("/").concat(fecha[1]).concat("/").concat(fecha[0])).append("','YYYY/MM/DD')");    
                    } else {
                        s.append("='").append(fecha[2].concat("/").concat(fecha[1]).concat("/").concat(fecha[0])).append("'");
                    }
                    
                }
            } else if ( campo.tipoDato.toLowerCase().equals("datetime")) {
                if (campo.valor.equals("")) {
                    s.append("=null");
                } else if(campo.valor.toLowerCase().equals("%ahora")) {
                    if  (oDb.getDbType() == Conexion.DbType.ORACLE) {
                        s.append("=(SELECT SYSDATE FROM DUAL)");
                    } else if (oDb.getDbType() == Conexion.DbType.MSSQL) {
                        s.append("=GETDATE()");
                    } else if (oDb.getDbType() == Conexion.DbType.MYSQL) {
                        s.append("=CONCAT(CURRENT_DATE(),' ',CURRENT_TIME())");
                    }
                } else {
                    String[] fechayhora = campo.valor.toString().split(" ");
                    String[] fecha =fechayhora[0].split("/");
                    s.append("='").append(fecha[2].concat("/").concat(fecha[1]).concat("/").concat(fecha[0])).append(" ").append(fechayhora[1]).append("'");
                }                
            } else {
                if (campo.valor.equals("")) {
                    s.append("=null");
                } else {
                    s.append("=").append(campo.valor);
                }
            }

            if (i < this.campos.size() - 1) {
                s.append(",");
            }

            i++;
        }

        if (s.substring(s.length() - 1).equals(",")) {
            s.deleteCharAt(s.length() - 1);
        }

        s.append(" WHERE ").append(this.llavePrimaria).append("=").append(this.pk);

        if (!ejecuta) {
            return s.toString(); 
        }
        
        resultadoXML.append(s).append("]]></update>");
        
        try {

            if (oDb.getDbType() == Conexion.DbType.MSSQL) {
                oDb.execute("SET DATEFORMAT YMD");
            }
            oDb.execute(s.toString());
            resultadoXML.append("<pk>").append(this.pk).append("</pk>");
            String t = "";
            //Inserta en bitácora
            if (usuario.getCx().getDbType() == Conexion.DbType.MYSQL) {
                t = "INSERT INTO be_bitacora (clave_empleado,fecha,clave_tipo_evento,ip,navegador,clave_forma,clave_registro) "
                        + "VALUES(" + this.usuario.getClave() + ",CONCAT(CURRENT_DATE(),' ',CURRENT_TIME()),3,'" + this.usuario.getIp() + "','" +  this.usuario.getNavegador() + "','"  + this.claveForma + "','" + pk + "')";

            } else if (this.usuario.getCx().getDbType() == Conexion.DbType.MSSQL) {
                t = "INSERT INTO be_bitacora (clave_empleado,fecha,clave_tipo_evento,ip,navegador,clave_forma,clave_registro) "
                        + "VALUES(" + this.usuario.getClave() + ",GETDATE(),3,'" + this.usuario.getIp() + "','" + this.usuario.getNavegador() + "','" + this.getClaveForma() + "','" + pk + "')";
            } else if (usuario.getCx().getDbType() == Conexion.DbType.ORACLE) {
                t = "INSERT INTO be_bitacora (clave_empleado,fecha,clave_tipo_evento,ip,navegador,clave_forma,clave_registro) "
                        + "VALUES(" + this.usuario.getClave() + ",(SELECT CURRENT_DATE  FROM dual),3,'" + this.usuario.getIp() + "','" + this.usuario.getNavegador() + "','" + this.claveForma + "','" + pk + "')";                
            }
            
            claveBitacora=0;
            oRs = oDb.execute(t);
            if (oRs.next()) {
                claveBitacora = oRs.getInt(1); 
                resultadoXML.append("<bitacora>").append(claveBitacora).append("</bitacora>");

                //Inserta detalles de la bitácora
                set = this.campos.entrySet();
                it = set.iterator();

                while(it.hasNext()) {
                    Map.Entry me = (Map.Entry)it.next();
                    Campo campo= (Campo) me.getValue();
                    if (campo.isAutoIncrement() || campo.valor == null) {
                        continue;
                    }

                    boolean sonRealmenteValoresDiferentes = false;

                    if (campo.valorOriginal == null && (campo.valor != null && !campo.valor.equals(""))) {
                        sonRealmenteValoresDiferentes = true;
                    } else if (campo.valorOriginal != null && campo.valor == null) {
                        sonRealmenteValoresDiferentes = true;
                    } else if (!(campo.valor.equals("") && campo.valorOriginal == null)) {
                        // Se hace la comparación de acuerdo al tipo del campo
                        if ((campo.tipoDato.toLowerCase().equals("text") || campo.tipoDato.toLowerCase().equals("varchar")) && !campo.valor.equals(campo.valorOriginal)) {
                            sonRealmenteValoresDiferentes = true;
                        } else if (campo.tipoDato.toLowerCase().equals("int")) {
                            if (!campo.valor.equals(campo.valorOriginal) && (campo.valor.equals("") || campo.valorOriginal.equals("") )) {
                                sonRealmenteValoresDiferentes = true;
                            }else if (Integer.parseInt(campo.valor.toString()) != Integer.parseInt(campo.valorOriginal.toString())) {
                                sonRealmenteValoresDiferentes = true;
                            }
                        } else if (campo.tipoDato.toLowerCase().equals("bit") || campo.tipoDato.toLowerCase().equals("tinyint")) {
                            if (Boolean.parseBoolean(campo.valor) != Boolean.parseBoolean(campo.valorOriginal)) {
                                sonRealmenteValoresDiferentes = true;
                            }
                        } else if (campo.tipoDato.toLowerCase().equals("datetime")) {
                            String hora = campo.valor.split(" ")[1];
                            String fecha = campo.valor.split(" ")[0];
                            if (!new java.util.Date(fecha.split("/")[2].concat("/").concat(fecha.split("/")[1]).concat("/").concat(fecha.split("/")[0])).equals(new java.util.Date(campo.valorOriginal.substring(0, 10).replaceAll("-", "/")))) {
                                sonRealmenteValoresDiferentes = true;
                            }
                        } else if (campo.tipoDato.toLowerCase().equals("smalldatetime")) {
                            if (!new java.util.Date(campo.valor.split("/")[2].concat("/").concat(campo.valor.split("/")[1]).concat("/").concat(campo.valor.split("/")[0])).equals(new java.util.Date(campo.valorOriginal.substring(0, 10).replaceAll("-", "/")))) {
                                sonRealmenteValoresDiferentes = true;
                            }
                        } else if ((campo.tipoDato.toLowerCase().equals("money") || campo.tipoDato.toLowerCase().equals("float"))) {
                            if (Float.parseFloat(campo.valor) != Float.parseFloat(campo.valorOriginal)) {
                                sonRealmenteValoresDiferentes = true;
                            }
                        }
                    }

                    if (sonRealmenteValoresDiferentes) {
                        s = new StringBuilder("INSERT INTO be_bitacora_detalle (clave_bitacora, campo, valor_anterior, valor_actual) VALUES(").append(claveBitacora).append(",'").append(campo.getNombre()).append("',"); 
                        if (campo.valorOriginal == null) 
                            s.append("null,");
                        else 
                            s.append("'").append(campo.valorOriginal.toString().replaceAll("'", "''")).append("',");
                        
                        if (campo.valor == null)
                            s.append("null)");
                        else 
                            s.append("'").append(campo.valor.toString().replaceAll("'", "''")).append("')");
                        
                        oDb.execute(s.toString());
                    }
                }
            }
        } catch (Exception e) {
            resultadoXML.append("<error><![CDATA[").append(e.toString()).append("]]></error>"); 
            throw new Fallo(e.toString());
        } finally {
            oDb.cierraConexion();
            oDb = null;
            return resultadoXML.toString();
        }
    }

    /**
     * Ejecuta <code>DELETE</code> relacionado con la consulta
     * cuenta con la opción para no ejecutar la sentencia sino solo generarla y devolverla, en caso de que se ejecute, también 
     * se registra la operación en la bitácora
     * @param claveEmpleado Clave del empleado que efectua el DELETE
     * @param ip            Dirección IP del empleado que efectua el DELETE
     * @param browser       Navegador con el que se efectua el DELETE
     * @param forma         Clave de la forma asociada a la consulta
     * @param usuario.getCx().           Objeto de tipo <code>mx.edu.ilce.intranet.modelo.Conexión</code> con los detalles de la base de datos
     * @param ejecuta       Bandera que indica si se deberá ejecutar la sentencia o solo se regresará el código del DELETE
     * @return              Codigo XML con la sentencia SQL de la operación efectuada; en caso de que se ejecuté también devolverá la llave primaria, así como la descripción de errores y warnings
     * @throws Fallo        si ocurre un error relacionado a la base de datos
     */
    public String delete(boolean ejecuta) throws Fallo {
        Conexion oDb = new Conexion (this.usuario.getCx().getServer(), this.usuario.getCx().getDb(), this.usuario.getCx().getUser(), this.usuario.getCx().getPw(), this.usuario.getCx().getDbType());
        StringBuffer s = new StringBuffer("DELETE FROM ").append(this.tabla).append(" WHERE ").append(this.llavePrimaria).append("=").append(this.pk);
        StringBuffer resultadoXML = new StringBuffer("<delete><![CDATA[").append(s).append("]]></delete>");

        try {
            
            if (!ejecuta) {
                return s.toString(); 
            }
                    
            oDb.execute(s.toString());

            //Inserta en bitácora
            if (usuario.getCx().getDbType() == Conexion.DbType.MYSQL) {
                oDb.execute("INSERT INTO be_bitacora (clave_empleado,fecha,clave_tipo_evento,ip,navegador,clave_forma,clave_registro) "
                        + "VALUES(" + this.usuario.getClave() + ",CONCAT(CURRENT_DATE(),' ',CURRENT_TIME()),4,'" + this.usuario.getIp() + "','" + this.usuario.getNavegador() + "','" + this.getClaveForma() + "','" + pk + "')");

            } else if (usuario.getCx().getDbType() == Conexion.DbType.MSSQL) {
                oDb.execute("INSERT INTO be_bitacora (clave_empleado,fecha,clave_tipo_evento,ip,navegador,clave_forma,clave_registro) "
                        + "VALUES(" + this.usuario.getClave() + ",GETDATE(),4,'" + this.usuario.getIp() + "','" + this.usuario.getNavegador() + "','" + this.getClaveForma() + "','" + pk + "')");
            }

        } catch (Exception e) {
            resultadoXML.append("<error><![CDATA[").append(e.toString()).append("]]></error>");
            throw new Fallo(e.toString());
        } finally {
            oDb.cierraConexion();
            return resultadoXML.toString();
        }

    }
    
    /**
     * Duplica el registro de la consulta
     * @param claveEmpleado Clave el empleado que relaiza la duplicación
     * @param ip            Dirección IP del empleado que efectua el UPDATE
     * @param browser       Navegador con el que se efectua el DELETE
     * @param forma         Clave de la forma asociada a la consulta
     * @param usuario.getCx().           Objeto de tipo <code>mx.edu.ilce.intranet.modelo.Conexión</code> con los detalles de la base de datos
     * @return              Código XML con sentencias ejecutadas en la operación, si ocurren error se incluyen
     * @throws Fallo        si ocurre un error relacionado a la base de datos
     */
    public String duplicate() throws Fallo {
        throw new Fallo("Por implementar");
        //Conexion oDb = new Conexion(usuario.getCx().getServer(), usuario.getCx().getDb(), usuario.getCx().getUser(), usuario.getCx().getPw(), usuario.getCx().getDbType());
        
        //Se requiere tomar el insert y manipularlo conforme a los campos de su diccionario de datos
        
        /*StringBuffer resultadoXML = new StringBuffer("<duplicate><![CDATA[").append(s).append("]]></duplicate>");
        try {
            oDb.execute(s.toString());
        } catch (Exception e) {
            resultadoXML.append("<error><![CDATA[").append(e.toString()).append("]]></error>");
            throw new Fallo(e.toString());
        } finally {
            oDb.cierraConexion();
            return resultadoXML.toString();
        }*/

    };

    /**
     * Constructor con parámetros
     * @param claveForma        Clave de la forma asociada a la consulta
     * @param accion            Tipo de consulta, puede ser SELECT, INSERT, UPDATE, LOG
     * @param pk                Campo de llave primaria
     * @param w                 Cláusula WHERE de la consulta
     * @param reglasDeReemplazo Valores que deberán sustituirse de acuerdo al perfil de cada usuario
     * @param usuario.getCx().  Objeto de tipo <code>mx.edu.ilce.intranet.modelo.Conexión</code> con los detalles de la base de datos
     * @throws Fallo            si ocurre un error relacionado a la base de datos
     */
    public Consulta(int claveForma, String accion, String pk, String w, Usuario usuario) throws Fallo {

        Conexion oDb = new Conexion (usuario.getCx().getServer(), usuario.getCx().getDb(), usuario.getCx().getUser(), usuario.getCx().getPw(), usuario.getCx().getDbType());

        this.claveForma = claveForma;
        this.accion = accion;
        this.clavePerfil = usuario.getClavePerfil();
        this.pk=pk;
        this.w = w;
        this.usuario= usuario;
        
        String select = "";
        String where = "";
        String orderby = "";

        ResultSet oRs;
        try {
            String s = "";
            /* Recupera sql del qry */
            if (claveForma > 0) {
                s = "select clave_aplicacion, clave_consulta,tabla, llave_primaria, consulta from "
                    + " be_consulta_forma, be_forma "
                    + " where "
                    + " be_forma.clave_forma=" + claveForma + " AND "
                    + " be_forma.clave_forma=be_consulta_forma.clave_forma AND "
                    + " be_consulta_forma.tipo_accion='" + accion + "'  AND "
                    + " be_consulta_forma.clave_perfil=" + this.clavePerfil.toString();
            } else {
                s = "select clave_consulta, 0 as clave_aplicacion, '(tabla de sistema)' as tabla, '()' as llave_primaria, consulta from "
                        + "be_consulta_forma where clave_forma=" + claveForma + " AND tipo_accion='" + accion + "'";
            }

            oRs = oDb.getRs(s);

            if (oRs == null) { // No se pudo establecer conexión
                throw new Fallo("Error al establecer conexión con la base de datos; forma " + claveForma + " y acción " + accion);
            }

            if (!oRs.next()) {
                throw new Fallo("No hay consulta definida para la forma " + claveForma + " y acción " + accion);
            } else { 
                this.claveConsulta = oRs.getInt("clave_consulta");
                this.claveAplicacion = oRs.getInt("clave_aplicacion");
                select = oRs.getString("consulta");
                this.sql = select;
                this.tabla = oRs.getString("tabla");
                this.llavePrimaria = oRs.getString("llave_primaria");
            }

            oRs.close();

            if (w == null) {
                w = "";
            }

            //Se busca el último from
            int lastPos = this.sql.toLowerCase().lastIndexOf("from");

            //Si la consulta incluye un order by, se divide la consulta en dos para incorporar el where
            if (select.toLowerCase().contains("order by")) {
                select = select.substring(0, this.sql.toLowerCase().lastIndexOf("order by"));
                orderby = "ORDER BY " + this.sql.toLowerCase().split("order by")[1];
            }

            if (select.substring(lastPos).toLowerCase().contains("where") && !w.equals("")) {
                select += " and " + w;
            } else if (!w.equals("")) {
                select += " where  " + w;
            }
            
            /*Se aplican reglas de reemplazo*/
            this.sql = select.concat(" ").concat(orderby).replace("%clave_empleado", this.usuario.getClave().toString())
                               .replace("%clave_area", this.usuario.getClaveArea().toString())
                               .replace("%clave_perfil", this.usuario.getClavePerfil().toString())
                               .replaceAll("\\$pk", String.valueOf(getPk()));
            this.setCampos();
         
        } catch (Exception e) {
            throw new Fallo(e.toString());
        } finally {
            oDb.cierraConexion();
            oDb = null;
        }
    }

    /**
     * Constructor con parámetros considerando paginación de resultados
     * @param claveForma        Clave de la forma asociada a la consulta            
     * @param accion            Tipo de consulta, puede ser SELECT, INSERT, UPDATE, LOG
     * @param pk                Campo de llave primaria
     * @param w                 Cláusula WHERE de la consulta
     * @param reglasDeReemplazo Valores que deberán sustituirse de acuerdo al perfil de cada usuario
     * @param registros         Tamaño de registros en página
     * @param pagina            Número de página a entregar
     * @param sidx              Campo usado para ordenamiento
     * @param sord              Tipo de ordenamiento, puede ser ASC (ascendente) o DESC (descendente)
     * @param usuario.getCx().               Objeto de tipo <code>mx.edu.ilce.intranet.modelo.Conexión</code> con los detalles de la base de datos
     * @throws Fallo            si ocurre un error relacionado a la base de datos
     */
    public Consulta(int claveForma, String accion, String pk, String w, Usuario usuario, Integer registros, Integer pagina, String sidx, String sord) throws Fallo {
        String s = "";
        StringBuilder tmp = new StringBuilder("");
        StringTokenizer tokens;
        String token;
        Conexion oDb = new Conexion(usuario.getCx().getServer(), usuario.getCx().getDb(), usuario.getCx().getUser(), usuario.getCx().getPw(), usuario.getCx().getDbType());
        ResultSet oRs;

        try {
            this.claveForma = claveForma;
            this.accion = accion;
            this.clavePerfil = usuario.getClavePerfil();
            this.pk=pk;
            this.w = w;
            this.usuario = usuario;
            
            this.idx = sidx;
            this.ordx = sord;
            this.pagina = pagina;
            this.limiteDeRegistros = registros;

            String select = "";
            String where = "";
            String orderby = "";
            
            /* Recupera sql del qry */
            if (claveForma > 0) {
                s = "select clave_consulta,tabla, llave_primaria, consulta from "
                    + " be_consulta_forma, be_forma "
                    + " where "
                    + " be_forma.clave_forma=" + claveForma + " AND "
                    + " be_forma.clave_forma=be_consulta_forma.clave_forma AND "
                    + " be_consulta_forma.tipo_accion='" + accion + "'  AND "
                    + " be_consulta_forma.clave_perfil=%clave_perfil"
                        .replace("%clave_perfil", this.usuario.getClavePerfil().toString());
            } else {
                s = "select clave_consulta, '(tabla de sistema)' as tabla, '()' as llave_primaria, consulta from "
                        + "be_consulta_forma where clave_forma=" + claveForma + " AND tipo_accion='" + accion + "'";
            }

            oRs = oDb.getRs(s);

            if (oRs == null) { // No se pudo establecer conexión
                throw new Fallo("Error al establecer conexión con la base de datos; forma " + claveForma + " y acción " + accion);
            }

            if (!oRs.next()) {
                throw new Fallo("No hay consulta definida para la forma " + claveForma + " y acción " + accion);
            } else {
                this.claveConsulta = oRs.getInt("clave_consulta");
                select = oRs.getString("consulta");
                this.sql = select;
                this.tabla = oRs.getString("tabla");
                this.llavePrimaria = oRs.getString("llave_primaria");
            }

            oRs.close();

            if (w == null) {
                w = "";
            }

            //Se busca el último from
            int lastPos = this.sql.toLowerCase().lastIndexOf("from");

            //Si la consulta incluye un order by, se divide la consulta en dos para incorporar el where
            if (select.toLowerCase().contains("order by")) {
                select = select.substring(0, this.sql.toLowerCase().lastIndexOf("order by"));
                orderby = "ORDER BY " + this.sql.toLowerCase().split("order by")[1];
            }

            if (select.substring(lastPos).toLowerCase().contains("where") && !w.equals("")) {
                select += " and " + w;
            } else if (!w.equals("")) {
                select += " where  " + w;
            }
            
            /*Se aplican reglas de reemplazo*/
            this.sql = select.concat(" ").concat(orderby).replace("%clave_empleado", this.usuario.getClave().toString())
                               .replace("%clave_area", this.usuario.getClaveArea().toString())
                               .replace("%clave_perfil", this.usuario.getClavePerfil().toString())
                               .replaceAll("\\$pk", String.valueOf(getPk()));
            s = this.sql;
            //Calcula el número de registros de la consulta
            //Es necesario verificar si en la consulta que contiene el último from se trata de una subconsulta
            int ultimoParentesisAbierto=s.toLowerCase().lastIndexOf("(");
            int ultimoParentesisCerrado=s.toLowerCase().lastIndexOf(")");
            int ultimoFrom = s.toLowerCase().lastIndexOf("from");
            
            if (ultimoParentesisAbierto<ultimoFrom && ultimoParentesisCerrado>ultimoFrom  ) {
                ultimoFrom = s.toLowerCase().substring(0,ultimoParentesisAbierto).lastIndexOf("from");
            }
            
            String sCount;
            if (s.toUpperCase().contains("ORDER BY")) {
                sCount = "SELECT COUNT(*) as conteo ".concat(s.substring(ultimoFrom, s.toUpperCase().lastIndexOf("ORDER BY") - 1));    
            } else {
                sCount = "SELECT COUNT(*) as conteo ".concat(s.substring(ultimoFrom, s.length()));    
            }
            
            oRs = oDb.getRs(sCount);
            if (oRs.next()) {
                this.numeroDeRegistros = oRs.getInt("conteo");
            } else {
                this.numeroDeRegistros = 0;
            }

            oRs.close();
            oRs = null;

            if (!sidx.equals("")) {
                int ultimoOrderBy = s.toUpperCase().lastIndexOf("ORDER BY");
                int ultimoHaving = s.toUpperCase().lastIndexOf("HAVING");
                if (ultimoOrderBy > -1 && ultimoHaving > -1) {
                    String beforeOrderBy = s.substring(ultimoOrderBy - 1);
                    String OrderBy = s.substring(ultimoOrderBy, ultimoHaving - 1).toLowerCase().replace(" asc", "").replace(" desc", "");
                    String afterOrderBy = s.substring(ultimoHaving);
                    s = beforeOrderBy.concat(OrderBy).concat(",").concat(sord).concat(afterOrderBy);
                } else if (ultimoOrderBy > -1) {
                    String beforeOrderBy = s.substring(0, ultimoOrderBy - 1);
                    s = beforeOrderBy.concat(" ORDER BY ").concat(sidx).concat(" ").concat(sord);
                } else {
                    s = s.concat(" ORDER BY ").concat(sidx).concat(" ").concat(sord);
                }
            }
            //Este procedimiento incorpora paginación
            if (oDb.getDbType() == Conexion.DbType.MYSQL) {
                s = s.concat(" LIMIT ").concat(String.valueOf(limiteDeRegistros * (pagina - 1)).concat(",").concat(String.valueOf(limiteDeRegistros)));
            } else if (oDb.getDbType() == Conexion.DbType.MSSQL) {
                //Primer select
                s = "SELECT ".concat(" * FROM (").concat(s.substring(0, ultimoFrom - 1)).concat(",ROW_NUMBER() OVER ( ORDER BY ").concat(this.llavePrimaria).concat(") as numeroDeRegistro ").concat(s.substring(ultimoFrom, s.length())).concat(") AS a WHERE numeroDeRegistro BETWEEN ").concat(String.valueOf(limiteDeRegistros * (pagina - 1) + 1)).concat(" AND ").concat(String.valueOf(limiteDeRegistros * pagina));
            } else if (oDb.getDbType() == Conexion.DbType.ORACLE) {
                //Primer select
                //Si después del último from no hay un where, se debe agregar 
                int ultimoWhere = s.substring(ultimoFrom).toUpperCase().lastIndexOf("WHERE");
                if ( ultimoWhere > -1) {
                    s = s.concat(" AND rownum>=").concat(String.valueOf(limiteDeRegistros * (pagina - 1))).concat(" AND rownum<=").concat(String.valueOf(limiteDeRegistros * (pagina - 1)+ limiteDeRegistros));
                } else {
                    s = s.concat(" WHERE rownum>=").concat(String.valueOf(limiteDeRegistros * (pagina - 1))).concat(" AND rownum<=").concat(String.valueOf(limiteDeRegistros * (pagina - 1)+ limiteDeRegistros));
                }
            }

            this.sql=s;
            this.setCampos();

        } catch (Exception e) {
            throw new Fallo(e.toString());
        } finally {
            oDb.cierraConexion();
            oDb = null;
        }
    }
    
    public Object clone() {
        Object object = null;
        try {
            object = this;
            
        } catch(Exception e) {
            System.out.println("Error al clonar consulta");
        }
        return object;
    }
    
    /**
     * Código de pruebas
     * @param args
     */
    public static void main(String args[]) {

        Consulta configuracion;
        try {
            Conexion cx = new Conexion();
            Usuario u = new Usuario();
            u.setCx(cx);
            u.setClave(195);
            configuracion = new Consulta(2, "select", "0", "", u);
            LinkedHashMap<String,Campo> cd = configuracion.getCampos();
            ArrayList<ArrayList> d = configuracion.getRegistros();

            System.out.println("*** Inicio de definición de columnas ***");
            for (Campo fd : cd.values()) {
                System.out.println(fd.toString());
            }

            System.out.println("*** Fin de definición de columnas ***");
            System.out.println("*** Inicio de datos ***");
            int i = 0;
            for (ArrayList r : d) {
                System.out.println("");
                i = 0;
                for (Object sd : r) {
                    System.out.println(cd.get(i).nombre + ": " + sd.toString());
                    i++;
                }
            }
            System.out.println("*** Fin de datos ***");
        } catch (Fallo ex) {
            Logger.getLogger(Consulta.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}