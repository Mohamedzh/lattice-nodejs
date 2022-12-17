CREATE DATABASE  IF NOT EXISTS `lattice` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `lattice`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: lattice
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `hospital`
--

DROP TABLE IF EXISTS `hospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospital` (
  `id` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospital`
--

LOCK TABLES `hospital` WRITE;
/*!40000 ALTER TABLE `hospital` DISABLE KEYS */;
INSERT INTO `hospital` VALUES (1,'Apollo Hospitals'),(2,'Jawaharlal Nehru Medical College and Hospital'),(3,'Indira Gandhi Institute of Medical Sciences (IGIMS)'),(4,'AIIMS - All India Institute Of Medical Science');
/*!40000 ALTER TABLE `hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phoneNumber` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hospitalId` int NOT NULL,
  `psychiatristId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Patient_email_key` (`email`),
  KEY `Patient_hospitalId_fkey` (`hospitalId`),
  KEY `Patient_psychiatristId_fkey` (`psychiatristId`),
  CONSTRAINT `Patient_hospitalId_fkey` FOREIGN KEY (`hospitalId`) REFERENCES `hospital` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `Patient_psychiatristId_fkey` FOREIGN KEY (`psychiatristId`) REFERENCES `psychiatrist` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `psychiatrist`
--

DROP TABLE IF EXISTS `psychiatrist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `psychiatrist` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hospitalId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Psychiatrist_hospitalId_fkey` (`hospitalId`),
  CONSTRAINT `Psychiatrist_hospitalId_fkey` FOREIGN KEY (`hospitalId`) REFERENCES `hospital` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `psychiatrist`
--

LOCK TABLES `psychiatrist` WRITE;
/*!40000 ALTER TABLE `psychiatrist` DISABLE KEYS */;
INSERT INTO `psychiatrist` VALUES ('105a8fed-740f-4a15-acbb-3f999e25fe59','Suzan',3),('14c6d362-5d5d-4c00-bbfd-bd5c7c1b5469','Omar',1),('1e43a71f-e107-458d-afbe-cfe35ba2cfb1','Jasmine',4),('60992959-4b92-48c8-a349-c77d5cfb8a16','Ahmed',2),('67455cbd-5eae-41db-94ca-b41655a189e9','Suzan',3),('70321f29-0345-491a-9a86-6fe93b43d4bc','Ahmed',2),('796ea4b1-1324-4fd5-8926-a8bd0ae00ce6','Suzan',4),('8d33db41-26bd-487f-abf9-6822d8d0f6b1','Ahmed',2),('90cc7c6f-ecab-4706-809b-90a06a42b33b','Omar',1),('97b6dcd0-fd72-4efb-aaf7-c8ce0b7ced37','Omar',1),('9c5e3db9-4277-44f8-a6dc-54ef274f9b2d','Suzan',3),('a1feedf3-f05c-4afc-820e-2e1205c6baa4','Ahmed',2),('b1951b04-44dc-4661-8831-1a29beef3860','Omar',1),('c997ef46-f110-48b5-87a8-23b06d09e0fe','Omar',1),('ce222094-a11c-47e7-a838-029fd6fcaf60','Jasmine',4),('e06c5ac5-fd7a-4bfc-abb1-d52141f7163a','Ahmed',2),('ef8bb235-352b-4efd-9279-b2e8268983ec','Suzan',3),('f84fd160-dfb7-4ad0-9348-94cf0d1a6161','Suzan',3),('fab4988e-56bd-4f0c-bf45-816d1e80b7cb','Jasmine',4),('fdefef8d-ff26-4b0b-9485-a08398a129bf','Jasmine',4);
/*!40000 ALTER TABLE `psychiatrist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-17 16:38:09
