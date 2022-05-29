-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 29, 2022 at 02:04 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.0.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kasir_restoran`
--

-- --------------------------------------------------------

--
-- Table structure for table `detailpesan`
--

CREATE TABLE `detailpesan` (
  `id_detail` int(15) NOT NULL,
  `id_menu` int(15) NOT NULL,
  `qty` int(5) NOT NULL,
  `status` varchar(20) NOT NULL,
  `total` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detailpesan`
--

INSERT INTO `detailpesan` (`id_detail`, `id_menu`, `qty`, `status`, `total`) VALUES
(10, 2, 1, 'Lunas', 15000),
(11, 3, 1, 'Lunas', 15000),
(12, 2, 1, 'Lunas', 15000),
(13, 3, 1, 'Lunas', 15000),
(14, 3, 1, 'Lunas', 15000);

--
-- Triggers `detailpesan`
--
DELIMITER $$
CREATE TRIGGER `addorder` AFTER INSERT ON `detailpesan` FOR EACH ROW INSERT INTO
log_detail(status,waktu,id_detail,id_menu,qty,total)
VALUES('tambah order',now(),new.id_detail,new.id_menu,new.qty,new.total)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `log_admin`
--

CREATE TABLE `log_admin` (
  `status` varchar(20) NOT NULL,
  `waktu` date NOT NULL,
  `id_peg` int(15) NOT NULL,
  `nama_peg` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(15) NOT NULL,
  `handphone` varchar(13) NOT NULL,
  `level` enum('admin','manager','kasir','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `log_admin`
--

INSERT INTO `log_admin` (`status`, `waktu`, `id_peg`, `nama_peg`, `username`, `password`, `handphone`, `level`) VALUES
('tambah\r\ndata', '2022-03-25', 1, 'Rahma', 'admin', '123', '0826387361', 'admin'),
('tambah\r\ndata', '2022-03-25', 2, 'sherly', 'manager', '123', '0827386', 'admin'),
('tambah\r\ndata', '2022-03-25', 2, 'sherly', 'manager', '123', '082738645', 'kasir'),
('tambah\r\ndata', '2022-03-25', 2, 'sherly', 'manager', '123', '082738645', 'kasir'),
('tambah\r\ndata', '2022-03-25', 2, 'sherly', 'manager', '123', '084652256', 'kasir'),
('tambah\r\ndata', '2022-03-25', 2, 'sherly', 'kasir', '123', '084652256', 'kasir'),
('tambah\r\ndata', '2022-03-25', 3, 'silvia', 'manager', '123', '084652256', 'kasir'),
('tambah\r\ndata', '2022-03-25', 3, 'silvia', 'manager', '123', '0749863', 'kasir'),
('tambah\r\ndata', '2022-03-25', 4, 'rizka', 'manager', '123', '08461475', 'manager'),
('tambah\r\ndata', '2022-03-30', 5, 'Aisyah', 'kasir', '123', '085721255268', 'kasir'),
('tambah\r\ndata', '2022-05-20', 5, 'silvia', 'manager1', '123', '098237376', 'manager'),
('tambah\r\ndata', '2022-05-20', 5, 'gina', 'kasir1', '123', '0882764', 'kasir'),
('tambah\r\ndata', '2022-05-20', 6, 'rani', 'ranikasir', '123', '0804553', 'kasir'),
('tambah\r\ndata', '2022-05-24', 7, 'Silvia', 'Silviadwi', '123', '097237549', 'admin'),
('tambah\r\ndata', '2022-05-24', 8, 'rani', 'raniaa', '123', '092667811', 'manager');

-- --------------------------------------------------------

--
-- Table structure for table `log_detail`
--

CREATE TABLE `log_detail` (
  `status` varchar(50) NOT NULL,
  `waktu` date NOT NULL,
  `id_detail` int(15) NOT NULL,
  `id_menu` int(15) NOT NULL,
  `qty` int(15) NOT NULL,
  `total` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `log_detail`
--

INSERT INTO `log_detail` (`status`, `waktu`, `id_detail`, `id_menu`, `qty`, `total`) VALUES
('tambah order', '2022-05-23', 9, 2, 1, 15000),
('tambah order', '2022-05-24', 10, 1, 1, 5000),
('tambah order', '2022-05-24', 11, 1, 2, 10000),
('tambah order', '2022-05-24', 10, 2, 1, 15000),
('tambah order', '2022-05-24', 11, 3, 1, 15000),
('tambah order', '2022-05-24', 12, 2, 1, 15000),
('tambah order', '2022-05-26', 13, 3, 1, 15000),
('tambah order', '2022-05-26', 14, 3, 1, 15000);

-- --------------------------------------------------------

--
-- Table structure for table `log_master`
--

CREATE TABLE `log_master` (
  `status` varchar(50) NOT NULL,
  `waktu` date NOT NULL,
  `id_master` int(15) NOT NULL,
  `id_detail` int(15) NOT NULL,
  `id_peg` int(15) NOT NULL,
  `tgl_bayar` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `log_master`
--

INSERT INTO `log_master` (`status`, `waktu`, `id_master`, `id_detail`, `id_peg`, `tgl_bayar`) VALUES
('sudah\r\nbayar', '2022-03-29', 1, 1, 1, '2022-03-29'),
('sudah\r\nbayar', '2022-03-30', 2, 2, 1, '2022-03-30'),
('sudah\r\nbayar', '2022-03-30', 3, 2, 2, '2022-03-30'),
('sudah\r\nbayar', '2022-03-31', 6, 4, 1, '2022-03-31'),
('sudah\r\nbayar', '2022-05-19', 1, 1, 1, '2022-05-19'),
('sudah\r\nbayar', '2022-05-19', 2, 2, 1, '2022-04-19'),
('sudah\r\nbayar', '2022-05-19', 4, 1, 1, '2022-05-19'),
('sudah\r\nbayar', '2022-05-19', 57, 1, 1, '2022-06-19'),
('sudah\r\nbayar', '2022-05-20', 1, 2, 1, '2022-05-20'),
('sudah\r\nbayar', '2022-05-22', 1, 1, 1, '2022-05-22'),
('sudah\r\nbayar', '2022-05-23', 2, 2, 1, '2022-05-23'),
('sudah\r\nbayar', '2022-05-23', 3, 3, 1, '2022-05-23'),
('sudah\r\nbayar', '2022-05-23', 4, 4, 1, '2022-05-23'),
('sudah\r\nbayar', '2022-05-23', 5, 7, 1, '2022-04-15'),
('sudah\r\nbayar', '2022-05-23', 8, 6, 2, '2022-04-23'),
('sudah\r\nbayar', '2022-05-23', 7, 5, 2, '2022-05-23'),
('sudah\r\nbayar', '2022-05-23', 7, 8, 2, '2022-04-23'),
('sudah\r\nbayar', '2022-05-23', 7, 9, 2, '2022-04-23'),
('sudah\r\nbayar', '2022-05-23', 7, 9, 2, '2022-04-23'),
('sudah\r\nbayar', '2022-05-24', 7, 10, 1, '2022-05-24'),
('sudah\r\nbayar', '2022-05-24', 7, 11, 1, '2022-05-03'),
('sudah\r\nbayar', '2022-05-24', 7, 9, 1, '2022-05-24'),
('sudah\r\nbayar', '2022-05-24', 1, 10, 1, '2022-05-24'),
('sudah\r\nbayar', '2022-05-24', 11, 11, 1, '2022-05-24'),
('sudah\r\nbayar', '2022-05-24', 12, 12, 1, '2022-05-24'),
('sudah\r\nbayar', '2022-05-26', 13, 13, 1, '2022-05-26'),
('sudah\r\nbayar', '2022-05-26', 14, 14, 1, '2022-05-26');

-- --------------------------------------------------------

--
-- Table structure for table `log_menu`
--

CREATE TABLE `log_menu` (
  `status` varchar(50) NOT NULL,
  `waktu` date NOT NULL,
  `nama_menu` varchar(50) NOT NULL,
  `harga` int(50) NOT NULL,
  `photo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `log_menu`
--

INSERT INTO `log_menu` (`status`, `waktu`, `nama_menu`, `harga`, `photo`) VALUES
('tambah\r\nmenu', '2022-03-25', 'burger', 2000, 'C:\\Users\\HDC\\OneDrive\\Pictures\\kasir_restoran\\Add.png'),
('update\r\nmenu', '2022-03-25', 'burger', 10000, 'C:UsersHDCOneDrivePictureskasir_restoranAdd.png'),
('tambah\r\nmenu', '2022-03-30', 'Rendang', 15000, ''),
('tambah\r\nmenu', '2022-03-30', 'Sate', 10000, ''),
('tambah\r\nmenu', '2022-03-30', 'Spageti', 20000, ''),
('update\r\nmenu', '2022-03-30', 'burger', 10000, 'C:UsersHDCOneDrivePictureskasir_restoranurger1.jpg'),
('update\r\nmenu', '2022-03-30', 'Spageti', 20000, 'C:UsersHDCOneDrivePictureskasir_restoranspageti.jpg'),
('update\r\nmenu', '2022-03-30', 'Rendang', 15000, 'C:UsersHDCOneDrivePictureskasir_restoran\rendang.jfif'),
('update\r\nmenu', '2022-03-30', 'Sate', 10000, 'C:UsersHDCOneDrivePictureskasir_restoransate.jpg.crdownload'),
('tambah\r\nmenu', '2022-03-31', 'seblak', 5000, 'C:\\Users\\HDC\\OneDrive\\Pictures\\kasir_restoran\\seblak.jpg'),
('update\r\nmenu', '2022-03-31', 'burger', 10000, 'C:UsersHDCOneDrivePictureskasir_restoranurger1.jpg'),
('update\r\nmenu', '2022-03-31', 'Rendang', 15000, 'C:UsersHDCOneDrivePictureskasir_restoran\rendang.jfif'),
('update\r\nmenu', '2022-03-31', 'Sate', 10000, 'C:UsersHDCOneDrivePictureskasir_restoranuser.png'),
('update\r\nmenu', '2022-03-31', 'Spageti', 20000, 'C:UsersHDCOneDrivePictureskasir_restoranspageti.jpg'),
('update\r\nmenu', '2022-03-31', 'burger', 10000, 'C:\\Users\\HDC\\OneDrive\\Pictures\\kasir_restoran\\burger1.jpg'),
('update\r\nmenu', '2022-05-18', 'Rendang', 15000, 'C:\\Users\\HDC\\OneDrive\\Pictures\\kasir_restoran\\\r\nrendang.jfif'),
('update\r\nmenu', '2022-05-18', 'Sate', 10000, 'C:UsersHDCOneDrivePictureskasir_restoranuser.png'),
('update\r\nmenu', '2022-05-18', 'Rendang', 15000, 'C:UsersHDCOneDrivePictureskasir_restoran\r rendang.jfif'),
('update\r\nmenu', '2022-05-18', 'burger', 15000, 'C:UsersHDCOneDrivePictureskasir_restoranurger1.jpg'),
('update\r\nmenu', '2022-05-18', 'burger', 15000, 'C:UsersHDCOneDrivePictureskasir_restoranurger1.jpg'),
('update\r\nmenu', '2022-05-18', 'burger', 15000, 'C:UsersHDCOneDrivePictureskasir_restoranurger1.jpg'),
('update\r\nmenu', '2022-05-18', 'burger', 15000, 'C:\\Users\\HDC\\OneDrive\\Pictures\\kasir_restoran\\burger1.jpg'),
('update\r\nmenu', '2022-05-18', 'Sate', 10000, 'C:\\Users\\HDC\\OneDrive\\Pictures\\kasir_restoran\\user.png'),
('tambah\r\nmenu', '2022-05-19', 'seblak', 10000, 'C:\\Users\\HDC\\OneDrive\\Pictures\\kasir_restoran\\seblak.jpg'),
('update\r\nmenu', '2022-05-19', 'spageti', 10000, 'C:UsersHDCOneDrivePictureskasir_restoranspageti.jpg'),
('tambah\r\nmenu', '2022-05-19', 'seblak', 15000, 'C:\\Users\\HDC\\OneDrive\\Pictures\\kasir_restoran\\seblak.jpg'),
('update\r\nmenu', '2022-05-19', 'ceblak', 10000, 'C:UsersHDCOneDrivePictureskasir_restoranseblak.jpg'),
('update\r\nmenu', '2022-05-20', 'spageti', 10000, 'C:UsersHDCOneDrivePictureskasir_restoranadmin5.jpg'),
('tambah\r\nmenu', '2022-05-20', 'seblak', 10000, 'C:\\Users\\HDC\\OneDrive\\Pictures\\kasir_restoran\\seblak.jpg'),
('tambah\r\nmenu', '2022-05-20', 'rendang', 15000, 'C:\\Users\\HDC\\OneDrive\\Pictures\\kasir_restoran\\rendang.jfif'),
('tambah\r\nmenu', '2022-05-20', 'spageti', 15000, 'C:\\Users\\HDC\\OneDrive\\Pictures\\kasir_restoran\\spageti.jpg'),
('update\r\nmenu', '2022-05-23', 'seblak', 5000, 'C:UsersHDCOneDrivePictureskasir_restoranseblak.jpg'),
('update\r\nmenu', '2022-05-23', 'seblak', 5000, 'C:UsersHDCOneDrivePictureskasir_restoranseblak.jpg'),
('update\r\nmenu', '2022-05-23', 'seblak', 5000, 'C:\\Users\\HDC\\OneDrive\\Pictures\\kasir_restoran\\seblak.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `masterpesan`
--

CREATE TABLE `masterpesan` (
  `id_master` int(15) NOT NULL,
  `id_detail` int(15) NOT NULL,
  `id_peg` int(15) NOT NULL,
  `tgl_bayar` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `masterpesan`
--

INSERT INTO `masterpesan` (`id_master`, `id_detail`, `id_peg`, `tgl_bayar`) VALUES
(1, 10, 1, '2022-05-24'),
(11, 11, 1, '2022-05-24'),
(12, 12, 1, '2022-05-24'),
(13, 13, 1, '2022-05-26'),
(14, 14, 1, '2022-05-26');

--
-- Triggers `masterpesan`
--
DELIMITER $$
CREATE TRIGGER `addbayar` AFTER INSERT ON `masterpesan` FOR EACH ROW INSERT INTO
log_master(status,waktu,id_master,id_detail,id_peg,tgl_bayar)VALUES('sudah\r\nbayar',now(),new.id_master,new.id_detail,new.id_peg,new.tgl_bayar)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updatebayar` AFTER INSERT ON `masterpesan` FOR EACH ROW update detailpesan set status='Lunas' where id_detail=new.id_detail
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id_menu` int(15) NOT NULL,
  `nama_menu` varchar(50) NOT NULL,
  `harga` int(15) NOT NULL,
  `photo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id_menu`, `nama_menu`, `harga`, `photo`) VALUES
(1, 'seblak', 5000, 'C:\\Users\\HDC\\OneDrive\\Pictures\\kasir_restoran\\seblak.jpg'),
(2, 'rendang', 15000, 'C:\\Users\\HDC\\OneDrive\\Pictures\\kasir_restoran\\rendang.jfif'),
(3, 'spageti', 15000, 'C:\\Users\\HDC\\OneDrive\\Pictures\\kasir_restoran\\spageti.jpg');

--
-- Triggers `menu`
--
DELIMITER $$
CREATE TRIGGER `update` AFTER UPDATE ON `menu` FOR EACH ROW INSERT INTO
log_menu(status,waktu,nama_menu,harga,photo)
VALUES ('update\r\nmenu',now(),new.nama_menu,new.harga,new.photo)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `id_peg` int(15) NOT NULL,
  `nama_peg` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `handphone` varchar(13) NOT NULL,
  `level` enum('admin','manager','kasir','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`id_peg`, `nama_peg`, `username`, `password`, `handphone`, `level`) VALUES
(1, 'Rahma', 'admin', '123', '0826387361', 'admin'),
(2, 'sherly', 'kasir', '123', '084652256', 'kasir'),
(4, 'rizka', 'manager', '123', '084614756278', 'manager'),
(7, 'Silvia', 'Silviadwi', '123', '097237549', 'admin'),
(8, 'rani', 'raniaa', '123', '092667811', 'manager');

--
-- Triggers `pegawai`
--
DELIMITER $$
CREATE TRIGGER `tambah data` AFTER INSERT ON `pegawai` FOR EACH ROW INSERT INTO 
log_admin(status,waktu,id_peg,nama_peg,username,password,handphone,level)VALUES('tambah\r\ndata',now(),new.id_peg,new.nama_peg,new.username,new.password,new.handphone,new.level)
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detailpesan`
--
ALTER TABLE `detailpesan`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `id_menu` (`id_menu`);

--
-- Indexes for table `masterpesan`
--
ALTER TABLE `masterpesan`
  ADD KEY `id_detail` (`id_detail`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id_peg`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
