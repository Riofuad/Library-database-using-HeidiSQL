-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.21-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6369
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for perpustakaan
CREATE DATABASE IF NOT EXISTS `perpustakaan` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `perpustakaan`;

-- Dumping structure for table perpustakaan.buku
CREATE TABLE IF NOT EXISTS `buku` (
  `id_buku` int(20) NOT NULL AUTO_INCREMENT,
  `kode_buku` varchar(20) DEFAULT NULL,
  `judul` varchar(200) NOT NULL,
  `penulis_utama` varchar(250) NOT NULL,
  `penulis_pendamping` varchar(250) NOT NULL,
  `penerbit` varchar(250) NOT NULL,
  `tahun_terbit` year(4) NOT NULL,
  `jumlah` int(10) NOT NULL,
  `id_rak` int(20) NOT NULL,
  PRIMARY KEY (`id_buku`),
  UNIQUE KEY `kode_buku` (`kode_buku`),
  KEY `id_rak` (`id_rak`),
  CONSTRAINT `buku_ibfk_1` FOREIGN KEY (`id_rak`) REFERENCES `rak` (`id_rak`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table perpustakaan.buku: ~12 rows (approximately)
INSERT INTO `buku` (`id_buku`, `kode_buku`, `judul`, `penulis_utama`, `penulis_pendamping`, `penerbit`, `tahun_terbit`, `jumlah`, `id_rak`) VALUES
	(1, '978-623-7351-20-7', 'Your name.', 'Shinkai Makoto', '', 'CV. Haru', '2019', 5, 12),
	(2, '978-602-6383-45-7', 'I want to eat your pancreas', 'Yoru Sumino', 'Idumi Kirihara', 'CV. Haru', '2015', 7, 12),
	(3, '978-623-7351-52-8', 'Blue, painful, and brittle', 'Yoru Sumino', '', 'CV. Haru', '2020', 3, 1),
	(4, '978-623-00-2835-9', 'Boruto : Naruto next generation vol. 10', 'Masashi Kishimoto', 'Mikio Ikemoto, Ukyo Kodachi', 'PT. Elex Media Komputindo', '2020', 10, 4),
	(5, '978-602-06-5336-5', 'Off the record 3 : final chapter', 'Ria SW', '', 'PT. Gramedia Pustaka Utama', '2021', 4, 2),
	(6, '978-623-95545-2-1', 'Pulang-pergi', 'Tere Liye', '', 'PT. Sabak Grip Nusantara', '2021', 6, 10),
	(7, '978-623-241-593-5', 'Burung-burung manyar', 'Y.B. Mangunwijaya', '', 'Kompas Media Nusantara', '1981', 2, 6),
	(8, '978-602-424-004-2', 'IQ84', 'Haruki Murakami', '', 'Kepustakaan Populer Gramedia', '2009', 4, 4),
	(9, '978-602-52547-1-0', 'Another', 'Ayatsuji Yukito', '', 'CV. Haru', '2009', 6, 5),
	(10, '978-623-03-0430-9', 'Re: zero, starting life in another world chapter 2 : a week at the mansion 1', 'Tappei Nagatsuki', 'Makoto Fugetsu, Shinichirou Otsuka', 'M&C!', '2014', 5, 4),
	(11, '978-623-03-0603-7', 'Fate : Strange fake 3', 'Ryohgo Narita', 'Type-Moon', 'M&C!', '2021', 3, 4),
	(12, '978-623-03-0552-8', 'Sword art online 001 aincrad', 'Reki Kawahara', '', 'M&C!', '2021', 7, 3);

-- Dumping structure for table perpustakaan.departemen
CREATE TABLE IF NOT EXISTS `departemen` (
  `id_dep` int(20) NOT NULL AUTO_INCREMENT,
  `kode_dep` varchar(10) NOT NULL,
  `nama_dep` varchar(100) NOT NULL,
  `id_fak` int(20) NOT NULL,
  PRIMARY KEY (`id_dep`),
  UNIQUE KEY `kode_dep` (`kode_dep`),
  KEY `id_fak` (`id_fak`),
  CONSTRAINT `departemen_ibfk_1` FOREIGN KEY (`id_fak`) REFERENCES `fakultas` (`id_fak`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table perpustakaan.departemen: ~6 rows (approximately)
INSERT INTO `departemen` (`id_dep`, `kode_dep`, `nama_dep`, `id_fak`) VALUES
	(1, '1', 'Departemen Matematika', 8),
	(2, '2', 'Departemen Kimia', 8),
	(3, '3', 'Departemen Biologi', 8),
	(4, '4', 'Departemen Fisika', 8),
	(5, '5', 'Departemen Geofisika', 8),
	(6, '6', 'Departemen Statistika', 8);

-- Dumping structure for table perpustakaan.fakultas
CREATE TABLE IF NOT EXISTS `fakultas` (
  `id_fak` int(20) NOT NULL AUTO_INCREMENT,
  `kode_fak` varchar(50) DEFAULT NULL,
  `nama` varchar(255) NOT NULL,
  PRIMARY KEY (`id_fak`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table perpustakaan.fakultas: ~17 rows (approximately)
INSERT INTO `fakultas` (`id_fak`, `kode_fak`, `nama`) VALUES
	(1, 'A', 'Fakultas Ekonomi dan Bisnis'),
	(2, 'B', 'Fakultas Hukum'),
	(3, 'C', 'Fakultas Kedokteran'),
	(4, 'D', 'Fakultas Teknik'),
	(5, 'E', 'Fakultas Ilmu Sosial dan Ilmu Politik'),
	(6, 'F', 'Fakultas Ilmu Budaya'),
	(7, 'G', 'Fakultas Pertanian'),
	(8, 'H', 'Fakultas Matematika dan Ilmu Pengetahuan Alam'),
	(9, 'I', 'Fakultas Peternakan'),
	(10, 'J', 'Fakultas Kedokteran Gigi'),
	(11, 'K', 'Fakultas Kesehatan Masyarakat'),
	(12, 'L', 'Fakultas Ilmu Kelautan dan Perikanan'),
	(13, 'M', 'Fakultas Kehutanan'),
	(14, 'N', 'Fakultas Farmasi'),
	(15, 'P', 'Sekolah Pascasarjana'),
	(16, 'R', 'Fakultas Keperawatan'),
	(17, 'Y', 'Non Fakultas');

-- Dumping structure for table perpustakaan.mahasiswa
CREATE TABLE IF NOT EXISTS `mahasiswa` (
  `id_mhs` int(20) NOT NULL AUTO_INCREMENT,
  `nim` varchar(10) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `no_telp` varchar(12) NOT NULL,
  `email` varchar(100) NOT NULL,
  `alamat` varchar(250) NOT NULL,
  `STATUS` varchar(50) NOT NULL,
  `id_prodi` int(20) NOT NULL,
  PRIMARY KEY (`id_mhs`),
  UNIQUE KEY `nim` (`nim`),
  KEY `id_prodi` (`id_prodi`),
  CONSTRAINT `mahasiswa_ibfk_1` FOREIGN KEY (`id_prodi`) REFERENCES `prodi` (`id_prodi`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table perpustakaan.mahasiswa: ~30 rows (approximately)
INSERT INTO `mahasiswa` (`id_mhs`, `nim`, `nama`, `no_telp`, `email`, `alamat`, `STATUS`, `id_prodi`) VALUES
	(1, 'H071201050', 'Iman Mustika Ismail', '082187196003', 'imanmustika02@gmail.com', 'Jl. Pancasila Selatan No. 2A', '', 4),
	(2, 'H071201010', 'Muhammad Alim Ma\'arij', '087886131448', 'alimmaarij@gmail.com', 'Jl. Tamangapa Raya 3, Komplek Pesona Prima Griya A1/2', '', 4),
	(3, 'H071201005', 'Nur Talitha Putri Hasilawanto', '085145404647', 'nurtalitha.putri@gmail.com', 'Jl. Veteran Selatan', '', 4),
	(4, 'H071201026', 'Inayah Nur Ilahi S.R.', '085756768829', 'inayahnurilahi002@gmail.com', 'Jl. Dahlia Lr.312 No.110', '', 4),
	(5, 'H071201019', 'Risky Auliah Nur Qalbi', '082292716353', 'aulianurqalbi@gmail.com', 'Jl. Andi Tonro 4 BTN Andi Tonro Permai Makassar', '', 4),
	(6, 'H071201015', 'Muh. Barakatuh', '081342994789', 'raka.barakatuh40@gmail.com', 'Jl. Muh. Thahir Komp. Kumala Permai', '', 4),
	(7, 'H071201020', 'Nanda Putri Ramadhani', '082291150069', 'nandaputriir@gmail.com', 'Jl. Berua Raya II, Daya', '', 4),
	(8, 'H071201029', 'Nur Izlammiyah Alim', '085242067997', 'nrizlamiyaaa@gmail.com', 'BTN. Mangga Tiga Blok D16 No.34', '', 4),
	(9, 'H071201028', 'Muhammad Nawwaf Nirwan', '089580103090', 'nawafnirwan@gmail.com', 'Jl. Paccerakkang Perm. Telaga Indah C5', '', 4),
	(10, 'H071201014', 'Muhammad Hairul Fitrah', '081340017440', 'hairulfitrah22@gmail.com', 'Jl. Batua Raya, No.31', '', 4),
	(11, 'H011201001', 'Ainun Qalbi Annur', '089636139681', 'ainunqalbi90@gmail.com', 'Jl. Damai lr.2', '', 1),
	(12, 'H011201002', 'Asfi Saiva', '082318673851', 'asfisaiva01@gmail.com', 'Pondok Iras, jl. Damai', '', 1),
	(13, 'H011201004', 'Nur Fitria Syawalya Usman', '085240221657', 'nurfitriasyawalya1892@gmail.com', 'BTN Sakinah C7 NO. 4', '', 1),
	(14, 'H011201005', 'Ariqah Mumtazah', '082291427681', 'ariqah.muntazah@gmail.com', 'Perum. Graha Lestari Makassar', '', 1),
	(15, 'H011201007', 'Ahmad Mukhayar', '082188608129', 'Mukhayar27@gmail.com', 'Jl. Tamangapa Raya, Makassar', '', 1),
	(16, 'H011201009', 'Nuzulul Qadr TSP', '089510008657', 'nuzultsp@gmail.com', 'Jl. Kecaping Raya', '', 1),
	(17, 'H011201010', 'Ahwanul Sisilia Suci Ramadani', '089604150144', 'ahwanulsisilia4@gmail.com', 'Jl. Paccerakkang', '', 1),
	(18, 'H011201011', 'Moh. Alief Suryabahri', '081356636195', 'alief_27@icloud.com', 'Jl. Perintis Kemerdekaan Km 17', '', 1),
	(19, 'H011201020', 'Muhammad Adil Paturungi', '082198061519', 'Adilflow27@gmail.com', 'Jl. Rappokalling Utara 1', '', 1),
	(20, 'H011201021', 'Afiliani', '085338247042', 'afilianiafy@gmail.com', 'BTN Dewi Kumalasari Blok AF 17 No. 5, Makassar', '', 1),
	(21, 'H081201003', 'Satria Rio Gersia Lomo', '081344251458', 'lomosatria35@gmail.com', 'Biring Romang lr. 3, Ukip', '', 5),
	(22, 'H081201004', 'Muhammad Risafli Raif', '087787776141', 'risafly.rhaif@gmail.com', 'Jl. Tanjung Bunga No. 7A', '', 5),
	(23, 'H081201006', 'Muh. Farid Abdillah', '089695147512', 'abdifuadgagah@gmail.com', 'Jl. Muh. Paleo 2 No. 5A', '', 5),
	(24, 'H081201011', 'Abinizaf Fikra Taim', '0818405092', 'abinizaffikra.taim@gmail.com', 'Jl. Racing Centre', '', 5),
	(25, 'H081201012', 'Yudith Tiara Sasmara', '081243559816', 'yudithtiarasasmara@gmail.com', 'BTP Blok AC', '', 5),
	(26, 'H081201013', 'Rifqah Rahmatul Awaliah', '082334352869', 'rifqahrahmatul2@gmail.com', 'Jl. Tun Abdul Razak', '', 5),
	(27, 'H081201014', 'Nur Indah Fauziah Tahir', '085218557868', 'nurindahfauziahtahir@gmail.com', 'Jl. Nipa-Nipa Lama Perumahan Bukit Manggala Permai Blok B No. 1', '', 5),
	(28, 'H081201017', 'Hana Muthmainnah Sajidah', '082191500262', 'hanamuthmainnahs@gmail.com', 'Jl. Sultan Alauddin, Bumi Bosowa Indah', '', 5),
	(29, 'H081201018', 'Annisa Utami Islami', '085217224734', 'annisautamii02@gmail.com', 'Dyandara Residence Blok C', '', 5),
	(30, 'H081201019', 'Ainiyyah Nugrayana Burhan', '082346122857', 'ainiyyahnugrayana02@gmail.com', 'Perumahan Graha Ria Asri/Puskopolda, Sudiang', '', 5);

-- Dumping structure for table perpustakaan.pegawai
CREATE TABLE IF NOT EXISTS `pegawai` (
  `id_pegawai` int(20) NOT NULL AUTO_INCREMENT,
  `nip` varchar(250) DEFAULT NULL,
  `nama` varchar(250) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_pegawai`),
  UNIQUE KEY `kode` (`nip`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table perpustakaan.pegawai: ~4 rows (approximately)
INSERT INTO `pegawai` (`id_pegawai`, `nip`, `nama`, `status`) VALUES
	(7, '198805042019031012', 'Supri Amir', 'Admin Perpustakaan'),
	(8, '195707051985032001', 'Aidayawati', 'Admin Perpustakaan'),
	(9, '195808021984031002', 'Budi Nurwahyu', 'Kepala Perpustakaan'),
	(10, '199104102020053001', 'Edy Saputra', 'Admin Perpustakaan');

-- Dumping structure for table perpustakaan.peminjaman
CREATE TABLE IF NOT EXISTS `peminjaman` (
  `id_peminjaman` int(20) NOT NULL AUTO_INCREMENT,
  `tgl_pinjam` datetime NOT NULL,
  `tgl_kembali` datetime NOT NULL,
  `id_mhs` int(20) NOT NULL,
  `id_buku` int(20) NOT NULL,
  `id_pegawai` int(20) NOT NULL,
  PRIMARY KEY (`id_peminjaman`),
  KEY `id_mhs` (`id_mhs`),
  KEY `id_buku` (`id_buku`),
  KEY `id_pegawai` (`id_pegawai`),
  CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`id_mhs`) REFERENCES `mahasiswa` (`id_mhs`),
  CONSTRAINT `peminjaman_ibfk_2` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`),
  CONSTRAINT `peminjaman_ibfk_3` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id_pegawai`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table perpustakaan.peminjaman: ~11 rows (approximately)
INSERT INTO `peminjaman` (`id_peminjaman`, `tgl_pinjam`, `tgl_kembali`, `id_mhs`, `id_buku`, `id_pegawai`) VALUES
	(1, '2021-12-04 00:00:00', '2021-12-07 00:00:00', 1, 2, 7),
	(2, '2021-12-04 12:00:00', '2021-12-07 12:00:00', 1, 1, 7),
	(3, '2021-12-04 12:00:00', '2021-12-07 12:00:00', 1, 10, 7),
	(4, '2021-12-03 12:00:00', '2021-12-07 10:00:00', 2, 5, 7),
	(5, '2021-12-05 13:00:00', '2021-12-07 10:00:00', 2, 9, 7),
	(6, '2021-12-05 13:00:00', '2021-12-09 10:00:00', 9, 8, 8),
	(7, '2021-12-05 08:00:00', '2021-12-09 10:00:00', 3, 3, 8),
	(8, '2021-12-06 13:00:00', '2021-12-10 10:00:00', 15, 12, 10),
	(9, '2021-12-07 07:00:00', '2021-12-11 15:00:00', 24, 10, 7),
	(10, '2021-12-08 13:00:00', '2021-12-12 10:00:00', 28, 6, 8),
	(11, '2021-12-09 13:00:00', '2021-12-13 10:00:00', 4, 5, 7);

-- Dumping structure for table perpustakaan.prodi
CREATE TABLE IF NOT EXISTS `prodi` (
  `id_prodi` int(20) NOT NULL AUTO_INCREMENT,
  `kode_prodi` varchar(10) NOT NULL,
  `nama_prodi` varchar(100) NOT NULL,
  `jenjang` varchar(10) NOT NULL,
  `id_dep` int(20) NOT NULL,
  PRIMARY KEY (`id_prodi`),
  UNIQUE KEY `kode_prodi` (`kode_prodi`),
  KEY `id_dep` (`id_dep`),
  CONSTRAINT `prodi_ibfk_1` FOREIGN KEY (`id_dep`) REFERENCES `departemen` (`id_dep`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table perpustakaan.prodi: ~16 rows (approximately)
INSERT INTO `prodi` (`id_prodi`, `kode_prodi`, `nama_prodi`, `jenjang`, `id_dep`) VALUES
	(1, '44201', 'Matematika', 'S1', 1),
	(2, '44101', 'Matematika', 'S2', 1),
	(3, '44002', 'Matematika', 'S3', 1),
	(4, '57201', 'Sistem Informasi', 'S1', 1),
	(5, '94203', 'Aktuaria', 'S1', 1),
	(6, '47201', 'Kimia', 'S1', 2),
	(7, '47101', 'Kimia', 'S2', 2),
	(8, '46201', 'Biologi', 'S1', 3),
	(9, '46101', 'Biologi', 'S2', 3),
	(10, '45201', 'Fisika', 'S1', 4),
	(11, '45102', 'Fisika', 'S2', 4),
	(12, '45001', 'Fisika', 'S3', 4),
	(13, '33201', 'Geofisika', 'S1', 5),
	(14, '33101', 'Geofisika', 'S2', 5),
	(15, '49201', 'Statistika', 'S1', 6),
	(16, '49101', 'Statistika', 'S2', 6);

-- Dumping structure for table perpustakaan.rak
CREATE TABLE IF NOT EXISTS `rak` (
  `id_rak` int(20) NOT NULL AUTO_INCREMENT,
  `nama_rak` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_rak`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table perpustakaan.rak: ~11 rows (approximately)
INSERT INTO `rak` (`id_rak`, `nama_rak`) VALUES
	(1, 'Romance'),
	(2, 'Fanfiction'),
	(3, 'Sci-fi'),
	(4, 'Fantasi'),
	(5, 'Misteri'),
	(6, 'Historical'),
	(7, 'Horror'),
	(8, 'Humor'),
	(9, 'Adventure'),
	(10, 'Action'),
	(11, 'Biografi dan Otobiografi'),
	(12, 'Fiksi');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
