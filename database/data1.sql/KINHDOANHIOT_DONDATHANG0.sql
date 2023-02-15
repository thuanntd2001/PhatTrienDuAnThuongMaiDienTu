-- MySQL dump 10.13  Distrib 8.0.31, for Linux (x86_64)
--
-- Host: localhost    Database: KINHDOANHIOT
-- ------------------------------------------------------
-- Server version	8.0.31-0ubuntu0.22.04.1

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
-- Table structure for table `DONDATHANG`
--

DROP TABLE IF EXISTS `DONDATHANG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DONDATHANG` (
  `MADDH` bigint NOT NULL AUTO_INCREMENT,
  `NGAYTHUCHIEN` datetime NOT NULL,
  `NVXACNHAN` bigint DEFAULT NULL,
  `TINHTRANG` int NOT NULL DEFAULT '0' COMMENT '0 dang cho xac nhan\\n1 da xac nhan\\n2 dang chuan bi hang\\n3 dang van chuyen\\n4 giao hang thanh cong \\n-1 da huy\\n-2 doi tra\\n',
  `MAKH` bigint NOT NULL,
  PRIMARY KEY (`MADDH`),
  KEY `FK_HOADON_NHANVIEN` (`NVXACNHAN`),
  KEY `fk_DONDATHANG_KHACHHANG1_idx` (`MAKH`),
  CONSTRAINT `fk_DONDATHANG_KHACHHANG1` FOREIGN KEY (`MAKH`) REFERENCES `KHACHHANG` (`MAKH`),
  CONSTRAINT `FK_HOADON_NHANVIEN` FOREIGN KEY (`NVXACNHAN`) REFERENCES `NHANVIEN` (`MANV`) ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DONDATHANG`
--

LOCK TABLES `DONDATHANG` WRITE;
/*!40000 ALTER TABLE `DONDATHANG` DISABLE KEYS */;
/*!40000 ALTER TABLE `DONDATHANG` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-15 14:07:17
