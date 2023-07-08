CREATE DATABASE  IF NOT EXISTS `KINHDOANHIOT` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `KINHDOANHIOT`;
-- MySQL dump 10.13  Distrib 8.0.33, for Linux (x86_64)
--
-- Host: localhost    Database: KINHDOANHIOT
-- ------------------------------------------------------
-- Server version	8.0.33-0ubuntu0.22.04.2

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
-- Table structure for table `CHUCVU`
--

DROP TABLE IF EXISTS `CHUCVU`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CHUCVU` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `TENCHUCVU` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CHUCVU`
--

LOCK TABLES `CHUCVU` WRITE;
/*!40000 ALTER TABLE `CHUCVU` DISABLE KEYS */;
INSERT INTO `CHUCVU` VALUES (1,'Admin'),(2,'Nhân viên'),(3,'Khách hàng');
/*!40000 ALTER TABLE `CHUCVU` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CTDDH`
--

DROP TABLE IF EXISTS `CTDDH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CTDDH` (
  `MADDH` bigint NOT NULL,
  `SANPHAM` bigint NOT NULL,
  `SOLUONG` int NOT NULL DEFAULT '0',
  `TONGTIEN` int NOT NULL,
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `DIEM` int NOT NULL DEFAULT '0',
  `DANHGIA` text,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `MADDH` (`MADDH`,`SANPHAM`),
  KEY `fk_CTPX_SANPHAM1_idx` (`SANPHAM`),
  KEY `fk_CTDDH_DONDATHANG1_idx` (`MADDH`),
  CONSTRAINT `fk_CTDDH_DONDATHANG1` FOREIGN KEY (`MADDH`) REFERENCES `DONDATHANG` (`MADDH`),
  CONSTRAINT `fk_CTPX_SANPHAM10` FOREIGN KEY (`SANPHAM`) REFERENCES `SANPHAM` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CTDDH`
--

LOCK TABLES `CTDDH` WRITE;
/*!40000 ALTER TABLE `CTDDH` DISABLE KEYS */;
INSERT INTO `CTDDH` VALUES (1,1,3,600000,1,1,'te'),(58,1,2,400000,2,5,'San pham tot'),(58,3,4,800000,3,2,'san pham nhu cut'),(58,5,3,600000,4,0,NULL),(58,9,4,3200000,5,0,NULL),(58,10,5,20000,6,0,NULL),(59,3,1,200000,7,5,NULL),(59,6,1,30000,8,0,NULL),(59,2,1,10000,9,0,NULL),(60,3,1,200000,10,0,NULL),(61,3,1,200000,11,0,NULL),(62,2,1,10000,12,0,NULL),(63,2,1,10000,13,0,NULL),(64,3,1,200000,14,0,NULL),(65,3,1,200000,15,0,NULL),(66,1,1,200000,16,0,NULL),(66,2,1,10000,17,0,NULL),(67,2,1,10000,18,0,NULL),(67,1,2,400000,19,0,NULL),(68,1,2,400000,20,0,NULL),(68,2,2,20000,21,0,NULL),(69,3,4,800000,22,0,NULL),(69,2,1,10000,23,0,NULL),(70,3,4,800000,24,0,NULL),(71,3,1,200000,25,0,NULL),(72,3,1,200000,26,0,NULL),(72,2,1,10000,27,0,NULL),(73,1,1,200000,28,5,'san sham tuyet voi'),(74,2,1,10000,29,0,NULL),(74,3,1,200000,30,0,NULL),(75,3,1,200000,31,0,NULL),(76,3,1,200000,32,0,NULL),(77,3,2,400000,33,0,NULL),(77,2,1,10000,34,0,NULL),(78,3,2,400000,35,0,NULL),(78,2,1,10000,36,0,NULL);
/*!40000 ALTER TABLE `CTDDH` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CTPN`
--

DROP TABLE IF EXISTS `CTPN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CTPN` (
  `MAPN` bigint NOT NULL,
  `SANPHAM` bigint NOT NULL,
  `SOLUONG` int NOT NULL,
  `DONGIA` int NOT NULL,
  `ID` bigint NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `MAPN` (`MAPN`,`SANPHAM`),
  KEY `fk_CTPN_PHIEUNHAP1_idx` (`MAPN`),
  KEY `fk_CTPN_SANPHAM1_idx` (`SANPHAM`),
  CONSTRAINT `fk_CTPN_PHIEUNHAP1` FOREIGN KEY (`MAPN`) REFERENCES `PHIEUNHAP` (`MAPN`),
  CONSTRAINT `fk_CTPN_SANPHAM1` FOREIGN KEY (`SANPHAM`) REFERENCES `SANPHAM` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CTPN`
--

LOCK TABLES `CTPN` WRITE;
/*!40000 ALTER TABLE `CTPN` DISABLE KEYS */;
INSERT INTO `CTPN` VALUES (1,1,20,400000,1),(2,2,300,6000,2),(2,1,3,190000,3),(2,3,3,100000,4),(5,6,3000,5000,5),(5,1,3,100000,6),(1,6,2,2000,7),(5,2,55,8000,8),(4,1,40,4000,9),(3,2,400,3000,10),(1,5,12,30000,11);
/*!40000 ALTER TABLE `CTPN` ENABLE KEYS */;
UNLOCK TABLES;

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
  `PTTT` int DEFAULT '0',
  PRIMARY KEY (`MADDH`),
  KEY `FK_HOADON_NHANVIEN` (`NVXACNHAN`),
  KEY `fk_DONDATHANG_KHACHHANG1_idx` (`MAKH`),
  CONSTRAINT `fk_DONDATHANG_KHACHHANG1` FOREIGN KEY (`MAKH`) REFERENCES `KHACHHANG` (`MAKH`),
  CONSTRAINT `FK_HOADON_NHANVIEN` FOREIGN KEY (`NVXACNHAN`) REFERENCES `NHANVIEN` (`MANV`) ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DONDATHANG`
--

LOCK TABLES `DONDATHANG` WRITE;
/*!40000 ALTER TABLE `DONDATHANG` DISABLE KEYS */;
INSERT INTO `DONDATHANG` VALUES (1,'2023-02-01 00:00:00',2,4,1,0),(58,'2023-03-08 18:12:23',2,4,1,0),(59,'2023-03-09 12:52:18',NULL,-1,1,0),(60,'2023-05-25 20:04:13',NULL,-1,1,0),(61,'2023-05-26 16:37:46',NULL,-1,1,0),(62,'2023-05-26 16:38:27',NULL,-1,1,0),(63,'2023-05-26 16:38:36',NULL,-1,1,0),(64,'2023-05-26 16:46:47',NULL,-1,1,0),(65,'2023-05-26 17:39:54',2,-1,1,0),(66,'2023-05-26 17:59:09',2,4,1,0),(67,'2023-05-26 18:01:16',NULL,-1,1,0),(68,'2023-05-26 20:17:48',2,4,1,0),(69,'2023-06-20 13:12:00',2,2,1,0),(70,'2023-06-22 18:35:28',2,4,1,0),(71,'2023-06-22 19:06:50',2,1,1,0),(72,'2023-06-22 19:09:02',2,2,1,0),(73,'2023-06-23 09:35:11',2,4,1,0),(74,'2023-06-23 13:28:27',NULL,-1,34,0),(75,'2023-06-23 16:01:32',NULL,0,1,0),(76,'2023-06-24 12:59:34',NULL,-1,39,0),(77,'2023-06-24 13:44:52',NULL,-1,39,0),(78,'2023-06-24 13:53:24',2,4,39,0);
/*!40000 ALTER TABLE `DONDATHANG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GIOHANG`
--

DROP TABLE IF EXISTS `GIOHANG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GIOHANG` (
  `SANPHAM` bigint NOT NULL,
  `MAKH` bigint NOT NULL,
  `SOLUONG` int NOT NULL DEFAULT '0',
  `ID` bigint NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `unique_index` (`SANPHAM`,`MAKH`),
  UNIQUE KEY `SANPHAM` (`SANPHAM`,`MAKH`),
  KEY `fk_CTPX_SANPHAM1_idx` (`SANPHAM`),
  KEY `fk_GIOHANG_KHACHHANG1_idx` (`MAKH`),
  CONSTRAINT `fk_CTPX_SANPHAM100` FOREIGN KEY (`SANPHAM`) REFERENCES `SANPHAM` (`ID`),
  CONSTRAINT `fk_GIOHANG_KHACHHANG1` FOREIGN KEY (`MAKH`) REFERENCES `KHACHHANG` (`MAKH`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GIOHANG`
--

LOCK TABLES `GIOHANG` WRITE;
/*!40000 ALTER TABLE `GIOHANG` DISABLE KEYS */;
INSERT INTO `GIOHANG` VALUES (1,34,1,42),(5,34,1,43),(3,1,1,47),(2,1,1,48);
/*!40000 ALTER TABLE `GIOHANG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KHACHHANG`
--

DROP TABLE IF EXISTS `KHACHHANG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KHACHHANG` (
  `MAKH` bigint NOT NULL AUTO_INCREMENT,
  `HOTEN` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `NGAYSINH` date DEFAULT NULL,
  `GIOITINH` bit(1) DEFAULT b'1',
  `SDT` varchar(10) NOT NULL,
  `DIACHI` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `TRANGTHAI` int NOT NULL DEFAULT '1' COMMENT '1 Hoat dong\\n0 BAN\\n',
  PRIMARY KEY (`MAKH`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KHACHHANG`
--

LOCK TABLES `KHACHHANG` WRITE;
/*!40000 ALTER TABLE `KHACHHANG` DISABLE KEYS */;
INSERT INTO `KHACHHANG` VALUES (1,'thuan1','2001-10-03',_binary '','0987754321','66 thu q9',1),(25,'sdfdsfgh','2001-10-03',_binary '','0987754321','66 thu q9',1),(26,'bnbvnb','2001-10-03',_binary '','0987754321','66 thu q9',1),(27,'cvh',NULL,_binary '\0','8768976897','dfghfgxh',1),(28,'cvh',NULL,_binary '\0','8768976897','dfghfgxh',1),(29,'cvh',NULL,_binary '\0','8768976897','dfghfgxh',1),(30,'asdf',NULL,_binary '','4534543534','sadfsdf',1),(31,'asdfasdf',NULL,_binary '','3545345345','asdfsadfasdf',1),(32,'tran h',NULL,_binary '\0','0932409234','66 kh sdf pos',1),(33,'huhui',NULL,_binary '\0','0909909009','ugiuyguig',1),(34,'huhui',NULL,_binary '\0','0909909009','ugiuyguig',1),(35,'sdfas',NULL,_binary '\0','0909090909','sdfasdf w',1),(36,'asdf',NULL,_binary '\0','0909090909','44 ghgh',1),(37,'asdf',NULL,_binary '\0','0909090909','44 ghgh',1),(38,'thuan',NULL,_binary '\0','9892830482','66 quang trung',1),(39,'thuan',NULL,_binary '','0909092304','66 quang trung',1);
/*!40000 ALTER TABLE `KHACHHANG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LOAISP`
--

DROP TABLE IF EXISTS `LOAISP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LOAISP` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `TENLOAI` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LOAISP`
--

LOCK TABLES `LOAISP` WRITE;
/*!40000 ALTER TABLE `LOAISP` DISABLE KEYS */;
INSERT INTO `LOAISP` VALUES (1,'Arduino'),(2,'Cảm biến'),(3,'Linh kiện điện tử 1'),(4,'RASBPERY PI');
/*!40000 ALTER TABLE `LOAISP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NHAN`
--

DROP TABLE IF EXISTS `NHAN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NHAN` (
  `TENNHAN` varchar(255) NOT NULL,
  `NGAYTAO` date NOT NULL,
  `NVTAO` bigint NOT NULL,
  `NVSUA` bigint DEFAULT NULL,
  PRIMARY KEY (`TENNHAN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NHAN`
--

LOCK TABLES `NHAN` WRITE;
/*!40000 ALTER TABLE `NHAN` DISABLE KEYS */;
INSERT INTO `NHAN` VALUES ('cảm','2021-01-01',1,NULL),('chip','2023-06-24',2,NULL),('linh kiện','2023-06-02',2,NULL),('man hinh','2023-06-23',2,NULL),('tu dong','2023-06-24',2,NULL),('vi điều khiển','2023-06-02',2,NULL);
/*!40000 ALTER TABLE `NHAN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NHANVIEN`
--

DROP TABLE IF EXISTS `NHANVIEN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NHANVIEN` (
  `MANV` bigint NOT NULL AUTO_INCREMENT,
  `HOTEN` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `NGAYSINH` date NOT NULL,
  `GIOITINH` bit(1) NOT NULL DEFAULT b'1',
  `LUONG` int NOT NULL,
  `SDT` varchar(10) NOT NULL,
  `CMND` varchar(15) NOT NULL,
  `DIACHI` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `NGAYVAOLAM` date NOT NULL,
  `TRANGTHAI` int NOT NULL DEFAULT '0' COMMENT '1 hoat dong\\n0 ban\\n',
  PRIMARY KEY (`MANV`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NHANVIEN`
--

LOCK TABLES `NHANVIEN` WRITE;
/*!40000 ALTER TABLE `NHANVIEN` DISABLE KEYS */;
INSERT INTO `NHANVIEN` VALUES (1,'NHAN','2003-03-21',_binary '\0',1000000,'0121275555','45460540654','11 NGUYỄN ĐÌNH CHIỂU','0011-07-13',1),(2,'NGUYỄN LUNG LINH','2001-05-29',_binary '',160000,'0308156570','7084065406440','244 Lê Văn Việt','0013-06-07',1),(3,'NGUYỄN TRẦN ĐỨC THUẬN','0007-07-25',_binary '',60000,'030815654 ','7084065406440','55 NGUYỄN VĂN THỦ','0007-07-13',1),(4,'ĐINH NHO NAM','0025-07-07',_binary '',60000,'03453454  ','70840634440','55 NGUYỄN VĂN THỦ','0011-09-09',1),(5,'TRẦN VỚ VẨN','1977-06-03',_binary '',80000,'0308156543','7084065240','97 MAN THIỆN','2022-01-01',1),(6,'HUỲNH NGỌC DƯƠNG','2001-01-01',_binary '',60000,'23415654  ','7084065406440','55 NGUYỄN VĂN THỦ','2021-06-06',1),(7,'NGUYỄN Long Lanh','2022-04-21',_binary '\0',999999,'123123','34','33 ert','2022-04-21',1),(8,'NGUYỄN LUNG LINh','2022-04-21',_binary '',123,'123','34','33 ert','2022-04-21',1),(9,'NGUYỄN LUNG LINh','2022-04-21',_binary '',123,'123','34','33 ert','2022-04-21',1),(13,'Mộng Mơ','2022-05-01',_binary '\0',123000,'0308156570','13123123123','244 LÊ VĂN VIỆT 2','2022-05-05',0),(16,'Đức Thuận','2001-02-11',_binary '\0',123010,'0308152234','7084065406443','2323 nguyễn trường tộ','2022-05-12',0),(17,'thuan','2002-01-01',_binary '',1230002,'0932323234','3489787874654','23 nguyện ty','2022-05-06',0),(18,'thuan 3','2001-01-16',_binary '\0',2342000,'3434343412','70840654064','33 ert','2022-05-05',0),(19,'NGUYỄN Lóng Lánh long lanh','2002-02-21',_binary '\0',1230000,'0308156570','708406540','2323 nguyễn trường tộ','2022-05-04',0),(23,'Bad girl','1999-02-01',_binary '\0',9000000,'0909232323','12345678910','123 nguyen tu q2','2022-02-01',0),(24,'good boy','1999-02-01',_binary '',9000000,'0909232323','123456756410','123 nguyen tu q2','2022-02-01',0),(25,'hihi','1975-02-16',_binary '\0',100000,'0421241242','131232153245','77 ngu nguc','2022-11-02',0),(26,'hihi','1975-02-16',_binary '',100000,'0421241242','131232153245','77 ngu nguc','2022-11-02',0),(27,'Nguyễn Ngọc Bút Bi','2023-06-25',_binary '\0',50000000,'0909909009','938263663','123 Hai Bà Trưng, TP. HCM','2000-03-15',1);
/*!40000 ALTER TABLE `NHANVIEN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NHAN_SANPHAM`
--

DROP TABLE IF EXISTS `NHAN_SANPHAM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NHAN_SANPHAM` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `SANPHAM_ID` bigint NOT NULL,
  `TENNHAN` varchar(255) NOT NULL,
  `NGAYTAO` date NOT NULL,
  `NVTAO` bigint NOT NULL,
  `NVSUA` bigint DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `TENNHAN` (`TENNHAN`,`SANPHAM_ID`),
  KEY `fk_NHAN_has_SANPHAM_SANPHAM1_idx` (`SANPHAM_ID`),
  KEY `fk_NHAN_SANPHAM_NHAN1_idx` (`TENNHAN`),
  CONSTRAINT `fk_NHAN_has_SANPHAM_SANPHAM1` FOREIGN KEY (`SANPHAM_ID`) REFERENCES `SANPHAM` (`ID`),
  CONSTRAINT `fk_NHAN_SANPHAM_NHAN1` FOREIGN KEY (`TENNHAN`) REFERENCES `NHAN` (`TENNHAN`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NHAN_SANPHAM`
--

LOCK TABLES `NHAN_SANPHAM` WRITE;
/*!40000 ALTER TABLE `NHAN_SANPHAM` DISABLE KEYS */;
INSERT INTO `NHAN_SANPHAM` VALUES (1,1,'cảm','2021-01-01',1,NULL),(2,2,'cảm','2021-01-01',1,NULL),(3,1,'vi điều khiển','2023-06-02',2,NULL),(5,9,'vi điều khiển','2023-06-02',2,NULL),(6,8,'linh kiện','2023-06-02',2,NULL),(7,6,'cảm','2023-06-02',2,NULL),(9,7,'cảm','2023-06-02',2,NULL),(11,3,'chip','2023-06-24',2,NULL),(12,9,'chip','2023-06-24',2,NULL),(13,6,'tu dong','2023-06-24',2,NULL);
/*!40000 ALTER TABLE `NHAN_SANPHAM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PHIEUNHAP`
--

DROP TABLE IF EXISTS `PHIEUNHAP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PHIEUNHAP` (
  `MAPN` bigint NOT NULL AUTO_INCREMENT,
  `NHACC` varchar(45) NOT NULL DEFAULT '0',
  `NGAY` datetime NOT NULL,
  `MANV` bigint NOT NULL,
  `TINHTRANG` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`MAPN`),
  KEY `fk_PHIEUNHAP_NHANVIEN1_idx` (`MANV`),
  CONSTRAINT `fk_PHIEUNHAP_NHANVIEN1` FOREIGN KEY (`MANV`) REFERENCES `NHANVIEN` (`MANV`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PHIEUNHAP`
--

LOCK TABLES `PHIEUNHAP` WRITE;
/*!40000 ALTER TABLE `PHIEUNHAP` DISABLE KEYS */;
INSERT INTO `PHIEUNHAP` VALUES (1,'AI THINKER','2023-02-02 00:00:00',1,1),(2,'ef','2023-02-23 15:45:34',1,1),(3,'ádf','2023-03-05 08:51:28',1,0),(4,'dfsd','2023-03-05 13:17:20',1,0),(5,'sfdg','2023-03-05 13:21:53',1,0);
/*!40000 ALTER TABLE `PHIEUNHAP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SANPHAM`
--

DROP TABLE IF EXISTS `SANPHAM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SANPHAM` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `TEN` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `LOAI` bigint NOT NULL,
  `GIA` int NOT NULL,
  `DONVITINH` varchar(45) NOT NULL DEFAULT 'Cái',
  `SOLUONGTON` int NOT NULL DEFAULT '0',
  `ICON` varchar(255) NOT NULL DEFAULT 'logo.webp',
  `TRANGTHAI` int NOT NULL DEFAULT '0',
  `MOTA` text,
  PRIMARY KEY (`ID`),
  KEY `FK_THUCDON_LOAITHUCUONG` (`LOAI`),
  CONSTRAINT `FK_THUCDON_LOAITHUCUONG` FOREIGN KEY (`LOAI`) REFERENCES `LOAISP` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SANPHAM`
--

LOCK TABLES `SANPHAM` WRITE;
/*!40000 ALTER TABLE `SANPHAM` DISABLE KEYS */;
INSERT INTO `SANPHAM` VALUES (1,'Arduino Uno',1,200000,'Cái',199,'arduino-uno-r3-dip.webp',1,'san pham chua co mo ta'),(2,'CB Nhiệt độ KJ45',2,10000,'Cái',1396,'cam-bien-nhiet-do-do-am-am2305-jpeg.webp',1,'san pham chua co mo ta'),(3,'Arduino MICRO',1,200000,'Cái',194,'arduino-nano.webp',1,'san pham chua co mo ta'),(4,'nhom-tan-nhiet',2,120000,'cái',1,'nhom-tan-nhiet-jpeg.webp',1,'san pham chua co mo ta'),(5,'module-nguon-12v-300mA',3,200000,'chiec',12,'module-nguon-12v-300ma-jpeg.webp',1,'san pham chua co mo ta'),(6,'cảm biến ánh sáng',2,30000,'10 cái',0,'cam-bien-cuong-do-anh-sang-gy-49.webp',1,'san pham chua co mo ta'),(7,'cam-bien-tiem-can',2,5000,'cái',0,'cam-bien-tiem-can-njk-5002c.webp',1,'san pham chua co mo ta'),(8,'khop-noi-banh-xe',3,80000,'Cái',0,'khop-noi-banh-xe-jpeg.webp',1,'san pham chua co mo ta'),(9,'Rasbpery Pi 1',4,800000,'Cái',0,'raspberry-pi-4-8g.webp',1,'san pham chua co mo ta'),(10,'nhiet-ke',2,4000,'Cái',0,'xy-wt01.webp',1,'san pham chua co mo ta');
/*!40000 ALTER TABLE `SANPHAM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TUKHOA`
--

DROP TABLE IF EXISTS `TUKHOA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TUKHOA` (
  `TENTUKHOA` varchar(255) NOT NULL,
  `NGAYTAO` date NOT NULL,
  `NVTAO` bigint NOT NULL,
  `NVSUA` bigint DEFAULT NULL,
  PRIMARY KEY (`TENTUKHOA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TUKHOA`
--

LOCK TABLES `TUKHOA` WRITE;
/*!40000 ALTER TABLE `TUKHOA` DISABLE KEYS */;
INSERT INTO `TUKHOA` VALUES ('cam bien','2021-01-01',2,NULL),('ho','2021-01-01',1,NULL),('linh kien','2021-01-01',1,NULL),('nhung','2021-01-01',2,NULL),('pi','2021-01-01',2,NULL),('uno','2021-01-01',2,NULL),('vi xu ly','2023-06-24',2,NULL);
/*!40000 ALTER TABLE `TUKHOA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TUKHOA_NHAN`
--

DROP TABLE IF EXISTS `TUKHOA_NHAN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TUKHOA_NHAN` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `TENTUKHOA` varchar(255) NOT NULL,
  `TENNHAN` varchar(255) NOT NULL,
  `NGAYTAO` date NOT NULL,
  `NVTAO` bigint NOT NULL,
  `NVSUA` bigint DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `TENNHAN` (`TENNHAN`,`TENTUKHOA`),
  KEY `fk_TUKHOA_NHAN_TUKHOA1_idx` (`TENTUKHOA`),
  KEY `fk_TUKHOA_NHAN_NHAN1_idx` (`TENNHAN`),
  CONSTRAINT `fk_TUKHOA_NHAN_NHAN1` FOREIGN KEY (`TENNHAN`) REFERENCES `NHAN` (`TENNHAN`),
  CONSTRAINT `fk_TUKHOA_NHAN_TUKHOA1` FOREIGN KEY (`TENTUKHOA`) REFERENCES `TUKHOA` (`TENTUKHOA`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TUKHOA_NHAN`
--

LOCK TABLES `TUKHOA_NHAN` WRITE;
/*!40000 ALTER TABLE `TUKHOA_NHAN` DISABLE KEYS */;
INSERT INTO `TUKHOA_NHAN` VALUES (1,'ho','cảm','2021-01-01',1,NULL),(2,'linh kien','linh kiện','2023-06-02',2,NULL),(3,'pi','vi điều khiển','2023-06-02',2,NULL),(4,'uno','vi điều khiển','2023-06-02',2,NULL),(5,'vi xu ly','chip','2023-06-24',2,NULL),(6,'vi xu ly','tu dong','2023-06-24',2,NULL);
/*!40000 ALTER TABLE `TUKHOA_NHAN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER`
--

DROP TABLE IF EXISTS `USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER` (
  `USERNAME` varchar(20) NOT NULL,
  `PASSWD` varchar(50) NOT NULL,
  `MANV` bigint NOT NULL,
  `ROLEID` bigint NOT NULL,
  `EMAIL` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'n19dccn000@studen.ptithcm.edu.vn',
  `ICON` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'lo_highland.png',
  PRIMARY KEY (`USERNAME`),
  UNIQUE KEY `MANV` (`MANV`),
  KEY `FK_USERTB_CHUCVU` (`ROLEID`),
  KEY `FK_USERTB_NHANVIEN` (`MANV`),
  CONSTRAINT `fk_USER_NHANVIEN1` FOREIGN KEY (`MANV`) REFERENCES `NHANVIEN` (`MANV`),
  CONSTRAINT `FK_USERTB_CHUCVU` FOREIGN KEY (`ROLEID`) REFERENCES `CHUCVU` (`ID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER`
--

LOCK TABLES `USER` WRITE;
/*!40000 ALTER TABLE `USER` DISABLE KEYS */;
INSERT INTO `USER` VALUES ('admin','1234',1,1,'abc@hh.com','lo_highland.png'),('nhanvien1','1234',2,2,'ádas@ss.com','lo_highland.png'),('nhanvien2','1234',3,2,'sdf@asdfasdg','1');
/*!40000 ALTER TABLE `USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USERKH`
--

DROP TABLE IF EXISTS `USERKH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USERKH` (
  `USERNAME` varchar(20) NOT NULL,
  `PASSWD` varchar(50) NOT NULL,
  `MAKH` bigint NOT NULL,
  `EMAIL` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'n19dccn000@studen.ptithcm.edu.vn',
  `ICON` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'lo_highland.png',
  `MAXACTHUC` varchar(10) DEFAULT NULL,
  `NGAYDANGKY` timestamp NULL DEFAULT NULL,
  `STATUS` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`USERNAME`),
  UNIQUE KEY `MAKH` (`MAKH`),
  KEY `fk_USERKH_KHACHHANG1_idx` (`MAKH`),
  CONSTRAINT `fk_USERKH_KHACHHANG1` FOREIGN KEY (`MAKH`) REFERENCES `KHACHHANG` (`MAKH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERKH`
--

LOCK TABLES `USERKH` WRITE;
/*!40000 ALTER TABLE `USERKH` DISABLE KEYS */;
INSERT INTO `USERKH` VALUES ('aaaaa','aaaaa',36,'thiensudanduong12@gmail.com','logo.webp','VxGWJH','2023-06-24 05:37:17',0),('bbbbb','1234',37,'thiensudanduong12@gmail.com','logo.webp','UANOk3','2023-06-24 05:43:27',0),('ccccc','1234',38,'n19dccn203@student.ptithcm.edu.vn','logo.webp','zfo3zg','2023-06-24 05:45:45',1),('ddddd','1234',39,'n19dccn203@student.ptithcm.edu.vn','logo.webp','tnbXwm','2023-06-24 05:55:29',1),('khachhang1','1234',35,'asdfsdf@gmail.com','logo.webp','kyKFWo','2023-06-24 04:56:59',1),('khachhang2','1234',29,'asd@gmail.com','logo.webp','enCqjo','1972-12-31 16:00:00',0),('khachhang3','1234',30,'thiensudanduong12@gmail.com','logo.webp','X2DgZv','1972-12-31 16:00:00',0),('khachhang4','1234',31,'thiensudanduong12@gmail.com','logo.webp','TBWmc0','1972-12-31 16:00:00',1),('khachhang5','1234',32,'n19dccn203@student.ptithcm.edu.vn','logo.webp','AAQum0','2023-06-22 04:04:31',1),('rrrrr','rrrr',34,'2156060089@hcmussh.edu.vn','logo.webp','8unrzS','2023-06-23 02:54:32',1);
/*!40000 ALTER TABLE `USERKH` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-08 14:49:32
