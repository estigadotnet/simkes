/*
MySQL Data Transfer
Source Host: localhost
Source Database: db_simkes
Target Host: localhost
Target Database: db_simkes
Date: 01/04/2020 09.26.57
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for groups
-- ----------------------------
CREATE TABLE `groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

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
-- Table structure for menu
-- ----------------------------
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `link` varchar(50) NOT NULL,
  `icon` varchar(30) NOT NULL,
  `is_active` int(1) NOT NULL,
  `is_parent` int(1) NOT NULL,
  `index` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tbl_admin
-- ----------------------------
CREATE TABLE `tbl_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) DEFAULT NULL,
  `no_hp` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tbl_gedung
-- ----------------------------
CREATE TABLE `tbl_gedung` (
  `no_runangan` varchar(10) NOT NULL,
  `nama_ruangan` varchar(20) DEFAULT NULL,
  `kapasitas` enum('') DEFAULT NULL,
  `nama_gedung` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`no_runangan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tbl_kelas
-- ----------------------------
CREATE TABLE `tbl_kelas` (
  `id_kelas` int(11) NOT NULL,
  `nama_kelas` varchar(10) DEFAULT NULL,
  `id_dosen` varchar(20) DEFAULT NULL,
  `no_ruangan` varchar(20) DEFAULT NULL,
  `id_mata_kuliah` varchar(20) DEFAULT NULL,
  `hari` varchar(20) DEFAULT NULL,
  `jam` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_kelas`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tbl_krs
-- ----------------------------
CREATE TABLE `tbl_krs` (
  `id_krs` int(11) NOT NULL AUTO_INCREMENT,
  `nim` varchar(20) DEFAULT NULL,
  `id_kelas` varchar(20) DEFAULT NULL,
  `nilai_angka` int(11) DEFAULT NULL,
  `nilai_huruf` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id_krs`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tbl_matakuliah
-- ----------------------------
CREATE TABLE `tbl_matakuliah` (
  `id_mata_kuliah` varchar(11) NOT NULL,
  `nama_mata_kuliah` varchar(40) NOT NULL,
  `sks` tinyint(4) NOT NULL,
  `semester` tinyint(4) NOT NULL,
  `id_prodi` varchar(15) NOT NULL,
  PRIMARY KEY (`id_mata_kuliah`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tbl_mhs
-- ----------------------------
CREATE TABLE `tbl_mhs` (
  `nim` varchar(11) NOT NULL,
  `nama` varchar(40) NOT NULL,
  `gender` enum('L','P') NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `tempat_lahir` varchar(30) NOT NULL,
  `kd_agama` int(2) NOT NULL,
  `foto` text NOT NULL,
  `kd_kelas` varchar(5) NOT NULL,
  PRIMARY KEY (`nim`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for tbl_prodi
-- ----------------------------
CREATE TABLE `tbl_prodi` (
  `id_prodi` varchar(11) NOT NULL,
  `nama_prodi` varchar(40) NOT NULL,
  `no_telp` varchar(40) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  PRIMARY KEY (`id_prodi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for users
-- ----------------------------
CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(15) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for users_groups
-- ----------------------------
CREATE TABLE `users_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  KEY `fk_users_groups_users1_idx` (`user_id`),
  KEY `fk_users_groups_groups1_idx` (`group_id`),
  CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records
-- ----------------------------
INSERT INTO `groups` VALUES ('1', 'admin', 'Administrator');
INSERT INTO `groups` VALUES ('2', 'members', 'General User');
INSERT INTO `menu` VALUES ('15', 'menu management', 'menu', 'fa fa-list-alt', '1', '0', '3');
INSERT INTO `menu` VALUES ('20', 'Logout', 'auth/logout', 'fa fa-power-off', '1', '0', '2');
INSERT INTO `menu` VALUES ('21', 'Mahasiswa', 'mhs', 'fa fa-users', '1', '25', '1');
INSERT INTO `menu` VALUES ('22', 'KELAS', 'kelas', 'fa fa-table', '0', '0', null);
INSERT INTO `menu` VALUES ('23', 'Admin', 'auth', 'fa fa-user', '0', '0', null);
INSERT INTO `menu` VALUES ('24', 'Home', 'home', 'fa fa-home', '1', '0', null);
INSERT INTO `menu` VALUES ('25', 'Master Data', '#', 'fa fa-bars', '1', '0', null);
INSERT INTO `menu` VALUES ('26', 'Prodi', 'prodi', 'fa fa-university', '1', '25', null);
INSERT INTO `menu` VALUES ('27', 'Mata Kuliah', 'matakuliah', 'fa fa-book', '1', '25', null);
INSERT INTO `tbl_admin` VALUES ('1', 'zen', '123', 'admin@admin.com', '123');
INSERT INTO `tbl_kelas` VALUES ('1', '2-2', '1', '1', '1', 'senin', '17-18');
INSERT INTO `tbl_krs` VALUES ('1', '1', '1', '6', 'A');
INSERT INTO `tbl_krs` VALUES ('2', '2', '1', '4', 'b');
INSERT INTO `tbl_matakuliah` VALUES ('1', 'Pemrograman Berorientasi Objek', '2', '4', '29032020');
INSERT INTO `tbl_matakuliah` VALUES ('2', 'ALgoritma dan Pemrograman', '2', '1', '29032020');
INSERT INTO `tbl_matakuliah` VALUES ('3', 'Multimedia 2', '2', '4', '29032020');
INSERT INTO `tbl_matakuliah` VALUES ('4', 'Kriptografi', '3', '4', '29032020');
INSERT INTO `tbl_matakuliah` VALUES ('5', 'Pengolahan Citra', '2', '4', '29032020');
INSERT INTO `tbl_matakuliah` VALUES ('6', 'Robotika', '2', '4', '29032020');
INSERT INTO `tbl_mhs` VALUES ('10350157', 'Joko', 'L', '1991-01-01', 'Medan', '1', '', '');
INSERT INTO `tbl_prodi` VALUES ('29032020', 'Sistem Komputer', '061-1234566', 'Jalan Aksara No. 161 A');
INSERT INTO `tbl_prodi` VALUES ('29032021', 'Teknik Informatika', '061-123456', 'Jalan Ar Hakim');
INSERT INTO `tbl_prodi` VALUES ('29032022', 'Teknik Elektro', '061-123456', 'Jalan Letda Sujono');
INSERT INTO `users` VALUES ('1', '127.0.0.1', 'administrator', '$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36', '', 'admin@admin.com', '', null, null, 'gC2Ci5I.yFWiFmKxJK3m3u', '1268889823', '1585707304', '1', 'Admin', 'istrator', 'ADMIN', '0');
INSERT INTO `users` VALUES ('2', '::1', 'administrator', '$2y$08$wW9avr1yslzWBElKJliHu.ee6SQaS5SpR/ejI47ZsYySlq6.uSHBG', null, 'zen@zen.com', null, null, null, 'ubMk/WpgVnMDirqcvHS.S.', '1581861416', '1582172074', '1', 'Muhammad', 'Zen', 'Zending', '0812121212');
INSERT INTO `users_groups` VALUES ('1', '1', '1');
INSERT INTO `users_groups` VALUES ('2', '1', '2');
INSERT INTO `users_groups` VALUES ('4', '2', '1');
INSERT INTO `users_groups` VALUES ('3', '2', '2');
