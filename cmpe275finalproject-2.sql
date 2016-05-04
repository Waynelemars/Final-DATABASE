-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: May 02, 2016 at 06:34 PM
-- Server version: 5.5.42
-- PHP Version: 5.6.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cmpe275finalproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `Admin`
--

SET foreign_key_checks = 0;
drop database if exists cmpe275finalproject;
create database cmpe275finalproject;
use cmpe275finalproject;
 
-- --------------------------------------------------------

--
-- Table structure for table `Admin`
--

CREATE TABLE `Admin` (
  `userid` int(15) NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(42) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Menuitems`
--

CREATE TABLE `Menuitems` (
  `menuid` int(10) NOT NULL,
  `category` varchar(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `picture` varchar(2083) NOT NULL,
  `unitprice` float NOT NULL,
  `calories` int(11) NOT NULL,
  `preparationtime` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Menuitems`
--

INSERT INTO `Menuitems` (`menuid`, `category`, `name`, `picture`, `unitprice`, `calories`, `preparationtime`) VALUES
(1, 'Drink', 'Cocacola', 'http://www.coca-colacompany.com/content/dam/journey/us/en/private/2015/02/chronology10-1280-900-bfb7f27c.jpg', 3, 100, 1),
(2, 'Drink', 'orange juice', 'http://www.organicfacts.net/wp-content/uploads/2013/08/orangejuice.jpg', 5, 10, 2),
(3, 'Drink', 'Orange Juice', 'http://bevarisalliance.com/wp-content/uploads/2013/03/apple_juice.jpeg', 3, 10, 3);

-- --------------------------------------------------------

--
-- Table structure for table `Orders`
--

CREATE TABLE `Orders` (
  `userid` int(10) NOT NULL,
  `menuid` int(10) NOT NULL,
  `date` date NOT NULL,
  `time` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `userid` int(10) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(42) NOT NULL,
  `verificationstatus` tinyint(1) NOT NULL,
  `firstname` varchar(10) NOT NULL,
  `lastname` varchar(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`userid`, `email`, `password`, `verificationstatus`, `firstname`, `lastname`) VALUES
(1, 'hello@gmail.com', '70cf39de78b418851dffa90c127a91d0', 1, 'tom', 'taylor');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Admin`
--
ALTER TABLE `Admin`
  ADD PRIMARY KEY (`userid`);

--
-- Indexes for table `Menuitems`
--
ALTER TABLE `Menuitems`
  ADD PRIMARY KEY (`menuid`);

--
-- Indexes for table `Orders`
--
ALTER TABLE `Orders`
  ADD KEY `menuid` (`menuid`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Admin`
--
ALTER TABLE `Admin`
  MODIFY `userid` int(15) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Menuitems`
--
ALTER TABLE `Menuitems`
  MODIFY `menuid` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `userid` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Orders`
--
ALTER TABLE `Orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`menuid`) REFERENCES `Menuitems` (`menuid`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `Users` (`userid`);

