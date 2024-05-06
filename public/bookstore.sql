-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 01, 2024 at 04:27 PM
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
-- Database: `bookstore`
--

-- --------------------------------------------------------

--
-- Table structure for table `autor`
--

CREATE TABLE `autor` (
  `id` int(11) NOT NULL,
  `nume` varchar(255) NOT NULL,
  `prenume` varchar(255) NOT NULL,
  `origine` varchar(255) NOT NULL,
  `data_nasterii` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `autor`
--

INSERT INTO `autor` (`id`, `nume`, `prenume`, `origine`, `data_nasterii`) VALUES
(1, 'Popescu', 'Ion', 'București', '1980-05-15'),
(2, 'Ionescu', 'Ana', 'Cluj-Napoca', '1975-10-20'),
(3, 'Dragomirescu', 'Mihai', 'Timișoara', '1990-03-08'),
(4, 'Constantinescu', 'Maria', 'Iași', '1988-07-12'),
(5, 'Dumitrescu', 'Andrei', 'Brașov', '1972-12-25'),
(6, 'Georgescu', 'Elena', 'Craiova', '1985-09-30'),
(7, 'Stanciu', 'Alexandru', 'Sibiu', '1995-02-18'),
(8, 'Popa', 'Mihaela', 'Constanța', '1979-06-07'),
(9, 'Stan', 'Andreea', 'Ploiești', '1983-11-10'),
(10, 'Mihai', 'Marian', 'Galați', '1987-04-03'),
(11, 'Cristea', 'Cristina', 'Oradea', '1992-08-22'),
(12, 'Gheorghe', 'George', 'Bacău', '1977-01-28'),
(13, 'Neagu', 'Nicu', 'Arad', '1981-06-15'),
(14, 'Florescu', 'Gabriela', 'Brăila', '1974-09-20'),
(15, 'Pavel', 'Petru', 'Satu Mare', '1989-03-05'),
(16, 'Voicu', 'Vlad', 'Târgu-Mureș', '1976-12-12'),
(17, 'Dinu', 'Diana', 'Pitești', '1986-07-08'),
(18, 'Stoica', 'Ștefan', 'Focșani', '1991-04-18'),
(19, 'Iancu', 'Irina', 'Botoșani', '1980-10-25'),
(20, 'Vasilescu', 'Victor', 'Brașov', '1984-05-30');

-- --------------------------------------------------------

--
-- Table structure for table `carte`
--

CREATE TABLE `carte` (
  `id` int(11) NOT NULL,
  `gen_id` int(11) NOT NULL,
  `autor_id` int(11) NOT NULL,
  `titlu` varchar(255) NOT NULL,
  `pagini` int(11) NOT NULL,
  `data_publicarii` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carte`
--

INSERT INTO `carte` (`id`, `gen_id`, `autor_id`, `titlu`, `pagini`, `data_publicarii`) VALUES
(1, 1, 1, 'Cronicile din Narnia: Leul, Vrăjitoarea și dulapul', 200, '1950-10-16'),
(2, 1, 2, 'Harry Potter și piatra filozofală', 320, '1997-06-26'),
(3, 2, 3, 'Sherlock Holmes: Aventurile lui Sherlock Holmes', 250, '1892-10-14'),
(4, 3, 4, 'Fahrenheit 451', 256, '1953-10-19'),
(5, 4, 5, 'Pride and Prejudice', 279, '1813-01-28'),
(6, 5, 6, 'Dracula', 418, '1897-05-26'),
(7, 3, 7, '1984', 328, '1949-06-08'),
(8, 4, 8, 'Jane Eyre', 366, '1847-10-16'),
(9, 8, 9, 'The Catcher in the Rye', 234, '1951-07-16'),
(10, 7, 10, 'To Kill a Mockingbird', 281, '1960-07-11'),
(11, 8, 11, 'The Great Gatsby', 218, '1925-04-10'),
(12, 1, 12, 'The Hobbit', 310, '1937-09-21'),
(13, 6, 13, 'War and Peace', 1225, '1869-01-01'),
(14, 2, 14, 'Crime and Punishment', 671, '1866-01-01'),
(15, 7, 15, 'Moby-Dick', 585, '1851-10-18'),
(16, 1, 12, 'The Lord of the Rings: The Fellowship of the Ring', 423, '1954-07-29'),
(17, 4, 16, 'Gone with the Wind', 1037, '1936-06-30'),
(18, 6, 17, 'Les Misérables', 1463, '1862-01-01'),
(19, 9, 18, 'The Alchemist', 208, '1988-01-01'),
(20, 10, 19, 'Don Quixote', 863, '1605-01-01'),
(21, 5, 20, 'The Picture of Dorian Gray', 254, '1890-07-20'),
(22, 6, 13, 'Anna Karenina', 964, '1878-01-01'),
(23, 5, 6, 'Frankenstein', 280, '1818-01-01'),
(24, 7, 1, 'The Adventures of Huckleberry Finn', 366, '1884-12-10'),
(25, 1, 12, 'The Little Prince', 96, '1943-04-06'),
(26, 4, 8, 'Wuthering Heights', 342, '1847-12-19'),
(27, 1, 1, 'The Chronicles of Narnia: Prince Caspian', 232, '1951-10-15'),
(28, 4, 13, 'The Secret Garden', 331, '1911-01-01'),
(29, 6, 4, 'The Count of Monte Cristo', 1276, '1844-01-28'),
(30, 8, 15, 'The Bell Jar', 244, '1963-01-14'),
(31, 7, 16, 'The Odyssey', 541, '0800-01-01'),
(32, 2, 14, 'The Brothers Karamazov', 796, '1880-01-01'),
(33, 1, 12, 'The Silmarillion', 365, '1977-09-15'),
(34, 9, 17, 'One Hundred Years of Solitude', 417, '1967-05-30'),
(35, 9, 18, 'Life of Pi', 319, '2001-09-11'),
(36, 4, 19, 'Little Women', 449, '1868-09-30'),
(37, 6, 10, 'A Tale of Two Cities', 448, '1859-01-01'),
(38, 4, 5, 'Sense and Sensibility', 381, '1811-01-28'),
(39, 7, 1, 'The Adventures of Tom Sawyer', 341, '1876-12-10'),
(40, 1, 11, 'Peter Pan', 208, '1911-12-27'),
(41, 1, 3, 'Alice\'s Adventures in Wonderland', 192, '1865-11-26'),
(42, 8, 13, 'The Scarlet Letter', 238, '1850-01-01'),
(43, 7, 4, 'The Old Man and the Sea', 127, '1952-09-01'),
(44, 3, 5, 'Brave New World', 288, '1932-01-01'),
(45, 1, 6, 'The Jungle Book', 158, '1894-01-01'),
(46, 2, 7, 'The Divine Comedy', 798, '1320-01-01'),
(47, 4, 5, 'Emma', 474, '1815-12-23'),
(48, 6, 8, 'The Three Musketeers', 704, '1844-01-14'),
(49, 2, 3, 'The Adventures of Sherlock Holmes', 307, '1892-10-14'),
(50, 4, 5, 'Sense and Sensibility', 381, '1811-01-28'),
(51, 7, 11, 'The Adventures of Tom Sawyer', 341, '1876-12-10'),
(52, 1, 11, 'Peter Pan', 208, '1911-12-27'),
(53, 1, 2, 'Alice\'s Adventures in Wonderland', 192, '1865-11-26'),
(54, 8, 3, 'The Scarlet Letter', 238, '1850-01-01'),
(55, 7, 3, 'The Old Man and the Sea', 127, '1952-09-01'),
(56, 3, 5, 'Brave New World', 288, '1932-01-01'),
(57, 1, 6, 'The Jungle Book', 158, '1894-01-01'),
(58, 2, 7, 'The Divine Comedy', 798, '1320-01-01'),
(59, 4, 5, 'Emma', 474, '1815-12-23'),
(60, 6, 18, 'The Three Musketeers', 704, '1844-01-14'),
(61, 2, 3, 'The Adventures of Sherlock Holmes', 307, '1892-10-14'),
(62, 9, 19, 'Povestea lui O', 231, '1975-09-12'),
(63, 6, 20, 'Mizerabilii', 457, '1862-01-01'),
(64, 1, 11, 'Ursul Păcălit de Vulpe', 185, '1865-02-10'),
(65, 10, 2, 'Luceafărul', 209, '1883-06-20'),
(66, 1, 4, 'Cei trei purceluși', 64, '1843-11-21'),
(67, 4, 4, 'Romeo și Julieta', 172, '1597-01-20'),
(68, 10, 15, 'Ion', 300, '1920-05-01'),
(69, 6, 16, 'Moara cu Noroc', 250, '1881-09-17'),
(70, 4, 17, 'La Medeleni', 400, '1925-07-20'),
(71, 5, 8, 'Enigma Otiliei', 350, '1881-12-31'),
(72, 6, 9, 'Moromeții', 350, '1955-03-01'),
(73, 8, 1, 'Pădurea Spânzuraților', 230, '1922-01-05'),
(74, 9, 1, 'Maitreyi', 200, '1930-03-01'),
(75, 7, 12, 'Ultima noapte de dragoste, întâia noapte de război', 230, '1930-03-01'),
(76, 5, 5, 'Baltagul', 300, '1930-03-01'),
(77, 10, 4, 'Ion', 220, '1930-03-01'),
(78, 7, 15, 'Ciocoii vechi și noi', 360, '1930-03-01'),
(79, 7, 16, 'Alexandru Lăpușneanu', 300, '1930-03-01'),
(80, 6, 13, 'Marile speranțe', 480, '1930-03-01'),
(81, 6, 8, 'Moara cu Noroc', 300, '1930-03-01'),
(82, 4, 9, 'La răscruce de vânturi', 380, '1930-03-01'),
(83, 5, 6, 'Enigma Otiliei', 350, '1930-03-01'),
(84, 9, 6, 'Maitreyi', 200, '1930-03-01'),
(85, 7, 6, 'Ultima noapte de dragoste, întâia noapte de război', 230, '1930-03-01'),
(86, 5, 3, 'Baltagul', 300, '1930-03-01'),
(87, 10, 4, 'Ion', 220, '1930-03-01'),
(88, 7, 15, 'Ciocoii vechi și noi', 360, '1930-03-01'),
(89, 7, 6, 'Alexandru Lăpușneanu', 300, '1930-03-01'),
(90, 6, 7, 'Marile speranțe', 480, '1930-03-01');

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `nume` varchar(255) NOT NULL,
  `prenume` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`id`, `nume`, `prenume`) VALUES
(1, 'Popescu', 'Ion'),
(2, 'Ionescu', 'Ana'),
(3, 'Dragomirescu', 'Mihai'),
(4, 'Constantinescu', 'Maria'),
(5, 'Dumitrescu', 'Andrei'),
(6, 'Georgescu', 'Elena'),
(7, 'Stanciu', 'Alexandru'),
(8, 'Popa', 'Mihaela'),
(9, 'Stan', 'Andreea'),
(10, 'Mihai', 'Marian'),
(11, 'Cristea', 'Cristina'),
(12, 'Gheorghe', 'George'),
(13, 'Neagu', 'Nicu'),
(14, 'Florescu', 'Gabriela'),
(15, 'Pavel', 'Petru'),
(16, 'Voicu', 'Vlad'),
(17, 'Dinu', 'Diana'),
(18, 'Stoica', 'Ștefan'),
(19, 'Iancu', 'Irina'),
(20, 'Vasilescu', 'Victor'),
(21, 'Avram', 'Andrei'),
(22, 'Dumitru', 'Mihai'),
(23, 'Albu', 'Maria'),
(24, 'Radu', 'Ioana'),
(25, 'Gheorghiu', 'Alexandra'),
(26, 'Oprea', 'Gabriel'),
(27, 'Iordache', 'Ana-Maria'),
(28, 'Munteanu', 'Ionuț'),
(29, 'Diaconu', 'Adrian'),
(30, 'Costache', 'Elena');

-- --------------------------------------------------------

--
-- Table structure for table `client_carte`
--

CREATE TABLE `client_carte` (
  `client_id` int(11) NOT NULL,
  `carte_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `client_carte`
--

INSERT INTO `client_carte` (`client_id`, `carte_id`) VALUES
(1, 15),
(1, 74),
(2, 32),
(2, 51),
(2, 58),
(2, 66),
(2, 77),
(2, 80),
(3, 3),
(3, 54),
(3, 79),
(3, 80),
(4, 3),
(4, 18),
(4, 22),
(4, 66),
(4, 67),
(5, 7),
(5, 39),
(5, 44),
(5, 61),
(6, 2),
(6, 16),
(6, 85),
(6, 87),
(7, 12),
(7, 43),
(7, 45),
(7, 80),
(8, 11),
(8, 15),
(8, 29),
(8, 37),
(8, 49),
(8, 69),
(8, 89),
(9, 7),
(9, 10),
(9, 14),
(9, 22),
(9, 27),
(9, 30),
(9, 37),
(9, 68),
(9, 69),
(9, 70),
(9, 76),
(9, 86),
(10, 15),
(10, 50),
(10, 63),
(11, 25),
(11, 30),
(11, 37),
(11, 53),
(11, 54),
(11, 87),
(12, 2),
(12, 20),
(12, 40),
(12, 57),
(12, 59),
(12, 72),
(12, 73),
(12, 75),
(12, 80),
(13, 23),
(13, 24),
(13, 49),
(13, 63),
(13, 74),
(13, 77),
(14, 19),
(14, 42),
(14, 58),
(14, 73),
(14, 81),
(14, 87),
(15, 32),
(15, 44),
(15, 51),
(15, 53),
(15, 55),
(15, 67),
(15, 76),
(15, 79),
(16, 16),
(16, 35),
(16, 41),
(16, 84),
(17, 3),
(17, 11),
(17, 12),
(17, 37),
(17, 38),
(17, 39),
(17, 54),
(17, 63),
(18, 39),
(18, 54),
(18, 78),
(18, 83),
(18, 90),
(19, 19),
(19, 24),
(19, 44),
(19, 50),
(19, 54),
(19, 65),
(19, 79),
(20, 38),
(20, 43),
(20, 60),
(20, 81),
(21, 42),
(21, 44),
(21, 53),
(22, 11),
(22, 14),
(22, 20),
(22, 23),
(22, 25),
(22, 39),
(22, 51),
(22, 88),
(23, 26),
(23, 30),
(23, 69),
(23, 85),
(24, 3),
(24, 35),
(24, 53),
(24, 56),
(24, 71),
(24, 76),
(25, 6),
(25, 18),
(25, 27),
(25, 31),
(25, 38),
(25, 43),
(25, 50),
(25, 68),
(25, 71),
(26, 15),
(26, 17),
(26, 40),
(26, 45),
(26, 53),
(26, 57),
(26, 59),
(26, 69),
(26, 70),
(26, 76),
(26, 83),
(27, 2),
(27, 4),
(27, 10),
(27, 13),
(27, 42),
(27, 62),
(27, 71),
(27, 76),
(28, 2),
(28, 5),
(28, 27),
(28, 31),
(28, 41),
(28, 45),
(28, 65),
(29, 6),
(29, 15),
(29, 17),
(29, 40),
(29, 43),
(29, 79),
(29, 86),
(30, 47),
(30, 51),
(30, 63),
(30, 81);

-- --------------------------------------------------------

--
-- Table structure for table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20240501140707', '2024-05-01 14:07:46', 346);

-- --------------------------------------------------------

--
-- Table structure for table `gen`
--

CREATE TABLE `gen` (
  `id` int(11) NOT NULL,
  `nume` varchar(255) NOT NULL,
  `descriere` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gen`
--

INSERT INTO `gen` (`id`, `nume`, `descriere`) VALUES
(1, 'Fantezie', 'Cărți care prezintă elemente magice și lumi fantastice.'),
(2, 'Mister', 'Cărți centrate pe rezolvarea unui puzzle sau a unei crime.'),
(3, 'Science Fiction', 'Cărți care explorează concepte speculative, adesea legate de știință și tehnologie.'),
(4, 'Romantic', 'Cărți care se concentrează pe relații romantice și conexiuni emoționale.'),
(5, 'Suspans', 'Cărți pline de suspans, tensiune și excitare.'),
(6, 'Ficțiune Istorică', 'Cărți plasate în trecut, adesea combinând evenimente istorice cu elemente fictive.'),
(7, 'Horror', 'Cărți concepute pentru a evoca frică și groază în cititor.'),
(8, 'Aventură', 'Cărți care prezintă călătorii și căutări pline de aventură.'),
(9, 'Dramă', 'Cărți care se concentrează pe conflicte interpersonale și lupte emoționale.'),
(10, 'Biografie', 'Cărți care povestesc viața unei persoane reale.');

-- --------------------------------------------------------

--
-- Table structure for table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carte`
--
ALTER TABLE `carte`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_BAD4FFFDB718FA6E` (`gen_id`),
  ADD KEY `IDX_BAD4FFFD14D45BBE` (`autor_id`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_carte`
--
ALTER TABLE `client_carte`
  ADD PRIMARY KEY (`client_id`,`carte_id`),
  ADD KEY `IDX_19B9634A19EB6921` (`client_id`),
  ADD KEY `IDX_19B9634AC9C7CEB6` (`carte_id`);

--
-- Indexes for table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `gen`
--
ALTER TABLE `gen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `autor`
--
ALTER TABLE `autor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `carte`
--
ALTER TABLE `carte`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `gen`
--
ALTER TABLE `gen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carte`
--
ALTER TABLE `carte`
  ADD CONSTRAINT `FK_BAD4FFFD14D45BBE` FOREIGN KEY (`autor_id`) REFERENCES `autor` (`id`),
  ADD CONSTRAINT `FK_BAD4FFFDB718FA6E` FOREIGN KEY (`gen_id`) REFERENCES `gen` (`id`);

--
-- Constraints for table `client_carte`
--
ALTER TABLE `client_carte`
  ADD CONSTRAINT `FK_19B9634A19EB6921` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_19B9634AC9C7CEB6` FOREIGN KEY (`carte_id`) REFERENCES `carte` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
