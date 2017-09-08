-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: acms
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.13-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `course_details`
--

DROP TABLE IF EXISTS `course_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_details` (
  `course_details_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `faculty_id` int(10) unsigned NOT NULL,
  `course_id` int(11) NOT NULL,
  `grade` varchar(45) NOT NULL,
  `financial_aid` varchar(45) NOT NULL,
  PRIMARY KEY (`course_details_id`),
  UNIQUE KEY `faculty_id_UNIQUE` (`faculty_id`),
  KEY `coursed_student_id_idx` (`financial_aid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_details`
--

LOCK TABLES `course_details` WRITE;
/*!40000 ALTER TABLE `course_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(45) DEFAULT NULL,
  `department` varchar(45) DEFAULT NULL,
  `instructor` varchar(45) DEFAULT NULL,
  `instructor_id` int(11) unsigned NOT NULL,
  `stu_id` int(11) NOT NULL,
  PRIMARY KEY (`course_id`),
  KEY `fk_stuid_idx` (`stu_id`),
  KEY `fk_instructorid_idx` (`instructor_id`),
  CONSTRAINT `fk_instructorid` FOREIGN KEY (`instructor_id`) REFERENCES `fregistration` (`freg_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stuid` FOREIGN KEY (`stu_id`) REFERENCES `sregistration` (`sreg_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'XML','CS','dzm0049',1,1),(2,'Javascript','CS','dzm0049',1,1),(3,'JSP','CS','dzm0049',1,1),(4,'Software Process','CS','tzs0001',2,3),(5,'HTML 5','CS','dzm0049',1,1),(6,'Operating Sysytem','CS','dzm0049',1,1),(7,'Algorithms','CS','dzm0049',1,1),(10,'Software Process','CS','dzm0049',1,1),(11,'Software Process','rgvea','tzs0001',2,1),(12,'User Interface','CS','tzs0001',2,1),(17,'English','CS','wzs0004',3,1),(18,'Poetry','Literature','wzs0004',3,1);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fregistration`
--

DROP TABLE IF EXISTS `fregistration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fregistration` (
  `freg_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ffirst_name` varchar(45) NOT NULL,
  `flast_name` varchar(45) NOT NULL,
  `f_email` varchar(45) NOT NULL,
  `fuser_name` varchar(45) NOT NULL,
  `f_password` varchar(45) NOT NULL,
  `fdepartment` varchar(45) NOT NULL,
  `fproject_details` longtext,
  PRIMARY KEY (`freg_id`),
  UNIQUE KEY `fuser_name_UNIQUE` (`fuser_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fregistration`
--

LOCK TABLES `fregistration` WRITE;
/*!40000 ALTER TABLE `fregistration` DISABLE KEYS */;
INSERT INTO `fregistration` VALUES (1,'Daniela','Marghitu','dzm0049@auburn.edu','dzm0049','1234','CS','No Projects available'),(2,'Tony','Stark','tzs0001@auburn.edu','tzs0001','1234','CS','A project based on Rocket Science.'),(3,'William','Shakespeare','wzs0004@auburn.edu','wzs0004','1234','English','No Projects'),(4,'Akshara','Amuri','aza0100@auburn.edu','aza0100','1234','CS','Workplace Safety'),(5,'Peter','Parker','pzp0100@auburn.edu','pzp0100','1234','ECE','Hello System');
/*!40000 ALTER TABLE `fregistration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_table`
--

DROP TABLE IF EXISTS `login_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_table` (
  `user_name` varchar(45) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_name`),
  UNIQUE KEY `user_name_UNIQUE` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_table`
--

LOCK TABLES `login_table` WRITE;
/*!40000 ALTER TABLE `login_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marks_table`
--

DROP TABLE IF EXISTS `marks_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marks_table` (
  `marks_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(45) NOT NULL,
  `assignment_number` int(11) NOT NULL,
  `stu_uname` varchar(45) NOT NULL,
  `faculty_uname` varchar(45) NOT NULL,
  `marks` int(11) NOT NULL,
  PRIMARY KEY (`marks_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marks_table`
--

LOCK TABLES `marks_table` WRITE;
/*!40000 ALTER TABLE `marks_table` DISABLE KEYS */;
INSERT INTO `marks_table` VALUES (1,'XML',1,'ravi060791','dzm0049',97),(2,'XML',1,'pzp0003','dzm0049',89),(3,'JSP',1,'wzw0002','dzm0049',67),(4,'HTML',2,'wzw0002','tzs0001',87),(5,'Java Script',2,'tzd0002','tzs0001',50);
/*!40000 ALTER TABLE `marks_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sregistration`
--

DROP TABLE IF EXISTS `sregistration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sregistration` (
  `sreg_id` int(11) NOT NULL AUTO_INCREMENT,
  `sfirst_name` varchar(45) NOT NULL,
  `slast_name` varchar(45) NOT NULL,
  `semail` varchar(45) NOT NULL,
  `suser_name` varchar(45) NOT NULL,
  `spassword` varchar(45) NOT NULL,
  `smajor` varchar(45) NOT NULL,
  `syear` int(11) NOT NULL,
  PRIMARY KEY (`sreg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sregistration`
--

LOCK TABLES `sregistration` WRITE;
/*!40000 ALTER TABLE `sregistration` DISABLE KEYS */;
INSERT INTO `sregistration` VALUES (1,'Ravinder','Putta','ravi060791@auburn.edu','ravi060791','1234','CS',2016),(2,'Tyler','Durden','tzd0002@auburn.edu','tzd0002','1234','CS',2015),(3,'Walker','White','wzw0002@auburn.edu','wzw0002','1234','CS',2015),(4,'Peter','Parker','pzp0003@auburn.edu','pzp0003','1234','CE',2014),(5,'xyz','str','xzs0900@auburn.edu','xzs0900','1234','CS',2020),(6,'Akshara','Amuri','aza0100@auburn.edu','aza0100','1234','CS',2017);
/*!40000 ALTER TABLE `sregistration` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-29 17:43:35
