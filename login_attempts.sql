/*
MySQL Data Transfer
Source Host: localhost
Source Database: db_lkp
Target Host: localhost
Target Database: db_lkp
Date: 16/03/2020 06.39.57
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for login_attempts
-- ----------------------------
CREATE TABLE `login_attempts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
