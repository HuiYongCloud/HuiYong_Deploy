-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: 192.168.3.7    Database: db_admin
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
-- Current Database: `db_admin`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `db_admin` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `db_admin`;

--
-- Table structure for table `t_admin_menu`
--

DROP TABLE IF EXISTS `t_admin_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_admin_menu` (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '主键ID',
  `menu_key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菜单名',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菜单名',
  `parent_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '父菜单id',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '页面链接',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `data_status` tinyint NOT NULL COMMENT '数据有效性。0-无效，1-有效',
  `sort_num` int DEFAULT NULL COMMENT '排序号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_admin_menu`
--

LOCK TABLES `t_admin_menu` WRITE;
/*!40000 ALTER TABLE `t_admin_menu` DISABLE KEYS */;
INSERT INTO `t_admin_menu` VALUES ('10001','Home','首页',NULL,NULL,'2023-04-11 00:45:24',1,1),('18001','Auth','权限管理',NULL,NULL,'2023-04-11 00:45:24',1,101),('18002','Role_List','角色列表','18001',NULL,'2023-04-11 00:45:24',1,1),('18003','Auth_Menu','菜单管理','18001',NULL,'2023-04-11 00:45:24',1,2),('18004','Auth_Menu_List','菜单列表','18003',NULL,'2023-04-11 00:45:24',1,1),('18005','Auth_Menu_Role','权限&菜单','18003',NULL,'2023-04-11 00:45:24',1,2),('18007','Auth_User_List','User用户管理','18001',NULL,'2023-04-11 00:45:24',1,3),('18008','Auth_Admin_User','Admin用户管理','18001',NULL,'2023-04-11 00:45:24',1,4),('18009','Auth_Admin_User_List','Admin用户列表','18008',NULL,'2023-04-11 00:45:24',1,1),('18010','Auth_Admin_User_Role','Admin用户&权限','18008',NULL,'2023-04-11 00:45:24',1,2),('19001','Account_Manager','账号中心','',NULL,'2023-05-07 22:31:59',1,100),('19002','Account_Edit','个人中心','19001',NULL,'2023-05-07 22:34:32',1,1),('19003','Login_Log','登录日志','19001',NULL,'2023-05-07 22:35:27',1,2),('2023050722124601','Blog','博客','',NULL,'2023-05-07 22:12:47',1,4),('2023050722134101','Blog_List','Blog列表','2023050722124601',NULL,'2023-05-07 22:13:42',1,2),('2023050722150801','Blog_Draft','草稿','2023050722124601',NULL,'2023-05-07 22:15:08',1,3),('2023050722163401','Blog_Recycle','Blog回收站','2023050722124601',NULL,'2023-05-07 22:16:34',1,4),('2023050723042401','My_Resume','关于我','',NULL,'2023-05-07 23:04:24',1,5),('2023050723244101','System_OPS','运维','',NULL,'2023-05-07 23:24:42',1,200),('2023051111104001','System_Nacos','Nacos','2023050723244101','https://{需要修改}/AppNacos/','2023-05-09 13:43:06',1,1),('2023051111104002','System_Sentinel','Sentinel','2023050723244101','https://{需要修改}/Sentinel/','2023-05-11 11:10:41',1,2),('2023051111104005','System_Task','定时任务','2023050723244101','https://{需要修改}/xxl-job-admin/','2023-05-07 23:25:37',1,4),('2023051111104006','System_MQ','消息队列','2023050723244101','https://{需要修改}/MQDashboard/','2023-05-07 23:27:30',1,3),('2023053113554201','Invitation_Code','邀请码','','','2023-05-31 13:55:43',1,2),('2023053117273901','Blog_Tag','标签','2023050722124601','','2023-05-31 17:27:40',1,1),('2023062810320601','Terms_Manager','协议','','','2023-06-28 10:32:06',1,102),('2023111023425701','ELK_Kibana','Kibana','2023050723244101','{需要修改}','2023-11-10 23:42:58',1,0),('2023112223343601','System_MinIO','MinIO','2023050723244101','https://{需要修改}/minio/','2023-11-22 23:34:37',1,5),('2023121901323401','Mind','思维导图','','','2023-12-19 01:32:35',1,3),('2023123101051901','Mind_List','Mind列表','2023121901323401','','2023-12-31 01:05:19',1,1),('2023123101053501','Mind_Recycle','Mind回收站','2023121901323401','','2023-12-31 01:05:36',1,2);
/*!40000 ALTER TABLE `t_admin_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_admin_menu_re_role`
--

DROP TABLE IF EXISTS `t_admin_menu_re_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_admin_menu_re_role` (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '主键ID',
  `menu_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菜单Id',
  `role_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '权限id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='菜单与权限关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_admin_menu_re_role`
--

LOCK TABLES `t_admin_menu_re_role` WRITE;
/*!40000 ALTER TABLE `t_admin_menu_re_role` DISABLE KEYS */;
INSERT INTO `t_admin_menu_re_role` VALUES ('2023071014114301','10001','20000','2023-07-10 14:11:43'),('2023071014114302','2023050722124601','20000','2023-07-10 14:11:43'),('2023071014114303','2023053117273901','20000','2023-07-10 14:11:43'),('2023071014114304','2023050722134101','20000','2023-07-10 14:11:43'),('2023071014114305','2023050722150801','20000','2023-07-10 14:11:43'),('2023071014114306','2023050722163401','20000','2023-07-10 14:11:43'),('2023071014114307','2023050723042401','20000','2023-07-10 14:11:43'),('2023071014114308','19001','20000','2023-07-10 14:11:43'),('2023071014114309','19002','20000','2023-07-10 14:11:43'),('2023071014114310','19003','20000','2023-07-10 14:11:43'),('2023102813504101','2023050723244101','2023102810400501','2023-10-28 13:50:42'),('2023102813504102','2023071018185701','2023102810400501','2023-10-28 13:50:42'),('2023102813504103','2023071018195201','2023102810400501','2023-10-28 13:50:42'),('2023110816020501','10001','2023110816005901','2023-11-08 16:02:05'),('2023110816020502','2023053113554201','2023110816005901','2023-11-08 16:02:05'),('2023110816020503','2023050722124601','2023110816005901','2023-11-08 16:02:05'),('2023110816020504','2023053117273901','2023110816005901','2023-11-08 16:02:05'),('2023110816020505','2023050722134101','2023110816005901','2023-11-08 16:02:05'),('2023110816020506','2023050722150801','2023110816005901','2023-11-08 16:02:05'),('2023110816020507','2023050722163401','2023110816005901','2023-11-08 16:02:05'),('2023110816020508','2023050723042401','2023110816005901','2023-11-08 16:02:05'),('2023110816020509','19001','2023110816005901','2023-11-08 16:02:05'),('2023110816020510','19002','2023110816005901','2023-11-08 16:02:05'),('2023110816020511','19003','2023110816005901','2023-11-08 16:02:05'),('2023110816020512','18001','2023110816005901','2023-11-08 16:02:05'),('2023110816020513','18002','2023110816005901','2023-11-08 16:02:05'),('2023110816020514','18003','2023110816005901','2023-11-08 16:02:05'),('2023110816020515','18004','2023110816005901','2023-11-08 16:02:05'),('2023110816020516','18005','2023110816005901','2023-11-08 16:02:05'),('2023110816020517','18007','2023110816005901','2023-11-08 16:02:05'),('2023110816020518','18008','2023110816005901','2023-11-08 16:02:05'),('2023110816020519','18009','2023110816005901','2023-11-08 16:02:05'),('2023110816020520','18010','2023110816005901','2023-11-08 16:02:05'),('2023110816020521','2023062810320601','2023110816005901','2023-11-08 16:02:05');
/*!40000 ALTER TABLE `t_admin_menu_re_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_admin_role`
--

DROP TABLE IF EXISTS `t_admin_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_admin_role` (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '主键ID',
  `role_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '身份名称',
  `data_status` tinyint(1) NOT NULL COMMENT '数据有效性。0-无效，1-有效',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_admin_role`
--

LOCK TABLES `t_admin_role` WRITE;
/*!40000 ALTER TABLE `t_admin_role` DISABLE KEYS */;
INSERT INTO `t_admin_role` VALUES ('10086','超级管理员',1,'2023-04-07 22:10:31','2023-04-26 17:30:00'),('20000','博主',1,'2023-05-07 22:10:31','2023-05-07 17:30:00'),('2023102810400501','开发人员',1,'2023-10-28 10:40:06','2023-10-28 10:40:05'),('2023110816005901','功能试用',1,'2023-11-08 16:00:59','2023-11-08 16:00:59');
/*!40000 ALTER TABLE `t_admin_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_admin_user`
--

DROP TABLE IF EXISTS `t_admin_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_admin_user` (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '主键ID',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '头像',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '邮箱',
  `pass_word` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间 ',
  `data_status` tinyint DEFAULT '1' COMMENT '数据状态：0->禁用；1->启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='管理后台用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_admin_user`
--

LOCK TABLES `t_admin_user` WRITE;
/*!40000 ALTER TABLE `t_admin_user` DISABLE KEYS */;
INSERT INTO `t_admin_user` VALUES ('AD2023001','https://img.huiyong.online/aaaaa/2023-11-23/e9d93456-1ea2-4145-8d3c-14948ed2e054.png','SuperAdmin@qq.com','49c0f55d275b24a057bfd7111db2a852','超管','U202111250003','2023-04-07 22:11:36','2024-01-02 01:19:22',1);
/*!40000 ALTER TABLE `t_admin_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_admin_user_login_log`
--

DROP TABLE IF EXISTS `t_admin_user_login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_admin_user_login_log` (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '主键ID',
  `admin_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Admin用户Id',
  `type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '类型，1：登录，2：登出',
  `ad_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '区域code',
  `ip` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ip地址',
  `province_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '省名',
  `city_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '城市名',
  `center` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '中心经纬度',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='admin登录日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_admin_user_login_log`
--

LOCK TABLES `t_admin_user_login_log` WRITE;
/*!40000 ALTER TABLE `t_admin_user_login_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_admin_user_login_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_admin_user_re_role`
--

DROP TABLE IF EXISTS `t_admin_user_re_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_admin_user_re_role` (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '主键ID',
  `role_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色Id',
  `admin_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '后台管理员id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='用户与权限关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_admin_user_re_role`
--

LOCK TABLES `t_admin_user_re_role` WRITE;
/*!40000 ALTER TABLE `t_admin_user_re_role` DISABLE KEYS */;
INSERT INTO `t_admin_user_re_role` VALUES ('1001','10086','AD2023001','2023-04-07 22:12:16'),('2023110816022201','2023110816005901','AD202310000','2023-11-08 16:02:22');
/*!40000 ALTER TABLE `t_admin_user_re_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'db_admin'
--

--
-- Dumping routines for database 'db_admin'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-02 17:10:47
