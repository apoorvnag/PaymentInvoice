# ************************************************************
# Sequel Pro SQL dump
# Version 5446
#
# https://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.20)
# Database: apn
# Generation Time: 2020-01-18 07:28:15 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table company
# ------------------------------------------------------------

DROP TABLE IF EXISTS `company`;

CREATE TABLE `company` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `contact` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table invoices
# ------------------------------------------------------------

DROP TABLE IF EXISTS `invoices`;

CREATE TABLE `invoices` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `due_date` datetime DEFAULT NULL,
  `shipment_id` int(11) DEFAULT NULL,
  `tos_invoice_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table payment_logs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `payment_logs`;

CREATE TABLE `payment_logs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table payments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `payments`;

CREATE TABLE `payments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `txn_id` bigint(22) DEFAULT NULL,
  `order_id` bigint(22) DEFAULT NULL,
  `amount` bigint(22) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `mode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table products
# ------------------------------------------------------------

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `shipment_id` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `unit_price` int(11) DEFAULT NULL,
  `total_unit_price` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table shipments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shipments`;

CREATE TABLE `shipments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `ship_date` datetime DEFAULT NULL,
  `ship_via` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` text,
  `verification_key` text,
  `handle` varchar(255) DEFAULT NULL,
  `contact` bigint(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table wallet
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wallet`;

CREATE TABLE `wallet` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `amount` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `razorpay_responses`;

CREATE TABLE `razorpay_responses` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `razorpay_id` text,
  `entity` varchar(255) DEFAULT NULL,
  `amount` bigint(20) DEFAULT NULL,
  `amount_paid` bigint(11) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `receipt` varchar(255) DEFAULT NULL,
  `offer_id` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `attempts` int(11) DEFAULT NULL,
  `notes` text,
  `created_at` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;



# Insertion of table Company
# ------------------------------------------------------------

insert into company values (1001,'Saudi Aramco','Dhahran Saudi Arabia',80011611);
insert into company values (1002,'Microsoft','Washington USA',71237123)
insert into company values (1003,'Apple','California USA',703257032);
insert into company values (1004,'Amazon','Washington USA',67456745);
insert into company values (1005,'Alphabet','California USA',521452145);

# Insertion of table invoices
# ------------------------------------------------------------

insert into invoices values (1,101,'pending','2020-02-11',10001,9999);
insert into invoices values (2,102,'pending','2020-02-12',10002,9998);
insert into invoices values (3,103,'pending','2020-02-13',10003,9997);
insert into invoices values (4,104,'pending','2020-02-14',10004,9996);
insert into invoices values (5,105,'pending','2020-02-15',10005,9995);

# Insertion of table products
# ------------------------------------------------------------

insert into products values (4001,1,1,201,'1963 Ferrari 250 GTO',1,10,10);
insert into products values (4002,1,1,202,'The Bugatti La Voiture Noire',2,15,30);
insert into products values (4003,1,1,203,'Passion Diamond Shoes',5,5,25);
insert into products values (4003,1,1,204,'Artwork Of A Dead Shark',1,100,100);
insert into products values (4003,1,1,205,'The History Supreme Yacht',1,34,34);
