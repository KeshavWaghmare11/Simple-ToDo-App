-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 02, 2022 at 11:09 AM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `task_manager`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_lists`
--

CREATE TABLE IF NOT EXISTS `tbl_lists` (
`list_id` int(10) unsigned NOT NULL,
  `list_name` varchar(50) NOT NULL,
  `list_description` varchar(150) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_lists`
--

INSERT INTO `tbl_lists` (`list_id`, `list_name`, `list_description`) VALUES
(1, 'To Do', 'All the tasks that must be done soon'),
(2, 'In Progress Task', 'All the Tasks that are currently in progress'),
(3, 'Completed Task', 'All the Tasks that are completed  '),
(9, 'Submitted Task', 'All the task that are completed and submitted.');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tasks`
--

CREATE TABLE IF NOT EXISTS `tbl_tasks` (
`task_id` int(10) unsigned NOT NULL,
  `task_name` varchar(150) NOT NULL,
  `task_description` text NOT NULL,
  `list_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `deadline` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_tasks`
--

INSERT INTO `tbl_tasks` (`task_id`, `task_name`, `task_description`, `list_id`, `start_date`, `deadline`) VALUES
(19, 'Prepare plans', 'Prepare plans with detailed drawings that include project specifications and cost estimates', 1, '2022-10-02', '2022-10-04'),
(20, 'Design and execute engineering experiments', 'Design and execute engineering experiments to create workable solutions', 2, '2022-10-03', '2022-10-08'),
(21, 'Complete required technical and regulatory documents', 'Complete required technical and regulatory documents', 3, '2022-10-01', '2022-10-02'),
(22, 'Ensure projects are completed on-time and within the specified budget', '                        Ensure projects are completed on-time and within the specified budget                        ', 9, '2022-10-01', '2022-10-02'),
(23, 'Present the analysis results and project solutions to technical leads', 'Present analysis results and project solutions to technical leads', 1, '2022-10-05', '2022-10-09'),
(24, 'Testing web applications', 'Testing web applications', 1, '2022-10-13', '2022-10-22'),
(25, 'Writing and reviewing code for sites', 'Writing and reviewing code for sites, typically HTML, XML, or JavaScript.', 1, '2022-10-13', '2022-10-23'),
(26, 'Integrating multimedia content onto a site', 'Integrating multimedia content onto a site', 1, '2022-10-11', '2022-10-20'),
(27, 'Collaborating with designers, developers, and stakeholders', 'Collaborating with designers, developers, and stakeholders', 2, '2022-10-05', '2022-10-07'),
(28, 'Verify and deploy programs and systems', 'Verify and deploy programs and systems.', 2, '2022-10-19', '2022-10-22'),
(29, 'Work with developers to design algorithms and flowcharts', 'Work with developers to design algorithms and flowcharts', 3, '2022-10-22', '2022-10-30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_lists`
--
ALTER TABLE `tbl_lists`
 ADD PRIMARY KEY (`list_id`);

--
-- Indexes for table `tbl_tasks`
--
ALTER TABLE `tbl_tasks`
 ADD PRIMARY KEY (`task_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_lists`
--
ALTER TABLE `tbl_lists`
MODIFY `list_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `tbl_tasks`
--
ALTER TABLE `tbl_tasks`
MODIFY `task_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=30;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
