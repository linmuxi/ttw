/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.6.24 : Database - ttw
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ttw` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `ttw`;

/*Table structure for table `act_evt_log` */

DROP TABLE IF EXISTS `act_evt_log`;

CREATE TABLE `act_evt_log` (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `act_ge_bytearray` */

DROP TABLE IF EXISTS `act_ge_bytearray`;

CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `act_ge_property` */

DROP TABLE IF EXISTS `act_ge_property`;

CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `act_hi_actinst` */

DROP TABLE IF EXISTS `act_hi_actinst`;

CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `act_hi_attachment` */

DROP TABLE IF EXISTS `act_hi_attachment`;

CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `act_hi_comment` */

DROP TABLE IF EXISTS `act_hi_comment`;

CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `act_hi_detail` */

DROP TABLE IF EXISTS `act_hi_detail`;

CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `act_hi_identitylink` */

DROP TABLE IF EXISTS `act_hi_identitylink`;

CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `act_hi_procinst` */

DROP TABLE IF EXISTS `act_hi_procinst`;

CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `act_hi_taskinst` */

DROP TABLE IF EXISTS `act_hi_taskinst`;

CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `act_hi_varinst` */

DROP TABLE IF EXISTS `act_hi_varinst`;

CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `act_id_group` */

DROP TABLE IF EXISTS `act_id_group`;

CREATE TABLE `act_id_group` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `act_id_info` */

DROP TABLE IF EXISTS `act_id_info`;

CREATE TABLE `act_id_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `act_id_membership` */

DROP TABLE IF EXISTS `act_id_membership`;

CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `act_id_user` */

DROP TABLE IF EXISTS `act_id_user`;

CREATE TABLE `act_id_user` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `act_re_deployment` */

DROP TABLE IF EXISTS `act_re_deployment`;

CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `act_re_model` */

DROP TABLE IF EXISTS `act_re_model`;

CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `act_re_procdef` */

DROP TABLE IF EXISTS `act_re_procdef`;

CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `act_ru_event_subscr` */

DROP TABLE IF EXISTS `act_ru_event_subscr`;

CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `act_ru_execution` */

DROP TABLE IF EXISTS `act_ru_execution`;

CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `act_ru_identitylink` */

DROP TABLE IF EXISTS `act_ru_identitylink`;

CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `act_ru_job` */

DROP TABLE IF EXISTS `act_ru_job`;

CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `act_ru_task` */

DROP TABLE IF EXISTS `act_ru_task`;

CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `act_ru_variable` */

DROP TABLE IF EXISTS `act_ru_variable`;

CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `member_rank_t` */

DROP TABLE IF EXISTS `member_rank_t`;

CREATE TABLE `member_rank_t` (
  `id` varchar(38) NOT NULL COMMENT '主键',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `amount` decimal(21,2) DEFAULT NULL COMMENT '消费金额',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `creator` varchar(255) DEFAULT NULL COMMENT '创建人',
  `last_update_date` datetime DEFAULT NULL COMMENT '最后更新人',
  `last_updater` datetime DEFAULT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='会员等级';

/*Table structure for table `member_t` */

DROP TABLE IF EXISTS `member_t`;

CREATE TABLE `member_t` (
  `id` varchar(38) NOT NULL COMMENT '主键',
  `username` varchar(38) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `birth` datetime DEFAULT NULL COMMENT '出生日期',
  `gender` int(11) DEFAULT NULL COMMENT '性别  0：女  1：男',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机',
  `zip_code` varchar(10) DEFAULT NULL COMMENT '邮编',
  `area` varchar(20) DEFAULT NULL COMMENT '地区',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `is_enabled` bit(1) DEFAULT NULL COMMENT '是否可用  0：不可用  1：可用',
  `is_locked` bit(1) DEFAULT NULL COMMENT '是否锁定 0：锁定  1：未锁定',
  `locked_date` datetime DEFAULT NULL COMMENT '锁定日期',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录日期',
  `login_ip` varchar(255) DEFAULT NULL COMMENT '最后登录ip',
  `member_rank_id` varchar(38) DEFAULT NULL COMMENT '会员等级',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `creator` varchar(255) DEFAULT NULL COMMENT '创建人',
  `last_update_date` datetime DEFAULT NULL COMMENT '最后更新人',
  `last_updater` datetime DEFAULT NULL COMMENT '最后更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='会员';

/*Table structure for table `order_item_t` */

DROP TABLE IF EXISTS `order_item_t`;

CREATE TABLE `order_item_t` (
  `id` varchar(38) NOT NULL COMMENT '主键',
  `name` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `price` decimal(21,2) DEFAULT NULL COMMENT '商品价格',
  `quantity` int(11) DEFAULT NULL COMMENT '数量',
  `sn` varchar(255) DEFAULT NULL COMMENT '商品编号',
  `thumbnail` varchar(255) DEFAULT NULL COMMENT '商品缩略图',
  `order_id` varchar(38) NOT NULL COMMENT '订单ID',
  `goods_id` varchar(255) DEFAULT NULL COMMENT '商品',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `creator` varchar(255) DEFAULT NULL COMMENT '创建人',
  `last_update_date` datetime DEFAULT NULL COMMENT '最后更新人',
  `last_updater` datetime DEFAULT NULL COMMENT '最后更新人'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='订单项';

/*Table structure for table `order_log_t` */

DROP TABLE IF EXISTS `order_log_t`;

CREATE TABLE `order_log_t` (
  `id` varchar(38) NOT NULL COMMENT '主键',
  `content` varchar(255) DEFAULT NULL COMMENT '内容',
  `logtype` int(11) DEFAULT NULL COMMENT '类型',
  `order_id` varchar(38) NOT NULL COMMENT '订单ID',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `creator` varchar(255) DEFAULT NULL COMMENT '创建人',
  `last_update_date` datetime DEFAULT NULL COMMENT '最后更新人',
  `last_updater` datetime DEFAULT NULL COMMENT '最后更新人'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='订单日志';

/*Table structure for table `order_t` */

DROP TABLE IF EXISTS `order_t`;

CREATE TABLE `order_t` (
  `id` varchar(38) NOT NULL COMMENT '主键',
  `order_sn` varchar(255) DEFAULT NULL COMMENT '订单编号',
  `member_id` varchar(38) DEFAULT NULL COMMENT '会员',
  `is_invoice` bit(1) DEFAULT NULL COMMENT '是否开据发票  0：不开 1：开',
  `invoice_title` varchar(255) DEFAULT NULL COMMENT '发票抬头',
  `memo` varchar(255) DEFAULT NULL COMMENT '附言',
  `order_status` int(11) DEFAULT NULL COMMENT '订单状态',
  `payment_method_name` varchar(255) DEFAULT NULL COMMENT '支付方式名称',
  `payment_status` int(11) DEFAULT NULL COMMENT '支付状态',
  `payment_method_id` varchar(38) NOT NULL COMMENT '支付方式',
  `mobile` varchar(20) DEFAULT NULL COMMENT '电话',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `creator` varchar(255) DEFAULT NULL COMMENT '创建人',
  `last_update_date` datetime DEFAULT NULL COMMENT '最后更新人',
  `last_updater` datetime DEFAULT NULL COMMENT '最后更新人'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='订单';

/*Table structure for table `payment_method_t` */

DROP TABLE IF EXISTS `payment_method_t`;

CREATE TABLE `payment_method_t` (
  `id` varchar(38) NOT NULL COMMENT '主键',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `method` int(11) DEFAULT NULL COMMENT '方式',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `content` varchar(255) DEFAULT NULL COMMENT '内容',
  `timeout` int(11) DEFAULT NULL COMMENT '超时时间',
  `orders` int(11) DEFAULT NULL COMMENT '排序',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `creator` varchar(255) DEFAULT NULL COMMENT '创建人',
  `last_update_date` datetime DEFAULT NULL COMMENT '最后更新人',
  `last_updater` datetime DEFAULT NULL COMMENT '最后更新人'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='支付方式';

/*Table structure for table `syn_record_t` */

DROP TABLE IF EXISTS `syn_record_t`;

CREATE TABLE `syn_record_t` (
  `id` varchar(38) NOT NULL COMMENT '主键',
  `syn_time` datetime DEFAULT NULL COMMENT '同步时间',
  `syn_target` int(11) DEFAULT NULL COMMENT '同步对象 0:供应商 1：会员',
  `syn_type` int(11) DEFAULT NULL COMMENT '同步数据类型  0:新增 1:更新',
  `syn_way` int(11) DEFAULT NULL COMMENT '同步数据方式 0:定时任务 1：手动',
  `syn_state` int(11) DEFAULT NULL COMMENT '同步数据状态 0：成功 1：失败',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `creator` varchar(255) DEFAULT NULL COMMENT '创建人',
  `last_update_date` datetime DEFAULT NULL COMMENT '最后更新人',
  `last_updater` datetime DEFAULT NULL COMMENT '最后更新人'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='同步记录表';

/*Table structure for table `sys_authorities_resources_t` */

DROP TABLE IF EXISTS `sys_authorities_resources_t`;

CREATE TABLE `sys_authorities_resources_t` (
  `ID` varchar(38) NOT NULL,
  `RESOURCE_ID` varchar(38) NOT NULL COMMENT '资源ID',
  `AUTHORITY_ID` varchar(38) NOT NULL COMMENT '权限Id',
  `CREATE_DATE` datetime DEFAULT NULL COMMENT '创建日期',
  `CREATOR` varchar(100) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限资源表';

/*Table structure for table `sys_authorities_t` */

DROP TABLE IF EXISTS `sys_authorities_t`;

CREATE TABLE `sys_authorities_t` (
  `AUTHORITY_ID` varchar(38) NOT NULL COMMENT '权限Id',
  `AUTHORITY_MARK` varchar(100) NOT NULL COMMENT '权限标识\n            模块简称_操作权限，例如：USER_LIST，表示用户查询权限',
  `AUTHORITY_NAME` varchar(100) NOT NULL COMMENT '权限名称',
  `AUTHORITY_DESC` varchar(200) DEFAULT NULL COMMENT '权限说明',
  `MESSAGE` varchar(100) DEFAULT NULL COMMENT '提示信息',
  `ENABLE` decimal(2,0) DEFAULT NULL COMMENT '是否可用',
  `CREATE_DATE` datetime DEFAULT NULL COMMENT '创建日期',
  `CREATOR` varchar(100) DEFAULT NULL COMMENT '创建人',
  `LAST_UPDATE_DATE` datetime DEFAULT NULL COMMENT '修改日期',
  `LAST_UPDATER` varchar(100) DEFAULT NULL COMMENT '修改人',
  `IS_DEL` decimal(1,0) DEFAULT NULL COMMENT '是否删除(用作逻辑删除)，0：未删除，1：已删除',
  `roleId` varchar(38) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`AUTHORITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限';

/*Table structure for table `sys_department_t` */

DROP TABLE IF EXISTS `sys_department_t`;

CREATE TABLE `sys_department_t` (
  `ID` varchar(38) NOT NULL,
  `ORG_NAME` varchar(100) NOT NULL COMMENT '部门名称',
  `PARTENTID` varchar(38) NOT NULL COMMENT '上级部门',
  `ORG_REMARK` varchar(200) DEFAULT NULL COMMENT '备注',
  `CREATE_DATE` datetime DEFAULT NULL COMMENT '创建日期',
  `CREATOR` varchar(100) DEFAULT NULL COMMENT '创建人',
  `LAST_UPDATE_DATE` datetime DEFAULT NULL COMMENT '修改日期',
  `LAST_UPDATER` varchar(100) DEFAULT NULL COMMENT '修改人',
  `IS_DEL` decimal(1,0) DEFAULT NULL COMMENT '是否删除(用作逻辑删除)，0：未删除，1：已删除',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `sys_modules_t` */

DROP TABLE IF EXISTS `sys_modules_t`;

CREATE TABLE `sys_modules_t` (
  `MODULE_ID` varchar(38) NOT NULL COMMENT '模块ID',
  `MODULE_NAME` varchar(100) NOT NULL COMMENT '模块名称',
  `MODULE_DESC` varchar(200) DEFAULT NULL COMMENT '模块说明',
  `MODULE_TYPE` decimal(2,0) DEFAULT NULL COMMENT '1：管理模块  不可连接\n            2：页面模块  可以连接',
  `PARENT` varchar(38) DEFAULT NULL COMMENT '模块上级ID',
  `MODULE_URL` varchar(100) DEFAULT NULL COMMENT '模块地址',
  `I_LEVEL` decimal(8,0) DEFAULT NULL COMMENT '1',
  `ENABLE` decimal(1,0) DEFAULT NULL COMMENT '是否可用',
  `PRIORITY` decimal(3,0) DEFAULT NULL COMMENT '优先级',
  `CREATE_DATE` datetime DEFAULT NULL COMMENT '创建日期',
  `CREATOR` varchar(100) DEFAULT NULL COMMENT '创建人',
  `LAST_UPDATE_DATE` datetime DEFAULT NULL COMMENT '修改日期',
  `LAST_UPDATER` varchar(100) DEFAULT NULL COMMENT '修改人',
  `IS_DEL` decimal(1,0) DEFAULT NULL COMMENT '是否删除(用作逻辑删除)，0：未删除，1：已删除',
  PRIMARY KEY (`MODULE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='模块,菜单模块';

/*Table structure for table `sys_persistent_logins_t` */

DROP TABLE IF EXISTS `sys_persistent_logins_t`;

CREATE TABLE `sys_persistent_logins_t` (
  `SERIES` varchar(64) NOT NULL,
  `USERNAME` varchar(64) DEFAULT NULL,
  `TOKEN` varchar(64) DEFAULT NULL,
  `LAST_USEDATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`SERIES`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Spring Remember me 持久化';

/*Table structure for table `sys_resources_t` */

DROP TABLE IF EXISTS `sys_resources_t`;

CREATE TABLE `sys_resources_t` (
  `RESOURCE_ID` varchar(38) NOT NULL COMMENT '资源ID',
  `RESOURCE_TYPE` decimal(2,0) DEFAULT NULL COMMENT '1：URL\n            2：METHOD',
  `RESOURCE_NAME` varchar(100) NOT NULL COMMENT '资源名称',
  `RESOURCE_DESC` varchar(200) DEFAULT NULL COMMENT '资源描述',
  `RESOURCE_PATH` varchar(200) DEFAULT NULL COMMENT '资源路径',
  `PRIORITY` varchar(3) DEFAULT NULL COMMENT '优先级',
  `ENABLE` decimal(2,0) DEFAULT NULL COMMENT '是否可用',
  `MODULE_ID` varchar(38) DEFAULT NULL COMMENT '所属模块id',
  `CREATE_DATE` datetime DEFAULT NULL COMMENT '创建日期',
  `CREATOR` varchar(100) DEFAULT NULL COMMENT '创建人',
  `LAST_UPDATE_DATE` datetime DEFAULT NULL COMMENT '修改日期',
  `LAST_UPDATER` varchar(100) DEFAULT NULL COMMENT '修改人',
  `IS_DEL` decimal(1,0) DEFAULT NULL COMMENT '是否删除(用作逻辑删除)，0：未删除，1：已删除',
  PRIMARY KEY (`RESOURCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资源';

/*Table structure for table `sys_roles_authorities_t` */

DROP TABLE IF EXISTS `sys_roles_authorities_t`;

CREATE TABLE `sys_roles_authorities_t` (
  `ID` varchar(38) NOT NULL,
  `AUTHORITY_ID` varchar(38) NOT NULL COMMENT '权限Id',
  `ROLE_ID` varchar(38) NOT NULL COMMENT '角色ID',
  `CREATE_DATE` datetime DEFAULT NULL COMMENT '创建日期',
  `CREATOR` varchar(100) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色权限表';

/*Table structure for table `sys_roles_moudles_t` */

DROP TABLE IF EXISTS `sys_roles_moudles_t`;

CREATE TABLE `sys_roles_moudles_t` (
  `ID` varchar(38) NOT NULL,
  `MODULE_ID` varchar(38) NOT NULL COMMENT '模块ID',
  `ROLE_ID` varchar(38) NOT NULL COMMENT '角色ID',
  `CREATE_DATE` datetime DEFAULT NULL COMMENT '创建日期',
  `CREATOR` varchar(100) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='控制角色对模块的访问权，主要用于生成菜单';

/*Table structure for table `sys_roles_t` */

DROP TABLE IF EXISTS `sys_roles_t`;

CREATE TABLE `sys_roles_t` (
  `ROLE_ID` varchar(38) NOT NULL COMMENT '角色ID',
  `ROLE_NAME` varchar(100) NOT NULL COMMENT '角色名称',
  `ROLE_DESC` varchar(200) DEFAULT NULL COMMENT '角色说明',
  `ENABLE` decimal(2,0) DEFAULT NULL COMMENT '是否可用',
  `CREATE_DATE` datetime DEFAULT NULL COMMENT '创建日期',
  `CREATOR` varchar(100) DEFAULT NULL COMMENT '创建人',
  `LAST_UPDATE_DATE` datetime DEFAULT NULL COMMENT '最后修改日期',
  `LAST_UPDATER` varchar(100) DEFAULT NULL COMMENT '最后修改人',
  `IS_DEL` decimal(1,0) DEFAULT NULL COMMENT '是否删除(用作逻辑删除)，0：未删除，1：已删除',
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色';

/*Table structure for table `sys_sequence` */

DROP TABLE IF EXISTS `sys_sequence`;

CREATE TABLE `sys_sequence` (
  `seq_name` varchar(50) NOT NULL,
  `current_val` int(11) NOT NULL,
  `increment_val` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`seq_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sys_supplier_t` */

DROP TABLE IF EXISTS `sys_supplier_t`;

CREATE TABLE `sys_supplier_t` (
  `SUPPLIERID` varchar(38) NOT NULL COMMENT '主键',
  `SUPNO` varchar(50) DEFAULT NULL COMMENT '供应商编号',
  `CONTRACTCODE` varchar(50) DEFAULT NULL COMMENT '合同编码',
  `CMBPEOPLENAME` varchar(30) DEFAULT NULL COMMENT '招商人姓名',
  `SUPNAME` varchar(100) DEFAULT NULL COMMENT '供应商名称',
  `SUPEMAIL` varchar(50) DEFAULT NULL COMMENT '供应商邮箱',
  `SUPPHONE` varchar(20) DEFAULT NULL COMMENT '供应商电话',
  `SUPFAXES` varchar(30) DEFAULT NULL COMMENT '供应商传真',
  `SUPADDRESS` varchar(100) DEFAULT NULL COMMENT '供应商地址',
  `BUSLICENSE` varchar(100) DEFAULT NULL COMMENT '供应商营业执照',
  `BANKACCOUNTNAME` varchar(50) DEFAULT NULL COMMENT '银行账户名称',
  `BANKACCOUNTNO` varchar(25) DEFAULT NULL COMMENT '银行账号',
  `BANKADDRESS` varchar(100) DEFAULT NULL COMMENT '银行账户地址',
  `LINKPEOPLENAME` varchar(30) DEFAULT NULL COMMENT '联系人姓名',
  `LIKEPEOPLEPHONE` varchar(30) DEFAULT NULL COMMENT '联系人电话',
  `LIKEPEOPLEQQ` varchar(12) DEFAULT NULL COMMENT '联系人QQ',
  `LIKEPEOPLEEMAIL` varchar(30) DEFAULT NULL COMMENT '联系人邮箱',
  `LIKEPEOPLEADDRESS` varchar(80) DEFAULT NULL COMMENT '联系人地址',
  `HEADPEOPLECARDNO` varchar(30) DEFAULT NULL COMMENT '负责人身份证号',
  `HEADPEOPLENAME` varchar(30) DEFAULT NULL COMMENT '负责人姓名',
  `HEADPEOPLEPHONE` varchar(30) DEFAULT NULL COMMENT '负责人电话',
  `HEADPEOPLEQQ` varchar(12) DEFAULT NULL COMMENT '负责人QQ',
  `HEADPEOPLEEMAIL` varchar(80) DEFAULT NULL COMMENT '负责人邮箱',
  `SUPTYPE` decimal(10,0) DEFAULT NULL COMMENT '供应商类型（0：个人 1：公司）',
  `USERID` varchar(30) DEFAULT NULL COMMENT '用户外键ID',
  `CREATOR` varchar(30) DEFAULT NULL COMMENT '创建人',
  `CREATEDATE` datetime DEFAULT NULL COMMENT '创建日期',
  `LAST_UPDATER` varchar(30) DEFAULT NULL COMMENT '最后修改人',
  `LAST_UPDATE_DATE` datetime DEFAULT NULL COMMENT '最后修改时间',
  `ISLOCKED` decimal(10,0) DEFAULT NULL COMMENT '是否锁定（0：已锁定 1：未锁定）',
  `ISDEL` decimal(10,0) DEFAULT NULL COMMENT '是否删除（0：已删除 1：未删除）',
  `SUPSTATE` decimal(10,0) DEFAULT NULL COMMENT '状态（0：审核中，1：审核通过，2：审核不通过,3:合作,4：中止）',
  `REMARK` varchar(200) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`SUPPLIERID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='[系统管理]供应商';

/*Table structure for table `sys_users_roles_t` */

DROP TABLE IF EXISTS `sys_users_roles_t`;

CREATE TABLE `sys_users_roles_t` (
  `ID` varchar(38) NOT NULL,
  `ROLE_ID` varchar(38) NOT NULL COMMENT '角色ID',
  `USER_ID` varchar(38) NOT NULL COMMENT '用户ID',
  `CREATE_DATE` datetime DEFAULT NULL COMMENT '创建日期',
  `CREATOR` varchar(100) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `sys_users_t` */

DROP TABLE IF EXISTS `sys_users_t`;

CREATE TABLE `sys_users_t` (
  `USER_ID` varchar(38) NOT NULL COMMENT '用户ID',
  `NAME` varchar(100) NOT NULL COMMENT '用户名',
  `ACCOUNT` varchar(20) NOT NULL COMMENT '帐号',
  `PASSWORD` varchar(40) NOT NULL COMMENT '密码',
  `LAST_LOGIN_DATE` datetime DEFAULT NULL COMMENT '最后登录日期',
  `LOGOUT_DATE` datetime DEFAULT NULL COMMENT '注销日期',
  `LAST_LOGIN_IP` varchar(40) DEFAULT NULL COMMENT '最后登录IP',
  `ORG_ID` varchar(38) DEFAULT NULL COMMENT '部门id',
  `ENABLED` decimal(2,0) DEFAULT NULL COMMENT '1：可用\n            0：不可用',
  `ACCOUNT_NON_EXPIRED` decimal(2,0) DEFAULT NULL COMMENT '1：没过期\n            0：过期',
  `ACCOUNT_NON_LOCKED` decimal(2,0) DEFAULT NULL COMMENT '1：未锁定\n            0：已锁定',
  `CREDENTIALS_NON_EXPIRED` decimal(2,0) DEFAULT NULL COMMENT '1：未失效\n            0：已失效',
  `CREATE_DATE` datetime DEFAULT NULL COMMENT '创建日期',
  `CREATOR` varchar(100) DEFAULT NULL COMMENT '创建人',
  `LAST_UPDATE_DATE` datetime DEFAULT NULL COMMENT '最后修改日期',
  `LAST_UPDATER` varchar(100) DEFAULT NULL COMMENT '最后修改人',
  `IS_DEL` decimal(1,0) DEFAULT NULL COMMENT '是否删除(用作逻辑删除)，0：未删除，1：已删除',
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='[系统管理]用户';

/*Table structure for table `t_act_form_process` */

DROP TABLE IF EXISTS `t_act_form_process`;

CREATE TABLE `t_act_form_process` (
  `ID` varchar(38) NOT NULL COMMENT '主键',
  `FORM_NAME` varchar(50) DEFAULT NULL COMMENT '业务表单名称',
  `PRODEF_ID` varchar(50) DEFAULT NULL COMMENT '流程定义ID',
  `create_date` date DEFAULT NULL,
  `creator` varchar(100) DEFAULT NULL,
  `last_update_date` date DEFAULT NULL,
  `last_updater` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `t_brand` */

DROP TABLE IF EXISTS `t_brand`;

CREATE TABLE `t_brand` (
  `ID` varchar(50) NOT NULL COMMENT '品牌ID',
  `BRANDNAME` varchar(50) NOT NULL COMMENT '品牌名称',
  `INTRO` text COMMENT '介绍',
  `LOGO_PATH` varchar(255) DEFAULT NULL COMMENT 'LOGO地址',
  `SORT` int(11) DEFAULT NULL COMMENT '排序',
  `URL` varchar(255) DEFAULT NULL COMMENT '品牌官方网址',
  `ENABLED` int(10) DEFAULT '1' COMMENT '1：可用\n            0：不可用',
  `ORGID` varchar(50) DEFAULT NULL COMMENT '组织机构代码',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATE_USER` varchar(50) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `UPDATE_USER` varchar(50) DEFAULT NULL COMMENT '修改人',
  `IS_DEL` varchar(1) DEFAULT '0' COMMENT '是否删除(用作逻辑删除)，0：未删除，1：已删除',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='品牌';

/*Table structure for table `t_file_store` */

DROP TABLE IF EXISTS `t_file_store`;

CREATE TABLE `t_file_store` (
  `ID` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '文件ID',
  `BUSINESSID` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '业务主键ID',
  `FILENAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '文件名称',
  `URL` varchar(2000) CHARACTER SET utf8 DEFAULT NULL COMMENT '文件URL',
  `FILEPATH` varchar(2000) CHARACTER SET utf8 DEFAULT NULL COMMENT '文件路径',
  `TYPE` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '文件类型',
  `SIZE` double DEFAULT NULL COMMENT '文件大小',
  `SUFFIX` varchar(10) CHARACTER SET utf8 DEFAULT NULL COMMENT '后缀',
  `DESC` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATE_USER` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `UPDATE_USER` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `t_goods` */

DROP TABLE IF EXISTS `t_goods`;

CREATE TABLE `t_goods` (
  `ID` varchar(50) NOT NULL COMMENT '商品ID',
  `GOODSNAME` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `BRANDID` varchar(50) DEFAULT NULL,
  `BRANDNAME` varchar(50) DEFAULT NULL COMMENT '品牌名称',
  `GOODSCATEGORYID` varchar(50) DEFAULT NULL COMMENT '分类ID',
  `GOODSCATEGORYNAME` varchar(50) DEFAULT NULL COMMENT '分类名称',
  `NNAME` varchar(50) DEFAULT NULL COMMENT '三级分类名称',
  `LNAME` varchar(50) DEFAULT NULL COMMENT '二级分类名称',
  `SNAME` varchar(50) DEFAULT NULL COMMENT '一级分类名称',
  `NAVID` varchar(50) DEFAULT NULL COMMENT '三级分类ID',
  `LTYPEID` varchar(50) DEFAULT NULL COMMENT '二级分类ID',
  `STYPEID` varchar(50) DEFAULT NULL COMMENT '一级分类ID',
  `PRICE` double DEFAULT NULL COMMENT '价格',
  `MEMBERPRICE` double DEFAULT NULL COMMENT '会员价格',
  `POINTS` double unsigned DEFAULT NULL COMMENT '积分',
  `PICTUREURL` varchar(2000) DEFAULT NULL COMMENT '照片URL',
  `QUANTITY` int(10) unsigned DEFAULT NULL COMMENT '数量',
  `SALESTATE` varchar(1) DEFAULT NULL COMMENT '销售状态',
  `UNITNAME` varchar(45) DEFAULT NULL COMMENT '单位名称',
  `KEYWORDNAME` varchar(45) DEFAULT NULL COMMENT '关键字名称',
  `WEIGHT` varchar(20) DEFAULT NULL COMMENT '重量',
  `READCOUNT` int(10) unsigned DEFAULT '0' COMMENT '阅读数',
  `RELATEDPRODUCTID` varchar(500) DEFAULT NULL COMMENT '相同产品ID',
  `RECOMMENDED` varchar(1) DEFAULT NULL COMMENT '推荐',
  `HOTSALE` varchar(1) DEFAULT NULL COMMENT '热销产品',
  `BARGAINPRICE` varchar(1) DEFAULT NULL COMMENT '打折价格',
  `SORT` int(10) unsigned DEFAULT '0' COMMENT '排序',
  `REPLYCOUNT` int(10) unsigned DEFAULT '0' COMMENT '回复数',
  `META_KEYWORDS` varchar(255) DEFAULT NULL COMMENT '搜索关键字',
  `META_DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '搜索描述',
  `COST` double DEFAULT NULL COMMENT '成本',
  `SALEPRICE` double DEFAULT NULL COMMENT '市场价格',
  `IS_NEW` varchar(1) DEFAULT NULL COMMENT '是否新品',
  `HTML_PATH` varchar(255) DEFAULT NULL COMMENT '静态页面地址',
  `GOODS_PARAMETER_VALUE` varchar(5000) DEFAULT NULL COMMENT '商品参数值（JSON）',
  `KEYWORDID` varchar(20) DEFAULT NULL COMMENT '关键字ID',
  `UNITNAMEID` varchar(20) DEFAULT NULL COMMENT '单位名称ID',
  `GOODS_TYPE_ID` varchar(20) DEFAULT NULL COMMENT '商品类型ID',
  `GOODS_TYPE_NAME` varchar(45) DEFAULT NULL COMMENT '商品类型名称',
  `IS_SPECIFICATIONS_OPEN` varchar(1) DEFAULT NULL COMMENT '是否上架',
  `COMMODITYLIST` varchar(1000) DEFAULT NULL COMMENT '商品清单',
  `ISOUTSITE` varchar(1) DEFAULT NULL COMMENT '是否外部网站',
  `OUTSITELINK` varchar(255) DEFAULT NULL COMMENT '外部网站链接',
  `ISSECONDKILL` varchar(1) DEFAULT '0' COMMENT '是否秒杀',
  `IS_DEL` varchar(1) DEFAULT '0' COMMENT '假删除',
  `ORGID` varchar(20) DEFAULT NULL COMMENT '组织机构编号',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATE_USER` varchar(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `UPDATE_USER` varchar(20) DEFAULT NULL COMMENT '修改人',
  `INTRO` text COMMENT '介绍',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品';

/*Table structure for table `t_goods_attribute` */

DROP TABLE IF EXISTS `t_goods_attribute`;

CREATE TABLE `t_goods_attribute` (
  `ID` varchar(50) NOT NULL COMMENT '属性ID',
  `GOODSATTRIBUTENAME` varchar(50) DEFAULT NULL COMMENT '商品属性名称',
  `GOODS_TYPE_ID` varchar(50) DEFAULT NULL COMMENT '商品类型ID',
  `GOODS_TYPE_NAME` varchar(50) DEFAULT NULL COMMENT '商品类型名称',
  `STATE` varchar(1) DEFAULT NULL COMMENT '状态',
  `ATTRIBUTELIST` text COMMENT '属性列表',
  `SORT` varchar(10) DEFAULT NULL COMMENT '排序',
  `ISSEARCH` varchar(1) DEFAULT '1' COMMENT '是否搜索',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATE_USER` varchar(50) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `UPDATE_USER` varchar(50) DEFAULT NULL COMMENT '修改人',
  `ORGID` varchar(50) DEFAULT NULL COMMENT '组织机构代码',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品属性';

/*Table structure for table `t_goods_attribute_rp` */

DROP TABLE IF EXISTS `t_goods_attribute_rp`;

CREATE TABLE `t_goods_attribute_rp` (
  `ID` varchar(20) NOT NULL COMMENT '属性ID',
  `GOODSID` varchar(20) NOT NULL COMMENT '商品ID',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATE_USER` varchar(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `UPDATE_USER` varchar(20) DEFAULT NULL COMMENT '修改人',
  `ORGID` varchar(20) DEFAULT NULL COMMENT '组织机构代码',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='记录了商品的属性和商品信息的关系';

/*Table structure for table `t_goods_category` */

DROP TABLE IF EXISTS `t_goods_category`;

CREATE TABLE `t_goods_category` (
  `ID` varchar(50) NOT NULL COMMENT '类型ID',
  `GRADE` varchar(1) DEFAULT NULL COMMENT '分类等级',
  `META_KEYWORDS` varchar(255) DEFAULT NULL COMMENT '搜索关键字',
  `META_DES` varchar(255) DEFAULT NULL COMMENT '搜索描述',
  `NAME` varchar(50) DEFAULT NULL COMMENT '名称',
  `STATE` varchar(1) DEFAULT NULL COMMENT '状态',
  `PATH` varchar(2000) DEFAULT NULL COMMENT '路径（A-a-a1）一级类型ID,二级类型ID,三级类型ID',
  `SORT` int(10) unsigned DEFAULT NULL COMMENT '排序',
  `SIGN` varchar(50) DEFAULT NULL COMMENT '标志(名称拼音缩写)',
  `GOODS_TYPE_ID` varchar(50) DEFAULT NULL COMMENT '商品类型ID',
  `PARENT_ID` varchar(50) DEFAULT NULL COMMENT '分类父ID',
  `LOGO` varchar(255) DEFAULT NULL COMMENT '图标',
  `ENABLED` int(10) DEFAULT '1' COMMENT '1：可用\n            0：不可用',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATE_USER` varchar(50) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `UPDATE_USER` varchar(50) DEFAULT NULL COMMENT '修改人',
  `ORGID` varchar(50) DEFAULT NULL COMMENT '组织机构代码',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品分类';

/*Table structure for table `t_invoice` */

DROP TABLE IF EXISTS `t_invoice`;

CREATE TABLE `t_invoice` (
  `ID` varchar(38) NOT NULL COMMENT '主键',
  `INVOICE_NUM` varchar(20) NOT NULL COMMENT '发票号码',
  `MAKE_DATE` datetime NOT NULL COMMENT '开票日期',
  `TRADE_TYPE` varchar(10) NOT NULL COMMENT '行业分类',
  `CLIENT_NAME` varchar(100) NOT NULL COMMENT '顾客名称',
  `ARTICLE_SPEC` varchar(10) DEFAULT NULL COMMENT '品名规格',
  `UNIT` varchar(5) DEFAULT NULL COMMENT '单位',
  `AMOUNT` decimal(10,0) DEFAULT NULL COMMENT '数量',
  `PRICE` decimal(10,0) DEFAULT NULL COMMENT '单价',
  `MONEY` decimal(10,0) DEFAULT NULL COMMENT '金额',
  `REMARK` varchar(400) DEFAULT NULL COMMENT '备注',
  `DRAWER` varchar(20) DEFAULT NULL COMMENT '开票人',
  `MAKE_COMPANY` varchar(100) DEFAULT NULL COMMENT '开票单位',
  `CREATOR` varchar(20) DEFAULT NULL COMMENT '创建人',
  `CREATE_DATE` datetime DEFAULT NULL COMMENT '创建日期',
  `LAST_UPDATE_DATE` datetime DEFAULT NULL COMMENT '修改人',
  `LAST_UPDATER` varchar(20) DEFAULT NULL COMMENT '修改日期',
  `IS_DEL` decimal(10,0) DEFAULT NULL COMMENT '是否删除',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `t_supplier` */

DROP TABLE IF EXISTS `t_supplier`;

CREATE TABLE `t_supplier` (
  `SUPPLIERID` varchar(38) NOT NULL COMMENT '主键',
  `SUPNO` varchar(50) DEFAULT NULL COMMENT '供应商编号',
  `CONTRACTCODE` varchar(50) DEFAULT NULL COMMENT '合同编码',
  `CMBPEOPLENAME` varchar(30) DEFAULT NULL COMMENT '招商人姓名',
  `SUPNAME` varchar(100) DEFAULT NULL COMMENT '供应商名称',
  `SUPEMAIL` varchar(50) DEFAULT NULL COMMENT '供应商邮箱',
  `SUPPHONE` varchar(20) DEFAULT NULL COMMENT '供应商电话',
  `SUPFAXES` varchar(30) DEFAULT NULL COMMENT '供应商传真',
  `SUPADDRESS` varchar(100) DEFAULT NULL COMMENT '供应商地址',
  `BUSLICENSE` varchar(100) DEFAULT NULL COMMENT '供应商营业执照',
  `BANKACCOUNTNAME` varchar(50) DEFAULT NULL COMMENT '银行账户名称',
  `BANKACCOUNTNO` varchar(25) DEFAULT NULL COMMENT '银行账号',
  `BANKADDRESS` varchar(100) DEFAULT NULL COMMENT '银行账户地址',
  `LINKPEOPLENAME` varchar(30) DEFAULT NULL COMMENT '联系人姓名',
  `LIKEPEOPLEPHONE` varchar(30) DEFAULT NULL COMMENT '联系人电话',
  `LIKEPEOPLEQQ` varchar(12) DEFAULT NULL COMMENT '联系人QQ',
  `LIKEPEOPLEEMAIL` varchar(30) DEFAULT NULL COMMENT '联系人邮箱',
  `LIKEPEOPLEADDRESS` varchar(80) DEFAULT NULL COMMENT '联系人地址',
  `HEADPEOPLECARDNO` varchar(30) DEFAULT NULL COMMENT '负责人身份证号',
  `HEADPEOPLENAME` varchar(30) DEFAULT NULL COMMENT '负责人姓名',
  `HEADPEOPLEPHONE` varchar(30) DEFAULT NULL COMMENT '负责人电话',
  `HEADPEOPLEQQ` varchar(12) DEFAULT NULL COMMENT '负责人QQ',
  `HEADPEOPLEEMAIL` varchar(80) DEFAULT NULL COMMENT '负责人邮箱',
  `SUPTYPE` decimal(10,0) DEFAULT NULL COMMENT '供应商类型（0：个人 1：公司）',
  `USERID` varchar(30) DEFAULT NULL COMMENT '用户外键ID',
  `CREATOR` varchar(30) DEFAULT NULL COMMENT '创建人',
  `CREATEDATE` datetime DEFAULT NULL COMMENT '创建日期',
  `LAST_UPDATER` varchar(30) DEFAULT NULL COMMENT '最后修改人',
  `LAST_UPDATE_DATE` datetime DEFAULT NULL COMMENT '最后修改时间',
  `ISLOCKED` decimal(10,0) DEFAULT NULL COMMENT '是否锁定（0：已锁定 1：未锁定）',
  `ISDEL` decimal(10,0) DEFAULT NULL COMMENT '是否删除（0：已删除 1：未删除）',
  `SUPSTATE` decimal(10,0) DEFAULT NULL COMMENT '状态（0：审核中，1：审核通过，2：审核不通过,3:合作,4：中止）',
  `REMARK` varchar(200) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`SUPPLIERID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='[业务管理]供应商';

/*Table structure for table `t_vacationrequest_test` */

DROP TABLE IF EXISTS `t_vacationrequest_test`;

CREATE TABLE `t_vacationrequest_test` (
  `ID` varchar(38) NOT NULL,
  `PERSON` varchar(38) DEFAULT NULL,
  `REASON` varchar(500) DEFAULT NULL,
  `DAYS` int(2) DEFAULT NULL,
  `STATUS` int(2) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
