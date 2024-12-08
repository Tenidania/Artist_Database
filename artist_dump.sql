-- MySQL dump 10.13  Distrib 8.0.40, for Linux (x86_64)
--
-- Host: localhost    Database: artist_database
-- ------------------------------------------------------
-- Server version	8.0.40-0ubuntu0.20.04.1

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
-- Current Database: `artist_database`
--

/*!40000 DROP DATABASE IF EXISTS `artist_database`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `artist_database` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `artist_database`;

--
-- Table structure for table `artist_app_album`
--

DROP TABLE IF EXISTS `artist_app_album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artist_app_album` (
  `AlbumID` int NOT NULL AUTO_INCREMENT,
  `AlbumName` varchar(50) NOT NULL,
  `ReleaseDate` date NOT NULL,
  `LabelID` int NOT NULL,
  PRIMARY KEY (`AlbumID`),
  KEY `artist_app_album_LabelID_a9b26106_fk_artist_app_label_LabelID` (`LabelID`),
  CONSTRAINT `artist_app_album_LabelID_a9b26106_fk_artist_app_label_LabelID` FOREIGN KEY (`LabelID`) REFERENCES `artist_app_label` (`LabelID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist_app_album`
--

LOCK TABLES `artist_app_album` WRITE;
/*!40000 ALTER TABLE `artist_app_album` DISABLE KEYS */;
INSERT INTO `artist_app_album` VALUES (1,'OK Computer','1997-05-21',9),(2,'Nevermind','1991-09-24',2),(3,'To Pimp a Butterfly','2015-03-15',3),(4,'DAMN.','2017-04-14',3),(5,'Riot!','2007-06-12',4),(6,'Paramore','2013-04-05',4),(7,'Hozier','2014-09-19',5),(8,'Wasteland, Baby!','2019-03-01',5),(9,'Whatever People Say I Am, That\'s What I\'m Not','2006-01-23',6),(10,'Fearless','2008-11-11',7),(11,'1989','2014-10-27',7),(12,'In Rainbows','2007-10-10',1),(13,'In Utero','1993-09-13',2),(14,'AM','2013-09-09',6),(15,'Red (Taylor\'s Version)','2021-11-12',8);
/*!40000 ALTER TABLE `artist_app_album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artist_app_albumsong`
--

DROP TABLE IF EXISTS `artist_app_albumsong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artist_app_albumsong` (
  `AlbumSongID` int NOT NULL AUTO_INCREMENT,
  `AlbumID` int NOT NULL,
  `SongID` int NOT NULL,
  PRIMARY KEY (`AlbumSongID`),
  UNIQUE KEY `artist_app_albumsong_SongID_AlbumID_0a1de808_uniq` (`SongID`,`AlbumID`),
  KEY `artist_app_albumsong_AlbumID_5f9fa793_fk_artist_ap` (`AlbumID`),
  CONSTRAINT `artist_app_albumsong_AlbumID_5f9fa793_fk_artist_ap` FOREIGN KEY (`AlbumID`) REFERENCES `artist_app_album` (`AlbumID`),
  CONSTRAINT `artist_app_albumsong_SongID_76a4ee14_fk_artist_app_song_SongID` FOREIGN KEY (`SongID`) REFERENCES `artist_app_song` (`SongID`)
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist_app_albumsong`
--

LOCK TABLES `artist_app_albumsong` WRITE;
/*!40000 ALTER TABLE `artist_app_albumsong` DISABLE KEYS */;
INSERT INTO `artist_app_albumsong` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,2,13),(14,2,14),(15,2,15),(16,2,16),(17,2,17),(18,2,18),(19,2,19),(20,2,20),(21,2,21),(22,2,22),(23,2,23),(24,2,24),(25,3,25),(26,3,26),(27,3,27),(28,3,28),(29,3,29),(30,3,30),(31,3,31),(32,3,32),(33,3,33),(34,3,34),(35,3,35),(36,3,36),(37,3,37),(38,3,38),(39,3,39),(40,3,40),(41,4,41),(42,4,42),(43,4,43),(44,4,44),(45,4,45),(46,4,46),(47,4,47),(48,4,48),(49,4,49),(50,4,50),(51,4,51),(52,4,52),(53,4,53),(54,4,54),(55,5,55),(56,5,56),(57,5,57),(58,5,58),(59,5,59),(60,5,60),(61,5,61),(62,5,62),(63,5,63),(64,5,64),(65,5,65),(66,6,66),(67,6,67),(68,6,68),(69,6,69),(70,6,70),(71,6,71),(72,6,72),(73,6,73),(74,6,74),(75,6,75),(76,6,76),(77,6,77),(78,6,78),(79,6,79),(80,6,80),(81,6,81),(82,6,82),(83,7,83),(84,7,84),(85,7,85),(86,7,86),(87,7,87),(88,7,88),(89,7,89),(91,7,91),(92,7,92),(93,7,93),(94,7,94),(95,8,95),(96,8,96),(97,8,97),(98,8,98),(99,8,99),(100,8,100),(90,7,101),(101,8,101),(102,8,102),(103,8,103),(104,9,104),(105,9,105),(106,9,106),(107,9,107),(108,9,108),(109,9,109),(110,9,110),(111,9,111),(112,9,112),(113,9,113),(114,9,114),(115,9,115),(116,9,116),(117,10,117),(118,10,118),(119,10,119),(120,10,120),(121,10,121),(122,10,122),(123,10,123),(124,10,124),(125,10,125),(126,10,126),(127,10,127),(128,10,128),(129,10,129),(130,11,130),(131,11,131),(132,11,132),(133,11,133),(134,11,134),(135,11,135),(136,11,136),(137,11,137),(138,11,138),(139,11,139),(140,11,140),(141,11,141),(142,11,142),(143,14,165),(144,14,166),(145,14,167),(146,14,168),(147,14,169),(148,14,170),(149,14,171),(150,14,172),(151,14,173),(152,14,174),(153,14,175),(154,14,176),(155,15,177),(156,15,178),(157,15,179),(158,15,180),(159,15,181),(160,15,182),(161,15,183),(162,15,184),(163,15,185),(164,15,186),(165,15,187),(166,15,188),(167,15,189),(168,15,190);
/*!40000 ALTER TABLE `artist_app_albumsong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artist_app_artist`
--

DROP TABLE IF EXISTS `artist_app_artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artist_app_artist` (
  `ArtistID` int NOT NULL AUTO_INCREMENT,
  `ArtistName` varchar(100) NOT NULL,
  `Country` varchar(50) NOT NULL,
  `NoOfMembers` int NOT NULL,
  `YearStarted` int NOT NULL,
  `YearEnded` int NOT NULL,
  PRIMARY KEY (`ArtistID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist_app_artist`
--

LOCK TABLES `artist_app_artist` WRITE;
/*!40000 ALTER TABLE `artist_app_artist` DISABLE KEYS */;
INSERT INTO `artist_app_artist` VALUES (1,'Radiohead','United Kingdom',5,1985,0),(2,'Nirvana','United States',3,1987,1994),(3,'Kendrick Lamar','United States',1,2003,0),(4,'Paramore','United States',4,2004,0),(5,'Hozier','Ireland',1,2013,0),(6,'Arctic Monkeys','United Kingdom',5,2002,0),(7,'Taylor Swift','United States',1,2006,0);
/*!40000 ALTER TABLE `artist_app_artist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artist_app_artistsong`
--

DROP TABLE IF EXISTS `artist_app_artistsong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artist_app_artistsong` (
  `ArtistSongID` int NOT NULL AUTO_INCREMENT,
  `ArtistID` int NOT NULL,
  `SongID` int NOT NULL,
  PRIMARY KEY (`ArtistSongID`),
  UNIQUE KEY `artist_app_artistsong_SongID_ArtistID_537bdca3_uniq` (`SongID`,`ArtistID`),
  KEY `artist_app_artistson_ArtistID_65440d8d_fk_artist_ap` (`ArtistID`),
  CONSTRAINT `artist_app_artistson_ArtistID_65440d8d_fk_artist_ap` FOREIGN KEY (`ArtistID`) REFERENCES `artist_app_artist` (`ArtistID`),
  CONSTRAINT `artist_app_artistsong_SongID_9fdb7dca_fk_artist_app_song_SongID` FOREIGN KEY (`SongID`) REFERENCES `artist_app_song` (`SongID`)
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist_app_artistsong`
--

LOCK TABLES `artist_app_artistsong` WRITE;
/*!40000 ALTER TABLE `artist_app_artistsong` DISABLE KEYS */;
INSERT INTO `artist_app_artistsong` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,2,13),(14,2,14),(15,2,15),(16,2,16),(17,2,17),(18,2,18),(19,2,19),(20,2,20),(21,2,21),(22,2,22),(23,2,23),(24,2,24),(25,3,25),(26,3,26),(27,3,27),(28,3,28),(29,3,29),(30,3,30),(31,3,31),(32,3,32),(33,3,33),(34,3,34),(35,3,35),(36,3,36),(37,3,37),(38,3,38),(39,3,39),(40,3,40),(41,3,41),(42,3,42),(43,3,43),(44,3,44),(45,3,45),(46,3,46),(47,3,47),(48,3,48),(49,3,49),(50,3,50),(51,3,51),(52,3,52),(53,3,53),(54,3,54),(55,4,55),(56,4,56),(57,4,57),(58,4,58),(59,4,59),(60,4,60),(61,4,61),(62,4,62),(63,4,63),(64,4,64),(65,4,65),(66,4,66),(67,4,67),(68,4,68),(69,4,69),(70,4,70),(71,4,71),(72,4,72),(73,4,73),(74,4,74),(75,4,75),(76,4,76),(77,4,77),(78,4,78),(79,4,79),(80,4,80),(81,4,81),(82,4,82),(83,5,83),(84,5,84),(85,5,85),(86,5,86),(87,5,87),(88,5,88),(89,5,89),(91,5,91),(92,5,92),(93,5,93),(94,5,94),(95,5,95),(96,5,96),(97,5,97),(98,5,98),(99,5,99),(100,5,100),(90,5,101),(102,5,102),(103,5,103),(104,6,104),(105,6,105),(106,6,106),(107,6,107),(108,6,108),(109,6,109),(110,6,110),(111,6,111),(112,6,112),(113,6,113),(114,6,114),(115,6,115),(116,6,116),(117,7,117),(118,7,118),(119,7,119),(120,7,120),(121,7,121),(122,7,122),(123,7,123),(124,7,124),(125,7,125),(126,7,126),(127,7,127),(128,7,128),(129,7,129),(130,7,130),(131,7,131),(132,7,132),(133,7,133),(134,7,134),(135,7,135),(136,7,136),(137,7,137),(138,7,138),(139,7,139),(140,7,140),(141,7,141),(142,7,142),(143,6,165),(144,6,166),(145,6,167),(146,6,168),(147,6,169),(148,6,170),(149,6,171),(150,6,172),(151,6,173),(152,6,174),(153,6,175),(154,6,176),(155,7,177),(156,7,178),(157,7,179),(158,7,180),(159,7,181),(160,7,182),(161,7,183),(162,7,184),(163,7,185),(164,7,186),(165,7,187),(166,7,188),(167,7,189),(168,7,190);
/*!40000 ALTER TABLE `artist_app_artistsong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artist_app_concert`
--

DROP TABLE IF EXISTS `artist_app_concert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artist_app_concert` (
  `ConcertID` int NOT NULL AUTO_INCREMENT,
  `ConcertName` varchar(200) NOT NULL,
  `ConcertDate` date NOT NULL,
  `VenueID` int NOT NULL,
  PRIMARY KEY (`ConcertID`),
  KEY `artist_app_concert_VenueID_37a5e9fe_fk_artist_app_venue_VenueID` (`VenueID`),
  CONSTRAINT `artist_app_concert_VenueID_37a5e9fe_fk_artist_app_venue_VenueID` FOREIGN KEY (`VenueID`) REFERENCES `artist_app_venue` (`VenueID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist_app_concert`
--

LOCK TABLES `artist_app_concert` WRITE;
/*!40000 ALTER TABLE `artist_app_concert` DISABLE KEYS */;
INSERT INTO `artist_app_concert` VALUES (1,'The Bends Tour','1995-04-20',1),(2,'Glastonbury Festival 1997','1997-06-28',2),(3,'Live at The Astoria','2001-03-12',3),(4,'MTV Unplugged in New York','1993-11-18',4),(5,'Reading Festival 1992','1992-08-30',5),(6,'The DAMN. Tour','2017-09-06',1),(7,'Coachella 2016','2016-04-15',6),(8,'The Brand New Eyes Tour','2009-03-28',7),(9,'Reading Festival 2013','2013-08-24',5),(10,'Hozier Live','2015-04-11',8),(11,'Coachella 2015','2015-04-12',6),(12,'The AM Tour','2014-09-30',9),(13,'Glastonbury Festival 2013','2013-06-28',2),(14,'The 1989 World Tour','2015-07-10',10),(15,'The Red Tour','2013-03-13',1),(16,'Emerald Sound Festival','2024-08-15',11);
/*!40000 ALTER TABLE `artist_app_concert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artist_app_concertsongartist`
--

DROP TABLE IF EXISTS `artist_app_concertsongartist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artist_app_concertsongartist` (
  `ConcertSongArtistID` int NOT NULL AUTO_INCREMENT,
  `ArtistID` int NOT NULL,
  `ConcertID` int NOT NULL,
  `SongID` int NOT NULL,
  PRIMARY KEY (`ConcertSongArtistID`),
  UNIQUE KEY `artist_app_concertsongar_SongID_ConcertID_ArtistI_05c3710e_uniq` (`SongID`,`ConcertID`,`ArtistID`),
  KEY `artist_app_concertso_ArtistID_b4a9eba9_fk_artist_ap` (`ArtistID`),
  KEY `artist_app_concertso_ConcertID_3c99f0a6_fk_artist_ap` (`ConcertID`),
  CONSTRAINT `artist_app_concertso_ArtistID_b4a9eba9_fk_artist_ap` FOREIGN KEY (`ArtistID`) REFERENCES `artist_app_artist` (`ArtistID`),
  CONSTRAINT `artist_app_concertso_ConcertID_3c99f0a6_fk_artist_ap` FOREIGN KEY (`ConcertID`) REFERENCES `artist_app_concert` (`ConcertID`),
  CONSTRAINT `artist_app_concertso_SongID_8991a130_fk_artist_ap` FOREIGN KEY (`SongID`) REFERENCES `artist_app_song` (`SongID`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist_app_concertsongartist`
--

LOCK TABLES `artist_app_concertsongartist` WRITE;
/*!40000 ALTER TABLE `artist_app_concertsongartist` DISABLE KEYS */;
INSERT INTO `artist_app_concertsongartist` VALUES (3,1,1,1),(105,1,3,1),(113,1,9,1),(1,1,1,2),(10,1,2,2),(109,1,9,2),(11,1,2,4),(108,1,3,4),(116,1,9,4),(4,1,1,6),(9,1,2,6),(106,1,3,6),(138,5,8,6),(110,1,9,6),(48,5,10,6),(93,5,16,6),(5,1,1,9),(2,1,1,10),(14,1,2,10),(107,1,3,10),(111,1,9,10),(6,1,1,11),(15,1,2,11),(112,1,9,11),(17,2,4,13),(32,2,5,13),(18,2,4,15),(139,6,13,19),(36,3,6,31),(40,3,7,31),(37,3,6,37),(42,3,7,37),(33,3,6,42),(38,3,7,42),(34,3,6,48),(39,3,7,48),(87,3,13,48),(35,3,6,50),(41,3,7,50),(128,4,8,55),(126,4,8,56),(127,4,8,57),(125,4,8,58),(132,4,8,60),(131,4,8,62),(129,4,8,71),(102,4,16,72),(130,4,8,74),(103,4,16,74),(104,4,16,75),(133,5,8,83),(43,5,10,83),(49,5,11,83),(88,5,16,83),(135,5,8,85),(50,5,11,85),(92,5,16,85),(51,5,11,91),(47,5,10,95),(134,5,8,96),(44,5,10,96),(54,5,11,96),(89,5,16,96),(136,5,8,97),(46,5,10,97),(53,5,11,97),(91,5,16,97),(137,5,8,99),(45,5,10,99),(52,5,11,99),(90,5,16,99),(72,7,14,131),(73,7,14,132),(74,7,14,133),(78,7,14,134),(71,7,14,135),(75,7,14,137),(76,7,14,138),(77,7,14,139),(8,1,1,143),(115,1,9,143),(12,1,2,147),(7,1,1,149),(114,1,9,149),(13,1,2,150),(16,1,2,152),(24,2,4,153),(28,2,5,153),(20,2,4,155),(29,2,5,155),(19,2,4,156),(27,2,5,156),(22,2,4,157),(21,2,4,158),(25,2,5,159),(30,2,5,160),(26,2,5,161),(23,2,4,164),(31,2,5,164),(117,6,9,165),(55,6,12,165),(63,6,13,165),(94,6,16,165),(118,6,9,166),(56,6,12,166),(65,6,13,166),(95,6,16,166),(101,6,16,167),(119,6,9,168),(57,6,12,168),(64,6,13,168),(96,6,16,168),(122,6,9,170),(62,6,12,170),(69,6,13,170),(99,6,16,170),(120,6,9,173),(58,6,12,173),(67,6,13,173),(97,6,16,173),(121,6,9,174),(59,6,12,174),(66,6,13,174),(98,6,16,174),(123,6,9,175),(61,6,12,175),(70,6,13,175),(124,6,9,176),(60,6,12,176),(68,6,13,176),(100,6,16,176),(83,7,15,178),(81,7,15,180),(82,7,15,181),(80,7,15,182),(79,7,15,184),(86,7,15,185),(84,7,15,186),(85,7,15,190);
/*!40000 ALTER TABLE `artist_app_concertsongartist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artist_app_label`
--

DROP TABLE IF EXISTS `artist_app_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artist_app_label` (
  `LabelID` int NOT NULL AUTO_INCREMENT,
  `LabelName` varchar(50) NOT NULL,
  `Country` varchar(50) NOT NULL,
  PRIMARY KEY (`LabelID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist_app_label`
--

LOCK TABLES `artist_app_label` WRITE;
/*!40000 ALTER TABLE `artist_app_label` DISABLE KEYS */;
INSERT INTO `artist_app_label` VALUES (1,'XL Recordings',' United Kingdom'),(2,'DGC Records',' United States'),(3,'Top Dawg Entertainment',' United States'),(4,'Fueled by Ramen',' United States'),(5,'Rubyworks',' Ireland'),(6,'Domino Recording Company',' United Kingdom'),(7,'Big Machine Records',' United States'),(8,'Republic Records',' United States'),(9,'Parlophone',' Germany');
/*!40000 ALTER TABLE `artist_app_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artist_app_song`
--

DROP TABLE IF EXISTS `artist_app_song`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artist_app_song` (
  `SongID` int NOT NULL AUTO_INCREMENT,
  `SongName` varchar(100) NOT NULL,
  `SongLength` int NOT NULL,
  PRIMARY KEY (`SongID`)
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist_app_song`
--

LOCK TABLES `artist_app_song` WRITE;
/*!40000 ALTER TABLE `artist_app_song` DISABLE KEYS */;
INSERT INTO `artist_app_song` VALUES (1,'Airbag',283),(2,'Paranoid Android',383),(3,'Subterranean Homesick Alien',267),(4,'Exit Music (For a Film)',264),(5,'Let Down',299),(6,'Karma Police',261),(7,'Fitter Happier',117),(8,'Electioneering',230),(9,'Climbing Up the Walls',284),(10,'No Surprises',229),(11,'Lucky',259),(12,'The Tourist',324),(13,'Smells Like Teen Spirit',301),(14,'In Bloom',254),(15,'Come As You Are',219),(16,'Breed',219),(17,'Lithium',257),(18,'Polly',177),(19,'Territorial Pissings',142),(20,'Drain You',223),(21,'Lounge Act',156),(22,'Stay Away',212),(23,'On a Plain',197),(24,'Something in the Way',232),(25,'Wesley\'s Theory',287),(26,'For Free?',130),(27,'King Kunta',234),(28,'Institutionalized',271),(29,'These Walls',300),(30,'u',268),(31,'Alright',219),(32,'For Sale?',291),(33,'Momma',283),(34,'Hood Politics',292),(35,'How Much a Dollar Cost',261),(36,'Complexion (A Zulu Love)',263),(37,'The Blacker the Berry',328),(38,'You Ain\'t Gotta Lie',241),(39,'i',336),(40,'Mortal Man',727),(41,'BLOOD.',118),(42,'DNA.',185),(43,'YAH.',160),(44,'ELEMENT.',208),(45,'FEEL.',214),(46,'LOYALTY. (feat. Rihanna)',228),(47,'PRIDE.',275),(48,'HUMBLE.',177),(49,'LUST.',308),(50,'LOVE. (feat. Zacari)',213),(51,'XXX. (feat. U2)',254),(52,'FEAR.',460),(53,'GOD.',248),(54,'DUCKWORTH.',248),(55,'For a Pessimist, I\'m Pretty Optimistic',228),(56,'That\'s What You Get',220),(57,'Hallelujah',203),(58,'Misery Business',216),(59,'When It Rains',215),(60,'Let the Flames Begin',198),(61,'Miracle',210),(62,'Crushcrushcrush',215),(63,'We Are Broken',198),(64,'Fences',198),(65,'Born for This',238),(66,'Fast in My Car',222),(67,'Now',250),(68,'Grow Up',230),(69,'Daydreaming',271),(70,'Interlude: Moving On',90),(71,'Ain\'t It Fun',296),(72,'Part II',281),(73,'Last Hope',310),(74,'Still Into You',216),(75,'Anklebiters',138),(76,'Interlude: Holiday',69),(77,'Proof',195),(78,'Hate to See Your Heart Break',309),(79,'One of Those (Crazy Girls)',212),(80,'Interlude: I\'m Not Angry Anymore',52),(81,'Be Alone',220),(82,'Future',472),(83,'Take Me to Church',241),(84,'Churchyard Blues',210),(85,'From Eden',279),(86,'Jackie and Wilson',282),(87,'Sedated',251),(88,'In a Week (feat. Karen Cowley)',250),(89,'Sue Me',274),(90,'To Be Alone',241),(91,'Cherry Wine',240),(92,'Work Song',260),(93,'Like Real People Do',208),(94,'It Will Come Back',263),(95,'Movement',242),(96,'Almost (Sweet Music)',251),(97,'Dinner and Diatribes',264),(98,'Sunlight',225),(99,'Shrike',231),(100,'The Hunger',230),(101,'To Be Alone',252),(102,'The Devil\'s Wife',315),(103,'Blow Wind Blow',280),(104,'The View from the Afternoon',218),(105,'I Bet You Look Good on the Dancefloor',173),(106,'Fake Tales of San Francisco',194),(107,'Dancing Shoes',141),(108,'You Probably Couldn\'t See for the Lights But You Were Staring Straight at Me',118),(109,'Still Take You Home',166),(110,'Riot Van',132),(111,'Red Lights Indicate Doors Are Secured',169),(112,'Mardy Bum',173),(113,'Perhaps Vampires Is a Bit Strong But...',180),(114,'When the Sun Goes Down',200),(115,'From the Ritz to the Rubble',186),(116,'A Certain Romance',331),(117,'Fearless',242),(118,'Fifteen',296),(119,'Love Story',235),(120,'Hey Stephen',254),(121,'White Horse',234),(122,'You Belong with Me',230),(123,'Breathe (feat. Colbie Caillat)',265),(124,'Tell Me Why',199),(125,'You\'re Not Sorry',263),(126,'The Way I Loved You',245),(127,'Forever & Always',225),(128,'The Best Day',245),(129,'Change',280),(130,'Welcome to New York',212),(131,'Blank Space',231),(132,'Style',230),(133,'Out of the Woods',235),(134,'All You Had to Do Was Stay',193),(135,'Shake It Off',219),(136,'I Wish You Would',207),(137,'Bad Blood',210),(138,'Wildest Dreams',220),(139,'How You Get the Girl',212),(140,'This Love',250),(141,'I Know Places',195),(142,'Clean',271),(143,'15 Step',236),(144,'Bodysnatchers',241),(145,'Nude',257),(146,'Weird Fishes/Arpeggi',319),(147,'All I Need',218),(148,'Faust Arp',142),(149,'Reckoner',278),(150,'House of Cards',331),(151,'Jigsaw Falling Into Place',264),(152,'Videotape',251),(153,'Serve the Servants',216),(154,'Scentless Apprentice',195),(155,'Heart-Shaped Box',278),(156,'Rape Me',155),(157,'Frances Farmer Will Have Her Revenge on Seattle',246),(158,'Dumb',152),(159,'Very Ape',115),(160,'Milk It',207),(161,'Pennyroyal Tea',218),(162,'Radio Friendly Unit Shifter',284),(163,'Tourette\'s',95),(164,'All Apologies',230),(165,'Do I Wanna Know?',272),(166,'R U Mine?',203),(167,'One for the Road',199),(168,'Arabella',237),(169,'I Want It All',180),(170,'No. 1 Party Anthem',247),(171,'Mad Sounds',212),(172,'Fireside',206),(173,'Why\'d You Only Call Me When You\'re High?',163),(174,'Snap Out of It',206),(175,'Knee Socks',247),(176,'I Wanna Be Yours',203),(177,'State of Grace',304),(178,'Red',223),(179,'Treacherous',242),(180,'I Knew You Were Trouble',218),(181,'All Too Well',329),(182,'22',232),(183,'I Almost Do',243),(184,'We Are Never Ever Getting Back Together',193),(185,'Stay Stay Stay',205),(186,'Holy Ground',250),(187,'Sad Beautiful Tragic',284),(188,'Everything Has Changed (feat. Ed Sheeran)',245),(189,'Starlight',221),(190,'Begin Again',245);
/*!40000 ALTER TABLE `artist_app_song` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artist_app_venue`
--

DROP TABLE IF EXISTS `artist_app_venue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artist_app_venue` (
  `VenueID` int NOT NULL AUTO_INCREMENT,
  `VenueName` varchar(255) NOT NULL,
  `VenueCapacity` int NOT NULL,
  `Country` varchar(50) NOT NULL,
  `City` varchar(50) NOT NULL,
  PRIMARY KEY (`VenueID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist_app_venue`
--

LOCK TABLES `artist_app_venue` WRITE;
/*!40000 ALTER TABLE `artist_app_venue` DISABLE KEYS */;
INSERT INTO `artist_app_venue` VALUES (1,'Madison Square Garden',20000,'United States','New York'),(2,'Glastonbury Festival',175000,'United Kingdom','Pilton'),(3,'The Astoria',2000,'United Kingdom','London'),(4,'Paramount Theatre',2700,'United States','Seattle'),(5,'Reading Festival',70000,'United Kingdom','Reading'),(6,'Coachella Valley Music and Arts Festival',125000,'United States','Indio'),(7,'Brixton Academy',5000,'United Kingdom','London'),(8,'Sydney Opera House',2700,'Australia','Sydney'),(9,'Hollywood Bowl',17500,'United States','Los Angeles'),(10,'MetLife Stadium',82500,'United States','East Rutherford'),(11,'3Arena',13000,'Ireland','Dublin');
/*!40000 ALTER TABLE `artist_app_venue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add artist',7,'add_artist'),(26,'Can change artist',7,'change_artist'),(27,'Can delete artist',7,'delete_artist'),(28,'Can view artist',7,'view_artist'),(29,'Can add label',8,'add_label'),(30,'Can change label',8,'change_label'),(31,'Can delete label',8,'delete_label'),(32,'Can view label',8,'view_label'),(33,'Can add song',9,'add_song'),(34,'Can change song',9,'change_song'),(35,'Can delete song',9,'delete_song'),(36,'Can view song',9,'view_song'),(37,'Can add venue',10,'add_venue'),(38,'Can change venue',10,'change_venue'),(39,'Can delete venue',10,'delete_venue'),(40,'Can view venue',10,'view_venue'),(41,'Can add concert',11,'add_concert'),(42,'Can change concert',11,'change_concert'),(43,'Can delete concert',11,'delete_concert'),(44,'Can view concert',11,'view_concert'),(45,'Can add album',12,'add_album'),(46,'Can change album',12,'change_album'),(47,'Can delete album',12,'delete_album'),(48,'Can view album',12,'view_album'),(49,'Can add concert song artist',13,'add_concertsongartist'),(50,'Can change concert song artist',13,'change_concertsongartist'),(51,'Can delete concert song artist',13,'delete_concertsongartist'),(52,'Can view concert song artist',13,'view_concertsongartist'),(53,'Can add artist song',14,'add_artistsong'),(54,'Can change artist song',14,'change_artistsong'),(55,'Can delete artist song',14,'delete_artistsong'),(56,'Can view artist song',14,'view_artistsong'),(57,'Can add album song',15,'add_albumsong'),(58,'Can change album song',15,'change_albumsong'),(59,'Can delete album song',15,'delete_albumsong'),(60,'Can view album song',15,'view_albumsong');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$CHwv3BmmzKUCekROfitV9V$A0mGSkYq2EfM5L7dY4QqIs9zT4vhS/0Yb/li2q4gXfc=','2024-12-07 23:32:57.478702',1,'teni','','','',1,1,'2024-12-07 23:32:51.229756');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-12-08 00:40:11.736742','87','Kendrick Lamar - HUMBLE. at Glastonbury Festival 2013',1,'[{\"added\": {}}]',13,1),(2,'2024-12-08 10:55:37.629823','11','3Arena',1,'[{\"added\": {}}]',10,1),(3,'2024-12-08 10:56:11.300449','16','Emerald Sound Festival',1,'[{\"added\": {}}]',11,1),(4,'2024-12-08 11:36:03.932879','102','Paramore - Part II at Emerald Sound Festival',1,'[{\"added\": {}}]',13,1),(5,'2024-12-08 11:36:27.525271','103','Paramore - Still Into You at Emerald Sound Festival',1,'[{\"added\": {}}]',13,1),(6,'2024-12-08 11:36:47.643073','104','Paramore - Anklebiters at Emerald Sound Festival',1,'[{\"added\": {}}]',13,1),(7,'2024-12-08 12:35:14.526620','105','Radiohead - Airbag at Live at The Astoria',1,'[{\"added\": {}}]',13,1),(8,'2024-12-08 12:35:21.536115','106','Radiohead - Karma Police at Live at The Astoria',1,'[{\"added\": {}}]',13,1),(9,'2024-12-08 12:35:31.417170','107','Radiohead - No Surprises at Live at The Astoria',1,'[{\"added\": {}}]',13,1),(10,'2024-12-08 12:36:32.535864','108','Radiohead - Exit Music (For a Film) at Live at The Astoria',1,'[{\"added\": {}}]',13,1),(11,'2024-12-08 18:04:15.887541','139','Arctic Monkeys - Territorial Pissings at Glastonbury Festival 2013',1,'[{\"added\": {}}]',13,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(12,'artist_app','album'),(15,'artist_app','albumsong'),(7,'artist_app','artist'),(14,'artist_app','artistsong'),(11,'artist_app','concert'),(13,'artist_app','concertsongartist'),(8,'artist_app','label'),(9,'artist_app','song'),(10,'artist_app','venue'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-12-07 23:23:09.446914'),(2,'auth','0001_initial','2024-12-07 23:23:10.183191'),(3,'admin','0001_initial','2024-12-07 23:23:10.364788'),(4,'admin','0002_logentry_remove_auto_add','2024-12-07 23:23:10.375349'),(5,'admin','0003_logentry_add_action_flag_choices','2024-12-07 23:23:10.388010'),(6,'artist_app','0001_initial','2024-12-07 23:23:11.384032'),(7,'contenttypes','0002_remove_content_type_name','2024-12-07 23:23:11.477208'),(8,'auth','0002_alter_permission_name_max_length','2024-12-07 23:23:11.559150'),(9,'auth','0003_alter_user_email_max_length','2024-12-07 23:23:11.585553'),(10,'auth','0004_alter_user_username_opts','2024-12-07 23:23:11.599227'),(11,'auth','0005_alter_user_last_login_null','2024-12-07 23:23:11.664150'),(12,'auth','0006_require_contenttypes_0002','2024-12-07 23:23:11.670246'),(13,'auth','0007_alter_validators_add_error_messages','2024-12-07 23:23:11.680291'),(14,'auth','0008_alter_user_username_max_length','2024-12-07 23:23:11.766762'),(15,'auth','0009_alter_user_last_name_max_length','2024-12-07 23:23:11.848496'),(16,'auth','0010_alter_group_name_max_length','2024-12-07 23:23:11.873314'),(17,'auth','0011_update_proxy_permissions','2024-12-07 23:23:11.886582'),(18,'auth','0012_alter_user_first_name_max_length','2024-12-07 23:23:11.968337'),(19,'sessions','0001_initial','2024-12-07 23:23:12.019950'),(20,'artist_app','0002_alter_concert_venueid','2024-12-08 10:47:56.046750'),(21,'artist_app','0003_alter_album_labelid','2024-12-08 15:24:06.673070');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('hsfh0im7pxc4r33z8gkc16wcjuxt6iud','.eJxVjDEOwyAQBP9CHSHONhhSpvcb0HEcwUkEkrGrKH-PLblImi12ZvctPG5r9lvjxc9RXAWIy28XkJ5cDhAfWO5VUi3rMgd5KPKkTU418ut2un8HGVve1xqMG1mRYZU06B4TKGP3hDT0Y2cJEJkYAQdExzaFSMqpwJA02diJzxfljDir:1tK4ID:rkrkCP3J-skKYduB90ApAQ1ex43H3OqqxDsdmB9DvcY','2024-12-21 23:32:57.485202');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-08 22:57:57
