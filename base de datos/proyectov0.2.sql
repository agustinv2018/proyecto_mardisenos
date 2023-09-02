/*
SQLyog Ultimate v12.09 (32 bit)
MySQL - 10.4.24-MariaDB : Database - proyecto
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`proyecto` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `proyecto`;

/*Table structure for table `cadeterias` */

DROP TABLE IF EXISTS `cadeterias`;

CREATE TABLE `cadeterias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `cadeterias` */

/*Table structure for table `categorias_configuracion` */

DROP TABLE IF EXISTS `categorias_configuracion`;

CREATE TABLE `categorias_configuracion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `categorias_configuracion` */

/*Table structure for table `clientes` */

DROP TABLE IF EXISTS `clientes`;

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `direccion` text DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `clientes` */

/*Table structure for table `colores` */

DROP TABLE IF EXISTS `colores`;

CREATE TABLE `colores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `colores` */

/*Table structure for table `comentarios` */

DROP TABLE IF EXISTS `comentarios`;

CREATE TABLE `comentarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `texto` text NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `fecha_modificacion` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `producto_id` (`producto_id`),
  CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `comentarios` */

/*Table structure for table `configuracion_categoria` */

DROP TABLE IF EXISTS `configuracion_categoria`;

CREATE TABLE `configuracion_categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `configuracion_id` int(11) NOT NULL,
  `categoria_configuracion_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `configuracion_id` (`configuracion_id`),
  KEY `categoria_configuracion_id` (`categoria_configuracion_id`),
  CONSTRAINT `configuracion_categoria_ibfk_1` FOREIGN KEY (`configuracion_id`) REFERENCES `configuracion_sistema` (`id`),
  CONSTRAINT `configuracion_categoria_ibfk_2` FOREIGN KEY (`categoria_configuracion_id`) REFERENCES `categorias_configuracion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `configuracion_categoria` */

/*Table structure for table `configuracion_historial_contrasenas` */

DROP TABLE IF EXISTS `configuracion_historial_contrasenas`;

CREATE TABLE `configuracion_historial_contrasenas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `maximo_registros` int(11) DEFAULT NULL,
  `longitud_minima` int(11) DEFAULT NULL,
  `periodo_almacenamiento` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `configuracion_historial_contrasenas_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `configuracion_historial_contrasenas` */

/*Table structure for table `configuracion_permiso` */

DROP TABLE IF EXISTS `configuracion_permiso`;

CREATE TABLE `configuracion_permiso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `configuracion_sistema_id` int(11) NOT NULL,
  `permiso_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `configuracion_sistema_id` (`configuracion_sistema_id`),
  KEY `permiso_id` (`permiso_id`),
  CONSTRAINT `configuracion_permiso_ibfk_1` FOREIGN KEY (`configuracion_sistema_id`) REFERENCES `configuracion_sistema` (`id`),
  CONSTRAINT `configuracion_permiso_ibfk_2` FOREIGN KEY (`permiso_id`) REFERENCES `permisos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `configuracion_permiso` */

/*Table structure for table `configuracion_rol` */

DROP TABLE IF EXISTS `configuracion_rol`;

CREATE TABLE `configuracion_rol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `configuracion_sistema_id` int(11) NOT NULL,
  `rol_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `configuracion_sistema_id` (`configuracion_sistema_id`),
  KEY `rol_id` (`rol_id`),
  CONSTRAINT `configuracion_rol_ibfk_1` FOREIGN KEY (`configuracion_sistema_id`) REFERENCES `configuracion_sistema` (`id`),
  CONSTRAINT `configuracion_rol_ibfk_2` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `configuracion_rol` */

/*Table structure for table `configuracion_sistema` */

DROP TABLE IF EXISTS `configuracion_sistema`;

CREATE TABLE `configuracion_sistema` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `version` varchar(100) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `configuracion_sistema` */

/*Table structure for table `configuracion_usuario` */

DROP TABLE IF EXISTS `configuracion_usuario`;

CREATE TABLE `configuracion_usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `configuracion_sistema_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `configuracion_sistema_id` (`configuracion_sistema_id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `configuracion_usuario_ibfk_1` FOREIGN KEY (`configuracion_sistema_id`) REFERENCES `configuracion_sistema` (`id`),
  CONSTRAINT `configuracion_usuario_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `configuracion_usuario` */

/*Table structure for table `consultas` */

DROP TABLE IF EXISTS `consultas`;

CREATE TABLE `consultas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `descripcion` varchar(300) NOT NULL,
  `fecha_consulta` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `producto_id` (`producto_id`),
  CONSTRAINT `consultas_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `consultas_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `consultas` */

/*Table structure for table `contactos` */

DROP TABLE IF EXISTS `contactos`;

CREATE TABLE `contactos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `puesto` varchar(50) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cliente_id` (`cliente_id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `contactos_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `contactos_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `contactos` */

/*Table structure for table `detalle_pedido` */

DROP TABLE IF EXISTS `detalle_pedido`;

CREATE TABLE `detalle_pedido` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `pedido_id` int(11) NOT NULL,
  `fecha_creacion_pedido` datetime NOT NULL DEFAULT current_timestamp(),
  `estado` varchar(20) NOT NULL,
  `direccion_envio` varchar(260) NOT NULL,
  `informacion_pago` int(11) NOT NULL,
  `fecha_modificacion` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `pedido_id` (`pedido_id`),
  CONSTRAINT `detalle_pedido_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `detalle_pedido_ibfk_2` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `detalle_pedido` */

/*Table structure for table `detalle_producto` */

DROP TABLE IF EXISTS `detalle_producto`;

CREATE TABLE `detalle_producto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `producto_id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL,
  `talla_id` int(11) NOT NULL,
  `diseno_id` int(11) NOT NULL,
  `tela_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `producto_id` (`producto_id`),
  KEY `color_id` (`color_id`),
  KEY `talla_id` (`talla_id`),
  KEY `diseno_id` (`diseno_id`),
  KEY `tela_id` (`tela_id`),
  CONSTRAINT `detalle_producto_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`),
  CONSTRAINT `detalle_producto_ibfk_2` FOREIGN KEY (`color_id`) REFERENCES `colores` (`id`),
  CONSTRAINT `detalle_producto_ibfk_3` FOREIGN KEY (`talla_id`) REFERENCES `tallas` (`id`),
  CONSTRAINT `detalle_producto_ibfk_4` FOREIGN KEY (`diseno_id`) REFERENCES `disenos` (`id`),
  CONSTRAINT `detalle_producto_ibfk_5` FOREIGN KEY (`tela_id`) REFERENCES `telas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `detalle_producto` */

/*Table structure for table `disenos` */

DROP TABLE IF EXISTS `disenos`;

CREATE TABLE `disenos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `disenos` */

/*Table structure for table `envios` */

DROP TABLE IF EXISTS `envios`;

CREATE TABLE `envios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_envio` datetime NOT NULL,
  `direccion_entrega` text NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `cadeteria_id` int(11) DEFAULT NULL,
  `estado` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cliente_id` (`cliente_id`),
  KEY `cadeteria_id` (`cadeteria_id`),
  CONSTRAINT `envios_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `envios_ibfk_2` FOREIGN KEY (`cadeteria_id`) REFERENCES `cadeterias` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `envios` */

/*Table structure for table `historial_contrasenas` */

DROP TABLE IF EXISTS `historial_contrasenas`;

CREATE TABLE `historial_contrasenas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `contrasenas_hasheada` varchar(255) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `historial_contrasenas_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `historial_contrasenas` */

/*Table structure for table `interacciones_soporte` */

DROP TABLE IF EXISTS `interacciones_soporte`;

CREATE TABLE `interacciones_soporte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) NOT NULL,
  `agente_soporte_id` int(11) NOT NULL,
  `mensaje` text NOT NULL,
  `fecha_hora` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `agente_soporte_id` (`agente_soporte_id`),
  CONSTRAINT `interacciones_soporte_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `tickets_soporte` (`id`),
  CONSTRAINT `interacciones_soporte_ibfk_2` FOREIGN KEY (`agente_soporte_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `interacciones_soporte` */

/*Table structure for table `jerarquia_usuarios` */

DROP TABLE IF EXISTS `jerarquia_usuarios`;

CREATE TABLE `jerarquia_usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `jefe_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `jefe_id` (`jefe_id`),
  CONSTRAINT `jerarquia_usuarios_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `jerarquia_usuarios_ibfk_2` FOREIGN KEY (`jefe_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `jerarquia_usuarios` */

/*Table structure for table `notificaciones` */

DROP TABLE IF EXISTS `notificaciones`;

CREATE TABLE `notificaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `mensaje` varchar(400) NOT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT current_timestamp(),
  `leida` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `notificaciones_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `notificaciones` */

/*Table structure for table `notificaciones_tipo` */

DROP TABLE IF EXISTS `notificaciones_tipo`;

CREATE TABLE `notificaciones_tipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notificaciones_id` int(11) NOT NULL,
  `tipo_notificacion_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `notificaciones_id` (`notificaciones_id`),
  KEY `tipo_notificacion_id` (`tipo_notificacion_id`),
  CONSTRAINT `notificaciones_tipo_ibfk_1` FOREIGN KEY (`notificaciones_id`) REFERENCES `notificaciones` (`id`),
  CONSTRAINT `notificaciones_tipo_ibfk_2` FOREIGN KEY (`tipo_notificacion_id`) REFERENCES `tipo_notificacion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `notificaciones_tipo` */

/*Table structure for table `pedidos` */

DROP TABLE IF EXISTS `pedidos`;

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `producto_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `producto_id` (`producto_id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`),
  CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `pedidos` */

/*Table structure for table `permisos` */

DROP TABLE IF EXISTS `permisos`;

CREATE TABLE `permisos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `permisos` */

/*Table structure for table `productos` */

DROP TABLE IF EXISTS `productos`;

CREATE TABLE `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `tiempo_confeccion_horas` int(11) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `productos` */

/*Table structure for table `productos_promocionados` */

DROP TABLE IF EXISTS `productos_promocionados`;

CREATE TABLE `productos_promocionados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `producto_id` int(11) NOT NULL,
  `promocion_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `producto_id` (`producto_id`),
  KEY `promocion_id` (`promocion_id`),
  CONSTRAINT `productos_promocionados_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`),
  CONSTRAINT `productos_promocionados_ibfk_2` FOREIGN KEY (`promocion_id`) REFERENCES `promociones` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `productos_promocionados` */

/*Table structure for table `promociones` */

DROP TABLE IF EXISTS `promociones`;

CREATE TABLE `promociones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `descuento` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `promociones` */

/*Table structure for table `registro_actividad` */

DROP TABLE IF EXISTS `registro_actividad`;

CREATE TABLE `registro_actividad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `accion_id` int(11) NOT NULL,
  `descripcion` varchar(60) DEFAULT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `accion_id` (`accion_id`),
  CONSTRAINT `registro_actividad_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `registro_actividad_ibfk_2` FOREIGN KEY (`accion_id`) REFERENCES `tipo_accion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `registro_actividad` */

/*Table structure for table `registro_errores` */

DROP TABLE IF EXISTS `registro_errores`;

CREATE TABLE `registro_errores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) DEFAULT NULL,
  `descripcion` text NOT NULL,
  `fecha_hora` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `registro_errores_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `registro_errores` */

/*Table structure for table `registro_usuario` */

DROP TABLE IF EXISTS `registro_usuario`;

CREATE TABLE `registro_usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `nombre` varchar(260) NOT NULL,
  `apellido` varchar(260) NOT NULL,
  `fecha_nac` date NOT NULL,
  `mail` varchar(60) NOT NULL,
  `contrasena` varchar(260) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `registro_usuario_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `registro_usuario` */

/*Table structure for table `registros_cambio_contrasena` */

DROP TABLE IF EXISTS `registros_cambio_contrasena`;

CREATE TABLE `registros_cambio_contrasena` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `contrasena_nueva_hasheada` varchar(255) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `registros_cambio_contrasena_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `registros_cambio_contrasena` */

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `descripcion` varchar(260) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `roles` */

/*Table structure for table `roles_permisos` */

DROP TABLE IF EXISTS `roles_permisos`;

CREATE TABLE `roles_permisos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rol_id` int(11) NOT NULL,
  `permiso_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rol_id` (`rol_id`),
  KEY `permiso_id` (`permiso_id`),
  CONSTRAINT `roles_permisos_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `roles_permisos_ibfk_2` FOREIGN KEY (`permiso_id`) REFERENCES `permisos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `roles_permisos` */

/*Table structure for table `roles_usuarios` */

DROP TABLE IF EXISTS `roles_usuarios`;

CREATE TABLE `roles_usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `rol_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `rol_id` (`rol_id`),
  CONSTRAINT `roles_usuarios_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `roles_usuarios_ibfk_2` FOREIGN KEY (`rol_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `roles_usuarios` */

/*Table structure for table `tallas` */

DROP TABLE IF EXISTS `tallas`;

CREATE TABLE `tallas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tallas` */

/*Table structure for table `telas` */

DROP TABLE IF EXISTS `telas`;

CREATE TABLE `telas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `telas` */

/*Table structure for table `tickets_soporte` */

DROP TABLE IF EXISTS `tickets_soporte`;

CREATE TABLE `tickets_soporte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `asunto` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `estado` varchar(50) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `tickets_soporte_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tickets_soporte` */

/*Table structure for table `tipo_accion` */

DROP TABLE IF EXISTS `tipo_accion`;

CREATE TABLE `tipo_accion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tipo_accion` */

/*Table structure for table `tipo_notificacion` */

DROP TABLE IF EXISTS `tipo_notificacion`;

CREATE TABLE `tipo_notificacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tipo_notificacion` */

/*Table structure for table `transacciones_detalle_pedido` */

DROP TABLE IF EXISTS `transacciones_detalle_pedido`;

CREATE TABLE `transacciones_detalle_pedido` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaccion_pago_id` int(11) NOT NULL,
  `detalle_pedido_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `transaccion_pago_id` (`transaccion_pago_id`),
  KEY `detalle_pedido_id` (`detalle_pedido_id`),
  CONSTRAINT `transacciones_detalle_pedido_ibfk_1` FOREIGN KEY (`transaccion_pago_id`) REFERENCES `transacciones_pago` (`id`),
  CONSTRAINT `transacciones_detalle_pedido_ibfk_2` FOREIGN KEY (`detalle_pedido_id`) REFERENCES `detalle_pedido` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `transacciones_detalle_pedido` */

/*Table structure for table `transacciones_pago` */

DROP TABLE IF EXISTS `transacciones_pago`;

CREATE TABLE `transacciones_pago` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `tipo_pago` varchar(50) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `comprobante` varchar(255) DEFAULT NULL,
  `datos_operacion` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `transacciones_pago_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `transacciones_pago` */

/*Table structure for table `usuarios` */

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) NOT NULL,
  `apellido` varchar(250) NOT NULL,
  `email` varchar(60) NOT NULL,
  `contrasena` varchar(260) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `usuarios` */

/*Table structure for table `usuarios_descuentos` */

DROP TABLE IF EXISTS `usuarios_descuentos`;

CREATE TABLE `usuarios_descuentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `promocion_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `promocion_id` (`promocion_id`),
  CONSTRAINT `usuarios_descuentos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `usuarios_descuentos_ibfk_2` FOREIGN KEY (`promocion_id`) REFERENCES `promociones` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `usuarios_descuentos` */

/*Table structure for table `valoraciones` */

DROP TABLE IF EXISTS `valoraciones`;

CREATE TABLE `valoraciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `calificacion` int(11) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `producto_id` (`producto_id`),
  CONSTRAINT `valoraciones_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `valoraciones_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `valoraciones` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
