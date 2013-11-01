/*
MySQL Data Transfer
Source Host: localhost
Source Database: easyjfoa
Target Host: localhost
Target Database: easyjfoa
Date: 2013/6/29 11:03:45
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
  `CDATE` datetime default NULL,
  `UID` bigint(20) default NULL,
  `TXPL` smallint(6) default '0',
  `TXTIME` varchar(20) default NULL,
  `TXDATE` date default NULL,
  `TXRY` smallint(6) default '0' COMMENT '0:本人 1：所有共享人',
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bwlshare
-- ----------------------------
CREATE TABLE `bwlshare` (
  `ID` bigint(20) NOT NULL auto_increment,
  `BWLID` bigint(20) NOT NULL,
  `UID` bigint(20) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
  `IsAllDayEvent` bit(1) NOT NULL default b'0' COMMENT '是否全天日程',
  `HasAttachment` bit(1) NOT NULL default b'0' COMMENT '是否有附件',
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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for formfield
-- ----------------------------
CREATE TABLE `formfield` (
  `ID` bigint(20) NOT NULL auto_increment,
  `FMID` bigint(20) NOT NULL,
  `FIELDNAME` varchar(20) default NULL,
  `FILEDDESC` varchar(30) default NULL,
  `FILEDTITLE` varchar(50) default NULL COMMENT '对应html 的 title',
  `FTYPE` smallint(6) default NULL COMMENT 'String       文本\r\nInteger     整型\r\nLong        长整型\r\nFloat         浮点型\r\nDouble     双精度\r\nBigdicms  bigdicme\r\n',
  `FLEN` smallint(6) NOT NULL,
  `CTRLTYPE` smallint(6) NOT NULL COMMENT '1单行文本\r\n2多行文本\r\n3单选\r\n4复选\r\n5隐藏\r\n6下拉框\r\n7文件上传\r\n8富文本编辑框\r\n9角色\r\n10岗位\r\n11部门',
  `VALIT` smallint(6) default NULL,
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gglan
-- ----------------------------
CREATE TABLE `gglan` (
  `ID` bigint(20) NOT NULL auto_increment,
  `NAME` varchar(20) NOT NULL,
  `DESCP` varchar(200) default NULL,
  `ENABLE` smallint(6) NOT NULL default '1' COMMENT '0:不可用 1可用',
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ggreadlist
-- ----------------------------
CREATE TABLE `ggreadlist` (
  `UID` bigint(20) default NULL,
  `RDATE` datetime default NULL,
  `GGID` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gonggao
-- ----------------------------
CREATE TABLE `gonggao` (
  `ID` bigint(20) NOT NULL auto_increment,
  `TITLE` varchar(100) default NULL,
  `CONTEXT` longtext,
  `CDATE` datetime default NULL,
  `UID` bigint(20) default NULL,
  `FBDATE` datetime default NULL,
  `CXDATE` datetime default NULL,
  `ZD` smallint(6) default '0' COMMENT '1:置顶',
  `STARTDATE` datetime default NULL,
  `ENDDATE` datetime default NULL,
  `GGLANID` bigint(20) NOT NULL,
  `SHOWCONT` int(11) default NULL,
  `UDATE` datetime default NULL,
  PRIMARY KEY  (`ID`)
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

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
INSERT INTO `doccate` VALUES ('2', '范德萨', null, null, '0', '0');
INSERT INTO `doccate` VALUES ('3', '奋斗sag', null, null, '2', '0');
INSERT INTO `doccate` VALUES ('4', '放到', null, null, '3', '1');
INSERT INTO `document` VALUES ('11', 'fdsafdsa', 'fdsafdsafgfdsg', '2013-06-26 23:08:11', null, null, null, '4', null, '1', null, '2013-06-26');
INSERT INTO `document` VALUES ('12', 'fdsafsd909sdfds', '<p>\r\n	fdsafdsafs\r\n</p>\r\n<p>\r\n	fdsafdsaf\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	fdsafdsa\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	fdsafa\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	fdsafds\r\n</p>', '2013-06-26 23:10:10', null, null, null, '3', null, '1', null, '2013-06-26');
INSERT INTO `employee` VALUES ('1', '龙影', '1', 'loyin', 'e10adc3949ba59abbe56e057f20f883e', '2013-04-01', '13333333333', 'fdsafdgag', 'lsf', '2000-01-01', '1', '362422111112302332', '1', '9', '10000', '/ecp/upload/image/201306052352598.jpg', '8', '1', '1', 'fdsagfdsgfdg\r\nfda\r\nfdsa<input type=\'hidden\' name=\'token\' value=\'-3753824874469148842\' />', '<p>\r\n	<br />\r\n</p>', '5', '127.0.0.1', '2013-06-27 13:36:57');
INSERT INTO `form` VALUES ('1', 'asdsad', '表单注释', '1', 'sys', '0');
INSERT INTO `menu` VALUES ('2', '系统管理', null, '0', null, '10', null, '0', '1', null);
INSERT INTO `menu` VALUES ('3', '人力资源', null, '0', 'icon-mans', '9', null, '0', '1', null);
INSERT INTO `menu` VALUES ('4', '工作计划', null, '0', null, '8', null, '0', '1', null);
INSERT INTO `menu` VALUES ('5', '财务', null, '0', null, '7', null, '0', '1', null);
INSERT INTO `menu` VALUES ('24', '任务', null, '0', null, '4', null, '0', '1', null);
INSERT INTO `menu` VALUES ('73', '职位', 'sys/post', '1', 'icon-calc', '1', null, '33', '1', null);
INSERT INTO `menu` VALUES ('21', '文档', null, '0', null, '2', null, '0', '1', null);
INSERT INTO `menu` VALUES ('20', '员工信息', 'hr/employee', '1', null, '1', null, '15', '1', null);
INSERT INTO `menu` VALUES ('10', '功能菜单', 'sys/menu', '1', null, '1', 'menuctrl', '32', '1', null);
INSERT INTO `menu` VALUES ('11', '角色', 'sys/role', '1', null, '1', null, '33', '1', null);
INSERT INTO `menu` VALUES ('12', '组织结构', 'sys/partment', '1', 'icon-grou', '2', null, '33', '1', null);
INSERT INTO `menu` VALUES ('13', '参数设置', 'sys/sysparame', '1', null, '3', null, '32', '1', null);
INSERT INTO `menu` VALUES ('15', '人员管理', null, '1', null, '1', null, '3', '1', null);
INSERT INTO `menu` VALUES ('18', '员工工资发放', 'wagepay', '1', null, '1', 'wagepay', '5', '1', null);
INSERT INTO `menu` VALUES ('25', '日程', null, '0', null, '5', null, '0', '1', null);
INSERT INTO `menu` VALUES ('26', '我的日程', null, '1', null, '1', null, '25', '1', null);
INSERT INTO `menu` VALUES ('27', '我的日程管理', 'oa/calender', '1', null, '1', null, '26', '1', null);
INSERT INTO `menu` VALUES ('28', '考勤管理', null, '1', null, '1', null, '3', '1', null);
INSERT INTO `menu` VALUES ('29', '我的考勤', null, '1', null, '1', null, '28', '1', null);
INSERT INTO `menu` VALUES ('30', '考勤统计', null, '1', null, '2', null, '28', '1', null);
INSERT INTO `menu` VALUES ('32', '系统设置', null, '1', null, '0', null, '2', '1', null);
INSERT INTO `menu` VALUES ('33', '组织设置', null, '1', null, '2', null, '2', '1', null);
INSERT INTO `menu` VALUES ('74', '客户关系管理系统', null, '0', null, '1', null, '0', '1', null);
INSERT INTO `menu` VALUES ('38', '我的任务', null, '1', null, '1', null, '24', '1', null);
INSERT INTO `menu` VALUES ('39', '发布任务', null, '1', null, '0', null, '24', '1', null);
INSERT INTO `menu` VALUES ('43', '发布文档', 'oa/document/add', '1', null, '1', null, '42', '1', null);
INSERT INTO `menu` VALUES ('41', '公共文档', null, '1', null, '0', null, '21', '1', null);
INSERT INTO `menu` VALUES ('42', '我的文档', null, '1', null, '0', null, '21', '1', null);
INSERT INTO `menu` VALUES ('44', '文档管理', 'oa/document', '1', null, '0', null, '42', '1', null);
INSERT INTO `menu` VALUES ('45', '发布文档', 'oa/document/add', '1', null, '1', null, '41', '1', null);
INSERT INTO `menu` VALUES ('46', '文档管理', 'oa/document', '1', null, '3', null, '41', '1', null);
INSERT INTO `menu` VALUES ('48', '流程管理', null, '1', null, '1', null, '32', '1', null);
INSERT INTO `menu` VALUES ('49', '流程分类', null, '1', null, '1', null, '48', '1', null);
INSERT INTO `menu` VALUES ('50', '流程发布', null, '1', null, '5', null, '48', '1', null);
INSERT INTO `menu` VALUES ('51', '资产', null, '0', null, '2', null, '0', '1', null);
INSERT INTO `menu` VALUES ('52', '会议管理', 'oa/meeting', '1', null, '0', 'fdsafd', '25', '1', null);
INSERT INTO `menu` VALUES ('55', '增加修改删除', null, '2', null, '0', 'empaed', '20', '1', null);
INSERT INTO `menu` VALUES ('57', '设置密码及角色', null, '2', null, '0', 'empset', '20', '1', null);
INSERT INTO `menu` VALUES ('59', '保存', null, '2', 'icon-save', '0', 'menusave', '10', '1', null);
INSERT INTO `menu` VALUES ('66', '文档类别', null, '1', null, '0', null, '21', '1', null);
INSERT INTO `menu` VALUES ('67', '文档类别管理', 'oa/docCate', '1', null, '0', 'docCate', '66', '1', null);
INSERT INTO `menu` VALUES ('68', '知识库', null, '0', null, '3', null, '0', '1', null);
INSERT INTO `menu` VALUES ('69', '文章库', null, '1', null, '0', null, '68', '1', null);
INSERT INTO `menu` VALUES ('70', '文章类别管理', 'oa/articleCate', '1', null, '0', null, '69', '1', null);
INSERT INTO `menu` VALUES ('71', '文章库列表', 'oa/article', '1', null, '0', null, '69', '1', null);
INSERT INTO `menu` VALUES ('72', '完全控制', null, '2', null, '0', 'articleCatectrl', '70', '1', null);
INSERT INTO `menu` VALUES ('75', '销售管理', null, '0', null, '1', null, '0', '1', null);
INSERT INTO `menu` VALUES ('76', '表单设计', 'sys/form', '1', 'icon-calc', '1', null, '32', '1', null);
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
INSERT INTO `post` VALUES ('9', '财务', null, '1');
INSERT INTO `post` VALUES ('10', '出纳', null, '1');
INSERT INTO `post` VALUES ('11', '销售员', null, '1');
INSERT INTO `post` VALUES ('12', '商务', null, '1');
INSERT INTO `post` VALUES ('13', '库管员', null, '1');
INSERT INTO `powermenu` VALUES ('71', '11', '3');
INSERT INTO `powermenu` VALUES ('72', '11', '3');
INSERT INTO `powermenu` VALUES ('10', '3', '1');
INSERT INTO `powermenu` VALUES ('70', '11', '3');
INSERT INTO `powermenu` VALUES ('69', '11', '3');
INSERT INTO `powermenu` VALUES ('68', '11', '3');
INSERT INTO `powermenu` VALUES ('71', '2', '1');
INSERT INTO `powermenu` VALUES ('72', '2', '1');
INSERT INTO `powermenu` VALUES ('70', '2', '1');
INSERT INTO `powermenu` VALUES ('69', '2', '1');
INSERT INTO `powermenu` VALUES ('68', '2', '1');
INSERT INTO `powermenu` VALUES ('51', '2', '1');
INSERT INTO `powermenu` VALUES ('52', '2', '1');
INSERT INTO `powermenu` VALUES ('27', '2', '1');
INSERT INTO `powermenu` VALUES ('26', '2', '1');
INSERT INTO `powermenu` VALUES ('25', '2', '1');
INSERT INTO `powermenu` VALUES ('67', '2', '1');
INSERT INTO `powermenu` VALUES ('66', '2', '1');
INSERT INTO `powermenu` VALUES ('44', '2', '1');
INSERT INTO `powermenu` VALUES ('43', '2', '1');
INSERT INTO `powermenu` VALUES ('42', '2', '1');
INSERT INTO `powermenu` VALUES ('46', '2', '1');
INSERT INTO `powermenu` VALUES ('45', '2', '1');
INSERT INTO `powermenu` VALUES ('41', '2', '1');
INSERT INTO `powermenu` VALUES ('21', '2', '1');
INSERT INTO `powermenu` VALUES ('39', '2', '1');
INSERT INTO `powermenu` VALUES ('38', '2', '1');
INSERT INTO `powermenu` VALUES ('24', '2', '1');
INSERT INTO `powermenu` VALUES ('18', '2', '1');
INSERT INTO `powermenu` VALUES ('5', '2', '1');
INSERT INTO `powermenu` VALUES ('4', '2', '1');
INSERT INTO `powermenu` VALUES ('30', '2', '1');
INSERT INTO `powermenu` VALUES ('29', '2', '1');
INSERT INTO `powermenu` VALUES ('28', '2', '1');
INSERT INTO `powermenu` VALUES ('57', '2', '1');
INSERT INTO `powermenu` VALUES ('55', '2', '1');
INSERT INTO `powermenu` VALUES ('20', '2', '1');
INSERT INTO `powermenu` VALUES ('15', '2', '1');
INSERT INTO `powermenu` VALUES ('3', '2', '1');
INSERT INTO `powermenu` VALUES ('12', '2', '1');
INSERT INTO `powermenu` VALUES ('11', '2', '1');
INSERT INTO `powermenu` VALUES ('73', '2', '1');
INSERT INTO `powermenu` VALUES ('33', '2', '1');
INSERT INTO `powermenu` VALUES ('76', '2', '1');
INSERT INTO `powermenu` VALUES ('50', '2', '1');
INSERT INTO `powermenu` VALUES ('49', '2', '1');
INSERT INTO `powermenu` VALUES ('48', '2', '1');
INSERT INTO `powermenu` VALUES ('13', '2', '1');
INSERT INTO `powermenu` VALUES ('59', '2', '1');
INSERT INTO `powermenu` VALUES ('10', '2', '1');
INSERT INTO `powermenu` VALUES ('32', '2', '1');
INSERT INTO `powermenu` VALUES ('2', '2', '1');
INSERT INTO `powermenu` VALUES ('54', '3', '1');
INSERT INTO `powermenu` VALUES ('59', '3', '1');
INSERT INTO `powermenu` VALUES ('47', '3', '1');
INSERT INTO `powermenu` VALUES ('32', '3', '1');
INSERT INTO `powermenu` VALUES ('2', '3', '1');
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
INSERT INTO `role` VALUES ('12', '商务', null, '1');
INSERT INTO `role` VALUES ('13', '库管员', null, '1');
INSERT INTO `sysparame` VALUES ('6', 'fdsasf', 'sdf', 'fdsaf', '1', null, '0');
INSERT INTO `sysparame` VALUES ('7', 'dsaf', 'sdfdsf', 'sdfdsf', '1', 'df', '6');
INSERT INTO `sysparame` VALUES ('11', '范德萨', '反对反对撒', '123', '1', '213', '7');
INSERT INTO `userrole` VALUES ('1', '2');
INSERT INTO `userrole` VALUES ('1', '1');
INSERT INTO `userrole` VALUES ('1', '3');
