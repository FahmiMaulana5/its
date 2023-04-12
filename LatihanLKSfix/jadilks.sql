-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 12 Apr 2023 pada 06.05
-- Versi server: 8.0.30
-- Versi PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jadilks`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_log`
--

CREATE TABLE `tbl_log` (
  `Id_Log` int NOT NULL,
  `waktu` timestamp NOT NULL,
  `aktifitas` varchar(50) NOT NULL,
  `Id_User` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `tbl_log`
--

INSERT INTO `tbl_log` (`Id_Log`, `waktu`, `aktifitas`, `Id_User`) VALUES
(1, '2023-04-13 02:00:00', 'login', 1),
(2, '2023-04-14 02:00:00', 'login', 2),
(3, '2023-04-15 02:00:00', 'login', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_obat`
--

CREATE TABLE `tbl_obat` (
  `Id_Obat` int NOT NULL,
  `Kode_Obat` varchar(50) NOT NULL,
  `Nama_Obat` varchar(50) NOT NULL,
  `Expired_Date` date NOT NULL,
  `Jumlah` bigint NOT NULL,
  `harga` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `tbl_obat`
--

INSERT INTO `tbl_obat` (`Id_Obat`, `Kode_Obat`, `Nama_Obat`, `Expired_Date`, `Jumlah`, `harga`) VALUES
(1, 'OB01', 'Bodrex', '2023-04-30', 1, 3000),
(2, 'OB02', 'Paramex', '2023-04-29', 2, 4000),
(3, 'OB03', 'Promag', '2023-04-28', 3, 1000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_resep`
--

CREATE TABLE `tbl_resep` (
  `Id_Resep` int NOT NULL,
  `No_Resep` varchar(50) NOT NULL,
  `Tgl_Resep` date NOT NULL,
  `Nama_Dokter` varchar(50) NOT NULL,
  `Nama_Pasien` varchar(50) NOT NULL,
  `Nama_ObatDibeli` varchar(50) NOT NULL,
  `Jumlah_ObatDibeli` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `tbl_resep`
--

INSERT INTO `tbl_resep` (`Id_Resep`, `No_Resep`, `Tgl_Resep`, `Nama_Dokter`, `Nama_Pasien`, `Nama_ObatDiblei`, `Jumlah_ObatDibeli`) VALUES
(1, 'RS01', '2023-04-20', 'Dian', 'Winata', 'Paramex', 1),
(2, 'RS02', '2023-04-21', 'Indra', 'Lesmana', 'Bodrex', 2),
(3, 'RS03', '2023-04-22', 'Naufal', 'Irfan', 'Promag', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_transaksi`
--

CREATE TABLE `tbl_transaksi` (
  `Id_Transaksi` int NOT NULL,
  `No_Transaksi` varchar(50) NOT NULL,
  `Tgl_Transaksi` date NOT NULL,
  `Total_Bayar` bigint NOT NULL,
  `Id_User` int NOT NULL,
  `Id_Obat` int NOT NULL,
  `Id_Resep` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `tbl_transaksi`
--

INSERT INTO `tbl_transaksi` (`Id_Transaksi`, `No_Transaksi`, `Tgl_Transaksi`, `Total_Bayar`, `Id_User`, `Id_Obat`, `Id_Resep`) VALUES
(1, 'TR01', '2023-04-13', 5000, 1, 1, 1),
(2, 'TR02', '2023-04-14', 10000, 2, 2, 2),
(3, 'TR03', '2023-04-15', 15000, 3, 3, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_user`
--

CREATE TABLE `tbl_user` (
  `Id_User` int NOT NULL,
  `Tipe_User` varchar(50) NOT NULL,
  `Nama_User` varchar(50) NOT NULL,
  `Alamat` varchar(150) NOT NULL,
  `Telpon` varchar(50) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(50)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `tbl_user`
--

INSERT INTO `tbl_user` (`Id_User`, `Tipe_User`, `Nama_User`, `Alamat`, `Telpon`, `Username`, `Password`) VALUES
(1, 'Admin', 'Admin1', 'Subang', '08123456789', 'admin1', 'admin1'),
(2, 'Apoteker', 'Apoteker1', 'Bandung', '089876543210', 'apoteker1', 'apoteker1'),
(3, 'Kasir', 'Kasir1', 'Jakarta', '088776354678', 'kasir1', 'kasir1');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbl_log`
--
ALTER TABLE `tbl_log`
  ADD PRIMARY KEY (`Id_Log`),
  ADD KEY `Id_User` (`Id_User`);

--
-- Indeks untuk tabel `tbl_obat`
--
ALTER TABLE `tbl_obat`
  ADD PRIMARY KEY (`Id_Obat`);

--
-- Indeks untuk tabel `tbl_resep`
--
ALTER TABLE `tbl_resep`
  ADD PRIMARY KEY (`Id_Resep`);

--
-- Indeks untuk tabel `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  ADD PRIMARY KEY (`Id_Transaksi`),
  ADD KEY `Id_User` (`Id_User`),
  ADD KEY `Id_Obat` (`Id_Obat`),
  ADD KEY `Id_Resep` (`Id_Resep`);

--
-- Indeks untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`Id_User`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tbl_log`
--
ALTER TABLE `tbl_log`
  MODIFY `Id_Log` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tbl_obat`
--
ALTER TABLE `tbl_obat`
  MODIFY `Id_Obat` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tbl_resep`
--
ALTER TABLE `tbl_resep`
  MODIFY `Id_Resep` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  MODIFY `Id_Transaksi` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `Id_User` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tbl_log`
--
ALTER TABLE `tbl_log`
  ADD CONSTRAINT `tbl_log_ibfk_1` FOREIGN KEY (`Id_User`) REFERENCES `tbl_user` (`Id_User`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  ADD CONSTRAINT `tbl_transaksi_ibfk_1` FOREIGN KEY (`Id_User`) REFERENCES `tbl_user` (`Id_User`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_transaksi_ibfk_2` FOREIGN KEY (`Id_Obat`) REFERENCES `tbl_obat` (`Id_Obat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_transaksi_ibfk_3` FOREIGN KEY (`Id_Resep`) REFERENCES `tbl_resep` (`Id_Resep`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
