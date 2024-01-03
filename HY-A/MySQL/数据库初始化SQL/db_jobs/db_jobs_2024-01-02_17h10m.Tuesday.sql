-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: 192.168.3.7    Database: db_jobs
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
-- Current Database: `db_jobs`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `db_jobs` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `db_jobs`;

--
-- Table structure for table `xxl_job_group`
--

DROP TABLE IF EXISTS `xxl_job_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xxl_job_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_name` varchar(64) NOT NULL COMMENT '执行器AppName',
  `title` varchar(12) NOT NULL COMMENT '执行器名称',
  `address_type` tinyint NOT NULL DEFAULT '0' COMMENT '执行器地址类型：0=自动注册、1=手动录入',
  `address_list` text COMMENT '执行器地址列表，多地址逗号分隔',
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xxl_job_group`
--

LOCK TABLES `xxl_job_group` WRITE;
/*!40000 ALTER TABLE `xxl_job_group` DISABLE KEYS */;
INSERT INTO `xxl_job_group` VALUES (2,'huiyong-app-task','HuiYong定时任务',0,NULL,'2023-12-17 21:30:21');
/*!40000 ALTER TABLE `xxl_job_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xxl_job_info`
--

DROP TABLE IF EXISTS `xxl_job_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xxl_job_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `job_group` int NOT NULL COMMENT '执行器主键ID',
  `job_desc` varchar(255) NOT NULL,
  `add_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `author` varchar(64) DEFAULT NULL COMMENT '作者',
  `alarm_email` varchar(255) DEFAULT NULL COMMENT '报警邮件',
  `schedule_type` varchar(50) NOT NULL DEFAULT 'NONE' COMMENT '调度类型',
  `schedule_conf` varchar(128) DEFAULT NULL COMMENT '调度配置，值含义取决于调度类型',
  `misfire_strategy` varchar(50) NOT NULL DEFAULT 'DO_NOTHING' COMMENT '调度过期策略',
  `executor_route_strategy` varchar(50) DEFAULT NULL COMMENT '执行器路由策略',
  `executor_handler` varchar(255) DEFAULT NULL COMMENT '执行器任务handler',
  `executor_param` varchar(512) DEFAULT NULL COMMENT '执行器任务参数',
  `executor_block_strategy` varchar(50) DEFAULT NULL COMMENT '阻塞处理策略',
  `executor_timeout` int NOT NULL DEFAULT '0' COMMENT '任务执行超时时间，单位秒',
  `executor_fail_retry_count` int NOT NULL DEFAULT '0' COMMENT '失败重试次数',
  `glue_type` varchar(50) NOT NULL COMMENT 'GLUE类型',
  `glue_source` mediumtext COMMENT 'GLUE源代码',
  `glue_remark` varchar(128) DEFAULT NULL COMMENT 'GLUE备注',
  `glue_updatetime` datetime DEFAULT NULL COMMENT 'GLUE更新时间',
  `child_jobid` varchar(255) DEFAULT NULL COMMENT '子任务ID，多个逗号分隔',
  `trigger_status` tinyint NOT NULL DEFAULT '0' COMMENT '调度状态：0-停止，1-运行',
  `trigger_last_time` bigint NOT NULL DEFAULT '0' COMMENT '上次调度时间',
  `trigger_next_time` bigint NOT NULL DEFAULT '0' COMMENT '下次调度时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xxl_job_info`
--

LOCK TABLES `xxl_job_info` WRITE;
/*!40000 ALTER TABLE `xxl_job_info` DISABLE KEYS */;
INSERT INTO `xxl_job_info` VALUES (2,2,'1、同步Redis博主访问人数到数据库，时间方案：每天凌晨10分钟','2023-09-24 12:05:25','2023-09-24 15:05:25','梁惠涌','1026946613@qq.com','CRON','0 10 0 * * ?','DO_NOTHING','FIRST','syncBlogInfoReadNum','','SERIAL_EXECUTION',0,0,'BEAN','','GLUE代码初始化','2023-09-24 12:05:25','',1,1702743000000,1702829400000),(3,2,'2、同步Redis博客访问人数到数据库，时间方案：每天凌晨20分钟','2023-09-24 14:57:53','2023-09-24 15:05:22','梁惠涌','1026946613@qq.com','CRON','0 20 0 * * ?','DO_NOTHING','FIRST','syncBlogReadNum','','SERIAL_EXECUTION',0,0,'BEAN','','GLUE代码初始化','2023-09-24 14:57:53','',1,1702743600000,1702830000000),(4,2,'同步搜索引擎SEO','2023-09-24 15:05:05','2023-09-24 15:05:19','梁惠涌','1026946613@qq.com','CRON','0 10 0 * * ?','DO_NOTHING','FIRST','SyncSeo','','SERIAL_EXECUTION',0,0,'BEAN','','GLUE代码初始化','2023-09-24 15:05:05','',1,1702743000000,1702829400000),(5,2,'同步ES搜索','2023-10-26 16:32:42','2023-10-26 16:32:56','梁惠涌','1026946613@qq.com','CRON','0 15 0 * * ?','DO_NOTHING','FIRST','Sync_ES_Data','','SERIAL_EXECUTION',0,0,'BEAN','','GLUE代码初始化','2023-10-26 16:32:42','',1,1702743300000,1702829700000);
/*!40000 ALTER TABLE `xxl_job_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xxl_job_lock`
--

DROP TABLE IF EXISTS `xxl_job_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xxl_job_lock` (
  `lock_name` varchar(50) NOT NULL COMMENT '锁名称',
  PRIMARY KEY (`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xxl_job_lock`
--

LOCK TABLES `xxl_job_lock` WRITE;
/*!40000 ALTER TABLE `xxl_job_lock` DISABLE KEYS */;
INSERT INTO `xxl_job_lock` VALUES ('schedule_lock');
/*!40000 ALTER TABLE `xxl_job_lock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xxl_job_log`
--

DROP TABLE IF EXISTS `xxl_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xxl_job_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `job_group` int NOT NULL COMMENT '执行器主键ID',
  `job_id` int NOT NULL COMMENT '任务，主键ID',
  `executor_address` varchar(255) DEFAULT NULL COMMENT '执行器地址，本次执行的地址',
  `executor_handler` varchar(255) DEFAULT NULL COMMENT '执行器任务handler',
  `executor_param` varchar(512) DEFAULT NULL COMMENT '执行器任务参数',
  `executor_sharding_param` varchar(20) DEFAULT NULL COMMENT '执行器任务分片参数，格式如 1/2',
  `executor_fail_retry_count` int NOT NULL DEFAULT '0' COMMENT '失败重试次数',
  `trigger_time` datetime DEFAULT NULL COMMENT '调度-时间',
  `trigger_code` int NOT NULL COMMENT '调度-结果',
  `trigger_msg` text COMMENT '调度-日志',
  `handle_time` datetime DEFAULT NULL COMMENT '执行-时间',
  `handle_code` int NOT NULL COMMENT '执行-状态',
  `handle_msg` text COMMENT '执行-日志',
  `alarm_status` tinyint NOT NULL DEFAULT '0' COMMENT '告警状态：0-默认、1-无需告警、2-告警成功、3-告警失败',
  PRIMARY KEY (`id`),
  KEY `I_trigger_time` (`trigger_time`),
  KEY `I_handle_code` (`handle_code`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xxl_job_log`
--

LOCK TABLES `xxl_job_log` WRITE;
/*!40000 ALTER TABLE `xxl_job_log` DISABLE KEYS */;
INSERT INTO `xxl_job_log` VALUES (192,2,2,'http://172.18.0.12:9999/','syncBlogInfoReadNum','',NULL,0,'2023-11-17 00:10:00',200,'任务触发类型：Cron触发<br>调度机器：172.18.0.6<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://172.18.0.12:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://172.18.0.12:9999/<br>code：200<br>msg：null','2023-11-17 00:10:00',200,'',0),(193,2,4,'http://172.18.0.12:9999/','SyncSeo','',NULL,0,'2023-11-17 00:10:00',200,'任务触发类型：Cron触发<br>调度机器：172.18.0.6<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://172.18.0.12:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://172.18.0.12:9999/<br>code：200<br>msg：null','2023-11-17 00:10:00',200,'',0),(194,2,5,'http://172.18.0.12:9999/','Sync_ES_Data','',NULL,0,'2023-11-17 00:15:00',200,'任务触发类型：Cron触发<br>调度机器：172.18.0.6<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://172.18.0.12:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://172.18.0.12:9999/<br>code：200<br>msg：null','2023-11-17 00:15:08',200,'',0),(195,2,3,'http://172.18.0.12:9999/','syncBlogReadNum','',NULL,0,'2023-11-17 00:20:00',200,'任务触发类型：Cron触发<br>调度机器：172.18.0.6<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://172.18.0.12:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://172.18.0.12:9999/<br>code：200<br>msg：null','2023-11-17 00:20:00',200,'',0),(196,2,2,'http://172.18.0.12:9999/','syncBlogInfoReadNum','',NULL,0,'2023-11-18 00:10:00',200,'任务触发类型：Cron触发<br>调度机器：172.18.0.6<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://172.18.0.12:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://172.18.0.12:9999/<br>code：200<br>msg：null','2023-11-18 00:10:00',200,'',0),(197,2,4,'http://172.18.0.12:9999/','SyncSeo','',NULL,0,'2023-11-18 00:10:00',200,'任务触发类型：Cron触发<br>调度机器：172.18.0.6<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://172.18.0.12:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://172.18.0.12:9999/<br>code：200<br>msg：null','2023-11-18 00:10:00',200,'',0),(198,2,5,'http://172.18.0.12:9999/','Sync_ES_Data','',NULL,0,'2023-11-18 00:15:00',200,'任务触发类型：Cron触发<br>调度机器：172.18.0.6<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://172.18.0.12:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://172.18.0.12:9999/<br>code：200<br>msg：null','2023-11-18 00:15:07',200,'',0),(199,2,3,'http://172.18.0.12:9999/','syncBlogReadNum','',NULL,0,'2023-11-18 00:20:00',200,'任务触发类型：Cron触发<br>调度机器：172.18.0.6<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://172.18.0.12:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://172.18.0.12:9999/<br>code：200<br>msg：null','2023-11-18 00:20:00',200,'',0),(200,2,2,'http://172.18.0.12:9999/','syncBlogInfoReadNum','',NULL,0,'2023-11-19 00:10:00',200,'任务触发类型：Cron触发<br>调度机器：172.18.0.6<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://172.18.0.12:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://172.18.0.12:9999/<br>code：200<br>msg：null','2023-11-19 00:10:00',200,'',0),(201,2,4,'http://172.18.0.12:9999/','SyncSeo','',NULL,0,'2023-11-19 00:10:00',200,'任务触发类型：Cron触发<br>调度机器：172.18.0.6<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://172.18.0.12:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://172.18.0.12:9999/<br>code：200<br>msg：null','2023-11-19 00:10:00',200,'',0),(202,2,5,'http://172.18.0.12:9999/','Sync_ES_Data','',NULL,0,'2023-11-19 00:15:00',200,'任务触发类型：Cron触发<br>调度机器：172.18.0.6<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://172.18.0.12:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://172.18.0.12:9999/<br>code：200<br>msg：null','2023-11-19 00:15:07',200,'',0),(203,2,3,'http://172.18.0.12:9999/','syncBlogReadNum','',NULL,0,'2023-11-19 00:20:00',200,'任务触发类型：Cron触发<br>调度机器：172.18.0.6<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://172.18.0.12:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://172.18.0.12:9999/<br>code：200<br>msg：null','2023-11-19 00:20:00',200,'',0),(204,2,2,'http://172.18.0.12:9999/','syncBlogInfoReadNum','',NULL,0,'2023-11-20 00:10:00',200,'任务触发类型：Cron触发<br>调度机器：172.18.0.6<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://172.18.0.12:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://172.18.0.12:9999/<br>code：200<br>msg：null','2023-11-20 00:10:00',200,'',0),(205,2,4,'http://172.18.0.12:9999/','SyncSeo','',NULL,0,'2023-11-20 00:10:00',200,'任务触发类型：Cron触发<br>调度机器：172.18.0.6<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://172.18.0.12:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://172.18.0.12:9999/<br>code：200<br>msg：null','2023-11-20 00:10:00',200,'',0),(206,2,5,'http://172.18.0.12:9999/','Sync_ES_Data','',NULL,0,'2023-11-20 00:15:00',200,'任务触发类型：Cron触发<br>调度机器：172.18.0.6<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://172.18.0.12:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://172.18.0.12:9999/<br>code：200<br>msg：null','2023-11-20 00:15:06',200,'',0),(207,2,3,'http://172.18.0.12:9999/','syncBlogReadNum','',NULL,0,'2023-11-20 00:20:00',200,'任务触发类型：Cron触发<br>调度机器：172.18.0.6<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://172.18.0.12:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://172.18.0.12:9999/<br>code：200<br>msg：null','2023-11-20 00:20:00',200,'',0),(208,2,2,'http://172.18.0.12:9999/','syncBlogInfoReadNum','',NULL,0,'2023-11-21 00:10:00',200,'任务触发类型：Cron触发<br>调度机器：172.18.0.6<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://172.18.0.12:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://172.18.0.12:9999/<br>code：200<br>msg：null','2023-11-21 00:10:00',200,'',0),(209,2,4,'http://172.18.0.12:9999/','SyncSeo','',NULL,0,'2023-11-21 00:10:00',200,'任务触发类型：Cron触发<br>调度机器：172.18.0.6<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://172.18.0.12:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://172.18.0.12:9999/<br>code：200<br>msg：null','2023-11-21 00:10:00',200,'',0),(210,2,5,'http://172.18.0.12:9999/','Sync_ES_Data','',NULL,0,'2023-11-21 00:15:00',200,'任务触发类型：Cron触发<br>调度机器：172.18.0.6<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://172.18.0.12:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://172.18.0.12:9999/<br>code：200<br>msg：null','2023-11-21 00:15:07',200,'',0),(211,2,3,'http://172.18.0.12:9999/','syncBlogReadNum','',NULL,0,'2023-11-21 00:20:00',200,'任务触发类型：Cron触发<br>调度机器：172.18.0.6<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://172.18.0.12:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://172.18.0.12:9999/<br>code：200<br>msg：null','2023-11-21 00:20:00',200,'',0),(212,2,2,'http://172.18.0.12:9999/','syncBlogInfoReadNum','',NULL,0,'2023-11-22 00:10:00',200,'任务触发类型：Cron触发<br>调度机器：172.18.0.6<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://172.18.0.12:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://172.18.0.12:9999/<br>code：200<br>msg：null','2023-11-22 00:10:00',200,'',0),(213,2,4,'http://172.18.0.12:9999/','SyncSeo','',NULL,0,'2023-11-22 00:10:00',200,'任务触发类型：Cron触发<br>调度机器：172.18.0.6<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://172.18.0.12:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://172.18.0.12:9999/<br>code：200<br>msg：null','2023-11-22 00:10:00',200,'',0),(214,2,5,'http://172.18.0.12:9999/','Sync_ES_Data','',NULL,0,'2023-11-22 00:15:00',200,'任务触发类型：Cron触发<br>调度机器：172.18.0.6<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://172.18.0.12:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://172.18.0.12:9999/<br>code：200<br>msg：null','2023-11-22 00:15:07',200,'',0),(215,2,3,'http://172.18.0.12:9999/','syncBlogReadNum','',NULL,0,'2023-11-22 00:20:00',200,'任务触发类型：Cron触发<br>调度机器：172.18.0.6<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://172.18.0.12:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://172.18.0.12:9999/<br>code：200<br>msg：null','2023-11-22 00:20:00',200,'',0),(216,2,4,NULL,'SyncSeo','',NULL,0,'2023-11-25 00:10:00',500,'任务触发类型：Cron触发<br>调度机器：172.18.0.3<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>',NULL,0,NULL,3),(217,2,2,NULL,'syncBlogInfoReadNum','',NULL,0,'2023-11-25 00:10:00',500,'任务触发类型：Cron触发<br>调度机器：172.18.0.3<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>',NULL,0,NULL,3),(218,2,5,NULL,'Sync_ES_Data','',NULL,0,'2023-11-25 00:15:00',500,'任务触发类型：Cron触发<br>调度机器：172.18.0.3<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>',NULL,0,NULL,3),(219,2,3,NULL,'syncBlogReadNum','',NULL,0,'2023-11-25 00:20:00',500,'任务触发类型：Cron触发<br>调度机器：172.18.0.3<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>',NULL,0,NULL,3),(220,2,2,NULL,'syncBlogInfoReadNum','',NULL,0,'2023-11-30 00:10:00',500,'任务触发类型：Cron触发<br>调度机器：172.18.0.3<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>',NULL,0,NULL,3),(221,2,4,NULL,'SyncSeo','',NULL,0,'2023-11-30 00:10:00',500,'任务触发类型：Cron触发<br>调度机器：172.18.0.3<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>',NULL,0,NULL,3),(222,2,5,NULL,'Sync_ES_Data','',NULL,0,'2023-11-30 00:15:00',500,'任务触发类型：Cron触发<br>调度机器：172.18.0.3<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>',NULL,0,NULL,3),(223,2,3,NULL,'syncBlogReadNum','',NULL,0,'2023-11-30 00:20:00',500,'任务触发类型：Cron触发<br>调度机器：172.18.0.3<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>',NULL,0,NULL,3),(224,2,4,NULL,'SyncSeo','',NULL,0,'2023-12-02 00:10:00',500,'任务触发类型：Cron触发<br>调度机器：172.18.0.3<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>',NULL,0,NULL,3),(225,2,2,NULL,'syncBlogInfoReadNum','',NULL,0,'2023-12-02 00:10:00',500,'任务触发类型：Cron触发<br>调度机器：172.18.0.3<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>',NULL,0,NULL,3),(226,2,5,NULL,'Sync_ES_Data','',NULL,0,'2023-12-02 00:15:00',500,'任务触发类型：Cron触发<br>调度机器：172.18.0.3<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>',NULL,0,NULL,3),(227,2,3,NULL,'syncBlogReadNum','',NULL,0,'2023-12-02 00:20:00',500,'任务触发类型：Cron触发<br>调度机器：172.18.0.3<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>',NULL,0,NULL,3),(228,2,4,'http://192.168.3.7:9999/','SyncSeo','',NULL,0,'2023-12-03 00:10:00',200,'任务触发类型：Cron触发<br>调度机器：172.18.0.3<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://192.168.3.7:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.3.7:9999/<br>code：200<br>msg：null','2023-12-03 00:10:00',200,'',0),(229,2,2,'http://192.168.3.7:9999/','syncBlogInfoReadNum','',NULL,0,'2023-12-03 00:10:00',200,'任务触发类型：Cron触发<br>调度机器：172.18.0.3<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://192.168.3.7:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.3.7:9999/<br>code：200<br>msg：null','2023-12-03 00:10:00',200,'',0),(230,2,5,'http://192.168.3.7:9999/','Sync_ES_Data','',NULL,0,'2023-12-03 00:15:00',200,'任务触发类型：Cron触发<br>调度机器：172.18.0.3<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://192.168.3.7:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.3.7:9999/<br>code：200<br>msg：null','2023-12-03 00:15:00',200,'',0),(231,2,3,'http://192.168.3.7:9999/','syncBlogReadNum','',NULL,0,'2023-12-03 00:20:00',200,'任务触发类型：Cron触发<br>调度机器：172.18.0.3<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://192.168.3.7:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.3.7:9999/<br>code：200<br>msg：null','2023-12-03 00:20:00',200,'',0),(232,2,5,'http://192.168.3.7:9999/','Sync_ES_Data','',NULL,0,'2023-12-03 01:27:40',200,'任务触发类型：手动触发<br>调度机器：172.18.0.3<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://192.168.3.7:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.3.7:9999/<br>code：200<br>msg：null','2023-12-03 01:27:46',200,'',0),(233,2,5,'http://192.168.3.7:9999/','Sync_ES_Data','',NULL,0,'2023-12-03 01:31:05',200,'任务触发类型：手动触发<br>调度机器：172.18.0.3<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://192.168.3.7:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.3.7:9999/<br>code：200<br>msg：null','2023-12-03 01:31:10',200,'',0),(234,2,5,'http://192.168.3.7:9999/','Sync_ES_Data','',NULL,0,'2023-12-03 01:34:00',200,'任务触发类型：手动触发<br>调度机器：172.18.0.3<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://192.168.3.7:9999/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.3.7:9999/<br>code：200<br>msg：null','2023-12-03 01:34:05',200,'',0),(235,2,2,NULL,'syncBlogInfoReadNum','',NULL,0,'2023-12-04 00:10:00',500,'任务触发类型：Cron触发<br>调度机器：172.18.0.4<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>',NULL,0,NULL,3),(236,2,4,NULL,'SyncSeo','',NULL,0,'2023-12-04 00:10:00',500,'任务触发类型：Cron触发<br>调度机器：172.18.0.4<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>',NULL,0,NULL,3),(237,2,5,NULL,'Sync_ES_Data','',NULL,0,'2023-12-04 00:15:00',500,'任务触发类型：Cron触发<br>调度机器：172.18.0.4<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>',NULL,0,NULL,3),(238,2,3,NULL,'syncBlogReadNum','',NULL,0,'2023-12-04 00:20:00',500,'任务触发类型：Cron触发<br>调度机器：172.18.0.4<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>',NULL,0,NULL,3),(239,2,2,NULL,'syncBlogInfoReadNum','',NULL,0,'2023-12-05 00:10:00',500,'任务触发类型：Cron触发<br>调度机器：172.18.0.2<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>',NULL,0,NULL,3),(240,2,4,NULL,'SyncSeo','',NULL,0,'2023-12-05 00:10:00',500,'任务触发类型：Cron触发<br>调度机器：172.18.0.2<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>',NULL,0,NULL,3),(241,2,5,NULL,'Sync_ES_Data','',NULL,0,'2023-12-05 00:15:00',500,'任务触发类型：Cron触发<br>调度机器：172.18.0.2<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>',NULL,0,NULL,3),(242,2,3,NULL,'syncBlogReadNum','',NULL,0,'2023-12-05 00:20:00',500,'任务触发类型：Cron触发<br>调度机器：172.18.0.2<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>',NULL,0,NULL,3),(243,2,2,NULL,'syncBlogInfoReadNum','',NULL,0,'2023-12-14 00:10:00',500,'任务触发类型：Cron触发<br>调度机器：172.18.0.4<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>',NULL,0,NULL,3),(244,2,4,NULL,'SyncSeo','',NULL,0,'2023-12-14 00:10:00',500,'任务触发类型：Cron触发<br>调度机器：172.18.0.4<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>',NULL,0,NULL,3),(245,2,5,NULL,'Sync_ES_Data','',NULL,0,'2023-12-14 00:15:00',500,'任务触发类型：Cron触发<br>调度机器：172.18.0.4<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>',NULL,0,NULL,3),(246,2,3,NULL,'syncBlogReadNum','',NULL,0,'2023-12-14 00:20:00',500,'任务触发类型：Cron触发<br>调度机器：172.18.0.4<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>',NULL,0,NULL,3),(247,2,2,NULL,'syncBlogInfoReadNum','',NULL,0,'2023-12-16 00:10:00',500,'任务触发类型：Cron触发<br>调度机器：172.18.0.2<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>',NULL,0,NULL,3),(248,2,4,NULL,'SyncSeo','',NULL,0,'2023-12-16 00:10:00',500,'任务触发类型：Cron触发<br>调度机器：172.18.0.2<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>',NULL,0,NULL,3),(249,2,5,NULL,'Sync_ES_Data','',NULL,0,'2023-12-16 00:15:00',500,'任务触发类型：Cron触发<br>调度机器：172.18.0.2<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>',NULL,0,NULL,3),(250,2,3,NULL,'syncBlogReadNum','',NULL,0,'2023-12-16 00:20:00',500,'任务触发类型：Cron触发<br>调度机器：172.18.0.2<br>执行器-注册方式：自动注册<br>执行器-地址列表：null<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>调度失败：执行器地址为空<br><br>',NULL,0,NULL,3);
/*!40000 ALTER TABLE `xxl_job_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xxl_job_log_report`
--

DROP TABLE IF EXISTS `xxl_job_log_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xxl_job_log_report` (
  `id` int NOT NULL AUTO_INCREMENT,
  `trigger_day` datetime DEFAULT NULL COMMENT '调度-时间',
  `running_count` int NOT NULL DEFAULT '0' COMMENT '运行中-日志数量',
  `suc_count` int NOT NULL DEFAULT '0' COMMENT '执行成功-日志数量',
  `fail_count` int NOT NULL DEFAULT '0' COMMENT '执行失败-日志数量',
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `i_trigger_day` (`trigger_day`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xxl_job_log_report`
--

LOCK TABLES `xxl_job_log_report` WRITE;
/*!40000 ALTER TABLE `xxl_job_log_report` DISABLE KEYS */;
INSERT INTO `xxl_job_log_report` VALUES (1,'2023-09-24 00:00:00',0,2,0,NULL),(2,'2023-09-23 00:00:00',0,0,0,NULL),(3,'2023-09-22 00:00:00',0,0,0,NULL),(4,'2023-09-25 00:00:00',0,3,0,NULL),(5,'2023-09-26 00:00:00',0,3,0,NULL),(6,'2023-09-27 00:00:00',0,3,0,NULL),(7,'2023-09-28 00:00:00',0,3,0,NULL),(8,'2023-09-29 00:00:00',0,3,0,NULL),(9,'2023-09-30 00:00:00',0,3,0,NULL),(10,'2023-10-01 00:00:00',0,3,0,NULL),(11,'2023-10-02 00:00:00',0,3,0,NULL),(12,'2023-10-03 00:00:00',0,3,0,NULL),(13,'2023-10-04 00:00:00',0,3,0,NULL),(14,'2023-10-05 00:00:00',0,3,0,NULL),(15,'2023-10-06 00:00:00',0,3,0,NULL),(16,'2023-10-07 00:00:00',0,3,0,NULL),(17,'2023-10-08 00:00:00',0,3,0,NULL),(18,'2023-10-09 00:00:00',0,3,0,NULL),(19,'2023-10-10 00:00:00',0,3,0,NULL),(20,'2023-10-11 00:00:00',0,3,0,NULL),(21,'2023-10-12 00:00:00',0,3,0,NULL),(22,'2023-10-13 00:00:00',0,3,0,NULL),(23,'2023-10-14 00:00:00',0,3,0,NULL),(24,'2023-10-15 00:00:00',0,3,0,NULL),(25,'2023-10-16 00:00:00',0,3,0,NULL),(26,'2023-10-17 00:00:00',0,3,0,NULL),(27,'2023-10-18 00:00:00',0,3,0,NULL),(28,'2023-10-19 00:00:00',0,3,0,NULL),(29,'2023-10-20 00:00:00',0,3,0,NULL),(30,'2023-10-21 00:00:00',0,3,0,NULL),(31,'2023-10-22 00:00:00',0,3,0,NULL),(32,'2023-10-23 00:00:00',0,3,0,NULL),(33,'2023-10-24 00:00:00',0,3,0,NULL),(34,'2023-10-25 00:00:00',0,3,0,NULL),(35,'2023-10-26 00:00:00',0,4,0,NULL),(36,'2023-10-27 00:00:00',0,8,0,NULL),(37,'2023-10-28 00:00:00',0,5,0,NULL),(38,'2023-10-29 00:00:00',0,4,0,NULL),(39,'2023-10-30 00:00:00',0,4,0,NULL),(40,'2023-10-31 00:00:00',0,4,0,NULL),(41,'2023-11-01 00:00:00',0,4,0,NULL),(42,'2023-11-02 00:00:00',0,4,0,NULL),(43,'2023-11-03 00:00:00',0,4,0,NULL),(44,'2023-11-04 00:00:00',0,4,0,NULL),(45,'2023-11-05 00:00:00',0,4,0,NULL),(46,'2023-11-06 00:00:00',0,4,0,NULL),(47,'2023-11-07 00:00:00',0,4,0,NULL),(48,'2023-11-08 00:00:00',0,4,0,NULL),(49,'2023-11-09 00:00:00',0,4,0,NULL),(50,'2023-11-25 00:00:00',0,0,4,NULL),(51,'2023-11-24 00:00:00',0,0,0,NULL),(52,'2023-11-23 00:00:00',0,0,0,NULL),(53,'2023-11-26 00:00:00',0,0,0,NULL),(54,'2023-11-27 00:00:00',0,0,0,NULL),(55,'2023-11-28 00:00:00',0,0,0,NULL),(56,'2023-11-29 00:00:00',0,0,0,NULL),(57,'2023-11-30 00:00:00',0,0,4,NULL),(58,'2023-12-01 00:00:00',0,0,0,NULL),(59,'2023-12-02 00:00:00',0,0,4,NULL),(60,'2023-12-03 00:00:00',0,7,0,NULL),(61,'2023-12-04 00:00:00',0,0,4,NULL),(62,'2023-12-05 00:00:00',0,0,4,NULL),(63,'2023-12-06 00:00:00',0,0,0,NULL),(64,'2023-12-07 00:00:00',0,0,0,NULL),(65,'2023-12-08 00:00:00',0,0,0,NULL),(66,'2023-12-09 00:00:00',0,0,0,NULL),(67,'2023-12-12 00:00:00',0,0,0,NULL),(68,'2023-12-11 00:00:00',0,0,0,NULL),(69,'2023-12-10 00:00:00',0,0,0,NULL),(70,'2023-12-13 00:00:00',0,0,0,NULL),(71,'2023-12-14 00:00:00',0,0,4,NULL),(72,'2023-12-15 00:00:00',0,0,0,NULL),(73,'2023-12-16 00:00:00',0,0,4,NULL),(74,'2023-12-17 00:00:00',0,0,0,NULL);
/*!40000 ALTER TABLE `xxl_job_log_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xxl_job_logglue`
--

DROP TABLE IF EXISTS `xxl_job_logglue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xxl_job_logglue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `job_id` int NOT NULL COMMENT '任务，主键ID',
  `glue_type` varchar(50) DEFAULT NULL COMMENT 'GLUE类型',
  `glue_source` mediumtext COMMENT 'GLUE源代码',
  `glue_remark` varchar(128) NOT NULL COMMENT 'GLUE备注',
  `add_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xxl_job_logglue`
--

LOCK TABLES `xxl_job_logglue` WRITE;
/*!40000 ALTER TABLE `xxl_job_logglue` DISABLE KEYS */;
/*!40000 ALTER TABLE `xxl_job_logglue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xxl_job_registry`
--

DROP TABLE IF EXISTS `xxl_job_registry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xxl_job_registry` (
  `id` int NOT NULL AUTO_INCREMENT,
  `registry_group` varchar(50) NOT NULL,
  `registry_key` varchar(255) NOT NULL,
  `registry_value` varchar(255) NOT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `i_g_k_v` (`registry_group`,`registry_key`,`registry_value`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xxl_job_registry`
--

LOCK TABLES `xxl_job_registry` WRITE;
/*!40000 ALTER TABLE `xxl_job_registry` DISABLE KEYS */;
/*!40000 ALTER TABLE `xxl_job_registry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xxl_job_user`
--

DROP TABLE IF EXISTS `xxl_job_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xxl_job_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '账号',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `role` tinyint NOT NULL COMMENT '角色：0-普通用户、1-管理员',
  `permission` varchar(255) DEFAULT NULL COMMENT '权限：执行器ID列表，多个逗号分割',
  PRIMARY KEY (`id`),
  UNIQUE KEY `i_username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xxl_job_user`
--

LOCK TABLES `xxl_job_user` WRITE;
/*!40000 ALTER TABLE `xxl_job_user` DISABLE KEYS */;
INSERT INTO `xxl_job_user` VALUES (1,'TaskAdmin','e10adc3949ba59abbe56e057f20f883e',1,NULL);
/*!40000 ALTER TABLE `xxl_job_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'db_jobs'
--

--
-- Dumping routines for database 'db_jobs'
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
