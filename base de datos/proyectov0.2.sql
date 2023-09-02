<?xml version="1.0" encoding="UTF-8"?>
<schemadesigner version="6.5">
<source>
<database charset="utf8" collation="utf8_general_ci">proyecto</database>
</source>
<canvas zoom="30">
<tables>
<table name="consultas" view="colnames">
<left>345</left>
<top>572</top>
<width>42</width>
<height>49</height>
<sql_create_table>CREATE TABLE `consultas` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8</sql_create_table>
</table>
<table name="detalle_pedido" view="colnames">
<left>424</left>
<top>27</top>
<width>53</width>
<height>64</height>
<sql_create_table>CREATE TABLE `detalle_pedido` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8</sql_create_table>
</table>
<table name="jerarquia_usuarios" view="colnames">
<left>681</left>
<top>22</top>
<width>42</width>
<height>39</height>
<sql_create_table>CREATE TABLE `jerarquia_usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `jefe_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `jefe_id` (`jefe_id`),
  CONSTRAINT `jerarquia_usuarios_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `jerarquia_usuarios_ibfk_2` FOREIGN KEY (`jefe_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8</sql_create_table>
</table>
<table name="usuarios" view="colnames">
<left>716</left>
<top>374</top>
<width>47</width>
<height>59</height>
<sql_create_table>CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) NOT NULL,
  `apellido` varchar(250) NOT NULL,
  `email` varchar(60) NOT NULL,
  `contrasena` varchar(260) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8</sql_create_table>
</table>
<table name="roles_usuarios" view="colnames">
<left>767</left>
<top>106</top>
<width>42</width>
<height>39</height>
<sql_create_table>CREATE TABLE `roles_usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `rol_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `rol_id` (`rol_id`),
  CONSTRAINT `roles_usuarios_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `roles_usuarios_ibfk_2` FOREIGN KEY (`rol_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8</sql_create_table>
</table>
<table name="roles_permisos" view="colnames">
<left>793</left>
<top>28</top>
<width>42</width>
<height>39</height>
<sql_create_table>CREATE TABLE `roles_permisos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rol_id` int(11) NOT NULL,
  `permiso_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rol_id` (`rol_id`),
  KEY `permiso_id` (`permiso_id`),
  CONSTRAINT `roles_permisos_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `roles_permisos_ibfk_2` FOREIGN KEY (`permiso_id`) REFERENCES `permisos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8</sql_create_table>
</table>
<table name="registro_usuario" view="colnames">
<left>889</left>
<top>817</top>
<width>47</width>
<height>69</height>
<sql_create_table>CREATE TABLE `registro_usuario` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8</sql_create_table>
</table>
<table name="productos" view="colnames">
<left>213</left>
<top>273</top>
<width>75</width>
<height>89</height>
<sql_create_table>CREATE TABLE `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `tiempo_confeccion_horas` int(11) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8</sql_create_table>
</table>
<table name="permisos" view="colnames">
<left>952</left>
<top>87</top>
<width>42</width>
<height>39</height>
<sql_create_table>CREATE TABLE `permisos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8</sql_create_table>
</table>
<table name="pedidos" view="colnames">
<left>268</left>
<top>33</top>
<width>42</width>
<height>69</height>
<sql_create_table>CREATE TABLE `pedidos` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8</sql_create_table>
</table>
<table name="tipo_accion" view="colnames">
<left>528</left>
<top>794</top>
<width>42</width>
<height>42</height>
<sql_create_table>CREATE TABLE `tipo_accion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8</sql_create_table>
</table>
<table name="registro_actividad" view="colnames">
<left>424</left>
<top>737</top>
<width>42</width>
<height>48</height>
<sql_create_table>CREATE TABLE `registro_actividad` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8</sql_create_table>
</table>
<table name="notificaciones" view="colnames">
<left>757</left>
<top>695</top>
<width>42</width>
<height>49</height>
<sql_create_table>CREATE TABLE `notificaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `mensaje` varchar(400) NOT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT current_timestamp(),
  `leida` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `notificaciones_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8</sql_create_table>
</table>
<table name="notificaciones_tipo" view="colnames">
<left>612</left>
<top>710</top>
<width>45</width>
<height>42</height>
<sql_create_table>CREATE TABLE `notificaciones_tipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notificaciones_id` int(11) NOT NULL,
  `tipo_notificacion_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `notificaciones_id` (`notificaciones_id`),
  KEY `tipo_notificacion_id` (`tipo_notificacion_id`),
  CONSTRAINT `notificaciones_tipo_ibfk_1` FOREIGN KEY (`notificaciones_id`) REFERENCES `notificaciones` (`id`),
  CONSTRAINT `notificaciones_tipo_ibfk_2` FOREIGN KEY (`tipo_notificacion_id`) REFERENCES `tipo_notificacion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8</sql_create_table>
</table>
<table name="tipo_notificacion" view="colnames">
<left>745</left>
<top>773</top>
<width>42</width>
<height>39</height>
<sql_create_table>CREATE TABLE `tipo_notificacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8</sql_create_table>
</table>
<table name="categorias_configuracion" view="colnames">
<left>1186</left>
<top>241</top>
<width>42</width>
<height>39</height>
<sql_create_table>CREATE TABLE `categorias_configuracion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8</sql_create_table>
</table>
<table name="configuracion_categoria" view="colnames">
<left>1313</left>
<top>248</top>
<width>60</width>
<height>39</height>
<sql_create_table>CREATE TABLE `configuracion_categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `configuracion_id` int(11) NOT NULL,
  `categoria_configuracion_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `configuracion_id` (`configuracion_id`),
  KEY `categoria_configuracion_id` (`categoria_configuracion_id`),
  CONSTRAINT `configuracion_categoria_ibfk_1` FOREIGN KEY (`configuracion_id`) REFERENCES `configuracion_sistema` (`id`),
  CONSTRAINT `configuracion_categoria_ibfk_2` FOREIGN KEY (`categoria_configuracion_id`) REFERENCES `categorias_configuracion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8</sql_create_table>
</table>
<table name="configuracion_permiso" view="colnames">
<left>1351</left>
<top>117</top>
<width>57</width>
<height>39</height>
<sql_create_table>CREATE TABLE `configuracion_permiso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `configuracion_sistema_id` int(11) NOT NULL,
  `permiso_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `configuracion_sistema_id` (`configuracion_sistema_id`),
  KEY `permiso_id` (`permiso_id`),
  CONSTRAINT `configuracion_permiso_ibfk_1` FOREIGN KEY (`configuracion_sistema_id`) REFERENCES `configuracion_sistema` (`id`),
  CONSTRAINT `configuracion_permiso_ibfk_2` FOREIGN KEY (`permiso_id`) REFERENCES `permisos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8</sql_create_table>
</table>
<table name="configuracion_rol" view="colnames">
<left>1400</left>
<top>27</top>
<width>57</width>
<height>39</height>
<sql_create_table>CREATE TABLE `configuracion_rol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `configuracion_sistema_id` int(11) NOT NULL,
  `rol_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `configuracion_sistema_id` (`configuracion_sistema_id`),
  KEY `rol_id` (`rol_id`),
  CONSTRAINT `configuracion_rol_ibfk_1` FOREIGN KEY (`configuracion_sistema_id`) REFERENCES `configuracion_sistema` (`id`),
  CONSTRAINT `configuracion_rol_ibfk_2` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8</sql_create_table>
</table>
<table name="roles" view="colnames">
<left>1193</left>
<top>23</top>
<width>42</width>
<height>39</height>
<sql_create_table>CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `descripcion` varchar(260) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8</sql_create_table>
</table>
<table name="configuracion_sistema" view="colnames">
<left>1444</left>
<top>110</top>
<width>47</width>
<height>54</height>
<sql_create_table>CREATE TABLE `configuracion_sistema` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `version` varchar(100) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8</sql_create_table>
</table>
<table name="configuracion_usuario" view="colnames">
<left>869</left>
<top>160</top>
<width>57</width>
<height>39</height>
<sql_create_table>CREATE TABLE `configuracion_usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `configuracion_sistema_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `configuracion_sistema_id` (`configuracion_sistema_id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `configuracion_usuario_ibfk_1` FOREIGN KEY (`configuracion_sistema_id`) REFERENCES `configuracion_sistema` (`id`),
  CONSTRAINT `configuracion_usuario_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8</sql_create_table>
</table>
<table name="historial_contrasenas" view="colnames">
<left>1420</left>
<top>720</top>
<width>53</width>
<height>44</height>
<sql_create_table>CREATE TABLE `historial_contrasenas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `contrasenas_hasheada` varchar(255) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `historial_contrasenas_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8</sql_create_table>
</table>
<table name="registros_cambio_contrasena" view="colnames">
<left>1018</left>
<top>210</top>
<width>64</width>
<height>44</height>
<sql_create_table>CREATE TABLE `registros_cambio_contrasena` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `contrasena_nueva_hasheada` varchar(255) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `registros_cambio_contrasena_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8</sql_create_table>
</table>
<table name="contactos" view="colnames">
<left>1329</left>
<top>403</top>
<width>45</width>
<height>57</height>
<sql_create_table>CREATE TABLE `contactos` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8</sql_create_table>
</table>
<table name="clientes" view="colnames">
<left>1432</left>
<top>328</top>
<width>48</width>
<height>54</height>
<sql_create_table>CREATE TABLE `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `direccion` text DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8</sql_create_table>
</table>
<table name="colores" view="colnames">
<left>14</left>
<top>29</top>
<width>42</width>
<height>39</height>
<sql_create_table>CREATE TABLE `colores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8</sql_create_table>
</table>
<table name="detalle_producto" view="colnames">
<left>113</left>
<top>153</top>
<width>42</width>
<height>54</height>
<sql_create_table>CREATE TABLE `detalle_producto` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8</sql_create_table>
</table>
<table name="disenos" view="colnames">
<left>8</left>
<top>137</top>
<width>42</width>
<height>39</height>
<sql_create_table>CREATE TABLE `disenos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8</sql_create_table>
</table>
<table name="tallas" view="colnames">
<left>11</left>
<top>92</top>
<width>42</width>
<height>39</height>
<sql_create_table>CREATE TABLE `tallas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8</sql_create_table>
</table>
<table name="telas" view="colnames">
<left>41</left>
<top>727</top>
<width>42</width>
<height>39</height>
<sql_create_table>CREATE TABLE `telas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8</sql_create_table>
</table>
<table name="cadeterias" view="colnames">
<left>1047</left>
<top>300</top>
<width>42</width>
<height>39</height>
<sql_create_table>CREATE TABLE `cadeterias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8</sql_create_table>
</table>
<table name="comentarios" view="colnames">
<left>510</left>
<top>378</top>
<width>42</width>
<height>51</height>
<sql_create_table>CREATE TABLE `comentarios` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8</sql_create_table>
</table>
<table name="envios" view="colnames">
<left>1150</left>
<top>283</top>
<width>44</width>
<height>54</height>
<sql_create_table>CREATE TABLE `envios` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8</sql_create_table>
</table>
<table name="valoraciones" view="colnames">
<left>231</left>
<top>725</top>
<width>42</width>
<height>64</height>
<sql_create_table>CREATE TABLE `valoraciones` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8</sql_create_table>
</table>
<table name="transacciones_detalle_pedido" view="colnames">
<left>558</left>
<top>40</top>
<width>49</width>
<height>39</height>
<sql_create_table>CREATE TABLE `transacciones_detalle_pedido` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaccion_pago_id` int(11) NOT NULL,
  `detalle_pedido_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `transaccion_pago_id` (`transaccion_pago_id`),
  KEY `detalle_pedido_id` (`detalle_pedido_id`),
  CONSTRAINT `transacciones_detalle_pedido_ibfk_1` FOREIGN KEY (`transaccion_pago_id`) REFERENCES `transacciones_pago` (`id`),
  CONSTRAINT `transacciones_detalle_pedido_ibfk_2` FOREIGN KEY (`detalle_pedido_id`) REFERENCES `detalle_pedido` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8</sql_create_table>
</table>
<table name="usuarios_descuentos" view="colnames">
<left>1119</left>
<top>473</top>
<width>42</width>
<height>39</height>
<sql_create_table>CREATE TABLE `usuarios_descuentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `promocion_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `promocion_id` (`promocion_id`),
  CONSTRAINT `usuarios_descuentos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `usuarios_descuentos_ibfk_2` FOREIGN KEY (`promocion_id`) REFERENCES `promociones` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8</sql_create_table>
</table>
<table name="transacciones_pago" view="colnames">
<left>665</left>
<top>115</top>
<width>42</width>
<height>59</height>
<sql_create_table>CREATE TABLE `transacciones_pago` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8</sql_create_table>
</table>
<table name="registro_errores" view="colnames">
<left>1206</left>
<top>306</top>
<width>42</width>
<height>44</height>
<sql_create_table>CREATE TABLE `registro_errores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) DEFAULT NULL,
  `descripcion` text NOT NULL,
  `fecha_hora` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_modificacion` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `registro_errores_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8</sql_create_table>
</table>
<table name="promociones" view="colnames">
<left>1348</left>
<top>486</top>
<width>42</width>
<height>54</height>
<sql_create_table>CREATE TABLE `promociones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `descuento` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8</sql_create_table>
</table>
<table name="productos_promocionados" view="colnames">
<left>1367</left>
<top>569</top>
<width>42</width>
<height>39</height>
<sql_create_table>CREATE TABLE `productos_promocionados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `producto_id` int(11) NOT NULL,
  `promocion_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `producto_id` (`producto_id`),
  KEY `promocion_id` (`promocion_id`),
  CONSTRAINT `productos_promocionados_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`),
  CONSTRAINT `productos_promocionados_ibfk_2` FOREIGN KEY (`promocion_id`) REFERENCES `promociones` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8</sql_create_table>
</table>
</tables>
</canvas>
</schemadesigner>