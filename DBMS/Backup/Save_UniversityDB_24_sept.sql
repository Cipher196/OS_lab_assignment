-- MySQL dump 10.13  Distrib 8.0.46, for Linux (x86_64)
--
-- Host: localhost    Database: UniversityDB1
-- ------------------------------------------------------
-- Server version	8.0.46-0ubuntu0.22.04.4

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Attendance`
--

DROP TABLE IF EXISTS `Attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Attendance` (
  `AttendanceID` int NOT NULL,
  `StudentID` int DEFAULT NULL,
  `CourseID` int DEFAULT NULL,
  `Date` date NOT NULL,
  `Status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`AttendanceID`),
  UNIQUE KEY `StudentID` (`StudentID`,`CourseID`,`Date`),
  KEY `fk_attendance_courses` (`CourseID`),
  CONSTRAINT `fk_attendance_courses` FOREIGN KEY (`CourseID`) REFERENCES `Courses` (`CourseID`),
  CONSTRAINT `fk_attendance_students` FOREIGN KEY (`StudentID`) REFERENCES `Students` (`StudentID`),
  CONSTRAINT `Attendance_chk_1` CHECK ((`Status` in (_utf8mb4'Present',_utf8mb4'Absent',_utf8mb4'Late')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Attendance`
--

LOCK TABLES `Attendance` WRITE;
/*!40000 ALTER TABLE `Attendance` DISABLE KEYS */;
INSERT INTO `Attendance` VALUES (1,101,101,'2026-01-10','Present'),(2,101,101,'2026-01-17','Present'),(3,101,101,'2026-01-24','Late'),(4,101,102,'2026-01-11','Present'),(5,101,102,'2026-01-18','Absent'),(6,102,101,'2026-01-10','Present'),(7,102,101,'2026-01-17','Late'),(8,102,103,'2026-01-12','Present'),(9,102,103,'2026-01-19','Present'),(10,102,103,'2026-01-26','Absent'),(11,103,102,'2026-01-11','Present'),(12,103,102,'2026-01-18','Present'),(13,103,104,'2026-01-13','Late'),(14,103,104,'2026-01-20','Present'),(15,103,104,'2026-01-27','Present'),(16,104,103,'2026-01-12','Present'),(17,104,103,'2026-01-19','Present'),(18,104,105,'2026-01-14','Absent'),(19,104,105,'2026-01-21','Present'),(20,105,104,'2026-01-13','Present'),(21,105,104,'2026-01-20','Present'),(22,105,106,'2026-01-15','Late'),(23,105,106,'2026-01-22','Present'),(24,106,105,'2026-01-14','Present'),(25,106,105,'2026-01-21','Present'),(26,106,107,'2026-01-16','Absent'),(27,106,107,'2026-01-23','Present'),(28,107,106,'2026-01-15','Present'),(29,107,106,'2026-01-22','Present'),(30,107,108,'2026-01-17','Late'),(31,107,108,'2026-01-24','Present'),(32,108,107,'2026-01-16','Present'),(33,108,107,'2026-01-23','Present'),(34,108,109,'2026-01-18','Absent'),(35,108,109,'2026-01-25','Present'),(36,109,108,'2026-01-17','Present'),(37,109,108,'2026-01-24','Present'),(38,109,110,'2026-01-19','Late'),(39,109,110,'2026-01-26','Present'),(40,110,109,'2026-01-18','Present'),(41,110,109,'2026-01-25','Present'),(42,110,101,'2026-01-10','Absent'),(43,110,101,'2026-01-17','Present'),(44,111,110,'2026-01-19','Present'),(45,111,110,'2026-01-26','Present'),(46,111,102,'2026-01-11','Late'),(47,111,102,'2026-01-18','Present'),(48,112,101,'2026-01-10','Present'),(49,112,101,'2026-01-17','Present'),(50,112,103,'2026-01-12','Absent'),(51,112,103,'2026-01-19','Present'),(52,113,102,'2026-01-11','Present'),(53,113,102,'2026-01-18','Present'),(54,113,104,'2026-01-13','Late'),(55,113,104,'2026-01-20','Present'),(56,114,103,'2026-01-12','Present'),(57,114,103,'2026-01-19','Present'),(58,114,105,'2026-01-14','Absent'),(59,114,105,'2026-01-21','Present'),(60,115,104,'2026-01-13','Present'),(61,115,104,'2026-01-20','Present'),(62,115,106,'2026-01-15','Late'),(63,115,106,'2026-01-22','Present'),(64,116,105,'2026-01-14','Present'),(65,116,105,'2026-01-21','Present'),(66,116,107,'2026-01-16','Absent'),(67,116,107,'2026-01-23','Present'),(68,117,106,'2026-01-15','Present'),(69,117,106,'2026-01-22','Present'),(70,117,108,'2026-01-17','Late'),(71,117,108,'2026-01-24','Present'),(72,118,107,'2026-01-16','Present'),(73,118,107,'2026-01-23','Present'),(74,118,109,'2026-01-18','Absent'),(75,118,109,'2026-01-25','Present'),(76,119,108,'2026-01-17','Present'),(77,119,108,'2026-01-24','Present'),(78,119,110,'2026-01-19','Late'),(79,119,110,'2026-01-26','Present'),(80,120,109,'2026-01-18','Present'),(81,120,109,'2026-01-25','Present'),(82,120,101,'2026-01-10','Absent'),(83,120,101,'2026-01-17','Present'),(84,101,101,'2026-01-31','Present'),(85,101,102,'2026-02-01','Present'),(86,102,101,'2026-01-31','Late'),(87,102,103,'2026-02-02','Present'),(88,103,102,'2026-02-01','Present'),(89,103,104,'2026-02-03','Absent'),(90,104,103,'2026-02-02','Present'),(91,104,105,'2026-02-04','Present'),(92,105,104,'2026-02-03','Late'),(93,105,106,'2026-02-05','Present'),(94,106,105,'2026-02-04','Present'),(95,106,107,'2026-02-06','Absent'),(96,107,106,'2026-02-05','Present'),(97,107,108,'2026-02-07','Present'),(98,108,107,'2026-02-06','Late'),(99,108,109,'2026-02-08','Present'),(100,109,108,'2026-02-07','Present'),(101,109,110,'2026-02-09','Absent'),(102,110,109,'2026-02-08','Present'),(103,110,101,'2026-01-31','Present'),(104,111,110,'2026-02-09','Late'),(105,112,101,'2026-01-31','Present');
/*!40000 ALTER TABLE `Attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BookIssues`
--

DROP TABLE IF EXISTS `BookIssues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BookIssues` (
  `IssueID` int NOT NULL,
  `BookID` int DEFAULT NULL,
  `StudentID` int DEFAULT NULL,
  `IssueDate` date DEFAULT (curdate()),
  `ReturnDate` date DEFAULT NULL,
  PRIMARY KEY (`IssueID`),
  KEY `fk_bookissues_libararybooks` (`BookID`),
  KEY `fk_bookissues_students` (`StudentID`),
  CONSTRAINT `fk_bookissues_libararybooks` FOREIGN KEY (`BookID`) REFERENCES `LibararyBooks` (`BookID`),
  CONSTRAINT `fk_bookissues_students` FOREIGN KEY (`StudentID`) REFERENCES `Students` (`StudentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BookIssues`
--

LOCK TABLES `BookIssues` WRITE;
/*!40000 ALTER TABLE `BookIssues` DISABLE KEYS */;
INSERT INTO `BookIssues` VALUES (1,1,101,'2026-01-15','2026-02-15'),(2,1,102,'2026-01-16','2026-02-16'),(3,2,103,'2026-01-17','2026-02-17'),(4,2,104,'2026-01-18','2026-02-18'),(5,3,105,'2026-01-19','2026-02-19'),(6,3,106,'2026-01-20','2026-02-20'),(7,4,107,'2026-01-21','2026-02-21'),(8,4,108,'2026-01-22','2026-02-22'),(9,5,109,'2026-01-23','2026-02-23'),(10,5,110,'2026-01-24','2026-02-24'),(11,6,111,'2026-01-25','2026-02-25'),(12,6,112,'2026-01-26','2026-02-26'),(13,7,113,'2026-01-27','2026-02-27'),(14,7,114,'2026-01-28','2026-02-28'),(15,8,115,'2026-01-29','2026-03-01'),(16,8,116,'2026-01-30','2026-03-02'),(17,9,117,'2026-02-01','2026-03-03'),(18,9,118,'2026-02-02','2026-03-04'),(19,10,119,'2026-02-03','2026-03-05'),(20,10,120,'2026-02-04','2026-03-06'),(21,11,121,'2026-02-05','2026-03-07'),(22,11,122,'2026-02-06','2026-03-08'),(23,12,123,'2026-02-07','2026-03-09'),(24,12,124,'2026-02-08','2026-03-10'),(25,13,125,'2026-02-09','2026-03-11'),(26,13,126,'2026-02-10','2026-03-12'),(27,14,127,'2026-02-11','2026-03-13'),(28,14,128,'2026-02-12','2026-03-14'),(29,15,129,'2026-02-13','2026-03-15'),(30,15,130,'2026-02-14','2026-03-16'),(31,1,131,'2026-02-15','2026-03-15');
/*!40000 ALTER TABLE `BookIssues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Colleges`
--

DROP TABLE IF EXISTS `Colleges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Colleges` (
  `CollegeID` int NOT NULL,
  `CollegeName` varchar(50) NOT NULL,
  PRIMARY KEY (`CollegeID`),
  UNIQUE KEY `CollegeName` (`CollegeName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Colleges`
--

LOCK TABLES `Colleges` WRITE;
/*!40000 ALTER TABLE `Colleges` DISABLE KEYS */;
INSERT INTO `Colleges` VALUES (1,'Campus_1'),(2,'Campus_2'),(3,'Campus_3'),(4,'Campus_4'),(5,'Campus_5');
/*!40000 ALTER TABLE `Colleges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CourseFaculty`
--

DROP TABLE IF EXISTS `CourseFaculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CourseFaculty` (
  `CFID` int NOT NULL,
  `FacultyID` int DEFAULT NULL,
  `CourseID` int DEFAULT NULL,
  `semester` int NOT NULL,
  PRIMARY KEY (`CFID`),
  UNIQUE KEY `unique_fid_cid_sem` (`FacultyID`,`CourseID`,`semester`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CourseFaculty`
--

LOCK TABLES `CourseFaculty` WRITE;
/*!40000 ALTER TABLE `CourseFaculty` DISABLE KEYS */;
INSERT INTO `CourseFaculty` VALUES (1,1,101,1),(2,2,102,1),(3,3,103,1),(4,4,104,1),(5,5,105,1),(6,6,106,1),(7,7,107,1),(8,8,108,1),(9,9,109,1),(10,10,110,1),(11,11,111,2),(12,12,112,2),(13,13,113,2),(14,14,114,2),(15,15,115,2),(16,16,116,2),(17,17,117,2),(18,18,118,2),(19,19,119,2),(20,20,120,2);
/*!40000 ALTER TABLE `CourseFaculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Courses`
--

DROP TABLE IF EXISTS `Courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Courses` (
  `CourseID` int NOT NULL,
  `CourseName` varchar(30) NOT NULL,
  `Credits` int DEFAULT NULL,
  `DeptID` int NOT NULL,
  `SemesterOffered` int NOT NULL,
  `PrerequisiteCourseID` int DEFAULT NULL,
  PRIMARY KEY (`CourseID`),
  KEY `fk_courses_departments` (`DeptID`),
  KEY `fk_courses_courses` (`PrerequisiteCourseID`),
  CONSTRAINT `fk_courses_courses` FOREIGN KEY (`PrerequisiteCourseID`) REFERENCES `Courses` (`CourseID`),
  CONSTRAINT `fk_courses_departments` FOREIGN KEY (`DeptID`) REFERENCES `Departments` (`DeptID`),
  CONSTRAINT `Courses_chk_1` CHECK (((1 <= `Credits`) and (`Credits` <= 6)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Courses`
--

LOCK TABLES `Courses` WRITE;
/*!40000 ALTER TABLE `Courses` DISABLE KEYS */;
INSERT INTO `Courses` VALUES (101,'Introduction to Programming',3,1,1,NULL),(102,'Calculus I',4,2,1,NULL),(103,'Physics I',4,3,1,NULL),(104,'Chemistry I',4,4,1,NULL),(105,'Biology I',4,5,1,NULL),(106,'English Composition',3,6,1,NULL),(107,'Introduction to Psychology',3,7,1,NULL),(108,'World History',3,8,1,NULL),(109,'Introduction to Sociology',3,9,1,NULL),(110,'Statistics I',3,10,1,NULL),(111,'Data Structures',4,1,2,101),(112,'Calculus II',4,2,2,102),(113,'Physics II',4,3,2,103),(114,'Chemistry II',4,4,2,104),(115,'Biology II',4,5,2,105),(116,'Advanced Writing',3,6,2,106),(117,'Cognitive Psychology',3,7,2,107),(118,'Modern History',3,8,2,108),(119,'Social Theory',3,9,2,109),(120,'Statistics II',3,10,2,110),(121,'Advanced Programming',4,1,3,111),(122,'Linear Algebra',4,2,3,112),(123,'Thermodynamics',4,3,3,113),(124,'Organic Chemistry',4,4,3,114),(125,'Genetics',4,5,3,115),(126,'Technical Writing',3,6,3,116),(127,'Neuroscience',3,7,3,117),(128,'Ancient History',3,8,3,118),(129,'Research Methods',3,9,3,119),(130,'Probability Theory',3,10,3,120);
/*!40000 ALTER TABLE `Courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Departments`
--

DROP TABLE IF EXISTS `Departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Departments` (
  `DeptID` int NOT NULL,
  `DeptName` varchar(30) NOT NULL,
  `CollegeID` int NOT NULL,
  `HODFacultyID` int DEFAULT NULL,
  PRIMARY KEY (`DeptID`),
  UNIQUE KEY `DeptName` (`DeptName`),
  KEY `CollegeID` (`CollegeID`),
  KEY `HODFacultyID` (`HODFacultyID`),
  CONSTRAINT `Departments_ibfk_1` FOREIGN KEY (`CollegeID`) REFERENCES `Colleges` (`CollegeID`),
  CONSTRAINT `Departments_ibfk_2` FOREIGN KEY (`HODFacultyID`) REFERENCES `Faculty` (`FacultyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Departments`
--

LOCK TABLES `Departments` WRITE;
/*!40000 ALTER TABLE `Departments` DISABLE KEYS */;
INSERT INTO `Departments` VALUES (1,'Department_1',2,10),(2,'Department_2',3,1),(3,'Department_3',4,2),(4,'Department_4',5,3),(5,'Department_5',1,4),(6,'Department_6',2,5),(7,'Department_7',3,6),(8,'Department_8',4,7),(9,'Department_9',5,8),(10,'Department_10',1,9);
/*!40000 ALTER TABLE `Departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Enrollments`
--

DROP TABLE IF EXISTS `Enrollments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Enrollments` (
  `EnrollmentID` int NOT NULL,
  `StudentID` int DEFAULT NULL,
  `CourseID` int DEFAULT NULL,
  `Semester` int NOT NULL,
  `Grade` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`EnrollmentID`),
  UNIQUE KEY `unique_sid_cid_sem` (`StudentID`,`CourseID`,`Semester`),
  CONSTRAINT `Enrollments_chk_1` CHECK (((`Grade` in (_utf8mb4'A',_utf8mb4'B',_utf8mb4'C',_utf8mb4'D',_utf8mb4'E',_utf8mb4'F')) or (`Grade` is null))),
  CONSTRAINT `Enrollments_chk_2` CHECK ((`Grade` in (_utf8mb4'A',_utf8mb4'B',_utf8mb4'C',_utf8mb4'D',_utf8mb4'E',_utf8mb4'F',_utf8mb4'I')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Enrollments`
--

LOCK TABLES `Enrollments` WRITE;
/*!40000 ALTER TABLE `Enrollments` DISABLE KEYS */;
INSERT INTO `Enrollments` VALUES (1,101,101,1,'A'),(2,101,102,1,'B'),(3,102,101,1,'C'),(4,102,103,1,'A'),(5,103,102,1,'B'),(6,103,104,1,'A'),(7,104,103,1,'C'),(8,104,105,1,'B'),(9,105,104,1,'A'),(10,105,106,1,'A'),(11,106,105,1,'B'),(12,106,107,1,'C'),(13,107,106,1,'A'),(14,107,108,1,'B'),(15,108,107,1,'B'),(16,108,109,1,'A'),(17,109,108,1,'C'),(18,109,110,1,'B'),(19,110,109,1,'A'),(20,110,101,1,'B'),(21,111,110,1,'A'),(22,111,102,1,'C'),(23,112,101,1,'B'),(24,112,103,1,'A'),(25,113,102,1,'B'),(26,113,104,1,'C'),(27,114,103,1,'A'),(28,114,105,1,'B'),(29,115,104,1,'A'),(30,115,106,1,'B'),(31,116,105,1,'C'),(32,116,107,1,'A'),(33,117,106,1,'B'),(34,117,108,1,'A'),(35,118,107,1,'B'),(36,118,109,1,'C'),(37,119,108,1,'A'),(38,119,110,1,'B'),(39,120,109,1,'A'),(40,120,101,1,'B'),(41,121,111,2,'A'),(42,121,112,2,'B'),(43,122,111,2,'C'),(44,122,113,2,'A'),(45,123,112,2,'B'),(46,123,114,2,'A'),(47,124,113,2,'B'),(48,124,115,2,'C'),(49,125,114,2,'A'),(50,125,116,2,'B');
/*!40000 ALTER TABLE `Enrollments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ExamResults`
--

DROP TABLE IF EXISTS `ExamResults`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ExamResults` (
  `ResultID` int NOT NULL,
  `ExamID` int DEFAULT NULL,
  `StudentID` int DEFAULT NULL,
  `MarksObtained` int DEFAULT NULL,
  PRIMARY KEY (`ResultID`),
  UNIQUE KEY `unique_examid_studentid` (`ExamID`,`StudentID`),
  CONSTRAINT `ExamResults_chk_1` CHECK ((`MarksObtained` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ExamResults`
--

LOCK TABLES `ExamResults` WRITE;
/*!40000 ALTER TABLE `ExamResults` DISABLE KEYS */;
INSERT INTO `ExamResults` VALUES (1,1,101,85),(2,1,102,75),(3,1,103,90),(4,1,104,70),(5,1,105,88),(6,2,101,82),(7,2,102,78),(8,2,103,92),(9,2,104,72),(10,2,105,85),(11,3,101,79),(12,3,106,85),(13,3,107,75),(14,3,108,88),(15,3,109,70),(16,4,101,81),(17,4,106,87),(18,4,107,78),(19,4,108,90),(20,4,109,72),(21,5,102,83),(22,5,103,76),(23,5,110,91),(24,5,111,74),(25,5,112,86),(26,6,102,85),(27,6,103,80),(28,6,110,93),(29,6,111,76),(30,6,112,88),(31,7,104,77),(32,7,105,89),(33,7,113,72),(34,7,114,84),(35,7,115,90),(36,8,104,80),(37,8,105,91),(38,8,113,75),(39,8,114,86),(40,8,115,92),(41,9,106,88),(42,9,107,74),(43,9,116,83),(44,9,117,79),(45,9,118,90),(46,10,106,90),(47,10,107,76),(48,10,116,85),(49,10,117,82),(50,10,118,91);
/*!40000 ALTER TABLE `ExamResults` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Exams`
--

DROP TABLE IF EXISTS `Exams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Exams` (
  `ExamID` int NOT NULL,
  `CourseID` int DEFAULT NULL,
  `ExamDate` date NOT NULL,
  `MaxMarks` int DEFAULT NULL,
  PRIMARY KEY (`ExamID`),
  KEY `fk_exams_courses` (`CourseID`),
  CONSTRAINT `fk_exams_courses` FOREIGN KEY (`CourseID`) REFERENCES `Courses` (`CourseID`),
  CONSTRAINT `Exams_chk_1` CHECK ((`MaxMarks` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Exams`
--

LOCK TABLES `Exams` WRITE;
/*!40000 ALTER TABLE `Exams` DISABLE KEYS */;
INSERT INTO `Exams` VALUES (1,101,'2026-02-15',100),(2,101,'2026-03-15',100),(3,102,'2026-02-16',100),(4,102,'2026-03-16',100),(5,103,'2026-02-17',100),(6,103,'2026-03-17',100),(7,104,'2026-02-18',100),(8,104,'2026-03-18',100),(9,105,'2026-02-19',100),(10,105,'2026-03-19',100),(11,106,'2026-02-20',100),(12,106,'2026-03-20',100),(13,107,'2026-02-21',100),(14,107,'2026-03-21',100),(15,108,'2026-02-22',100),(16,108,'2026-03-22',100),(17,109,'2026-02-23',100),(18,109,'2026-03-23',100),(19,110,'2026-02-24',100),(20,110,'2026-03-24',100);
/*!40000 ALTER TABLE `Exams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Faculty`
--

DROP TABLE IF EXISTS `Faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Faculty` (
  `FacultyID` int NOT NULL,
  `Name` varchar(50) NOT NULL,
  `DeptID` int NOT NULL,
  `Designation` varchar(30) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Phone` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`FacultyID`),
  UNIQUE KEY `Email` (`Email`),
  UNIQUE KEY `Phone` (`Phone`),
  KEY `DeptID` (`DeptID`),
  CONSTRAINT `Faculty_ibfk_1` FOREIGN KEY (`DeptID`) REFERENCES `Departments` (`DeptID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Faculty`
--

LOCK TABLES `Faculty` WRITE;
/*!40000 ALTER TABLE `Faculty` DISABLE KEYS */;
INSERT INTO `Faculty` VALUES (1,'Prof_User1',2,'Assistant Professor','fac1@univ.edu','9800000001'),(2,'Prof_User2',3,'Professor','fac2@univ.edu','9800000002'),(3,'Prof_User3',4,'Assistant Professor','fac3@univ.edu','9800000003'),(4,'Prof_User4',5,'Professor','fac4@univ.edu','9800000004'),(5,'Prof_User5',6,'Assistant Professor','fac5@univ.edu','9800000005'),(6,'Prof_User6',7,'Professor','fac6@univ.edu','9800000006'),(7,'Prof_User7',8,'Assistant Professor','fac7@univ.edu','9800000007'),(8,'Prof_User8',9,'Professor','fac8@univ.edu','9800000008'),(9,'Prof_User9',10,'Assistant Professor','fac9@univ.edu','9800000009'),(10,'Prof_User10',1,'Professor','fac10@univ.edu','9800000010'),(11,'Prof_User11',2,'Assistant Professor','fac11@univ.edu','9800000011'),(12,'Prof_User12',3,'Professor','fac12@univ.edu','9800000012'),(13,'Prof_User13',4,'Assistant Professor','fac13@univ.edu','9800000013'),(14,'Prof_User14',5,'Professor','fac14@univ.edu','9800000014'),(15,'Prof_User15',6,'Assistant Professor','fac15@univ.edu','9800000015'),(16,'Prof_User16',7,'Professor','fac16@univ.edu','9800000016'),(17,'Prof_User17',8,'Assistant Professor','fac17@univ.edu','9800000017'),(18,'Prof_User18',9,'Professor','fac18@univ.edu','9800000018'),(19,'Prof_User19',10,'Assistant Professor','fac19@univ.edu','9800000019'),(20,'Prof_User20',1,'Professor','fac20@univ.edu','9800000020'),(21,'Prof_User21',1,'Assistant Professor','fac21@univ.edu','9800000021'),(22,'Prof_User22',2,'Professor','fac22@univ.edu','9800000022'),(23,'Prof_User23',3,'Assistant Professor','fac23@univ.edu','9800000023'),(24,'Prof_User24',4,'Professor','fac24@univ.edu','9800000024'),(25,'Prof_User25',5,'Assistant Professor','fac25@univ.edu','9800000025'),(26,'Prof_User26',6,'Professor','fac26@univ.edu','9800000026'),(27,'Prof_User27',7,'Assistant Professor','fac27@univ.edu','9800000027'),(28,'Prof_User28',8,'Professor','fac28@univ.edu','9800000028'),(29,'Prof_User29',9,'Assistant Professor','fac29@univ.edu','9800000029'),(30,'Prof_User30',10,'Professor','fac30@univ.edu','9800000030');
/*!40000 ALTER TABLE `Faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HostelAllotment`
--

DROP TABLE IF EXISTS `HostelAllotment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HostelAllotment` (
  `AllotmentID` int NOT NULL,
  `HostelID` int DEFAULT NULL,
  `StudentID` int DEFAULT NULL,
  `RoomNo` varchar(10) NOT NULL,
  PRIMARY KEY (`AllotmentID`),
  UNIQUE KEY `StudentID` (`StudentID`),
  UNIQUE KEY `HostelID` (`HostelID`,`RoomNo`),
  CONSTRAINT `fk_hostelallotment_hostels` FOREIGN KEY (`HostelID`) REFERENCES `Hostels` (`HostelID`),
  CONSTRAINT `fk_hostelallotment_students` FOREIGN KEY (`StudentID`) REFERENCES `Students` (`StudentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HostelAllotment`
--

LOCK TABLES `HostelAllotment` WRITE;
/*!40000 ALTER TABLE `HostelAllotment` DISABLE KEYS */;
INSERT INTO `HostelAllotment` VALUES (1,1,101,'101A'),(2,1,102,'101B'),(3,1,103,'102A'),(4,1,104,'102B'),(5,1,105,'103A'),(6,1,106,'103B'),(7,1,107,'104A'),(8,1,108,'104B'),(9,1,109,'105A'),(10,1,110,'105B'),(11,2,111,'201A'),(12,2,112,'201B'),(13,2,113,'202A'),(14,2,114,'202B'),(15,2,115,'203A'),(16,2,116,'203B'),(17,2,117,'204A'),(18,2,118,'204B'),(19,2,119,'205A'),(20,2,120,'205B'),(21,3,121,'301A'),(22,3,122,'301B'),(23,3,123,'302A'),(24,3,124,'302B'),(25,3,125,'303A'),(26,3,126,'303B'),(27,3,127,'304A'),(28,3,128,'304B'),(29,3,129,'305A'),(30,3,130,'305B'),(31,4,131,'401A'),(32,4,132,'401B'),(33,4,133,'402A'),(34,4,134,'402B'),(35,4,135,'403A'),(36,4,136,'403B'),(37,4,137,'404A'),(38,4,138,'404B'),(39,4,139,'405A'),(40,4,140,'405B'),(41,5,141,'501A'),(42,5,142,'501B'),(43,5,143,'502A'),(44,5,144,'502B'),(45,5,145,'503A'),(46,5,146,'503B'),(47,5,147,'504A'),(48,5,148,'504B'),(49,5,149,'505A'),(50,5,150,'505B');
/*!40000 ALTER TABLE `HostelAllotment` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`devuser`@`localhost`*/ /*!50003 TRIGGER `hostel_is_full` BEFORE INSERT ON `HostelAllotment` FOR EACH ROW begin declare curr_occupancy int; declare max_occupancy int;  select count(*) into curr_occupancy from HostelAllotment where HostelID = new.HostelID;  select Capacity into max_occupancy from Hostels where HostelID = new.HostelID;  if curr_occupancy >= max_occupancy then signal sqlstate '45000' set message_text = 'Hostel is full. Cannot add more students. :( '; end if; end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Hostels`
--

DROP TABLE IF EXISTS `Hostels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Hostels` (
  `HostelID` int NOT NULL,
  `HostelName` varchar(100) DEFAULT NULL,
  `Capacity` int DEFAULT NULL,
  PRIMARY KEY (`HostelID`),
  UNIQUE KEY `HostelName` (`HostelName`),
  CONSTRAINT `Hostels_chk_1` CHECK ((`Capacity` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Hostels`
--

LOCK TABLES `Hostels` WRITE;
/*!40000 ALTER TABLE `Hostels` DISABLE KEYS */;
INSERT INTO `Hostels` VALUES (1,'Hostel_A',50),(2,'Hostel_B',40),(3,'Hostel_C',45),(4,'Hostel_D',35),(5,'Hostel_E',50),(6,'Hostel_F',30),(7,'Hostel_G',40),(8,'Hostel_H',45),(9,'Hostel_I',35),(10,'Hostel_J',50);
/*!40000 ALTER TABLE `Hostels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LibararyBooks`
--

DROP TABLE IF EXISTS `LibararyBooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LibararyBooks` (
  `BookID` int NOT NULL,
  `Title` varchar(200) NOT NULL,
  `Author` varchar(100) NOT NULL,
  `Publisher` varchar(100) NOT NULL,
  `ISBN` varchar(20) DEFAULT NULL,
  `Edition` varchar(20) DEFAULT NULL,
  `YearPublished` smallint DEFAULT NULL,
  `DeptID` int DEFAULT NULL,
  `CopiesAvailable` int DEFAULT NULL,
  PRIMARY KEY (`BookID`),
  UNIQUE KEY `ISBN` (`ISBN`),
  KEY `fk_libararybooks_departments` (`DeptID`),
  CONSTRAINT `fk_libararybooks_departments` FOREIGN KEY (`DeptID`) REFERENCES `Departments` (`DeptID`),
  CONSTRAINT `LibararyBooks_chk_1` CHECK (((`YearPublished` > 0) and (`YearPublished` < 100000))),
  CONSTRAINT `LibararyBooks_chk_2` CHECK ((`CopiesAvailable` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LibararyBooks`
--

LOCK TABLES `LibararyBooks` WRITE;
/*!40000 ALTER TABLE `LibararyBooks` DISABLE KEYS */;
INSERT INTO `LibararyBooks` VALUES (1,'Introduction to Programming','John Smith','TechPress','978-0-123-45678-9','3rd',2020,1,0),(2,'Data Structures and Algorithms','Jane Doe','Academic Press','978-0-234-56789-0','2nd',2021,1,3),(3,'Calculus: A Complete Course','Robert Johnson','MathPub','978-0-345-67890-1','9th',2019,2,4),(4,'Linear Algebra','Mary Williams','Science House','978-0-456-78901-2','4th',2020,2,3),(5,'University Physics','James Brown','Physics Press','978-0-567-89012-3','14th',2018,3,5),(6,'Thermodynamics for Engineers','Patricia Davis','EngBooks','978-0-678-90123-4','2nd',2021,3,2),(7,'Chemistry: The Central Science','Michael Miller','ChemPress','978-0-789-01234-5','14th',2017,4,4),(8,'Organic Chemistry','Barbara Wilson','Science Publishers','978-0-890-12345-6','3rd',2020,4,3),(9,'Biology: A Global Approach','David Moore','BioPress','978-0-901-23456-7','11th',2019,5,5),(10,'Genetics','Susan Taylor','Genome Press','978-0-012-34567-8','4th',2021,5,2),(11,'The Elements of Style','William Strunk','Grammar Press','978-0-123-45678-0','4th',2020,6,5),(12,'On Writing Well','William Zinsser','Writer\'s House','978-0-234-56789-1','3rd',2018,6,3),(13,'Psychology: Themes and Variations','Richard Gregory','PsychPress','978-0-345-67890-2','10th',2019,7,4),(14,'Cognitive Psychology','Edward Gibson','Mind Publishers','978-0-456-78901-3','3rd',2020,7,3),(15,'World History','Kenneth Clark','History Press','978-0-567-89012-4','7th',2017,8,5);
/*!40000 ALTER TABLE `LibararyBooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payments`
--

DROP TABLE IF EXISTS `Payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Payments` (
  `PaymentID` int NOT NULL,
  `StudentID` int DEFAULT NULL,
  `Amount` decimal(10,2) DEFAULT NULL,
  `Date` date DEFAULT (curdate()),
  `PaymentType` varchar(20) DEFAULT NULL,
  `Status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`PaymentID`),
  UNIQUE KEY `unique_student_payment_date` (`StudentID`,`PaymentType`,`Date`),
  KEY `fk_payments_students` (`StudentID`),
  CONSTRAINT `fk_payments_students` FOREIGN KEY (`StudentID`) REFERENCES `Students` (`StudentID`),
  CONSTRAINT `Payments_chk_1` CHECK ((`Amount` > 0)),
  CONSTRAINT `Payments_chk_2` CHECK ((`PaymentType` in (_utf8mb4'Tuition',_utf8mb4'Hostel',_utf8mb4'Fine',_utf8mb4'Other'))),
  CONSTRAINT `Payments_chk_3` CHECK ((`Status` in (_utf8mb4'Paid',_utf8mb4'Pending')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payments`
--

LOCK TABLES `Payments` WRITE;
/*!40000 ALTER TABLE `Payments` DISABLE KEYS */;
INSERT INTO `Payments` VALUES (1,101,10000.00,'2026-01-10','Tuition','Pending'),(2,101,2000.00,'2026-01-20','Hostel','Paid'),(3,102,5000.00,'2026-01-11','Tuition','Paid'),(4,102,2000.00,'2026-01-21','Hostel','Pending'),(5,103,5000.00,'2026-01-12','Tuition','Paid'),(6,103,500.00,'2026-01-25','Fine','Paid'),(7,104,5000.00,'2026-01-13','Tuition','Paid'),(8,104,2000.00,'2026-01-22','Hostel','Pending'),(9,105,5000.00,'2026-01-14','Tuition','Paid'),(10,105,300.00,'2026-01-28','Fine','Paid'),(11,101,NULL,'2026-09-06',NULL,'Pending');
/*!40000 ALTER TABLE `Payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Programs`
--

DROP TABLE IF EXISTS `Programs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Programs` (
  `ProgramID` int NOT NULL,
  `ProgramName` varchar(50) NOT NULL,
  `DegreeType` varchar(20) DEFAULT NULL,
  `DeptID` int NOT NULL,
  PRIMARY KEY (`ProgramID`),
  UNIQUE KEY `ProgramName` (`ProgramName`,`DeptID`),
  KEY `DeptID` (`DeptID`),
  CONSTRAINT `Programs_ibfk_1` FOREIGN KEY (`DeptID`) REFERENCES `Departments` (`DeptID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Programs`
--

LOCK TABLES `Programs` WRITE;
/*!40000 ALTER TABLE `Programs` DISABLE KEYS */;
INSERT INTO `Programs` VALUES (1,'Course_1','MTech',2),(2,'Course_2','PhD',3),(3,'Course_3','BTech',4),(4,'Course_4','MTech',5),(5,'Course_5','PhD',6),(6,'Course_6','BTech',7),(7,'Course_7','MTech',8),(8,'Course_8','PhD',9),(9,'Course_9','BTech',10),(10,'Course_10','MTech',1),(11,'Course_11','PhD',2),(12,'Course_12','BTech',3),(13,'Course_13','MTech',4),(14,'Course_14','PhD',5),(15,'Course_15','BTech',6);
/*!40000 ALTER TABLE `Programs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Students`
--

DROP TABLE IF EXISTS `Students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Students` (
  `StudentID` int NOT NULL,
  `Name` varchar(50) NOT NULL,
  `DOB` date DEFAULT NULL,
  `Gender` char(1) DEFAULT NULL,
  `AdmissionYear` int DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Phone` varchar(10) DEFAULT NULL,
  `ProgramID` int NOT NULL,
  PRIMARY KEY (`StudentID`),
  UNIQUE KEY `Email` (`Email`),
  UNIQUE KEY `Phone` (`Phone`),
  KEY `ProgramID` (`ProgramID`),
  CONSTRAINT `Students_ibfk_1` FOREIGN KEY (`ProgramID`) REFERENCES `Programs` (`ProgramID`),
  CONSTRAINT `Students_chk_1` CHECK ((`Gender` in (_utf8mb4'M',_utf8mb4'F',_utf8mb4'O'))),
  CONSTRAINT `Students_chk_2` CHECK ((`AdmissionYear` >= 2000))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Students`
--

LOCK TABLES `Students` WRITE;
/*!40000 ALTER TABLE `Students` DISABLE KEYS */;
INSERT INTO `Students` VALUES (101,'Student_1','2002-01-02','F',2021,'student1@univ.edu','9000000101',2),(102,'Student_2','2002-01-03','O',2022,'student2@univ.edu','9000000102',3),(103,'Student_3','2002-01-04','M',2023,'student3@univ.edu','9000000103',4),(104,'Student_4','2002-01-05','F',2020,'student4@univ.edu','9000000104',5),(105,'Student_5','2002-01-06','O',2021,'student5@univ.edu','9000000105',6),(106,'Student_6','2002-01-07','M',2022,'student6@univ.edu','9000000106',7),(107,'Student_7','2002-01-08','F',2023,'student7@univ.edu','9000000107',8),(108,'Student_8','2002-01-09','O',2020,'student8@univ.edu','9000000108',9),(109,'Student_9','2002-01-10','M',2021,'student9@univ.edu','9000000109',10),(110,'Student_10','2002-01-11','F',2022,'student10@univ.edu','9000000110',11),(111,'Student_11','2002-01-12','O',2023,'student11@univ.edu','9000000111',12),(112,'Student_12','2002-01-13','M',2020,'student12@univ.edu','9000000112',13),(113,'Student_13','2002-01-14','F',2021,'student13@univ.edu','9000000113',14),(114,'Student_14','2002-01-15','O',2022,'student14@univ.edu','9000000114',15),(115,'Student_15','2002-01-16','M',2023,'student15@univ.edu','9000000115',1),(116,'Student_16','2002-01-17','F',2020,'student16@univ.edu','9000000116',2),(117,'Student_17','2002-01-18','O',2021,'student17@univ.edu','9000000117',3),(118,'Student_18','2002-01-19','M',2022,'student18@univ.edu','9000000118',4),(119,'Student_19','2002-01-20','F',2023,'student19@univ.edu','9000000119',5),(120,'Student_20','2002-01-21','O',2020,'student20@univ.edu','9000000120',6),(121,'Student_21','2002-01-22','M',2021,'student21@univ.edu','9000000121',7),(122,'Student_22','2002-01-23','F',2022,'student22@univ.edu','9000000122',8),(123,'Student_23','2002-01-24','O',2023,'student23@univ.edu','9000000123',9),(124,'Student_24','2002-01-25','M',2020,'student24@univ.edu','9000000124',10),(125,'Student_25','2002-01-26','F',2021,'student25@univ.edu','9000000125',11),(126,'Student_26','2002-01-27','O',2022,'student26@univ.edu','9000000126',12),(127,'Student_27','2002-01-28','M',2023,'student27@univ.edu','9000000127',13),(128,'Student_28','2002-01-29','F',2020,'student28@univ.edu','9000000128',14),(129,'Student_29','2002-01-30','O',2021,'student29@univ.edu','9000000129',15),(130,'Student_30','2002-01-31','M',2022,'student30@univ.edu','9000000130',1),(131,'Student_31','2002-02-01','F',2023,'student31@univ.edu','9000000131',2),(132,'Student_32','2002-02-02','O',2020,'student32@univ.edu','9000000132',3),(133,'Student_33','2002-02-03','M',2021,'student33@univ.edu','9000000133',4),(134,'Student_34','2002-02-04','F',2022,'student34@univ.edu','9000000134',5),(135,'Student_35','2002-02-05','O',2023,'student35@univ.edu','9000000135',6),(136,'Student_36','2002-02-06','M',2020,'student36@univ.edu','9000000136',7),(137,'Student_37','2002-02-07','F',2021,'student37@univ.edu','9000000137',8),(138,'Student_38','2002-02-08','O',2022,'student38@univ.edu','9000000138',9),(139,'Student_39','2002-02-09','M',2023,'student39@univ.edu','9000000139',10),(140,'Student_40','2002-02-10','F',2020,'student40@univ.edu','9000000140',11),(141,'Student_41','2002-02-11','O',2021,'student41@univ.edu','9000000141',12),(142,'Student_42','2002-02-12','M',2022,'student42@univ.edu','9000000142',13),(143,'Student_43','2002-02-13','F',2023,'student43@univ.edu','9000000143',14),(144,'Student_44','2002-02-14','O',2020,'student44@univ.edu','9000000144',15),(145,'Student_45','2002-02-15','M',2021,'student45@univ.edu','9000000145',1),(146,'Student_46','2002-02-16','F',2022,'student46@univ.edu','9000000146',2),(147,'Student_47','2002-02-17','O',2023,'student47@univ.edu','9000000147',3),(148,'Student_48','2002-02-18','M',2020,'student48@univ.edu','9000000148',4),(149,'Student_49','2002-02-19','F',2021,'student49@univ.edu','9000000149',5),(150,'Student_50','2002-02-20','O',2022,'student50@univ.edu','9000000150',6),(151,'Student_51','2002-02-21','M',2023,'student51@univ.edu','9000000151',7),(152,'Student_52','2002-02-22','F',2020,'student52@univ.edu','9000000152',8),(153,'Student_53','2002-02-23','O',2021,'student53@univ.edu','9000000153',9),(154,'Student_54','2002-02-24','M',2022,'student54@univ.edu','9000000154',10),(155,'Student_55','2002-02-25','F',2023,'student55@univ.edu','9000000155',11),(156,'Student_56','2002-02-26','O',2020,'student56@univ.edu','9000000156',12),(157,'Student_57','2002-02-27','M',2021,'student57@univ.edu','9000000157',13),(158,'Student_58','2002-02-28','F',2022,'student58@univ.edu','9000000158',14),(159,'Student_59','2002-03-01','O',2023,'student59@univ.edu','9000000159',15),(160,'Student_60','2002-03-02','M',2020,'student60@univ.edu','9000000160',1),(161,'Student_61','2002-03-03','F',2021,'student61@univ.edu','9000000161',2),(162,'Student_62','2002-03-04','O',2022,'student62@univ.edu','9000000162',3),(163,'Student_63','2002-03-05','M',2023,'student63@univ.edu','9000000163',4),(164,'Student_64','2002-03-06','F',2020,'student64@univ.edu','9000000164',5),(165,'Student_65','2002-03-07','O',2021,'student65@univ.edu','9000000165',6),(166,'Student_66','2002-03-08','M',2022,'student66@univ.edu','9000000166',7),(167,'Student_67','2002-03-09','F',2023,'student67@univ.edu','9000000167',8),(168,'Student_68','2002-03-10','O',2020,'student68@univ.edu','9000000168',9),(169,'Student_69','2002-03-11','M',2021,'student69@univ.edu','9000000169',10),(170,'Student_70','2002-03-12','F',2022,'student70@univ.edu','9000000170',11),(171,'Student_71','2002-03-13','O',2023,'student71@univ.edu','9000000171',12),(172,'Student_72','2002-03-14','M',2020,'student72@univ.edu','9000000172',13),(173,'Student_73','2002-03-15','F',2021,'student73@univ.edu','9000000173',14),(174,'Student_74','2002-03-16','O',2022,'student74@univ.edu','9000000174',15),(175,'Student_75','2002-03-17','M',2023,'student75@univ.edu','9000000175',1),(176,'Student_76','2002-03-18','F',2020,'student76@univ.edu','9000000176',2),(177,'Student_77','2002-03-19','O',2021,'student77@univ.edu','9000000177',3),(178,'Student_78','2002-03-20','M',2022,'student78@univ.edu','9000000178',4),(179,'Student_79','2002-03-21','F',2023,'student79@univ.edu','9000000179',5),(180,'Student_80','2002-03-22','O',2020,'student80@univ.edu','9000000180',6),(181,'Student_81','2002-03-23','M',2021,'student81@univ.edu','9000000181',7),(182,'Student_82','2002-03-24','F',2022,'student82@univ.edu','9000000182',8),(183,'Student_83','2002-03-25','O',2023,'student83@univ.edu','9000000183',9),(184,'Student_84','2002-03-26','M',2020,'student84@univ.edu','9000000184',10),(185,'Student_85','2002-03-27','F',2021,'student85@univ.edu','9000000185',11),(186,'Student_86','2002-03-28','O',2022,'student86@univ.edu','9000000186',12),(187,'Student_87','2002-03-29','M',2023,'student87@univ.edu','9000000187',13),(188,'Student_88','2002-03-30','F',2020,'student88@univ.edu','9000000188',14),(189,'Student_89','2002-03-31','O',2021,'student89@univ.edu','9000000189',15),(190,'Student_90','2002-04-01','M',2022,'student90@univ.edu','9000000190',1),(191,'Student_91','2002-04-02','F',2023,'student91@univ.edu','9000000191',2),(192,'Student_92','2002-04-03','O',2020,'student92@univ.edu','9000000192',3),(193,'Student_93','2002-04-04','M',2021,'student93@univ.edu','9000000193',4),(194,'Student_94','2002-04-05','F',2022,'student94@univ.edu','9000000194',5),(195,'Student_95','2002-04-06','O',2023,'student95@univ.edu','9000000195',6),(196,'Student_96','2002-04-07','M',2020,'student96@univ.edu','9000000196',7),(197,'Student_97','2002-04-08','F',2021,'student97@univ.edu','9000000197',8),(198,'Student_98','2002-04-09','O',2022,'student98@univ.edu','9000000198',9),(199,'Student_99','2002-04-10','M',2023,'student99@univ.edu','9000000199',10),(200,'Student_100','2002-04-11','F',2020,'student100@univ.edu','9000000200',11),(201,'sam',NULL,NULL,2025,NULL,NULL,3),(202,'Khan',NULL,NULL,2024,NULL,NULL,3);
/*!40000 ALTER TABLE `Students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Timetable`
--

DROP TABLE IF EXISTS `Timetable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Timetable` (
  `TimetableID` int NOT NULL,
  `courseID` int DEFAULT NULL,
  `FacultyID` int DEFAULT NULL,
  `Day` enum('Mon','Tue','Wed','Thu','Fri','Sat','Sun') NOT NULL,
  `TimeSlot` varchar(20) NOT NULL,
  `RoomNo` varchar(20) NOT NULL,
  PRIMARY KEY (`TimetableID`),
  UNIQUE KEY `RoomNo` (`RoomNo`,`Day`,`TimeSlot`),
  UNIQUE KEY `FacultyID` (`FacultyID`,`Day`,`TimeSlot`),
  KEY `fk_timetable_courses` (`courseID`),
  CONSTRAINT `fk_timetable_courses` FOREIGN KEY (`courseID`) REFERENCES `Courses` (`CourseID`),
  CONSTRAINT `fk_timetable_faculty` FOREIGN KEY (`FacultyID`) REFERENCES `Faculty` (`FacultyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Timetable`
--

LOCK TABLES `Timetable` WRITE;
/*!40000 ALTER TABLE `Timetable` DISABLE KEYS */;
INSERT INTO `Timetable` VALUES (1,101,1,'Mon','09:00-10:30','Room_101'),(2,102,2,'Mon','11:00-12:30','Room_102'),(3,103,3,'Mon','14:00-15:30','Room_103'),(4,104,4,'Mon','16:00-17:30','Room_104'),(5,105,5,'Tue','09:00-10:30','Room_105'),(6,106,6,'Tue','11:00-12:30','Room_106'),(7,107,7,'Tue','14:00-15:30','Room_107'),(8,108,8,'Tue','16:00-17:30','Room_108'),(9,109,9,'Wed','09:00-10:30','Room_109'),(10,110,10,'Wed','11:00-12:30','Room_110'),(11,111,11,'Wed','14:00-15:30','Room_201'),(12,112,12,'Wed','16:00-17:30','Room_202'),(13,113,13,'Thu','09:00-10:30','Room_203'),(14,114,14,'Thu','11:00-12:30','Room_204'),(15,115,15,'Thu','14:00-15:30','Room_205'),(16,116,16,'Thu','16:00-17:30','Room_206'),(17,117,17,'Fri','09:00-10:30','Room_207'),(18,118,18,'Fri','11:00-12:30','Room_208'),(19,119,19,'Fri','14:00-15:30','Room_209'),(20,120,20,'Fri','16:00-17:30','Room_210');
/*!40000 ALTER TABLE `Timetable` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-24 10:20:16
