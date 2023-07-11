-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 11, 2023 at 09:55 AM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `beasiswa-app`
--

-- --------------------------------------------------------

--
-- Table structure for table `beasiswa`
--

DROP TABLE IF EXISTS `beasiswa`;
CREATE TABLE IF NOT EXISTS `beasiswa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_beasiswa` varchar(50) DEFAULT NULL,
  `tanggal_mulai` date DEFAULT NULL,
  `tanggal_selesai` date DEFAULT NULL,
  `jenis_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `beasiswa`
--

INSERT INTO `beasiswa` (`id`, `nama_beasiswa`, `tanggal_mulai`, `tanggal_selesai`, `jenis_id`) VALUES
(1, 'Fauzan', '2023-06-24', '2023-07-01', 3),
(3, 'Maulana', '2023-05-19', '2023-11-19', 4),
(4, 'Kai', '2023-06-03', '2023-06-10', 2),
(5, 'Ina', '2023-06-12', '2023-07-01', 4);

-- --------------------------------------------------------

--
-- Table structure for table `jenis_beasiswa`
--

DROP TABLE IF EXISTS `jenis_beasiswa`;
CREATE TABLE IF NOT EXISTS `jenis_beasiswa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_jenis` varchar(50) DEFAULT NULL,
  `keterangan` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jenis_beasiswa`
--

INSERT INTO `jenis_beasiswa` (`id`, `nama_jenis`, `keterangan`) VALUES
(3, 'KIP', 'KIP'),
(4, 'Prestasi', 'Sehat'),
(5, 'Olahraga', 'Olahraga'),
(6, 'Matematika', 'Matematika');

-- --------------------------------------------------------

--
-- Table structure for table `pendaftaran_pengguna`
--

DROP TABLE IF EXISTS `pendaftaran_pengguna`;
CREATE TABLE IF NOT EXISTS `pendaftaran_pengguna` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no_pendaftaran` varchar(20) DEFAULT NULL,
  `nama_lengkap` varchar(75) DEFAULT NULL,
  `no_handphone` varchar(15) DEFAULT NULL,
  `bukti_daftar` varchar(255) DEFAULT NULL,
  `prodi_id` int(11) DEFAULT NULL,
  `keterangan` enum('Sudah Diverifikasi','Belum Diverifikasi','Akun Dibatalkan') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pendaftaran_pengguna`
--

INSERT INTO `pendaftaran_pengguna` (`id`, `no_pendaftaran`, `nama_lengkap`, `no_handphone`, `bukti_daftar`, `prodi_id`, `keterangan`) VALUES
(1, '1', 'Dody', '082152994710', '1E28602D78CA4BDB47EE85B725F752E7_1311e3232d548e7f7d522999671b9c7c.png', NULL, 'Sudah Diverifikasi'),
(2, '2', 'Deden', '082152445710', 'WhatsApp_Image_2023-03-18_at_10_24_18.jpg', NULL, 'Belum Diverifikasi');

-- --------------------------------------------------------

--
-- Table structure for table `pengajuan_beasiswa`
--

DROP TABLE IF EXISTS `pengajuan_beasiswa`;
CREATE TABLE IF NOT EXISTS `pengajuan_beasiswa` (
  `id` varchar(64) NOT NULL,
  `tanggal_pengajuan` date DEFAULT NULL,
  `pengguna_id` int(11) DEFAULT NULL,
  `beasiswa_id` int(11) DEFAULT NULL,
  `keterangan` enum('Diajukan','Ditolak','Diusulkan','Diterapkan') DEFAULT 'Diajukan',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

DROP TABLE IF EXISTS `pengguna`;
CREATE TABLE IF NOT EXISTS `pengguna` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `peran` enum('ADMIN','USER','OPERATOR') DEFAULT NULL,
  `login_terakhir` timestamp NULL DEFAULT NULL,
  `pendaftaran_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`id`, `username`, `PASSWORD`, `peran`, `login_terakhir`, `pendaftaran_id`) VALUES
(1, '1', '21232f297a57a5a743894a0e4a801fc3', 'USER', NULL, 1),
(2, '2', '21232f297a57a5a743894a0e4a801fc3', 'USER', NULL, 2),
(3, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'ADMIN', NULL, NULL),
(4, 'operator', '4b583376b2767b923c3e1da60d10de59', 'OPERATOR', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `persyaratan`
--

DROP TABLE IF EXISTS `persyaratan`;
CREATE TABLE IF NOT EXISTS `persyaratan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_persyaratan` varchar(100) DEFAULT NULL,
  `keterangan` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `persyaratan`
--

INSERT INTO `persyaratan` (`id`, `nama_persyaratan`, `keterangan`) VALUES
(1, 'Bungas', 'mmmmmmmmm'),
(3, 'Manis', 'Bidikmisibidikmisi');

-- --------------------------------------------------------

--
-- Table structure for table `persyaratan_beasiswa`
--

DROP TABLE IF EXISTS `persyaratan_beasiswa`;
CREATE TABLE IF NOT EXISTS `persyaratan_beasiswa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `beasiswa_id` int(11) DEFAULT NULL,
  `persyaratan_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `persyaratan_pengajuan`
--

DROP TABLE IF EXISTS `persyaratan_pengajuan`;
CREATE TABLE IF NOT EXISTS `persyaratan_pengajuan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pengajuan_id` int(11) DEFAULT NULL,
  `persyaratan_id` int(11) DEFAULT NULL,
  `tanggal_upload` timestamp NULL DEFAULT NULL,
  `nama_file` varchar(255) DEFAULT NULL,
  `keterangan` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `prodi`
--

DROP TABLE IF EXISTS `prodi`;
CREATE TABLE IF NOT EXISTS `prodi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_prodi` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prodi`
--

INSERT INTO `prodi` (`id`, `nama_prodi`) VALUES
(1, 'Pendidikan Kimia'),
(3, 'Teknik Sipil');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
