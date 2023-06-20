-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 20, 2023 at 02:20 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpus`
--

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `judul` varchar(255) DEFAULT NULL,
  `genre` enum('Agama','Fantasi','Filsafat','Pendidikan','Psikologi','Sains','Sejarah','Self-Improvement','Teknologi') DEFAULT NULL,
  `ISBN` varchar(20) NOT NULL,
  `pengarang` varchar(255) DEFAULT NULL,
  `penerbit` varchar(255) DEFAULT NULL,
  `status_pinjam` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`judul`, `genre`, `ISBN`, `pengarang`, `penerbit`, `status_pinjam`) VALUES
('1,227 FACTS To Blow Your Socks Off', 'Pendidikan', '9780571297917', 'John Lloyd', 'Faber and Faber Ltd', 1),
('The War of The Worlds', 'Fantasi', '9780857754202', 'Herbert George Wells', 'Flame Tree 451', 0),
('Atomic Habits', 'Self-Improvement', '9786020633176', 'James Clear', 'Gramedia Pustaka Utama', 1),
('Thinking, Fast and Slow', 'Pendidikan', '9786020637181', 'Daniel Kahneman', 'Gramedia Pustaka Utama', 1),
('Sang Alkemis', 'Fantasi', '9786020656069', 'Paulo Coelho', 'Gramedia Pustaka Utama', 1),
('Kosmos', 'Sains', '9786024242244', 'Carl Sagan', 'Kepustakaan Populer Gramedia', 1),
('Sapiens', 'Sejarah', '9786024244163', 'Yuval Noah Harari', 'Kepustakaan Populer Gramedia', 0),
('Kartun Kalkulus', 'Sains', '9786024816209', 'Larry Gonick', 'Kepustakaan Populer Gramedia', 0),
('Pengantar Filsafat', 'Filsafat', '9786025644566', 'George Stuart Fullerton', 'Indoliterasi', 1),
('The Metamorphosis', 'Fantasi', '9786025868399', 'Franz Kafka', 'Immortal Publishing', 0),
('Deep Work', 'Self-Improvement', '9786230020780', 'Cal Newport', 'PT Elex Media Komputindo', 1),
('Time Machine', 'Fantasi', '9788027274376', 'Herbert George Wells', 'Octopus', 0);

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nama` varchar(255) DEFAULT NULL,
  `NIM` varchar(9) NOT NULL,
  `fakultas` enum('Ekonomi','FKIP','Hukum','Pertanian','Psikologi','Teknik') DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `no_telp` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`nama`, `NIM`, `fakultas`, `tanggal_lahir`, `no_telp`) VALUES
('Magnus Carlsen', '202151001', 'Teknik', '1990-11-30', '081227534314'),
('Febriyan Naufal Ahza', '202151191', 'Teknik', '2003-02-23', '081227044314'),
('Anatoly Karpov', '202251001', 'Psikologi', '1951-05-23', '081234567899'),
('Viswanathan Anand', '202251002', 'Teknik', '1969-12-11', '081234567890'),
('Harry Potter', '202251012', 'Teknik', '1980-07-31', '081234567800'),
('Judith Polgar', '202252003', 'Ekonomi', '1976-07-23', '081234567891'),
('Hermione Granger', '202252013', 'Ekonomi', '1979-09-19', '081234567801'),
('Garry Kasparov', '202253004', 'Hukum', '1963-04-13', '081234567892'),
('Ron Weasley', '202253014', 'Hukum', '1980-03-01', '081234567802'),
('Hou Yifan', '202254005', 'Pertanian', '1994-02-27', '081234567893'),
('Draco Malfoy', '202254015', 'Pertanian', '1980-06-05', '081234567803'),
('Vladimir Kramnik', '202255006', 'Psikologi', '1975-06-25', '081234567894'),
('Luna Lovegood', '202255016', 'Psikologi', '1981-02-13', '081234567804'),
('Fabiano Caruana', '202256007', 'Teknik', '1992-07-30', '081234567895'),
('Judit Polgar', '202257008', 'Ekonomi', '1976-07-23', '081234567896'),
('Veselin Topalov', '202258009', 'FKIP', '1975-03-15', '081234567897'),
('Vishy Anand', '202259010', 'Pertanian', '1969-12-11', '081234567898');

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_pinjam` int(11) NOT NULL,
  `ISBN` varchar(20) DEFAULT NULL,
  `NIM` varchar(9) DEFAULT NULL,
  `tanggal_pinjam` date DEFAULT NULL,
  `tanggal_kembali` date DEFAULT NULL,
  `status_kembali` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`id_pinjam`, `ISBN`, `NIM`, `tanggal_pinjam`, `tanggal_kembali`, `status_kembali`) VALUES
(1, '9786230020780', '202151001', '2022-09-03', '2022-09-10', 0),
(2, '9786020633176', '202251002', '2022-09-08', '2022-09-15', 1),
(3, '9786020656069', '202252003', '2022-09-13', '2022-09-20', 1),
(4, '9786024242244', '202253004', '2022-09-18', '2022-09-25', 1),
(5, '9786020637181', '202254005', '2022-09-23', '2022-09-30', 1),
(6, '9786020656069', '202255006', '2022-09-28', '2022-10-05', 0),
(7, '9786024244163', '202256007', '2022-10-03', '2022-10-10', 1),
(8, '9786024816209', '202257008', '2022-10-08', '2022-10-15', 1),
(9, '9786025644566', '202258009', '2022-10-13', '2022-10-20', 0),
(10, '9786025868399', '202259010', '2022-10-18', '2022-10-25', 1),
(11, '9780571297917', '202251012', '2022-10-23', '2022-10-30', 0),
(12, '9780857754202', '202151191', '2022-10-28', '2022-11-04', 1),
(13, '9786020633176', '202253014', '2022-11-02', '2022-11-09', 0),
(14, '9786024242244', '202254015', '2022-11-07', '2022-11-14', 1),
(15, '9786020637181', '202255016', '2022-11-12', '2022-11-19', 0),
(17, '9786024242244', '202151191', '2022-12-24', '2022-12-31', 0);

-- --------------------------------------------------------

--
-- Table structure for table `penerbit`
--

CREATE TABLE `penerbit` (
  `id_penerbit` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `kota` varchar(100) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `no_telp` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penerbit`
--

INSERT INTO `penerbit` (`id_penerbit`, `nama`, `kota`, `website`, `no_telp`) VALUES
(1, 'PT Elex Media Komputindo', 'Jakarta', 'elexmedia.id', '(021) 53650110 - 53650111'),
(2, 'Faber and Faber Ltd', 'London', 'faber.co.uk', '944703'),
(3, 'Octopus', 'Sleman', 'sindikatboekoe.blogspot.co.id', '087832594334'),
(4, 'Indoliterasi', 'Bantul', 'indoliterasi.com', '081904278068'),
(5, 'Flame Tree 451', 'London', 'flametreepublishing.com', '02077519650'),
(6, 'Gramedia Pustaka Utama', 'Jakarta', 'gpu.id', '621186043'),
(7, 'Immortal Publishing', 'Sleman', 'shiramedia.com', '0274-2831331'),
(8, 'Kepustakaan Populer Gramedia', 'Jakarta', 'info.kepustakaanpopulergra.media', '592101929');

-- --------------------------------------------------------

--
-- Table structure for table `pengarang`
--

CREATE TABLE `pengarang` (
  `id_pengarang` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `tanggal_lahir` date NOT NULL,
  `kebangsaan` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengarang`
--

INSERT INTO `pengarang` (`id_pengarang`, `nama`, `tanggal_lahir`, `kebangsaan`) VALUES
(1, 'Cal Newport', '1982-06-23', 'Amerika Serikat'),
(2, 'James Clear', '1985-11-22', 'Amerika Serikat'),
(3, 'George Stuart Fullerton', '1859-08-18', 'Amerika Serikat'),
(4, 'John Lloyd', '1951-09-30', 'Inggris'),
(5, 'Herbert George Wells', '1866-09-21', 'Inggris'),
(6, 'Paulo Coelho', '1947-08-24', 'Spanyol'),
(7, 'Franz Kafka', '1883-07-03', 'Ceko-Jerman'),
(8, 'Daniel Kahneman', '1934-03-05', 'Israel-Amerika Serikat'),
(9, 'Larry Gonick', '1946-08-24', 'Amerika Serikat'),
(10, 'Yuval Noah Harari', '1976-02-24', 'Israel'),
(11, 'Carl Sagan', '1934-11-09', 'Amerika Serikat');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`ISBN`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`NIM`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_pinjam`),
  ADD KEY `ISBN` (`ISBN`),
  ADD KEY `NIM` (`NIM`);

--
-- Indexes for table `penerbit`
--
ALTER TABLE `penerbit`
  ADD PRIMARY KEY (`id_penerbit`);

--
-- Indexes for table `pengarang`
--
ALTER TABLE `pengarang`
  ADD PRIMARY KEY (`id_pengarang`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id_pinjam` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `penerbit`
--
ALTER TABLE `penerbit`
  MODIFY `id_penerbit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pengarang`
--
ALTER TABLE `pengarang`
  MODIFY `id_pengarang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `buku` (`ISBN`),
  ADD CONSTRAINT `peminjaman_ibfk_2` FOREIGN KEY (`NIM`) REFERENCES `mahasiswa` (`NIM`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
