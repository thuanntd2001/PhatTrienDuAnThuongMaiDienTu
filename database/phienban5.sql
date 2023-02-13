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
-- Table structure for table `CHITIETDDH`
--

DROP TABLE IF EXISTS `CHITIETDDH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CHITIETDDH` (
  `MADDH` bigint NOT NULL,
  `MASP` bigint NOT NULL,
  `SOLUONG` int NOT NULL,
  `TONGTIEN` int NOT NULL DEFAULT '0',
  `ID` bigint NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `NONCLUSTERED` (`MADDH`,`MASP`),
  KEY `FK_CHITIETHD_THUCDON` (`MASP`),
  CONSTRAINT `FK_CHITIETHD_HOADON` FOREIGN KEY (`MADDH`) REFERENCES `DONDATHANG` (`MADDH`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_CHITIETHD_THUCDON` FOREIGN KEY (`MASP`) REFERENCES `SANPHAM` (`ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CHITIETDDH`
--

LOCK TABLES `CHITIETDDH` WRITE;
/*!40000 ALTER TABLE `CHITIETDDH` DISABLE KEYS */;
/*!40000 ALTER TABLE `CHITIETDDH` ENABLE KEYS */;
UNLOCK TABLES;

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
  `ID` bigint NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_CTPN_PHIEUNHAP1_idx` (`MAPN`),
  KEY `fk_CTPN_SANPHAM1_idx` (`SANPHAM`),
  CONSTRAINT `fk_CTPN_PHIEUNHAP1` FOREIGN KEY (`MAPN`) REFERENCES `PHIEUNHAP` (`MAPN`),
  CONSTRAINT `fk_CTPN_SANPHAM1` FOREIGN KEY (`SANPHAM`) REFERENCES `SANPHAM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CTPN`
--

LOCK TABLES `CTPN` WRITE;
/*!40000 ALTER TABLE `CTPN` DISABLE KEYS */;
/*!40000 ALTER TABLE `CTPN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CTPX`
--

DROP TABLE IF EXISTS `CTPX`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CTPX` (
  `MAPX` bigint NOT NULL,
  `SANPHAM` bigint NOT NULL,
  `SOLUONG` int NOT NULL DEFAULT '0',
  `DONGIA` varchar(45) NOT NULL,
  `ID` bigint NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  KEY `fk_CTPX_SANPHAM1_idx` (`SANPHAM`),
  KEY `fk_CTPX_PHIEUXUAT1` (`MAPX`),
  CONSTRAINT `fk_CTPX_PHIEUXUAT1` FOREIGN KEY (`MAPX`) REFERENCES `PHIEUXUAT` (`MAPX`),
  CONSTRAINT `fk_CTPX_SANPHAM1` FOREIGN KEY (`SANPHAM`) REFERENCES `SANPHAM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CTPX`
--

LOCK TABLES `CTPX` WRITE;
/*!40000 ALTER TABLE `CTPX` DISABLE KEYS */;
/*!40000 ALTER TABLE `CTPX` ENABLE KEYS */;
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

--
-- Table structure for table `GIOHANG`
--

DROP TABLE IF EXISTS `GIOHANG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GIOHANG` (
  `SANPHAM` bigint NOT NULL,
  `MAKH` bigint NOT NULL,
  `SOLUONG` int NOT NULL,
  `TONGTIEN` int NOT NULL DEFAULT '0',
  `ID` bigint NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_CHITIETDDH_copy1_KHACHHANG1_idx` (`MAKH`),
  KEY `fk_CHITIETDDH_copy1_SANPHAM1_idx` (`SANPHAM`),
  CONSTRAINT `fk_CHITIETDDH_copy1_KHACHHANG1` FOREIGN KEY (`MAKH`) REFERENCES `KHACHHANG` (`MAKH`),
  CONSTRAINT `fk_CHITIETDDH_copy1_SANPHAM1` FOREIGN KEY (`SANPHAM`) REFERENCES `SANPHAM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GIOHANG`
--

LOCK TABLES `GIOHANG` WRITE;
/*!40000 ALTER TABLE `GIOHANG` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KHACHHANG`
--

LOCK TABLES `KHACHHANG` WRITE;
/*!40000 ALTER TABLE `KHACHHANG` DISABLE KEYS */;
INSERT INTO `KHACHHANG` VALUES (1,'thuan','0000-00-00',_binary '','0987754321','66 thu q9',1);
/*!40000 ALTER TABLE `KHACHHANG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LOAISP`
--

DROP TABLE IF EXISTS `LOAISP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LOAISP` (
  `ID` varchar(10) NOT NULL,
  `TENLOAI` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LOAISP`
--

LOCK TABLES `LOAISP` WRITE;
/*!40000 ALTER TABLE `LOAISP` DISABLE KEYS */;
/*!40000 ALTER TABLE `LOAISP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NHAN`
--

DROP TABLE IF EXISTS `NHAN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NHAN` (
  `ID` bigint NOT NULL,
  `TENNHAN` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NHAN`
--

LOCK TABLES `NHAN` WRITE;
/*!40000 ALTER TABLE `NHAN` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NHANVIEN`
--

LOCK TABLES `NHANVIEN` WRITE;
/*!40000 ALTER TABLE `NHANVIEN` DISABLE KEYS */;
INSERT INTO `NHANVIEN` VALUES (1,'NHAN','2003-03-21',_binary '\0',1000000,'0121275555','45460540654','11 NGUYỄN ĐÌNH CHIỂU','0011-07-13',0),(2,'NGUYỄN LUNG LINH','2001-05-29',_binary '',160000,'0308156570','7084065406440','244 Lê Văn Việt','0013-06-07',1),(3,'NGUYỄN TRẦN ĐỨC THUẬN','0007-07-25',_binary '',60000,'030815654 ','7084065406440','55 NGUYỄN VĂN THỦ','0007-07-13',1),(4,'ĐINH NHO NAM','0025-07-07',_binary '',60000,'03453454  ','70840634440','55 NGUYỄN VĂN THỦ','0011-09-09',0),(5,'TRẦN VỚ VẨN','1977-06-03',_binary '',80000,'0308156543','7084065240','97 MAN THIỆN','2022-01-01',0),(6,'HUỲNH NGỌC DƯƠNG','2001-01-01',_binary '',60000,'23415654  ','7084065406440','55 NGUYỄN VĂN THỦ','2021-06-06',0),(7,'NGUYỄN Long Lanh','2022-04-21',_binary '\0',999999,'123123','34','33 ert','2022-04-21',0),(8,'NGUYỄN LUNG LINh','2022-04-21',_binary '',123,'123','34','33 ert','2022-04-21',0),(9,'NGUYỄN LUNG LINh','2022-04-21',_binary '',123,'123','34','33 ert','2022-04-21',0),(13,'Mộng Mơ','2022-05-01',_binary '\0',123000,'0308156570','13123123123','244 LÊ VĂN VIỆT 2','2022-05-05',0),(16,'Đức Thuận','2001-02-11',_binary '\0',123010,'0308152234','7084065406443','2323 nguyễn trường tộ','2022-05-12',0),(17,'thuan','2002-01-01',_binary '',1230002,'0932323234','3489787874654','23 nguyện ty','2022-05-06',0),(18,'thuan 3','2001-01-16',_binary '',2342000,'3434343412','70840654064','33 ert','2022-05-05',1),(19,'NGUYỄN Lóng Lánh long lanh','2002-02-21',_binary '\0',1230000,'0308156570','708406540','2323 nguyễn trường tộ','2022-05-04',1),(23,'Bad girl','1999-02-01',_binary '',9000000,'0909232323','12345678910','123 nguyen tu q2','2022-02-01',1),(24,'good boy','1999-02-01',_binary '',9000000,'0909232323','123456756410','123 nguyen tu q2','2022-02-01',0);
/*!40000 ALTER TABLE `NHANVIEN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NHAN_SANPHAM`
--

DROP TABLE IF EXISTS `NHAN_SANPHAM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NHAN_SANPHAM` (
  `NHAN_ID` bigint NOT NULL,
  `SANPHAM_ID` bigint NOT NULL,
  `ID` bigint NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  KEY `fk_NHAN_has_SANPHAM_SANPHAM1_idx` (`SANPHAM_ID`),
  KEY `fk_NHAN_has_SANPHAM_NHAN1_idx` (`NHAN_ID`),
  CONSTRAINT `fk_NHAN_has_SANPHAM_NHAN1` FOREIGN KEY (`NHAN_ID`) REFERENCES `NHAN` (`ID`),
  CONSTRAINT `fk_NHAN_has_SANPHAM_SANPHAM1` FOREIGN KEY (`SANPHAM_ID`) REFERENCES `SANPHAM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NHAN_SANPHAM`
--

LOCK TABLES `NHAN_SANPHAM` WRITE;
/*!40000 ALTER TABLE `NHAN_SANPHAM` DISABLE KEYS */;
/*!40000 ALTER TABLE `NHAN_SANPHAM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PHIEUNHAP`
--

DROP TABLE IF EXISTS `PHIEUNHAP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PHIEUNHAP` (
  `MAPN` bigint NOT NULL,
  `NHACC` varchar(45) NOT NULL DEFAULT '0',
  `MANV` varchar(255) NOT NULL,
  `NGAY` varchar(45) NOT NULL,
  PRIMARY KEY (`MAPN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PHIEUNHAP`
--

LOCK TABLES `PHIEUNHAP` WRITE;
/*!40000 ALTER TABLE `PHIEUNHAP` DISABLE KEYS */;
/*!40000 ALTER TABLE `PHIEUNHAP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PHIEUXUAT`
--

DROP TABLE IF EXISTS `PHIEUXUAT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PHIEUXUAT` (
  `MAPX` bigint NOT NULL,
  `MANV` bigint NOT NULL DEFAULT '0',
  `NGAY` date NOT NULL,
  `MADDH` bigint NOT NULL,
  PRIMARY KEY (`MAPX`),
  KEY `fk_PHIEUXUAT_DONDATHANG1_idx` (`MADDH`),
  CONSTRAINT `fk_PHIEUXUAT_DONDATHANG1` FOREIGN KEY (`MADDH`) REFERENCES `DONDATHANG` (`MADDH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PHIEUXUAT`
--

LOCK TABLES `PHIEUXUAT` WRITE;
/*!40000 ALTER TABLE `PHIEUXUAT` DISABLE KEYS */;
/*!40000 ALTER TABLE `PHIEUXUAT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SANPHAM`
--

DROP TABLE IF EXISTS `SANPHAM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SANPHAM` (
  `ID` bigint NOT NULL,
  `TEN` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `LOAI` varchar(10) NOT NULL,
  `GIA` int NOT NULL,
  `DONVITINH` varchar(45) NOT NULL DEFAULT 'Cái',
  `SOLUONGTON` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `FK_THUCDON_LOAITHUCUONG` (`LOAI`),
  CONSTRAINT `FK_THUCDON_LOAITHUCUONG` FOREIGN KEY (`LOAI`) REFERENCES `LOAISP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SANPHAM`
--

LOCK TABLES `SANPHAM` WRITE;
/*!40000 ALTER TABLE `SANPHAM` DISABLE KEYS */;
/*!40000 ALTER TABLE `SANPHAM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TUKHOA`
--

DROP TABLE IF EXISTS `TUKHOA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TUKHOA` (
  `ID` bigint NOT NULL,
  `TENTUKHOA` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TUKHOA`
--

LOCK TABLES `TUKHOA` WRITE;
/*!40000 ALTER TABLE `TUKHOA` DISABLE KEYS */;
/*!40000 ALTER TABLE `TUKHOA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TUKHOA_NHAN`
--

DROP TABLE IF EXISTS `TUKHOA_NHAN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TUKHOA_NHAN` (
  `TUKHOA_ID` bigint NOT NULL,
  `NHAN_ID` bigint NOT NULL,
  `ID` bigint NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_TUKHOA_has_NHAN_NHAN1_idx` (`NHAN_ID`),
  KEY `fk_TUKHOA_has_NHAN_TUKHOA_idx` (`TUKHOA_ID`),
  CONSTRAINT `fk_TUKHOA_has_NHAN_NHAN1` FOREIGN KEY (`NHAN_ID`) REFERENCES `NHAN` (`ID`),
  CONSTRAINT `fk_TUKHOA_has_NHAN_TUKHOA` FOREIGN KEY (`TUKHOA_ID`) REFERENCES `TUKHOA` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TUKHOA_NHAN`
--

LOCK TABLES `TUKHOA_NHAN` WRITE;
/*!40000 ALTER TABLE `TUKHOA_NHAN` DISABLE KEYS */;
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
  `STATUS` int NOT NULL,
  `EMAIL` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'n19dccn000@studen.ptithcm.edu.vn',
  `ICON` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'lo_highland.png',
  PRIMARY KEY (`USERNAME`),
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
INSERT INTO `USER` VALUES ('admin','1234',1,1,1,'abc@hh.com','lo_highland.png'),('nhanvien1','1234',2,2,1,'ádas@ss.com','lo_highland.png');
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
  `ROLEID` bigint NOT NULL,
  `STATUS` int NOT NULL,
  `EMAIL` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'n19dccn000@studen.ptithcm.edu.vn',
  `ICON` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'lo_highland.png',
  PRIMARY KEY (`USERNAME`),
  KEY `FK_USERTB_CHUCVU` (`ROLEID`),
  KEY `fk_USERKH_KHACHHANG1_idx` (`MAKH`),
  CONSTRAINT `fk_USERKH_KHACHHANG1` FOREIGN KEY (`MAKH`) REFERENCES `KHACHHANG` (`MAKH`),
  CONSTRAINT `FK_USERTB_CHUCVU0` FOREIGN KEY (`ROLEID`) REFERENCES `CHUCVU` (`ID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERKH`
--

LOCK TABLES `USERKH` WRITE;
/*!40000 ALTER TABLE `USERKH` DISABLE KEYS */;
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

-- Dump completed on 2023-02-13  8:30:38
