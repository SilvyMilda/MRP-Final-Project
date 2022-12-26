-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 26 Des 2022 pada 03.42
-- Versi server: 10.4.25-MariaDB
-- Versi PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventori`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang_keluar`
--

CREATE TABLE `barang_keluar` (
  `id` int(11) NOT NULL,
  `id_transaksi` varchar(100) NOT NULL,
  `tanggal` date NOT NULL,
  `kode_barang` varchar(100) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `jumlah` varchar(100) NOT NULL,
  `tujuan` varchar(100) NOT NULL,
  `satuan` varchar(100) NOT NULL,
  `total` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `barang_keluar`
--

INSERT INTO `barang_keluar` (`id`, `id_transaksi`, `tanggal`, `kode_barang`, `nama_barang`, `jumlah`, `tujuan`, `satuan`, `total`) VALUES
(3, 'TRK-1222002', '2022-12-26', 'BAR-1222001', 'Ayam', '2', 'Pengepul B', 'Unit', '498');

--
-- Trigger `barang_keluar`
--
DELIMITER $$
CREATE TRIGGER `barang_keluar` AFTER INSERT ON `barang_keluar` FOR EACH ROW BEGIN
	UPDATE gudang SET jumlah = jumlah-new.jumlah
    WHERE kode_barang=new.kode_barang;
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang_masuk`
--

CREATE TABLE `barang_masuk` (
  `id` int(11) NOT NULL,
  `id_transaksi` varchar(100) NOT NULL,
  `tanggal` date NOT NULL,
  `kode_barang` varchar(100) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `pengirim` varchar(100) NOT NULL,
  `jumlah` varchar(100) NOT NULL,
  `satuan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `barang_masuk`
--

INSERT INTO `barang_masuk` (`id`, `id_transaksi`, `tanggal`, `kode_barang`, `nama_barang`, `pengirim`, `jumlah`, `satuan`) VALUES
(2, 'TRM-1222001', '2022-12-22', 'BAR-1222001', 'Ayam', 'PT. Ciomas Adisatwa', '500', 'Ekor'),
(3, 'TRM-1222002', '2022-12-22', 'BAR-1222002', 'Eritrogrin', 'PT. Ciomas Adisatwa', '1', 'PCS'),
(4, 'TRM-1222003', '2022-12-22', 'BAR-1222003', 'Susu Skim', 'PT. Ciomas Adisatwa', '10', 'PCS'),
(5, 'TRM-1222004', '2022-12-22', 'BAR-1222004', 'Synergize', 'PT. Ciomas Adisatwa', '1', 'Botol'),
(6, 'TRM-1222005', '2022-12-22', 'BAR-1222005', 'Desgrin', 'PT. Ciomas Adisatwa', '3', 'Botol'),
(7, 'TRM-1222006', '2022-12-22', 'BAR-1222006', 'Dextrose', 'PT. Ciomas Adisatwa', '1', 'PCS'),
(8, 'TRM-1222007', '2022-12-22', 'BAR-1222007', 'Agricid', 'PT. Ciomas Adisatwa', '1', 'Botol'),
(9, 'TRM-1222008', '2022-12-22', 'BAR-1222008', 'Agriminovit', 'PT. Ciomas Adisatwa', '6', 'PCS'),
(10, 'TRM-1222009', '2022-12-22', 'BAR-1222009', 'Hitopvit', 'PT. Ciomas Adisatwa', '2', 'PCS'),
(11, 'TRM-1222010', '2022-12-22', 'BAR-1222010', 'Toltracox', 'PT. Ciomas Adisatwa', '2', 'Botol'),
(12, 'TRM-1222011', '2022-12-22', 'BAR-1222011', 'Cyprotylogrin', 'PT. Ciomas Adisatwa', '10', 'PCS'),
(13, 'TRM-1222012', '2022-12-22', 'BAR-1222012', 'Vitakur', 'PT. Ciomas Adisatwa', '4', 'PCS'),
(14, 'TRM-1222013', '2022-12-22', 'BAR-1222013', 'Vaksimune Nd Clone', 'PT. Ciomas Adisatwa', '10', 'Botol'),
(15, 'TRM-1222014', '2022-12-22', 'BAR-1222014', 'Vaksimune IBD M+', 'PT. Ciomas Adisatwa', '15', 'Botol');

--
-- Trigger `barang_masuk`
--
DELIMITER $$
CREATE TRIGGER `barang_masuk` AFTER INSERT ON `barang_masuk` FOR EACH ROW BEGIN
	UPDATE gudang SET jumlah = jumlah+new.jumlah
    WHERE kode_barang=new.kode_barang;
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `gudang`
--

CREATE TABLE `gudang` (
  `id` int(11) NOT NULL,
  `kode_barang` varchar(100) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `jenis_barang` varchar(100) NOT NULL,
  `jumlah` varchar(250) NOT NULL,
  `satuan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `gudang`
--

INSERT INTO `gudang` (`id`, `kode_barang`, `nama_barang`, `jenis_barang`, `jumlah`, `satuan`) VALUES
(2, 'BAR-1222001', 'Ayam', 'Ayam', '498', 'Unit'),
(3, 'BAR-1222002', 'Eritrogrin', 'Obat', '1', 'PCS'),
(4, 'BAR-1222003', 'Susu Skim', 'Obat', '10', 'PCS'),
(5, 'BAR-1222004', 'Synergize', 'Obat', '1', 'Botol'),
(6, 'BAR-1222005', 'Desgrin', 'Obat', '3', 'Botol'),
(7, 'BAR-1222006', 'Dextrose', 'Obat', '1', 'PCS'),
(8, 'BAR-1222007', 'Agricid', 'Obat', '1', 'Botol'),
(9, 'BAR-1222008', 'Agriminovit', 'Obat', '6', 'PCS'),
(10, 'BAR-1222009', 'Hitopvit', 'Obat', '2', 'PCS'),
(11, 'BAR-1222010', 'Toltracox', 'Obat', '2', 'Botol'),
(12, 'BAR-1222011', 'Cyprotylogrin', 'Obat', '10', 'PCS'),
(13, 'BAR-1222012', 'Vitakur', 'Obat', '4', 'PCS'),
(14, 'BAR-1222013', 'Vaksimune Nd Clone', 'Vaksin', '10', 'Botol'),
(15, 'BAR-1222014', 'Vaksimune IBD M+', 'Vaksin', '15', 'Botol'),
(16, 'BAR-1222015', 'Ulu I', 'Makanan', '0', 'Kg'),
(17, 'BAR-1222016', 'Ulu II', 'Makanan', '0', 'Kg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_barang`
--

CREATE TABLE `jenis_barang` (
  `id` int(11) NOT NULL,
  `jenis_barang` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `jenis_barang`
--

INSERT INTO `jenis_barang` (`id`, `jenis_barang`) VALUES
(5, 'Makanan'),
(6, 'Minuman'),
(7, 'Obat'),
(8, 'Vaksin'),
(9, 'Ayam');

-- --------------------------------------------------------

--
-- Struktur dari tabel `satuan`
--

CREATE TABLE `satuan` (
  `id` int(11) NOT NULL,
  `satuan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `satuan`
--

INSERT INTO `satuan` (`id`, `satuan`) VALUES
(5, 'Unit'),
(7, 'PCS'),
(9, 'Kg'),
(11, 'Ekor'),
(12, 'Botol');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_supplier`
--

CREATE TABLE `tb_supplier` (
  `id` int(100) NOT NULL,
  `kode_supplier` varchar(100) NOT NULL,
  `nama_supplier` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `telepon` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_supplier`
--

INSERT INTO `tb_supplier` (`id`, `kode_supplier`, `nama_supplier`, `alamat`, `telepon`) VALUES
(11, 'SUP-1222001', 'PT. Ciomas Adisatwa', 'Balong Lombbok, Sumolawang, Kec. Puri, Mojokerto, Jawa Timur', '0318986288');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nik` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `telepon` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `level` varchar(25) NOT NULL DEFAULT 'member',
  `foto` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `nik`, `nama`, `alamat`, `telepon`, `username`, `password`, `level`, `foto`) VALUES
(26, '1001', 'Superadmin', '', '08999444000', 'superadmin', '17c4520f6cfd1ab53d8745e84681eb49', 'superadmin', 'teacher4.png'),
(27, '10001', 'admin', '', '0986660000', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin', '_CPC3217 copy.jpg');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang_keluar`
--
ALTER TABLE `barang_keluar`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `gudang`
--
ALTER TABLE `gudang`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `jenis_barang`
--
ALTER TABLE `jenis_barang`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `satuan`
--
ALTER TABLE `satuan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_supplier`
--
ALTER TABLE `tb_supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `barang_keluar`
--
ALTER TABLE `barang_keluar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `barang_masuk`
--
ALTER TABLE `barang_masuk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `gudang`
--
ALTER TABLE `gudang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `jenis_barang`
--
ALTER TABLE `jenis_barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `satuan`
--
ALTER TABLE `satuan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `tb_supplier`
--
ALTER TABLE `tb_supplier`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
