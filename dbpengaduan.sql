-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 17 Mar 2023 pada 03.14
-- Versi server: 10.1.38-MariaDB
-- Versi PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbpengaduan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `masyarakat`
--

CREATE TABLE `masyarakat` (
  `nik` char(16) NOT NULL,
  `nama` varchar(35) NOT NULL,
  `alamat` text NOT NULL,
  `rt_rw` varchar(20) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(32) NOT NULL,
  `tlp` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `masyarakat`
--

INSERT INTO `masyarakat` (`nik`, `nama`, `alamat`, `rt_rw`, `username`, `password`, `tlp`) VALUES
('0284374485745646', 'Jasmine', 'Tagog', '02/14', 'jasmine', '12345', '0813141516171'),
('0878667867867868', 'Arjuna', 'Gatsu', '09/04', 'arjuna', '12345', '0852525252525'),
('0989849478397538', 'Tantri', 'langgeng', '01/01', 'tantri', '123', '0878989898989'),
('1234567893332277', 'Yulia', 'Cileunyi', '02/90', 'yulialn', '12345', '5647657456387');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengaduan`
--

CREATE TABLE `pengaduan` (
  `id_pengaduan` int(11) NOT NULL,
  `tgl_pengaduan` varchar(40) NOT NULL,
  `nama_pengadu` varchar(40) NOT NULL,
  `nik` char(16) NOT NULL,
  `isi_laporan` text NOT NULL,
  `tlp` varchar(13) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `status` enum('Proses','Selesai') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pengaduan`
--

INSERT INTO `pengaduan` (`id_pengaduan`, `tgl_pengaduan`, `nama_pengadu`, `nik`, `isi_laporan`, `tlp`, `foto`, `status`) VALUES
(46, '2023-03-14 (20:16:42)', 'Yulia', '1234567893332277', 'Terjadi bencana alam longsor di kota asdfghjkl', '5647657456387', 'images (2).jpeg', 'Selesai'),
(47, '2023-03-16 (08:28:39)', 'Jasmine', '0284374485745646', 'Jalan rusak', '0813141516171', 'images (4).jpeg', 'Selesai'),
(49, '2023-03-16 (09:25:51)', 'Yulia', '1234567893332277', 'Banyak orang buang sampah sembarangan', '5647657456387', 'images (10).jpeg', 'Selesai'),
(50, '2023-03-16 (11:06:56)', 'Jasmine', '0284374485745646', 'ABCDEFG', '0813141516171', 'images (8).jpeg', 'Selesai'),
(51, '2023-03-16 (14:48:57)', 'Tantri', '0989849478397538', 'Saya capek', '0878989898989', 'images (5).jpeg', 'Selesai'),
(52, '2023-03-16 (16:02:14)', 'Yulia', '1234567893332277', 'test', '5647657456387', 'images (8).jpeg', 'Selesai');

-- --------------------------------------------------------

--
-- Struktur dari tabel `petugas`
--

CREATE TABLE `petugas` (
  `id_petugas` int(11) NOT NULL,
  `nama_petugas` varchar(35) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(32) NOT NULL,
  `tlp` varchar(13) NOT NULL,
  `level` enum('admin','petugas') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `petugas`
--

INSERT INTO `petugas` (`id_petugas`, `nama_petugas`, `username`, `password`, `tlp`, `level`) VALUES
(1, 'Muthia', 'admin', 'admin', '081617898716', 'admin'),
(11, 'Lestari', 'petugas', 'petugas', '082218455109', 'petugas'),
(12, 'Salwa', 'salwa', '12345', '0889898989898', 'petugas');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tanggapan`
--

CREATE TABLE `tanggapan` (
  `id_tanggapan` int(11) NOT NULL,
  `id_pengaduan` int(11) NOT NULL,
  `tgl_tanggapan` varchar(40) NOT NULL,
  `isi_laporan` text NOT NULL,
  `tanggapan` text NOT NULL,
  `id_petugas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tanggapan`
--

INSERT INTO `tanggapan` (`id_tanggapan`, `id_pengaduan`, `tgl_tanggapan`, `isi_laporan`, `tanggapan`, `id_petugas`) VALUES
(37, 46, '2023-03-16 (08:35:41)', 'Terjadi bencana alam longsor di kota asdfghjkl', 'SIAP', 1),
(38, 47, '2023-03-16 (08:36:34)', 'Jalan rusak', 'Ini dimana?', 1),
(39, 48, '2023-03-16 (09:06:55)', 'LAPOR PAK!!', 'Saya kesana', 1),
(40, 50, '2023-03-16 (11:06:56)', 'ABCDEFG', 'OKEY', 1),
(41, 49, '2023-03-16 (09:25:51)', 'Banyak orang buang sampah sembarangan', 'WAH DIMANA', 1),
(42, 51, '2023-03-16 (14:48:57)', 'Saya capek', 'Emang saya nanya?', 1),
(44, 52, '2023-03-16 (16:02:14)', 'test', 'iyaa hehe', 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `masyarakat`
--
ALTER TABLE `masyarakat`
  ADD PRIMARY KEY (`nik`);

--
-- Indeks untuk tabel `pengaduan`
--
ALTER TABLE `pengaduan`
  ADD PRIMARY KEY (`id_pengaduan`),
  ADD KEY `nik` (`nik`);

--
-- Indeks untuk tabel `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- Indeks untuk tabel `tanggapan`
--
ALTER TABLE `tanggapan`
  ADD PRIMARY KEY (`id_tanggapan`),
  ADD KEY `id_pengaduan` (`id_pengaduan`),
  ADD KEY `id_petugas` (`id_petugas`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `pengaduan`
--
ALTER TABLE `pengaduan`
  MODIFY `id_pengaduan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT untuk tabel `petugas`
--
ALTER TABLE `petugas`
  MODIFY `id_petugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `tanggapan`
--
ALTER TABLE `tanggapan`
  MODIFY `id_tanggapan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `pengaduan`
--
ALTER TABLE `pengaduan`
  ADD CONSTRAINT `pengaduan_ibfk_1` FOREIGN KEY (`nik`) REFERENCES `masyarakat` (`nik`);

--
-- Ketidakleluasaan untuk tabel `tanggapan`
--
ALTER TABLE `tanggapan`
  ADD CONSTRAINT `tanggapan_ibfk_2` FOREIGN KEY (`id_petugas`) REFERENCES `petugas` (`id_petugas`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
