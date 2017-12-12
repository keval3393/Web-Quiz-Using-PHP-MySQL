-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 27, 2017 at 07:00 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quizdb`
--
CREATE DATABASE IF NOT EXISTS `quizdb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `quizdb`;

-- --------------------------------------------------------

--
-- Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;
CREATE TABLE `answer` (
  `AnswerId` int(11) NOT NULL,
  `QuestionId` int(11) NOT NULL,
  `Answer` varchar(1000) NOT NULL,
  `IsCorrect` tinyint(1) NOT NULL,
  `Number` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `answer`
--

INSERT INTO `answer` (`AnswerId`, `QuestionId`, `Answer`, `IsCorrect`, `Number`) VALUES
(1, 1, 'Numeric', 0, 1),
(2, 1, 'Boolean', 0, 2),
(3, 1, 'Characters', 0, 3),
(4, 1, 'Both Numeric & Characters', 1, 4),
(5, 2, '1', 1, 1),
(6, 2, '2', 0, 2),
(7, 2, '3', 0, 3),
(8, 2, '4', 0, 4),
(9, 3, 'int', 0, 1),
(10, 3, 'float', 0, 2),
(11, 3, 'void', 1, 3),
(12, 3, 'double', 0, 4),
(13, 4, 'Function overriding', 0, 1),
(14, 4, 'Function overloading', 1, 2),
(15, 4, 'Function doubling', 0, 3),
(16, 4, 'None of the mentioned', 0, 4),
(17, 5, 'finalize', 0, 1),
(18, 5, 'delete', 0, 2),
(19, 5, 'class', 0, 3),
(20, 5, 'constructor', 1, 4),
(21, 6, 'main menthod', 1, 1),
(22, 6, 'finalize method', 0, 2),
(23, 6, 'static method', 0, 3),
(24, 6, 'private method', 0, 4),
(25, 7, 'class', 1, 1),
(26, 7, 'object', 0, 2),
(27, 7, 'variable', 0, 3),
(28, 7, 'character array', 0, 4),
(29, 8, 'char()', 0, 1),
(30, 8, 'Charat()', 0, 2),
(31, 8, 'charat()', 0, 3),
(32, 8, 'charAt()', 1, 4),
(33, 9, 'upper', 0, 1),
(34, 9, 'super', 1, 2),
(35, 9, 'this', 0, 3),
(36, 9, 'None of above', 0, 4),
(37, 10, 'isequal()', 1, 1),
(38, 10, 'isequals()', 0, 2),
(39, 10, 'equal()', 0, 3),
(40, 10, 'equals()', 0, 4),
(41, 11, 'String is a class.', 0, 1),
(42, 11, 'Strings in java are mutable.', 1, 2),
(43, 11, 'Every string is an object of class String.', 0, 3),
(44, 11, 'Java defines a peer class of String, called StringBuffer, which allows string to be altered.', 0, 4),
(45, 12, 'startsWith()', 1, 1),
(46, 12, 'endsWith()', 0, 2),
(47, 12, 'Starts()', 0, 3),
(48, 12, 'ends()', 0, 4),
(49, 13, 'char', 0, 1),
(50, 13, 'int', 0, 2),
(51, 13, 'boolean', 1, 3),
(52, 13, 'All of the mentioned', 0, 4),
(53, 14, 'upper', 0, 1),
(54, 14, 'super', 1, 2),
(55, 14, 'this', 0, 3),
(56, 14, 'None of the mentioned', 0, 4),
(57, 15, 'public member', 0, 1),
(58, 15, 'private member', 1, 2),
(59, 15, 'protected member', 0, 3),
(60, 15, 'static member', 0, 4),
(61, 16, 'class B + class A {}', 0, 1),
(62, 16, 'class B inherits class A {}', 0, 2),
(63, 16, 'class B extends A {}', 1, 3),
(64, 16, 'class B extends class A {}', 0, 4),
(65, 17, 'static', 0, 1),
(66, 17, 'constant', 0, 2),
(67, 17, 'protected', 0, 3),
(68, 17, 'final', 1, 4),
(69, 18, 'super(void);', 0, 1),
(70, 18, 'superclass.();', 0, 2),
(71, 18, 'super.A();', 0, 3),
(72, 18, 'super();', 1, 4),
(73, 19, 'Abstraction', 0, 1),
(74, 19, 'Encapsulation', 0, 2),
(75, 19, 'Polymorphism', 1, 3),
(76, 19, 'None of the mentioned', 0, 4),
(77, 20, 'import', 0, 1),
(78, 20, 'catch', 0, 2),
(79, 20, 'abstract', 0, 3),
(80, 20, 'this', 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `QuestionId` int(11) NOT NULL,
  `Question` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`QuestionId`, `Question`) VALUES
(1, 'Which of the following can be operands of arithmetic operators?'),
(2, 'Decrement operator, –, decreases value of variable by what number?'),
(3, 'What is the return type of a method that does not returns any value?'),
(4, 'What is the process of defining more than one method in a class differentiated by method signature?'),
(5, 'Which of the following is a method having same name as that of it’s class?'),
(6, 'Which method can be defined only once in a program?'),
(7, 'String in Java is a?'),
(8, 'Which of these method of String class is used to obtain character at specified index?'),
(9, 'Which of these keywords is used to refer to member of base class from a sub class?'),
(10, 'Which of these method of String class can be used to test to strings for equality?'),
(11, 'Which of the following statements are incorrect?'),
(12, 'Which of these method of class String is used to check weather a given object starts with a particular string literal?'),
(13, 'Which of these data type value is returned by equals() method of String class?'),
(14, 'Which of these keywords is used to refer to member of base class from a sub class?'),
(15, 'A class member declared protected becomes member of subclass of which type?'),
(16, 'Which of these is correct way of inheriting class A by class B?'),
(17, 'Which of these keywords can be used to prevent Method overriding?'),
(18, 'Which of these is correct way of calling a constructor having no parameters, of superclass A by subclass B?'),
(19, 'Which of these is supported by method overriding in Java?'),
(20, 'Which keyword is used by method to refer to the object that invoked it?');

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

DROP TABLE IF EXISTS `quiz`;
CREATE TABLE `quiz` (
  `QuizId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `Score` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `UserId` int(11) NOT NULL,
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `Email` varchar(200) NOT NULL,
  `Address` varchar(200) NOT NULL,
  `PhoneNumber` int(10) NOT NULL,
  `topscore` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserId`, `FirstName`, `LastName`, `Email`, `Address`, `PhoneNumber`, `topscore`) VALUES
(1, 'Bob', 'Marley', 'bobmarley@gmail.com', 'Toronto', 54654, 2),
(4, 'Keval', 'Makwana', 'kevalmakwana27@gmail.com', 'hsgkhdfg', 56468484, 7),
(5, 'Hiren', 'CHauhan', 'hiren@hiren.com', 'hghk', 6846878, 5),
(6, 'First', 'Last', 'first@last.com', 'kjnjnk', 84984, 7);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`AnswerId`),
  ADD KEY `QuestionId` (`QuestionId`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`QuestionId`);

--
-- Indexes for table `quiz`
--
ALTER TABLE `quiz`
  ADD PRIMARY KEY (`QuizId`),
  ADD KEY `UserId` (`UserId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answer`
--
ALTER TABLE `answer`
  MODIFY `AnswerId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;
--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `QuestionId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `quiz`
--
ALTER TABLE `quiz`
  MODIFY `QuizId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `UserId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `answer`
--
ALTER TABLE `answer`
  ADD CONSTRAINT `AnswerQuestionQuestionIdFK` FOREIGN KEY (`QuestionId`) REFERENCES `question` (`QuestionId`);

--
-- Constraints for table `quiz`
--
ALTER TABLE `quiz`
  ADD CONSTRAINT `QuizUserUserIdFK` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
