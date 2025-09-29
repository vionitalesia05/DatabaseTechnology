-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 26, 2024 at 03:12 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aol_dbtech`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `Nama_Barang` varchar(25) NOT NULL,
  `Unit` char(10) DEFAULT NULL,
  `Spesifikasi_Barang` varchar(50) DEFAULT NULL,
  `Jumlah` int(11) DEFAULT NULL,
  `Harga` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`Nama_Barang`, `Unit`, `Spesifikasi_Barang`, `Jumlah`, `Harga`) VALUES
('Gunting', 'Pcs', 'Gunting Kecil Stainless', 1, 23000),
('Karton', 'Pcs', 'Karton Warna Ukuran 50x80cm', 20, 8000),
('Lem', 'Pcs', 'Glue Stick (Isian Lem Tembak)', 4, 7500),
('Pulpen', 'Pcs', 'Pulpen Sarasa tinta hitam 0.5', 100, 24000),
('Stik Kayu', 'Pcs', 'Stik Eskrim Kayu Putih', 30, 20000);

-- --------------------------------------------------------

--
-- Table structure for table `dokumen`
--

CREATE TABLE `dokumen` (
  `No_Dok` varchar(10) NOT NULL,
  `No_Permintaan` varchar(10) DEFAULT NULL,
  `Tanggal` date DEFAULT NULL,
  `Revisi` int(11) DEFAULT NULL,
  `Halaman` int(11) DEFAULT NULL,
  `Nama` char(25) DEFAULT NULL,
  `Departemen` char(20) DEFAULT NULL,
  `Diperiksa_Oleh` char(25) DEFAULT NULL,
  `Disetujui_Oleh` char(25) DEFAULT NULL,
  `Disiapkan_Oleh` char(25) DEFAULT NULL,
  `Diterima_Oleh` char(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dokumen`
--

INSERT INTO `dokumen` (`No_Dok`, `No_Permintaan`, `Tanggal`, `Revisi`, `Halaman`, `Nama`, `Departemen`, `Diperiksa_Oleh`, `Disetujui_Oleh`, `Disiapkan_Oleh`, `Diterima_Oleh`) VALUES
('A001', 'P001', '0000-00-00', 1, 1, 'John Anderson', 'DKV', 'Noah James', 'Kalandra', 'Staff', 'Admin'),
('A002', 'P002', '0000-00-00', 1, 1, 'Ahmad Zidan', 'Manufaktur', 'Liam Kai', 'Kalandra', 'Staff', 'Admin'),
('A003', 'P003', '0000-00-00', 1, 1, 'Satria Wijaya', 'Produksi', 'Mahaputra', 'Kalandra', 'Staff', 'Admin'),
('A004', 'P004', '0000-00-00', 1, 1, 'Rahayu Widyatama', 'Akuntansi', 'Daffa', 'Kalandra', 'Staff', 'Admin'),
('A005', 'P005', '0000-00-00', 1, 1, 'Leo Arthur', 'IT', 'Khalish', 'Kalandra', 'Staff', 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `permintaan`
--

CREATE TABLE `permintaan` (
  `No_Permintaan` varchar(10) NOT NULL,
  `Kategori` char(25) DEFAULT NULL,
  `Nama_Barang` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `permintaan`
--

INSERT INTO `permintaan` (`No_Permintaan`, `Kategori`, `Nama_Barang`) VALUES
('P001', 'Alat-alat Tulis', 'Karton'),
('P002', 'Alat-alat Tulis', 'Gunting'),
('P003', 'Alat-alat Tulis', 'Lem'),
('P004', 'Alat-alat Tulis', 'Stik Kayu'),
('P005', 'Alat-alat Tulis', 'Pulpen');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`Nama_Barang`);

--
-- Indexes for table `dokumen`
--
ALTER TABLE `dokumen`
  ADD PRIMARY KEY (`No_Dok`),
  ADD KEY `No_Permintaan` (`No_Permintaan`);

--
-- Indexes for table `permintaan`
--
ALTER TABLE `permintaan`
  ADD PRIMARY KEY (`No_Permintaan`),
  ADD KEY `Nama_Barang` (`Nama_Barang`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dokumen`
--
ALTER TABLE `dokumen`
  ADD CONSTRAINT `dokumen_ibfk_1` FOREIGN KEY (`No_Permintaan`) REFERENCES `permintaan` (`No_Permintaan`);

--
-- Constraints for table `permintaan`
--
ALTER TABLE `permintaan`
  ADD CONSTRAINT `permintaan_ibfk_1` FOREIGN KEY (`Nama_Barang`) REFERENCES `barang` (`Nama_Barang`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
