/*
MySQL Data Transfer
Source Host: localhost
Source Database: pis_akademik
Target Host: localhost
Target Database: pis_akademik
Date: 20/03/2020 10.08.04
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for tbl_siswa
-- ----------------------------
CREATE TABLE `tbl_siswa` (
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
-- Records 
-- ----------------------------
INSERT INTO `tbl_siswa` VALUES ('18SI1000', 'Muhammad Athallah Zuhry', 'L', '1996-12-19', 'Banda Aceh', '1', 'user-siluet.jpg', '7-A1');
INSERT INTO `tbl_siswa` VALUES ('18SI1001', 'Rian Armansyah Maulana', 'L', '1996-01-02', 'Taliwang', '1', 'user-siluet1.jpg', '7-A1');
INSERT INTO `tbl_siswa` VALUES ('18SI1002', 'Rezha Septyan Ramandha', 'L', '1997-01-24', 'Lampung', '1', 'user-siluet2.jpg', '7-A1');
INSERT INTO `tbl_siswa` VALUES ('18SI1003', 'Ovillia Dyah Charisma', 'P', '1996-01-18', 'Semarang', '1', 'user-siluet3.jpg', '7-A1');
INSERT INTO `tbl_siswa` VALUES ('18TI2000', 'Hadi Luthfi Firdaus', 'L', '1996-01-30', 'Pekanbaru', '1', 'user-siluet4.jpg', '7-A1');
INSERT INTO `tbl_siswa` VALUES ('18TI2001', 'Muhammad Fajar', 'L', '1995-01-14', 'Yogyakarta', '1', 'user-siluet5.jpg', '7-A1');
INSERT INTO `tbl_siswa` VALUES ('18TI2002', 'Bagus Widiatmono', 'L', '1996-01-09', 'Purworejo', '1', 'user-siluet6.jpg', '7-A1');
INSERT INTO `tbl_siswa` VALUES ('18TI2003', 'Aris Harwanto', 'L', '1996-01-13', 'Klaten', '1', 'user-siluet7.jpg', '7-A1');
