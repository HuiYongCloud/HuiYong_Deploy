-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: 192.168.3.7    Database: db_nacos_config
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
-- Current Database: `db_nacos_config`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `db_nacos_config` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `db_nacos_config`;

--
-- Table structure for table `config_info`
--

DROP TABLE IF EXISTS `config_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config_info` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `c_use` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `effect` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `c_schema` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `encrypted_data_key` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '秘钥',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_configinfo_datagrouptenant` (`data_id`,`group_id`,`tenant_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin ROW_FORMAT=DYNAMIC COMMENT='config_info';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_info`
--

LOCK TABLES `config_info` WRITE;
/*!40000 ALTER TABLE `config_info` DISABLE KEYS */;
INSERT INTO `config_info` VALUES (1,'huiyong-db-config.yaml','DEFAULT_GROUP','# 数据库变更不支持动态刷新，需要重启服务器\ndynamic:\n  datasource:\n    admin:\n      url: jdbc:mysql://{HY-A公网ip}:{数据库端口}/db_admin?useUnicode=true&serverTimezone=Asia/Shanghai&useSSL=false&autoReconnect=true&useAffectedRows=true\n      username: root\n      password: {数据库密码}\n    base:\n      url: jdbc:mysql://{HY-A公网ip}:{数据库端口}/db_base?useUnicode=true&serverTimezone=Asia/Shanghai&useSSL=false&autoReconnect=true&useAffectedRows=true\n      username: root\n      password: {数据库密码}\n    user:\n      url: jdbc:mysql://{HY-A公网ip}:{数据库端口}/db_user?useUnicode=true&serverTimezone=Asia/Shanghai&useSSL=false&autoReconnect=true&useAffectedRows=true\n      username: root\n      password: {数据库密码}\n    blog:\n      url: jdbc:mysql://{HY-A公网ip}:{数据库端口}/db_blog?useUnicode=true&serverTimezone=Asia/Shanghai&useSSL=false&autoReconnect=true&useAffectedRows=true\n      username: root\n      password: {数据库密码}','cea99a95b9d20fed38cc949822a75d94','2023-07-10 10:57:00','2024-01-02 17:07:36','nacos','172.23.0.1','','HuiYong-Nacos','','','','yaml','',''),(2,'huiyong-druid-config.yaml','DEFAULT_GROUP','spring:\r\n  datasource:\r\n    druid:\r\n      ########## 过滤器 ##########\r\n      #配置监控统计的内置过滤器：stat-监控统计(必须配置，否则监控不到sql)、wall-防御sql注入、log4j2-日志记录框架(值与应用中的日志框架保持一致，如 log4j、log4j、slf4j等等)\r\n      filters: stat,wall,log4j2\r\n      #自定义过滤器配置：stat、slf4j、log4j、log4j2、commons-log、wall\r\n      #内置Filter都是默认配置，无法满足需求时，则可以自定义 Filter，自定义的过滤器默认都是没有开启的。\r\n      filter:\r\n        stat: #状态监控过滤器\r\n          enabled: true\r\n          db-type: mysql\r\n          log-slow-sql: true  #开启慢sql监控，超过指定时间则认为是慢sql，记录到日志中\r\n          slow-sql-millis: 5000\r\n        slf4j: #日志监控过滤器，使用slf4j 进行日志输出\r\n          enabled: true\r\n          statement-log-error-enabled: true\r\n          statement-create-after-log-enabled: false\r\n          statement-close-after-log-enabled: false\r\n          result-set-open-after-log-enabled: false\r\n          result-set-close-after-log-enabled: false\r\n        wall: #防火墙过滤器\r\n          enabled: true\r\n          config:\r\n            delete-allow: false     #不允许删除数据\r\n            drop-table-allow: false #不允许删除表\r\n\r\n      ########## WebStatFilter：web 状态监控过滤器 ##########\r\n      web-stat-filter:\r\n        enabled: true\r\n        url-pattern: /*                 #过滤所有url\r\n        exclusions: \"*.js,*.css,*.gif,*.jpg,*.png,*.ico,/druid/*\"   # 排除一些不必要的url\r\n        session-stat-enable: true       #开启session统计功能\r\n        session-stat-max-count: 1000    #session的最大个数,默认100\r\n\r\n      ########## http://127.0.0.1:21000/druid/index.html ##########\r\n      ########## StatViewServlet(监控页面路径配置)，用于展示Druid的监控统计信息 ##########\r\n      stat-view-servlet:\r\n        enabled: true\r\n        #url-pattern: /druid/*          # 访问内置监控页面的路径，内置监控页面的首页是 http://127.0.0.1:8080/druid/login.html 或者 /druid/index.html\r\n        reset-enable: false             # 不允许清空统计数据,重新计算\r\n        #login-username: druid          # 配置监控页面登陆用户\r\n        #login-password: druid          # 配置监控页面登陆密码\r\n        allow:                          # 允许访问的地址,如果没有配置或者为空，则允许所有访问\r\n        deny:                           # 拒绝访问的地址，deny优先于allow，如果在deny列表中，就算在allow列表中，也会被拒绝','8b2e5f9542c5aac9929e465c27a9b81d','2023-07-10 10:57:16','2023-07-10 10:57:16','nacos','183.14.134.155','','HuiYong-Nacos',NULL,NULL,NULL,'yaml',NULL,''),(3,'huiyong-redis-config.yaml','DEFAULT_GROUP','spring:\n  data:\n    redis:\n      host: {HY-A公网ip}\n      port: 10003\n      database: 0 #数据库索引，默认0\n      password: {Redis密码}\n      jedis:\n        pool:\n          max-active: 8 #连接池最大连接数(使用负值表示没有限制)\n          max-wait: -1 #最大阻塞等待时间(使用负值表示没有限制)\n          max-idle: 8 #最大空闲连接数\n          min-idle: 0 #最小空闲连接数\n      timeout: 5000 #连接超时时间（毫秒）','2939df012e848f416bdd0ce11f365687','2023-07-10 10:57:31','2024-01-02 17:06:33','nacos','172.23.0.1','','HuiYong-Nacos','','','','yaml','',''),(4,'huiyong-sentinel-config.yaml','DEFAULT_GROUP','spring:\r\n  cloud:\r\n    # 配置Sentinel流控\r\n    sentinel:\r\n      namespace: HuiYong-Sentinel\r\n      enabled: true # 自动化配置是否生效\r\n      eager: true   # 禁用控制台懒加载\r\n      transport:\r\n        dashboard: huiyong-online-sentinel-dashboard-nacos:8080  #配置Sentinel dashboard地址\r\n        client-ip: ${spring.cloud.client.ip-address} # 获取本机IP地址\r\n        port: 8719  #默认8719端口,如果被占用会向上扫描。\r\n      # Nacos 持久化配置规则\r\n      datasource:\r\n        # rule-type类型在com.alibaba.cloud.sentinel.datasource.RuleType 中查找\r\n        # gateway APi 分组\r\n        gw-api-group:\r\n          nacos:\r\n            server-addr: ${spring.cloud.nacos.config.server-addr}\r\n            username: ${spring.cloud.nacos.config.username}\r\n            password: ${spring.cloud.nacos.config.password}\r\n            namespace: ${spring.cloud.sentinel.namespace}\r\n            group-id: DEFAULT_GROUP\r\n            data-id: ${spring.application.name}-gw-api-group-rules\r\n            rule-type: gw-api-group\r\n        # gateway 流控规则\r\n        gw-flow:\r\n          nacos:\r\n            server-addr: ${spring.cloud.nacos.config.server-addr}\r\n            username: ${spring.cloud.nacos.config.username}\r\n            password: ${spring.cloud.nacos.config.password}\r\n            namespace: ${spring.cloud.sentinel.namespace}\r\n            group-id: DEFAULT_GROUP\r\n            data-id: ${spring.application.name}-gw-flow-rules\r\n            rule-type: gw-flow\r\n        # 流控规则\r\n        flow:\r\n          nacos:\r\n            server-addr: ${spring.cloud.nacos.config.server-addr}\r\n            username: ${spring.cloud.nacos.config.username}\r\n            password: ${spring.cloud.nacos.config.password}\r\n            namespace: ${spring.cloud.sentinel.namespace}\r\n            group-id: DEFAULT_GROUP\r\n            data-id: ${spring.application.name}-flow-rules\r\n            rule-type: flow\r\n        # 熔断降级\r\n        degrade:\r\n          nacos:\r\n            server-addr: ${spring.cloud.nacos.config.server-addr}\r\n            username: ${spring.cloud.nacos.config.username}\r\n            password: ${spring.cloud.nacos.config.password}\r\n            namespace: ${spring.cloud.sentinel.namespace}\r\n            group-id: DEFAULT_GROUP\r\n            data-id: ${spring.application.name}-degrade-rules\r\n            rule-type: degrade\r\n        # 热点规则\r\n        param-flow:\r\n          nacos:\r\n            server-addr: ${spring.cloud.nacos.config.server-addr}\r\n            username: ${spring.cloud.nacos.config.username}\r\n            password: ${spring.cloud.nacos.config.password}\r\n            namespace: ${spring.cloud.sentinel.namespace}\r\n            group-id: DEFAULT_GROUP\r\n            data-id: ${spring.application.name}-param-flow-rules\r\n            rule-type: param-flow\r\n        # 系统规则\r\n        system:\r\n          nacos:\r\n            server-addr: ${spring.cloud.nacos.config.server-addr}\r\n            username: ${spring.cloud.nacos.config.username}\r\n            password: ${spring.cloud.nacos.config.password}\r\n            namespace: ${spring.cloud.sentinel.namespace}\r\n            group-id: DEFAULT_GROUP\r\n            data-id: ${spring.application.name}-system-rules\r\n            rule-type: system\r\n        # 授权规则\r\n        authority:\r\n          nacos:\r\n            server-addr: ${spring.cloud.nacos.config.server-addr}\r\n            username: ${spring.cloud.nacos.config.username}\r\n            password: ${spring.cloud.nacos.config.password}\r\n            namespace: ${spring.cloud.sentinel.namespace}\r\n            group-id: DEFAULT_GROUP\r\n            data-id: ${spring.application.name}-authority-rules\r\n            rule-type: authority','a2c282da0008d66a18b46d642827a1ad','2023-07-10 10:57:46','2023-07-10 10:57:46','nacos','183.14.134.155','','HuiYong-Nacos',NULL,NULL,NULL,'yaml',NULL,''),(7,'app-gateway-gw-api-group-rules','DEFAULT_GROUP','[]','d751713988987e9331980363e24189ce','2023-07-10 10:59:17','2023-07-10 10:59:17','nacos','183.14.134.155','','HuiYong-Sentinel',NULL,NULL,NULL,'text',NULL,''),(8,'app-gateway-gw-flow-rules','DEFAULT_GROUP','[]','d751713988987e9331980363e24189ce','2023-07-10 10:59:28','2023-11-10 20:41:27',NULL,'172.18.0.3','','HuiYong-Sentinel',NULL,NULL,NULL,'text',NULL,''),(9,'app-gateway-flow-rules','DEFAULT_GROUP','[]','d751713988987e9331980363e24189ce','2023-07-10 10:59:39','2023-07-10 10:59:39','nacos','183.14.134.155','','HuiYong-Sentinel',NULL,NULL,NULL,'text',NULL,''),(10,'app-gateway-degrade-rules','DEFAULT_GROUP','[]','d751713988987e9331980363e24189ce','2023-07-10 10:59:49','2023-07-10 10:59:49','nacos','183.14.134.155','','HuiYong-Sentinel',NULL,NULL,NULL,'text',NULL,''),(11,'app-gateway-param-flow-rules','DEFAULT_GROUP','[]','d751713988987e9331980363e24189ce','2023-07-10 10:59:58','2023-07-10 10:59:58','nacos','183.14.134.155','','HuiYong-Sentinel',NULL,NULL,NULL,'text',NULL,''),(12,'app-gateway-system-rules','DEFAULT_GROUP','[]','d751713988987e9331980363e24189ce','2023-07-10 11:00:08','2023-07-10 11:00:08','nacos','183.14.134.155','','HuiYong-Sentinel',NULL,NULL,NULL,'text',NULL,''),(13,'app-gateway-authority-rules','DEFAULT_GROUP','[]','d751713988987e9331980363e24189ce','2023-07-10 11:00:17','2023-07-10 11:00:17','nacos','183.14.134.155','','HuiYong-Sentinel',NULL,NULL,NULL,'text',NULL,''),(14,'huiyong-mq-config.yaml','DEFAULT_GROUP','logging:\n  level:\n    io.netty: ERROR\n    # 关闭RocketmqClient info日志，不然每隔几秒就会打印broker信息\n    RocketmqClient: ERROR\n    RocketmqCommon: ERROR\n    RocketmqRemoting: ERROR\n\nrocketmq:\n  name-server: {HY-B公网ip}:9876\n  producer:\n    group: huiyong_producer_group','08a8524fd089936b94d538540788f81e','2023-07-12 13:41:41','2024-01-02 17:05:40','nacos','172.23.0.1','','HuiYong-Nacos','','','','yaml','','');
/*!40000 ALTER TABLE `config_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_info_aggr`
--

DROP TABLE IF EXISTS `config_info_aggr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config_info_aggr` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'datum_id',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_configinfoaggr_datagrouptenantdatum` (`data_id`,`group_id`,`tenant_id`,`datum_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin ROW_FORMAT=DYNAMIC COMMENT='增加租户字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_info_aggr`
--

LOCK TABLES `config_info_aggr` WRITE;
/*!40000 ALTER TABLE `config_info_aggr` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_info_aggr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_info_beta`
--

DROP TABLE IF EXISTS `config_info_beta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config_info_beta` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT '' COMMENT '租户字段',
  `encrypted_data_key` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '秘钥',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_configinfobeta_datagrouptenant` (`data_id`,`group_id`,`tenant_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin ROW_FORMAT=DYNAMIC COMMENT='config_info_beta';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_info_beta`
--

LOCK TABLES `config_info_beta` WRITE;
/*!40000 ALTER TABLE `config_info_beta` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_info_beta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_info_tag`
--

DROP TABLE IF EXISTS `config_info_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config_info_tag` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_configinfotag_datagrouptenanttag` (`data_id`,`group_id`,`tenant_id`,`tag_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin ROW_FORMAT=DYNAMIC COMMENT='config_info_tag';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_info_tag`
--

LOCK TABLES `config_info_tag` WRITE;
/*!40000 ALTER TABLE `config_info_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_info_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_tags_relation`
--

DROP TABLE IF EXISTS `config_tags_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config_tags_relation` (
  `id` bigint NOT NULL COMMENT 'id',
  `tag_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`) USING BTREE,
  UNIQUE KEY `uk_configtagrelation_configidtag` (`id`,`tag_name`,`tag_type`) USING BTREE,
  KEY `idx_tenant_id` (`tenant_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin ROW_FORMAT=DYNAMIC COMMENT='config_tag_relation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_tags_relation`
--

LOCK TABLES `config_tags_relation` WRITE;
/*!40000 ALTER TABLE `config_tags_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_tags_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_capacity`
--

DROP TABLE IF EXISTS `group_capacity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_capacity` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_group_id` (`group_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin ROW_FORMAT=DYNAMIC COMMENT='集群、各Group容量信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_capacity`
--

LOCK TABLES `group_capacity` WRITE;
/*!40000 ALTER TABLE `group_capacity` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_capacity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `his_config_info`
--

DROP TABLE IF EXISTS `his_config_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `his_config_info` (
  `id` bigint unsigned NOT NULL,
  `nid` bigint unsigned NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `md5` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `src_user` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `src_ip` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `op_type` char(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT '' COMMENT '租户字段',
  `encrypted_data_key` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '秘钥',
  PRIMARY KEY (`nid`) USING BTREE,
  KEY `idx_gmt_create` (`gmt_create`) USING BTREE,
  KEY `idx_gmt_modified` (`gmt_modified`) USING BTREE,
  KEY `idx_did` (`data_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin ROW_FORMAT=DYNAMIC COMMENT='多租户改造';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `his_config_info`
--

LOCK TABLES `his_config_info` WRITE;
/*!40000 ALTER TABLE `his_config_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `his_config_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `resource` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  UNIQUE KEY `uk_role_permission` (`role`,`resource`,`action`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES ('nacos_auth_user','HuiYong-Nacos:*:*','rw'),('nacos_auth_user','HuiYong-Sentinel:*:*','rw');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  UNIQUE KEY `idx_user_role` (`username`,`role`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES ('nacos','ROLE_ADMIN'),('nacos_auth_user','nacos_auth_user');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenant_capacity`
--

DROP TABLE IF EXISTS `tenant_capacity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tenant_capacity` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数',
  `max_aggr_size` int unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_tenant_id` (`tenant_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin ROW_FORMAT=DYNAMIC COMMENT='租户容量信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenant_capacity`
--

LOCK TABLES `tenant_capacity` WRITE;
/*!40000 ALTER TABLE `tenant_capacity` DISABLE KEYS */;
/*!40000 ALTER TABLE `tenant_capacity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenant_info`
--

DROP TABLE IF EXISTS `tenant_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tenant_info` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_tenant_info_kptenantid` (`kp`,`tenant_id`) USING BTREE,
  KEY `idx_tenant_id` (`tenant_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin ROW_FORMAT=DYNAMIC COMMENT='tenant_info';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenant_info`
--

LOCK TABLES `tenant_info` WRITE;
/*!40000 ALTER TABLE `tenant_info` DISABLE KEYS */;
INSERT INTO `tenant_info` VALUES (1,'1','HuiYong-Nacos','HuiYong-Nacos','HuiYong-Nacos','nacos',1688957749278,1688957749278),(2,'1','HuiYong-Sentinel','HuiYong-Sentinel','HuiYong-Sentinel','nacos',1688957786362,1688957786362);
/*!40000 ALTER TABLE `tenant_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('nacos','$2a$10$igx3SsBot6/.zt5qvrQy0Ofn4gI3BwCP9tYLqa7fUsmhPGjGUBovS',1),('nacos_auth_user','$2a$10$JA1fA90veO2iKWwSL.G.VuR3IiiTDHPJZy03zQULwVYU/Yp0vU5Yu',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'db_nacos_config'
--

--
-- Dumping routines for database 'db_nacos_config'
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
