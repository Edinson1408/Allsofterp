-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 03-07-2019 a las 17:38:58
-- Versión del servidor: 5.5.61
-- Versión de PHP: 5.6.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `root_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `canceled_invoices`
--

CREATE TABLE `canceled_invoices` (
  `id` int(11) NOT NULL,
  `id_comprobante` int(11) NOT NULL,
  `ticket` varchar(1000) DEFAULT NULL,
  `state` int(11) DEFAULT '1',
  `creation_date` datetime DEFAULT NULL,
  `modification_date` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `people_id` int(11) NOT NULL,
  `state` int(11) DEFAULT '1',
  `oficina` varchar(45) DEFAULT NULL,
  `client_type` int(11) DEFAULT NULL,
  `delivery_man_id` int(11) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `modification_date` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `client_branches`
--

CREATE TABLE `client_branches` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `reference_name` varchar(100) DEFAULT NULL,
  `state` int(11) NOT NULL DEFAULT '1',
  `creation_date` datetime DEFAULT NULL,
  `modification_date` datetime DEFAULT NULL,
  `user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprobante_venta`
--

CREATE TABLE `comprobante_venta` (
  `id` int(11) NOT NULL,
  `tipo_doc` int(11) NOT NULL,
  `tipo_operacion` varchar(5) DEFAULT NULL,
  `serie` varchar(45) DEFAULT NULL,
  `correlativo` varchar(45) DEFAULT NULL,
  `id_moneda` int(11) DEFAULT NULL,
  `id_cliente` int(11) NOT NULL,
  `fecha_emision` datetime DEFAULT NULL,
  `fecha_vencimiento` datetime DEFAULT NULL,
  `total_igv` float DEFAULT NULL,
  `tasa_igv` decimal(11,2) DEFAULT NULL,
  `tipo_cambio` decimal(11,4) DEFAULT NULL,
  `total_exonerada` float DEFAULT NULL,
  `total_gratuita` float DEFAULT NULL,
  `total_inafecta` float DEFAULT NULL,
  `total_gravada` float DEFAULT NULL,
  `total_otros` float DEFAULT NULL,
  `total` decimal(12,2) DEFAULT NULL,
  `total_descuento_items` float DEFAULT NULL,
  `descuento_goblal` float DEFAULT NULL,
  `ubigeo_codigo` varchar(45) DEFAULT NULL,
  `sunat_aceptado` int(11) DEFAULT NULL COMMENT '0- no validado(pendiente), 1- aceptado, 2-rechazado',
  `xml_hash` varchar(500) DEFAULT NULL,
  `xml_signature` text,
  `xml_b64` mediumtext,
  `xml_name` varchar(250) DEFAULT NULL,
  `fault_descrip` varchar(2500) DEFAULT NULL,
  `xml_cdr_b64` text,
  `observaciones` text,
  `creation_date` datetime DEFAULT NULL,
  `modification_date` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `origin` int(11) NOT NULL DEFAULT '1' COMMENT '0=>api,1=>module',
  `state` int(11) DEFAULT NULL COMMENT '0=>emitido, 1=>aprobado,2=>anulado'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprobante_venta_detalle`
--

CREATE TABLE `comprobante_venta_detalle` (
  `id` int(11) NOT NULL,
  `id_comprobante` int(11) NOT NULL,
  `id_product_service` int(11) DEFAULT NULL COMMENT 'id del articulo',
  `codigo` varchar(250) DEFAULT NULL,
  `nombre` varchar(5000) DEFAULT NULL,
  `unidad` varchar(45) DEFAULT NULL,
  `cantidad` decimal(11,2) DEFAULT '0.00',
  `valor_unitario` float DEFAULT NULL,
  `precio_unitario` float DEFAULT NULL,
  `subtotal` float DEFAULT NULL,
  `igv` float DEFAULT NULL,
  `inafecta` float DEFAULT NULL,
  `exonerada` decimal(11,4) DEFAULT NULL,
  `total` decimal(11,2) DEFAULT NULL,
  `tipo_igv` int(11) DEFAULT NULL,
  `with_igv` int(11) NOT NULL DEFAULT '0' COMMENT '0=>no incluye,1=>incluye igv el producto',
  `descripcion` varchar(5000) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `constancy`
--

CREATE TABLE `constancy` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `technical_id` int(11) NOT NULL,
  `contract` varchar(45) DEFAULT NULL,
  `period` varchar(45) DEFAULT NULL,
  `serie` varchar(15) DEFAULT NULL,
  `correlative` decimal(11,0) DEFAULT NULL,
  `state` int(11) NOT NULL DEFAULT '1',
  `creation_date` datetime DEFAULT NULL,
  `modification_date` datetime DEFAULT NULL,
  `aditional_description` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `constancy_detail`
--

CREATE TABLE `constancy_detail` (
  `id` int(11) NOT NULL,
  `constancy_id` int(11) NOT NULL,
  `floor` varchar(45) DEFAULT NULL,
  `ambient` varchar(45) DEFAULT NULL,
  `type_equipment` varchar(45) DEFAULT NULL,
  `type_equipment_number` int(11) DEFAULT NULL,
  `model` varchar(100) DEFAULT NULL,
  `brand` varchar(100) DEFAULT NULL,
  `serie` varchar(45) DEFAULT NULL,
  `creation_date` date DEFAULT NULL,
  `service` varchar(45) DEFAULT NULL,
  `description` text,
  `protocol` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `constancy_protocol`
--

CREATE TABLE `constancy_protocol` (
  `id` int(11) NOT NULL,
  `key_index` varchar(10) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `is_object` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dispatches`
--

CREATE TABLE `dispatches` (
  `id` int(11) NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `unity` int(11) DEFAULT NULL,
  `serie` varchar(45) DEFAULT NULL,
  `correlative` varchar(45) DEFAULT NULL,
  `emition_date` date DEFAULT NULL,
  `transfer_date` date DEFAULT NULL,
  `transfer_mode` varchar(5) DEFAULT NULL,
  `transfer_reason` varchar(5) DEFAULT NULL,
  `origin_nationality` int(11) DEFAULT NULL,
  `origin_departament` varchar(5) DEFAULT NULL,
  `origin_province` varchar(5) DEFAULT NULL,
  `origin_district` varchar(5) DEFAULT NULL,
  `destination_nationality` int(11) DEFAULT NULL,
  `destination_departament` varchar(5) DEFAULT NULL,
  `destination_province` varchar(5) DEFAULT NULL,
  `destination_district` varchar(5) DEFAULT NULL,
  `carrier_doc_type` varchar(5) DEFAULT NULL,
  `carrier_document_number` varchar(15) DEFAULT NULL,
  `carrier_name` varchar(300) DEFAULT NULL,
  `driver_doc_type` varchar(5) DEFAULT NULL,
  `driver_document_number` varchar(15) DEFAULT NULL,
  `licence_number` varchar(45) DEFAULT NULL,
  `total_weight` decimal(11,4) DEFAULT NULL,
  `port_code` varchar(100) DEFAULT NULL,
  `package_number` varchar(50) DEFAULT NULL,
  `container_number` varchar(50) DEFAULT NULL,
  `starting_address` varchar(500) DEFAULT NULL,
  `destination_address` varchar(500) DEFAULT NULL,
  `xml_b64` mediumtext,
  `cdr` text,
  `transfer` int(11) DEFAULT NULL,
  `description` text,
  `transfer_reason_description` text,
  `sunat_state` int(11) NOT NULL DEFAULT '0',
  `state` int(11) NOT NULL DEFAULT '1',
  `creation_date` datetime DEFAULT NULL,
  `modification_date` datetime DEFAULT NULL,
  `user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dispatches_detail`
--

CREATE TABLE `dispatches_detail` (
  `id` int(11) NOT NULL,
  `dispatches_id` int(11) DEFAULT NULL,
  `product_service_id` int(11) DEFAULT NULL,
  `quantity` decimal(11,2) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entry_guide`
--

CREATE TABLE `entry_guide` (
  `id` int(11) NOT NULL,
  `serie` varchar(45) DEFAULT NULL,
  `correlative` varchar(45) DEFAULT NULL,
  `igv` decimal(11,4) DEFAULT NULL,
  `total` decimal(11,4) DEFAULT NULL,
  `emition_date` datetime DEFAULT NULL,
  `id_motivo` int(11) DEFAULT NULL,
  `ubigeo` varchar(10) DEFAULT NULL,
  `description` text,
  `state` int(11) NOT NULL DEFAULT '1',
  `creation_date` datetime DEFAULT NULL,
  `modification_date` datetime DEFAULT NULL,
  `user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entry_guide_detail`
--

CREATE TABLE `entry_guide_detail` (
  `id` int(11) NOT NULL,
  `entry_guide_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` decimal(11,4) DEFAULT NULL,
  `stock` decimal(11,4) DEFAULT NULL,
  `out_stock` decimal(11,4) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `modification_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `expense_control`
--

CREATE TABLE `expense_control` (
  `id` int(11) NOT NULL,
  `coin_id` int(11) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `day` date DEFAULT NULL,
  `amount` decimal(11,2) DEFAULT NULL,
  `type` int(11) DEFAULT NULL COMMENT '1=>Ingreso,0=>Egreso',
  `state` int(11) NOT NULL DEFAULT '1',
  `creation_date` datetime DEFAULT NULL,
  `modification_date` datetime DEFAULT NULL,
  `user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `finance_box`
--

CREATE TABLE `finance_box` (
  `id` int(11) NOT NULL,
  `coin_id` int(11) NOT NULL,
  `withdrawal_limit` decimal(11,4) DEFAULT NULL,
  `name` varchar(500) NOT NULL,
  `acount_number` varchar(45) DEFAULT NULL,
  `cci` varchar(25) DEFAULT NULL,
  `acount_type` int(11) DEFAULT NULL,
  `state` int(11) NOT NULL DEFAULT '1',
  `description` text,
  `creation_date` datetime DEFAULT NULL,
  `modification_date` datetime DEFAULT NULL,
  `user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `finance_box_operations`
--

CREATE TABLE `finance_box_operations` (
  `id` int(11) NOT NULL,
  `box_session_id` int(11) NOT NULL,
  `serie` varchar(15) DEFAULT NULL,
  `correlative` varchar(15) DEFAULT NULL,
  `operation_type` int(11) DEFAULT '0' COMMENT '0=>Egreso,1=>Ingreso',
  `concept` varchar(500) DEFAULT NULL,
  `document_id` int(11) DEFAULT NULL,
  `total` decimal(11,4) DEFAULT NULL,
  `state` int(11) NOT NULL DEFAULT '1',
  `creation_date` datetime DEFAULT NULL,
  `modification_date` datetime DEFAULT NULL,
  `user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `finance_box_session`
--

CREATE TABLE `finance_box_session` (
  `id` int(11) NOT NULL,
  `finance_box_id` int(11) NOT NULL,
  `start_amount` decimal(11,4) DEFAULT NULL,
  `close_amount` decimal(11,4) DEFAULT NULL,
  `real_amount_close` decimal(11,4) DEFAULT NULL,
  `missing_amount` decimal(11,4) DEFAULT NULL,
  `state` int(11) NOT NULL DEFAULT '1' COMMENT '0=>cerrado,1=>abierto',
  `creation_date` datetime DEFAULT NULL,
  `modification_date` datetime DEFAULT NULL,
  `user_open` int(11) NOT NULL,
  `user_close` int(11) DEFAULT NULL,
  `user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `invoice_summary`
--

CREATE TABLE `invoice_summary` (
  `id` int(11) NOT NULL,
  `doc_type` int(11) DEFAULT NULL,
  `summary_type` int(11) DEFAULT NULL,
  `ticket` varchar(100) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `xml_name` varchar(100) DEFAULT NULL,
  `documents` mediumtext,
  `sunat_aceptado` int(11) DEFAULT '1',
  `sunat_code_response` varchar(10) DEFAULT NULL COMMENT 'resumenes: 0-> Aprobado / 098-> En espera / 099->Error',
  `creation_date` datetime DEFAULT NULL,
  `modification_date` datetime DEFAULT NULL,
  `summary_date` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modules`
--

CREATE TABLE `modules` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `icon` varchar(45) DEFAULT NULL,
  `url` varchar(500) DEFAULT NULL,
  `component` varchar(45) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT '1',
  `position` int(11) DEFAULT '0',
  `description` text,
  `creation_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notes`
--

CREATE TABLE `notes` (
  `id` int(11) NOT NULL,
  `tipo_doc` int(11) NOT NULL,
  `tipo_operacion` varchar(5) DEFAULT NULL,
  `tipo_nota` varchar(5) DEFAULT NULL,
  `serie` varchar(45) DEFAULT NULL,
  `correlativo` varchar(45) DEFAULT NULL,
  `id_comprobante` int(11) DEFAULT NULL,
  `id_moneda` int(11) DEFAULT NULL,
  `id_cliente` int(11) NOT NULL,
  `fecha_emision` datetime DEFAULT NULL,
  `fecha_vencimiento` datetime DEFAULT NULL,
  `total_igv` float DEFAULT NULL,
  `total_exonerada` float DEFAULT NULL,
  `total_gratuita` float DEFAULT NULL,
  `total_inafecta` float DEFAULT NULL,
  `total_gravada` float DEFAULT NULL,
  `total_otros` float DEFAULT NULL,
  `total` float DEFAULT NULL,
  `total_descuento_items` float DEFAULT NULL,
  `descuento_goblal` float DEFAULT NULL,
  `sunat_aceptado` int(11) DEFAULT NULL,
  `xml_hash` varchar(500) DEFAULT NULL,
  `xml_signature` text,
  `xml_b64` mediumtext,
  `xml_name` varchar(250) DEFAULT NULL,
  `fault_descrip` varchar(2500) DEFAULT NULL,
  `xml_cdr_b64` text,
  `observaciones` text,
  `creation_date` datetime DEFAULT NULL,
  `modification_date` datetime DEFAULT NULL,
  `state` int(11) DEFAULT '1',
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notes_details`
--

CREATE TABLE `notes_details` (
  `id` int(11) NOT NULL,
  `note_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `codigo` varchar(250) DEFAULT NULL,
  `nombre` varchar(5000) DEFAULT NULL,
  `unidad` varchar(45) DEFAULT NULL,
  `cantidad` int(11) DEFAULT '0',
  `valor_unitario` float DEFAULT NULL,
  `precio_unitario` float DEFAULT NULL,
  `subtotal` float DEFAULT NULL,
  `igv` float DEFAULT NULL,
  `inafecta` decimal(11,4) DEFAULT NULL,
  `exonerada` decimal(11,2) DEFAULT NULL,
  `total` decimal(11,2) DEFAULT NULL,
  `tipo_igv` int(11) DEFAULT NULL,
  `descripcion` varchar(5000) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `people`
--

CREATE TABLE `people` (
  `id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `first_name` varchar(200) DEFAULT NULL,
  `last_name` varchar(200) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `direction` varchar(500) DEFAULT NULL,
  `ubigeo` varchar(6) DEFAULT NULL,
  `doc_type` int(11) DEFAULT NULL,
  `document_number` varchar(50) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `country_id` int(11) NOT NULL,
  `is_client` int(11) DEFAULT NULL,
  `is_provider` int(11) DEFAULT NULL,
  `is_user` int(11) NOT NULL DEFAULT '0' COMMENT '0=>no,1=>si',
  `state` int(11) DEFAULT '1',
  `creation_date` datetime DEFAULT NULL,
  `modification_date` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `print_settings`
--

CREATE TABLE `print_settings` (
  `id` int(11) NOT NULL,
  `doc_type` int(11) DEFAULT NULL,
  `code` varchar(45) DEFAULT NULL,
  `value` varchar(500) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `state` int(11) NOT NULL DEFAULT '1',
  `user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_service`
--

CREATE TABLE `product_service` (
  `id` int(11) NOT NULL,
  `code` varchar(100) DEFAULT NULL,
  `ean_code` varchar(50) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `description` text,
  `family_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `purchase_value` decimal(10,4) DEFAULT NULL,
  `existence_type` int(11) DEFAULT NULL,
  `is_taxable` int(11) DEFAULT '0',
  `is_product` int(11) DEFAULT '1',
  `control_type` int(11) DEFAULT NULL,
  `unity` varchar(15) DEFAULT NULL,
  `stock` decimal(11,4) NOT NULL DEFAULT '0.0000',
  `state` int(11) DEFAULT '1',
  `creation_date` datetime DEFAULT NULL,
  `modification_date` datetime DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `restaurant_menu_entries`
--

CREATE TABLE `restaurant_menu_entries` (
  `id` int(11) NOT NULL,
  `code` varchar(15) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `state` int(11) NOT NULL DEFAULT '1',
  `creation_date` datetime DEFAULT NULL,
  `modification_date` datetime DEFAULT NULL,
  `user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `restaurant_order`
--

CREATE TABLE `restaurant_order` (
  `id` int(11) NOT NULL,
  `description` text,
  `state` int(11) NOT NULL DEFAULT '1',
  `creation_date` datetime DEFAULT NULL,
  `modification_date` datetime DEFAULT NULL,
  `user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `restaurant_order_products`
--

CREATE TABLE `restaurant_order_products` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `state` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `restaurant_room`
--

CREATE TABLE `restaurant_room` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `capacity` int(11) DEFAULT '0',
  `description` text,
  `avatar` varchar(500) DEFAULT NULL,
  `state` int(11) NOT NULL DEFAULT '1',
  `creation_date` datetime DEFAULT NULL,
  `modification_date` datetime DEFAULT NULL,
  `user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `restaurant_room_detail`
--

CREATE TABLE `restaurant_room_detail` (
  `id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `table_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `restaurant_table`
--

CREATE TABLE `restaurant_table` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `fields` int(11) DEFAULT '0',
  `description` text,
  `avatar` varchar(500) DEFAULT NULL,
  `state` int(11) NOT NULL DEFAULT '1',
  `creation_date` datetime DEFAULT NULL,
  `modification_date` datetime DEFAULT NULL,
  `user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sales_note`
--

CREATE TABLE `sales_note` (
  `id` int(11) NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `delivery_man_id` int(11) DEFAULT NULL,
  `serie` varchar(45) DEFAULT NULL,
  `correlative` varchar(45) DEFAULT NULL,
  `doc_type` int(11) DEFAULT NULL,
  `igv` decimal(11,4) DEFAULT NULL,
  `emition_date` datetime DEFAULT NULL,
  `expiration_date` datetime DEFAULT NULL,
  `coin_id` int(11) DEFAULT NULL,
  `operation_type` int(11) DEFAULT NULL,
  `total_exonerada` decimal(11,4) DEFAULT NULL,
  `total_gratiuita` decimal(11,4) DEFAULT NULL,
  `total_inafecta` decimal(11,4) DEFAULT NULL,
  `total_gravada` decimal(11,4) DEFAULT NULL,
  `total` decimal(11,4) DEFAULT NULL,
  `cubierto` int(11) DEFAULT '0',
  `description` text,
  `state` int(11) NOT NULL DEFAULT '1',
  `creation_date` datetime DEFAULT NULL,
  `modification_date` datetime DEFAULT NULL,
  `user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sales_note_detail`
--

CREATE TABLE `sales_note_detail` (
  `id` int(11) NOT NULL,
  `sales_note_id` int(11) DEFAULT NULL,
  `product_service_id` int(11) DEFAULT NULL,
  `quantity` float DEFAULT NULL,
  `unit_price` decimal(11,4) DEFAULT NULL,
  `igv` decimal(11,4) DEFAULT NULL,
  `subtotal` decimal(11,4) DEFAULT NULL,
  `inafecta` decimal(11,4) DEFAULT NULL,
  `exonerada` decimal(11,4) DEFAULT NULL,
  `igv_type` varchar(10) DEFAULT NULL,
  `with_igv` int(11) DEFAULT NULL,
  `description` text,
  `menu_entries` varchar(500) DEFAULT NULL,
  `creation_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sales_quotation`
--

CREATE TABLE `sales_quotation` (
  `id` int(11) NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `coin_id` int(11) DEFAULT NULL,
  `client_branches_id` int(11) DEFAULT NULL,
  `serie` varchar(45) DEFAULT NULL,
  `correlative` varchar(45) DEFAULT NULL,
  `igv` decimal(11,4) DEFAULT NULL,
  `emition_date` date DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  `operation_type` int(11) DEFAULT NULL,
  `purchase_order` varchar(15) DEFAULT NULL,
  `total_exonerada` decimal(11,4) DEFAULT NULL,
  `total_gratuita` decimal(11,4) DEFAULT NULL,
  `total_inafecta` decimal(11,4) DEFAULT NULL,
  `total_gravada` decimal(11,4) DEFAULT NULL,
  `total` decimal(11,4) DEFAULT NULL,
  `description` text,
  `state` int(11) NOT NULL DEFAULT '1' COMMENT '0=>Emitido,1=>Aceptado',
  `progress` int(11) DEFAULT NULL COMMENT '0=>Proceso,1=>Finalizado',
  `creation_date` datetime DEFAULT NULL,
  `modification_date` datetime DEFAULT NULL,
  `user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sales_quotation_detail`
--

CREATE TABLE `sales_quotation_detail` (
  `id` int(11) NOT NULL,
  `sales_quotation_id` int(11) DEFAULT NULL,
  `product_service_id` int(11) DEFAULT NULL,
  `quantity` float DEFAULT NULL,
  `unit_price` decimal(11,4) DEFAULT NULL,
  `igv` decimal(11,4) DEFAULT NULL,
  `subtotal` decimal(11,4) DEFAULT NULL,
  `inafecta` decimal(11,4) DEFAULT NULL,
  `total` decimal(11,4) DEFAULT NULL,
  `exonerada` decimal(11,4) DEFAULT NULL,
  `igv_type` varchar(15) DEFAULT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `series_doc`
--

CREATE TABLE `series_doc` (
  `id` int(11) NOT NULL,
  `doc_type_code` varchar(45) DEFAULT NULL,
  `serie` varchar(125) DEFAULT NULL,
  `correlativo` int(11) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `efac` int(11) DEFAULT '0',
  `state` int(11) DEFAULT '1',
  `user_id` int(11) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `series_doc`
--

INSERT INTO `series_doc` (`id`, `doc_type_code`, `serie`, `correlativo`, `name`, `efac`, `state`, `user_id`, `creation_date`) VALUES
(1, '1', 'F001', 125, 'Factura', 1, 1, 2, NULL),
(2, '3', 'B001', 17, 'Boleta', 1, 1, 2, NULL),
(3, '7', 'FC01', 20, 'Nota+de+cr%C3%A9dito', 1, 1, 1, NULL),
(4, '8', 'FD01', 8, 'Nota+de+D%C3%A9bito', 1, 1, 2, NULL),
(5, '9', 'T001', 10, 'Guia+de+remisi%C3%B3n', 1, 1, 2, NULL),
(6, 'I-C', 'INVOICE-CANCEL', 8, '', 0, 1, NULL, NULL),
(7, 'TS', 'TICKET-SUMMARY', 34, 'Correlativo+para+envio+de+boletas', 0, 1, NULL, NULL),
(10, '1', 'FF12', 1, 'decription', 0, 1, 2, '2018-10-05 18:58:57'),
(18, 'CREDIT-NOTE-BOLETA', 'BC01', 7, 'NOTA+DE+CREDITO+A+BOLETAS', 1, 1, 2, '2018-11-13 11:23:38'),
(19, '0', 'TK01', 67, 'Ticker+de+Venta', 1, 1, 1, '2019-03-31 01:44:14'),
(20, '1', '0001', 34353, 'Serie+para+comprobantes+f%C3%ADsicos+de+contingencia.', 1, 1, 2, '2019-04-04 21:16:01'),
(21, 'G0', 'G001', 42, 'Serie+para+gu%C3%ADa+de+ingreso', 1, 1, 1, '2019-04-12 16:39:58'),
(22, '0', 'NV001', 2, 'Nota+de+Venta', 1, 1, 1, '2019-04-20 21:01:11'),
(23, '10', 'C001', 12, 'Cotizaciones', 0, 1, 1, '2019-06-07 13:40:02'),
(24, '20', 'CM01', 4, 'SERIE+Y+CORRELATIVO+PARA+CONSTANCIA+DE+MANTENIMIENTO+', 0, 1, 1, '2019-06-19 12:40:45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `value` varchar(500) DEFAULT NULL,
  `state` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `settings`
--

INSERT INTO `settings` (`id`, `code`, `value`, `state`) VALUES
(1, 'URL', 'https://gofacturas.club/v1', 1),
(2, 'AVATAR', 'app/assets/preferences/root/avatar.png', 1),
(3, 'LOGO', 'app/assets/preferences/root/logo.png', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `people_id` int(11) NOT NULL,
  `user` varchar(500) NOT NULL,
  `password` varchar(500) NOT NULL,
  `avatar` varchar(500) DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT '0' COMMENT '0=>root,1=>admin,2=>',
  `state` int(11) NOT NULL DEFAULT '1' COMMENT '0=>inactivo,1=>activo',
  `creation_date` datetime DEFAULT NULL,
  `modification_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `worker_manager`
--

CREATE TABLE `worker_manager` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `day` date DEFAULT NULL,
  `device_info` varchar(200) DEFAULT NULL,
  `state` int(11) NOT NULL DEFAULT '1',
  `creation_date` datetime DEFAULT NULL,
  `modification_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `worker_manager_detail`
--

CREATE TABLE `worker_manager_detail` (
  `id` int(11) NOT NULL,
  `worker_manager_id` int(11) DEFAULT NULL,
  `entry_latitude` varchar(45) DEFAULT NULL,
  `entry_longitude` varchar(45) DEFAULT NULL,
  `exit_latitude` varchar(45) DEFAULT NULL,
  `exit_longitude` varchar(45) DEFAULT NULL,
  `entry_address` varchar(500) DEFAULT NULL,
  `exit_address` varchar(500) DEFAULT NULL,
  `entry_time` time DEFAULT NULL,
  `exit_time` time DEFAULT NULL,
  `type` int(11) DEFAULT NULL COMMENT '1=>Ingreso-Salida,2=>Pausas'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `canceled_invoices`
--
ALTER TABLE `canceled_invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_comprobante` (`id_comprobante`);

--
-- Indices de la tabla `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`),
  ADD KEY `people_id` (`people_id`);

--
-- Indices de la tabla `client_branches`
--
ALTER TABLE `client_branches`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `comprobante_venta`
--
ALTER TABLE `comprobante_venta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `comprobante_venta_detalle`
--
ALTER TABLE `comprobante_venta_detalle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_comprobante` (`id_comprobante`);

--
-- Indices de la tabla `constancy`
--
ALTER TABLE `constancy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `technical_id` (`technical_id`);

--
-- Indices de la tabla `constancy_detail`
--
ALTER TABLE `constancy_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `constancy_id` (`constancy_id`);

--
-- Indices de la tabla `constancy_protocol`
--
ALTER TABLE `constancy_protocol`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `dispatches`
--
ALTER TABLE `dispatches`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `dispatches_detail`
--
ALTER TABLE `dispatches_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dispatches_id` (`dispatches_id`),
  ADD KEY `product_service_id` (`product_service_id`);

--
-- Indices de la tabla `entry_guide`
--
ALTER TABLE `entry_guide`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `entry_guide_detail`
--
ALTER TABLE `entry_guide_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `expense_control`
--
ALTER TABLE `expense_control`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coin_id` (`coin_id`);

--
-- Indices de la tabla `finance_box`
--
ALTER TABLE `finance_box`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `finance_box_operations`
--
ALTER TABLE `finance_box_operations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `box_session_id` (`box_session_id`);

--
-- Indices de la tabla `finance_box_session`
--
ALTER TABLE `finance_box_session`
  ADD PRIMARY KEY (`id`),
  ADD KEY `finance_box_id` (`finance_box_id`);

--
-- Indices de la tabla `invoice_summary`
--
ALTER TABLE `invoice_summary`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `notes_details`
--
ALTER TABLE `notes_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `note_id` (`note_id`);

--
-- Indices de la tabla `people`
--
ALTER TABLE `people`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `print_settings`
--
ALTER TABLE `print_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `product_service`
--
ALTER TABLE `product_service`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `restaurant_menu_entries`
--
ALTER TABLE `restaurant_menu_entries`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `restaurant_order`
--
ALTER TABLE `restaurant_order`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `restaurant_order_products`
--
ALTER TABLE `restaurant_order_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indices de la tabla `restaurant_room`
--
ALTER TABLE `restaurant_room`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `restaurant_room_detail`
--
ALTER TABLE `restaurant_room_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_id` (`room_id`),
  ADD KEY `table_id` (`table_id`);

--
-- Indices de la tabla `restaurant_table`
--
ALTER TABLE `restaurant_table`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sales_note`
--
ALTER TABLE `sales_note`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sales_note_detail`
--
ALTER TABLE `sales_note_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sales_quotation`
--
ALTER TABLE `sales_quotation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `client_branches_id` (`client_branches_id`);

--
-- Indices de la tabla `sales_quotation_detail`
--
ALTER TABLE `sales_quotation_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sales_quotation_id` (`sales_quotation_id`);

--
-- Indices de la tabla `series_doc`
--
ALTER TABLE `series_doc`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `people_id` (`people_id`);

--
-- Indices de la tabla `worker_manager`
--
ALTER TABLE `worker_manager`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `worker_manager_detail`
--
ALTER TABLE `worker_manager_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `worker_manager_id` (`worker_manager_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `canceled_invoices`
--
ALTER TABLE `canceled_invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `client_branches`
--
ALTER TABLE `client_branches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comprobante_venta`
--
ALTER TABLE `comprobante_venta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comprobante_venta_detalle`
--
ALTER TABLE `comprobante_venta_detalle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `constancy`
--
ALTER TABLE `constancy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `constancy_detail`
--
ALTER TABLE `constancy_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `constancy_protocol`
--
ALTER TABLE `constancy_protocol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `dispatches`
--
ALTER TABLE `dispatches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `dispatches_detail`
--
ALTER TABLE `dispatches_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `entry_guide`
--
ALTER TABLE `entry_guide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `entry_guide_detail`
--
ALTER TABLE `entry_guide_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `expense_control`
--
ALTER TABLE `expense_control`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `finance_box`
--
ALTER TABLE `finance_box`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `finance_box_operations`
--
ALTER TABLE `finance_box_operations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `finance_box_session`
--
ALTER TABLE `finance_box_session`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `invoice_summary`
--
ALTER TABLE `invoice_summary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `notes`
--
ALTER TABLE `notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `notes_details`
--
ALTER TABLE `notes_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `people`
--
ALTER TABLE `people`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `print_settings`
--
ALTER TABLE `print_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `product_service`
--
ALTER TABLE `product_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `restaurant_menu_entries`
--
ALTER TABLE `restaurant_menu_entries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `restaurant_order`
--
ALTER TABLE `restaurant_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `restaurant_order_products`
--
ALTER TABLE `restaurant_order_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `restaurant_room`
--
ALTER TABLE `restaurant_room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `restaurant_room_detail`
--
ALTER TABLE `restaurant_room_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `restaurant_table`
--
ALTER TABLE `restaurant_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sales_note`
--
ALTER TABLE `sales_note`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sales_note_detail`
--
ALTER TABLE `sales_note_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sales_quotation`
--
ALTER TABLE `sales_quotation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sales_quotation_detail`
--
ALTER TABLE `sales_quotation_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `series_doc`
--
ALTER TABLE `series_doc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `worker_manager`
--
ALTER TABLE `worker_manager`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `worker_manager_detail`
--
ALTER TABLE `worker_manager_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `canceled_invoices`
--
ALTER TABLE `canceled_invoices`
  ADD CONSTRAINT `canceled_invoices_ibfk_1` FOREIGN KEY (`id_comprobante`) REFERENCES `comprobante_venta` (`id`);

--
-- Filtros para la tabla `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`people_id`) REFERENCES `people` (`id`);

--
-- Filtros para la tabla `comprobante_venta_detalle`
--
ALTER TABLE `comprobante_venta_detalle`
  ADD CONSTRAINT `comprobante_venta_detalle_ibfk_1` FOREIGN KEY (`id_comprobante`) REFERENCES `comprobante_venta` (`id`);

--
-- Filtros para la tabla `constancy`
--
ALTER TABLE `constancy`
  ADD CONSTRAINT `constancy_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  ADD CONSTRAINT `constancy_ibfk_2` FOREIGN KEY (`technical_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `constancy_detail`
--
ALTER TABLE `constancy_detail`
  ADD CONSTRAINT `constancy_detail_ibfk_1` FOREIGN KEY (`constancy_id`) REFERENCES `constancy` (`id`);

--
-- Filtros para la tabla `dispatches_detail`
--
ALTER TABLE `dispatches_detail`
  ADD CONSTRAINT `dispatches_detail_ibfk_1` FOREIGN KEY (`dispatches_id`) REFERENCES `dispatches` (`id`),
  ADD CONSTRAINT `dispatches_detail_ibfk_2` FOREIGN KEY (`product_service_id`) REFERENCES `product_service` (`id`);

--
-- Filtros para la tabla `expense_control`
--
ALTER TABLE `expense_control`
  ADD CONSTRAINT `expense_control_ibfk_1` FOREIGN KEY (`coin_id`) REFERENCES `app_db`.`coins` (`id`);

--
-- Filtros para la tabla `finance_box_operations`
--
ALTER TABLE `finance_box_operations`
  ADD CONSTRAINT `finance_box_operations_ibfk_1` FOREIGN KEY (`box_session_id`) REFERENCES `finance_box_session` (`id`);

--
-- Filtros para la tabla `finance_box_session`
--
ALTER TABLE `finance_box_session`
  ADD CONSTRAINT `finance_box_session_ibfk_1` FOREIGN KEY (`finance_box_id`) REFERENCES `finance_box` (`id`);

--
-- Filtros para la tabla `notes_details`
--
ALTER TABLE `notes_details`
  ADD CONSTRAINT `notes_details_ibfk_1` FOREIGN KEY (`note_id`) REFERENCES `notes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
