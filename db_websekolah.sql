-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 26 Des 2020 pada 07.45
-- Versi Server: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_websekolah`
--

DELIMITER $$
--
-- Prosedur
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddEbook` (IN `Id` INT(11), IN `Judul` VARCHAR(120), IN `Deskripsi` TEXT, IN `Tanggal_Upload` TIMESTAMP, IN `Oleh` VARCHAR(60), IN `Jumlah_Download` INT(11), IN `File_Data` VARCHAR(120))  NO SQL
INSERT into tbl_files VALUES (Id,Judul,Deskripsi,Tanggal_Upload,Oleh,Jumlah_Dosen,File_Data)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddGuru` (IN `guru_id` INT(11), IN `guru_nip` VARCHAR(30), IN `guru_nama` VARCHAR(70), IN `guru_jenkel` VARCHAR(2), IN `guru_tmp_lahir` VARCHAR(80), IN `guru_tgl_lahir` VARCHAR(80), IN `guru_mapel` VARCHAR(120), IN `guru_photo` VARCHAR(40), IN `guru_tgl_input` TIMESTAMP)  NO SQL
INSERT into tbl_guru VALUES (guru_id,guru_nip,guru_nama,guru_jenkel,guru_tmp_lahir,guru_tgl_lahir,guru_mapel,guru_photo,guru_tgl_input)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddSiswa` (IN `siswa_id` INT(11), IN `siswa_nis` VARCHAR(20), IN `siswa_nama` VARCHAR(70), IN `siswa_jenkel` VARCHAR(2), IN `siswa_kelas_id` INT(11), IN `siswa_photo` VARCHAR(40))  NO SQL
INSERT into tbl_siswa VALUES (siswa_id,siswa_nis,siswa_nama,siswa_jenkel,siswa_kelas_id,siswa_photo)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `JumlahEbook` (OUT `jml_ebook` INT)  NO SQL
SELECT COUNT(file_id)
	INTO jml_ebook
	FROM tbl_files$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `JumlahGuru` (OUT `jml_guru` INT)  NO SQL
SELECT COUNT(guru_nip)
	INTO jml_guru
	FROM tbl_guru$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateJmlDownload` (IN `Id_File` INT, IN `Jumlah_Download` INT)  NO SQL
UPDATE tbl_files set file_download = file_download + Jumlah_Download where Id_FIle = file_id$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_agenda`
--

CREATE TABLE `tbl_agenda` (
  `agenda_id` int(11) NOT NULL,
  `agenda_nama` varchar(200) DEFAULT NULL,
  `agenda_tanggal` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `agenda_deskripsi` text,
  `agenda_mulai` date DEFAULT NULL,
  `agenda_selesai` date DEFAULT NULL,
  `agenda_tempat` varchar(90) DEFAULT NULL,
  `agenda_waktu` varchar(30) DEFAULT NULL,
  `agenda_keterangan` varchar(200) DEFAULT NULL,
  `agenda_author` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_album`
--

CREATE TABLE `tbl_album` (
  `album_id` int(11) NOT NULL,
  `album_nama` varchar(50) DEFAULT NULL,
  `album_tanggal` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `album_pengguna_id` int(11) DEFAULT NULL,
  `album_author` varchar(60) DEFAULT NULL,
  `album_count` int(11) DEFAULT '0',
  `album_cover` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_album`
--

INSERT INTO `tbl_album` (`album_id`, `album_nama`, `album_tanggal`, `album_pengguna_id`, `album_author`, `album_count`, `album_cover`) VALUES
(6, 'Gedung Yayasan An-Nadhir', '2020-11-11 06:16:27', 5, 'SMP NU LOSARANG', 3, '72aa665b0316de261b76be527557e447.jpg'),
(7, 'Pengajar', '2020-11-11 06:22:11', 5, 'SMP NU LOSARANG', 1, '0f60e15c1c7e5abae444ce48923b6c21.jpg'),
(8, 'Murid', '2020-11-11 06:24:22', 5, 'SMP NU LOSARANG', 8, '224ad30e8b03c60059eaaaafe48f67b9.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_files`
--

CREATE TABLE `tbl_files` (
  `file_id` int(11) NOT NULL,
  `file_judul` varchar(120) DEFAULT NULL,
  `file_deskripsi` text,
  `file_tanggal` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `file_oleh` varchar(60) DEFAULT NULL,
  `file_download` int(11) DEFAULT '0',
  `file_data` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_files`
--

INSERT INTO `tbl_files` (`file_id`, `file_judul`, `file_deskripsi`, `file_tanggal`, `file_oleh`, `file_download`, `file_data`) VALUES
(2, 'Dasar-dasar CSS', 'Modul dasar-dasar CSS 3. Modul ini membantu anda untuk memahami struktur dasar CSS', '2017-01-23 04:30:01', 'Drs. Joko', 10, 'ab9a183ff240deadbedaff78e639af2f.pdf'),
(3, '14 Teknik Komunikasi Yang Paling Efektif', 'Ebook 14 teknik komunikasi paling efektif membantu anda untuk berkomunikasi dengan baik dan benar', '2017-01-23 15:26:06', 'Drs. Joko', 0, 'ab2cb34682bd94f30f2347523112ffb9.pdf'),
(4, 'Bagaimana Membentuk Pola Pikir yang Baru', 'Ebook ini membantu anda membentuk pola pikir baru.', '2017-01-23 15:27:07', 'Drs. Joko', 0, '30f588eb5c55324f8d18213f11651855.pdf'),
(5, '7 Tips Penting mengatasi Kritik', '7 Tips Penting mengatasi Kritik', '2017-01-23 15:27:44', 'Drs. Joko', 0, '329a62b25ad475a148e1546aa3db41de.docx'),
(6, '8 Racun dalam kehidupan kita', '8 Racun dalam kehidupan kita', '2017-01-23 15:28:17', 'Drs. Joko', 0, '8e38ad4948ba13758683dea443fbe6be.docx'),
(7, 'Jurnal Teknolgi Informasi', 'Jurnal Teknolgi Informasi', '2017-01-25 03:18:53', 'Gunawan, S.Pd', 0, '87ae0f009714ddfdd79e2977b2a64632.pdf'),
(8, 'Jurnal Teknolgi Informasi 2', 'Jurnal Teknolgi Informasi', '2017-01-25 03:19:22', 'Gunawan, S.Pd', 0, 'c4e966ba2c6e142155082854dc5b3602.pdf'),
(9, 'Naskah Publikasi IT', 'Naskah Teknolgi Informasi', '2017-01-25 03:21:04', 'Gunawan, S.Pd', 0, '71380b3cf16a17a02382098c028ece9c.pdf'),
(10, 'Modul Teknologi Informasi', 'Modul Teknologi Informasi', '2017-01-25 03:22:08', 'Gunawan, S.Pd', 0, '029143a3980232ab2900d94df36dbb0c.pdf'),
(11, 'Modul Teknologi Informasi Part II', 'Modul Teknologi Informasi', '2017-01-25 03:22:54', 'Gunawan, S.Pd', 0, 'ea8f3f732576083156e509657614f551.pdf'),
(12, 'Modul Teknologi Informasi Part III', 'Modul Teknologi Informasi', '2017-01-25 03:23:21', 'Gunawan, S.Pd', 0, 'c5e5e7d16e4cd6c3d22c11f64b0db2af.pdf'),
(13, 'Algoritma', 'Apa itu algoritma', '2020-11-13 01:40:34', 'Delia', 0, 'b544a401a19e56d7c7a07c251558e199.docx');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_galeri`
--

CREATE TABLE `tbl_galeri` (
  `galeri_id` int(11) NOT NULL,
  `galeri_judul` varchar(60) DEFAULT NULL,
  `galeri_tanggal` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `galeri_gambar` varchar(40) DEFAULT NULL,
  `galeri_album_id` int(11) DEFAULT NULL,
  `galeri_pengguna_id` int(11) DEFAULT NULL,
  `galeri_author` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_galeri`
--

INSERT INTO `tbl_galeri` (`galeri_id`, `galeri_judul`, `galeri_tanggal`, `galeri_gambar`, `galeri_album_id`, `galeri_pengguna_id`, `galeri_author`) VALUES
(4, 'Diskusi Pemilihan Ketua Osis', '2017-01-21 14:04:53', '9b10fa300633f62f105e9b52789fc8f3.jpg', 3, 1, 'M Fikri Setiadi'),
(5, 'Panitia Pemilu Osis', '2017-01-22 04:13:20', '0ec0c2f9aae6501d7ed7930995d48b57.jpg', 3, 1, 'M Fikri Setiadi'),
(6, 'Proses Pemilu Osis', '2017-01-22 04:13:43', 'bfbe6cc1c8096f5f36c68e93da53c248.jpg', 3, 1, 'M Fikri Setiadi'),
(7, 'Belajar dengan native speaker', '2017-01-24 01:26:22', '831e5ad43ccc3c851d50c128ff095541.jpg', 1, 1, 'M Fikri Setiadi'),
(8, 'Diskusi dengan native speaker', '2017-01-24 01:27:05', '84afbf1d3ad45932f1d7ac47b8a00949.jpg', 1, 1, 'M Fikri Setiadi'),
(9, 'Foto bareng native speaker', '2017-01-24 01:27:28', 'a99ab060d5d5bf8c96f24fe385f7dd8b.jpg', 1, 1, 'M Fikri Setiadi'),
(10, 'Foto bareng native speaker', '2017-01-24 01:28:40', 'd70cedba6391b7b3c74b914efd82953f.jpg', 1, 1, 'M Fikri Setiadi'),
(11, 'Foto bareng native speaker', '2017-01-24 01:28:54', '10de99f425b9961ce1e87c5e5575f8f4.jpg', 1, 1, 'M Fikri Setiadi'),
(12, 'Belajar sambil bermain', '2017-01-24 01:31:42', '9df82241493b94d1e06b461129cf57b2.jpg', 4, 1, 'M Fikri Setiadi'),
(13, 'Belajar sambil bermain', '2017-01-24 01:31:55', '5374415f11683ad6dd31572a7bbf8a7b.jpg', 4, 1, 'M Fikri Setiadi'),
(14, 'Belajar komputer programming', '2017-01-24 01:32:24', '82b91bd35706b21c3ab04e205e358eb6.jpg', 4, 1, 'M Fikri Setiadi'),
(15, 'Belajar komputer programming', '2017-01-24 01:32:34', '93048f2a103987bce8c8ec8d6912de06.jpg', 4, 1, 'M Fikri Setiadi'),
(16, 'Belajar komputer programming', '2017-01-24 01:32:44', '41f46be181f2f8452c2041b5e79a05a5.jpg', 4, 1, 'M Fikri Setiadi'),
(17, 'Belajar sambil bermain', '2017-01-24 01:33:08', '2858b0555c252690e293d29b922ba8e6.jpg', 4, 1, 'M Fikri Setiadi'),
(18, 'Makan bersama', '2017-01-24 01:33:24', '90d67328e33a31d3f5eecd7dcb25b55d.jpg', 4, 1, 'M Fikri Setiadi'),
(19, 'Gapura', '2020-11-11 06:18:36', '55710371f32ec550facaca8a796d2aa6.jpg', 6, 5, 'SMP NU LOSARANG'),
(20, 'Lapangan', '2020-11-11 06:19:22', '93fdd237f2acd5599b8d92d1724b8905.jpg', 6, 5, 'SMP NU LOSARANG'),
(21, 'Masjid', '2020-11-11 06:20:30', '691b3f84d08d2412856b3f14459d42a9.jpg', 6, 5, 'SMP NU LOSARANG'),
(25, 'Guru', '2020-11-11 06:22:32', '26592e960fd058807422d34e420eecb3.jpg', 7, 5, 'SMP NU LOSARANG'),
(26, 'Kegiatan Murid', '2020-11-11 06:27:05', '3fa14f09d2ec2007b99cbadcd95590a8.jpg', 8, 5, 'SMP NU LOSARANG'),
(27, 'Kegiatan Murid', '2020-11-11 06:27:35', '1755893a8a9b057da63b8d332faab808.jpg', 8, 5, 'SMP NU LOSARANG'),
(28, 'Kegiatan Murid', '2020-11-11 06:28:09', '86858a9f686753686f50cfc6507e45ec.jpg', 8, 5, 'SMP NU LOSARANG'),
(29, 'Kegiatan Murid', '2020-11-11 06:28:24', 'e9c45bb29db3f2c57e0859ba2ef90811.jpg', 8, 5, 'SMP NU LOSARANG'),
(30, 'Maulid', '2020-11-11 06:29:55', 'c14d9eaf2fde17826c5dbc788869b283.jpg', 8, 5, 'SMP NU LOSARANG'),
(31, 'Upacara', '2020-11-11 06:30:09', 'e93cd5a4750b89ae98c57bd4574b5af4.jpg', 8, 5, 'SMP NU LOSARANG'),
(32, 'Mengaji Bersama', '2020-11-11 06:30:28', 'e02ecff957bba6c7c04e276aa52a5ca0.jpg', 8, 5, 'SMP NU LOSARANG'),
(33, 'Studytour', '2020-11-11 06:30:41', 'd0f81662b4378d30b1dd0fd2dc5272e0.jpg', 8, 5, 'SMP NU LOSARANG');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_guru`
--

CREATE TABLE `tbl_guru` (
  `guru_id` int(11) NOT NULL,
  `guru_nip` varchar(30) DEFAULT NULL,
  `guru_nama` varchar(70) DEFAULT NULL,
  `guru_jenkel` varchar(2) DEFAULT NULL,
  `guru_tmp_lahir` varchar(80) DEFAULT NULL,
  `guru_tgl_lahir` varchar(80) DEFAULT NULL,
  `guru_mapel` varchar(120) DEFAULT NULL,
  `guru_photo` varchar(40) DEFAULT NULL,
  `guru_tgl_input` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_guru`
--

INSERT INTO `tbl_guru` (`guru_id`, `guru_nip`, `guru_nama`, `guru_jenkel`, `guru_tmp_lahir`, `guru_tgl_lahir`, `guru_mapel`, `guru_photo`, `guru_tgl_input`) VALUES
(9, '6636763664120002', 'Agung Rohmadi', 'L', 'Indramayu', '04 Maret 1985', 'Kepala Sekolah', 'b78a0826cbaa357bc4bcdbb5cf4ef778.jpg', '2020-11-06 03:18:34'),
(10, '1133760662110063', 'Agus Sukara', 'L', 'Indramayu', '01 Agustus 1982', 'IPS dan PPKn', NULL, '2020-11-06 03:21:12'),
(11, '-', 'Alfiyah', 'P', 'Indramayu', '17 Maret 1988', '-', NULL, '2020-11-06 03:23:52'),
(12, '5835763664120002', 'Aminudin', 'L', 'Indramayu', '03 Mei 1985', 'Pendidikan Agama Islam dan Budi Pekerti', 'b42f7b699d6790de07ea8a0b21c1d789.jpg', '2020-11-06 03:26:24'),
(13, '2251758661120003', 'Ari Andriana', 'L', 'Indramayu', '19 September 1980', '-', NULL, '2020-11-06 03:28:35'),
(14, '1554770671130063', 'Ayu Candradewi', 'P', 'Indramayu', '22 Desember 1992', 'IPS', NULL, '2020-11-06 03:30:29'),
(15, '-', 'Cawu', 'L', 'Indramayu', '15 Februari 1987', 'Bahasa Inggris', '6a204941cc55ffb2666be8ad1fa11358.jpg', '2020-11-06 03:32:33'),
(16, '5142768669120003', 'Dawud Supriyatno', 'L', 'Indramayu', '10 Agustus 1990', '-', '9b8a93b957c7ea5cd08560b875de81bf.jpg', '2020-11-06 03:34:47'),
(17, '-', 'Dori', 'L', 'Indramayu', '21 September 1970', 'Tenaga Administrasi Sekolah', NULL, '2020-11-06 03:45:51'),
(18, '8457771672130033', 'Faisal Anwar', 'L', 'Indramayu', '25 November 1993', 'BK', '7fe21ed69fc720b12f2ba0feae5d5c53.jpg', '2020-11-06 03:47:52'),
(19, '-', 'Hikmaliyah', 'P', 'Indramayu', '03 Maret 2000', 'Tenaga Administrasi Sekolah', NULL, '2020-11-06 03:49:43'),
(21, '1060771672130053', 'JULYANI DWI ASTUTI', 'P', 'Indramayu', '28 Juli 1995', 'IPAS', 'bc45314814a34c984e1918cf2aa55349.jpg', '2020-11-06 04:22:56'),
(22, '-', 'MAESYAROH JATININGRUM', 'P', 'Indramayu', '26 Juni 1995', 'PAI', NULL, '2020-11-06 04:24:26'),
(23, '0738769670130092', 'Mia Afriliani', 'P', 'Indramayu', '06 April 1991', 'Bahasa Indonesia', '1bf60f35d41aeac1d15660023cef5123.jpg', '2020-11-06 04:25:59'),
(24, '9457767669130133', 'Nopiyanto', 'L', 'Indramayu', '25 November 1989', 'IPAS', '3442bfc787df337bcc3e323a4f280a88.jpg', '2020-11-06 04:27:13'),
(25, '-', 'NURMALA YUNITA', 'P', 'Jakarta', '19 November 1995', '-', NULL, '2020-11-06 04:28:25'),
(26, '-', 'Taniroh', 'P', 'Indramayu', '01 Desember 1992', 'Matematika', NULL, '2020-11-06 04:29:31'),
(27, '2153766667120003', 'Taufik Hidayat', 'L', 'Indramayu', '21 Oktober 1988', '-', NULL, '2020-11-06 04:30:58'),
(28, '0748771672130052', 'Ushfatunnisa Sundysia', 'P', 'Indramayu', '16 April 1993', 'PJOK', NULL, '2020-11-06 04:32:04');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_inbox`
--

CREATE TABLE `tbl_inbox` (
  `inbox_id` int(11) NOT NULL,
  `inbox_nama` varchar(40) DEFAULT NULL,
  `inbox_email` varchar(60) DEFAULT NULL,
  `inbox_kontak` varchar(20) DEFAULT NULL,
  `inbox_pesan` text,
  `inbox_tanggal` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `inbox_status` int(11) DEFAULT '1' COMMENT '1=Belum dilihat, 0=Telah dilihat'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_inbox`
--

INSERT INTO `tbl_inbox` (`inbox_id`, `inbox_nama`, `inbox_email`, `inbox_kontak`, `inbox_pesan`, `inbox_tanggal`, `inbox_status`) VALUES
(9, 'Delia Meta Putri', 'deliametaputri05@gmail.com', '0895341160998', 'Sangat baik', '2020-11-23 05:08:13', 0),
(10, 'delia', 'deliametaputri05@gmail.com', '0895341160998', 'hello world', '2020-12-03 03:08:28', 0),
(11, 'indah', 'indah@gmail.com', '112333', 'assalamualaikum', '2020-12-22 01:59:57', 0),
(12, 'fsaf', 'asds@gmail.com', '112333', 'asfsaff', '2020-12-22 02:04:17', 0),
(13, 'meta', 'meta@gmail.com', '1233333', 'hello world', '2020-12-26 05:05:24', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_kategori`
--

CREATE TABLE `tbl_kategori` (
  `kategori_id` int(11) NOT NULL,
  `kategori_nama` varchar(30) DEFAULT NULL,
  `kategori_tanggal` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_kategori`
--

INSERT INTO `tbl_kategori` (`kategori_id`, `kategori_nama`, `kategori_tanggal`) VALUES
(1, 'Pendidikan', '2016-09-06 05:49:04'),
(2, 'Politik', '2016-09-06 05:50:01'),
(3, 'Sains', '2016-09-06 05:59:39'),
(5, 'Penelitian', '2016-09-06 06:19:26'),
(6, 'Prestasi', '2016-09-07 02:51:09'),
(13, 'Olah Raga', '2017-01-13 13:20:31');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_kelas`
--

CREATE TABLE `tbl_kelas` (
  `kelas_id` int(11) NOT NULL,
  `kelas_nama` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_kelas`
--

INSERT INTO `tbl_kelas` (`kelas_id`, `kelas_nama`) VALUES
(1, 'Kelas 7A'),
(2, 'Kelas 7B'),
(3, 'Kelas 8A'),
(4, 'Kelas 8B'),
(5, 'Kelas 9A');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_komentar`
--

CREATE TABLE `tbl_komentar` (
  `komentar_id` int(11) NOT NULL,
  `komentar_nama` varchar(30) DEFAULT NULL,
  `komentar_email` varchar(50) DEFAULT NULL,
  `komentar_isi` varchar(120) DEFAULT NULL,
  `komentar_tanggal` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `komentar_status` varchar(2) DEFAULT NULL,
  `komentar_tulisan_id` int(11) DEFAULT NULL,
  `komentar_parent` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_komentar`
--

INSERT INTO `tbl_komentar` (`komentar_id`, `komentar_nama`, `komentar_email`, `komentar_isi`, `komentar_tanggal`, `komentar_status`, `komentar_tulisan_id`, `komentar_parent`) VALUES
(1, 'M Fikri', 'fikrifiver97@gmail.com', ' Nice Post.', '2018-08-07 15:09:07', '1', 24, 0),
(2, 'M Fikri Setiadi', 'fikrifiver97@gmail.com', ' Awesome Post', '2018-08-07 15:14:26', '1', 24, 0),
(3, 'Joko', 'joko@gmail.com', 'Thank you.', '2018-08-08 03:54:56', '1', 24, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_log_aktivitas`
--

CREATE TABLE `tbl_log_aktivitas` (
  `log_id` int(11) NOT NULL,
  `log_nama` text,
  `log_tanggal` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `log_ip` varchar(20) DEFAULT NULL,
  `log_pengguna_id` int(11) DEFAULT NULL,
  `log_icon` blob,
  `log_jenis_icon` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_pengguna`
--

CREATE TABLE `tbl_pengguna` (
  `pengguna_id` int(11) NOT NULL,
  `pengguna_nama` varchar(50) DEFAULT NULL,
  `pengguna_moto` varchar(100) DEFAULT NULL,
  `pengguna_jenkel` varchar(2) DEFAULT NULL,
  `pengguna_username` varchar(30) DEFAULT NULL,
  `pengguna_password` varchar(35) DEFAULT NULL,
  `pengguna_tentang` text,
  `pengguna_email` varchar(50) DEFAULT NULL,
  `pengguna_nohp` varchar(20) DEFAULT NULL,
  `pengguna_facebook` varchar(35) DEFAULT NULL,
  `pengguna_twitter` varchar(35) DEFAULT NULL,
  `pengguna_linkdin` varchar(35) DEFAULT NULL,
  `pengguna_google_plus` varchar(35) DEFAULT NULL,
  `pengguna_status` int(2) DEFAULT '1',
  `pengguna_level` varchar(3) DEFAULT NULL,
  `pengguna_register` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `pengguna_photo` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_pengguna`
--

INSERT INTO `tbl_pengguna` (`pengguna_id`, `pengguna_nama`, `pengguna_moto`, `pengguna_jenkel`, `pengguna_username`, `pengguna_password`, `pengguna_tentang`, `pengguna_email`, `pengguna_nohp`, `pengguna_facebook`, `pengguna_twitter`, `pengguna_linkdin`, `pengguna_google_plus`, `pengguna_status`, `pengguna_level`, `pengguna_register`, `pengguna_photo`) VALUES
(5, 'SMP NU LOSARANG', NULL, 'P', 'admin', 'd56b699830e77ba53855679cb1d252da', NULL, 'deliametaputri05@gmail.com', '08912345678', NULL, NULL, NULL, NULL, 1, '1', '2020-10-23 07:56:57', '94c3efc49f48254f2138f38d188589d1.jpeg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_pengumuman`
--

CREATE TABLE `tbl_pengumuman` (
  `pengumuman_id` int(11) NOT NULL,
  `pengumuman_judul` varchar(150) DEFAULT NULL,
  `pengumuman_deskripsi` text,
  `pengumuman_tanggal` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `pengumuman_author` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_pengunjung`
--

CREATE TABLE `tbl_pengunjung` (
  `pengunjung_id` int(11) NOT NULL,
  `pengunjung_tanggal` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `pengunjung_ip` varchar(40) DEFAULT NULL,
  `pengunjung_perangkat` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_pengunjung`
--

INSERT INTO `tbl_pengunjung` (`pengunjung_id`, `pengunjung_tanggal`, `pengunjung_ip`, `pengunjung_perangkat`) VALUES
(930, '2018-08-09 08:04:59', '::1', 'Chrome'),
(931, '2020-10-18 10:45:44', '::1', 'Chrome'),
(932, '2020-10-22 00:49:53', '::1', 'Chrome'),
(933, '2020-10-23 07:44:54', '::1', 'Chrome'),
(934, '2020-11-06 02:44:24', '::1', 'Chrome'),
(935, '2020-11-13 00:45:36', '::1', 'Chrome'),
(936, '2020-11-23 03:34:20', '::1', 'Chrome'),
(937, '2020-11-30 12:43:37', '::1', 'Chrome'),
(938, '2020-12-03 02:59:34', '::1', 'Chrome'),
(939, '2020-12-05 10:05:53', '::1', 'Chrome'),
(940, '2020-12-05 10:05:53', '::1', 'Chrome'),
(941, '2020-12-11 02:55:43', '::1', 'Chrome'),
(942, '2020-12-12 08:55:10', '::1', 'Chrome'),
(943, '2020-12-17 04:05:42', '::1', 'Chrome'),
(944, '2020-12-21 07:02:01', '::1', 'Chrome'),
(945, '2020-12-22 01:44:21', '::1', 'Chrome'),
(946, '2020-12-23 06:29:15', '127.0.0.1', 'Chrome'),
(947, '2020-12-23 06:29:46', '::1', 'Chrome'),
(948, '2020-12-26 03:58:43', '::1', 'Chrome');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_siswa`
--

CREATE TABLE `tbl_siswa` (
  `siswa_id` int(11) NOT NULL,
  `siswa_nis` varchar(20) DEFAULT NULL,
  `siswa_nama` varchar(70) DEFAULT NULL,
  `siswa_jenkel` varchar(2) DEFAULT NULL,
  `siswa_kelas_id` int(11) DEFAULT NULL,
  `siswa_photo` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_siswa`
--

INSERT INTO `tbl_siswa` (`siswa_id`, `siswa_nis`, `siswa_nama`, `siswa_jenkel`, `siswa_kelas_id`, `siswa_photo`) VALUES
(3, '1903037', 'Delia Meta Putri', 'L', 1, '891426277c5b66971f34220fb588b0f0.jpeg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_testimoni`
--

CREATE TABLE `tbl_testimoni` (
  `testimoni_id` int(11) NOT NULL,
  `testimoni_nama` varchar(30) DEFAULT NULL,
  `testimoni_isi` varchar(120) DEFAULT NULL,
  `testimoni_email` varchar(35) DEFAULT NULL,
  `testimoni_tanggal` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_tulisan`
--

CREATE TABLE `tbl_tulisan` (
  `tulisan_id` int(11) NOT NULL,
  `tulisan_judul` varchar(100) DEFAULT NULL,
  `tulisan_isi` text,
  `tulisan_tanggal` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `tulisan_kategori_id` int(11) DEFAULT NULL,
  `tulisan_kategori_nama` varchar(30) DEFAULT NULL,
  `tulisan_views` int(11) DEFAULT '0',
  `tulisan_gambar` varchar(40) DEFAULT NULL,
  `tulisan_pengguna_id` int(11) DEFAULT NULL,
  `tulisan_author` varchar(40) DEFAULT NULL,
  `tulisan_img_slider` int(2) NOT NULL DEFAULT '0',
  `tulisan_slug` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_agenda`
--
ALTER TABLE `tbl_agenda`
  ADD PRIMARY KEY (`agenda_id`);

--
-- Indexes for table `tbl_album`
--
ALTER TABLE `tbl_album`
  ADD PRIMARY KEY (`album_id`),
  ADD KEY `album_pengguna_id` (`album_pengguna_id`);

--
-- Indexes for table `tbl_files`
--
ALTER TABLE `tbl_files`
  ADD PRIMARY KEY (`file_id`);

--
-- Indexes for table `tbl_galeri`
--
ALTER TABLE `tbl_galeri`
  ADD PRIMARY KEY (`galeri_id`),
  ADD KEY `galeri_album_id` (`galeri_album_id`),
  ADD KEY `galeri_pengguna_id` (`galeri_pengguna_id`);

--
-- Indexes for table `tbl_guru`
--
ALTER TABLE `tbl_guru`
  ADD PRIMARY KEY (`guru_id`);

--
-- Indexes for table `tbl_inbox`
--
ALTER TABLE `tbl_inbox`
  ADD PRIMARY KEY (`inbox_id`);

--
-- Indexes for table `tbl_kategori`
--
ALTER TABLE `tbl_kategori`
  ADD PRIMARY KEY (`kategori_id`);

--
-- Indexes for table `tbl_kelas`
--
ALTER TABLE `tbl_kelas`
  ADD PRIMARY KEY (`kelas_id`);

--
-- Indexes for table `tbl_komentar`
--
ALTER TABLE `tbl_komentar`
  ADD PRIMARY KEY (`komentar_id`),
  ADD KEY `komentar_tulisan_id` (`komentar_tulisan_id`);

--
-- Indexes for table `tbl_log_aktivitas`
--
ALTER TABLE `tbl_log_aktivitas`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `log_pengguna_id` (`log_pengguna_id`);

--
-- Indexes for table `tbl_pengguna`
--
ALTER TABLE `tbl_pengguna`
  ADD PRIMARY KEY (`pengguna_id`);

--
-- Indexes for table `tbl_pengumuman`
--
ALTER TABLE `tbl_pengumuman`
  ADD PRIMARY KEY (`pengumuman_id`);

--
-- Indexes for table `tbl_pengunjung`
--
ALTER TABLE `tbl_pengunjung`
  ADD PRIMARY KEY (`pengunjung_id`);

--
-- Indexes for table `tbl_siswa`
--
ALTER TABLE `tbl_siswa`
  ADD PRIMARY KEY (`siswa_id`);

--
-- Indexes for table `tbl_testimoni`
--
ALTER TABLE `tbl_testimoni`
  ADD PRIMARY KEY (`testimoni_id`);

--
-- Indexes for table `tbl_tulisan`
--
ALTER TABLE `tbl_tulisan`
  ADD PRIMARY KEY (`tulisan_id`),
  ADD KEY `tulisan_kategori_id` (`tulisan_kategori_id`),
  ADD KEY `tulisan_pengguna_id` (`tulisan_pengguna_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_agenda`
--
ALTER TABLE `tbl_agenda`
  MODIFY `agenda_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_album`
--
ALTER TABLE `tbl_album`
  MODIFY `album_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `tbl_files`
--
ALTER TABLE `tbl_files`
  MODIFY `file_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `tbl_galeri`
--
ALTER TABLE `tbl_galeri`
  MODIFY `galeri_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `tbl_guru`
--
ALTER TABLE `tbl_guru`
  MODIFY `guru_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `tbl_inbox`
--
ALTER TABLE `tbl_inbox`
  MODIFY `inbox_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `tbl_kategori`
--
ALTER TABLE `tbl_kategori`
  MODIFY `kategori_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `tbl_kelas`
--
ALTER TABLE `tbl_kelas`
  MODIFY `kelas_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tbl_komentar`
--
ALTER TABLE `tbl_komentar`
  MODIFY `komentar_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tbl_log_aktivitas`
--
ALTER TABLE `tbl_log_aktivitas`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_pengguna`
--
ALTER TABLE `tbl_pengguna`
  MODIFY `pengguna_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tbl_pengumuman`
--
ALTER TABLE `tbl_pengumuman`
  MODIFY `pengumuman_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_pengunjung`
--
ALTER TABLE `tbl_pengunjung`
  MODIFY `pengunjung_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=949;
--
-- AUTO_INCREMENT for table `tbl_siswa`
--
ALTER TABLE `tbl_siswa`
  MODIFY `siswa_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tbl_testimoni`
--
ALTER TABLE `tbl_testimoni`
  MODIFY `testimoni_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_tulisan`
--
ALTER TABLE `tbl_tulisan`
  MODIFY `tulisan_id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
