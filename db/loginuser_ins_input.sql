-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: loginuser
-- ------------------------------------------------------
-- Server version	5.7.10-log

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
-- Table structure for table `ins_input`
--

DROP TABLE IF EXISTS `ins_input`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ins_input` (
  `hw` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `input` text,
  `output` text,
  `status` varchar(20) DEFAULT NULL,
  `runtime` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`hw`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ins_input`
--

LOCK TABLES `ins_input` WRITE;
/*!40000 ALTER TABLE `ins_input` DISABLE KEYS */;
INSERT INTO `ins_input` VALUES ('cse225hw1','input1','A X A A A X A X A \r\nX X X A X X X X A\r\nA Y Y X Y S S S S','A A A A A A A A \r\nX X X X Y Y Y Y\r\nY Y Y Y S S S S','visible','null'),('cse225hw2','input1','x\r\na\r\nt\r\nf\r\na\r\ns\r\nf\r\ng\r\nh\r\nj\r\nn\r\nv\r\nx\r\nz\r\ns\r\nd\r\nf\r\ng\r\nb\r\ns\r\nc\r\nd\r\ne\r\nd\r\nd\r\n','a\r\na\r\nb\r\nc\r\nd\r\nd\r\nd\r\nd\r\ne\r\nf\r\nf\r\nf\r\ng\r\ng\r\nh\r\nj\r\nn\r\ns\r\ns\r\ns\r\nt\r\nv\r\nx\r\nx\r\nz\r\n','visible','224'),('cse225hw2','input10','x\r\na\r\nt\r\nf\r\na\r\ns\r\nf\r\ng\r\nh\r\nj\r\ns\r\nd\r\nf\r\nf\r\nn\r\nv\r\nx\r\nz\r\ns\r\nd\r\nf\r\ng\r\nb\r\ns\r\nc\r\nd\r\ne\r\nd\r\nd\r\n','a\r\na\r\nb\r\nc\r\nd\r\nd\r\nd\r\nd\r\nd\r\ne\r\nf\r\nf\r\nf\r\nf\r\nf\r\ng\r\ng\r\nh\r\nj\r\nn\r\ns\r\ns\r\ns\r\ns\r\nt\r\nv\r\nx\r\nx\r\nz\r\n','visible','191'),('cse225hw2','input2','x\r\na\r\nt\r\nf\r\na\r\ns\r\nf\r\ng\r\nh\r\nj\r\nn\r\nv\r\nx\r\nz\r\ns\r\nd\r\nf\r\ng\r\nb\r\ns\r\nc\r\nd\r\ne\r\nd\r\nd\r\na\r\na\r\na\r\nx\r\nr\r\nr\r\na\r\nd\r\na\r\nx\r\na\r\nz\r\nt\r\nr\r\nr\r\n','a\r\na\r\na\r\na\r\na\r\na\r\na\r\na\r\nb\r\nc\r\nd\r\nd\r\nd\r\nd\r\nd\r\ne\r\nf\r\nf\r\nf\r\ng\r\ng\r\nh\r\nj\r\nn\r\nr\r\nr\r\nr\r\nr\r\ns\r\ns\r\ns\r\nt\r\nt\r\nv\r\nx\r\nx\r\nx\r\nx\r\nz\r\nz\r\n','visible','185'),('cse225hw2','input225','x\r\na\r\nt\r\nf\r\na\r\ns\r\nf\r\ng\r\nh\r\nj\r\nn\r\nv\r\nx\r\nz\r\ns\r\nd\r\nf\r\ng\r\nb\r\ns\r\nc\r\nd\r\ne\r\nd\r\nd\r\n','a\r\na\r\nb\r\nc\r\nd\r\nd\r\nd\r\nd\r\ne\r\nf\r\nf\r\nf\r\ng\r\ng\r\nh\r\nj\r\nn\r\ns\r\ns\r\ns\r\nt\r\nv\r\nx\r\nx\r\nz\r\n','visible','176'),('cse225hw2','input2250','x\r\na\r\nt\r\nf\r\na\r\ns\r\nf\r\ng\r\nh\r\nj\r\nn\r\nv\r\nx\r\nz\r\ns\r\nd\r\nf\r\ng\r\nb\r\ns\r\nc\r\nd\r\ne\r\nd\r\nd\r\n','a\r\na\r\nb\r\nc\r\nd\r\nd\r\nd\r\nd\r\ne\r\nf\r\nf\r\nf\r\ng\r\ng\r\nh\r\nj\r\nn\r\ns\r\ns\r\ns\r\nt\r\nv\r\nx\r\nx\r\nz\r\n','visible','1146'),('cse225hw2','input2251','x\r\na\r\nt\r\nf\r\na\r\ns\r\nf\r\ng\r\nh\r\nj\r\nn\r\nv\r\nx\r\nz\r\ns\r\nd\r\nf\r\ng\r\nb\r\ns\r\nc\r\nd\r\ne\r\nd\r\nd\r\n','a\r\na\r\nb\r\nc\r\nd\r\nd\r\nd\r\nd\r\ne\r\nf\r\nf\r\nf\r\ng\r\ng\r\nh\r\nj\r\nn\r\ns\r\ns\r\ns\r\nt\r\nv\r\nx\r\nx\r\nz\r\n','visible','293'),('cse225hw2','input2252','x\r\na\r\nt\r\nf\r\na\r\ns\r\nf\r\ng\r\nh\r\nj\r\nn\r\nv\r\nx\r\nz\r\ns\r\nd\r\nf\r\ng\r\nb\r\ns\r\nc\r\nd\r\ne\r\nd\r\nd\r\n','a\r\na\r\nb\r\nc\r\nd\r\nd\r\nd\r\nd\r\ne\r\nf\r\nf\r\nf\r\ng\r\ng\r\nh\r\nj\r\nn\r\ns\r\ns\r\ns\r\nt\r\nv\r\nx\r\nx\r\nz\r\n','visible','1089'),('cse225hw2','input25','x\r\na\r\nt\r\nf\r\na\r\ns\r\nf\r\ng\r\nh\r\nj\r\nn\r\nv\r\nx\r\nz\r\ns\r\nd\r\nf\r\ng\r\nb\r\ns\r\nc\r\nd\r\ne\r\nd\r\nd\r\n','a\r\na\r\nb\r\nc\r\nd\r\nd\r\nd\r\nd\r\ne\r\nf\r\nf\r\nf\r\ng\r\ng\r\nh\r\nj\r\nn\r\ns\r\ns\r\ns\r\nt\r\nv\r\nx\r\nx\r\nz\r\n','visible','211'),('cse225hw2','input2525','x\r\na\r\nt\r\nf\r\na\r\ns\r\nf\r\ng\r\nh\r\nj\r\nn\r\nv\r\nx\r\nz\r\ns\r\nd\r\nf\r\ng\r\nb\r\ns\r\nc\r\nd\r\ne\r\nd\r\nd\r\n','a\r\na\r\nb\r\nc\r\nd\r\nd\r\nd\r\nd\r\ne\r\nf\r\nf\r\nf\r\ng\r\ng\r\nh\r\nj\r\nn\r\ns\r\ns\r\ns\r\nt\r\nv\r\nx\r\nx\r\nz\r\n','visible','302'),('cse225hw2','input252525','x\r\na\r\nt\r\nf\r\na\r\ns\r\nf\r\ng\r\nh\r\nj\r\nn\r\nv\r\nx\r\nz\r\ns\r\nd\r\nf\r\ng\r\nb\r\ns\r\nc\r\nd\r\ne\r\nd\r\nd\r\n','a\r\na\r\nb\r\nc\r\nd\r\nd\r\nd\r\nd\r\ne\r\nf\r\nf\r\nf\r\ng\r\ng\r\nh\r\nj\r\nn\r\ns\r\ns\r\ns\r\nt\r\nv\r\nx\r\nx\r\nz\r\n','visible','205'),('cse225hw2','input3','z\r\nx\r\ny\r\na\r\nd\r\nf\r\na\r\ns\r\nd\r\nf\r\ng\r\nh\r\nj\r\na\r\ns\r\nf\r\ng\r\ng\r\n','a\r\na\r\na\r\nd\r\nd\r\nf\r\nf\r\nf\r\ng\r\ng\r\ng\r\nh\r\nj\r\ns\r\ns\r\nx\r\ny\r\nz\r\n','visible','180'),('cse225hw2','input300','x\r\na\r\nt\r\nf\r\nf\r\nd\r\nx\r\na\r\ns\r\nf\r\ng\r\nh\r\nj\r\nn\r\nv\r\nx\r\nz\r\ns\r\nd\r\nf\r\ng\r\nb\r\ns\r\nc\r\nd\r\ne\r\nd\r\nd\r\n','a\r\na\r\nb\r\nc\r\nd\r\nd\r\nd\r\nd\r\nd\r\ne\r\nf\r\nf\r\nf\r\nf\r\ng\r\ng\r\nh\r\nj\r\nn\r\ns\r\ns\r\ns\r\nt\r\nv\r\nx\r\nx\r\nx\r\nz\r\n','visible','181'),('cse225hw2','input301','x\r\na\r\nt\r\nf\r\na\r\ns\r\nf\r\ng\r\nh\r\nj\r\nn\r\nv\r\nx\r\nz\r\ns\r\nd\r\nf\r\ng\r\nb\r\ns\r\nc\r\nd\r\ne\r\nd\r\nd\r\n','a\r\na\r\nb\r\nc\r\nd\r\nd\r\nd\r\nd\r\ne\r\nf\r\nf\r\nf\r\ng\r\ng\r\nh\r\nj\r\nn\r\ns\r\ns\r\ns\r\nt\r\nv\r\nx\r\nx\r\nz\r\n','invisible','171'),('cse225hw2','input4','b\r\nb\r\nb\r\nb\r\nc\r\nf\r\na\r\nd\r\nf\r\ng\r\nh\r\nj\r\nj\r\nd\r\nf\r\n','a\r\nb\r\nb\r\nb\r\nb\r\nc\r\nd\r\nd\r\nf\r\nf\r\nf\r\ng\r\nh\r\nj\r\nj\r\n','visible','228'),('cse225hw2','input50','x\r\na\r\nt\r\nf\r\na\r\ns\r\nf\r\ng\r\nh\r\nj\r\nn\r\nv\r\nx\r\nz\r\ns\r\nd\r\nf\r\ng\r\nb\r\ns\r\nc\r\nd\r\ne\r\nd\r\nd\r\n','a\r\na\r\nb\r\nc\r\nd\r\nd\r\nd\r\nd\r\ne\r\nf\r\nf\r\nf\r\ng\r\ng\r\nh\r\nj\r\nn\r\ns\r\ns\r\ns\r\nt\r\nv\r\nx\r\nx\r\nz\r\n','visible','170'),('cse225hw2','input500','x\r\na\r\nt\r\nf\r\na\r\ns\r\nf\r\ng\r\nh\r\nj\r\nn\r\nv\r\nx\r\nz\r\ns\r\nd\r\nf\r\ng\r\nb\r\ns\r\nc\r\nd\r\ne\r\nd\r\nd\r\n','a\r\na\r\nb\r\nc\r\nd\r\nd\r\nd\r\nd\r\ne\r\nf\r\nf\r\nf\r\ng\r\ng\r\nh\r\nj\r\nn\r\ns\r\ns\r\ns\r\nt\r\nv\r\nx\r\nx\r\nz\r\n','visible','245'),('cse225hw2','input551','x\r\na\r\nt\r\nf\r\na\r\ns\r\nf\r\ng\r\nh\r\nj\r\nn\r\nv\r\nx\r\nz\r\ns\r\nd\r\nf\r\ng\r\nb\r\ns\r\nc\r\nd\r\ne\r\nd\r\nd\r\n','a\r\na\r\nb\r\nc\r\nd\r\nd\r\nd\r\nd\r\ne\r\nf\r\nf\r\nf\r\ng\r\ng\r\nh\r\nj\r\nn\r\ns\r\ns\r\ns\r\nt\r\nv\r\nx\r\nx\r\nz\r\n','visible','172'),('cse225hw2','input75','x\r\na\r\nt\r\nf\r\na\r\ns\r\nf\r\ng\r\nh\r\nj\r\nn\r\nv\r\nx\r\nz\r\ns\r\nd\r\nf\r\ng\r\nb\r\ns\r\nc\r\nd\r\ne\r\nd\r\nd\r\n','a\r\na\r\nb\r\nc\r\nd\r\nd\r\nd\r\nd\r\ne\r\nf\r\nf\r\nf\r\ng\r\ng\r\nh\r\nj\r\nn\r\ns\r\ns\r\ns\r\nt\r\nv\r\nx\r\nx\r\nz\r\n','visible','196'),('cse225hw2','input800','x\r\na\r\nt\r\nf\r\na\r\ns\r\nf\r\ng\r\nh\r\nj\r\nn\r\nv\r\nx\r\nz\r\ns\r\nd\r\nf\r\ng\r\nb\r\ns\r\nc\r\nd\r\ne\r\nd\r\nd\r\n','a\r\na\r\nb\r\nc\r\nd\r\nd\r\nd\r\nd\r\ne\r\nf\r\nf\r\nf\r\ng\r\ng\r\nh\r\nj\r\nn\r\ns\r\ns\r\ns\r\nt\r\nv\r\nx\r\nx\r\nz\r\n','visible','164'),('cse225hw2','invisible1','x\r\ny\r\na\r\n','a\r\nx\r\ny\r\n','invisible','null'),('cse225hw2','invisible2','g\r\nu\r\nr\r\nk\r\na\r\nn\r\nx\r\na\r\nt\r\nf\r\na\r\ns\r\nf\r\ng\r\nh\r\nj\r\nn\r\nv\r\nx\r\nz\r\ns\r\nd\r\nf\r\ng\r\nb\r\ns\r\nc\r\nd\r\ne\r\nd\r\nd\r\na\r\ns\r\nd\r\nd\r\nd\r\nd\r\nd\r\nd\r\nd\r\nx\r\nx\r\nx\r\nx\r\nx\r\n\r\n','a\r\na\r\na\r\na\r\nb\r\nc\r\nd\r\nd\r\nd\r\nd\r\nd\r\nd\r\nd\r\nd\r\nd\r\nd\r\nd\r\ne\r\nf\r\nf\r\nf\r\ng\r\ng\r\ng\r\nh\r\nj\r\nk\r\nn\r\nn\r\nr\r\ns\r\ns\r\ns\r\ns\r\nt\r\nu\r\nv\r\nx\r\nx\r\nx\r\nx\r\nx\r\nx\r\nx\r\nz\r\n','invisible','194'),('null','','x\r\na\r\nt\r\nf\r\na\r\ns\r\nf\r\ng\r\nh\r\nj\r\nn\r\nv\r\nx\r\nz\r\ns\r\nd\r\nf\r\ng\r\nb\r\ns\r\nc\r\nd\r\ne\r\nd\r\nd\r\n','a\r\na\r\nb\r\nc\r\nd\r\nd\r\nd\r\nd\r\ne\r\nf\r\nf\r\nf\r\ng\r\ng\r\nh\r\nj\r\nn\r\ns\r\ns\r\ns\r\nt\r\nv\r\nx\r\nx\r\nz\r\n','visible','1008');
/*!40000 ALTER TABLE `ins_input` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-01 23:35:52
