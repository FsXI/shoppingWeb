/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : spring_shop

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 04/12/2019 19:16:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ausertable
-- ----------------------------
DROP TABLE IF EXISTS `ausertable`;
CREATE TABLE `ausertable` (
  `aname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `apwd` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`aname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for busertable
-- ----------------------------
DROP TABLE IF EXISTS `busertable`;
CREATE TABLE `busertable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bemail` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `bpwd` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for carttable
-- ----------------------------
DROP TABLE IF EXISTS `carttable`;
CREATE TABLE `carttable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `busertable_id` int(11) NOT NULL,
  `goodstable_id` int(11) NOT NULL,
  `shoppingnum` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bid` (`busertable_id`),
  KEY `gno` (`goodstable_id`),
  CONSTRAINT `bid` FOREIGN KEY (`busertable_id`) REFERENCES `busertable` (`id`),
  CONSTRAINT `gno` FOREIGN KEY (`goodstable_id`) REFERENCES `goodstable` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for focustable
-- ----------------------------
DROP TABLE IF EXISTS `focustable`;
CREATE TABLE `focustable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodstable_id` int(11) NOT NULL,
  `busertable_id` int(11) NOT NULL,
  `focustime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gno1` (`goodstable_id`),
  KEY `bid1` (`busertable_id`),
  CONSTRAINT `bid1` FOREIGN KEY (`busertable_id`) REFERENCES `busertable` (`id`),
  CONSTRAINT `gno1` FOREIGN KEY (`goodstable_id`) REFERENCES `goodstable` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for goodstable
-- ----------------------------
DROP TABLE IF EXISTS `goodstable`;
CREATE TABLE `goodstable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `goprice` double DEFAULT NULL,
  `grprice` double DEFAULT NULL,
  `gstore` int(11) DEFAULT NULL,
  `gpicture` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `goodstype_id` int(11) DEFAULT NULL,
  `gin` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `typeid` (`goodstype_id`),
  CONSTRAINT `typeid` FOREIGN KEY (`goodstype_id`) REFERENCES `goodstype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for goodstype
-- ----------------------------
DROP TABLE IF EXISTS `goodstype`;
CREATE TABLE `goodstype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typename` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for noticetable
-- ----------------------------
DROP TABLE IF EXISTS `noticetable`;
CREATE TABLE `noticetable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ntitle` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ncontent` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ntime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for orderbasetable
-- ----------------------------
DROP TABLE IF EXISTS `orderbasetable`;
CREATE TABLE `orderbasetable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `busertable_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `status` tinyint(4) NOT NULL,
  `orderdate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bid2` (`busertable_id`),
  CONSTRAINT `bid2` FOREIGN KEY (`busertable_id`) REFERENCES `busertable` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for orderdetail
-- ----------------------------
DROP TABLE IF EXISTS `orderdetail`;
CREATE TABLE `orderdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderbasetable_id` int(11) NOT NULL,
  `goodstable_id` int(11) NOT NULL,
  `shoppingnum` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `odsn` (`orderbasetable_id`),
  KEY `gno3` (`goodstable_id`),
  CONSTRAINT `gno3` FOREIGN KEY (`goodstable_id`) REFERENCES `goodstable` (`id`),
  CONSTRAINT `odsn` FOREIGN KEY (`orderbasetable_id`) REFERENCES `orderbasetable` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

SET FOREIGN_KEY_CHECKS = 1;
