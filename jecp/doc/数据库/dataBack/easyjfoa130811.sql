/*
MySQL Data Transfer
Source Host: localhost
Source Database: easyjfoa
Target Host: localhost
Target Database: easyjfoa
Date: 2013/8/11 10:19:06
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for act_ge_bytearray
-- ----------------------------
CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `REV_` int(11) default NULL,
  `NAME_` varchar(255) collate utf8_bin default NULL,
  `DEPLOYMENT_ID_` varchar(64) collate utf8_bin default NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_ge_property
-- ----------------------------
CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) collate utf8_bin NOT NULL default '',
  `VALUE_` varchar(300) collate utf8_bin default NULL,
  `REV_` int(11) default NULL,
  PRIMARY KEY  (`NAME_`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_hi_actinst
-- ----------------------------
CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) collate utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) collate utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) collate utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `CALL_PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `ACT_NAME_` varchar(255) collate utf8_bin default NULL,
  `ACT_TYPE_` varchar(255) collate utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(64) collate utf8_bin default NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime default NULL,
  `DURATION_` bigint(20) default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_hi_attachment
-- ----------------------------
CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `REV_` int(11) default NULL,
  `USER_ID_` varchar(255) collate utf8_bin default NULL,
  `NAME_` varchar(255) collate utf8_bin default NULL,
  `DESCRIPTION_` varchar(4000) collate utf8_bin default NULL,
  `TYPE_` varchar(255) collate utf8_bin default NULL,
  `TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `URL_` varchar(4000) collate utf8_bin default NULL,
  `CONTENT_ID_` varchar(64) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_hi_comment
-- ----------------------------
CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `TYPE_` varchar(255) collate utf8_bin default NULL,
  `TIME_` datetime NOT NULL,
  `USER_ID_` varchar(255) collate utf8_bin default NULL,
  `TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `ACTION_` varchar(255) collate utf8_bin default NULL,
  `MESSAGE_` varchar(4000) collate utf8_bin default NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY  (`ID_`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_hi_detail
-- ----------------------------
CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `TYPE_` varchar(255) collate utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `EXECUTION_ID_` varchar(64) collate utf8_bin default NULL,
  `TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `ACT_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `NAME_` varchar(255) collate utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) collate utf8_bin default NULL,
  `REV_` int(11) default NULL,
  `TIME_` datetime NOT NULL,
  `BYTEARRAY_ID_` varchar(64) collate utf8_bin default NULL,
  `DOUBLE_` double default NULL,
  `LONG_` bigint(20) default NULL,
  `TEXT_` varchar(4000) collate utf8_bin default NULL,
  `TEXT2_` varchar(4000) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_hi_procinst
-- ----------------------------
CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) collate utf8_bin default NULL,
  `PROC_DEF_ID_` varchar(64) collate utf8_bin NOT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime default NULL,
  `DURATION_` bigint(20) default NULL,
  `START_USER_ID_` varchar(255) collate utf8_bin default NULL,
  `START_ACT_ID_` varchar(255) collate utf8_bin default NULL,
  `END_ACT_ID_` varchar(255) collate utf8_bin default NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) collate utf8_bin default NULL,
  `DELETE_REASON_` varchar(4000) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  UNIQUE KEY `ACT_UNIQ_HI_BUS_KEY` (`PROC_DEF_ID_`,`BUSINESS_KEY_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_hi_taskinst
-- ----------------------------
CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) collate utf8_bin default NULL,
  `TASK_DEF_KEY_` varchar(255) collate utf8_bin default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `EXECUTION_ID_` varchar(64) collate utf8_bin default NULL,
  `NAME_` varchar(255) collate utf8_bin default NULL,
  `PARENT_TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `DESCRIPTION_` varchar(4000) collate utf8_bin default NULL,
  `OWNER_` varchar(255) collate utf8_bin default NULL,
  `ASSIGNEE_` varchar(255) collate utf8_bin default NULL,
  `START_TIME_` datetime NOT NULL,
  `CLAIM_TIME_` datetime default NULL,
  `END_TIME_` datetime default NULL,
  `DURATION_` bigint(20) default NULL,
  `DELETE_REASON_` varchar(4000) collate utf8_bin default NULL,
  `PRIORITY_` int(11) default NULL,
  `DUE_DATE_` datetime default NULL,
  `FORM_KEY_` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_hi_varinst
-- ----------------------------
CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `EXECUTION_ID_` varchar(64) collate utf8_bin default NULL,
  `TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `NAME_` varchar(255) collate utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) collate utf8_bin default NULL,
  `REV_` int(11) default NULL,
  `BYTEARRAY_ID_` varchar(64) collate utf8_bin default NULL,
  `DOUBLE_` double default NULL,
  `LONG_` bigint(20) default NULL,
  `TEXT_` varchar(4000) collate utf8_bin default NULL,
  `TEXT2_` varchar(4000) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_id_group
-- ----------------------------
CREATE TABLE `act_id_group` (
  `ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `REV_` int(11) default NULL,
  `NAME_` varchar(255) collate utf8_bin default NULL,
  `TYPE_` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_id_info
-- ----------------------------
CREATE TABLE `act_id_info` (
  `ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `REV_` int(11) default NULL,
  `USER_ID_` varchar(64) collate utf8_bin default NULL,
  `TYPE_` varchar(64) collate utf8_bin default NULL,
  `KEY_` varchar(255) collate utf8_bin default NULL,
  `VALUE_` varchar(255) collate utf8_bin default NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_id_membership
-- ----------------------------
CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `GROUP_ID_` varchar(64) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_id_user
-- ----------------------------
CREATE TABLE `act_id_user` (
  `ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `REV_` int(11) default NULL,
  `FIRST_` varchar(255) collate utf8_bin default NULL,
  `LAST_` varchar(255) collate utf8_bin default NULL,
  `EMAIL_` varchar(255) collate utf8_bin default NULL,
  `PWD_` varchar(255) collate utf8_bin default NULL,
  `PICTURE_ID_` varchar(64) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_re_deployment
-- ----------------------------
CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `NAME_` varchar(255) collate utf8_bin default NULL,
  `CATEGORY_` varchar(255) collate utf8_bin default NULL,
  `DEPLOY_TIME_` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`ID_`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_re_model
-- ----------------------------
CREATE TABLE `act_re_model` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `REV_` int(11) default NULL,
  `NAME_` varchar(255) collate utf8_bin default NULL,
  `KEY_` varchar(255) collate utf8_bin default NULL,
  `CATEGORY_` varchar(255) collate utf8_bin default NULL,
  `CREATE_TIME_` timestamp NULL default NULL,
  `LAST_UPDATE_TIME_` timestamp NULL default NULL,
  `VERSION_` int(11) default NULL,
  `META_INFO_` varchar(4000) collate utf8_bin default NULL,
  `DEPLOYMENT_ID_` varchar(64) collate utf8_bin default NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) collate utf8_bin default NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_re_procdef
-- ----------------------------
CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `REV_` int(11) default NULL,
  `CATEGORY_` varchar(255) collate utf8_bin default NULL,
  `NAME_` varchar(255) collate utf8_bin default NULL,
  `KEY_` varchar(255) collate utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) collate utf8_bin default NULL,
  `RESOURCE_NAME_` varchar(4000) collate utf8_bin default NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) collate utf8_bin default NULL,
  `DESCRIPTION_` varchar(4000) collate utf8_bin default NULL,
  `HAS_START_FORM_KEY_` tinyint(4) default NULL,
  `SUSPENSION_STATE_` int(11) default NULL,
  PRIMARY KEY  (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_ru_event_subscr
-- ----------------------------
CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `REV_` int(11) default NULL,
  `EVENT_TYPE_` varchar(255) collate utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) collate utf8_bin default NULL,
  `EXECUTION_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `ACTIVITY_ID_` varchar(64) collate utf8_bin default NULL,
  `CONFIGURATION_` varchar(255) collate utf8_bin default NULL,
  `CREATED_` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_ru_execution
-- ----------------------------
CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `REV_` int(11) default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `BUSINESS_KEY_` varchar(255) collate utf8_bin default NULL,
  `PARENT_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_DEF_ID_` varchar(64) collate utf8_bin default NULL,
  `SUPER_EXEC_` varchar(64) collate utf8_bin default NULL,
  `ACT_ID_` varchar(255) collate utf8_bin default NULL,
  `IS_ACTIVE_` tinyint(4) default NULL,
  `IS_CONCURRENT_` tinyint(4) default NULL,
  `IS_SCOPE_` tinyint(4) default NULL,
  `IS_EVENT_SCOPE_` tinyint(4) default NULL,
  `SUSPENSION_STATE_` int(11) default NULL,
  `CACHED_ENT_STATE_` int(11) default NULL,
  PRIMARY KEY  (`ID_`),
  UNIQUE KEY `ACT_UNIQ_RU_BUS_KEY` (`PROC_DEF_ID_`,`BUSINESS_KEY_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_ru_identitylink
-- ----------------------------
CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `REV_` int(11) default NULL,
  `GROUP_ID_` varchar(255) collate utf8_bin default NULL,
  `TYPE_` varchar(255) collate utf8_bin default NULL,
  `USER_ID_` varchar(255) collate utf8_bin default NULL,
  `TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_DEF_ID_` varchar(64) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_ru_job
-- ----------------------------
CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `REV_` int(11) default NULL,
  `TYPE_` varchar(255) collate utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp NULL default NULL,
  `LOCK_OWNER_` varchar(255) collate utf8_bin default NULL,
  `EXCLUSIVE_` tinyint(1) default NULL,
  `EXECUTION_ID_` varchar(64) collate utf8_bin default NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_DEF_ID_` varchar(64) collate utf8_bin default NULL,
  `RETRIES_` int(11) default NULL,
  `EXCEPTION_STACK_ID_` varchar(64) collate utf8_bin default NULL,
  `EXCEPTION_MSG_` varchar(4000) collate utf8_bin default NULL,
  `DUEDATE_` timestamp NULL default NULL,
  `REPEAT_` varchar(255) collate utf8_bin default NULL,
  `HANDLER_TYPE_` varchar(255) collate utf8_bin default NULL,
  `HANDLER_CFG_` varchar(4000) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_ru_task
-- ----------------------------
CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) collate utf8_bin NOT NULL default '',
  `REV_` int(11) default NULL,
  `EXECUTION_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_DEF_ID_` varchar(64) collate utf8_bin default NULL,
  `NAME_` varchar(255) collate utf8_bin default NULL,
  `PARENT_TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `DESCRIPTION_` varchar(4000) collate utf8_bin default NULL,
  `TASK_DEF_KEY_` varchar(255) collate utf8_bin default NULL,
  `OWNER_` varchar(255) collate utf8_bin default NULL,
  `ASSIGNEE_` varchar(255) collate utf8_bin default NULL,
  `DELEGATION_` varchar(64) collate utf8_bin default NULL,
  `PRIORITY_` int(11) default NULL,
  `CREATE_TIME_` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `DUE_DATE_` datetime default NULL,
  `SUSPENSION_STATE_` int(11) default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for act_ru_variable
-- ----------------------------
CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) collate utf8_bin NOT NULL,
  `REV_` int(11) default NULL,
  `TYPE_` varchar(255) collate utf8_bin NOT NULL,
  `NAME_` varchar(255) collate utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) collate utf8_bin default NULL,
  `PROC_INST_ID_` varchar(64) collate utf8_bin default NULL,
  `TASK_ID_` varchar(64) collate utf8_bin default NULL,
  `BYTEARRAY_ID_` varchar(64) collate utf8_bin default NULL,
  `DOUBLE_` double default NULL,
  `LONG_` bigint(20) default NULL,
  `TEXT_` varchar(4000) collate utf8_bin default NULL,
  `TEXT2_` varchar(4000) collate utf8_bin default NULL,
  PRIMARY KEY  (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for article
-- ----------------------------
CREATE TABLE `article` (
  `ID` bigint(20) NOT NULL auto_increment,
  `TITLE` varchar(200) default NULL,
  `SUMMARY` varchar(500) default NULL,
  `CONTENT` longtext,
  `CTIME` varchar(50) default NULL,
  `PTIME` varchar(50) default NULL,
  `creater` bigint(20) NOT NULL,
  `STARTTIME` varchar(50) default NULL,
  `ENDTIME` varchar(50) default NULL,
  `ACTCATEID` bigint(20) NOT NULL,
  `VRANGE` smallint(6) default NULL,
  `updater` bigint(20) default NULL COMMENT '修改人',
  `utime` varchar(50) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for articlecate
-- ----------------------------
CREATE TABLE `articlecate` (
  `ID` bigint(20) NOT NULL auto_increment,
  `CNAME` varchar(50) default NULL,
  `NUM` varchar(20) default NULL,
  `REMARK` varchar(100) default NULL,
  `PID` bigint(20) NOT NULL,
  `SORTNUM` int(11) default '0',
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for articlerange
-- ----------------------------
CREATE TABLE `articlerange` (
  `artID` bigint(20) NOT NULL,
  `OBJID` bigint(20) default NULL,
  `OBJTYPE` smallint(6) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for articleread
-- ----------------------------
CREATE TABLE `articleread` (
  `ARTID` bigint(20) NOT NULL,
  `EMPID` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for beiwanglu
-- ----------------------------
CREATE TABLE `beiwanglu` (
  `ID` bigint(20) NOT NULL auto_increment,
  `TITLE` varchar(50) default NULL,
  `CONTEXT` longtext,
  `ctime` datetime default NULL,
  `creater` bigint(20) default NULL,
  `TXPL` smallint(1) default '0',
  `TXDATE` datetime default NULL,
  `TXBR` smallint(1) default '0' COMMENT '0:æœ¬äºº 1ï¼šæ‰€æœ‰å…±äº«äºº',
  `TXSHARE` smallint(1) default NULL,
  `IMTX` smallint(1) default NULL,
  `EMAILTX` smallint(1) default NULL,
  `SMSTX` smallint(1) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bwlpinglun
-- ----------------------------
CREATE TABLE `bwlpinglun` (
  `ID` bigint(20) NOT NULL auto_increment,
  `BWLID` bigint(20) NOT NULL,
  `UID` bigint(20) default NULL,
  `PLTIME` datetime default NULL,
  `CONTEXT` longtext,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bwlshare
-- ----------------------------
CREATE TABLE `bwlshare` (
  `ID` bigint(20) NOT NULL auto_increment,
  `BWLID` bigint(20) NOT NULL,
  `UID` bigint(20) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for calendar
-- ----------------------------
CREATE TABLE `calendar` (
  `Id` int(11) NOT NULL auto_increment COMMENT '日程主键',
  `Subject` varchar(200) default NULL COMMENT '日程标题',
  `Location` varchar(200) default NULL COMMENT '地点',
  `Description` varchar(500) default NULL COMMENT '说明',
  `CalendarType` tinyint(4) default '1' COMMENT '日程类型\r\n            1	个人日程\r\n            2	部门日程',
  `StartTime` datetime NOT NULL COMMENT '开始时间',
  `EndTime` datetime NOT NULL COMMENT '结束时间',
  `IsAllDayEvent` bit(1) NOT NULL default '\0' COMMENT '是否全天日程',
  `HasAttachment` bit(1) NOT NULL default '\0' COMMENT '是否有附件',
  `Category` varchar(400) default NULL COMMENT '分类',
  `InstanceType` tinyint(4) NOT NULL COMMENT '实例类型\r\n            0	Single（一般日程）\r\n            1	Master（循环主日程）\r\n            2	Instance（循环实例日程）\r\n            3	Exception （错误）\r\n            4	MeetingRequest（会议安排）',
  `Attendees` varchar(500) default NULL COMMENT '参与人',
  `AttendeeNames` varchar(500) default NULL COMMENT '参与人姓名',
  `OtherAttendee` varchar(500) default NULL COMMENT '其他参与人',
  `UPAccount` bigint(20) default NULL COMMENT '更新人账号',
  `UPName` varchar(100) default NULL COMMENT '更新人姓名',
  `UPTime` datetime default NULL COMMENT '最后一次更新时间',
  `RecurringRule` varchar(1000) default NULL COMMENT '循环规则',
  PRIMARY KEY  (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for customer
-- ----------------------------
CREATE TABLE `customer` (
  `id` bigint(20) NOT NULL auto_increment,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for doccate
-- ----------------------------
CREATE TABLE `doccate` (
  `ID` bigint(20) NOT NULL auto_increment,
  `CNAME` varchar(50) default NULL,
  `NUM` varchar(20) default NULL,
  `REMARK` varchar(100) default NULL,
  `PID` bigint(20) NOT NULL,
  `SORTNUM` int(11) default '0',
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for docrange
-- ----------------------------
CREATE TABLE `docrange` (
  `artID` bigint(20) NOT NULL,
  `OBJID` bigint(20) default NULL,
  `OBJTYPE` smallint(6) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for document
-- ----------------------------
CREATE TABLE `document` (
  `ID` bigint(20) NOT NULL auto_increment,
  `TITLE` varchar(200) default NULL,
  `SUMMARY` varchar(500) default NULL,
  `CTIME` varchar(50) default NULL,
  `PTIME` varchar(50) default NULL,
  `STARTTIME` varchar(50) default NULL,
  `ENDTIME` varchar(50) default NULL,
  `DOCCATEID` bigint(20) NOT NULL,
  `VRANGE` smallint(6) default NULL,
  `creater` bigint(20) NOT NULL,
  `ATTACHMENT` varchar(500) default NULL,
  `utime` date default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for emailset
-- ----------------------------
CREATE TABLE `emailset` (
  `ID` bigint(20) NOT NULL auto_increment,
  `CNAME` varchar(30) NOT NULL,
  `EMAIL` varchar(100) NOT NULL,
  `UID` bigint(20) NOT NULL,
  `POP3ADDR` varchar(50) default NULL,
  `POP3PORT` int(11) default '110',
  `SMTPADDR` varchar(50) default NULL,
  `SMTPPORT` int(11) default '25',
  `PWD` varchar(50) default NULL,
  `SIGN` varchar(500) default NULL,
  `STATUS` smallint(1) default '1' COMMENT '1：可用\r\n0：停用',
  `USESIGN` smallint(1) default '0' COMMENT '0:不使用\r\n1:使用',
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `EMAIL` (`EMAIL`),
  UNIQUE KEY `UID` (`UID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for employee
-- ----------------------------
CREATE TABLE `employee` (
  `id` bigint(20) NOT NULL auto_increment,
  `fullname` varchar(50) NOT NULL,
  `gender` varchar(2) NOT NULL default '1',
  `userno` varchar(20) NOT NULL,
  `pwd` varchar(50) NOT NULL,
  `birthday` varchar(20) NOT NULL,
  `phone` varchar(20) default NULL,
  `addr` varchar(100) default NULL,
  `fnamepy` varchar(50) default NULL,
  `worktime` varchar(30) default NULL,
  `nation` varchar(10) default '汉族',
  `idcard` varchar(20) default NULL,
  `hometown` smallint(6) default NULL,
  `diploma` smallint(6) default NULL,
  `wage` smallint(6) default NULL,
  `photo` varchar(50) default NULL,
  `partmentid` bigint(20) NOT NULL,
  `orgid` bigint(20) default NULL,
  `stat` smallint(1) default NULL,
  `remark` varchar(255) default NULL,
  `resume` longtext,
  `postid` bigint(20) NOT NULL,
  `ip` varchar(30) default NULL,
  `logintime` datetime default NULL,
  `telphone` varchar(30) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `userno` (`userno`),
  KEY `idx_employee_pwd` (`pwd`),
  KEY `idx_employee_userno` (`userno`),
  KEY `idx_emp_pyname` (`fnamepy`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for form
-- ----------------------------
CREATE TABLE `form` (
  `ID` bigint(20) NOT NULL auto_increment,
  `TNAME` varchar(30) NOT NULL COMMENT '数据库表名',
  `ZHUS` varchar(30) default NULL,
  `TBTYPE` smallint(6) NOT NULL default '1' COMMENT '1:主表 2:从表',
  `package` varchar(50) default NULL,
  `listAdd` smallint(6) default '0',
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `ID` (`ID`),
  UNIQUE KEY `TNAME` (`TNAME`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for formfield
-- ----------------------------
CREATE TABLE `formfield` (
  `ID` bigint(20) NOT NULL auto_increment,
  `FMID` bigint(20) NOT NULL,
  `FIELDNAME` varchar(20) default NULL,
  `FIELDDESC` varchar(30) default NULL,
  `FIELDTITLE` varchar(50) default NULL COMMENT '对应html 的 title',
  `FTYPE` varchar(50) default NULL COMMENT 'String       文本\r\nInteger     整型\r\nLong        长整型\r\nFloat         浮点型\r\nDouble     双精度\r\nBigdicms  bigdicme\r\n',
  `FLEN` smallint(6) NOT NULL,
  `CTRLTYPE` varchar(50) NOT NULL COMMENT '1单行文本\r\n2多行文本\r\n3单选\r\n4复选\r\n5隐藏\r\n6下拉框\r\n7文件上传\r\n8富文本编辑框\r\n9角色\r\n10岗位\r\n11部门',
  `VALIT` varchar(50) default NULL,
  `REQUI` smallint(6) default '0',
  `SHOWINLIST` smallint(6) default NULL,
  `SHOWINQRY` smallint(6) default NULL,
  `WFATTR` smallint(6) default NULL,
  `SQLSCRIPT` longtext,
  `SORTTYPE` varchar(0) default NULL COMMENT 'desc\r\nasc',
  `SORTNUM` smallint(6) default NULL,
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `ID` (`ID`),
  KEY `FMID` (`FMID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gglan
-- ----------------------------
CREATE TABLE `gglan` (
  `ID` bigint(20) NOT NULL auto_increment,
  `NAME` varchar(20) NOT NULL,
  `DESCP` varchar(200) default NULL,
  `ENABLE` smallint(6) NOT NULL default '1' COMMENT '0:不可用 1可用',
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ggreadlist
-- ----------------------------
CREATE TABLE `ggreadlist` (
  `UID` bigint(20) default NULL,
  `RDATE` datetime default NULL,
  `GGID` bigint(20) NOT NULL,
  UNIQUE KEY `idx_ggread_uniq` (`UID`,`GGID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gonggao
-- ----------------------------
CREATE TABLE `gonggao` (
  `ID` bigint(20) NOT NULL auto_increment,
  `TITLE` varchar(100) NOT NULL,
  `CONTEXT` longtext NOT NULL,
  `CTIME` datetime NOT NULL,
  `creater` bigint(20) NOT NULL,
  `FBDATE` datetime default NULL,
  `CXDATE` datetime default NULL,
  `ZD` smallint(6) default '0' COMMENT '1:置顶',
  `STARTDATE` date NOT NULL,
  `ENDDATE` date default NULL,
  `SHOWCONT` int(11) default NULL,
  `UDATE` datetime default NULL,
  `gglid` bigint(20) NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for loginlog
-- ----------------------------
CREATE TABLE `loginlog` (
  `id` bigint(20) NOT NULL auto_increment,
  `uid` bigint(20) NOT NULL,
  `loginTime` datetime NOT NULL,
  `ip` varchar(50) NOT NULL,
  `logoutTime` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for meeting
-- ----------------------------
CREATE TABLE `meeting` (
  `ID` bigint(20) NOT NULL auto_increment,
  `TITLE` varchar(100) NOT NULL,
  `FBTIME` datetime default NULL,
  `CREATER` bigint(20) default NULL,
  `CTIME` datetime default NULL,
  `CONTENT` longtext,
  `STARTTIME` varchar(20) default NULL,
  `ENDTIME` varchar(20) default NULL COMMENT 'yyyy-MM-dd HH:mm:ss\r\n',
  `STAT` smallint(1) default '0' COMMENT '0：筹划中\r\n1：进行中\r\n2：归档',
  `GUIDANGREN` bigint(20) default NULL,
  `GDTIME` datetime default NULL,
  `GUIDANG` longtext,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for meetingjoin
-- ----------------------------
CREATE TABLE `meetingjoin` (
  `ID` bigint(20) NOT NULL auto_increment,
  `UID` bigint(20) default NULL,
  `MID` bigint(20) NOT NULL,
  `STAT` smallint(1) default '0' COMMENT '0:已分配\r\n1:已参与\r\n2:未参与\r\n3:中途离开',
  PRIMARY KEY  (`ID`),
  KEY `MID` (`MID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for menu
-- ----------------------------
CREATE TABLE `menu` (
  `id` bigint(20) NOT NULL auto_increment,
  `cname` varchar(20) NOT NULL,
  `url` varchar(50) default NULL,
  `type` smallint(6) default NULL,
  `icon` varchar(50) default NULL,
  `sortnum` int(11) default '0',
  `safecode` varchar(20) default NULL,
  `pid` bigint(20) default '0',
  `enable` smallint(6) default '1',
  `remark` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=119 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for partment
-- ----------------------------
CREATE TABLE `partment` (
  `id` bigint(20) NOT NULL auto_increment,
  `cname` varchar(50) default NULL,
  `remark` varchar(250) default NULL,
  `pid` bigint(10) default '0' COMMENT '父级部门id',
  `num` varchar(20) default NULL,
  `supervisor` bigint(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for post
-- ----------------------------
CREATE TABLE `post` (
  `id` bigint(20) NOT NULL auto_increment,
  `cname` varchar(20) NOT NULL,
  `remark` varchar(255) default NULL,
  `sortnum` smallint(6) default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for powermenu
-- ----------------------------
CREATE TABLE `powermenu` (
  `menuid` bigint(20) NOT NULL,
  `objid` bigint(20) NOT NULL,
  `type` smallint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for role
-- ----------------------------
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL auto_increment,
  `cname` varchar(20) NOT NULL,
  `remark` varchar(255) default NULL,
  `sortnum` smallint(6) default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sysparame
-- ----------------------------
CREATE TABLE `sysparame` (
  `id` bigint(20) NOT NULL auto_increment,
  `cname` varchar(20) NOT NULL,
  `val` varchar(20) NOT NULL,
  `type` varchar(200) default NULL,
  `sortnum` smallint(6) default '0',
  `remark` varchar(255) default NULL,
  `pid` bigint(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for taxrate
-- ----------------------------
CREATE TABLE `taxrate` (
  `ID` bigint(20) NOT NULL auto_increment,
  `STARTDATE` varchar(10) NOT NULL COMMENT 'yyyy-MM-dd',
  `RATE` float NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for userrole
-- ----------------------------
CREATE TABLE `userrole` (
  `userid` bigint(20) NOT NULL,
  `roleid` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wagepay
-- ----------------------------
CREATE TABLE `wagepay` (
  `ID` bigint(20) NOT NULL auto_increment,
  `EMPID` bigint(20) default NULL,
  `OPERATER` bigint(20) default NULL,
  `AMOUNT` decimal(10,2) default NULL,
  `SDATE` varchar(20) default NULL,
  `EDATE` varchar(20) default NULL,
  `PAYDATE` varchar(20) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for weibo
-- ----------------------------
CREATE TABLE `weibo` (
  `ID` bigint(20) NOT NULL auto_increment,
  `UID` bigint(20) default NULL,
  `CONTEXT` varchar(600) default NULL COMMENT '长度不能超过280个中文',
  `CDATE` datetime default NULL,
  `ZAN` int(11) default NULL,
  `ZHUAN` int(11) default NULL,
  `CANG` int(11) default NULL,
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for weibopl
-- ----------------------------
CREATE TABLE `weibopl` (
  `UID` bigint(20) default NULL,
  `CDATE` datetime default NULL,
  `CONTEXT` varchar(600) default NULL COMMENT '不能多于280中文',
  `ZAN` int(11) default NULL,
  `WID` bigint(20) NOT NULL,
  `ISSHOW` smallint(6) default NULL COMMENT '发布人是否查看该评论',
  `CUID` bigint(20) default NULL,
  UNIQUE KEY `WID` (`WID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `act_ge_property` VALUES ('schema.version', '5.12', '1');
INSERT INTO `act_ge_property` VALUES ('schema.history', 'create(5.12)', '1');
INSERT INTO `act_ge_property` VALUES ('next.dbid', '1', '1');
INSERT INTO `article` VALUES ('1', 'rewqr4322', null, 'rewqrewqr<img src=\"/upload/201211251602000.jpg\" width=\"400\" alt=\"\" />', '2013-04-04 12:23:41', null, '1', null, null, '3', null, null, null);
INSERT INTO `article` VALUES ('2', '萨芬', null, '范德萨分<br />\r\n<img alt=\"偷笑\" src=\"xheditor/xheditor_emot/default/titter.gif\" /><img alt=\"骂人\" src=\"xheditor/xheditor_emot/default/curse.gif\" /><br />\r\n<img src=\"/jfoa/upload/201212091536011.jpg\" width=\"300\" alt=\"\" /><br />', '2013-04-04 12:23:41', null, '1', null, null, '6', null, '1', '2013-04-08 09:49:20');
INSERT INTO `article` VALUES ('68', 'fdsafdsa', null, 'fdsfdsfa', '2013-04-08 09:49:53', null, '1', null, null, '6', null, '1', '2013-05-05 19:01:57');
INSERT INTO `article` VALUES ('4', 'sdfasdf', null, '<p>\r\n	fdsafdsaffdsafsaf\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	fdsafdsa\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	fdsa\r\n</p>', '2013-04-04 12:23:41', null, '1', null, null, '7', null, '1', '2013-05-05 15:02:08');
INSERT INTO `article` VALUES ('5', '地方撒法但是', null, '<p>\r\n	范德萨分\r\n</p>\r\n<p>\r\n	fdsafds\r\n</p>\r\n<p>\r\n	fdsafds<img src=\"/easyUIJFinal/upload/image/1365386193178.png\" width=\"357\" height=\"539\" align=\"left\" alt=\"\" /> \r\n</p>', null, null, '1', null, null, '7', null, '1', '2013-04-08 09:56:58');
INSERT INTO `article` VALUES ('7', '范德萨', null, '范德萨范德萨', null, null, '1', null, null, '5', null, '1', '2013-04-06 00:00:00');
INSERT INTO `article` VALUES ('8', '范德萨', null, '<p>\r\n	范德萨分\r\n</p>\r\n<p>\r\n	fdsa\r\n</p>\r\n<p>\r\n	fdsafsda\r\n</p>', '2013-04-06 19:57:14', null, '1', null, null, '7', null, '1', '2013-05-05 18:57:09');
INSERT INTO `article` VALUES ('9', '发达省份dd', null, '范德萨sdfd', '2013-04-06 21:30:52', null, '1', null, null, '6', null, null, null);
INSERT INTO `article` VALUES ('10', '发达省份dd', null, '范德萨sdfd', '2013-04-06 21:30:56', null, '1', null, null, '6', null, null, null);
INSERT INTO `article` VALUES ('70', 'fdsa', null, '<p>\r\n	fdsafdsaf\r\n</p>\r\n<p>\r\n	fdsaf\r\n</p>\r\n<p>\r\n	sadf\r\n</p>\r\n<p>\r\n	fdsa\r\n</p>\r\n<p>\r\n	sdf\r\n</p>', '2013-04-08 11:43:08', null, '1', null, null, '5', null, '1', '2013-05-05 18:57:17');
INSERT INTO `article` VALUES ('69', 'fdsa', null, '<p>\r\n	fdsafdsaf\r\n</p>\r\n<p>\r\n	fdsaf\r\n</p>\r\n<p>\r\n	sadf\r\n</p>\r\n<p>\r\n	fdsa\r\n</p>\r\n<p>\r\n	sdf\r\n</p>', '2013-04-08 11:43:05', null, '1', null, null, '5', null, null, null);
INSERT INTO `article` VALUES ('14', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:42', null, '1', null, null, '7', null, '1', '2013-05-05 19:00:04');
INSERT INTO `article` VALUES ('15', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:42', null, '1', null, null, '6', null, null, null);
INSERT INTO `article` VALUES ('16', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:42', null, '1', null, null, '6', null, null, null);
INSERT INTO `article` VALUES ('17', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:42', null, '1', null, null, '6', null, null, null);
INSERT INTO `article` VALUES ('18', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:42', null, '1', null, null, '6', null, null, null);
INSERT INTO `article` VALUES ('19', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:44', null, '1', null, null, '6', null, null, null);
INSERT INTO `article` VALUES ('20', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:44', null, '1', null, null, '6', null, null, null);
INSERT INTO `article` VALUES ('21', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:46', null, '1', null, null, '6', null, null, null);
INSERT INTO `article` VALUES ('22', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:46', null, '1', null, null, '6', null, null, null);
INSERT INTO `article` VALUES ('23', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:47', null, '1', null, null, '6', null, null, null);
INSERT INTO `article` VALUES ('24', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:48', null, '1', null, null, '6', null, null, null);
INSERT INTO `article` VALUES ('25', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:48', null, '1', null, null, '6', null, null, null);
INSERT INTO `article` VALUES ('26', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:48', null, '1', null, null, '6', null, null, null);
INSERT INTO `article` VALUES ('27', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:49', null, '1', null, null, '6', null, null, null);
INSERT INTO `article` VALUES ('28', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:49', null, '1', null, null, '6', null, null, null);
INSERT INTO `article` VALUES ('29', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:49', null, '1', null, null, '6', null, null, null);
INSERT INTO `article` VALUES ('30', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:49', null, '1', null, null, '6', null, null, null);
INSERT INTO `article` VALUES ('31', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:49', null, '1', null, null, '6', null, null, null);
INSERT INTO `article` VALUES ('32', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:49', null, '1', null, null, '6', null, null, null);
INSERT INTO `article` VALUES ('33', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:51', null, '1', null, null, '6', null, null, null);
INSERT INTO `article` VALUES ('34', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:52', null, '1', null, null, '6', null, null, null);
INSERT INTO `article` VALUES ('35', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:52', null, '1', null, null, '6', null, null, null);
INSERT INTO `article` VALUES ('36', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:52', null, '1', null, null, '6', null, null, null);
INSERT INTO `article` VALUES ('37', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:53', null, '1', null, null, '6', null, null, null);
INSERT INTO `article` VALUES ('38', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:53', null, '1', null, null, '6', null, null, null);
INSERT INTO `article` VALUES ('39', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:54', null, '1', null, null, '6', null, null, null);
INSERT INTO `article` VALUES ('40', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:54', null, '1', null, null, '6', null, null, null);
INSERT INTO `article` VALUES ('41', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:55', null, '1', null, null, '6', null, null, null);
INSERT INTO `article` VALUES ('42', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:56', null, '1', null, null, '6', null, null, null);
INSERT INTO `article` VALUES ('43', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:57', null, '1', null, null, '6', null, null, null);
INSERT INTO `article` VALUES ('44', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:59', null, '1', null, null, '6', null, null, null);
INSERT INTO `article` VALUES ('45', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:59', null, '1', null, null, '6', null, null, null);
INSERT INTO `article` VALUES ('46', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:59', null, '1', null, null, '6', null, null, null);
INSERT INTO `article` VALUES ('47', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:59', null, '1', null, null, '6', null, null, null);
INSERT INTO `article` VALUES ('48', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:59', null, '1', null, null, '6', null, null, null);
INSERT INTO `article` VALUES ('49', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:59', null, '1', null, null, '6', null, null, null);
INSERT INTO `article` VALUES ('50', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:52:00', null, '1', null, null, '6', null, null, null);
INSERT INTO `article` VALUES ('51', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:52:00', null, '1', null, null, '6', null, null, null);
INSERT INTO `article` VALUES ('52', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:52:00', null, '1', null, null, '6', null, null, null);
INSERT INTO `article` VALUES ('53', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:52:03', null, '1', null, null, '6', null, null, null);
INSERT INTO `article` VALUES ('54', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:52:03', null, '1', null, null, '6', null, null, null);
INSERT INTO `article` VALUES ('55', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:52:03', null, '1', null, null, '6', null, null, null);
INSERT INTO `article` VALUES ('56', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:52:03', null, '1', null, null, '6', null, null, null);
INSERT INTO `article` VALUES ('57', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:52:05', null, '1', null, null, '6', null, null, null);
INSERT INTO `article` VALUES ('58', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:52:05', null, '1', null, null, '6', null, null, null);
INSERT INTO `article` VALUES ('59', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:52:05', null, '1', null, null, '6', null, null, null);
INSERT INTO `article` VALUES ('60', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:52:07', null, '1', null, null, '6', null, null, null);
INSERT INTO `article` VALUES ('61', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:52:07', null, '1', null, null, '6', null, null, null);
INSERT INTO `article` VALUES ('62', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:52:07', null, '1', null, null, '6', null, null, null);
INSERT INTO `article` VALUES ('63', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:52:08', null, '1', null, null, '6', null, null, null);
INSERT INTO `articlecate` VALUES ('6', '网络编程', null, null, '5', '0');
INSERT INTO `articlecate` VALUES ('5', '技术类', null, null, '0', '0');
INSERT INTO `articlecate` VALUES ('7', 'web网页', null, null, '6', '1');
INSERT INTO `beiwanglu` VALUES ('2', '发生的地方', '范德萨范德萨范德萨发', '2013-08-09 00:38:03', '1', '1', '2013-08-16 00:37:58', '0', null, null, null, null);
INSERT INTO `beiwanglu` VALUES ('3', '范德萨范德萨发', '范德萨范德萨发萨芬', '2013-08-09 00:47:22', '1', '3', '2013-08-09 00:47:13', '0', null, null, null, null);
INSERT INTO `bwlpinglun` VALUES ('1', '3', '1', '2013-08-09 10:03:25', '范德萨范德萨');
INSERT INTO `bwlpinglun` VALUES ('2', '3', '1', '2013-08-09 10:03:27', '范德萨范德萨范德萨范德萨发');
INSERT INTO `bwlpinglun` VALUES ('3', '3', '1', '2013-08-09 10:03:29', '范德萨范德萨范德萨范德萨发范德萨范德萨');
INSERT INTO `bwlpinglun` VALUES ('4', '3', '1', '2013-08-09 10:04:17', '范德萨范德萨');
INSERT INTO `bwlpinglun` VALUES ('5', '3', '1', '2013-08-09 10:04:19', '范德萨范德萨发第三方');
INSERT INTO `bwlpinglun` VALUES ('6', '3', '1', '2013-08-09 10:04:21', '范德萨分');
INSERT INTO `bwlpinglun` VALUES ('7', '3', '1', '2013-08-09 10:04:53', '范德萨分');
INSERT INTO `bwlpinglun` VALUES ('8', '3', '1', '2013-08-09 10:04:55', '广泛大锅饭的歌');
INSERT INTO `bwlpinglun` VALUES ('9', '3', '1', '2013-08-09 10:04:56', '广泛大锅饭的时光');
INSERT INTO `bwlpinglun` VALUES ('10', '3', '1', '2013-08-09 10:04:59', '广泛大锅饭的时光');
INSERT INTO `bwlpinglun` VALUES ('11', '3', '1', '2013-08-09 13:44:50', '大肆发放');
INSERT INTO `bwlpinglun` VALUES ('12', '3', '1', '2013-08-09 13:44:53', '范德萨范德萨发');
INSERT INTO `doccate` VALUES ('2', '范德萨', null, null, '0', '0');
INSERT INTO `doccate` VALUES ('3', '奋斗sag', null, null, '2', '0');
INSERT INTO `doccate` VALUES ('4', '放到', null, null, '3', '1');
INSERT INTO `doccate` VALUES ('7', 'fdsafdsa', null, 'fdsafd', '3', '1');
INSERT INTO `document` VALUES ('11', 'fdsafdsa', 'fdsafdsafgfdsg', '2013-06-26 23:08:11', null, null, null, '4', null, '1', null, '2013-06-26');
INSERT INTO `document` VALUES ('12', 'fdsafsd909sdfds', '<p>\r\n	fdsafdsafs\r\n</p>\r\n<p>\r\n	fdsafdsaf\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	fdsafdsa\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	fdsafa\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	fdsafds\r\n</p>', '2013-06-26 23:10:10', null, null, null, '3', null, '1', null, '2013-06-26');
INSERT INTO `emailset` VALUES ('1', 'fdsa', 'loyinonline@126.com', '1', 'pop.126.com', '110', 'smtp.126.com', '25', '1234561', '<p>\r\n	fdsafdsa\r\n</p>\r\n<p>\r\n	fdsafdsafsd\r\n</p>', null, '0');
INSERT INTO `employee` VALUES ('1', '龙影', '1', 'loyin', 'e10adc3949ba59abbe56e057f20f883e', '2013-04-01', '13333333333', 'fdsafdgag', 'lsf', '2000-01-01', '1', '362422111112302332', '1', '9', '10000', '/upload/image/20130807191997.jpg', '8', '1', '1', 'fdsagfdsgfdg\r\nfda\r\nfdsa<input type=\'hidden\' name=\'token\' value=\'-3753824874469148842\' />', '<p>\r\n	范德萨飞洒<img src=\"/upload/image/1375874498387.jpg\" alt=\"\" /> \r\n</p>', '5', '127.0.0.1', '2013-08-11 09:53:04', null);
INSERT INTO `form` VALUES ('2', 'AdSernc', 'AdSernc', '1', 'sys', '0');
INSERT INTO `formfield` VALUES ('1', '2', 'dfs', '范德萨范德萨', '范德萨', 'int', '1', '23', null, '1', '1', '1', null, null, null, '45');
INSERT INTO `gglan` VALUES ('1', '日常事务', '12', '1');
INSERT INTO `gglan` VALUES ('2', '部门事务', null, '1');
INSERT INTO `ggreadlist` VALUES ('1', '2013-08-10 15:57:09', '3');
INSERT INTO `ggreadlist` VALUES ('1', '2013-08-10 15:57:11', '8');
INSERT INTO `ggreadlist` VALUES ('1', '2013-08-10 15:58:16', '5');
INSERT INTO `ggreadlist` VALUES ('1', '2013-08-10 16:02:45', '6');
INSERT INTO `ggreadlist` VALUES ('1', '2013-08-10 18:43:12', '4');
INSERT INTO `ggreadlist` VALUES ('1', '2013-08-10 18:43:40', '7');
INSERT INTO `gonggao` VALUES ('3', '范德萨范德萨发', '<p>\r\n	范德萨范德萨发\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	fdsafd\r\n</p>\r\n<p>\r\n	fdsafdsaf\r\n</p>', '2013-08-08 19:24:02', '1', '2013-08-09 22:16:18', null, '0', '2013-08-08', '2013-08-30', '1', null, '1');
INSERT INTO `gonggao` VALUES ('4', '范德萨飞洒大', '范德萨范德萨发', '2013-08-08 22:51:20', '1', '2013-08-08 22:51:30', null, '0', '2013-08-08', null, '1', null, '1');
INSERT INTO `gonggao` VALUES ('5', 'gfdsgfds', 'fdsafdsafdsaffsad', '2013-08-09 22:15:42', '1', '2013-08-09 22:16:24', null, '0', '2013-08-09', null, '1', null, '1');
INSERT INTO `gonggao` VALUES ('6', 'gfdsgfds', 'fdsafdsafdsaffsad', '2013-08-09 22:15:45', '1', '2013-08-09 22:16:24', null, '0', '2013-08-09', null, '1', null, '1');
INSERT INTO `gonggao` VALUES ('7', 'gfdsgfdsgdfs', 'gfdsgfdsgfds', '2013-08-09 22:16:06', '1', '2013-08-09 22:16:18', null, '0', '2013-08-09', null, '1', null, '1');
INSERT INTO `gonggao` VALUES ('8', 'gfdsgfdsgdfs', 'gfdsgfdsgfds', '2013-08-09 22:16:08', '1', '2013-08-09 22:16:24', null, '0', '2013-08-09', null, '1', null, '1');
INSERT INTO `loginlog` VALUES ('19', '1', '2013-08-10 08:52:47', '127.0.0.1', null);
INSERT INTO `loginlog` VALUES ('18', '1', '2013-08-10 08:52:33', '127.0.0.1', null);
INSERT INTO `loginlog` VALUES ('17', '1', '2013-08-10 08:50:49', '127.0.0.1', '2013-08-10 08:51:18');
INSERT INTO `loginlog` VALUES ('16', '1', '2013-08-09 22:47:43', '127.0.0.1', '2013-08-10 08:50:15');
INSERT INTO `loginlog` VALUES ('15', '1', '2013-08-09 22:11:20', '127.0.0.1', '2013-08-09 22:47:40');
INSERT INTO `loginlog` VALUES ('14', '1', '2013-08-09 21:49:06', '127.0.0.1', '2013-08-09 21:58:44');
INSERT INTO `loginlog` VALUES ('13', '1', '2013-08-09 20:43:54', '127.0.0.1', null);
INSERT INTO `loginlog` VALUES ('12', '1', '2013-08-09 13:41:40', '127.0.0.1', null);
INSERT INTO `loginlog` VALUES ('20', '1', '2013-08-10 08:54:43', '127.0.0.1', null);
INSERT INTO `loginlog` VALUES ('21', '1', '2013-08-10 09:30:22', '127.0.0.1', null);
INSERT INTO `loginlog` VALUES ('22', '1', '2013-08-10 10:14:42', '127.0.0.1', '2013-08-10 10:23:37');
INSERT INTO `loginlog` VALUES ('23', '1', '2013-08-10 10:23:39', '127.0.0.1', '2013-08-10 10:50:04');
INSERT INTO `loginlog` VALUES ('24', '1', '2013-08-10 10:50:25', '127.0.0.1', '2013-08-10 10:59:01');
INSERT INTO `loginlog` VALUES ('25', '1', '2013-08-10 10:59:05', '127.0.0.1', null);
INSERT INTO `loginlog` VALUES ('26', '1', '2013-08-10 16:03:07', '127.0.0.1', '2013-08-10 19:04:21');
INSERT INTO `loginlog` VALUES ('27', '1', '2013-08-10 19:04:24', '127.0.0.1', '2013-08-11 09:52:35');
INSERT INTO `loginlog` VALUES ('28', '1', '2013-08-11 09:52:38', '127.0.0.1', '2013-08-11 09:52:44');
INSERT INTO `loginlog` VALUES ('29', '1', '2013-08-11 09:52:46', '127.0.0.1', '2013-08-11 09:52:51');
INSERT INTO `loginlog` VALUES ('30', '1', '2013-08-11 09:52:52', '127.0.0.1', '2013-08-11 09:52:56');
INSERT INTO `loginlog` VALUES ('31', '1', '2013-08-11 09:52:58', '127.0.0.1', '2013-08-11 09:53:03');
INSERT INTO `loginlog` VALUES ('32', '1', '2013-08-11 09:53:04', '127.0.0.1', null);
INSERT INTO `meeting` VALUES ('1', 'fdafa', null, '1', '2013-08-10 13:50:59', 'fdsafdsaf', null, null, '1', null, null, null);
INSERT INTO `meeting` VALUES ('2', 'gfdsgfds', null, '1', '2013-08-10 13:52:29', 'gfdsgfdsgfd', '2013-08-10', '2013-08-10', '1', null, null, null);
INSERT INTO `meeting` VALUES ('3', 'gfdsgfds', null, '1', '2013-08-10 14:03:47', 'gfdsgfdsgfd', '2013-08-10 00:00:00', null, '1', null, null, null);
INSERT INTO `meeting` VALUES ('4', 'dsafdsafdsa', null, '1', '2013-08-10 14:58:11', 'fdsafdsafsdafsadf', '2013-08-10 10:00:00', '2013-08-10 12:00:00', '0', null, null, null);
INSERT INTO `meeting` VALUES ('7', 'sdfdsf', null, '1', '2013-08-10 15:02:22', 'fdsafdsafsdfsafdsaf', '2013-08-10 00:00:00', '2013-08-10 15:02:15', '0', null, null, null);
INSERT INTO `menu` VALUES ('1', '办公', null, '0', null, '1', null, '0', '1', null);
INSERT INTO `menu` VALUES ('2', '客户', null, '0', null, '2', null, '0', '1', null);
INSERT INTO `menu` VALUES ('3', '系统', null, '0', null, '3', null, '0', '1', null);
INSERT INTO `menu` VALUES ('4', '商务', null, '0', null, '4', null, '0', '1', null);
INSERT INTO `menu` VALUES ('5', '销售', null, '0', null, '5', null, '0', '1', null);
INSERT INTO `menu` VALUES ('6', '库存', null, '0', null, '6', null, '0', '1', null);
INSERT INTO `menu` VALUES ('7', '财务', null, '0', null, '7', null, '0', '1', null);
INSERT INTO `menu` VALUES ('8', '技术管理', null, '0', null, '8', null, '0', '1', null);
INSERT INTO `menu` VALUES ('9', '报表', null, '0', 'icon-bars', '9', null, '0', '1', null);
INSERT INTO `menu` VALUES ('10', '人力资源', null, '0', 'icon-user', '10', null, '0', '1', null);
INSERT INTO `menu` VALUES ('11', '功能列表', 'sys/menu', '1', null, '11', null, '3', '1', null);
INSERT INTO `menu` VALUES ('12', '工作流', null, '0', null, '12', null, '0', '1', null);
INSERT INTO `menu` VALUES ('13', '角色', 'sys/role', '1', null, '13', null, '3', '1', null);
INSERT INTO `menu` VALUES ('14', '职位', 'sys/post', '1', null, '14', null, '3', '1', null);
INSERT INTO `menu` VALUES ('15', '组织结构', 'sys/partment', '1', null, '15', null, '3', '1', null);
INSERT INTO `menu` VALUES ('16', '表单(开发)', 'sys/form', '1', null, '16', null, '3', '1', null);
INSERT INTO `menu` VALUES ('17', '知识库', null, '1', null, '17', null, '1', '1', null);
INSERT INTO `menu` VALUES ('18', '员工管理', 'hr/employee', null, null, '18', null, '10', '1', null);
INSERT INTO `menu` VALUES ('19', '员工入职办理', null, '1', null, '19', null, '10', '1', null);
INSERT INTO `menu` VALUES ('20', '员工离职办理', null, '1', null, '20', null, '10', '1', null);
INSERT INTO `menu` VALUES ('21', '员工请假销假', null, '1', null, '21', null, '10', '1', null);
INSERT INTO `menu` VALUES ('22', '考勤', null, '1', null, '22', null, '10', '1', null);
INSERT INTO `menu` VALUES ('23', '员工福利', null, '1', null, '23', null, '10', '1', null);
INSERT INTO `menu` VALUES ('24', '考核设置', null, '1', null, '24', null, '10', '1', null);
INSERT INTO `menu` VALUES ('25', '员工考核', null, '1', null, '25', null, '10', '1', null);
INSERT INTO `menu` VALUES ('26', '奖惩管理', null, '1', null, '26', null, '10', '1', null);
INSERT INTO `menu` VALUES ('27', '岗位变动', null, '1', null, '27', null, '10', '1', null);
INSERT INTO `menu` VALUES ('28', '公告', null, '1', null, '28', null, '1', '1', null);
INSERT INTO `menu` VALUES ('29', '会议', 'oa/meeting', '1', null, '29', null, '1', '1', null);
INSERT INTO `menu` VALUES ('30', '员工评估标准', null, '1', null, '30', null, '10', '1', null);
INSERT INTO `menu` VALUES ('31', '邮件', null, '0', 'icon-annex', '31', null, '0', '1', null);
INSERT INTO `menu` VALUES ('32', '邮箱设置', 'oa/mailBox/set', '1', null, '32', null, '31', '1', null);
INSERT INTO `menu` VALUES ('33', '发件箱', null, '1', null, '33', null, '31', '1', null);
INSERT INTO `menu` VALUES ('34', '收件箱', null, '1', null, '34', null, '31', '1', null);
INSERT INTO `menu` VALUES ('35', '草稿箱', null, '1', null, '35', null, '31', '1', null);
INSERT INTO `menu` VALUES ('36', '回收箱', null, '1', null, '36', null, '31', '1', null);
INSERT INTO `menu` VALUES ('38', '工作流设置', null, '1', null, '38', null, '12', '1', null);
INSERT INTO `menu` VALUES ('39', '工作流进程管理', null, '1', null, '39', null, '12', '1', null);
INSERT INTO `menu` VALUES ('40', '我的工作流', null, '1', null, '40', null, '12', '1', null);
INSERT INTO `menu` VALUES ('41', '创建工作流', null, '1', null, '41', null, '12', '1', null);
INSERT INTO `menu` VALUES ('42', '日程', null, '1', null, '42', null, '1', '1', null);
INSERT INTO `menu` VALUES ('43', '计划', null, '1', null, '43', null, '1', '1', null);
INSERT INTO `menu` VALUES ('44', '工作报告', null, '1', null, '44', null, '1', '1', null);
INSERT INTO `menu` VALUES ('45', '通信录', null, '1', null, '45', null, '1', '1', null);
INSERT INTO `menu` VALUES ('46', '站内消息', null, '1', null, '46', null, '1', '1', null);
INSERT INTO `menu` VALUES ('47', '论坛', null, '1', null, '47', null, '1', '1', null);
INSERT INTO `menu` VALUES ('48', '备忘录', 'oa/beiwanglu/', '1', null, '48', null, '1', '1', null);
INSERT INTO `menu` VALUES ('49', '项目', null, '0', null, '49', null, '0', '1', null);
INSERT INTO `menu` VALUES ('50', '项目管理', null, '1', null, '50', null, '49', '1', null);
INSERT INTO `menu` VALUES ('51', '项目进度', null, '1', null, '51', null, '49', '1', null);
INSERT INTO `menu` VALUES ('52', '参数设置', 'sys/sysparame', '0', null, '52', null, '3', '1', null);
INSERT INTO `menu` VALUES ('53', '客户评估标准', null, '1', null, '53', null, '2', '1', null);
INSERT INTO `menu` VALUES ('54', '客户管理', null, '1', null, '54', null, '2', '1', null);
INSERT INTO `menu` VALUES ('55', '客户分配', null, '1', null, '55', null, '2', '1', null);
INSERT INTO `menu` VALUES ('56', '合同管理', null, '1', null, '56', null, '2', '1', null);
INSERT INTO `menu` VALUES ('57', '厂商管理', null, '1', null, '57', null, '4', '1', null);
INSERT INTO `menu` VALUES ('58', '产品类型', null, '1', null, '58', null, '4', '1', null);
INSERT INTO `menu` VALUES ('59', '产品列表', null, '1', null, '59', null, '4', '1', null);
INSERT INTO `menu` VALUES ('60', '报备处理', null, '1', null, '60', null, '4', '1', null);
INSERT INTO `menu` VALUES ('61', '测试处理', null, '1', null, '61', null, '4', '1', null);
INSERT INTO `menu` VALUES ('62', '采购合同', null, '1', null, '62', null, '4', '1', null);
INSERT INTO `menu` VALUES ('111', '登录日志', 'sys/loginLog', '1', null, '111', null, '112', '1', null);
INSERT INTO `menu` VALUES ('63', '分销管理', null, '1', null, '63', null, '5', '1', null);
INSERT INTO `menu` VALUES ('64', '直销管理', null, '1', null, '64', null, '5', '1', null);
INSERT INTO `menu` VALUES ('65', '合同管理', null, '1', null, '65', null, '5', '1', null);
INSERT INTO `menu` VALUES ('66', '仓库管理', null, '1', null, '66', null, '6', '1', null);
INSERT INTO `menu` VALUES ('67', '入库', null, '1', null, '67', null, '6', '1', null);
INSERT INTO `menu` VALUES ('68', '出库', null, '1', null, '68', null, '6', '1', null);
INSERT INTO `menu` VALUES ('69', '库存查询', null, '1', null, '69', null, '6', '1', null);
INSERT INTO `menu` VALUES ('70', '损耗报备', null, '1', null, '70', null, '6', '1', null);
INSERT INTO `menu` VALUES ('71', '测试机库存', null, '1', null, '71', null, '6', '1', null);
INSERT INTO `menu` VALUES ('72', '税率设置', 'fa/taxRate', '1', null, '72', null, '7', '1', null);
INSERT INTO `menu` VALUES ('73', '出纳', null, '1', null, '73', null, '7', '1', null);
INSERT INTO `menu` VALUES ('74', '收银', null, '1', null, '74', null, '7', '1', null);
INSERT INTO `menu` VALUES ('75', '销售合同', null, '1', null, '75', null, '7', '1', null);
INSERT INTO `menu` VALUES ('76', '采购合同', null, '1', null, '76', null, '7', '1', null);
INSERT INTO `menu` VALUES ('77', '工资发放', null, '1', null, '77', null, '7', '1', null);
INSERT INTO `menu` VALUES ('78', '分配任务', null, '1', null, '78', null, '8', '1', null);
INSERT INTO `menu` VALUES ('79', '我的任务', null, '1', null, '79', null, '8', '1', null);
INSERT INTO `menu` VALUES ('80', '解决方案', null, '1', null, '80', null, '8', '1', null);
INSERT INTO `menu` VALUES ('81', '售后列表', null, '1', null, '81', null, '8', '1', null);
INSERT INTO `menu` VALUES ('82', '分配客户', null, '1', null, '82', null, '8', '1', null);
INSERT INTO `menu` VALUES ('83', '部门任务', null, '1', null, '83', null, '8', '1', null);
INSERT INTO `menu` VALUES ('84', '测试机初始化', null, '1', null, '84', null, '8', '1', null);
INSERT INTO `menu` VALUES ('85', '财务报表', null, '1', null, '85', null, '9', '1', null);
INSERT INTO `menu` VALUES ('86', '销售报表', null, '1', null, '86', null, '9', '1', null);
INSERT INTO `menu` VALUES ('87', '客户资源报表', null, '1', null, '87', null, '9', '1', null);
INSERT INTO `menu` VALUES ('88', '考勤报表', null, '1', null, '88', null, '9', '1', null);
INSERT INTO `menu` VALUES ('89', '产品资源报表', null, '1', null, '89', null, '9', '1', null);
INSERT INTO `menu` VALUES ('90', '库存报表', null, '1', null, '90', null, '9', '1', null);
INSERT INTO `menu` VALUES ('110', '发布公告', 'oa/Gonggao/fabu', '1', null, '2', null, '28', '1', null);
INSERT INTO `menu` VALUES ('92', '下属维护', null, '1', null, '92', null, '10', '1', null);
INSERT INTO `menu` VALUES ('93', '渠道管理', null, '1', null, '93', null, '63', '1', null);
INSERT INTO `menu` VALUES ('94', '跟进列表', null, '1', null, '94', null, '63', '1', null);
INSERT INTO `menu` VALUES ('95', '报备列表', null, '1', null, '95', null, '63', '1', null);
INSERT INTO `menu` VALUES ('96', '技术任务', null, '1', null, '96', null, '63', '1', null);
INSERT INTO `menu` VALUES ('97', '合同列表', null, '1', null, '97', null, '63', '1', null);
INSERT INTO `menu` VALUES ('98', '报价列表', null, '1', null, '98', null, '63', '1', null);
INSERT INTO `menu` VALUES ('99', '订单列表', null, '1', null, '99', null, '63', '1', null);
INSERT INTO `menu` VALUES ('100', '销售商机', null, '1', null, '100', null, '63', '1', null);
INSERT INTO `menu` VALUES ('102', '渠道管理', null, '1', null, '102', null, '64', '1', null);
INSERT INTO `menu` VALUES ('103', '跟进列表', null, '1', null, '103', null, '64', '1', null);
INSERT INTO `menu` VALUES ('104', '报备列表', null, '1', null, '104', null, '64', '1', null);
INSERT INTO `menu` VALUES ('105', '技术任务', null, '1', null, '105', null, '64', '1', null);
INSERT INTO `menu` VALUES ('106', '合同列表', null, '1', null, '106', null, '64', '1', null);
INSERT INTO `menu` VALUES ('107', '报价列表', null, '1', null, '107', null, '64', '1', null);
INSERT INTO `menu` VALUES ('108', '订单列表', null, '1', null, '108', null, '64', '1', null);
INSERT INTO `menu` VALUES ('109', '销售商机', null, '1', null, '109', null, '64', '1', null);
INSERT INTO `menu` VALUES ('112', '日志', null, '1', null, '112', null, '3', '1', null);
INSERT INTO `menu` VALUES ('113', '操作日志', 'sys/operaLog', '1', null, '113', null, '112', '1', null);
INSERT INTO `menu` VALUES ('114', '系统日志', 'sys/sysLog', '1', null, '114', null, '112', '1', null);
INSERT INTO `menu` VALUES ('115', '文档分类', 'oa/articleCate', '1', null, '1', null, '17', '1', null);
INSERT INTO `menu` VALUES ('116', '文档管理', 'oa/article', '1', null, '2', null, '17', '1', null);
INSERT INTO `menu` VALUES ('117', '我的公告', 'oa/Gonggao', '1', null, '1', null, '28', '1', null);
INSERT INTO `menu` VALUES ('118', '公告栏设置', 'oa/gglan', '1', null, '1', null, '28', '1', null);
INSERT INTO `partment` VALUES ('1', 'xxx有限公司', null, '0', '01', null);
INSERT INTO `partment` VALUES ('8', '技术部', null, '1', '0101', null);
INSERT INTO `partment` VALUES ('9', '销售部', null, '1', '0102', null);
INSERT INTO `partment` VALUES ('10', '人力资源部', null, '1', '0103', null);
INSERT INTO `partment` VALUES ('11', '后勤部', null, '1', '0104', null);
INSERT INTO `partment` VALUES ('14', '萨芬的', null, '8', '斯蒂芬', null);
INSERT INTO `partment` VALUES ('13', 'JEE', null, '12', '123213', null);
INSERT INTO `partment` VALUES ('15', 'sdf', null, '14', 'sdf', null);
INSERT INTO `post` VALUES ('1', '员工', null, '13');
INSERT INTO `post` VALUES ('3', '总经理', null, '1');
INSERT INTO `post` VALUES ('4', '总经理助理', null, '2');
INSERT INTO `post` VALUES ('5', '部门经理', null, '3');
INSERT INTO `post` VALUES ('6', '部门助理', null, '4');
INSERT INTO `post` VALUES ('7', '人力', null, '1');
INSERT INTO `post` VALUES ('8', '行政', null, '1');
INSERT INTO `post` VALUES ('9', '财务', 'dfdsafdsaf', '1');
INSERT INTO `post` VALUES ('10', '出纳', null, '1');
INSERT INTO `post` VALUES ('11', '销售员', null, '1');
INSERT INTO `post` VALUES ('12', '商务', null, '1');
INSERT INTO `powermenu` VALUES ('49', '2', '1');
INSERT INTO `powermenu` VALUES ('37', '2', '1');
INSERT INTO `powermenu` VALUES ('36', '2', '1');
INSERT INTO `powermenu` VALUES ('35', '2', '1');
INSERT INTO `powermenu` VALUES ('34', '2', '1');
INSERT INTO `powermenu` VALUES ('33', '2', '1');
INSERT INTO `powermenu` VALUES ('32', '2', '1');
INSERT INTO `powermenu` VALUES ('31', '2', '1');
INSERT INTO `powermenu` VALUES ('41', '2', '1');
INSERT INTO `powermenu` VALUES ('40', '2', '1');
INSERT INTO `powermenu` VALUES ('39', '2', '1');
INSERT INTO `powermenu` VALUES ('38', '2', '1');
INSERT INTO `powermenu` VALUES ('12', '2', '1');
INSERT INTO `powermenu` VALUES ('92', '2', '1');
INSERT INTO `powermenu` VALUES ('30', '2', '1');
INSERT INTO `powermenu` VALUES ('27', '2', '1');
INSERT INTO `powermenu` VALUES ('26', '2', '1');
INSERT INTO `powermenu` VALUES ('25', '2', '1');
INSERT INTO `powermenu` VALUES ('24', '2', '1');
INSERT INTO `powermenu` VALUES ('23', '2', '1');
INSERT INTO `powermenu` VALUES ('22', '2', '1');
INSERT INTO `powermenu` VALUES ('21', '2', '1');
INSERT INTO `powermenu` VALUES ('20', '2', '1');
INSERT INTO `powermenu` VALUES ('19', '2', '1');
INSERT INTO `powermenu` VALUES ('18', '2', '1');
INSERT INTO `powermenu` VALUES ('10', '2', '1');
INSERT INTO `powermenu` VALUES ('90', '2', '1');
INSERT INTO `powermenu` VALUES ('89', '2', '1');
INSERT INTO `powermenu` VALUES ('88', '2', '1');
INSERT INTO `powermenu` VALUES ('87', '2', '1');
INSERT INTO `powermenu` VALUES ('86', '2', '1');
INSERT INTO `powermenu` VALUES ('85', '2', '1');
INSERT INTO `powermenu` VALUES ('9', '2', '1');
INSERT INTO `powermenu` VALUES ('84', '2', '1');
INSERT INTO `powermenu` VALUES ('83', '2', '1');
INSERT INTO `powermenu` VALUES ('82', '2', '1');
INSERT INTO `powermenu` VALUES ('81', '2', '1');
INSERT INTO `powermenu` VALUES ('80', '2', '1');
INSERT INTO `powermenu` VALUES ('79', '2', '1');
INSERT INTO `powermenu` VALUES ('78', '2', '1');
INSERT INTO `powermenu` VALUES ('8', '2', '1');
INSERT INTO `powermenu` VALUES ('77', '2', '1');
INSERT INTO `powermenu` VALUES ('76', '2', '1');
INSERT INTO `powermenu` VALUES ('75', '2', '1');
INSERT INTO `powermenu` VALUES ('74', '2', '1');
INSERT INTO `powermenu` VALUES ('73', '2', '1');
INSERT INTO `powermenu` VALUES ('72', '2', '1');
INSERT INTO `powermenu` VALUES ('7', '2', '1');
INSERT INTO `powermenu` VALUES ('71', '2', '1');
INSERT INTO `powermenu` VALUES ('70', '2', '1');
INSERT INTO `powermenu` VALUES ('69', '2', '1');
INSERT INTO `powermenu` VALUES ('68', '2', '1');
INSERT INTO `powermenu` VALUES ('67', '2', '1');
INSERT INTO `powermenu` VALUES ('66', '2', '1');
INSERT INTO `powermenu` VALUES ('6', '2', '1');
INSERT INTO `powermenu` VALUES ('65', '2', '1');
INSERT INTO `powermenu` VALUES ('109', '2', '1');
INSERT INTO `powermenu` VALUES ('108', '2', '1');
INSERT INTO `powermenu` VALUES ('107', '2', '1');
INSERT INTO `powermenu` VALUES ('106', '2', '1');
INSERT INTO `powermenu` VALUES ('105', '2', '1');
INSERT INTO `powermenu` VALUES ('104', '2', '1');
INSERT INTO `powermenu` VALUES ('103', '2', '1');
INSERT INTO `powermenu` VALUES ('102', '2', '1');
INSERT INTO `powermenu` VALUES ('64', '2', '1');
INSERT INTO `powermenu` VALUES ('100', '2', '1');
INSERT INTO `powermenu` VALUES ('99', '2', '1');
INSERT INTO `powermenu` VALUES ('98', '2', '1');
INSERT INTO `powermenu` VALUES ('97', '2', '1');
INSERT INTO `powermenu` VALUES ('96', '2', '1');
INSERT INTO `powermenu` VALUES ('95', '2', '1');
INSERT INTO `powermenu` VALUES ('94', '2', '1');
INSERT INTO `powermenu` VALUES ('93', '2', '1');
INSERT INTO `powermenu` VALUES ('63', '2', '1');
INSERT INTO `powermenu` VALUES ('5', '2', '1');
INSERT INTO `powermenu` VALUES ('62', '2', '1');
INSERT INTO `powermenu` VALUES ('61', '2', '1');
INSERT INTO `powermenu` VALUES ('60', '2', '1');
INSERT INTO `powermenu` VALUES ('59', '2', '1');
INSERT INTO `powermenu` VALUES ('58', '2', '1');
INSERT INTO `powermenu` VALUES ('57', '2', '1');
INSERT INTO `powermenu` VALUES ('4', '2', '1');
INSERT INTO `powermenu` VALUES ('114', '2', '1');
INSERT INTO `powermenu` VALUES ('113', '2', '1');
INSERT INTO `powermenu` VALUES ('111', '2', '1');
INSERT INTO `powermenu` VALUES ('112', '2', '1');
INSERT INTO `powermenu` VALUES ('52', '2', '1');
INSERT INTO `powermenu` VALUES ('16', '2', '1');
INSERT INTO `powermenu` VALUES ('15', '2', '1');
INSERT INTO `powermenu` VALUES ('14', '2', '1');
INSERT INTO `powermenu` VALUES ('13', '2', '1');
INSERT INTO `powermenu` VALUES ('11', '2', '1');
INSERT INTO `powermenu` VALUES ('3', '2', '1');
INSERT INTO `powermenu` VALUES ('56', '2', '1');
INSERT INTO `powermenu` VALUES ('55', '2', '1');
INSERT INTO `powermenu` VALUES ('54', '2', '1');
INSERT INTO `powermenu` VALUES ('53', '2', '1');
INSERT INTO `powermenu` VALUES ('2', '2', '1');
INSERT INTO `powermenu` VALUES ('48', '2', '1');
INSERT INTO `powermenu` VALUES ('47', '2', '1');
INSERT INTO `powermenu` VALUES ('46', '2', '1');
INSERT INTO `powermenu` VALUES ('45', '2', '1');
INSERT INTO `powermenu` VALUES ('44', '2', '1');
INSERT INTO `powermenu` VALUES ('43', '2', '1');
INSERT INTO `powermenu` VALUES ('42', '2', '1');
INSERT INTO `powermenu` VALUES ('29', '2', '1');
INSERT INTO `powermenu` VALUES ('118', '2', '1');
INSERT INTO `powermenu` VALUES ('117', '2', '1');
INSERT INTO `powermenu` VALUES ('110', '2', '1');
INSERT INTO `powermenu` VALUES ('28', '2', '1');
INSERT INTO `powermenu` VALUES ('116', '2', '1');
INSERT INTO `powermenu` VALUES ('115', '2', '1');
INSERT INTO `powermenu` VALUES ('17', '2', '1');
INSERT INTO `powermenu` VALUES ('1', '2', '1');
INSERT INTO `powermenu` VALUES ('0', '2', '1');
INSERT INTO `powermenu` VALUES ('50', '2', '1');
INSERT INTO `powermenu` VALUES ('51', '2', '1');
INSERT INTO `role` VALUES ('1', '员工', null, '13');
INSERT INTO `role` VALUES ('2', '管理员', '具有管理员权限', '1');
INSERT INTO `role` VALUES ('3', '总经理', null, '1');
INSERT INTO `role` VALUES ('4', '总经理助理', null, '2');
INSERT INTO `role` VALUES ('5', '部门经理', null, '3');
INSERT INTO `role` VALUES ('6', '部门助理', null, '4');
INSERT INTO `role` VALUES ('7', '人力', null, '1');
INSERT INTO `role` VALUES ('8', '行政', null, '1');
INSERT INTO `role` VALUES ('9', '财务', null, '1');
INSERT INTO `role` VALUES ('10', '出纳', null, '1');
INSERT INTO `role` VALUES ('11', '销售员', null, '1');
INSERT INTO `role` VALUES ('13', '库管员', null, '1');
INSERT INTO `role` VALUES ('20', '测试', null, '2');
INSERT INTO `taxrate` VALUES ('2', '2013-08-09', '200');
INSERT INTO `taxrate` VALUES ('3', '2013-08-30', '12.5');
INSERT INTO `userrole` VALUES ('1', '2');
INSERT INTO `userrole` VALUES ('1', '1');
INSERT INTO `userrole` VALUES ('1', '3');
