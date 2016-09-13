CREATE DATABASE  IF NOT EXISTS `notice_db` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `notice_db`;
-- MySQL dump 10.13  Distrib 5.5.50, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: notice_db
-- ------------------------------------------------------
-- Server version	5.5.50-0ubuntu0.14.04.1

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
-- Table structure for table `account_emailaddress`
--

DROP TABLE IF EXISTS `account_emailaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_emailaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `account_emailaddress_user_id_2c513194_fk_auth_user_id` (`user_id`),
  CONSTRAINT `account_emailaddress_user_id_2c513194_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailaddress`
--

LOCK TABLES `account_emailaddress` WRITE;
/*!40000 ALTER TABLE `account_emailaddress` DISABLE KEYS */;
INSERT INTO `account_emailaddress` VALUES (2,'monokbaev@gmail.com',1,1,3),(3,'dancho_fun@mail.ru',1,1,4),(4,'donnietruth@gmail.com',1,1,5),(5,'gsuper50@gmail.com',1,1,6);
/*!40000 ALTER TABLE `account_emailaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_emailconfirmation`
--

DROP TABLE IF EXISTS `account_emailconfirmation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_emailconfirmation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `sent` datetime DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `account_ema_email_address_id_5b7f8c58_fk_account_emailaddress_id` (`email_address_id`),
  CONSTRAINT `account_ema_email_address_id_5b7f8c58_fk_account_emailaddress_id` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailconfirmation`
--

LOCK TABLES `account_emailconfirmation` WRITE;
/*!40000 ALTER TABLE `account_emailconfirmation` DISABLE KEYS */;
INSERT INTO `account_emailconfirmation` VALUES (2,'2016-09-07 10:53:50','2016-09-07 10:53:53','0ofetuyeeakdgns0ha1qqryp60wqjg9jfhzl1mtgbcty12rzmegmihw8sjmxwgyb',2),(3,'2016-09-07 17:31:49','2016-09-07 17:31:52','k6nca8ovdcewlebxbfpg9d4p0qb7uhfgotvngixx99yvqncilznfiexppgzagu1b',3),(4,'2016-09-07 17:47:30','2016-09-07 17:47:33','yqjxttlscnqu6laqs0imqv05jocgkfbb7r3z062ezfbhbr0qugtbmmxs90oxsyew',3),(5,'2016-09-07 18:19:54','2016-09-07 18:19:57','ktrrpepyg3lcthqrziiofziaojrluptmirmdl3pvyvxdyi0p4dhmesndcdlzow3g',3),(6,'2016-09-08 07:43:05','2016-09-08 07:43:08','xiagntrhsylrw3nvn2znscuxf6stldu00bo7m78b6pykwui3oa0onrbmskhpk2f1',4),(7,'2016-09-10 22:44:16','2016-09-10 22:44:19','loypszvewbcan5cwp4wkjhxqqmpd0rrgihiokrchzyhyjvfw2h5bk3v09opmlbew',5);
/*!40000 ALTER TABLE `account_emailconfirmation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add user dashboard module',1,'add_userdashboardmodule'),(2,'Can change user dashboard module',1,'change_userdashboardmodule'),(3,'Can delete user dashboard module',1,'delete_userdashboardmodule'),(4,'Can add bookmark',2,'add_bookmark'),(5,'Can change bookmark',2,'change_bookmark'),(6,'Can delete bookmark',2,'delete_bookmark'),(7,'Can add pinned application',3,'add_pinnedapplication'),(8,'Can change pinned application',3,'change_pinnedapplication'),(9,'Can delete pinned application',3,'delete_pinnedapplication'),(10,'Can add log entry',4,'add_logentry'),(11,'Can change log entry',4,'change_logentry'),(12,'Can delete log entry',4,'delete_logentry'),(13,'Can add permission',5,'add_permission'),(14,'Can change permission',5,'change_permission'),(15,'Can delete permission',5,'delete_permission'),(16,'Can add group',6,'add_group'),(17,'Can change group',6,'change_group'),(18,'Can delete group',6,'delete_group'),(19,'Can add user',7,'add_user'),(20,'Can change user',7,'change_user'),(21,'Can delete user',7,'delete_user'),(22,'Can add content type',8,'add_contenttype'),(23,'Can change content type',8,'change_contenttype'),(24,'Can delete content type',8,'delete_contenttype'),(25,'Can add session',9,'add_session'),(26,'Can change session',9,'change_session'),(27,'Can delete session',9,'delete_session'),(28,'Can add notice',10,'add_notice'),(29,'Can change notice',10,'change_notice'),(30,'Can delete notice',10,'delete_notice'),(31,'Can add notice_ place',11,'add_notice_place'),(32,'Can change notice_ place',11,'change_notice_place'),(33,'Can delete notice_ place',11,'delete_notice_place'),(37,'Can add site',13,'add_site'),(38,'Can change site',13,'change_site'),(39,'Can delete site',13,'delete_site'),(40,'Can add email address',14,'add_emailaddress'),(41,'Can change email address',14,'change_emailaddress'),(42,'Can delete email address',14,'delete_emailaddress'),(43,'Can add email confirmation',15,'add_emailconfirmation'),(44,'Can change email confirmation',15,'change_emailconfirmation'),(45,'Can delete email confirmation',15,'delete_emailconfirmation'),(46,'Can add social application',16,'add_socialapp'),(47,'Can change social application',16,'change_socialapp'),(48,'Can delete social application',16,'delete_socialapp'),(49,'Can add social account',17,'add_socialaccount'),(50,'Can change social account',17,'change_socialaccount'),(51,'Can delete social account',17,'delete_socialaccount'),(52,'Can add social application token',18,'add_socialtoken'),(53,'Can change social application token',18,'change_socialtoken'),(54,'Can delete social application token',18,'delete_socialtoken'),(55,'Can add user_ profile',19,'add_user_profile'),(56,'Can change user_ profile',19,'change_user_profile'),(57,'Can delete user_ profile',19,'delete_user_profile'),(58,'Can add comment',20,'add_comment'),(59,'Can change comment',20,'change_comment'),(60,'Can delete comment',20,'delete_comment'),(61,'Can add task state',21,'add_taskmeta'),(62,'Can change task state',21,'change_taskmeta'),(63,'Can delete task state',21,'delete_taskmeta'),(64,'Can add saved group result',22,'add_tasksetmeta'),(65,'Can change saved group result',22,'change_tasksetmeta'),(66,'Can delete saved group result',22,'delete_tasksetmeta'),(67,'Can add interval',23,'add_intervalschedule'),(68,'Can change interval',23,'change_intervalschedule'),(69,'Can delete interval',23,'delete_intervalschedule'),(70,'Can add crontab',24,'add_crontabschedule'),(71,'Can change crontab',24,'change_crontabschedule'),(72,'Can delete crontab',24,'delete_crontabschedule'),(73,'Can add periodic tasks',25,'add_periodictasks'),(74,'Can change periodic tasks',25,'change_periodictasks'),(75,'Can delete periodic tasks',25,'delete_periodictasks'),(76,'Can add periodic task',26,'add_periodictask'),(77,'Can change periodic task',26,'change_periodictask'),(78,'Can delete periodic task',26,'delete_periodictask'),(79,'Can add worker',27,'add_workerstate'),(80,'Can change worker',27,'change_workerstate'),(81,'Can delete worker',27,'delete_workerstate'),(82,'Can add task',28,'add_taskstate'),(83,'Can change task',28,'change_taskstate'),(84,'Can delete task',28,'delete_taskstate');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$24000$ZOwKTlIshy8H$Uu8EG2G1rOLr4Rtfj/osToL3Jm0a6h0NYHEb+SqbS3M=','2016-09-12 19:28:20',1,'admin','','','',1,1,'2016-09-06 09:17:35'),(3,'pbkdf2_sha256$24000$qH8Ojzg3I8Ge$0Ft2hpEwLHwCK2O5BoRhVDSfGTpbB4Re9pTk8S/TPVU=','2016-09-12 20:13:15',0,'chyngyz','','','monokbaev@gmail.com',0,1,'2016-09-07 10:53:50'),(4,'pbkdf2_sha256$24000$KZ0G7U6ChzXD$YhdbRQ3sEbqDRL76QGDrHYCBeWD6jCMkCG1GfEUY0hI=','2016-09-12 20:04:42',0,'dan','','','dancho_fun@mail.ru',0,1,'2016-09-07 17:31:48'),(5,'pbkdf2_sha256$24000$iIBoCkr3AjPc$R5vMIXoTCUQ03C8qvvEyhUMviAM9SfR0dpxvPxJpcAk=','2016-09-12 20:13:46',0,'kio','','','donnietruth@gmail.com',0,1,'2016-09-08 07:43:05'),(6,'pbkdf2_sha256$24000$x1STMqegdmoN$Dr5JOUR9Wnsw8jPF1aO1U0PMEkPKl8/f3HPYyH5Qk9E=','2016-09-12 16:43:48',0,'space_man','','','gsuper50@gmail.com',0,1,'2016-09-10 22:44:16');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `celery_taskmeta`
--

DROP TABLE IF EXISTS `celery_taskmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `celery_taskmeta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL,
  `result` longtext,
  `date_done` datetime NOT NULL,
  `traceback` longtext,
  `hidden` tinyint(1) NOT NULL,
  `meta` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_id` (`task_id`),
  KEY `celery_taskmeta_662f707d` (`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `celery_taskmeta`
--

LOCK TABLES `celery_taskmeta` WRITE;
/*!40000 ALTER TABLE `celery_taskmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `celery_taskmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `celery_tasksetmeta`
--

DROP TABLE IF EXISTS `celery_tasksetmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `celery_tasksetmeta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskset_id` varchar(255) NOT NULL,
  `result` longtext NOT NULL,
  `date_done` datetime NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taskset_id` (`taskset_id`),
  KEY `celery_tasksetmeta_662f707d` (`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `celery_tasksetmeta`
--

LOCK TABLES `celery_tasksetmeta` WRITE;
/*!40000 ALTER TABLE `celery_tasksetmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `celery_tasksetmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_userdashboardmodule`
--

DROP TABLE IF EXISTS `dashboard_userdashboardmodule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboard_userdashboardmodule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `module` varchar(255) NOT NULL,
  `app_label` varchar(255) DEFAULT NULL,
  `user` int(10) unsigned NOT NULL,
  `column` int(10) unsigned NOT NULL,
  `order` int(11) NOT NULL,
  `settings` longtext NOT NULL,
  `children` longtext NOT NULL,
  `collapsed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_userdashboardmodule`
--

LOCK TABLES `dashboard_userdashboardmodule` WRITE;
/*!40000 ALTER TABLE `dashboard_userdashboardmodule` DISABLE KEYS */;
INSERT INTO `dashboard_userdashboardmodule` VALUES (1,'Быстрые ссылки','jet.dashboard.modules.LinkList',NULL,1,0,0,'{\"layout\": \"inline\"}','[{\"url\": \"/\", \"title\": \"\\u0412\\u0435\\u0440\\u043d\\u0443\\u0442\\u044c\\u0441\\u044f \\u043d\\u0430 \\u0441\\u0430\\u0439\\u0442\"}, {\"url\": \"/admin/password_change/\", \"title\": \"\\u0418\\u0437\\u043c\\u0435\\u043d\\u0438\\u0442\\u044c \\u043f\\u0430\\u0440\\u043e\\u043b\\u044c\"}, {\"url\": \"/admin/logout/\", \"title\": \"\\u0412\\u044b\\u0439\\u0442\\u0438\"}]',0),(2,'Приложения','jet.dashboard.modules.AppList',NULL,1,1,0,'{\"models\": null, \"exclude\": [\"auth.*\"]}','',0),(3,'Администрирование','jet.dashboard.modules.AppList',NULL,1,2,0,'{\"models\": [\"auth.*\"], \"exclude\": null}','',0),(4,'Последние действия','jet.dashboard.modules.RecentActions',NULL,1,0,1,'{\"exclude_list\": null, \"include_list\": null, \"limit\": 10, \"user\": null}','',0),(5,'Новости от Django','jet.dashboard.modules.Feed',NULL,1,1,1,'{\"limit\": 5, \"feed_url\": \"http://www.djangoproject.com/rss/weblog/\"}','',1),(6,'Поддержка','jet.dashboard.modules.LinkList',NULL,1,2,1,'{\"layout\": \"stacked\"}','[{\"url\": \"http://docs.djangoproject.com/\", \"external\": true, \"title\": \"\\u0414\\u043e\\u043a\\u0443\\u043c\\u0435\\u043d\\u0442\\u0430\\u0446\\u0438\\u044f \\u043f\\u043e Django\"}, {\"url\": \"http://groups.google.com/group/django-users\", \"external\": true, \"title\": \"\\u0413\\u0443\\u0433\\u043b-\\u0433\\u0440\\u0443\\u043f\\u043f\\u0430 \\\"django-users\\\"\"}, {\"url\": \"irc://irc.freenode.net/django\", \"external\": true, \"title\": \"IRC \\u043a\\u0430\\u043d\\u0430\\u043b Django\"}]',0),(7,'Модели приложения','jet.dashboard.modules.ModelList','auth',1,0,0,'{\"models\": [\"auth.*\"], \"exclude\": null}','',0),(8,'Последние действия','jet.dashboard.modules.RecentActions','auth',1,1,0,'{\"exclude_list\": null, \"include_list\": [\"auth.*\"], \"limit\": 10, \"user\": null}','',0),(9,'Application models','jet.dashboard.modules.ModelList','djcelery',1,0,0,'{\"models\": [\"djcelery.*\"], \"exclude\": null}','',0),(10,'Recent Actions','jet.dashboard.modules.RecentActions','djcelery',1,1,0,'{\"exclude_list\": null, \"include_list\": [\"djcelery.*\"], \"limit\": 10, \"user\": null}','',0);
/*!40000 ALTER TABLE `dashboard_userdashboardmodule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2016-09-06 12:12:35','1','Facebook',1,'Добавлено.',16,1),(2,'2016-09-06 12:16:45','1','Facebook',2,'Изменен client_id.',16,1),(3,'2016-09-07 11:11:43','3','chyngyz',2,'Ни одно поле не изменено.',7,1),(4,'2016-09-07 11:27:01','1','chyngyz',2,'Изменен img и phone.',19,1),(5,'2016-09-07 17:29:25','2','dan',3,'',7,1),(6,'2016-09-07 17:30:14','2','admin',2,'Ни одно поле не изменено.',19,1),(7,'2016-09-07 17:53:22','16','Лето 2016',1,'Добавлено.',10,1),(8,'2016-09-07 18:05:19','18','Vbcnth',2,'Изменен description и to_user.',10,1),(9,'2016-09-07 18:07:43','19','New note2016',2,'Изменен description и to_user.',10,1),(10,'2016-09-07 18:20:55','3','dancho_fun@mail.ru (dan)',2,'Изменен verified.',14,1),(11,'2016-09-07 18:22:57','15','Мисси444',3,'',10,1),(12,'2016-09-07 18:22:57','13','New note',3,'',10,1),(13,'2016-09-07 18:22:57','12','New note',3,'',10,1),(14,'2016-09-07 18:22:57','11','Иссыкуль',3,'',10,1),(15,'2016-09-07 18:22:57','10','Иссыкуль',3,'',10,1),(16,'2016-09-07 18:22:58','9','Иссыкуль',3,'',10,1),(17,'2016-09-07 18:22:58','8','Иссыкуль',3,'',10,1),(18,'2016-09-07 18:22:58','7','Иссыкуль',3,'',10,1),(19,'2016-09-07 18:22:58','6','Иссыкуль',3,'',10,1),(20,'2016-09-07 18:22:58','5','Иссыкуль',3,'',10,1),(21,'2016-09-07 18:22:58','4','Futuro',3,'',10,1),(22,'2016-09-07 18:22:58','3','Futuro',3,'',10,1),(23,'2016-09-07 18:22:58','2','Иссыкуль',3,'',10,1),(24,'2016-09-07 18:22:58','1','Иссыкуль',3,'',10,1),(25,'2016-09-07 18:23:05','22','Common',2,'Изменен description и to_user.',10,1),(26,'2016-09-07 18:40:24','28','AAAAAND??1',3,'',10,1),(27,'2016-09-07 18:40:24','27','Coommmmon maan!!',3,'',10,1),(28,'2016-09-07 18:40:24','26','AAAAAND??',3,'',10,1),(29,'2016-09-07 18:40:24','25','So many notice!!',3,'',10,1),(30,'2016-09-07 18:40:24','24','It so amazing!',3,'',10,1),(31,'2016-09-07 18:40:24','23','Lego',3,'',10,1),(32,'2016-09-07 18:40:24','22','Common',3,'',10,1),(33,'2016-09-07 18:40:24','21','New note2017',3,'',10,1),(34,'2016-09-08 06:44:43','25','New note00043574',2,'Изменен description и to_user.',10,1),(35,'2016-09-08 07:34:45','26','so mauch',2,'Изменен description и to_user.',10,1),(36,'2016-09-08 07:38:22','27','New note9855',2,'Изменен description и to_user.',10,1),(37,'2016-09-08 07:44:19','27','New note9855',2,'Изменен to_user.',10,1),(38,'2016-09-08 08:54:47','31','New note2548',2,'Изменен description и to_user.',10,1),(39,'2016-09-08 13:09:04','21','NUUUUUadadad',3,'',10,1),(40,'2016-09-08 13:09:04','20','hy dude!!!',3,'',10,1),(41,'2016-09-08 13:09:04','19','New note2016',3,'',10,1),(42,'2016-09-08 13:09:04','18','Vbcnth',3,'',10,1),(43,'2016-09-08 13:09:04','16','Лето 2016',3,'',10,1),(44,'2016-09-08 13:09:36','24','New note0121021',3,'',10,1),(45,'2016-09-08 13:09:36','23','New note1111',3,'',10,1),(46,'2016-09-08 13:09:36','22','NUUUUUI$TO',3,'',10,1),(47,'2016-09-08 13:09:46','28','New notecvcvcv',2,'Изменен description и to_user.',10,1),(48,'2016-09-08 13:10:06','29','NUUUUUvvvvv',2,'Изменен description и to_user.',10,1),(49,'2016-09-08 13:10:15','30','NUUUUU66',2,'Изменен description и to_user.',10,1),(50,'2016-09-10 18:59:00','2','Example pereodic task: 0 4 * * * (m/h/d/dM/MY)',1,'Добавлено.',26,1),(51,'2016-09-12 16:17:33','43','Иссыкуль чаткал орг.',3,'',10,1),(52,'2016-09-12 19:29:13','46','Иссыкуль каракол',2,'Changed description and slug.',10,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (14,'account','emailaddress'),(15,'account','emailconfirmation'),(4,'admin','logentry'),(6,'auth','group'),(5,'auth','permission'),(7,'auth','user'),(8,'contenttypes','contenttype'),(1,'dashboard','userdashboardmodule'),(24,'djcelery','crontabschedule'),(23,'djcelery','intervalschedule'),(26,'djcelery','periodictask'),(25,'djcelery','periodictasks'),(21,'djcelery','taskmeta'),(22,'djcelery','tasksetmeta'),(28,'djcelery','taskstate'),(27,'djcelery','workerstate'),(2,'jet','bookmark'),(3,'jet','pinnedapplication'),(20,'main','comment'),(10,'main','notice'),(11,'main','notice_place'),(19,'main','user_profile'),(9,'sessions','session'),(13,'sites','site'),(17,'socialaccount','socialaccount'),(16,'socialaccount','socialapp'),(18,'socialaccount','socialtoken');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2016-09-02 08:27:14'),(2,'auth','0001_initial','2016-09-02 08:27:18'),(3,'admin','0001_initial','2016-09-02 08:27:19'),(4,'admin','0002_logentry_remove_auto_add','2016-09-02 08:27:19'),(5,'contenttypes','0002_remove_content_type_name','2016-09-02 08:27:20'),(6,'auth','0002_alter_permission_name_max_length','2016-09-02 08:27:20'),(7,'auth','0003_alter_user_email_max_length','2016-09-02 08:27:20'),(8,'auth','0004_alter_user_username_opts','2016-09-02 08:27:20'),(9,'auth','0005_alter_user_last_login_null','2016-09-02 08:27:21'),(10,'auth','0006_require_contenttypes_0002','2016-09-02 08:27:21'),(11,'auth','0007_alter_validators_add_error_messages','2016-09-02 08:27:21'),(12,'dashboard','0001_initial','2016-09-02 08:27:21'),(13,'jet','0001_initial','2016-09-02 08:27:21'),(14,'jet','0002_delete_userdashboardmodule','2016-09-02 08:27:21'),(15,'sessions','0001_initial','2016-09-02 08:27:22'),(16,'main','0001_initial','2016-09-05 14:56:09'),(17,'main','0002_notice_files_notice_place','2016-09-06 09:27:15'),(18,'main','0003_notice_slug','2016-09-06 09:34:18'),(19,'account','0001_initial','2016-09-06 10:45:04'),(20,'account','0002_email_max_length','2016-09-06 10:45:05'),(21,'sites','0001_initial','2016-09-06 10:45:05'),(22,'sites','0002_alter_domain_unique','2016-09-06 10:45:05'),(23,'socialaccount','0001_initial','2016-09-06 10:45:08'),(24,'socialaccount','0002_token_max_lengths','2016-09-06 10:45:09'),(25,'socialaccount','0003_extra_data_default_dict','2016-09-06 10:45:09'),(26,'main','0004_auto_20160907_1623','2016-09-07 10:23:55'),(27,'main','0005_auto_20160907_1649','2016-09-07 10:49:48'),(28,'main','0006_notice_to_user','2016-09-07 15:16:32'),(29,'main','0007_auto_20160908_1331','2016-09-08 07:32:06'),(30,'main','0008_comment','2016-09-08 09:58:46'),(31,'main','0009_comment_created_at','2016-09-08 10:00:15'),(32,'main','0010_auto_20160908_1603','2016-09-08 10:03:14'),(33,'main','0011_comment_parent','2016-09-08 10:06:00'),(34,'djcelery','0001_initial','2016-09-10 18:18:11'),(35,'main','0012_auto_20160911_1712','2016-09-11 11:12:55');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('2akkpfooa94qxyprrflptkgx0xfbzice','MTZhYzQ2ZDM5MGQwMGI1Y2Y5NWYwMWI5NWZkMTgyYWYzZDdkNjI5MTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJVdkNoVTRXUGpLODBFTXFoQVpiZ2ZQTnljVWFZV1dZUSIsIl9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfc2Vzc2lvbl9leHBpcnkiOjAsIl9sYW5ndWFnZSI6InJ1IiwiX2F1dGhfdXNlcl9oYXNoIjoiNWJhMjM3OTJkZjFkMzUxOTA3OWNiYTgxNzM2MDE3YzUwMWQzMDQzYyJ9','2016-09-23 20:46:22'),('2jrn4qfn4aynu3hpu5d8i2flue8lhtno','MWU2NWI5MDIwMmNhMTFiYjhiYzRhMzMzZWNkZmIyMDkzNjJhYjYyODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJwRXJMZnUwdTlGRlFZbnRBWHZPWkhNRWlzV3VvN2YxZSIsIl9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfc2Vzc2lvbl9leHBpcnkiOjAsIl9sYW5ndWFnZSI6InJ1IiwiX2F1dGhfdXNlcl9oYXNoIjoiM2RjMDk1OTFjYzk1MzI3ZTIwNWIzZjIxNGE0NjM1OWE5ZGNhOGUxYSJ9','2016-09-26 20:13:46'),('3cvd6dm8ozt50pk28jdqagb1ri0e2tkd','M2Q3NDk3ZGI0Yzg4NzRkMTZkNjM1ODljYzM3NjljYzAwNDk0NzJkMTp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiNWJhMjM3OTJkZjFkMzUxOTA3OWNiYTgxNzM2MDE3YzUwMWQzMDQzYyIsImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJTa2Y2Yk5uNm9HQnYxeG5jU2E2YlRITkM2dkFlTDR4SCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjQifQ==','2016-09-21 18:48:22'),('3hqfvnr9j7sqhljxctyf8erz6ahq6iyx','NTdjMDcyYjdmMTAyODYwMjdhNmI4YjYxMGEwMWYyNWUyMjg4ZmE3Yzp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJDSDI3am5lanNJMm5JeHROQVFhbkk4UkdTbUpJd0hJaiIsIl9hdXRoX3VzZXJfaWQiOiI2IiwiYWNjb3VudF91c2VyIjoiNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX3Nlc3Npb25fZXhwaXJ5IjowLCJhY2NvdW50X3ZlcmlmaWVkX2VtYWlsIjpudWxsLCJfbGFuZ3VhZ2UiOiJydSIsIl9hdXRoX3VzZXJfaGFzaCI6IjljOWU0MWY0ZTk1YjIyNTk0MWFjY2IyMjY5ZmI5MWZhYjFjN2RlODIifQ==','2016-09-24 22:44:55'),('4pa5m93t8uxov21k3uvj44793s14hs2q','ODZkNjZhYjAwOTYxN2VjNGFjZjgwMTVmMTczYjU0ODQ2Nzk5N2I4ODp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiMjM3MzgzNTNiMDRlZWE0YmQzOTJiZWRlZTNlN2UzNDgzNWQ1NjE4NyIsImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ2VVZYdTRVc1lJV3BGRXJjd0F1SzFhTDNzdDBYQWIxTiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjMifQ==','2016-09-21 14:42:46'),('a15bl8ceueywgbdc52hjxit1kdei8q0i','MzAxYjUwNmIwZGI5MDM1ODcwNGYxOTM0ZWE4M2NjNDJkOGQyNGM1ZDp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiM2RjMDk1OTFjYzk1MzI3ZTIwNWIzZjIxNGE0NjM1OWE5ZGNhOGUxYSIsImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ4NDRoZzBjWmVKWEJmTnlUeWVJY3ZodEU5cUpPeWN1ayIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjUifQ==','2016-09-23 11:40:46'),('co16fxpzuylqyubn85tbb2nilf7i0hv7','YzM1Y2RjOTlhMmM3MmE5MzgyODU2OWVlMmE0MDVkZjE0YTQ1OTc0Yjp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiNWJhMjM3OTJkZjFkMzUxOTA3OWNiYTgxNzM2MDE3YzUwMWQzMDQzYyIsImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ5N08yTGZZR3NnRHNqallDVlRBMDczS3hVNW9vUDd3RyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjQifQ==','2016-09-22 10:11:47'),('codpzyff6joy00117z7byke0cxyl3k4t','ZGIzY2RjODBjNWViOWU4YzdiODA3ODRkZjRhNTgyNjQ4YTBiMjEyOTp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiMjM3MzgzNTNiMDRlZWE0YmQzOTJiZWRlZTNlN2UzNDgzNWQ1NjE4NyIsImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJ3OGJjY3FDVlNINUE0NHJyZjN5eUJIbmJUSW1sazhVeCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjMifQ==','2016-09-22 19:50:50'),('ghf8bx01dqhjpvrhcw7ay1funxvrd34h','N2M3YTRlMDE1MzQ2YmFjOTA0YjIwYWMzNmFhM2IzMmFhMjkzNGMwZTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJnaXc3cVZJWTYzd25hYXJMeTZmRjJrQ1BuZnM3V0g0NCIsIl9hdXRoX3VzZXJfaWQiOiI2IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfc2Vzc2lvbl9leHBpcnkiOjAsIl9sYW5ndWFnZSI6InJ1IiwiX2F1dGhfdXNlcl9oYXNoIjoiOWM5ZTQxZjRlOTViMjI1OTQxYWNjYjIyNjlmYjkxZmFiMWM3ZGU4MiJ9','2016-09-26 06:45:51'),('glxs02fbelm6bqgsdeg3kek7bdl7o5dy','MzVhYjE2ZGIwOGIyMjM4ODhmYzgxZjMzNjQ1MjgyZWQwNGRhMmE3ZTp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiYTkzZTdhOGQ0ODFjNThmODM1MGIxNmIyOTQyOWYwZDBjNDIzZjhiOCIsImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI3MWlrODVsdUZ0QjNUeTVDTEFDbGRTaG5IOVM2Y2ZxWSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjIifQ==','2016-09-20 18:48:31'),('hejun0uuplk0ncc7inmbic6etsvc8gpt','MGUzODJhMzMyMzA2YmNlYzkxMGIzOGQyZDY0NDM0MzgxYmEyNzVkMjp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJzNzlzWEV5c2t3V25lMkN1MGhxZFd0V3ZrU3VBTHZxdiIsIl9hdXRoX3VzZXJfaWQiOiI2IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfc2Vzc2lvbl9leHBpcnkiOjAsIl9sYW5ndWFnZSI6InJ1IiwiX2F1dGhfdXNlcl9oYXNoIjoiOWM5ZTQxZjRlOTViMjI1OTQxYWNjYjIyNjlmYjkxZmFiMWM3ZGU4MiJ9','2016-09-26 16:19:29'),('hpvgoqvqzcei1d704ddw479yndwnwn2d','ZWFiNGIxYmQ1MmNlZmJiODNmMjZlNDRjMjNlY2QyYjE2NDZmYmM5ODp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI5aExMY2doQnlLV2tyU0twT3A4UTB6Y2VqQ0thdzBVbiIsIl9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfc2Vzc2lvbl9leHBpcnkiOjAsIl9sYW5ndWFnZSI6InJ1IiwiX2F1dGhfdXNlcl9oYXNoIjoiM2RjMDk1OTFjYzk1MzI3ZTIwNWIzZjIxNGE0NjM1OWE5ZGNhOGUxYSJ9','2016-09-24 09:41:56'),('hpzu361tc10tsdqm59nfggsfn50ayak7','YzBkNGY3MGYwMmFiM2UxODlhYmVjNjkwMjY1MDMyYTNiNzBiNWRiMzp7Il9hdXRoX3VzZXJfaGFzaCI6IjBmMjZlMGI2MmM0NmIyZjhiNTE5YjExMDk1NjFiODJmNWU3NDQxMzkiLCJhbGxhdXRoX2ZhY2Vib29rX25vbmNlIjoicElaZ3A2UFNxNDZGREpFVFhMUkhTQ0doUWtIcG9WVUsiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2016-09-20 12:18:00'),('lmr9mv40laybxn2dppj6obo5a9noga8w','MTE1N2FiYWJhYjAxMjk5MjYyZWFjZDdjNDc4ZGM2MmFkOWY2ZmQ1MTp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJVbzdkZjY3bkxXQTE1RmxVTzgyUDFJSGZ3SDJVQmtvdyIsIl9hdXRoX3VzZXJfaWQiOiI2IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfc2Vzc2lvbl9leHBpcnkiOjAsIl9sYW5ndWFnZSI6InJ1IiwiX2F1dGhfdXNlcl9oYXNoIjoiOWM5ZTQxZjRlOTViMjI1OTQxYWNjYjIyNjlmYjkxZmFiMWM3ZGU4MiJ9','2016-09-25 16:24:50'),('qtmjj1tv2jrjlnxgg7rnjr1ijzls1dfj','OWZmZGRmN2U3YjAzYWRkZWRhODVmOWZlZWIyMDlhMjFlZWRmMWQwODp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiMjM3MzgzNTNiMDRlZWE0YmQzOTJiZWRlZTNlN2UzNDgzNWQ1NjE4NyIsImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiI1eUpmRlJidDNhajZzQVY1bFVCTmtURmlnNUl5RkZsOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjMifQ==','2016-09-21 11:27:15'),('rh2hcdfxljefji8w4zdcf2umz1ewplkw','ZTQ3Y2UxMjEzNDM5ZDc2NmNjZjc5ZmRmMGFiZmQwZTk3ZGIzZGZkMjp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiM2RjMDk1OTFjYzk1MzI3ZTIwNWIzZjIxNGE0NjM1OWE5ZGNhOGUxYSIsImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJHTXRYcU9yWElrcjg1a1cxWWFqNVAxWjRINkU4T0RJMCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjUifQ==','2016-09-23 04:58:44'),('v4p1guchxfep0ppc1s6rgfauee9qyxfp','Njc0ZmRjOGQ1YmQ1MTA2NjM0NjQyYzEwNTIyNjIxMDc1Njk1OTEzZDp7ImFsbGF1dGhfZmFjZWJvb2tfbm9uY2UiOiJvRkJmcHU5WXFpWkxIemhRVmtlOUNQZGZtNEwyQkQ5TyIsIl9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfc2Vzc2lvbl9leHBpcnkiOjAsIl9sYW5ndWFnZSI6InJ1IiwiX2F1dGhfdXNlcl9oYXNoIjoiM2RjMDk1OTFjYzk1MzI3ZTIwNWIzZjIxNGE0NjM1OWE5ZGNhOGUxYSJ9','2016-09-24 15:07:06');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_crontabschedule`
--

DROP TABLE IF EXISTS `djcelery_crontabschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_crontabschedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `minute` varchar(64) NOT NULL,
  `hour` varchar(64) NOT NULL,
  `day_of_week` varchar(64) NOT NULL,
  `day_of_month` varchar(64) NOT NULL,
  `month_of_year` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_crontabschedule`
--

LOCK TABLES `djcelery_crontabschedule` WRITE;
/*!40000 ALTER TABLE `djcelery_crontabschedule` DISABLE KEYS */;
INSERT INTO `djcelery_crontabschedule` VALUES (1,'0','4','*','*','*');
/*!40000 ALTER TABLE `djcelery_crontabschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_intervalschedule`
--

DROP TABLE IF EXISTS `djcelery_intervalschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_intervalschedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `every` int(11) NOT NULL,
  `period` varchar(24) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_intervalschedule`
--

LOCK TABLES `djcelery_intervalschedule` WRITE;
/*!40000 ALTER TABLE `djcelery_intervalschedule` DISABLE KEYS */;
INSERT INTO `djcelery_intervalschedule` VALUES (1,60,'seconds'),(2,1,'seconds');
/*!40000 ALTER TABLE `djcelery_intervalschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_periodictask`
--

DROP TABLE IF EXISTS `djcelery_periodictask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_periodictask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `task` varchar(200) NOT NULL,
  `args` longtext NOT NULL,
  `kwargs` longtext NOT NULL,
  `queue` varchar(200) DEFAULT NULL,
  `exchange` varchar(200) DEFAULT NULL,
  `routing_key` varchar(200) DEFAULT NULL,
  `expires` datetime DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `last_run_at` datetime DEFAULT NULL,
  `total_run_count` int(10) unsigned NOT NULL,
  `date_changed` datetime NOT NULL,
  `description` longtext NOT NULL,
  `crontab_id` int(11) DEFAULT NULL,
  `interval_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `djcelery_peri_crontab_id_75609bab_fk_djcelery_crontabschedule_id` (`crontab_id`),
  KEY `djcelery_pe_interval_id_b426ab02_fk_djcelery_intervalschedule_id` (`interval_id`),
  CONSTRAINT `djcelery_peri_crontab_id_75609bab_fk_djcelery_crontabschedule_id` FOREIGN KEY (`crontab_id`) REFERENCES `djcelery_crontabschedule` (`id`),
  CONSTRAINT `djcelery_pe_interval_id_b426ab02_fk_djcelery_intervalschedule_id` FOREIGN KEY (`interval_id`) REFERENCES `djcelery_intervalschedule` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_periodictask`
--

LOCK TABLES `djcelery_periodictask` WRITE;
/*!40000 ALTER TABLE `djcelery_periodictask` DISABLE KEYS */;
INSERT INTO `djcelery_periodictask` VALUES (1,'celery.backend_cleanup','celery.backend_cleanup','[]','{}',NULL,NULL,NULL,NULL,1,'2016-09-12 22:00:00',1,'2016-09-12 22:00:30','',1,NULL),(2,'Example pereodic task','main.tasks.just_print','[]','{}',NULL,NULL,NULL,NULL,1,'2016-09-12 22:00:00',1,'2016-09-12 22:00:30','',1,NULL),(3,'main.tasks.just_print','main.tasks.just_print','[]','{}',NULL,NULL,NULL,NULL,1,'2016-09-13 00:15:15',1730,'2016-09-13 00:15:55','',NULL,1);
/*!40000 ALTER TABLE `djcelery_periodictask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_periodictasks`
--

DROP TABLE IF EXISTS `djcelery_periodictasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_periodictasks` (
  `ident` smallint(6) NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`ident`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_periodictasks`
--

LOCK TABLES `djcelery_periodictasks` WRITE;
/*!40000 ALTER TABLE `djcelery_periodictasks` DISABLE KEYS */;
INSERT INTO `djcelery_periodictasks` VALUES (1,'2016-09-12 20:31:15');
/*!40000 ALTER TABLE `djcelery_periodictasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_taskstate`
--

DROP TABLE IF EXISTS `djcelery_taskstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_taskstate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(64) NOT NULL,
  `task_id` varchar(36) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `tstamp` datetime NOT NULL,
  `args` longtext,
  `kwargs` longtext,
  `eta` datetime DEFAULT NULL,
  `expires` datetime DEFAULT NULL,
  `result` longtext,
  `traceback` longtext,
  `runtime` double DEFAULT NULL,
  `retries` int(11) NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `worker_id` int(11),
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_id` (`task_id`),
  KEY `djcelery_taskstate_9ed39e2e` (`state`),
  KEY `djcelery_taskstate_b068931c` (`name`),
  KEY `djcelery_taskstate_863bb2ee` (`tstamp`),
  KEY `djcelery_taskstate_662f707d` (`hidden`),
  KEY `djcelery_taskstate_ce77e6ef` (`worker_id`),
  CONSTRAINT `djcelery_taskstate_worker_id_f7f57a05_fk_djcelery_workerstate_id` FOREIGN KEY (`worker_id`) REFERENCES `djcelery_workerstate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_taskstate`
--

LOCK TABLES `djcelery_taskstate` WRITE;
/*!40000 ALTER TABLE `djcelery_taskstate` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_taskstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djcelery_workerstate`
--

DROP TABLE IF EXISTS `djcelery_workerstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djcelery_workerstate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostname` varchar(255) NOT NULL,
  `last_heartbeat` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hostname` (`hostname`),
  KEY `djcelery_workerstate_f129901a` (`last_heartbeat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djcelery_workerstate`
--

LOCK TABLES `djcelery_workerstate` WRITE;
/*!40000 ALTER TABLE `djcelery_workerstate` DISABLE KEYS */;
/*!40000 ALTER TABLE `djcelery_workerstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jet_bookmark`
--

DROP TABLE IF EXISTS `jet_bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jet_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) NOT NULL,
  `title` varchar(255) NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jet_bookmark`
--

LOCK TABLES `jet_bookmark` WRITE;
/*!40000 ALTER TABLE `jet_bookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `jet_bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jet_pinnedapplication`
--

DROP TABLE IF EXISTS `jet_pinnedapplication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jet_pinnedapplication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(255) NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `date_add` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jet_pinnedapplication`
--

LOCK TABLES `jet_pinnedapplication` WRITE;
/*!40000 ALTER TABLE `jet_pinnedapplication` DISABLE KEYS */;
/*!40000 ALTER TABLE `jet_pinnedapplication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_comment`
--

DROP TABLE IF EXISTS `main_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` longtext NOT NULL,
  `author_id` int(11) NOT NULL,
  `created_at` datetime,
  `notice_to_id` int(11),
  `parent_id` int(11),
  PRIMARY KEY (`id`),
  KEY `main_comment_author_id_c7372add_fk_auth_user_id` (`author_id`),
  KEY `main_comment_05948588` (`notice_to_id`),
  KEY `main_comment_6be37982` (`parent_id`),
  CONSTRAINT `main_comment_author_id_c7372add_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `main_comment_notice_to_id_ad2de247_fk_main_notice_id` FOREIGN KEY (`notice_to_id`) REFERENCES `main_notice` (`id`),
  CONSTRAINT `main_comment_parent_id_80ac5d3b_fk_main_comment_id` FOREIGN KEY (`parent_id`) REFERENCES `main_comment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_comment`
--

LOCK TABLES `main_comment` WRITE;
/*!40000 ALTER TABLE `main_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_notice`
--

DROP TABLE IF EXISTS `main_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(500) NOT NULL,
  `description` longtext NOT NULL,
  `created_at` datetime NOT NULL,
  `time` datetime NOT NULL,
  `slug` varchar(50),
  `to_user_id` int(11),
  `file` varchar(100),
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `main_notice_63add04c` (`to_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_notice`
--

LOCK TABLES `main_notice` WRITE;
/*!40000 ALTER TABLE `main_notice` DISABLE KEYS */;
INSERT INTO `main_notice` VALUES (26,'so mauch','<p>mouth must be dead!</p>','2016-09-08 06:47:05','2016-11-24 05:04:00','so-mauch',1,NULL),(28,'New notecvcvcv','<p>sadasdasdasd</p>','2016-09-08 07:49:16','2016-11-24 05:04:00','new-notecvcvcv',1,NULL),(29,'NUUUUUvvvvv','<p>dssadasdasd sadasd</p>','2016-09-08 07:51:42','2016-11-24 05:04:00','nuuuuuvvvvv',3,NULL),(30,'NUUUUU66','<p>ururhfhndkviikfj fjurnjrjujfjfnrnrjrjrjr jrjrjrjrjjrnjrjrjr rjjrjr</p>','2016-09-08 08:39:02','2016-11-24 05:04:00','nuuuuu66',1,NULL),(35,'New note by dan4o','dsfsdfsd fsdcfdscfsdcf sdfcsd44','2016-09-08 11:12:02','2016-09-10 22:35:00','new-note-by-dan4o',4,NULL),(36,'My note','new note by daniyar!!!','2016-09-10 20:21:22','2016-09-10 21:13:30','my-note',4,NULL),(37,'Notice to space_man','Common maan call me! Its me Jacob!','2016-09-10 22:46:18','2016-09-12 12:53:00','notice-to-space_man',6,''),(38,'Like the boss','LIKe the boss! LIKe the boss! LIKe the boss! LIKe the boss! LIKe the boss! LIKe the boss! LIKe the boss! LIKe the boss! LIKe the boss! LIKe the boss!','2016-09-10 22:58:31','2016-09-12 09:19:00','like-the-boss',6,''),(42,'Иссыкуль23','Новая напоминалка!!!','2016-09-12 09:42:13','2016-09-12 15:30:00','23',6,''),(44,'Иссыкуль bldfo','dsfsddsf sdfsdkjf jdksfnksdjnf dkjfnksdjnf sdjf ksdjfn!','2016-09-12 16:18:43','2016-09-12 16:30:00','bldfo',1,'files/kroner-2.ram'),(45,'Lincoln','Lincoln was a president!','2016-09-12 16:20:36','2016-09-12 16:45:00','lincoln',6,'files/Try-Django-1.8-master.zip'),(46,'Иссыкуль каракол','<p>Яблоки отвезти в каракол!</p>','2016-09-12 17:20:57','2016-09-12 17:21:00','issykul-karakol',6,''),(48,'Иссыкуль 2018','Фото!','2016-09-12 17:37:47','2016-09-12 22:03:00','issykul-2018',5,''),(51,'Иссыкуль-Бостери','Вновь на ИК!!','2016-09-12 18:31:26','2016-09-12 21:35:00','issykul-bosteri',5,''),(53,'Иссыкуль с любовью','ИК!!1','2016-09-12 18:53:14','2016-09-12 21:24:00','issykul-s-ljubovju',5,''),(54,'Иссыкуль-Бостери Ярма','ыфвыфв ыфв ыфв ыфв фы!','2016-09-12 19:06:49','2016-09-12 20:34:00','issykul-bosteri-jarma',5,''),(55,'Common','ffffdf df dfdf!','2016-09-12 23:48:22','2016-09-13 20:23:20','common',NULL,'');
/*!40000 ALTER TABLE `main_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_notice_mens`
--

DROP TABLE IF EXISTS `main_notice_mens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_notice_mens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notice_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `main_notice_mens_notice_id_6cef683f_uniq` (`notice_id`,`user_id`),
  KEY `main_notice_mens_user_id_cd17a8cb_fk_auth_user_id` (`user_id`),
  CONSTRAINT `main_notice_mens_notice_id_15c44f17_fk_main_notice_id` FOREIGN KEY (`notice_id`) REFERENCES `main_notice` (`id`),
  CONSTRAINT `main_notice_mens_user_id_cd17a8cb_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_notice_mens`
--

LOCK TABLES `main_notice_mens` WRITE;
/*!40000 ALTER TABLE `main_notice_mens` DISABLE KEYS */;
INSERT INTO `main_notice_mens` VALUES (24,26,1),(25,26,3),(28,28,3),(29,28,4),(30,29,3),(31,29,4),(32,30,3),(33,30,4),(42,35,3),(43,35,5),(44,36,5),(45,37,5),(46,38,3),(50,42,3),(52,44,6),(53,45,3),(54,46,5),(56,48,6),(57,51,3),(58,53,6),(59,54,6);
/*!40000 ALTER TABLE `main_notice_mens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_notice_place`
--

DROP TABLE IF EXISTS `main_notice_place`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_notice_place` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dolgota` varchar(500) NOT NULL,
  `wirota` varchar(500) NOT NULL,
  `notice_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `notice_id` (`notice_id`),
  CONSTRAINT `main_notice_place_notice_id_93fdf114_fk_main_notice_id` FOREIGN KEY (`notice_id`) REFERENCES `main_notice` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_notice_place`
--

LOCK TABLES `main_notice_place` WRITE;
/*!40000 ALTER TABLE `main_notice_place` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_notice_place` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_user_profile`
--

DROP TABLE IF EXISTS `main_user_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_user_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(100) DEFAULT NULL,
  `phone` varchar(400) DEFAULT NULL,
  `for_user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `for_user_id` (`for_user_id`),
  CONSTRAINT `main_user_profile_for_user_id_03b38332_fk_auth_user_id` FOREIGN KEY (`for_user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_user_profile`
--

LOCK TABLES `main_user_profile` WRITE;
/*!40000 ALTER TABLE `main_user_profile` DISABLE KEYS */;
INSERT INTO `main_user_profile` VALUES (1,'images/1.jpg','0556777438',3),(2,'','',1),(4,'images/imageвщь.jpeg','+996 557 880 182',4),(5,'images/image.jpeg','0556777439',5),(6,'',NULL,6);
/*!40000 ALTER TABLE `main_user_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialaccount`
--

DROP TABLE IF EXISTS `socialaccount_socialaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialaccount_socialaccount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `uid` varchar(191) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialaccount_provider_fc810c6e_uniq` (`provider`,`uid`),
  KEY `socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id` (`user_id`),
  CONSTRAINT `socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialaccount`
--

LOCK TABLES `socialaccount_socialaccount` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialaccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp`
--

DROP TABLE IF EXISTS `socialaccount_socialapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialaccount_socialapp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  `client_id` varchar(191) NOT NULL,
  `secret` varchar(191) NOT NULL,
  `key` varchar(191) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp`
--

LOCK TABLES `socialaccount_socialapp` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp` DISABLE KEYS */;
INSERT INTO `socialaccount_socialapp` VALUES (1,'facebook','Facebook','503080473229711','655360b2ced22849b98e4cda83f6d0c0','');
/*!40000 ALTER TABLE `socialaccount_socialapp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp_sites`
--

DROP TABLE IF EXISTS `socialaccount_socialapp_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialaccount_socialapp_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `socialapp_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialapp_sites_socialapp_id_71a9a768_uniq` (`socialapp_id`,`site_id`),
  KEY `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` (`site_id`),
  CONSTRAINT `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`),
  CONSTRAINT `socialaccoun_socialapp_id_97fb6e7d_fk_socialaccount_socialapp_id` FOREIGN KEY (`socialapp_id`) REFERENCES `socialaccount_socialapp` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp_sites`
--

LOCK TABLES `socialaccount_socialapp_sites` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` DISABLE KEYS */;
INSERT INTO `socialaccount_socialapp_sites` VALUES (1,1,1);
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialtoken`
--

DROP TABLE IF EXISTS `socialaccount_socialtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialaccount_socialtoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` longtext NOT NULL,
  `token_secret` longtext NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialtoken_app_id_fca4e0ac_uniq` (`app_id`,`account_id`),
  KEY `socialacco_account_id_951f210e_fk_socialaccount_socialaccount_id` (`account_id`),
  CONSTRAINT `socialaccount_soci_app_id_636a42d7_fk_socialaccount_socialapp_id` FOREIGN KEY (`app_id`) REFERENCES `socialaccount_socialapp` (`id`),
  CONSTRAINT `socialacco_account_id_951f210e_fk_socialaccount_socialaccount_id` FOREIGN KEY (`account_id`) REFERENCES `socialaccount_socialaccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialtoken`
--

LOCK TABLES `socialaccount_socialtoken` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialtoken` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-13  6:17:22
