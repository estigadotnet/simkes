/*
MySQL Data Transfer
Source Host: localhost
Source Database: db_lkp
Target Host: localhost
Target Database: db_lkp
Date: 16/03/2020 16.48.22
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for menu
-- ----------------------------
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `link` varchar(50) NOT NULL,
  `icon` varchar(30) NOT NULL,
  `is_active` int(1) NOT NULL,
  `is_parent` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `menu` VALUES ('15', 'menu management', 'menu', 'fa fa-list-alt', '1', '0');
INSERT INTO `menu` VALUES ('20', 'Logout', 'auth/logout', 'fa fa-sign-out', '1', '0');
INSERT INTO `menu` VALUES ('21', 'Siswa', 'siswa', 'fa fa-users', '1', '0');
INSERT INTO `menu` VALUES ('22', 'KELAS', 'kelas', 'fa fa-table', '1', '0');
INSERT INTO `menu` VALUES ('23', 'Admin', 'auth', 'fa fa-user', '1', '0');
