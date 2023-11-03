-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 03, 2023 at 06:24 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ananda_maulana_wahyudi_2202310054`
--

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id_mahasiswa` int NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `npm` varchar(20) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `tempat_lahir` varchar(255) DEFAULT NULL,
  `jenis_kelamin` varchar(15) DEFAULT NULL,
  `no_hp` varchar(15) DEFAULT NULL,
  `id_prodi` int DEFAULT NULL,
  `id_sistem_kuliah` int DEFAULT NULL,
  `id_status_mhs` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`id_mahasiswa`, `nama`, `npm`, `tgl_lahir`, `tempat_lahir`, `jenis_kelamin`, `no_hp`, `id_prodi`, `id_sistem_kuliah`, `id_status_mhs`) VALUES
(1, 'Agung', '2202310001', '2000-01-01', 'sumenep', 'Laki-laki', '087850099289', 1, 1, 1),
(2, 'Abdullah', '2202310002', '1996-01-02', 'pamekasan', 'Laki-laki', '087850099290', 2, 4, 1),
(3, 'Ayu', '2202310003', '2003-01-03', 'Surabaya', 'Perempuan', '087850099291', 3, 5, 2),
(4, 'Kirana', '2202310004', '2003-01-04', 'sumenep', 'Perempuan', '087850099292', 4, 3, 1),
(5, 'Hendri', '2202310005', '2003-01-05', 'pamekasan', 'Laki-laki', '087850099293', 5, 1, 4),
(6, 'Fitri', '2202310006', '2003-01-06', 'Surabaya', 'Perempuan', '087850099294', 3, 2, 3),
(7, 'Hendra', '2202310007', '2004-01-07', 'sampang', 'Laki-laki', '087850099295', 3, 1, 1),
(8, 'Wawan', '2202310008', '2003-01-08', 'sumenep', 'Laki-laki', '087850099296', 3, 1, 1),
(9, 'Putri', '2202310009', '2002-01-09', 'sumenep', 'Laki-laki', '087850099297', 4, 1, 1),
(10, 'Reza', '2202310010', '2001-01-10', 'sumenep', 'Perempuan', '087850099298', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int NOT NULL,
  `nama_pembayaran` varchar(255) DEFAULT NULL,
  `nominal_terbayar` decimal(10,2) DEFAULT NULL,
  `id_mahasiswa` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `nama_pembayaran`, `nominal_terbayar`, `id_mahasiswa`) VALUES
(1, 'Pendaftaran', 200.00, 1),
(2, 'Daftar Ulang', 1500.00, 1),
(3, 'UKT', 1500.00, 1),
(4, 'Pendaftaran', 300.00, 2),
(5, 'Daftar Ulang', 1500.00, 2),
(6, 'UKT', 3000.00, 2),
(7, 'Pendaftaran', 300.00, 3),
(8, 'Daftar Ulang', 1500.00, 3),
(9, 'UKT', 3000.00, 3),
(10, 'Pendaftaran', 200.00, 4),
(11, 'Daftar Ulang', 1500.00, 4),
(12, 'UKT', 1500.00, 4);

-- --------------------------------------------------------

--
-- Table structure for table `prodi`
--

CREATE TABLE `prodi` (
  `id_prodi` int NOT NULL,
  `nama_prodi` varchar(255) DEFAULT NULL,
  `jenjang_prodi` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `prodi`
--

INSERT INTO `prodi` (`id_prodi`, `nama_prodi`, `jenjang_prodi`) VALUES
(1, 'Akuntansi', 'S1'),
(2, 'Manajemen', 'S1'),
(3, 'Informatika', 'S1'),
(4, 'Sistem Informasi', 'S1'),
(5, 'Teknik Industri', 'S1');

-- --------------------------------------------------------

--
-- Table structure for table `sistem_kuliah`
--

CREATE TABLE `sistem_kuliah` (
  `id_sistem_kuliah` int NOT NULL,
  `nama_sistem_kuliah` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sistem_kuliah`
--

INSERT INTO `sistem_kuliah` (`id_sistem_kuliah`, `nama_sistem_kuliah`) VALUES
(1, 'Reguler'),
(2, 'Transfer'),
(3, 'Pindahan'),
(4, 'Karyawan'),
(5, 'Online');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id_status_mhs` int NOT NULL,
  `status_mhs` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id_status_mhs`, `status_mhs`) VALUES
(1, 'Aktif'),
(2, 'Non-Aktif'),
(3, 'Lulus'),
(4, 'Drop Out');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id_mahasiswa`),
  ADD KEY `id_prodi` (`id_prodi`),
  ADD KEY `id_sistem_kuliah` (`id_sistem_kuliah`),
  ADD KEY `id_status_mhs` (`id_status_mhs`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `id_mahasiswa` (`id_mahasiswa`);

--
-- Indexes for table `prodi`
--
ALTER TABLE `prodi`
  ADD PRIMARY KEY (`id_prodi`);

--
-- Indexes for table `sistem_kuliah`
--
ALTER TABLE `sistem_kuliah`
  ADD PRIMARY KEY (`id_sistem_kuliah`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id_status_mhs`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `mahasiswa_ibfk_1` FOREIGN KEY (`id_prodi`) REFERENCES `prodi` (`id_prodi`),
  ADD CONSTRAINT `mahasiswa_ibfk_2` FOREIGN KEY (`id_status_mhs`) REFERENCES `status` (`id_status_mhs`),
  ADD CONSTRAINT `mahasiswa_ibfk_3` FOREIGN KEY (`id_sistem_kuliah`) REFERENCES `sistem_kuliah` (`id_sistem_kuliah`);

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`id_mahasiswa`) REFERENCES `mahasiswa` (`id_mahasiswa`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
