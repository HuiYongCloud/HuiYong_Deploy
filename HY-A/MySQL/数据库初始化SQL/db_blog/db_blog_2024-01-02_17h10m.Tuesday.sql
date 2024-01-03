-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: 192.168.3.7    Database: db_blog
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Current Database: `db_blog`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `db_blog` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `db_blog`;

--
-- Table structure for table `t_blog`
--

DROP TABLE IF EXISTS `t_blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_blog` (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '主键ID',
  `user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '博客编辑内容',
  `read_num` tinyint DEFAULT '0' COMMENT '阅读数',
  `like_num` tinyint DEFAULT '0' COMMENT '收藏数',
  `pri_code` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '私密权限码',
  `open_status` tinyint DEFAULT NULL COMMENT '数据状态：0->私密；1->公开',
  `data_status` tinyint DEFAULT NULL COMMENT '数据状态：0->禁用；1->启用',
  `blog_status` tinyint DEFAULT NULL COMMENT '数据状态：0->草稿；1->发布',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间 ',
  `order_num` tinyint DEFAULT NULL COMMENT '排序',
  `tag_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标签id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='博客表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_blog`
--

LOCK TABLES `t_blog` WRITE;
/*!40000 ALTER TABLE `t_blog` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_blog_content_tag`
--

DROP TABLE IF EXISTS `t_blog_content_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_blog_content_tag` (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '主键ID',
  `user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `tag_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标签名',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间 ',
  `order_num` tinyint DEFAULT NULL COMMENT '排序编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='博客标签表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_blog_content_tag`
--

LOCK TABLES `t_blog_content_tag` WRITE;
/*!40000 ALTER TABLE `t_blog_content_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_blog_content_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_blog_info`
--

DROP TABLE IF EXISTS `t_blog_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_blog_info` (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '主键ID',
  `user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户id',
  `blog_home_read_num` int DEFAULT NULL COMMENT '博客访问量（文章阅读总量 + 博客首页总量）',
  `blog_like_num` tinyint DEFAULT '0' COMMENT '博客文章收藏数',
  `focus_num` int DEFAULT NULL COMMENT '关注数',
  `blog_num` int DEFAULT NULL COMMENT '博客文章数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='博客摘要表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_blog_info`
--

LOCK TABLES `t_blog_info` WRITE;
/*!40000 ALTER TABLE `t_blog_info` DISABLE KEYS */;
INSERT INTO `t_blog_info` VALUES ('BI202111250004','U202111250003',16,0,2,184,'2021-11-25 09:36:44','2023-12-25 20:16:15'),('BI202310000','U202310000',0,0,0,1,'2023-10-04 17:49:09','2023-12-03 00:10:00');
/*!40000 ALTER TABLE `t_blog_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_blog_like`
--

DROP TABLE IF EXISTS `t_blog_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_blog_like` (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '主键ID',
  `user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `blog_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '博客id',
  `pri_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '权限码',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='博客用户收藏表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_blog_like`
--

LOCK TABLES `t_blog_like` WRITE;
/*!40000 ALTER TABLE `t_blog_like` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_blog_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_blog_user_focus`
--

DROP TABLE IF EXISTS `t_blog_user_focus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_blog_user_focus` (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '主键ID',
  `user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id（谁关注）',
  `focus_user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '关注的博主id（关注谁）',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='用户关注博主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_blog_user_focus`
--

LOCK TABLES `t_blog_user_focus` WRITE;
/*!40000 ALTER TABLE `t_blog_user_focus` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_blog_user_focus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_blog_visit_log`
--

DROP TABLE IF EXISTS `t_blog_visit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_blog_visit_log` (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '主键ID',
  `user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户Id',
  `blog_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '博客id',
  `ad_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '区域code',
  `ip` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ip地址',
  `province_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '省名',
  `city_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '城市名',
  `center` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '中心经纬度',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='博客访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_blog_visit_log`
--

LOCK TABLES `t_blog_visit_log` WRITE;
/*!40000 ALTER TABLE `t_blog_visit_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_blog_visit_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_mind`
--

DROP TABLE IF EXISTS `t_mind`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_mind` (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '主键ID',
  `user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '博客编辑内容',
  `read_num` tinyint DEFAULT '0' COMMENT '阅读数',
  `like_num` tinyint DEFAULT '0' COMMENT '收藏数',
  `pri_code` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '私密权限码',
  `open_status` tinyint DEFAULT NULL COMMENT '数据状态：0->私密；1->公开',
  `data_status` tinyint DEFAULT NULL COMMENT '数据状态：0->禁用；1->启用',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间 ',
  `order_num` tinyint DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='思维导图表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_mind`
--

LOCK TABLES `t_mind` WRITE;
/*!40000 ALTER TABLE `t_mind` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_mind` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'db_blog'
--

--
-- Dumping routines for database 'db_blog'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-02 17:10:48
