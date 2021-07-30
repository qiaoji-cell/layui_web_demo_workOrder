-- MySQL dump 10.13  Distrib 5.5.36, for Win32 (x86)
--
-- Host: localhost    Database: gongdan
-- ------------------------------------------------------
-- Server version	5.5.36

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
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectName` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` (`id`, `projectName`) VALUES (1,'系统开发部'),(2,'课件制作中心Java项目组'),(3,'产品设计中心项目组');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workorder`
--

DROP TABLE IF EXISTS `workorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectId` int(11) NOT NULL,
  `Executor` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `orderLevel` int(11) NOT NULL,
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_workorder_project` (`projectId`),
  CONSTRAINT `fk_workorder_project` FOREIGN KEY (`projectId`) REFERENCES `project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workorder`
--

LOCK TABLES `workorder` WRITE;
/*!40000 ALTER TABLE `workorder` DISABLE KEYS */;
INSERT INTO `workorder` (`id`, `projectId`, `Executor`, `description`, `orderLevel`, `createDate`) VALUES (1,1,'刘明','完成在线答疑任务',2,'2021-05-03 01:27:30'),(2,1,'李小明','完成在线答疑任务',2,'2021-05-03 01:27:30'),(3,2,'张小时','开Java课件2',1,'2021-05-03 01:27:30'),(4,2,'王五','开发Java课件1',3,'2021-05-03 01:27:30'),(5,3,'李四','开发Java单元项目练习2',2,'2021-05-03 01:27:30'),(6,3,'张三','开发Java单元项目练习',1,'2021-05-03 01:27:30'),(7,2,'hello 你好','完成项目',1,'2021-05-03 04:33:23'),(9,1,'神鼎飞丹砂','收到',1,'2021-05-03 04:36:01'),(12,1,'是非得失','胜多负少',1,'2021-05-03 04:39:13'),(13,2,'神鼎飞丹砂','水电费',1,'2021-05-03 04:40:08'),(14,2,'胜多负少','水电费',2,'2021-05-03 04:40:37'),(15,1,'胜多负少','水电费',1,'2021-05-03 05:59:49'),(16,2,'所发生的','水电费',1,'2021-05-03 06:00:59'),(17,2,'1231','阿打算',1,'2021-05-03 06:02:26'),(18,2,'1231','阿打算',1,'2021-05-03 06:03:21'),(19,2,'胜多负少','收到',1,'2021-05-03 06:04:25'),(20,2,'321','123',2,'2021-05-03 06:05:55'),(21,1,'13','213',1,'2021-05-03 06:06:01'),(22,2,'胜多负少','是的',1,'2021-05-03 06:06:07'),(23,2,'胜多负少','王企鹅',2,'2021-05-03 06:06:24'),(24,3,'小白兔','吃完这些萝卜',3,'2021-05-03 06:06:59'),(31,1,'水电费','收到',1,'2021-05-03 06:22:02'),(32,3,'胜多负少','收到  都是',1,'2021-05-03 06:22:16'),(33,1,'sdf','asdf',1,'2021-07-30 08:22:28'),(34,1,'sdf','asdf',1,'2021-07-30 08:22:28'),(35,1,'hahha','sdfdsf',1,'2021-07-30 08:23:43'),(36,1,'hahha','sdfdsf',1,'2021-07-30 08:23:43'),(37,1,'asdf','asdf',1,'2021-07-30 08:26:15'),(38,1,'asdf','asdf',1,'2021-07-30 08:26:15'),(39,1,'撒旦法发','撒旦发射点',1,'2021-07-30 08:49:56'),(40,1,'撒旦法发','撒旦发射点',1,'2021-07-30 08:49:56'),(41,2,'阿斯蒂芬','阿斯蒂芬',1,'2021-07-30 08:50:23'),(42,2,'阿斯蒂芬','阿斯蒂芬',1,'2021-07-30 08:50:23'),(43,1,'啊手动阀','阿斯蒂芬',1,'2021-07-30 08:51:14'),(44,1,'啊手动阀','阿斯蒂芬',1,'2021-07-30 08:51:14'),(45,1,'阿斯蒂芬','阿斯蒂芬',1,'2021-07-30 08:52:04'),(46,1,'阿斯蒂芬','阿斯蒂芬',1,'2021-07-30 08:52:04'),(47,1,'阿斯顿','a士大夫',1,'2021-07-30 08:52:43'),(48,1,'阿斯顿','a士大夫',1,'2021-07-30 08:52:43'),(49,1,'阿斯蒂芬','阿斯顿',1,'2021-07-30 08:53:01'),(50,1,'阿斯蒂芬','阿斯顿',1,'2021-07-30 08:53:01'),(51,2,'阿斯顿','阿斯蒂芬',1,'2021-07-30 08:54:09'),(52,2,'阿斯顿','阿斯蒂芬',1,'2021-07-30 08:54:09'),(53,2,'阿斯顿','阿斯顿',1,'2021-07-30 08:54:26'),(54,2,'阿斯顿','阿斯顿',1,'2021-07-30 08:54:26'),(55,1,'阿斯顿','阿三',1,'2021-07-30 08:56:54'),(56,1,'阿斯顿','阿三',1,'2021-07-30 08:56:54'),(57,1,'阿斯顿','啊 ',1,'2021-07-30 08:57:53'),(58,1,'阿斯顿','啊 ',1,'2021-07-30 08:57:53'),(59,3,'哈哈哈哈','阿斯顿',1,'2021-07-30 08:58:05'),(60,3,'哈哈哈哈','阿斯顿',1,'2021-07-30 08:58:05'),(61,1,'阿斯顿','阿三',1,'2021-07-30 08:58:41'),(62,1,'阿斯顿','阿三',1,'2021-07-30 08:58:41'),(63,1,'阿斯顿','阿斯顿',1,'2021-07-30 08:58:56'),(64,1,'阿斯顿','阿斯顿',1,'2021-07-30 08:58:56'),(65,1,'0','发',1,'2021-07-30 09:00:33'),(66,1,'0','发',1,'2021-07-30 09:00:33'),(67,1,'阿斯顿','阿斯顿',1,'2021-07-30 09:01:43'),(68,1,'阿斯顿','阿斯顿',1,'2021-07-30 09:01:43'),(69,1,'阿斯顿','阿斯顿',1,'2021-07-30 09:02:54'),(70,1,'阿斯顿','阿斯顿',1,'2021-07-30 09:02:54'),(71,1,'阿斯顿','阿斯顿',1,'2021-07-30 09:03:09'),(72,1,'阿斯顿','阿斯顿',1,'2021-07-30 09:03:09'),(73,2,'阿斯顿','阿斯顿',1,'2021-07-30 09:04:37'),(74,2,'阿斯顿','阿斯顿',1,'2021-07-30 09:04:37');
/*!40000 ALTER TABLE `workorder` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-30 17:40:00
