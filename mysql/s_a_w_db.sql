-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 24, 2023 at 06:43 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `s_a_w_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

CREATE TABLE `tbladmin` (
  `ID` int(10) NOT NULL,
  `AdminName` varchar(120) DEFAULT NULL,
  `UserName` varchar(120) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `Email` varchar(120) DEFAULT NULL,
  `Password` varchar(120) DEFAULT NULL,
  `AdminRegdate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`ID`, `AdminName`, `UserName`, `MobileNumber`, `Email`, `Password`, `AdminRegdate`) VALUES
(1, 'Admin', 'admin', 8989898989, 'admin@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblbookpg`
--

CREATE TABLE `tblbookpg` (
  `ID` int(10) NOT NULL,
  `Userid` int(10) DEFAULT NULL,
  `Pgid` int(10) DEFAULT NULL,
  `BookingNumber` int(10) NOT NULL,
  `CheckinDate` date DEFAULT NULL,
  `UserMsg` varchar(250) DEFAULT NULL,
  `BookingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `Remark` varchar(50) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `RemDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblbookpg`
--

INSERT INTO `tblbookpg` (`ID`, `Userid`, `Pgid`, `BookingNumber`, `CheckinDate`, `UserMsg`, `BookingDate`, `Remark`, `Status`, `RemDate`) VALUES
(18, 1, 11, 276253459, '2023-05-12', 'I arrived on 22 may in morning 10 am', '2019-05-20 11:34:09', 'Your Booking has been confirmed.', 'Confirmed', '2023-05-15 08:55:32'),
(19, 2, 16, 966726570, '2023-05-12', 'Give your contact number', '2019-05-20 11:35:55', '', NULL, '2023-05-15 08:55:32'),
(20, 3, 14, 705533047, '2023-05-12', 'Hi, I will arrive on 24 may in eve', '2019-05-20 11:37:23', '', NULL, '2023-05-15 08:55:32'),
(21, 4, 16, 811839401, '2023-05-12', 'bkjhjhhiu', '2019-05-20 11:38:13', '', NULL, '2023-05-15 08:55:32'),
(22, 1, 11, 189316467, '2023-05-12', 'This is sample text fro testing.', '2019-06-06 16:45:47', 'All seat filled.', 'Cancelled', '2023-05-15 08:55:32'),
(24, 1, 13, 369910293, '2023-05-12', 'This is sample text for testing. testing Data', '2019-06-06 17:13:08', 'All Rooms were already full. ', 'Cancelled', '2023-05-15 08:55:32'),
(25, 5, 20, 496196975, '2023-05-12', 'This is sample text for testing.', '2019-06-18 18:21:17', 'Your Accomodation is confirmed', 'Confirmed', '2023-05-15 08:55:32'),
(26, 6, 11, 317631978, '2023-05-12', 'test', '2023-05-15 08:37:21', 'XYZ', 'Confirmed', '2023-05-15 08:55:32'),
(27, 7, 11, 406425221, '2023-05-18', 'xxx', '2023-05-17 08:07:02', NULL, NULL, '0000-00-00 00:00:00'),
(28, 8, 14, 121093842, '2023-05-18', 'agsas', '2023-05-17 08:53:53', 'xcc', 'Confirmed', '2023-05-17 08:57:37'),
(29, 9, 11, 744527723, '2023-05-19', 'qwe', '2023-05-17 09:17:49', 'kdl', 'Confirmed', '2023-05-17 09:19:52'),
(30, 6, 14, 207093126, '2023-05-25', '111', '2023-05-20 14:19:48', NULL, NULL, '0000-00-00 00:00:00'),
(31, 6, 6, 845935380, '2023-05-24', 'xyz', '2023-05-23 01:37:57', 'xyz', 'Confirmed', '2023-05-23 02:44:38'),
(32, 6, 3, 268327276, '2023-06-24', 'xxx', '2023-05-23 06:58:30', 'vc', 'Confirmed', '2023-05-23 07:00:20');

-- --------------------------------------------------------

--
-- Table structure for table `tblcity`
--

CREATE TABLE `tblcity` (
  `ID` int(10) NOT NULL,
  `StateID` int(10) DEFAULT NULL,
  `City` varchar(120) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcity`
--

INSERT INTO `tblcity` (`ID`, `StateID`, `City`, `CreationDate`) VALUES
(1, 27, 'Kanpur', '2023-05-06 18:30:00'),
(2, 27, 'Varanasi [Benares]', '2023-05-06 18:30:00'),
(3, 27, 'Allahabad', '2023-05-06 18:30:00'),
(4, 27, 'Aligarh', '2023-05-06 18:30:00'),
(5, 27, 'Lucknow', '2023-05-06 18:30:00'),
(6, 22, 'Jaipur', '2023-05-06 18:30:00'),
(7, 23, 'Gangtok', '2023-05-06 18:30:00'),
(8, 23, 'Peeling', '2023-05-06 18:30:00'),
(9, 23, 'Namchi', '2023-05-06 18:30:00'),
(10, 23, 'Ravangla', '2023-05-06 18:30:00'),
(11, 23, 'Mangan', '2023-05-06 18:30:00'),
(12, 14, 'Bhopal', '2023-05-06 18:30:00'),
(13, 14, 'Indore', '2023-05-06 18:30:00'),
(14, 14, 'Indore', '2023-05-06 18:30:00'),
(15, 24, 'Chennai', '2023-05-06 18:30:00'),
(16, 24, 'Coimbatore', '2023-05-06 18:30:00'),
(17, 29, 'Durgapur', '2023-05-06 18:30:00'),
(18, 29, 'Kolkata', '2023-05-06 18:30:00'),
(19, 29, 'Asansol', '2023-05-06 18:30:00'),
(20, 11, 'Dhanbad', '2023-05-06 18:30:00'),
(21, 11, 'Bokaro', '2023-05-06 18:30:00'),
(22, 11, 'Ranchi', '2023-05-06 18:30:00'),
(23, 11, 'Ramghar', '2023-05-06 18:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `tblowner`
--

CREATE TABLE `tblowner` (
  `ID` int(10) NOT NULL,
  `FullName` varchar(200) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `Password` varchar(120) DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblowner`
--

INSERT INTO `tblowner` (`ID`, `FullName`, `Email`, `MobileNumber`, `Password`, `RegDate`) VALUES
(1, 'Rahul Singh', 'rahul@gmail.com', 9822564311, 'e10adc3949ba59abbe56e057f20f883e', '2023-03-07 11:06:51'),
(2, 'Khusbu', 'hj@gmail.com', 9231455262, 'e10adc3949ba59abbe56e057f20f883e', '2023-03-17 06:33:01'),
(3, 'Himanshu Das', 'himanshu@gmail.com', 6334567890, 'e10adc3949ba59abbe56e057f20f883e', '2023-03-20 05:36:05'),
(4, 'Sima', 'sima@gmail.com', 7784552434, 'e10adc3949ba59abbe56e057f20f883e', '2023-05-07 11:06:51'),
(5, 'Aditi Nagpal', 'aditi@gmail.com', 7466248312, 'e10adc3949ba59abbe56e057f20f883e', '2023-05-07 11:06:51'),
(6, 'Raju Srivastav', 'raju22@gmail.com', 9685552434, 'e10adc3949ba59abbe56e057f20f883e', '2023-05-07 11:06:51'),
(7, 'Ishaan Chandrasekar', 'ishaan121@gmail.com', 9977765432, 'e10adc3949ba59abbe56e057f20f883e', '2023-05-07 11:06:51'),
(8, 'Anjali Dhawan', 'dhawan2@gmail.com', 8765784633, 'e10adc3949ba59abbe56e057f20f883e', '2023-05-07 11:06:51'),
(9, 'Ajay Joshi', 'joshi@gmail.com', 9882424421, 'e10adc3949ba59abbe56e057f20f883e', '2023-05-07 11:06:51'),
(10, 'Veena Singh', 'singhv@gmail.com', 6775523415, 'e10adc3949ba59abbe56e057f20f883e', '2023-05-07 11:06:51'),
(11, 'Avan Krishnamurthy', 'avan@gmail.com', 7763442516, 'e10adc3949ba59abbe56e057f20f883e', '2023-05-07 11:06:51'),
(12, 'Ashwin Punj', 'punj@gmail.com', 9883416262, 'e10adc3949ba59abbe56e057f20f883e', '2023-05-07 11:06:51');

-- --------------------------------------------------------

--
-- Table structure for table `tblpages`
--

CREATE TABLE `tblpages` (
  `ID` int(11) NOT NULL,
  `PageType` varchar(200) DEFAULT NULL,
  `PageTitle` mediumtext DEFAULT NULL,
  `PageDescription` mediumtext DEFAULT NULL,
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `Fulfillment` mediumtext NOT NULL,
  `FutureServices` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblpages`
--

INSERT INTO `tblpages` (`ID`, `PageType`, `PageTitle`, `PageDescription`, `UpdationDate`, `Fulfillment`, `FutureServices`) VALUES
(1, 'aboutus', 'About Us', '                                <div style=\"text-align: left;\"><b>Student Accommodation Website</b></div><div style=\"text-align: left;\"><br></div><div style=\"text-align: left;\">The aim of Student Accommodation Website to provide user friendly environment to pg seeker at affordable price.</div>', '2023-05-17 06:15:40', 'The technological revolution in computers has enhanced our abilities to teach. MDS has remained on the cutting edge by instituting the use of computer simulators and remote Web-accessed study material. The company will continue to seek new ways to provide a better and more convenient teaching environment through technology. The virtual class room is a thing of the near future, and we are positioning ourselves to be among the first who will provide such services.', 'The company is in the process of launching a new division for the Seattle office that will encompass training classes for commercial drivers licenses and motorcycle licenses. These services will include comprehensive indoor training classes, job placement assistance for truck and bus drivers, and rented vehicles to practice with, and use for license testing. This program will be launched in 3rd quarter 2004. Depending on its success, management plans to incorporate this program into all the field offices by 3rd quarter 2005..'),
(2, 'contactus', 'Contact Us', '<b>Student Accommodation Website</b><div><b>Contact Number:</b>+91-xxxxxxxxxx</div><div><b>email: </b>bca2023@gmail.com</div><div><b>Address : </b>Fuljhore, Durgapur, West Bengal</div>', '2023-05-20 14:29:01', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tblpg`
--

CREATE TABLE `tblpg` (
  `ID` int(10) NOT NULL,
  `OwnerID` int(20) NOT NULL,
  `StateName` varchar(200) DEFAULT NULL,
  `CityName` varchar(200) DEFAULT NULL,
  `PGTitle` varchar(200) DEFAULT NULL,
  `Type` varchar(120) DEFAULT NULL,
  `RPmonth` varchar(120) DEFAULT NULL,
  `norooms` varchar(45) DEFAULT NULL,
  `Address` varchar(120) DEFAULT NULL,
  `Image` varchar(200) DEFAULT NULL,
  `Electricity` varchar(40) DEFAULT NULL,
  `Parking` varchar(40) DEFAULT NULL,
  `Refregerator` varchar(40) DEFAULT NULL,
  `Furnished` varchar(40) DEFAULT NULL,
  `AC` varchar(40) DEFAULT NULL,
  `Balcony` varchar(40) DEFAULT NULL,
  `StudyTable` varchar(40) DEFAULT NULL,
  `Laundry` varchar(40) DEFAULT NULL,
  `Security` varchar(40) DEFAULT NULL,
  `MealsBreakfast` varchar(45) DEFAULT NULL,
  `MealLunch` varchar(45) NOT NULL,
  `MealDinner` varchar(45) NOT NULL,
  `RegDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `IsActive` int(1) DEFAULT NULL,
  `LastUpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblpg`
--

INSERT INTO `tblpg` (`ID`, `OwnerID`, `StateName`, `CityName`, `PGTitle`, `Type`, `RPmonth`, `norooms`, `Address`, `Image`, `Electricity`, `Parking`, `Refregerator`, `Furnished`, `AC`, `Balcony`, `StudyTable`, `Laundry`, `Security`, `MealsBreakfast`, `MealLunch`, `MealDinner`, `RegDate`, `IsActive`, `LastUpdationDate`) VALUES
(1, 9, 'Jharkhand', 'Dhanbad', 'Malti Devi Girls Hostel Paying Guest/Hostels', 'Girls', '5500', '10', 'Hirapur, Dhanbad', 'fe4fe924d12e934efabdc10f634cee74.jpg', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Breakfast', '', '', '2023-05-02 11:29:10', NULL, '2023-05-22 09:39:05'),
(2, 9, 'Jharkhand', 'Dhanbad', 'Amenities... The boys Pg/Hostels', 'Boys', '4500', '10', 'Sari Dhela, Dhanbad', '4a4d107c7d7cfa34e099dc3484ade755.jpg', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Breakfast', '', '', '2023-05-02 11:29:10', NULL, '2023-05-21 07:35:14'),
(3, 10, 'Jharkhand', 'Ranchi', 'R Firdous Muslim PG for Boys/Hostels\r\n', 'Boys', '4500', '10', 'Kantatoli, Ranchi', '4a4d107c7d7cfa34e099dc3484ade755.jpg', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Breakfast', '', '', '2023-05-02 11:29:10', NULL, '2023-05-22 08:19:25'),
(4, 10, 'Jharkhand', 'Bokaro', 'Bokaro Residency Boy\'s Hostel\r\n', 'Boys', '4500', '10', 'Kantatoli, Ranchi', '4a4d107c7d7cfa34e099dc3484ade755.jpg', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Breakfast', '', '', '2023-05-02 11:29:10', NULL, '2023-05-22 08:19:32'),
(5, 7, 'West Bengal', 'Durgapur', 'Premium Male Paying Guest (PG) for working professionals\r\n', 'Boys', '4500', '10', 'MEAV-22, East Ave, Bengal Ambuja Housing Complex, Durgapur, West Bengal 713216', '4a4d107c7d7cfa34e099dc3484ade755.jpg', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Breakfast', '', '', '2023-05-02 11:29:10', NULL, '2023-05-22 08:19:32'),
(6, 7, 'West Bengal', 'Durgapur', 'Goswami\'s PG\r\n', 'Boys', '4500', '10', 'Madhusudan Park, Fuljhore, Kaliganj, Durgapur, West Bengal 713206', '4a4d107c7d7cfa34e099dc3484ade755.jpg', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Breakfast', '', '', '2023-05-02 11:29:10', NULL, '2023-05-22 08:19:32'),
(7, 12, 'West Bengal', 'Kolkata', 'Dugar House PG for Boys\r\n', 'Boys', '4500', '10', 'Ballygunge, 2G, Garcha 1st Ln, Bhowanipore, Kolkata, West Bengal 700019', '4a4d107c7d7cfa34e099dc3484ade755.jpg', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Breakfast', '', '', '2023-05-02 11:29:10', NULL, '2023-05-22 08:19:32'),
(8, 12, 'West Bengal', 'Asansol', 'Savitri PG for Girls/Women\r\n', 'Girls', '4500', '10', 'MXP5+MHF, Mother Teresa Rd, Chelidanga, Asansol, West Bengal 713301', '4a4d107c7d7cfa34e099dc3484ade755.jpg', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Breakfast', '', '', '2023-05-02 11:29:10', NULL, '2023-05-22 08:19:32'),
(11, 1, 'Uttar Pradesh', 'Lucknow', 'Janki Devi PG House', 'Both', '7000', '10', 'Hazrat Ganj D-145 near cant road', '4a4d107c7d7cfa34e099dc3484ade755.jpg', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Breakfast', '', '', '2023-05-02 11:29:10', NULL, '2023-05-21 07:35:00'),
(13, 1, 'Madhya Pradesh', 'Indore', 'Sanjay PG House', 'Girls', '5000', '5', 'A-178, Nehru Marg near reliance fresh', '1e6ae4ada992769567b71815f124fac5.jpg', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Dinner', '', '', '2023-05-02 11:29:10', NULL, '2023-05-02 11:29:10'),
(14, 1, 'Uttar Pradesh', 'Allahabad', 'KGM PG House', 'Both', '6000', '6', 'D-145678 Near jaharlal nehru road', 'efc1a80c391be252d7d777a437f86870.jpg', 'Yes', 'No', 'Yes', 'Yes', 'Yes', 'Yes', 'No', 'Yes', 'Yes', '', '', '', '2023-05-02 11:29:10', NULL, '2023-05-21 07:35:07'),
(16, 2, 'Madhya Pradesh', 'Jaipur', 'Baba PG', '', '4000', '5', 'D-124,fhgfytkjuol', 'b9fb9d37bdf15a699bc071ce49baea53.jpg', 'Yes', 'Yes', 'Yes', 'Yes', 'No', 'No', 'No', 'No', 'Yes', 'Yes', 'No', 'Yes', '2023-05-02 11:29:10', NULL, '2023-05-02 11:29:10'),
(20, 3, 'Tamilnadu', 'Chennai', 'Test PG', '', '10000', '10', 'Chennai', 'ca4851415e6adf8c1f187327c9e5d0fe.jpg', 'Yes', 'Yes', 'Yes', 'No', 'Yes', 'No', 'No', 'Yes', 'Yes', 'Yes', 'No', 'Yes', '2023-05-02 11:29:10', NULL, '2023-05-02 11:29:10'),
(21, 1, 'Uttar Pradesh', 'Lucknow', 'Ballians Girls P.G. House', 'Both', '6000', '10', 'Sector D1 RD, LDR Colony, Lucknow, UP 226012', '4a4d107c7d7cfa34e099dc3484ade755.jpg', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Breakfast', '', '', '2023-05-02 11:29:10', NULL, '2023-05-21 07:35:14');

-- --------------------------------------------------------

--
-- Table structure for table `tblstate`
--

CREATE TABLE `tblstate` (
  `ID` int(10) NOT NULL,
  `StateName` varchar(120) DEFAULT NULL,
  `RegState` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblstate`
--

INSERT INTO `tblstate` (`ID`, `StateName`, `RegState`) VALUES
(1, 'Andhra Pradesh', '2023-05-01 07:00:03'),
(2, 'Arunachal Pradesh', '2023-05-01 07:00:03'),
(3, 'Assam', '2023-05-01 07:00:03'),
(4, 'Bihar', '2023-05-01 07:00:03'),
(5, 'Chhattisgarh', '2023-05-01 07:00:03'),
(6, 'Delhi/NCR', '2023-05-01 07:00:03'),
(7, 'Goa', '2023-05-01 07:00:03'),
(8, 'Gujarat', '2023-05-01 07:00:03'),
(9, 'Haryana', '2023-05-01 07:00:03'),
(10, 'Himachal Pradesh', '2023-05-01 07:00:03'),
(11, 'Jharkhand', '2023-05-01 07:00:03'),
(12, 'Karnataka', '2023-05-01 07:00:03'),
(13, 'Kerala', '2023-05-01 07:00:03'),
(14, 'Madhya Pradesh', '2023-05-01 07:00:03'),
(15, 'Maharashtra', '2023-05-01 07:00:03'),
(16, 'Manipur', '2023-05-01 07:00:03'),
(18, 'Mizoram', '2023-05-01 07:00:03'),
(19, 'Nagaland', '2023-05-01 07:00:03'),
(20, 'Odisha', '2023-05-01 07:00:03'),
(21, 'Punjab', '2023-05-01 07:00:03'),
(22, 'Rajasthan', '2023-05-01 07:00:03'),
(23, 'Sikkim', '2023-05-01 07:00:03'),
(24, 'Tamil Nadu', '2023-05-01 07:00:03'),
(25, 'Telangana', '2023-05-01 07:00:03'),
(26, 'Tripura', '2023-05-01 07:00:03'),
(27, 'Uttar Pradesh', '2023-05-01 07:00:03'),
(28, 'Uttarakhand', '2023-05-01 07:00:03'),
(29, 'West Bengal', '2023-05-01 07:00:03');

-- --------------------------------------------------------

--
-- Table structure for table `tbluser`
--

CREATE TABLE `tbluser` (
  `ID` int(10) NOT NULL,
  `FullName` varchar(200) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `FatherName` varchar(120) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `ComAddress` varchar(250) DEFAULT NULL,
  `EmergencyNumber` bigint(10) DEFAULT NULL,
  `Password` varchar(200) DEFAULT NULL,
  `RegDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `LastUpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbluser`
--

INSERT INTO `tbluser` (`ID`, `FullName`, `Email`, `MobileNumber`, `FatherName`, `dob`, `ComAddress`, `EmergencyNumber`, `Password`, `RegDate`, `LastUpdationDate`) VALUES
(2, 'Khusbu', 'abc@gmail.com', 779797977, '', '0000-00-00', '', 0, '202cb962ac59075b964b07152d234b70', '2023-05-02 04:08:17', '2023-05-02 04:08:17'),
(3, 'Sunita Verma', 'verma@gmail.com', 8797979798, 'Mr. R.K Sharma', '1989-05-26', 'W-365, Merrut', 8989898989, '81dc9bdb52d04dc20036dbd8313ed055', '2023-05-02 04:08:17', '2023-05-02 04:08:17'),
(4, 'Raj', 've@gmail.com', 7977979797, 'Mr.Vivek', '2005-03-21', 'Chandra Vihar H.no:367 Gore gao Mumbai', 8797987979, '202cb962ac59075b964b07152d234b70', '2023-05-02 04:08:17', '2023-05-02 04:08:17'),
(5, 'test user', 'testuser@gmail.com', 1234567890, 'Test', '2018-05-02', 'New Delhi', 1234567890, 'f925916e2754e5e03f75dd58a5733251', '2023-05-02 04:08:17', '2023-05-02 04:08:17'),
(6, 'Arjit', 'singharjitkumar2@gmail.com', 9877869980, 'Durgesh ', '2003-10-10', 'jharkhand', 8888833377, 'e10adc3949ba59abbe56e057f20f883e', '2023-05-02 04:08:17', '2023-05-02 04:08:17'),
(7, 'raju', 'raju@gmail.com', 8888888777, NULL, NULL, NULL, NULL, '81dc9bdb52d04dc20036dbd8313ed055', '2023-05-17 08:05:30', NULL),
(8, 'raja', 'raja@gmail.com', 1111112222, NULL, NULL, NULL, NULL, '81dc9bdb52d04dc20036dbd8313ed055', '2023-05-17 08:52:40', NULL),
(9, 'ram', 'ram@gmail.com', 1112223344, NULL, NULL, NULL, NULL, '81dc9bdb52d04dc20036dbd8313ed055', '2023-05-17 09:16:30', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblbookpg`
--
ALTER TABLE `tblbookpg`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblcity`
--
ALTER TABLE `tblcity`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblowner`
--
ALTER TABLE `tblowner`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblpages`
--
ALTER TABLE `tblpages`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblpg`
--
ALTER TABLE `tblpg`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblstate`
--
ALTER TABLE `tblstate`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tbluser`
--
ALTER TABLE `tbluser`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblbookpg`
--
ALTER TABLE `tblbookpg`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `tblcity`
--
ALTER TABLE `tblcity`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `tblowner`
--
ALTER TABLE `tblowner`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tblpages`
--
ALTER TABLE `tblpages`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblpg`
--
ALTER TABLE `tblpg`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tblstate`
--
ALTER TABLE `tblstate`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `tbluser`
--
ALTER TABLE `tbluser`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
