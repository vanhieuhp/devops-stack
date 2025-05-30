-- MySQL dump 10.13  Distrib 8.0.42, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: grafana
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `alert`
--

DROP TABLE IF EXISTS `alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alert` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `version` bigint NOT NULL,
  `dashboard_id` bigint NOT NULL,
  `panel_id` bigint NOT NULL,
  `org_id` bigint NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `settings` mediumtext COLLATE utf8mb4_unicode_ci,
  `frequency` bigint NOT NULL,
  `handler` bigint NOT NULL,
  `severity` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `silenced` tinyint(1) NOT NULL,
  `execution_error` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `eval_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `eval_date` datetime DEFAULT NULL,
  `new_state_date` datetime NOT NULL,
  `state_changes` int NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `for` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_alert_org_id_id` (`org_id`,`id`),
  KEY `IDX_alert_state` (`state`),
  KEY `IDX_alert_dashboard_id` (`dashboard_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert`
--

LOCK TABLES `alert` WRITE;
/*!40000 ALTER TABLE `alert` DISABLE KEYS */;
/*!40000 ALTER TABLE `alert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alert_configuration`
--

DROP TABLE IF EXISTS `alert_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alert_configuration` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `alertmanager_configuration` mediumtext COLLATE utf8mb4_unicode_ci,
  `configuration_version` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int NOT NULL,
  `default` tinyint(1) NOT NULL DEFAULT '0',
  `org_id` bigint NOT NULL DEFAULT '0',
  `configuration_hash` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'not-yet-calculated',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_alert_configuration_org_id` (`org_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert_configuration`
--

LOCK TABLES `alert_configuration` WRITE;
/*!40000 ALTER TABLE `alert_configuration` DISABLE KEYS */;
INSERT INTO `alert_configuration` VALUES (1,'{\n	\"alertmanager_config\": {\n		\"route\": {\n			\"receiver\": \"grafana-default-email\",\n			\"group_by\": [\"grafana_folder\", \"alertname\"]\n		},\n		\"receivers\": [{\n			\"name\": \"grafana-default-email\",\n			\"grafana_managed_receiver_configs\": [{\n				\"uid\": \"\",\n				\"name\": \"email receiver\",\n				\"type\": \"email\",\n				\"settings\": {\n					\"addresses\": \"<example@email.com>\"\n				}\n			}]\n		}]\n	}\n}\n','v1',1748580769,1,1,'ed091fbc8c639dd8063190127c806946');
/*!40000 ALTER TABLE `alert_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alert_configuration_history`
--

DROP TABLE IF EXISTS `alert_configuration_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alert_configuration_history` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` bigint NOT NULL DEFAULT '0',
  `alertmanager_configuration` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `configuration_hash` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'not-yet-calculated',
  `configuration_version` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` int NOT NULL,
  `default` tinyint(1) NOT NULL DEFAULT '0',
  `last_applied` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert_configuration_history`
--

LOCK TABLES `alert_configuration_history` WRITE;
/*!40000 ALTER TABLE `alert_configuration_history` DISABLE KEYS */;
INSERT INTO `alert_configuration_history` VALUES (1,1,'{\n	\"alertmanager_config\": {\n		\"route\": {\n			\"receiver\": \"grafana-default-email\",\n			\"group_by\": [\"grafana_folder\", \"alertname\"]\n		},\n		\"receivers\": [{\n			\"name\": \"grafana-default-email\",\n			\"grafana_managed_receiver_configs\": [{\n				\"uid\": \"\",\n				\"name\": \"email receiver\",\n				\"type\": \"email\",\n				\"settings\": {\n					\"addresses\": \"<example@email.com>\"\n				}\n			}]\n		}]\n	}\n}\n','ed091fbc8c639dd8063190127c806946','v1',1748580769,1,1748580769);
/*!40000 ALTER TABLE `alert_configuration_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alert_image`
--

DROP TABLE IF EXISTS `alert_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alert_image` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `expires_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_alert_image_token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert_image`
--

LOCK TABLES `alert_image` WRITE;
/*!40000 ALTER TABLE `alert_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `alert_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alert_instance`
--

DROP TABLE IF EXISTS `alert_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alert_instance` (
  `rule_org_id` bigint NOT NULL,
  `rule_uid` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `labels` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `labels_hash` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `current_state` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `current_state_since` bigint NOT NULL,
  `last_eval_time` bigint NOT NULL,
  `current_state_end` bigint NOT NULL DEFAULT '0',
  `current_reason` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `result_fingerprint` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resolved_at` bigint DEFAULT NULL,
  `last_sent_at` bigint DEFAULT NULL,
  PRIMARY KEY (`rule_org_id`,`rule_uid`,`labels_hash`),
  KEY `IDX_alert_instance_rule_org_id_rule_uid_current_state` (`rule_org_id`,`rule_uid`,`current_state`),
  KEY `IDX_alert_instance_rule_org_id_current_state` (`rule_org_id`,`current_state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert_instance`
--

LOCK TABLES `alert_instance` WRITE;
/*!40000 ALTER TABLE `alert_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `alert_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alert_notification`
--

DROP TABLE IF EXISTS `alert_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alert_notification` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` bigint NOT NULL,
  `name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `frequency` bigint DEFAULT NULL,
  `send_reminder` tinyint(1) DEFAULT '0',
  `disable_resolve_message` tinyint(1) NOT NULL DEFAULT '0',
  `uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secure_settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_alert_notification_org_id_uid` (`org_id`,`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert_notification`
--

LOCK TABLES `alert_notification` WRITE;
/*!40000 ALTER TABLE `alert_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `alert_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alert_notification_state`
--

DROP TABLE IF EXISTS `alert_notification_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alert_notification_state` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` bigint NOT NULL,
  `alert_id` bigint NOT NULL,
  `notifier_id` bigint NOT NULL,
  `state` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` bigint NOT NULL,
  `updated_at` bigint NOT NULL,
  `alert_rule_state_updated_version` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_alert_notification_state_org_id_alert_id_notifier_id` (`org_id`,`alert_id`,`notifier_id`),
  KEY `IDX_alert_notification_state_alert_id` (`alert_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert_notification_state`
--

LOCK TABLES `alert_notification_state` WRITE;
/*!40000 ALTER TABLE `alert_notification_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `alert_notification_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alert_rule`
--

DROP TABLE IF EXISTS `alert_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alert_rule` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` bigint NOT NULL,
  `title` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `condition` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` mediumtext COLLATE utf8mb4_unicode_ci,
  `updated` datetime NOT NULL,
  `interval_seconds` bigint NOT NULL DEFAULT '60',
  `version` int NOT NULL DEFAULT '0',
  `uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `namespace_uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rule_group` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_data_state` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NoData',
  `exec_err_state` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Alerting',
  `for` bigint NOT NULL DEFAULT '0',
  `annotations` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `labels` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `dashboard_uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `panel_id` bigint DEFAULT NULL,
  `rule_group_idx` int NOT NULL DEFAULT '1',
  `is_paused` tinyint(1) NOT NULL DEFAULT '0',
  `notification_settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `record` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `metadata` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `updated_by` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `keep_firing_for` bigint NOT NULL DEFAULT '0',
  `missing_series_evals_to_resolve` smallint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_alert_rule_org_id_uid` (`org_id`,`uid`),
  UNIQUE KEY `UQE_alert_rule_guid` (`guid`),
  KEY `IDX_alert_rule_org_id_namespace_uid_rule_group` (`org_id`,`namespace_uid`,`rule_group`),
  KEY `IDX_alert_rule_org_id_dashboard_uid_panel_id` (`org_id`,`dashboard_uid`,`panel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert_rule`
--

LOCK TABLES `alert_rule` WRITE;
/*!40000 ALTER TABLE `alert_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `alert_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alert_rule_state`
--

DROP TABLE IF EXISTS `alert_rule_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alert_rule_state` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` bigint NOT NULL,
  `rule_uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longblob NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_alert_rule_state_org_id_rule_uid` (`org_id`,`rule_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert_rule_state`
--

LOCK TABLES `alert_rule_state` WRITE;
/*!40000 ALTER TABLE `alert_rule_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `alert_rule_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alert_rule_tag`
--

DROP TABLE IF EXISTS `alert_rule_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alert_rule_tag` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `alert_id` bigint NOT NULL,
  `tag_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_alert_rule_tag_alert_id_tag_id` (`alert_id`,`tag_id`),
  KEY `IDX_alert_rule_tag_alert_id` (`alert_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert_rule_tag`
--

LOCK TABLES `alert_rule_tag` WRITE;
/*!40000 ALTER TABLE `alert_rule_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `alert_rule_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alert_rule_version`
--

DROP TABLE IF EXISTS `alert_rule_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alert_rule_version` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `rule_org_id` bigint NOT NULL,
  `rule_uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `rule_namespace_uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rule_group` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_version` int NOT NULL,
  `restored_from` int NOT NULL,
  `version` int NOT NULL,
  `created` datetime NOT NULL,
  `title` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `condition` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` mediumtext COLLATE utf8mb4_unicode_ci,
  `interval_seconds` bigint NOT NULL,
  `no_data_state` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NoData',
  `exec_err_state` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Alerting',
  `for` bigint NOT NULL DEFAULT '0',
  `annotations` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `labels` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `rule_group_idx` int NOT NULL DEFAULT '1',
  `is_paused` tinyint(1) NOT NULL DEFAULT '0',
  `notification_settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `record` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `metadata` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_by` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rule_guid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `keep_firing_for` bigint NOT NULL DEFAULT '0',
  `missing_series_evals_to_resolve` smallint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_alert_rule_version_rule_org_id_rule_uid_rule_guid_version` (`rule_org_id`,`rule_uid`,`rule_guid`,`version`),
  UNIQUE KEY `UQE_alert_rule_version_rule_guid_version` (`rule_guid`,`version`),
  KEY `IDX_alert_rule_version_rule_org_id_rule_namespace_uid_rule_group` (`rule_org_id`,`rule_namespace_uid`,`rule_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert_rule_version`
--

LOCK TABLES `alert_rule_version` WRITE;
/*!40000 ALTER TABLE `alert_rule_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `alert_rule_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `annotation`
--

DROP TABLE IF EXISTS `annotation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `annotation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` bigint NOT NULL,
  `alert_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `dashboard_id` bigint DEFAULT NULL,
  `panel_id` bigint DEFAULT NULL,
  `category_id` bigint DEFAULT NULL,
  `type` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `metric` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prev_state` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `new_state` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `epoch` bigint NOT NULL,
  `region_id` bigint DEFAULT '0',
  `tags` varchar(4096) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` bigint DEFAULT '0',
  `updated` bigint DEFAULT '0',
  `epoch_end` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IDX_annotation_org_id_alert_id` (`org_id`,`alert_id`),
  KEY `IDX_annotation_org_id_type` (`org_id`,`type`),
  KEY `IDX_annotation_org_id_created` (`org_id`,`created`),
  KEY `IDX_annotation_org_id_updated` (`org_id`,`updated`),
  KEY `IDX_annotation_org_id_dashboard_id_epoch_end_epoch` (`org_id`,`dashboard_id`,`epoch_end`,`epoch`),
  KEY `IDX_annotation_org_id_epoch_end_epoch` (`org_id`,`epoch_end`,`epoch`),
  KEY `IDX_annotation_alert_id` (`alert_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `annotation`
--

LOCK TABLES `annotation` WRITE;
/*!40000 ALTER TABLE `annotation` DISABLE KEYS */;
/*!40000 ALTER TABLE `annotation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `annotation_tag`
--

DROP TABLE IF EXISTS `annotation_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `annotation_tag` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `annotation_id` bigint NOT NULL,
  `tag_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_annotation_tag_annotation_id_tag_id` (`annotation_id`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `annotation_tag`
--

LOCK TABLES `annotation_tag` WRITE;
/*!40000 ALTER TABLE `annotation_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `annotation_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `anon_device`
--

DROP TABLE IF EXISTS `anon_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `anon_device` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `client_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `device_id` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_agent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_anon_device_device_id` (`device_id`),
  KEY `IDX_anon_device_updated_at` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anon_device`
--

LOCK TABLES `anon_device` WRITE;
/*!40000 ALTER TABLE `anon_device` DISABLE KEYS */;
/*!40000 ALTER TABLE `anon_device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_key`
--

DROP TABLE IF EXISTS `api_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_key` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` bigint NOT NULL,
  `name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `expires` bigint DEFAULT NULL,
  `service_account_id` bigint DEFAULT NULL,
  `last_used_at` datetime DEFAULT NULL,
  `is_revoked` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_api_key_key` (`key`),
  UNIQUE KEY `UQE_api_key_org_id_name` (`org_id`,`name`),
  KEY `IDX_api_key_org_id` (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_key`
--

LOCK TABLES `api_key` WRITE;
/*!40000 ALTER TABLE `api_key` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_key` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `builtin_role`
--

DROP TABLE IF EXISTS `builtin_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `builtin_role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` bigint NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `org_id` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_builtin_role_org_id_role_id_role` (`org_id`,`role_id`,`role`),
  KEY `IDX_builtin_role_role_id` (`role_id`),
  KEY `IDX_builtin_role_role` (`role`),
  KEY `IDX_builtin_role_org_id` (`org_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `builtin_role`
--

LOCK TABLES `builtin_role` WRITE;
/*!40000 ALTER TABLE `builtin_role` DISABLE KEYS */;
INSERT INTO `builtin_role` VALUES (1,'Viewer',1,'2025-05-30 04:56:51','2025-05-30 04:56:51',1),(2,'Editor',2,'2025-05-30 04:56:51','2025-05-30 04:56:51',1);
/*!40000 ALTER TABLE `builtin_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_data`
--

DROP TABLE IF EXISTS `cache_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_data` (
  `cache_key` varchar(168) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` blob NOT NULL,
  `expires` int NOT NULL,
  `created_at` int NOT NULL,
  PRIMARY KEY (`cache_key`),
  UNIQUE KEY `UQE_cache_data_cache_key` (`cache_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_data`
--

LOCK TABLES `cache_data` WRITE;
/*!40000 ALTER TABLE `cache_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cloud_migration_resource`
--

DROP TABLE IF EXISTS `cloud_migration_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cloud_migration_resource` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `resource_type` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `resource_uid` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `error_string` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `snapshot_uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `parent_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `error_code` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cloud_migration_resource`
--

LOCK TABLES `cloud_migration_resource` WRITE;
/*!40000 ALTER TABLE `cloud_migration_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `cloud_migration_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cloud_migration_session`
--

DROP TABLE IF EXISTS `cloud_migration_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cloud_migration_session` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auth_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `slug` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stack_id` bigint NOT NULL,
  `region_slug` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cluster_slug` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `org_id` bigint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_cloud_migration_session_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cloud_migration_session`
--

LOCK TABLES `cloud_migration_session` WRITE;
/*!40000 ALTER TABLE `cloud_migration_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `cloud_migration_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cloud_migration_snapshot`
--

DROP TABLE IF EXISTS `cloud_migration_snapshot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cloud_migration_snapshot` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `session_uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `finished` datetime DEFAULT NULL,
  `upload_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `local_directory` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `gms_snapshot_uid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `encryption_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `error_string` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_cloud_migration_snapshot_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cloud_migration_snapshot`
--

LOCK TABLES `cloud_migration_snapshot` WRITE;
/*!40000 ALTER TABLE `cloud_migration_snapshot` DISABLE KEYS */;
/*!40000 ALTER TABLE `cloud_migration_snapshot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `correlation`
--

DROP TABLE IF EXISTS `correlation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `correlation` (
  `uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `org_id` bigint NOT NULL DEFAULT '0',
  `source_uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `config` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `provisioned` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'query',
  PRIMARY KEY (`uid`,`org_id`,`source_uid`),
  KEY `IDX_correlation_uid` (`uid`),
  KEY `IDX_correlation_source_uid` (`source_uid`),
  KEY `IDX_correlation_org_id` (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `correlation`
--

LOCK TABLES `correlation` WRITE;
/*!40000 ALTER TABLE `correlation` DISABLE KEYS */;
/*!40000 ALTER TABLE `correlation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard`
--

DROP TABLE IF EXISTS `dashboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `version` int NOT NULL,
  `slug` varchar(189) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(189) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `org_id` bigint NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `updated_by` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `gnet_id` bigint DEFAULT NULL,
  `plugin_id` varchar(189) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `folder_id` bigint NOT NULL DEFAULT '0',
  `is_folder` tinyint(1) NOT NULL DEFAULT '0',
  `has_acl` tinyint(1) NOT NULL DEFAULT '0',
  `uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` datetime DEFAULT NULL,
  `api_version` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `folder_uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_dashboard_org_id_uid` (`org_id`,`uid`),
  KEY `IDX_dashboard_org_id` (`org_id`),
  KEY `IDX_dashboard_gnet_id` (`gnet_id`),
  KEY `IDX_dashboard_org_id_plugin_id` (`org_id`,`plugin_id`),
  KEY `IDX_dashboard_title` (`title`),
  KEY `IDX_dashboard_is_folder` (`is_folder`),
  KEY `IDX_dashboard_deleted` (`deleted`),
  KEY `IDX_dashboard_org_id_folder_id_title` (`org_id`,`folder_id`,`title`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard`
--

LOCK TABLES `dashboard` WRITE;
/*!40000 ALTER TABLE `dashboard` DISABLE KEYS */;
INSERT INTO `dashboard` VALUES (1,1,'tech-team','Tech Team','{\"schemaVersion\":17,\"title\":\"Tech Team\",\"uid\":\"ceneyjkpqkwlcc\",\"version\":1}',1,'2025-05-30 04:57:26','2025-05-30 04:57:26',1,1,0,'',0,1,0,'ceneyjkpqkwlcc',0,NULL,'',NULL),(2,2,'p-test','P test','{\"annotations\":{\"list\":[{\"builtIn\":1,\"datasource\":{\"type\":\"grafana\",\"uid\":\"-- Grafana --\"},\"enable\":true,\"hide\":true,\"iconColor\":\"rgba(0, 211, 255, 1)\",\"name\":\"Annotations \\u0026 Alerts\",\"type\":\"dashboard\"}]},\"editable\":true,\"fiscalYearStartMonth\":0,\"graphTooltip\":0,\"id\":2,\"links\":[],\"panels\":[{\"datasource\":{\"type\":\"loki\",\"uid\":\"deneyivl7ckxsb\"},\"fieldConfig\":{\"defaults\":{\"color\":{\"mode\":\"palette-classic\"},\"custom\":{\"axisBorderShow\":false,\"axisCenteredZero\":false,\"axisColorMode\":\"text\",\"axisLabel\":\"\",\"axisPlacement\":\"auto\",\"barAlignment\":0,\"barWidthFactor\":0.6,\"drawStyle\":\"line\",\"fillOpacity\":0,\"gradientMode\":\"none\",\"hideFrom\":{\"legend\":false,\"tooltip\":false,\"viz\":false},\"insertNulls\":false,\"lineInterpolation\":\"linear\",\"lineWidth\":1,\"pointSize\":5,\"scaleDistribution\":{\"type\":\"linear\"},\"showPoints\":\"auto\",\"spanNulls\":false,\"stacking\":{\"group\":\"A\",\"mode\":\"none\"},\"thresholdsStyle\":{\"mode\":\"off\"}},\"mappings\":[],\"thresholds\":{\"mode\":\"absolute\",\"steps\":[{\"color\":\"green\"},{\"color\":\"red\",\"value\":80}]}},\"overrides\":[]},\"gridPos\":{\"h\":8,\"w\":12,\"x\":0,\"y\":0},\"id\":2,\"options\":{\"legend\":{\"calcs\":[],\"displayMode\":\"list\",\"placement\":\"bottom\",\"showLegend\":true},\"tooltip\":{\"hideZeros\":false,\"mode\":\"single\",\"sort\":\"none\"}},\"pluginVersion\":\"12.0.1\",\"targets\":[{\"datasource\":{\"type\":\"loki\",\"uid\":\"deneyivl7ckxsb\"},\"direction\":\"backward\",\"editorMode\":\"builder\",\"expr\":\"\",\"queryType\":\"range\",\"refId\":\"A\"}],\"title\":\"New panel\",\"type\":\"timeseries\"},{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"beneyhode3bpca\"},\"fieldConfig\":{\"defaults\":{\"color\":{\"mode\":\"palette-classic\"},\"custom\":{\"axisBorderShow\":false,\"axisCenteredZero\":false,\"axisColorMode\":\"text\",\"axisLabel\":\"\",\"axisPlacement\":\"auto\",\"barAlignment\":0,\"barWidthFactor\":0.6,\"drawStyle\":\"line\",\"fillOpacity\":0,\"gradientMode\":\"none\",\"hideFrom\":{\"legend\":false,\"tooltip\":false,\"viz\":false},\"insertNulls\":false,\"lineInterpolation\":\"linear\",\"lineWidth\":1,\"pointSize\":5,\"scaleDistribution\":{\"type\":\"linear\"},\"showPoints\":\"auto\",\"spanNulls\":false,\"stacking\":{\"group\":\"A\",\"mode\":\"none\"},\"thresholdsStyle\":{\"mode\":\"off\"}},\"mappings\":[],\"thresholds\":{\"mode\":\"absolute\",\"steps\":[{\"color\":\"green\"},{\"color\":\"red\",\"value\":80}]}},\"overrides\":[]},\"gridPos\":{\"h\":8,\"w\":12,\"x\":0,\"y\":0},\"id\":1,\"options\":{\"legend\":{\"calcs\":[],\"displayMode\":\"list\",\"placement\":\"bottom\",\"showLegend\":true},\"tooltip\":{\"hideZeros\":false,\"mode\":\"single\",\"sort\":\"none\"}},\"pluginVersion\":\"12.0.1\",\"targets\":[{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"beneyhode3bpca\"},\"refId\":\"A\"}],\"title\":\"New panel\",\"type\":\"timeseries\"}],\"preload\":false,\"schemaVersion\":41,\"tags\":[],\"templating\":{\"list\":[]},\"time\":{\"from\":\"now-6h\",\"to\":\"now\"},\"timepicker\":{},\"timezone\":\"browser\",\"title\":\"P test\",\"uid\":\"d7b0a5f2-103e-40e8-b6d0-3b073feb38c4\",\"version\":2}',1,'2025-05-30 04:57:48','2025-05-30 04:58:03',1,1,0,'',1,0,0,'d7b0a5f2-103e-40e8-b6d0-3b073feb38c4',0,NULL,'v0alpha1','ceneyjkpqkwlcc'),(3,1,'shoehub','ShoeHub','{\"annotations\":{\"list\":[{\"builtIn\":1,\"datasource\":{\"type\":\"grafana\",\"uid\":\"-- Grafana --\"},\"enable\":true,\"hide\":true,\"iconColor\":\"rgba(0, 211, 255, 1)\",\"name\":\"Annotations \\u0026 Alerts\",\"target\":{\"limit\":100,\"matchAny\":false,\"tags\":[],\"type\":\"dashboard\"},\"type\":\"dashboard\"}]},\"editable\":true,\"fiscalYearStartMonth\":0,\"graphTooltip\":0,\"links\":[],\"panels\":[{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"beneyhode3bpca\"},\"fieldConfig\":{\"defaults\":{\"color\":{\"mode\":\"palette-classic\"},\"custom\":{\"axisBorderShow\":false,\"axisCenteredZero\":false,\"axisColorMode\":\"text\",\"axisLabel\":\"\",\"axisPlacement\":\"auto\",\"barAlignment\":0,\"barWidthFactor\":0.6,\"drawStyle\":\"line\",\"fillOpacity\":0,\"gradientMode\":\"none\",\"hideFrom\":{\"legend\":false,\"tooltip\":false,\"viz\":false},\"insertNulls\":false,\"lineInterpolation\":\"linear\",\"lineWidth\":1,\"pointSize\":5,\"scaleDistribution\":{\"type\":\"linear\"},\"showPoints\":\"auto\",\"spanNulls\":false,\"stacking\":{\"group\":\"A\",\"mode\":\"none\"},\"thresholdsStyle\":{\"mode\":\"off\"}},\"mappings\":[],\"thresholds\":{\"mode\":\"absolute\",\"steps\":[{\"color\":\"green\"},{\"color\":\"red\",\"value\":80}]}},\"overrides\":[]},\"gridPos\":{\"h\":8,\"w\":12,\"x\":0,\"y\":0},\"id\":7,\"options\":{\"legend\":{\"calcs\":[],\"displayMode\":\"list\",\"placement\":\"bottom\",\"showLegend\":true},\"tooltip\":{\"hideZeros\":false,\"mode\":\"single\",\"sort\":\"none\"}},\"pluginVersion\":\"12.0.1\",\"targets\":[{\"disableTextWrap\":false,\"editorMode\":\"builder\",\"expr\":\"shoehub_payments{PaymentMethod=\\\"$paymentMethod\\\"}\",\"fullMetaSearch\":false,\"includeNullMetadata\":true,\"legendFormat\":\"__auto\",\"range\":true,\"refId\":\"A\",\"useBackend\":false}],\"title\":\"Payment Amount by $paymentMethod\",\"type\":\"timeseries\"},{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"beneyhode3bpca\"},\"fieldConfig\":{\"defaults\":{\"color\":{\"mode\":\"palette-classic\"},\"custom\":{\"axisBorderShow\":false,\"axisCenteredZero\":false,\"axisColorMode\":\"text\",\"axisLabel\":\"\",\"axisPlacement\":\"auto\",\"barAlignment\":0,\"barWidthFactor\":0.6,\"drawStyle\":\"line\",\"fillOpacity\":0,\"gradientMode\":\"none\",\"hideFrom\":{\"legend\":false,\"tooltip\":false,\"viz\":false},\"insertNulls\":false,\"lineInterpolation\":\"linear\",\"lineWidth\":1,\"pointSize\":5,\"scaleDistribution\":{\"type\":\"linear\"},\"showPoints\":\"auto\",\"spanNulls\":false,\"stacking\":{\"group\":\"A\",\"mode\":\"none\"},\"thresholdsStyle\":{\"mode\":\"off\"}},\"mappings\":[],\"thresholds\":{\"mode\":\"absolute\",\"steps\":[{\"color\":\"green\"},{\"color\":\"red\",\"value\":80}]}},\"overrides\":[]},\"gridPos\":{\"h\":8,\"w\":12,\"x\":12,\"y\":0},\"id\":1,\"options\":{\"legend\":{\"calcs\":[],\"displayMode\":\"list\",\"placement\":\"bottom\",\"showLegend\":true},\"tooltip\":{\"hideZeros\":false,\"mode\":\"single\",\"sort\":\"none\"}},\"pluginVersion\":\"12.0.1\",\"targets\":[{\"disableTextWrap\":false,\"editorMode\":\"code\",\"expr\":\"rate(shoehub_sales{ShoeType=\\\"Boots\\\"}[1m])\",\"fullMetaSearch\":false,\"includeNullMetadata\":true,\"interval\":\"1m\",\"legendFormat\":\"Boots\",\"range\":true,\"refId\":\"A\",\"useBackend\":false},{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"beneyhode3bpca\"},\"disableTextWrap\":false,\"editorMode\":\"code\",\"expr\":\"rate(shoehub_sales{ShoeType=\\\"HighHeels\\\"}[1m])\",\"fullMetaSearch\":false,\"hide\":false,\"includeNullMetadata\":true,\"instant\":false,\"legendFormat\":\"HighHeels\",\"range\":true,\"refId\":\"B\",\"useBackend\":false},{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"beneyhode3bpca\"},\"editorMode\":\"code\",\"expr\":\"rate(shoehub_sales{ShoeType=\\\"Loafers\\\"}[1m])\",\"hide\":false,\"instant\":false,\"legendFormat\":\"Loafers\",\"range\":true,\"refId\":\"C\"}],\"title\":\"Sale rating\",\"transformations\":[{\"id\":\"calculateField\",\"options\":{\"alias\":\"Total Sales\",\"mode\":\"reduceRow\",\"reduce\":{\"reducer\":\"sum\"}}}],\"type\":\"timeseries\"},{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"beneyhode3bpca\"},\"fieldConfig\":{\"defaults\":{\"color\":{\"mode\":\"palette-classic\"},\"custom\":{\"axisBorderShow\":false,\"axisCenteredZero\":false,\"axisColorMode\":\"text\",\"axisLabel\":\"\",\"axisPlacement\":\"auto\",\"barAlignment\":0,\"barWidthFactor\":0.6,\"drawStyle\":\"line\",\"fillOpacity\":0,\"gradientMode\":\"none\",\"hideFrom\":{\"legend\":false,\"tooltip\":false,\"viz\":false},\"insertNulls\":false,\"lineInterpolation\":\"linear\",\"lineWidth\":1,\"pointSize\":5,\"scaleDistribution\":{\"type\":\"linear\"},\"showPoints\":\"auto\",\"spanNulls\":false,\"stacking\":{\"group\":\"A\",\"mode\":\"none\"},\"thresholdsStyle\":{\"mode\":\"off\"}},\"mappings\":[],\"thresholds\":{\"mode\":\"absolute\",\"steps\":[{\"color\":\"green\"},{\"color\":\"red\",\"value\":80}]}},\"overrides\":[]},\"gridPos\":{\"h\":8,\"w\":12,\"x\":0,\"y\":8},\"id\":3,\"options\":{\"legend\":{\"calcs\":[],\"displayMode\":\"list\",\"placement\":\"bottom\",\"showLegend\":true},\"tooltip\":{\"hideZeros\":false,\"mode\":\"single\",\"sort\":\"none\"}},\"pluginVersion\":\"12.0.1\",\"targets\":[{\"disableTextWrap\":false,\"editorMode\":\"code\",\"expr\":\"rate(shoehub_sales{ShoeType=\\\"Loafers\\\"}[$__rate_interval])\",\"fullMetaSearch\":false,\"includeNullMetadata\":true,\"legendFormat\":\"__auto\",\"range\":true,\"refId\":\"A\",\"useBackend\":false},{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"beneyhode3bpca\"},\"editorMode\":\"code\",\"expr\":\"rate(shoehub_sales{ShoeType=\\\"Loafers\\\"}[$__rate_interval] offset 2m) \",\"hide\":false,\"instant\":false,\"legendFormat\":\"__auto\",\"range\":true,\"refId\":\"B\"}],\"title\":\"Sales Today vs. Sales Last Week\",\"type\":\"timeseries\"},{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"beneyhode3bpca\"},\"fieldConfig\":{\"defaults\":{\"color\":{\"mode\":\"palette-classic\"},\"custom\":{\"hideFrom\":{\"legend\":false,\"tooltip\":false,\"viz\":false}},\"mappings\":[]},\"overrides\":[]},\"gridPos\":{\"h\":8,\"w\":12,\"x\":12,\"y\":8},\"id\":2,\"options\":{\"displayLabels\":[\"name\",\"value\"],\"legend\":{\"displayMode\":\"list\",\"placement\":\"bottom\",\"showLegend\":true},\"pieType\":\"pie\",\"reduceOptions\":{\"calcs\":[\"lastNotNull\"],\"fields\":\"\",\"values\":false},\"tooltip\":{\"hideZeros\":false,\"mode\":\"single\",\"sort\":\"none\"}},\"pluginVersion\":\"12.0.1\",\"targets\":[{\"disableTextWrap\":false,\"editorMode\":\"code\",\"expr\":\"rate(shoehub_payments{CountryCode=\\\"AU\\\", PaymentMethod=\\\"Card\\\"}[$__rate_interval])\",\"fullMetaSearch\":false,\"includeNullMetadata\":true,\"legendFormat\":\"Australia\",\"range\":true,\"refId\":\"A\",\"useBackend\":false},{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"beneyhode3bpca\"},\"editorMode\":\"code\",\"expr\":\"rate(shoehub_payments{CountryCode=\\\"IN\\\", PaymentMethod=\\\"Card\\\"}[$__rate_interval])\",\"hide\":false,\"instant\":false,\"legendFormat\":\"India\",\"range\":true,\"refId\":\"B\"},{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"beneyhode3bpca\"},\"editorMode\":\"code\",\"expr\":\"rate(shoehub_payments{CountryCode=\\\"US\\\", PaymentMethod=\\\"Card\\\"}[$__rate_interval])\",\"hide\":false,\"instant\":false,\"legendFormat\":\"US\",\"range\":true,\"refId\":\"C\"}],\"title\":\"Card payments in Countries\",\"type\":\"piechart\"},{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"beneyhode3bpca\"},\"fieldConfig\":{\"defaults\":{\"color\":{\"mode\":\"palette-classic\"},\"custom\":{\"axisBorderShow\":false,\"axisCenteredZero\":false,\"axisColorMode\":\"text\",\"axisLabel\":\"\",\"axisPlacement\":\"auto\",\"barAlignment\":0,\"barWidthFactor\":0.6,\"drawStyle\":\"line\",\"fillOpacity\":0,\"gradientMode\":\"none\",\"hideFrom\":{\"legend\":false,\"tooltip\":false,\"viz\":false},\"insertNulls\":false,\"lineInterpolation\":\"smooth\",\"lineWidth\":1,\"pointSize\":5,\"scaleDistribution\":{\"type\":\"linear\"},\"showPoints\":\"auto\",\"spanNulls\":false,\"stacking\":{\"group\":\"A\",\"mode\":\"none\"},\"thresholdsStyle\":{\"mode\":\"off\"}},\"mappings\":[],\"thresholds\":{\"mode\":\"absolute\",\"steps\":[{\"color\":\"green\"},{\"color\":\"red\",\"value\":80}]}},\"overrides\":[]},\"gridPos\":{\"h\":10,\"w\":24,\"x\":0,\"y\":16},\"id\":6,\"maxPerRow\":3,\"options\":{\"legend\":{\"calcs\":[],\"displayMode\":\"list\",\"placement\":\"bottom\",\"showLegend\":true},\"tooltip\":{\"hideZeros\":false,\"mode\":\"single\",\"sort\":\"none\"}},\"pluginVersion\":\"12.0.1\",\"repeat\":\"paymentMethod\",\"repeatDirection\":\"h\",\"targets\":[{\"disableTextWrap\":false,\"editorMode\":\"code\",\"expr\":\"shoehub_payments{PaymentMethod=\\\"$paymentMethod\\\"}\",\"fullMetaSearch\":false,\"includeNullMetadata\":true,\"legendFormat\":\"$paymentMethod amount\",\"range\":true,\"refId\":\"A\",\"useBackend\":false}],\"title\":\"Sales Amount for $paymentMethod\",\"type\":\"timeseries\"},{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"beneyhode3bpca\"},\"fieldConfig\":{\"defaults\":{\"color\":{\"mode\":\"palette-classic\"},\"custom\":{\"axisBorderShow\":false,\"axisCenteredZero\":false,\"axisColorMode\":\"text\",\"axisLabel\":\"\",\"axisPlacement\":\"auto\",\"barAlignment\":0,\"barWidthFactor\":0.6,\"drawStyle\":\"line\",\"fillOpacity\":0,\"gradientMode\":\"none\",\"hideFrom\":{\"legend\":false,\"tooltip\":false,\"viz\":false},\"insertNulls\":false,\"lineInterpolation\":\"smooth\",\"lineWidth\":1,\"pointSize\":5,\"scaleDistribution\":{\"type\":\"linear\"},\"showPoints\":\"auto\",\"spanNulls\":false,\"stacking\":{\"group\":\"A\",\"mode\":\"none\"},\"thresholdsStyle\":{\"mode\":\"line+area\"}},\"mappings\":[],\"thresholds\":{\"mode\":\"percentage\",\"steps\":[{\"color\":\"green\"},{\"color\":\"dark-red\",\"value\":5}]}},\"overrides\":[]},\"gridPos\":{\"h\":8,\"w\":24,\"x\":0,\"y\":26},\"id\":4,\"maxPerRow\":3,\"options\":{\"legend\":{\"calcs\":[],\"displayMode\":\"list\",\"placement\":\"bottom\",\"showLegend\":true},\"tooltip\":{\"hideZeros\":false,\"mode\":\"single\",\"sort\":\"none\"}},\"pluginVersion\":\"12.0.1\",\"repeat\":\"country\",\"repeatDirection\":\"h\",\"targets\":[{\"editorMode\":\"code\",\"expr\":\"sum(shoehub_payments{CountryCode=\\\"$country\\\", PaymentMethod=\\\"Card\\\"}) / sum(shoehub_payments{CountryCode=\\\"$country\\\"}) * 100\",\"legendFormat\":\"Card\",\"range\":true,\"refId\":\"A\"},{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"beneyhode3bpca\"},\"editorMode\":\"code\",\"expr\":\"sum(shoehub_payments{CountryCode=\\\"$country\\\", PaymentMethod=\\\"Paypal\\\"}) / sum(shoehub_payments{CountryCode=\\\"$country\\\"}) * 100\",\"hide\":false,\"instant\":false,\"legendFormat\":\"Paypal\",\"range\":true,\"refId\":\"B\"},{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"beneyhode3bpca\"},\"editorMode\":\"code\",\"expr\":\"sum(shoehub_payments{CountryCode=\\\"$country\\\", PaymentMethod=\\\"Cash\\\"}) / sum(shoehub_payments{CountryCode=\\\"$country\\\"}) * 100\",\"hide\":false,\"instant\":false,\"legendFormat\":\"Cash\",\"range\":true,\"refId\":\"C\"}],\"title\":\"Percentage of Payment Methods in the $country\",\"type\":\"timeseries\"}],\"preload\":false,\"refresh\":\"auto\",\"schemaVersion\":41,\"tags\":[],\"templating\":{\"list\":[{\"current\":{\"text\":[\"AU\"],\"value\":[\"AU\"]},\"definition\":\"label_values(shoehub_payments{PaymentMethod=\\\"Card\\\"}, CountryCode)\",\"includeAll\":true,\"label\":\"Country\",\"multi\":true,\"name\":\"country\",\"options\":[],\"query\":{\"qryType\":5,\"query\":\"label_values(shoehub_payments{PaymentMethod=\\\"Card\\\"}, CountryCode)\",\"refId\":\"PrometheusVariableQueryEditor-VariableQuery\"},\"refresh\":1,\"regex\":\"\",\"sort\":1,\"type\":\"query\"},{\"current\":{\"text\":[\"Card\"],\"value\":[\"Card\"]},\"definition\":\"label_values(shoehub_payments, PaymentMethod)\",\"description\":\"\",\"includeAll\":true,\"label\":\"Payment Method\",\"multi\":true,\"name\":\"paymentMethod\",\"options\":[],\"query\":{\"qryType\":5,\"query\":\"label_values(shoehub_payments, PaymentMethod)\",\"refId\":\"PrometheusVariableQueryEditor-VariableQuery\"},\"refresh\":1,\"regex\":\"\",\"type\":\"query\"}]},\"time\":{\"from\":\"2025-05-30T00:05:17.249Z\",\"to\":\"2025-05-30T00:11:09.181Z\"},\"timepicker\":{},\"timezone\":\"browser\",\"title\":\"ShoeHub\",\"uid\":\"55af68be-8b36-4fda-932d-09b304b05121\",\"version\":1}',1,'2025-05-30 04:59:13','2025-05-30 04:59:13',1,1,0,'',0,0,0,'55af68be-8b36-4fda-932d-09b304b05121',0,NULL,'v0alpha1',NULL),(4,1,'loki-logging','Loki Logging','{\"annotations\":{\"list\":[{\"builtIn\":1,\"datasource\":{\"type\":\"grafana\",\"uid\":\"-- Grafana --\"},\"enable\":true,\"hide\":true,\"iconColor\":\"rgba(0, 211, 255, 1)\",\"name\":\"Annotations \\u0026 Alerts\",\"type\":\"dashboard\"}]},\"editable\":true,\"fiscalYearStartMonth\":0,\"graphTooltip\":0,\"links\":[],\"panels\":[{\"datasource\":{\"type\":\"loki\",\"uid\":\"deneyivl7ckxsb\"},\"fieldConfig\":{\"defaults\":{\"color\":{\"mode\":\"palette-classic\"},\"custom\":{\"axisBorderShow\":false,\"axisCenteredZero\":false,\"axisColorMode\":\"text\",\"axisLabel\":\"\",\"axisPlacement\":\"auto\",\"barAlignment\":0,\"barWidthFactor\":0.6,\"drawStyle\":\"line\",\"fillOpacity\":0,\"gradientMode\":\"none\",\"hideFrom\":{\"legend\":false,\"tooltip\":false,\"viz\":false},\"insertNulls\":false,\"lineInterpolation\":\"linear\",\"lineWidth\":1,\"pointSize\":5,\"scaleDistribution\":{\"type\":\"linear\"},\"showPoints\":\"auto\",\"spanNulls\":false,\"stacking\":{\"group\":\"A\",\"mode\":\"none\"},\"thresholdsStyle\":{\"mode\":\"off\"}},\"mappings\":[],\"thresholds\":{\"mode\":\"absolute\",\"steps\":[{\"color\":\"green\"},{\"color\":\"red\",\"value\":80}]}},\"overrides\":[{\"matcher\":{\"id\":\"byName\",\"options\":\"{component=\\\"backend\\\", detected_level=\\\"ERROR\\\", env=\\\"dev\\\", filename=\\\"/var/log/loki-monitoring.log\\\", job=\\\"varlogs\\\", level=\\\"ERROR\\\", service_name=\\\"backend\\\", team=\\\"Devops\\\"}\"},\"properties\":[{\"id\":\"color\",\"value\":{\"fixedColor\":\"red\",\"mode\":\"fixed\"}}]},{\"matcher\":{\"id\":\"byName\",\"options\":\"INFO\"},\"properties\":[{\"id\":\"color\",\"value\":{\"fixedColor\":\"green\",\"mode\":\"fixed\"}}]},{\"matcher\":{\"id\":\"byName\",\"options\":\"ERROR\"},\"properties\":[{\"id\":\"color\",\"value\":{\"fixedColor\":\"red\",\"mode\":\"fixed\"}}]}]},\"gridPos\":{\"h\":8,\"w\":12,\"x\":0,\"y\":0},\"id\":2,\"options\":{\"legend\":{\"calcs\":[],\"displayMode\":\"list\",\"placement\":\"bottom\",\"showLegend\":true},\"tooltip\":{\"hideZeros\":false,\"mode\":\"single\",\"sort\":\"none\"}},\"pluginVersion\":\"12.0.1\",\"targets\":[{\"datasource\":{\"type\":\"loki\",\"uid\":\"deneyivl7ckxsb\"},\"direction\":\"backward\",\"editorMode\":\"code\",\"expr\":\"rate({component=\\\"backend\\\", level=\\\"ERROR\\\"} [$__auto])\",\"legendFormat\":\"ERROR\",\"queryType\":\"range\",\"refId\":\"A\"},{\"datasource\":{\"type\":\"loki\",\"uid\":\"deneyivl7ckxsb\"},\"direction\":\"backward\",\"editorMode\":\"code\",\"expr\":\"rate({component=\\\"backend\\\", level=\\\"INFO\\\"} [$__auto])\",\"hide\":false,\"legendFormat\":\"INFO\",\"queryType\":\"range\",\"refId\":\"B\"}],\"title\":\"Backend Application\",\"type\":\"timeseries\"},{\"datasource\":{\"type\":\"loki\",\"uid\":\"deneyivl7ckxsb\"},\"fieldConfig\":{\"defaults\":{\"color\":{\"mode\":\"palette-classic\"},\"custom\":{\"hideFrom\":{\"legend\":false,\"tooltip\":false,\"viz\":false}},\"mappings\":[]},\"overrides\":[{\"matcher\":{\"id\":\"byName\",\"options\":\"error\"},\"properties\":[{\"id\":\"color\",\"value\":{\"fixedColor\":\"red\",\"mode\":\"fixed\"}}]},{\"matcher\":{\"id\":\"byName\",\"options\":\"info\"},\"properties\":[{\"id\":\"color\",\"value\":{\"fixedColor\":\"green\",\"mode\":\"fixed\"}}]}]},\"gridPos\":{\"h\":8,\"w\":12,\"x\":12,\"y\":0},\"id\":1,\"options\":{\"displayLabels\":[\"percent\"],\"legend\":{\"displayMode\":\"list\",\"placement\":\"bottom\",\"showLegend\":true},\"pieType\":\"pie\",\"reduceOptions\":{\"calcs\":[\"lastNotNull\"],\"fields\":\"\",\"values\":false},\"tooltip\":{\"hideZeros\":false,\"mode\":\"single\",\"sort\":\"none\"}},\"pluginVersion\":\"12.0.1\",\"targets\":[{\"datasource\":{\"type\":\"loki\",\"uid\":\"deneyivl7ckxsb\"},\"direction\":\"backward\",\"editorMode\":\"code\",\"expr\":\"rate({component=\\\"backend\\\", level=\\\"ERROR\\\"} [$__auto])\",\"legendFormat\":\"error\",\"queryType\":\"range\",\"refId\":\"A\"},{\"datasource\":{\"type\":\"loki\",\"uid\":\"deneyivl7ckxsb\"},\"direction\":\"backward\",\"editorMode\":\"code\",\"expr\":\"rate({component=\\\"backend\\\", level=\\\"ERROR\\\"} [$__auto])\",\"hide\":false,\"legendFormat\":\"info\",\"queryType\":\"range\",\"refId\":\"B\"}],\"title\":\"Error Backend Percentage\",\"type\":\"piechart\"}],\"preload\":false,\"schemaVersion\":41,\"tags\":[],\"templating\":{\"list\":[]},\"time\":{\"from\":\"now-6h\",\"to\":\"now\"},\"timepicker\":{},\"timezone\":\"browser\",\"title\":\"Loki Logging\",\"uid\":\"49785456-5a88-40dc-99f2-45f909e23f93\",\"version\":1}',1,'2025-05-30 04:59:26','2025-05-30 04:59:26',1,1,0,'',0,0,0,'49785456-5a88-40dc-99f2-45f909e23f93',0,NULL,'v0alpha1',NULL);
/*!40000 ALTER TABLE `dashboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_acl`
--

DROP TABLE IF EXISTS `dashboard_acl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_acl` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` bigint NOT NULL,
  `dashboard_id` bigint NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `team_id` bigint DEFAULT NULL,
  `permission` smallint NOT NULL DEFAULT '4',
  `role` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_dashboard_acl_dashboard_id_user_id` (`dashboard_id`,`user_id`),
  UNIQUE KEY `UQE_dashboard_acl_dashboard_id_team_id` (`dashboard_id`,`team_id`),
  KEY `IDX_dashboard_acl_dashboard_id` (`dashboard_id`),
  KEY `IDX_dashboard_acl_user_id` (`user_id`),
  KEY `IDX_dashboard_acl_team_id` (`team_id`),
  KEY `IDX_dashboard_acl_org_id_role` (`org_id`,`role`),
  KEY `IDX_dashboard_acl_permission` (`permission`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_acl`
--

LOCK TABLES `dashboard_acl` WRITE;
/*!40000 ALTER TABLE `dashboard_acl` DISABLE KEYS */;
INSERT INTO `dashboard_acl` VALUES (1,-1,-1,NULL,NULL,1,'Viewer','2017-06-20 00:00:00','2017-06-20 00:00:00'),(2,-1,-1,NULL,NULL,2,'Editor','2017-06-20 00:00:00','2017-06-20 00:00:00');
/*!40000 ALTER TABLE `dashboard_acl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_provisioning`
--

DROP TABLE IF EXISTS `dashboard_provisioning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_provisioning` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `dashboard_id` bigint DEFAULT NULL,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `external_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated` int NOT NULL DEFAULT '0',
  `check_sum` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_dashboard_provisioning_dashboard_id` (`dashboard_id`),
  KEY `IDX_dashboard_provisioning_dashboard_id_name` (`dashboard_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_provisioning`
--

LOCK TABLES `dashboard_provisioning` WRITE;
/*!40000 ALTER TABLE `dashboard_provisioning` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_provisioning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_public`
--

DROP TABLE IF EXISTS `dashboard_public`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_public` (
  `uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dashboard_uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `org_id` bigint NOT NULL,
  `time_settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `template_variables` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `access_token` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `annotations_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `time_selection_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `share` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'public',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `UQE_dashboard_public_config_uid` (`uid`),
  UNIQUE KEY `UQE_dashboard_public_config_access_token` (`access_token`),
  KEY `IDX_dashboard_public_config_org_id_dashboard_uid` (`org_id`,`dashboard_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_public`
--

LOCK TABLES `dashboard_public` WRITE;
/*!40000 ALTER TABLE `dashboard_public` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_public` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_snapshot`
--

DROP TABLE IF EXISTS `dashboard_snapshot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_snapshot` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `delete_key` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `org_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `external` tinyint(1) NOT NULL,
  `external_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dashboard` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires` datetime NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `external_delete_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dashboard_encrypted` mediumblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_dashboard_snapshot_key` (`key`),
  UNIQUE KEY `UQE_dashboard_snapshot_delete_key` (`delete_key`),
  KEY `IDX_dashboard_snapshot_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_snapshot`
--

LOCK TABLES `dashboard_snapshot` WRITE;
/*!40000 ALTER TABLE `dashboard_snapshot` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_snapshot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_tag`
--

DROP TABLE IF EXISTS `dashboard_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_tag` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `dashboard_id` bigint NOT NULL,
  `term` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dashboard_uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `org_id` bigint DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `IDX_dashboard_tag_dashboard_id` (`dashboard_id`),
  KEY `IDX_dashboard_tag_dashboard_uid` (`dashboard_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_tag`
--

LOCK TABLES `dashboard_tag` WRITE;
/*!40000 ALTER TABLE `dashboard_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_version`
--

DROP TABLE IF EXISTS `dashboard_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_version` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `dashboard_id` bigint NOT NULL,
  `parent_version` int NOT NULL,
  `restored_from` int NOT NULL,
  `version` int NOT NULL,
  `created` datetime NOT NULL,
  `created_by` bigint NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` mediumtext COLLATE utf8mb4_unicode_ci,
  `api_version` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_dashboard_version_dashboard_id_version` (`dashboard_id`,`version`),
  KEY `IDX_dashboard_version_dashboard_id` (`dashboard_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_version`
--

LOCK TABLES `dashboard_version` WRITE;
/*!40000 ALTER TABLE `dashboard_version` DISABLE KEYS */;
INSERT INTO `dashboard_version` VALUES (1,1,0,0,1,'2025-05-30 04:57:26',1,'','{\"schemaVersion\":17,\"title\":\"Tech Team\",\"uid\":\"ceneyjkpqkwlcc\",\"version\":1}',''),(2,2,0,0,1,'2025-05-30 04:57:48',1,'','{\"annotations\":{\"list\":[{\"builtIn\":1,\"datasource\":{\"type\":\"grafana\",\"uid\":\"-- Grafana --\"},\"enable\":true,\"hide\":true,\"iconColor\":\"rgba(0, 211, 255, 1)\",\"name\":\"Annotations \\u0026 Alerts\",\"type\":\"dashboard\"}]},\"editable\":true,\"fiscalYearStartMonth\":0,\"graphTooltip\":0,\"links\":[],\"panels\":[{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"beneyhode3bpca\"},\"fieldConfig\":{\"defaults\":{\"color\":{\"mode\":\"palette-classic\"},\"custom\":{\"axisBorderShow\":false,\"axisCenteredZero\":false,\"axisColorMode\":\"text\",\"axisLabel\":\"\",\"axisPlacement\":\"auto\",\"barAlignment\":0,\"barWidthFactor\":0.6,\"drawStyle\":\"line\",\"fillOpacity\":0,\"gradientMode\":\"none\",\"hideFrom\":{\"legend\":false,\"tooltip\":false,\"viz\":false},\"insertNulls\":false,\"lineInterpolation\":\"linear\",\"lineWidth\":1,\"pointSize\":5,\"scaleDistribution\":{\"type\":\"linear\"},\"showPoints\":\"auto\",\"spanNulls\":false,\"stacking\":{\"group\":\"A\",\"mode\":\"none\"},\"thresholdsStyle\":{\"mode\":\"off\"}},\"mappings\":[],\"thresholds\":{\"mode\":\"absolute\",\"steps\":[{\"color\":\"green\"},{\"color\":\"red\",\"value\":80}]}},\"overrides\":[]},\"gridPos\":{\"h\":8,\"w\":12,\"x\":0,\"y\":0},\"id\":1,\"options\":{\"legend\":{\"calcs\":[],\"displayMode\":\"list\",\"placement\":\"bottom\",\"showLegend\":true},\"tooltip\":{\"hideZeros\":false,\"mode\":\"single\",\"sort\":\"none\"}},\"pluginVersion\":\"12.0.1\",\"targets\":[{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"beneyhode3bpca\"},\"refId\":\"A\"}],\"title\":\"New panel\",\"type\":\"timeseries\"}],\"preload\":false,\"schemaVersion\":41,\"tags\":[],\"templating\":{\"list\":[]},\"time\":{\"from\":\"now-6h\",\"to\":\"now\"},\"timepicker\":{},\"timezone\":\"browser\",\"title\":\"P test\",\"uid\":\"d7b0a5f2-103e-40e8-b6d0-3b073feb38c4\",\"version\":1}','v0alpha1'),(3,2,1,0,2,'2025-05-30 04:58:03',1,'L test','{\"annotations\":{\"list\":[{\"builtIn\":1,\"datasource\":{\"type\":\"grafana\",\"uid\":\"-- Grafana --\"},\"enable\":true,\"hide\":true,\"iconColor\":\"rgba(0, 211, 255, 1)\",\"name\":\"Annotations \\u0026 Alerts\",\"type\":\"dashboard\"}]},\"editable\":true,\"fiscalYearStartMonth\":0,\"graphTooltip\":0,\"id\":2,\"links\":[],\"panels\":[{\"datasource\":{\"type\":\"loki\",\"uid\":\"deneyivl7ckxsb\"},\"fieldConfig\":{\"defaults\":{\"color\":{\"mode\":\"palette-classic\"},\"custom\":{\"axisBorderShow\":false,\"axisCenteredZero\":false,\"axisColorMode\":\"text\",\"axisLabel\":\"\",\"axisPlacement\":\"auto\",\"barAlignment\":0,\"barWidthFactor\":0.6,\"drawStyle\":\"line\",\"fillOpacity\":0,\"gradientMode\":\"none\",\"hideFrom\":{\"legend\":false,\"tooltip\":false,\"viz\":false},\"insertNulls\":false,\"lineInterpolation\":\"linear\",\"lineWidth\":1,\"pointSize\":5,\"scaleDistribution\":{\"type\":\"linear\"},\"showPoints\":\"auto\",\"spanNulls\":false,\"stacking\":{\"group\":\"A\",\"mode\":\"none\"},\"thresholdsStyle\":{\"mode\":\"off\"}},\"mappings\":[],\"thresholds\":{\"mode\":\"absolute\",\"steps\":[{\"color\":\"green\"},{\"color\":\"red\",\"value\":80}]}},\"overrides\":[]},\"gridPos\":{\"h\":8,\"w\":12,\"x\":0,\"y\":0},\"id\":2,\"options\":{\"legend\":{\"calcs\":[],\"displayMode\":\"list\",\"placement\":\"bottom\",\"showLegend\":true},\"tooltip\":{\"hideZeros\":false,\"mode\":\"single\",\"sort\":\"none\"}},\"pluginVersion\":\"12.0.1\",\"targets\":[{\"datasource\":{\"type\":\"loki\",\"uid\":\"deneyivl7ckxsb\"},\"direction\":\"backward\",\"editorMode\":\"builder\",\"expr\":\"\",\"queryType\":\"range\",\"refId\":\"A\"}],\"title\":\"New panel\",\"type\":\"timeseries\"},{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"beneyhode3bpca\"},\"fieldConfig\":{\"defaults\":{\"color\":{\"mode\":\"palette-classic\"},\"custom\":{\"axisBorderShow\":false,\"axisCenteredZero\":false,\"axisColorMode\":\"text\",\"axisLabel\":\"\",\"axisPlacement\":\"auto\",\"barAlignment\":0,\"barWidthFactor\":0.6,\"drawStyle\":\"line\",\"fillOpacity\":0,\"gradientMode\":\"none\",\"hideFrom\":{\"legend\":false,\"tooltip\":false,\"viz\":false},\"insertNulls\":false,\"lineInterpolation\":\"linear\",\"lineWidth\":1,\"pointSize\":5,\"scaleDistribution\":{\"type\":\"linear\"},\"showPoints\":\"auto\",\"spanNulls\":false,\"stacking\":{\"group\":\"A\",\"mode\":\"none\"},\"thresholdsStyle\":{\"mode\":\"off\"}},\"mappings\":[],\"thresholds\":{\"mode\":\"absolute\",\"steps\":[{\"color\":\"green\"},{\"color\":\"red\",\"value\":80}]}},\"overrides\":[]},\"gridPos\":{\"h\":8,\"w\":12,\"x\":0,\"y\":0},\"id\":1,\"options\":{\"legend\":{\"calcs\":[],\"displayMode\":\"list\",\"placement\":\"bottom\",\"showLegend\":true},\"tooltip\":{\"hideZeros\":false,\"mode\":\"single\",\"sort\":\"none\"}},\"pluginVersion\":\"12.0.1\",\"targets\":[{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"beneyhode3bpca\"},\"refId\":\"A\"}],\"title\":\"New panel\",\"type\":\"timeseries\"}],\"preload\":false,\"schemaVersion\":41,\"tags\":[],\"templating\":{\"list\":[]},\"time\":{\"from\":\"now-6h\",\"to\":\"now\"},\"timepicker\":{},\"timezone\":\"browser\",\"title\":\"P test\",\"uid\":\"d7b0a5f2-103e-40e8-b6d0-3b073feb38c4\",\"version\":2}','v0alpha1'),(4,3,0,0,1,'2025-05-30 04:59:13',1,'','{\"annotations\":{\"list\":[{\"builtIn\":1,\"datasource\":{\"type\":\"grafana\",\"uid\":\"-- Grafana --\"},\"enable\":true,\"hide\":true,\"iconColor\":\"rgba(0, 211, 255, 1)\",\"name\":\"Annotations \\u0026 Alerts\",\"target\":{\"limit\":100,\"matchAny\":false,\"tags\":[],\"type\":\"dashboard\"},\"type\":\"dashboard\"}]},\"editable\":true,\"fiscalYearStartMonth\":0,\"graphTooltip\":0,\"links\":[],\"panels\":[{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"beneyhode3bpca\"},\"fieldConfig\":{\"defaults\":{\"color\":{\"mode\":\"palette-classic\"},\"custom\":{\"axisBorderShow\":false,\"axisCenteredZero\":false,\"axisColorMode\":\"text\",\"axisLabel\":\"\",\"axisPlacement\":\"auto\",\"barAlignment\":0,\"barWidthFactor\":0.6,\"drawStyle\":\"line\",\"fillOpacity\":0,\"gradientMode\":\"none\",\"hideFrom\":{\"legend\":false,\"tooltip\":false,\"viz\":false},\"insertNulls\":false,\"lineInterpolation\":\"linear\",\"lineWidth\":1,\"pointSize\":5,\"scaleDistribution\":{\"type\":\"linear\"},\"showPoints\":\"auto\",\"spanNulls\":false,\"stacking\":{\"group\":\"A\",\"mode\":\"none\"},\"thresholdsStyle\":{\"mode\":\"off\"}},\"mappings\":[],\"thresholds\":{\"mode\":\"absolute\",\"steps\":[{\"color\":\"green\"},{\"color\":\"red\",\"value\":80}]}},\"overrides\":[]},\"gridPos\":{\"h\":8,\"w\":12,\"x\":0,\"y\":0},\"id\":7,\"options\":{\"legend\":{\"calcs\":[],\"displayMode\":\"list\",\"placement\":\"bottom\",\"showLegend\":true},\"tooltip\":{\"hideZeros\":false,\"mode\":\"single\",\"sort\":\"none\"}},\"pluginVersion\":\"12.0.1\",\"targets\":[{\"disableTextWrap\":false,\"editorMode\":\"builder\",\"expr\":\"shoehub_payments{PaymentMethod=\\\"$paymentMethod\\\"}\",\"fullMetaSearch\":false,\"includeNullMetadata\":true,\"legendFormat\":\"__auto\",\"range\":true,\"refId\":\"A\",\"useBackend\":false}],\"title\":\"Payment Amount by $paymentMethod\",\"type\":\"timeseries\"},{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"beneyhode3bpca\"},\"fieldConfig\":{\"defaults\":{\"color\":{\"mode\":\"palette-classic\"},\"custom\":{\"axisBorderShow\":false,\"axisCenteredZero\":false,\"axisColorMode\":\"text\",\"axisLabel\":\"\",\"axisPlacement\":\"auto\",\"barAlignment\":0,\"barWidthFactor\":0.6,\"drawStyle\":\"line\",\"fillOpacity\":0,\"gradientMode\":\"none\",\"hideFrom\":{\"legend\":false,\"tooltip\":false,\"viz\":false},\"insertNulls\":false,\"lineInterpolation\":\"linear\",\"lineWidth\":1,\"pointSize\":5,\"scaleDistribution\":{\"type\":\"linear\"},\"showPoints\":\"auto\",\"spanNulls\":false,\"stacking\":{\"group\":\"A\",\"mode\":\"none\"},\"thresholdsStyle\":{\"mode\":\"off\"}},\"mappings\":[],\"thresholds\":{\"mode\":\"absolute\",\"steps\":[{\"color\":\"green\"},{\"color\":\"red\",\"value\":80}]}},\"overrides\":[]},\"gridPos\":{\"h\":8,\"w\":12,\"x\":12,\"y\":0},\"id\":1,\"options\":{\"legend\":{\"calcs\":[],\"displayMode\":\"list\",\"placement\":\"bottom\",\"showLegend\":true},\"tooltip\":{\"hideZeros\":false,\"mode\":\"single\",\"sort\":\"none\"}},\"pluginVersion\":\"12.0.1\",\"targets\":[{\"disableTextWrap\":false,\"editorMode\":\"code\",\"expr\":\"rate(shoehub_sales{ShoeType=\\\"Boots\\\"}[1m])\",\"fullMetaSearch\":false,\"includeNullMetadata\":true,\"interval\":\"1m\",\"legendFormat\":\"Boots\",\"range\":true,\"refId\":\"A\",\"useBackend\":false},{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"beneyhode3bpca\"},\"disableTextWrap\":false,\"editorMode\":\"code\",\"expr\":\"rate(shoehub_sales{ShoeType=\\\"HighHeels\\\"}[1m])\",\"fullMetaSearch\":false,\"hide\":false,\"includeNullMetadata\":true,\"instant\":false,\"legendFormat\":\"HighHeels\",\"range\":true,\"refId\":\"B\",\"useBackend\":false},{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"beneyhode3bpca\"},\"editorMode\":\"code\",\"expr\":\"rate(shoehub_sales{ShoeType=\\\"Loafers\\\"}[1m])\",\"hide\":false,\"instant\":false,\"legendFormat\":\"Loafers\",\"range\":true,\"refId\":\"C\"}],\"title\":\"Sale rating\",\"transformations\":[{\"id\":\"calculateField\",\"options\":{\"alias\":\"Total Sales\",\"mode\":\"reduceRow\",\"reduce\":{\"reducer\":\"sum\"}}}],\"type\":\"timeseries\"},{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"beneyhode3bpca\"},\"fieldConfig\":{\"defaults\":{\"color\":{\"mode\":\"palette-classic\"},\"custom\":{\"axisBorderShow\":false,\"axisCenteredZero\":false,\"axisColorMode\":\"text\",\"axisLabel\":\"\",\"axisPlacement\":\"auto\",\"barAlignment\":0,\"barWidthFactor\":0.6,\"drawStyle\":\"line\",\"fillOpacity\":0,\"gradientMode\":\"none\",\"hideFrom\":{\"legend\":false,\"tooltip\":false,\"viz\":false},\"insertNulls\":false,\"lineInterpolation\":\"linear\",\"lineWidth\":1,\"pointSize\":5,\"scaleDistribution\":{\"type\":\"linear\"},\"showPoints\":\"auto\",\"spanNulls\":false,\"stacking\":{\"group\":\"A\",\"mode\":\"none\"},\"thresholdsStyle\":{\"mode\":\"off\"}},\"mappings\":[],\"thresholds\":{\"mode\":\"absolute\",\"steps\":[{\"color\":\"green\"},{\"color\":\"red\",\"value\":80}]}},\"overrides\":[]},\"gridPos\":{\"h\":8,\"w\":12,\"x\":0,\"y\":8},\"id\":3,\"options\":{\"legend\":{\"calcs\":[],\"displayMode\":\"list\",\"placement\":\"bottom\",\"showLegend\":true},\"tooltip\":{\"hideZeros\":false,\"mode\":\"single\",\"sort\":\"none\"}},\"pluginVersion\":\"12.0.1\",\"targets\":[{\"disableTextWrap\":false,\"editorMode\":\"code\",\"expr\":\"rate(shoehub_sales{ShoeType=\\\"Loafers\\\"}[$__rate_interval])\",\"fullMetaSearch\":false,\"includeNullMetadata\":true,\"legendFormat\":\"__auto\",\"range\":true,\"refId\":\"A\",\"useBackend\":false},{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"beneyhode3bpca\"},\"editorMode\":\"code\",\"expr\":\"rate(shoehub_sales{ShoeType=\\\"Loafers\\\"}[$__rate_interval] offset 2m) \",\"hide\":false,\"instant\":false,\"legendFormat\":\"__auto\",\"range\":true,\"refId\":\"B\"}],\"title\":\"Sales Today vs. Sales Last Week\",\"type\":\"timeseries\"},{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"beneyhode3bpca\"},\"fieldConfig\":{\"defaults\":{\"color\":{\"mode\":\"palette-classic\"},\"custom\":{\"hideFrom\":{\"legend\":false,\"tooltip\":false,\"viz\":false}},\"mappings\":[]},\"overrides\":[]},\"gridPos\":{\"h\":8,\"w\":12,\"x\":12,\"y\":8},\"id\":2,\"options\":{\"displayLabels\":[\"name\",\"value\"],\"legend\":{\"displayMode\":\"list\",\"placement\":\"bottom\",\"showLegend\":true},\"pieType\":\"pie\",\"reduceOptions\":{\"calcs\":[\"lastNotNull\"],\"fields\":\"\",\"values\":false},\"tooltip\":{\"hideZeros\":false,\"mode\":\"single\",\"sort\":\"none\"}},\"pluginVersion\":\"12.0.1\",\"targets\":[{\"disableTextWrap\":false,\"editorMode\":\"code\",\"expr\":\"rate(shoehub_payments{CountryCode=\\\"AU\\\", PaymentMethod=\\\"Card\\\"}[$__rate_interval])\",\"fullMetaSearch\":false,\"includeNullMetadata\":true,\"legendFormat\":\"Australia\",\"range\":true,\"refId\":\"A\",\"useBackend\":false},{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"beneyhode3bpca\"},\"editorMode\":\"code\",\"expr\":\"rate(shoehub_payments{CountryCode=\\\"IN\\\", PaymentMethod=\\\"Card\\\"}[$__rate_interval])\",\"hide\":false,\"instant\":false,\"legendFormat\":\"India\",\"range\":true,\"refId\":\"B\"},{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"beneyhode3bpca\"},\"editorMode\":\"code\",\"expr\":\"rate(shoehub_payments{CountryCode=\\\"US\\\", PaymentMethod=\\\"Card\\\"}[$__rate_interval])\",\"hide\":false,\"instant\":false,\"legendFormat\":\"US\",\"range\":true,\"refId\":\"C\"}],\"title\":\"Card payments in Countries\",\"type\":\"piechart\"},{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"beneyhode3bpca\"},\"fieldConfig\":{\"defaults\":{\"color\":{\"mode\":\"palette-classic\"},\"custom\":{\"axisBorderShow\":false,\"axisCenteredZero\":false,\"axisColorMode\":\"text\",\"axisLabel\":\"\",\"axisPlacement\":\"auto\",\"barAlignment\":0,\"barWidthFactor\":0.6,\"drawStyle\":\"line\",\"fillOpacity\":0,\"gradientMode\":\"none\",\"hideFrom\":{\"legend\":false,\"tooltip\":false,\"viz\":false},\"insertNulls\":false,\"lineInterpolation\":\"smooth\",\"lineWidth\":1,\"pointSize\":5,\"scaleDistribution\":{\"type\":\"linear\"},\"showPoints\":\"auto\",\"spanNulls\":false,\"stacking\":{\"group\":\"A\",\"mode\":\"none\"},\"thresholdsStyle\":{\"mode\":\"off\"}},\"mappings\":[],\"thresholds\":{\"mode\":\"absolute\",\"steps\":[{\"color\":\"green\"},{\"color\":\"red\",\"value\":80}]}},\"overrides\":[]},\"gridPos\":{\"h\":10,\"w\":24,\"x\":0,\"y\":16},\"id\":6,\"maxPerRow\":3,\"options\":{\"legend\":{\"calcs\":[],\"displayMode\":\"list\",\"placement\":\"bottom\",\"showLegend\":true},\"tooltip\":{\"hideZeros\":false,\"mode\":\"single\",\"sort\":\"none\"}},\"pluginVersion\":\"12.0.1\",\"repeat\":\"paymentMethod\",\"repeatDirection\":\"h\",\"targets\":[{\"disableTextWrap\":false,\"editorMode\":\"code\",\"expr\":\"shoehub_payments{PaymentMethod=\\\"$paymentMethod\\\"}\",\"fullMetaSearch\":false,\"includeNullMetadata\":true,\"legendFormat\":\"$paymentMethod amount\",\"range\":true,\"refId\":\"A\",\"useBackend\":false}],\"title\":\"Sales Amount for $paymentMethod\",\"type\":\"timeseries\"},{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"beneyhode3bpca\"},\"fieldConfig\":{\"defaults\":{\"color\":{\"mode\":\"palette-classic\"},\"custom\":{\"axisBorderShow\":false,\"axisCenteredZero\":false,\"axisColorMode\":\"text\",\"axisLabel\":\"\",\"axisPlacement\":\"auto\",\"barAlignment\":0,\"barWidthFactor\":0.6,\"drawStyle\":\"line\",\"fillOpacity\":0,\"gradientMode\":\"none\",\"hideFrom\":{\"legend\":false,\"tooltip\":false,\"viz\":false},\"insertNulls\":false,\"lineInterpolation\":\"smooth\",\"lineWidth\":1,\"pointSize\":5,\"scaleDistribution\":{\"type\":\"linear\"},\"showPoints\":\"auto\",\"spanNulls\":false,\"stacking\":{\"group\":\"A\",\"mode\":\"none\"},\"thresholdsStyle\":{\"mode\":\"line+area\"}},\"mappings\":[],\"thresholds\":{\"mode\":\"percentage\",\"steps\":[{\"color\":\"green\"},{\"color\":\"dark-red\",\"value\":5}]}},\"overrides\":[]},\"gridPos\":{\"h\":8,\"w\":24,\"x\":0,\"y\":26},\"id\":4,\"maxPerRow\":3,\"options\":{\"legend\":{\"calcs\":[],\"displayMode\":\"list\",\"placement\":\"bottom\",\"showLegend\":true},\"tooltip\":{\"hideZeros\":false,\"mode\":\"single\",\"sort\":\"none\"}},\"pluginVersion\":\"12.0.1\",\"repeat\":\"country\",\"repeatDirection\":\"h\",\"targets\":[{\"editorMode\":\"code\",\"expr\":\"sum(shoehub_payments{CountryCode=\\\"$country\\\", PaymentMethod=\\\"Card\\\"}) / sum(shoehub_payments{CountryCode=\\\"$country\\\"}) * 100\",\"legendFormat\":\"Card\",\"range\":true,\"refId\":\"A\"},{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"beneyhode3bpca\"},\"editorMode\":\"code\",\"expr\":\"sum(shoehub_payments{CountryCode=\\\"$country\\\", PaymentMethod=\\\"Paypal\\\"}) / sum(shoehub_payments{CountryCode=\\\"$country\\\"}) * 100\",\"hide\":false,\"instant\":false,\"legendFormat\":\"Paypal\",\"range\":true,\"refId\":\"B\"},{\"datasource\":{\"type\":\"prometheus\",\"uid\":\"beneyhode3bpca\"},\"editorMode\":\"code\",\"expr\":\"sum(shoehub_payments{CountryCode=\\\"$country\\\", PaymentMethod=\\\"Cash\\\"}) / sum(shoehub_payments{CountryCode=\\\"$country\\\"}) * 100\",\"hide\":false,\"instant\":false,\"legendFormat\":\"Cash\",\"range\":true,\"refId\":\"C\"}],\"title\":\"Percentage of Payment Methods in the $country\",\"type\":\"timeseries\"}],\"preload\":false,\"refresh\":\"auto\",\"schemaVersion\":41,\"tags\":[],\"templating\":{\"list\":[{\"current\":{\"text\":[\"AU\"],\"value\":[\"AU\"]},\"definition\":\"label_values(shoehub_payments{PaymentMethod=\\\"Card\\\"}, CountryCode)\",\"includeAll\":true,\"label\":\"Country\",\"multi\":true,\"name\":\"country\",\"options\":[],\"query\":{\"qryType\":5,\"query\":\"label_values(shoehub_payments{PaymentMethod=\\\"Card\\\"}, CountryCode)\",\"refId\":\"PrometheusVariableQueryEditor-VariableQuery\"},\"refresh\":1,\"regex\":\"\",\"sort\":1,\"type\":\"query\"},{\"current\":{\"text\":[\"Card\"],\"value\":[\"Card\"]},\"definition\":\"label_values(shoehub_payments, PaymentMethod)\",\"description\":\"\",\"includeAll\":true,\"label\":\"Payment Method\",\"multi\":true,\"name\":\"paymentMethod\",\"options\":[],\"query\":{\"qryType\":5,\"query\":\"label_values(shoehub_payments, PaymentMethod)\",\"refId\":\"PrometheusVariableQueryEditor-VariableQuery\"},\"refresh\":1,\"regex\":\"\",\"type\":\"query\"}]},\"time\":{\"from\":\"2025-05-30T00:05:17.249Z\",\"to\":\"2025-05-30T00:11:09.181Z\"},\"timepicker\":{},\"timezone\":\"browser\",\"title\":\"ShoeHub\",\"uid\":\"55af68be-8b36-4fda-932d-09b304b05121\",\"version\":1}','v0alpha1'),(5,4,0,0,1,'2025-05-30 04:59:26',1,'','{\"annotations\":{\"list\":[{\"builtIn\":1,\"datasource\":{\"type\":\"grafana\",\"uid\":\"-- Grafana --\"},\"enable\":true,\"hide\":true,\"iconColor\":\"rgba(0, 211, 255, 1)\",\"name\":\"Annotations \\u0026 Alerts\",\"type\":\"dashboard\"}]},\"editable\":true,\"fiscalYearStartMonth\":0,\"graphTooltip\":0,\"links\":[],\"panels\":[{\"datasource\":{\"type\":\"loki\",\"uid\":\"deneyivl7ckxsb\"},\"fieldConfig\":{\"defaults\":{\"color\":{\"mode\":\"palette-classic\"},\"custom\":{\"axisBorderShow\":false,\"axisCenteredZero\":false,\"axisColorMode\":\"text\",\"axisLabel\":\"\",\"axisPlacement\":\"auto\",\"barAlignment\":0,\"barWidthFactor\":0.6,\"drawStyle\":\"line\",\"fillOpacity\":0,\"gradientMode\":\"none\",\"hideFrom\":{\"legend\":false,\"tooltip\":false,\"viz\":false},\"insertNulls\":false,\"lineInterpolation\":\"linear\",\"lineWidth\":1,\"pointSize\":5,\"scaleDistribution\":{\"type\":\"linear\"},\"showPoints\":\"auto\",\"spanNulls\":false,\"stacking\":{\"group\":\"A\",\"mode\":\"none\"},\"thresholdsStyle\":{\"mode\":\"off\"}},\"mappings\":[],\"thresholds\":{\"mode\":\"absolute\",\"steps\":[{\"color\":\"green\"},{\"color\":\"red\",\"value\":80}]}},\"overrides\":[{\"matcher\":{\"id\":\"byName\",\"options\":\"{component=\\\"backend\\\", detected_level=\\\"ERROR\\\", env=\\\"dev\\\", filename=\\\"/var/log/loki-monitoring.log\\\", job=\\\"varlogs\\\", level=\\\"ERROR\\\", service_name=\\\"backend\\\", team=\\\"Devops\\\"}\"},\"properties\":[{\"id\":\"color\",\"value\":{\"fixedColor\":\"red\",\"mode\":\"fixed\"}}]},{\"matcher\":{\"id\":\"byName\",\"options\":\"INFO\"},\"properties\":[{\"id\":\"color\",\"value\":{\"fixedColor\":\"green\",\"mode\":\"fixed\"}}]},{\"matcher\":{\"id\":\"byName\",\"options\":\"ERROR\"},\"properties\":[{\"id\":\"color\",\"value\":{\"fixedColor\":\"red\",\"mode\":\"fixed\"}}]}]},\"gridPos\":{\"h\":8,\"w\":12,\"x\":0,\"y\":0},\"id\":2,\"options\":{\"legend\":{\"calcs\":[],\"displayMode\":\"list\",\"placement\":\"bottom\",\"showLegend\":true},\"tooltip\":{\"hideZeros\":false,\"mode\":\"single\",\"sort\":\"none\"}},\"pluginVersion\":\"12.0.1\",\"targets\":[{\"datasource\":{\"type\":\"loki\",\"uid\":\"deneyivl7ckxsb\"},\"direction\":\"backward\",\"editorMode\":\"code\",\"expr\":\"rate({component=\\\"backend\\\", level=\\\"ERROR\\\"} [$__auto])\",\"legendFormat\":\"ERROR\",\"queryType\":\"range\",\"refId\":\"A\"},{\"datasource\":{\"type\":\"loki\",\"uid\":\"deneyivl7ckxsb\"},\"direction\":\"backward\",\"editorMode\":\"code\",\"expr\":\"rate({component=\\\"backend\\\", level=\\\"INFO\\\"} [$__auto])\",\"hide\":false,\"legendFormat\":\"INFO\",\"queryType\":\"range\",\"refId\":\"B\"}],\"title\":\"Backend Application\",\"type\":\"timeseries\"},{\"datasource\":{\"type\":\"loki\",\"uid\":\"deneyivl7ckxsb\"},\"fieldConfig\":{\"defaults\":{\"color\":{\"mode\":\"palette-classic\"},\"custom\":{\"hideFrom\":{\"legend\":false,\"tooltip\":false,\"viz\":false}},\"mappings\":[]},\"overrides\":[{\"matcher\":{\"id\":\"byName\",\"options\":\"error\"},\"properties\":[{\"id\":\"color\",\"value\":{\"fixedColor\":\"red\",\"mode\":\"fixed\"}}]},{\"matcher\":{\"id\":\"byName\",\"options\":\"info\"},\"properties\":[{\"id\":\"color\",\"value\":{\"fixedColor\":\"green\",\"mode\":\"fixed\"}}]}]},\"gridPos\":{\"h\":8,\"w\":12,\"x\":12,\"y\":0},\"id\":1,\"options\":{\"displayLabels\":[\"percent\"],\"legend\":{\"displayMode\":\"list\",\"placement\":\"bottom\",\"showLegend\":true},\"pieType\":\"pie\",\"reduceOptions\":{\"calcs\":[\"lastNotNull\"],\"fields\":\"\",\"values\":false},\"tooltip\":{\"hideZeros\":false,\"mode\":\"single\",\"sort\":\"none\"}},\"pluginVersion\":\"12.0.1\",\"targets\":[{\"datasource\":{\"type\":\"loki\",\"uid\":\"deneyivl7ckxsb\"},\"direction\":\"backward\",\"editorMode\":\"code\",\"expr\":\"rate({component=\\\"backend\\\", level=\\\"ERROR\\\"} [$__auto])\",\"legendFormat\":\"error\",\"queryType\":\"range\",\"refId\":\"A\"},{\"datasource\":{\"type\":\"loki\",\"uid\":\"deneyivl7ckxsb\"},\"direction\":\"backward\",\"editorMode\":\"code\",\"expr\":\"rate({component=\\\"backend\\\", level=\\\"ERROR\\\"} [$__auto])\",\"hide\":false,\"legendFormat\":\"info\",\"queryType\":\"range\",\"refId\":\"B\"}],\"title\":\"Error Backend Percentage\",\"type\":\"piechart\"}],\"preload\":false,\"schemaVersion\":41,\"tags\":[],\"templating\":{\"list\":[]},\"time\":{\"from\":\"now-6h\",\"to\":\"now\"},\"timepicker\":{},\"timezone\":\"browser\",\"title\":\"Loki Logging\",\"uid\":\"49785456-5a88-40dc-99f2-45f909e23f93\",\"version\":1}','v0alpha1');
/*!40000 ALTER TABLE `dashboard_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_keys`
--

DROP TABLE IF EXISTS `data_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_keys` (
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  `scope` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `encrypted_data` blob NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_keys`
--

LOCK TABLES `data_keys` WRITE;
/*!40000 ALTER TABLE `data_keys` DISABLE KEYS */;
INSERT INTO `data_keys` VALUES ('aeneyfxm9x9moe',1,'root','secretKey.v1',_binary '*YWVzLWNmYg*ckXUX3qUJ¥\Í\òNA˜\Ä\â\ó0\ÞÒµLU\Ñ\èq°pN3VF\Ü_','2025-05-30 04:56:18','2025-05-30 04:56:18','2025-05-30/root@secretKey.v1');
/*!40000 ALTER TABLE `data_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_source`
--

DROP TABLE IF EXISTS `data_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_source` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` bigint NOT NULL,
  `version` int NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `access` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `database` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `basic_auth` tinyint(1) NOT NULL,
  `basic_auth_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `basic_auth_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL,
  `json_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `with_credentials` tinyint(1) NOT NULL DEFAULT '0',
  `secure_json_data` mediumtext COLLATE utf8mb4_unicode_ci,
  `read_only` tinyint(1) DEFAULT NULL,
  `uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `is_prunable` tinyint(1) DEFAULT '0',
  `api_version` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_data_source_org_id_name` (`org_id`,`name`),
  UNIQUE KEY `UQE_data_source_org_id_uid` (`org_id`,`uid`),
  KEY `IDX_data_source_org_id` (`org_id`),
  KEY `IDX_data_source_org_id_is_default` (`org_id`,`is_default`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_source`
--

LOCK TABLES `data_source` WRITE;
/*!40000 ALTER TABLE `data_source` DISABLE KEYS */;
INSERT INTO `data_source` VALUES (1,1,2,'prometheus','prometheus','proxy','http://prometheus:9090','','','',1,'admin','',1,'{\"httpMethod\":\"POST\",\"oauthPassThru\":false,\"sigV4Auth\":false}','2025-05-30 04:56:51','2025-05-30 04:57:05',0,'{\"basicAuthPassword\":\"I1lXVnVaWGxtZUcwNWVEbHRiMlUjKllXVnpMV05tWWcqOGJOQUIzb1a4MsA1BBhZe0nq88ndpqaGYE4ICmf2Yr8=\"}',0,'beneyhode3bpca',0,''),(2,1,2,'loki','loki','proxy','http://loki:3100','','','',0,'','',0,'{}','2025-05-30 04:57:13','2025-05-30 04:57:17',0,'{}',0,'deneyivl7ckxsb',0,'');
/*!40000 ALTER TABLE `data_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_event`
--

DROP TABLE IF EXISTS `entity_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entity_event` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `entity_id` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` bigint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_event`
--

LOCK TABLES `entity_event` WRITE;
/*!40000 ALTER TABLE `entity_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `entity_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file`
--

DROP TABLE IF EXISTS `file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file` (
  `path` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `path_hash` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_folder_path_hash` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contents` mediumblob,
  `etag` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cache_control` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_disposition` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated` datetime NOT NULL,
  `created` datetime NOT NULL,
  `size` bigint NOT NULL,
  `mime_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  UNIQUE KEY `UQE_file_path_hash` (`path_hash`),
  KEY `IDX_file_parent_folder_path_hash` (`parent_folder_path_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
/*!40000 ALTER TABLE `file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_meta`
--

DROP TABLE IF EXISTS `file_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file_meta` (
  `path_hash` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  UNIQUE KEY `UQE_file_meta_path_hash_key` (`path_hash`,`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_meta`
--

LOCK TABLES `file_meta` WRITE;
/*!40000 ALTER TABLE `file_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folder`
--

DROP TABLE IF EXISTS `folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `folder` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `org_id` bigint NOT NULL,
  `title` varchar(189) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_folder_org_id_uid` (`org_id`,`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folder`
--

LOCK TABLES `folder` WRITE;
/*!40000 ALTER TABLE `folder` DISABLE KEYS */;
INSERT INTO `folder` VALUES (1,'ceneyjkpqkwlcc',1,'Tech Team','',NULL,'2025-05-30 04:57:27','2025-05-30 04:57:27');
/*!40000 ALTER TABLE `folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kv_store`
--

DROP TABLE IF EXISTS `kv_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kv_store` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` bigint NOT NULL,
  `namespace` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_kv_store_org_id_namespace_key` (`org_id`,`namespace`,`key`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kv_store`
--

LOCK TABLES `kv_store` WRITE;
/*!40000 ALTER TABLE `kv_store` DISABLE KEYS */;
INSERT INTO `kv_store` VALUES (1,0,'ngalert.migration','currentAlertingType','Legacy','2025-05-30 04:52:47','2025-05-30 04:52:47'),(2,0,'plugin.publickeys','key-7e4d0c6a708866e7','-----BEGIN PGP PUBLIC KEY BLOCK-----\nVersion: OpenPGP.js v4.10.1\nComment: https://openpgpjs.org\n	\nxpMEXpTXXxMFK4EEACMEIwQBiOUQhvGbDLvndE0fEXaR0908wXzPGFpf0P0Z\nHJ06tsq+0higIYHp7WTNJVEZtcwoYLcPRGaa9OQqbUU63BEyZdgAkPTz3RFd\n5+TkDWZizDcaVFhzbDd500yTwexrpIrdInwC/jrgs7Zy/15h8KA59XXUkdmT\nYB6TR+OA9RKME+dCJozNGUdyYWZhbmEgPGVuZ0BncmFmYW5hLmNvbT7CvAQQ\nEwoAIAUCXpTXXwYLCQcIAwIEFQgKAgQWAgEAAhkBAhsDAh4BAAoJEH5NDGpw\niGbnaWoCCQGQ3SQnCkRWrG6XrMkXOKfDTX2ow9fuoErN46BeKmLM4f1EkDZQ\nTpq3SE8+My8B5BIH3SOcBeKzi3S57JHGBdFA+wIJAYWMrJNIvw8GeXne+oUo\nNzzACdvfqXAZEp/HFMQhCKfEoWGJE8d2YmwY2+3GufVRTI5lQnZOHLE8L/Vc\n1S5MXESjzpcEXpTXXxIFK4EEACMEIwQBtHX/SD5Qm3v4V92qpaIZQgtTX0sT\ncFPjYWAHqsQ1iENrYN/vg1wU3ADlYATvydOQYvkTyT/tbDvx2Fse8PL84MQA\nYKKQ6AJ3gLVvmeouZdU03YoV4MYaT8KbnJUkZQZkqdz2riOlySNI9CG3oYmv\nomjUAtzgAgnCcurfGLZkkMxlmY8DAQoJwqQEGBMKAAkFAl6U118CGwwACgkQ\nfk0ManCIZuc0jAIJAVw2xdLr4ZQqPUhubrUyFcqlWoW8dQoQagwO8s8ubmby\nKuLA9FWJkfuuRQr+O9gHkDVCez3aism7zmJBqIOi38aNAgjJ3bo6leSS2jR/\nx5NqiKVi83tiXDPncDQYPymOnMhW0l7CVA7wj75HrFvvlRI/4MArlbsZ2tBn\nN1c5v9v/4h6qeA==\n=DNbR\n-----END PGP PUBLIC KEY BLOCK-----\n','2025-05-30 04:52:48','2025-05-30 04:52:48'),(3,0,'plugin.publickeys','last_updated','2025-05-30T04:52:48Z','2025-05-30 04:52:48','2025-05-30 04:52:48'),(4,0,'datasource','secretMigrationStatus','compatible','2025-05-30 04:52:49','2025-05-30 04:52:49'),(5,0,'plugin.angularpatterns','angular_patterns','[{\"Name\":\"PanelCtrl\",\"Pattern\":\"PanelCtrl\",\"Type\":\"contains\"},{\"Name\":\"ConfigCtrl\",\"Pattern\":\"ConfigCtrl\",\"Type\":\"contains\"},{\"Name\":\"app/plugins/sdk\",\"Pattern\":\"app/plugins/sdk\",\"Type\":\"contains\"},{\"Name\":\"Angular Specific Function\",\"Pattern\":\"angular.isNumber(\",\"Type\":\"contains\"},{\"Name\":\"ctrl.annotation\",\"Pattern\":\"ctrl.annotation\",\"Type\":\"contains\"},{\"Name\":\"QueryCtrl\",\"Pattern\":\"[\\\"\']QueryCtrl[\\\"\']\",\"Type\":\"regex\"}]','2025-05-30 04:52:49','2025-05-30 04:52:49'),(6,0,'plugin.angularpatterns','last_updated','2025-05-30T04:52:49Z','2025-05-30 04:52:49','2025-05-30 04:52:49'),(7,0,'plugin.angularpatterns','etag','\"1a8-1yOry0c74BKAzc7BUbZdNV0sYic\"','2025-05-30 04:52:49','2025-05-30 04:52:49'),(8,1,'alertmanager','notifications','','2025-05-30 05:07:49','2025-05-30 05:07:49'),(9,1,'alertmanager','silences','','2025-05-30 05:07:49','2025-05-30 05:07:49');
/*!40000 ALTER TABLE `kv_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library_element`
--

DROP TABLE IF EXISTS `library_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `library_element` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` bigint NOT NULL,
  `folder_id` bigint NOT NULL,
  `uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kind` bigint NOT NULL,
  `type` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `created_by` bigint NOT NULL,
  `updated` datetime NOT NULL,
  `updated_by` bigint NOT NULL,
  `version` bigint NOT NULL,
  `folder_uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_library_element_org_id_folder_id_name_kind` (`org_id`,`folder_id`,`name`,`kind`),
  UNIQUE KEY `UQE_library_element_org_id_uid` (`org_id`,`uid`),
  UNIQUE KEY `UQE_library_element_org_id_folder_uid_name_kind` (`org_id`,`folder_uid`,`name`,`kind`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library_element`
--

LOCK TABLES `library_element` WRITE;
/*!40000 ALTER TABLE `library_element` DISABLE KEYS */;
/*!40000 ALTER TABLE `library_element` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library_element_connection`
--

DROP TABLE IF EXISTS `library_element_connection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `library_element_connection` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `element_id` bigint NOT NULL,
  `kind` bigint NOT NULL,
  `connection_id` bigint NOT NULL,
  `created` datetime NOT NULL,
  `created_by` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_library_element_connection_element_id_kind_connection_id` (`element_id`,`kind`,`connection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library_element_connection`
--

LOCK TABLES `library_element_connection` WRITE;
/*!40000 ALTER TABLE `library_element_connection` DISABLE KEYS */;
/*!40000 ALTER TABLE `library_element_connection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_attempt`
--

DROP TABLE IF EXISTS `login_attempt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_attempt` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IDX_login_attempt_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_attempt`
--

LOCK TABLES `login_attempt` WRITE;
/*!40000 ALTER TABLE `login_attempt` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_attempt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration_log`
--

DROP TABLE IF EXISTS `migration_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migration_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `migration_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sql` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `success` tinyint(1) NOT NULL,
  `error` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=655 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration_log`
--

LOCK TABLES `migration_log` WRITE;
/*!40000 ALTER TABLE `migration_log` DISABLE KEYS */;
INSERT INTO `migration_log` VALUES (1,'create migration_log table','CREATE TABLE IF NOT EXISTS `migration_log` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `migration_id` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `sql` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `success` TINYINT(1) NOT NULL\n, `error` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `timestamp` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:40'),(2,'create user table','CREATE TABLE IF NOT EXISTS `user` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `version` INT NOT NULL\n, `login` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `email` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `password` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `salt` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `rands` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `company` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `account_id` BIGINT(20) NOT NULL\n, `is_admin` TINYINT(1) NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:40'),(3,'add unique index user.login','CREATE UNIQUE INDEX `UQE_user_login` ON `user` (`login`);',1,'','2025-05-30 04:52:40'),(4,'add unique index user.email','CREATE UNIQUE INDEX `UQE_user_email` ON `user` (`email`);',1,'','2025-05-30 04:52:40'),(5,'drop index UQE_user_login - v1','DROP INDEX `UQE_user_login` ON `user`',1,'','2025-05-30 04:52:40'),(6,'drop index UQE_user_email - v1','DROP INDEX `UQE_user_email` ON `user`',1,'','2025-05-30 04:52:40'),(7,'Rename table user to user_v1 - v1','ALTER TABLE `user` RENAME TO `user_v1`',1,'','2025-05-30 04:52:40'),(8,'create user table v2','CREATE TABLE IF NOT EXISTS `user` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `version` INT NOT NULL\n, `login` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `email` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `password` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `salt` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `rands` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `company` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `org_id` BIGINT(20) NOT NULL\n, `is_admin` TINYINT(1) NOT NULL\n, `email_verified` TINYINT(1) NULL\n, `theme` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:40'),(9,'create index UQE_user_login - v2','CREATE UNIQUE INDEX `UQE_user_login` ON `user` (`login`);',1,'','2025-05-30 04:52:40'),(10,'create index UQE_user_email - v2','CREATE UNIQUE INDEX `UQE_user_email` ON `user` (`email`);',1,'','2025-05-30 04:52:40'),(11,'copy data_source v1 to v2','INSERT INTO `user` (`version`\n, `email`\n, `name`\n, `password`\n, `salt`\n, `company`\n, `org_id`\n, `created`\n, `id`\n, `login`\n, `rands`\n, `is_admin`\n, `updated`) SELECT `version`\n, `email`\n, `name`\n, `password`\n, `salt`\n, `company`\n, `account_id`\n, `created`\n, `id`\n, `login`\n, `rands`\n, `is_admin`\n, `updated` FROM `user_v1`',1,'','2025-05-30 04:52:40'),(12,'Drop old table user_v1','DROP TABLE IF EXISTS `user_v1`',1,'','2025-05-30 04:52:40'),(13,'Add column help_flags1 to user table','alter table `user` ADD COLUMN `help_flags1` BIGINT(20) NOT NULL DEFAULT 0 ',1,'','2025-05-30 04:52:40'),(14,'Update user table charset','ALTER TABLE `user` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `login` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `email` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `password` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `salt` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `rands` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `company` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `theme` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ;',1,'','2025-05-30 04:52:40'),(15,'Add last_seen_at column to user','alter table `user` ADD COLUMN `last_seen_at` DATETIME NULL ',1,'','2025-05-30 04:52:40'),(16,'Add missing user data','code migration',1,'','2025-05-30 04:52:40'),(17,'Add is_disabled column to user','alter table `user` ADD COLUMN `is_disabled` TINYINT(1) NOT NULL DEFAULT 0 ',1,'','2025-05-30 04:52:40'),(18,'Add index user.login/user.email','CREATE INDEX `IDX_user_login_email` ON `user` (`login`,`email`);',1,'','2025-05-30 04:52:40'),(19,'Add is_service_account column to user','alter table `user` ADD COLUMN `is_service_account` TINYINT(1) NOT NULL DEFAULT 0 ',1,'','2025-05-30 04:52:40'),(20,'Update is_service_account column to nullable','ALTER TABLE user MODIFY is_service_account BOOLEAN DEFAULT 0;',1,'','2025-05-30 04:52:40'),(21,'Add uid column to user','alter table `user` ADD COLUMN `uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-05-30 04:52:40'),(22,'Update uid column values for users','UPDATE user SET uid=concat(\'u\',lpad(id,9,\'0\')) WHERE uid IS NULL;',1,'','2025-05-30 04:52:40'),(23,'Add unique index user_uid','CREATE UNIQUE INDEX `UQE_user_uid` ON `user` (`uid`);',1,'','2025-05-30 04:52:40'),(24,'Add is_provisioned column to user','alter table `user` ADD COLUMN `is_provisioned` TINYINT(1) NOT NULL DEFAULT 0 ',1,'','2025-05-30 04:52:40'),(25,'update login field with orgid to allow for multiple service accounts with same name across orgs','code migration',1,'','2025-05-30 04:52:40'),(26,'update service accounts login field orgid to appear only once','code migration',1,'','2025-05-30 04:52:40'),(27,'update login and email fields to lowercase','code migration',1,'','2025-05-30 04:52:40'),(28,'update login and email fields to lowercase2','code migration',1,'','2025-05-30 04:52:40'),(29,'create temp user table v1-7','CREATE TABLE IF NOT EXISTS `temp_user` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `version` INT NOT NULL\n, `email` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `role` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `code` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `status` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `invited_by_user_id` BIGINT(20) NULL\n, `email_sent` TINYINT(1) NOT NULL\n, `email_sent_on` DATETIME NULL\n, `remote_addr` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:40'),(30,'create index IDX_temp_user_email - v1-7','CREATE INDEX `IDX_temp_user_email` ON `temp_user` (`email`);',1,'','2025-05-30 04:52:40'),(31,'create index IDX_temp_user_org_id - v1-7','CREATE INDEX `IDX_temp_user_org_id` ON `temp_user` (`org_id`);',1,'','2025-05-30 04:52:40'),(32,'create index IDX_temp_user_code - v1-7','CREATE INDEX `IDX_temp_user_code` ON `temp_user` (`code`);',1,'','2025-05-30 04:52:40'),(33,'create index IDX_temp_user_status - v1-7','CREATE INDEX `IDX_temp_user_status` ON `temp_user` (`status`);',1,'','2025-05-30 04:52:40'),(34,'Update temp_user table charset','ALTER TABLE `temp_user` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `email` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `role` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `code` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `status` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `remote_addr` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ;',1,'','2025-05-30 04:52:41'),(35,'drop index IDX_temp_user_email - v1','DROP INDEX `IDX_temp_user_email` ON `temp_user`',1,'','2025-05-30 04:52:41'),(36,'drop index IDX_temp_user_org_id - v1','DROP INDEX `IDX_temp_user_org_id` ON `temp_user`',1,'','2025-05-30 04:52:41'),(37,'drop index IDX_temp_user_code - v1','DROP INDEX `IDX_temp_user_code` ON `temp_user`',1,'','2025-05-30 04:52:41'),(38,'drop index IDX_temp_user_status - v1','DROP INDEX `IDX_temp_user_status` ON `temp_user`',1,'','2025-05-30 04:52:41'),(39,'Rename table temp_user to temp_user_tmp_qwerty - v1','ALTER TABLE `temp_user` RENAME TO `temp_user_tmp_qwerty`',1,'','2025-05-30 04:52:41'),(40,'create temp_user v2','CREATE TABLE IF NOT EXISTS `temp_user` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `version` INT NOT NULL\n, `email` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `role` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `code` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `status` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `invited_by_user_id` BIGINT(20) NULL\n, `email_sent` TINYINT(1) NOT NULL\n, `email_sent_on` DATETIME NULL\n, `remote_addr` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `created` INT NOT NULL DEFAULT 0\n, `updated` INT NOT NULL DEFAULT 0\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:41'),(41,'create index IDX_temp_user_email - v2','CREATE INDEX `IDX_temp_user_email` ON `temp_user` (`email`);',1,'','2025-05-30 04:52:41'),(42,'create index IDX_temp_user_org_id - v2','CREATE INDEX `IDX_temp_user_org_id` ON `temp_user` (`org_id`);',1,'','2025-05-30 04:52:41'),(43,'create index IDX_temp_user_code - v2','CREATE INDEX `IDX_temp_user_code` ON `temp_user` (`code`);',1,'','2025-05-30 04:52:41'),(44,'create index IDX_temp_user_status - v2','CREATE INDEX `IDX_temp_user_status` ON `temp_user` (`status`);',1,'','2025-05-30 04:52:41'),(45,'copy temp_user v1 to v2','INSERT INTO `temp_user` (`id`\n, `version`\n, `name`\n, `role`\n, `code`\n, `status`\n, `email_sent`\n, `email_sent_on`\n, `org_id`\n, `email`\n, `invited_by_user_id`\n, `remote_addr`) SELECT `id`\n, `version`\n, `name`\n, `role`\n, `code`\n, `status`\n, `email_sent`\n, `email_sent_on`\n, `org_id`\n, `email`\n, `invited_by_user_id`\n, `remote_addr` FROM `temp_user_tmp_qwerty`',1,'','2025-05-30 04:52:41'),(46,'drop temp_user_tmp_qwerty','DROP TABLE IF EXISTS `temp_user_tmp_qwerty`',1,'','2025-05-30 04:52:41'),(47,'Set created for temp users that will otherwise prematurely expire','code migration',1,'','2025-05-30 04:52:41'),(48,'create star table','CREATE TABLE IF NOT EXISTS `star` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `user_id` BIGINT(20) NOT NULL\n, `dashboard_id` BIGINT(20) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:41'),(49,'add unique index star.user_id_dashboard_id','CREATE UNIQUE INDEX `UQE_star_user_id_dashboard_id` ON `star` (`user_id`,`dashboard_id`);',1,'','2025-05-30 04:52:41'),(50,'Add column dashboard_uid in star','alter table `star` ADD COLUMN `dashboard_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-05-30 04:52:41'),(51,'Add column org_id in star','alter table `star` ADD COLUMN `org_id` BIGINT(20) NULL DEFAULT 1 ',1,'','2025-05-30 04:52:41'),(52,'Add column updated in star','alter table `star` ADD COLUMN `updated` DATETIME NULL ',1,'','2025-05-30 04:52:41'),(53,'add index in star table on dashboard_uid, org_id and user_id columns','CREATE UNIQUE INDEX `UQE_star_user_id_dashboard_uid_org_id` ON `star` (`user_id`,`dashboard_uid`,`org_id`);',1,'','2025-05-30 04:52:41'),(54,'create org table v1','CREATE TABLE IF NOT EXISTS `org` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `version` INT NOT NULL\n, `name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `address1` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `address2` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `city` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `state` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `zip_code` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `country` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `billing_email` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:41'),(55,'create index UQE_org_name - v1','CREATE UNIQUE INDEX `UQE_org_name` ON `org` (`name`);',1,'','2025-05-30 04:52:41'),(56,'create org_user table v1','CREATE TABLE IF NOT EXISTS `org_user` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `user_id` BIGINT(20) NOT NULL\n, `role` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:41'),(57,'create index IDX_org_user_org_id - v1','CREATE INDEX `IDX_org_user_org_id` ON `org_user` (`org_id`);',1,'','2025-05-30 04:52:41'),(58,'create index UQE_org_user_org_id_user_id - v1','CREATE UNIQUE INDEX `UQE_org_user_org_id_user_id` ON `org_user` (`org_id`,`user_id`);',1,'','2025-05-30 04:52:41'),(59,'create index IDX_org_user_user_id - v1','CREATE INDEX `IDX_org_user_user_id` ON `org_user` (`user_id`);',1,'','2025-05-30 04:52:41'),(60,'Update org table charset','ALTER TABLE `org` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `address1` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `address2` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `city` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `state` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `zip_code` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `country` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `billing_email` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ;',1,'','2025-05-30 04:52:41'),(61,'Update org_user table charset','ALTER TABLE `org_user` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `role` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;',1,'','2025-05-30 04:52:41'),(62,'Migrate all Read Only Viewers to Viewers','UPDATE org_user SET role = \'Viewer\' WHERE role = \'Read Only Editor\'',1,'','2025-05-30 04:52:41'),(63,'create dashboard table','CREATE TABLE IF NOT EXISTS `dashboard` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `version` INT NOT NULL\n, `slug` VARCHAR(189) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `title` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `account_id` BIGINT(20) NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:41'),(64,'add index dashboard.account_id','CREATE INDEX `IDX_dashboard_account_id` ON `dashboard` (`account_id`);',1,'','2025-05-30 04:52:41'),(65,'add unique index dashboard_account_id_slug','CREATE UNIQUE INDEX `UQE_dashboard_account_id_slug` ON `dashboard` (`account_id`,`slug`);',1,'','2025-05-30 04:52:41'),(66,'create dashboard_tag table','CREATE TABLE IF NOT EXISTS `dashboard_tag` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `dashboard_id` BIGINT(20) NOT NULL\n, `term` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:41'),(67,'add unique index dashboard_tag.dasboard_id_term','CREATE UNIQUE INDEX `UQE_dashboard_tag_dashboard_id_term` ON `dashboard_tag` (`dashboard_id`,`term`);',1,'','2025-05-30 04:52:41'),(68,'drop index UQE_dashboard_tag_dashboard_id_term - v1','DROP INDEX `UQE_dashboard_tag_dashboard_id_term` ON `dashboard_tag`',1,'','2025-05-30 04:52:41'),(69,'Rename table dashboard to dashboard_v1 - v1','ALTER TABLE `dashboard` RENAME TO `dashboard_v1`',1,'','2025-05-30 04:52:41'),(70,'create dashboard v2','CREATE TABLE IF NOT EXISTS `dashboard` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `version` INT NOT NULL\n, `slug` VARCHAR(189) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `title` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:41'),(71,'create index IDX_dashboard_org_id - v2','CREATE INDEX `IDX_dashboard_org_id` ON `dashboard` (`org_id`);',1,'','2025-05-30 04:52:41'),(72,'create index UQE_dashboard_org_id_slug - v2','CREATE UNIQUE INDEX `UQE_dashboard_org_id_slug` ON `dashboard` (`org_id`,`slug`);',1,'','2025-05-30 04:52:41'),(73,'copy dashboard v1 to v2','INSERT INTO `dashboard` (`version`\n, `slug`\n, `title`\n, `data`\n, `org_id`\n, `created`\n, `updated`\n, `id`) SELECT `version`\n, `slug`\n, `title`\n, `data`\n, `account_id`\n, `created`\n, `updated`\n, `id` FROM `dashboard_v1`',1,'','2025-05-30 04:52:41'),(74,'drop table dashboard_v1','DROP TABLE IF EXISTS `dashboard_v1`',1,'','2025-05-30 04:52:41'),(75,'alter dashboard.data to mediumtext v1','ALTER TABLE dashboard MODIFY data MEDIUMTEXT;',1,'','2025-05-30 04:52:41'),(76,'Add column updated_by in dashboard - v2','alter table `dashboard` ADD COLUMN `updated_by` INT NULL ',1,'','2025-05-30 04:52:41'),(77,'Add column created_by in dashboard - v2','alter table `dashboard` ADD COLUMN `created_by` INT NULL ',1,'','2025-05-30 04:52:41'),(78,'Add column gnetId in dashboard','alter table `dashboard` ADD COLUMN `gnet_id` BIGINT(20) NULL ',1,'','2025-05-30 04:52:41'),(79,'Add index for gnetId in dashboard','CREATE INDEX `IDX_dashboard_gnet_id` ON `dashboard` (`gnet_id`);',1,'','2025-05-30 04:52:41'),(80,'Add column plugin_id in dashboard','alter table `dashboard` ADD COLUMN `plugin_id` VARCHAR(189) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-05-30 04:52:41'),(81,'Add index for plugin_id in dashboard','CREATE INDEX `IDX_dashboard_org_id_plugin_id` ON `dashboard` (`org_id`,`plugin_id`);',1,'','2025-05-30 04:52:41'),(82,'Add index for dashboard_id in dashboard_tag','CREATE INDEX `IDX_dashboard_tag_dashboard_id` ON `dashboard_tag` (`dashboard_id`);',1,'','2025-05-30 04:52:41'),(83,'Update dashboard table charset','ALTER TABLE `dashboard` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `slug` VARCHAR(189) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `title` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `plugin_id` VARCHAR(189) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `data` MEDIUMTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;',1,'','2025-05-30 04:52:41'),(84,'Update dashboard_tag table charset','ALTER TABLE `dashboard_tag` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `term` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;',1,'','2025-05-30 04:52:41'),(85,'Add column folder_id in dashboard','alter table `dashboard` ADD COLUMN `folder_id` BIGINT(20) NOT NULL DEFAULT 0 ',1,'','2025-05-30 04:52:41'),(86,'Add column isFolder in dashboard','alter table `dashboard` ADD COLUMN `is_folder` TINYINT(1) NOT NULL DEFAULT 0 ',1,'','2025-05-30 04:52:41'),(87,'Add column has_acl in dashboard','alter table `dashboard` ADD COLUMN `has_acl` TINYINT(1) NOT NULL DEFAULT 0 ',1,'','2025-05-30 04:52:41'),(88,'Add column uid in dashboard','alter table `dashboard` ADD COLUMN `uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-05-30 04:52:41'),(89,'Update uid column values in dashboard','UPDATE dashboard SET uid=lpad(id,9,\'0\') WHERE uid IS NULL;',1,'','2025-05-30 04:52:41'),(90,'Add unique index dashboard_org_id_uid','CREATE UNIQUE INDEX `UQE_dashboard_org_id_uid` ON `dashboard` (`org_id`,`uid`);',1,'','2025-05-30 04:52:41'),(91,'Remove unique index org_id_slug','DROP INDEX `UQE_dashboard_org_id_slug` ON `dashboard`',1,'','2025-05-30 04:52:41'),(92,'Update dashboard title length','ALTER TABLE `dashboard` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `title` VARCHAR(189) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;',1,'','2025-05-30 04:52:41'),(93,'Add unique index for dashboard_org_id_title_folder_id','CREATE UNIQUE INDEX `UQE_dashboard_org_id_folder_id_title` ON `dashboard` (`org_id`,`folder_id`,`title`);',1,'','2025-05-30 04:52:41'),(94,'create dashboard_provisioning','CREATE TABLE IF NOT EXISTS `dashboard_provisioning` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `dashboard_id` BIGINT(20) NULL\n, `name` VARCHAR(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `external_id` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:41'),(95,'Rename table dashboard_provisioning to dashboard_provisioning_tmp_qwerty - v1','ALTER TABLE `dashboard_provisioning` RENAME TO `dashboard_provisioning_tmp_qwerty`',1,'','2025-05-30 04:52:41'),(96,'create dashboard_provisioning v2','CREATE TABLE IF NOT EXISTS `dashboard_provisioning` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `dashboard_id` BIGINT(20) NULL\n, `name` VARCHAR(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `external_id` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `updated` INT NOT NULL DEFAULT 0\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:41'),(97,'create index IDX_dashboard_provisioning_dashboard_id - v2','CREATE INDEX `IDX_dashboard_provisioning_dashboard_id` ON `dashboard_provisioning` (`dashboard_id`);',1,'','2025-05-30 04:52:41'),(98,'create index IDX_dashboard_provisioning_dashboard_id_name - v2','CREATE INDEX `IDX_dashboard_provisioning_dashboard_id_name` ON `dashboard_provisioning` (`dashboard_id`,`name`);',1,'','2025-05-30 04:52:41'),(99,'copy dashboard_provisioning v1 to v2','INSERT INTO `dashboard_provisioning` (`dashboard_id`\n, `name`\n, `external_id`\n, `id`) SELECT `dashboard_id`\n, `name`\n, `external_id`\n, `id` FROM `dashboard_provisioning_tmp_qwerty`',1,'','2025-05-30 04:52:41'),(100,'drop dashboard_provisioning_tmp_qwerty','DROP TABLE IF EXISTS `dashboard_provisioning_tmp_qwerty`',1,'','2025-05-30 04:52:41'),(101,'Add check_sum column','alter table `dashboard_provisioning` ADD COLUMN `check_sum` VARCHAR(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-05-30 04:52:41'),(102,'Add index for dashboard_title','CREATE INDEX `IDX_dashboard_title` ON `dashboard` (`title`);',1,'','2025-05-30 04:52:41'),(103,'delete tags for deleted dashboards','DELETE FROM dashboard_tag WHERE dashboard_id NOT IN (SELECT id FROM dashboard)',1,'','2025-05-30 04:52:41'),(104,'delete stars for deleted dashboards','DELETE FROM star WHERE dashboard_id NOT IN (SELECT id FROM dashboard)',1,'','2025-05-30 04:52:41'),(105,'Add index for dashboard_is_folder','CREATE INDEX `IDX_dashboard_is_folder` ON `dashboard` (`is_folder`);',1,'','2025-05-30 04:52:41'),(106,'Add isPublic for dashboard','alter table `dashboard` ADD COLUMN `is_public` TINYINT(1) NOT NULL DEFAULT 0 ',1,'','2025-05-30 04:52:41'),(107,'Add deleted for dashboard','alter table `dashboard` ADD COLUMN `deleted` DATETIME NULL ',1,'','2025-05-30 04:52:41'),(108,'Add index for deleted','CREATE INDEX `IDX_dashboard_deleted` ON `dashboard` (`deleted`);',1,'','2025-05-30 04:52:41'),(109,'Add column dashboard_uid in dashboard_tag','alter table `dashboard_tag` ADD COLUMN `dashboard_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-05-30 04:52:41'),(110,'Add column org_id in dashboard_tag','alter table `dashboard_tag` ADD COLUMN `org_id` BIGINT(20) NULL DEFAULT 1 ',1,'','2025-05-30 04:52:41'),(111,'Add missing dashboard_uid and org_id to dashboard_tag','code migration',1,'','2025-05-30 04:52:41'),(112,'Add apiVersion for dashboard','alter table `dashboard` ADD COLUMN `api_version` VARCHAR(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-05-30 04:52:41'),(113,'Add index for dashboard_uid on dashboard_tag table','CREATE INDEX `IDX_dashboard_tag_dashboard_uid` ON `dashboard_tag` (`dashboard_uid`);',1,'','2025-05-30 04:52:42'),(114,'Add missing dashboard_uid and org_id to star','code migration',1,'','2025-05-30 04:52:42'),(115,'create data_source table','CREATE TABLE IF NOT EXISTS `data_source` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `account_id` BIGINT(20) NOT NULL\n, `version` INT NOT NULL\n, `type` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `access` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `url` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `password` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `user` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `database` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `basic_auth` TINYINT(1) NOT NULL\n, `basic_auth_user` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `basic_auth_password` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `is_default` TINYINT(1) NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:42'),(116,'add index data_source.account_id','CREATE INDEX `IDX_data_source_account_id` ON `data_source` (`account_id`);',1,'','2025-05-30 04:52:42'),(117,'add unique index data_source.account_id_name','CREATE UNIQUE INDEX `UQE_data_source_account_id_name` ON `data_source` (`account_id`,`name`);',1,'','2025-05-30 04:52:42'),(118,'drop index IDX_data_source_account_id - v1','DROP INDEX `IDX_data_source_account_id` ON `data_source`',1,'','2025-05-30 04:52:42'),(119,'drop index UQE_data_source_account_id_name - v1','DROP INDEX `UQE_data_source_account_id_name` ON `data_source`',1,'','2025-05-30 04:52:42'),(120,'Rename table data_source to data_source_v1 - v1','ALTER TABLE `data_source` RENAME TO `data_source_v1`',1,'','2025-05-30 04:52:42'),(121,'create data_source table v2','CREATE TABLE IF NOT EXISTS `data_source` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `version` INT NOT NULL\n, `type` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `access` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `url` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `password` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `user` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `database` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `basic_auth` TINYINT(1) NOT NULL\n, `basic_auth_user` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `basic_auth_password` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `is_default` TINYINT(1) NOT NULL\n, `json_data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:42'),(122,'create index IDX_data_source_org_id - v2','CREATE INDEX `IDX_data_source_org_id` ON `data_source` (`org_id`);',1,'','2025-05-30 04:52:42'),(123,'create index UQE_data_source_org_id_name - v2','CREATE UNIQUE INDEX `UQE_data_source_org_id_name` ON `data_source` (`org_id`,`name`);',1,'','2025-05-30 04:52:42'),(124,'Drop old table data_source_v1 #2','DROP TABLE IF EXISTS `data_source_v1`',1,'','2025-05-30 04:52:42'),(125,'Add column with_credentials','alter table `data_source` ADD COLUMN `with_credentials` TINYINT(1) NOT NULL DEFAULT 0 ',1,'','2025-05-30 04:52:42'),(126,'Add secure json data column','alter table `data_source` ADD COLUMN `secure_json_data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-05-30 04:52:42'),(127,'Update data_source table charset','ALTER TABLE `data_source` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `type` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `access` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `url` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `password` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `user` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `database` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `basic_auth_user` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `basic_auth_password` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `json_data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `secure_json_data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ;',1,'','2025-05-30 04:52:42'),(128,'Update initial version to 1','UPDATE data_source SET version = 1 WHERE version = 0',1,'','2025-05-30 04:52:42'),(129,'Add read_only data column','alter table `data_source` ADD COLUMN `read_only` TINYINT(1) NULL ',1,'','2025-05-30 04:52:42'),(130,'Migrate logging ds to loki ds','UPDATE data_source SET type = \'loki\' WHERE type = \'logging\'',1,'','2025-05-30 04:52:42'),(131,'Update json_data with nulls','UPDATE data_source SET json_data = \'{}\' WHERE json_data is null',1,'','2025-05-30 04:52:42'),(132,'Add uid column','alter table `data_source` ADD COLUMN `uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 0 ',1,'','2025-05-30 04:52:42'),(133,'Update uid value','UPDATE data_source SET uid=lpad(id,9,\'0\');',1,'','2025-05-30 04:52:42'),(134,'Add unique index datasource_org_id_uid','CREATE UNIQUE INDEX `UQE_data_source_org_id_uid` ON `data_source` (`org_id`,`uid`);',1,'','2025-05-30 04:52:42'),(135,'add unique index datasource_org_id_is_default','CREATE INDEX `IDX_data_source_org_id_is_default` ON `data_source` (`org_id`,`is_default`);',1,'','2025-05-30 04:52:42'),(136,'Add is_prunable column','alter table `data_source` ADD COLUMN `is_prunable` TINYINT(1) NULL DEFAULT 0 ',1,'','2025-05-30 04:52:42'),(137,'Add api_version column','alter table `data_source` ADD COLUMN `api_version` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-05-30 04:52:42'),(138,'Update secure_json_data column to MediumText','ALTER TABLE data_source MODIFY COLUMN secure_json_data MEDIUMTEXT;',1,'','2025-05-30 04:52:42'),(139,'create api_key table','CREATE TABLE IF NOT EXISTS `api_key` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `account_id` BIGINT(20) NOT NULL\n, `name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `key` VARCHAR(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `role` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:42'),(140,'add index api_key.account_id','CREATE INDEX `IDX_api_key_account_id` ON `api_key` (`account_id`);',1,'','2025-05-30 04:52:42'),(141,'add index api_key.key','CREATE UNIQUE INDEX `UQE_api_key_key` ON `api_key` (`key`);',1,'','2025-05-30 04:52:42'),(142,'add index api_key.account_id_name','CREATE UNIQUE INDEX `UQE_api_key_account_id_name` ON `api_key` (`account_id`,`name`);',1,'','2025-05-30 04:52:42'),(143,'drop index IDX_api_key_account_id - v1','DROP INDEX `IDX_api_key_account_id` ON `api_key`',1,'','2025-05-30 04:52:42'),(144,'drop index UQE_api_key_key - v1','DROP INDEX `UQE_api_key_key` ON `api_key`',1,'','2025-05-30 04:52:42'),(145,'drop index UQE_api_key_account_id_name - v1','DROP INDEX `UQE_api_key_account_id_name` ON `api_key`',1,'','2025-05-30 04:52:42'),(146,'Rename table api_key to api_key_v1 - v1','ALTER TABLE `api_key` RENAME TO `api_key_v1`',1,'','2025-05-30 04:52:42'),(147,'create api_key table v2','CREATE TABLE IF NOT EXISTS `api_key` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `key` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `role` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:42'),(148,'create index IDX_api_key_org_id - v2','CREATE INDEX `IDX_api_key_org_id` ON `api_key` (`org_id`);',1,'','2025-05-30 04:52:42'),(149,'create index UQE_api_key_key - v2','CREATE UNIQUE INDEX `UQE_api_key_key` ON `api_key` (`key`);',1,'','2025-05-30 04:52:42'),(150,'create index UQE_api_key_org_id_name - v2','CREATE UNIQUE INDEX `UQE_api_key_org_id_name` ON `api_key` (`org_id`,`name`);',1,'','2025-05-30 04:52:42'),(151,'copy api_key v1 to v2','INSERT INTO `api_key` (`role`\n, `created`\n, `updated`\n, `id`\n, `org_id`\n, `name`\n, `key`) SELECT `role`\n, `created`\n, `updated`\n, `id`\n, `account_id`\n, `name`\n, `key` FROM `api_key_v1`',1,'','2025-05-30 04:52:42'),(152,'Drop old table api_key_v1','DROP TABLE IF EXISTS `api_key_v1`',1,'','2025-05-30 04:52:42'),(153,'Update api_key table charset','ALTER TABLE `api_key` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `key` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `role` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;',1,'','2025-05-30 04:52:42'),(154,'Add expires to api_key table','alter table `api_key` ADD COLUMN `expires` BIGINT(20) NULL ',1,'','2025-05-30 04:52:42'),(155,'Add service account foreign key','alter table `api_key` ADD COLUMN `service_account_id` BIGINT(20) NULL ',1,'','2025-05-30 04:52:42'),(156,'set service account foreign key to nil if 0','UPDATE api_key SET service_account_id = NULL WHERE service_account_id = 0;',1,'','2025-05-30 04:52:42'),(157,'Add last_used_at to api_key table','alter table `api_key` ADD COLUMN `last_used_at` DATETIME NULL ',1,'','2025-05-30 04:52:42'),(158,'Add is_revoked column to api_key table','alter table `api_key` ADD COLUMN `is_revoked` TINYINT(1) NULL DEFAULT 0 ',1,'','2025-05-30 04:52:42'),(159,'create dashboard_snapshot table v4','CREATE TABLE IF NOT EXISTS `dashboard_snapshot` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `key` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `dashboard` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `expires` DATETIME NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:42'),(160,'drop table dashboard_snapshot_v4 #1','DROP TABLE IF EXISTS `dashboard_snapshot`',1,'','2025-05-30 04:52:42'),(161,'create dashboard_snapshot table v5 #2','CREATE TABLE IF NOT EXISTS `dashboard_snapshot` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `key` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `delete_key` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `user_id` BIGINT(20) NOT NULL\n, `external` TINYINT(1) NOT NULL\n, `external_url` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `dashboard` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `expires` DATETIME NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:42'),(162,'create index UQE_dashboard_snapshot_key - v5','CREATE UNIQUE INDEX `UQE_dashboard_snapshot_key` ON `dashboard_snapshot` (`key`);',1,'','2025-05-30 04:52:42'),(163,'create index UQE_dashboard_snapshot_delete_key - v5','CREATE UNIQUE INDEX `UQE_dashboard_snapshot_delete_key` ON `dashboard_snapshot` (`delete_key`);',1,'','2025-05-30 04:52:42'),(164,'create index IDX_dashboard_snapshot_user_id - v5','CREATE INDEX `IDX_dashboard_snapshot_user_id` ON `dashboard_snapshot` (`user_id`);',1,'','2025-05-30 04:52:42'),(165,'alter dashboard_snapshot to mediumtext v2','ALTER TABLE dashboard_snapshot MODIFY dashboard MEDIUMTEXT;',1,'','2025-05-30 04:52:42'),(166,'Update dashboard_snapshot table charset','ALTER TABLE `dashboard_snapshot` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `key` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `delete_key` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `external_url` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `dashboard` MEDIUMTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;',1,'','2025-05-30 04:52:42'),(167,'Add column external_delete_url to dashboard_snapshots table','alter table `dashboard_snapshot` ADD COLUMN `external_delete_url` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-05-30 04:52:42'),(168,'Add encrypted dashboard json column','alter table `dashboard_snapshot` ADD COLUMN `dashboard_encrypted` BLOB NULL ',1,'','2025-05-30 04:52:42'),(169,'Change dashboard_encrypted column to MEDIUMBLOB','ALTER TABLE dashboard_snapshot MODIFY dashboard_encrypted MEDIUMBLOB;',1,'','2025-05-30 04:52:42'),(170,'create quota table v1','CREATE TABLE IF NOT EXISTS `quota` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NULL\n, `user_id` BIGINT(20) NULL\n, `target` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `limit` BIGINT(20) NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:42'),(171,'create index UQE_quota_org_id_user_id_target - v1','CREATE UNIQUE INDEX `UQE_quota_org_id_user_id_target` ON `quota` (`org_id`,`user_id`,`target`);',1,'','2025-05-30 04:52:42'),(172,'Update quota table charset','ALTER TABLE `quota` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `target` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;',1,'','2025-05-30 04:52:42'),(173,'create plugin_setting table','CREATE TABLE IF NOT EXISTS `plugin_setting` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NULL\n, `plugin_id` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `enabled` TINYINT(1) NOT NULL\n, `pinned` TINYINT(1) NOT NULL\n, `json_data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `secure_json_data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:42'),(174,'create index UQE_plugin_setting_org_id_plugin_id - v1','CREATE UNIQUE INDEX `UQE_plugin_setting_org_id_plugin_id` ON `plugin_setting` (`org_id`,`plugin_id`);',1,'','2025-05-30 04:52:42'),(175,'Add column plugin_version to plugin_settings','alter table `plugin_setting` ADD COLUMN `plugin_version` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-05-30 04:52:42'),(176,'Update plugin_setting table charset','ALTER TABLE `plugin_setting` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `plugin_id` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `json_data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `secure_json_data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `plugin_version` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ;',1,'','2025-05-30 04:52:42'),(177,'update NULL org_id to 1','UPDATE plugin_setting SET org_id=1 where org_id IS NULL;',1,'','2025-05-30 04:52:42'),(178,'make org_id NOT NULL and DEFAULT VALUE 1','ALTER TABLE plugin_setting MODIFY COLUMN org_id BIGINT NOT NULL DEFAULT 1;',1,'','2025-05-30 04:52:42'),(179,'create session table','CREATE TABLE IF NOT EXISTS `session` (\n`key` CHAR(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci PRIMARY KEY NOT NULL\n, `data` BLOB NOT NULL\n, `expiry` INTEGER(255) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:42'),(180,'Drop old table playlist table','DROP TABLE IF EXISTS `playlist`',1,'','2025-05-30 04:52:42'),(181,'Drop old table playlist_item table','DROP TABLE IF EXISTS `playlist_item`',1,'','2025-05-30 04:52:42'),(182,'create playlist table v2','CREATE TABLE IF NOT EXISTS `playlist` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `interval` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:42'),(183,'create playlist item table v2','CREATE TABLE IF NOT EXISTS `playlist_item` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `playlist_id` BIGINT(20) NOT NULL\n, `type` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `value` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `title` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `order` INT NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:42'),(184,'Update playlist table charset','ALTER TABLE `playlist` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `interval` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;',1,'','2025-05-30 04:52:42'),(185,'Update playlist_item table charset','ALTER TABLE `playlist_item` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `type` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `value` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `title` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;',1,'','2025-05-30 04:52:42'),(186,'Add playlist column created_at','alter table `playlist` ADD COLUMN `created_at` BIGINT(20) NOT NULL DEFAULT 0 ',1,'','2025-05-30 04:52:42'),(187,'Add playlist column updated_at','alter table `playlist` ADD COLUMN `updated_at` BIGINT(20) NOT NULL DEFAULT 0 ',1,'','2025-05-30 04:52:42'),(188,'drop preferences table v2','DROP TABLE IF EXISTS `preferences`',1,'','2025-05-30 04:52:42'),(189,'drop preferences table v3','DROP TABLE IF EXISTS `preferences`',1,'','2025-05-30 04:52:42'),(190,'create preferences table v3','CREATE TABLE IF NOT EXISTS `preferences` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `user_id` BIGINT(20) NOT NULL\n, `version` INT NOT NULL\n, `home_dashboard_id` BIGINT(20) NOT NULL\n, `timezone` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `theme` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:42'),(191,'Update preferences table charset','ALTER TABLE `preferences` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `timezone` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `theme` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;',1,'','2025-05-30 04:52:42'),(192,'Add column team_id in preferences','alter table `preferences` ADD COLUMN `team_id` BIGINT(20) NULL ',1,'','2025-05-30 04:52:42'),(193,'Update team_id column values in preferences','UPDATE preferences SET team_id=0 WHERE team_id IS NULL;',1,'','2025-05-30 04:52:42'),(194,'Add column week_start in preferences','alter table `preferences` ADD COLUMN `week_start` VARCHAR(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-05-30 04:52:42'),(195,'Add column preferences.json_data','alter table `preferences` ADD COLUMN `json_data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-05-30 04:52:42'),(196,'alter preferences.json_data to mediumtext v1','ALTER TABLE preferences MODIFY json_data MEDIUMTEXT;',1,'','2025-05-30 04:52:42'),(197,'Add preferences index org_id','CREATE INDEX `IDX_preferences_org_id` ON `preferences` (`org_id`);',1,'','2025-05-30 04:52:42'),(198,'Add preferences index user_id','CREATE INDEX `IDX_preferences_user_id` ON `preferences` (`user_id`);',1,'','2025-05-30 04:52:42'),(199,'create alert table v1','CREATE TABLE IF NOT EXISTS `alert` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `version` BIGINT(20) NOT NULL\n, `dashboard_id` BIGINT(20) NOT NULL\n, `panel_id` BIGINT(20) NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `message` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `state` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `settings` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `frequency` BIGINT(20) NOT NULL\n, `handler` BIGINT(20) NOT NULL\n, `severity` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `silenced` TINYINT(1) NOT NULL\n, `execution_error` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `eval_data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `eval_date` DATETIME NULL\n, `new_state_date` DATETIME NOT NULL\n, `state_changes` INT NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:42'),(200,'add index alert org_id & id ','CREATE INDEX `IDX_alert_org_id_id` ON `alert` (`org_id`,`id`);',1,'','2025-05-30 04:52:43'),(201,'add index alert state','CREATE INDEX `IDX_alert_state` ON `alert` (`state`);',1,'','2025-05-30 04:52:43'),(202,'add index alert dashboard_id','CREATE INDEX `IDX_alert_dashboard_id` ON `alert` (`dashboard_id`);',1,'','2025-05-30 04:52:43'),(203,'Create alert_rule_tag table v1','CREATE TABLE IF NOT EXISTS `alert_rule_tag` (\n`alert_id` BIGINT(20) NOT NULL\n, `tag_id` BIGINT(20) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:43'),(204,'Add unique index alert_rule_tag.alert_id_tag_id','CREATE UNIQUE INDEX `UQE_alert_rule_tag_alert_id_tag_id` ON `alert_rule_tag` (`alert_id`,`tag_id`);',1,'','2025-05-30 04:52:43'),(205,'drop index UQE_alert_rule_tag_alert_id_tag_id - v1','DROP INDEX `UQE_alert_rule_tag_alert_id_tag_id` ON `alert_rule_tag`',1,'','2025-05-30 04:52:43'),(206,'Rename table alert_rule_tag to alert_rule_tag_v1 - v1','ALTER TABLE `alert_rule_tag` RENAME TO `alert_rule_tag_v1`',1,'','2025-05-30 04:52:43'),(207,'Create alert_rule_tag table v2','CREATE TABLE IF NOT EXISTS `alert_rule_tag` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `alert_id` BIGINT(20) NOT NULL\n, `tag_id` BIGINT(20) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:43'),(208,'create index UQE_alert_rule_tag_alert_id_tag_id - Add unique index alert_rule_tag.alert_id_tag_id V2','CREATE UNIQUE INDEX `UQE_alert_rule_tag_alert_id_tag_id` ON `alert_rule_tag` (`alert_id`,`tag_id`);',1,'','2025-05-30 04:52:43'),(209,'copy alert_rule_tag v1 to v2','INSERT INTO `alert_rule_tag` (`alert_id`\n, `tag_id`) SELECT `alert_id`\n, `tag_id` FROM `alert_rule_tag_v1`',1,'','2025-05-30 04:52:43'),(210,'drop table alert_rule_tag_v1','DROP TABLE IF EXISTS `alert_rule_tag_v1`',1,'','2025-05-30 04:52:43'),(211,'create alert_notification table v1','CREATE TABLE IF NOT EXISTS `alert_notification` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `type` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `settings` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:43'),(212,'Add column is_default','alter table `alert_notification` ADD COLUMN `is_default` TINYINT(1) NOT NULL DEFAULT 0 ',1,'','2025-05-30 04:52:43'),(213,'Add column frequency','alter table `alert_notification` ADD COLUMN `frequency` BIGINT(20) NULL ',1,'','2025-05-30 04:52:43'),(214,'Add column send_reminder','alter table `alert_notification` ADD COLUMN `send_reminder` TINYINT(1) NULL DEFAULT 0 ',1,'','2025-05-30 04:52:43'),(215,'Add column disable_resolve_message','alter table `alert_notification` ADD COLUMN `disable_resolve_message` TINYINT(1) NOT NULL DEFAULT 0 ',1,'','2025-05-30 04:52:43'),(216,'add index alert_notification org_id & name','CREATE UNIQUE INDEX `UQE_alert_notification_org_id_name` ON `alert_notification` (`org_id`,`name`);',1,'','2025-05-30 04:52:43'),(217,'Update alert table charset','ALTER TABLE `alert` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `message` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `state` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `settings` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `severity` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `execution_error` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `eval_data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ;',1,'','2025-05-30 04:52:43'),(218,'Update alert_notification table charset','ALTER TABLE `alert_notification` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `type` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `settings` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;',1,'','2025-05-30 04:52:43'),(219,'create notification_journal table v1','CREATE TABLE IF NOT EXISTS `alert_notification_journal` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `alert_id` BIGINT(20) NOT NULL\n, `notifier_id` BIGINT(20) NOT NULL\n, `sent_at` BIGINT(20) NOT NULL\n, `success` TINYINT(1) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:43'),(220,'add index notification_journal org_id & alert_id & notifier_id','CREATE INDEX `IDX_alert_notification_journal_org_id_alert_id_notifier_id` ON `alert_notification_journal` (`org_id`,`alert_id`,`notifier_id`);',1,'','2025-05-30 04:52:43'),(221,'drop alert_notification_journal','DROP TABLE IF EXISTS `alert_notification_journal`',1,'','2025-05-30 04:52:43'),(222,'create alert_notification_state table v1','CREATE TABLE IF NOT EXISTS `alert_notification_state` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `alert_id` BIGINT(20) NOT NULL\n, `notifier_id` BIGINT(20) NOT NULL\n, `state` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `version` BIGINT(20) NOT NULL\n, `updated_at` BIGINT(20) NOT NULL\n, `alert_rule_state_updated_version` BIGINT(20) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:43'),(223,'add index alert_notification_state org_id & alert_id & notifier_id','CREATE UNIQUE INDEX `UQE_alert_notification_state_org_id_alert_id_notifier_id` ON `alert_notification_state` (`org_id`,`alert_id`,`notifier_id`);',1,'','2025-05-30 04:52:43'),(224,'Add for to alert table','alter table `alert` ADD COLUMN `for` BIGINT(20) NULL ',1,'','2025-05-30 04:52:43'),(225,'Add column uid in alert_notification','alter table `alert_notification` ADD COLUMN `uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-05-30 04:52:43'),(226,'Update uid column values in alert_notification','UPDATE alert_notification SET uid=lpad(id,9,\'0\') WHERE uid IS NULL;',1,'','2025-05-30 04:52:43'),(227,'Add unique index alert_notification_org_id_uid','CREATE UNIQUE INDEX `UQE_alert_notification_org_id_uid` ON `alert_notification` (`org_id`,`uid`);',1,'','2025-05-30 04:52:43'),(228,'Remove unique index org_id_name','DROP INDEX `UQE_alert_notification_org_id_name` ON `alert_notification`',1,'','2025-05-30 04:52:43'),(229,'Add column secure_settings in alert_notification','alter table `alert_notification` ADD COLUMN `secure_settings` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-05-30 04:52:43'),(230,'alter alert.settings to mediumtext','ALTER TABLE alert MODIFY settings MEDIUMTEXT;',1,'','2025-05-30 04:52:43'),(231,'Add non-unique index alert_notification_state_alert_id','CREATE INDEX `IDX_alert_notification_state_alert_id` ON `alert_notification_state` (`alert_id`);',1,'','2025-05-30 04:52:43'),(232,'Add non-unique index alert_rule_tag_alert_id','CREATE INDEX `IDX_alert_rule_tag_alert_id` ON `alert_rule_tag` (`alert_id`);',1,'','2025-05-30 04:52:43'),(233,'Drop old annotation table v4','DROP TABLE IF EXISTS `annotation`',1,'','2025-05-30 04:52:43'),(234,'create annotation table v5','CREATE TABLE IF NOT EXISTS `annotation` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `alert_id` BIGINT(20) NULL\n, `user_id` BIGINT(20) NULL\n, `dashboard_id` BIGINT(20) NULL\n, `panel_id` BIGINT(20) NULL\n, `category_id` BIGINT(20) NULL\n, `type` VARCHAR(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `title` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `text` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `metric` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `prev_state` VARCHAR(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `new_state` VARCHAR(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `epoch` BIGINT(20) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:43'),(235,'add index annotation 0 v3','CREATE INDEX `IDX_annotation_org_id_alert_id` ON `annotation` (`org_id`,`alert_id`);',1,'','2025-05-30 04:52:43'),(236,'add index annotation 1 v3','CREATE INDEX `IDX_annotation_org_id_type` ON `annotation` (`org_id`,`type`);',1,'','2025-05-30 04:52:43'),(237,'add index annotation 2 v3','CREATE INDEX `IDX_annotation_org_id_category_id` ON `annotation` (`org_id`,`category_id`);',1,'','2025-05-30 04:52:43'),(238,'add index annotation 3 v3','CREATE INDEX `IDX_annotation_org_id_dashboard_id_panel_id_epoch` ON `annotation` (`org_id`,`dashboard_id`,`panel_id`,`epoch`);',1,'','2025-05-30 04:52:43'),(239,'add index annotation 4 v3','CREATE INDEX `IDX_annotation_org_id_epoch` ON `annotation` (`org_id`,`epoch`);',1,'','2025-05-30 04:52:43'),(240,'Update annotation table charset','ALTER TABLE `annotation` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `type` VARCHAR(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `title` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `text` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `metric` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL , MODIFY `prev_state` VARCHAR(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `new_state` VARCHAR(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL , MODIFY `data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;',1,'','2025-05-30 04:52:43'),(241,'Add column region_id to annotation table','alter table `annotation` ADD COLUMN `region_id` BIGINT(20) NULL DEFAULT 0 ',1,'','2025-05-30 04:52:43'),(242,'Drop category_id index','DROP INDEX `IDX_annotation_org_id_category_id` ON `annotation`',1,'','2025-05-30 04:52:43'),(243,'Add column tags to annotation table','alter table `annotation` ADD COLUMN `tags` VARCHAR(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-05-30 04:52:43'),(244,'Create annotation_tag table v2','CREATE TABLE IF NOT EXISTS `annotation_tag` (\n`annotation_id` BIGINT(20) NOT NULL\n, `tag_id` BIGINT(20) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:43'),(245,'Add unique index annotation_tag.annotation_id_tag_id','CREATE UNIQUE INDEX `UQE_annotation_tag_annotation_id_tag_id` ON `annotation_tag` (`annotation_id`,`tag_id`);',1,'','2025-05-30 04:52:43'),(246,'drop index UQE_annotation_tag_annotation_id_tag_id - v2','DROP INDEX `UQE_annotation_tag_annotation_id_tag_id` ON `annotation_tag`',1,'','2025-05-30 04:52:43'),(247,'Rename table annotation_tag to annotation_tag_v2 - v2','ALTER TABLE `annotation_tag` RENAME TO `annotation_tag_v2`',1,'','2025-05-30 04:52:43'),(248,'Create annotation_tag table v3','CREATE TABLE IF NOT EXISTS `annotation_tag` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `annotation_id` BIGINT(20) NOT NULL\n, `tag_id` BIGINT(20) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:43'),(249,'create index UQE_annotation_tag_annotation_id_tag_id - Add unique index annotation_tag.annotation_id_tag_id V3','CREATE UNIQUE INDEX `UQE_annotation_tag_annotation_id_tag_id` ON `annotation_tag` (`annotation_id`,`tag_id`);',1,'','2025-05-30 04:52:43'),(250,'copy annotation_tag v2 to v3','INSERT INTO `annotation_tag` (`annotation_id`\n, `tag_id`) SELECT `annotation_id`\n, `tag_id` FROM `annotation_tag_v2`',1,'','2025-05-30 04:52:43'),(251,'drop table annotation_tag_v2','DROP TABLE IF EXISTS `annotation_tag_v2`',1,'','2025-05-30 04:52:43'),(252,'Update alert annotations and set TEXT to empty','UPDATE annotation SET TEXT = \'\' WHERE alert_id > 0',1,'','2025-05-30 04:52:43'),(253,'Add created time to annotation table','alter table `annotation` ADD COLUMN `created` BIGINT(20) NULL DEFAULT 0 ',1,'','2025-05-30 04:52:43'),(254,'Add updated time to annotation table','alter table `annotation` ADD COLUMN `updated` BIGINT(20) NULL DEFAULT 0 ',1,'','2025-05-30 04:52:43'),(255,'Add index for created in annotation table','CREATE INDEX `IDX_annotation_org_id_created` ON `annotation` (`org_id`,`created`);',1,'','2025-05-30 04:52:43'),(256,'Add index for updated in annotation table','CREATE INDEX `IDX_annotation_org_id_updated` ON `annotation` (`org_id`,`updated`);',1,'','2025-05-30 04:52:43'),(257,'Convert existing annotations from seconds to milliseconds','UPDATE annotation SET epoch = (epoch*1000) where epoch < 9999999999',1,'','2025-05-30 04:52:43'),(258,'Add epoch_end column','alter table `annotation` ADD COLUMN `epoch_end` BIGINT(20) NOT NULL DEFAULT 0 ',1,'','2025-05-30 04:52:43'),(259,'Add index for epoch_end','CREATE INDEX `IDX_annotation_org_id_epoch_epoch_end` ON `annotation` (`org_id`,`epoch`,`epoch_end`);',1,'','2025-05-30 04:52:43'),(260,'Make epoch_end the same as epoch','UPDATE annotation SET epoch_end = epoch',1,'','2025-05-30 04:52:43'),(261,'Move region to single row','code migration',1,'','2025-05-30 04:52:43'),(262,'Remove index org_id_epoch from annotation table','DROP INDEX `IDX_annotation_org_id_epoch` ON `annotation`',1,'','2025-05-30 04:52:43'),(263,'Remove index org_id_dashboard_id_panel_id_epoch from annotation table','DROP INDEX `IDX_annotation_org_id_dashboard_id_panel_id_epoch` ON `annotation`',1,'','2025-05-30 04:52:43'),(264,'Add index for org_id_dashboard_id_epoch_end_epoch on annotation table','CREATE INDEX `IDX_annotation_org_id_dashboard_id_epoch_end_epoch` ON `annotation` (`org_id`,`dashboard_id`,`epoch_end`,`epoch`);',1,'','2025-05-30 04:52:43'),(265,'Add index for org_id_epoch_end_epoch on annotation table','CREATE INDEX `IDX_annotation_org_id_epoch_end_epoch` ON `annotation` (`org_id`,`epoch_end`,`epoch`);',1,'','2025-05-30 04:52:43'),(266,'Remove index org_id_epoch_epoch_end from annotation table','DROP INDEX `IDX_annotation_org_id_epoch_epoch_end` ON `annotation`',1,'','2025-05-30 04:52:43'),(267,'Add index for alert_id on annotation table','CREATE INDEX `IDX_annotation_alert_id` ON `annotation` (`alert_id`);',1,'','2025-05-30 04:52:43'),(268,'Increase tags column to length 4096','ALTER TABLE annotation MODIFY tags VARCHAR(4096);',1,'','2025-05-30 04:52:43'),(269,'Increase prev_state column to length 40 not null','ALTER TABLE annotation MODIFY prev_state VARCHAR(40) NOT NULL;',1,'','2025-05-30 04:52:43'),(270,'Increase new_state column to length 40 not null','ALTER TABLE annotation MODIFY new_state VARCHAR(40) NOT NULL;',1,'','2025-05-30 04:52:43'),(271,'create test_data table','CREATE TABLE IF NOT EXISTS `test_data` (\n`id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `metric1` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `metric2` VARCHAR(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `value_big_int` BIGINT(20) NULL\n, `value_double` DOUBLE NULL\n, `value_float` FLOAT NULL\n, `value_int` INT NULL\n, `time_epoch` BIGINT(20) NOT NULL\n, `time_date_time` DATETIME NOT NULL\n, `time_time_stamp` TIMESTAMP NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:43'),(272,'create dashboard_version table v1','CREATE TABLE IF NOT EXISTS `dashboard_version` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `dashboard_id` BIGINT(20) NOT NULL\n, `parent_version` INT NOT NULL\n, `restored_from` INT NOT NULL\n, `version` INT NOT NULL\n, `created` DATETIME NOT NULL\n, `created_by` BIGINT(20) NOT NULL\n, `message` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:43'),(273,'add index dashboard_version.dashboard_id','CREATE INDEX `IDX_dashboard_version_dashboard_id` ON `dashboard_version` (`dashboard_id`);',1,'','2025-05-30 04:52:43'),(274,'add unique index dashboard_version.dashboard_id and dashboard_version.version','CREATE UNIQUE INDEX `UQE_dashboard_version_dashboard_id_version` ON `dashboard_version` (`dashboard_id`,`version`);',1,'','2025-05-30 04:52:43'),(275,'Set dashboard version to 1 where 0','UPDATE dashboard SET version = 1 WHERE version = 0',1,'','2025-05-30 04:52:43'),(276,'save existing dashboard data in dashboard_version table v1','INSERT INTO dashboard_version\n(\n	dashboard_id,\n	version,\n	parent_version,\n	restored_from,\n	created,\n	created_by,\n	message,\n	data\n)\nSELECT\n	dashboard.id,\n	dashboard.version,\n	dashboard.version,\n	dashboard.version,\n	dashboard.updated,\n	COALESCE(dashboard.updated_by, -1),\n	\'\',\n	dashboard.data\nFROM dashboard;',1,'','2025-05-30 04:52:43'),(277,'alter dashboard_version.data to mediumtext v1','ALTER TABLE dashboard_version MODIFY data MEDIUMTEXT;',1,'','2025-05-30 04:52:43'),(278,'Add apiVersion for dashboard_version','alter table `dashboard_version` ADD COLUMN `api_version` VARCHAR(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-05-30 04:52:43'),(279,'create team table','CREATE TABLE IF NOT EXISTS `team` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:43'),(280,'add index team.org_id','CREATE INDEX `IDX_team_org_id` ON `team` (`org_id`);',1,'','2025-05-30 04:52:43'),(281,'add unique index team_org_id_name','CREATE UNIQUE INDEX `UQE_team_org_id_name` ON `team` (`org_id`,`name`);',1,'','2025-05-30 04:52:43'),(282,'Add column uid in team','alter table `team` ADD COLUMN `uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-05-30 04:52:43'),(283,'Update uid column values in team','UPDATE team SET uid=concat(\'t\',lpad(id,9,\'0\')) WHERE uid IS NULL;',1,'','2025-05-30 04:52:43'),(284,'Add unique index team_org_id_uid','CREATE UNIQUE INDEX `UQE_team_org_id_uid` ON `team` (`org_id`,`uid`);',1,'','2025-05-30 04:52:43'),(285,'Add column external_uid in team','alter table `team` ADD COLUMN `external_uid` VARCHAR(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-05-30 04:52:43'),(286,'Add column is_provisioned in team','alter table `team` ADD COLUMN `is_provisioned` TINYINT(1) NULL ',1,'','2025-05-30 04:52:43'),(287,'create team member table','CREATE TABLE IF NOT EXISTS `team_member` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `team_id` BIGINT(20) NOT NULL\n, `user_id` BIGINT(20) NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:43'),(288,'add index team_member.org_id','CREATE INDEX `IDX_team_member_org_id` ON `team_member` (`org_id`);',1,'','2025-05-30 04:52:43'),(289,'add unique index team_member_org_id_team_id_user_id','CREATE UNIQUE INDEX `UQE_team_member_org_id_team_id_user_id` ON `team_member` (`org_id`,`team_id`,`user_id`);',1,'','2025-05-30 04:52:43'),(290,'add index team_member.team_id','CREATE INDEX `IDX_team_member_team_id` ON `team_member` (`team_id`);',1,'','2025-05-30 04:52:43'),(291,'Add column email to team table','alter table `team` ADD COLUMN `email` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-05-30 04:52:43'),(292,'Add column external to team_member table','alter table `team_member` ADD COLUMN `external` TINYINT(1) NULL ',1,'','2025-05-30 04:52:44'),(293,'Add column permission to team_member table','alter table `team_member` ADD COLUMN `permission` SMALLINT NULL ',1,'','2025-05-30 04:52:44'),(294,'add unique index team_member_user_id_org_id','CREATE INDEX `IDX_team_member_user_id_org_id` ON `team_member` (`user_id`,`org_id`);',1,'','2025-05-30 04:52:44'),(295,'create dashboard acl table','CREATE TABLE IF NOT EXISTS `dashboard_acl` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `dashboard_id` BIGINT(20) NOT NULL\n, `user_id` BIGINT(20) NULL\n, `team_id` BIGINT(20) NULL\n, `permission` SMALLINT NOT NULL DEFAULT 4\n, `role` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:44'),(296,'add index dashboard_acl_dashboard_id','CREATE INDEX `IDX_dashboard_acl_dashboard_id` ON `dashboard_acl` (`dashboard_id`);',1,'','2025-05-30 04:52:44'),(297,'add unique index dashboard_acl_dashboard_id_user_id','CREATE UNIQUE INDEX `UQE_dashboard_acl_dashboard_id_user_id` ON `dashboard_acl` (`dashboard_id`,`user_id`);',1,'','2025-05-30 04:52:44'),(298,'add unique index dashboard_acl_dashboard_id_team_id','CREATE UNIQUE INDEX `UQE_dashboard_acl_dashboard_id_team_id` ON `dashboard_acl` (`dashboard_id`,`team_id`);',1,'','2025-05-30 04:52:44'),(299,'add index dashboard_acl_user_id','CREATE INDEX `IDX_dashboard_acl_user_id` ON `dashboard_acl` (`user_id`);',1,'','2025-05-30 04:52:44'),(300,'add index dashboard_acl_team_id','CREATE INDEX `IDX_dashboard_acl_team_id` ON `dashboard_acl` (`team_id`);',1,'','2025-05-30 04:52:44'),(301,'add index dashboard_acl_org_id_role','CREATE INDEX `IDX_dashboard_acl_org_id_role` ON `dashboard_acl` (`org_id`,`role`);',1,'','2025-05-30 04:52:44'),(302,'add index dashboard_permission','CREATE INDEX `IDX_dashboard_acl_permission` ON `dashboard_acl` (`permission`);',1,'','2025-05-30 04:52:44'),(303,'save default acl rules in dashboard_acl table','\nINSERT INTO dashboard_acl\n	(\n		org_id,\n		dashboard_id,\n		permission,\n		role,\n		created,\n		updated\n	)\n	VALUES\n		(-1,-1, 1,\'Viewer\',\'2017-06-20\',\'2017-06-20\'),\n		(-1,-1, 2,\'Editor\',\'2017-06-20\',\'2017-06-20\')\n	',1,'','2025-05-30 04:52:44'),(304,'delete acl rules for deleted dashboards and folders','DELETE FROM dashboard_acl WHERE dashboard_id NOT IN (SELECT id FROM dashboard) AND dashboard_id != -1',1,'','2025-05-30 04:52:44'),(305,'create tag table','CREATE TABLE IF NOT EXISTS `tag` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `key` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `value` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:44'),(306,'add index tag.key_value','CREATE UNIQUE INDEX `UQE_tag_key_value` ON `tag` (`key`,`value`);',1,'','2025-05-30 04:52:44'),(307,'create login attempt table','CREATE TABLE IF NOT EXISTS `login_attempt` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `username` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `ip_address` VARCHAR(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:44'),(308,'add index login_attempt.username','CREATE INDEX `IDX_login_attempt_username` ON `login_attempt` (`username`);',1,'','2025-05-30 04:52:44'),(309,'drop index IDX_login_attempt_username - v1','DROP INDEX `IDX_login_attempt_username` ON `login_attempt`',1,'','2025-05-30 04:52:44'),(310,'Rename table login_attempt to login_attempt_tmp_qwerty - v1','ALTER TABLE `login_attempt` RENAME TO `login_attempt_tmp_qwerty`',1,'','2025-05-30 04:52:44'),(311,'create login_attempt v2','CREATE TABLE IF NOT EXISTS `login_attempt` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `username` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `ip_address` VARCHAR(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` INT NOT NULL DEFAULT 0\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:44'),(312,'create index IDX_login_attempt_username - v2','CREATE INDEX `IDX_login_attempt_username` ON `login_attempt` (`username`);',1,'','2025-05-30 04:52:44'),(313,'copy login_attempt v1 to v2','INSERT INTO `login_attempt` (`id`\n, `username`\n, `ip_address`) SELECT `id`\n, `username`\n, `ip_address` FROM `login_attempt_tmp_qwerty`',1,'','2025-05-30 04:52:44'),(314,'drop login_attempt_tmp_qwerty','DROP TABLE IF EXISTS `login_attempt_tmp_qwerty`',1,'','2025-05-30 04:52:44'),(315,'create user auth table','CREATE TABLE IF NOT EXISTS `user_auth` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `user_id` BIGINT(20) NOT NULL\n, `auth_module` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `auth_id` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:44'),(316,'create index IDX_user_auth_auth_module_auth_id - v1','CREATE INDEX `IDX_user_auth_auth_module_auth_id` ON `user_auth` (`auth_module`,`auth_id`);',1,'','2025-05-30 04:52:44'),(317,'alter user_auth.auth_id to length 190','ALTER TABLE user_auth MODIFY auth_id VARCHAR(190);',1,'','2025-05-30 04:52:44'),(318,'Add OAuth access token to user_auth','alter table `user_auth` ADD COLUMN `o_auth_access_token` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-05-30 04:52:44'),(319,'Add OAuth refresh token to user_auth','alter table `user_auth` ADD COLUMN `o_auth_refresh_token` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-05-30 04:52:44'),(320,'Add OAuth token type to user_auth','alter table `user_auth` ADD COLUMN `o_auth_token_type` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-05-30 04:52:44'),(321,'Add OAuth expiry to user_auth','alter table `user_auth` ADD COLUMN `o_auth_expiry` DATETIME NULL ',1,'','2025-05-30 04:52:44'),(322,'Add index to user_id column in user_auth','CREATE INDEX `IDX_user_auth_user_id` ON `user_auth` (`user_id`);',1,'','2025-05-30 04:52:44'),(323,'Add OAuth ID token to user_auth','alter table `user_auth` ADD COLUMN `o_auth_id_token` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-05-30 04:52:44'),(324,'Add user_unique_id to user_auth','alter table `user_auth` ADD COLUMN `external_uid` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-05-30 04:52:44'),(325,'create server_lock table','CREATE TABLE IF NOT EXISTS `server_lock` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `operation_uid` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `version` BIGINT(20) NOT NULL\n, `last_execution` BIGINT(20) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:44'),(326,'add index server_lock.operation_uid','CREATE UNIQUE INDEX `UQE_server_lock_operation_uid` ON `server_lock` (`operation_uid`);',1,'','2025-05-30 04:52:44'),(327,'create user auth token table','CREATE TABLE IF NOT EXISTS `user_auth_token` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `user_id` BIGINT(20) NOT NULL\n, `auth_token` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `prev_auth_token` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `user_agent` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `client_ip` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `auth_token_seen` TINYINT(1) NOT NULL\n, `seen_at` INT NULL\n, `rotated_at` INT NOT NULL\n, `created_at` INT NOT NULL\n, `updated_at` INT NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:44'),(328,'add unique index user_auth_token.auth_token','CREATE UNIQUE INDEX `UQE_user_auth_token_auth_token` ON `user_auth_token` (`auth_token`);',1,'','2025-05-30 04:52:44'),(329,'add unique index user_auth_token.prev_auth_token','CREATE UNIQUE INDEX `UQE_user_auth_token_prev_auth_token` ON `user_auth_token` (`prev_auth_token`);',1,'','2025-05-30 04:52:44'),(330,'add index user_auth_token.user_id','CREATE INDEX `IDX_user_auth_token_user_id` ON `user_auth_token` (`user_id`);',1,'','2025-05-30 04:52:44'),(331,'Add revoked_at to the user auth token','alter table `user_auth_token` ADD COLUMN `revoked_at` INT NULL ',1,'','2025-05-30 04:52:44'),(332,'add index user_auth_token.revoked_at','CREATE INDEX `IDX_user_auth_token_revoked_at` ON `user_auth_token` (`revoked_at`);',1,'','2025-05-30 04:52:44'),(333,'add external_session_id to user_auth_token','alter table `user_auth_token` ADD COLUMN `external_session_id` BIGINT(20) NULL ',1,'','2025-05-30 04:52:44'),(334,'create cache_data table','CREATE TABLE IF NOT EXISTS `cache_data` (\n`cache_key` VARCHAR(168) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci PRIMARY KEY NOT NULL\n, `data` BLOB NOT NULL\n, `expires` INTEGER(255) NOT NULL\n, `created_at` INTEGER(255) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:44'),(335,'add unique index cache_data.cache_key','CREATE UNIQUE INDEX `UQE_cache_data_cache_key` ON `cache_data` (`cache_key`);',1,'','2025-05-30 04:52:44'),(336,'create short_url table v1','CREATE TABLE IF NOT EXISTS `short_url` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `path` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created_by` INT NOT NULL\n, `created_at` INT NOT NULL\n, `last_seen_at` INT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:44'),(337,'add index short_url.org_id-uid','CREATE UNIQUE INDEX `UQE_short_url_org_id_uid` ON `short_url` (`org_id`,`uid`);',1,'','2025-05-30 04:52:44'),(338,'alter table short_url alter column created_by type to bigint','ALTER TABLE short_url MODIFY created_by BIGINT;',1,'','2025-05-30 04:52:44'),(339,'delete alert_definition table','DROP TABLE IF EXISTS `alert_definition`',1,'','2025-05-30 04:52:44'),(340,'recreate alert_definition table','CREATE TABLE IF NOT EXISTS `alert_definition` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `title` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `condition` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `updated` DATETIME NOT NULL\n, `interval_seconds` BIGINT(20) NOT NULL DEFAULT 60\n, `version` INT NOT NULL DEFAULT 0\n, `uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 0\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:44'),(341,'add index in alert_definition on org_id and title columns','CREATE INDEX `IDX_alert_definition_org_id_title` ON `alert_definition` (`org_id`,`title`);',1,'','2025-05-30 04:52:44'),(342,'add index in alert_definition on org_id and uid columns','CREATE INDEX `IDX_alert_definition_org_id_uid` ON `alert_definition` (`org_id`,`uid`);',1,'','2025-05-30 04:52:44'),(343,'alter alert_definition table data column to mediumtext in mysql','ALTER TABLE alert_definition MODIFY data MEDIUMTEXT;',1,'','2025-05-30 04:52:44'),(344,'drop index in alert_definition on org_id and title columns','DROP INDEX `IDX_alert_definition_org_id_title` ON `alert_definition`',1,'','2025-05-30 04:52:44'),(345,'drop index in alert_definition on org_id and uid columns','DROP INDEX `IDX_alert_definition_org_id_uid` ON `alert_definition`',1,'','2025-05-30 04:52:44'),(346,'add unique index in alert_definition on org_id and title columns','CREATE UNIQUE INDEX `UQE_alert_definition_org_id_title` ON `alert_definition` (`org_id`,`title`);',1,'','2025-05-30 04:52:44'),(347,'add unique index in alert_definition on org_id and uid columns','CREATE UNIQUE INDEX `UQE_alert_definition_org_id_uid` ON `alert_definition` (`org_id`,`uid`);',1,'','2025-05-30 04:52:44'),(348,'Add column paused in alert_definition','alter table `alert_definition` ADD COLUMN `paused` TINYINT(1) NOT NULL DEFAULT 0 ',1,'','2025-05-30 04:52:44'),(349,'drop alert_definition table','DROP TABLE IF EXISTS `alert_definition`',1,'','2025-05-30 04:52:44'),(350,'delete alert_definition_version table','DROP TABLE IF EXISTS `alert_definition_version`',1,'','2025-05-30 04:52:44'),(351,'recreate alert_definition_version table','CREATE TABLE IF NOT EXISTS `alert_definition_version` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `alert_definition_id` BIGINT(20) NOT NULL\n, `alert_definition_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 0\n, `parent_version` INT NOT NULL\n, `restored_from` INT NOT NULL\n, `version` INT NOT NULL\n, `created` DATETIME NOT NULL\n, `title` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `condition` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `interval_seconds` BIGINT(20) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:44'),(352,'add index in alert_definition_version table on alert_definition_id and version columns','CREATE UNIQUE INDEX `UQE_alert_definition_version_alert_definition_id_version` ON `alert_definition_version` (`alert_definition_id`,`version`);',1,'','2025-05-30 04:52:44'),(353,'add index in alert_definition_version table on alert_definition_uid and version columns','CREATE UNIQUE INDEX `UQE_alert_definition_version_alert_definition_uid_version` ON `alert_definition_version` (`alert_definition_uid`,`version`);',1,'','2025-05-30 04:52:44'),(354,'alter alert_definition_version table data column to mediumtext in mysql','ALTER TABLE alert_definition_version MODIFY data MEDIUMTEXT;',1,'','2025-05-30 04:52:44'),(355,'drop alert_definition_version table','DROP TABLE IF EXISTS `alert_definition_version`',1,'','2025-05-30 04:52:44'),(356,'create alert_instance table','CREATE TABLE IF NOT EXISTS `alert_instance` (\n`def_org_id` BIGINT(20) NOT NULL\n, `def_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 0\n, `labels` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `labels_hash` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `current_state` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `current_state_since` BIGINT(20) NOT NULL\n, `last_eval_time` BIGINT(20) NOT NULL\n, PRIMARY KEY ( `def_org_id`,`def_uid`,`labels_hash` )) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:44'),(357,'add index in alert_instance table on def_org_id, def_uid and current_state columns','CREATE INDEX `IDX_alert_instance_def_org_id_def_uid_current_state` ON `alert_instance` (`def_org_id`,`def_uid`,`current_state`);',1,'','2025-05-30 04:52:44'),(358,'add index in alert_instance table on def_org_id, current_state columns','CREATE INDEX `IDX_alert_instance_def_org_id_current_state` ON `alert_instance` (`def_org_id`,`current_state`);',1,'','2025-05-30 04:52:44'),(359,'add column current_state_end to alert_instance','alter table `alert_instance` ADD COLUMN `current_state_end` BIGINT(20) NOT NULL DEFAULT 0 ',1,'','2025-05-30 04:52:44'),(360,'remove index def_org_id, def_uid, current_state on alert_instance','DROP INDEX `IDX_alert_instance_def_org_id_def_uid_current_state` ON `alert_instance`',1,'','2025-05-30 04:52:44'),(361,'remove index def_org_id, current_state on alert_instance','DROP INDEX `IDX_alert_instance_def_org_id_current_state` ON `alert_instance`',1,'','2025-05-30 04:52:44'),(362,'rename def_org_id to rule_org_id in alert_instance','ALTER TABLE alert_instance CHANGE def_org_id rule_org_id BIGINT;',1,'','2025-05-30 04:52:44'),(363,'rename def_uid to rule_uid in alert_instance','ALTER TABLE alert_instance CHANGE def_uid rule_uid VARCHAR(40);',1,'','2025-05-30 04:52:44'),(364,'add index rule_org_id, rule_uid, current_state on alert_instance','CREATE INDEX `IDX_alert_instance_rule_org_id_rule_uid_current_state` ON `alert_instance` (`rule_org_id`,`rule_uid`,`current_state`);',1,'','2025-05-30 04:52:44'),(365,'add index rule_org_id, current_state on alert_instance','CREATE INDEX `IDX_alert_instance_rule_org_id_current_state` ON `alert_instance` (`rule_org_id`,`current_state`);',1,'','2025-05-30 04:52:44'),(366,'add current_reason column related to current_state','alter table `alert_instance` ADD COLUMN `current_reason` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-05-30 04:52:44'),(367,'add result_fingerprint column to alert_instance','alter table `alert_instance` ADD COLUMN `result_fingerprint` VARCHAR(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-05-30 04:52:44'),(368,'create alert_rule table','CREATE TABLE IF NOT EXISTS `alert_rule` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `title` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `condition` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `updated` DATETIME NOT NULL\n, `interval_seconds` BIGINT(20) NOT NULL DEFAULT 60\n, `version` INT NOT NULL DEFAULT 0\n, `uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 0\n, `namespace_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `rule_group` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `no_data_state` VARCHAR(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT \'NoData\'\n, `exec_err_state` VARCHAR(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT \'Alerting\'\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:44'),(369,'add index in alert_rule on org_id and title columns','CREATE UNIQUE INDEX `UQE_alert_rule_org_id_title` ON `alert_rule` (`org_id`,`title`);',1,'','2025-05-30 04:52:44'),(370,'add index in alert_rule on org_id and uid columns','CREATE UNIQUE INDEX `UQE_alert_rule_org_id_uid` ON `alert_rule` (`org_id`,`uid`);',1,'','2025-05-30 04:52:44'),(371,'add index in alert_rule on org_id, namespace_uid, group_uid columns','CREATE INDEX `IDX_alert_rule_org_id_namespace_uid_rule_group` ON `alert_rule` (`org_id`,`namespace_uid`,`rule_group`);',1,'','2025-05-30 04:52:44'),(372,'alter alert_rule table data column to mediumtext in mysql','ALTER TABLE alert_rule MODIFY data MEDIUMTEXT;',1,'','2025-05-30 04:52:44'),(373,'add column for to alert_rule','alter table `alert_rule` ADD COLUMN `for` BIGINT(20) NOT NULL DEFAULT 0 ',1,'','2025-05-30 04:52:44'),(374,'add column annotations to alert_rule','alter table `alert_rule` ADD COLUMN `annotations` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-05-30 04:52:44'),(375,'add column labels to alert_rule','alter table `alert_rule` ADD COLUMN `labels` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-05-30 04:52:44'),(376,'remove unique index from alert_rule on org_id, title columns','DROP INDEX `UQE_alert_rule_org_id_title` ON `alert_rule`',1,'','2025-05-30 04:52:44'),(377,'add index in alert_rule on org_id, namespase_uid and title columns','CREATE UNIQUE INDEX `UQE_alert_rule_org_id_namespace_uid_title` ON `alert_rule` (`org_id`,`namespace_uid`,`title`);',1,'','2025-05-30 04:52:45'),(378,'add dashboard_uid column to alert_rule','alter table `alert_rule` ADD COLUMN `dashboard_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-05-30 04:52:45'),(379,'add panel_id column to alert_rule','alter table `alert_rule` ADD COLUMN `panel_id` BIGINT(20) NULL ',1,'','2025-05-30 04:52:45'),(380,'add index in alert_rule on org_id, dashboard_uid and panel_id columns','CREATE INDEX `IDX_alert_rule_org_id_dashboard_uid_panel_id` ON `alert_rule` (`org_id`,`dashboard_uid`,`panel_id`);',1,'','2025-05-30 04:52:45'),(381,'add rule_group_idx column to alert_rule','alter table `alert_rule` ADD COLUMN `rule_group_idx` INT NOT NULL DEFAULT 1 ',1,'','2025-05-30 04:52:45'),(382,'add is_paused column to alert_rule table','alter table `alert_rule` ADD COLUMN `is_paused` TINYINT(1) NOT NULL DEFAULT 0 ',1,'','2025-05-30 04:52:45'),(383,'fix is_paused column for alert_rule table','',1,'','2025-05-30 04:52:45'),(384,'create alert_rule_version table','CREATE TABLE IF NOT EXISTS `alert_rule_version` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `rule_org_id` BIGINT(20) NOT NULL\n, `rule_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 0\n, `rule_namespace_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `rule_group` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `parent_version` INT NOT NULL\n, `restored_from` INT NOT NULL\n, `version` INT NOT NULL\n, `created` DATETIME NOT NULL\n, `title` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `condition` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `data` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `interval_seconds` BIGINT(20) NOT NULL\n, `no_data_state` VARCHAR(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT \'NoData\'\n, `exec_err_state` VARCHAR(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT \'Alerting\'\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:45'),(385,'add index in alert_rule_version table on rule_org_id, rule_uid and version columns','CREATE UNIQUE INDEX `UQE_alert_rule_version_rule_org_id_rule_uid_version` ON `alert_rule_version` (`rule_org_id`,`rule_uid`,`version`);',1,'','2025-05-30 04:52:45'),(386,'add index in alert_rule_version table on rule_org_id, rule_namespace_uid and rule_group columns','CREATE INDEX `IDX_alert_rule_version_rule_org_id_rule_namespace_uid_rule_group` ON `alert_rule_version` (`rule_org_id`,`rule_namespace_uid`,`rule_group`);',1,'','2025-05-30 04:52:45'),(387,'alter alert_rule_version table data column to mediumtext in mysql','ALTER TABLE alert_rule_version MODIFY data MEDIUMTEXT;',1,'','2025-05-30 04:52:45'),(388,'add column for to alert_rule_version','alter table `alert_rule_version` ADD COLUMN `for` BIGINT(20) NOT NULL DEFAULT 0 ',1,'','2025-05-30 04:52:45'),(389,'add column annotations to alert_rule_version','alter table `alert_rule_version` ADD COLUMN `annotations` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-05-30 04:52:45'),(390,'add column labels to alert_rule_version','alter table `alert_rule_version` ADD COLUMN `labels` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-05-30 04:52:45'),(391,'add rule_group_idx column to alert_rule_version','alter table `alert_rule_version` ADD COLUMN `rule_group_idx` INT NOT NULL DEFAULT 1 ',1,'','2025-05-30 04:52:45'),(392,'add is_paused column to alert_rule_versions table','alter table `alert_rule_version` ADD COLUMN `is_paused` TINYINT(1) NOT NULL DEFAULT 0 ',1,'','2025-05-30 04:52:45'),(393,'fix is_paused column for alert_rule_version table','',1,'','2025-05-30 04:52:45'),(394,'create_alert_configuration_table','CREATE TABLE IF NOT EXISTS `alert_configuration` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `alertmanager_configuration` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `configuration_version` VARCHAR(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created_at` INT NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:45'),(395,'Add column default in alert_configuration','alter table `alert_configuration` ADD COLUMN `default` TINYINT(1) NOT NULL DEFAULT 0 ',1,'','2025-05-30 04:52:45'),(396,'alert alert_configuration alertmanager_configuration column from TEXT to MEDIUMTEXT if mysql','ALTER TABLE alert_configuration MODIFY alertmanager_configuration MEDIUMTEXT;',1,'','2025-05-30 04:52:45'),(397,'add column org_id in alert_configuration','alter table `alert_configuration` ADD COLUMN `org_id` BIGINT(20) NOT NULL DEFAULT 0 ',1,'','2025-05-30 04:52:45'),(398,'add index in alert_configuration table on org_id column','CREATE INDEX `IDX_alert_configuration_org_id` ON `alert_configuration` (`org_id`);',1,'','2025-05-30 04:52:45'),(399,'add configuration_hash column to alert_configuration','alter table `alert_configuration` ADD COLUMN `configuration_hash` VARCHAR(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT \'not-yet-calculated\' ',1,'','2025-05-30 04:52:45'),(400,'create_ngalert_configuration_table','CREATE TABLE IF NOT EXISTS `ngalert_configuration` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `alertmanagers` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `created_at` INT NOT NULL\n, `updated_at` INT NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:45'),(401,'add index in ngalert_configuration on org_id column','CREATE UNIQUE INDEX `UQE_ngalert_configuration_org_id` ON `ngalert_configuration` (`org_id`);',1,'','2025-05-30 04:52:45'),(402,'add column send_alerts_to in ngalert_configuration','alter table `ngalert_configuration` ADD COLUMN `send_alerts_to` SMALLINT NOT NULL DEFAULT 0 ',1,'','2025-05-30 04:52:45'),(403,'create provenance_type table','CREATE TABLE IF NOT EXISTS `provenance_type` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `record_key` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `record_type` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `provenance` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:45'),(404,'add index to uniquify (record_key, record_type, org_id) columns','CREATE UNIQUE INDEX `UQE_provenance_type_record_type_record_key_org_id` ON `provenance_type` (`record_type`,`record_key`,`org_id`);',1,'','2025-05-30 04:52:45'),(405,'create alert_image table','CREATE TABLE IF NOT EXISTS `alert_image` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `token` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `path` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `url` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created_at` DATETIME NOT NULL\n, `expires_at` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:45'),(406,'add unique index on token to alert_image table','CREATE UNIQUE INDEX `UQE_alert_image_token` ON `alert_image` (`token`);',1,'','2025-05-30 04:52:45'),(407,'support longer URLs in alert_image table','ALTER TABLE alert_image MODIFY url VARCHAR(2048) NOT NULL;',1,'','2025-05-30 04:52:45'),(408,'create_alert_configuration_history_table','CREATE TABLE IF NOT EXISTS `alert_configuration_history` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL DEFAULT 0\n, `alertmanager_configuration` MEDIUMTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `configuration_hash` VARCHAR(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT \'not-yet-calculated\'\n, `configuration_version` VARCHAR(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created_at` INT NOT NULL\n, `default` TINYINT(1) NOT NULL DEFAULT 0\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:45'),(409,'drop non-unique orgID index on alert_configuration','DROP INDEX `IDX_alert_configuration_org_id` ON `alert_configuration`',1,'','2025-05-30 04:52:45'),(410,'drop unique orgID index on alert_configuration if exists','DROP INDEX `UQE_alert_configuration_org_id` ON `alert_configuration`',1,'','2025-05-30 04:52:45'),(411,'extract alertmanager configuration history to separate table','code migration',1,'','2025-05-30 04:52:45'),(412,'add unique index on orgID to alert_configuration','CREATE UNIQUE INDEX `UQE_alert_configuration_org_id` ON `alert_configuration` (`org_id`);',1,'','2025-05-30 04:52:45'),(413,'add last_applied column to alert_configuration_history','alter table `alert_configuration_history` ADD COLUMN `last_applied` INT NOT NULL DEFAULT 0 ',1,'','2025-05-30 04:52:45'),(414,'create library_element table v1','CREATE TABLE IF NOT EXISTS `library_element` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `folder_id` BIGINT(20) NOT NULL\n, `uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `name` VARCHAR(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `kind` BIGINT(20) NOT NULL\n, `type` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `description` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `model` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` DATETIME NOT NULL\n, `created_by` BIGINT(20) NOT NULL\n, `updated` DATETIME NOT NULL\n, `updated_by` BIGINT(20) NOT NULL\n, `version` BIGINT(20) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:45'),(415,'add index library_element org_id-folder_id-name-kind','CREATE UNIQUE INDEX `UQE_library_element_org_id_folder_id_name_kind` ON `library_element` (`org_id`,`folder_id`,`name`,`kind`);',1,'','2025-05-30 04:52:45'),(416,'create library_element_connection table v1','CREATE TABLE IF NOT EXISTS `library_element_connection` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `element_id` BIGINT(20) NOT NULL\n, `kind` BIGINT(20) NOT NULL\n, `connection_id` BIGINT(20) NOT NULL\n, `created` DATETIME NOT NULL\n, `created_by` BIGINT(20) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:45'),(417,'add index library_element_connection element_id-kind-connection_id','CREATE UNIQUE INDEX `UQE_library_element_connection_element_id_kind_connection_id` ON `library_element_connection` (`element_id`,`kind`,`connection_id`);',1,'','2025-05-30 04:52:45'),(418,'add unique index library_element org_id_uid','CREATE UNIQUE INDEX `UQE_library_element_org_id_uid` ON `library_element` (`org_id`,`uid`);',1,'','2025-05-30 04:52:45'),(419,'increase max description length to 2048','ALTER TABLE `library_element` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `description` VARCHAR(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;',1,'','2025-05-30 04:52:45'),(420,'alter library_element model to mediumtext','ALTER TABLE library_element MODIFY model MEDIUMTEXT NOT NULL;',1,'','2025-05-30 04:52:45'),(421,'add library_element folder uid','alter table `library_element` ADD COLUMN `folder_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-05-30 04:52:45'),(422,'populate library_element folder_uid','UPDATE library_element\n		SET folder_uid = (\n			SELECT dashboard.uid\n			FROM dashboard\n			WHERE library_element.folder_id = dashboard.id AND library_element.org_id = dashboard.org_id\n		)',1,'','2025-05-30 04:52:45'),(423,'add index library_element org_id-folder_uid-name-kind','CREATE UNIQUE INDEX `UQE_library_element_org_id_folder_uid_name_kind` ON `library_element` (`org_id`,`folder_uid`,`name`,`kind`);',1,'','2025-05-30 04:52:45'),(424,'clone move dashboard alerts to unified alerting','code migration',1,'','2025-05-30 04:52:45'),(425,'create data_keys table','CREATE TABLE IF NOT EXISTS `data_keys` (\n`name` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci PRIMARY KEY NOT NULL\n, `active` TINYINT(1) NOT NULL\n, `scope` VARCHAR(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `provider` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `encrypted_data` BLOB NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:45'),(426,'create secrets table','CREATE TABLE IF NOT EXISTS `secrets` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `namespace` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `type` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `value` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:45'),(427,'rename data_keys name column to id','ALTER TABLE `data_keys` CHANGE `name` `id` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci',1,'','2025-05-30 04:52:45'),(428,'add name column into data_keys','alter table `data_keys` ADD COLUMN `name` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT \'\' ',1,'','2025-05-30 04:52:45'),(429,'copy data_keys id column values into name','UPDATE data_keys SET name = id',1,'','2025-05-30 04:52:45'),(430,'rename data_keys name column to label','ALTER TABLE `data_keys` CHANGE `name` `label` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci',1,'','2025-05-30 04:52:45'),(431,'rename data_keys id column back to name','ALTER TABLE `data_keys` CHANGE `id` `name` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci',1,'','2025-05-30 04:52:45'),(432,'create kv_store table v1','CREATE TABLE IF NOT EXISTS `kv_store` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `namespace` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `key` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `value` MEDIUMTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:45'),(433,'add index kv_store.org_id-namespace-key','CREATE UNIQUE INDEX `UQE_kv_store_org_id_namespace_key` ON `kv_store` (`org_id`,`namespace`,`key`);',1,'','2025-05-30 04:52:45'),(434,'update dashboard_uid and panel_id from existing annotations','set dashboard_uid and panel_id migration',1,'','2025-05-30 04:52:45'),(435,'create permission table','CREATE TABLE IF NOT EXISTS `permission` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `role_id` BIGINT(20) NOT NULL\n, `action` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `scope` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:45'),(436,'add unique index permission.role_id','CREATE INDEX `IDX_permission_role_id` ON `permission` (`role_id`);',1,'','2025-05-30 04:52:45'),(437,'add unique index role_id_action_scope','CREATE UNIQUE INDEX `UQE_permission_role_id_action_scope` ON `permission` (`role_id`,`action`,`scope`);',1,'','2025-05-30 04:52:45'),(438,'create role table','CREATE TABLE IF NOT EXISTS `role` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `description` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `version` BIGINT(20) NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:45'),(439,'add column display_name','alter table `role` ADD COLUMN `display_name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-05-30 04:52:45'),(440,'add column group_name','alter table `role` ADD COLUMN `group_name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-05-30 04:52:45'),(441,'add index role.org_id','CREATE INDEX `IDX_role_org_id` ON `role` (`org_id`);',1,'','2025-05-30 04:52:45'),(442,'add unique index role_org_id_name','CREATE UNIQUE INDEX `UQE_role_org_id_name` ON `role` (`org_id`,`name`);',1,'','2025-05-30 04:52:45'),(443,'add index role_org_id_uid','CREATE UNIQUE INDEX `UQE_role_org_id_uid` ON `role` (`org_id`,`uid`);',1,'','2025-05-30 04:52:45'),(444,'create team role table','CREATE TABLE IF NOT EXISTS `team_role` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `team_id` BIGINT(20) NOT NULL\n, `role_id` BIGINT(20) NOT NULL\n, `created` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:45'),(445,'add index team_role.org_id','CREATE INDEX `IDX_team_role_org_id` ON `team_role` (`org_id`);',1,'','2025-05-30 04:52:45'),(446,'add unique index team_role_org_id_team_id_role_id','CREATE UNIQUE INDEX `UQE_team_role_org_id_team_id_role_id` ON `team_role` (`org_id`,`team_id`,`role_id`);',1,'','2025-05-30 04:52:45'),(447,'add index team_role.team_id','CREATE INDEX `IDX_team_role_team_id` ON `team_role` (`team_id`);',1,'','2025-05-30 04:52:45'),(448,'create user role table','CREATE TABLE IF NOT EXISTS `user_role` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `user_id` BIGINT(20) NOT NULL\n, `role_id` BIGINT(20) NOT NULL\n, `created` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:45'),(449,'add index user_role.org_id','CREATE INDEX `IDX_user_role_org_id` ON `user_role` (`org_id`);',1,'','2025-05-30 04:52:45'),(450,'add unique index user_role_org_id_user_id_role_id','CREATE UNIQUE INDEX `UQE_user_role_org_id_user_id_role_id` ON `user_role` (`org_id`,`user_id`,`role_id`);',1,'','2025-05-30 04:52:45'),(451,'add index user_role.user_id','CREATE INDEX `IDX_user_role_user_id` ON `user_role` (`user_id`);',1,'','2025-05-30 04:52:46'),(452,'create builtin role table','CREATE TABLE IF NOT EXISTS `builtin_role` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `role` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `role_id` BIGINT(20) NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:46'),(453,'add index builtin_role.role_id','CREATE INDEX `IDX_builtin_role_role_id` ON `builtin_role` (`role_id`);',1,'','2025-05-30 04:52:46'),(454,'add index builtin_role.name','CREATE INDEX `IDX_builtin_role_role` ON `builtin_role` (`role`);',1,'','2025-05-30 04:52:46'),(455,'Add column org_id to builtin_role table','alter table `builtin_role` ADD COLUMN `org_id` BIGINT(20) NOT NULL DEFAULT 0 ',1,'','2025-05-30 04:52:46'),(456,'add index builtin_role.org_id','CREATE INDEX `IDX_builtin_role_org_id` ON `builtin_role` (`org_id`);',1,'','2025-05-30 04:52:46'),(457,'add unique index builtin_role_org_id_role_id_role','CREATE UNIQUE INDEX `UQE_builtin_role_org_id_role_id_role` ON `builtin_role` (`org_id`,`role_id`,`role`);',1,'','2025-05-30 04:52:46'),(458,'Remove unique index role_org_id_uid','DROP INDEX `UQE_role_org_id_uid` ON `role`',1,'','2025-05-30 04:52:46'),(459,'add unique index role.uid','CREATE UNIQUE INDEX `UQE_role_uid` ON `role` (`uid`);',1,'','2025-05-30 04:52:46'),(460,'create seed assignment table','CREATE TABLE IF NOT EXISTS `seed_assignment` (\n`builtin_role` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `role_name` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:46'),(461,'add unique index builtin_role_role_name','CREATE UNIQUE INDEX `UQE_seed_assignment_builtin_role_role_name` ON `seed_assignment` (`builtin_role`,`role_name`);',1,'','2025-05-30 04:52:46'),(462,'add column hidden to role table','alter table `role` ADD COLUMN `hidden` TINYINT(1) NOT NULL DEFAULT 0 ',1,'','2025-05-30 04:52:46'),(463,'permission kind migration','alter table `permission` ADD COLUMN `kind` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT \'\' ',1,'','2025-05-30 04:52:46'),(464,'permission attribute migration','alter table `permission` ADD COLUMN `attribute` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT \'\' ',1,'','2025-05-30 04:52:46'),(465,'permission identifier migration','alter table `permission` ADD COLUMN `identifier` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT \'\' ',1,'','2025-05-30 04:52:46'),(466,'add permission identifier index','CREATE INDEX `IDX_permission_identifier` ON `permission` (`identifier`);',1,'','2025-05-30 04:52:46'),(467,'add permission action scope role_id index','CREATE UNIQUE INDEX `UQE_permission_action_scope_role_id` ON `permission` (`action`,`scope`,`role_id`);',1,'','2025-05-30 04:52:46'),(468,'remove permission role_id action scope index','DROP INDEX `UQE_permission_role_id_action_scope` ON `permission`',1,'','2025-05-30 04:52:46'),(469,'add group mapping UID column to user_role table','alter table `user_role` ADD COLUMN `group_mapping_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT \'\' ',1,'','2025-05-30 04:52:46'),(470,'add user_role org ID, user ID, role ID, group mapping UID index','CREATE UNIQUE INDEX `UQE_user_role_org_id_user_id_role_id_group_mapping_uid` ON `user_role` (`org_id`,`user_id`,`role_id`,`group_mapping_uid`);',1,'','2025-05-30 04:52:46'),(471,'remove user_role org ID, user ID, role ID index','DROP INDEX `UQE_user_role_org_id_user_id_role_id` ON `user_role`',1,'','2025-05-30 04:52:46'),(472,'create query_history table v1','CREATE TABLE IF NOT EXISTS `query_history` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `datasource_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created_by` INT NOT NULL\n, `created_at` INT NOT NULL\n, `comment` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `queries` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:46'),(473,'add index query_history.org_id-created_by-datasource_uid','CREATE INDEX `IDX_query_history_org_id_created_by_datasource_uid` ON `query_history` (`org_id`,`created_by`,`datasource_uid`);',1,'','2025-05-30 04:52:46'),(474,'alter table query_history alter column created_by type to bigint','ALTER TABLE query_history MODIFY created_by BIGINT;',1,'','2025-05-30 04:52:46'),(475,'create query_history_details table v1','CREATE TABLE IF NOT EXISTS `query_history_details` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `query_history_item_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `datasource_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:46'),(476,'rbac disabled migrator','code migration',1,'','2025-05-30 04:52:46'),(477,'teams permissions migration','code migration',1,'','2025-05-30 04:52:46'),(478,'dashboard permissions','code migration',1,'','2025-05-30 04:52:46'),(479,'dashboard permissions uid scopes','code migration',1,'','2025-05-30 04:52:46'),(480,'drop managed folder create actions','code migration',1,'','2025-05-30 04:52:46'),(481,'alerting notification permissions','code migration',1,'','2025-05-30 04:52:46'),(482,'create query_history_star table v1','CREATE TABLE IF NOT EXISTS `query_history_star` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `query_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `user_id` INT NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:46'),(483,'add index query_history.user_id-query_uid','CREATE UNIQUE INDEX `UQE_query_history_star_user_id_query_uid` ON `query_history_star` (`user_id`,`query_uid`);',1,'','2025-05-30 04:52:46'),(484,'add column org_id in query_history_star','alter table `query_history_star` ADD COLUMN `org_id` BIGINT(20) NOT NULL DEFAULT 1 ',1,'','2025-05-30 04:52:46'),(485,'alter table query_history_star_mig column user_id type to bigint','ALTER TABLE query_history_star MODIFY user_id BIGINT;',1,'','2025-05-30 04:52:46'),(486,'create correlation table v1','CREATE TABLE IF NOT EXISTS `correlation` (\n`uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `source_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `target_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `label` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `description` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, PRIMARY KEY ( `uid`,`source_uid` )) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:46'),(487,'add index correlations.uid','CREATE INDEX `IDX_correlation_uid` ON `correlation` (`uid`);',1,'','2025-05-30 04:52:46'),(488,'add index correlations.source_uid','CREATE INDEX `IDX_correlation_source_uid` ON `correlation` (`source_uid`);',1,'','2025-05-30 04:52:46'),(489,'add correlation config column','alter table `correlation` ADD COLUMN `config` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-05-30 04:52:46'),(490,'drop index IDX_correlation_uid - v1','DROP INDEX `IDX_correlation_uid` ON `correlation`',1,'','2025-05-30 04:52:46'),(491,'drop index IDX_correlation_source_uid - v1','DROP INDEX `IDX_correlation_source_uid` ON `correlation`',1,'','2025-05-30 04:52:46'),(492,'Rename table correlation to correlation_tmp_qwerty - v1','ALTER TABLE `correlation` RENAME TO `correlation_tmp_qwerty`',1,'','2025-05-30 04:52:46'),(493,'create correlation v2','CREATE TABLE IF NOT EXISTS `correlation` (\n`uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `org_id` BIGINT(20) NOT NULL DEFAULT 0\n, `source_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `target_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `label` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `description` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `config` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, PRIMARY KEY ( `uid`,`org_id`,`source_uid` )) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:46'),(494,'create index IDX_correlation_uid - v2','CREATE INDEX `IDX_correlation_uid` ON `correlation` (`uid`);',1,'','2025-05-30 04:52:46'),(495,'create index IDX_correlation_source_uid - v2','CREATE INDEX `IDX_correlation_source_uid` ON `correlation` (`source_uid`);',1,'','2025-05-30 04:52:46'),(496,'create index IDX_correlation_org_id - v2','CREATE INDEX `IDX_correlation_org_id` ON `correlation` (`org_id`);',1,'','2025-05-30 04:52:46'),(497,'copy correlation v1 to v2','INSERT INTO `correlation` (`uid`\n, `source_uid`\n, `target_uid`\n, `label`\n, `description`\n, `config`) SELECT `uid`\n, `source_uid`\n, `target_uid`\n, `label`\n, `description`\n, `config` FROM `correlation_tmp_qwerty`',1,'','2025-05-30 04:52:46'),(498,'drop correlation_tmp_qwerty','DROP TABLE IF EXISTS `correlation_tmp_qwerty`',1,'','2025-05-30 04:52:46'),(499,'add provisioning column','alter table `correlation` ADD COLUMN `provisioned` TINYINT(1) NOT NULL DEFAULT 0 ',1,'','2025-05-30 04:52:46'),(500,'add type column','alter table `correlation` ADD COLUMN `type` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT \'query\' ',1,'','2025-05-30 04:52:46'),(501,'create entity_events table','CREATE TABLE IF NOT EXISTS `entity_event` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `entity_id` VARCHAR(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `event_type` VARCHAR(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` BIGINT(20) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:46'),(502,'create dashboard public config v1','CREATE TABLE IF NOT EXISTS `dashboard_public_config` (\n`uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci PRIMARY KEY NOT NULL\n, `dashboard_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `time_settings` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `refresh_rate` INT NOT NULL DEFAULT 30\n, `template_variables` MEDIUMTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:46'),(503,'drop index UQE_dashboard_public_config_uid - v1','DROP INDEX `UQE_dashboard_public_config_uid` ON `dashboard_public_config`',1,'','2025-05-30 04:52:46'),(504,'drop index IDX_dashboard_public_config_org_id_dashboard_uid - v1','DROP INDEX `IDX_dashboard_public_config_org_id_dashboard_uid` ON `dashboard_public_config`',1,'','2025-05-30 04:52:46'),(505,'Drop old dashboard public config table','DROP TABLE IF EXISTS `dashboard_public_config`',1,'','2025-05-30 04:52:46'),(506,'recreate dashboard public config v1','CREATE TABLE IF NOT EXISTS `dashboard_public_config` (\n`uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci PRIMARY KEY NOT NULL\n, `dashboard_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `time_settings` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `refresh_rate` INT NOT NULL DEFAULT 30\n, `template_variables` MEDIUMTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:46'),(507,'create index UQE_dashboard_public_config_uid - v1','CREATE UNIQUE INDEX `UQE_dashboard_public_config_uid` ON `dashboard_public_config` (`uid`);',1,'','2025-05-30 04:52:46'),(508,'create index IDX_dashboard_public_config_org_id_dashboard_uid - v1','CREATE INDEX `IDX_dashboard_public_config_org_id_dashboard_uid` ON `dashboard_public_config` (`org_id`,`dashboard_uid`);',1,'','2025-05-30 04:52:46'),(509,'drop index UQE_dashboard_public_config_uid - v2','DROP INDEX `UQE_dashboard_public_config_uid` ON `dashboard_public_config`',1,'','2025-05-30 04:52:46'),(510,'drop index IDX_dashboard_public_config_org_id_dashboard_uid - v2','DROP INDEX `IDX_dashboard_public_config_org_id_dashboard_uid` ON `dashboard_public_config`',1,'','2025-05-30 04:52:46'),(511,'Drop public config table','DROP TABLE IF EXISTS `dashboard_public_config`',1,'','2025-05-30 04:52:46'),(512,'Recreate dashboard public config v2','CREATE TABLE IF NOT EXISTS `dashboard_public_config` (\n`uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci PRIMARY KEY NOT NULL\n, `dashboard_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `time_settings` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `template_variables` MEDIUMTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `access_token` VARCHAR(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created_by` INT NOT NULL\n, `updated_by` INT NULL\n, `created_at` DATETIME NOT NULL\n, `updated_at` DATETIME NULL\n, `is_enabled` TINYINT(1) NOT NULL DEFAULT 0\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:46'),(513,'create index UQE_dashboard_public_config_uid - v2','CREATE UNIQUE INDEX `UQE_dashboard_public_config_uid` ON `dashboard_public_config` (`uid`);',1,'','2025-05-30 04:52:46'),(514,'create index IDX_dashboard_public_config_org_id_dashboard_uid - v2','CREATE INDEX `IDX_dashboard_public_config_org_id_dashboard_uid` ON `dashboard_public_config` (`org_id`,`dashboard_uid`);',1,'','2025-05-30 04:52:46'),(515,'create index UQE_dashboard_public_config_access_token - v2','CREATE UNIQUE INDEX `UQE_dashboard_public_config_access_token` ON `dashboard_public_config` (`access_token`);',1,'','2025-05-30 04:52:46'),(516,'Rename table dashboard_public_config to dashboard_public - v2','ALTER TABLE `dashboard_public_config` RENAME TO `dashboard_public`',1,'','2025-05-30 04:52:46'),(517,'add annotations_enabled column','alter table `dashboard_public` ADD COLUMN `annotations_enabled` TINYINT(1) NOT NULL DEFAULT 0 ',1,'','2025-05-30 04:52:46'),(518,'add time_selection_enabled column','alter table `dashboard_public` ADD COLUMN `time_selection_enabled` TINYINT(1) NOT NULL DEFAULT 0 ',1,'','2025-05-30 04:52:46'),(519,'delete orphaned public dashboards','DELETE FROM dashboard_public WHERE dashboard_uid NOT IN (SELECT uid FROM dashboard)',1,'','2025-05-30 04:52:46'),(520,'add share column','alter table `dashboard_public` ADD COLUMN `share` VARCHAR(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT \'public\' ',1,'','2025-05-30 04:52:46'),(521,'backfill empty share column fields with default of public','UPDATE dashboard_public SET share=\'public\' WHERE share=\'\'',1,'','2025-05-30 04:52:46'),(522,'create file table','CREATE TABLE IF NOT EXISTS `file` (\n`path` VARCHAR(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `path_hash` VARCHAR(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `parent_folder_path_hash` VARCHAR(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `contents` BLOB NOT NULL\n, `etag` VARCHAR(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `cache_control` VARCHAR(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `content_disposition` VARCHAR(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `updated` DATETIME NOT NULL\n, `created` DATETIME NOT NULL\n, `size` BIGINT(20) NOT NULL\n, `mime_type` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:46'),(523,'file table idx: path natural pk','CREATE UNIQUE INDEX `UQE_file_path_hash` ON `file` (`path_hash`);',1,'','2025-05-30 04:52:46'),(524,'file table idx: parent_folder_path_hash fast folder retrieval','CREATE INDEX `IDX_file_parent_folder_path_hash` ON `file` (`parent_folder_path_hash`);',1,'','2025-05-30 04:52:46'),(525,'create file_meta table','CREATE TABLE IF NOT EXISTS `file_meta` (\n`path_hash` VARCHAR(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `key` VARCHAR(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `value` VARCHAR(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:46'),(526,'file table idx: path key','CREATE UNIQUE INDEX `UQE_file_meta_path_hash_key` ON `file_meta` (`path_hash`,`key`);',1,'','2025-05-30 04:52:46'),(527,'set path collation in file table','',1,'','2025-05-30 04:52:46'),(528,'migrate contents column to mediumblob for MySQL','ALTER TABLE file MODIFY contents MEDIUMBLOB;',1,'','2025-05-30 04:52:46'),(529,'managed permissions migration','code migration',1,'','2025-05-30 04:52:46'),(530,'managed folder permissions alert actions migration','code migration',1,'','2025-05-30 04:52:46'),(531,'RBAC action name migrator','code migration',1,'','2025-05-30 04:52:46'),(532,'Add UID column to playlist','alter table `playlist` ADD COLUMN `uid` VARCHAR(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 0 ',1,'','2025-05-30 04:52:46'),(533,'Update uid column values in playlist','UPDATE playlist SET uid=id;',1,'','2025-05-30 04:52:46'),(534,'Add index for uid in playlist','CREATE UNIQUE INDEX `UQE_playlist_org_id_uid` ON `playlist` (`org_id`,`uid`);',1,'','2025-05-30 04:52:46'),(535,'update group index for alert rules','code migration',1,'','2025-05-30 04:52:46'),(536,'managed folder permissions alert actions repeated migration','code migration',1,'','2025-05-30 04:52:46'),(537,'admin only folder/dashboard permission','code migration',1,'','2025-05-30 04:52:46'),(538,'add action column to seed_assignment','alter table `seed_assignment` ADD COLUMN `action` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-05-30 04:52:46'),(539,'add scope column to seed_assignment','alter table `seed_assignment` ADD COLUMN `scope` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-05-30 04:52:47'),(540,'remove unique index builtin_role_role_name before nullable update','DROP INDEX `UQE_seed_assignment_builtin_role_role_name` ON `seed_assignment`',1,'','2025-05-30 04:52:47'),(541,'update seed_assignment role_name column to nullable','ALTER TABLE seed_assignment MODIFY role_name VARCHAR(190) DEFAULT NULL;',1,'','2025-05-30 04:52:47'),(542,'add unique index builtin_role_name back','CREATE UNIQUE INDEX `UQE_seed_assignment_builtin_role_role_name` ON `seed_assignment` (`builtin_role`,`role_name`);',1,'','2025-05-30 04:52:47'),(543,'add unique index builtin_role_action_scope','CREATE UNIQUE INDEX `UQE_seed_assignment_builtin_role_action_scope` ON `seed_assignment` (`builtin_role`,`action`,`scope`);',1,'','2025-05-30 04:52:47'),(544,'add primary key to seed_assigment','code migration',1,'','2025-05-30 04:52:47'),(545,'add origin column to seed_assignment','alter table `seed_assignment` ADD COLUMN `origin` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-05-30 04:52:47'),(546,'add origin to plugin seed_assignment','code migration',1,'','2025-05-30 04:52:47'),(547,'prevent seeding OnCall access','code migration',1,'','2025-05-30 04:52:47'),(548,'managed folder permissions alert actions repeated fixed migration','code migration',1,'','2025-05-30 04:52:47'),(549,'managed folder permissions library panel actions migration','code migration',1,'','2025-05-30 04:52:47'),(550,'migrate external alertmanagers to datsourcse','migrate external alertmanagers to datasource',1,'','2025-05-30 04:52:47'),(551,'create folder table','CREATE TABLE IF NOT EXISTS `folder` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `title` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `description` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `parent_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:47'),(552,'Add index for parent_uid','CREATE INDEX `IDX_folder_parent_uid_org_id` ON `folder` (`parent_uid`,`org_id`);',1,'','2025-05-30 04:52:47'),(553,'Add unique index for folder.uid and folder.org_id','CREATE UNIQUE INDEX `UQE_folder_uid_org_id` ON `folder` (`uid`,`org_id`);',1,'','2025-05-30 04:52:47'),(554,'Update folder title length','ALTER TABLE `folder` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, MODIFY `title` VARCHAR(189) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ;',1,'','2025-05-30 04:52:47'),(555,'Add unique index for folder.title and folder.parent_uid','CREATE UNIQUE INDEX `UQE_folder_title_parent_uid` ON `folder` (`title`,`parent_uid`);',1,'','2025-05-30 04:52:47'),(556,'Remove unique index for folder.title and folder.parent_uid','DROP INDEX `UQE_folder_title_parent_uid` ON `folder`',1,'','2025-05-30 04:52:47'),(557,'Add unique index for title, parent_uid, and org_id','CREATE UNIQUE INDEX `UQE_folder_title_parent_uid_org_id` ON `folder` (`title`,`parent_uid`,`org_id`);',1,'','2025-05-30 04:52:47'),(558,'Sync dashboard and folder table','\n			INSERT INTO folder (uid, org_id, title, created, updated)\n			SELECT * FROM (SELECT uid, org_id, title, created, updated FROM dashboard WHERE is_folder = 1) AS derived\n			ON DUPLICATE KEY UPDATE title=derived.title, updated=derived.updated\n		',1,'','2025-05-30 04:52:47'),(559,'Remove ghost folders from the folder table','\n			DELETE FROM folder WHERE NOT EXISTS\n				(SELECT 1 FROM dashboard WHERE dashboard.uid = folder.uid AND dashboard.org_id = folder.org_id AND dashboard.is_folder = true)\n	',1,'','2025-05-30 04:52:47'),(560,'Remove unique index UQE_folder_uid_org_id','DROP INDEX `UQE_folder_uid_org_id` ON `folder`',1,'','2025-05-30 04:52:47'),(561,'Add unique index UQE_folder_org_id_uid','CREATE UNIQUE INDEX `UQE_folder_org_id_uid` ON `folder` (`org_id`,`uid`);',1,'','2025-05-30 04:52:47'),(562,'Remove unique index UQE_folder_title_parent_uid_org_id','DROP INDEX `UQE_folder_title_parent_uid_org_id` ON `folder`',1,'','2025-05-30 04:52:47'),(563,'Add unique index UQE_folder_org_id_parent_uid_title','CREATE UNIQUE INDEX `UQE_folder_org_id_parent_uid_title` ON `folder` (`org_id`,`parent_uid`,`title`);',1,'','2025-05-30 04:52:47'),(564,'Remove index IDX_folder_parent_uid_org_id','DROP INDEX `IDX_folder_parent_uid_org_id` ON `folder`',1,'','2025-05-30 04:52:47'),(565,'Remove unique index UQE_folder_org_id_parent_uid_title','DROP INDEX `UQE_folder_org_id_parent_uid_title` ON `folder`',1,'','2025-05-30 04:52:47'),(566,'create anon_device table','CREATE TABLE IF NOT EXISTS `anon_device` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `client_ip` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created_at` DATETIME NOT NULL\n, `device_id` VARCHAR(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `updated_at` DATETIME NOT NULL\n, `user_agent` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:47'),(567,'add unique index anon_device.device_id','CREATE UNIQUE INDEX `UQE_anon_device_device_id` ON `anon_device` (`device_id`);',1,'','2025-05-30 04:52:47'),(568,'add index anon_device.updated_at','CREATE INDEX `IDX_anon_device_updated_at` ON `anon_device` (`updated_at`);',1,'','2025-05-30 04:52:47'),(569,'create signing_key table','CREATE TABLE IF NOT EXISTS `signing_key` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `key_id` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `private_key` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `added_at` DATETIME NOT NULL\n, `expires_at` DATETIME NULL\n, `alg` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:47'),(570,'add unique index signing_key.key_id','CREATE UNIQUE INDEX `UQE_signing_key_key_id` ON `signing_key` (`key_id`);',1,'','2025-05-30 04:52:47'),(571,'set legacy alert migration status in kvstore','code migration',1,'','2025-05-30 04:52:47'),(572,'migrate record of created folders during legacy migration to kvstore','code migration',1,'','2025-05-30 04:52:47'),(573,'Add folder_uid for dashboard','alter table `dashboard` ADD COLUMN `folder_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-05-30 04:52:47'),(574,'Populate dashboard folder_uid column','code migration',1,'','2025-05-30 04:52:47'),(575,'Add unique index for dashboard_org_id_folder_uid_title','code migration',1,'','2025-05-30 04:52:47'),(576,'Delete unique index for dashboard_org_id_folder_id_title','DROP INDEX `UQE_dashboard_org_id_folder_id_title` ON `dashboard`',1,'','2025-05-30 04:52:47'),(577,'Delete unique index for dashboard_org_id_folder_uid_title','code migration',1,'','2025-05-30 04:52:47'),(578,'Add unique index for dashboard_org_id_folder_uid_title_is_folder','CREATE UNIQUE INDEX `UQE_dashboard_org_id_folder_uid_title_is_folder` ON `dashboard` (`org_id`,`folder_uid`,`title`,`is_folder`);',1,'','2025-05-30 04:52:47'),(579,'Restore index for dashboard_org_id_folder_id_title','CREATE INDEX `IDX_dashboard_org_id_folder_id_title` ON `dashboard` (`org_id`,`folder_id`,`title`);',1,'','2025-05-30 04:52:47'),(580,'Remove unique index for dashboard_org_id_folder_uid_title_is_folder','DROP INDEX `UQE_dashboard_org_id_folder_uid_title_is_folder` ON `dashboard`',1,'','2025-05-30 04:52:47'),(581,'create sso_setting table','CREATE TABLE IF NOT EXISTS `sso_setting` (\n`id` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci PRIMARY KEY NOT NULL\n, `provider` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `settings` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n, `is_deleted` TINYINT(1) NOT NULL DEFAULT 0\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:47'),(582,'copy kvstore migration status to each org','code migration',1,'','2025-05-30 04:52:47'),(583,'add back entry for orgid=0 migrated status','code migration',1,'','2025-05-30 04:52:47'),(584,'managed dashboard permissions annotation actions migration','code migration',1,'','2025-05-30 04:52:47'),(585,'create cloud_migration table v1','CREATE TABLE IF NOT EXISTS `cloud_migration` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `auth_token` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `stack` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:47'),(586,'create cloud_migration_run table v1','CREATE TABLE IF NOT EXISTS `cloud_migration_run` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `cloud_migration_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `result` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n, `finished` DATETIME NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:47'),(587,'add stack_id column','alter table `cloud_migration` ADD COLUMN `stack_id` BIGINT(20) NOT NULL ',1,'','2025-05-30 04:52:47'),(588,'add region_slug column','alter table `cloud_migration` ADD COLUMN `region_slug` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ',1,'','2025-05-30 04:52:47'),(589,'add cluster_slug column','alter table `cloud_migration` ADD COLUMN `cluster_slug` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ',1,'','2025-05-30 04:52:47'),(590,'add migration uid column','alter table `cloud_migration` ADD COLUMN `uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-05-30 04:52:47'),(591,'Update uid column values for migration','UPDATE cloud_migration SET uid=concat(\'u\',lpad(id,9,\'0\')) WHERE uid IS NULL;',1,'','2025-05-30 04:52:47'),(592,'Add unique index migration_uid','CREATE UNIQUE INDEX `UQE_cloud_migration_uid` ON `cloud_migration` (`uid`);',1,'','2025-05-30 04:52:47'),(593,'add migration run uid column','alter table `cloud_migration_run` ADD COLUMN `uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-05-30 04:52:47'),(594,'Update uid column values for migration run','UPDATE cloud_migration_run SET uid=concat(\'u\',lpad(id,9,\'0\')) WHERE uid IS NULL;',1,'','2025-05-30 04:52:47'),(595,'Add unique index migration_run_uid','CREATE UNIQUE INDEX `UQE_cloud_migration_run_uid` ON `cloud_migration_run` (`uid`);',1,'','2025-05-30 04:52:47'),(596,'Rename table cloud_migration to cloud_migration_session_tmp_qwerty - v1','ALTER TABLE `cloud_migration` RENAME TO `cloud_migration_session_tmp_qwerty`',1,'','2025-05-30 04:52:47'),(597,'create cloud_migration_session v2','CREATE TABLE IF NOT EXISTS `cloud_migration_session` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `auth_token` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `slug` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `stack_id` BIGINT(20) NOT NULL\n, `region_slug` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `cluster_slug` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:47'),(598,'create index UQE_cloud_migration_session_uid - v2','CREATE UNIQUE INDEX `UQE_cloud_migration_session_uid` ON `cloud_migration_session` (`uid`);',1,'','2025-05-30 04:52:47'),(599,'copy cloud_migration_session v1 to v2','INSERT INTO `cloud_migration_session` (`uid`\n, `auth_token`\n, `updated`\n, `slug`\n, `stack_id`\n, `region_slug`\n, `cluster_slug`\n, `created`\n, `id`) SELECT `uid`\n, `auth_token`\n, `updated`\n, `stack`\n, `stack_id`\n, `region_slug`\n, `cluster_slug`\n, `created`\n, `id` FROM `cloud_migration_session_tmp_qwerty`',1,'','2025-05-30 04:52:47'),(600,'drop cloud_migration_session_tmp_qwerty','DROP TABLE IF EXISTS `cloud_migration_session_tmp_qwerty`',1,'','2025-05-30 04:52:47'),(601,'Rename table cloud_migration_run to cloud_migration_snapshot_tmp_qwerty - v1','ALTER TABLE `cloud_migration_run` RENAME TO `cloud_migration_snapshot_tmp_qwerty`',1,'','2025-05-30 04:52:47'),(602,'create cloud_migration_snapshot v2','CREATE TABLE IF NOT EXISTS `cloud_migration_snapshot` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `session_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `result` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `created` DATETIME NOT NULL\n, `updated` DATETIME NOT NULL\n, `finished` DATETIME NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:47'),(603,'create index UQE_cloud_migration_snapshot_uid - v2','CREATE UNIQUE INDEX `UQE_cloud_migration_snapshot_uid` ON `cloud_migration_snapshot` (`uid`);',1,'','2025-05-30 04:52:47'),(604,'copy cloud_migration_snapshot v1 to v2','INSERT INTO `cloud_migration_snapshot` (`uid`\n, `session_uid`\n, `result`\n, `created`\n, `updated`\n, `finished`\n, `id`) SELECT `uid`\n, `cloud_migration_uid`\n, `result`\n, `created`\n, `updated`\n, `finished`\n, `id` FROM `cloud_migration_snapshot_tmp_qwerty`',1,'','2025-05-30 04:52:47'),(605,'drop cloud_migration_snapshot_tmp_qwerty','DROP TABLE IF EXISTS `cloud_migration_snapshot_tmp_qwerty`',1,'','2025-05-30 04:52:47'),(606,'add snapshot upload_url column','alter table `cloud_migration_snapshot` ADD COLUMN `upload_url` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-05-30 04:52:47'),(607,'add snapshot status column','alter table `cloud_migration_snapshot` ADD COLUMN `status` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL ',1,'','2025-05-30 04:52:47'),(608,'add snapshot local_directory column','alter table `cloud_migration_snapshot` ADD COLUMN `local_directory` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-05-30 04:52:47'),(609,'add snapshot gms_snapshot_uid column','alter table `cloud_migration_snapshot` ADD COLUMN `gms_snapshot_uid` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-05-30 04:52:47'),(610,'add snapshot encryption_key column','alter table `cloud_migration_snapshot` ADD COLUMN `encryption_key` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-05-30 04:52:47'),(611,'add snapshot error_string column','alter table `cloud_migration_snapshot` ADD COLUMN `error_string` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-05-30 04:52:47'),(612,'create cloud_migration_resource table v1','CREATE TABLE IF NOT EXISTS `cloud_migration_resource` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `resource_type` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `resource_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `status` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `error_string` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `snapshot_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:47'),(613,'delete cloud_migration_snapshot.result column','ALTER TABLE cloud_migration_snapshot DROP COLUMN result',1,'','2025-05-30 04:52:47'),(614,'add cloud_migration_resource.name column','alter table `cloud_migration_resource` ADD COLUMN `name` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-05-30 04:52:47'),(615,'add cloud_migration_resource.parent_name column','alter table `cloud_migration_resource` ADD COLUMN `parent_name` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-05-30 04:52:47'),(616,'add cloud_migration_session.org_id column','alter table `cloud_migration_session` ADD COLUMN `org_id` BIGINT(20) NOT NULL DEFAULT 1 ',1,'','2025-05-30 04:52:47'),(617,'add cloud_migration_resource.error_code column','alter table `cloud_migration_resource` ADD COLUMN `error_code` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-05-30 04:52:47'),(618,'increase resource_uid column length','ALTER TABLE cloud_migration_resource MODIFY resource_uid NVARCHAR(255);',1,'','2025-05-30 04:52:47'),(619,'alter kv_store.value to longtext','ALTER TABLE kv_store MODIFY value LONGTEXT NOT NULL;',1,'','2025-05-30 04:52:47'),(620,'add notification_settings column to alert_rule table','alter table `alert_rule` ADD COLUMN `notification_settings` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-05-30 04:52:47'),(621,'add notification_settings column to alert_rule_version table','alter table `alert_rule_version` ADD COLUMN `notification_settings` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-05-30 04:52:47'),(622,'removing scope from alert.instances:read action migration','code migration',1,'','2025-05-30 04:52:47'),(623,'managed folder permissions alerting silences actions migration','code migration',1,'','2025-05-30 04:52:47'),(624,'add record column to alert_rule table','alter table `alert_rule` ADD COLUMN `record` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-05-30 04:52:47'),(625,'add record column to alert_rule_version table','alter table `alert_rule_version` ADD COLUMN `record` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-05-30 04:52:47'),(626,'add resolved_at column to alert_instance table','alter table `alert_instance` ADD COLUMN `resolved_at` BIGINT(20) NULL ',1,'','2025-05-30 04:52:48'),(627,'add last_sent_at column to alert_instance table','alter table `alert_instance` ADD COLUMN `last_sent_at` BIGINT(20) NULL ',1,'','2025-05-30 04:52:48'),(628,'Add scope to alert.notifications.receivers:read and alert.notifications.receivers.secrets:read','code migration',1,'','2025-05-30 04:52:48'),(629,'add metadata column to alert_rule table','alter table `alert_rule` ADD COLUMN `metadata` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-05-30 04:52:48'),(630,'add metadata column to alert_rule_version table','alter table `alert_rule_version` ADD COLUMN `metadata` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-05-30 04:52:48'),(631,'delete orphaned service account permissions','code migration',1,'','2025-05-30 04:52:48'),(632,'adding action set permissions','code migration',1,'','2025-05-30 04:52:48'),(633,'create user_external_session table','CREATE TABLE IF NOT EXISTS `user_external_session` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `user_auth_id` BIGINT(20) NOT NULL\n, `user_id` BIGINT(20) NOT NULL\n, `auth_module` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `access_token` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `id_token` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `refresh_token` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `session_id` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `session_id_hash` CHAR(44) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `name_id` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `name_id_hash` CHAR(44) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `expires_at` DATETIME NULL\n, `created_at` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:48'),(634,'increase name_id column length to 1024','ALTER TABLE user_external_session MODIFY name_id NVARCHAR(1024);',1,'','2025-05-30 04:52:48'),(635,'increase session_id column length to 1024','ALTER TABLE user_external_session MODIFY session_id NVARCHAR(1024);',1,'','2025-05-30 04:52:48'),(636,'remove scope from alert.notifications.receivers:create','code migration',1,'','2025-05-30 04:52:48'),(637,'add created_by column to alert_rule_version table','alter table `alert_rule_version` ADD COLUMN `created_by` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-05-30 04:52:48'),(638,'add updated_by column to alert_rule table','alter table `alert_rule` ADD COLUMN `updated_by` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL ',1,'','2025-05-30 04:52:48'),(639,'add alert_rule_state table','CREATE TABLE IF NOT EXISTS `alert_rule_state` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `org_id` BIGINT(20) NOT NULL\n, `rule_uid` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `data` LONGBLOB NOT NULL\n, `updated_at` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:48'),(640,'add index to alert_rule_state on org_id and rule_uid columns','CREATE UNIQUE INDEX `UQE_alert_rule_state_org_id_rule_uid` ON `alert_rule_state` (`org_id`,`rule_uid`);',1,'','2025-05-30 04:52:48'),(641,'add guid column to alert_rule table','alter table `alert_rule` ADD COLUMN `guid` VARCHAR(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT \'\' ',1,'','2025-05-30 04:52:48'),(642,'add rule_guid column to alert_rule_version table','alter table `alert_rule_version` ADD COLUMN `rule_guid` VARCHAR(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT \'\' ',1,'','2025-05-30 04:52:48'),(643,'cleanup alert_rule_version table','code migration',1,'','2025-05-30 04:52:48'),(644,'populate rule guid in alert rule table','code migration',1,'','2025-05-30 04:52:48'),(645,'drop index in alert_rule_version table on rule_org_id, rule_uid and version columns','DROP INDEX `UQE_alert_rule_version_rule_org_id_rule_uid_version` ON `alert_rule_version`',1,'','2025-05-30 04:52:48'),(646,'add index in alert_rule_version table on rule_org_id, rule_uid, rule_guid and version columns','CREATE UNIQUE INDEX `UQE_alert_rule_version_rule_org_id_rule_uid_rule_guid_version` ON `alert_rule_version` (`rule_org_id`,`rule_uid`,`rule_guid`,`version`);',1,'','2025-05-30 04:52:48'),(647,'add index in alert_rule_version table on rule_guid and version columns','CREATE UNIQUE INDEX `UQE_alert_rule_version_rule_guid_version` ON `alert_rule_version` (`rule_guid`,`version`);',1,'','2025-05-30 04:52:48'),(648,'add index in alert_rule table on guid columns','CREATE UNIQUE INDEX `UQE_alert_rule_guid` ON `alert_rule` (`guid`);',1,'','2025-05-30 04:52:48'),(649,'add keep_firing_for column to alert_rule','alter table `alert_rule` ADD COLUMN `keep_firing_for` BIGINT(20) NOT NULL DEFAULT 0 ',1,'','2025-05-30 04:52:48'),(650,'add keep_firing_for column to alert_rule_version','alter table `alert_rule_version` ADD COLUMN `keep_firing_for` BIGINT(20) NOT NULL DEFAULT 0 ',1,'','2025-05-30 04:52:48'),(651,'add missing_series_evals_to_resolve column to alert_rule','alter table `alert_rule` ADD COLUMN `missing_series_evals_to_resolve` SMALLINT NULL ',1,'','2025-05-30 04:52:48'),(652,'add missing_series_evals_to_resolve column to alert_rule_version','alter table `alert_rule_version` ADD COLUMN `missing_series_evals_to_resolve` SMALLINT NULL ',1,'','2025-05-30 04:52:48'),(653,'remove the datasources:drilldown action','code migration',1,'','2025-05-30 04:52:48'),(654,'remove title in folder unique index','DROP INDEX `UQE_alert_rule_org_id_namespace_uid_title` ON `alert_rule`',1,'','2025-05-30 04:52:48');
/*!40000 ALTER TABLE `migration_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ngalert_configuration`
--

DROP TABLE IF EXISTS `ngalert_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ngalert_configuration` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` bigint NOT NULL,
  `alertmanagers` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` int NOT NULL,
  `updated_at` int NOT NULL,
  `send_alerts_to` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_ngalert_configuration_org_id` (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ngalert_configuration`
--

LOCK TABLES `ngalert_configuration` WRITE;
/*!40000 ALTER TABLE `ngalert_configuration` DISABLE KEYS */;
/*!40000 ALTER TABLE `ngalert_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org`
--

DROP TABLE IF EXISTS `org`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `org` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `version` int NOT NULL,
  `name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_org_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org`
--

LOCK TABLES `org` WRITE;
/*!40000 ALTER TABLE `org` DISABLE KEYS */;
INSERT INTO `org` VALUES (1,0,'Main Org.','','','','','','',NULL,'2025-05-30 04:52:48','2025-05-30 04:52:48');
/*!40000 ALTER TABLE `org` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_user`
--

DROP TABLE IF EXISTS `org_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `org_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `role` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_org_user_org_id_user_id` (`org_id`,`user_id`),
  KEY `IDX_org_user_org_id` (`org_id`),
  KEY `IDX_org_user_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_user`
--

LOCK TABLES `org_user` WRITE;
/*!40000 ALTER TABLE `org_user` DISABLE KEYS */;
INSERT INTO `org_user` VALUES (1,1,1,'Admin','2025-05-30 04:52:48','2025-05-30 04:52:48');
/*!40000 ALTER TABLE `org_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` bigint NOT NULL,
  `action` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `scope` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `kind` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `attribute` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `identifier` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_permission_action_scope_role_id` (`action`,`scope`,`role_id`),
  KEY `IDX_permission_role_id` (`role_id`),
  KEY `IDX_permission_identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES (1,1,'datasources:read','datasources:uid:beneyhode3bpca','2025-05-30 04:56:51','2025-05-30 04:56:51','datasources','uid','beneyhode3bpca'),(2,1,'datasources:query','datasources:uid:beneyhode3bpca','2025-05-30 04:56:51','2025-05-30 04:56:51','datasources','uid','beneyhode3bpca'),(3,2,'datasources:read','datasources:uid:beneyhode3bpca','2025-05-30 04:56:51','2025-05-30 04:56:51','datasources','uid','beneyhode3bpca'),(4,2,'datasources:query','datasources:uid:beneyhode3bpca','2025-05-30 04:56:51','2025-05-30 04:56:51','datasources','uid','beneyhode3bpca'),(5,1,'datasources:read','datasources:uid:deneyivl7ckxsb','2025-05-30 04:57:13','2025-05-30 04:57:13','datasources','uid','deneyivl7ckxsb'),(6,1,'datasources:query','datasources:uid:deneyivl7ckxsb','2025-05-30 04:57:13','2025-05-30 04:57:13','datasources','uid','deneyivl7ckxsb'),(7,2,'datasources:read','datasources:uid:deneyivl7ckxsb','2025-05-30 04:57:13','2025-05-30 04:57:13','datasources','uid','deneyivl7ckxsb'),(8,2,'datasources:query','datasources:uid:deneyivl7ckxsb','2025-05-30 04:57:13','2025-05-30 04:57:13','datasources','uid','deneyivl7ckxsb'),(9,3,'folders:admin','folders:uid:ceneyjkpqkwlcc','2025-05-30 04:57:26','2025-05-30 04:57:26','folders','uid','ceneyjkpqkwlcc'),(10,3,'alert.silences:write','folders:uid:ceneyjkpqkwlcc','2025-05-30 04:57:26','2025-05-30 04:57:26','folders','uid','ceneyjkpqkwlcc'),(11,3,'library.panels:delete','folders:uid:ceneyjkpqkwlcc','2025-05-30 04:57:26','2025-05-30 04:57:26','folders','uid','ceneyjkpqkwlcc'),(12,3,'folders.permissions:read','folders:uid:ceneyjkpqkwlcc','2025-05-30 04:57:26','2025-05-30 04:57:26','folders','uid','ceneyjkpqkwlcc'),(13,3,'folders:read','folders:uid:ceneyjkpqkwlcc','2025-05-30 04:57:26','2025-05-30 04:57:26','folders','uid','ceneyjkpqkwlcc'),(14,3,'alert.rules:create','folders:uid:ceneyjkpqkwlcc','2025-05-30 04:57:26','2025-05-30 04:57:26','folders','uid','ceneyjkpqkwlcc'),(15,3,'library.panels:create','folders:uid:ceneyjkpqkwlcc','2025-05-30 04:57:26','2025-05-30 04:57:26','folders','uid','ceneyjkpqkwlcc'),(16,3,'library.panels:write','folders:uid:ceneyjkpqkwlcc','2025-05-30 04:57:26','2025-05-30 04:57:26','folders','uid','ceneyjkpqkwlcc'),(17,3,'folders.permissions:write','folders:uid:ceneyjkpqkwlcc','2025-05-30 04:57:26','2025-05-30 04:57:26','folders','uid','ceneyjkpqkwlcc'),(18,3,'dashboards:read','folders:uid:ceneyjkpqkwlcc','2025-05-30 04:57:26','2025-05-30 04:57:26','folders','uid','ceneyjkpqkwlcc'),(19,3,'dashboards:write','folders:uid:ceneyjkpqkwlcc','2025-05-30 04:57:26','2025-05-30 04:57:26','folders','uid','ceneyjkpqkwlcc'),(20,3,'dashboards:delete','folders:uid:ceneyjkpqkwlcc','2025-05-30 04:57:26','2025-05-30 04:57:26','folders','uid','ceneyjkpqkwlcc'),(21,3,'dashboards.permissions:read','folders:uid:ceneyjkpqkwlcc','2025-05-30 04:57:26','2025-05-30 04:57:26','folders','uid','ceneyjkpqkwlcc'),(22,3,'annotations:read','folders:uid:ceneyjkpqkwlcc','2025-05-30 04:57:26','2025-05-30 04:57:26','folders','uid','ceneyjkpqkwlcc'),(23,3,'annotations:delete','folders:uid:ceneyjkpqkwlcc','2025-05-30 04:57:26','2025-05-30 04:57:26','folders','uid','ceneyjkpqkwlcc'),(24,3,'alert.rules:read','folders:uid:ceneyjkpqkwlcc','2025-05-30 04:57:26','2025-05-30 04:57:26','folders','uid','ceneyjkpqkwlcc'),(25,3,'library.panels:read','folders:uid:ceneyjkpqkwlcc','2025-05-30 04:57:26','2025-05-30 04:57:26','folders','uid','ceneyjkpqkwlcc'),(26,3,'annotations:write','folders:uid:ceneyjkpqkwlcc','2025-05-30 04:57:26','2025-05-30 04:57:26','folders','uid','ceneyjkpqkwlcc'),(27,3,'annotations:create','folders:uid:ceneyjkpqkwlcc','2025-05-30 04:57:26','2025-05-30 04:57:26','folders','uid','ceneyjkpqkwlcc'),(28,3,'alert.silences:read','folders:uid:ceneyjkpqkwlcc','2025-05-30 04:57:26','2025-05-30 04:57:26','folders','uid','ceneyjkpqkwlcc'),(29,3,'folders:write','folders:uid:ceneyjkpqkwlcc','2025-05-30 04:57:26','2025-05-30 04:57:26','folders','uid','ceneyjkpqkwlcc'),(30,3,'folders:delete','folders:uid:ceneyjkpqkwlcc','2025-05-30 04:57:26','2025-05-30 04:57:26','folders','uid','ceneyjkpqkwlcc'),(31,3,'dashboards:create','folders:uid:ceneyjkpqkwlcc','2025-05-30 04:57:26','2025-05-30 04:57:26','folders','uid','ceneyjkpqkwlcc'),(32,3,'alert.rules:write','folders:uid:ceneyjkpqkwlcc','2025-05-30 04:57:26','2025-05-30 04:57:26','folders','uid','ceneyjkpqkwlcc'),(33,3,'alert.rules:delete','folders:uid:ceneyjkpqkwlcc','2025-05-30 04:57:26','2025-05-30 04:57:26','folders','uid','ceneyjkpqkwlcc'),(34,3,'dashboards.permissions:write','folders:uid:ceneyjkpqkwlcc','2025-05-30 04:57:26','2025-05-30 04:57:26','folders','uid','ceneyjkpqkwlcc'),(35,3,'alert.silences:create','folders:uid:ceneyjkpqkwlcc','2025-05-30 04:57:26','2025-05-30 04:57:26','folders','uid','ceneyjkpqkwlcc'),(36,2,'folders:edit','folders:uid:ceneyjkpqkwlcc','2025-05-30 04:57:26','2025-05-30 04:57:26','folders','uid','ceneyjkpqkwlcc'),(37,2,'folders:read','folders:uid:ceneyjkpqkwlcc','2025-05-30 04:57:26','2025-05-30 04:57:26','folders','uid','ceneyjkpqkwlcc'),(38,2,'alert.silences:create','folders:uid:ceneyjkpqkwlcc','2025-05-30 04:57:26','2025-05-30 04:57:26','folders','uid','ceneyjkpqkwlcc'),(39,2,'dashboards:write','folders:uid:ceneyjkpqkwlcc','2025-05-30 04:57:26','2025-05-30 04:57:26','folders','uid','ceneyjkpqkwlcc'),(40,2,'dashboards:delete','folders:uid:ceneyjkpqkwlcc','2025-05-30 04:57:26','2025-05-30 04:57:26','folders','uid','ceneyjkpqkwlcc'),(41,2,'annotations:create','folders:uid:ceneyjkpqkwlcc','2025-05-30 04:57:26','2025-05-30 04:57:26','folders','uid','ceneyjkpqkwlcc'),(42,2,'alert.rules:read','folders:uid:ceneyjkpqkwlcc','2025-05-30 04:57:26','2025-05-30 04:57:26','folders','uid','ceneyjkpqkwlcc'),(43,2,'alert.silences:read','folders:uid:ceneyjkpqkwlcc','2025-05-30 04:57:26','2025-05-30 04:57:26','folders','uid','ceneyjkpqkwlcc'),(44,2,'folders:write','folders:uid:ceneyjkpqkwlcc','2025-05-30 04:57:26','2025-05-30 04:57:26','folders','uid','ceneyjkpqkwlcc'),(45,2,'alert.rules:delete','folders:uid:ceneyjkpqkwlcc','2025-05-30 04:57:26','2025-05-30 04:57:26','folders','uid','ceneyjkpqkwlcc'),(46,2,'dashboards:read','folders:uid:ceneyjkpqkwlcc','2025-05-30 04:57:26','2025-05-30 04:57:26','folders','uid','ceneyjkpqkwlcc'),(47,2,'library.panels:read','folders:uid:ceneyjkpqkwlcc','2025-05-30 04:57:26','2025-05-30 04:57:26','folders','uid','ceneyjkpqkwlcc'),(48,2,'folders:delete','folders:uid:ceneyjkpqkwlcc','2025-05-30 04:57:26','2025-05-30 04:57:26','folders','uid','ceneyjkpqkwlcc'),(49,2,'library.panels:delete','folders:uid:ceneyjkpqkwlcc','2025-05-30 04:57:26','2025-05-30 04:57:26','folders','uid','ceneyjkpqkwlcc'),(50,2,'annotations:read','folders:uid:ceneyjkpqkwlcc','2025-05-30 04:57:26','2025-05-30 04:57:26','folders','uid','ceneyjkpqkwlcc'),(51,2,'dashboards:create','folders:uid:ceneyjkpqkwlcc','2025-05-30 04:57:26','2025-05-30 04:57:26','folders','uid','ceneyjkpqkwlcc'),(52,2,'alert.rules:create','folders:uid:ceneyjkpqkwlcc','2025-05-30 04:57:26','2025-05-30 04:57:26','folders','uid','ceneyjkpqkwlcc'),(53,2,'alert.rules:write','folders:uid:ceneyjkpqkwlcc','2025-05-30 04:57:26','2025-05-30 04:57:26','folders','uid','ceneyjkpqkwlcc'),(54,2,'alert.silences:write','folders:uid:ceneyjkpqkwlcc','2025-05-30 04:57:26','2025-05-30 04:57:26','folders','uid','ceneyjkpqkwlcc'),(55,2,'library.panels:create','folders:uid:ceneyjkpqkwlcc','2025-05-30 04:57:26','2025-05-30 04:57:26','folders','uid','ceneyjkpqkwlcc'),(56,2,'library.panels:write','folders:uid:ceneyjkpqkwlcc','2025-05-30 04:57:26','2025-05-30 04:57:26','folders','uid','ceneyjkpqkwlcc'),(57,2,'annotations:write','folders:uid:ceneyjkpqkwlcc','2025-05-30 04:57:26','2025-05-30 04:57:26','folders','uid','ceneyjkpqkwlcc'),(58,2,'annotations:delete','folders:uid:ceneyjkpqkwlcc','2025-05-30 04:57:26','2025-05-30 04:57:26','folders','uid','ceneyjkpqkwlcc'),(59,1,'folders:view','folders:uid:ceneyjkpqkwlcc','2025-05-30 04:57:26','2025-05-30 04:57:26','folders','uid','ceneyjkpqkwlcc'),(60,1,'alert.silences:read','folders:uid:ceneyjkpqkwlcc','2025-05-30 04:57:26','2025-05-30 04:57:26','folders','uid','ceneyjkpqkwlcc'),(61,1,'dashboards:read','folders:uid:ceneyjkpqkwlcc','2025-05-30 04:57:26','2025-05-30 04:57:26','folders','uid','ceneyjkpqkwlcc'),(62,1,'annotations:read','folders:uid:ceneyjkpqkwlcc','2025-05-30 04:57:26','2025-05-30 04:57:26','folders','uid','ceneyjkpqkwlcc'),(63,1,'folders:read','folders:uid:ceneyjkpqkwlcc','2025-05-30 04:57:26','2025-05-30 04:57:26','folders','uid','ceneyjkpqkwlcc'),(64,1,'alert.rules:read','folders:uid:ceneyjkpqkwlcc','2025-05-30 04:57:26','2025-05-30 04:57:26','folders','uid','ceneyjkpqkwlcc'),(65,1,'library.panels:read','folders:uid:ceneyjkpqkwlcc','2025-05-30 04:57:26','2025-05-30 04:57:26','folders','uid','ceneyjkpqkwlcc'),(66,3,'dashboards:admin','dashboards:uid:d7b0a5f2-103e-40e8-b6d0-3b073feb38c4','2025-05-30 04:57:48','2025-05-30 04:57:48','dashboards','uid','d7b0a5f2-103e-40e8-b6d0-3b073feb38c4'),(67,3,'dashboards:write','dashboards:uid:d7b0a5f2-103e-40e8-b6d0-3b073feb38c4','2025-05-30 04:57:48','2025-05-30 04:57:48','dashboards','uid','d7b0a5f2-103e-40e8-b6d0-3b073feb38c4'),(68,3,'dashboards:delete','dashboards:uid:d7b0a5f2-103e-40e8-b6d0-3b073feb38c4','2025-05-30 04:57:48','2025-05-30 04:57:48','dashboards','uid','d7b0a5f2-103e-40e8-b6d0-3b073feb38c4'),(69,3,'annotations:create','dashboards:uid:d7b0a5f2-103e-40e8-b6d0-3b073feb38c4','2025-05-30 04:57:48','2025-05-30 04:57:48','dashboards','uid','d7b0a5f2-103e-40e8-b6d0-3b073feb38c4'),(70,3,'dashboards.permissions:read','dashboards:uid:d7b0a5f2-103e-40e8-b6d0-3b073feb38c4','2025-05-30 04:57:48','2025-05-30 04:57:48','dashboards','uid','d7b0a5f2-103e-40e8-b6d0-3b073feb38c4'),(71,3,'dashboards.permissions:write','dashboards:uid:d7b0a5f2-103e-40e8-b6d0-3b073feb38c4','2025-05-30 04:57:48','2025-05-30 04:57:48','dashboards','uid','d7b0a5f2-103e-40e8-b6d0-3b073feb38c4'),(72,3,'annotations:read','dashboards:uid:d7b0a5f2-103e-40e8-b6d0-3b073feb38c4','2025-05-30 04:57:48','2025-05-30 04:57:48','dashboards','uid','d7b0a5f2-103e-40e8-b6d0-3b073feb38c4'),(73,3,'annotations:write','dashboards:uid:d7b0a5f2-103e-40e8-b6d0-3b073feb38c4','2025-05-30 04:57:48','2025-05-30 04:57:48','dashboards','uid','d7b0a5f2-103e-40e8-b6d0-3b073feb38c4'),(74,3,'annotations:delete','dashboards:uid:d7b0a5f2-103e-40e8-b6d0-3b073feb38c4','2025-05-30 04:57:48','2025-05-30 04:57:48','dashboards','uid','d7b0a5f2-103e-40e8-b6d0-3b073feb38c4'),(75,3,'dashboards:read','dashboards:uid:d7b0a5f2-103e-40e8-b6d0-3b073feb38c4','2025-05-30 04:57:48','2025-05-30 04:57:48','dashboards','uid','d7b0a5f2-103e-40e8-b6d0-3b073feb38c4'),(76,3,'dashboards:admin','dashboards:uid:55af68be-8b36-4fda-932d-09b304b05121','2025-05-30 04:59:13','2025-05-30 04:59:13','dashboards','uid','55af68be-8b36-4fda-932d-09b304b05121'),(77,3,'dashboards:read','dashboards:uid:55af68be-8b36-4fda-932d-09b304b05121','2025-05-30 04:59:13','2025-05-30 04:59:13','dashboards','uid','55af68be-8b36-4fda-932d-09b304b05121'),(78,3,'dashboards:write','dashboards:uid:55af68be-8b36-4fda-932d-09b304b05121','2025-05-30 04:59:13','2025-05-30 04:59:13','dashboards','uid','55af68be-8b36-4fda-932d-09b304b05121'),(79,3,'dashboards:delete','dashboards:uid:55af68be-8b36-4fda-932d-09b304b05121','2025-05-30 04:59:13','2025-05-30 04:59:13','dashboards','uid','55af68be-8b36-4fda-932d-09b304b05121'),(80,3,'dashboards.permissions:write','dashboards:uid:55af68be-8b36-4fda-932d-09b304b05121','2025-05-30 04:59:13','2025-05-30 04:59:13','dashboards','uid','55af68be-8b36-4fda-932d-09b304b05121'),(81,3,'annotations:read','dashboards:uid:55af68be-8b36-4fda-932d-09b304b05121','2025-05-30 04:59:13','2025-05-30 04:59:13','dashboards','uid','55af68be-8b36-4fda-932d-09b304b05121'),(82,3,'annotations:delete','dashboards:uid:55af68be-8b36-4fda-932d-09b304b05121','2025-05-30 04:59:13','2025-05-30 04:59:13','dashboards','uid','55af68be-8b36-4fda-932d-09b304b05121'),(83,3,'dashboards.permissions:read','dashboards:uid:55af68be-8b36-4fda-932d-09b304b05121','2025-05-30 04:59:13','2025-05-30 04:59:13','dashboards','uid','55af68be-8b36-4fda-932d-09b304b05121'),(84,3,'annotations:write','dashboards:uid:55af68be-8b36-4fda-932d-09b304b05121','2025-05-30 04:59:13','2025-05-30 04:59:13','dashboards','uid','55af68be-8b36-4fda-932d-09b304b05121'),(85,3,'annotations:create','dashboards:uid:55af68be-8b36-4fda-932d-09b304b05121','2025-05-30 04:59:13','2025-05-30 04:59:13','dashboards','uid','55af68be-8b36-4fda-932d-09b304b05121'),(86,2,'dashboards:edit','dashboards:uid:55af68be-8b36-4fda-932d-09b304b05121','2025-05-30 04:59:13','2025-05-30 04:59:13','dashboards','uid','55af68be-8b36-4fda-932d-09b304b05121'),(87,2,'annotations:read','dashboards:uid:55af68be-8b36-4fda-932d-09b304b05121','2025-05-30 04:59:13','2025-05-30 04:59:13','dashboards','uid','55af68be-8b36-4fda-932d-09b304b05121'),(88,2,'annotations:write','dashboards:uid:55af68be-8b36-4fda-932d-09b304b05121','2025-05-30 04:59:13','2025-05-30 04:59:13','dashboards','uid','55af68be-8b36-4fda-932d-09b304b05121'),(89,2,'annotations:delete','dashboards:uid:55af68be-8b36-4fda-932d-09b304b05121','2025-05-30 04:59:13','2025-05-30 04:59:13','dashboards','uid','55af68be-8b36-4fda-932d-09b304b05121'),(90,2,'annotations:create','dashboards:uid:55af68be-8b36-4fda-932d-09b304b05121','2025-05-30 04:59:13','2025-05-30 04:59:13','dashboards','uid','55af68be-8b36-4fda-932d-09b304b05121'),(91,2,'dashboards:read','dashboards:uid:55af68be-8b36-4fda-932d-09b304b05121','2025-05-30 04:59:13','2025-05-30 04:59:13','dashboards','uid','55af68be-8b36-4fda-932d-09b304b05121'),(92,2,'dashboards:write','dashboards:uid:55af68be-8b36-4fda-932d-09b304b05121','2025-05-30 04:59:13','2025-05-30 04:59:13','dashboards','uid','55af68be-8b36-4fda-932d-09b304b05121'),(93,2,'dashboards:delete','dashboards:uid:55af68be-8b36-4fda-932d-09b304b05121','2025-05-30 04:59:13','2025-05-30 04:59:13','dashboards','uid','55af68be-8b36-4fda-932d-09b304b05121'),(94,1,'dashboards:view','dashboards:uid:55af68be-8b36-4fda-932d-09b304b05121','2025-05-30 04:59:13','2025-05-30 04:59:13','dashboards','uid','55af68be-8b36-4fda-932d-09b304b05121'),(95,1,'dashboards:read','dashboards:uid:55af68be-8b36-4fda-932d-09b304b05121','2025-05-30 04:59:13','2025-05-30 04:59:13','dashboards','uid','55af68be-8b36-4fda-932d-09b304b05121'),(96,1,'annotations:read','dashboards:uid:55af68be-8b36-4fda-932d-09b304b05121','2025-05-30 04:59:13','2025-05-30 04:59:13','dashboards','uid','55af68be-8b36-4fda-932d-09b304b05121'),(97,3,'dashboards:admin','dashboards:uid:49785456-5a88-40dc-99f2-45f909e23f93','2025-05-30 04:59:26','2025-05-30 04:59:26','dashboards','uid','49785456-5a88-40dc-99f2-45f909e23f93'),(98,3,'annotations:create','dashboards:uid:49785456-5a88-40dc-99f2-45f909e23f93','2025-05-30 04:59:26','2025-05-30 04:59:26','dashboards','uid','49785456-5a88-40dc-99f2-45f909e23f93'),(99,3,'dashboards:write','dashboards:uid:49785456-5a88-40dc-99f2-45f909e23f93','2025-05-30 04:59:26','2025-05-30 04:59:26','dashboards','uid','49785456-5a88-40dc-99f2-45f909e23f93'),(100,3,'dashboards:delete','dashboards:uid:49785456-5a88-40dc-99f2-45f909e23f93','2025-05-30 04:59:26','2025-05-30 04:59:26','dashboards','uid','49785456-5a88-40dc-99f2-45f909e23f93'),(101,3,'dashboards.permissions:write','dashboards:uid:49785456-5a88-40dc-99f2-45f909e23f93','2025-05-30 04:59:26','2025-05-30 04:59:26','dashboards','uid','49785456-5a88-40dc-99f2-45f909e23f93'),(102,3,'annotations:delete','dashboards:uid:49785456-5a88-40dc-99f2-45f909e23f93','2025-05-30 04:59:26','2025-05-30 04:59:26','dashboards','uid','49785456-5a88-40dc-99f2-45f909e23f93'),(103,3,'dashboards:read','dashboards:uid:49785456-5a88-40dc-99f2-45f909e23f93','2025-05-30 04:59:26','2025-05-30 04:59:26','dashboards','uid','49785456-5a88-40dc-99f2-45f909e23f93'),(104,3,'dashboards.permissions:read','dashboards:uid:49785456-5a88-40dc-99f2-45f909e23f93','2025-05-30 04:59:26','2025-05-30 04:59:26','dashboards','uid','49785456-5a88-40dc-99f2-45f909e23f93'),(105,3,'annotations:read','dashboards:uid:49785456-5a88-40dc-99f2-45f909e23f93','2025-05-30 04:59:26','2025-05-30 04:59:26','dashboards','uid','49785456-5a88-40dc-99f2-45f909e23f93'),(106,3,'annotations:write','dashboards:uid:49785456-5a88-40dc-99f2-45f909e23f93','2025-05-30 04:59:26','2025-05-30 04:59:26','dashboards','uid','49785456-5a88-40dc-99f2-45f909e23f93'),(107,2,'dashboards:edit','dashboards:uid:49785456-5a88-40dc-99f2-45f909e23f93','2025-05-30 04:59:26','2025-05-30 04:59:26','dashboards','uid','49785456-5a88-40dc-99f2-45f909e23f93'),(108,2,'annotations:write','dashboards:uid:49785456-5a88-40dc-99f2-45f909e23f93','2025-05-30 04:59:26','2025-05-30 04:59:26','dashboards','uid','49785456-5a88-40dc-99f2-45f909e23f93'),(109,2,'annotations:delete','dashboards:uid:49785456-5a88-40dc-99f2-45f909e23f93','2025-05-30 04:59:26','2025-05-30 04:59:26','dashboards','uid','49785456-5a88-40dc-99f2-45f909e23f93'),(110,2,'annotations:create','dashboards:uid:49785456-5a88-40dc-99f2-45f909e23f93','2025-05-30 04:59:26','2025-05-30 04:59:26','dashboards','uid','49785456-5a88-40dc-99f2-45f909e23f93'),(111,2,'dashboards:read','dashboards:uid:49785456-5a88-40dc-99f2-45f909e23f93','2025-05-30 04:59:26','2025-05-30 04:59:26','dashboards','uid','49785456-5a88-40dc-99f2-45f909e23f93'),(112,2,'dashboards:write','dashboards:uid:49785456-5a88-40dc-99f2-45f909e23f93','2025-05-30 04:59:26','2025-05-30 04:59:26','dashboards','uid','49785456-5a88-40dc-99f2-45f909e23f93'),(113,2,'dashboards:delete','dashboards:uid:49785456-5a88-40dc-99f2-45f909e23f93','2025-05-30 04:59:26','2025-05-30 04:59:26','dashboards','uid','49785456-5a88-40dc-99f2-45f909e23f93'),(114,2,'annotations:read','dashboards:uid:49785456-5a88-40dc-99f2-45f909e23f93','2025-05-30 04:59:26','2025-05-30 04:59:26','dashboards','uid','49785456-5a88-40dc-99f2-45f909e23f93'),(115,1,'dashboards:view','dashboards:uid:49785456-5a88-40dc-99f2-45f909e23f93','2025-05-30 04:59:26','2025-05-30 04:59:26','dashboards','uid','49785456-5a88-40dc-99f2-45f909e23f93'),(116,1,'dashboards:read','dashboards:uid:49785456-5a88-40dc-99f2-45f909e23f93','2025-05-30 04:59:26','2025-05-30 04:59:26','dashboards','uid','49785456-5a88-40dc-99f2-45f909e23f93'),(117,1,'annotations:read','dashboards:uid:49785456-5a88-40dc-99f2-45f909e23f93','2025-05-30 04:59:26','2025-05-30 04:59:26','dashboards','uid','49785456-5a88-40dc-99f2-45f909e23f93');
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist`
--

DROP TABLE IF EXISTS `playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `interval` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `org_id` bigint NOT NULL,
  `created_at` bigint NOT NULL DEFAULT '0',
  `updated_at` bigint NOT NULL DEFAULT '0',
  `uid` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_playlist_org_id_uid` (`org_id`,`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist`
--

LOCK TABLES `playlist` WRITE;
/*!40000 ALTER TABLE `playlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist_item`
--

DROP TABLE IF EXISTS `playlist_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `playlist_id` bigint NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist_item`
--

LOCK TABLES `playlist_item` WRITE;
/*!40000 ALTER TABLE `playlist_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlist_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_setting`
--

DROP TABLE IF EXISTS `plugin_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plugin_setting` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` bigint NOT NULL DEFAULT '1',
  `plugin_id` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `pinned` tinyint(1) NOT NULL,
  `json_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `secure_json_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `plugin_version` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_plugin_setting_org_id_plugin_id` (`org_id`,`plugin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_setting`
--

LOCK TABLES `plugin_setting` WRITE;
/*!40000 ALTER TABLE `plugin_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preferences`
--

DROP TABLE IF EXISTS `preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preferences` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `version` int NOT NULL,
  `home_dashboard_id` bigint NOT NULL,
  `timezone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `team_id` bigint DEFAULT NULL,
  `week_start` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `json_data` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_preferences_org_id` (`org_id`),
  KEY `IDX_preferences_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preferences`
--

LOCK TABLES `preferences` WRITE;
/*!40000 ALTER TABLE `preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provenance_type`
--

DROP TABLE IF EXISTS `provenance_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provenance_type` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` bigint NOT NULL,
  `record_key` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `record_type` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `provenance` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_provenance_type_record_type_record_key_org_id` (`record_type`,`record_key`,`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provenance_type`
--

LOCK TABLES `provenance_type` WRITE;
/*!40000 ALTER TABLE `provenance_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `provenance_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `query_history`
--

DROP TABLE IF EXISTS `query_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `query_history` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `org_id` bigint NOT NULL,
  `datasource_uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint DEFAULT NULL,
  `created_at` int NOT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queries` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_query_history_org_id_created_by_datasource_uid` (`org_id`,`created_by`,`datasource_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `query_history`
--

LOCK TABLES `query_history` WRITE;
/*!40000 ALTER TABLE `query_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `query_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `query_history_details`
--

DROP TABLE IF EXISTS `query_history_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `query_history_details` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `query_history_item_uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `datasource_uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `query_history_details`
--

LOCK TABLES `query_history_details` WRITE;
/*!40000 ALTER TABLE `query_history_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `query_history_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `query_history_star`
--

DROP TABLE IF EXISTS `query_history_star`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `query_history_star` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `query_uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `org_id` bigint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_query_history_star_user_id_query_uid` (`user_id`,`query_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `query_history_star`
--

LOCK TABLES `query_history_star` WRITE;
/*!40000 ALTER TABLE `query_history_star` DISABLE KEYS */;
/*!40000 ALTER TABLE `query_history_star` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quota`
--

DROP TABLE IF EXISTS `quota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quota` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `target` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `limit` bigint NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_quota_org_id_user_id_target` (`org_id`,`user_id`,`target`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quota`
--

LOCK TABLES `quota` WRITE;
/*!40000 ALTER TABLE `quota` DISABLE KEYS */;
/*!40000 ALTER TABLE `quota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource`
--

DROP TABLE IF EXISTS `resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resource` (
  `guid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `resource_version` bigint DEFAULT NULL,
  `group` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `resource` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `namespace` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(253) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `action` int NOT NULL,
  `label_set` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `previous_resource_version` bigint DEFAULT NULL,
  `folder` varchar(253) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `UQE_resource_namespace_group_resource_name` (`namespace`,`group`,`resource`,`name`),
  KEY `IDX_resource_group_resource` (`group`,`resource`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource`
--

LOCK TABLES `resource` WRITE;
/*!40000 ALTER TABLE `resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_blob`
--

DROP TABLE IF EXISTS `resource_blob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resource_blob` (
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `group` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `resource` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `namespace` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(253) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longblob NOT NULL,
  `hash` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `IDX_resource_history_namespace_group_name` (`namespace`,`group`,`resource`,`name`),
  KEY `IDX_resource_blob_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_blob`
--

LOCK TABLES `resource_blob` WRITE;
/*!40000 ALTER TABLE `resource_blob` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_blob` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_history`
--

DROP TABLE IF EXISTS `resource_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resource_history` (
  `guid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `resource_version` bigint DEFAULT NULL,
  `group` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `resource` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `namespace` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(253) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `action` int NOT NULL,
  `label_set` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `previous_resource_version` bigint DEFAULT NULL,
  `folder` varchar(253) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `generation` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `UQE_resource_history_namespace_group_name_version` (`namespace`,`group`,`resource`,`name`,`resource_version`),
  KEY `IDX_resource_history_resource_version` (`resource_version`),
  KEY `IDX_resource_history_group_resource_resource_version` (`group`,`resource`,`resource_version`),
  KEY `IDX_resource_history_namespace_group_resource_action_version` (`namespace`,`group`,`resource`,`action`,`resource_version`),
  KEY `IDX_resource_history_namespace_group_resource_name_generation` (`namespace`,`group`,`resource`,`name`,`generation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_history`
--

LOCK TABLES `resource_history` WRITE;
/*!40000 ALTER TABLE `resource_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_migration_log`
--

DROP TABLE IF EXISTS `resource_migration_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resource_migration_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `migration_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sql` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `success` tinyint(1) NOT NULL,
  `error` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_migration_log`
--

LOCK TABLES `resource_migration_log` WRITE;
/*!40000 ALTER TABLE `resource_migration_log` DISABLE KEYS */;
INSERT INTO `resource_migration_log` VALUES (1,'create resource_migration_log table','CREATE TABLE IF NOT EXISTS `resource_migration_log` (\n`id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL\n, `migration_id` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `sql` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `success` TINYINT(1) NOT NULL\n, `error` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `timestamp` DATETIME NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:48'),(2,'Initialize resource tables','',1,'','2025-05-30 04:52:48'),(3,'drop table resource','DROP TABLE IF EXISTS `resource`',1,'','2025-05-30 04:52:48'),(4,'create table resource','CREATE TABLE IF NOT EXISTS `resource` (\n`guid` VARCHAR(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci PRIMARY KEY NOT NULL\n, `resource_version` BIGINT(20) NULL\n, `group` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `resource` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `namespace` VARCHAR(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `name` VARCHAR(253) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `value` LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `action` INT NOT NULL\n, `label_set` VARCHAR(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:48'),(5,'create table resource, index: 0','CREATE UNIQUE INDEX `UQE_resource_namespace_group_resource_name` ON `resource` (`namespace`,`group`,`resource`,`name`);',1,'','2025-05-30 04:52:48'),(6,'drop table resource_history','DROP TABLE IF EXISTS `resource_history`',1,'','2025-05-30 04:52:48'),(7,'create table resource_history','CREATE TABLE IF NOT EXISTS `resource_history` (\n`guid` VARCHAR(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci PRIMARY KEY NOT NULL\n, `resource_version` BIGINT(20) NULL\n, `group` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `resource` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `namespace` VARCHAR(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `name` VARCHAR(253) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `value` LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n, `action` INT NOT NULL\n, `label_set` VARCHAR(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:48'),(8,'create table resource_history, index: 0','CREATE UNIQUE INDEX `UQE_resource_history_namespace_group_name_version` ON `resource_history` (`namespace`,`group`,`resource`,`name`,`resource_version`);',1,'','2025-05-30 04:52:48'),(9,'create table resource_history, index: 1','CREATE INDEX `IDX_resource_history_resource_version` ON `resource_history` (`resource_version`);',1,'','2025-05-30 04:52:48'),(10,'drop table resource_version','DROP TABLE IF EXISTS `resource_version`',1,'','2025-05-30 04:52:48'),(11,'create table resource_version','CREATE TABLE IF NOT EXISTS `resource_version` (\n`group` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `resource` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `resource_version` BIGINT(20) NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:48'),(12,'create table resource_version, index: 0','CREATE UNIQUE INDEX `UQE_resource_version_group_resource` ON `resource_version` (`group`,`resource`);',1,'','2025-05-30 04:52:48'),(13,'drop table resource_blob','DROP TABLE IF EXISTS `resource_blob`',1,'','2025-05-30 04:52:48'),(14,'create table resource_blob','CREATE TABLE IF NOT EXISTS `resource_blob` (\n`uuid` CHAR(36) PRIMARY KEY NOT NULL\n, `created` DATETIME NOT NULL\n, `group` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `resource` VARCHAR(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `namespace` VARCHAR(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `name` VARCHAR(253) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `value` LONGBLOB NOT NULL\n, `hash` VARCHAR(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n, `content_type` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci;',1,'','2025-05-30 04:52:48'),(15,'create table resource_blob, index: 0','CREATE INDEX `IDX_resource_history_namespace_group_name` ON `resource_blob` (`namespace`,`group`,`resource`,`name`);',1,'','2025-05-30 04:52:48'),(16,'create table resource_blob, index: 1','CREATE INDEX `IDX_resource_blob_created` ON `resource_blob` (`created`);',1,'','2025-05-30 04:52:48'),(17,'Add column previous_resource_version in resource_history','alter table `resource_history` ADD COLUMN `previous_resource_version` BIGINT(20) NULL ',1,'','2025-05-30 04:52:48'),(18,'Add column previous_resource_version in resource','alter table `resource` ADD COLUMN `previous_resource_version` BIGINT(20) NULL ',1,'','2025-05-30 04:52:48'),(19,'Add index to resource_history for polling','CREATE INDEX `IDX_resource_history_group_resource_resource_version` ON `resource_history` (`group`,`resource`,`resource_version`);',1,'','2025-05-30 04:52:48'),(20,'Add index to resource for loading','CREATE INDEX `IDX_resource_group_resource` ON `resource` (`group`,`resource`);',1,'','2025-05-30 04:52:48'),(21,'Add column folder in resource_history','alter table `resource_history` ADD COLUMN `folder` VARCHAR(253) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT \'\' ',1,'','2025-05-30 04:52:48'),(22,'Add column folder in resource','alter table `resource` ADD COLUMN `folder` VARCHAR(253) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT \'\' ',1,'','2025-05-30 04:52:48'),(23,'Migrate DeletionMarkers to real Resource objects','Find rows in resource_history with value LIKE {\"kind\":\"DeletedMarker\"%',1,'','2025-05-30 04:52:48'),(24,'Add index to resource_history for get trash','CREATE INDEX `IDX_resource_history_namespace_group_resource_action_version` ON `resource_history` (`namespace`,`group`,`resource`,`action`,`resource_version`);',1,'','2025-05-30 04:52:48'),(25,'Add generation to resource history','alter table `resource_history` ADD COLUMN `generation` BIGINT(20) NOT NULL DEFAULT 0 ',1,'','2025-05-30 04:52:48'),(26,'Add generation index to resource history','CREATE INDEX `IDX_resource_history_namespace_group_resource_name_generation` ON `resource_history` (`namespace`,`group`,`resource`,`name`,`generation`);',1,'','2025-05-30 04:52:48');
/*!40000 ALTER TABLE `resource_migration_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_version`
--

DROP TABLE IF EXISTS `resource_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resource_version` (
  `group` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `resource` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `resource_version` bigint NOT NULL,
  UNIQUE KEY `UQE_resource_version_group_resource` (`group`,`resource`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_version`
--

LOCK TABLES `resource_version` WRITE;
/*!40000 ALTER TABLE `resource_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `version` bigint NOT NULL,
  `org_id` bigint NOT NULL,
  `uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `display_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_role_org_id_name` (`org_id`,`name`),
  UNIQUE KEY `UQE_role_uid` (`uid`),
  KEY `IDX_role_org_id` (`org_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'managed:builtins:viewer:permissions','',0,1,'eeneyhodt2ps0c','2025-05-30 04:56:51','2025-05-30 04:56:51','','',0),(2,'managed:builtins:editor:permissions','',0,1,'deneyhoe0ketcf','2025-05-30 04:56:51','2025-05-30 04:56:51','','',0),(3,'managed:users:1:permissions','',0,1,'feneyjkqfjw1sf','2025-05-30 04:57:26','2025-05-30 04:57:26','','',0);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `secrets`
--

DROP TABLE IF EXISTS `secrets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `secrets` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` bigint NOT NULL,
  `namespace` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secrets`
--

LOCK TABLES `secrets` WRITE;
/*!40000 ALTER TABLE `secrets` DISABLE KEYS */;
INSERT INTO `secrets` VALUES (1,1,'prometheus','datasource','I1lXVnVaWGxtZUcwNWVEbHRiMlUjKllXVnpMV05tWWcqMFJ5eW13ZU7M2qaMzadGMItz24OGeib5U6pVHyUqdx2z0s61+I5vXOsqkrEseY+OEhpvyLTK86s','2025-05-30 04:56:51','2025-05-30 04:57:05'),(2,1,'loki','datasource','I1lXVnVaWGxtZUcwNWVEbHRiMlUjKllXVnpMV05tWWcqRm0yRE9mUkVqeLNuZYHgplz9yXznrKULqK4','2025-05-30 04:57:13','2025-05-30 04:57:17');
/*!40000 ALTER TABLE `secrets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seed_assignment`
--

DROP TABLE IF EXISTS `seed_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seed_assignment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `builtin_role` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_name` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scope` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `origin` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_seed_assignment_builtin_role_role_name` (`builtin_role`,`role_name`),
  UNIQUE KEY `UQE_seed_assignment_builtin_role_action_scope` (`builtin_role`,`action`,`scope`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seed_assignment`
--

LOCK TABLES `seed_assignment` WRITE;
/*!40000 ALTER TABLE `seed_assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `seed_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server_lock`
--

DROP TABLE IF EXISTS `server_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `server_lock` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `operation_uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` bigint NOT NULL,
  `last_execution` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_server_lock_operation_uid` (`operation_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_lock`
--

LOCK TABLES `server_lock` WRITE;
/*!40000 ALTER TABLE `server_lock` DISABLE KEYS */;
INSERT INTO `server_lock` VALUES (1,'migrate API keys to service accounts',1,1748580769),(2,'cleanup expired auth tokens',1,1748580769),(4,'dashboard-cleanup',160,1748585569),(5,'delete old login attempts',8,1748585569);
/*!40000 ALTER TABLE `server_lock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `session` (
  `key` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` blob NOT NULL,
  `expiry` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `short_url`
--

DROP TABLE IF EXISTS `short_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `short_url` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` bigint NOT NULL,
  `uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint DEFAULT NULL,
  `created_at` int NOT NULL,
  `last_seen_at` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_short_url_org_id_uid` (`org_id`,`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `short_url`
--

LOCK TABLES `short_url` WRITE;
/*!40000 ALTER TABLE `short_url` DISABLE KEYS */;
/*!40000 ALTER TABLE `short_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `signing_key`
--

DROP TABLE IF EXISTS `signing_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `signing_key` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `key_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `private_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `added_at` datetime NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `alg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_signing_key_key_id` (`key_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `signing_key`
--

LOCK TABLES `signing_key` WRITE;
/*!40000 ALTER TABLE `signing_key` DISABLE KEYS */;
INSERT INTO `signing_key` VALUES (1,'id-2025-05-es256','I1lXVnVaWGxtZUcwNWVEbHRiMlUjKllXVnpMV05tWWcqTDllMkpCbzA3KYnuXJB25B5s6OfMA+JE0NBatTYOp3tfQm+0dXgU4TBXDomkUHUPj89OWi4GfUMQNW8841XK+iV6X/hlQE+ngcnHUvfbQ77HO1XPs8yJe9zGp79d7WUjF+mkS7wvorPhhLwVBv5Mxe7DXLSOt+OwG5WWsiAzQO984YsbyD5eGVTvgmpZ+1bzApLknDjplEUYxrTn/Cn+ndkbNqQdCxneSedfIbSqHOxe0xfG7G2stoApRLvIyY5JISucPYgIYNPOuq9vEwxOMhX9rh4nQAXeSUfWMxo1iUuivD/orgTq/Ii3/Y9PpSNNZM2NoWz440M5GNdTzLcL2rMfrHL2Z09rzw','2025-05-30 04:56:19','2025-06-29 04:56:19','ES256');
/*!40000 ALTER TABLE `signing_key` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sso_setting`
--

DROP TABLE IF EXISTS `sso_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sso_setting` (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sso_setting`
--

LOCK TABLES `sso_setting` WRITE;
/*!40000 ALTER TABLE `sso_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `sso_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `star`
--

DROP TABLE IF EXISTS `star`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `star` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `dashboard_id` bigint NOT NULL,
  `dashboard_uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `org_id` bigint DEFAULT '1',
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_star_user_id_dashboard_id` (`user_id`,`dashboard_id`),
  UNIQUE KEY `UQE_star_user_id_dashboard_uid_org_id` (`user_id`,`dashboard_uid`,`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `star`
--

LOCK TABLES `star` WRITE;
/*!40000 ALTER TABLE `star` DISABLE KEYS */;
/*!40000 ALTER TABLE `star` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_tag_key_value` (`key`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `org_id` bigint NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_uid` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_provisioned` tinyint(1) DEFAULT NULL,
  `email` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_team_org_id_name` (`org_id`,`name`),
  UNIQUE KEY `UQE_team_org_id_uid` (`org_id`,`uid`),
  KEY `IDX_team_org_id` (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_member`
--

DROP TABLE IF EXISTS `team_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_member` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` bigint NOT NULL,
  `team_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `external` tinyint(1) DEFAULT NULL,
  `permission` smallint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_team_member_org_id_team_id_user_id` (`org_id`,`team_id`,`user_id`),
  KEY `IDX_team_member_org_id` (`org_id`),
  KEY `IDX_team_member_team_id` (`team_id`),
  KEY `IDX_team_member_user_id_org_id` (`user_id`,`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_member`
--

LOCK TABLES `team_member` WRITE;
/*!40000 ALTER TABLE `team_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `team_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_role`
--

DROP TABLE IF EXISTS `team_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` bigint NOT NULL,
  `team_id` bigint NOT NULL,
  `role_id` bigint NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_team_role_org_id_team_id_role_id` (`org_id`,`team_id`,`role_id`),
  KEY `IDX_team_role_org_id` (`org_id`),
  KEY `IDX_team_role_team_id` (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_role`
--

LOCK TABLES `team_role` WRITE;
/*!40000 ALTER TABLE `team_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `team_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temp_user`
--

DROP TABLE IF EXISTS `temp_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temp_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` bigint NOT NULL,
  `version` int NOT NULL,
  `email` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `invited_by_user_id` bigint DEFAULT NULL,
  `email_sent` tinyint(1) NOT NULL,
  `email_sent_on` datetime DEFAULT NULL,
  `remote_addr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` int NOT NULL DEFAULT '0',
  `updated` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IDX_temp_user_email` (`email`),
  KEY `IDX_temp_user_org_id` (`org_id`),
  KEY `IDX_temp_user_code` (`code`),
  KEY `IDX_temp_user_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temp_user`
--

LOCK TABLES `temp_user` WRITE;
/*!40000 ALTER TABLE `temp_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `temp_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_data`
--

DROP TABLE IF EXISTS `test_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `metric1` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metric2` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value_big_int` bigint DEFAULT NULL,
  `value_double` double DEFAULT NULL,
  `value_float` float DEFAULT NULL,
  `value_int` int DEFAULT NULL,
  `time_epoch` bigint NOT NULL,
  `time_date_time` datetime NOT NULL,
  `time_time_stamp` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_data`
--

LOCK TABLES `test_data` WRITE;
/*!40000 ALTER TABLE `test_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `version` int NOT NULL,
  `login` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salt` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rands` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `org_id` bigint NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `email_verified` tinyint(1) DEFAULT NULL,
  `theme` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `help_flags1` bigint NOT NULL DEFAULT '0',
  `last_seen_at` datetime DEFAULT NULL,
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0',
  `is_service_account` tinyint(1) DEFAULT '0',
  `uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_provisioned` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_user_login` (`login`),
  UNIQUE KEY `UQE_user_email` (`email`),
  UNIQUE KEY `UQE_user_uid` (`uid`),
  KEY `IDX_user_login_email` (`login`,`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,0,'admin','admin@localhost','','860c0dbe7384814b4c6b6685e59ecf55acceaeed9e7484536452f27810d3fc163ffe9e08efad4dfeea8ea9d278555232e353','iQi9q0p9Xt','mCTOriLzdU','',1,1,0,'','2025-05-30 04:52:48','2025-05-30 04:56:25',0,'2025-05-30 04:56:25',0,0,'feney4okjnv28a',0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_auth`
--

DROP TABLE IF EXISTS `user_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_auth` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `auth_module` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `auth_id` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL,
  `o_auth_access_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `o_auth_refresh_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `o_auth_token_type` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `o_auth_expiry` datetime DEFAULT NULL,
  `o_auth_id_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `external_uid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_user_auth_auth_module_auth_id` (`auth_module`,`auth_id`),
  KEY `IDX_user_auth_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_auth`
--

LOCK TABLES `user_auth` WRITE;
/*!40000 ALTER TABLE `user_auth` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_auth_token`
--

DROP TABLE IF EXISTS `user_auth_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_auth_token` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `auth_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `prev_auth_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `auth_token_seen` tinyint(1) NOT NULL,
  `seen_at` int DEFAULT NULL,
  `rotated_at` int NOT NULL,
  `created_at` int NOT NULL,
  `updated_at` int NOT NULL,
  `revoked_at` int DEFAULT NULL,
  `external_session_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_user_auth_token_auth_token` (`auth_token`),
  UNIQUE KEY `UQE_user_auth_token_prev_auth_token` (`prev_auth_token`),
  KEY `IDX_user_auth_token_user_id` (`user_id`),
  KEY `IDX_user_auth_token_revoked_at` (`revoked_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_auth_token`
--

LOCK TABLES `user_auth_token` WRITE;
/*!40000 ALTER TABLE `user_auth_token` DISABLE KEYS */;
INSERT INTO `user_auth_token` VALUES (1,1,'f0ab6c317ade7a52e47dfdcaaeb7cdcc07dbd9c80b264065d29989dc7f573d33','f0ab6c317ade7a52e47dfdcaaeb7cdcc07dbd9c80b264065d29989dc7f573d33','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36','172.18.0.1',1,1748580985,1748580978,1748580978,1748580978,0,0);
/*!40000 ALTER TABLE `user_auth_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_external_session`
--

DROP TABLE IF EXISTS `user_external_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_external_session` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_auth_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `auth_module` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `id_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `refresh_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `session_id` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `session_id_hash` char(44) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_id` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `name_id_hash` char(44) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_external_session`
--

LOCK TABLES `user_external_session` WRITE;
/*!40000 ALTER TABLE `user_external_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_external_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `role_id` bigint NOT NULL,
  `created` datetime NOT NULL,
  `group_mapping_uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_user_role_org_id_user_id_role_id_group_mapping_uid` (`org_id`,`user_id`,`role_id`,`group_mapping_uid`),
  KEY `IDX_user_role_org_id` (`org_id`),
  KEY `IDX_user_role_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,1,1,3,'2025-05-30 04:57:26','');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-30 13:13:03
