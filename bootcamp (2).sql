-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 22, 2018 at 11:23 AM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bootcamp`
--

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

CREATE TABLE `module` (
  `ModuleID` int(11) NOT NULL,
  `ModuleName` varchar(255) NOT NULL,
  `Description` text NOT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UpdatedAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `plan`
--

CREATE TABLE `plan` (
  `PlanID` int(11) NOT NULL,
  `PlanName` varchar(255) NOT NULL,
  `Description` text NOT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UpdatedAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `plandetail`
--

CREATE TABLE `plandetail` (
  `DetailID` int(11) NOT NULL,
  `PlanID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `ModuleID` int(11) NOT NULL,
  `StartDate` datetime NOT NULL,
  `EndDate` datetime NOT NULL,
  `Instructor` varchar(255) NOT NULL,
  `DetailStatus` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `RoleID` int(11) NOT NULL,
  `RoleName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`RoleID`, `RoleName`) VALUES
(1, 'ROLE_TRAINEE'),
(2, 'ROLE_FACILITATOR'),
(3, 'ROLE_ADMIN');

-- --------------------------------------------------------

--
-- Table structure for table `task`
--

CREATE TABLE `task` (
  `TaskID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `Content` text NOT NULL,
  `TaskType` enum('Done','Challenges','Todo') NOT NULL,
  `TaskDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `task`
--

INSERT INTO `task` (`TaskID`, `UserID`, `Content`, `TaskType`, `TaskDate`) VALUES
(141, 16, 'Dunno', 'Done', '2018-06-13'),
(142, 16, 'What to say', 'Challenges', '2018-06-14'),
(143, 16, 'Dunno', 'Todo', '2018-06-14'),
(144, 20, 'PACK you', 'Done', '2018-06-14'),
(145, 20, 'KOre', 'Challenges', '2018-06-14'),
(146, 20, 'Kohi', 'Todo', '2018-06-14'),
(147, 20, 'text', 'Done', '2018-06-18'),
(148, 20, 'asdasd', 'Done', '2018-06-18'),
(149, 20, 'sad', 'Challenges', '2018-06-18'),
(150, 20, 'asdasdsa', 'Todo', '2018-06-18');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UserID` int(11) NOT NULL,
  `FirstName` varchar(40) NOT NULL,
  `MiddleName` varchar(40) DEFAULT NULL,
  `LastName` varchar(40) NOT NULL,
  `Username` varchar(20) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `RoleID` int(11) NOT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UpdatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserID`, `FirstName`, `MiddleName`, `LastName`, `Username`, `Password`, `RoleID`, `CreatedAt`, `UpdatedAt`) VALUES
(11, 'N/A', 'N/A', 'N/A', 'admin', '$2a$10$VlsSYC5/P/51t/VB6PEmNOgdF6o.gvTVqW184raQNEN3C0BupeuQW', 3, '2018-06-06 03:40:06', '2018-06-06 03:36:46'),
(16, 'Jhefrey', 'Lazaraga', 'Sajot', 'j.sajot', '$2a$10$qjxEKtTbf0HCEO4Za1DifO0xAtX4LgPlNJwAisxz8qTyg9vr2Fgqq', 1, '2018-06-14 06:37:22', '2018-06-14 06:37:22'),
(17, 'Dann Anthony', 'Jimenez', 'Astillero', 'd.astillero', '$2a$10$Pvg1xQEvOYQzYXOaKw6sseCAEMm5/UskruMc9tOK1vm7E08M7FlsO', 1, '2018-06-11 06:31:49', '2018-06-11 06:31:49'),
(18, 'Kyle Shem', 'Guerrero', 'Montealto', 'k.montealto', '$2a$10$qV0VHObPsRxOKrd5OZC4XOI.179xNO21o1EXmDfxlXTLJRTgsphuK', 1, '2018-06-14 06:28:27', '2018-06-14 06:28:27'),
(19, 'Jhefrey', 'Strike', 'Override', 'n.override', '$2a$10$dW.HI9TouOczg9BpR2WteOFmvsgakin1KQmbsSTSyxQf6BzoUDb92', 1, '2018-06-22 08:25:17', '2018-06-22 08:25:17'),
(20, 'Spring', 'Test', 'Runner', 's.runner', '$2a$10$OvrEkWf2J//5OZudFG3hQu4IpN7RsdROy7WIeayKjTqlQVM9sExyO', 1, '2018-06-11 03:41:36', '2018-06-11 03:41:36'),
(21, 'San', 'Nisen', 'Byaku', 's.byaku', '$2a$10$t.77sZeZH2k2ESBmdboBEeUNjxnC5PEThmcxMGYJrEiQhrjsB1PfW', 2, '2018-06-22 08:28:33', '2018-06-22 08:28:33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`ModuleID`);

--
-- Indexes for table `plan`
--
ALTER TABLE `plan`
  ADD PRIMARY KEY (`PlanID`);

--
-- Indexes for table `plandetail`
--
ALTER TABLE `plandetail`
  ADD PRIMARY KEY (`DetailID`),
  ADD KEY `FK_PlanDetail` (`PlanID`),
  ADD KEY `FK_UserDetail` (`UserID`),
  ADD KEY `FK_ModuleDetail` (`ModuleID`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`RoleID`);

--
-- Indexes for table `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`TaskID`),
  ADD KEY `FK_UserTask` (`UserID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`),
  ADD KEY `FK_UserRole` (`RoleID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `module`
--
ALTER TABLE `module`
  MODIFY `ModuleID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plan`
--
ALTER TABLE `plan`
  MODIFY `PlanID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plandetail`
--
ALTER TABLE `plandetail`
  MODIFY `DetailID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `RoleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `task`
--
ALTER TABLE `task`
  MODIFY `TaskID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `plandetail`
--
ALTER TABLE `plandetail`
  ADD CONSTRAINT `FK_ModuleDetail` FOREIGN KEY (`ModuleID`) REFERENCES `module` (`ModuleID`),
  ADD CONSTRAINT `FK_PlanDetail` FOREIGN KEY (`PlanID`) REFERENCES `plan` (`PlanID`),
  ADD CONSTRAINT `FK_UserDetail` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`);

--
-- Constraints for table `task`
--
ALTER TABLE `task`
  ADD CONSTRAINT `FK_UserTask` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_UserRole` FOREIGN KEY (`RoleID`) REFERENCES `role` (`RoleID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
