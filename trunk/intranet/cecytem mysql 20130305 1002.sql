-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.25a


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema cecytem
--

CREATE DATABASE IF NOT EXISTS cecytem;
USE cecytem;

--
-- Definition of table `be_actividad`
--

DROP TABLE IF EXISTS `be_actividad`;
CREATE TABLE `be_actividad` (
  `clave_actividad` int(11) NOT NULL AUTO_INCREMENT,
  `actividad` varchar(255) DEFAULT NULL,
  `fecha_inicial` datetime NOT NULL,
  `fecha_final` datetime DEFAULT NULL,
  `clave_forma` int(11) DEFAULT NULL,
  `clave_registro` int(11) DEFAULT NULL,
  `clave_empleado_solicitante` int(11) NOT NULL,
  `alertar_con_anticipacion` int(11) DEFAULT NULL,
  `clave_empleado_asignado` int(11) NOT NULL,
  `observacion` longtext,
  `clave_estatus` int(11) NOT NULL,
  PRIMARY KEY (`clave_actividad`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `be_actividad`
--

/*!40000 ALTER TABLE `be_actividad` DISABLE KEYS */;
INSERT INTO `be_actividad` (`clave_actividad`,`actividad`,`fecha_inicial`,`fecha_final`,`clave_forma`,`clave_registro`,`clave_empleado_solicitante`,`alertar_con_anticipacion`,`clave_empleado_asignado`,`observacion`,`clave_estatus`) VALUES 
 (91,'<a href=\'#\' id=\'lnkCuestionarioParticipante_114_2\' class=\'gridlink\'>Autorizar finalizacion de formulario\'Visita 1\' del Estudio GMC-Medix-2009-01-02</a>','2013-02-19 23:37:53',NULL,279,114,2,NULL,2,NULL,1),
 (92,'<a href=\'#\' id=\'lnkCuestionarioParticipante_114_2\' class=\'gridlink\'>Auditar formulario \'Visita 1\' del Estudio GMC-Medix-2009-01-02</a>','2013-02-19 23:38:00',NULL,279,114,2,NULL,3,NULL,1),
 (93,'<a href=\'#\' id=\'lnkCuestionarioParticipante_115_2\' class=\'gridlink\'>Capturar formulario \'Hoja finalización / Abandono del Estudio\' del Estudio GMC-Medix-2009-01-02 del paciente PP1</a>','2013-02-26 23:38:41',NULL,279,115,2,NULL,2,NULL,0),
 (94,'<a href=\'#\' id=\'lnkCuestionarioParticipante_1_5\' class=\'gridlink\'>Autorizar finalizacion de formulario\'Visita 1\' del Estudio GMC-Medix-2009-01-02</a>','2013-02-26 22:42:03',NULL,279,1,5,NULL,5,NULL,1),
 (95,'<a href=\'#\' id=\'lnkCuestionarioParticipante_1_5\' class=\'gridlink\'>Autorizar finalizacion de formulario\'Visita 1\' del Estudio GMC-Medix-2009-01-02</a>','2013-02-26 23:27:27',NULL,279,1,5,NULL,5,NULL,1),
 (96,'<a href=\'#\' id=\'lnkCuestionarioParticipante_1_5\' class=\'gridlink\'>Autorizar finalizacion de formulario\'Visita 1\' del Estudio GMC-Medix-2009-01-02</a>','2013-02-26 23:28:50',NULL,279,1,5,NULL,5,NULL,1),
 (97,'<a href=\'#\' id=\'lnkCuestionarioParticipante_1_5\' class=\'gridlink\'>Autorizar finalizacion de formulario\'Visita 1\' del Estudio GMC-Medix-2009-01-02</a>','2013-02-26 23:29:51',NULL,279,1,5,NULL,5,NULL,1),
 (98,'<a href=\'#\' id=\'lnkCuestionarioParticipante_1_5\' class=\'gridlink\'>Autorizar finalizacion de formulario\'Visita 1\' del Estudio GMC-Medix-2009-01-02</a>','2013-02-26 23:32:48',NULL,279,1,5,NULL,5,NULL,1),
 (99,'<a href=\'#\' id=\'lnkCuestionarioParticipante_1_5\' class=\'gridlink\'>Auditar formulario \'Visita 1\' del Estudio GMC-Medix-2009-01-02</a>','2013-02-26 23:40:00',NULL,279,1,5,NULL,6,NULL,0),
 (100,'<a href=\'#\' id=\'lnkCuestionarioParticipante_2_5\' class=\'gridlink\'>Capturar formulario \'Hoja finalización / Abandono del Estudio\' del Estudio GMC-Medix-2009-01-02 del paciente JPR</a>','2013-03-05 23:40:05',NULL,279,2,5,NULL,5,NULL,0),
 (101,'<a href=\'#\' id=\'lnkCuestionarioParticipante_2_5\' class=\'gridlink\'>Autorizar finalizacion de formulario\'Hoja finalización / Abandono del Estudio\' del Estudio GMC-Medix-2009-01-02</a>','2013-02-26 23:52:10',NULL,279,2,5,NULL,5,NULL,0),
 (102,'<a href=\'#\' id=\'lnkCuestionarioParticipante_2_5\' class=\'gridlink\'>Autorizar finalizacion de formulario\'Hoja finalización / Abandono del Estudio\' del Estudio GMC-Medix-2009-01-02</a>','2013-02-26 23:59:41',NULL,279,2,5,NULL,5,NULL,0);
/*!40000 ALTER TABLE `be_actividad` ENABLE KEYS */;


--
-- Definition of table `be_aplicacion`
--

DROP TABLE IF EXISTS `be_aplicacion`;
CREATE TABLE `be_aplicacion` (
  `clave_aplicacion` int(11) NOT NULL AUTO_INCREMENT,
  `aplicacion` varchar(255) NOT NULL,
  `clave_aplicacion_padre` int(11) DEFAULT '0',
  `clave_forma_principal` int(11) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `icono` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `autor` varchar(255) DEFAULT NULL,
  `version` varchar(10) DEFAULT NULL,
  `clave_estatus` int(11) NOT NULL DEFAULT '1',
  `app_url` varchar(255) DEFAULT NULL,
  `ayuda` varchar(255) DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  PRIMARY KEY (`clave_aplicacion`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `be_aplicacion`
--

/*!40000 ALTER TABLE `be_aplicacion` DISABLE KEYS */;
INSERT INTO `be_aplicacion` (`clave_aplicacion`,`aplicacion`,`clave_aplicacion_padre`,`clave_forma_principal`,`descripcion`,`icono`,`logo`,`autor`,`version`,`clave_estatus`,`app_url`,`ayuda`,`orden`) VALUES 
 (1,'Backend',NULL,2,'Backend',NULL,NULL,'Daniel Martínez','beta',1,NULL,NULL,1),
 (2,'Alert manager',NULL,NULL,'Módulo administrador de alarmas',NULL,NULL,'Daniel Martínez','Beta',1,NULL,NULL,2),
 (3,'AdministraX',NULL,NULL,'Sistema de administracion en línea',NULL,NULL,'Daniel Martínez',NULL,1,NULL,NULL,NULL),
 (4,'ContaX',NULL,NULL,'Sistema de contabilidad en línez',NULL,NULL,'Daniel Martínez',NULL,1,NULL,NULL,NULL),
 (5,'CajaX',NULL,NULL,'Sistema de punto de venta en línea',NULL,NULL,'Daniel Martínez',NULL,1,NULL,NULL,NULL),
 (6,'BancoX',NULL,NULL,'Sistema de administración de bancos en línea',NULL,NULL,'Daniel Martínez',NULL,1,NULL,NULL,NULL),
 (7,'NominaX',NULL,NULL,'Sistema de administración de recursos humanos en línea',NULL,NULL,'Daniel Martínez',NULL,1,NULL,NULL,NULL),
 (8,'OperacionX',NULL,NULL,'Sistema de control de líneas de producción en línea',NULL,NULL,'Daniel Martínez',NULL,1,NULL,NULL,NULL),
 (9,'FinanzaX',NULL,264,'Sistema de Administración de finanzas personales en línea',NULL,NULL,'Daniel Martínez',NULL,1,NULL,NULL,2),
 (10,'Cuentas',9,242,'Aplicación para configurar el resto de las aplicaciones',NULL,NULL,'Daniel Martínez','Beta',1,NULL,NULL,1),
 (11,'Tipos de transacción',9,246,'Módulo de tipos de transacciones',NULL,NULL,'Daniel Martínez',NULL,1,NULL,NULL,2),
 (12,'Categorías y presupuestos',9,247,'Catálogo de categorías y presupuestos',NULL,NULL,'Daniel Martínez',NULL,1,NULL,NULL,3),
 (13,'Beneficiario',9,248,'Catálogo de beneficiarios',NULL,NULL,'Daniel Martínez',NULL,1,NULL,NULL,4),
 (14,'Usuarios',1,6,'Aplicación de usuarios',NULL,NULL,'Daniel Martínez',NULL,1,NULL,NULL,NULL),
 (15,'Perfiles',1,5,'Módulo de perfiles de usuarios',NULL,NULL,'Daniel Martínez',NULL,1,NULL,NULL,NULL),
 (16,'Reportes',9,NULL,'Módulo de reportes de FinanzaX',NULL,NULL,'Daniel Martínez',NULL,1,NULL,NULL,NULL),
 (23,'Estudios clínicos',NULL,276,'Control de pacientes',NULL,NULL,'Daniel Martínez',NULL,1,NULL,NULL,4),
 (24,'Investigadores',23,282,'Módulo de control de investigadores',NULL,NULL,'Daniel Martínez',NULL,1,NULL,NULL,2),
 (25,'Auditores',23,283,'Módulo de auditores',NULL,NULL,'Daniel Martínez',NULL,1,NULL,NULL,3),
 (26,'Supervisores',23,285,'Modulo de supervisores de auditores',NULL,NULL,'Daniel Martínez',NULL,1,NULL,NULL,4),
 (27,'Administrador de Estudios Clínicos',23,288,'Módulo de Administrador de Estudios Clínicos',NULL,NULL,'Daniel Martínez',NULL,1,NULL,NULL,1);
/*!40000 ALTER TABLE `be_aplicacion` ENABLE KEYS */;


--
-- Definition of table `be_archivo`
--

DROP TABLE IF EXISTS `be_archivo`;
CREATE TABLE `be_archivo` (
  `clave_archivo` int(11) NOT NULL AUTO_INCREMENT,
  `archivo` varchar(255) NOT NULL,
  `descripcion` longtext,
  `palabras_clave` varchar(255) DEFAULT NULL,
  `fecha` datetime NOT NULL,
  `clave_empleado` int(11) NOT NULL,
  `clave_forma` int(11) NOT NULL,
  `clave_registro` int(11) NOT NULL,
  PRIMARY KEY (`clave_archivo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `be_archivo`
--

/*!40000 ALTER TABLE `be_archivo` DISABLE KEYS */;
/*!40000 ALTER TABLE `be_archivo` ENABLE KEYS */;


--
-- Definition of table `be_bitacora`
--

DROP TABLE IF EXISTS `be_bitacora`;
CREATE TABLE `be_bitacora` (
  `clave_bitacora` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `clave_empleado` int(11) NOT NULL,
  `clave_tipo_evento` int(11) DEFAULT NULL,
  `clave_forma` int(11) DEFAULT NULL,
  `clave_registro` int(11) DEFAULT NULL,
  `ip` varchar(50) NOT NULL,
  `navegador` varchar(150) NOT NULL,
  `error` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`clave_bitacora`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `be_bitacora`
--

/*!40000 ALTER TABLE `be_bitacora` DISABLE KEYS */;
/*!40000 ALTER TABLE `be_bitacora` ENABLE KEYS */;


--
-- Definition of table `be_bitacora_detalle`
--

DROP TABLE IF EXISTS `be_bitacora_detalle`;
CREATE TABLE `be_bitacora_detalle` (
  `clave_bitacora_detalle` int(11) NOT NULL AUTO_INCREMENT,
  `clave_bitacora` int(11) NOT NULL,
  `campo` varchar(50) NOT NULL,
  `valor_anterior` longtext,
  `valor_actual` longtext,
  PRIMARY KEY (`clave_bitacora_detalle`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `be_bitacora_detalle`
--

/*!40000 ALTER TABLE `be_bitacora_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `be_bitacora_detalle` ENABLE KEYS */;


--
-- Definition of table `be_campo_forma`
--

DROP TABLE IF EXISTS `be_campo_forma`;
CREATE TABLE `be_campo_forma` (
  `clave_campo` int(11) NOT NULL AUTO_INCREMENT,
  `clave_forma` int(11) NOT NULL,
  `clave_perfil` int(11) DEFAULT NULL,
  `campo` varchar(50) NOT NULL,
  `alias_campo` varchar(50) DEFAULT NULL,
  `obligatorio` tinyint(4) NOT NULL,
  `tipo_control` varchar(50) DEFAULT NULL,
  `evento` longtext,
  `clave_forma_foranea` int(11) DEFAULT NULL,
  `filtro_foraneo` varchar(50) DEFAULT NULL,
  `edita_forma_foranea` tinyint(4) DEFAULT NULL,
  `carga_dato_foraneos_retrasada` tinyint(4) DEFAULT NULL,
  `no_permitir_valor_foraneo_nulo` tinyint(4) DEFAULT NULL,
  `ayuda` longtext,
  `dato_sensible` tinyint(4) NOT NULL,
  `activo` tinyint(4) DEFAULT NULL,
  `tamano` int(11) DEFAULT NULL,
  `visible` tinyint(4) DEFAULT NULL,
  `valor_predeterminado` longtext,
  `justificar_cambio` tinyint(4) DEFAULT NULL,
  `usado_para_agrupar` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`clave_campo`)
) ENGINE=InnoDB AUTO_INCREMENT=9853 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `be_campo_forma`
--

/*!40000 ALTER TABLE `be_campo_forma` DISABLE KEYS */;
INSERT INTO `be_campo_forma` (`clave_campo`,`clave_forma`,`clave_perfil`,`campo`,`alias_campo`,`obligatorio`,`tipo_control`,`evento`,`clave_forma_foranea`,`filtro_foraneo`,`edita_forma_foranea`,`carga_dato_foraneos_retrasada`,`no_permitir_valor_foraneo_nulo`,`ayuda`,`dato_sensible`,`activo`,`tamano`,`visible`,`valor_predeterminado`,`justificar_cambio`,`usado_para_agrupar`) VALUES 
 (3,6,1,'nombre','Nombre',1,NULL,NULL,NULL,NULL,1,0,0,NULL,0,1,200,1,NULL,0,0),
 (4,6,1,'apellidos','Apellidos',1,NULL,NULL,NULL,NULL,1,0,0,NULL,0,1,200,1,NULL,0,0),
 (6,6,1,'email','Correo electrónico',1,NULL,NULL,NULL,NULL,1,0,NULL,NULL,0,1,NULL,1,NULL,NULL,NULL),
 (7,6,1,'password','Password',1,NULL,NULL,NULL,NULL,1,0,NULL,NULL,0,1,NULL,1,NULL,NULL,NULL),
 (8,6,1,'clave_perfil','Perfil',1,NULL,NULL,5,NULL,1,0,NULL,NULL,0,1,NULL,1,NULL,NULL,NULL),
 (9,6,1,'clave_area','Área',1,NULL,NULL,NULL,NULL,1,0,0,NULL,0,1,NULL,1,NULL,0,0),
 (10,6,1,'puesto','Puesto',1,NULL,NULL,NULL,NULL,1,0,NULL,NULL,0,1,NULL,1,NULL,NULL,NULL),
 (11,6,1,'activo','Activo',1,NULL,NULL,NULL,NULL,1,0,NULL,NULL,0,1,NULL,1,NULL,NULL,NULL),
 (12,6,1,'foto','Foto',1,'file',NULL,NULL,NULL,1,0,0,NULL,0,1,NULL,1,NULL,0,0),
 (13,6,1,'clave_empleado','Clave',1,NULL,NULL,NULL,NULL,1,0,NULL,NULL,0,1,70,1,NULL,NULL,NULL),
 (14,2,1,'aplicacion','Aplicación',1,NULL,NULL,NULL,NULL,1,0,NULL,NULL,0,1,300,1,NULL,NULL,NULL),
 (16,2,1,'descripcion','Descripci&oacute;n',1,NULL,NULL,NULL,NULL,1,0,NULL,NULL,0,1,NULL,1,NULL,NULL,NULL),
 (17,2,1,'clave_aplicacion','Clave',0,NULL,NULL,NULL,NULL,1,0,NULL,NULL,0,0,40,1,NULL,NULL,NULL),
 (22,2,1,'autor','Autor',1,NULL,NULL,NULL,NULL,1,0,NULL,NULL,0,1,NULL,1,NULL,NULL,NULL),
 (25,2,1,'app_url','URL del webservice',0,NULL,NULL,NULL,NULL,1,0,NULL,NULL,0,1,NULL,1,NULL,NULL,NULL),
 (26,2,1,'ayuda','URL de la ayuda en linea',0,NULL,NULL,NULL,NULL,1,0,NULL,NULL,0,1,NULL,1,NULL,NULL,NULL),
 (30,2,1,'clave_forma_principal','Forma principal',1,NULL,NULL,3,'1',1,0,0,NULL,0,1,NULL,1,NULL,0,0),
 (31,2,1,'clave_estatus','Estatus',1,NULL,NULL,11,NULL,1,0,NULL,NULL,0,1,100,1,NULL,NULL,NULL),
 (34,3,1,'clave_forma','Clave',1,NULL,NULL,NULL,NULL,1,0,NULL,NULL,0,1,70,1,NULL,NULL,NULL),
 (35,3,1,'forma','Forma',1,NULL,NULL,NULL,NULL,1,0,NULL,NULL,0,1,200,1,NULL,NULL,NULL),
 (36,8,1,'clave_forma','Forma',1,NULL,NULL,3,'5',1,0,1,NULL,0,1,70,1,NULL,0,0),
 (37,8,1,'consulta','Consulta',1,NULL,NULL,NULL,NULL,1,0,NULL,NULL,0,1,400,1,NULL,NULL,NULL),
 (38,8,1,'tipo_accion','Acción',1,NULL,NULL,15,'6',1,0,0,NULL,0,1,100,1,NULL,0,0),
 (41,8,1,'clave_consulta','Clave',1,NULL,NULL,NULL,NULL,1,0,NULL,NULL,0,1,70,1,NULL,NULL,NULL),
 (42,3,1,'clave_forma_padre','Forma padre',0,NULL,NULL,3,'2',1,0,NULL,NULL,0,1,5,1,NULL,NULL,NULL),
 (43,3,1,'clave_aplicacion','Aplicación',1,NULL,NULL,2,'2',1,0,1,NULL,0,1,5,1,NULL,0,0),
 (44,3,1,'tabla','Tabla',1,NULL,'$(\'#tabla\').change(function() {\nsetXMLInSelect3(\"llave_primaria\",-2,\"update\",$(this).val());\n});',-1,NULL,0,0,0,NULL,0,1,5,1,NULL,0,0),
 (47,3,1,'llave_primaria','Llave primaria',1,NULL,NULL,-2,NULL,0,0,NULL,NULL,0,1,NULL,1,NULL,NULL,NULL),
 (59,14,1,'clave_forma','Forma',0,NULL,NULL,3,'4',1,0,1,NULL,0,1,150,1,NULL,0,0),
 (60,14,1,'clave_perfil','Perfil',0,NULL,NULL,10,NULL,1,0,0,NULL,0,1,150,1,NULL,0,0),
 (61,14,1,'clave_permiso','Permiso',0,NULL,NULL,16,NULL,1,0,NULL,NULL,0,1,150,1,NULL,NULL,NULL),
 (62,14,1,'clave_permiso_forma','Clave',0,NULL,NULL,NULL,NULL,1,0,NULL,NULL,0,1,70,1,NULL,NULL,NULL),
 (63,16,1,'clave_permiso','Clave',1,NULL,NULL,NULL,NULL,1,0,NULL,NULL,0,1,70,1,NULL,NULL,NULL),
 (64,16,1,'permiso','Permiso',1,NULL,NULL,NULL,NULL,1,0,NULL,NULL,0,1,150,1,NULL,NULL,NULL),
 (134,13,1,'activo','Activo',0,NULL,NULL,NULL,NULL,1,0,0,NULL,0,1,NULL,1,'\"1\"',0,0),
 (135,13,1,'alias_campo','Alias campo',0,NULL,NULL,NULL,NULL,1,0,NULL,NULL,0,1,150,1,NULL,NULL,NULL),
 (136,13,1,'ayuda','Ayuda',0,NULL,NULL,NULL,NULL,1,0,NULL,NULL,0,1,NULL,1,NULL,NULL,NULL),
 (137,13,1,'campo','Campo',1,NULL,NULL,NULL,NULL,1,0,NULL,NULL,0,1,150,1,NULL,NULL,NULL),
 (138,13,1,'clave_campo','Clave',0,NULL,NULL,NULL,NULL,1,0,NULL,NULL,0,1,70,1,NULL,NULL,NULL),
 (139,13,1,'clave_forma','Forma',1,NULL,NULL,3,'4',1,0,1,NULL,0,1,NULL,1,NULL,0,0),
 (140,13,1,'clave_forma_foranea','Forma foránea',0,NULL,'$(\'#clave_forma_foranea\').change(function() {\n  if ($(this).val()!=\"\") {\n     $(\"#td_filtro_foraneo\").parent().show();\n     $(\"#td_edita_forma_foranea\").parent().show();\n     $(\"#td_no_permitir_valor_foraneo_nulo\").parent().show();\n     $(\"#td_filtro_foraneo\").parent().show();\n  } else {\n     $(\"#td_filtro_foraneo\").parent().hide();\n     $(\"#td_edita_forma_foranea\").parent().hide();\n     $(\"#td_no_permitir_valor_foraneo_nulo\").parent().hide();\n     $(\"#td_filtro_foraneo\").parent().hide();\n  }\n});',3,NULL,1,0,0,NULL,0,1,NULL,1,NULL,0,0),
 (141,13,1,'clave_perfil','Perfil',0,NULL,NULL,5,'5',1,0,1,NULL,0,1,NULL,1,NULL,0,0),
 (142,13,1,'dato_sensible','Dato sensible',0,NULL,NULL,NULL,NULL,1,0,NULL,NULL,0,1,NULL,1,NULL,NULL,NULL),
 (143,13,1,'edita_forma_foranea','Edición de foraneos',0,NULL,NULL,NULL,NULL,1,0,0,NULL,0,1,NULL,1,NULL,0,0),
 (144,13,1,'evento','Evento',0,NULL,NULL,NULL,NULL,1,0,NULL,NULL,0,1,NULL,1,NULL,NULL,NULL),
 (145,13,1,'filtro_foraneo','Filtro de catálogo foráneo',0,NULL,NULL,NULL,NULL,1,0,0,NULL,0,1,30,1,NULL,0,0),
 (146,13,1,'obligatorio','Obligatorio',0,NULL,NULL,NULL,NULL,1,0,0,NULL,0,1,150,1,NULL,0,0),
 (147,282,1,'apellidos','Apellidos',1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,200,1,NULL,0,0),
 (148,13,1,'tipo_control','Tipo de control',0,NULL,NULL,NULL,NULL,1,0,NULL,NULL,0,1,NULL,1,NULL,NULL,NULL),
 (149,2,1,'version','Versión',0,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,1,NULL,1,NULL,NULL,NULL),
 (150,3,1,'codigo_forma','Código',0,NULL,NULL,NULL,NULL,0,0,NULL,NULL,0,1,NULL,1,NULL,NULL,NULL),
 (151,3,1,'alias_tab','Definición en bitácora',0,NULL,NULL,NULL,NULL,0,0,NULL,NULL,0,1,NULL,1,NULL,0,NULL),
 (152,3,1,'orden_tab','Orden en pestaña',0,NULL,NULL,NULL,NULL,0,0,NULL,NULL,0,1,NULL,1,NULL,NULL,NULL),
 (153,3,1,'permite_filtrar_datos','Filtrar datos',0,NULL,NULL,NULL,NULL,0,0,NULL,NULL,0,1,NULL,1,NULL,NULL,NULL),
 (154,3,1,'icono','Icono',0,NULL,NULL,NULL,NULL,0,0,NULL,NULL,0,1,NULL,1,NULL,NULL,NULL),
 (504,8,1,'clave_perfil','Perfil',1,NULL,NULL,5,'4',1,0,1,NULL,0,1,70,1,NULL,0,0),
 (521,10,1,'activo','Activo',0,NULL,NULL,NULL,NULL,1,0,NULL,NULL,0,1,NULL,1,NULL,NULL,NULL),
 (522,10,1,'clave_aplicacion','Aplicación',1,NULL,NULL,2,'2',1,0,1,NULL,0,1,200,1,NULL,0,0),
 (523,10,1,'clave_perfil','Perfil',1,NULL,NULL,5,NULL,1,0,NULL,NULL,0,1,200,1,NULL,NULL,NULL),
 (524,10,1,'clave_perfil_aplicacion','Clave',0,NULL,NULL,NULL,NULL,1,0,NULL,NULL,0,1,70,1,NULL,NULL,NULL),
 (589,1,1,'clave_empleado','Empleado',1,NULL,NULL,62,NULL,1,0,NULL,NULL,0,1,200,1,NULL,NULL,NULL),
 (590,1,1,'clave_parametro','Clave',1,NULL,NULL,NULL,NULL,1,0,NULL,NULL,0,1,70,1,NULL,NULL,NULL),
 (591,1,1,'parametro','Parámetro',1,NULL,NULL,NULL,NULL,1,0,NULL,NULL,0,1,200,1,NULL,NULL,NULL),
 (592,1,1,'valor','Valor',1,NULL,NULL,NULL,NULL,1,0,NULL,NULL,0,1,150,1,NULL,NULL,NULL),
 (616,5,1,'clave_perfil','Clave',1,NULL,NULL,NULL,NULL,1,0,NULL,NULL,0,1,70,1,NULL,NULL,NULL),
 (617,5,1,'perfil','Perfil',1,NULL,NULL,NULL,NULL,1,0,NULL,NULL,0,1,150,1,NULL,NULL,NULL),
 (758,1,1,'clave_aplicacion','Aplicacion',0,NULL,NULL,2,NULL,1,0,NULL,NULL,0,1,100,1,NULL,NULL,NULL),
 (1276,13,1,'visible','Visible',0,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,NULL,1,'\"1\"',0,0),
 (1277,13,1,'justificar_cambio','Se requiere documentar el cambio',0,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,NULL,1,NULL,0,0),
 (1279,13,1,'valor_predeterminado','Valor predeterminado',0,NULL,NULL,NULL,NULL,0,0,NULL,NULL,0,1,NULL,1,NULL,0,NULL),
 (2027,13,1,'usado_para_agrupar','Usado para agrupar',0,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,NULL,1,NULL,0,0),
 (2028,13,1,'no_permitir_valor_foraneo_nulo','No permitir valor foraneo nulo',0,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,NULL,1,NULL,0,0),
 (3674,13,1,'carga_dato_foraneos_retrasada','Carga de datos foráneos retrasada',0,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,NULL,1,NULL,0,0),
 (3676,3,1,'instrucciones','Instrucciones',0,'editor',NULL,NULL,NULL,0,0,0,NULL,0,1,NULL,1,NULL,0,0),
 (3677,3,1,'evento_forma','Evento inicial de la forma',0,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,NULL,1,NULL,0,0),
 (6531,13,1,'activo','Activo',0,NULL,NULL,NULL,NULL,1,0,0,NULL,0,1,NULL,1,'\"1\"',0,0),
 (6532,13,1,'alias_campo','Alias campo',0,NULL,NULL,NULL,NULL,1,0,NULL,NULL,0,1,150,1,NULL,NULL,NULL),
 (6533,13,1,'ayuda','Ayuda',0,NULL,NULL,NULL,NULL,1,0,NULL,NULL,0,1,NULL,1,NULL,NULL,NULL),
 (6534,13,1,'campo','Campo',1,NULL,NULL,NULL,NULL,1,0,NULL,NULL,0,1,150,1,NULL,NULL,NULL),
 (6535,13,1,'clave_campo','Clave',0,NULL,NULL,NULL,NULL,1,0,NULL,NULL,0,1,70,1,NULL,NULL,NULL),
 (6536,13,1,'clave_forma','Forma',1,NULL,NULL,3,'4',1,0,1,NULL,0,1,NULL,1,NULL,0,0),
 (6537,13,1,'clave_forma_foranea','Forma foránea',0,NULL,'$(\'#clave_forma_foranea\').change(function() {\n  if ($(this).val()!=\"\") {\n     $(\"#td_filtro_foraneo\").parent().show();\n     $(\"#td_edita_forma_foranea\").parent().show();\n     $(\"#td_no_permitir_valor_foraneo_nulo\").parent().show();\n     $(\"#td_filtro_foraneo\").parent().show();\n  } else {\n     $(\"#td_filtro_foraneo\").parent().hide();\n     $(\"#td_edita_forma_foranea\").parent().hide();\n     $(\"#td_no_permitir_valor_foraneo_nulo\").parent().hide();\n     $(\"#td_filtro_foraneo\").parent().hide();\n  }\n});',3,NULL,1,0,0,NULL,0,1,NULL,1,NULL,0,0),
 (6538,13,1,'clave_perfil','Perfil',0,NULL,NULL,5,'5',1,0,1,NULL,0,1,NULL,1,NULL,0,0),
 (6539,13,1,'dato_sensible','Dato sensible',0,NULL,NULL,NULL,NULL,1,0,NULL,NULL,0,1,NULL,1,NULL,NULL,NULL),
 (6540,13,1,'edita_forma_foranea','Edición de foraneos',0,NULL,NULL,NULL,NULL,1,0,0,NULL,0,1,NULL,1,NULL,0,0),
 (6541,13,1,'evento','Evento',0,NULL,NULL,NULL,NULL,1,0,NULL,NULL,0,1,NULL,1,NULL,NULL,NULL),
 (6542,13,1,'filtro_foraneo','Filtro de catálogo foráneo',0,NULL,NULL,NULL,NULL,1,0,0,NULL,0,1,30,1,NULL,0,0),
 (6543,13,1,'obligatorio','Obligatorio',0,NULL,NULL,NULL,NULL,1,0,0,NULL,0,1,150,1,NULL,0,0),
 (6544,13,1,'tamano','Tamaño',0,NULL,NULL,NULL,NULL,1,0,NULL,NULL,0,1,20,1,NULL,NULL,NULL),
 (6545,13,1,'tipo_control','Tipo de control',0,NULL,NULL,NULL,NULL,1,0,NULL,NULL,0,1,NULL,1,NULL,NULL,NULL),
 (6546,13,1,'visible','Visible',0,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,NULL,1,'\"1\"',0,0),
 (6547,13,1,'justificar_cambio','Se requiere documentar el cambio',0,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,NULL,1,NULL,0,0),
 (6548,13,1,'valor_predeterminado','Valor predeterminado',0,NULL,NULL,NULL,NULL,0,0,NULL,NULL,0,1,NULL,1,NULL,0,NULL),
 (6549,13,1,'usado_para_agrupar','Usado para agrupar',0,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,NULL,1,NULL,0,0),
 (6550,13,1,'no_permitir_valor_foraneo_nulo','No permitir valor foraneo nulo',0,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,NULL,1,NULL,0,0),
 (6551,13,1,'carga_dato_foraneos_retrasada','Carga de datos foráneos retrasada',0,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,NULL,1,NULL,0,0),
 (7459,101,1,'actividad','Actividad',1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,500,0,'\"1\"',0,0),
 (7460,101,1,'clave_proyecto','Proyecto',1,NULL,NULL,24,'3',1,0,0,NULL,0,1,200,1,NULL,0,0),
 (7461,101,1,'clave_actividad','Clave',1,NULL,NULL,NULL,NULL,1,0,0,NULL,0,1,0,1,NULL,0,0),
 (7462,101,1,'fecha_inicial','Fecha inicial',1,NULL,NULL,NULL,NULL,1,0,0,NULL,0,1,140,1,'sDateToString(new Date())',0,0),
 (7463,101,1,'fecha_final','Fecha final',0,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,140,0,NULL,1,0),
 (7464,101,1,'clave_empleado_solicitante','Solicitante',1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,150,0,'document.getElementById(\'_ce_\').value',0,0),
 (7465,101,1,'observacion','Motivo de retraso / Observaciones',1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,250,1,NULL,0,0),
 (7466,101,1,'clave_estatus','Estatus',0,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,70,1,NULL,0,0),
 (7929,102,1,'proceso','Pendiente',0,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,400,1,NULL,0,0),
 (7930,102,1,'flujo','Tipo de solicitud',0,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,300,1,NULL,0,0),
 (7931,102,1,'proyecto','Proyecto',0,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,300,1,NULL,0,0),
 (7932,102,1,'responsable','Responable',0,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,250,1,NULL,0,0),
 (7933,102,1,'actividad','Actividad',0,NULL,NULL,NULL,NULL,1,0,0,NULL,0,0,400,1,'\"1\"',0,0),
 (7934,102,1,'alertar_con_anticipacion','Alertar con anticipación',1,NULL,NULL,NULL,NULL,1,0,0,NULL,0,1,10,1,NULL,0,0),
 (7935,102,1,'clave_actividad','Actividad',0,NULL,NULL,NULL,NULL,1,0,0,NULL,0,0,0,1,NULL,0,0),
 (7936,102,1,'clave_empleado_asignado','Empleado asignado',1,NULL,NULL,NULL,NULL,1,0,0,NULL,0,1,120,1,'document.getElementById(\'_ce_\').value',0,0),
 (7937,102,1,'clave_empleado_solicitante','Clave empleado solicitante',0,NULL,NULL,NULL,NULL,1,0,0,NULL,0,1,150,1,NULL,0,0),
 (7938,102,1,'clave_estatus','Estatus',1,NULL,NULL,NULL,NULL,1,0,0,NULL,0,1,75,1,NULL,0,0),
 (7939,102,1,'clave_flujo_forma','Flujo Forma',1,NULL,NULL,NULL,NULL,1,0,0,NULL,0,1,150,1,NULL,0,0),
 (7940,102,1,'clave_proyecto','proyecto',1,NULL,NULL,72,'3',1,0,0,NULL,0,1,150,1,NULL,0,0),
 (7941,102,1,'fecha_final','Fecha final',1,NULL,NULL,NULL,NULL,1,0,0,NULL,0,1,150,1,NULL,1,0),
 (7942,102,1,'fecha_inicial','Fecha inicial',1,NULL,NULL,NULL,NULL,1,0,0,NULL,0,1,150,1,'sDateToString(new Date())',0,0),
 (7943,102,1,'observacion','Observaciones',1,NULL,NULL,62,NULL,1,0,0,NULL,0,1,150,1,NULL,0,0),
 (8630,2,1,'clave_aplicacion_padre','Es parte de',0,NULL,NULL,2,NULL,1,0,0,NULL,0,1,200,1,NULL,NULL,NULL),
 (8731,2,1,'orden','Orden',0,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,70,1,NULL,0,0),
 (8753,3,1,'permite_duplicar_registro','Permite duplicar registro activo',0,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,70,1,NULL,0,0),
 (8754,3,1,'permite_insertar_comentarios','Permite insertar comentarios en el registro activo',0,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,70,1,NULL,0,0),
 (8755,3,1,'permite_guardar_como_plantilla','Permite guardar como plantilla',0,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,150,1,NULL,0,0),
 (8865,3,1,'muestra_formas_foraneas','Muestra formas foraneas',0,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,120,1,NULL,0,0),
 (8934,265,1,'clave_reporte','Clave',0,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,70,1,NULL,0,0),
 (8935,265,1,'reporte','Reporte',1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,150,1,NULL,0,0),
 (8936,265,1,'clave_forma','Forma',1,NULL,NULL,3,'4',1,0,1,NULL,0,1,150,1,NULL,0,0),
 (8937,265,1,'clave_perfil','Perfil',1,NULL,NULL,10,'5',0,0,1,NULL,0,1,100,1,NULL,0,0),
 (8938,265,1,'clave_tipo_reporte','Tipo de reporte',0,NULL,'clave_tipo_reporte=$(xml).find(\"clave_tipo_reporte\")[0].childNodes[0].data;\n\nif (clave_tipo_reporte==\"2\") {\n       $(\"#clave_tipo_grafica\").removeClass(\"obligatorio\");\n       $(\"#etiqueta_tick\").removeClass(\"obligatorio\");\n       $(\"#consulta\").removeClass(\"obligatorio\");\n       $(\"#td_clave_tipo_grafica\").parent().hide();\n       $(\"#td_etiqueta_tick\").parent().hide();\n       $(\"#td_consulta\").parent().hide();\n       $(\"#td_color_series\").parent().hide();\n       $(\"#td_jrxml\").parent().show();\n       $(\"#jrxml\").addClass(\"obligatorio\");\n       $(\"#td_jsp\").html(\"Archivo JSP que genera el reporte sin extensión\");\n       $(\"#jsp\").removeClass(\"obligatorio\");\n   } \n else {\n       $(\"#clave_tipo_grafica\").addClass(\"obligatorio\");\n       $(\"#etiqueta_tick\").addClass(\"obligatorio\");\n       $(\"#consulta\").addClass(\"obligatorio\");\n       $(\"#td_clave_tipo_grafica\").parent().show();\n       $(\"#td_etiqueta_tick\").parent().show();\n       $(\"#td_consulta\").parent().show();\n       $(\"#td_color_series\").parent().show();\n       $(\"#td_jrxml\").parent().hide();\n       $(\"#jrxml\").removeClass(\"obligatorio\");\n       $(\"#td_jsp\").html(\"Archivo JSP que genera el reporte sin extensión (*<span id=\'msgvalida_jsp\' style=\'display: none; \'>Obligatorio</span>)\");\n       $(\"#jsp\").addClass(\"obligatorio\");\n   }\n\n\n$(\"#clave_tipo_reporte\").change( function() { \n   if ($(\"#clave_tipo_reporte\").val()==2) {\n       $(\"#clave_tipo_grafica\").removeClass(\"obligatorio\");\n       $(\"#etiqueta_tick\").removeClass(\"obligatorio\");\n       $(\"#consulta\").removeClass(\"obligatorio\");\n       $(\"#td_clave_tipo_grafica\").parent().hide();\n       $(\"#td_etiqueta_tick\").parent().hide();\n       $(\"#td_consulta\").parent().hide();\n       $(\"#td_color_series\").parent().hide();\n       $(\"#td_jrxml\").parent().show();\n       $(\"#jrxml\").addClass(\"obligatorio\");\n       $(\"#td_jsp\").html(\"Archivo JSP que genera el reporte sin extensión\");\n       $(\"#jsp\").removeClass(\"obligatorio\");\n   } \n   else {\n       $(\"#clave_tipo_grafica\").addClass(\"obligatorio\");\n       $(\"#etiqueta_tick\").addClass(\"obligatorio\");\n       $(\"#consulta\").addClass(\"obligatorio\");\n       $(\"#td_clave_tipo_grafica\").parent().show();\n       $(\"#td_etiqueta_tick\").parent().show();\n       $(\"#td_consulta\").parent().show();\n       $(\"#td_color_series\").parent().show();\n       $(\"#td_jrxml\").parent().hide();\n       $(\"#jrxml\").removeClass(\"obligatorio\");\n       $(\"#td_jsp\").html(\"Archivo JSP que genera el reporte sin extensión (*<span id=\'msgvalida_jsp\' style=\'display: none; \'>Obligatorio</span>)\");\n       $(\"#jsp\").addClass(\"obligatorio\");\n   }\n})',267,NULL,0,0,0,NULL,0,1,100,1,NULL,0,0),
 (8939,265,1,'consulta','Consulta',0,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,200,1,NULL,0,0),
 (8940,265,1,'jsp','Archivo JSP',0,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,100,1,NULL,0,0),
 (8941,265,1,'jrxml','Archivo JRXML',0,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,150,1,NULL,0,0),
 (8942,265,1,'etiqueta_tick','etiqueta_tick',0,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,1,NULL,1,NULL,NULL,NULL),
 (8943,265,1,'color_series','color_series',0,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,1,NULL,1,NULL,NULL,NULL),
 (8944,265,1,'generar_en_insercion','Generar en inserción',0,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,70,1,NULL,0,0),
 (8945,265,1,'generar_en_actualizacion','Generar en actualización',0,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,70,1,NULL,0,0),
 (8949,266,1,'clave_parametro','Clave',1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,70,1,NULL,0,0),
 (8950,266,1,'parametro','Parámetro',1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,100,1,NULL,0,0),
 (8951,266,1,'clave_reporte','Reporte',1,NULL,NULL,265,NULL,0,0,0,NULL,0,1,150,1,NULL,0,0),
 (8952,266,1,'alias','Alias',1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,150,1,NULL,0,0),
 (8953,266,1,'tipo_dato','tipo_dato',0,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,1,NULL,1,NULL,NULL,NULL),
 (8954,266,1,'valor','valor',0,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,1,NULL,1,NULL,NULL,NULL),
 (8955,266,1,'valor_predeterminado','valor_predeterminado',0,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,1,NULL,1,NULL,NULL,NULL),
 (8956,266,1,'clave_forma_foranea','clave_forma_foranea',0,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,1,NULL,1,NULL,NULL,NULL),
 (8957,266,1,'visible','visible',0,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,1,NULL,1,NULL,NULL,NULL),
 (8958,266,1,'obligatorio','obligatorio',0,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,1,NULL,1,NULL,NULL,NULL),
 (8959,266,1,'ayuda','ayuda',0,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,1,NULL,1,NULL,NULL,NULL),
 (8964,267,1,'clave_tipo_reporte','Clave',1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,70,1,NULL,0,0),
 (8965,267,1,'tipo_reporte','Tipo de reporte',1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,150,1,NULL,0,0),
 (9148,3,1,'evento_grid','Evento inicial del grid',0,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,NULL,1,NULL,0,0),
 (9152,282,1,'clave_empleado','Clave',0,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,70,1,NULL,0,0),
 (9153,282,1,'nombre','Nombre',1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,200,1,NULL,0,0),
 (9155,282,1,'email','Correo electrónico',1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,200,1,NULL,0,0),
 (9156,282,1,'password','Contraseña',0,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,0,1,NULL,0,0),
 (9157,282,1,'clave_perfil','clave_perfil',0,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,200,0,'\"2\"',0,0),
 (9158,282,1,'activo','Activo',0,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,100,1,NULL,0,0),
 (9159,282,1,'foto','Foto',0,'file',NULL,NULL,NULL,0,0,0,NULL,0,1,NULL,1,NULL,0,0),
 (9161,282,1,'cambia_password','Cambia contraseña',0,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,NULL,1,'\"0\"',0,0),
 (9170,282,1,'clave_area','clave_area',0,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,1,NULL,1,NULL,NULL,NULL),
 (9183,283,1,'clave_empleado','Clave',0,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,70,1,NULL,0,0),
 (9184,283,1,'nombre','Nombre',1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,200,1,NULL,0,0),
 (9185,283,1,'apellidos','Apellidos',1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,200,1,NULL,0,0),
 (9186,283,1,'email','Correo electrónico',1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,200,1,NULL,0,0),
 (9187,283,1,'password','Contraseña',1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,200,1,NULL,0,0),
 (9188,283,1,'clave_perfil','Perfil',0,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,200,0,'\"3\"',0,0),
 (9189,283,1,'activo','Activo',0,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,70,1,NULL,0,0),
 (9190,283,1,'foto','Foto',0,'file',NULL,NULL,NULL,0,0,0,NULL,0,1,NULL,1,NULL,0,0),
 (9191,283,1,'clave_area','clave_area',0,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,1,NULL,1,NULL,NULL,NULL),
 (9192,283,1,'cambia_password','Cambia contraseña',0,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,200,1,'\"0\"',0,0),
 (9217,285,1,'clave_empleado','Clave',0,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,70,1,NULL,0,0),
 (9218,285,1,'nombre','Nombre',1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,200,1,NULL,0,0),
 (9219,285,1,'apellidos','Apellidos',1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,200,1,NULL,0,0),
 (9220,285,1,'email','Correo electrónico',1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,200,1,NULL,0,0),
 (9221,285,1,'password','Contraseña',1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,200,1,NULL,0,0),
 (9222,285,1,'clave_perfil','Perfil',0,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,NULL,0,'\"4\"',0,0),
 (9223,285,1,'activo','Activo',0,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,70,1,NULL,0,0),
 (9224,285,1,'foto','Foto',0,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,NULL,1,NULL,0,0),
 (9225,285,1,'clave_area','Area',0,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,NULL,1,NULL,0,0),
 (9226,285,1,'cambia_password','Cambia contraseña',0,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,NULL,1,NULL,0,0),
 (9698,101,2,'actividad','Actividad',1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,500,0,'\"1\"',0,0),
 (9699,101,2,'clave_proyecto','Proyecto',1,NULL,NULL,24,'3',1,0,0,NULL,0,1,200,1,NULL,0,0),
 (9700,101,2,'clave_actividad','Clave',1,NULL,NULL,NULL,NULL,1,0,0,NULL,0,1,0,1,NULL,0,0),
 (9701,101,2,'fecha_inicial','Fecha inicial',1,NULL,NULL,NULL,NULL,1,0,0,NULL,0,1,140,1,'sDateToString(new Date())',0,0),
 (9702,101,2,'fecha_final','Fecha final',0,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,140,0,NULL,1,0),
 (9703,101,2,'clave_empleado_solicitante','Solicitante',1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,150,0,'document.getElementById(\'_ce_\').value',0,0),
 (9704,101,2,'observacion','Motivo de retraso / Observaciones',1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,250,1,NULL,0,0),
 (9705,101,2,'clave_estatus','Estatus',0,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,70,1,NULL,0,0),
 (9713,101,3,'actividad','Actividad',1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,500,0,'\"1\"',0,0),
 (9714,101,3,'clave_proyecto','Proyecto',1,NULL,NULL,24,'3',1,0,0,NULL,0,1,200,1,NULL,0,0),
 (9715,101,3,'clave_actividad','Clave',1,NULL,NULL,NULL,NULL,1,0,0,NULL,0,1,0,1,NULL,0,0),
 (9716,101,3,'fecha_inicial','Fecha inicial',1,NULL,NULL,NULL,NULL,1,0,0,NULL,0,1,140,1,'sDateToString(new Date())',0,0),
 (9717,101,3,'fecha_final','Fecha final',0,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,140,0,NULL,1,0),
 (9718,101,3,'clave_empleado_solicitante','Solicitante',1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,150,0,'document.getElementById(\'_ce_\').value',0,0),
 (9719,101,3,'observacion','Observaciones',1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,250,1,NULL,0,0),
 (9720,101,3,'clave_estatus','Estatus',0,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,70,1,NULL,0,0),
 (9728,101,4,'actividad','Actividad',1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,500,0,'\"1\"',0,0),
 (9729,101,4,'clave_proyecto','Proyecto',1,NULL,NULL,24,'3',1,0,0,NULL,0,1,200,1,NULL,0,0),
 (9730,101,4,'clave_actividad','Clave',1,NULL,NULL,NULL,NULL,1,0,0,NULL,0,1,0,1,NULL,0,0),
 (9731,101,4,'fecha_inicial','Fecha inicial',1,NULL,NULL,NULL,NULL,1,0,0,NULL,0,1,140,1,'sDateToString(new Date())',0,0),
 (9732,101,4,'fecha_final','Fecha final',0,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,140,0,NULL,1,0),
 (9733,101,4,'clave_empleado_solicitante','Solicitante',1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,150,0,'document.getElementById(\'_ce_\').value',0,0),
 (9734,101,4,'observacion','Motivo de retraso / Observaciones',1,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,250,1,NULL,0,0),
 (9735,101,4,'clave_estatus','Estatus',0,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,70,1,NULL,0,0),
 (9743,102,2,'proceso','Pendiente',0,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,400,1,NULL,0,0),
 (9744,102,2,'flujo','Tipo de solicitud',0,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,300,1,NULL,0,0),
 (9745,102,2,'proyecto','Proyecto',0,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,300,1,NULL,0,0),
 (9746,102,2,'responsable','Responable',0,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,250,1,NULL,0,0),
 (9747,102,2,'actividad','Actividad',0,NULL,NULL,NULL,NULL,1,0,0,NULL,0,0,400,1,'\"1\"',0,0),
 (9748,102,2,'alertar_con_anticipacion','Alertar con anticipación',1,NULL,NULL,NULL,NULL,1,0,0,NULL,0,1,10,1,NULL,0,0),
 (9749,102,2,'clave_actividad','Actividad',0,NULL,NULL,NULL,NULL,1,0,0,NULL,0,0,0,1,NULL,0,0),
 (9750,102,2,'clave_empleado_asignado','Empleado asignado',1,NULL,NULL,NULL,NULL,1,0,0,NULL,0,1,120,1,'document.getElementById(\'_ce_\').value',0,0),
 (9751,102,2,'clave_empleado_solicitante','Clave empleado solicitante',0,NULL,NULL,NULL,NULL,1,0,0,NULL,0,1,150,1,NULL,0,0),
 (9752,102,2,'clave_estatus','Estatus',1,NULL,NULL,NULL,NULL,1,0,0,NULL,0,1,75,1,NULL,0,0),
 (9753,102,2,'clave_flujo_forma','Flujo Forma',1,NULL,NULL,NULL,NULL,1,0,0,NULL,0,1,150,1,NULL,0,0),
 (9754,102,2,'clave_proyecto','proyecto',1,NULL,NULL,72,'3',1,0,0,NULL,0,1,150,1,NULL,0,0),
 (9755,102,2,'fecha_final','Fecha final',1,NULL,NULL,NULL,NULL,1,0,0,NULL,0,1,150,1,NULL,1,0),
 (9756,102,2,'fecha_inicial','Fecha inicial',1,NULL,NULL,NULL,NULL,1,0,0,NULL,0,1,150,1,'sDateToString(new Date())',0,0),
 (9757,102,2,'observacion','Observaciones',1,NULL,NULL,62,NULL,1,0,0,NULL,0,1,150,1,NULL,0,0),
 (9758,102,3,'proceso','Pendiente',0,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,400,1,NULL,0,0),
 (9759,102,3,'flujo','Tipo de solicitud',0,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,300,1,NULL,0,0),
 (9760,102,3,'proyecto','Proyecto',0,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,300,1,NULL,0,0),
 (9761,102,3,'responsable','Responable',0,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,250,1,NULL,0,0),
 (9762,102,3,'actividad','Actividad',0,NULL,NULL,NULL,NULL,1,0,0,NULL,0,0,400,1,'\"1\"',0,0),
 (9763,102,3,'alertar_con_anticipacion','Alertar con anticipación',1,NULL,NULL,NULL,NULL,1,0,0,NULL,0,1,10,1,NULL,0,0),
 (9764,102,3,'clave_actividad','Actividad',0,NULL,NULL,NULL,NULL,1,0,0,NULL,0,0,0,1,NULL,0,0),
 (9765,102,3,'clave_empleado_asignado','Empleado asignado',1,NULL,NULL,NULL,NULL,1,0,0,NULL,0,1,120,1,'document.getElementById(\'_ce_\').value',0,0),
 (9766,102,3,'clave_empleado_solicitante','Clave empleado solicitante',0,NULL,NULL,NULL,NULL,1,0,0,NULL,0,1,150,1,NULL,0,0),
 (9767,102,3,'clave_estatus','Estatus',1,NULL,NULL,NULL,NULL,1,0,0,NULL,0,1,75,1,NULL,0,0),
 (9768,102,3,'clave_flujo_forma','Flujo Forma',1,NULL,NULL,NULL,NULL,1,0,0,NULL,0,1,150,1,NULL,0,0),
 (9769,102,3,'clave_proyecto','proyecto',1,NULL,NULL,72,'3',1,0,0,NULL,0,1,150,1,NULL,0,0),
 (9770,102,3,'fecha_final','Fecha final',1,NULL,NULL,NULL,NULL,1,0,0,NULL,0,1,150,1,NULL,1,0),
 (9771,102,3,'fecha_inicial','Fecha inicial',1,NULL,NULL,NULL,NULL,1,0,0,NULL,0,1,150,1,'sDateToString(new Date())',0,0),
 (9772,102,3,'observacion','Observaciones',1,NULL,NULL,62,NULL,1,0,0,NULL,0,1,150,1,NULL,0,0),
 (9773,102,4,'proceso','Pendiente',0,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,400,1,NULL,0,0),
 (9774,102,4,'flujo','Tipo de solicitud',0,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,300,1,NULL,0,0),
 (9775,102,4,'proyecto','Proyecto',0,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,300,1,NULL,0,0),
 (9776,102,4,'responsable','Responable',0,NULL,NULL,NULL,NULL,0,0,0,NULL,0,1,250,1,NULL,0,0),
 (9777,102,4,'actividad','Actividad',0,NULL,NULL,NULL,NULL,1,0,0,NULL,0,0,400,1,'\"1\"',0,0),
 (9778,102,4,'alertar_con_anticipacion','Alertar con anticipación',1,NULL,NULL,NULL,NULL,1,0,0,NULL,0,1,10,1,NULL,0,0),
 (9779,102,4,'clave_actividad','Actividad',0,NULL,NULL,NULL,NULL,1,0,0,NULL,0,0,0,1,NULL,0,0),
 (9780,102,4,'clave_empleado_asignado','Empleado asignado',1,NULL,NULL,NULL,NULL,1,0,0,NULL,0,1,120,1,'document.getElementById(\'_ce_\').value',0,0),
 (9781,102,4,'clave_empleado_solicitante','Clave empleado solicitante',0,NULL,NULL,NULL,NULL,1,0,0,NULL,0,1,150,1,NULL,0,0),
 (9782,102,4,'clave_estatus','Estatus',1,NULL,NULL,NULL,NULL,1,0,0,NULL,0,1,75,1,NULL,0,0),
 (9783,102,4,'clave_flujo_forma','Flujo Forma',1,NULL,NULL,NULL,NULL,1,0,0,NULL,0,1,150,1,NULL,0,0),
 (9784,102,4,'clave_proyecto','proyecto',1,NULL,NULL,72,'3',1,0,0,NULL,0,1,150,1,NULL,0,0),
 (9785,102,4,'fecha_final','Fecha final',1,NULL,NULL,NULL,NULL,1,0,0,NULL,0,1,150,1,NULL,1,0),
 (9786,102,4,'fecha_inicial','Fecha inicial',1,NULL,NULL,NULL,NULL,1,0,0,NULL,0,1,150,1,'sDateToString(new Date())',0,0),
 (9787,102,4,'observacion','Observaciones',1,NULL,NULL,62,NULL,1,0,0,NULL,0,1,150,1,NULL,0,0),
 (9827,258,1,'apellido_paterno','Contraseña anterior',1,'password',NULL,NULL,NULL,1,0,0,NULL,0,0,NULL,1,NULL,0,0),
 (9828,258,1,'nombre','Confirme contraseña',1,'password',NULL,NULL,NULL,1,0,0,NULL,0,1,NULL,1,NULL,0,0),
 (9829,258,1,'password','Nueva contraseña',1,'password',NULL,NULL,NULL,1,0,0,NULL,0,1,NULL,1,NULL,0,0),
 (9830,258,1,'apellido_paterno','Contraseña anterior',1,'password',NULL,NULL,NULL,1,0,0,NULL,0,0,NULL,1,NULL,NULL,NULL),
 (9831,258,1,'nombre','Confirme contraseña',1,'password',NULL,NULL,NULL,1,0,0,NULL,0,1,NULL,1,NULL,NULL,NULL),
 (9832,258,1,'password','Nueva contraseña',1,'password',NULL,NULL,NULL,1,0,0,NULL,0,1,NULL,1,NULL,NULL,NULL),
 (9833,258,2,'apellido_paterno','Contraseña anterior',1,'password',NULL,NULL,NULL,1,0,0,NULL,0,0,NULL,1,NULL,0,0),
 (9834,258,2,'nombre','Confirme contraseña',1,'password',NULL,NULL,NULL,1,0,0,NULL,0,1,NULL,1,NULL,0,0),
 (9835,258,2,'password','Nueva contraseña',1,'password',NULL,NULL,NULL,1,0,0,NULL,0,1,NULL,1,NULL,0,0),
 (9836,258,2,'apellido_paterno','Contraseña anterior',1,'password',NULL,NULL,NULL,1,0,0,NULL,0,0,NULL,1,NULL,NULL,NULL),
 (9837,258,2,'nombre','Confirme contraseña',1,'password',NULL,NULL,NULL,1,0,0,NULL,0,1,NULL,1,NULL,NULL,NULL),
 (9838,258,2,'password','Nueva contraseña',1,'password',NULL,NULL,NULL,1,0,0,NULL,0,1,NULL,1,NULL,NULL,NULL),
 (9840,258,3,'apellido_paterno','Contraseña anterior',1,'password',NULL,NULL,NULL,1,0,0,NULL,0,0,NULL,1,NULL,0,0),
 (9841,258,3,'nombre','Confirme contraseña',1,'password',NULL,NULL,NULL,1,0,0,NULL,0,1,NULL,1,NULL,0,0),
 (9842,258,3,'password','Nueva contraseña',1,'password',NULL,NULL,NULL,1,0,0,NULL,0,1,NULL,1,NULL,0,0),
 (9843,258,3,'apellido_paterno','Contraseña anterior',1,'password',NULL,NULL,NULL,1,0,0,NULL,0,0,NULL,1,NULL,NULL,NULL),
 (9844,258,3,'nombre','Confirme contraseña',1,'password',NULL,NULL,NULL,1,0,0,NULL,0,1,NULL,1,NULL,NULL,NULL),
 (9845,258,3,'password','Nueva contraseña',1,'password',NULL,NULL,NULL,1,0,0,NULL,0,1,NULL,1,NULL,NULL,NULL),
 (9847,258,4,'apellido_paterno','Contraseña anterior',1,'password',NULL,NULL,NULL,1,0,0,NULL,0,0,NULL,1,NULL,0,0),
 (9848,258,4,'nombre','Confirme contraseña',1,'password',NULL,NULL,NULL,1,0,0,NULL,0,1,NULL,1,NULL,0,0),
 (9849,258,4,'password','Nueva contraseña',1,'password',NULL,NULL,NULL,1,0,0,NULL,0,1,NULL,1,NULL,0,0),
 (9850,258,4,'apellido_paterno','Contraseña anterior',1,'password',NULL,NULL,NULL,1,0,0,NULL,0,0,NULL,1,NULL,NULL,NULL),
 (9851,258,4,'nombre','Confirme contraseña',1,'password',NULL,NULL,NULL,1,0,0,NULL,0,1,NULL,1,NULL,NULL,NULL),
 (9852,258,4,'password','Nueva contraseña',1,'password',NULL,NULL,NULL,1,0,0,NULL,0,1,NULL,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `be_campo_forma` ENABLE KEYS */;


--
-- Definition of table `be_campo_plantilla`
--

DROP TABLE IF EXISTS `be_campo_plantilla`;
CREATE TABLE `be_campo_plantilla` (
  `clave_campo` int(11) NOT NULL AUTO_INCREMENT,
  `clave_plantilla` int(11) NOT NULL,
  `campo` varchar(50) NOT NULL,
  `valor` text,
  PRIMARY KEY (`clave_campo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `be_campo_plantilla`
--

/*!40000 ALTER TABLE `be_campo_plantilla` DISABLE KEYS */;
/*!40000 ALTER TABLE `be_campo_plantilla` ENABLE KEYS */;


--
-- Definition of table `be_configuracion`
--

DROP TABLE IF EXISTS `be_configuracion`;
CREATE TABLE `be_configuracion` (
  `claveParametro` int(11) NOT NULL AUTO_INCREMENT,
  `claveAplicacion` int(11) NOT NULL,
  `claveEmpleado` int(11) NOT NULL,
  `parametro` varchar(255) NOT NULL,
  `valor` text,
  PRIMARY KEY (`claveParametro`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `be_configuracion`
--

/*!40000 ALTER TABLE `be_configuracion` DISABLE KEYS */;
INSERT INTO `be_configuracion` (`claveParametro`,`claveAplicacion`,`claveEmpleado`,`parametro`,`valor`) VALUES 
 (1,1,1,'title','Infinite Clinical Research / Sistema de Administración de Formularios de Reportes Clínicos'),
 (2,1,1,'logo_plataforma','img/logo_plataforma.png'),
 (3,1,1,'escritorio.grid','app:23,entidad:276,wsParameters:,titulo:,openKardex:true,editingApp:23,inDesktop:true'),
 (4,1,1,'escritorio.grid','app:23,entidad:276,wsParameters:,titulo:,openKardex:true,editingApp:23,inDesktop:true');
/*!40000 ALTER TABLE `be_configuracion` ENABLE KEYS */;


--
-- Definition of table `be_consulta_forma`
--

DROP TABLE IF EXISTS `be_consulta_forma`;
CREATE TABLE `be_consulta_forma` (
  `clave_consulta` int(11) NOT NULL AUTO_INCREMENT,
  `clave_forma` int(11) NOT NULL,
  `clave_perfil` int(11) NOT NULL,
  `consulta` longtext NOT NULL,
  `tipo_accion` varchar(20) NOT NULL,
  PRIMARY KEY (`clave_consulta`)
) ENGINE=InnoDB AUTO_INCREMENT=3076 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `be_consulta_forma`
--

/*!40000 ALTER TABLE `be_consulta_forma` DISABLE KEYS */;
INSERT INTO `be_consulta_forma` (`clave_consulta`,`clave_forma`,`clave_perfil`,`consulta`,`tipo_accion`) VALUES 
 (3,2,1,'select clave_aplicacion, aplicacion, clave_aplicacion_padre,descripcion, autor, app_url,ayuda, orden from be_aplicacion ap where clave_aplicacion = $pk','insert'),
 (10,2,1,'select app.clave_aplicacion, app.aplicacion, (select aplicacion from be_aplicacion where clave_aplicacion=app.clave_aplicacion_padre) as clave_aplicacion_padre,\r\nea.estatus as clave_estatus \r\nfrom be_aplicacion app, be_estatus_aplicacion ea \r\nwhere app.clave_estatus = ea.clave_estatus','select'),
 (16,2,1,'SELECT * FROM be_aplicacion app WHERE app.clave_aplicacion=$pk','update'),
 (18,2,1,'select aplicacion, clave_forma_principal, descripcion,   autor, version, clave_estatus, app_url, ayuda from be_aplicacion where clave_aplicacion=$pk','lookup'),
 (19,1,1,'select c.claveParametro,  a.aplicacion as clave_aplicacion, \nconcat(e.nombre,\' \',e.apellidos) as clave_empleado, \nc.parametro, c.valor\nfrom be_configuracion c, be_empleado e, be_aplicacion a\nwhere c.claveAplicacion=a.clave_aplicacion and\nc.claveEmpleado=e.clave_empleado','select'),
 (20,1,1,'select * from be_configuracion where claveParametro=$pk','insert'),
 (21,5,1,'select * from be_perfil','select'),
 (22,3,1,'SELECT clave_forma, forma FROM be_forma a','select'),
 (24,5,1,'SELECT * FROM be_perfil WHERE clave_perfil=$pk','insert'),
 (25,10,1,'SELECT * FROM be_perfil_aplicacion WHERE clave_perfil_aplicacion=$pk','insert'),
 (26,3,1,'select * from be_forma where clave_forma=$pk','insert'),
 (27,2,1,'/*Forma padre de la aplicacion - No se ejecuta*/\nselect \'0\' as clave_nodo_padre,\n\'aplicacion-$pk\' as clave_nodo, icono, tabla as rel,\n(select aplicacion from be_aplicacion where clave_aplicacion=$pk) as texto_nodo,\n\'open\' as state,\n\'\' as onclick,\n\'0\' as refresca_arbol\nfrom be_forma where clave_aplicacion=1 and clave_forma_padre is null\nunion\n/*Formas - se proporciona Aplicacion, Forma y Titulo*/\nselect \'aplicacion-$pk\' as clave_nodo_padre,\nconcat(\'forma-1-\',clave_forma,\'-a.clave_aplicacion=$pk\')  as clave_nodo,\nicono, tabla, forma as texto_nodo,\n\'closed\' as state,\n\'showGrid\' as onclick,\n\'1\' as refresca_arbol\nfrom be_forma where clave_aplicacion=1 and clave_forma_padre IN (\nselect clave_forma FROM be_forma WHERE clave_aplicacion=1 AND clave_forma_padre IS NULL)\nunion\n/*Formas - Detalle de las formas */\nselect \'forma-1-3-a.clave_aplicacion=$pk\' as clave_nodo_padre,\n    concat(\'foraneo-\',clave_forma) as clave_nodo,\n    \'img/form5.png\' as icono, \'forma_detalle\' as rel, forma as texto_nodo,\n\'closed\' as state,\n\'\' as onclick,\n\'0\' as refresca_arbol\nfrom be_forma where clave_aplicacion=$pk\nunion \n/* Perfiles */\nselect concat(\'foraneo-\',clave_forma) as clave_nodo_padre,\nconcat(\'perfiles-1-14-pf.clave_forma=\',clave_forma,\'-4=clave_forma=\',clave_forma) as clave_nodo,\n\'img/perfiles10.png\' as icono,\n\'perfiles\' as rel, \'Perfiles de la forma\' as texto_nodo,\n\'closed\' as state,\n\'showGrid\' as onclick,\n\'1\' as refresca_arbol\nfrom be_forma where clave_aplicacion=$pk\nunion\n/*Formas - Detalle de los permisos */\nselect concat(\'perfiles-1-14-pf.clave_forma=\',clave_forma,\'-4=clave_forma=\',clave_forma) as clave_nodo_padre,\nconcat(\'perfilxforma-\',f.clave_forma,\'-\',p1.clave_perfil) as clave_nodo,\n\'img/permiso1.png\' as icono, \'permiso\' as rel, perfil,\n\'closed\' as state,\n\'\' as onclick,\n\'0\' as refresca_arbol\nfrom be_perfil_aplicacion p1, be_perfil p2, be_forma f where p1.clave_perfil=p2.clave_perfil and\np1.clave_aplicacion=$pk and f.clave_aplicacion=$pk\nunion\n/* Consultas - se proporciona Aplicacion, Forma, Titulo y Filtro*/\nselect concat(\'perfilxforma-\',cf.clave_forma,\'-\', pa.clave_perfil) as clave_nodo_padre,\nconcat(\'consultas-1-8-clave_forma=\',cf.clave_forma,\' AND clave_perfil=\',pa.clave_perfil,\'-4=clave_perfil=\',pa.clave_perfil,\'-5=clave_forma=\',cf.clave_forma) as clave_nodo,\n\'img/consultas4.png\' as icono,\n\'consultas\', \'Consultas\' as texto_nodo,\n\'closed\' as state,\n\'showGrid\' as onclick,\n\'0\' as refresca_arbol\nfrom be_forma cf, be_perfil_aplicacion pa\nwhere cf.clave_aplicacion=$pk\nand pa.clave_aplicacion=$pk\nunion\n/* Diccionario de datos - se proporciona Aplicacion, Forma, Titulo y Filtro*/\nselect concat(\'perfilxforma-\',cf.clave_forma,\'-\',pa.clave_perfil) as clave_padre,\nconcat(\'campos-1-13-clave_forma=\',cf.clave_forma,\' AND clave_perfil=\',pa.clave_perfil,\'-4=clave_forma=\',cf.clave_forma,\'-5=clave_perfil=\',pa.clave_perfil)  as clave_nodo,\n\'img/campos1.png\' as icono,\n\'campos\' as rel, \'Definición de campos\' as texto_nodo,\n\'closed\' as state,\n\'showGrid\' as onclick,\n\'0\' as refresca_arbol\nfrom be_campo_forma cf, be_perfil_aplicacion pa\nwhere cf.clave_forma IN (SELECT clave_forma FROM be_forma WHERE clave_aplicacion=$pk)\nand pa.clave_aplicacion=$pk\nunion\n/* Reportes - se proporciona Aplicacion, Forma, Titulo y Filtro */\nselect concat(\'perfilxforma-\',cf.clave_forma,\'-\',pa.clave_perfil) as clave_padre,\nconcat(\'campos-1-265-clave_forma=\',cf.clave_forma,\' AND clave_perfil=\',pa.clave_perfil,\'-4=clave_forma=\',cf.clave_forma,\'-5=clave_perfil=\',pa.clave_perfil)  as clave_nodo,\n\'img/propiedades_proyecto_4.png\' as icono,\n\'reportes\' as rel, \'Reportes\' as texto_nodo,\n\'closed\' as state,\n\'showGrid\' as onclick,\n\'0\' as refresca_arbol\nfrom be_campo_forma cf, be_perfil_aplicacion pa\nwhere cf.clave_forma IN (SELECT clave_forma FROM be_forma WHERE clave_aplicacion=$pk)\nand pa.clave_aplicacion=$pk\norder by texto_nodo','children'),
 (28,1,1,'select 0 as clave_forma_padre, clave_forma, icono, tabla, clave_aplicacion,forma\nfrom be_forma where clave_aplicacion=1 and clave_forma=1\nunion\nselect clave_forma_padre as clave_padre, clave_forma, icono, tabla, clave_aplicacion,forma\nfrom be_forma where clave_aplicacion=1 and clave_forma_padre IN (\nSELECT clave_forma FROM be_forma WHERE clave_aplicacion=1 AND clave_forma_padre=1)\nORDER BY clave_forma_padre ,clave_forma','children'),
 (29,3,1,'select 0 as clave_forma_padre, clave_aplicacion, clave_forma, tabla, llave_primaria,forma\nfrom be_forma where clave_aplicacion=1 and clave_forma=3\nunion\nselect clave_forma_padre as clave_padre, clave_aplicacion, clave_forma, tabla, llave_primaria,forma\nfrom be_forma where clave_aplicacion=1 and clave_forma_padre IN (\nselect clave_forma from be_forma where clave_aplicacion=1 and clave_forma=3\n)\nORDER BY clave_forma_padre ,clave_forma','children'),
 (31,6,1,'select 0 as clave_forma_padre, clave_aplicacion, clave_forma, tabla, llave_primaria,forma\nfrom be_forma where clave_aplicacion=1 and clave_forma=6\nunion\nselect clave_forma_padre as clave_padre, clave_aplicacion, clave_forma, tabla, llave_primaria,forma\nfrom be_forma where clave_aplicacion=1 and clave_forma_padre IN (\nselect clave_forma from be_forma where clave_aplicacion=1 and clave_forma=6\n)\nORDER BY clave_forma_padre ,clave_forma','children'),
 (32,5,1,'select \'0\' as clave_nodo_padre, \'perfil-\'+convert(varchar,clave_perfil) as clave_nodo, \'img/perfiles10.png\' as icono, \'Perfiles\' as rel, perfil as texto_nodo FROM be_perfil','children'),
 (33,1,1,'select * from be_configuracion where claveParametro=$pk','update'),
 (34,6,1,'SELECT clave_empleado, concat(nombre,\' \',apellidos) as nombre FROM be_empleado e','select'),
 (35,8,1,'select * from be_consulta_forma','select'),
 (36,3,1,'SELECT clave_forma, concat((SELECT be_aplicacion.aplicacion FROM be_aplicacion WHERE be_aplicacion.clave_aplicacion=be_forma.clave_aplicacion),\' / \',forma) as forma FROM be_forma WHERE clave_aplicacion>0 ORDER BY clave_aplicacion, forma','foreign'),
 (37,11,1,'select clave_estatus,estatus from be_estatus_forma','foreign'),
 (38,11,1,'select * from be_estatus_forma','select'),
 (39,11,1,'select * from be_estatus_forma where clave_estatus=$pk','insert'),
 (40,11,1,'select * from be_estatus_forma where clave_estatus=$pk','update'),
 (41,3,1,'select * from be_forma where clave_forma=$pk','update'),
 (42,2,1,'select clave_aplicacion, aplicacion from be_aplicacion','foreign'),
 (46,13,1,'select distinct campo, campo from be_campo_forma','foreign'),
 (47,13,1,'select clave_campo,campo,alias_campo, tamano from be_campo_forma','select'),
 (51,14,1,'select pf.clave_permiso_forma, p.perfil as clave_perfil, f.forma as clave_forma, p2.permiso as clave_permiso \nfrom be_perfil p, be_forma f, be_permiso_forma pf, be_permiso p2\n where pf.clave_perfil=p.clave_perfil\n and pf.clave_forma=f.clave_forma \nand pf.clave_permiso=p2.clave_permiso','select'),
 (52,8,1,'select * from be_consulta_forma where clave_consulta=$pk','insert'),
 (53,8,1,'select * from be_consulta_forma where clave_consulta=$pk','update'),
 (59,15,1,'select * from be_tipo_accion where tipo_accion=\'$pk\'','insert'),
 (60,15,1,'select * from be_tipo_accion where tipo_accion = \'$pk\'','update'),
 (61,15,1,'select tipo_accion as clave_tipo_accion, tipo_accion from be_tipo_accion','foreign'),
 (62,10,1,'select clave_perfil\nfrom be_perfil_aplicacion\nwhere clave_aplicacion=$pk','children'),
 (63,14,1,'select clave_perfil,clave_permiso, clave_forma from be_permiso_forma \nwhere clave_forma=$pk','children'),
 (64,16,1,'select \'0\' as clave_nodo_padre,\n\'perfil-\' +  convert(varchar,clave_perfil) as clave_nodo,\n\'img/perfiles10.png\' as icono, \'perfil\' as rel, perfil as texto_nodo,\n\'open\' as state,\n\'\' as onclick \nfrom be_perfil\n union\n/*Permisos*/\nselect \'perfil-\' + convert(varchar,clave_perfil) as clave_nodo_padre,\n\'permiso-\' +  convert(varchar,clave_perfil) + \'-\' + convert(varchar,clave_permiso) as clave_nodo,\n\'img/permiso1.png\' as icono, \'permiso\' as rel, permiso as texto_nodo,\n\'closed\' as state,\n\'\' as onclick\n from be_permiso, be_perfil','children'),
 (67,13,1,'select * from be_campo_forma where clave_campo=$pk','insert'),
 (68,13,1,'select * from be_campo_forma where clave_campo=$pk','update'),
 (70,5,1,'select clave_perfil, perfil from be_perfil','foreign'),
 (75,6,1,'SELECT clave_empleado, nombre, apellidos, foto, email, password, clave_perfil, activo , cambia_password FROM be_empleado WHERE clave_empleado=$pk','insert'),
 (76,6,1,'SELECT clave_empleado, nombre, apellidos, foto, email, password, clave_perfil, activo , cambia_password FROM be_empleado WHERE clave_empleado=$pk','update'),
 (77,10,1,'SELECT * FROM be_perfil_aplicacion WHERE clave_perfil_aplicacion=$pk','update'),
 (80,5,1,'SELECT * FROM be_perfil WHERE clave_perfil=$pk','update'),
 (191,10,1,'select clave_perfil_aplicacion, p.perfil as clave_perfil, a.aplicacion as clave_aplicacion from \r\nbe_perfil p, be_perfil_aplicacion pa, be_aplicacion a\r\nwhere p.clave_perfil=pa.clave_perfil \r\nand pa.clave_aplicacion=a.clave_aplicacion','select'),
 (205,14,1,'select * from be_permiso_forma where clave_permiso_forma=$pk','insert'),
 (206,14,1,'select * from be_permiso_forma where clave_permiso_forma=$pk','update'),
 (207,16,1,'select *  from be_permiso','foreign'),
 (208,10,1,'select clave_perfil, perfil from be_perfil','foreign'),
 (246,93,1,'select * from be_filtro where clave_filtro=$pk','insert'),
 (247,93,1,'select * from be_filtro where clave_filtro=$pk','update'),
 (248,93,1,'select * from be_filtro where clave_empleado=%clave_empleado','select'),
 (249,1,1,'select claveEmpleado, parametro, valor from be_configuracion where claveParametro=$pk','lookup'),
 (250,3,1,'select * from be_forma where clave_forma=$pk','lookup'),
 (717,179,1,'SELECT * FROM be_tipo_control WHERE clave_tipo_control=$pk','insert'),
 (718,179,1,'SELECT * FROM be_tipo_control WHERE clave_tipo_control=$pk','update'),
 (719,179,1,'SELECT * FROM be_tipo_control','select'),
 (720,179,1,'SELECT * FROM be_tipo_control','foreign'),
 (1687,2,1,'select ba.clave_bitacora, ba.fecha,\ncase isnull(foto)\nwhen 1 then \'<img src=\"img/alguien.jpg\" class=\"bitacora\" />\'\nelse concat(\'<img src=\"\',foto,\'\" class=\"bitacora\" />\') end as foto,\nconcat(e.nombre,\' \',e.apellidos) as nombre,\nte.tipo_evento as clave_tipo_evento,\nlower(f.alias_tab) as entidad,\np.aplicacion as descripcion_entidad,\nba.clave_forma,\nba.clave_registro\nfrom be_bitacora ba,\nbe_empleado e, be_tipo_evento te,be_forma f, be_aplicacion p\nwhere \nba.clave_empleado=e.clave_empleado\nand ba.clave_tipo_evento=te.clave_tipo_evento\nand ba.clave_forma=f.clave_forma\nand ba.clave_tipo_evento IN (1,2) \nand p.clave_aplicacion = ba.clave_registro\nand ba.clave_forma=2','log'),
 (1688,8,1,'select b.clave_bitacora, b.fecha,\r\ncase isnull(foto)\r\nwhen 1 then \'<img src=\"img/alguien.jpg\"  class=\"bitacora\" />\'\r\nelse concat(\'<img src=\"\',foto,\'\" class=\"bitacora\" />\') end as foto,\r\nconcat(e.nombre,\' \',e.apellidos) as nombre,\r\nte.tipo_evento as clave_tipo_evento,\r\nlower(f.alias_tab) as entidad,\r\np.tipo_accion as descripcion_entidad,\r\nb.clave_forma,\r\nb.clave_registro\r\nfrom be_bitacora b,\r\nbe_empleado e, be_tipo_evento te,be_forma f, be_consulta_forma p\r\nwhere \r\nb.clave_empleado=e.clave_empleado\r\nand b.clave_tipo_evento=te.clave_tipo_evento\r\nand b.clave_forma=f.clave_forma\r\nand b.clave_tipo_evento IN (1,2) \r\nand p.clave_consulta = b.clave_registro\r\nand b.clave_forma=8','log'),
 (1689,13,1,'select b.clave_bitacora, b.fecha,\r\ncase isnull(foto)\r\nwhen 1 then \'<img src=\"img/alguien.jpg\"  class=\"bitacora\" />\'\r\nelse concat(\'<img src=\"\',foto,\'\" class=\"bitacora\" />\') end as foto,\r\nconcat(e.nombre,\' \',e.apellidos) as nombre,\r\nte.tipo_evento as clave_tipo_evento,\r\nlower(f.alias_tab) as entidad,\r\np.tipo_accion as descripcion_entidad,\r\nb.clave_forma,\r\nb.clave_registro\r\nfrom be_bitacora b,\r\nbe_empleado e, be_tipo_evento te,be_forma f, be_consulta_forma p\r\nwhere \r\nb.clave_empleado=e.clave_empleado\r\nand b.clave_tipo_evento=te.clave_tipo_evento\r\nand b.clave_forma=f.clave_forma\r\nand b.clave_tipo_evento IN (1,2) \r\nand p.clave_consulta = b.clave_registro\r\nand b.clave_forma=13','log'),
 (1690,11,1,'select ba.clave_bitacora, ba.fecha_bitacora,\ncase isnull(foto,\'0\')\nwhen \'0\' then \'<img src=\"img/alguien.jpg\"  class=\"bitacora\" />\'\nelse \'<img src=\"\' + foto +\'\" class=\"bitacora\" />\' end as foto,\ne.nombre + \' \' + e.apellidos as nombre,\nte.tipo_evento as clave_tipo_evento,\nlower(f.alias_tab) as entidad,\np.estatus as descripcion_entidad,\nba.clave_forma,\nba.clave_registro\nfrom bitacora_aplicacion ba,\nbe_empleado e, be_tipo_evento te,be_forma f, estatus_forma p\nwhere \nba.clave_empleado=e.clave_empleado\nand ba.clave_tipo_evento=te.clave_tipo_evento\nand ba.clave_forma=f.clave_forma\nand ba.clave_tipo_evento IN (1,2) \nand p.clave_estatus = ba.clave_registro\nand ba.clave_forma=11','log'),
 (1692,3,1,'select b.clave_bitacora, b.fecha,\r\ncase isnull(foto)\r\nwhen 1 then \'<img src=\"img/alguien.jpg\"  class=\"bitacora\" />\'\r\nelse concat(\'<img src=\"\',foto,\'\" class=\"bitacora\" />\') end as foto,\r\nconcat(e.nombre,\' \',e.apellidos) as nombre,\r\nte.tipo_evento as clave_tipo_evento,\r\nlower(f.alias_tab) as entidad,\r\np.forma as descripcion_entidad,\r\nb.clave_forma,\r\nb.clave_registro\r\nfrom be_bitacora b,\r\nbe_empleado e, be_tipo_evento te,be_forma f, be_forma p\r\nwhere \r\nb.clave_empleado=e.clave_empleado\r\nand b.clave_tipo_evento=te.clave_tipo_evento\r\nand b.clave_forma=f.clave_forma\r\nand b.clave_tipo_evento IN (1,2) \r\nand p.clave_forma = b.clave_registro\r\nand b.clave_forma=3','log'),
 (1693,10,1,'select b.clave_bitacora, b.fecha,\r\ncase isnull(foto)\r\nwhen 1 then \'<img src=\"img/alguien.jpg\"  class=\"bitacora\" />\'\r\nelse concat (\'<img src=\"\',foto,\'\" class=\"bitacora\" />\') end as foto,\r\nconcat(e.nombre,\' \',e.apellidos) as nombre,\r\nte.tipo_evento as clave_tipo_evento,\r\nlower(f.alias_tab) as entidad,\r\n(SELECT perfil FROM be_perfil WHERE clave_perfil=p.clave_perfil ) as descripcion_entidad,\r\nb.clave_forma,\r\nb.clave_registro\r\nfrom be_bitacora b,\r\nbe_empleado e, be_tipo_evento te,be_forma f, be_perfil_aplicacion p\r\nwhere \r\nb.clave_empleado=e.clave_empleado\r\nand b.clave_tipo_evento=te.clave_tipo_evento\r\nand b.clave_forma=f.clave_forma\r\nand b.clave_tipo_evento IN (1,2) \r\nand p.clave_perfil_aplicacion = b.clave_registro\r\nand b.clave_forma=10','log'),
 (1865,2,1,'select * from estatus_orden_compra','foreign'),
 (1928,101,1,'SELECT clave_actividad,\nactividad, \nclave_empleado_solicitante, \nfecha_inicial, \nfecha_final, \nobservacion \nfrom be_actividad\nwhere \nbe_actividad.clave_estatus=0 AND\nbe_actividad.clave_empleado_asignado=%clave_empleado','select'),
 (1977,102,1,'SELECT clave_actividad,\r\nactividad, \r\nclave_empleado_solicitante, \r\nfecha_inicial, \r\nfecha_final, \r\nobservacion \r\nfrom be_actividad\r\nwhere \r\nbe_actividad.clave_estatus=0 AND\r\nbe_actividad.clave_empleado_asignado=%clave_empleado','select'),
 (2452,101,1,'select clave_actividad, observacion from be_actividad where clave_actividad=$pk','update'),
 (2453,1,1,'select b.clave_bitacora, b.fecha,\r\ncase isnull(foto)\r\nwhen 1 then \'<img src=\"img/alguien.jpg\"  class=\"bitacora\" />\'\r\nelse concat(\'<img src=\"\',foto,\'\" class=\"bitacora\" />\') end as foto,\r\ne.nombre + \' \' + e.apellidos as nombre,\r\nte.tipo_evento as clave_tipo_evento,\r\nlower(f.alias_tab) as entidad,\r\np.tipo_accion as descripcion_entidad,\r\nb.clave_forma,\r\nb.clave_registro\r\nfrom be_bitacora b,\r\nbe_empleado e, be_tipo_evento te,be_forma f, be_consulta_forma p\r\nwhere \r\nb.clave_empleado=e.clave_empleado\r\nand b.clave_tipo_evento=te.clave_tipo_evento\r\nand b.clave_forma=f.clave_forma\r\nand b.clave_tipo_evento IN (1,2) \r\nand p.clave_consulta = b.clave_registro\r\nand b.clave_forma=1','log'),
 (2454,14,1,'select b.clave_bitacora, b.fecha,\r\ncase isnull(foto)\r\nwhen 1 then \'<img src=\"img/alguien.jpg\"  class=\"bitacora\" />\'\r\nelse concat(\'<img src=\"\',foto,\'\" class=\"bitacora\" />\') end as foto,\r\nconcat(e.nombre,\' \',e.apellidos) as nombre,\r\nte.tipo_evento as clave_tipo_evento,\r\nlower(f.alias_tab) as entidad,\r\np.tipo_accion as descripcion_entidad,\r\nb.clave_forma,\r\nb.clave_registro\r\nfrom be_bitacora b,\r\nbe_empleado e, be_tipo_evento te,be_forma f, be_consulta_forma p\r\nwhere \r\nb.clave_empleado=e.clave_empleado\r\nand b.clave_tipo_evento=te.clave_tipo_evento\r\nand b.clave_forma=f.clave_forma\r\nand b.clave_tipo_evento IN (1,2) \r\nand p.clave_consulta = b.clave_registro\r\nand b.clave_forma=14','log'),
 (2455,6,1,'select ba.clave_bitacora, ba.fecha,\r\ncase isnull(foto)\r\nwhen 1 then \'<img src=\"img/alguien.jpg\" class=\"bitacora\" />\'\r\nelse concat(\'<img src=\"\',foto,\'\" class=\"bitacora\" />\') end as foto,\r\nconcat(e.nombre,\' \',e.apellidos) as nombre,\r\nte.tipo_evento as clave_tipo_evento,\r\nlower(f.alias_tab) as entidad,\r\np.aplicacion as descripcion_entidad,\r\nba.clave_forma,\r\nba.clave_registro\r\nfrom be_bitacora ba,\r\nbe_empleado e, be_tipo_evento te,be_forma f, be_aplicacion p\r\nwhere \r\nba.clave_empleado=e.clave_empleado\r\nand ba.clave_tipo_evento=te.clave_tipo_evento\r\nand ba.clave_forma=f.clave_forma\r\nand ba.clave_tipo_evento IN (1,2) \r\nand p.clave_aplicacion = ba.clave_registro\r\nand ba.clave_forma=6','log'),
 (2456,5,1,'select ba.clave_bitacora, ba.fecha,\r\ncase isnull(foto)\r\nwhen 1 then \'<img src=\"img/alguien.jpg\" class=\"bitacora\" />\'\r\nelse concat(\'<img src=\"\',foto,\'\" class=\"bitacora\" />\') end as foto,\r\nconcat(e.nombre,\' \',e.apellidos) as nombre,\r\nte.tipo_evento as clave_tipo_evento,\r\nlower(f.alias_tab) as entidad,\r\np.aplicacion as descripcion_entidad,\r\nba.clave_forma,\r\nba.clave_registro\r\nfrom be_bitacora ba,\r\nbe_empleado e, be_tipo_evento te,be_forma f, be_aplicacion p\r\nwhere \r\nba.clave_empleado=e.clave_empleado\r\nand ba.clave_tipo_evento=te.clave_tipo_evento\r\nand ba.clave_forma=f.clave_forma\r\nand ba.clave_tipo_evento IN (1,2) \r\nand p.clave_aplicacion = ba.clave_registro\r\nand ba.clave_forma=5','log'),
 (2583,265,1,'select *, (select count(clave_parametro) from be_parametro_reporte where clave_reporte=be_reporte.clave_reporte) as parametros  from be_reporte','select'),
 (2584,265,1,'select * from be_reporte where clave_reporte=$pk','insert'),
 (2585,265,1,'select * from be_reporte where clave_reporte=$pk','update'),
 (2586,265,1,'select ba.clave_bitacora, ba.fecha, case isnull(foto)\n when 1 then \'<img src=\"img/alguien.jpg\" class=\"bitacora\" />\'\n else concat(\'<img src=\"\',foto,\'\" class=\"bitacora\" />\') end as foto,\n concat(e.nombre,\' \',e.apellidos) as nombre,\n te.tipo_evento as clave_tipo_evento,\n lower(f.alias_tab) as entidad,\n x.clave_reporte as descripcion_entidad,\n ba.clave_forma,\n ba.clave_registro\n from be_bitacora ba, \n be_empleado e, be_tipo_evento te,be_forma f,\nbe_reporte x\n where ba.clave_empleado=e.clave_empleado\n and ba.clave_tipo_evento=te.clave_tipo_evento\n and ba.clave_forma=f.clave_forma\n and ba.clave_tipo_evento IN (2,3)\n and clave_reporte= ba.clave_registro\n and ba.clave_forma=265\norder by  ba.fecha desc limit 1,10','log'),
 (2587,266,1,'select * from be_parametro_reporte','select'),
 (2588,266,1,'select * from be_parametro_reporte where clave_parametro=$pk','insert'),
 (2589,266,1,'select * from be_parametro_reporte where clave_parametro=$pk','update'),
 (2590,266,1,'select ba.clave_bitacora, ba.fecha, case isnull(foto), \n when 1 then \'<img src=\"img/alguien.jpg\" class=\"bitacora\" />\'\n else concat(\'<img src=\"\',foto,\'\" class=\"bitacora\" />\') end as foto,\n concat(e.nombre,\' \',e.apellidos) as nombre,\n te.tipo_evento as clave_tipo_evento,\n lower(f.alias_tab) as entidad,\n x.clave_parametro as descripcion_entidad,\n ba.clave_forma,\n ba.clave_registro\n from be_bitacora ba\n be_empleado e, be_tipo_evento te,be_forma f,\nbe_parametro_reporte x\n where ba.clave_empleado=e.clave_empleado\n and ba.clave_tipo_evento=te.clave_tipo_evento\n and ba.clave_forma=f.clave_forma\n and ba.clave_tipo_evento IN (2,3)\n and clave_parametro= ba.clave_registro\n and ba.clave_forma=266\n ba.fecha desc limit 1,10','log'),
 (2591,267,1,'select * from be_tipo_reporte','select'),
 (2592,267,1,'select * from be_tipo_reporte where clave_tipo_reporte=$pk','insert'),
 (2593,267,1,'select * from be_tipo_reporte where clave_tipo_reporte=$pk','update'),
 (2594,267,1,'select ba.clave_bitacora, ba.fecha, case isnull(foto), \n when 1 then \'<img src=\"img/alguien.jpg\" class=\"bitacora\" />\'\n else concat(\'<img src=\"\',foto,\'\" class=\"bitacora\" />\') end as foto,\n concat(e.nombre,\' \',e.apellidos) as nombre,\n te.tipo_evento as clave_tipo_evento,\n lower(f.alias_tab) as entidad,\n x.clave_tipo_reporte as descripcion_entidad,\n ba.clave_forma,\n ba.clave_registro\n from be_bitacora ba\n be_empleado e, be_tipo_evento te,be_forma f,\nbe_tipo_reporte x\n where ba.clave_empleado=e.clave_empleado\n and ba.clave_tipo_evento=te.clave_tipo_evento\n and ba.clave_forma=f.clave_forma\n and ba.clave_tipo_evento IN (2,3)\n and clave_tipo_reporte= ba.clave_registro\n and ba.clave_forma=267\n ba.fecha desc limit 1,10','log'),
 (2595,267,1,'SELECT clave_tipo_reporte,tipo_reporte FROM be_tipo_reporte','foreign'),
 (2644,6,1,'select clave_empleado, concat(nombre, \' \', apellidos) as nombre from be_empleado','foreign'),
 (2664,282,1,'select clave_empleado,nombre, apellidos, email,  IF(activo=1,\'Si\',\'No\')  as activo from be_empleado where clave_perfil=2','select'),
 (2665,282,1,'select clave_empleado, nombre, apellidos, email, password, clave_perfil, activo, cambia_password from be_empleado where clave_empleado=$pk','insert'),
 (2666,282,1,'select clave_empleado, nombre, apellidos, email, password, clave_perfil, activo, cambia_password from be_empleado where clave_empleado=$pk','update'),
 (2667,282,1,'select ba.clave_bitacora, ba.fecha, case isnull(e.foto) \n when 1 then \'<img src=\"img/alguien.jpg\" class=\"bitacora\" />\'\n else concat(\'<img src=\"\',e.foto,\'\" class=\"bitacora\" />\') end as foto,\n concat(e.nombre,\' \',e.apellidos) as nombre,\n te.tipo_evento as clave_tipo_evento,\n lower(f.alias_tab) as entidad,\n x.clave_empleado as descripcion_entidad,\n ba.clave_forma,\n ba.clave_registro\n from be_bitacora ba,\n be_empleado e, be_tipo_evento te,be_forma f,\nbe_empleado x\n where ba.clave_empleado=e.clave_empleado\n and ba.clave_tipo_evento=te.clave_tipo_evento\n and ba.clave_forma=f.clave_forma\n and ba.clave_tipo_evento IN (2,3)\n and e.clave_empleado= ba.clave_registro\n and ba.clave_forma=282\n order by ba.fecha desc limit 1,10','log'),
 (2668,283,1,'select clave_empleado,nombre, apellidos, email,  IF(activo=1,\'Si\',\'No\')  as activo from be_empleado where clave_perfil=3','select'),
 (2669,283,1,'select clave_empleado, nombre, apellidos, email, password, clave_perfil, activo, cambia_password from be_empleado where clave_empleado=$pk','insert'),
 (2670,283,1,'select clave_empleado, nombre, apellidos, email, password, clave_perfil, activo, cambia_password from be_empleado where clave_empleado=$pk','update'),
 (2671,283,1,'select ba.clave_bitacora, ba.fecha, case isnull(e.foto) \n when 1 then \'<img src=\"img/alguien.jpg\" class=\"bitacora\" />\'\n else concat(\'<img src=\"\',e.foto,\'\" class=\"bitacora\" />\') end as foto,\n concat(e.nombre,\' \',e.apellidos) as nombre,\n te.tipo_evento as clave_tipo_evento,\n lower(f.alias_tab) as entidad,\n x.clave_empleado as descripcion_entidad,\n ba.clave_forma,\n ba.clave_registro\n from be_bitacora ba,\n be_empleado e, be_tipo_evento te,be_forma f,\nbe_empleado x\n where ba.clave_empleado=e.clave_empleado\n and ba.clave_tipo_evento=te.clave_tipo_evento\n and ba.clave_forma=f.clave_forma\n and ba.clave_tipo_evento IN (2,3)\n and e.clave_empleado= ba.clave_registro\n and ba.clave_forma=283\n order by ba.fecha desc limit 1,10','log'),
 (2677,282,1,'select clave_empleado, concat(nombre,\' \',apellidos) as nombre from be_empleado where clave_perfil=2','foreign'),
 (2678,283,1,'select clave_empleado, concat(nombre,\' \',apellidos) as nombre from be_empleado where clave_perfil=3','foreign'),
 (2679,285,1,'select clave_empleado,nombre, apellidos, email,  IF(activo=1,\'Si\',\'No\')  as activo from be_empleado where clave_perfil=4','select'),
 (2680,285,1,'select clave_empleado, nombre, apellidos, email, password, clave_perfil, activo, cambia_password from be_empleado where clave_empleado=$pk','insert'),
 (2681,285,1,'select clave_empleado, nombre, apellidos, email, password, clave_perfil, activo, cambia_password from be_empleado where clave_empleado=$pk','update'),
 (2682,285,1,'select ba.clave_bitacora, ba.fecha, case isnull(foto) \n when 1 then \'<img src=\"img/alguien.jpg\" class=\"bitacora\" />\'\n else concat(\'<img src=\"\',foto,\'\" class=\"bitacora\" />\') end as foto,\n concat(e.nombre,\' \',e.apellidos) as nombre,\n te.tipo_evento as clave_tipo_evento,\n lower(f.alias_tab) as entidad,\n x.clave_empleado as descripcion_entidad,\n ba.clave_forma,\n ba.clave_registro\n from be_bitacora ba,\n be_empleado e, be_tipo_evento te,be_forma f,\nbe_empleado x\n where ba.clave_empleado=e.clave_empleado\n and ba.clave_tipo_evento=te.clave_tipo_evento\n and ba.clave_forma=f.clave_forma\n and ba.clave_tipo_evento IN (2,3)\n and clave_empleado= ba.clave_registro\n and ba.clave_forma=285\n order by ba.fecha desc limit 1,10','log'),
 (2687,285,1,'select clave_empleado, concat(nombre,\' \',apellidos) as nombre from be_empleado where clave_perfil=4','foreign'),
 (3033,101,2,'SELECT clave_actividad,\nactividad, \nclave_empleado_solicitante, \nfecha_inicial, \nfecha_final, \nobservacion \nfrom be_actividad\nwhere \nbe_actividad.clave_estatus=0 AND\nbe_actividad.clave_empleado_asignado=%clave_empleado','select'),
 (3034,101,2,'select clave_actividad, observacion from be_actividad where clave_actividad=$pk','update'),
 (3036,101,3,'SELECT clave_actividad,\nactividad, \n(select concat(nombre,\' \', apellidos) from be_empleado where clave_empleado=clave_empleado_solicitante) as clave_empleado_solicitante, \nfecha_inicial, \nfecha_final, \nobservacion \nfrom be_actividad\nwhere \nbe_actividad.clave_estatus=0 AND\nbe_actividad.clave_empleado_asignado=%clave_empleado','select'),
 (3037,101,3,'select clave_actividad, observacion from be_actividad where clave_actividad=$pk','update'),
 (3039,101,4,'SELECT clave_actividad,\nactividad, \nclave_empleado_solicitante, \nfecha_inicial, \nfecha_final, \nobservacion \nfrom be_actividad\nwhere \nbe_actividad.clave_estatus=0 AND\nbe_actividad.clave_empleado_asignado=%clave_empleado','select'),
 (3040,101,4,'select clave_actividad, observacion from be_actividad where clave_actividad=$pk','update'),
 (3042,102,2,'SELECT clave_actividad,\r\nactividad, \r\nclave_empleado_solicitante, \r\nfecha_inicial, \r\nfecha_final, \r\nobservacion \r\nfrom be_actividad\r\nwhere \r\nbe_actividad.clave_estatus=0 AND\r\nbe_actividad.clave_empleado_asignado=%clave_empleado','select'),
 (3043,102,3,'SELECT clave_actividad,\r\nactividad, \r\nclave_empleado_solicitante, \r\nfecha_inicial, \r\nfecha_final, \r\nobservacion \r\nfrom be_actividad\r\nwhere \r\nbe_actividad.clave_estatus=0 AND\r\nbe_actividad.clave_empleado_asignado=%clave_empleado','select'),
 (3044,102,4,'SELECT clave_actividad,\r\nactividad, \r\nclave_empleado_solicitante, \r\nfecha_inicial, \r\nfecha_final, \r\nobservacion \r\nfrom be_actividad\r\nwhere \r\nbe_actividad.clave_estatus=0 AND\r\nbe_actividad.clave_empleado_asignado=%clave_empleado','select'),
 (3046,6,3,'select clave_empleado, concat(nombre, \' \', apellidos) as nombre from be_empleado','foreign'),
 (3072,258,1,'SELECT password as apellido_paterno,clave_empleado, \'\' as password, \'\' as nombre, 0 as cambia_password FROM be_empleado WHERE clave_empleado=$pk','update'),
 (3073,258,2,'SELECT password as apellido_paterno,clave_empleado, \'\' as password, \'\' as nombre, 0 as cambia_password FROM be_empleado WHERE clave_empleado=$pk','update'),
 (3074,258,3,'SELECT password as apellido_paterno,clave_empleado, \'\' as password, \'\' as nombre, 0 as cambia_password FROM be_empleado WHERE clave_empleado=$pk','update'),
 (3075,258,4,'SELECT password as apellido_paterno,clave_empleado, \'\' as password, \'\' as nombre, 0 as cambia_password FROM be_empleado WHERE clave_empleado=$pk','update');
/*!40000 ALTER TABLE `be_consulta_forma` ENABLE KEYS */;


--
-- Definition of table `be_empleado`
--

DROP TABLE IF EXISTS `be_empleado`;
CREATE TABLE `be_empleado` (
  `clave_empleado` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `clave_perfil` int(11) NOT NULL,
  `activo` tinyint(4) NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `clave_area` int(11) DEFAULT NULL,
  `cambia_password` bit(1) NOT NULL,
  PRIMARY KEY (`clave_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `be_empleado`
--

/*!40000 ALTER TABLE `be_empleado` DISABLE KEYS */;
INSERT INTO `be_empleado` (`clave_empleado`,`nombre`,`apellidos`,`email`,`password`,`clave_perfil`,`activo`,`foto`,`clave_area`,`cambia_password`) VALUES 
 (1,'Daniel','Martínez','ikaro75@gmail.com','valgomadres9',1,1,NULL,0,0x00),
 (2,'Investigador','Prueba','ikaro75@gmail.com','investigador',2,1,NULL,NULL,0x00),
 (3,'Auditor','Prueba','ikaro75@gmail.com','auditor',3,1,NULL,NULL,0x00),
 (4,'Supervisor','Pruebas','ikaro75@gmail.com','supervisor',4,1,NULL,NULL,0x00),
 (5,'Alan','Uribe','alan.uribe@infiniteresearch.com.mx','infiniteresearch',2,1,NULL,NULL,0x01),
 (6,'Claudia ','Tiburcio','claudiav.tiburcio@infiniteresearch.com.mx','infiniteresearch',3,1,NULL,NULL,0x00);
/*!40000 ALTER TABLE `be_empleado` ENABLE KEYS */;


--
-- Definition of table `be_estatus_aplicacion`
--

DROP TABLE IF EXISTS `be_estatus_aplicacion`;
CREATE TABLE `be_estatus_aplicacion` (
  `clave_estatus` int(11) NOT NULL AUTO_INCREMENT,
  `estatus` varchar(50) NOT NULL,
  PRIMARY KEY (`clave_estatus`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `be_estatus_aplicacion`
--

/*!40000 ALTER TABLE `be_estatus_aplicacion` DISABLE KEYS */;
INSERT INTO `be_estatus_aplicacion` (`clave_estatus`,`estatus`) VALUES 
 (1,'En Desarrollo');
/*!40000 ALTER TABLE `be_estatus_aplicacion` ENABLE KEYS */;


--
-- Definition of table `be_estatus_forma`
--

DROP TABLE IF EXISTS `be_estatus_forma`;
CREATE TABLE `be_estatus_forma` (
  `clave_estatus` int(11) NOT NULL AUTO_INCREMENT,
  `estatus` varchar(50) NOT NULL,
  PRIMARY KEY (`clave_estatus`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `be_estatus_forma`
--

/*!40000 ALTER TABLE `be_estatus_forma` DISABLE KEYS */;
INSERT INTO `be_estatus_forma` (`clave_estatus`,`estatus`) VALUES 
 (1,'En desarrollo'),
 (2,'En pruebas'),
 (3,'En produccion');
/*!40000 ALTER TABLE `be_estatus_forma` ENABLE KEYS */;


--
-- Definition of table `be_filtro`
--

DROP TABLE IF EXISTS `be_filtro`;
CREATE TABLE `be_filtro` (
  `clave_filtro` int(11) NOT NULL AUTO_INCREMENT,
  `filtro` varchar(100) NOT NULL,
  `clave_aplicacion` int(11) NOT NULL,
  `clave_forma` int(11) NOT NULL,
  `clave_empleado` int(11) NOT NULL,
  `consulta` longtext NOT NULL,
  PRIMARY KEY (`clave_filtro`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `be_filtro`
--

/*!40000 ALTER TABLE `be_filtro` DISABLE KEYS */;
INSERT INTO `be_filtro` (`clave_filtro`,`filtro`,`clave_aplicacion`,`clave_forma`,`clave_empleado`,`consulta`) VALUES 
 (2,'BBVA bancomer 1145460220',9,234,1,'clave_cuenta=2');
/*!40000 ALTER TABLE `be_filtro` ENABLE KEYS */;


--
-- Definition of table `be_forma`
--

DROP TABLE IF EXISTS `be_forma`;
CREATE TABLE `be_forma` (
  `clave_forma` int(11) NOT NULL AUTO_INCREMENT,
  `clave_forma_padre` int(11) DEFAULT NULL,
  `clave_aplicacion` int(11) NOT NULL,
  `forma` varchar(100) NOT NULL,
  `tabla` varchar(50) NOT NULL,
  `llave_primaria` varchar(50) NOT NULL,
  `instrucciones` text,
  `evento_forma` text,
  `evento_grid` text,
  `codigo_forma` longtext,
  `alias_tab` varchar(50) DEFAULT NULL,
  `orden_tab` int(11) DEFAULT NULL,
  `permite_filtrar_datos` tinyint(4) DEFAULT NULL,
  `icono` varchar(255) DEFAULT NULL,
  `muestra_formas_foraneas` bit(1) DEFAULT NULL,
  `permite_duplicar_registro` bit(1) DEFAULT NULL,
  `permite_insertar_comentarios` bit(1) DEFAULT NULL,
  `permite_guardar_como_plantilla` bit(1) DEFAULT NULL,
  `presentar_catalogos_foraneos` bit(1) DEFAULT NULL,
  PRIMARY KEY (`clave_forma`)
) ENGINE=InnoDB AUTO_INCREMENT=291 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `be_forma`
--

/*!40000 ALTER TABLE `be_forma` DISABLE KEYS */;
INSERT INTO `be_forma` (`clave_forma`,`clave_forma_padre`,`clave_aplicacion`,`forma`,`tabla`,`llave_primaria`,`instrucciones`,`evento_forma`,`evento_grid`,`codigo_forma`,`alias_tab`,`orden_tab`,`permite_filtrar_datos`,`icono`,`muestra_formas_foraneas`,`permite_duplicar_registro`,`permite_insertar_comentarios`,`permite_guardar_como_plantilla`,`presentar_catalogos_foraneos`) VALUES 
 (1,2,1,'Configuracion','be_configuracion','clave_parametro',NULL,NULL,NULL,NULL,'el parámetro de configuración',NULL,1,'img/configuracion1.png',0x00,0x00,0x00,0x00,NULL),
 (2,NULL,1,'Aplicaciones','be_aplicacion','clave_aplicacion',NULL,NULL,NULL,NULL,'la aplicación',1,0,'img/app7.png',0x01,0x00,0x00,0x00,NULL),
 (3,2,1,'Formas','be_forma','clave_forma',NULL,'be_forma_init();',NULL,NULL,'la forma',2,0,'img/forms9.png',0x00,0x00,0x00,0x00,NULL),
 (5,5,1,'Perfiles de seguridad','be_perfil','clave_perfil',NULL,NULL,NULL,NULL,'el perfil de seguridad',4,0,'img/perfiles10.png',NULL,NULL,NULL,NULL,NULL),
 (6,6,1,'Usuarios','be_empleado','clave_empleado',NULL,NULL,NULL,NULL,'al usuario',5,0,'img/usuarios2.png',NULL,NULL,NULL,NULL,NULL),
 (8,3,1,'Consultas','be_consulta_forma','clave_consulta',NULL,NULL,NULL,NULL,'la consulta',0,1,NULL,NULL,NULL,NULL,NULL,NULL),
 (10,2,1,'Perfiles de la aplicación','be_perfil_aplicacion','clave_perfil_aplicacion',NULL,NULL,NULL,NULL,'el perfil',NULL,0,'img/perfiles10.png',NULL,NULL,NULL,NULL,NULL),
 (11,3,1,'Estatus de forma','be_estatus_forma','clave_estatus',NULL,NULL,NULL,NULL,'el estatus de forma',2,0,NULL,NULL,NULL,NULL,NULL,NULL),
 (13,14,1,'Diccionario de campos','be_campo_forma','clave_campo',NULL,'if ($(\"#clave_forma_foranea\").val()!=\"\") {\n$(\"#td_filtro_foraneo\").parent().show();\n$(\"#td_edita_forma_foranea\").parent().show();\n$(\"#td_carga_dato_foraneos_retrasada\").parent().show();\n$(\"#td_no_permitir_valor_foraneo_nulo\").parent().show();\n}\nelse {\n$(\"#td_filtro_foraneo\").parent().hide();\n$(\"#td_edita_forma_foranea\").parent().hide();\n$(\"#td_carga_dato_foraneos_retrasada\").parent().hide();\n$(\"#td_no_permitir_valor_foraneo_nulo\").parent().hide();\n}',NULL,NULL,'la definición del campo',NULL,1,'img/campos1.png',NULL,NULL,NULL,NULL,NULL),
 (14,3,1,'Permisos de perfiles','be_permiso_forma','clave_permiso_forma',NULL,NULL,NULL,NULL,'el permiso',NULL,1,'img/perfiles10.png',NULL,NULL,NULL,NULL,NULL),
 (15,8,1,'Tipo consulta','be_tipo_accion','tipo_accion',NULL,NULL,NULL,NULL,'el tipo de consulta',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
 (16,5,1,'Permisos','be_permiso','clave_permiso',NULL,NULL,NULL,NULL,'el permiso',NULL,1,'img/permisos1.png',NULL,NULL,NULL,NULL,NULL),
 (20,3,1,'Área','area','clave_area',NULL,NULL,NULL,NULL,'el área',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
 (21,3,1,'Tipo area','tipo_area','clave_tipo_area',NULL,NULL,NULL,NULL,'el tipo de área',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
 (91,91,2,'Bitácora','bitacora_aplicacion','clave_bitacora',NULL,NULL,NULL,NULL,'el registro',NULL,0,'img/bitacora3.png',NULL,NULL,NULL,NULL,NULL),
 (93,3,1,'Filtros','be_filtro','clave_filtro',NULL,NULL,NULL,NULL,'el filtro',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
 (101,101,2,'Mis pendientes','be_actividad','clave_forma',NULL,NULL,'alertmanager_ongridcomplete();\nfx_cuestionario_participante_grid_init();',NULL,'la actividad',NULL,0,NULL,0x00,0x00,0x00,0x00,NULL),
 (102,102,2,'Pendientes que asigné','be_actividad','clave_actividad',NULL,NULL,NULL,NULL,'la tarea',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
 (106,106,1,'Tipo de salida','tipo_salida','clave_tipo_salida',NULL,NULL,NULL,NULL,'la salida',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
 (179,179,1,'Tipo de control','be_tipo_control','clave_tipo_control',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
 (218,NULL,2,'Flujo de datos','flujo_datos','clave_flujo',NULL,NULL,NULL,NULL,'el flujo de datos',NULL,0,'img/flujo_datos5.png',NULL,NULL,NULL,NULL,NULL),
 (219,218,2,'Responsables asignados al proceso','responsable_flujo_datos','clave_responsable_flujo',NULL,NULL,NULL,NULL,'el responsable asignado',NULL,0,'img/usuarios1.png',NULL,NULL,NULL,NULL,NULL),
 (220,218,2,'Procesos','flujo_datos_forma','clave_flujo_forma',NULL,NULL,NULL,NULL,'el proceso del flujo de datos',NULL,0,'img/procesos1.png',NULL,NULL,NULL,NULL,NULL),
 (230,NULL,2,'Rol','rol','clave_rol',NULL,NULL,NULL,NULL,'el rol',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
 (232,NULL,2,'Tipo de responsable','tipo_responsable','clave_tipo_responsable',NULL,NULL,NULL,NULL,'el tipo de responsable',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
 (233,233,1,'Estatus de la aplicación','be_estatus_aplicacion','clave_estatus',NULL,NULL,NULL,NULL,'el estatus de la aplicación',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
 (234,NULL,9,'Transacciones','fx_transaccion','clave_transaccion',NULL,NULL,NULL,NULL,'la transacción',NULL,0,NULL,NULL,0x01,NULL,0x01,NULL),
 (236,234,9,'Moneda','fx_moneda','clave_moneda',NULL,NULL,NULL,NULL,'la moneda',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
 (240,234,9,'Clase','fx_clase','clave_clase',NULL,NULL,NULL,NULL,'la clase',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
 (241,234,9,'Estatus de póliza','fx_estatus_poliza','clave_estatus',NULL,NULL,NULL,NULL,'el estatus de la póliza',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
 (242,NULL,10,'Cuentas','fx_cuenta','clave_cuenta',NULL,NULL,NULL,NULL,'la cuenta',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
 (244,242,9,'Tipo de cuenta','fx_tipo_cuenta','clave_tipo_cuenta',NULL,NULL,NULL,NULL,'el tipo de cuenta',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
 (245,NULL,10,'Manejo de transferencias','fx_manejo_transferencia','clave_manejo_transferencia',NULL,NULL,NULL,NULL,'el manejo de transferencia',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
 (246,NULL,11,'Tipo de transacción','fx_tipo_transaccion','clave_tipo_transaccion',NULL,NULL,NULL,NULL,'el tipo de transacción',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
 (247,NULL,12,'Categorías y presupuesto','fx_cuenta','clave_cuenta',NULL,NULL,NULL,NULL,'la categoría',NULL,0,NULL,0x01,NULL,NULL,NULL,NULL),
 (248,NULL,13,'Beneficiarios','fx_beneficiario','clave_beneficiario',NULL,NULL,NULL,NULL,'el beneficiario',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
 (249,NULL,12,'Tipo de categoría','fx_tipo_categoria','clave_tipo_categoria',NULL,NULL,NULL,NULL,'el tipo de categoría',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
 (250,250,12,'Tipo de presupuesto','fx_tipo_presupuesto','clave_tipo_presupuesto',NULL,NULL,NULL,NULL,'el tipo de presupuesto',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
 (251,234,9,'Subtrasacciones','fx_poliza_detalle','clave_poliza_detalle',NULL,NULL,NULL,NULL,'la subtransacción',NULL,0,NULL,NULL,0x01,NULL,NULL,NULL),
 (252,NULL,9,'Cuentas y Categorias','fx_cuenta','clave_cuenta',NULL,NULL,NULL,NULL,'las cuentas y categorías',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
 (253,NULL,9,'Suma de subtrasacciones','fx_transaccion','clave_transaccion',NULL,NULL,NULL,NULL,'la suma de subtransacciones',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
 (254,247,12,'Presupuesto','fx_presupuesto_categoria','clave_presupuesto_categoria',NULL,NULL,NULL,NULL,'el presupuesto',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
 (258,258,1,'Cambio de password','be_empleado','clave_empleado','Cambie su contraseña','$(\"#opciones_1_258_5\").remove();\n$(\"#btnMenuOpciones_1_258_5\").remove();\n$(\"#btnEliminar_1_258_5\").remove();\n\n$(\"#password,#nombre\").change( function() {\n    if ($(\"#password\").val()==\"\")  {\n        $(\"#btnGuardar_1_258_\"+$(\"#_ce_\").val()).attr(\"disabled\", \"disabled\");\n        return;         \n    }\n    \n    if ($(\"#nombre\").val()==\"\")  {\n        $(\"#btnGuardar_1_258_\"+$(\"#_ce_\").val()).attr(\"disabled\", \"disabled\");\n        return;\n    }\n    \n    if ($(\"#password\").val()!=$(\"#nombre\").val()) {\n        alert(\'El password y la confirmación no coinciden, verifique\');\n        $(\"#btnGuardar_1_258_\"+$(\"#_ce_\").val()).attr(\"disabled\", \"disabled\");  \n    } else {\n        //$(\"#nombre\").attr(\"disabled\", \"disabled\");\n        //$(\"#apellido_paterno\").attr(\"disabled\", \"disabled\");\n        //$(\"#btnGuardar_1_258_\"+$(\"#_ce_\").val()).removeAttr(\"disabled\");\n        }  \n});  \n    \n$(\"#btnGuardar_1_258_\"+$(\"#_ce_\").val()).click( function() {\n    $(\"#nombre\").attr(\"disabled\", \"disabled\");\n    $(\"#apellido_paterno\").attr(\"disabled\", \"disabled\");  \n}); ',NULL,NULL,'el password',NULL,0,NULL,0x00,0x00,0x00,0x00,0x00),
 (264,NULL,9,'Transacciones','fx_poliza','clave_poliza',NULL,NULL,NULL,NULL,'la transacción',NULL,0,NULL,NULL,0x01,NULL,0x01,NULL),
 (265,14,1,'Reportes','be_reporte','clave_reporte',NULL,NULL,NULL,NULL,'el reporte',NULL,0,NULL,0x01,NULL,NULL,NULL,NULL),
 (266,265,1,'Parámetros','be_parametro_reporte','clave_parametro',NULL,NULL,NULL,NULL,'el parámetro',1,0,NULL,NULL,NULL,NULL,NULL,NULL),
 (267,267,1,'Tipo de reporte','be_tipo_reporte','clave_tipo_reporte',NULL,NULL,NULL,NULL,'el tipo de reporte',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
 (268,288,27,'Formularios de Reporte Clínico','ex_cuestionario','claveCuestionario','Aplique el cuestionario y complete la información de acuerdo a lo que se solicita. En cada visita donde se le asigne medicamento al paciente debe de recordársele que en la siguiente visita debe regresar lo que sobre del mismo, así como su empaque.',NULL,NULL,NULL,'el cuestionario',1,0,NULL,0x01,0x01,0x00,0x00,NULL),
 (269,NULL,27,'Estatus del formulario','ex_estatus_cuestionario','clave_estatus',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
 (270,268,27,'Sección de preguntas','ex_seccion_cuestionario','claveSeccion',NULL,NULL,NULL,NULL,'la sección de preguntas',2,0,NULL,0x01,0x01,0x00,0x00,NULL),
 (271,270,27,'Preguntas','ex_pregunta','clavePregunta',NULL,NULL,NULL,NULL,'la pregunta',1,0,NULL,0x01,NULL,NULL,NULL,NULL),
 (272,NULL,27,'Tipo de pregunta','ex_tipo_pregunta','claveTipoPregunta',NULL,NULL,NULL,NULL,'el tipo de pregunta',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
 (273,NULL,27,'Tipo de dato','ex_tipo_dato','claveTipoDato',NULL,NULL,NULL,NULL,'el tipo de datos',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
 (274,271,27,'Respuestas','ex_respuesta','claveRespuesta',NULL,NULL,NULL,NULL,'la respuesta',1,0,NULL,0x00,0x00,0x00,0x00,NULL),
 (275,NULL,27,'Si esta es la respuesta','ex_respuesta_accion','clave_accion',NULL,NULL,NULL,NULL,'la acción de la respuesta',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
 (276,NULL,23,'Pacientes','ex_participante','claveParticipante',NULL,NULL,NULL,NULL,'el paciente',NULL,0,NULL,0x01,0x00,0x00,0x00,NULL),
 (277,279,23,'Respuestas del formulario','ex_respuesta_participante','claveRespuestaParticipante',NULL,NULL,NULL,NULL,'la respuesta',NULL,0,NULL,0x00,0x00,0x00,0x00,NULL),
 (278,278,23,'Estatus de reporte de caso','ex_estatus_cuestionario_participante','claveEstatus',NULL,NULL,NULL,NULL,'el estatus',NULL,0,NULL,0x00,0x00,0x00,0x00,NULL),
 (279,290,23,'Reportes de caso','ex_cuestionario_participante','claveCuestionarioParticipante',NULL,NULL,'fx_cuestionario_participante_grid_init();',NULL,'el reporte de caso',NULL,0,NULL,0x00,0x00,0x00,0x00,NULL),
 (280,NULL,27,'Cuestionario','ex_respuesta_participante','claveRespuestaParticipante',NULL,NULL,NULL,NULL,'la respuesta',NULL,0,NULL,0x00,0x00,0x00,0x00,NULL),
 (281,281,23,'Calificación de auditoría','ex_calificacion_auditoria','claveCalificacionAuditoria',NULL,NULL,NULL,NULL,'la calificación',NULL,0,NULL,0x00,0x00,0x00,0x00,NULL),
 (282,NULL,24,'Investigadores','be_empleado','clave_empleado',NULL,NULL,NULL,NULL,'el investigador',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
 (283,NULL,25,'Auditores','be_empleado','clave_empleado',NULL,NULL,NULL,NULL,'el auditor',NULL,0,NULL,0x01,NULL,NULL,NULL,NULL),
 (284,283,25,'Investigadores asignados','ex_auditor_empleado','clave_auditor_empleado',NULL,NULL,NULL,NULL,'el investigador',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),
 (285,NULL,26,'Supervisores','be_empleado','clave_empleado',NULL,NULL,NULL,NULL,'el supervisor',NULL,0,NULL,0x01,0x00,0x00,0x00,NULL),
 (286,285,26,'Auditores asignados','ex_supervisor_empleado','clave_supervisor_empleado',NULL,NULL,NULL,NULL,'el auditor asignado',NULL,0,NULL,0x00,0x00,0x00,0x00,NULL),
 (287,287,23,'Respuestas del auditor','ex_pregunta_auditor','clavePreguntaAuditor',NULL,NULL,NULL,NULL,'la calificación del auditor',NULL,0,NULL,0x00,0x00,0x00,0x00,NULL),
 (288,NULL,27,'Estudios clínicos','ex_estudio','claveEstudio',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0x01,0x00,0x00,0x00,NULL),
 (290,276,23,'Estudios clínicos','ex_estudio_participante','claveEstudioParticipante',NULL,NULL,'fx_cuestionario_participante_grid_init();',NULL,'el estudio clínico del paciente',NULL,0,NULL,0x01,0x00,0x00,0x00,NULL);
/*!40000 ALTER TABLE `be_forma` ENABLE KEYS */;


--
-- Definition of table `be_parametro_reporte`
--

DROP TABLE IF EXISTS `be_parametro_reporte`;
CREATE TABLE `be_parametro_reporte` (
  `clave_parametro` int(11) NOT NULL AUTO_INCREMENT,
  `parametro` varchar(255) NOT NULL,
  `clave_reporte` int(11) NOT NULL,
  `alias` varchar(20) NOT NULL,
  `tipo_dato` varchar(10) NOT NULL,
  `valor` text,
  `valor_predeterminado` text,
  `clave_forma_foranea` int(11) DEFAULT NULL,
  `visible` bit(1) NOT NULL,
  `obligatorio` bit(1) NOT NULL,
  `ayuda` text,
  PRIMARY KEY (`clave_parametro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `be_parametro_reporte`
--

/*!40000 ALTER TABLE `be_parametro_reporte` DISABLE KEYS */;
/*!40000 ALTER TABLE `be_parametro_reporte` ENABLE KEYS */;


--
-- Definition of table `be_perfil`
--

DROP TABLE IF EXISTS `be_perfil`;
CREATE TABLE `be_perfil` (
  `clave_perfil` int(11) NOT NULL AUTO_INCREMENT,
  `perfil` varchar(50) NOT NULL,
  PRIMARY KEY (`clave_perfil`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `be_perfil`
--

/*!40000 ALTER TABLE `be_perfil` DISABLE KEYS */;
INSERT INTO `be_perfil` (`clave_perfil`,`perfil`) VALUES 
 (1,'Administrador'),
 (2,'Investigador'),
 (3,'Auditor'),
 (4,'Supervisor');
/*!40000 ALTER TABLE `be_perfil` ENABLE KEYS */;


--
-- Definition of table `be_perfil_aplicacion`
--

DROP TABLE IF EXISTS `be_perfil_aplicacion`;
CREATE TABLE `be_perfil_aplicacion` (
  `clave_perfil_aplicacion` int(11) NOT NULL AUTO_INCREMENT,
  `clave_perfil` int(11) NOT NULL,
  `clave_aplicacion` int(11) NOT NULL,
  `activo` tinyint(4) NOT NULL,
  PRIMARY KEY (`clave_perfil_aplicacion`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `be_perfil_aplicacion`
--

/*!40000 ALTER TABLE `be_perfil_aplicacion` DISABLE KEYS */;
INSERT INTO `be_perfil_aplicacion` (`clave_perfil_aplicacion`,`clave_perfil`,`clave_aplicacion`,`activo`) VALUES 
 (1,1,1,1),
 (3,1,2,1),
 (4,1,14,1),
 (5,1,15,1),
 (6,1,9,1),
 (7,1,10,1),
 (8,1,11,1),
 (9,1,12,1),
 (10,1,13,1),
 (11,1,16,1),
 (14,1,23,1),
 (15,1,24,1),
 (16,1,25,1),
 (17,1,26,1),
 (18,1,27,1),
 (19,2,23,1),
 (20,3,23,1),
 (21,4,23,1),
 (22,2,2,1),
 (23,3,2,1),
 (24,4,2,1),
 (25,3,1,1),
 (26,2,1,1),
 (27,4,1,0);
/*!40000 ALTER TABLE `be_perfil_aplicacion` ENABLE KEYS */;


--
-- Definition of table `be_permiso`
--

DROP TABLE IF EXISTS `be_permiso`;
CREATE TABLE `be_permiso` (
  `clave_permiso` int(11) NOT NULL AUTO_INCREMENT,
  `permiso` varchar(50) NOT NULL,
  PRIMARY KEY (`clave_permiso`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `be_permiso`
--

/*!40000 ALTER TABLE `be_permiso` DISABLE KEYS */;
INSERT INTO `be_permiso` (`clave_permiso`,`permiso`) VALUES 
 (1,'Mostrar en grid'),
 (2,'Insertar registro'),
 (3,'Actualizar registro'),
 (4,'Eliminar registro'),
 (5,'Mostrar información sensible');
/*!40000 ALTER TABLE `be_permiso` ENABLE KEYS */;


--
-- Definition of table `be_permiso_forma`
--

DROP TABLE IF EXISTS `be_permiso_forma`;
CREATE TABLE `be_permiso_forma` (
  `clave_permiso_forma` int(11) NOT NULL AUTO_INCREMENT,
  `clave_permiso` int(11) NOT NULL,
  `clave_forma` int(11) NOT NULL,
  `clave_perfil` int(11) NOT NULL,
  PRIMARY KEY (`clave_permiso_forma`)
) ENGINE=InnoDB AUTO_INCREMENT=4811 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `be_permiso_forma`
--

/*!40000 ALTER TABLE `be_permiso_forma` DISABLE KEYS */;
INSERT INTO `be_permiso_forma` (`clave_permiso_forma`,`clave_permiso`,`clave_forma`,`clave_perfil`) VALUES 
 (6,1,2,1),
 (7,2,2,1),
 (8,3,2,1),
 (9,4,2,1),
 (10,-5,2,1),
 (41,1,11,1),
 (42,2,11,1),
 (43,3,11,1),
 (44,4,11,1),
 (45,5,11,1),
 (56,1,14,1),
 (57,2,14,1),
 (58,3,14,1),
 (59,4,14,1),
 (60,5,14,1),
 (61,1,15,1),
 (62,2,15,1),
 (63,3,15,1),
 (64,4,15,1),
 (65,5,15,1),
 (75,1,16,1),
 (76,2,16,1),
 (77,3,16,1),
 (78,4,16,1),
 (79,5,16,1),
 (96,1,3,1),
 (97,2,3,1),
 (98,3,3,1),
 (99,4,3,1),
 (100,5,3,1),
 (162,4,13,1),
 (163,2,13,1),
 (164,1,13,1),
 (165,5,13,1),
 (167,3,13,1),
 (181,1,8,1),
 (182,3,8,1),
 (183,4,8,1),
 (184,5,8,1),
 (185,2,8,1),
 (191,1,6,1),
 (192,2,6,1),
 (193,5,6,1),
 (194,4,6,1),
 (195,3,6,1),
 (466,1,10,1),
 (467,2,10,1),
 (468,4,10,1),
 (469,5,10,1),
 (472,3,10,1),
 (486,3,1,1),
 (487,1,1,1),
 (488,2,1,1),
 (489,4,1,1),
 (494,5,1,1),
 (496,4,5,1),
 (497,3,5,1),
 (498,2,5,1),
 (499,1,5,1),
 (500,5,5,1),
 (651,1,93,1),
 (652,2,93,1),
 (653,3,93,1),
 (654,4,93,1),
 (655,5,93,1),
 (691,1,101,1),
 (2415,1,179,1),
 (2416,2,179,1),
 (2417,3,179,1),
 (2418,4,179,1),
 (2420,5,179,1),
 (3665,1,102,1),
 (4120,3,101,1),
 (4249,3,258,1),
 (4282,1,265,1),
 (4283,2,265,1),
 (4284,3,265,1),
 (4285,4,265,1),
 (4286,5,265,1),
 (4287,1,266,1),
 (4288,2,266,1),
 (4289,3,266,1),
 (4290,4,266,1),
 (4291,5,266,1),
 (4292,1,267,1),
 (4293,2,267,1),
 (4294,3,267,1),
 (4295,4,267,1),
 (4296,5,267,1),
 (4367,1,282,1),
 (4368,2,282,1),
 (4369,3,282,1),
 (4370,4,282,1),
 (4371,5,282,1),
 (4372,1,283,1),
 (4373,2,283,1),
 (4374,3,283,1),
 (4375,4,283,1),
 (4376,5,283,1),
 (4382,1,285,1),
 (4383,2,285,1),
 (4384,3,285,1),
 (4385,4,285,1),
 (4386,5,285,1),
 (4759,1,101,2),
 (4760,3,101,2),
 (4762,1,101,3),
 (4763,3,101,3),
 (4765,1,101,4),
 (4766,3,101,4),
 (4768,1,102,2),
 (4769,1,102,3),
 (4770,1,102,4),
 (4771,1,6,3),
 (4808,3,258,2),
 (4809,3,258,3),
 (4810,3,258,4);
/*!40000 ALTER TABLE `be_permiso_forma` ENABLE KEYS */;


--
-- Definition of table `be_plantilla_forma`
--

DROP TABLE IF EXISTS `be_plantilla_forma`;
CREATE TABLE `be_plantilla_forma` (
  `clave_plantilla` int(11) NOT NULL AUTO_INCREMENT,
  `plantilla` varchar(255) NOT NULL,
  `clave_aplicacion` int(11) NOT NULL,
  `clave_forma` int(11) NOT NULL,
  `clave_empleado` int(11) NOT NULL,
  PRIMARY KEY (`clave_plantilla`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `be_plantilla_forma`
--

/*!40000 ALTER TABLE `be_plantilla_forma` DISABLE KEYS */;
/*!40000 ALTER TABLE `be_plantilla_forma` ENABLE KEYS */;


--
-- Definition of table `be_reporte`
--

DROP TABLE IF EXISTS `be_reporte`;
CREATE TABLE `be_reporte` (
  `clave_reporte` int(11) NOT NULL AUTO_INCREMENT,
  `reporte` varchar(250) NOT NULL,
  `clave_forma` int(11) NOT NULL,
  `clave_perfil` int(11) NOT NULL,
  `clave_tipo_reporte` int(11) NOT NULL,
  `consulta` text,
  `jsp` varchar(250) NOT NULL,
  `jrxml` varchar(250) DEFAULT NULL,
  `etiqueta_tick` varchar(250) DEFAULT NULL,
  `color_series` text,
  `generar_en_insercion` tinyint(1) NOT NULL DEFAULT '0',
  `generar_en_actualizacion` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`clave_reporte`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `be_reporte`
--

/*!40000 ALTER TABLE `be_reporte` DISABLE KEYS */;
INSERT INTO `be_reporte` (`clave_reporte`,`reporte`,`clave_forma`,`clave_perfil`,`clave_tipo_reporte`,`consulta`,`jsp`,`jrxml`,`etiqueta_tick`,`color_series`,`generar_en_insercion`,`generar_en_actualizacion`) VALUES 
 (1,'Cashflow',264,1,2,NULL,'ireport','cashflow',NULL,NULL,0,0);
/*!40000 ALTER TABLE `be_reporte` ENABLE KEYS */;


--
-- Definition of table `be_tipo_accion`
--

DROP TABLE IF EXISTS `be_tipo_accion`;
CREATE TABLE `be_tipo_accion` (
  `tipo_accion` varchar(15) NOT NULL,
  PRIMARY KEY (`tipo_accion`),
  UNIQUE KEY `PK_tipo_accion` (`tipo_accion`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `be_tipo_accion`
--

/*!40000 ALTER TABLE `be_tipo_accion` DISABLE KEYS */;
INSERT INTO `be_tipo_accion` (`tipo_accion`) VALUES 
 ('after_insert'),
 ('after_update'),
 ('before_insert'),
 ('before_update'),
 ('children'),
 ('foreign'),
 ('insert'),
 ('log'),
 ('lookup'),
 ('report'),
 ('select'),
 ('update');
/*!40000 ALTER TABLE `be_tipo_accion` ENABLE KEYS */;


--
-- Definition of table `be_tipo_control`
--

DROP TABLE IF EXISTS `be_tipo_control`;
CREATE TABLE `be_tipo_control` (
  `clave_tipo_control` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_control` varchar(50) NOT NULL,
  PRIMARY KEY (`clave_tipo_control`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `be_tipo_control`
--

/*!40000 ALTER TABLE `be_tipo_control` DISABLE KEYS */;
/*!40000 ALTER TABLE `be_tipo_control` ENABLE KEYS */;


--
-- Definition of table `be_tipo_evento`
--

DROP TABLE IF EXISTS `be_tipo_evento`;
CREATE TABLE `be_tipo_evento` (
  `clave_tipo_evento` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_evento` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`clave_tipo_evento`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `be_tipo_evento`
--

/*!40000 ALTER TABLE `be_tipo_evento` DISABLE KEYS */;
INSERT INTO `be_tipo_evento` (`clave_tipo_evento`,`tipo_evento`) VALUES 
 (1,'inició sesión'),
 (2,'insertó'),
 (3,'editó'),
 (4,'eliminó'),
 (5,'cerró sesión');
/*!40000 ALTER TABLE `be_tipo_evento` ENABLE KEYS */;


--
-- Definition of table `be_tipo_reporte`
--

DROP TABLE IF EXISTS `be_tipo_reporte`;
CREATE TABLE `be_tipo_reporte` (
  `clave_tipo_reporte` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_reporte` varchar(150) NOT NULL,
  PRIMARY KEY (`clave_tipo_reporte`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `be_tipo_reporte`
--

/*!40000 ALTER TABLE `be_tipo_reporte` DISABLE KEYS */;
INSERT INTO `be_tipo_reporte` (`clave_tipo_reporte`,`tipo_reporte`) VALUES 
 (1,'jQuery report'),
 (2,'iReport');
/*!40000 ALTER TABLE `be_tipo_reporte` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
