-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 05, 2023 at 08:44 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flask`
--

-- --------------------------------------------------------

--
-- Table structure for table `contents`
--

CREATE TABLE `contents` (
  `no` int(25) NOT NULL,
  `bgimg` varchar(255) COLLATE latin1_general_cs NOT NULL,
  `href1` varchar(255) COLLATE latin1_general_cs NOT NULL,
  `title` text COLLATE latin1_general_cs NOT NULL,
  `href2` varchar(255) COLLATE latin1_general_cs NOT NULL,
  `info` text COLLATE latin1_general_cs NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;

--
-- Dumping data for table `contents`
--

INSERT INTO `contents` (`no`, `bgimg`, `href1`, `title`, `href2`, `info`) VALUES
(0, 'https://tastythailand.com/wp-content/uploads/2013/05/one-piece-film-z.jpg', 'https://www.crunchyroll.com/series/GRMG8ZQZR/one-piece', 'One Piece.', 'https://onepiece.fandom.com/wiki/One_Piece_Wiki', 'Monkey. D. Luffy refuses to let anyone or anything stand in the way of his quest to become the king of all pirates. With a course charted for the treacherous waters of the Grand Line and beyond, this is one captain who\'ll never give up until he\'s claimed the greatest treasure on Earth: the Legendary One Piece!'),
(2, 'https://cv.bkmkn.kodansha.co.jp/9784063621945/9784063621945_w.jpg', 'https://sanji.to/at-the-mercy-of-the-sky-specials-5427?ref=search', 'At The Mercy of The Sky', 'https://www.imdb.com/title/tt1463151/plotsummary/', 'A visually striking anime about a bookworm-ish high school student who returns to his hometown and joins the local astronomy club. Saku Ooyagi is back, and both he and his childhood friend Mihoshi Akeno are starting school, but they haven\'t seen each other since a painful accident years ago. Now Mihoshi is recruiting members for the astronomy club ... and she\'s fiercely determined to have Saku join the club.'),
(3, 'https://m.media-amazon.com/images/I/916t-LkwsgL._RI_.jpg', 'https://sanji.to/pocos-udon-world-883?ref=search', 'Poco\'s Udon World.', 'https://myanimelist.net/anime/32673/Udon_no_Kuni_no_Kiniro_Kemari', 'Taking a break from the hustle and bustle of Tokyo, Souta Tawara returns to his hometown in Kagawa. Though his parents are no longer around, his former home and family-owned udon restaurant reminds him of the times his family was still together. Reminiscing about his childhood, Souta enters the udon restaurant and discovers a grimy young boy sleeping.'),
(5, 'https://i.pinimg.com/originals/0a/7b/0b/0a7b0b4f086c62d90ab3810ac4dbd327.jpg', 'https://www.justwatch.com/in/tv-show/naruto', 'Naruto', 'https://www.crunchyroll.com/series/GYQ4MW246/naruto-shippuden', 'Naruto Uzumaki wants to be the best ninja in the land. He\'s done well so far, but with the looming danger posed by the mysterious Akatsuki organization, Naruto knows he must train harder than ever and leaves his village for intense exercises that will push him to his limits.'),
(4, 'https://cgtranslations321782266.files.wordpress.com/2018/04/005.jpg', 'https://www.crunchyroll.com/series/GJ0H7Q5V7/konosuba--an-explosion-on-this-wonderful-world', 'KONOSUBA -An Explosion on This Wonderful World!', 'https://www.imdb.com/title/tt27329086', 'One year before a certain useless goddess and NEET extraordinaire hit the scene, Megumin, the \"Greatest Genius of the Crimson Magic Clan,\" is hard at work. Ever since a life-changing encounter in her youth, the young wizard has dedicated her every waking moment to the pursuit of the ultimate offensive magic: Explosion magic. Well, every moment not spent hustling food'),
(6, 'https://cdn.otakutale.com/wp-content/uploads/2019/11/New-Boku-no-Hero-Academia-Hero-Rising-Visual-Trailer-Revealed-500x400.jpg', 'https://www.crunchyroll.com/series/GYNV9DP2R/my-hero-academia-dubs', 'My Hero Academia', 'https://www.imdb.com/title/tt5626028', 'A superhero-loving boy without any powers is determined to enroll in a prestigious hero academy and learn what it really means to be a hero.');

-- --------------------------------------------------------
-- Indexes for dumped tables
--

--
-- Indexes for table `contents`
--
ALTER TABLE `contents`
  ADD PRIMARY KEY (`no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contents`
--
ALTER TABLE `contents`
  MODIFY `no` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(32) COLLATE latin1_general_cs NOT NULL,
  `username` varchar(16) COLLATE latin1_general_cs NOT NULL,
  `password` varchar(512) COLLATE latin1_general_cs NOT NULL,
  `age` int(11) NOT NULL DEFAULT = 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `username`, `password`) VALUES
(1, 'admin@anime.com', 'admin', '12345');

--

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
