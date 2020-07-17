-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 17, 2020 at 07:23 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_simkes`
--

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'members', 'General User');

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `link` varchar(50) NOT NULL,
  `icon` varchar(30) NOT NULL,
  `is_active` int(1) NOT NULL,
  `is_parent` int(1) NOT NULL,
  `index` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `name`, `link`, `icon`, `is_active`, `is_parent`, `index`) VALUES
(15, 'Menu', 'menu', 'fa fa-list-alt', 1, 31, 91),
(20, 'Logout', 'auth/logout', 'fa fa-power-off', 1, 0, 99),
(21, 'Mahasiswa', 'mhs', 'fa fa-users', 0, 25, 28),
(22, 'Kelas', 'kelas', 'fas fa-door-open', 1, 25, 23),
(23, 'Admin', 'auth', 'fa fa-user', 0, 0, NULL),
(24, 'Home', 'home', 'fa fa-home', 1, 0, 10),
(25, 'Setup', '#', 'fa fa-bars', 1, 0, 20),
(26, 'Prodi', 'prodi', 'fa fa-university', 0, 25, 26),
(27, 'Mata Kuliah', 'matakuliah', 'fa fa-book', 0, 25, 27),
(28, 'Tahun Ajaran', 'tahunajaran', 'far fa-calendar-alt', 1, 25, 21),
(29, 'Guru', 'guru', 'fa fa-chalkboard-teacher', 1, 25, 22),
(30, 'Siswa', 'siswa', 'fa fa-users', 1, 25, 24),
(31, 'Utility', '#', 'fas fa-wrench', 1, 0, 90),
(32, 'Transaksi', '#', 'fa fa-calendar', 1, 0, 30),
(33, 'Pembayaran SPP', 'spp', 'fa fa-school', 1, 32, 31),
(34, 'Belanja Harian', 'belanja', 'fa fa-users', 1, 32, 32);

-- --------------------------------------------------------

--
-- Table structure for table `t001_tahunajaran`
--

CREATE TABLE `t001_tahunajaran` (
  `idtahunajaran` int(5) NOT NULL,
  `tahunajaran` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t001_tahunajaran`
--

INSERT INTO `t001_tahunajaran` (`idtahunajaran`, `tahunajaran`) VALUES
(1, '2019/2020'),
(2, '2020/2021');

-- --------------------------------------------------------

--
-- Table structure for table `t002_guru`
--

CREATE TABLE `t002_guru` (
  `idguru` int(5) NOT NULL,
  `namaguru` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t002_guru`
--

INSERT INTO `t002_guru` (`idguru`, `namaguru`) VALUES
(1, 'Sutiyoso'),
(2, 'Djarot Saiful Hidayat'),
(3, 'Fauzi Bowo'),
(5, 'Soerjadi Soedirdja'),
(6, 'Wiyogo Atmodarminto'),
(7, 'Soeprapto'),
(8, 'Nono Taryono'),
(10, '999eng');

-- --------------------------------------------------------

--
-- Table structure for table `t003_kelas`
--

CREATE TABLE `t003_kelas` (
  `idkelas` int(11) NOT NULL,
  `kelas` varchar(25) NOT NULL,
  `idguru` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t003_kelas`
--

INSERT INTO `t003_kelas` (`idkelas`, `kelas`, `idguru`) VALUES
(1, '1  KH. BISRI SYANSURI', 1),
(2, '1  KH. WACHID HASYIM', 1),
(3, '2  KH. ILYAS RUCHIYAT', 2),
(4, '2  KH. R. ASNAWI', 2),
(5, '3  KH. IDHAM CHOLID', 3),
(6, '3  KH. ZAENAL ARIFIN', 3),
(7, '4  KH. Zaenul Musthofa', 5),
(8, '4  KH.Hasyim Asyari', 5);

-- --------------------------------------------------------

--
-- Table structure for table `t004_siswa`
--

CREATE TABLE `t004_siswa` (
  `idsiswa` int(10) NOT NULL,
  `nis` varchar(10) NOT NULL,
  `namasiswa` varchar(40) NOT NULL,
  `idkelas` int(11) NOT NULL,
  `tahunajaran` varchar(10) NOT NULL,
  `byrspp` int(20) NOT NULL,
  `byrcatering` int(20) NOT NULL,
  `byrworksheet` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t004_siswa`
--

INSERT INTO `t004_siswa` (`idsiswa`, `nis`, `namasiswa`, `idkelas`, `tahunajaran`, `byrspp`, `byrcatering`, `byrworksheet`) VALUES
(1, '01190001', 'Ahmad Ziyad Alfahri', 1, '2019/2020', 170000, 145000, 45000),
(2, '01190002', 'Ainun Maulidia Azzahra', 1, '2019/2020', 170000, 145000, 45000),
(3, '01190003', 'Aira Aisyah Benny ', 1, '2019/2020', 170000, 145000, 45000),
(4, '01190004', 'Alif Firman Saputra', 1, '2019/2020', 170000, 145000, 45000),
(5, '01190005', 'Althaf  Haedar Al Hisyam H', 1, '2019/2020', 170000, 145000, 45000),
(6, '01190006', 'Arjuna Novandra Januar', 1, '2019/2020', 170000, 145000, 45000),
(7, '01190007', 'Arzhivan Fareyza Batara', 1, '2019/2020', 170000, 145000, 45000),
(8, '01190008', 'Asyraf Naufal Mahardika Al - Aziz', 1, '2019/2020', 170000, 145000, 45000),
(9, '01190009', 'Azka Raditya Alfiandra', 1, '2019/2020', 170000, 145000, 45000),
(10, '01190010', 'Berlian Amy Shinta Q.W.', 1, '2019/2020', 170000, 145000, 45000),
(11, '01190011', 'Fachri Ahmad Husaini', 1, '2019/2020', 170000, 145000, 45000),
(12, '01190012', 'Fathan Zakwan A', 1, '2019/2020', 170000, 145000, 45000),
(13, '01190013', 'Fathurizky', 1, '2019/2020', 170000, 145000, 45000),
(14, '01190014', 'Faza Nazifa Rachman', 1, '2019/2020', 170000, 145000, 45000),
(15, '01190015', 'Filzah Zalfa Azzahra', 1, '2019/2020', 170000, 145000, 45000),
(16, '01190016', 'Herdhianti Ainun Rakhima', 1, '2019/2020', 170000, 145000, 45000),
(17, '01190017', 'Iftinah Haura Dzakiyah', 1, '2019/2020', 170000, 145000, 45000),
(18, '01190018', 'Lailia Izzatul Muna', 1, '2019/2020', 170000, 145000, 45000),
(19, '01190019', 'M. Azzam Adabi', 1, '2019/2020', 170000, 145000, 45000),
(20, '01190020', 'Muhammad Banu  M. N', 1, '2019/2020', 170000, 145000, 45000),
(21, '01190021', 'Naufal Yusfi Al Aufa', 1, '2019/2020', 170000, 145000, 45000),
(22, '01190022', 'Prawira Yudhawidiono', 1, '2019/2020', 170000, 145000, 45000),
(23, '01190023', 'Salman Al-Farisi', 1, '2019/2020', 170000, 145000, 45000),
(24, '01190024', 'Tania Maulida Hapsari', 1, '2019/2020', 170000, 145000, 45000),
(25, '01190025', 'Abdurrahman Faris Nur F', 2, '2019/2020', 170000, 145000, 45000),
(26, '01190026', 'Afika Cahya Reybina', 2, '2019/2020', 170000, 145000, 45000),
(27, '01190027', 'Ahmad Atmam Asyakiri', 2, '2019/2020', 170000, 145000, 45000),
(28, '01190028', 'Ahza Kotaro Naraya', 2, '2019/2020', 170000, 145000, 45000),
(29, '01190029', 'Akihiko Ahmad A.', 2, '2019/2020', 170000, 145000, 45000),
(30, '01190030', 'Arzhavin Fareyza Batara', 2, '2019/2020', 170000, 145000, 45000),
(31, '01190031', 'Attiyatul Azizah', 2, '2019/2020', 170000, 145000, 45000),
(32, '01190032', 'Averous Fakhrie Z. A.', 2, '2019/2020', 170000, 145000, 45000),
(33, '01190033', 'Azyan Hisyam Naufal A', 2, '2019/2020', 170000, 145000, 45000),
(34, '01190034', 'Azzalea Batrisya Queensy', 2, '2019/2020', 170000, 145000, 45000),
(35, '01190035', 'Cetrine Clowwi Saryoto', 2, '2019/2020', 170000, 145000, 45000),
(36, '01190036', 'Danisya Fahma Al Husna', 2, '2019/2020', 170000, 145000, 45000),
(37, '01190037', 'Firdaus Ahmad F.', 2, '2019/2020', 170000, 145000, 45000),
(38, '01190038', 'Hadfina Ayu Althafunisa', 2, '2019/2020', 170000, 145000, 45000),
(39, '01190039', 'Herdhianti Ainun Rahma', 2, '2019/2020', 170000, 145000, 45000),
(40, '01190040', 'Jauharul Hikam Alwari F', 2, '2019/2020', 170000, 145000, 45000),
(41, '01190041', 'M. Morgan Budiono', 2, '2019/2020', 170000, 145000, 45000),
(42, '01190042', 'Moch Nabil Syahroni', 2, '2019/2020', 170000, 145000, 45000),
(43, '01190043', 'Mouzazora Syamara S', 2, '2019/2020', 170000, 145000, 45000),
(44, '01190044', 'Mufidathul Ainun Syifa', 2, '2019/2020', 170000, 145000, 45000),
(45, '01190045', 'Muhammad Asyrofun N', 2, '2019/2020', 170000, 145000, 45000),
(46, '01190046', 'Renanta Lona Laila K', 2, '2019/2020', 170000, 145000, 45000),
(47, '01190047', 'Roziq Jamaludin', 2, '2019/2020', 170000, 145000, 45000),
(48, '01190048', 'Sindu Prawoko', 2, '2019/2020', 170000, 145000, 45000),
(49, '01192952', 'Ahda Gusti Nuril Muhammad', 3, '2019/2020', 170000, 145000, 25000),
(50, '01192953', 'Al - Rasya Ilham Putra', 3, '2019/2020', 170000, 145000, 25000),
(51, '01192954', 'Anindito Radja Prasetio', 3, '2019/2020', 170000, 145000, 25000),
(52, '01192955', 'Annada Muhaddiatul Qolby', 3, '2019/2020', 170000, 145000, 25000),
(53, '01192956', 'Arya Mahendra Samudra Pratama', 3, '2019/2020', 170000, 145000, 25000),
(54, '01192957', 'Athira Nadhiva', 3, '2019/2020', 170000, 145000, 25000),
(55, '01192958', 'Attala Nur Raiesha Firdha', 3, '2019/2020', 170000, 145000, 25000),
(56, '01192959', 'Chaira Zalfa Adlha Putri Septiawan', 3, '2019/2020', 170000, 145000, 25000),
(57, '01192960', 'Garnetta Afifah Alfina', 3, '2019/2020', 170000, 145000, 25000),
(58, '01192961', 'Ianabigh', 3, '2019/2020', 170000, 145000, 25000),
(59, '01192962', 'Kayla Hafizatun Nisa\'', 3, '2019/2020', 170000, 145000, 25000),
(60, '01192963', 'Malva Novreliza Rizwa Cytotecia', 3, '2019/2020', 170000, 145000, 25000),
(61, '01192964', 'Mohammad Fahmi Rosyid', 3, '2019/2020', 170000, 145000, 25000),
(62, '01192965', 'M. Haikal Luthfi Al - Abqori', 3, '2019/2020', 170000, 145000, 25000),
(63, '01192966', 'M. Nasik Ulwan', 3, '2019/2020', 170000, 145000, 25000),
(64, '01192967', 'M. Nurul Abiyan', 3, '2019/2020', 170000, 145000, 25000),
(65, '01192968', 'Nabila Rizky Syakina', 3, '2019/2020', 170000, 145000, 25000),
(66, '01192969', 'Qory Nerando Hutama', 3, '2019/2020', 170000, 145000, 25000),
(67, '01192970', 'Rafiida Hasna Cinta Alnarissa', 3, '2019/2020', 170000, 145000, 25000),
(68, '01192971', 'Suryo Bahy Nugroho', 3, '2019/2020', 170000, 145000, 25000),
(69, '01192972', 'Syahnaya Latifatuz Zayyan', 3, '2019/2020', 170000, 145000, 25000),
(70, '01192973', 'Theona Cyma Maritza', 3, '2019/2020', 170000, 145000, 25000),
(71, '01192974', 'Zahira Asy - Syifa', 3, '2019/2020', 170000, 145000, 25000),
(72, '01192975', 'Zifara Puan Prastika', 3, '2019/2020', 170000, 145000, 25000),
(73, '01192976', 'Abizar Syathir Rifiansyah', 4, '2019/2020', 170000, 145000, 25000),
(74, '01192977', 'Aisyah Alya Maritza Zain', 4, '2019/2020', 170000, 145000, 25000),
(75, '01192978', 'Akilla Apta Fineza', 4, '2019/2020', 170000, 145000, 25000),
(76, '01192979', 'Alisha Queena Arifin', 4, '2019/2020', 170000, 145000, 25000),
(77, '01192980', 'Arva Akilla Nuraini', 4, '2019/2020', 170000, 145000, 25000),
(78, '01192981', 'Berlian Syauqila Quinara Puteri', 4, '2019/2020', 170000, 145000, 25000),
(79, '01192982', 'Daffi Alnizarda Akbar', 4, '2019/2020', 170000, 145000, 25000),
(80, '01192983', 'Devandryan Syathir Fahriza', 4, '2019/2020', 170000, 145000, 25000),
(81, '01192984', 'Dinda Alifa Ramadhania', 4, '2019/2020', 170000, 145000, 25000),
(82, '01192985', 'Dzaky Hakim Arvana', 4, '2019/2020', 170000, 145000, 25000),
(83, '01192986', 'Fadhil Rahman', 4, '2019/2020', 170000, 145000, 25000),
(84, '01192987', 'Hazda Huda Ahmad Sholeh', 4, '2019/2020', 170000, 145000, 25000),
(85, '01192988', 'Jovan Adrah Belva Anggra', 4, '2019/2020', 170000, 145000, 25000),
(86, '01192989', 'Nabila Althounisa', 4, '2019/2020', 170000, 145000, 25000),
(87, '01192990', 'Naila Zafira', 4, '2019/2020', 170000, 145000, 25000),
(88, '01192991', 'Nando Baslovan', 4, '2019/2020', 170000, 145000, 25000),
(89, '01192992', 'Nouvan Dzaki Taufiqurrohman', 4, '2019/2020', 170000, 145000, 25000),
(90, '01192993', 'Muhammad Dastan Leon Hart', 4, '2019/2020', 170000, 145000, 25000),
(91, '01192994', 'M. Naufal Firdaus Fadli', 4, '2019/2020', 170000, 145000, 25000),
(92, '01192995', 'Qiyla Armilda Megan', 4, '2019/2020', 170000, 145000, 25000),
(93, '01192996', 'Raghib Attabik Ni\'amuk', 4, '2019/2020', 170000, 145000, 25000),
(94, '01192997', 'Rumasiha Naura Azahra', 4, '2019/2020', 170000, 145000, 25000),
(95, '01192998', 'Shema Hasna Al-Hawarismi', 4, '2019/2020', 170000, 145000, 25000),
(96, '01192999', 'Viola Phalosa Choir', 4, '2019/2020', 170000, 145000, 25000),
(97, '01192833', 'Adam Hakiim Saputra', 6, '2019/2020', 172000, 165000, 25000),
(98, '01192858', 'Abdhur Rhahmad Yusuf Berlian', 6, '2019/2020', 172000, 165000, 25000),
(99, '01192857', 'Abdillah Faqih', 6, '2019/2020', 172000, 165000, 25000),
(100, '01192834', 'Afifatus Syi\'bi', 6, '2019/2020', 172000, 165000, 25000),
(101, '01192835', 'Aini Millatuz Zuhriyah', 6, '2019/2020', 172000, 165000, 25000),
(102, '01192836', 'Alifa Muthia Rahma', 6, '2019/2020', 172000, 165000, 25000),
(103, '01192837', 'Aulia Zahra', 6, '2019/2020', 172000, 165000, 25000),
(104, '01192839', 'Chaira Nadzifa Althaf Ridwan', 6, '2019/2020', 172000, 165000, 25000),
(105, '01192840', 'Dzaky Ustman Pratama', 6, '2019/2020', 172000, 165000, 25000),
(106, '01192841', 'Elysia Azeeza Celine Adefa', 6, '2019/2020', 172000, 165000, 25000),
(107, '01192842', 'Faizal Akbar Ibna Lisfa', 6, '2019/2020', 172000, 165000, 25000),
(108, '01192843', 'Fatima Puspanagara', 6, '2019/2020', 172000, 165000, 25000),
(109, '01192844', 'Kenzie Faeyza Hartanto', 6, '2019/2020', 172000, 165000, 25000),
(110, '01192846', 'Muhammad Al Fatih', 6, '2019/2020', 172000, 165000, 25000),
(111, '01192847', 'Muhammad Fahri Febian', 6, '2019/2020', 172000, 165000, 25000),
(112, '01192848', 'Muhammad Farid Al Hafi', 6, '2019/2020', 172000, 165000, 25000),
(113, '01192871', 'Muhammad Humam Tsaqiful Ali', 6, '2019/2020', 172000, 165000, 25000),
(114, '01192850', 'Naisya Aura Hunafa', 6, '2019/2020', 172000, 165000, 25000),
(115, '01192851', 'Richa Zahra Faradis', 6, '2019/2020', 172000, 165000, 25000),
(116, '01192852', 'Shalahhudin Mustofa', 6, '2019/2020', 172000, 165000, 25000),
(117, '01192853', 'Teduh Galih Akbar', 6, '2019/2020', 172000, 165000, 25000),
(118, '01192855', 'Zalfa Almira Salsabilla Putri', 6, '2019/2020', 172000, 165000, 25000),
(119, '01192856', 'Zharifah Nur Syarif', 6, '2019/2020', 172000, 165000, 25000),
(120, '01192859', 'Afiqah Aura Sya\'bana', 5, '2019/2020', 172000, 165000, 25000),
(121, '01192860', 'Almira Hasna Humayroh Cahyono', 5, '2019/2020', 172000, 165000, 25000),
(122, '01192861', 'Alvina Essa Aprila Kamelia', 5, '2019/2020', 172000, 165000, 25000),
(123, '01192862', 'Andini Khansa Nabila Saputri', 5, '2019/2020', 172000, 165000, 25000),
(124, '01192863', 'Ardhani Putri Bening Hati', 5, '2019/2020', 172000, 165000, 25000),
(125, '01192864', 'Asyif\'fathir Reditya Baskara', 5, '2019/2020', 172000, 165000, 25000),
(126, '01192865', 'Batrisya Ahza Mamuro', 5, '2019/2020', 172000, 165000, 25000),
(127, '01192838', 'Bintang Eka Putra', 5, '2019/2020', 172000, 165000, 25000),
(128, '01192866', 'Claudia Apriliani', 5, '2019/2020', 172000, 165000, 25000),
(129, '01192867', 'Daniel Rasya Putra Wardhana', 5, '2019/2020', 172000, 165000, 25000),
(130, '01192869', 'Hafizh Nauval Zulfikar Azzam', 5, '2019/2020', 172000, 165000, 25000),
(131, '01192870', 'Keysha Anindhita Rubiyanto', 5, '2019/2020', 172000, 165000, 25000),
(132, '01192845', 'Labib Ahmad Ashvan Nujaba', 5, '2019/2020', 172000, 165000, 25000),
(133, '01192872', 'Muhammad Naafi\' Ridwan', 5, '2019/2020', 172000, 165000, 25000),
(134, '01192873', 'Muhammad Wildan Ardas', 5, '2019/2020', 172000, 165000, 25000),
(135, '01192849', 'Mochammad Wisnu Irawan', 5, '2019/2020', 172000, 165000, 25000),
(136, '01192874', 'Moch. Zakariya  Al-Ghifari', 5, '2019/2020', 172000, 165000, 25000),
(137, '01192875', 'Nabila Zahra Ramadhani', 5, '2019/2020', 172000, 165000, 25000),
(138, '01192876', 'Nur Aisyah Naraya Angraeni', 5, '2019/2020', 172000, 165000, 25000),
(139, '01192877', 'Raffa Achmad Herdana', 5, '2019/2020', 172000, 165000, 25000),
(140, '01192868', 'Raisa Adly Irawan', 5, '2019/2020', 172000, 165000, 25000),
(141, '01192880', 'Ravego Braja Pungga Wibawa', 5, '2019/2020', 172000, 165000, 25000),
(142, '01192878', 'Rajendra Riu Audrey Pratama', 5, '2019/2020', 172000, 165000, 25000),
(143, '01192879', 'Syauqy Nura Rabbana', 5, '2019/2020', 172000, 165000, 25000),
(144, '01192729', 'Ali Nur Fauzi', 8, '2019/2020', 172000, 165000, 25000),
(145, '01192731', 'Aufi Kayla Tsabitha', 8, '2019/2020', 172000, 165000, 25000),
(146, '01192732', 'Bagas Arya Nur Saputra', 8, '2019/2020', 172000, 165000, 25000),
(147, '01192733', 'Egi Ubaidillah Dhani Ahmad', 8, '2019/2020', 172000, 165000, 25000),
(148, '01192734', 'Fyreen Syarifah Nur Aini', 8, '2019/2020', 172000, 165000, 25000),
(149, '01192735', 'Filza Amaluna Maya Rosyida', 8, '2019/2020', 172000, 165000, 25000),
(150, '01192736', 'Hanif Aqilla Tsabita Ariqoh', 8, '2019/2020', 172000, 165000, 25000),
(151, '01192737', 'Jelita Mafaza', 8, '2019/2020', 172000, 165000, 25000),
(152, '01192738', 'Khaizuran Nawwara Albafa', 8, '2019/2020', 172000, 165000, 25000),
(153, '01192739', 'Moch Afnan Prasetya', 8, '2019/2020', 172000, 165000, 25000),
(154, '01192740', 'Muhammad Andra Al-Ghifari', 8, '2019/2020', 172000, 165000, 25000),
(155, '01192741', 'Muhammad Ravell Ardhiansyah', 8, '2019/2020', 172000, 165000, 25000),
(156, '01192742', 'Much. Irfan Bustanul Abidin', 8, '2019/2020', 172000, 165000, 25000),
(157, '01192743', 'M. Fikri  Ghifani', 8, '2019/2020', 172000, 165000, 25000),
(158, '01192744', 'Muhamad Syafrazaq Samhadi', 8, '2019/2020', 172000, 165000, 25000),
(159, '01192745', 'Najma Effati Octodhery', 8, '2019/2020', 172000, 165000, 25000),
(160, '01192746', 'Novita Fitri Ambarsari', 8, '2019/2020', 172000, 165000, 25000),
(161, '01192747', 'Raira Nidia Risti Dewi', 8, '2019/2020', 172000, 165000, 25000),
(162, '01192748', 'Raga Fadlillah', 8, '2019/2020', 172000, 165000, 25000),
(163, '01192749', 'Syafa Fatania Azzahra', 8, '2019/2020', 172000, 165000, 25000),
(164, '01192750', 'Qudzia Nayla Altafunisa', 8, '2019/2020', 172000, 165000, 25000),
(165, '01192751', 'Yudistira Rizky Firmansyah', 8, '2019/2020', 172000, 165000, 25000),
(166, '01192752', 'Zakiyal Hafidz El Masyhuri', 8, '2019/2020', 172000, 165000, 25000),
(167, '01192777', 'Muhamamad Ashar Firas', 8, '2019/2020', 172000, 165000, 25000),
(168, '01192753', 'Achmad Nabil Muzakki', 7, '2019/2020', 172000, 165000, 25000),
(169, '01192754', 'Aji Bagus Wibowo', 7, '2019/2020', 172000, 165000, 25000),
(170, '01192755', 'Asfa Kamila Ridwan', 7, '2019/2020', 172000, 165000, 25000),
(171, '01192756', 'Ananda Faizal Muzakki', 7, '2019/2020', 172000, 165000, 25000),
(172, '01192757', 'Aviza Nathania Carisa Susila', 7, '2019/2020', 172000, 165000, 25000),
(173, '01192730', 'Alief Surya Syaputra', 7, '2019/2020', 172000, 165000, 25000),
(174, '01192760', 'El- Bairuni Ahmad Herjuno', 7, '2019/2020', 172000, 165000, 25000),
(175, '01192761', 'Fairuzzaidaan Aziven Isnain S.', 7, '2019/2020', 172000, 165000, 25000),
(176, '01192762', 'Jauzaa Tabriz Rajwa Syarif', 7, '2019/2020', 172000, 165000, 25000),
(177, '01192763', 'Mirza Lutfi Arfa Fahlam', 7, '2019/2020', 172000, 165000, 25000),
(178, '01192764', 'Muhammad Radiyan Rafka P.Y.', 7, '2019/2020', 172000, 165000, 25000),
(179, '01192765', 'M. Alif Assidiqi', 7, '2019/2020', 172000, 165000, 25000),
(180, '01192766', 'M. Azzam Arinal Haq', 7, '2019/2020', 172000, 165000, 25000),
(181, '01192767', 'Muhammad Aufal Majid', 7, '2019/2020', 172000, 165000, 25000),
(182, '01192768', 'Nizar Bariq Hany Syahputra', 7, '2019/2020', 172000, 165000, 25000),
(183, '01192769', 'Orlen Akbar Satya Al-Azmi', 7, '2019/2020', 172000, 165000, 25000),
(184, '01192770', 'Saheva Roziqin Attala', 7, '2019/2020', 172000, 165000, 25000),
(185, '01192771', 'Rizqa Umi Maulida', 7, '2019/2020', 172000, 165000, 25000),
(186, '01192773', 'Revalina Agustin', 7, '2019/2020', 172000, 165000, 25000),
(187, '01192774', 'Quinsha Aulia Ramadhani', 7, '2019/2020', 172000, 165000, 25000),
(188, '01192775', 'Viola Maritza Dewi Laksono', 7, '2019/2020', 172000, 165000, 25000),
(189, '01193001', 'BRIAN ALVIN P', 7, '2019/2020', 172000, 165000, 25000),
(190, '01192776', 'Ziyadatul  Faiza', 7, '2019/2020', 172000, 165000, 25000),
(191, '01190001', 'Ahmad Ziyad Alfahri', 3, '2020/2021', 170000, 145000, 45000),
(192, '01190002', 'Ainun Maulidia Azzahra', 3, '2020/2021', 170000, 145000, 45000),
(193, '01190003', 'Aira Aisyah Benny ', 3, '2020/2021', 170000, 145000, 45000),
(194, '01190004', 'Alif Firman Saputra', 3, '2020/2021', 170000, 145000, 45000),
(195, '01190005', 'Althaf  Haedar Al Hisyam H', 3, '2020/2021', 170000, 145000, 45000),
(196, '01190006', 'Arjuna Novandra Januar', 3, '2020/2021', 170000, 145000, 45000),
(197, '01190007', 'Arzhivan Fareyza Batara', 3, '2020/2021', 170000, 145000, 45000),
(198, '01190008', 'Asyraf Naufal Mahardika Al - Aziz', 3, '2020/2021', 170000, 145000, 45000),
(199, '01190009', 'Azka Raditya Alfiandra', 3, '2020/2021', 170000, 145000, 45000),
(200, '01190010', 'Berlian Amy Shinta Q.W.', 3, '2020/2021', 170000, 145000, 45000),
(201, '01190011', 'Fachri Ahmad Husaini', 3, '2020/2021', 170000, 145000, 45000),
(202, '01190012', 'Fathan Zakwan A', 3, '2020/2021', 170000, 145000, 45000),
(203, '01190013', 'Fathurizky', 3, '2020/2021', 170000, 145000, 45000),
(204, '01190014', 'Faza Nazifa Rachman', 3, '2020/2021', 170000, 145000, 45000),
(205, '01190015', 'Filzah Zalfa Azzahra', 3, '2020/2021', 170000, 145000, 45000),
(206, '01190016', 'Herdhianti Ainun Rakhima', 3, '2020/2021', 170000, 145000, 45000),
(207, '01190017', 'Iftinah Haura Dzakiyah', 3, '2020/2021', 170000, 145000, 45000),
(208, '01190018', 'Lailia Izzatul Muna', 3, '2020/2021', 170000, 145000, 45000),
(209, '01190019', 'M. Azzam Adabi', 3, '2020/2021', 170000, 145000, 45000),
(210, '01190020', 'Muhammad Banu  M. N', 3, '2020/2021', 170000, 145000, 45000),
(211, '01190021', 'Naufal Yusfi Al Aufa', 3, '2020/2021', 170000, 145000, 45000),
(212, '01190022', 'Prawira Yudhawidiono', 3, '2020/2021', 170000, 145000, 45000),
(213, '01190023', 'Salman Al-Farisi', 3, '2020/2021', 170000, 145000, 45000),
(214, '01190024', 'Tania Maulida Hapsari', 3, '2020/2021', 170000, 145000, 45000),
(231, '01200001', 'a', 1, '2020/2021', 1, 2, 3),
(232, '01200002', 'b', 1, '2020/2021', 4, 5, 6),
(257, '01190025', 'Abdurrahman Faris Nur F', 4, '2020/2021', 1, 2, 3),
(258, '01190038', 'Hadfina Ayu Althafunisa', 4, '2020/2021', 1, 2, 3),
(259, '01190039', 'Herdhianti Ainun Rahma', 4, '2020/2021', 1, 2, 3),
(260, '01190040', 'Jauharul Hikam Alwari F', 4, '2020/2021', 1, 2, 3),
(261, '01190041', 'M. Morgan Budiono', 4, '2020/2021', 1, 2, 3),
(262, '01190042', 'Moch Nabil Syahroni', 4, '2020/2021', 1, 2, 3),
(263, '01190043', 'Mouzazora Syamara S', 4, '2020/2021', 1, 2, 3),
(264, '01190044', 'Mufidathul Ainun Syifa', 4, '2020/2021', 1, 2, 3),
(265, '01190045', 'Muhammad Asyrofun N', 4, '2020/2021', 1, 2, 3),
(266, '01190046', 'Renanta Lona Laila K', 4, '2020/2021', 1, 2, 3),
(267, '01190047', 'Roziq Jamaludin', 4, '2020/2021', 1, 2, 3),
(268, '01190037', 'Firdaus Ahmad F.', 4, '2020/2021', 1, 2, 3),
(269, '01190036', 'Danisya Fahma Al Husna', 4, '2020/2021', 1, 2, 3),
(270, '01190026', 'Afika Cahya Reybina', 4, '2020/2021', 1, 2, 3),
(271, '01190027', 'Ahmad Atmam Asyakiri', 4, '2020/2021', 1, 2, 3),
(272, '01190028', 'Ahza Kotaro Naraya', 4, '2020/2021', 1, 2, 3),
(273, '01190029', 'Akihiko Ahmad A.', 4, '2020/2021', 1, 2, 3),
(274, '01190030', 'Arzhavin Fareyza Batara', 4, '2020/2021', 1, 2, 3),
(275, '01190031', 'Attiyatul Azizah', 4, '2020/2021', 1, 2, 3),
(276, '01190032', 'Averous Fakhrie Z. A.', 4, '2020/2021', 1, 2, 3),
(277, '01190033', 'Azyan Hisyam Naufal A', 4, '2020/2021', 1, 2, 3),
(278, '01190034', 'Azzalea Batrisya Queensy', 4, '2020/2021', 1, 2, 3),
(279, '01190035', 'Cetrine Clowwi Saryoto', 4, '2020/2021', 1, 2, 3),
(280, '01190048', 'Sindu Prawoko', 4, '2020/2021', 1, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `no_hp` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`id`, `nama`, `no_hp`, `email`, `password`) VALUES
(1, 'zen', '123', 'admin@admin.com', '123');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_gedung`
--

CREATE TABLE `tbl_gedung` (
  `no_runangan` varchar(10) NOT NULL,
  `nama_ruangan` varchar(20) DEFAULT NULL,
  `kapasitas` enum('') DEFAULT NULL,
  `nama_gedung` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kelas`
--

CREATE TABLE `tbl_kelas` (
  `id_kelas` int(11) NOT NULL,
  `nama_kelas` varchar(10) DEFAULT NULL,
  `id_dosen` varchar(20) DEFAULT NULL,
  `no_ruangan` varchar(20) DEFAULT NULL,
  `id_mata_kuliah` varchar(20) DEFAULT NULL,
  `hari` varchar(20) DEFAULT NULL,
  `jam` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_kelas`
--

INSERT INTO `tbl_kelas` (`id_kelas`, `nama_kelas`, `id_dosen`, `no_ruangan`, `id_mata_kuliah`, `hari`, `jam`) VALUES
(1, '2-2', '1', '1', '1', 'senin', '17-18');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_krs`
--

CREATE TABLE `tbl_krs` (
  `id_krs` int(11) NOT NULL,
  `nim` varchar(20) DEFAULT NULL,
  `id_kelas` varchar(20) DEFAULT NULL,
  `nilai_angka` int(11) DEFAULT NULL,
  `nilai_huruf` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_krs`
--

INSERT INTO `tbl_krs` (`id_krs`, `nim`, `id_kelas`, `nilai_angka`, `nilai_huruf`) VALUES
(1, '1', '1', 6, 'A'),
(2, '2', '1', 4, 'b');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_matakuliah`
--

CREATE TABLE `tbl_matakuliah` (
  `id_mata_kuliah` varchar(11) NOT NULL,
  `nama_mata_kuliah` varchar(40) NOT NULL,
  `sks` tinyint(4) NOT NULL,
  `semester` tinyint(4) NOT NULL,
  `id_prodi` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_matakuliah`
--

INSERT INTO `tbl_matakuliah` (`id_mata_kuliah`, `nama_mata_kuliah`, `sks`, `semester`, `id_prodi`) VALUES
('1', 'Pemrograman Berorientasi Objek', 2, 4, '29032020'),
('2', 'ALgoritma dan Pemrograman', 2, 1, '29032020'),
('3', 'Multimedia 2', 2, 4, '29032020'),
('4', 'Kriptografi', 3, 4, '29032020'),
('5', 'Pengolahan Citra', 2, 4, '29032020'),
('6', 'Robotika', 2, 4, '29032020');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_mhs`
--

CREATE TABLE `tbl_mhs` (
  `nim` varchar(11) NOT NULL,
  `nama` varchar(40) NOT NULL,
  `gender` enum('L','P') NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `tempat_lahir` varchar(30) NOT NULL,
  `kd_agama` int(2) NOT NULL,
  `foto` text NOT NULL,
  `kd_kelas` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_mhs`
--

INSERT INTO `tbl_mhs` (`nim`, `nama`, `gender`, `tanggal_lahir`, `tempat_lahir`, `kd_agama`, `foto`, `kd_kelas`) VALUES
('10350157', 'Joko', 'L', '1991-01-01', 'Medan', 1, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_prodi`
--

CREATE TABLE `tbl_prodi` (
  `id_prodi` varchar(11) NOT NULL,
  `nama_prodi` varchar(40) NOT NULL,
  `no_telp` varchar(40) NOT NULL,
  `alamat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_prodi`
--

INSERT INTO `tbl_prodi` (`id_prodi`, `nama_prodi`, `no_telp`, `alamat`) VALUES
('29032020', 'Sistem Komputer', '061-1234566', 'Jalan Aksara No. 161 A'),
('29032021', 'Teknik Informatika', '061-123456', 'Jalan Ar Hakim'),
('29032022', 'Teknik Elektro', '061-123456', 'Jalan Letda Sujono');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
(1, '127.0.0.1', 'administrator', '$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36', '', 'admin@admin.com', '', NULL, NULL, 'gj1E8xsAXNRlvgDc6Z6xV.', 1268889823, 1594943232, 1, 'Admin', 'istrator', 'ADMIN', '0'),
(2, '::1', 'administrator', '$2y$08$wW9avr1yslzWBElKJliHu.ee6SQaS5SpR/ejI47ZsYySlq6.uSHBG', NULL, 'zen@zen.com', NULL, NULL, NULL, 'ubMk/WpgVnMDirqcvHS.S.', 1581861416, 1582172074, 1, 'Muhammad', 'Zen', 'Zending', '0812121212');

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(4, 2, 1),
(3, 2, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t001_tahunajaran`
--
ALTER TABLE `t001_tahunajaran`
  ADD PRIMARY KEY (`idtahunajaran`);

--
-- Indexes for table `t002_guru`
--
ALTER TABLE `t002_guru`
  ADD PRIMARY KEY (`idguru`);

--
-- Indexes for table `t003_kelas`
--
ALTER TABLE `t003_kelas`
  ADD PRIMARY KEY (`idkelas`),
  ADD KEY `fk_guru` (`idguru`);

--
-- Indexes for table `t004_siswa`
--
ALTER TABLE `t004_siswa`
  ADD PRIMARY KEY (`idsiswa`),
  ADD KEY `fk_idkelas` (`idkelas`);

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_gedung`
--
ALTER TABLE `tbl_gedung`
  ADD PRIMARY KEY (`no_runangan`);

--
-- Indexes for table `tbl_kelas`
--
ALTER TABLE `tbl_kelas`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indexes for table `tbl_krs`
--
ALTER TABLE `tbl_krs`
  ADD PRIMARY KEY (`id_krs`);

--
-- Indexes for table `tbl_matakuliah`
--
ALTER TABLE `tbl_matakuliah`
  ADD PRIMARY KEY (`id_mata_kuliah`);

--
-- Indexes for table `tbl_mhs`
--
ALTER TABLE `tbl_mhs`
  ADD PRIMARY KEY (`nim`);

--
-- Indexes for table `tbl_prodi`
--
ALTER TABLE `tbl_prodi`
  ADD PRIMARY KEY (`id_prodi`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `t001_tahunajaran`
--
ALTER TABLE `t001_tahunajaran`
  MODIFY `idtahunajaran` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `t002_guru`
--
ALTER TABLE `t002_guru`
  MODIFY `idguru` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `t003_kelas`
--
ALTER TABLE `t003_kelas`
  MODIFY `idkelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `t004_siswa`
--
ALTER TABLE `t004_siswa`
  MODIFY `idsiswa` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=283;
--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tbl_krs`
--
ALTER TABLE `tbl_krs`
  MODIFY `id_krs` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
