-- MySQL dump 10.15  Distrib 10.0.20-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: booking
-- ------------------------------------------------------
-- Server version	10.0.20-MariaDB

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
-- Table structure for table `customfieldjoins`
--

DROP TABLE IF EXISTS `customfieldjoins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customfieldjoins` (
  `customfieldsid` int(11) NOT NULL COMMENT '커스텀필드아이디',
  `customfieldchildid` int(11) NOT NULL COMMENT '커스텀필드자식아이디',
  `customfieldvalueid` int(11) NOT NULL COMMENT '커스텀필드값아이디',
  PRIMARY KEY (`customfieldsid`,`customfieldchildid`,`customfieldvalueid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='커스텀필드조인';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customfieldjoins`
--

LOCK TABLES `customfieldjoins` WRITE;
/*!40000 ALTER TABLE `customfieldjoins` DISABLE KEYS */;
/*!40000 ALTER TABLE `customfieldjoins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customfields`
--

DROP TABLE IF EXISTS `customfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '아이디',
  `name` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '이름',
  `parentmodel` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '부보모델',
  `type` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '타입',
  `options` longtext CHARACTER SET utf8 COMMENT '옵션',
  `class` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '클래스',
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '설명',
  `sortorder` smallint(5) NOT NULL DEFAULT '0' COMMENT '정렬순서',
  `required` tinyint(1) NOT NULL DEFAULT '0' COMMENT '필수여부',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='커스텀필드';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customfields`
--

LOCK TABLES `customfields` WRITE;
/*!40000 ALTER TABLE `customfields` DISABLE KEYS */;
/*!40000 ALTER TABLE `customfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customfieldvalues`
--

DROP TABLE IF EXISTS `customfieldvalues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customfieldvalues` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '아이디	',
  `value` longtext CHARACTER SET utf8 COMMENT '값',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='커스텀필드값';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customfieldvalues`
--

LOCK TABLES `customfieldvalues` WRITE;
/*!40000 ALTER TABLE `customfieldvalues` DISABLE KEYS */;
/*!40000 ALTER TABLE `customfieldvalues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventresources`
--

DROP TABLE IF EXISTS `eventresources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventresources` (
  `eventid` int(11) NOT NULL COMMENT '이벤트아이디',
  `resourceid` int(11) NOT NULL COMMENT '리소스아이디',
  PRIMARY KEY (`eventid`,`resourceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='이벤트리소스';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventresources`
--

LOCK TABLES `eventresources` WRITE;
/*!40000 ALTER TABLE `eventresources` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventresources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '아이디',
  `title` varchar(500) CHARACTER SET utf8 NOT NULL COMMENT '제목',
  `start` datetime DEFAULT NULL COMMENT '시작일',
  `end` datetime DEFAULT NULL COMMENT '끝일',
  `allday` int(11) NOT NULL DEFAULT '0' COMMENT '하루종일여부',
  `url` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '유알엘',
  `className` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '클레스명',
  `description` text CHARACTER SET utf8 COMMENT '설명',
  `locationid` int(11) NOT NULL DEFAULT '0' COMMENT '위치아이디',
  `contactname` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '연락처',
  `contactno` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '열락처번호',
  `contactemail` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '연락처이메일',
  `layoutstyle` varchar(255) CHARACTER SET utf8 DEFAULT 'Standard' COMMENT '규격스타일',
  `createdat` datetime DEFAULT NULL COMMENT '생성일',
  `updatedat` datetime DEFAULT NULL COMMENT '수정일',
  `deletedat` datetime DEFAULT NULL COMMENT '삭제일',
  `status` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT 'pending' COMMENT '상태',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='이벤트';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '아이디',
  `name` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '이름',
  `description` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '설명',
  `class` varchar(55) CHARACTER SET utf8 NOT NULL COMMENT '분류',
  `colour` varchar(7) CHARACTER SET utf8 DEFAULT NULL COMMENT '색깔',
  `building` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '빌딩명',
  `layouts` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '규격',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='위치';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'강의실','1층','lt','#eb1515',NULL,'Lecture,Debate'),(2,'세미날실1','로비','sm1','#2c86ff',NULL,'Lecture,Roundtable'),(3,'세미나실2','로비','sm2','#a1a100',NULL,'Lecture,Roundtable'),(4,'회의실','로비','gfcr','#ff6600',NULL,'Roundtable'),(5,'커피숍','1층','cafe','#800080',NULL,'Standard'),(6,'휴게실','기본','avsuite','#167362',NULL,'Standard');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logfiles`
--

DROP TABLE IF EXISTS `logfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logfiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '아이디',
  `message` varchar(500) CHARACTER SET utf8 NOT NULL COMMENT '메세지',
  `data` text CHARACTER SET utf8 COMMENT '데이타',
  `ipaddress` varchar(16) CHARACTER SET utf8 NOT NULL COMMENT '아이피주소',
  `type` varchar(16) CHARACTER SET utf8 NOT NULL COMMENT '타입',
  `userid` int(11) NOT NULL DEFAULT '0' COMMENT '사용자아이디',
  `createdat` datetime DEFAULT NULL COMMENT '생성일',
  `updatedat` datetime DEFAULT NULL COMMENT '수정일',
  `deletedat` datetime DEFAULT NULL COMMENT '삭제일',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='로그파일';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logfiles`
--

LOCK TABLES `logfiles` WRITE;
/*!40000 ALTER TABLE `logfiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `logfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `admin` int(1) NOT NULL DEFAULT '0',
  `editor` int(1) NOT NULL DEFAULT '0',
  `user` int(1) NOT NULL DEFAULT '0',
  `guest` int(1) NOT NULL DEFAULT '0',
  `notes` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES ('accessApplication',1,1,1,1,'앱에 접근허용'),('accessCalendar',1,1,1,1,'카렌다에 접근허용'),('accessCustomFields',1,0,0,0,'커스텀필드 및 템플릿에 접근'),('accessLocations',1,1,0,0,'위치수정 허용'),('accessLogfiles',1,0,0,0,'로그파일접근허용'),('accessPermissions',1,0,0,0,'권한접근 허용'),('accessResources',1,0,0,0,'리소스접근허용'),('accessSettings',1,1,0,0,'설정에접근허용'),('accessUsers',1,0,0,0,'사용자계정접그허용'),('allowAPI',1,1,1,1,'예약'),('allowApproveBooking',1,1,0,0,'부팅승인허용'),('allowiCal',1,1,1,1,'예약'),('allowRoomBooking',1,1,1,0,'이벤트생성허용'),('allowRSS',1,1,1,1,'예약'),('bypassApproveBooking',1,1,0,0,'이벤트승인처리 통과허용'),('updateOwnAccount',1,1,1,0,'상세정보수정허용'),('viewRoomBooking',1,1,1,1,'부팅정보보기');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resources`
--

DROP TABLE IF EXISTS `resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '아이디',
  `name` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '이름',
  `type` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '타입',
  `description` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '설명',
  `isunique` tinyint(1) NOT NULL DEFAULT '0' COMMENT '유니크여부',
  `restrictlocations` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '제한위치',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='리소스';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resources`
--

LOCK TABLES `resources` WRITE;
/*!40000 ALTER TABLE `resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '아이디',
  `value` varchar(500) CHARACTER SET utf8 NOT NULL COMMENT '값',
  `notes` varchar(1000) CHARACTER SET utf8 DEFAULT NULL COMMENT '설명',
  `fieldtype` varchar(55) CHARACTER SET utf8 NOT NULL DEFAULT 'integer' COMMENT '팔드타입',
  `editable` int(1) NOT NULL DEFAULT '1' COMMENT '수정여부',
  `category` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT 'General' COMMENT '카테고리',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='설정';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES ('allowLocations','1','위치수정여부','boolean',1,'Locations'),('allowResources','1','리소스수정여부','boolean',1,'General'),('allowSettings','1','Warning - setting to zero will disable the facility to edit all settings via the web interface, and will only be editable via the database directly','boolean',1,'General'),('approveBooking','0','부팅승인','boolean',1,'General'),('bccAllEmail','0','참조이메일여부','boolean',1,'Email'),('bccAllEmailTo','admin@domain.com','관리자이메일','string',1,'Email'),('calendarAllDaySlot','1','스롤여부','boolean',1,'Calendar'),('calendarAllDayText','all-day','날짜텍스트포맷','string',1,'Calendar'),('calendarAxisFormat','h(:mm)a','카렌다축포맷','string',1,'Calendar'),('calendarColumnFormatDay','dddd d/M','일일컬럼포맷','string',1,'Calendar'),('calendarColumnFormatMonth','ddd','달컬럼포맷','string',1,'Calendar'),('calendarColumnFormatWeek','ddd d/M','주일컬럼포맷','string',1,'Calendar'),('calendarDefaultView','month','카렌다 기본보기','string',1,'Calendar'),('calendarFirstday','1','카렌다 시작 1 = Monday, 0 = Sunday','boolean',1,'Calendar'),('calendarHeadercenter','title','카렌다 헤더포맷','string',1,'Calendar'),('calendarHeaderleft','prev,next today','카렌다 헤더포맷','string',1,'Calendar'),('calendarHeaderright','month,agendaWeek,agendaDay','카렌다 헤더포맷','string',1,'Calendar'),('calendarHiddenDays','[]','숨긴날짜','string',1,'Calendar'),('calendarMaxtime','23:00:00','표시최대시간포맷','string',1,'Calendar'),('calendarMintime','07:00:00','표시최소시간포맷','string',1,'Calendar'),('calendarSlotEventOverlap','0','오버랩될지 결정','boolean',1,'Calendar'),('calendarSlotMinutes','00:15:00','스롯마다표시','string',1,'Calendar'),('calendarTimeformat','H:mm','카렌다시간표시포맷','string',1,'Calendar'),('calendarWeekends','1','주말을 카렌다에 표시여부','boolean',1,'Calendar'),('calendarWeekNumbers','0','주일을 카렌다에 표시여부','boolean',1,'Calendar'),('defaultDateFormat','DD MMM YYYY','날짜포멧','string',1,'General'),('defaultTimeFormat','HH:MM','타입포멧','string',1,'General'),('googleanalytics','UA-','구글트래킹 코드','string',1,'General'),('isDemoMode','0','데모모두','boolean',0,'General'),('resourceTypes','Computers,Audio Visual,Furniture','시소스타입','string',1,'General'),('roomlayouttypes','Standard,Boardroom,Lecture','룸리이아웃 타입','string',1,'Locations'),('showlocationcolours','1','색깔은 카렌다 위치에 보일지','boolean',1,'Locations'),('showlocationfilter','1','메인카렌다에 로케이션필터 보일지여부','boolean',1,'Locations'),('sitedescription','부팅시스템','사이트설명','string',1,'General'),('siteEmailAddress','bookings@domain.com','사이트이메일','string',1,'Email'),('sitelogo','/','사이트로고','string',1,'General'),('sitetitle','부킹시스템','사이트명','string',1,'General'),('version','1.2','버젼','string',1,'General');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templates`
--

DROP TABLE IF EXISTS `templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templates` (
  `parentmodel` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '부보모델',
  `type` varchar(55) CHARACTER SET utf8 NOT NULL COMMENT '타입',
  `template` longtext CHARACTER SET utf8 COMMENT '템플릿내용',
  PRIMARY KEY (`parentmodel`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='템플릿';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templates`
--

LOCK TABLES `templates` WRITE;
/*!40000 ALTER TABLE `templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '아이디',
  `email` varchar(255) NOT NULL COMMENT '이메일',
  `firstname` varchar(100) NOT NULL COMMENT '이름',
  `lastname` varchar(100) NOT NULL COMMENT '성',
  `role` varchar(50) NOT NULL DEFAULT 'user' COMMENT '역할',
  `password` varchar(500) DEFAULT NULL COMMENT '패스워드',
  `salt` varchar(500) DEFAULT NULL COMMENT '패스워드 솔트',
  `address1` varchar(500) DEFAULT NULL COMMENT '주소1',
  `address2` varchar(500) DEFAULT NULL COMMENT '주소2',
  `passwordresettoken` varchar(500) DEFAULT NULL COMMENT '패스워드리셋토큰',
  `state` varchar(100) DEFAULT NULL COMMENT '상태',
  `country` varchar(100) DEFAULT NULL COMMENT '국가',
  `postcode` varchar(50) DEFAULT NULL COMMENT '우편번호',
  `tel` varchar(50) DEFAULT NULL COMMENT '연락처',
  `passwordresetat` datetime DEFAULT NULL COMMENT '패스워드리렛타임',
  `createdat` datetime DEFAULT NULL COMMENT '생성일',
  `updatedat` datetime DEFAULT NULL COMMENT '수정일',
  `deletedat` datetime DEFAULT NULL COMMENT '삭제일',
  `apitoken` varchar(255) DEFAULT NULL COMMENT 'api 토큰',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='사용자';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-19 13:54:39
