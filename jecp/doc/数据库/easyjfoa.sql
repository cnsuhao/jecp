/*
MySQL Data Transfer
Source Host: localhost
Source Database: easyjfoa
Target Host: localhost
Target Database: easyjfoa
Date: 2013/10/26 21:57:26
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
-- Table structure for bbs_module
-- ----------------------------
CREATE TABLE `bbs_module` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(20) default NULL,
  `detail` varchar(100) default NULL,
  `turn` tinyint(2) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bbs_post
-- ----------------------------
CREATE TABLE `bbs_post` (
  `id` bigint(20) NOT NULL auto_increment,
  `topicID` bigint(20) NOT NULL,
  `userID` bigint(20) NOT NULL default '0',
  `content` text NOT NULL,
  `createTime` timestamp NULL default CURRENT_TIMESTAMP,
  `hasReply` bit(1) NOT NULL default '\0',
  `updateTime` timestamp NULL default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bbs_reply
-- ----------------------------
CREATE TABLE `bbs_reply` (
  `id` bigint(20) NOT NULL auto_increment,
  `topicID` bigint(20) NOT NULL default '1',
  `postID` bigint(20) NOT NULL,
  `userID` bigint(20) NOT NULL default '0',
  `content` varchar(300) NOT NULL,
  `createTime` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bbs_topic
-- ----------------------------
CREATE TABLE `bbs_topic` (
  `id` bigint(20) NOT NULL auto_increment,
  `userID` bigint(20) NOT NULL default '0',
  `moduleID` bigint(20) NOT NULL,
  `postCount` bigint(20) NOT NULL default '1',
  `replyCount` bigint(20) NOT NULL default '0',
  `pv` bigint(20) NOT NULL default '0',
  `content` varchar(60) NOT NULL,
  `emotion` tinyint(2) default NULL,
  `createTime` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `isNice` bit(1) NOT NULL default '\0',
  `isUp` bit(1) NOT NULL default '\0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for biz_contact
-- ----------------------------
CREATE TABLE `biz_contact` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT 'id',
  `UNAME` varchar(20) default NULL COMMENT '姓名',
  `SEX` smallint(6) default NULL COMMENT '性别',
  `MOBILE` varchar(20) default NULL COMMENT '手机',
  `PARTID` bigint(20) default NULL COMMENT '部门',
  `POSTID` bigint(20) default NULL COMMENT '职位',
  `QQ` varchar(10) default NULL COMMENT 'QQ',
  `EMAIL` varchar(50) default NULL COMMENT 'Email',
  `FAX` varchar(50) default NULL COMMENT '传真',
  `MSN` varchar(50) default NULL COMMENT 'MSN',
  `WORKTEL` varchar(50) default NULL COMMENT '工作电话',
  `BIRTHDAY` varchar(10) default NULL COMMENT '生日',
  `ISMAIN` bit(1) default '\0' COMMENT '主联系人',
  `AIHAO` varchar(20) default NULL COMMENT '爱好',
  `HOMEADDR` varchar(100) default NULL COMMENT '家庭地址',
  `XUEXING` varchar(2) default NULL COMMENT '血型',
  `XINGZUO` varchar(5) default NULL COMMENT '星座',
  `VID` bigint(20) default NULL COMMENT '厂商id',
  `CID` bigint(20) default NULL COMMENT '客户id',
  `UID` bigint(20) default NULL COMMENT '员工id',
  `CREATER` bigint(20) default NULL COMMENT '创建人',
  `REMARK` varchar(500) default NULL COMMENT '备注',
  `CTIME` datetime default NULL COMMENT '创建时间',
  `ISPER` bit(1) default NULL COMMENT '是否个人通信录联系人',
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='联系人';

-- ----------------------------
-- Table structure for biz_product
-- ----------------------------
CREATE TABLE `biz_product` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT 'id',
  `CNAME` varchar(50) default NULL COMMENT '产品名称',
  `DW` varchar(20) default NULL COMMENT '产品单位',
  `SN` varchar(50) default NULL COMMENT '序列号',
  `PTYPE` bigint(20) default NULL COMMENT '产品类型',
  `XINGHAO` varchar(50) default NULL COMMENT '产品型号',
  `CK` bigint(20) default NULL COMMENT '存放仓库',
  `GKLSJ` float default NULL COMMENT '公开零售价',
  `ZCLSJ` float default NULL COMMENT '正常零售价',
  `PFZDJ` float default NULL COMMENT '批发指导价',
  `ZCPFJ` float default NULL COMMENT '正常批发价',
  `NBZDJ` float default NULL COMMENT '内部指导价',
  `CBJ` float default NULL COMMENT '成本价',
  `CGREN` bigint(20) default NULL COMMENT '采购人id',
  `AQKCL` smallint(6) default NULL COMMENT '安全库存量',
  `XYKCBJ` bit(1) default '\0' COMMENT '需要库存比较',
  `CPJJ` varchar(500) default NULL COMMENT '产品简介',
  `JSCS` varchar(500) default NULL COMMENT '技术参数',
  `ZKGZ` varchar(500) default NULL COMMENT '折扣规则',
  `VID` bigint(20) NOT NULL COMMENT '厂商ID',
  `XLID` bigint(20) NOT NULL COMMENT '系列ID',
  PRIMARY KEY  (`ID`),
  KEY `VID` (`VID`),
  KEY `XLID` (`XLID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='产品';

-- ----------------------------
-- Table structure for biz_ptype
-- ----------------------------
CREATE TABLE `biz_ptype` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT 'id',
  `CNAME` varchar(20) NOT NULL COMMENT '名称',
  `SORTNUM` smallint(6) default '1' COMMENT '排序',
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='产品类型';

-- ----------------------------
-- Table structure for biz_vender
-- ----------------------------
CREATE TABLE `biz_vender` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT 'id',
  `CNAME` varchar(100) NOT NULL COMMENT '厂商名称',
  `JCNAME` varchar(30) default NULL COMMENT '简称',
  `HANGYE` bigint(20) default NULL COMMENT '行业',
  `TYPE` smallint(6) NOT NULL default '0' COMMENT '厂商类型',
  `LAIYUAN` smallint(6) default '0' COMMENT '来源',
  `PROVINCE` bigint(20) default NULL COMMENT '省份',
  `CITY` bigint(20) default NULL COMMENT '地市',
  `TELPHONE` varchar(50) default NULL COMMENT '电话',
  `ZIPCODE` varchar(10) default NULL COMMENT '邮编',
  `FAX` varchar(20) default NULL COMMENT '传真',
  `EMAIL` varchar(100) default NULL COMMENT '接收报备的EMAIL',
  `ADDR` varchar(100) default NULL COMMENT '地址',
  `WEB` varchar(100) default NULL COMMENT '公司网址',
  `BANKACCOUNT` varchar(30) default NULL COMMENT '银行账号',
  `BANK` bigint(20) default NULL COMMENT '开户行',
  `NETSCALE` bigint(20) default NULL COMMENT '网络规模',
  `TAXNUM` varchar(30) default NULL COMMENT '税号',
  `BBLIMIT` smallint(6) default NULL COMMENT '报备期限',
  `SUMMARY` longtext COMMENT '公司简介',
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='厂商厂家';

-- ----------------------------
-- Table structure for biz_xilie
-- ----------------------------
CREATE TABLE `biz_xilie` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT 'id',
  `CNAME` varchar(20) default NULL COMMENT '名称',
  `SORTNUM` smallint(6) default NULL COMMENT '排序',
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系列';

-- ----------------------------
-- Table structure for crm_customer
-- ----------------------------
CREATE TABLE `crm_customer` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT 'id',
  `CNAME` varchar(50) NOT NULL COMMENT '客户名称',
  `JCNAME` varchar(50) NOT NULL COMMENT '别名',
  `CTYPE` bigint(20) NOT NULL COMMENT '客户类型',
  `KHLY` bigint(20) default NULL COMMENT '客户来源',
  `GZDJ` bigint(20) NOT NULL COMMENT '跟踪进度',
  `HANGYE` bigint(20) default NULL COMMENT '所属行业',
  `ZYBIZ` varchar(50) default NULL COMMENT '主营业务',
  `PROVINCE` bigint(20) NOT NULL COMMENT '省份',
  `CITY` bigint(20) NOT NULL COMMENT '城市',
  `ADDR` varchar(100) default NULL COMMENT '公司地址',
  `JTLX` varchar(100) default NULL COMMENT '交通路线',
  `WLGM` bigint(20) NOT NULL COMMENT '网络规模',
  `FWQSL` smallint(6) default NULL COMMENT '服务器数量',
  `WEBSITE` varchar(100) default NULL COMMENT '公司网址',
  `TELPHONE` varchar(30) default NULL COMMENT '总机电话',
  `FAX` varchar(30) default NULL COMMENT '传真',
  `ZIPCODE` varchar(10) default NULL COMMENT '邮编',
  `EMAIL` varchar(100) default NULL COMMENT 'email',
  `KHYH` bigint(20) default NULL COMMENT '开户银行',
  `SXZQ` bigint(20) NOT NULL COMMENT '授信账期',
  `BANKACCOUT` varchar(50) default NULL COMMENT '银行账号',
  `XYPJ` bigint(20) NOT NULL COMMENT '信用评价',
  `TAXSNO` varchar(50) default NULL COMMENT '税号',
  `KHYSSJ` bigint(20) default NULL COMMENT '客户预算时间',
  `KHFWLX` bigint(20) NOT NULL COMMENT '客户服务类型',
  `GSJJ` longtext COMMENT '公司简介',
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='客户';

-- ----------------------------
-- Table structure for crm_custsale
-- ----------------------------
CREATE TABLE `crm_custsale` (
  `UID` bigint(20) NOT NULL COMMENT '销售员id',
  `CTIME` datetime NOT NULL COMMENT '分配时间',
  `CUSTID` bigint(20) NOT NULL COMMENT '客户id',
  KEY `CUSTID` (`CUSTID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='客户分配';

-- ----------------------------
-- Table structure for crm_custtype
-- ----------------------------
CREATE TABLE `crm_custtype` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT 'id',
  `CNAME` varchar(50) NOT NULL COMMENT '名称',
  `DESCRIP` varchar(100) default NULL COMMENT '描述',
  `GJPL` smallint(6) NOT NULL COMMENT '跟进频率',
  `JGQX` smallint(6) NOT NULL COMMENT '警告期限',
  `ZDSL` smallint(6) NOT NULL COMMENT '最多数量',
  `SORTNUM` smallint(6) NOT NULL COMMENT '排序',
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='客户类型';

-- ----------------------------
-- Table structure for crm_xycp
-- ----------------------------
CREATE TABLE `crm_xycp` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT 'id',
  `PRODCUTTYPE` bigint(20) NOT NULL COMMENT '产品类型',
  `PRONAME` varchar(50) NOT NULL COMMENT '产品名称',
  `GMSL` smallint(6) default NULL COMMENT '购买数量',
  `GMSJ` varchar(10) default NULL COMMENT '购买日期',
  `YJGMSJ` varchar(10) default NULL COMMENT '预计购买日期',
  `CUSTID` bigint(20) NOT NULL COMMENT '客户id',
  PRIMARY KEY  (`ID`),
  KEY `CUSTID` (`CUSTID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='客户现有产品';

-- ----------------------------
-- Table structure for fa_taxrate
-- ----------------------------
CREATE TABLE `fa_taxrate` (
  `ID` bigint(20) NOT NULL auto_increment,
  `STARTDATE` varchar(10) NOT NULL COMMENT 'yyyy-MM-dd',
  `RATE` float NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for fa_wagepay
-- ----------------------------
CREATE TABLE `fa_wagepay` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT 'id',
  `EMPID` bigint(20) default NULL COMMENT '员工id',
  `EMPSNO` varchar(20) NOT NULL COMMENT '员工编号',
  `EMPNAME` varchar(20) NOT NULL COMMENT '员工姓名',
  `JBGZ` float NOT NULL COMMENT '基本工资',
  `GZTS` float NOT NULL COMMENT '工作天数',
  `GWGZ` float NOT NULL COMMENT '岗位工资',
  `CANTIE` float NOT NULL COMMENT '餐贴',
  `JTBT` float NOT NULL COMMENT '交通补贴',
  `TXBT` float NOT NULL COMMENT '通讯补贴',
  `QUANQIN` varchar(2) NOT NULL COMMENT '全勤',
  `QJIA` float NOT NULL COMMENT '请假',
  `SHEBAO` float NOT NULL COMMENT '社保',
  `GJJ` float NOT NULL COMMENT '住房公积金',
  `YFGZ` float NOT NULL COMMENT '应发工资',
  `YGJJ` float NOT NULL COMMENT '员工基金',
  `QT` float NOT NULL COMMENT '其他',
  `KCHJ` float NOT NULL COMMENT '扣除合计',
  `SFGZ` float NOT NULL COMMENT '实发工资',
  `YM` varchar(7) NOT NULL COMMENT '月份',
  `CTIME` datetime NOT NULL COMMENT '上传时间',
  `PARTMENTID` bigint(20) default NULL COMMENT '部门id',
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `idx_empid_ym_uniq` (`EMPID`,`YM`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='工资发放';

-- ----------------------------
-- Table structure for hr_employee
-- ----------------------------
CREATE TABLE `hr_employee` (
  `id` bigint(20) NOT NULL auto_increment,
  `fullname` varchar(50) NOT NULL,
  `gender` varchar(2) NOT NULL default '1',
  `userno` varchar(20) NOT NULL,
  `pwd` varchar(50) default NULL,
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
  `stat` smallint(1) default '1',
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
) ENGINE=MyISAM AUTO_INCREMENT=100004 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_article
-- ----------------------------
CREATE TABLE `oa_article` (
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
) ENGINE=MyISAM AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_articlecate
-- ----------------------------
CREATE TABLE `oa_articlecate` (
  `ID` bigint(20) NOT NULL auto_increment,
  `CNAME` varchar(50) default NULL,
  `NUM` varchar(20) default NULL,
  `REMARK` varchar(100) default NULL,
  `PID` bigint(20) NOT NULL,
  `SORTNUM` int(11) default '0',
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_articlerange
-- ----------------------------
CREATE TABLE `oa_articlerange` (
  `artID` bigint(20) NOT NULL,
  `OBJID` bigint(20) default NULL,
  `OBJTYPE` smallint(6) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_articleread
-- ----------------------------
CREATE TABLE `oa_articleread` (
  `ARTID` bigint(20) NOT NULL,
  `EMPID` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_beiwanglu
-- ----------------------------
CREATE TABLE `oa_beiwanglu` (
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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_bwlpinglun
-- ----------------------------
CREATE TABLE `oa_bwlpinglun` (
  `ID` bigint(20) NOT NULL auto_increment,
  `BWLID` bigint(20) NOT NULL,
  `UID` bigint(20) default NULL,
  `PLTIME` datetime default NULL,
  `CONTEXT` longtext,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_bwlshare
-- ----------------------------
CREATE TABLE `oa_bwlshare` (
  `ID` bigint(20) NOT NULL auto_increment,
  `BWLID` bigint(20) NOT NULL,
  `UID` bigint(20) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_calendar
-- ----------------------------
CREATE TABLE `oa_calendar` (
  `Id` bigint(11) NOT NULL auto_increment COMMENT '日程主键',
  `title` varchar(200) default NULL COMMENT '日程标题',
  `addr` varchar(200) default NULL COMMENT '地点',
  `description` varchar(500) default NULL COMMENT '说明',
  `cType` tinyint(4) default '1' COMMENT '日程类型\r\n            1	个人日程\r\n            2	部门日程',
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
-- Table structure for oa_doccate
-- ----------------------------
CREATE TABLE `oa_doccate` (
  `ID` bigint(20) NOT NULL auto_increment,
  `CNAME` varchar(50) default NULL,
  `NUM` varchar(20) default NULL,
  `REMARK` varchar(100) default NULL,
  `PID` bigint(20) NOT NULL,
  `SORTNUM` int(11) default '0',
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_docrange
-- ----------------------------
CREATE TABLE `oa_docrange` (
  `artID` bigint(20) NOT NULL,
  `OBJID` bigint(20) default NULL,
  `OBJTYPE` smallint(6) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_document
-- ----------------------------
CREATE TABLE `oa_document` (
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
-- Table structure for oa_emailbox
-- ----------------------------
CREATE TABLE `oa_emailbox` (
  `ID` bigint(20) NOT NULL auto_increment,
  `TITLE` varchar(100) NOT NULL,
  `CONTENT` longtext NOT NULL,
  `UID` bigint(20) NOT NULL,
  `SETID` bigint(20) NOT NULL,
  `MAILFROM` varchar(50) default NULL COMMENT '{''m'':''loyin@loyin.net'',''n'':''龙影''}',
  `MAILTO` varchar(1000) default NULL COMMENT '[{''m'':''loyin@loyin.net'',''n'':''龙影''}]',
  `BCC` varchar(500) default NULL COMMENT '[{''m'':''loyin@loyin.net'',''n'':''龙影''}]',
  `CC` varchar(100) default NULL COMMENT '[{''m'':''loyin@loyin.net'',''n'':''龙影''}]',
  `ISNEW` smallint(6) default '1',
  `MAILDATE` datetime default NULL,
  `BOX` smallint(1) NOT NULL default '0' COMMENT '0:收件箱\r\n1:发件箱\r\n2:草稿箱\r\n3:已删除',
  `ATTACHMENT` longtext COMMENT '[{''f'':''附件实际名称及目录'',''n'':''附件显示名称''}]',
  `HASATTACH` smallint(6) default NULL,
  `REPLYSIGN` smallint(6) default NULL,
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `idx_maillist_uniq` (`TITLE`,`UID`,`MAILFROM`,`MAILDATE`,`BOX`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_emailset
-- ----------------------------
CREATE TABLE `oa_emailset` (
  `ID` bigint(20) NOT NULL auto_increment,
  `CNAME` varchar(30) NOT NULL,
  `EMAIL` varchar(100) NOT NULL,
  `UID` bigint(20) default NULL,
  `POP3ADDR` varchar(50) default NULL,
  `POP3PORT` int(11) default '110',
  `SMTPADDR` varchar(50) default NULL,
  `SMTPPORT` int(11) default '25',
  `PWD` varchar(50) default NULL,
  `SIGN` varchar(500) default NULL,
  `STATUS` smallint(1) default '1' COMMENT '1：可用\r\n0：停用',
  `USESIGN` smallint(1) default '0' COMMENT '0:不使用\r\n1:使用',
  `companyemail` smallint(1) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `EMAIL` (`EMAIL`),
  UNIQUE KEY `UID` (`UID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_filebox
-- ----------------------------
CREATE TABLE `oa_filebox` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT 'id',
  `FILENAME` varchar(50) NOT NULL COMMENT '文件名称',
  `FILEPATH` varchar(50) NOT NULL COMMENT '文件保存名称',
  `UID` bigint(20) NOT NULL COMMENT '用户名称',
  `DIRID` bigint(20) default NULL COMMENT '目录id',
  `CTIME` datetime NOT NULL COMMENT '上传时间',
  `ftype` varchar(10) default NULL,
  `size` float default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=135 DEFAULT CHARSET=utf8 COMMENT='文件站';

-- ----------------------------
-- Table structure for oa_gglan
-- ----------------------------
CREATE TABLE `oa_gglan` (
  `ID` bigint(20) NOT NULL auto_increment,
  `NAME` varchar(20) NOT NULL,
  `DESCP` varchar(200) default NULL,
  `ENABLE` smallint(6) NOT NULL default '1' COMMENT '0:不可用 1可用',
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_ggreadlist
-- ----------------------------
CREATE TABLE `oa_ggreadlist` (
  `UID` bigint(20) default NULL,
  `RDATE` datetime default NULL,
  `GGID` bigint(20) NOT NULL,
  UNIQUE KEY `idx_ggread_uniq` (`UID`,`GGID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_gonggao
-- ----------------------------
CREATE TABLE `oa_gonggao` (
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
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_holiday
-- ----------------------------
CREATE TABLE `oa_holiday` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT 'id',
  `TITLE` varchar(200) default NULL COMMENT '标题',
  `STARTDATE` varchar(10) NOT NULL COMMENT '开始时间',
  `ENDDATE` varchar(10) NOT NULL COMMENT '结束时间',
  `STARTDATETIAO` varchar(10) default NULL COMMENT '调整时间',
  `ENDDATETIAO` varchar(10) default NULL COMMENT '调整结束时间',
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='假期时间表';

-- ----------------------------
-- Table structure for oa_kaoqing
-- ----------------------------
CREATE TABLE `oa_kaoqing` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT 'id',
  `UID` bigint(20) NOT NULL COMMENT '用户id',
  `QDTIME` varchar(8) NOT NULL COMMENT '签到时间',
  `QTTIME` varchar(8) default NULL COMMENT '签退时间',
  `KQRQ` varchar(10) NOT NULL COMMENT '考勤日期',
  `MONTH` smallint(6) NOT NULL COMMENT '月份',
  `DAY` smallint(6) NOT NULL COMMENT '日',
  `YEAR` smallint(6) NOT NULL COMMENT '年',
  `QDIP` varchar(20) NOT NULL COMMENT '签到ip',
  `QTIP` varchar(20) default NULL COMMENT '签退IP',
  `LEGAL` smallint(6) default NULL COMMENT '是否有效',
  `QDTIME1` varchar(8) default NULL COMMENT '补签到时间',
  `QTTIME1` varchar(8) default NULL COMMENT '补签退时间',
  `REMARK` varchar(100) default NULL COMMENT '补签说明',
  `BQUID` bigint(20) default NULL COMMENT '补签人',
  `BEIZHU` varchar(50) default NULL COMMENT '签到备注',
  `KQSETID` bigint(20) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='考勤';

-- ----------------------------
-- Table structure for oa_kqset
-- ----------------------------
CREATE TABLE `oa_kqset` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT 'id',
  `Z1` smallint(6) default '1' COMMENT '周一',
  `Z2` smallint(6) default '1' COMMENT '周二',
  `Z3` smallint(6) default '1' COMMENT '周三',
  `Z4` smallint(6) default '1' COMMENT '周四',
  `Z5` smallint(6) default '1' COMMENT '周五',
  `Z6` smallint(6) default '0' COMMENT '周六',
  `Z7` smallint(6) default '0' COMMENT '周日',
  `STARTTIME` varchar(5) default NULL COMMENT '上班时间',
  `ENDTIME` varchar(5) default NULL COMMENT '下班时间',
  `EXCTDATE` date default NULL COMMENT '执行日期',
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='考勤设置';

-- ----------------------------
-- Table structure for oa_meeting
-- ----------------------------
CREATE TABLE `oa_meeting` (
  `ID` bigint(20) NOT NULL auto_increment,
  `TITLE` varchar(100) NOT NULL,
  `FBTIME` varchar(20) default NULL,
  `CREATER` bigint(20) default NULL,
  `CTIME` varchar(20) default NULL,
  `CONTENT` longtext,
  `STARTTIME` varchar(20) default NULL,
  `ENDTIME` varchar(20) default NULL COMMENT 'yyyy-MM-dd HH:mm:ss\r\n',
  `STAT` smallint(1) default '0' COMMENT '0：筹划中\r\n1：进行中\r\n2：归档',
  `GUIDANGREN` bigint(20) default NULL,
  `GDTIME` varchar(20) default NULL,
  `GUIDANG` longtext,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_meetingjoin
-- ----------------------------
CREATE TABLE `oa_meetingjoin` (
  `ID` bigint(20) NOT NULL auto_increment,
  `UID` bigint(20) default NULL,
  `MID` bigint(20) NOT NULL,
  `STAT` smallint(1) default '0' COMMENT '0:已分配\r\n1:已参与\r\n2:未参与\r\n3:中途离开',
  PRIMARY KEY  (`ID`),
  KEY `MID` (`MID`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_msg
-- ----------------------------
CREATE TABLE `oa_msg` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT 'id',
  `TITLE` varchar(100) NOT NULL COMMENT '标题',
  `SENDER` bigint(20) default NULL COMMENT '发件人',
  `CTIME` datetime default NULL COMMENT '创建时间',
  `CONTENT` longtext COMMENT '内容',
  `STAT` smallint(1) default '1' COMMENT '状态',
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='站内消息';

-- ----------------------------
-- Table structure for oa_recvmsg
-- ----------------------------
CREATE TABLE `oa_recvmsg` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT 'id',
  `TITLE` varchar(100) NOT NULL COMMENT '标题',
  `SENDER` bigint(20) default NULL COMMENT '发件人',
  `CTIME` datetime default NULL COMMENT '创建时间',
  `CONTENT` longtext COMMENT '内容',
  `STAT` smallint(1) default '1' COMMENT '状态',
  `UID` bigint(20) NOT NULL COMMENT '接收人',
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='接收消息';

-- ----------------------------
-- Table structure for oa_weibo
-- ----------------------------
CREATE TABLE `oa_weibo` (
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
-- Table structure for oa_weibopl
-- ----------------------------
CREATE TABLE `oa_weibopl` (
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
-- Table structure for oa_workreportmb
-- ----------------------------
CREATE TABLE `oa_workreportmb` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT 'id',
  `PARTMENTID` bigint(20) NOT NULL COMMENT '部门id',
  `TYPE` smallint(6) NOT NULL default '0' COMMENT '类型',
  `CTIME` datetime default NULL COMMENT '创建时间',
  `CONTENT` longtext COMMENT '内容',
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='工作日报模版';

-- ----------------------------
-- Table structure for sale_baobei
-- ----------------------------
CREATE TABLE `sale_baobei` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT 'id',
  `CUSTID` bigint(20) NOT NULL COMMENT '客户id',
  `VENDERID` bigint(20) NOT NULL COMMENT '厂商id',
  `PRODCUTID` bigint(20) NOT NULL COMMENT '产品id',
  `BBGQSJ` smallint(6) default NULL COMMENT '报备过期时间',
  `GUOQITIXING` varchar(50) default NULL COMMENT '过期提醒',
  `ZHUYISHIXIANG` varchar(500) default NULL COMMENT '注意事项',
  `BAOBEIBILL` longtext COMMENT '报备单',
  `CTIME` datetime NOT NULL COMMENT '报备时间',
  `UID` bigint(20) NOT NULL COMMENT '报备人',
  `MBID` bigint(20) NOT NULL COMMENT '模版id',
  PRIMARY KEY  (`ID`),
  KEY `MBID` (`MBID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='报备';

-- ----------------------------
-- Table structure for sale_baobeimoban
-- ----------------------------
CREATE TABLE `sale_baobeimoban` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT 'id',
  `CNAME` varchar(50) NOT NULL COMMENT '模版名称',
  `MBTYPE` smallint(6) default NULL COMMENT '模版类型',
  `FILEPATH` varchar(100) default NULL COMMENT 'excel文件',
  `CTIME` datetime default NULL COMMENT '创建时间',
  `CONTENT` longtext COMMENT '内容',
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='报备模版';

-- ----------------------------
-- Table structure for sale_genjin
-- ----------------------------
CREATE TABLE `sale_genjin` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT 'id',
  `CUSTID` bigint(20) NOT NULL COMMENT '客户id',
  `CONTACTID` bigint(20) NOT NULL COMMENT '联系人id',
  `PHONE` varchar(50) default NULL COMMENT '联系人电话',
  `LIANXIFANGSHI` bigint(20) NOT NULL COMMENT '联系方式',
  `LXDATE` date NOT NULL COMMENT '联系日期',
  `TJPRODUCT` varchar(50) default NULL COMMENT '推荐产品',
  `FANGAN` varchar(50) default NULL COMMENT '方案',
  `NEEDTECH` smallint(6) default NULL COMMENT '需要技术支持',
  `LXRECORD` varchar(500) default NULL COMMENT '联系记录',
  `NEXTLX` smallint(6) default NULL COMMENT '下次联系',
  `UID` bigint(20) default NULL COMMENT '跟进销售员id',
  `CTIME` datetime default NULL COMMENT '创建时间',
  `JSCLJL` varchar(50) default NULL COMMENT '技术处理记录',
  `JSID` bigint(20) default NULL COMMENT '技术员',
  `JSCLSJ` datetime default NULL COMMENT '技术处理时间',
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='客户跟进';

-- ----------------------------
-- Table structure for sale_genjinfankui
-- ----------------------------
CREATE TABLE `sale_genjinfankui` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT 'id',
  `GJID` bigint(20) NOT NULL COMMENT '跟进id',
  `LXJL` varchar(100) default NULL COMMENT '联系记录',
  `FANKUI` varchar(100) default NULL COMMENT '反馈',
  PRIMARY KEY  (`ID`),
  KEY `GJID` (`GJID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='跟进反馈';

-- ----------------------------
-- Table structure for sale_richeng
-- ----------------------------
CREATE TABLE `sale_richeng` (
  `ID` bigint(20) NOT NULL auto_increment COMMENT 'id',
  `CUSTID` bigint(20) NOT NULL COMMENT '客户id',
  `CONTACTID` bigint(20) NOT NULL COMMENT '联系人id',
  `UID` bigint(20) default NULL COMMENT '员工id',
  `SUBJECT` varchar(50) NOT NULL COMMENT '主题',
  `RCLX` bigint(20) NOT NULL COMMENT '日程类型',
  `STARTDATE` varchar(10) default NULL COMMENT '具体开始日期',
  `ENDTIME` datetime NOT NULL COMMENT '结束时间',
  `STAT` smallint(6) NOT NULL default '0' COMMENT '审核状态',
  `JINZHAN` varchar(50) default NULL COMMENT '进展',
  `TYPE` smallint(6) NOT NULL default '0' COMMENT '审核状态',
  `SHENHREN` bigint(20) default NULL COMMENT '审核人',
  `SHTIME` datetime default NULL COMMENT '审核时间',
  `CONTENT` varchar(500) default NULL COMMENT '内容',
  `FEIYONG` float default NULL COMMENT '费用',
  `SHENHYJ` varchar(500) default NULL COMMENT '审核意见',
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='日程';

-- ----------------------------
-- Table structure for sys_area
-- ----------------------------
CREATE TABLE `sys_area` (
  `ID` bigint(20) NOT NULL auto_increment,
  `CName` varchar(100) default NULL,
  `PID` bigint(11) default NULL,
  `FullID` varchar(40) default NULL,
  `Grade` int(11) default NULL,
  `SORTNUM` int(11) default NULL,
  `code` varchar(12) default NULL,
  `cityId` varchar(12) default NULL,
  `provinceId` varchar(12) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=3520 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_form
-- ----------------------------
CREATE TABLE `sys_form` (
  `ID` bigint(20) NOT NULL auto_increment,
  `TNAME` varchar(30) NOT NULL COMMENT '数据库表名',
  `ZHUS` varchar(30) default NULL,
  `TBTYPE` smallint(6) NOT NULL default '1' COMMENT '1:主表 2:从表',
  `package` varchar(50) default NULL,
  `listAdd` smallint(6) default '0',
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `ID` (`ID`),
  UNIQUE KEY `TNAME` (`TNAME`)
) ENGINE=MyISAM AUTO_INCREMENT=259 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_formfield
-- ----------------------------
CREATE TABLE `sys_formfield` (
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
) ENGINE=MyISAM AUTO_INCREMENT=567 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_kuaidi
-- ----------------------------
CREATE TABLE `sys_kuaidi` (
  `ID` bigint(20) NOT NULL auto_increment,
  `CNAME` varchar(50) NOT NULL,
  `HOTLINE` varchar(30) NOT NULL,
  `NETTEL` varchar(30) NOT NULL,
  `KDYNAME` varchar(10) NOT NULL,
  `KDYTEL` varchar(30) NOT NULL,
  `SORTNUM` smallint(6) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_loginlog
-- ----------------------------
CREATE TABLE `sys_loginlog` (
  `id` bigint(20) NOT NULL auto_increment,
  `uid` bigint(20) NOT NULL,
  `loginTime` datetime NOT NULL,
  `ip` varchar(50) NOT NULL,
  `logoutTime` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
CREATE TABLE `sys_menu` (
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
) ENGINE=MyISAM AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_operalog
-- ----------------------------
CREATE TABLE `sys_operalog` (
  `ID` bigint(20) NOT NULL auto_increment,
  `UID` bigint(20) NOT NULL,
  `CTIME` varchar(20) NOT NULL,
  `MODELNAME` varchar(50) default NULL,
  `EXCT` varchar(10) default NULL,
  `FUNC` varchar(20) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_parame
-- ----------------------------
CREATE TABLE `sys_parame` (
  `id` bigint(20) NOT NULL auto_increment,
  `cname` varchar(20) NOT NULL,
  `val` varchar(20) NOT NULL,
  `type` varchar(200) default NULL,
  `sortnum` smallint(6) default '0',
  `remark` varchar(255) default NULL,
  `pid` bigint(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_partment
-- ----------------------------
CREATE TABLE `sys_partment` (
  `id` bigint(20) NOT NULL auto_increment,
  `cname` varchar(50) default NULL,
  `remark` varchar(250) default NULL,
  `pid` bigint(10) default '0' COMMENT '父级部门id',
  `num` varchar(20) default NULL,
  `fzr` bigint(20) default NULL COMMENT '负责人',
  `fax` varchar(50) default NULL,
  `tel` varchar(50) default NULL,
  `addr` varchar(100) default NULL,
  `email` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
CREATE TABLE `sys_post` (
  `id` bigint(20) NOT NULL auto_increment,
  `cname` varchar(20) NOT NULL,
  `remark` varchar(255) default NULL,
  `sortnum` smallint(6) default '1',
  `pid` bigint(20) NOT NULL COMMENT '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_powermenu
-- ----------------------------
CREATE TABLE `sys_powermenu` (
  `menuid` bigint(20) NOT NULL,
  `objid` bigint(20) NOT NULL,
  `type` smallint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL auto_increment,
  `cname` varchar(20) NOT NULL,
  `remark` varchar(255) default NULL,
  `sortnum` smallint(6) default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_userrole
-- ----------------------------
CREATE TABLE `sys_userrole` (
  `userid` bigint(20) NOT NULL,
  `roleid` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `act_ge_property` VALUES ('schema.version', '5.12', '1');
INSERT INTO `act_ge_property` VALUES ('schema.history', 'create(5.12)', '1');
INSERT INTO `act_ge_property` VALUES ('next.dbid', '1', '1');
INSERT INTO `biz_contact` VALUES ('1', 'fdsafdsa', '0', null, null, null, null, '12', null, null, null, '2013-08-14', '', null, '范德萨分', '0', null, null, null, null, '100000', '范德萨分', '2013-08-14 23:37:07', null);
INSERT INTO `biz_contact` VALUES ('2', 'fdsaf', '1', null, null, null, null, null, null, null, null, '2013-08-14', '', null, null, '4', null, null, null, null, '100000', 'fdsaf', '2013-08-14 23:39:49', null);
INSERT INTO `biz_product` VALUES ('2', 'fdsa', '1', '2323', '2', '32safsa', '2', '233', '233', '234', '23', '23432', '2343', '23432', '23', '', '23', 'ffdsa', 'sdafdsa', '2', '23');
INSERT INTO `biz_ptype` VALUES ('1', '类型1', '1');
INSERT INTO `biz_ptype` VALUES ('2', '类型2', '1');
INSERT INTO `fa_taxrate` VALUES ('2', '2013-08-09', '12.7');
INSERT INTO `fa_taxrate` VALUES ('3', '2013-08-30', '12.5');
INSERT INTO `fa_taxrate` VALUES ('4', '2013-10-25', '12.222');
INSERT INTO `hr_employee` VALUES ('100000', '龙影', '1', 'loyin', 'e10adc3949ba59abbe56e057f20f883e', '2013-04-01', '13333333333', 'fdsafdgag', 'lsf', '2000-01-01', '1', '362422111112302332', '1', '9', '10000', '/upload/Usij7hQ.jpg', '8', '1', '1', 'fdsagfdsgfdg\r\nfda\r\nfdsa<input type=\'hidden\' name=\'token\' value=\'-3753824874469148842\' />', '<p>\r\n	范德萨飞洒<img src=\"/upload/image/1375874498387.jpg\" alt=\"\" /> \r\n</p>', '20', '127.0.0.1', '2013-10-21 21:56:25', null);
INSERT INTO `hr_employee` VALUES ('100001', '销售人员', '1', '001', 'e10adc3949ba59abbe56e057f20f883e', '2013-08-13', null, null, 'fdsfa', '2013-08-13', '1', '362422111112302332', '1', '7', null, null, '9', null, '1', null, null, '11', null, null, null);
INSERT INTO `hr_employee` VALUES ('100002', '果果', '1', '0233', 'e10adc3949ba59abbe56e057f20f883e', '2013-08-13', null, null, 'fdsa', '2013-08-13', '1', '362422111112302332', '1', '7', null, '/upload/Us1BBGh.jpg', '10', null, '1', null, null, '7', null, null, null);
INSERT INTO `hr_employee` VALUES ('100003', 'fasfdsaf', '1', '3456', 'e10adc3949ba59abbe56e057f20f883e', '2013-08-15', null, null, 'fdsafs', '2013-08-14', '1', '362422111112302332', '1', '7', null, null, '11', null, '1', null, null, '4', null, null, null);
INSERT INTO `oa_article` VALUES ('1', 'rewqr4322', null, 'rewqrewqr<img src=\"/upload/201211251602000.jpg\" width=\"400\" alt=\"\" />', '2013-04-04 12:23:41', null, '100000', null, null, '3', null, null, null);
INSERT INTO `oa_article` VALUES ('2', '萨芬', null, '范德萨分<br />\r\n<img alt=\"偷笑\" src=\"xheditor/xheditor_emot/default/titter.gif\" /><img alt=\"骂人\" src=\"xheditor/xheditor_emot/default/curse.gif\" /><br />\r\n<img src=\"/jfoa/upload/201212091536011.jpg\" width=\"300\" alt=\"\" /><br />', '2013-04-04 12:23:41', null, '100000', null, null, '6', null, '1', '2013-04-08 09:49:20');
INSERT INTO `oa_article` VALUES ('68', 'fdsafdsa', null, 'fdsfdsfa', '2013-04-08 09:49:53', null, '100000', null, null, '6', null, '1', '2013-05-05 19:01:57');
INSERT INTO `oa_article` VALUES ('4', 'sdfasdf', null, '<p>\r\n	fdsafdsaffdsafsaf\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	fdsafdsa\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	fdsa\r\n</p>', '2013-04-04 12:23:41', null, '100000', null, null, '7', null, '1', '2013-05-05 15:02:08');
INSERT INTO `oa_article` VALUES ('5', '地方撒法但是', null, '<p>\r\n	范德萨分\r\n</p>\r\n<p>\r\n	fdsafds\r\n</p>\r\n<p>\r\n	fdsafds<img src=\"/easyUIJFinal/upload/image/1365386193178.png\" width=\"357\" height=\"539\" align=\"left\" alt=\"\" /> \r\n</p>', null, null, '100000', null, null, '7', null, '1', '2013-04-08 09:56:58');
INSERT INTO `oa_article` VALUES ('7', '范德萨', null, '范德萨范德萨', null, null, '100000', null, null, '5', null, '1', '2013-04-06 00:00:00');
INSERT INTO `oa_article` VALUES ('8', '范德萨', null, '<p>\r\n	范德萨分\r\n</p>\r\n<p>\r\n	fdsa\r\n</p>\r\n<p>\r\n	fdsafsda\r\n</p>', '2013-04-06 19:57:14', null, '100000', null, null, '7', null, '1', '2013-05-05 18:57:09');
INSERT INTO `oa_article` VALUES ('9', '发达省份dd', null, '范德萨sdfd', '2013-04-06 21:30:52', null, '100000', null, null, '6', null, null, null);
INSERT INTO `oa_article` VALUES ('10', '发达省份dd', null, '范德萨sdfd', '2013-04-06 21:30:56', null, '100000', null, null, '6', null, null, null);
INSERT INTO `oa_article` VALUES ('70', 'fdsa', null, '<p>\r\n	fdsafdsaf\r\n</p>\r\n<p>\r\n	fdsaf\r\n</p>\r\n<p>\r\n	sadf\r\n</p>\r\n<p>\r\n	fdsa\r\n</p>\r\n<p>\r\n	sdf\r\n</p>', '2013-04-08 11:43:08', null, '100000', null, null, '5', null, '1', '2013-05-05 18:57:17');
INSERT INTO `oa_article` VALUES ('69', 'fdsa', null, '<p>\r\n	fdsafdsaf\r\n</p>\r\n<p>\r\n	fdsaf\r\n</p>\r\n<p>\r\n	sadf\r\n</p>\r\n<p>\r\n	fdsa\r\n</p>\r\n<p>\r\n	sdf\r\n</p>', '2013-04-08 11:43:05', null, '100000', null, null, '5', null, null, null);
INSERT INTO `oa_article` VALUES ('14', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:42', null, '100000', null, null, '7', null, '1', '2013-05-05 19:00:04');
INSERT INTO `oa_article` VALUES ('15', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:42', null, '100000', null, null, '6', null, null, null);
INSERT INTO `oa_article` VALUES ('16', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:42', null, '100000', null, null, '6', null, null, null);
INSERT INTO `oa_article` VALUES ('17', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:42', null, '100000', null, null, '6', null, null, null);
INSERT INTO `oa_article` VALUES ('18', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:42', null, '100000', null, null, '6', null, null, null);
INSERT INTO `oa_article` VALUES ('19', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:44', null, '100000', null, null, '6', null, null, null);
INSERT INTO `oa_article` VALUES ('20', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:44', null, '100000', null, null, '6', null, null, null);
INSERT INTO `oa_article` VALUES ('21', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:46', null, '100000', null, null, '6', null, null, null);
INSERT INTO `oa_article` VALUES ('22', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:46', null, '100000', null, null, '6', null, null, null);
INSERT INTO `oa_article` VALUES ('23', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:47', null, '100000', null, null, '6', null, null, null);
INSERT INTO `oa_article` VALUES ('24', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:48', null, '100000', null, null, '6', null, null, null);
INSERT INTO `oa_article` VALUES ('25', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:48', null, '100000', null, null, '6', null, null, null);
INSERT INTO `oa_article` VALUES ('26', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:48', null, '100000', null, null, '6', null, null, null);
INSERT INTO `oa_article` VALUES ('27', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:49', null, '100000', null, null, '6', null, null, null);
INSERT INTO `oa_article` VALUES ('28', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:49', null, '100000', null, null, '6', null, null, null);
INSERT INTO `oa_article` VALUES ('29', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:49', null, '100000', null, null, '6', null, null, null);
INSERT INTO `oa_article` VALUES ('30', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:49', null, '100000', null, null, '6', null, null, null);
INSERT INTO `oa_article` VALUES ('31', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:49', null, '100000', null, null, '6', null, null, null);
INSERT INTO `oa_article` VALUES ('32', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:49', null, '100000', null, null, '6', null, null, null);
INSERT INTO `oa_article` VALUES ('33', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:51', null, '100000', null, null, '6', null, null, null);
INSERT INTO `oa_article` VALUES ('34', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:52', null, '100000', null, null, '6', null, null, null);
INSERT INTO `oa_article` VALUES ('35', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:52', null, '100000', null, null, '6', null, null, null);
INSERT INTO `oa_article` VALUES ('36', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:52', null, '100000', null, null, '6', null, null, null);
INSERT INTO `oa_article` VALUES ('37', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:53', null, '100000', null, null, '6', null, null, null);
INSERT INTO `oa_article` VALUES ('38', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:53', null, '100000', null, null, '6', null, null, null);
INSERT INTO `oa_article` VALUES ('39', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:54', null, '100000', null, null, '6', null, null, null);
INSERT INTO `oa_article` VALUES ('40', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:54', null, '100000', null, null, '6', null, null, null);
INSERT INTO `oa_article` VALUES ('41', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:55', null, '100000', null, null, '6', null, null, null);
INSERT INTO `oa_article` VALUES ('42', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:56', null, '100000', null, null, '6', null, null, null);
INSERT INTO `oa_article` VALUES ('43', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:57', null, '100000', null, null, '6', null, null, null);
INSERT INTO `oa_article` VALUES ('44', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:59', null, '100000', null, null, '6', null, null, null);
INSERT INTO `oa_article` VALUES ('45', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:59', null, '100000', null, null, '6', null, null, null);
INSERT INTO `oa_article` VALUES ('46', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:59', null, '100000', null, null, '6', null, null, null);
INSERT INTO `oa_article` VALUES ('47', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:59', null, '100000', null, null, '6', null, null, null);
INSERT INTO `oa_article` VALUES ('48', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:59', null, '100000', null, null, '6', null, null, null);
INSERT INTO `oa_article` VALUES ('49', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:51:59', null, '100000', null, null, '6', null, null, null);
INSERT INTO `oa_article` VALUES ('50', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:52:00', null, '100000', null, null, '6', null, null, null);
INSERT INTO `oa_article` VALUES ('51', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:52:00', null, '100000', null, null, '6', null, null, null);
INSERT INTO `oa_article` VALUES ('52', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:52:00', null, '100000', null, null, '6', null, null, null);
INSERT INTO `oa_article` VALUES ('53', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:52:03', null, '100000', null, null, '6', null, null, null);
INSERT INTO `oa_article` VALUES ('54', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:52:03', null, '100000', null, null, '6', null, null, null);
INSERT INTO `oa_article` VALUES ('55', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:52:03', null, '100000', null, null, '6', null, null, null);
INSERT INTO `oa_article` VALUES ('56', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:52:03', null, '100000', null, null, '6', null, null, null);
INSERT INTO `oa_article` VALUES ('57', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:52:05', null, '100000', null, null, '6', null, null, null);
INSERT INTO `oa_article` VALUES ('58', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:52:05', null, '100000', null, null, '6', null, null, null);
INSERT INTO `oa_article` VALUES ('59', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:52:05', null, '100000', null, null, '6', null, null, null);
INSERT INTO `oa_article` VALUES ('60', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:52:07', null, '100000', null, null, '6', null, null, null);
INSERT INTO `oa_article` VALUES ('61', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:52:07', null, '100000', null, null, '6', null, null, null);
INSERT INTO `oa_article` VALUES ('62', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:52:07', null, '100000', null, null, '6', null, null, null);
INSERT INTO `oa_article` VALUES ('63', 'dsdfa', null, 'fdsafdsaf', '2013-04-06 21:52:08', null, '100000', null, null, '6', null, null, null);
INSERT INTO `oa_article` VALUES ('71', 'fdsafdsa', null, 'fdsafdsafdsaf', '2013-08-11 19:03:29', null, '100000', null, null, '6', null, '1', '2013-08-11 19:03:31');
INSERT INTO `oa_article` VALUES ('72', 'sdfdsfa', null, 'fdsafdsafdsf', '2013-08-11 19:03:48', null, '100000', null, null, '6', null, null, null);
INSERT INTO `oa_article` VALUES ('73', 'fdsafdsa', null, 'fdsafdsafdsa', '2013-08-11 19:04:12', null, '100000', null, null, '5', null, null, null);
INSERT INTO `oa_articlecate` VALUES ('6', '网络编程', null, null, '5', '0');
INSERT INTO `oa_articlecate` VALUES ('5', '技术类', null, null, '0', '0');
INSERT INTO `oa_articlecate` VALUES ('7', 'web网页', null, null, '6', '1');
INSERT INTO `oa_beiwanglu` VALUES ('4', '范德萨范德萨', '范德萨范德萨发', '2013-08-13 20:56:31', '100000', '0', '2013-08-13 20:51:32', '1', '1', '1', '1', null);
INSERT INTO `oa_beiwanglu` VALUES ('3', '范德萨范德萨发', '范德萨范德萨发萨芬', '2013-08-09 00:47:22', '100000', '0', '2013-08-09 00:47:13', '1', '1', '1', '1', null);
INSERT INTO `oa_bwlpinglun` VALUES ('1', '3', '1', '2013-08-09 10:03:25', '范德萨范德萨');
INSERT INTO `oa_bwlpinglun` VALUES ('2', '3', '1', '2013-08-09 10:03:27', '范德萨范德萨范德萨范德萨发');
INSERT INTO `oa_bwlpinglun` VALUES ('3', '3', '1', '2013-08-09 10:03:29', '范德萨范德萨范德萨范德萨发范德萨范德萨');
INSERT INTO `oa_bwlpinglun` VALUES ('4', '3', '1', '2013-08-09 10:04:17', '范德萨范德萨');
INSERT INTO `oa_bwlpinglun` VALUES ('5', '3', '1', '2013-08-09 10:04:19', '范德萨范德萨发第三方');
INSERT INTO `oa_bwlpinglun` VALUES ('6', '3', '1', '2013-08-09 10:04:21', '范德萨分');
INSERT INTO `oa_bwlpinglun` VALUES ('7', '3', '1', '2013-08-09 10:04:53', '范德萨分');
INSERT INTO `oa_bwlpinglun` VALUES ('8', '3', '1', '2013-08-09 10:04:55', '广泛大锅饭的歌');
INSERT INTO `oa_bwlpinglun` VALUES ('9', '3', '1', '2013-08-09 10:04:56', '广泛大锅饭的时光');
INSERT INTO `oa_bwlpinglun` VALUES ('10', '3', '1', '2013-08-09 10:04:59', '广泛大锅饭的时光');
INSERT INTO `oa_bwlpinglun` VALUES ('11', '3', '1', '2013-08-09 13:44:50', '大肆发放');
INSERT INTO `oa_bwlpinglun` VALUES ('12', '3', '1', '2013-08-09 13:44:53', '范德萨范德萨发');
INSERT INTO `oa_bwlpinglun` VALUES ('13', '4', '100000', '2013-08-13 22:02:29', '范德萨范德萨');
INSERT INTO `oa_bwlpinglun` VALUES ('14', '4', '100000', '2013-08-13 22:02:32', '范德萨范德萨发倒萨');
INSERT INTO `oa_bwlshare` VALUES ('22', '3', '100003');
INSERT INTO `oa_bwlshare` VALUES ('21', '3', '100002');
INSERT INTO `oa_bwlshare` VALUES ('20', '3', '100001');
INSERT INTO `oa_bwlshare` VALUES ('19', '4', '100003');
INSERT INTO `oa_bwlshare` VALUES ('18', '4', '100002');
INSERT INTO `oa_bwlshare` VALUES ('17', '4', '100001');
INSERT INTO `oa_doccate` VALUES ('2', '范德萨', null, null, '0', '0');
INSERT INTO `oa_doccate` VALUES ('3', '奋斗sag', null, null, '2', '0');
INSERT INTO `oa_doccate` VALUES ('4', '放到', null, null, '3', '1');
INSERT INTO `oa_doccate` VALUES ('7', 'fdsafdsa', null, 'fdsafd', '3', '1');
INSERT INTO `oa_document` VALUES ('11', 'fdsafdsa', 'fdsafdsafgfdsg', '2013-06-26 23:08:11', null, null, null, '4', null, '100000', null, '2013-06-26');
INSERT INTO `oa_document` VALUES ('12', 'fdsafsd909sdfds', '<p>\r\n	fdsafdsafs\r\n</p>\r\n<p>\r\n	fdsafdsaf\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	fdsafdsa\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	fdsafa\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	fdsafds\r\n</p>', '2013-06-26 23:10:10', null, null, null, '3', null, '100000', null, '2013-06-26');
INSERT INTO `oa_emailbox` VALUES ('49', 'fdsafdsa', 'dsafdsa\r\n\r\n\r\n\r\n\r\nuser1<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\">\r\n<HTML><HEAD>\r\n<META content=\"text/html; charset=gb2312\" http-equiv=Content-Type>\r\n<STYLE>\r\nBLOCKQUOTE {\r\n	MARGIN-TOP: 0px; MARGIN-BOTTOM: 0px; MARGIN-LEFT: 2em\r\n}\r\nOL {\r\n	MARGIN-TOP: 0px; MARGIN-BOTTOM: 0px\r\n}\r\nUL {\r\n	MARGIN-TOP: 0px; MARGIN-BOTTOM: 0px\r\n}\r\nP {\r\n	MARGIN-TOP: 0px; MARGIN-BOTTOM: 0px\r\n}\r\nBODY {\r\n	LINE-HEIGHT: 1.5; FONT-FAMILY: 微软雅黑; COLOR: #000000; FONT-SIZE: 10.5pt\r\n}\r\n</STYLE>\r\n\r\n<META name=GENERATOR content=\"MSHTML 9.00.8112.16476\"></HEAD>\r\n<BODY style=\"MARGIN: 10px\">\r\n<DIV>dsafdsa</DIV>\r\n<DIV>&nbsp;</DIV>\r\n<HR style=\"WIDTH: 210px; HEIGHT: 1px\" align=left color=#b5c4df SIZE=1>\r\n\r\n<DIV><SPAN>user1</SPAN></DIV></BODY></HTML>\r\n', '100000', '2', '{\'n\':\'user1\',\'m\':\'user1@loyin.net\'}', 'loyin<loyin@loyin.net>', null, null, '1', '2013-08-15 09:53:11', '0', '', '1', '0');
INSERT INTO `oa_emailbox` VALUES ('50', 'TestMail', 'This is a test mail ... :-)', '100000', '2', '{\'n\':\'loyin@loyin.net\',\'m\':\'loyin@loyin.net\'}', 'user1@loyin.net<user1@loyin.net>,loyin@loyin.net<loyin@loyin.net>', null, null, '1', '2013-08-15 09:55:06', '0', '', '1', '0');
INSERT INTO `oa_emailbox` VALUES ('51', '新邮件', '洗发水放松\r\n范德萨范德萨\r\n\r\n\r\n\r\n\r\nuser1<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\">\r\n<HTML><HEAD>\r\n<META content=\"text/html; charset=gb2312\" http-equiv=Content-Type>\r\n<STYLE>\r\nBLOCKQUOTE {\r\n	MARGIN-TOP: 0px; MARGIN-BOTTOM: 0px; MARGIN-LEFT: 2em\r\n}\r\nOL {\r\n	MARGIN-TOP: 0px; MARGIN-BOTTOM: 0px\r\n}\r\nUL {\r\n	MARGIN-TOP: 0px; MARGIN-BOTTOM: 0px\r\n}\r\nP {\r\n	MARGIN-TOP: 0px; MARGIN-BOTTOM: 0px\r\n}\r\nBODY {\r\n	LINE-HEIGHT: 1.5; FONT-FAMILY: &#24494;&#36719;&#38597;&#40657;; COLOR: #000000; FONT-SIZE: 10.5pt\r\n}\r\n</STYLE>\r\n\r\n<META name=GENERATOR content=\"MSHTML 9.00.8112.16476\"></HEAD>\r\n<BODY style=\"MARGIN: 10px\">\r\n<DIV>洗发水放松</DIV>\r\n<DIV>范德萨范德萨<IMG src=\"cid:_Foxmail.0@00ADC538-B70A-4BD8-8E31-EAB423CCAC77\"></DIV>\r\n<DIV>&nbsp;</DIV>\r\n<HR style=\"WIDTH: 210px; HEIGHT: 1px\" align=left color=#b5c4df SIZE=1>\r\n\r\n<DIV><SPAN>user1</SPAN></DIV></BODY></HTML>\r\n', '100000', '2', '{\'n\':\'user1\',\'m\':\'user1@loyin.net\'}', 'loyin<loyin@loyin.net>', null, null, '1', '2013-08-15 10:25:35', '0', '', '1', '0');
INSERT INTO `oa_emailbox` VALUES ('52', 'fdsafdsaf', 'fdsafdsafdsa\r\n\r\n\r\n\r\n\r\nuser1<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\">\r\n<HTML><HEAD>\r\n<META content=\"text/html; charset=gb2312\" http-equiv=Content-Type>\r\n<STYLE>\r\nBLOCKQUOTE {\r\n	MARGIN-TOP: 0px; MARGIN-BOTTOM: 0px; MARGIN-LEFT: 2em\r\n}\r\nOL {\r\n	MARGIN-TOP: 0px; MARGIN-BOTTOM: 0px\r\n}\r\nUL {\r\n	MARGIN-TOP: 0px; MARGIN-BOTTOM: 0px\r\n}\r\nP {\r\n	MARGIN-TOP: 0px; MARGIN-BOTTOM: 0px\r\n}\r\nBODY {\r\n	LINE-HEIGHT: 1.5; FONT-FAMILY: 微软雅黑; COLOR: #000000; FONT-SIZE: 10.5pt\r\n}\r\n</STYLE>\r\n\r\n<META name=GENERATOR content=\"MSHTML 9.00.8112.16476\"></HEAD>\r\n<BODY style=\"MARGIN: 10px\">\r\n<DIV>fdsafdsafdsa</DIV>\r\n<DIV>&nbsp;</DIV>\r\n<HR style=\"WIDTH: 210px; HEIGHT: 1px\" align=left color=#b5c4df SIZE=1>\r\n\r\n<DIV><SPAN>user1</SPAN></DIV></BODY></HTML>\r\n', '100000', '2', '{\'n\':\'user1\',\'m\':\'user1@loyin.net\'}', 'loyin<loyin@loyin.net>', null, null, '1', '2013-08-15 10:28:18', '0', '', '0', '0');
INSERT INTO `oa_emailbox` VALUES ('53', 'TestMailThu Aug 15 10:35:43 CST 2013', 'This is a test mail ... :-)', '100000', '2', '{\'n\':\'loyin@loyin.net\',\'m\':\'loyin@loyin.net\'}', 'loyin@loyin.net<loyin@loyin.net>', null, null, '1', '2013-08-15 10:35:43', '0', '', '1', '0');
INSERT INTO `oa_emailset` VALUES ('2', 'loyin', 'loyin@loyin.net', '100000', 'pop3.loyin.net', '110', 'smtp.loyin.net', '25', '123456', '<p>\r\n	fdsafdsa\r\n</p>\r\n<p>\r\n	fdsafdsaf\r\n</p>\r\n<p>\r\n	<img src=\"/upload/image/UkNF0AL.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	fdsaf\r\n</p>\r\n<p>\r\n	afdsafdsa\r\n</p>\r\n<p>\r\n	fdsagfdsg\r\n</p>', '1', '0', '0');
INSERT INTO `oa_emailset` VALUES ('3', '公司邮箱', 'company@loyin.net', null, '127.0.0.1', '110', '127.0.0.1', '25', '123456', '范德萨范德萨', '1', '0', '1');
INSERT INTO `oa_filebox` VALUES ('85', '264954.png.jpg', 'UkqtiDC.jpg', '1', null, '2013-08-13 10:43:36', 'img', '0.00413227');
INSERT INTO `oa_filebox` VALUES ('84', '264405.png.jpg', 'UkqtiCA.jpg', '1', null, '2013-08-13 10:43:35', 'img', '0.00422573');
INSERT INTO `oa_filebox` VALUES ('66', 'head.jpg.jpg', 'UkqjgUu.jpg', '1', null, '2013-08-13 10:24:44', 'img', '0.00914574');
INSERT INTO `oa_filebox` VALUES ('67', '传奇李小龙.jpg.jpg', 'Ukqj9na.jpg', '1', null, '2013-08-13 10:26:10', 'img', '0.0892696');
INSERT INTO `oa_filebox` VALUES ('68', 'ff.jpg.jpg', 'UkqjH10.jpg', '1', null, '2013-08-13 10:27:48', 'img', '0.100924');
INSERT INTO `oa_filebox` VALUES ('69', 'bg_html.jpg.jpg', 'UkqjR9c.jpg', '1', null, '2013-08-13 10:28:01', 'img', '0.0546093');
INSERT INTO `oa_filebox` VALUES ('70', 'ff.jpg.jpg', 'UkqjRPr.jpg', '1', null, '2013-08-13 10:28:01', 'img', '0.100924');
INSERT INTO `oa_filebox` VALUES ('71', 'ff.jpg.jpg', 'UkqNKLx.jpg', '1', null, '2013-08-13 10:28:25', 'img', '0.100924');
INSERT INTO `oa_filebox` VALUES ('72', 'head.jpg.jpg', 'UkqNKOM.jpg', '1', null, '2013-08-13 10:28:25', 'img', '0.00914574');
INSERT INTO `oa_filebox` VALUES ('73', '传奇李小龙.jpg.jpg', 'UkqNKiY.jpg', '1', null, '2013-08-13 10:28:25', 'img', '0.0892696');
INSERT INTO `oa_filebox` VALUES ('74', '154424_IH2A_161121.jpg.jpg', 'Ukqsgqx.jpg', '1', null, '2013-08-13 10:36:39', 'img', '0.184826');
INSERT INTO `oa_filebox` VALUES ('75', '154424_IH2A_161121.jpg.jpg', 'UkqsUPL.jpg', '1', null, '2013-08-13 10:37:34', 'img', '0.184826');
INSERT INTO `oa_filebox` VALUES ('76', 'AfUT1NrEmBXET1R4bAZ6K.jpg.jpg', 'Ukqs3P3.jpg', '1', null, '2013-08-13 10:37:49', 'img', '0.0261736');
INSERT INTO `oa_filebox` VALUES ('77', 'AfUT1R9DmB7ZT1R4bAZ6K.jpg.jpg', 'Ukqs385.jpg', '1', null, '2013-08-13 10:37:50', 'img', '0.0300407');
INSERT INTO `oa_filebox` VALUES ('78', 'AfUT1rAKmBshv1R4bAZ6K.jpg.jpg', 'Ukqs3hA.jpg', '1', null, '2013-08-13 10:37:50', 'img', '0.0108442');
INSERT INTO `oa_filebox` VALUES ('79', 'AfUT1rJbmBsJ_1R4bAZ6K.jpg.jpg', 'Ukqs3Oh.jpg', '1', null, '2013-08-13 10:37:50', 'img', '0.0244217');
INSERT INTO `oa_filebox` VALUES ('80', 'AfUT1UeLmBvK_1R4bAZ6K.jpg.jpg', 'Ukqs3ZS.jpg', '1', null, '2013-08-13 10:37:50', 'img', '0.0116415');
INSERT INTO `oa_filebox` VALUES ('81', 'AfUT1UIAmBg__1R4bAZ6K.jpg.jpg', 'Ukqs3iA.jpg', '1', null, '2013-08-13 10:37:50', 'img', '0.024065');
INSERT INTO `oa_filebox` VALUES ('82', 'AfUT1UrdmB4xT1R4bAZ6K.jpg.jpg', 'Ukqs3Iw.jpg', '1', null, '2013-08-13 10:37:50', 'img', '0.0238028');
INSERT INTO `oa_filebox` VALUES ('83', 'AfUT1wPhmBKJT1R4bAZ6K.jpg.jpg', 'Ukqsy04.jpg', '1', null, '2013-08-13 10:37:51', 'img', '0.0245771');
INSERT INTO `oa_filebox` VALUES ('58', '1 (8).jpg', 'image/UkXUMaQ.jpg', '15', null, '2013-08-12 22:36:08', 'img', '0.0628738');
INSERT INTO `oa_filebox` VALUES ('59', '1 (2).jpg', 'image/UkXv1ap.jpg', '15', null, '2013-08-12 22:38:00', 'img', '0.043293');
INSERT INTO `oa_filebox` VALUES ('60', '1 (7).jpg', 'image/UkXvjNX.jpg', '15', null, '2013-08-12 22:38:08', 'img', '0.0739365');
INSERT INTO `oa_filebox` VALUES ('86', 'AfUT1NrEmBXET1R4bAZ6K.jpg.jpg', 'UkqqSNw.jpg', '1', null, '2013-08-13 10:44:24', 'img', '0.0261736');
INSERT INTO `oa_filebox` VALUES ('87', 'AfUT1R9DmB7ZT1R4bAZ6K.jpg.jpg', 'UkqqSt9.jpg', '1', null, '2013-08-13 10:44:24', 'img', '0.0300407');
INSERT INTO `oa_filebox` VALUES ('88', 'AfUT1rAKmBshv1R4bAZ6K.jpg.jpg', 'UkqqSU8.jpg', '1', null, '2013-08-13 10:44:24', 'img', '0.0108442');
INSERT INTO `oa_filebox` VALUES ('89', 'AfUT1rJbmBsJ_1R4bAZ6K.jpg.jpg', 'UkqqSxo.jpg', '1', null, '2013-08-13 10:44:24', 'img', '0.0244217');
INSERT INTO `oa_filebox` VALUES ('90', 'AfUT1UeLmBvK_1R4bAZ6K.jpg.jpg', 'UkqqSyT.jpg', '1', null, '2013-08-13 10:44:24', 'img', '0.0116415');
INSERT INTO `oa_filebox` VALUES ('91', 'AfUT1UIAmBg__1R4bAZ6K.jpg.jpg', 'UkqqS9N.jpg', '1', null, '2013-08-13 10:44:25', 'img', '0.024065');
INSERT INTO `oa_filebox` VALUES ('92', 'AfUT1UrdmB4xT1R4bAZ6K.jpg.jpg', 'UkqqSEm.jpg', '1', null, '2013-08-13 10:44:25', 'img', '0.0238028');
INSERT INTO `oa_filebox` VALUES ('93', 'AfUT1wPhmBKJT1R4bAZ6K.jpg.jpg', 'UkqqSnD.jpg', '1', null, '2013-08-13 10:44:25', 'img', '0.0245771');
INSERT INTO `oa_filebox` VALUES ('94', 'AfUT1hLVmBQWT1R4bAZ6K.jpg.jpg', 'UkqQpie.jpg', '1', null, '2013-08-13 10:51:37', 'img', '0.017005');
INSERT INTO `oa_filebox` VALUES ('95', 'AfUT1IMDmByAT1R4bAZ6K.jpg.jpg', 'UkqQpIi.jpg', '1', null, '2013-08-13 10:51:37', 'img', '0.0166931');
INSERT INTO `oa_filebox` VALUES ('96', 'AfUT1inCmBCK_1R4bAZ6K.jpg.jpg', 'UkqQHcT.jpg', '1', null, '2013-08-13 10:51:37', 'img', '0.0313959');
INSERT INTO `oa_filebox` VALUES ('97', 'AfUT1MgbmBbYT1R4bAZ6K.jpg.jpg', 'UkqQHdQ.jpg', '1', null, '2013-08-13 10:51:37', 'img', '0.0214214');
INSERT INTO `oa_filebox` VALUES ('98', 'AfUT1NrEmBXET1R4bAZ6K.jpg.jpg', 'UkqQHSM.jpg', '1', null, '2013-08-13 10:51:38', 'img', '0.0261736');
INSERT INTO `oa_filebox` VALUES ('99', 'AfUT1R9DmB7ZT1R4bAZ6K.jpg.jpg', 'UkqQH60.jpg', '1', null, '2013-08-13 10:51:38', 'img', '0.0300407');
INSERT INTO `oa_filebox` VALUES ('100', 'AfUT1rAKmBshv1R4bAZ6K.jpg.jpg', 'UkqQHkS.jpg', '1', null, '2013-08-13 10:51:38', 'img', '0.0108442');
INSERT INTO `oa_filebox` VALUES ('101', 'AfUT1rJbmBsJ_1R4bAZ6K.jpg.jpg', 'UkqQHjq.jpg', '1', null, '2013-08-13 10:51:38', 'img', '0.0244217');
INSERT INTO `oa_filebox` VALUES ('102', 'payroll.xls', 'file/UkqUspr.xls', '1', null, '2013-08-13 10:53:13', 'oth', '0.0170898');
INSERT INTO `oa_filebox` VALUES ('103', 'AfUT1IMDmByAT1R4bAZ6K.jpg.jpg', 'UkqVPCA.jpg', '1', null, '2013-08-13 12:53:39', 'img', '0.0166931');
INSERT INTO `oa_filebox` VALUES ('131', 'head.jpg.jpg', 'U1OEVUU.jpg', '100000', null, '2013-08-28 21:03:33', 'img', '0.010911');
INSERT INTO `oa_filebox` VALUES ('132', 'guogou1.png.jpg', 'Us1BBGh.jpg', '100000', null, '2013-10-14 21:27:01', 'img', '0.112962');
INSERT INTO `oa_filebox` VALUES ('133', 'guogou1.png.jpg', 'Usij7hQ.jpg', '100000', null, '2013-10-21 20:51:29', 'img', '0.112962');
INSERT INTO `oa_filebox` VALUES ('134', '20130309_085846.jpg.jpg', 'Usijid4.jpg', '100000', null, '2013-10-21 20:54:12', 'img', '0.385257');
INSERT INTO `oa_gglan` VALUES ('1', '日常事务', '12', '1');
INSERT INTO `oa_gglan` VALUES ('2', '部门事务', 'fdsaf', '1');
INSERT INTO `oa_ggreadlist` VALUES ('1', '2013-08-10 15:57:09', '3');
INSERT INTO `oa_ggreadlist` VALUES ('1', '2013-08-10 15:57:11', '8');
INSERT INTO `oa_ggreadlist` VALUES ('1', '2013-08-10 15:58:16', '5');
INSERT INTO `oa_ggreadlist` VALUES ('1', '2013-08-10 16:02:45', '6');
INSERT INTO `oa_ggreadlist` VALUES ('1', '2013-08-10 18:43:12', '4');
INSERT INTO `oa_ggreadlist` VALUES ('1', '2013-08-10 18:43:40', '7');
INSERT INTO `oa_ggreadlist` VALUES ('100000', '2013-08-13 21:29:08', '9');
INSERT INTO `oa_gonggao` VALUES ('3', '范德萨范德萨发', '<p>\r\n	范德萨范德萨发\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	fdsafd\r\n</p>\r\n<p>\r\n	fdsafdsaf\r\n</p>', '2013-08-08 19:24:02', '1', '2013-08-09 22:16:18', null, '0', '2013-08-08', '2013-08-30', '1', null, '1');
INSERT INTO `oa_gonggao` VALUES ('4', '范德萨飞洒大', '范德萨范德萨发', '2013-08-08 22:51:20', '1', '2013-08-08 22:51:30', null, '0', '2013-08-08', null, '1', null, '1');
INSERT INTO `oa_gonggao` VALUES ('5', 'gfdsgfds', 'fdsafdsafdsaffsad', '2013-08-09 22:15:42', '1', '2013-08-09 22:16:24', null, '0', '2013-08-09', null, '1', null, '1');
INSERT INTO `oa_gonggao` VALUES ('6', 'gfdsgfds', 'fdsafdsafdsaffsad', '2013-08-09 22:15:45', '1', '2013-08-09 22:16:24', null, '0', '2013-08-09', null, '1', null, '1');
INSERT INTO `oa_gonggao` VALUES ('7', 'gfdsgfdsgdfs', 'gfdsgfdsgfds', '2013-08-09 22:16:06', '1', '2013-08-09 22:16:18', null, '0', '2013-08-09', null, '1', null, '1');
INSERT INTO `oa_gonggao` VALUES ('8', 'gfdsgfdsgdfs', 'gfdsgfdsgfds', '2013-08-09 22:16:08', '1', '2013-08-09 22:16:24', null, '0', '2013-08-09', null, '1', null, '1');
INSERT INTO `oa_gonggao` VALUES ('9', '-==范德萨范德萨发地方', '<p>\r\n	范德萨范德萨发第三方\r\n</p>\r\n<p>\r\n	范德萨分\r\n</p>', '2013-08-13 21:27:39', '100000', '2013-10-21 20:58:19', null, '0', '2013-08-13', null, '1', null, '1');
INSERT INTO `oa_kaoqing` VALUES ('14', '100000', '10:34:15', '20:51:06', '2013-10-04', '10', '4', '2013', '127.0.0.1', '127.0.0.1', null, null, null, null, null, '', '2');
INSERT INTO `oa_kaoqing` VALUES ('15', '100000', '21:23:27', '20:41:27', '2013-10-14', '10', '14', '2013', '127.0.0.1', '127.0.0.1', null, null, null, null, null, '', '2');
INSERT INTO `oa_kqset` VALUES ('1', '1', '1', '1', '1', '1', '0', '0', '08:30', '18:00', '2013-08-16');
INSERT INTO `oa_kqset` VALUES ('2', '1', '1', '1', '1', '1', '1', '0', '09:00', '18:00', '2013-08-30');
INSERT INTO `oa_meeting` VALUES ('1', 'fdafa', null, '1', '2013-08-10 13:50:59', 'fdsafdsaf', null, null, '1', null, null, null);
INSERT INTO `oa_meeting` VALUES ('2', 'gfdsgfds', null, '1', '2013-08-10 13:52:29', 'gfdsgfdsgfd', '2013-08-10', '2013-08-10', '1', null, null, null);
INSERT INTO `oa_meeting` VALUES ('3', 'gfdsgfds', null, '1', '2013-08-10 14:03:47', 'gfdsgfdsgfd', '2013-08-10 00:00:00', null, '1', null, null, null);
INSERT INTO `oa_meeting` VALUES ('4', 'dsafdsafdsa', null, '1', '2013-08-10 14:58:11', 'fdsafdsafsdafsadf', '2013-08-10 10:00:00', '2013-08-10 12:00:00', '0', null, null, null);
INSERT INTO `oa_meeting` VALUES ('7', 'sdfdsf', null, '1', '2013-08-10 15:02:22', 'fdsafdsafsdfsafdsaf', '2013-08-10 00:00:00', '2013-08-10 15:02:15', '0', null, null, null);
INSERT INTO `oa_meeting` VALUES ('8', '范德萨范德萨发', '2013-10-21 22:06:36', '100000', '2013-08-13 21:34:59', '范德萨范德萨发', '2013-08-13 00:00:00', '2013-08-22 21:34:46', '1', null, null, null);
INSERT INTO `oa_meeting` VALUES ('9', '范德萨范德萨发', '2013-10-21 22:06:36', '100000', '2013-08-13 21:35:25', '范德萨范德萨发<img src=\"/upload/image/UkvdQ5v.jpg\" alt=\"\" />', '2013-08-13 00:00:00', '2013-08-22 21:34:46', '1', null, null, null);
INSERT INTO `oa_meeting` VALUES ('10', 'fdasfadsfsafdsaf', '2013-10-21 22:06:36', '100000', '2013-10-14 20:52:12', 'fdasfdsa', '2013-10-14 00:00:00', '2013-10-16 20:30:00', '1', null, null, null);
INSERT INTO `oa_meetingjoin` VALUES ('9', '100002', '9', '0');
INSERT INTO `oa_meetingjoin` VALUES ('8', '100001', '9', '0');
INSERT INTO `oa_meetingjoin` VALUES ('7', '100000', '9', '0');
INSERT INTO `oa_meetingjoin` VALUES ('10', '100003', '9', '0');
INSERT INTO `oa_meetingjoin` VALUES ('16', '100002', '10', '0');
INSERT INTO `oa_meetingjoin` VALUES ('15', '100001', '10', '0');
INSERT INTO `oa_meetingjoin` VALUES ('14', '100000', '10', '0');
INSERT INTO `oa_msg` VALUES ('1', '范德萨分', '100000', '2013-01-01 12:23:23', '范德萨飞洒大', '2');
INSERT INTO `oa_recvmsg` VALUES ('1', '1', '100000', '2013-08-15 22:54:44', '32', '3', '100000');
INSERT INTO `sale_baobeimoban` VALUES ('1', '范德萨发达', '0', null, '2013-08-25 21:10:36', '范德萨范德萨范德萨范德萨');
INSERT INTO `sys_area` VALUES ('1', '北京市', '0', '0', '1', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2', '天津市', '0', '0', '1', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3', '河北省', '0', '0', '1', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('4', '山西省', '0', '0', '1', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('5', '内蒙古', '0', '0', '1', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('6', '辽宁省', '0', '0', '1', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('7', '吉林省', '0', '0', '1', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('8', '黑龙江', '0', '0', '1', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('9', '上海市', '0', '0', '1', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('10', '江苏省', '0', '0', '1', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('11', '浙江省', '0', '0', '1', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('12', '安徽省', '0', '0', '1', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('13', '福建省', '0', '0', '1', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('14', '江西省', '0', '0', '1', '14', null, null, null);
INSERT INTO `sys_area` VALUES ('15', '山东省', '0', '0', '1', '15', null, null, null);
INSERT INTO `sys_area` VALUES ('16', '河南省', '0', '0', '1', '16', null, null, null);
INSERT INTO `sys_area` VALUES ('17', '湖北省', '0', '0', '1', '17', null, null, null);
INSERT INTO `sys_area` VALUES ('18', '湖南省', '0', '0', '1', '18', null, null, null);
INSERT INTO `sys_area` VALUES ('19', '广东省', '0', '0', '1', '19', null, null, null);
INSERT INTO `sys_area` VALUES ('20', '广  西', '0', '0', '1', '20', null, null, null);
INSERT INTO `sys_area` VALUES ('21', '海南省', '0', '0', '1', '21', null, null, null);
INSERT INTO `sys_area` VALUES ('22', '重庆市', '0', '0', '1', '22', null, null, null);
INSERT INTO `sys_area` VALUES ('23', '四川省', '0', '0', '1', '23', null, null, null);
INSERT INTO `sys_area` VALUES ('24', '贵州省', '0', '0', '1', '24', null, null, null);
INSERT INTO `sys_area` VALUES ('25', '云南省', '0', '0', '1', '25', null, null, null);
INSERT INTO `sys_area` VALUES ('26', '西  藏', '0', '0', '1', '26', null, null, null);
INSERT INTO `sys_area` VALUES ('27', '陕西省', '0', '0', '1', '27', null, null, null);
INSERT INTO `sys_area` VALUES ('28', '甘肃省', '0', '0', '1', '28', null, null, null);
INSERT INTO `sys_area` VALUES ('29', '青海省', '0', '0', '1', '29', null, null, null);
INSERT INTO `sys_area` VALUES ('30', '宁  夏', '0', '0', '1', '30', null, null, null);
INSERT INTO `sys_area` VALUES ('31', '新  疆', '0', '0', '1', '31', null, null, null);
INSERT INTO `sys_area` VALUES ('32', '北京市', '1', '1', '2', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('34', '天津市', '2', '2', '2', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('36', '石家庄市', '3', '3', '2', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('37', '唐山市', '3', '3', '2', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('38', '秦皇岛市', '3', '3', '2', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('39', '邯郸市', '3', '3', '2', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('40', '邢台市', '3', '3', '2', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('41', '保定市', '3', '3', '2', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('42', '张家口市', '3', '3', '2', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('43', '承德市', '3', '3', '2', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('44', '沧州市', '3', '3', '2', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('45', '廊坊市', '3', '3', '2', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('46', '衡水市', '3', '3', '2', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('47', '太原市', '4', '4', '2', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('48', '大同市', '4', '4', '2', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('49', '阳泉市', '4', '4', '2', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('50', '长治市', '4', '4', '2', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('51', '晋城市', '4', '4', '2', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('52', '朔州市', '4', '4', '2', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('53', '晋中市', '4', '4', '2', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('54', '运城市', '4', '4', '2', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('55', '忻州市', '4', '4', '2', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('56', '临汾市', '4', '4', '2', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('57', '吕梁市', '4', '4', '2', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('58', '呼和浩特市', '5', '5', '2', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('59', '包头市', '5', '5', '2', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('60', '乌海市', '5', '5', '2', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('61', '赤峰市', '5', '5', '2', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('62', '通辽市', '5', '5', '2', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('63', '鄂尔多斯市', '5', '5', '2', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('64', '呼伦贝尔市', '5', '5', '2', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('65', '巴彦淖尔市', '5', '5', '2', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('66', '乌兰察布市', '5', '5', '2', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('67', '兴安盟', '5', '5', '2', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('68', '锡林郭勒盟', '5', '5', '2', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('69', '阿拉善盟', '5', '5', '2', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('70', '沈阳市', '6', '6', '2', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('71', '大连市', '6', '6', '2', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('72', '鞍山市', '6', '6', '2', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('73', '抚顺市', '6', '6', '2', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('74', '本溪市', '6', '6', '2', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('75', '丹东市', '6', '6', '2', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('76', '锦州市', '6', '6', '2', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('77', '营口市', '6', '6', '2', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('78', '阜新市', '6', '6', '2', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('79', '辽阳市', '6', '6', '2', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('80', '盘锦市', '6', '6', '2', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('81', '铁岭市', '6', '6', '2', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('82', '朝阳市', '6', '6', '2', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('83', '葫芦岛市', '6', '6', '2', '14', null, null, null);
INSERT INTO `sys_area` VALUES ('84', '长春市', '7', '7', '2', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('85', '吉林市', '7', '7', '2', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('86', '四平市', '7', '7', '2', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('87', '辽源市', '7', '7', '2', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('88', '通化市', '7', '7', '2', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('89', '白山市', '7', '7', '2', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('90', '松原市', '7', '7', '2', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('91', '白城市', '7', '7', '2', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('92', '延边朝鲜族自治州', '7', '7', '2', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('93', '哈尔滨市', '8', '8', '2', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('94', '齐齐哈尔市', '8', '8', '2', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('95', '鸡西市', '8', '8', '2', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('96', '鹤岗市', '8', '8', '2', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('97', '双鸭山市', '8', '8', '2', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('98', '大庆市', '8', '8', '2', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('99', '伊春市', '8', '8', '2', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('100', '佳木斯市', '8', '8', '2', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('101', '七台河市', '8', '8', '2', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('102', '牡丹江市', '8', '8', '2', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('103', '黑河市', '8', '8', '2', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('104', '绥化市', '8', '8', '2', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('105', '大兴安岭地区', '8', '8', '2', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('106', '市辖区', '9', '9', '2', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('108', '南京市', '10', '10', '2', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('109', '无锡市', '10', '10', '2', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('110', '徐州市', '10', '10', '2', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('111', '常州市', '10', '10', '2', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('112', '苏州市', '10', '10', '2', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('113', '南通市', '10', '10', '2', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('114', '连云港市', '10', '10', '2', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('115', '淮安市', '10', '10', '2', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('116', '盐城市', '10', '10', '2', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('117', '扬州市', '10', '10', '2', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('118', '镇江市', '10', '10', '2', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('119', '泰州市', '10', '10', '2', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('120', '宿迁市', '10', '10', '2', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('121', '杭州市', '11', '11', '2', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('122', '宁波市', '11', '11', '2', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('123', '温州市', '11', '11', '2', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('124', '嘉兴市', '11', '11', '2', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('125', '湖州市', '11', '11', '2', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('126', '绍兴市', '11', '11', '2', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('127', '金华市', '11', '11', '2', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('128', '衢州市', '11', '11', '2', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('129', '舟山市', '11', '11', '2', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('130', '台州市', '11', '11', '2', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('131', '丽水市', '11', '11', '2', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('132', '合肥市', '12', '12', '2', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('133', '芜湖市', '12', '12', '2', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('134', '蚌埠市', '12', '12', '2', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('135', '淮南市', '12', '12', '2', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('136', '马鞍山市', '12', '12', '2', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('137', '淮北市', '12', '12', '2', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('138', '铜陵市', '12', '12', '2', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('139', '安庆市', '12', '12', '2', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('140', '黄山市', '12', '12', '2', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('141', '滁州市', '12', '12', '2', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('142', '阜阳市', '12', '12', '2', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('143', '宿州市', '12', '12', '2', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('144', '巢湖市', '12', '12', '2', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('145', '六安市', '12', '12', '2', '14', null, null, null);
INSERT INTO `sys_area` VALUES ('146', '亳州市', '12', '12', '2', '15', null, null, null);
INSERT INTO `sys_area` VALUES ('147', '池州市', '12', '12', '2', '16', null, null, null);
INSERT INTO `sys_area` VALUES ('148', '宣城市', '12', '12', '2', '17', null, null, null);
INSERT INTO `sys_area` VALUES ('149', '福州市', '13', '13', '2', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('150', '厦门市', '13', '13', '2', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('151', '莆田市', '13', '13', '2', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('152', '三明市', '13', '13', '2', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('153', '泉州市', '13', '13', '2', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('154', '漳州市', '13', '13', '2', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('155', '南平市', '13', '13', '2', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('156', '龙岩市', '13', '13', '2', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('157', '宁德市', '13', '13', '2', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('158', '南昌市', '14', '14', '2', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('159', '景德镇市', '14', '14', '2', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('160', '萍乡市', '14', '14', '2', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('161', '九江市', '14', '14', '2', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('162', '新余市', '14', '14', '2', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('163', '鹰潭市', '14', '14', '2', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('164', '赣州市', '14', '14', '2', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('165', '吉安市', '14', '14', '2', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('166', '宜春市', '14', '14', '2', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('167', '抚州市', '14', '14', '2', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('168', '上饶市', '14', '14', '2', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('169', '济南市', '15', '15', '2', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('170', '青岛市', '15', '15', '2', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('171', '淄博市', '15', '15', '2', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('172', '枣庄市', '15', '15', '2', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('173', '东营市', '15', '15', '2', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('174', '烟台市', '15', '15', '2', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('175', '潍坊市', '15', '15', '2', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('176', '济宁市', '15', '15', '2', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('177', '泰安市', '15', '15', '2', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('178', '威海市', '15', '15', '2', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('179', '日照市', '15', '15', '2', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('180', '莱芜市', '15', '15', '2', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('181', '临沂市', '15', '15', '2', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('182', '德州市', '15', '15', '2', '14', null, null, null);
INSERT INTO `sys_area` VALUES ('183', '聊城市', '15', '15', '2', '15', null, null, null);
INSERT INTO `sys_area` VALUES ('184', '滨州市', '15', '15', '2', '16', null, null, null);
INSERT INTO `sys_area` VALUES ('185', '荷泽市', '15', '15', '2', '17', null, null, null);
INSERT INTO `sys_area` VALUES ('186', '郑州市', '16', '16', '2', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('187', '开封市', '16', '16', '2', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('188', '洛阳市', '16', '16', '2', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('189', '平顶山市', '16', '16', '2', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('190', '安阳市', '16', '16', '2', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('191', '鹤壁市', '16', '16', '2', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('192', '新乡市', '16', '16', '2', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('193', '焦作市', '16', '16', '2', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('194', '濮阳市', '16', '16', '2', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('195', '许昌市', '16', '16', '2', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('196', '漯河市', '16', '16', '2', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('197', '三门峡市', '16', '16', '2', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('198', '南阳市', '16', '16', '2', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('199', '商丘市', '16', '16', '2', '14', null, null, null);
INSERT INTO `sys_area` VALUES ('200', '信阳市', '16', '16', '2', '15', null, null, null);
INSERT INTO `sys_area` VALUES ('201', '周口市', '16', '16', '2', '16', null, null, null);
INSERT INTO `sys_area` VALUES ('202', '驻马店市', '16', '16', '2', '17', null, null, null);
INSERT INTO `sys_area` VALUES ('203', '武汉市', '17', '17', '2', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('204', '黄石市', '17', '17', '2', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('205', '十堰市', '17', '17', '2', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('206', '宜昌市', '17', '17', '2', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('207', '襄樊市', '17', '17', '2', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('208', '鄂州市', '17', '17', '2', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('209', '荆门市', '17', '17', '2', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('210', '孝感市', '17', '17', '2', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('211', '荆州市', '17', '17', '2', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('212', '黄冈市', '17', '17', '2', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('213', '咸宁市', '17', '17', '2', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('214', '随州市', '17', '17', '2', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('215', '恩施土家族苗族自治州', '17', '17', '2', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('216', '省直辖行政单位', '17', '17', '2', '14', null, null, null);
INSERT INTO `sys_area` VALUES ('217', '长沙市', '18', '18', '2', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('218', '株洲市', '18', '18', '2', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('219', '湘潭市', '18', '18', '2', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('220', '衡阳市', '18', '18', '2', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('221', '邵阳市', '18', '18', '2', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('222', '岳阳市', '18', '18', '2', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('223', '常德市', '18', '18', '2', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('224', '张家界市', '18', '18', '2', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('225', '益阳市', '18', '18', '2', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('226', '郴州市', '18', '18', '2', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('227', '永州市', '18', '18', '2', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('228', '怀化市', '18', '18', '2', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('229', '娄底市', '18', '18', '2', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('230', '湘西土家族苗族自治州', '18', '18', '2', '14', null, null, null);
INSERT INTO `sys_area` VALUES ('231', '广州市', '19', '19', '2', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('232', '韶关市', '19', '19', '2', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('233', '深圳市', '19', '19', '2', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('234', '珠海市', '19', '19', '2', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('235', '汕头市', '19', '19', '2', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('236', '佛山市', '19', '19', '2', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('237', '江门市', '19', '19', '2', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('238', '湛江市', '19', '19', '2', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('239', '茂名市', '19', '19', '2', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('240', '肇庆市', '19', '19', '2', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('241', '惠州市', '19', '19', '2', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('242', '梅州市', '19', '19', '2', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('243', '汕尾市', '19', '19', '2', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('244', '河源市', '19', '19', '2', '14', null, null, null);
INSERT INTO `sys_area` VALUES ('245', '阳江市', '19', '19', '2', '15', null, null, null);
INSERT INTO `sys_area` VALUES ('246', '清远市', '19', '19', '2', '16', null, null, null);
INSERT INTO `sys_area` VALUES ('247', '东莞市', '19', '19', '2', '17', null, null, null);
INSERT INTO `sys_area` VALUES ('248', '中山市', '19', '19', '2', '18', null, null, null);
INSERT INTO `sys_area` VALUES ('249', '潮州市', '19', '19', '2', '19', null, null, null);
INSERT INTO `sys_area` VALUES ('250', '揭阳市', '19', '19', '2', '20', null, null, null);
INSERT INTO `sys_area` VALUES ('251', '云浮市', '19', '19', '2', '21', null, null, null);
INSERT INTO `sys_area` VALUES ('252', '南宁市', '20', '20', '2', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('253', '柳州市', '20', '20', '2', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('254', '桂林市', '20', '20', '2', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('255', '梧州市', '20', '20', '2', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('256', '北海市', '20', '20', '2', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('257', '防城港市', '20', '20', '2', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('258', '钦州市', '20', '20', '2', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('259', '贵港市', '20', '20', '2', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('260', '玉林市', '20', '20', '2', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('261', '百色市', '20', '20', '2', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('262', '贺州市', '20', '20', '2', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('263', '河池市', '20', '20', '2', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('264', '来宾市', '20', '20', '2', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('265', '崇左市', '20', '20', '2', '14', null, null, null);
INSERT INTO `sys_area` VALUES ('266', '海口市', '21', '21', '2', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('267', '三亚市', '21', '21', '2', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('268', '省直辖县级行政单位', '21', '21', '2', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('269', '市辖区', '22', '22', '2', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('271', '市', '22', '22', '2', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('272', '成都市', '23', '23', '2', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('273', '自贡市', '23', '23', '2', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('274', '攀枝花市', '23', '23', '2', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('275', '泸州市', '23', '23', '2', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('276', '德阳市', '23', '23', '2', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('277', '绵阳市', '23', '23', '2', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('278', '广元市', '23', '23', '2', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('279', '遂宁市', '23', '23', '2', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('280', '内江市', '23', '23', '2', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('281', '乐山市', '23', '23', '2', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('282', '南充市', '23', '23', '2', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('283', '眉山市', '23', '23', '2', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('284', '宜宾市', '23', '23', '2', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('285', '广安市', '23', '23', '2', '14', null, null, null);
INSERT INTO `sys_area` VALUES ('286', '达州市', '23', '23', '2', '15', null, null, null);
INSERT INTO `sys_area` VALUES ('287', '雅安市', '23', '23', '2', '16', null, null, null);
INSERT INTO `sys_area` VALUES ('288', '巴中市', '23', '23', '2', '17', null, null, null);
INSERT INTO `sys_area` VALUES ('289', '资阳市', '23', '23', '2', '18', null, null, null);
INSERT INTO `sys_area` VALUES ('290', '阿坝藏族羌族自治州', '23', '23', '2', '19', null, null, null);
INSERT INTO `sys_area` VALUES ('291', '甘孜藏族自治州', '23', '23', '2', '20', null, null, null);
INSERT INTO `sys_area` VALUES ('292', '凉山彝族自治州', '23', '23', '2', '21', null, null, null);
INSERT INTO `sys_area` VALUES ('293', '贵阳市', '24', '24', '2', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('294', '六盘水市', '24', '24', '2', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('295', '遵义市', '24', '24', '2', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('296', '安顺市', '24', '24', '2', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('297', '铜仁地区', '24', '24', '2', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('298', '黔西南布依族苗族自治州', '24', '24', '2', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('299', '毕节地区', '24', '24', '2', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('300', '黔东南苗族侗族自治州', '24', '24', '2', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('301', '黔南布依族苗族自治州', '24', '24', '2', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('302', '昆明市', '25', '25', '2', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('303', '曲靖市', '25', '25', '2', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('304', '玉溪市', '25', '25', '2', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('305', '保山市', '25', '25', '2', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('306', '昭通市', '25', '25', '2', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('307', '丽江市', '25', '25', '2', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('308', '思茅市', '25', '25', '2', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('309', '临沧市', '25', '25', '2', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('310', '楚雄彝族自治州', '25', '25', '2', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('311', '红河哈尼族彝族自治州', '25', '25', '2', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('312', '文山壮族苗族自治州', '25', '25', '2', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('313', '西双版纳傣族自治州', '25', '25', '2', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('314', '大理白族自治州', '25', '25', '2', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('315', '德宏傣族景颇族自治州', '25', '25', '2', '14', null, null, null);
INSERT INTO `sys_area` VALUES ('316', '怒江傈僳族自治州', '25', '25', '2', '15', null, null, null);
INSERT INTO `sys_area` VALUES ('317', '迪庆藏族自治州', '25', '25', '2', '16', null, null, null);
INSERT INTO `sys_area` VALUES ('318', '拉萨市', '26', '26', '2', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('319', '昌都地区', '26', '26', '2', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('320', '山南地区', '26', '26', '2', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('321', '日喀则地区', '26', '26', '2', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('322', '那曲地区', '26', '26', '2', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('323', '阿里地区', '26', '26', '2', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('324', '林芝地区', '26', '26', '2', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('325', '西安市', '27', '27', '2', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('326', '铜川市', '27', '27', '2', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('327', '宝鸡市', '27', '27', '2', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('328', '咸阳市', '27', '27', '2', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('329', '渭南市', '27', '27', '2', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('330', '延安市', '27', '27', '2', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('331', '汉中市', '27', '27', '2', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('332', '榆林市', '27', '27', '2', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('333', '安康市', '27', '27', '2', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('334', '商洛市', '27', '27', '2', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('335', '兰州市', '28', '28', '2', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('336', '嘉峪关市', '28', '28', '2', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('337', '金昌市', '28', '28', '2', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('338', '白银市', '28', '28', '2', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('339', '天水市', '28', '28', '2', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('340', '武威市', '28', '28', '2', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('341', '张掖市', '28', '28', '2', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('342', '平凉市', '28', '28', '2', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('343', '酒泉市', '28', '28', '2', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('344', '庆阳市', '28', '28', '2', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('345', '定西市', '28', '28', '2', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('346', '陇南市', '28', '28', '2', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('347', '临夏回族自治州', '28', '28', '2', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('348', '甘南藏族自治州', '28', '28', '2', '14', null, null, null);
INSERT INTO `sys_area` VALUES ('349', '西宁市', '29', '29', '2', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('350', '海东地区', '29', '29', '2', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('351', '海北藏族自治州', '29', '29', '2', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('352', '黄南藏族自治州', '29', '29', '2', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('353', '海南藏族自治州', '29', '29', '2', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('354', '果洛藏族自治州', '29', '29', '2', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('355', '玉树藏族自治州', '29', '29', '2', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('356', '海西蒙古族藏族自治州', '29', '29', '2', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('357', '银川市', '30', '30', '2', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('358', '石嘴山市', '30', '30', '2', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('359', '吴忠市', '30', '30', '2', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('360', '固原市', '30', '30', '2', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('361', '中卫市', '30', '30', '2', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('362', '乌鲁木齐市', '31', '31', '2', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('363', '克拉玛依市', '31', '31', '2', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('364', '吐鲁番地区', '31', '31', '2', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('365', '哈密地区', '31', '31', '2', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('366', '昌吉回族自治州', '31', '31', '2', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('367', '博尔塔拉蒙古自治州', '31', '31', '2', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('368', '巴音郭楞蒙古自治州', '31', '31', '2', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('369', '阿克苏地区', '31', '31', '2', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('370', '克孜勒苏柯尔克孜自治州', '31', '31', '2', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('371', '喀什地区', '31', '31', '2', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('372', '和田地区', '31', '31', '2', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('373', '伊犁哈萨克自治州', '31', '31', '2', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('374', '塔城地区', '31', '31', '2', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('375', '阿勒泰地区', '31', '31', '2', '14', null, null, null);
INSERT INTO `sys_area` VALUES ('376', '东城区', '1', '1,32', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('377', '西城区', '1', '1,32', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('378', '崇文区', '1', '1,32', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('379', '宣武区', '1', '1,32', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('380', '朝阳区', '1', '1,32', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('381', '丰台区', '1', '1,32', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('382', '石景山区', '1', '1,32', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('383', '海淀区', '1', '1,32', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('384', '门头沟区', '1', '1,32', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('385', '房山区', '1', '1,32', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('386', '通州区', '1', '1,32', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('387', '顺义区', '1', '1,32', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('388', '昌平区', '1', '1,32', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('389', '大兴区', '1', '1,32', '3', '14', null, null, null);
INSERT INTO `sys_area` VALUES ('390', '怀柔区', '1', '1,32', '3', '15', null, null, null);
INSERT INTO `sys_area` VALUES ('391', '平谷区', '1', '1,32', '3', '16', null, null, null);
INSERT INTO `sys_area` VALUES ('392', '密云县', '1', '1,33', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('393', '延庆县', '1', '1,33', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('394', '和平区', '2', '2,34', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('395', '河东区', '2', '2,34', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('396', '河西区', '2', '2,34', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('397', '南开区', '2', '2,34', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('398', '河北区', '2', '2,34', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('399', '红桥区', '2', '2,34', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('400', '塘沽区', '2', '2,34', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('401', '汉沽区', '2', '2,34', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('402', '大港区', '2', '2,34', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('403', '东丽区', '2', '2,34', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('404', '西青区', '2', '2,34', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('405', '津南区', '2', '2,34', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('406', '北辰区', '2', '2,34', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('407', '武清区', '2', '2,34', '3', '14', null, null, null);
INSERT INTO `sys_area` VALUES ('408', '宝坻区', '2', '2,34', '3', '15', null, null, null);
INSERT INTO `sys_area` VALUES ('409', '宁河县', '2', '2,35', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('410', '静海县', '2', '2,35', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('411', '蓟县', '2', '2,35', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('412', '市辖区', '36', '3,36', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('413', '长安区', '36', '3,36', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('414', '桥东区', '36', '3,36', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('415', '桥西区', '36', '3,36', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('416', '新华区', '36', '3,36', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('417', '井陉矿区', '36', '3,36', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('418', '裕华区', '36', '3,36', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('419', '井陉县', '36', '3,36', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('420', '正定县', '36', '3,36', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('421', '栾城县', '36', '3,36', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('422', '行唐县', '36', '3,36', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('423', '灵寿县', '36', '3,36', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('424', '高邑县', '36', '3,36', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('425', '深泽县', '36', '3,36', '3', '14', null, null, null);
INSERT INTO `sys_area` VALUES ('426', '赞皇县', '36', '3,36', '3', '15', null, null, null);
INSERT INTO `sys_area` VALUES ('427', '无极县', '36', '3,36', '3', '16', null, null, null);
INSERT INTO `sys_area` VALUES ('428', '平山县', '36', '3,36', '3', '17', null, null, null);
INSERT INTO `sys_area` VALUES ('429', '元氏县', '36', '3,36', '3', '18', null, null, null);
INSERT INTO `sys_area` VALUES ('430', '赵县', '36', '3,36', '3', '19', null, null, null);
INSERT INTO `sys_area` VALUES ('431', '辛集市', '36', '3,36', '3', '20', null, null, null);
INSERT INTO `sys_area` VALUES ('432', '藁城市', '36', '3,36', '3', '21', null, null, null);
INSERT INTO `sys_area` VALUES ('433', '晋州市', '36', '3,36', '3', '22', null, null, null);
INSERT INTO `sys_area` VALUES ('434', '新乐市', '36', '3,36', '3', '23', null, null, null);
INSERT INTO `sys_area` VALUES ('435', '鹿泉市', '36', '3,36', '3', '24', null, null, null);
INSERT INTO `sys_area` VALUES ('436', '市辖区', '37', '3,37', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('437', '路南区', '37', '3,37', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('438', '路北区', '37', '3,37', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('439', '古冶区', '37', '3,37', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('440', '开平区', '37', '3,37', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('441', '丰南区', '37', '3,37', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('442', '丰润区', '37', '3,37', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('443', '滦县', '37', '3,37', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('444', '滦南县', '37', '3,37', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('445', '乐亭县', '37', '3,37', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('446', '迁西县', '37', '3,37', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('447', '玉田县', '37', '3,37', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('448', '唐海县', '37', '3,37', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('449', '遵化市', '37', '3,37', '3', '14', null, null, null);
INSERT INTO `sys_area` VALUES ('450', '迁安市', '37', '3,37', '3', '15', null, null, null);
INSERT INTO `sys_area` VALUES ('451', '市辖区', '38', '3,38', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('452', '海港区', '38', '3,38', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('453', '山海关区', '38', '3,38', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('454', '北戴河区', '38', '3,38', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('455', '青龙满族自治县', '38', '3,38', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('456', '昌黎县', '38', '3,38', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('457', '抚宁县', '38', '3,38', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('458', '卢龙县', '38', '3,38', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('459', '市辖区', '39', '3,39', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('460', '邯山区', '39', '3,39', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('461', '丛台区', '39', '3,39', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('462', '复兴区', '39', '3,39', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('463', '峰峰矿区', '39', '3,39', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('464', '邯郸县', '39', '3,39', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('465', '临漳县', '39', '3,39', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('466', '成安县', '39', '3,39', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('467', '大名县', '39', '3,39', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('468', '涉县', '39', '3,39', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('469', '磁县', '39', '3,39', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('470', '肥乡县', '39', '3,39', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('471', '永年县', '39', '3,39', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('472', '邱县', '39', '3,39', '3', '14', null, null, null);
INSERT INTO `sys_area` VALUES ('473', '鸡泽县', '39', '3,39', '3', '15', null, null, null);
INSERT INTO `sys_area` VALUES ('474', '广平县', '39', '3,39', '3', '16', null, null, null);
INSERT INTO `sys_area` VALUES ('475', '馆陶县', '39', '3,39', '3', '17', null, null, null);
INSERT INTO `sys_area` VALUES ('476', '魏县', '39', '3,39', '3', '18', null, null, null);
INSERT INTO `sys_area` VALUES ('477', '曲周县', '39', '3,39', '3', '19', null, null, null);
INSERT INTO `sys_area` VALUES ('478', '武安市', '39', '3,39', '3', '20', null, null, null);
INSERT INTO `sys_area` VALUES ('479', '市辖区', '40', '3,40', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('480', '桥东区', '40', '3,40', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('481', '桥西区', '40', '3,40', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('482', '邢台县', '40', '3,40', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('483', '临城县', '40', '3,40', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('484', '内丘县', '40', '3,40', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('485', '柏乡县', '40', '3,40', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('486', '隆尧县', '40', '3,40', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('487', '任县', '40', '3,40', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('488', '南和县', '40', '3,40', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('489', '宁晋县', '40', '3,40', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('490', '巨鹿县', '40', '3,40', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('491', '新河县', '40', '3,40', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('492', '广宗县', '40', '3,40', '3', '14', null, null, null);
INSERT INTO `sys_area` VALUES ('493', '平乡县', '40', '3,40', '3', '15', null, null, null);
INSERT INTO `sys_area` VALUES ('494', '威县', '40', '3,40', '3', '16', null, null, null);
INSERT INTO `sys_area` VALUES ('495', '清河县', '40', '3,40', '3', '17', null, null, null);
INSERT INTO `sys_area` VALUES ('496', '临西县', '40', '3,40', '3', '18', null, null, null);
INSERT INTO `sys_area` VALUES ('497', '南宫市', '40', '3,40', '3', '19', null, null, null);
INSERT INTO `sys_area` VALUES ('498', '沙河市', '40', '3,40', '3', '20', null, null, null);
INSERT INTO `sys_area` VALUES ('499', '市辖区', '41', '3,41', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('500', '新市区', '41', '3,41', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('501', '北市区', '41', '3,41', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('502', '南市区', '41', '3,41', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('503', '满城县', '41', '3,41', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('504', '清苑县', '41', '3,41', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('505', '涞水县', '41', '3,41', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('506', '阜平县', '41', '3,41', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('507', '徐水县', '41', '3,41', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('508', '定兴县', '41', '3,41', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('509', '唐县', '41', '3,41', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('510', '高阳县', '41', '3,41', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('511', '容城县', '41', '3,41', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('512', '涞源县', '41', '3,41', '3', '14', null, null, null);
INSERT INTO `sys_area` VALUES ('513', '望都县', '41', '3,41', '3', '15', null, null, null);
INSERT INTO `sys_area` VALUES ('514', '安新县', '41', '3,41', '3', '16', null, null, null);
INSERT INTO `sys_area` VALUES ('515', '易县', '41', '3,41', '3', '17', null, null, null);
INSERT INTO `sys_area` VALUES ('516', '曲阳县', '41', '3,41', '3', '18', null, null, null);
INSERT INTO `sys_area` VALUES ('517', '蠡县', '41', '3,41', '3', '19', null, null, null);
INSERT INTO `sys_area` VALUES ('518', '顺平县', '41', '3,41', '3', '20', null, null, null);
INSERT INTO `sys_area` VALUES ('519', '博野县', '41', '3,41', '3', '21', null, null, null);
INSERT INTO `sys_area` VALUES ('520', '雄县', '41', '3,41', '3', '22', null, null, null);
INSERT INTO `sys_area` VALUES ('521', '涿州市', '41', '3,41', '3', '23', null, null, null);
INSERT INTO `sys_area` VALUES ('522', '定州市', '41', '3,41', '3', '24', null, null, null);
INSERT INTO `sys_area` VALUES ('523', '安国市', '41', '3,41', '3', '25', null, null, null);
INSERT INTO `sys_area` VALUES ('524', '高碑店市', '41', '3,41', '3', '26', null, null, null);
INSERT INTO `sys_area` VALUES ('525', '市辖区', '42', '3,42', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('526', '桥东区', '42', '3,42', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('527', '桥西区', '42', '3,42', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('528', '宣化区', '42', '3,42', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('529', '下花园区', '42', '3,42', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('530', '宣化县', '42', '3,42', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('531', '张北县', '42', '3,42', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('532', '康保县', '42', '3,42', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('533', '沽源县', '42', '3,42', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('534', '尚义县', '42', '3,42', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('535', '蔚县', '42', '3,42', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('536', '阳原县', '42', '3,42', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('537', '怀安县', '42', '3,42', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('538', '万全县', '42', '3,42', '3', '14', null, null, null);
INSERT INTO `sys_area` VALUES ('539', '怀来县', '42', '3,42', '3', '15', null, null, null);
INSERT INTO `sys_area` VALUES ('540', '涿鹿县', '42', '3,42', '3', '16', null, null, null);
INSERT INTO `sys_area` VALUES ('541', '赤城县', '42', '3,42', '3', '17', null, null, null);
INSERT INTO `sys_area` VALUES ('542', '崇礼县', '42', '3,42', '3', '18', null, null, null);
INSERT INTO `sys_area` VALUES ('543', '市辖区', '43', '3,43', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('544', '双桥区', '43', '3,43', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('545', '双滦区', '43', '3,43', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('546', '鹰手营子矿区', '43', '3,43', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('547', '承德县', '43', '3,43', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('548', '兴隆县', '43', '3,43', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('549', '平泉县', '43', '3,43', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('550', '滦平县', '43', '3,43', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('551', '隆化县', '43', '3,43', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('552', '丰宁满族自治县', '43', '3,43', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('553', '宽城满族自治县', '43', '3,43', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('554', '围场满族蒙古族自治县', '43', '3,43', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('555', '市辖区', '44', '3,44', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('556', '新华区', '44', '3,44', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('557', '运河区', '44', '3,44', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('558', '沧县', '44', '3,44', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('559', '青县', '44', '3,44', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('560', '东光县', '44', '3,44', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('561', '海兴县', '44', '3,44', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('562', '盐山县', '44', '3,44', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('563', '肃宁县', '44', '3,44', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('564', '南皮县', '44', '3,44', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('565', '吴桥县', '44', '3,44', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('566', '献县', '44', '3,44', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('567', '孟村回族自治县', '44', '3,44', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('568', '泊头市', '44', '3,44', '3', '14', null, null, null);
INSERT INTO `sys_area` VALUES ('569', '任丘市', '44', '3,44', '3', '15', null, null, null);
INSERT INTO `sys_area` VALUES ('570', '黄骅市', '44', '3,44', '3', '16', null, null, null);
INSERT INTO `sys_area` VALUES ('571', '河间市', '44', '3,44', '3', '17', null, null, null);
INSERT INTO `sys_area` VALUES ('572', '市辖区', '45', '3,45', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('573', '安次区', '45', '3,45', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('574', '广阳区', '45', '3,45', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('575', '固安县', '45', '3,45', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('576', '永清县', '45', '3,45', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('577', '香河县', '45', '3,45', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('578', '大城县', '45', '3,45', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('579', '文安县', '45', '3,45', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('580', '大厂回族自治县', '45', '3,45', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('581', '霸州市', '45', '3,45', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('582', '三河市', '45', '3,45', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('583', '市辖区', '46', '3,46', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('584', '桃城区', '46', '3,46', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('585', '枣强县', '46', '3,46', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('586', '武邑县', '46', '3,46', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('587', '武强县', '46', '3,46', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('588', '饶阳县', '46', '3,46', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('589', '安平县', '46', '3,46', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('590', '故城县', '46', '3,46', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('591', '景县', '46', '3,46', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('592', '阜城县', '46', '3,46', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('593', '冀州市', '46', '3,46', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('594', '深州市', '46', '3,46', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('595', '市辖区', '47', '4,47', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('596', '小店区', '47', '4,47', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('597', '迎泽区', '47', '4,47', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('598', '杏花岭区', '47', '4,47', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('599', '尖草坪区', '47', '4,47', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('600', '万柏林区', '47', '4,47', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('601', '晋源区', '47', '4,47', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('602', '清徐县', '47', '4,47', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('603', '阳曲县', '47', '4,47', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('604', '娄烦县', '47', '4,47', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('605', '古交市', '47', '4,47', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('606', '市辖区', '48', '4,48', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('607', '城区', '48', '4,48', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('608', '矿区', '48', '4,48', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('609', '南郊区', '48', '4,48', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('610', '新荣区', '48', '4,48', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('611', '阳高县', '48', '4,48', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('612', '天镇县', '48', '4,48', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('613', '广灵县', '48', '4,48', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('614', '灵丘县', '48', '4,48', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('615', '浑源县', '48', '4,48', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('616', '左云县', '48', '4,48', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('617', '大同县', '48', '4,48', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('618', '市辖区', '49', '4,49', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('619', '城区', '49', '4,49', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('620', '矿区', '49', '4,49', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('621', '郊区', '49', '4,49', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('622', '平定县', '49', '4,49', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('623', '盂县', '49', '4,49', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('624', '市辖区', '50', '4,50', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('625', '城区', '50', '4,50', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('626', '郊区', '50', '4,50', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('627', '长治县', '50', '4,50', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('628', '襄垣县', '50', '4,50', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('629', '屯留县', '50', '4,50', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('630', '平顺县', '50', '4,50', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('631', '黎城县', '50', '4,50', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('632', '壶关县', '50', '4,50', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('633', '长子县', '50', '4,50', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('634', '武乡县', '50', '4,50', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('635', '沁县', '50', '4,50', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('636', '沁源县', '50', '4,50', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('637', '潞城市', '50', '4,50', '3', '14', null, null, null);
INSERT INTO `sys_area` VALUES ('638', '市辖区', '51', '4,51', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('639', '城区', '51', '4,51', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('640', '沁水县', '51', '4,51', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('641', '阳城县', '51', '4,51', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('642', '陵川县', '51', '4,51', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('643', '泽州县', '51', '4,51', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('644', '高平市', '51', '4,51', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('645', '市辖区', '52', '4,52', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('646', '朔城区', '52', '4,52', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('647', '平鲁区', '52', '4,52', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('648', '山阴县', '52', '4,52', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('649', '应县', '52', '4,52', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('650', '右玉县', '52', '4,52', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('651', '怀仁县', '52', '4,52', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('652', '市辖区', '53', '4,53', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('653', '榆次区', '53', '4,53', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('654', '榆社县', '53', '4,53', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('655', '左权县', '53', '4,53', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('656', '和顺县', '53', '4,53', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('657', '昔阳县', '53', '4,53', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('658', '寿阳县', '53', '4,53', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('659', '太谷县', '53', '4,53', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('660', '祁县', '53', '4,53', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('661', '平遥县', '53', '4,53', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('662', '灵石县', '53', '4,53', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('663', '介休市', '53', '4,53', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('664', '市辖区', '54', '4,54', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('665', '盐湖区', '54', '4,54', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('666', '临猗县', '54', '4,54', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('667', '万荣县', '54', '4,54', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('668', '闻喜县', '54', '4,54', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('669', '稷山县', '54', '4,54', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('670', '新绛县', '54', '4,54', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('671', '绛县', '54', '4,54', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('672', '垣曲县', '54', '4,54', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('673', '夏县', '54', '4,54', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('674', '平陆县', '54', '4,54', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('675', '芮城县', '54', '4,54', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('676', '永济市', '54', '4,54', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('677', '河津市', '54', '4,54', '3', '14', null, null, null);
INSERT INTO `sys_area` VALUES ('678', '市辖区', '55', '4,55', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('679', '忻府区', '55', '4,55', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('680', '定襄县', '55', '4,55', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('681', '五台县', '55', '4,55', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('682', '代县', '55', '4,55', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('683', '繁峙县', '55', '4,55', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('684', '宁武县', '55', '4,55', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('685', '静乐县', '55', '4,55', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('686', '神池县', '55', '4,55', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('687', '五寨县', '55', '4,55', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('688', '岢岚县', '55', '4,55', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('689', '河曲县', '55', '4,55', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('690', '保德县', '55', '4,55', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('691', '偏关县', '55', '4,55', '3', '14', null, null, null);
INSERT INTO `sys_area` VALUES ('692', '原平市', '55', '4,55', '3', '15', null, null, null);
INSERT INTO `sys_area` VALUES ('693', '市辖区', '56', '4,56', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('694', '尧都区', '56', '4,56', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('695', '曲沃县', '56', '4,56', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('696', '翼城县', '56', '4,56', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('697', '襄汾县', '56', '4,56', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('698', '洪洞县', '56', '4,56', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('699', '古县', '56', '4,56', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('700', '安泽县', '56', '4,56', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('701', '浮山县', '56', '4,56', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('702', '吉县', '56', '4,56', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('703', '乡宁县', '56', '4,56', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('704', '大宁县', '56', '4,56', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('705', '隰县', '56', '4,56', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('706', '永和县', '56', '4,56', '3', '14', null, null, null);
INSERT INTO `sys_area` VALUES ('707', '蒲县', '56', '4,56', '3', '15', null, null, null);
INSERT INTO `sys_area` VALUES ('708', '汾西县', '56', '4,56', '3', '16', null, null, null);
INSERT INTO `sys_area` VALUES ('709', '侯马市', '56', '4,56', '3', '17', null, null, null);
INSERT INTO `sys_area` VALUES ('710', '霍州市', '56', '4,56', '3', '18', null, null, null);
INSERT INTO `sys_area` VALUES ('711', '市辖区', '57', '4,57', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('712', '离石区', '57', '4,57', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('713', '文水县', '57', '4,57', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('714', '交城县', '57', '4,57', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('715', '兴县', '57', '4,57', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('716', '临县', '57', '4,57', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('717', '柳林县', '57', '4,57', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('718', '石楼县', '57', '4,57', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('719', '岚县', '57', '4,57', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('720', '方山县', '57', '4,57', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('721', '中阳县', '57', '4,57', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('722', '交口县', '57', '4,57', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('723', '孝义市', '57', '4,57', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('724', '汾阳市', '57', '4,57', '3', '14', null, null, null);
INSERT INTO `sys_area` VALUES ('725', '市辖区', '58', '5,58', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('726', '新城区', '58', '5,58', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('727', '回民区', '58', '5,58', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('728', '玉泉区', '58', '5,58', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('729', '赛罕区', '58', '5,58', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('730', '土默特左旗', '58', '5,58', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('731', '托克托县', '58', '5,58', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('732', '和林格尔县', '58', '5,58', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('733', '清水河县', '58', '5,58', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('734', '武川县', '58', '5,58', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('735', '市辖区', '59', '5,59', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('736', '东河区', '59', '5,59', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('737', '昆都仑区', '59', '5,59', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('738', '青山区', '59', '5,59', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('739', '石拐区', '59', '5,59', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('740', '白云矿区', '59', '5,59', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('741', '九原区', '59', '5,59', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('742', '土默特右旗', '59', '5,59', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('743', '固阳县', '59', '5,59', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('744', '达尔罕茂明安联合旗', '59', '5,59', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('745', '市辖区', '60', '5,60', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('746', '海勃湾区', '60', '5,60', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('747', '海南区', '60', '5,60', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('748', '乌达区', '60', '5,60', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('749', '市辖区', '61', '5,61', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('750', '红山区', '61', '5,61', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('751', '元宝山区', '61', '5,61', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('752', '松山区', '61', '5,61', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('753', '阿鲁科尔沁旗', '61', '5,61', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('754', '巴林左旗', '61', '5,61', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('755', '巴林右旗', '61', '5,61', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('756', '林西县', '61', '5,61', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('757', '克什克腾旗', '61', '5,61', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('758', '翁牛特旗', '61', '5,61', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('759', '喀喇沁旗', '61', '5,61', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('760', '宁城县', '61', '5,61', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('761', '敖汉旗', '61', '5,61', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('762', '市辖区', '62', '5,62', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('763', '科尔沁区', '62', '5,62', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('764', '科尔沁左翼中旗', '62', '5,62', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('765', '科尔沁左翼后旗', '62', '5,62', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('766', '开鲁县', '62', '5,62', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('767', '库伦旗', '62', '5,62', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('768', '奈曼旗', '62', '5,62', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('769', '扎鲁特旗', '62', '5,62', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('770', '霍林郭勒市', '62', '5,62', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('771', '东胜区', '63', '5,63', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('772', '达拉特旗', '63', '5,63', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('773', '准格尔旗', '63', '5,63', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('774', '鄂托克前旗', '63', '5,63', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('775', '鄂托克旗', '63', '5,63', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('776', '杭锦旗', '63', '5,63', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('777', '乌审旗', '63', '5,63', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('778', '伊金霍洛旗', '63', '5,63', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('779', '市辖区', '64', '5,64', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('780', '海拉尔区', '64', '5,64', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('781', '阿荣旗', '64', '5,64', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('782', '莫力达瓦达斡尔族自治旗', '64', '5,64', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('783', '鄂伦春自治旗', '64', '5,64', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('784', '鄂温克族自治旗', '64', '5,64', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('785', '陈巴尔虎旗', '64', '5,64', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('786', '新巴尔虎左旗', '64', '5,64', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('787', '新巴尔虎右旗', '64', '5,64', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('788', '满洲里市', '64', '5,64', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('789', '牙克石市', '64', '5,64', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('790', '扎兰屯市', '64', '5,64', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('791', '额尔古纳市', '64', '5,64', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('792', '根河市', '64', '5,64', '3', '14', null, null, null);
INSERT INTO `sys_area` VALUES ('793', '市辖区', '65', '5,65', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('794', '临河区', '65', '5,65', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('795', '五原县', '65', '5,65', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('796', '磴口县', '65', '5,65', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('797', '乌拉特前旗', '65', '5,65', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('798', '乌拉特中旗', '65', '5,65', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('799', '乌拉特后旗', '65', '5,65', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('800', '杭锦后旗', '65', '5,65', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('801', '市辖区', '66', '5,66', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('802', '集宁区', '66', '5,66', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('803', '卓资县', '66', '5,66', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('804', '化德县', '66', '5,66', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('805', '商都县', '66', '5,66', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('806', '兴和县', '66', '5,66', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('807', '凉城县', '66', '5,66', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('808', '察哈尔右翼前旗', '66', '5,66', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('809', '察哈尔右翼中旗', '66', '5,66', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('810', '察哈尔右翼后旗', '66', '5,66', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('811', '四子王旗', '66', '5,66', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('812', '丰镇市', '66', '5,66', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('813', '乌兰浩特市', '67', '5,67', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('814', '阿尔山市', '67', '5,67', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('815', '科尔沁右翼前旗', '67', '5,67', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('816', '科尔沁右翼中旗', '67', '5,67', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('817', '扎赉特旗', '67', '5,67', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('818', '突泉县', '67', '5,67', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('819', '二连浩特市', '68', '5,68', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('820', '锡林浩特市', '68', '5,68', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('821', '阿巴嘎旗', '68', '5,68', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('822', '苏尼特左旗', '68', '5,68', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('823', '苏尼特右旗', '68', '5,68', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('824', '东乌珠穆沁旗', '68', '5,68', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('825', '西乌珠穆沁旗', '68', '5,68', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('826', '太仆寺旗', '68', '5,68', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('827', '镶黄旗', '68', '5,68', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('828', '正镶白旗', '68', '5,68', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('829', '正蓝旗', '68', '5,68', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('830', '多伦县', '68', '5,68', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('831', '阿拉善左旗', '69', '5,69', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('832', '阿拉善右旗', '69', '5,69', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('833', '额济纳旗', '69', '5,69', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('834', '市辖区', '70', '6,70', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('835', '和平区', '70', '6,70', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('836', '沈河区', '70', '6,70', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('837', '大东区', '70', '6,70', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('838', '皇姑区', '70', '6,70', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('839', '铁西区', '70', '6,70', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('840', '苏家屯区', '70', '6,70', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('841', '东陵区', '70', '6,70', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('842', '新城子区', '70', '6,70', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('843', '于洪区', '70', '6,70', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('844', '辽中县', '70', '6,70', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('845', '康平县', '70', '6,70', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('846', '法库县', '70', '6,70', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('847', '新民市', '70', '6,70', '3', '14', null, null, null);
INSERT INTO `sys_area` VALUES ('848', '市辖区', '71', '6,71', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('849', '中山区', '71', '6,71', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('850', '西岗区', '71', '6,71', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('851', '沙河口区', '71', '6,71', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('852', '甘井子区', '71', '6,71', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('853', '旅顺口区', '71', '6,71', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('854', '金州区', '71', '6,71', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('855', '长海县', '71', '6,71', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('856', '瓦房店市', '71', '6,71', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('857', '普兰店市', '71', '6,71', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('858', '庄河市', '71', '6,71', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('859', '市辖区', '72', '6,72', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('860', '铁东区', '72', '6,72', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('861', '铁西区', '72', '6,72', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('862', '立山区', '72', '6,72', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('863', '千山区', '72', '6,72', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('864', '台安县', '72', '6,72', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('865', '岫岩满族自治县', '72', '6,72', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('866', '海城市', '72', '6,72', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('867', '市辖区', '73', '6,73', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('868', '新抚区', '73', '6,73', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('869', '东洲区', '73', '6,73', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('870', '望花区', '73', '6,73', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('871', '顺城区', '73', '6,73', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('872', '抚顺县', '73', '6,73', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('873', '新宾满族自治县', '73', '6,73', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('874', '清原满族自治县', '73', '6,73', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('875', '市辖区', '74', '6,74', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('876', '平山区', '74', '6,74', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('877', '溪湖区', '74', '6,74', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('878', '明山区', '74', '6,74', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('879', '南芬区', '74', '6,74', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('880', '本溪满族自治县', '74', '6,74', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('881', '桓仁满族自治县', '74', '6,74', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('882', '市辖区', '75', '6,75', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('883', '元宝区', '75', '6,75', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('884', '振兴区', '75', '6,75', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('885', '振安区', '75', '6,75', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('886', '宽甸满族自治县', '75', '6,75', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('887', '东港市', '75', '6,75', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('888', '凤城市', '75', '6,75', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('889', '市辖区', '76', '6,76', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('890', '古塔区', '76', '6,76', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('891', '凌河区', '76', '6,76', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('892', '太和区', '76', '6,76', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('893', '黑山县', '76', '6,76', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('894', '义县', '76', '6,76', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('895', '凌海市', '76', '6,76', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('896', '北宁市', '76', '6,76', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('897', '市辖区', '77', '6,77', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('898', '站前区', '77', '6,77', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('899', '西市区', '77', '6,77', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('900', '鲅鱼圈区', '77', '6,77', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('901', '老边区', '77', '6,77', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('902', '盖州市', '77', '6,77', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('903', '大石桥市', '77', '6,77', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('904', '市辖区', '78', '6,78', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('905', '海州区', '78', '6,78', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('906', '新邱区', '78', '6,78', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('907', '太平区', '78', '6,78', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('908', '清河门区', '78', '6,78', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('909', '细河区', '78', '6,78', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('910', '阜新蒙古族自治县', '78', '6,78', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('911', '彰武县', '78', '6,78', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('912', '市辖区', '79', '6,79', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('913', '白塔区', '79', '6,79', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('914', '文圣区', '79', '6,79', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('915', '宏伟区', '79', '6,79', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('916', '弓长岭区', '79', '6,79', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('917', '太子河区', '79', '6,79', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('918', '辽阳县', '79', '6,79', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('919', '灯塔市', '79', '6,79', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('920', '市辖区', '80', '6,80', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('921', '双台子区', '80', '6,80', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('922', '兴隆台区', '80', '6,80', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('923', '大洼县', '80', '6,80', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('924', '盘山县', '80', '6,80', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('925', '市辖区', '81', '6,81', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('926', '银州区', '81', '6,81', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('927', '清河区', '81', '6,81', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('928', '铁岭县', '81', '6,81', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('929', '西丰县', '81', '6,81', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('930', '昌图县', '81', '6,81', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('931', '调兵山市', '81', '6,81', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('932', '开原市', '81', '6,81', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('933', '市辖区', '82', '6,82', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('934', '双塔区', '82', '6,82', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('935', '龙城区', '82', '6,82', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('936', '朝阳县', '82', '6,82', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('937', '建平县', '82', '6,82', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('938', '喀喇沁左翼蒙古族自治县', '82', '6,82', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('939', '北票市', '82', '6,82', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('940', '凌源市', '82', '6,82', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('941', '市辖区', '83', '6,83', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('942', '连山区', '83', '6,83', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('943', '龙港区', '83', '6,83', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('944', '南票区', '83', '6,83', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('945', '绥中县', '83', '6,83', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('946', '建昌县', '83', '6,83', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('947', '兴城市', '83', '6,83', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('948', '市辖区', '84', '7,84', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('949', '南关区', '84', '7,84', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('950', '宽城区', '84', '7,84', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('951', '朝阳区', '84', '7,84', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('952', '二道区', '84', '7,84', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('953', '绿园区', '84', '7,84', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('954', '双阳区', '84', '7,84', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('955', '农安县', '84', '7,84', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('956', '九台市', '84', '7,84', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('957', '榆树市', '84', '7,84', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('958', '德惠市', '84', '7,84', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('959', '市辖区', '85', '7,85', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('960', '昌邑区', '85', '7,85', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('961', '龙潭区', '85', '7,85', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('962', '船营区', '85', '7,85', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('963', '丰满区', '85', '7,85', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('964', '永吉县', '85', '7,85', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('965', '蛟河市', '85', '7,85', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('966', '桦甸市', '85', '7,85', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('967', '舒兰市', '85', '7,85', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('968', '磐石市', '85', '7,85', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('969', '市辖区', '86', '7,86', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('970', '铁西区', '86', '7,86', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('971', '铁东区', '86', '7,86', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('972', '梨树县', '86', '7,86', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('973', '伊通满族自治县', '86', '7,86', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('974', '公主岭市', '86', '7,86', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('975', '双辽市', '86', '7,86', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('976', '市辖区', '87', '7,87', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('977', '龙山区', '87', '7,87', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('978', '西安区', '87', '7,87', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('979', '东丰县', '87', '7,87', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('980', '东辽县', '87', '7,87', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('981', '市辖区', '88', '7,88', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('982', '东昌区', '88', '7,88', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('983', '二道江区', '88', '7,88', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('984', '通化县', '88', '7,88', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('985', '辉南县', '88', '7,88', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('986', '柳河县', '88', '7,88', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('987', '梅河口市', '88', '7,88', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('988', '集安市', '88', '7,88', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('989', '市辖区', '89', '7,89', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('990', '八道江区', '89', '7,89', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('991', '抚松县', '89', '7,89', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('992', '靖宇县', '89', '7,89', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('993', '长白朝鲜族自治县', '89', '7,89', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('994', '江源县', '89', '7,89', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('995', '临江市', '89', '7,89', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('996', '市辖区', '90', '7,90', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('997', '宁江区', '90', '7,90', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('998', '前郭尔罗斯蒙古族自治县', '90', '7,90', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('999', '长岭县', '90', '7,90', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1000', '乾安县', '90', '7,90', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1001', '扶余县', '90', '7,90', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1002', '市辖区', '91', '7,91', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1003', '洮北区', '91', '7,91', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1004', '镇赉县', '91', '7,91', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1005', '通榆县', '91', '7,91', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1006', '洮南市', '91', '7,91', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1007', '大安市', '91', '7,91', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1008', '延吉市', '92', '7,92', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1009', '图们市', '92', '7,92', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1010', '敦化市', '92', '7,92', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1011', '珲春市', '92', '7,92', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1012', '龙井市', '92', '7,92', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1013', '和龙市', '92', '7,92', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1014', '汪清县', '92', '7,92', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1015', '安图县', '92', '7,92', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1016', '市辖区', '93', '8,93', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1017', '道里区', '93', '8,93', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1018', '南岗区', '93', '8,93', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1019', '道外区', '93', '8,93', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1020', '香坊区', '93', '8,93', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1021', '动力区', '93', '8,93', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1022', '平房区', '93', '8,93', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1023', '松北区', '93', '8,93', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1024', '呼兰区', '93', '8,93', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('1025', '依兰县', '93', '8,93', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('1026', '方正县', '93', '8,93', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('1027', '宾县', '93', '8,93', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('1028', '巴彦县', '93', '8,93', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('1029', '木兰县', '93', '8,93', '3', '14', null, null, null);
INSERT INTO `sys_area` VALUES ('1030', '通河县', '93', '8,93', '3', '15', null, null, null);
INSERT INTO `sys_area` VALUES ('1031', '延寿县', '93', '8,93', '3', '16', null, null, null);
INSERT INTO `sys_area` VALUES ('1032', '阿城市', '93', '8,93', '3', '17', null, null, null);
INSERT INTO `sys_area` VALUES ('1033', '双城市', '93', '8,93', '3', '18', null, null, null);
INSERT INTO `sys_area` VALUES ('1034', '尚志市', '93', '8,93', '3', '19', null, null, null);
INSERT INTO `sys_area` VALUES ('1035', '五常市', '93', '8,93', '3', '20', null, null, null);
INSERT INTO `sys_area` VALUES ('1036', '市辖区', '94', '8,94', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1037', '龙沙区', '94', '8,94', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1038', '建华区', '94', '8,94', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1039', '铁锋区', '94', '8,94', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1040', '昂昂溪区', '94', '8,94', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1041', '富拉尔基区', '94', '8,94', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1042', '碾子山区', '94', '8,94', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1043', '梅里斯达斡尔族区', '94', '8,94', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1044', '龙江县', '94', '8,94', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('1045', '依安县', '94', '8,94', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('1046', '泰来县', '94', '8,94', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('1047', '甘南县', '94', '8,94', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('1048', '富裕县', '94', '8,94', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('1049', '克山县', '94', '8,94', '3', '14', null, null, null);
INSERT INTO `sys_area` VALUES ('1050', '克东县', '94', '8,94', '3', '15', null, null, null);
INSERT INTO `sys_area` VALUES ('1051', '拜泉县', '94', '8,94', '3', '16', null, null, null);
INSERT INTO `sys_area` VALUES ('1052', '讷河市', '94', '8,94', '3', '17', null, null, null);
INSERT INTO `sys_area` VALUES ('1053', '市辖区', '95', '8,95', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1054', '鸡冠区', '95', '8,95', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1055', '恒山区', '95', '8,95', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1056', '滴道区', '95', '8,95', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1057', '梨树区', '95', '8,95', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1058', '城子河区', '95', '8,95', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1059', '麻山区', '95', '8,95', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1060', '鸡东县', '95', '8,95', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1061', '虎林市', '95', '8,95', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('1062', '密山市', '95', '8,95', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('1063', '市辖区', '96', '8,96', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1064', '向阳区', '96', '8,96', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1065', '工农区', '96', '8,96', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1066', '南山区', '96', '8,96', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1067', '兴安区', '96', '8,96', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1068', '东山区', '96', '8,96', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1069', '兴山区', '96', '8,96', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1070', '萝北县', '96', '8,96', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1071', '绥滨县', '96', '8,96', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('1072', '市辖区', '97', '8,97', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1073', '尖山区', '97', '8,97', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1074', '岭东区', '97', '8,97', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1075', '四方台区', '97', '8,97', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1076', '宝山区', '97', '8,97', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1077', '集贤县', '97', '8,97', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1078', '友谊县', '97', '8,97', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1079', '宝清县', '97', '8,97', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1080', '饶河县', '97', '8,97', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('1081', '市辖区', '98', '8,98', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1082', '萨尔图区', '98', '8,98', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1083', '龙凤区', '98', '8,98', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1084', '让胡路区', '98', '8,98', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1085', '红岗区', '98', '8,98', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1086', '大同区', '98', '8,98', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1087', '肇州县', '98', '8,98', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1088', '肇源县', '98', '8,98', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1089', '林甸县', '98', '8,98', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('1090', '杜尔伯特蒙古族自治县', '98', '8,98', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('1091', '市辖区', '99', '8,99', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1092', '伊春区', '99', '8,99', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1093', '南岔区', '99', '8,99', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1094', '友好区', '99', '8,99', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1095', '西林区', '99', '8,99', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1096', '翠峦区', '99', '8,99', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1097', '新青区', '99', '8,99', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1098', '美溪区', '99', '8,99', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1099', '金山屯区', '99', '8,99', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('1100', '五营区', '99', '8,99', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('1101', '乌马河区', '99', '8,99', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('1102', '汤旺河区', '99', '8,99', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('1103', '带岭区', '99', '8,99', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('1104', '乌伊岭区', '99', '8,99', '3', '14', null, null, null);
INSERT INTO `sys_area` VALUES ('1105', '红星区', '99', '8,99', '3', '15', null, null, null);
INSERT INTO `sys_area` VALUES ('1106', '上甘岭区', '99', '8,99', '3', '16', null, null, null);
INSERT INTO `sys_area` VALUES ('1107', '嘉荫县', '99', '8,99', '3', '17', null, null, null);
INSERT INTO `sys_area` VALUES ('1108', '铁力市', '99', '8,99', '3', '18', null, null, null);
INSERT INTO `sys_area` VALUES ('1109', '市辖区', '100', '8,100', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1110', '永红区', '100', '8,100', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1111', '向阳区', '100', '8,100', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1112', '前进区', '100', '8,100', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1113', '东风区', '100', '8,100', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1114', '郊区', '100', '8,100', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1115', '桦南县', '100', '8,100', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1116', '桦川县', '100', '8,100', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1117', '汤原县', '100', '8,100', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('1118', '抚远县', '100', '8,100', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('1119', '同江市', '100', '8,100', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('1120', '富锦市', '100', '8,100', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('1121', '市辖区', '101', '8,101', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1122', '新兴区', '101', '8,101', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1123', '桃山区', '101', '8,101', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1124', '茄子河区', '101', '8,101', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1125', '勃利县', '101', '8,101', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1126', '市辖区', '102', '8,102', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1127', '东安区', '102', '8,102', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1128', '阳明区', '102', '8,102', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1129', '爱民区', '102', '8,102', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1130', '西安区', '102', '8,102', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1131', '东宁县', '102', '8,102', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1132', '林口县', '102', '8,102', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1133', '绥芬河市', '102', '8,102', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1134', '海林市', '102', '8,102', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('1135', '宁安市', '102', '8,102', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('1136', '穆棱市', '102', '8,102', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('1137', '市辖区', '103', '8,103', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1138', '爱辉区', '103', '8,103', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1139', '嫩江县', '103', '8,103', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1140', '逊克县', '103', '8,103', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1141', '孙吴县', '103', '8,103', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1142', '北安市', '103', '8,103', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1143', '五大连池市', '103', '8,103', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1144', '市辖区', '104', '8,104', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1145', '北林区', '104', '8,104', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1146', '望奎县', '104', '8,104', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1147', '兰西县', '104', '8,104', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1148', '青冈县', '104', '8,104', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1149', '庆安县', '104', '8,104', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1150', '明水县', '104', '8,104', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1151', '绥棱县', '104', '8,104', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1152', '安达市', '104', '8,104', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('1153', '肇东市', '104', '8,104', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('1154', '海伦市', '104', '8,104', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('1155', '呼玛县', '105', '8,105', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1156', '塔河县', '105', '8,105', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1157', '漠河县', '105', '8,105', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1158', '黄浦区', '106', '9,106', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1159', '卢湾区', '106', '9,106', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1160', '徐汇区', '106', '9,106', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1161', '长宁区', '106', '9,106', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1162', '静安区', '106', '9,106', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1163', '普陀区', '106', '9,106', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1164', '闸北区', '106', '9,106', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1165', '虹口区', '106', '9,106', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1166', '杨浦区', '106', '9,106', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('1167', '闵行区', '106', '9,106', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('1168', '宝山区', '106', '9,106', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('1169', '嘉定区', '106', '9,106', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('1170', '浦东新区', '106', '9,106', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('1171', '金山区', '106', '9,106', '3', '14', null, null, null);
INSERT INTO `sys_area` VALUES ('1172', '松江区', '106', '9,106', '3', '15', null, null, null);
INSERT INTO `sys_area` VALUES ('1173', '青浦区', '106', '9,106', '3', '16', null, null, null);
INSERT INTO `sys_area` VALUES ('1174', '南汇区', '106', '9,106', '3', '17', null, null, null);
INSERT INTO `sys_area` VALUES ('1175', '奉贤区', '106', '9,106', '3', '18', null, null, null);
INSERT INTO `sys_area` VALUES ('1176', '崇明县', '9', '9,107', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1177', '市辖区', '108', '10,108', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1178', '玄武区', '108', '10,108', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1179', '白下区', '108', '10,108', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1180', '秦淮区', '108', '10,108', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1181', '建邺区', '108', '10,108', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1182', '鼓楼区', '108', '10,108', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1183', '下关区', '108', '10,108', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1184', '浦口区', '108', '10,108', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1185', '栖霞区', '108', '10,108', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('1186', '雨花台区', '108', '10,108', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('1187', '江宁区', '108', '10,108', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('1188', '六合区', '108', '10,108', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('1189', '溧水县', '108', '10,108', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('1190', '高淳县', '108', '10,108', '3', '14', null, null, null);
INSERT INTO `sys_area` VALUES ('1191', '市辖区', '109', '10,109', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1192', '崇安区', '109', '10,109', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1193', '南长区', '109', '10,109', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1194', '北塘区', '109', '10,109', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1195', '锡山区', '109', '10,109', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1196', '惠山区', '109', '10,109', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1197', '滨湖区', '109', '10,109', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1198', '江阴市', '109', '10,109', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1199', '宜兴市', '109', '10,109', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('1200', '市辖区', '110', '10,110', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1201', '鼓楼区', '110', '10,110', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1202', '云龙区', '110', '10,110', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1203', '九里区', '110', '10,110', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1204', '贾汪区', '110', '10,110', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1205', '泉山区', '110', '10,110', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1206', '丰县', '110', '10,110', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1207', '沛县', '110', '10,110', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1208', '铜山县', '110', '10,110', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('1209', '睢宁县', '110', '10,110', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('1210', '新沂市', '110', '10,110', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('1211', '邳州市', '110', '10,110', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('1212', '市辖区', '111', '10,111', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1213', '天宁区', '111', '10,111', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1214', '钟楼区', '111', '10,111', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1215', '戚墅堰区', '111', '10,111', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1216', '新北区', '111', '10,111', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1217', '武进区', '111', '10,111', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1218', '溧阳市', '111', '10,111', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1219', '金坛市', '111', '10,111', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1220', '市辖区', '112', '10,112', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1221', '沧浪区', '112', '10,112', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1222', '平江区', '112', '10,112', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1223', '金阊区', '112', '10,112', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1224', '虎丘区', '112', '10,112', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1225', '吴中区', '112', '10,112', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1226', '相城区', '112', '10,112', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1227', '常熟市', '112', '10,112', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1228', '张家港市', '112', '10,112', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('1229', '昆山市', '112', '10,112', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('1230', '吴江市', '112', '10,112', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('1231', '太仓市', '112', '10,112', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('1232', '市辖区', '113', '10,113', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1233', '崇川区', '113', '10,113', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1234', '港闸区', '113', '10,113', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1235', '海安县', '113', '10,113', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1236', '如东县', '113', '10,113', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1237', '启东市', '113', '10,113', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1238', '如皋市', '113', '10,113', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1239', '通州市', '113', '10,113', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1240', '海门市', '113', '10,113', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('1241', '市辖区', '114', '10,114', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1242', '连云区', '114', '10,114', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1243', '新浦区', '114', '10,114', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1244', '海州区', '114', '10,114', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1245', '赣榆县', '114', '10,114', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1246', '东海县', '114', '10,114', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1247', '灌云县', '114', '10,114', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1248', '灌南县', '114', '10,114', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1249', '市辖区', '115', '10,115', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1250', '清河区', '115', '10,115', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1251', '楚州区', '115', '10,115', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1252', '淮阴区', '115', '10,115', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1253', '清浦区', '115', '10,115', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1254', '涟水县', '115', '10,115', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1255', '洪泽县', '115', '10,115', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1256', '盱眙县', '115', '10,115', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1257', '金湖县', '115', '10,115', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('1258', '市辖区', '116', '10,116', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1259', '亭湖区', '116', '10,116', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1260', '盐都区', '116', '10,116', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1261', '响水县', '116', '10,116', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1262', '滨海县', '116', '10,116', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1263', '阜宁县', '116', '10,116', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1264', '射阳县', '116', '10,116', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1265', '建湖县', '116', '10,116', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1266', '东台市', '116', '10,116', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('1267', '大丰市', '116', '10,116', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('1268', '市辖区', '117', '10,117', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1269', '广陵区', '117', '10,117', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1270', '邗江区', '117', '10,117', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1271', '郊区', '117', '10,117', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1272', '宝应县', '117', '10,117', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1273', '仪征市', '117', '10,117', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1274', '高邮市', '117', '10,117', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1275', '江都市', '117', '10,117', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1276', '市辖区', '118', '10,118', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1277', '京口区', '118', '10,118', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1278', '润州区', '118', '10,118', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1279', '丹徒区', '118', '10,118', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1280', '丹阳市', '118', '10,118', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1281', '扬中市', '118', '10,118', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1282', '句容市', '118', '10,118', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1283', '市辖区', '119', '10,119', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1284', '海陵区', '119', '10,119', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1285', '高港区', '119', '10,119', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1286', '兴化市', '119', '10,119', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1287', '靖江市', '119', '10,119', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1288', '泰兴市', '119', '10,119', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1289', '姜堰市', '119', '10,119', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1290', '市辖区', '120', '10,120', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1291', '宿城区', '120', '10,120', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1292', '宿豫区', '120', '10,120', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1293', '沭阳县', '120', '10,120', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1294', '泗阳县', '120', '10,120', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1295', '泗洪县', '120', '10,120', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1296', '市辖区', '121', '11,121', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1297', '上城区', '121', '11,121', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1298', '下城区', '121', '11,121', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1299', '江干区', '121', '11,121', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1300', '拱墅区', '121', '11,121', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1301', '西湖区', '121', '11,121', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1302', '滨江区', '121', '11,121', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1303', '萧山区', '121', '11,121', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1304', '余杭区', '121', '11,121', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('1305', '桐庐县', '121', '11,121', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('1306', '淳安县', '121', '11,121', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('1307', '建德市', '121', '11,121', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('1308', '富阳市', '121', '11,121', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('1309', '临安市', '121', '11,121', '3', '14', null, null, null);
INSERT INTO `sys_area` VALUES ('1310', '市辖区', '122', '11,122', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1311', '海曙区', '122', '11,122', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1312', '江东区', '122', '11,122', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1313', '江北区', '122', '11,122', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1314', '北仑区', '122', '11,122', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1315', '镇海区', '122', '11,122', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1316', '鄞州区', '122', '11,122', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1317', '象山县', '122', '11,122', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1318', '宁海县', '122', '11,122', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('1319', '余姚市', '122', '11,122', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('1320', '慈溪市', '122', '11,122', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('1321', '奉化市', '122', '11,122', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('1322', '市辖区', '123', '11,123', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1323', '鹿城区', '123', '11,123', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1324', '龙湾区', '123', '11,123', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1325', '瓯海区', '123', '11,123', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1326', '洞头县', '123', '11,123', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1327', '永嘉县', '123', '11,123', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1328', '平阳县', '123', '11,123', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1329', '苍南县', '123', '11,123', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1330', '文成县', '123', '11,123', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('1331', '泰顺县', '123', '11,123', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('1332', '瑞安市', '123', '11,123', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('1333', '乐清市', '123', '11,123', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('1334', '市辖区', '124', '11,124', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1335', '秀城区', '124', '11,124', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1336', '秀洲区', '124', '11,124', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1337', '嘉善县', '124', '11,124', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1338', '海盐县', '124', '11,124', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1339', '海宁市', '124', '11,124', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1340', '平湖市', '124', '11,124', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1341', '桐乡市', '124', '11,124', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1342', '市辖区', '125', '11,125', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1343', '吴兴区', '125', '11,125', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1344', '南浔区', '125', '11,125', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1345', '德清县', '125', '11,125', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1346', '长兴县', '125', '11,125', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1347', '安吉县', '125', '11,125', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1348', '市辖区', '126', '11,126', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1349', '越城区', '126', '11,126', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1350', '绍兴县', '126', '11,126', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1351', '新昌县', '126', '11,126', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1352', '诸暨市', '126', '11,126', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1353', '上虞市', '126', '11,126', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1354', '嵊州市', '126', '11,126', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1355', '市辖区', '127', '11,127', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1356', '婺城区', '127', '11,127', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1357', '金东区', '127', '11,127', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1358', '武义县', '127', '11,127', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1359', '浦江县', '127', '11,127', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1360', '磐安县', '127', '11,127', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1361', '兰溪市', '127', '11,127', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1362', '义乌市', '127', '11,127', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1363', '东阳市', '127', '11,127', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('1364', '永康市', '127', '11,127', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('1365', '市辖区', '128', '11,128', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1366', '柯城区', '128', '11,128', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1367', '衢江区', '128', '11,128', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1368', '常山县', '128', '11,128', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1369', '开化县', '128', '11,128', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1370', '龙游县', '128', '11,128', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1371', '江山市', '128', '11,128', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1372', '市辖区', '129', '11,129', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1373', '定海区', '129', '11,129', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1374', '普陀区', '129', '11,129', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1375', '岱山县', '129', '11,129', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1376', '嵊泗县', '129', '11,129', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1377', '市辖区', '130', '11,130', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1378', '椒江区', '130', '11,130', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1379', '黄岩区', '130', '11,130', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1380', '路桥区', '130', '11,130', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1381', '玉环县', '130', '11,130', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1382', '三门县', '130', '11,130', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1383', '天台县', '130', '11,130', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1384', '仙居县', '130', '11,130', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1385', '温岭市', '130', '11,130', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('1386', '临海市', '130', '11,130', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('1387', '市辖区', '131', '11,131', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1388', '莲都区', '131', '11,131', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1389', '青田县', '131', '11,131', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1390', '缙云县', '131', '11,131', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1391', '遂昌县', '131', '11,131', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1392', '松阳县', '131', '11,131', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1393', '云和县', '131', '11,131', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1394', '庆元县', '131', '11,131', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1395', '景宁畲族自治县', '131', '11,131', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('1396', '龙泉市', '131', '11,131', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('1397', '市辖区', '132', '12,132', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1398', '瑶海区', '132', '12,132', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1399', '庐阳区', '132', '12,132', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1400', '蜀山区', '132', '12,132', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1401', '包河区', '132', '12,132', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1402', '长丰县', '132', '12,132', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1403', '肥东县', '132', '12,132', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1404', '肥西县', '132', '12,132', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1405', '市辖区', '133', '12,133', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1406', '镜湖区', '133', '12,133', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1407', '马塘区', '133', '12,133', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1408', '新芜区', '133', '12,133', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1409', '鸠江区', '133', '12,133', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1410', '芜湖县', '133', '12,133', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1411', '繁昌县', '133', '12,133', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1412', '南陵县', '133', '12,133', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1413', '市辖区', '134', '12,134', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1414', '龙子湖区', '134', '12,134', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1415', '蚌山区', '134', '12,134', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1416', '禹会区', '134', '12,134', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1417', '淮上区', '134', '12,134', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1418', '怀远县', '134', '12,134', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1419', '五河县', '134', '12,134', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1420', '固镇县', '134', '12,134', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1421', '市辖区', '135', '12,135', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1422', '大通区', '135', '12,135', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1423', '田家庵区', '135', '12,135', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1424', '谢家集区', '135', '12,135', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1425', '八公山区', '135', '12,135', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1426', '潘集区', '135', '12,135', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1427', '凤台县', '135', '12,135', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1428', '市辖区', '136', '12,136', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1429', '金家庄区', '136', '12,136', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1430', '花山区', '136', '12,136', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1431', '雨山区', '136', '12,136', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1432', '当涂县', '136', '12,136', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1433', '市辖区', '137', '12,137', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1434', '杜集区', '137', '12,137', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1435', '相山区', '137', '12,137', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1436', '烈山区', '137', '12,137', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1437', '濉溪县', '137', '12,137', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1438', '市辖区', '138', '12,138', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1439', '铜官山区', '138', '12,138', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1440', '狮子山区', '138', '12,138', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1441', '郊区', '138', '12,138', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1442', '铜陵县', '138', '12,138', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1443', '市辖区', '139', '12,139', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1444', '迎江区', '139', '12,139', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1445', '大观区', '139', '12,139', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1446', '郊区', '139', '12,139', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1447', '怀宁县', '139', '12,139', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1448', '枞阳县', '139', '12,139', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1449', '潜山县', '139', '12,139', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1450', '太湖县', '139', '12,139', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1451', '宿松县', '139', '12,139', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('1452', '望江县', '139', '12,139', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('1453', '岳西县', '139', '12,139', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('1454', '桐城市', '139', '12,139', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('1455', '市辖区', '140', '12,140', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1456', '屯溪区', '140', '12,140', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1457', '黄山区', '140', '12,140', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1458', '徽州区', '140', '12,140', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1459', '歙县', '140', '12,140', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1460', '休宁县', '140', '12,140', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1461', '黟县', '140', '12,140', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1462', '祁门县', '140', '12,140', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1463', '市辖区', '141', '12,141', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1464', '琅琊区', '141', '12,141', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1465', '南谯区', '141', '12,141', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1466', '来安县', '141', '12,141', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1467', '全椒县', '141', '12,141', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1468', '定远县', '141', '12,141', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1469', '凤阳县', '141', '12,141', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1470', '天长市', '141', '12,141', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1471', '明光市', '141', '12,141', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('1472', '市辖区', '142', '12,142', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1473', '颍州区', '142', '12,142', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1474', '颍东区', '142', '12,142', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1475', '颍泉区', '142', '12,142', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1476', '临泉县', '142', '12,142', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1477', '太和县', '142', '12,142', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1478', '阜南县', '142', '12,142', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1479', '颍上县', '142', '12,142', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1480', '界首市', '142', '12,142', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('1481', '市辖区', '143', '12,143', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1482', '墉桥区', '143', '12,143', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1483', '砀山县', '143', '12,143', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1484', '萧县', '143', '12,143', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1485', '灵璧县', '143', '12,143', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1486', '泗县', '143', '12,143', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1487', '市辖区', '144', '12,144', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1488', '居巢区', '144', '12,144', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1489', '庐江县', '144', '12,144', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1490', '无为县', '144', '12,144', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1491', '含山县', '144', '12,144', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1492', '和县', '144', '12,144', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1493', '市辖区', '145', '12,145', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1494', '金安区', '145', '12,145', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1495', '裕安区', '145', '12,145', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1496', '寿县', '145', '12,145', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1497', '霍邱县', '145', '12,145', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1498', '舒城县', '145', '12,145', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1499', '金寨县', '145', '12,145', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1500', '霍山县', '145', '12,145', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1501', '市辖区', '146', '12,146', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1502', '谯城区', '146', '12,146', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1503', '涡阳县', '146', '12,146', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1504', '蒙城县', '146', '12,146', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1505', '利辛县', '146', '12,146', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1506', '市辖区', '147', '12,147', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1507', '贵池区', '147', '12,147', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1508', '东至县', '147', '12,147', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1509', '石台县', '147', '12,147', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1510', '青阳县', '147', '12,147', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1511', '市辖区', '148', '12,148', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1512', '宣州区', '148', '12,148', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1513', '郎溪县', '148', '12,148', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1514', '广德县', '148', '12,148', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1515', '泾县', '148', '12,148', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1516', '绩溪县', '148', '12,148', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1517', '旌德县', '148', '12,148', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1518', '宁国市', '148', '12,148', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1519', '市辖区', '149', '13,149', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1520', '鼓楼区', '149', '13,149', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1521', '台江区', '149', '13,149', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1522', '仓山区', '149', '13,149', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1523', '马尾区', '149', '13,149', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1524', '晋安区', '149', '13,149', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1525', '闽侯县', '149', '13,149', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1526', '连江县', '149', '13,149', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1527', '罗源县', '149', '13,149', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('1528', '闽清县', '149', '13,149', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('1529', '永泰县', '149', '13,149', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('1530', '平潭县', '149', '13,149', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('1531', '福清市', '149', '13,149', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('1532', '长乐市', '149', '13,149', '3', '14', null, null, null);
INSERT INTO `sys_area` VALUES ('1533', '市辖区', '150', '13,150', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1534', '思明区', '150', '13,150', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1535', '海沧区', '150', '13,150', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1536', '湖里区', '150', '13,150', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1537', '集美区', '150', '13,150', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1538', '同安区', '150', '13,150', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1539', '翔安区', '150', '13,150', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1540', '市辖区', '151', '13,151', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1541', '城厢区', '151', '13,151', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1542', '涵江区', '151', '13,151', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1543', '荔城区', '151', '13,151', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1544', '秀屿区', '151', '13,151', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1545', '仙游县', '151', '13,151', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1546', '市辖区', '152', '13,152', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1547', '梅列区', '152', '13,152', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1548', '三元区', '152', '13,152', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1549', '明溪县', '152', '13,152', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1550', '清流县', '152', '13,152', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1551', '宁化县', '152', '13,152', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1552', '大田县', '152', '13,152', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1553', '尤溪县', '152', '13,152', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1554', '沙县', '152', '13,152', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('1555', '将乐县', '152', '13,152', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('1556', '泰宁县', '152', '13,152', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('1557', '建宁县', '152', '13,152', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('1558', '永安市', '152', '13,152', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('1559', '市辖区', '153', '13,153', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1560', '鲤城区', '153', '13,153', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1561', '丰泽区', '153', '13,153', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1562', '洛江区', '153', '13,153', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1563', '泉港区', '153', '13,153', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1564', '惠安县', '153', '13,153', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1565', '安溪县', '153', '13,153', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1566', '永春县', '153', '13,153', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1567', '德化县', '153', '13,153', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('1568', '金门县', '153', '13,153', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('1569', '石狮市', '153', '13,153', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('1570', '晋江市', '153', '13,153', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('1571', '南安市', '153', '13,153', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('1572', '市辖区', '154', '13,154', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1573', '芗城区', '154', '13,154', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1574', '龙文区', '154', '13,154', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1575', '云霄县', '154', '13,154', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1576', '漳浦县', '154', '13,154', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1577', '诏安县', '154', '13,154', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1578', '长泰县', '154', '13,154', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1579', '东山县', '154', '13,154', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1580', '南靖县', '154', '13,154', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('1581', '平和县', '154', '13,154', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('1582', '华安县', '154', '13,154', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('1583', '龙海市', '154', '13,154', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('1584', '市辖区', '155', '13,155', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1585', '延平区', '155', '13,155', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1586', '顺昌县', '155', '13,155', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1587', '浦城县', '155', '13,155', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1588', '光泽县', '155', '13,155', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1589', '松溪县', '155', '13,155', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1590', '政和县', '155', '13,155', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1591', '邵武市', '155', '13,155', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1592', '武夷山市', '155', '13,155', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('1593', '建瓯市', '155', '13,155', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('1594', '建阳市', '155', '13,155', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('1595', '市辖区', '156', '13,156', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1596', '新罗区', '156', '13,156', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1597', '长汀县', '156', '13,156', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1598', '永定县', '156', '13,156', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1599', '上杭县', '156', '13,156', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1600', '武平县', '156', '13,156', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1601', '连城县', '156', '13,156', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1602', '漳平市', '156', '13,156', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1603', '市辖区', '157', '13,157', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1604', '蕉城区', '157', '13,157', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1605', '霞浦县', '157', '13,157', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1606', '古田县', '157', '13,157', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1607', '屏南县', '157', '13,157', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1608', '寿宁县', '157', '13,157', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1609', '周宁县', '157', '13,157', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1610', '柘荣县', '157', '13,157', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1611', '福安市', '157', '13,157', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('1612', '福鼎市', '157', '13,157', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('1613', '市辖区', '158', '14,158', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1614', '东湖区', '158', '14,158', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1615', '西湖区', '158', '14,158', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1616', '青云谱区', '158', '14,158', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1617', '湾里区', '158', '14,158', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1618', '青山湖区', '158', '14,158', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1619', '南昌县', '158', '14,158', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1620', '新建县', '158', '14,158', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1621', '安义县', '158', '14,158', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('1622', '进贤县', '158', '14,158', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('1623', '市辖区', '159', '14,159', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1624', '昌江区', '159', '14,159', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1625', '珠山区', '159', '14,159', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1626', '浮梁县', '159', '14,159', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1627', '乐平市', '159', '14,159', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1628', '市辖区', '160', '14,160', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1629', '安源区', '160', '14,160', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1630', '湘东区', '160', '14,160', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1631', '莲花县', '160', '14,160', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1632', '上栗县', '160', '14,160', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1633', '芦溪县', '160', '14,160', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1634', '市辖区', '161', '14,161', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1635', '庐山区', '161', '14,161', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1636', '浔阳区', '161', '14,161', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1637', '九江县', '161', '14,161', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1638', '武宁县', '161', '14,161', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1639', '修水县', '161', '14,161', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1640', '永修县', '161', '14,161', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1641', '德安县', '161', '14,161', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1642', '星子县', '161', '14,161', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('1643', '都昌县', '161', '14,161', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('1644', '湖口县', '161', '14,161', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('1645', '彭泽县', '161', '14,161', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('1646', '瑞昌市', '161', '14,161', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('1647', '市辖区', '162', '14,162', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1648', '渝水区', '162', '14,162', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1649', '分宜县', '162', '14,162', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1650', '市辖区', '163', '14,163', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1651', '月湖区', '163', '14,163', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1652', '余江县', '163', '14,163', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1653', '贵溪市', '163', '14,163', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1654', '市辖区', '164', '14,164', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1655', '章贡区', '164', '14,164', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1656', '赣县', '164', '14,164', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1657', '信丰县', '164', '14,164', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1658', '大余县', '164', '14,164', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1659', '上犹县', '164', '14,164', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1660', '崇义县', '164', '14,164', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1661', '安远县', '164', '14,164', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1662', '龙南县', '164', '14,164', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('1663', '定南县', '164', '14,164', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('1664', '全南县', '164', '14,164', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('1665', '宁都县', '164', '14,164', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('1666', '于都县', '164', '14,164', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('1667', '兴国县', '164', '14,164', '3', '14', null, null, null);
INSERT INTO `sys_area` VALUES ('1668', '会昌县', '164', '14,164', '3', '15', null, null, null);
INSERT INTO `sys_area` VALUES ('1669', '寻乌县', '164', '14,164', '3', '16', null, null, null);
INSERT INTO `sys_area` VALUES ('1670', '石城县', '164', '14,164', '3', '17', null, null, null);
INSERT INTO `sys_area` VALUES ('1671', '瑞金市', '164', '14,164', '3', '18', null, null, null);
INSERT INTO `sys_area` VALUES ('1672', '南康市', '164', '14,164', '3', '19', null, null, null);
INSERT INTO `sys_area` VALUES ('1673', '市辖区', '165', '14,165', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1674', '吉州区', '165', '14,165', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1675', '青原区', '165', '14,165', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1676', '吉安县', '165', '14,165', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1677', '吉水县', '165', '14,165', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1678', '峡江县', '165', '14,165', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1679', '新干县', '165', '14,165', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1680', '永丰县', '165', '14,165', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1681', '泰和县', '165', '14,165', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('1682', '遂川县', '165', '14,165', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('1683', '万安县', '165', '14,165', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('1684', '安福县', '165', '14,165', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('1685', '永新县', '165', '14,165', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('1686', '井冈山市', '165', '14,165', '3', '14', null, null, null);
INSERT INTO `sys_area` VALUES ('1687', '市辖区', '166', '14,166', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1688', '袁州区', '166', '14,166', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1689', '奉新县', '166', '14,166', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1690', '万载县', '166', '14,166', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1691', '上高县', '166', '14,166', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1692', '宜丰县', '166', '14,166', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1693', '靖安县', '166', '14,166', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1694', '铜鼓县', '166', '14,166', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1695', '丰城市', '166', '14,166', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('1696', '樟树市', '166', '14,166', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('1697', '高安市', '166', '14,166', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('1698', '市辖区', '167', '14,167', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1699', '临川区', '167', '14,167', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1700', '南城县', '167', '14,167', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1701', '黎川县', '167', '14,167', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1702', '南丰县', '167', '14,167', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1703', '崇仁县', '167', '14,167', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1704', '乐安县', '167', '14,167', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1705', '宜黄县', '167', '14,167', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1706', '金溪县', '167', '14,167', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('1707', '资溪县', '167', '14,167', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('1708', '东乡县', '167', '14,167', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('1709', '广昌县', '167', '14,167', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('1710', '市辖区', '168', '14,168', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1711', '信州区', '168', '14,168', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1712', '上饶县', '168', '14,168', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1713', '广丰县', '168', '14,168', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1714', '玉山县', '168', '14,168', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1715', '铅山县', '168', '14,168', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1716', '横峰县', '168', '14,168', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1717', '弋阳县', '168', '14,168', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1718', '余干县', '168', '14,168', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('1719', '鄱阳县', '168', '14,168', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('1720', '万年县', '168', '14,168', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('1721', '婺源县', '168', '14,168', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('1722', '德兴市', '168', '14,168', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('1723', '市辖区', '169', '15,169', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1724', '历下区', '169', '15,169', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1725', '市中区', '169', '15,169', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1726', '槐荫区', '169', '15,169', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1727', '天桥区', '169', '15,169', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1728', '历城区', '169', '15,169', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1729', '长清区', '169', '15,169', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1730', '平阴县', '169', '15,169', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1731', '济阳县', '169', '15,169', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('1732', '商河县', '169', '15,169', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('1733', '章丘市', '169', '15,169', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('1734', '市辖区', '170', '15,170', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1735', '市南区', '170', '15,170', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1736', '市北区', '170', '15,170', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1737', '四方区', '170', '15,170', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1738', '黄岛区', '170', '15,170', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1739', '崂山区', '170', '15,170', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1740', '李沧区', '170', '15,170', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1741', '城阳区', '170', '15,170', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1742', '胶州市', '170', '15,170', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('1743', '即墨市', '170', '15,170', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('1744', '平度市', '170', '15,170', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('1745', '胶南市', '170', '15,170', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('1746', '莱西市', '170', '15,170', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('1747', '市辖区', '171', '15,171', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1748', '淄川区', '171', '15,171', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1749', '张店区', '171', '15,171', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1750', '博山区', '171', '15,171', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1751', '临淄区', '171', '15,171', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1752', '周村区', '171', '15,171', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1753', '桓台县', '171', '15,171', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1754', '高青县', '171', '15,171', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1755', '沂源县', '171', '15,171', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('1756', '市辖区', '172', '15,172', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1757', '市中区', '172', '15,172', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1758', '薛城区', '172', '15,172', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1759', '峄城区', '172', '15,172', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1760', '台儿庄区', '172', '15,172', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1761', '山亭区', '172', '15,172', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1762', '滕州市', '172', '15,172', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1763', '市辖区', '173', '15,173', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1764', '东营区', '173', '15,173', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1765', '河口区', '173', '15,173', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1766', '垦利县', '173', '15,173', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1767', '利津县', '173', '15,173', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1768', '广饶县', '173', '15,173', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1769', '市辖区', '174', '15,174', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1770', '芝罘区', '174', '15,174', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1771', '福山区', '174', '15,174', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1772', '牟平区', '174', '15,174', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1773', '莱山区', '174', '15,174', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1774', '长岛县', '174', '15,174', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1775', '龙口市', '174', '15,174', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1776', '莱阳市', '174', '15,174', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1777', '莱州市', '174', '15,174', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('1778', '蓬莱市', '174', '15,174', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('1779', '招远市', '174', '15,174', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('1780', '栖霞市', '174', '15,174', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('1781', '海阳市', '174', '15,174', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('1782', '市辖区', '175', '15,175', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1783', '潍城区', '175', '15,175', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1784', '寒亭区', '175', '15,175', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1785', '坊子区', '175', '15,175', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1786', '奎文区', '175', '15,175', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1787', '临朐县', '175', '15,175', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1788', '昌乐县', '175', '15,175', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1789', '青州市', '175', '15,175', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1790', '诸城市', '175', '15,175', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('1791', '寿光市', '175', '15,175', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('1792', '安丘市', '175', '15,175', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('1793', '高密市', '175', '15,175', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('1794', '昌邑市', '175', '15,175', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('1795', '市辖区', '176', '15,176', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1796', '市中区', '176', '15,176', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1797', '任城区', '176', '15,176', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1798', '微山县', '176', '15,176', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1799', '鱼台县', '176', '15,176', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1800', '金乡县', '176', '15,176', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1801', '嘉祥县', '176', '15,176', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1802', '汶上县', '176', '15,176', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1803', '泗水县', '176', '15,176', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('1804', '梁山县', '176', '15,176', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('1805', '曲阜市', '176', '15,176', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('1806', '兖州市', '176', '15,176', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('1807', '邹城市', '176', '15,176', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('1808', '市辖区', '177', '15,177', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1809', '泰山区', '177', '15,177', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1810', '岱岳区', '177', '15,177', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1811', '宁阳县', '177', '15,177', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1812', '东平县', '177', '15,177', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1813', '新泰市', '177', '15,177', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1814', '肥城市', '177', '15,177', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1815', '市辖区', '178', '15,178', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1816', '环翠区', '178', '15,178', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1817', '文登市', '178', '15,178', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1818', '荣成市', '178', '15,178', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1819', '乳山市', '178', '15,178', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1820', '市辖区', '179', '15,179', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1821', '东港区', '179', '15,179', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1822', '岚山区', '179', '15,179', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1823', '五莲县', '179', '15,179', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1824', '莒县', '179', '15,179', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1825', '市辖区', '180', '15,180', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1826', '莱城区', '180', '15,180', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1827', '钢城区', '180', '15,180', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1828', '市辖区', '181', '15,181', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1829', '兰山区', '181', '15,181', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1830', '罗庄区', '181', '15,181', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1831', '河东区', '181', '15,181', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1832', '沂南县', '181', '15,181', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1833', '郯城县', '181', '15,181', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1834', '沂水县', '181', '15,181', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1835', '苍山县', '181', '15,181', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1836', '费县', '181', '15,181', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('1837', '平邑县', '181', '15,181', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('1838', '莒南县', '181', '15,181', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('1839', '蒙阴县', '181', '15,181', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('1840', '临沭县', '181', '15,181', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('1841', '市辖区', '182', '15,182', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1842', '德城区', '182', '15,182', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1843', '陵县', '182', '15,182', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1844', '宁津县', '182', '15,182', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1845', '庆云县', '182', '15,182', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1846', '临邑县', '182', '15,182', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1847', '齐河县', '182', '15,182', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1848', '平原县', '182', '15,182', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1849', '夏津县', '182', '15,182', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('1850', '武城县', '182', '15,182', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('1851', '乐陵市', '182', '15,182', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('1852', '禹城市', '182', '15,182', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('1853', '市辖区', '183', '15,183', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1854', '东昌府区', '183', '15,183', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1855', '阳谷县', '183', '15,183', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1856', '莘县', '183', '15,183', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1857', '茌平县', '183', '15,183', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1858', '东阿县', '183', '15,183', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1859', '冠县', '183', '15,183', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1860', '高唐县', '183', '15,183', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1861', '临清市', '183', '15,183', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('1862', '市辖区', '184', '15,184', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1863', '滨城区', '184', '15,184', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1864', '惠民县', '184', '15,184', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1865', '阳信县', '184', '15,184', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1866', '无棣县', '184', '15,184', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1867', '沾化县', '184', '15,184', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1868', '博兴县', '184', '15,184', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1869', '邹平县', '184', '15,184', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1870', '市辖区', '185', '15,185', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1871', '牡丹区', '185', '15,185', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1872', '曹县', '185', '15,185', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1873', '单县', '185', '15,185', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1874', '成武县', '185', '15,185', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1875', '巨野县', '185', '15,185', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1876', '郓城县', '185', '15,185', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1877', '鄄城县', '185', '15,185', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1878', '定陶县', '185', '15,185', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('1879', '东明县', '185', '15,185', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('1880', '市辖区', '186', '16,186', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1881', '中原区', '186', '16,186', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1882', '二七区', '186', '16,186', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1883', '管城回族区', '186', '16,186', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1884', '金水区', '186', '16,186', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1885', '上街区', '186', '16,186', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1886', '邙山区', '186', '16,186', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1887', '中牟县', '186', '16,186', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1888', '巩义市', '186', '16,186', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('1889', '荥阳市', '186', '16,186', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('1890', '新密市', '186', '16,186', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('1891', '新郑市', '186', '16,186', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('1892', '登封市', '186', '16,186', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('1893', '市辖区', '187', '16,187', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1894', '龙亭区', '187', '16,187', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1895', '顺河回族区', '187', '16,187', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1896', '鼓楼区', '187', '16,187', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1897', '南关区', '187', '16,187', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1898', '郊区', '187', '16,187', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1899', '杞县', '187', '16,187', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1900', '通许县', '187', '16,187', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1901', '尉氏县', '187', '16,187', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('1902', '开封县', '187', '16,187', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('1903', '兰考县', '187', '16,187', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('1904', '市辖区', '188', '16,188', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1905', '老城区', '188', '16,188', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1906', '西工区', '188', '16,188', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1907', '廛河回族区', '188', '16,188', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1908', '涧西区', '188', '16,188', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1909', '吉利区', '188', '16,188', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1910', '洛龙区', '188', '16,188', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1911', '孟津县', '188', '16,188', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1912', '新安县', '188', '16,188', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('1913', '栾川县', '188', '16,188', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('1914', '嵩县', '188', '16,188', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('1915', '汝阳县', '188', '16,188', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('1916', '宜阳县', '188', '16,188', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('1917', '洛宁县', '188', '16,188', '3', '14', null, null, null);
INSERT INTO `sys_area` VALUES ('1918', '伊川县', '188', '16,188', '3', '15', null, null, null);
INSERT INTO `sys_area` VALUES ('1919', '偃师市', '188', '16,188', '3', '16', null, null, null);
INSERT INTO `sys_area` VALUES ('1920', '市辖区', '189', '16,189', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1921', '新华区', '189', '16,189', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1922', '卫东区', '189', '16,189', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1923', '石龙区', '189', '16,189', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1924', '湛河区', '189', '16,189', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1925', '宝丰县', '189', '16,189', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1926', '叶县', '189', '16,189', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1927', '鲁山县', '189', '16,189', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1928', '郏县', '189', '16,189', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('1929', '舞钢市', '189', '16,189', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('1930', '汝州市', '189', '16,189', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('1931', '市辖区', '190', '16,190', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1932', '文峰区', '190', '16,190', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1933', '北关区', '190', '16,190', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1934', '殷都区', '190', '16,190', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1935', '龙安区', '190', '16,190', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1936', '安阳县', '190', '16,190', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1937', '汤阴县', '190', '16,190', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1938', '滑县', '190', '16,190', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1939', '内黄县', '190', '16,190', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('1940', '林州市', '190', '16,190', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('1941', '市辖区', '191', '16,191', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1942', '鹤山区', '191', '16,191', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1943', '山城区', '191', '16,191', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1944', '淇滨区', '191', '16,191', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1945', '浚县', '191', '16,191', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1946', '淇县', '191', '16,191', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1947', '市辖区', '192', '16,192', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1948', '红旗区', '192', '16,192', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1949', '卫滨区', '192', '16,192', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1950', '凤泉区', '192', '16,192', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1951', '牧野区', '192', '16,192', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1952', '新乡县', '192', '16,192', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1953', '获嘉县', '192', '16,192', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1954', '原阳县', '192', '16,192', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1955', '延津县', '192', '16,192', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('1956', '封丘县', '192', '16,192', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('1957', '长垣县', '192', '16,192', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('1958', '卫辉市', '192', '16,192', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('1959', '辉县市', '192', '16,192', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('1960', '市辖区', '193', '16,193', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1961', '解放区', '193', '16,193', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1962', '中站区', '193', '16,193', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1963', '马村区', '193', '16,193', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1964', '山阳区', '193', '16,193', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1965', '修武县', '193', '16,193', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1966', '博爱县', '193', '16,193', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1967', '武陟县', '193', '16,193', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('1968', '温县', '193', '16,193', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('1969', '济源市', '193', '16,193', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('1970', '沁阳市', '193', '16,193', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('1971', '孟州市', '193', '16,193', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('1972', '市辖区', '194', '16,194', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1973', '华龙区', '194', '16,194', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1974', '清丰县', '194', '16,194', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1975', '南乐县', '194', '16,194', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1976', '范县', '194', '16,194', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1977', '台前县', '194', '16,194', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1978', '濮阳县', '194', '16,194', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1979', '市辖区', '195', '16,195', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1980', '魏都区', '195', '16,195', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1981', '许昌县', '195', '16,195', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1982', '鄢陵县', '195', '16,195', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1983', '襄城县', '195', '16,195', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1984', '禹州市', '195', '16,195', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1985', '长葛市', '195', '16,195', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1986', '市辖区', '196', '16,196', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1987', '源汇区', '196', '16,196', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1988', '郾城区', '196', '16,196', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1989', '召陵区', '196', '16,196', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1990', '舞阳县', '196', '16,196', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1991', '临颍县', '196', '16,196', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1992', '市辖区', '197', '16,197', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('1993', '湖滨区', '197', '16,197', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('1994', '渑池县', '197', '16,197', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('1995', '陕县', '197', '16,197', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('1996', '卢氏县', '197', '16,197', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('1997', '义马市', '197', '16,197', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('1998', '灵宝市', '197', '16,197', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('1999', '市辖区', '198', '16,198', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2000', '宛城区', '198', '16,198', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2001', '卧龙区', '198', '16,198', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2002', '南召县', '198', '16,198', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2003', '方城县', '198', '16,198', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2004', '西峡县', '198', '16,198', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2005', '镇平县', '198', '16,198', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2006', '内乡县', '198', '16,198', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2007', '淅川县', '198', '16,198', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('2008', '社旗县', '198', '16,198', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('2009', '唐河县', '198', '16,198', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('2010', '新野县', '198', '16,198', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('2011', '桐柏县', '198', '16,198', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('2012', '邓州市', '198', '16,198', '3', '14', null, null, null);
INSERT INTO `sys_area` VALUES ('2013', '市辖区', '199', '16,199', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2014', '梁园区', '199', '16,199', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2015', '睢阳区', '199', '16,199', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2016', '民权县', '199', '16,199', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2017', '睢县', '199', '16,199', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2018', '宁陵县', '199', '16,199', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2019', '柘城县', '199', '16,199', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2020', '虞城县', '199', '16,199', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2021', '夏邑县', '199', '16,199', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('2022', '永城市', '199', '16,199', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('2023', '市辖区', '200', '16,200', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2024', '师河区', '200', '16,200', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2025', '平桥区', '200', '16,200', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2026', '罗山县', '200', '16,200', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2027', '光山县', '200', '16,200', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2028', '新县', '200', '16,200', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2029', '商城县', '200', '16,200', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2030', '固始县', '200', '16,200', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2031', '潢川县', '200', '16,200', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('2032', '淮滨县', '200', '16,200', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('2033', '息县', '200', '16,200', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('2034', '市辖区', '201', '16,201', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2035', '川汇区', '201', '16,201', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2036', '扶沟县', '201', '16,201', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2037', '西华县', '201', '16,201', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2038', '商水县', '201', '16,201', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2039', '沈丘县', '201', '16,201', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2040', '郸城县', '201', '16,201', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2041', '淮阳县', '201', '16,201', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2042', '太康县', '201', '16,201', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('2043', '鹿邑县', '201', '16,201', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('2044', '项城市', '201', '16,201', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('2045', '市辖区', '202', '16,202', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2046', '驿城区', '202', '16,202', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2047', '西平县', '202', '16,202', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2048', '上蔡县', '202', '16,202', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2049', '平舆县', '202', '16,202', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2050', '正阳县', '202', '16,202', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2051', '确山县', '202', '16,202', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2052', '泌阳县', '202', '16,202', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2053', '汝南县', '202', '16,202', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('2054', '遂平县', '202', '16,202', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('2055', '新蔡县', '202', '16,202', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('2056', '市辖区', '203', '17,203', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2057', '江岸区', '203', '17,203', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2058', '江汉区', '203', '17,203', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2059', '乔口区', '203', '17,203', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2060', '汉阳区', '203', '17,203', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2061', '武昌区', '203', '17,203', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2062', '青山区', '203', '17,203', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2063', '洪山区', '203', '17,203', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2064', '东西湖区', '203', '17,203', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('2065', '汉南区', '203', '17,203', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('2066', '蔡甸区', '203', '17,203', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('2067', '江夏区', '203', '17,203', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('2068', '黄陂区', '203', '17,203', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('2069', '新洲区', '203', '17,203', '3', '14', null, null, null);
INSERT INTO `sys_area` VALUES ('2070', '市辖区', '204', '17,204', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2071', '黄石港区', '204', '17,204', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2072', '西塞山区', '204', '17,204', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2073', '下陆区', '204', '17,204', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2074', '铁山区', '204', '17,204', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2075', '阳新县', '204', '17,204', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2076', '大冶市', '204', '17,204', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2077', '市辖区', '205', '17,205', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2078', '茅箭区', '205', '17,205', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2079', '张湾区', '205', '17,205', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2080', '郧县', '205', '17,205', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2081', '郧西县', '205', '17,205', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2082', '竹山县', '205', '17,205', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2083', '竹溪县', '205', '17,205', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2084', '房县', '205', '17,205', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2085', '丹江口市', '205', '17,205', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('2086', '市辖区', '206', '17,206', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2087', '西陵区', '206', '17,206', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2088', '伍家岗区', '206', '17,206', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2089', '点军区', '206', '17,206', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2090', '猇亭区', '206', '17,206', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2091', '夷陵区', '206', '17,206', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2092', '远安县', '206', '17,206', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2093', '兴山县', '206', '17,206', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2094', '秭归县', '206', '17,206', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('2095', '长阳土家族自治县', '206', '17,206', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('2096', '五峰土家族自治县', '206', '17,206', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('2097', '宜都市', '206', '17,206', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('2098', '当阳市', '206', '17,206', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('2099', '枝江市', '206', '17,206', '3', '14', null, null, null);
INSERT INTO `sys_area` VALUES ('2100', '市辖区', '207', '17,207', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2101', '襄城区', '207', '17,207', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2102', '樊城区', '207', '17,207', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2103', '襄阳区', '207', '17,207', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2104', '南漳县', '207', '17,207', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2105', '谷城县', '207', '17,207', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2106', '保康县', '207', '17,207', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2107', '老河口市', '207', '17,207', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2108', '枣阳市', '207', '17,207', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('2109', '宜城市', '207', '17,207', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('2110', '市辖区', '208', '17,208', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2111', '梁子湖区', '208', '17,208', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2112', '华容区', '208', '17,208', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2113', '鄂城区', '208', '17,208', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2114', '市辖区', '209', '17,209', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2115', '东宝区', '209', '17,209', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2116', '掇刀区', '209', '17,209', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2117', '京山县', '209', '17,209', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2118', '沙洋县', '209', '17,209', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2119', '钟祥市', '209', '17,209', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2120', '市辖区', '210', '17,210', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2121', '孝南区', '210', '17,210', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2122', '孝昌县', '210', '17,210', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2123', '大悟县', '210', '17,210', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2124', '云梦县', '210', '17,210', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2125', '应城市', '210', '17,210', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2126', '安陆市', '210', '17,210', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2127', '汉川市', '210', '17,210', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2128', '市辖区', '211', '17,211', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2129', '沙市区', '211', '17,211', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2130', '荆州区', '211', '17,211', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2131', '公安县', '211', '17,211', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2132', '监利县', '211', '17,211', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2133', '江陵县', '211', '17,211', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2134', '石首市', '211', '17,211', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2135', '洪湖市', '211', '17,211', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2136', '松滋市', '211', '17,211', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('2137', '市辖区', '212', '17,212', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2138', '黄州区', '212', '17,212', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2139', '团风县', '212', '17,212', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2140', '红安县', '212', '17,212', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2141', '罗田县', '212', '17,212', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2142', '英山县', '212', '17,212', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2143', '浠水县', '212', '17,212', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2144', '蕲春县', '212', '17,212', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2145', '黄梅县', '212', '17,212', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('2146', '麻城市', '212', '17,212', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('2147', '武穴市', '212', '17,212', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('2148', '市辖区', '213', '17,213', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2149', '咸安区', '213', '17,213', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2150', '嘉鱼县', '213', '17,213', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2151', '通城县', '213', '17,213', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2152', '崇阳县', '213', '17,213', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2153', '通山县', '213', '17,213', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2154', '赤壁市', '213', '17,213', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2155', '市辖区', '214', '17,214', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2156', '曾都区', '214', '17,214', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2157', '广水市', '214', '17,214', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2158', '恩施市', '215', '17,215', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2159', '利川市', '215', '17,215', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2160', '建始县', '215', '17,215', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2161', '巴东县', '215', '17,215', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2162', '宣恩县', '215', '17,215', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2163', '咸丰县', '215', '17,215', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2164', '来凤县', '215', '17,215', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2165', '鹤峰县', '215', '17,215', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2166', '仙桃市', '216', '17,216', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2167', '潜江市', '216', '17,216', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2168', '天门市', '216', '17,216', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2169', '神农架林区', '216', '17,216', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2170', '市辖区', '217', '18,217', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2171', '芙蓉区', '217', '18,217', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2172', '天心区', '217', '18,217', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2173', '岳麓区', '217', '18,217', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2174', '开福区', '217', '18,217', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2175', '雨花区', '217', '18,217', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2176', '长沙县', '217', '18,217', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2177', '望城县', '217', '18,217', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2178', '宁乡县', '217', '18,217', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('2179', '浏阳市', '217', '18,217', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('2180', '市辖区', '218', '18,218', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2181', '荷塘区', '218', '18,218', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2182', '芦淞区', '218', '18,218', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2183', '石峰区', '218', '18,218', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2184', '天元区', '218', '18,218', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2185', '株洲县', '218', '18,218', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2186', '攸县', '218', '18,218', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2187', '茶陵县', '218', '18,218', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2188', '炎陵县', '218', '18,218', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('2189', '醴陵市', '218', '18,218', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('2190', '市辖区', '219', '18,219', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2191', '雨湖区', '219', '18,219', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2192', '岳塘区', '219', '18,219', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2193', '湘潭县', '219', '18,219', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2194', '湘乡市', '219', '18,219', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2195', '韶山市', '219', '18,219', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2196', '市辖区', '220', '18,220', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2197', '珠晖区', '220', '18,220', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2198', '雁峰区', '220', '18,220', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2199', '石鼓区', '220', '18,220', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2200', '蒸湘区', '220', '18,220', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2201', '南岳区', '220', '18,220', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2202', '衡阳县', '220', '18,220', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2203', '衡南县', '220', '18,220', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2204', '衡山县', '220', '18,220', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('2205', '衡东县', '220', '18,220', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('2206', '祁东县', '220', '18,220', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('2207', '耒阳市', '220', '18,220', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('2208', '常宁市', '220', '18,220', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('2209', '市辖区', '221', '18,221', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2210', '双清区', '221', '18,221', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2211', '大祥区', '221', '18,221', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2212', '北塔区', '221', '18,221', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2213', '邵东县', '221', '18,221', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2214', '新邵县', '221', '18,221', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2215', '邵阳县', '221', '18,221', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2216', '隆回县', '221', '18,221', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2217', '洞口县', '221', '18,221', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('2218', '绥宁县', '221', '18,221', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('2219', '新宁县', '221', '18,221', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('2220', '城步苗族自治县', '221', '18,221', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('2221', '武冈市', '221', '18,221', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('2222', '市辖区', '222', '18,222', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2223', '岳阳楼区', '222', '18,222', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2224', '云溪区', '222', '18,222', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2225', '君山区', '222', '18,222', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2226', '岳阳县', '222', '18,222', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2227', '华容县', '222', '18,222', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2228', '湘阴县', '222', '18,222', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2229', '平江县', '222', '18,222', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2230', '汨罗市', '222', '18,222', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('2231', '临湘市', '222', '18,222', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('2232', '市辖区', '223', '18,223', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2233', '武陵区', '223', '18,223', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2234', '鼎城区', '223', '18,223', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2235', '安乡县', '223', '18,223', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2236', '汉寿县', '223', '18,223', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2237', '澧县', '223', '18,223', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2238', '临澧县', '223', '18,223', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2239', '桃源县', '223', '18,223', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2240', '石门县', '223', '18,223', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('2241', '津市市', '223', '18,223', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('2242', '市辖区', '224', '18,224', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2243', '永定区', '224', '18,224', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2244', '武陵源区', '224', '18,224', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2245', '慈利县', '224', '18,224', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2246', '桑植县', '224', '18,224', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2247', '市辖区', '225', '18,225', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2248', '资阳区', '225', '18,225', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2249', '赫山区', '225', '18,225', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2250', '南县', '225', '18,225', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2251', '桃江县', '225', '18,225', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2252', '安化县', '225', '18,225', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2253', '沅江市', '225', '18,225', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2254', '市辖区', '226', '18,226', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2255', '北湖区', '226', '18,226', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2256', '苏仙区', '226', '18,226', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2257', '桂阳县', '226', '18,226', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2258', '宜章县', '226', '18,226', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2259', '永兴县', '226', '18,226', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2260', '嘉禾县', '226', '18,226', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2261', '临武县', '226', '18,226', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2262', '汝城县', '226', '18,226', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('2263', '桂东县', '226', '18,226', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('2264', '安仁县', '226', '18,226', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('2265', '资兴市', '226', '18,226', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('2266', '市辖区', '227', '18,227', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2267', '芝山区', '227', '18,227', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2268', '冷水滩区', '227', '18,227', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2269', '祁阳县', '227', '18,227', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2270', '东安县', '227', '18,227', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2271', '双牌县', '227', '18,227', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2272', '道县', '227', '18,227', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2273', '江永县', '227', '18,227', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2274', '宁远县', '227', '18,227', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('2275', '蓝山县', '227', '18,227', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('2276', '新田县', '227', '18,227', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('2277', '江华瑶族自治县', '227', '18,227', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('2278', '市辖区', '228', '18,228', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2279', '鹤城区', '228', '18,228', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2280', '中方县', '228', '18,228', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2281', '沅陵县', '228', '18,228', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2282', '辰溪县', '228', '18,228', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2283', '溆浦县', '228', '18,228', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2284', '会同县', '228', '18,228', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2285', '麻阳苗族自治县', '228', '18,228', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2286', '新晃侗族自治县', '228', '18,228', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('2287', '芷江侗族自治县', '228', '18,228', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('2288', '靖州苗族侗族自治县', '228', '18,228', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('2289', '通道侗族自治县', '228', '18,228', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('2290', '洪江市', '228', '18,228', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('2291', '市辖区', '229', '18,229', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2292', '娄星区', '229', '18,229', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2293', '双峰县', '229', '18,229', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2294', '新化县', '229', '18,229', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2295', '冷水江市', '229', '18,229', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2296', '涟源市', '229', '18,229', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2297', '吉首市', '230', '18,230', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2298', '泸溪县', '230', '18,230', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2299', '凤凰县', '230', '18,230', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2300', '花垣县', '230', '18,230', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2301', '保靖县', '230', '18,230', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2302', '古丈县', '230', '18,230', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2303', '永顺县', '230', '18,230', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2304', '龙山县', '230', '18,230', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2305', '市辖区', '231', '19,231', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2306', '东山区', '231', '19,231', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2307', '荔湾区', '231', '19,231', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2308', '越秀区', '231', '19,231', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2309', '海珠区', '231', '19,231', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2310', '天河区', '231', '19,231', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2311', '芳村区', '231', '19,231', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2312', '白云区', '231', '19,231', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2313', '黄埔区', '231', '19,231', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('2314', '番禺区', '231', '19,231', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('2315', '花都区', '231', '19,231', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('2316', '增城市', '231', '19,231', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('2317', '从化市', '231', '19,231', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('2318', '市辖区', '232', '19,232', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2319', '武江区', '232', '19,232', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2320', '浈江区', '232', '19,232', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2321', '曲江区', '232', '19,232', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2322', '始兴县', '232', '19,232', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2323', '仁化县', '232', '19,232', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2324', '翁源县', '232', '19,232', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2325', '乳源瑶族自治县', '232', '19,232', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2326', '新丰县', '232', '19,232', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('2327', '乐昌市', '232', '19,232', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('2328', '南雄市', '232', '19,232', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('2329', '市辖区', '233', '19,233', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2330', '罗湖区', '233', '19,233', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2331', '福田区', '233', '19,233', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2332', '南山区', '233', '19,233', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2333', '宝安区', '233', '19,233', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2334', '龙岗区', '233', '19,233', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2335', '盐田区', '233', '19,233', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2336', '市辖区', '234', '19,234', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2337', '香洲区', '234', '19,234', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2338', '斗门区', '234', '19,234', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2339', '金湾区', '234', '19,234', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2340', '市辖区', '235', '19,235', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2341', '龙湖区', '235', '19,235', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2342', '金平区', '235', '19,235', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2343', '濠江区', '235', '19,235', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2344', '潮阳区', '235', '19,235', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2345', '潮南区', '235', '19,235', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2346', '澄海区', '235', '19,235', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2347', '南澳县', '235', '19,235', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2348', '市辖区', '236', '19,236', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2349', '禅城区', '236', '19,236', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2350', '南海区', '236', '19,236', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2351', '顺德区', '236', '19,236', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2352', '三水区', '236', '19,236', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2353', '高明区', '236', '19,236', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2354', '市辖区', '237', '19,237', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2355', '蓬江区', '237', '19,237', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2356', '江海区', '237', '19,237', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2357', '新会区', '237', '19,237', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2358', '台山市', '237', '19,237', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2359', '开平市', '237', '19,237', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2360', '鹤山市', '237', '19,237', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2361', '恩平市', '237', '19,237', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2362', '市辖区', '238', '19,238', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2363', '赤坎区', '238', '19,238', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2364', '霞山区', '238', '19,238', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2365', '坡头区', '238', '19,238', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2366', '麻章区', '238', '19,238', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2367', '遂溪县', '238', '19,238', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2368', '徐闻县', '238', '19,238', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2369', '廉江市', '238', '19,238', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2370', '雷州市', '238', '19,238', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('2371', '吴川市', '238', '19,238', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('2372', '市辖区', '239', '19,239', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2373', '茂南区', '239', '19,239', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2374', '茂港区', '239', '19,239', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2375', '电白县', '239', '19,239', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2376', '高州市', '239', '19,239', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2377', '化州市', '239', '19,239', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2378', '信宜市', '239', '19,239', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2379', '市辖区', '240', '19,240', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2380', '端州区', '240', '19,240', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2381', '鼎湖区', '240', '19,240', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2382', '广宁县', '240', '19,240', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2383', '怀集县', '240', '19,240', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2384', '封开县', '240', '19,240', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2385', '德庆县', '240', '19,240', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2386', '高要市', '240', '19,240', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2387', '四会市', '240', '19,240', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('2388', '市辖区', '241', '19,241', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2389', '惠城区', '241', '19,241', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2390', '惠阳区', '241', '19,241', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2391', '博罗县', '241', '19,241', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2392', '惠东县', '241', '19,241', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2393', '龙门县', '241', '19,241', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2394', '市辖区', '242', '19,242', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2395', '梅江区', '242', '19,242', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2396', '梅县', '242', '19,242', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2397', '大埔县', '242', '19,242', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2398', '丰顺县', '242', '19,242', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2399', '五华县', '242', '19,242', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2400', '平远县', '242', '19,242', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2401', '蕉岭县', '242', '19,242', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2402', '兴宁市', '242', '19,242', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('2403', '市辖区', '243', '19,243', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2404', '城区', '243', '19,243', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2405', '海丰县', '243', '19,243', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2406', '陆河县', '243', '19,243', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2407', '陆丰市', '243', '19,243', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2408', '市辖区', '244', '19,244', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2409', '源城区', '244', '19,244', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2410', '紫金县', '244', '19,244', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2411', '龙川县', '244', '19,244', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2412', '连平县', '244', '19,244', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2413', '和平县', '244', '19,244', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2414', '东源县', '244', '19,244', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2415', '市辖区', '245', '19,245', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2416', '江城区', '245', '19,245', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2417', '阳西县', '245', '19,245', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2418', '阳东县', '245', '19,245', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2419', '阳春市', '245', '19,245', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2420', '市辖区', '246', '19,246', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2421', '清城区', '246', '19,246', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2422', '佛冈县', '246', '19,246', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2423', '阳山县', '246', '19,246', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2424', '连山壮族瑶族自治县', '246', '19,246', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2425', '连南瑶族自治县', '246', '19,246', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2426', '清新县', '246', '19,246', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2427', '英德市', '246', '19,246', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2428', '连州市', '246', '19,246', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('2429', '市辖区', '249', '19,249', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2430', '湘桥区', '249', '19,249', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2431', '潮安县', '249', '19,249', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2432', '饶平县', '249', '19,249', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2433', '市辖区', '250', '19,250', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2434', '榕城区', '250', '19,250', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2435', '揭东县', '250', '19,250', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2436', '揭西县', '250', '19,250', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2437', '惠来县', '250', '19,250', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2438', '普宁市', '250', '19,250', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2439', '市辖区', '251', '19,251', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2440', '云城区', '251', '19,251', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2441', '新兴县', '251', '19,251', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2442', '郁南县', '251', '19,251', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2443', '云安县', '251', '19,251', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2444', '罗定市', '251', '19,251', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2445', '市辖区', '252', '20,252', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2446', '兴宁区', '252', '20,252', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2447', '青秀区', '252', '20,252', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2448', '江南区', '252', '20,252', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2449', '西乡塘区', '252', '20,252', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2450', '良庆区', '252', '20,252', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2451', '邕宁区', '252', '20,252', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2452', '武鸣县', '252', '20,252', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2453', '隆安县', '252', '20,252', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('2454', '马山县', '252', '20,252', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('2455', '上林县', '252', '20,252', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('2456', '宾阳县', '252', '20,252', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('2457', '横县', '252', '20,252', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('2458', '市辖区', '253', '20,253', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2459', '城中区', '253', '20,253', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2460', '鱼峰区', '253', '20,253', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2461', '柳南区', '253', '20,253', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2462', '柳北区', '253', '20,253', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2463', '柳江县', '253', '20,253', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2464', '柳城县', '253', '20,253', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2465', '鹿寨县', '253', '20,253', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2466', '融安县', '253', '20,253', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('2467', '融水苗族自治县', '253', '20,253', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('2468', '三江侗族自治县', '253', '20,253', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('2469', '市辖区', '254', '20,254', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2470', '秀峰区', '254', '20,254', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2471', '叠彩区', '254', '20,254', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2472', '象山区', '254', '20,254', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2473', '七星区', '254', '20,254', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2474', '雁山区', '254', '20,254', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2475', '阳朔县', '254', '20,254', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2476', '临桂县', '254', '20,254', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2477', '灵川县', '254', '20,254', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('2478', '全州县', '254', '20,254', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('2479', '兴安县', '254', '20,254', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('2480', '永福县', '254', '20,254', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('2481', '灌阳县', '254', '20,254', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('2482', '龙胜各族自治县', '254', '20,254', '3', '14', null, null, null);
INSERT INTO `sys_area` VALUES ('2483', '资源县', '254', '20,254', '3', '15', null, null, null);
INSERT INTO `sys_area` VALUES ('2484', '平乐县', '254', '20,254', '3', '16', null, null, null);
INSERT INTO `sys_area` VALUES ('2485', '荔蒲县', '254', '20,254', '3', '17', null, null, null);
INSERT INTO `sys_area` VALUES ('2486', '恭城瑶族自治县', '254', '20,254', '3', '18', null, null, null);
INSERT INTO `sys_area` VALUES ('2487', '市辖区', '255', '20,255', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2488', '万秀区', '255', '20,255', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2489', '蝶山区', '255', '20,255', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2490', '长洲区', '255', '20,255', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2491', '苍梧县', '255', '20,255', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2492', '藤县', '255', '20,255', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2493', '蒙山县', '255', '20,255', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2494', '岑溪市', '255', '20,255', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2495', '市辖区', '256', '20,256', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2496', '海城区', '256', '20,256', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2497', '银海区', '256', '20,256', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2498', '铁山港区', '256', '20,256', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2499', '合浦县', '256', '20,256', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2500', '市辖区', '257', '20,257', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2501', '港口区', '257', '20,257', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2502', '防城区', '257', '20,257', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2503', '上思县', '257', '20,257', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2504', '东兴市', '257', '20,257', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2505', '市辖区', '258', '20,258', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2506', '钦南区', '258', '20,258', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2507', '钦北区', '258', '20,258', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2508', '灵山县', '258', '20,258', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2509', '浦北县', '258', '20,258', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2510', '市辖区', '259', '20,259', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2511', '港北区', '259', '20,259', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2512', '港南区', '259', '20,259', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2513', '覃塘区', '259', '20,259', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2514', '平南县', '259', '20,259', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2515', '桂平市', '259', '20,259', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2516', '市辖区', '260', '20,260', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2517', '玉州区', '260', '20,260', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2518', '容县', '260', '20,260', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2519', '陆川县', '260', '20,260', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2520', '博白县', '260', '20,260', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2521', '兴业县', '260', '20,260', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2522', '北流市', '260', '20,260', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2523', '市辖区', '261', '20,261', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2524', '右江区', '261', '20,261', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2525', '田阳县', '261', '20,261', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2526', '田东县', '261', '20,261', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2527', '平果县', '261', '20,261', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2528', '德保县', '261', '20,261', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2529', '靖西县', '261', '20,261', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2530', '那坡县', '261', '20,261', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2531', '凌云县', '261', '20,261', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('2532', '乐业县', '261', '20,261', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('2533', '田林县', '261', '20,261', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('2534', '西林县', '261', '20,261', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('2535', '隆林各族自治县', '261', '20,261', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('2536', '市辖区', '262', '20,262', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2537', '八步区', '262', '20,262', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2538', '昭平县', '262', '20,262', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2539', '钟山县', '262', '20,262', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2540', '富川瑶族自治县', '262', '20,262', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2541', '市辖区', '263', '20,263', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2542', '金城江区', '263', '20,263', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2543', '南丹县', '263', '20,263', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2544', '天峨县', '263', '20,263', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2545', '凤山县', '263', '20,263', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2546', '东兰县', '263', '20,263', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2547', '罗城仫佬族自治县', '263', '20,263', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2548', '环江毛南族自治县', '263', '20,263', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2549', '巴马瑶族自治县', '263', '20,263', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('2550', '都安瑶族自治县', '263', '20,263', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('2551', '大化瑶族自治县', '263', '20,263', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('2552', '宜州市', '263', '20,263', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('2553', '市辖区', '264', '20,264', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2554', '兴宾区', '264', '20,264', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2555', '忻城县', '264', '20,264', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2556', '象州县', '264', '20,264', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2557', '武宣县', '264', '20,264', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2558', '金秀瑶族自治县', '264', '20,264', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2559', '合山市', '264', '20,264', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2560', '市辖区', '265', '20,265', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2561', '江洲区', '265', '20,265', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2562', '扶绥县', '265', '20,265', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2563', '宁明县', '265', '20,265', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2564', '龙州县', '265', '20,265', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2565', '大新县', '265', '20,265', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2566', '天等县', '265', '20,265', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2567', '凭祥市', '265', '20,265', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2568', '市辖区', '266', '21,266', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2569', '秀英区', '266', '21,266', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2570', '龙华区', '266', '21,266', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2571', '琼山区', '266', '21,266', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2572', '美兰区', '266', '21,266', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2573', '市辖区', '267', '21,267', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2574', '五指山市', '268', '21,268', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2575', '琼海市', '268', '21,268', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2576', '儋州市', '268', '21,268', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2577', '文昌市', '268', '21,268', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2578', '万宁市', '268', '21,268', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2579', '东方市', '268', '21,268', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2580', '定安县', '268', '21,268', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2581', '屯昌县', '268', '21,268', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2582', '澄迈县', '268', '21,268', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('2583', '临高县', '268', '21,268', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('2584', '白沙黎族自治县', '268', '21,268', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('2585', '昌江黎族自治县', '268', '21,268', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('2586', '乐东黎族自治县', '268', '21,268', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('2587', '陵水黎族自治县', '268', '21,268', '3', '14', null, null, null);
INSERT INTO `sys_area` VALUES ('2588', '保亭黎族苗族自治县', '268', '21,268', '3', '15', null, null, null);
INSERT INTO `sys_area` VALUES ('2589', '琼中黎族苗族自治县', '268', '21,268', '3', '16', null, null, null);
INSERT INTO `sys_area` VALUES ('2590', '西沙群岛', '268', '21,268', '3', '17', null, null, null);
INSERT INTO `sys_area` VALUES ('2591', '南沙群岛', '268', '21,268', '3', '18', null, null, null);
INSERT INTO `sys_area` VALUES ('2592', '中沙群岛的岛礁及其海域', '268', '21,268', '3', '19', null, null, null);
INSERT INTO `sys_area` VALUES ('2593', '万州区', '269', '22,269', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2594', '涪陵区', '269', '22,269', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2595', '渝中区', '269', '22,269', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2596', '大渡口区', '269', '22,269', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2597', '江北区', '269', '22,269', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2598', '沙坪坝区', '269', '22,269', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2599', '九龙坡区', '269', '22,269', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2600', '南岸区', '269', '22,269', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2601', '北碚区', '269', '22,269', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('2602', '万盛区', '269', '22,269', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('2603', '双桥区', '269', '22,269', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('2604', '渝北区', '269', '22,269', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('2605', '巴南区', '269', '22,269', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('2606', '黔江区', '269', '22,269', '3', '14', null, null, null);
INSERT INTO `sys_area` VALUES ('2607', '长寿区', '269', '22,269', '3', '15', null, null, null);
INSERT INTO `sys_area` VALUES ('2608', '綦江县', '22', '22,270', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2609', '潼南县', '22', '22,270', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2610', '铜梁县', '22', '22,270', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2611', '大足县', '22', '22,270', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2612', '荣昌县', '22', '22,270', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2613', '璧山县', '22', '22,270', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2614', '梁平县', '22', '22,270', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2615', '城口县', '22', '22,270', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2616', '丰都县', '22', '22,270', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('2617', '垫江县', '22', '22,270', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('2618', '武隆县', '22', '22,270', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('2619', '忠县', '22', '22,270', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('2620', '开县', '22', '22,270', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('2621', '云阳县', '22', '22,270', '3', '14', null, null, null);
INSERT INTO `sys_area` VALUES ('2622', '奉节县', '22', '22,270', '3', '15', null, null, null);
INSERT INTO `sys_area` VALUES ('2623', '巫山县', '22', '22,270', '3', '16', null, null, null);
INSERT INTO `sys_area` VALUES ('2624', '巫溪县', '22', '22,270', '3', '17', null, null, null);
INSERT INTO `sys_area` VALUES ('2625', '石柱土家族自治县', '22', '22,270', '3', '18', null, null, null);
INSERT INTO `sys_area` VALUES ('2626', '秀山土家族苗族自治县', '22', '22,270', '3', '19', null, null, null);
INSERT INTO `sys_area` VALUES ('2627', '酉阳土家族苗族自治县', '22', '22,270', '3', '20', null, null, null);
INSERT INTO `sys_area` VALUES ('2628', '彭水苗族土家族自治县', '22', '22,270', '3', '21', null, null, null);
INSERT INTO `sys_area` VALUES ('2629', '江津市', '271', '22,271', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2630', '合川市', '271', '22,271', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2631', '永川市', '271', '22,271', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2632', '南川市', '271', '22,271', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2633', '市辖区', '272', '23,272', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2634', '锦江区', '272', '23,272', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2635', '青羊区', '272', '23,272', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2636', '金牛区', '272', '23,272', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2637', '武侯区', '272', '23,272', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2638', '成华区', '272', '23,272', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2639', '龙泉驿区', '272', '23,272', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2640', '青白江区', '272', '23,272', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2641', '新都区', '272', '23,272', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('2642', '温江区', '272', '23,272', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('2643', '金堂县', '272', '23,272', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('2644', '双流县', '272', '23,272', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('2645', '郫县', '272', '23,272', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('2646', '大邑县', '272', '23,272', '3', '14', null, null, null);
INSERT INTO `sys_area` VALUES ('2647', '蒲江县', '272', '23,272', '3', '15', null, null, null);
INSERT INTO `sys_area` VALUES ('2648', '新津县', '272', '23,272', '3', '16', null, null, null);
INSERT INTO `sys_area` VALUES ('2649', '都江堰市', '272', '23,272', '3', '17', null, null, null);
INSERT INTO `sys_area` VALUES ('2650', '彭州市', '272', '23,272', '3', '18', null, null, null);
INSERT INTO `sys_area` VALUES ('2651', '邛崃市', '272', '23,272', '3', '19', null, null, null);
INSERT INTO `sys_area` VALUES ('2652', '崇州市', '272', '23,272', '3', '20', null, null, null);
INSERT INTO `sys_area` VALUES ('2653', '市辖区', '273', '23,273', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2654', '自流井区', '273', '23,273', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2655', '贡井区', '273', '23,273', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2656', '大安区', '273', '23,273', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2657', '沿滩区', '273', '23,273', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2658', '荣县', '273', '23,273', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2659', '富顺县', '273', '23,273', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2660', '市辖区', '274', '23,274', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2661', '东区', '274', '23,274', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2662', '西区', '274', '23,274', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2663', '仁和区', '274', '23,274', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2664', '米易县', '274', '23,274', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2665', '盐边县', '274', '23,274', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2666', '市辖区', '275', '23,275', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2667', '江阳区', '275', '23,275', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2668', '纳溪区', '275', '23,275', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2669', '龙马潭区', '275', '23,275', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2670', '泸县', '275', '23,275', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2671', '合江县', '275', '23,275', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2672', '叙永县', '275', '23,275', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2673', '古蔺县', '275', '23,275', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2674', '市辖区', '276', '23,276', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2675', '旌阳区', '276', '23,276', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2676', '中江县', '276', '23,276', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2677', '罗江县', '276', '23,276', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2678', '广汉市', '276', '23,276', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2679', '什邡市', '276', '23,276', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2680', '绵竹市', '276', '23,276', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2681', '市辖区', '277', '23,277', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2682', '涪城区', '277', '23,277', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2683', '游仙区', '277', '23,277', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2684', '三台县', '277', '23,277', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2685', '盐亭县', '277', '23,277', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2686', '安县', '277', '23,277', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2687', '梓潼县', '277', '23,277', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2688', '北川羌族自治县', '277', '23,277', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2689', '平武县', '277', '23,277', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('2690', '江油市', '277', '23,277', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('2691', '市辖区', '278', '23,278', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2692', '市中区', '278', '23,278', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2693', '元坝区', '278', '23,278', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2694', '朝天区', '278', '23,278', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2695', '旺苍县', '278', '23,278', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2696', '青川县', '278', '23,278', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2697', '剑阁县', '278', '23,278', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2698', '苍溪县', '278', '23,278', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2699', '市辖区', '279', '23,279', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2700', '船山区', '279', '23,279', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2701', '安居区', '279', '23,279', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2702', '蓬溪县', '279', '23,279', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2703', '射洪县', '279', '23,279', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2704', '大英县', '279', '23,279', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2705', '市辖区', '280', '23,280', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2706', '市中区', '280', '23,280', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2707', '东兴区', '280', '23,280', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2708', '威远县', '280', '23,280', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2709', '资中县', '280', '23,280', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2710', '隆昌县', '280', '23,280', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2711', '市辖区', '281', '23,281', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2712', '市中区', '281', '23,281', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2713', '沙湾区', '281', '23,281', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2714', '五通桥区', '281', '23,281', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2715', '金口河区', '281', '23,281', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2716', '犍为县', '281', '23,281', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2717', '井研县', '281', '23,281', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2718', '夹江县', '281', '23,281', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2719', '沐川县', '281', '23,281', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('2720', '峨边彝族自治县', '281', '23,281', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('2721', '马边彝族自治县', '281', '23,281', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('2722', '峨眉山市', '281', '23,281', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('2723', '市辖区', '282', '23,282', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2724', '顺庆区', '282', '23,282', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2725', '高坪区', '282', '23,282', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2726', '嘉陵区', '282', '23,282', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2727', '南部县', '282', '23,282', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2728', '营山县', '282', '23,282', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2729', '蓬安县', '282', '23,282', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2730', '仪陇县', '282', '23,282', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2731', '西充县', '282', '23,282', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('2732', '阆中市', '282', '23,282', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('2733', '市辖区', '283', '23,283', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2734', '东坡区', '283', '23,283', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2735', '仁寿县', '283', '23,283', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2736', '彭山县', '283', '23,283', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2737', '洪雅县', '283', '23,283', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2738', '丹棱县', '283', '23,283', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2739', '青神县', '283', '23,283', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2740', '市辖区', '284', '23,284', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2741', '翠屏区', '284', '23,284', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2742', '宜宾县', '284', '23,284', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2743', '南溪县', '284', '23,284', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2744', '江安县', '284', '23,284', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2745', '长宁县', '284', '23,284', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2746', '高县', '284', '23,284', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2747', '珙县', '284', '23,284', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2748', '筠连县', '284', '23,284', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('2749', '兴文县', '284', '23,284', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('2750', '屏山县', '284', '23,284', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('2751', '市辖区', '285', '23,285', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2752', '广安区', '285', '23,285', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2753', '岳池县', '285', '23,285', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2754', '武胜县', '285', '23,285', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2755', '邻水县', '285', '23,285', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2756', '华莹市', '285', '23,285', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2757', '市辖区', '286', '23,286', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2758', '通川区', '286', '23,286', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2759', '达县', '286', '23,286', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2760', '宣汉县', '286', '23,286', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2761', '开江县', '286', '23,286', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2762', '大竹县', '286', '23,286', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2763', '渠县', '286', '23,286', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2764', '万源市', '286', '23,286', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2765', '市辖区', '287', '23,287', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2766', '雨城区', '287', '23,287', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2767', '名山县', '287', '23,287', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2768', '荥经县', '287', '23,287', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2769', '汉源县', '287', '23,287', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2770', '石棉县', '287', '23,287', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2771', '天全县', '287', '23,287', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2772', '芦山县', '287', '23,287', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2773', '宝兴县', '287', '23,287', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('2774', '市辖区', '288', '23,288', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2775', '巴州区', '288', '23,288', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2776', '通江县', '288', '23,288', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2777', '南江县', '288', '23,288', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2778', '平昌县', '288', '23,288', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2779', '市辖区', '289', '23,289', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2780', '雁江区', '289', '23,289', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2781', '安岳县', '289', '23,289', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2782', '乐至县', '289', '23,289', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2783', '简阳市', '289', '23,289', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2784', '汶川县', '290', '23,290', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2785', '理县', '290', '23,290', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2786', '茂县', '290', '23,290', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2787', '松潘县', '290', '23,290', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2788', '九寨沟县', '290', '23,290', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2789', '金川县', '290', '23,290', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2790', '小金县', '290', '23,290', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2791', '黑水县', '290', '23,290', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2792', '马尔康县', '290', '23,290', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('2793', '壤塘县', '290', '23,290', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('2794', '阿坝县', '290', '23,290', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('2795', '若尔盖县', '290', '23,290', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('2796', '红原县', '290', '23,290', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('2797', '康定县', '291', '23,291', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2798', '泸定县', '291', '23,291', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2799', '丹巴县', '291', '23,291', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2800', '九龙县', '291', '23,291', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2801', '雅江县', '291', '23,291', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2802', '道孚县', '291', '23,291', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2803', '炉霍县', '291', '23,291', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2804', '甘孜县', '291', '23,291', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2805', '新龙县', '291', '23,291', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('2806', '德格县', '291', '23,291', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('2807', '白玉县', '291', '23,291', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('2808', '石渠县', '291', '23,291', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('2809', '色达县', '291', '23,291', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('2810', '理塘县', '291', '23,291', '3', '14', null, null, null);
INSERT INTO `sys_area` VALUES ('2811', '巴塘县', '291', '23,291', '3', '15', null, null, null);
INSERT INTO `sys_area` VALUES ('2812', '乡城县', '291', '23,291', '3', '16', null, null, null);
INSERT INTO `sys_area` VALUES ('2813', '稻城县', '291', '23,291', '3', '17', null, null, null);
INSERT INTO `sys_area` VALUES ('2814', '得荣县', '291', '23,291', '3', '18', null, null, null);
INSERT INTO `sys_area` VALUES ('2815', '西昌市', '292', '23,292', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2816', '木里藏族自治县', '292', '23,292', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2817', '盐源县', '292', '23,292', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2818', '德昌县', '292', '23,292', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2819', '会理县', '292', '23,292', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2820', '会东县', '292', '23,292', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2821', '宁南县', '292', '23,292', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2822', '普格县', '292', '23,292', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2823', '布拖县', '292', '23,292', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('2824', '金阳县', '292', '23,292', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('2825', '昭觉县', '292', '23,292', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('2826', '喜德县', '292', '23,292', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('2827', '冕宁县', '292', '23,292', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('2828', '越西县', '292', '23,292', '3', '14', null, null, null);
INSERT INTO `sys_area` VALUES ('2829', '甘洛县', '292', '23,292', '3', '15', null, null, null);
INSERT INTO `sys_area` VALUES ('2830', '美姑县', '292', '23,292', '3', '16', null, null, null);
INSERT INTO `sys_area` VALUES ('2831', '雷波县', '292', '23,292', '3', '17', null, null, null);
INSERT INTO `sys_area` VALUES ('2832', '市辖区', '293', '24,293', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2833', '南明区', '293', '24,293', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2834', '云岩区', '293', '24,293', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2835', '花溪区', '293', '24,293', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2836', '乌当区', '293', '24,293', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2837', '白云区', '293', '24,293', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2838', '小河区', '293', '24,293', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2839', '开阳县', '293', '24,293', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2840', '息烽县', '293', '24,293', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('2841', '修文县', '293', '24,293', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('2842', '清镇市', '293', '24,293', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('2843', '钟山区', '294', '24,294', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2844', '六枝特区', '294', '24,294', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2845', '水城县', '294', '24,294', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2846', '盘县', '294', '24,294', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2847', '市辖区', '295', '24,295', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2848', '红花岗区', '295', '24,295', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2849', '汇川区', '295', '24,295', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2850', '遵义县', '295', '24,295', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2851', '桐梓县', '295', '24,295', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2852', '绥阳县', '295', '24,295', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2853', '正安县', '295', '24,295', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2854', '道真仡佬族苗族自治县', '295', '24,295', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2855', '务川仡佬族苗族自治县', '295', '24,295', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('2856', '凤冈县', '295', '24,295', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('2857', '湄潭县', '295', '24,295', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('2858', '余庆县', '295', '24,295', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('2859', '习水县', '295', '24,295', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('2860', '赤水市', '295', '24,295', '3', '14', null, null, null);
INSERT INTO `sys_area` VALUES ('2861', '仁怀市', '295', '24,295', '3', '15', null, null, null);
INSERT INTO `sys_area` VALUES ('2862', '市辖区', '296', '24,296', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2863', '西秀区', '296', '24,296', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2864', '平坝县', '296', '24,296', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2865', '普定县', '296', '24,296', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2866', '镇宁布依族苗族自治县', '296', '24,296', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2867', '关岭布依族苗族自治县', '296', '24,296', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2868', '紫云苗族布依族自治县', '296', '24,296', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2869', '铜仁市', '297', '24,297', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2870', '江口县', '297', '24,297', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2871', '玉屏侗族自治县', '297', '24,297', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2872', '石阡县', '297', '24,297', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2873', '思南县', '297', '24,297', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2874', '印江土家族苗族自治县', '297', '24,297', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2875', '德江县', '297', '24,297', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2876', '沿河土家族自治县', '297', '24,297', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2877', '松桃苗族自治县', '297', '24,297', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('2878', '万山特区', '297', '24,297', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('2879', '兴义市', '298', '24,298', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2880', '兴仁县', '298', '24,298', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2881', '普安县', '298', '24,298', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2882', '晴隆县', '298', '24,298', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2883', '贞丰县', '298', '24,298', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2884', '望谟县', '298', '24,298', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2885', '册亨县', '298', '24,298', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2886', '安龙县', '298', '24,298', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2887', '毕节市', '299', '24,299', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2888', '大方县', '299', '24,299', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2889', '黔西县', '299', '24,299', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2890', '金沙县', '299', '24,299', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2891', '织金县', '299', '24,299', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2892', '纳雍县', '299', '24,299', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2893', '威宁彝族回族苗族自治县', '299', '24,299', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2894', '赫章县', '299', '24,299', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2895', '凯里市', '300', '24,300', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2896', '黄平县', '300', '24,300', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2897', '施秉县', '300', '24,300', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2898', '三穗县', '300', '24,300', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2899', '镇远县', '300', '24,300', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2900', '岑巩县', '300', '24,300', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2901', '天柱县', '300', '24,300', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2902', '锦屏县', '300', '24,300', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2903', '剑河县', '300', '24,300', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('2904', '台江县', '300', '24,300', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('2905', '黎平县', '300', '24,300', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('2906', '榕江县', '300', '24,300', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('2907', '从江县', '300', '24,300', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('2908', '雷山县', '300', '24,300', '3', '14', null, null, null);
INSERT INTO `sys_area` VALUES ('2909', '麻江县', '300', '24,300', '3', '15', null, null, null);
INSERT INTO `sys_area` VALUES ('2910', '丹寨县', '300', '24,300', '3', '16', null, null, null);
INSERT INTO `sys_area` VALUES ('2911', '都匀市', '301', '24,301', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2912', '福泉市', '301', '24,301', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2913', '荔波县', '301', '24,301', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2914', '贵定县', '301', '24,301', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2915', '瓮安县', '301', '24,301', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2916', '独山县', '301', '24,301', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2917', '平塘县', '301', '24,301', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2918', '罗甸县', '301', '24,301', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2919', '长顺县', '301', '24,301', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('2920', '龙里县', '301', '24,301', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('2921', '惠水县', '301', '24,301', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('2922', '三都水族自治县', '301', '24,301', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('2923', '市辖区', '302', '25,302', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2924', '五华区', '302', '25,302', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2925', '盘龙区', '302', '25,302', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2926', '官渡区', '302', '25,302', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2927', '西山区', '302', '25,302', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2928', '东川区', '302', '25,302', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2929', '呈贡县', '302', '25,302', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2930', '晋宁县', '302', '25,302', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2931', '富民县', '302', '25,302', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('2932', '宜良县', '302', '25,302', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('2933', '石林彝族自治县', '302', '25,302', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('2934', '嵩明县', '302', '25,302', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('2935', '禄劝彝族苗族自治县', '302', '25,302', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('2936', '寻甸回族彝族自治县', '302', '25,302', '3', '14', null, null, null);
INSERT INTO `sys_area` VALUES ('2937', '安宁市', '302', '25,302', '3', '15', null, null, null);
INSERT INTO `sys_area` VALUES ('2938', '市辖区', '303', '25,303', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2939', '麒麟区', '303', '25,303', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2940', '马龙县', '303', '25,303', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2941', '陆良县', '303', '25,303', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2942', '师宗县', '303', '25,303', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2943', '罗平县', '303', '25,303', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2944', '富源县', '303', '25,303', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2945', '会泽县', '303', '25,303', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2946', '沾益县', '303', '25,303', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('2947', '宣威市', '303', '25,303', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('2948', '市辖区', '304', '25,304', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2949', '红塔区', '304', '25,304', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2950', '江川县', '304', '25,304', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2951', '澄江县', '304', '25,304', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2952', '通海县', '304', '25,304', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2953', '华宁县', '304', '25,304', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2954', '易门县', '304', '25,304', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2955', '峨山彝族自治县', '304', '25,304', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2956', '新平彝族傣族自治县', '304', '25,304', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('2957', '元江哈尼族彝族傣族自治县', '304', '25,304', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('2958', '市辖区', '305', '25,305', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2959', '隆阳区', '305', '25,305', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2960', '施甸县', '305', '25,305', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2961', '腾冲县', '305', '25,305', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2962', '龙陵县', '305', '25,305', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2963', '昌宁县', '305', '25,305', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2964', '市辖区', '306', '25,306', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2965', '昭阳区', '306', '25,306', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2966', '鲁甸县', '306', '25,306', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2967', '巧家县', '306', '25,306', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2968', '盐津县', '306', '25,306', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2969', '大关县', '306', '25,306', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2970', '永善县', '306', '25,306', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2971', '绥江县', '306', '25,306', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2972', '镇雄县', '306', '25,306', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('2973', '彝良县', '306', '25,306', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('2974', '威信县', '306', '25,306', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('2975', '水富县', '306', '25,306', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('2976', '市辖区', '307', '25,307', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2977', '古城区', '307', '25,307', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2978', '玉龙纳西族自治县', '307', '25,307', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2979', '永胜县', '307', '25,307', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2980', '华坪县', '307', '25,307', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2981', '宁蒗彝族自治县', '307', '25,307', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2982', '市辖区', '308', '25,308', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2983', '翠云区', '308', '25,308', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2984', '普洱哈尼族彝族自治县', '308', '25,308', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2985', '墨江哈尼族自治县', '308', '25,308', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2986', '景东彝族自治县', '308', '25,308', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2987', '景谷傣族彝族自治县', '308', '25,308', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2988', '镇沅彝族哈尼族拉祜族自治县', '308', '25,308', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('2989', '江城哈尼族彝族自治县', '308', '25,308', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('2990', '孟连傣族拉祜族佤族自治县', '308', '25,308', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('2991', '澜沧拉祜族自治县', '308', '25,308', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('2992', '西盟佤族自治县', '308', '25,308', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('2993', '市辖区', '309', '25,309', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('2994', '临翔区', '309', '25,309', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('2995', '凤庆县', '309', '25,309', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('2996', '云县', '309', '25,309', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('2997', '永德县', '309', '25,309', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('2998', '镇康县', '309', '25,309', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('2999', '双江拉祜族佤族布朗族傣族自治县', '309', '25,309', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('3000', '耿马傣族佤族自治县', '309', '25,309', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('3001', '沧源佤族自治县', '309', '25,309', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('3002', '楚雄市', '310', '25,310', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3003', '双柏县', '310', '25,310', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3004', '牟定县', '310', '25,310', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3005', '南华县', '310', '25,310', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('3006', '姚安县', '310', '25,310', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('3007', '大姚县', '310', '25,310', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('3008', '永仁县', '310', '25,310', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('3009', '元谋县', '310', '25,310', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('3010', '武定县', '310', '25,310', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('3011', '禄丰县', '310', '25,310', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('3012', '个旧市', '311', '25,311', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3013', '开远市', '311', '25,311', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3014', '蒙自县', '311', '25,311', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3015', '屏边苗族自治县', '311', '25,311', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('3016', '建水县', '311', '25,311', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('3017', '石屏县', '311', '25,311', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('3018', '弥勒县', '311', '25,311', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('3019', '泸西县', '311', '25,311', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('3020', '元阳县', '311', '25,311', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('3021', '红河县', '311', '25,311', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('3022', '金平苗族瑶族傣族自治县', '311', '25,311', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('3023', '绿春县', '311', '25,311', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('3024', '河口瑶族自治县', '311', '25,311', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('3025', '文山县', '312', '25,312', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3026', '砚山县', '312', '25,312', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3027', '西畴县', '312', '25,312', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3028', '麻栗坡县', '312', '25,312', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('3029', '马关县', '312', '25,312', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('3030', '丘北县', '312', '25,312', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('3031', '广南县', '312', '25,312', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('3032', '富宁县', '312', '25,312', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('3033', '景洪市', '313', '25,313', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3034', '勐海县', '313', '25,313', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3035', '勐腊县', '313', '25,313', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3036', '大理市', '314', '25,314', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3037', '漾濞彝族自治县', '314', '25,314', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3038', '祥云县', '314', '25,314', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3039', '宾川县', '314', '25,314', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('3040', '弥渡县', '314', '25,314', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('3041', '南涧彝族自治县', '314', '25,314', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('3042', '巍山彝族回族自治县', '314', '25,314', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('3043', '永平县', '314', '25,314', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('3044', '云龙县', '314', '25,314', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('3045', '洱源县', '314', '25,314', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('3046', '剑川县', '314', '25,314', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('3047', '鹤庆县', '314', '25,314', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('3048', '瑞丽市', '315', '25,315', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3049', '潞西市', '315', '25,315', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3050', '梁河县', '315', '25,315', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3051', '盈江县', '315', '25,315', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('3052', '陇川县', '315', '25,315', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('3053', '泸水县', '316', '25,316', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3054', '福贡县', '316', '25,316', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3055', '贡山独龙族怒族自治县', '316', '25,316', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3056', '兰坪白族普米族自治县', '316', '25,316', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('3057', '香格里拉县', '317', '25,317', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3058', '德钦县', '317', '25,317', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3059', '维西傈僳族自治县', '317', '25,317', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3060', '市辖区', '318', '26,318', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3061', '城关区', '318', '26,318', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3062', '林周县', '318', '26,318', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3063', '当雄县', '318', '26,318', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('3064', '尼木县', '318', '26,318', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('3065', '曲水县', '318', '26,318', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('3066', '堆龙德庆县', '318', '26,318', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('3067', '达孜县', '318', '26,318', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('3068', '墨竹工卡县', '318', '26,318', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('3069', '昌都县', '319', '26,319', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3070', '江达县', '319', '26,319', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3071', '贡觉县', '319', '26,319', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3072', '类乌齐县', '319', '26,319', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('3073', '丁青县', '319', '26,319', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('3074', '察雅县', '319', '26,319', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('3075', '八宿县', '319', '26,319', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('3076', '左贡县', '319', '26,319', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('3077', '芒康县', '319', '26,319', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('3078', '洛隆县', '319', '26,319', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('3079', '边坝县', '319', '26,319', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('3080', '乃东县', '320', '26,320', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3081', '扎囊县', '320', '26,320', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3082', '贡嘎县', '320', '26,320', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3083', '桑日县', '320', '26,320', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('3084', '琼结县', '320', '26,320', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('3085', '曲松县', '320', '26,320', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('3086', '措美县', '320', '26,320', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('3087', '洛扎县', '320', '26,320', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('3088', '加查县', '320', '26,320', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('3089', '隆子县', '320', '26,320', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('3090', '错那县', '320', '26,320', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('3091', '浪卡子县', '320', '26,320', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('3092', '日喀则市', '321', '26,321', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3093', '南木林县', '321', '26,321', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3094', '江孜县', '321', '26,321', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3095', '定日县', '321', '26,321', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('3096', '萨迦县', '321', '26,321', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('3097', '拉孜县', '321', '26,321', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('3098', '昂仁县', '321', '26,321', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('3099', '谢通门县', '321', '26,321', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('3100', '白朗县', '321', '26,321', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('3101', '仁布县', '321', '26,321', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('3102', '康马县', '321', '26,321', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('3103', '定结县', '321', '26,321', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('3104', '仲巴县', '321', '26,321', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('3105', '亚东县', '321', '26,321', '3', '14', null, null, null);
INSERT INTO `sys_area` VALUES ('3106', '吉隆县', '321', '26,321', '3', '15', null, null, null);
INSERT INTO `sys_area` VALUES ('3107', '聂拉木县', '321', '26,321', '3', '16', null, null, null);
INSERT INTO `sys_area` VALUES ('3108', '萨嘎县', '321', '26,321', '3', '17', null, null, null);
INSERT INTO `sys_area` VALUES ('3109', '岗巴县', '321', '26,321', '3', '18', null, null, null);
INSERT INTO `sys_area` VALUES ('3110', '那曲县', '322', '26,322', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3111', '嘉黎县', '322', '26,322', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3112', '比如县', '322', '26,322', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3113', '聂荣县', '322', '26,322', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('3114', '安多县', '322', '26,322', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('3115', '申扎县', '322', '26,322', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('3116', '索县', '322', '26,322', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('3117', '班戈县', '322', '26,322', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('3118', '巴青县', '322', '26,322', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('3119', '尼玛县', '322', '26,322', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('3120', '普兰县', '323', '26,323', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3121', '札达县', '323', '26,323', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3122', '噶尔县', '323', '26,323', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3123', '日土县', '323', '26,323', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('3124', '革吉县', '323', '26,323', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('3125', '改则县', '323', '26,323', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('3126', '措勤县', '323', '26,323', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('3127', '林芝县', '324', '26,324', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3128', '工布江达县', '324', '26,324', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3129', '米林县', '324', '26,324', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3130', '墨脱县', '324', '26,324', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('3131', '波密县', '324', '26,324', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('3132', '察隅县', '324', '26,324', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('3133', '朗县', '324', '26,324', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('3134', '市辖区', '325', '27,325', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3135', '新城区', '325', '27,325', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3136', '碑林区', '325', '27,325', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3137', '莲湖区', '325', '27,325', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('3138', '灞桥区', '325', '27,325', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('3139', '未央区', '325', '27,325', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('3140', '雁塔区', '325', '27,325', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('3141', '阎良区', '325', '27,325', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('3142', '临潼区', '325', '27,325', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('3143', '长安区', '325', '27,325', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('3144', '蓝田县', '325', '27,325', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('3145', '周至县', '325', '27,325', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('3146', '户县', '325', '27,325', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('3147', '高陵县', '325', '27,325', '3', '14', null, null, null);
INSERT INTO `sys_area` VALUES ('3148', '市辖区', '326', '27,326', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3149', '王益区', '326', '27,326', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3150', '印台区', '326', '27,326', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3151', '耀州区', '326', '27,326', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('3152', '宜君县', '326', '27,326', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('3153', '市辖区', '327', '27,327', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3154', '渭滨区', '327', '27,327', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3155', '金台区', '327', '27,327', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3156', '陈仓区', '327', '27,327', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('3157', '凤翔县', '327', '27,327', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('3158', '岐山县', '327', '27,327', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('3159', '扶风县', '327', '27,327', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('3160', '眉县', '327', '27,327', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('3161', '陇县', '327', '27,327', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('3162', '千阳县', '327', '27,327', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('3163', '麟游县', '327', '27,327', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('3164', '凤县', '327', '27,327', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('3165', '太白县', '327', '27,327', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('3166', '市辖区', '328', '27,328', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3167', '秦都区', '328', '27,328', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3168', '杨凌区', '328', '27,328', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3169', '渭城区', '328', '27,328', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('3170', '三原县', '328', '27,328', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('3171', '泾阳县', '328', '27,328', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('3172', '乾县', '328', '27,328', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('3173', '礼泉县', '328', '27,328', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('3174', '永寿县', '328', '27,328', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('3175', '彬县', '328', '27,328', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('3176', '长武县', '328', '27,328', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('3177', '旬邑县', '328', '27,328', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('3178', '淳化县', '328', '27,328', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('3179', '武功县', '328', '27,328', '3', '14', null, null, null);
INSERT INTO `sys_area` VALUES ('3180', '兴平市', '328', '27,328', '3', '15', null, null, null);
INSERT INTO `sys_area` VALUES ('3181', '市辖区', '329', '27,329', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3182', '临渭区', '329', '27,329', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3183', '华县', '329', '27,329', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3184', '潼关县', '329', '27,329', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('3185', '大荔县', '329', '27,329', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('3186', '合阳县', '329', '27,329', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('3187', '澄城县', '329', '27,329', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('3188', '蒲城县', '329', '27,329', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('3189', '白水县', '329', '27,329', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('3190', '富平县', '329', '27,329', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('3191', '韩城市', '329', '27,329', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('3192', '华阴市', '329', '27,329', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('3193', '市辖区', '330', '27,330', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3194', '宝塔区', '330', '27,330', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3195', '延长县', '330', '27,330', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3196', '延川县', '330', '27,330', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('3197', '子长县', '330', '27,330', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('3198', '安塞县', '330', '27,330', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('3199', '志丹县', '330', '27,330', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('3200', '吴旗县', '330', '27,330', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('3201', '甘泉县', '330', '27,330', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('3202', '富县', '330', '27,330', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('3203', '洛川县', '330', '27,330', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('3204', '宜川县', '330', '27,330', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('3205', '黄龙县', '330', '27,330', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('3206', '黄陵县', '330', '27,330', '3', '14', null, null, null);
INSERT INTO `sys_area` VALUES ('3207', '市辖区', '331', '27,331', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3208', '汉台区', '331', '27,331', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3209', '南郑县', '331', '27,331', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3210', '城固县', '331', '27,331', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('3211', '洋县', '331', '27,331', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('3212', '西乡县', '331', '27,331', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('3213', '勉县', '331', '27,331', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('3214', '宁强县', '331', '27,331', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('3215', '略阳县', '331', '27,331', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('3216', '镇巴县', '331', '27,331', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('3217', '留坝县', '331', '27,331', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('3218', '佛坪县', '331', '27,331', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('3219', '市辖区', '332', '27,332', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3220', '榆阳区', '332', '27,332', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3221', '神木县', '332', '27,332', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3222', '府谷县', '332', '27,332', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('3223', '横山县', '332', '27,332', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('3224', '靖边县', '332', '27,332', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('3225', '定边县', '332', '27,332', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('3226', '绥德县', '332', '27,332', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('3227', '米脂县', '332', '27,332', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('3228', '佳县', '332', '27,332', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('3229', '吴堡县', '332', '27,332', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('3230', '清涧县', '332', '27,332', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('3231', '子洲县', '332', '27,332', '3', '13', null, null, null);
INSERT INTO `sys_area` VALUES ('3232', '市辖区', '333', '27,333', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3233', '汉滨区', '333', '27,333', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3234', '汉阴县', '333', '27,333', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3235', '石泉县', '333', '27,333', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('3236', '宁陕县', '333', '27,333', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('3237', '紫阳县', '333', '27,333', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('3238', '岚皋县', '333', '27,333', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('3239', '平利县', '333', '27,333', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('3240', '镇坪县', '333', '27,333', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('3241', '旬阳县', '333', '27,333', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('3242', '白河县', '333', '27,333', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('3243', '市辖区', '334', '27,334', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3244', '商州区', '334', '27,334', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3245', '洛南县', '334', '27,334', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3246', '丹凤县', '334', '27,334', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('3247', '商南县', '334', '27,334', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('3248', '山阳县', '334', '27,334', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('3249', '镇安县', '334', '27,334', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('3250', '柞水县', '334', '27,334', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('3251', '市辖区', '335', '28,335', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3252', '城关区', '335', '28,335', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3253', '七里河区', '335', '28,335', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3254', '西固区', '335', '28,335', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('3255', '安宁区', '335', '28,335', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('3256', '红古区', '335', '28,335', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('3257', '永登县', '335', '28,335', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('3258', '皋兰县', '335', '28,335', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('3259', '榆中县', '335', '28,335', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('3260', '市辖区', '336', '28,336', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3261', '市辖区', '337', '28,337', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3262', '金川区', '337', '28,337', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3263', '永昌县', '337', '28,337', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3264', '市辖区', '338', '28,338', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3265', '白银区', '338', '28,338', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3266', '平川区', '338', '28,338', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3267', '靖远县', '338', '28,338', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('3268', '会宁县', '338', '28,338', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('3269', '景泰县', '338', '28,338', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('3270', '市辖区', '339', '28,339', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3271', '秦城区', '339', '28,339', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3272', '北道区', '339', '28,339', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3273', '清水县', '339', '28,339', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('3274', '秦安县', '339', '28,339', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('3275', '甘谷县', '339', '28,339', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('3276', '武山县', '339', '28,339', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('3277', '张家川回族自治县', '339', '28,339', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('3278', '市辖区', '340', '28,340', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3279', '凉州区', '340', '28,340', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3280', '民勤县', '340', '28,340', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3281', '古浪县', '340', '28,340', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('3282', '天祝藏族自治县', '340', '28,340', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('3283', '市辖区', '341', '28,341', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3284', '甘州区', '341', '28,341', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3285', '肃南裕固族自治县', '341', '28,341', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3286', '民乐县', '341', '28,341', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('3287', '临泽县', '341', '28,341', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('3288', '高台县', '341', '28,341', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('3289', '山丹县', '341', '28,341', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('3290', '市辖区', '342', '28,342', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3291', '崆峒区', '342', '28,342', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3292', '泾川县', '342', '28,342', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3293', '灵台县', '342', '28,342', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('3294', '崇信县', '342', '28,342', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('3295', '华亭县', '342', '28,342', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('3296', '庄浪县', '342', '28,342', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('3297', '静宁县', '342', '28,342', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('3298', '市辖区', '343', '28,343', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3299', '肃州区', '343', '28,343', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3300', '金塔县', '343', '28,343', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3301', '安西县', '343', '28,343', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('3302', '肃北蒙古族自治县', '343', '28,343', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('3303', '阿克塞哈萨克族自治县', '343', '28,343', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('3304', '玉门市', '343', '28,343', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('3305', '敦煌市', '343', '28,343', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('3306', '市辖区', '344', '28,344', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3307', '西峰区', '344', '28,344', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3308', '庆城县', '344', '28,344', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3309', '环县', '344', '28,344', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('3310', '华池县', '344', '28,344', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('3311', '合水县', '344', '28,344', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('3312', '正宁县', '344', '28,344', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('3313', '宁县', '344', '28,344', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('3314', '镇原县', '344', '28,344', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('3315', '市辖区', '345', '28,345', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3316', '安定区', '345', '28,345', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3317', '通渭县', '345', '28,345', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3318', '陇西县', '345', '28,345', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('3319', '渭源县', '345', '28,345', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('3320', '临洮县', '345', '28,345', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('3321', '漳县', '345', '28,345', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('3322', '岷县', '345', '28,345', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('3323', '市辖区', '346', '28,346', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3324', '武都区', '346', '28,346', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3325', '成县', '346', '28,346', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3326', '文县', '346', '28,346', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('3327', '宕昌县', '346', '28,346', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('3328', '康县', '346', '28,346', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('3329', '西和县', '346', '28,346', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('3330', '礼县', '346', '28,346', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('3331', '徽县', '346', '28,346', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('3332', '两当县', '346', '28,346', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('3333', '临夏市', '347', '28,347', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3334', '临夏县', '347', '28,347', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3335', '康乐县', '347', '28,347', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3336', '永靖县', '347', '28,347', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('3337', '广河县', '347', '28,347', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('3338', '和政县', '347', '28,347', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('3339', '东乡族自治县', '347', '28,347', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('3340', '积石山保安族东乡族撒拉族自治县', '347', '28,347', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('3341', '合作市', '348', '28,348', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3342', '临潭县', '348', '28,348', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3343', '卓尼县', '348', '28,348', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3344', '舟曲县', '348', '28,348', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('3345', '迭部县', '348', '28,348', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('3346', '玛曲县', '348', '28,348', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('3347', '碌曲县', '348', '28,348', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('3348', '夏河县', '348', '28,348', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('3349', '市辖区', '349', '29,349', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3350', '城东区', '349', '29,349', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3351', '城中区', '349', '29,349', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3352', '城西区', '349', '29,349', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('3353', '城北区', '349', '29,349', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('3354', '大通回族土族自治县', '349', '29,349', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('3355', '湟中县', '349', '29,349', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('3356', '湟源县', '349', '29,349', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('3357', '平安县', '350', '29,350', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3358', '民和回族土族自治县', '350', '29,350', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3359', '乐都县', '350', '29,350', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3360', '互助土族自治县', '350', '29,350', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('3361', '化隆回族自治县', '350', '29,350', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('3362', '循化撒拉族自治县', '350', '29,350', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('3363', '门源回族自治县', '351', '29,351', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3364', '祁连县', '351', '29,351', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3365', '海晏县', '351', '29,351', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3366', '刚察县', '351', '29,351', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('3367', '同仁县', '352', '29,352', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3368', '尖扎县', '352', '29,352', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3369', '泽库县', '352', '29,352', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3370', '河南蒙古族自治县', '352', '29,352', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('3371', '共和县', '353', '29,353', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3372', '同德县', '353', '29,353', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3373', '贵德县', '353', '29,353', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3374', '兴海县', '353', '29,353', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('3375', '贵南县', '353', '29,353', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('3376', '玛沁县', '354', '29,354', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3377', '班玛县', '354', '29,354', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3378', '甘德县', '354', '29,354', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3379', '达日县', '354', '29,354', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('3380', '久治县', '354', '29,354', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('3381', '玛多县', '354', '29,354', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('3382', '玉树县', '355', '29,355', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3383', '杂多县', '355', '29,355', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3384', '称多县', '355', '29,355', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3385', '治多县', '355', '29,355', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('3386', '囊谦县', '355', '29,355', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('3387', '曲麻莱县', '355', '29,355', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('3388', '格尔木市', '356', '29,356', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3389', '德令哈市', '356', '29,356', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3390', '乌兰县', '356', '29,356', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3391', '都兰县', '356', '29,356', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('3392', '天峻县', '356', '29,356', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('3393', '市辖区', '357', '30,357', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3394', '兴庆区', '357', '30,357', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3395', '西夏区', '357', '30,357', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3396', '金凤区', '357', '30,357', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('3397', '永宁县', '357', '30,357', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('3398', '贺兰县', '357', '30,357', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('3399', '灵武市', '357', '30,357', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('3400', '市辖区', '358', '30,358', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3401', '大武口区', '358', '30,358', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3402', '惠农区', '358', '30,358', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3403', '平罗县', '358', '30,358', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('3404', '市辖区', '359', '30,359', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3405', '利通区', '359', '30,359', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3406', '盐池县', '359', '30,359', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3407', '同心县', '359', '30,359', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('3408', '青铜峡市', '359', '30,359', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('3409', '市辖区', '360', '30,360', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3410', '原州区', '360', '30,360', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3411', '西吉县', '360', '30,360', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3412', '隆德县', '360', '30,360', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('3413', '泾源县', '360', '30,360', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('3414', '彭阳县', '360', '30,360', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('3415', '市辖区', '361', '30,361', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3416', '沙坡头区', '361', '30,361', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3417', '中宁县', '361', '30,361', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3418', '海原县', '361', '30,361', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('3419', '市辖区', '362', '31,362', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3420', '天山区', '362', '31,362', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3421', '沙依巴克区', '362', '31,362', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3422', '新市区', '362', '31,362', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('3423', '水磨沟区', '362', '31,362', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('3424', '头屯河区', '362', '31,362', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('3425', '达坂城区', '362', '31,362', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('3426', '东山区', '362', '31,362', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('3427', '乌鲁木齐县', '362', '31,362', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('3428', '市辖区', '363', '31,363', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3429', '独山子区', '363', '31,363', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3430', '克拉玛依区', '363', '31,363', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3431', '白碱滩区', '363', '31,363', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('3432', '乌尔禾区', '363', '31,363', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('3433', '吐鲁番市', '364', '31,364', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3434', '鄯善县', '364', '31,364', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3435', '托克逊县', '364', '31,364', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3436', '哈密市', '365', '31,365', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3437', '巴里坤哈萨克自治县', '365', '31,365', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3438', '伊吾县', '365', '31,365', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3439', '昌吉市', '366', '31,366', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3440', '阜康市', '366', '31,366', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3441', '米泉市', '366', '31,366', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3442', '呼图壁县', '366', '31,366', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('3443', '玛纳斯县', '366', '31,366', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('3444', '奇台县', '366', '31,366', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('3445', '吉木萨尔县', '366', '31,366', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('3446', '木垒哈萨克自治县', '366', '31,366', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('3447', '博乐市', '367', '31,367', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3448', '精河县', '367', '31,367', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3449', '温泉县', '367', '31,367', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3450', '库尔勒市', '368', '31,368', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3451', '轮台县', '368', '31,368', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3452', '尉犁县', '368', '31,368', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3453', '若羌县', '368', '31,368', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('3454', '且末县', '368', '31,368', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('3455', '焉耆回族自治县', '368', '31,368', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('3456', '和静县', '368', '31,368', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('3457', '和硕县', '368', '31,368', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('3458', '博湖县', '368', '31,368', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('3459', '阿克苏市', '369', '31,369', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3460', '温宿县', '369', '31,369', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3461', '库车县', '369', '31,369', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3462', '沙雅县', '369', '31,369', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('3463', '新和县', '369', '31,369', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('3464', '拜城县', '369', '31,369', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('3465', '乌什县', '369', '31,369', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('3466', '阿瓦提县', '369', '31,369', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('3467', '柯坪县', '369', '31,369', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('3468', '阿图什市', '370', '31,370', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3469', '阿克陶县', '370', '31,370', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3470', '阿合奇县', '370', '31,370', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3471', '乌恰县', '370', '31,370', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('3472', '喀什市', '371', '31,371', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3473', '疏附县', '371', '31,371', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3474', '疏勒县', '371', '31,371', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3475', '英吉沙县', '371', '31,371', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('3476', '泽普县', '371', '31,371', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('3477', '莎车县', '371', '31,371', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('3478', '叶城县', '371', '31,371', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('3479', '麦盖提县', '371', '31,371', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('3480', '岳普湖县', '371', '31,371', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('3481', '伽师县', '371', '31,371', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('3482', '巴楚县', '371', '31,371', '3', '11', null, null, null);
INSERT INTO `sys_area` VALUES ('3483', '塔什库尔干塔吉克自治县', '371', '31,371', '3', '12', null, null, null);
INSERT INTO `sys_area` VALUES ('3484', '和田市', '372', '31,372', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3485', '和田县', '372', '31,372', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3486', '墨玉县', '372', '31,372', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3487', '皮山县', '372', '31,372', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('3488', '洛浦县', '372', '31,372', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('3489', '策勒县', '372', '31,372', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('3490', '于田县', '372', '31,372', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('3491', '民丰县', '372', '31,372', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('3492', '伊宁市', '373', '31,373', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3493', '奎屯市', '373', '31,373', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3494', '伊宁县', '373', '31,373', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3495', '察布查尔锡伯自治县', '373', '31,373', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('3496', '霍城县', '373', '31,373', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('3497', '巩留县', '373', '31,373', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('3498', '新源县', '373', '31,373', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('3499', '昭苏县', '373', '31,373', '3', '8', null, null, null);
INSERT INTO `sys_area` VALUES ('3500', '特克斯县', '373', '31,373', '3', '9', null, null, null);
INSERT INTO `sys_area` VALUES ('3501', '尼勒克县', '373', '31,373', '3', '10', null, null, null);
INSERT INTO `sys_area` VALUES ('3502', '塔城市', '374', '31,374', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3503', '乌苏市', '374', '31,374', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3504', '额敏县', '374', '31,374', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3505', '沙湾县', '374', '31,374', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('3506', '托里县', '374', '31,374', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('3507', '裕民县', '374', '31,374', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('3508', '和布克赛尔蒙古自治县', '374', '31,374', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('3509', '阿勒泰市', '375', '31,375', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3510', '布尔津县', '375', '31,375', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3511', '富蕴县', '375', '31,375', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3512', '福海县', '375', '31,375', '3', '4', null, null, null);
INSERT INTO `sys_area` VALUES ('3513', '哈巴河县', '375', '31,375', '3', '5', null, null, null);
INSERT INTO `sys_area` VALUES ('3514', '青河县', '375', '31,375', '3', '6', null, null, null);
INSERT INTO `sys_area` VALUES ('3515', '吉木乃县', '375', '31,375', '3', '7', null, null, null);
INSERT INTO `sys_area` VALUES ('3516', '石河子市', '375', '31,375', '3', '1', null, null, null);
INSERT INTO `sys_area` VALUES ('3517', '阿拉尔市', '375', '31,375', '3', '2', null, null, null);
INSERT INTO `sys_area` VALUES ('3518', '图木舒克市', '375', '31,375', '3', '3', null, null, null);
INSERT INTO `sys_area` VALUES ('3519', '五家渠市', '375', '31,375', '3', '4', null, null, null);
INSERT INTO `sys_form` VALUES ('214', 'bbs_module', '', '1', null, '0');
INSERT INTO `sys_form` VALUES ('215', 'bbs_post', '', '1', null, '0');
INSERT INTO `sys_form` VALUES ('216', 'bbs_reply', '', '1', null, '0');
INSERT INTO `sys_form` VALUES ('217', 'bbs_topic', '', '1', null, '0');
INSERT INTO `sys_form` VALUES ('218', 'biz_vender', '厂商厂家', '1', null, '0');
INSERT INTO `sys_form` VALUES ('219', 'crm_customer', '', '1', null, '0');
INSERT INTO `sys_form` VALUES ('220', 'fa_taxrate', '税率', '1', null, '0');
INSERT INTO `sys_form` VALUES ('221', 'fa_wagepay', '工资发放', '1', null, '0');
INSERT INTO `sys_form` VALUES ('222', 'hr_employee', '', '1', null, '0');
INSERT INTO `sys_form` VALUES ('223', 'hr_wages', '薪资', '1', null, '0');
INSERT INTO `sys_form` VALUES ('224', 'oa_article', '文章', '1', null, '0');
INSERT INTO `sys_form` VALUES ('225', 'oa_articlecate', '文章分类', '1', null, '0');
INSERT INTO `sys_form` VALUES ('226', 'oa_articlerange', '文章阅读范围', '1', null, '0');
INSERT INTO `sys_form` VALUES ('227', 'oa_articleread', '文章阅读记录', '1', null, '0');
INSERT INTO `sys_form` VALUES ('228', 'oa_beiwanglu', '备忘录', '1', null, '0');
INSERT INTO `sys_form` VALUES ('229', 'oa_bwlpinglun', '备忘录评论', '1', null, '0');
INSERT INTO `sys_form` VALUES ('230', 'oa_bwlshare', '备忘录共享', '1', null, '0');
INSERT INTO `sys_form` VALUES ('231', 'oa_calendar', '', '1', null, '0');
INSERT INTO `sys_form` VALUES ('232', 'oa_doccate', '文档分类', '1', null, '0');
INSERT INTO `sys_form` VALUES ('233', 'oa_docrange', '文档阅读范围', '1', null, '0');
INSERT INTO `sys_form` VALUES ('234', 'oa_document', '文档', '1', null, '0');
INSERT INTO `sys_form` VALUES ('235', 'oa_emailbox', '邮件', '1', null, '0');
INSERT INTO `sys_form` VALUES ('236', 'oa_emailset', '邮箱设置', '1', null, '0');
INSERT INTO `sys_form` VALUES ('237', 'oa_filebox', '文件站', '1', null, '0');
INSERT INTO `sys_form` VALUES ('238', 'oa_gglan', '公告栏', '1', null, '0');
INSERT INTO `sys_form` VALUES ('239', 'oa_ggreadlist', '公告查阅列表', '1', null, '0');
INSERT INTO `sys_form` VALUES ('240', 'oa_gonggao', '公告', '1', null, '0');
INSERT INTO `sys_form` VALUES ('241', 'oa_meeting', '会议', '1', null, '0');
INSERT INTO `sys_form` VALUES ('242', 'oa_meetingjoin', '与会人员', '1', null, '0');
INSERT INTO `sys_form` VALUES ('243', 'oa_meetingrecord', '会议记录', '1', null, '0');
INSERT INTO `sys_form` VALUES ('244', 'oa_weibo', '微博', '1', null, '0');
INSERT INTO `sys_form` VALUES ('245', 'oa_weibopl', '微博评论', '1', null, '0');
INSERT INTO `sys_form` VALUES ('246', 'sys_area', '', '1', null, '0');
INSERT INTO `sys_form` VALUES ('247', 'sys_form', '表单', '1', null, '0');
INSERT INTO `sys_form` VALUES ('248', 'sys_formfield', '表单属性', '1', null, '0');
INSERT INTO `sys_form` VALUES ('249', 'sys_loginlog', '', '1', null, '0');
INSERT INTO `sys_form` VALUES ('250', 'sys_menu', '', '1', null, '0');
INSERT INTO `sys_form` VALUES ('251', 'sys_operalog', '', '1', null, '0');
INSERT INTO `sys_form` VALUES ('252', 'sys_param', '', '1', null, '0');
INSERT INTO `sys_form` VALUES ('253', 'sys_parame', '', '1', null, '0');
INSERT INTO `sys_form` VALUES ('254', 'sys_partment', '', '1', null, '0');
INSERT INTO `sys_form` VALUES ('255', 'sys_post', '', '1', null, '0');
INSERT INTO `sys_form` VALUES ('256', 'sys_powermenu', '', '1', null, '0');
INSERT INTO `sys_form` VALUES ('257', 'sys_role', '', '1', null, '0');
INSERT INTO `sys_form` VALUES ('258', 'sys_userrole', '', '1', null, '0');
INSERT INTO `sys_formfield` VALUES ('224', '214', 'id', '', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('225', '214', 'name', '', null, 'varchar(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('226', '214', 'detail', '', null, 'varchar(100)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('227', '214', 'turn', '', null, 'tinyint(2)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('228', '215', 'id', '', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('229', '215', 'topicID', '', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('230', '215', 'userID', '', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('231', '215', 'content', '', null, 'text', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('232', '215', 'createTime', '', null, 'timestamp', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('233', '215', 'hasReply', '', null, 'bit(1)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('234', '215', 'updateTime', '', null, 'timestamp', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('235', '216', 'id', '', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('236', '216', 'topicID', '', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('237', '216', 'postID', '', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('238', '216', 'userID', '', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('239', '216', 'content', '', null, 'varchar(300)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('240', '216', 'createTime', '', null, 'timestamp', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('241', '217', 'id', '', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('242', '217', 'userID', '', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('243', '217', 'moduleID', '', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('244', '217', 'postCount', '', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('245', '217', 'replyCount', '', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('246', '217', 'pv', '', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('247', '217', 'content', '', null, 'varchar(60)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('248', '217', 'emotion', '', null, 'tinyint(2)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('249', '217', 'createTime', '', null, 'timestamp', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('250', '217', 'isNice', '', null, 'bit(1)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('251', '217', 'isUp', '', null, 'bit(1)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('252', '218', 'ID', 'id', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('253', '218', 'NAME', '厂商名称', null, 'varchar(100)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('254', '218', 'JCNAME', '简称', null, 'varchar(30)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('255', '218', 'HANGYE', '行业', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('256', '218', 'TYPE', '厂商类型', null, 'smallint(6)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('257', '218', 'LAIYUAN', '来源', null, 'smallint(6)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('258', '218', 'PROVINCE', '省份', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('259', '218', 'CITY', '地市', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('260', '218', 'TELPHONE', '电话', null, 'varchar(50)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('261', '218', 'ZIPCODE', '邮编', null, 'varchar(10)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('262', '218', 'FAX', '传真', null, 'varchar(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('263', '218', 'EMAIL', '接收报备的EMAIL', null, 'varchar(100)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('264', '218', 'ADDR', '地址', null, 'varchar(100)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('265', '218', 'WEB', '公司网址', null, 'varchar(100)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('266', '218', 'BANKACCOUNT', '银行账号', null, 'varchar(30)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('267', '218', 'BANK', '开户行', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('268', '218', 'NETSCALE', '网络规模', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('269', '218', 'TAXNUM', '税号', null, 'varchar(30)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('270', '218', 'BBLIMIT', '报备期限', null, 'smallint(6)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('271', '218', 'SUMMARY', '公司简介', null, 'longtext', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('272', '219', 'id', '', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('273', '220', 'ID', 'id', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('274', '220', 'STARTDATE', '开始时间', null, 'varchar(10)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('275', '220', 'RATE', '费率', null, 'float', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('276', '221', 'ID', 'id', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('277', '221', 'EMPID', '员工id', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('278', '221', 'WAGES', '每月工资', null, 'int(11)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('279', '221', 'SDATE', '工资计算开始日期', null, 'varchar(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('280', '221', 'EDATE', '工资计算结束日期', null, 'varchar(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('281', '221', 'AMOUNT', '实发工资金额', null, 'decimal(10,2)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('282', '221', 'PAYDATE', '发放日期', null, 'varchar(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('283', '221', 'OPERATER', '操作员id', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('284', '222', 'id', '', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('285', '222', 'fullname', '', null, 'varchar(50)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('286', '222', 'gender', '', null, 'varchar(2)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('287', '222', 'userno', '', null, 'varchar(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('288', '222', 'pwd', '', null, 'varchar(50)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('289', '222', 'birthday', '', null, 'varchar(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('290', '222', 'phone', '', null, 'varchar(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('291', '222', 'addr', '', null, 'varchar(100)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('292', '222', 'fnamepy', '', null, 'varchar(50)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('293', '222', 'worktime', '', null, 'varchar(30)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('294', '222', 'nation', '', null, 'varchar(10)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('295', '222', 'idcard', '', null, 'varchar(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('296', '222', 'hometown', '', null, 'smallint(6)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('297', '222', 'diploma', '', null, 'smallint(6)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('298', '222', 'wage', '', null, 'smallint(6)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('299', '222', 'photo', '', null, 'varchar(50)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('300', '222', 'partmentid', '', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('301', '222', 'orgid', '', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('302', '222', 'stat', '', null, 'smallint(1)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('303', '222', 'remark', '', null, 'varchar(255)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('304', '222', 'resume', '', null, 'longtext', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('305', '222', 'postid', '', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('306', '222', 'ip', '', null, 'varchar(30)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('307', '222', 'logintime', '', null, 'datetime', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('308', '222', 'telphone', '', null, 'varchar(30)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('309', '223', 'ID', 'id', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('310', '223', 'WAGES', '每月工资', null, 'int(11)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('311', '223', 'ENMONTH', '生效月份', null, 'varchar(10)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('312', '223', 'REMARK', '备注', null, 'varchar(250)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('313', '223', 'OPERATER', '操作员id', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('314', '223', 'CTIME', '创建时间', null, 'varchar(50)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('315', '223', 'EMPID', '员工', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('316', '224', 'ID', 'id', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('317', '224', 'TITLE', '标题', null, 'varchar(200)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('318', '224', 'SUMMARY', '摘要', null, 'varchar(500)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('319', '224', 'CONTENT', '内容', null, 'longtext', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('320', '224', 'CTIME', '创建时间', null, 'varchar(50)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('321', '224', 'PTIME', '发布时间', null, 'varchar(50)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('322', '224', 'CREATER', '创建人', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('323', '224', 'STARTTIME', '开始日期', null, 'varchar(50)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('324', '224', 'ENDTIME', '结束日期', null, 'varchar(50)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('325', '224', 'ACTCATEID', '文章分类id', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('326', '224', 'VRANGE', '可查阅范围', null, 'smallint(6)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('327', '224', 'UPDATER', '修改人', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('328', '224', 'UTIME', '修改时间', null, 'varchar(50)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('329', '225', 'ID', 'id', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('330', '225', 'CNAME', '名称', null, 'varchar(50)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('331', '225', 'NUM', '编号', null, 'varchar(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('332', '225', 'REMARK', '备注', null, 'varchar(100)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('333', '225', 'PID', '父级分类id', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('334', '225', 'ORDERNUM', '排序顺序', null, 'int(11)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('335', '226', 'ARTID', '文章id', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('336', '226', 'OBJID', '范围对象id', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('337', '226', 'OBJTYPE', '对象类型', null, 'smallint(6)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('338', '227', 'ARTID', '文章', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('339', '227', 'EMPID', '人员id', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('340', '228', 'ID', 'id', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('341', '228', 'TITLE', '标题', null, 'varchar(50)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('342', '228', 'CONTEXT', '内容', null, 'longtext', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('343', '228', 'CTIME', '创建时间', null, 'datetime', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('344', '228', 'CREATER', '创建人', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('345', '228', 'TXPL', '提醒频率', null, 'smallint(6)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('346', '228', 'TXDATE', '提醒日期', null, 'datetime', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('347', '228', 'TXBR', '提醒本人', null, 'smallint(6)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('348', '228', 'TXSHARE', '提醒所有共享人', null, 'smallint(6)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('349', '228', 'IMTX', '即时通讯提醒', null, 'smallint(6)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('350', '228', 'EMAILTX', 'email提醒', null, 'smallint(6)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('351', '228', 'SMSTX', '短信提醒', null, 'smallint(6)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('352', '229', 'ID', 'id', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('353', '229', 'BWLID', '备忘录id', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('354', '229', 'UID', '评论人', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('355', '229', 'PLTIME', '评论时间', null, 'datetime', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('356', '229', 'CONTEXT', '内容', null, 'longtext', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('357', '230', 'ID', 'id', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('358', '230', 'BWLID', '备忘录id', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('359', '230', 'UID', '共享用户id', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('360', '231', 'Id', '日程主键', null, 'bigint(11)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('361', '231', 'title', '日程标题', null, 'varchar(200)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('362', '231', 'addr', '地点', null, 'varchar(200)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('363', '231', 'description', '说明', null, 'varchar(500)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('364', '231', 'cType', '日程类型\r\n            1	个人日程\r\n    ', null, 'tinyint(4)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('365', '231', 'StartTime', '开始时间', null, 'datetime', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('366', '231', 'EndTime', '结束时间', null, 'datetime', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('367', '231', 'IsAllDayEvent', '是否全天日程', null, 'bit(1)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('368', '231', 'HasAttachment', '是否有附件', null, 'bit(1)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('369', '231', 'Category', '分类', null, 'varchar(400)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('370', '231', 'InstanceType', '实例类型\r\n            0	Single（一般日', null, 'tinyint(4)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('371', '231', 'Attendees', '参与人', null, 'varchar(500)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('372', '231', 'AttendeeNames', '参与人姓名', null, 'varchar(500)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('373', '231', 'OtherAttendee', '其他参与人', null, 'varchar(500)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('374', '231', 'UPAccount', '更新人账号', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('375', '231', 'UPName', '更新人姓名', null, 'varchar(100)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('376', '231', 'UPTime', '最后一次更新时间', null, 'datetime', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('377', '231', 'RecurringRule', '循环规则', null, 'varchar(1000)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('378', '232', 'ID', 'id', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('379', '232', 'CNAME', '名称', null, 'varchar(50)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('380', '232', 'NUM', '编号', null, 'varchar(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('381', '232', 'REMARK', '备注', null, 'varchar(100)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('382', '232', 'PID', '父级分类id', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('383', '232', 'ORDERNUM', '排序顺序', null, 'int(11)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('384', '233', 'DOCID', '文档id', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('385', '233', 'OBJID', '范围对象id', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('386', '233', 'OBJTYPE', '对象类型', null, 'smallint(6)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('387', '234', 'ID', 'id', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('388', '234', 'TITLE', '标题', null, 'varchar(200)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('389', '234', 'SUMMARY', '摘要', null, 'varchar(500)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('390', '234', 'CTIME', '创建时间', null, 'varchar(50)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('391', '234', 'PTIME', '发布时间', null, 'varchar(50)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('392', '234', 'STARTTIME', '开始日期', null, 'varchar(50)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('393', '234', 'ENDTIME', '结束日期', null, 'varchar(50)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('394', '234', 'DOCCATEID', '文档分类id', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('395', '234', 'VRANGE', '可查阅范围', null, 'smallint(6)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('396', '234', 'CREATER', '创建人', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('397', '234', 'ATTACHMENT', '附件', null, 'varchar(500)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('398', '234', 'UPDATER', '修改人', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('399', '234', 'UTIME', '修改时间', null, 'varchar(50)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('400', '235', 'ID', 'id', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('401', '235', 'TITLE', '标题', null, 'varchar(100)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('402', '235', 'CONTENT', '内容', null, 'longtext', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('403', '235', 'UID', 'uid', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('404', '235', 'SETID', '邮箱设置id', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('405', '235', 'MAILFROM', '发件人', null, 'varchar(50)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('406', '235', 'MAILTO', '收件人', null, 'varchar(1000)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('407', '235', 'BCC', '抄送人', null, 'varchar(500)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('408', '235', 'CC', '密抄', null, 'varchar(100)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('409', '235', 'ISNEW', '是否新邮件', null, 'bit(1)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('410', '235', 'MAILDATE', '邮件日期时间', null, 'datetime', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('411', '235', 'BOX', '文件夹', null, 'smallint(1)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('412', '235', 'ATTACHMENT', 'attachment', null, 'longtext', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('413', '235', 'HASATTACH', '是否有附件', null, 'bit(1)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('414', '235', 'REPLYSIGN', '是否回复', null, 'bit(1)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('415', '236', 'ID', 'id', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('416', '236', 'CNAME', '昵称', null, 'varchar(30)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('417', '236', 'EMAIL', '邮箱', null, 'varchar(100)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('418', '236', 'UID', '用户id', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('419', '236', 'POP3ADDR', 'pop3Addr', null, 'varchar(50)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('420', '236', 'POP3PORT', 'pop3Port', null, 'int(11)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('421', '236', 'SMTPADDR', 'smtpAddr', null, 'varchar(50)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('422', '236', 'SMTPPORT', 'smtpPort', null, 'int(11)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('423', '236', 'PWD', '密码', null, 'varchar(50)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('424', '236', 'SIGN', '签名', null, 'varchar(500)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('425', '236', 'STATUS', '状态', null, 'smallint(1)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('426', '236', 'USESIGN', '是否使用签名', null, 'smallint(1)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('427', '237', 'ID', 'id', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('428', '237', 'FILENAME', '文件名称', null, 'varchar(50)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('429', '237', 'FILEPATH', '文件保存名称', null, 'varchar(50)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('430', '237', 'UID', '用户', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('431', '237', 'DIRID', '目录id', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('432', '237', 'CTIME', '上传时间', null, 'datetime', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('433', '237', 'SIZE', '文件大小(MB)', null, 'float(10,0)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('434', '237', 'FTYPE', '文件类型', null, 'varchar(10)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('435', '238', 'ID', 'id', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('436', '238', 'NAME', 'name', null, 'varchar(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('437', '238', 'DESCP', '描述', null, 'varchar(200)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('438', '238', 'ENABLE', '是否生效', null, 'smallint(6)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('439', '239', 'UID', '用户id', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('440', '239', 'RDATE', '查阅时间', null, 'datetime', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('441', '239', 'GGID', 'ggid', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('442', '240', 'ID', 'id', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('443', '240', 'TITLE', '标题', null, 'varchar(100)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('444', '240', 'CONTEXT', '内容', null, 'longtext', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('445', '240', 'CTIME', '创建时间日期', null, 'datetime', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('446', '240', 'CREATER', '创建人', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('447', '240', 'FBDATE', '发布日期时间', null, 'datetime', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('448', '240', 'CXDATE', '撤销日期时间', null, 'datetime', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('449', '240', 'ZD', '置顶', null, 'smallint(6)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('450', '240', 'STARTDATE', '开始日期时间', null, 'date', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('451', '240', 'ENDDATE', '结束日期时间', null, 'date', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('452', '240', 'SHOWCONT', '阅读次数', null, 'int(11)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('453', '240', 'UDATE', '更新时间', null, 'datetime', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('454', '240', 'GGLID', '公告栏', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('455', '241', 'ID', 'id', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('456', '241', 'TITLE', '标题', null, 'varchar(100)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('457', '241', 'FBTIME', 'FBTIME', null, 'datetime', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('458', '241', 'CREATER', '创建人', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('459', '241', 'CTIME', '创建时间', null, 'datetime', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('460', '241', 'CONTENT', '内容', null, 'longtext', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('461', '241', 'STARTTIME', '开始时间', null, 'varchar(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('462', '241', 'ENDTIME', '结束时间', null, 'varchar(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('463', '241', 'STAT', '状态', null, 'smallint(1)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('464', '241', 'GUIDANGREN', '归档人', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('465', '241', 'GDTIME', '归档时间', null, 'datetime', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('466', '241', 'GUIDANG', '归档内容', null, 'longtext', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('467', '242', 'ID', 'id', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('468', '242', 'UID', '与会人id', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('469', '242', 'MID', '会议Id', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('470', '242', 'STAT', '参与状态', null, 'smallint(1)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('471', '243', 'ID', 'id', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('472', '243', 'UID', '记录人', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('473', '243', 'CONTEXT', '内容', null, 'longtext', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('474', '243', 'CTIME', '记录时间', null, 'datetime', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('475', '243', 'MID', '会议ID', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('476', '244', 'ID', 'id', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('477', '244', 'UID', '发布人', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('478', '244', 'CONTEXT', '内容', null, 'varchar(600)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('479', '244', 'CDATE', 'cdate', null, 'datetime', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('480', '244', 'ZAN', '赞次数', null, 'int(11)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('481', '244', 'ZHUAN', '转播次数', null, 'int(11)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('482', '244', 'CANG', '收藏次数', null, 'int(11)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('483', '245', 'UID', '用户id', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('484', '245', 'CDATE', 'cdate', null, 'datetime', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('485', '245', 'CONTEXT', 'context', null, 'varchar(600)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('486', '245', 'ZAN', '赞次数', null, 'int(11)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('487', '245', 'WID', '微博id', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('488', '245', 'ISSHOW', '查看评论', null, 'smallint(6)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('489', '245', 'CUID', '微博创建人id', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('490', '246', 'ID', '', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('491', '246', 'CNAME', '', null, 'varchar(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('492', '246', 'PID', '', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('493', '246', 'SORTNUM', '', null, 'int(11)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('494', '247', 'ID', 'id', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('495', '247', 'TNAME', '表名', null, 'varchar(30)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('496', '247', 'ZHUS', '注释', null, 'varchar(30)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('497', '247', 'TBTYPE', '表单类型', null, 'smallint(6)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('498', '247', 'PACKAGE', '包名', null, 'varchar(50)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('499', '247', 'LISTADD', '在grid中添加及修改', null, 'smallint(6)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('500', '248', 'ID', 'id', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('501', '248', 'FMID', '表单id', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('502', '248', 'FIELDNAME', '字段名', null, 'varchar(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('503', '248', 'FIELDDESC', '字段描述', null, 'varchar(30)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('504', '248', 'FIELDTITLE', '字段提示', null, 'varchar(50)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('505', '248', 'FTYPE', '字段类型', null, 'varchar(50)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('506', '248', 'FLEN', '字段长度', null, 'smallint(6)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('507', '248', 'CTRLTYPE', '控件类型', null, 'varchar(50)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('508', '248', 'VALIT', '验证规则', null, 'varchar(50)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('509', '248', 'REQUI', '必填', null, 'smallint(6)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('510', '248', 'SHOWINLIST', '显示到列表', null, 'smallint(6)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('511', '248', 'SHOWINQRY', '作为查询条件', null, 'smallint(6)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('512', '248', 'WFATTR', '工作流变量', null, 'smallint(6)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('513', '248', 'SQLSCRIPT', 'SQL脚本', null, 'longtext', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('514', '248', 'SORTTYPE', '排序方式', null, 'varchar(0)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('515', '248', 'SORTNUM', '字段排序', null, 'smallint(6)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('516', '249', 'ID', '', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('517', '249', 'UID', '', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('518', '249', 'IP', '', null, 'varchar(50)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('519', '249', 'LOGINTIME', '', null, 'datetime', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('520', '249', 'LOGOUTTIME', '', null, 'datetime', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('521', '250', 'ID', '', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('522', '250', 'MENUNAME', '', null, 'varchar(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('523', '250', 'URL', '', null, 'varchar(50)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('524', '250', 'TYPE', '', null, 'smallint(6)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('525', '250', 'ICON', '', null, 'varchar(50)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('526', '250', 'ORDERNUM', '', null, 'int(11)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('527', '250', 'SAFECODE', '', null, 'varchar(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('528', '250', 'PID', '', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('529', '250', 'ENABLE', '', null, 'smallint(6)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('530', '250', 'REMARK', '', null, 'varchar(255)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('531', '251', 'ID', '', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('532', '251', 'UID', '', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('533', '251', 'CTIME', '', null, 'datetime', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('534', '251', 'MODELNAME', '', null, 'varchar(50)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('535', '251', 'EXCT', '', null, 'varchar(10)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('536', '252', 'ID', '', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('537', '252', 'CNAME', '', null, 'varchar(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('538', '252', 'VAL', '', null, 'varchar(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('539', '252', 'TYPE', '', null, 'varchar(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('540', '252', 'SORTNUM', '', null, 'smallint(6)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('541', '252', 'REMARK', '', null, 'varchar(200)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('542', '253', 'id', '', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('543', '253', 'cname', '', null, 'varchar(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('544', '253', 'val', '', null, 'varchar(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('545', '253', 'type', '', null, 'varchar(200)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('546', '253', 'sortnum', '', null, 'smallint(6)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('547', '253', 'remark', '', null, 'varchar(255)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('548', '253', 'pid', '', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('549', '254', 'ID', '', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('550', '254', 'CNAME', '', null, 'varchar(50)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('551', '254', 'REMARK', '', null, 'varchar(250)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('552', '254', 'NUM', '', null, 'varchar(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('553', '254', 'PID', '', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('554', '255', 'ID', '', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('555', '255', 'CNAME', '', null, 'varchar(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('556', '255', 'REMARK', '', null, 'varchar(30)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('557', '255', 'SORTNUM', '', null, 'smallint(6)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('558', '256', 'OBJID', '', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('559', '256', 'TYPE', '', null, 'smallint(1)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('560', '256', 'MENUID', '', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('561', '257', 'id', '', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('562', '257', 'cname', '', null, 'varchar(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('563', '257', 'remark', '', null, 'varchar(255)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('564', '257', 'sortnum', '', null, 'smallint(6)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('565', '258', 'USERID', '', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_formfield` VALUES ('566', '258', 'ROLEID', '', null, 'bigint(20)', '0', '', null, '0', null, null, null, null, null, null);
INSERT INTO `sys_loginlog` VALUES ('19', '1', '2013-08-10 08:52:47', '127.0.0.1', null);
INSERT INTO `sys_loginlog` VALUES ('18', '1', '2013-08-10 08:52:33', '127.0.0.1', null);
INSERT INTO `sys_loginlog` VALUES ('17', '1', '2013-08-10 08:50:49', '127.0.0.1', '2013-08-10 08:51:18');
INSERT INTO `sys_loginlog` VALUES ('16', '1', '2013-08-09 22:47:43', '127.0.0.1', '2013-08-10 08:50:15');
INSERT INTO `sys_loginlog` VALUES ('15', '1', '2013-08-09 22:11:20', '127.0.0.1', '2013-08-09 22:47:40');
INSERT INTO `sys_loginlog` VALUES ('14', '1', '2013-08-09 21:49:06', '127.0.0.1', '2013-08-09 21:58:44');
INSERT INTO `sys_loginlog` VALUES ('13', '1', '2013-08-09 20:43:54', '127.0.0.1', null);
INSERT INTO `sys_loginlog` VALUES ('12', '1', '2013-08-09 13:41:40', '127.0.0.1', null);
INSERT INTO `sys_loginlog` VALUES ('20', '1', '2013-08-10 08:54:43', '127.0.0.1', null);
INSERT INTO `sys_loginlog` VALUES ('21', '1', '2013-08-10 09:30:22', '127.0.0.1', null);
INSERT INTO `sys_loginlog` VALUES ('22', '1', '2013-08-10 10:14:42', '127.0.0.1', '2013-08-10 10:23:37');
INSERT INTO `sys_loginlog` VALUES ('23', '1', '2013-08-10 10:23:39', '127.0.0.1', '2013-08-10 10:50:04');
INSERT INTO `sys_loginlog` VALUES ('24', '1', '2013-08-10 10:50:25', '127.0.0.1', '2013-08-10 10:59:01');
INSERT INTO `sys_loginlog` VALUES ('25', '1', '2013-08-10 10:59:05', '127.0.0.1', null);
INSERT INTO `sys_loginlog` VALUES ('26', '1', '2013-08-10 16:03:07', '127.0.0.1', '2013-08-10 19:04:21');
INSERT INTO `sys_loginlog` VALUES ('27', '1', '2013-08-10 19:04:24', '127.0.0.1', '2013-08-11 09:52:35');
INSERT INTO `sys_loginlog` VALUES ('28', '1', '2013-08-11 09:52:38', '127.0.0.1', '2013-08-11 09:52:44');
INSERT INTO `sys_loginlog` VALUES ('29', '1', '2013-08-11 09:52:46', '127.0.0.1', '2013-08-11 09:52:51');
INSERT INTO `sys_loginlog` VALUES ('30', '1', '2013-08-11 09:52:52', '127.0.0.1', '2013-08-11 09:52:56');
INSERT INTO `sys_loginlog` VALUES ('31', '1', '2013-08-11 09:52:58', '127.0.0.1', '2013-08-11 09:53:03');
INSERT INTO `sys_loginlog` VALUES ('32', '1', '2013-08-11 09:53:04', '127.0.0.1', null);
INSERT INTO `sys_loginlog` VALUES ('33', '1', '2013-08-12 10:46:39', '127.0.0.1', null);
INSERT INTO `sys_loginlog` VALUES ('34', '1', '2013-08-13 08:24:38', '192.168.153.129', null);
INSERT INTO `sys_loginlog` VALUES ('35', '1', '2013-08-13 10:51:14', '127.0.0.1', null);
INSERT INTO `sys_loginlog` VALUES ('36', '100000', '2013-08-13 20:44:51', '127.0.0.1', null);
INSERT INTO `sys_loginlog` VALUES ('37', '100000', '2013-08-13 21:17:12', '127.0.0.1', null);
INSERT INTO `sys_loginlog` VALUES ('38', '100000', '2013-08-14 18:26:23', '127.0.0.1', null);
INSERT INTO `sys_loginlog` VALUES ('39', '100000', '2013-08-15 20:23:44', '127.0.0.1', null);
INSERT INTO `sys_loginlog` VALUES ('40', '100000', '2013-08-15 20:23:45', '127.0.0.1', null);
INSERT INTO `sys_loginlog` VALUES ('41', '100000', '2013-08-16 20:35:15', '127.0.0.1', null);
INSERT INTO `sys_loginlog` VALUES ('42', '100000', '2013-08-18 17:08:30', '127.0.0.1', '2013-08-18 18:03:07');
INSERT INTO `sys_loginlog` VALUES ('43', '100000', '2013-08-18 18:03:09', '127.0.0.1', '2013-08-19 10:24:03');
INSERT INTO `sys_loginlog` VALUES ('44', '100000', '2013-08-19 10:24:22', '127.0.0.1', '2013-08-19 10:36:53');
INSERT INTO `sys_loginlog` VALUES ('45', '100000', '2013-08-19 10:37:01', '127.0.0.1', null);
INSERT INTO `sys_loginlog` VALUES ('46', '100000', '2013-08-20 14:37:59', '127.0.0.1', null);
INSERT INTO `sys_loginlog` VALUES ('47', '100000', '2013-08-20 14:38:14', '127.0.0.1', null);
INSERT INTO `sys_loginlog` VALUES ('48', '100000', '2013-08-19 14:39:59', '127.0.0.1', null);
INSERT INTO `sys_loginlog` VALUES ('49', '100000', '2013-08-19 14:41:29', '127.0.0.1', null);
INSERT INTO `sys_loginlog` VALUES ('50', '100000', '2013-08-19 14:42:03', '127.0.0.1', null);
INSERT INTO `sys_loginlog` VALUES ('51', '100000', '2013-08-19 14:45:06', '127.0.0.1', '2013-08-19 17:22:15');
INSERT INTO `sys_loginlog` VALUES ('52', '100000', '2013-08-19 17:22:22', '127.0.0.1', null);
INSERT INTO `sys_loginlog` VALUES ('53', '100000', '2013-08-21 22:46:06', '127.0.0.1', null);
INSERT INTO `sys_loginlog` VALUES ('54', '100000', '2013-08-22 00:22:42', '127.0.0.1', null);
INSERT INTO `sys_loginlog` VALUES ('55', '100000', '2013-08-23 09:30:25', '127.0.0.1', null);
INSERT INTO `sys_loginlog` VALUES ('56', '100000', '2013-08-25 11:13:22', '127.0.0.1', '2013-08-25 21:07:04');
INSERT INTO `sys_loginlog` VALUES ('57', '100000', '2013-08-25 21:07:10', '127.0.0.1', null);
INSERT INTO `sys_loginlog` VALUES ('58', '100000', '2013-08-26 11:03:39', '127.0.0.1', '2013-08-26 12:46:40');
INSERT INTO `sys_loginlog` VALUES ('59', '100000', '2013-08-27 21:11:38', '127.0.0.1', null);
INSERT INTO `sys_loginlog` VALUES ('60', '100000', '2013-08-28 20:27:46', '127.0.0.1', '2013-08-28 20:44:52');
INSERT INTO `sys_loginlog` VALUES ('61', '100000', '2013-08-28 20:44:58', '127.0.0.1', null);
INSERT INTO `sys_loginlog` VALUES ('62', '100000', '2013-08-28 20:46:31', '127.0.0.1', null);
INSERT INTO `sys_loginlog` VALUES ('63', '100000', '2013-08-28 20:57:54', '127.0.0.1', null);
INSERT INTO `sys_loginlog` VALUES ('64', '100000', '2013-08-28 21:02:13', '127.0.0.1', '2013-08-28 21:10:13');
INSERT INTO `sys_loginlog` VALUES ('65', '100000', '2013-08-28 22:13:29', '127.0.0.1', null);
INSERT INTO `sys_loginlog` VALUES ('66', '100000', '2013-09-08 21:21:34', '127.0.0.1', '2013-09-08 21:22:18');
INSERT INTO `sys_loginlog` VALUES ('67', '100000', '2013-10-04 10:26:12', '127.0.0.1', null);
INSERT INTO `sys_loginlog` VALUES ('68', '100000', '2013-10-14 20:50:59', '127.0.0.1', null);
INSERT INTO `sys_loginlog` VALUES ('69', '100000', '2013-10-21 20:41:19', '127.0.0.1', null);
INSERT INTO `sys_loginlog` VALUES ('70', '100000', '2013-10-21 21:56:25', '127.0.0.1', null);
INSERT INTO `sys_menu` VALUES ('1', '办公', null, '0', null, '1', null, '0', '1', null);
INSERT INTO `sys_menu` VALUES ('2', '客户', null, '0', null, '2', null, '0', '1', null);
INSERT INTO `sys_menu` VALUES ('3', '系统', null, '0', null, '3', null, '0', '1', null);
INSERT INTO `sys_menu` VALUES ('4', '商务', null, '0', null, '4', null, '0', '1', null);
INSERT INTO `sys_menu` VALUES ('5', '销售', null, '0', null, '5', null, '0', '1', null);
INSERT INTO `sys_menu` VALUES ('6', '库存', null, '0', null, '6', null, '0', '1', null);
INSERT INTO `sys_menu` VALUES ('7', '财务', null, '0', null, '7', null, '0', '1', null);
INSERT INTO `sys_menu` VALUES ('8', '技术管理', null, '0', null, '8', null, '0', '1', null);
INSERT INTO `sys_menu` VALUES ('9', '报表', null, '0', 'icon-bars', '9', null, '0', '1', null);
INSERT INTO `sys_menu` VALUES ('10', '人力资源', null, '0', 'icon-user', '10', null, '0', '1', null);
INSERT INTO `sys_menu` VALUES ('11', '功能列表', 'sys/menu', '1', null, '11', null, '3', '1', null);
INSERT INTO `sys_menu` VALUES ('12', '工作流', null, '0', null, '12', null, '0', '1', null);
INSERT INTO `sys_menu` VALUES ('13', '角色', 'sys/role', '1', null, '13', null, '3', '1', null);
INSERT INTO `sys_menu` VALUES ('14', '职位', 'sys/post', '1', null, '14', null, '3', '1', null);
INSERT INTO `sys_menu` VALUES ('15', '组织结构', 'sys/partment', '1', null, '15', null, '3', '1', null);
INSERT INTO `sys_menu` VALUES ('16', '表单(开发)', 'sys/form', '1', null, '16', null, '3', '1', null);
INSERT INTO `sys_menu` VALUES ('17', '知识库', null, '1', null, '17', null, '1', '1', null);
INSERT INTO `sys_menu` VALUES ('18', '员工管理', 'hr/employee', null, null, '18', null, '10', '1', null);
INSERT INTO `sys_menu` VALUES ('19', '员工入职办理', null, '1', null, '19', null, '10', '1', null);
INSERT INTO `sys_menu` VALUES ('20', '员工离职办理', null, '1', null, '20', null, '10', '1', null);
INSERT INTO `sys_menu` VALUES ('21', '员工请假销假', null, '1', null, '21', null, '10', '1', null);
INSERT INTO `sys_menu` VALUES ('22', '考勤', null, '1', null, '22', null, '10', '1', null);
INSERT INTO `sys_menu` VALUES ('23', '员工福利', null, '1', null, '23', null, '10', '1', null);
INSERT INTO `sys_menu` VALUES ('24', '考核设置', 'hr/kaoheset', '1', null, '24', null, '10', '1', null);
INSERT INTO `sys_menu` VALUES ('25', '员工考核', 'hr/kaohe', '1', null, '25', null, '10', '1', null);
INSERT INTO `sys_menu` VALUES ('26', '奖惩管理', 'hr/jiangcheng', '1', null, '26', null, '10', '1', null);
INSERT INTO `sys_menu` VALUES ('27', '岗位变动', null, '1', null, '27', null, '10', '1', null);
INSERT INTO `sys_menu` VALUES ('28', '公告', null, '1', null, '28', null, '1', '1', null);
INSERT INTO `sys_menu` VALUES ('29', '会议', 'oa/meeting', '1', null, '29', null, '1', '1', null);
INSERT INTO `sys_menu` VALUES ('30', '员工评估标准', null, '1', null, '30', null, '10', '1', null);
INSERT INTO `sys_menu` VALUES ('31', '邮件', null, '1', 'icon-annex', '31', null, '1', '1', null);
INSERT INTO `sys_menu` VALUES ('32', '邮箱设置', 'oa/mailBox/set', '1', null, '32', null, '31', '1', null);
INSERT INTO `sys_menu` VALUES ('33', '发件箱', 'oa/mailBox/sendBox', '1', null, '37', null, '31', '1', null);
INSERT INTO `sys_menu` VALUES ('34', '收件箱', 'oa/mailBox/recvBox', '1', null, '34', null, '31', '1', null);
INSERT INTO `sys_menu` VALUES ('35', '草稿箱', 'oa/mailBox/caogBox', '1', null, '35', null, '31', '1', null);
INSERT INTO `sys_menu` VALUES ('36', '回收箱', 'oa/mailBox/bakBox', '1', null, '36', null, '31', '1', null);
INSERT INTO `sys_menu` VALUES ('38', '工作流设置', null, '1', null, '38', null, '12', '1', null);
INSERT INTO `sys_menu` VALUES ('39', '工作流进程管理', null, '1', null, '39', null, '12', '1', null);
INSERT INTO `sys_menu` VALUES ('40', '我的工作流', null, '1', null, '40', null, '12', '1', null);
INSERT INTO `sys_menu` VALUES ('41', '创建工作流', null, '1', null, '41', null, '12', '1', null);
INSERT INTO `sys_menu` VALUES ('42', '日程', null, '1', null, '42', null, '1', '1', null);
INSERT INTO `sys_menu` VALUES ('43', '计划', null, '1', null, '43', null, '1', '1', null);
INSERT INTO `sys_menu` VALUES ('44', '工作报告', null, '1', null, '44', null, '1', '1', null);
INSERT INTO `sys_menu` VALUES ('45', '通信录', 'biz/contact', '1', null, '45', null, '1', '1', null);
INSERT INTO `sys_menu` VALUES ('46', '站内消息', null, '1', null, '46', null, '1', '1', null);
INSERT INTO `sys_menu` VALUES ('47', '论坛', null, '1', null, '47', null, '1', '1', null);
INSERT INTO `sys_menu` VALUES ('48', '备忘录', 'oa/beiwanglu/', '1', null, '48', null, '1', '1', null);
INSERT INTO `sys_menu` VALUES ('49', '项目', null, '0', null, '49', null, '0', '1', null);
INSERT INTO `sys_menu` VALUES ('50', '项目管理', null, '1', null, '50', null, '49', '1', null);
INSERT INTO `sys_menu` VALUES ('51', '项目进度', null, '1', null, '51', null, '49', '1', null);
INSERT INTO `sys_menu` VALUES ('52', '参数设置', 'sys/parame', '0', null, '52', null, '3', '1', null);
INSERT INTO `sys_menu` VALUES ('53', '客户评估标准', null, '1', null, '53', null, '2', '1', null);
INSERT INTO `sys_menu` VALUES ('54', '客户管理', 'crm/customer', '1', null, '54', null, '2', '1', null);
INSERT INTO `sys_menu` VALUES ('55', '客户分配', 'crm/custsale', '1', null, '55', null, '2', '1', null);
INSERT INTO `sys_menu` VALUES ('56', '合同管理', null, '1', null, '56', null, '2', '1', null);
INSERT INTO `sys_menu` VALUES ('57', '厂商管理', 'biz/vender', '1', null, '57', null, '4', '1', null);
INSERT INTO `sys_menu` VALUES ('58', '产品类型', 'biz/ptype', '1', null, '58', null, '4', '1', null);
INSERT INTO `sys_menu` VALUES ('59', '产品列表', 'biz/product', '1', null, '59', null, '4', '1', null);
INSERT INTO `sys_menu` VALUES ('60', '报备处理', null, '1', null, '60', null, '4', '1', null);
INSERT INTO `sys_menu` VALUES ('61', '测试处理', null, '1', null, '61', null, '4', '1', null);
INSERT INTO `sys_menu` VALUES ('62', '采购合同', null, '1', null, '62', null, '4', '1', null);
INSERT INTO `sys_menu` VALUES ('111', '登录日志', 'sys/loginLog', '1', null, '111', null, '112', '1', null);
INSERT INTO `sys_menu` VALUES ('63', '分销管理', null, '1', null, '63', null, '5', '1', null);
INSERT INTO `sys_menu` VALUES ('64', '直销管理', null, '1', null, '64', null, '5', '1', null);
INSERT INTO `sys_menu` VALUES ('66', '仓库管理', null, '1', null, '66', null, '6', '1', null);
INSERT INTO `sys_menu` VALUES ('67', '入库', null, '1', null, '67', null, '6', '1', null);
INSERT INTO `sys_menu` VALUES ('68', '出库', null, '1', null, '68', null, '6', '1', null);
INSERT INTO `sys_menu` VALUES ('69', '库存查询', null, '1', null, '69', null, '6', '1', null);
INSERT INTO `sys_menu` VALUES ('70', '损耗报备', null, '1', null, '70', null, '6', '1', null);
INSERT INTO `sys_menu` VALUES ('71', '测试机库存', null, '1', null, '71', null, '6', '1', null);
INSERT INTO `sys_menu` VALUES ('72', '税率设置', 'fa/taxRate', '1', null, '72', null, '7', '1', null);
INSERT INTO `sys_menu` VALUES ('73', '出纳', null, '1', null, '73', null, '7', '1', null);
INSERT INTO `sys_menu` VALUES ('74', '收银', null, '1', null, '74', null, '7', '1', null);
INSERT INTO `sys_menu` VALUES ('75', '销售合同', null, '1', null, '75', null, '7', '1', null);
INSERT INTO `sys_menu` VALUES ('76', '采购合同', null, '1', null, '76', null, '7', '1', null);
INSERT INTO `sys_menu` VALUES ('77', '工资发放', 'fa/wagepay', '1', null, '77', null, '7', '1', null);
INSERT INTO `sys_menu` VALUES ('78', '分配任务', null, '1', null, '78', null, '8', '1', null);
INSERT INTO `sys_menu` VALUES ('79', '我的任务', null, '1', null, '79', null, '8', '1', null);
INSERT INTO `sys_menu` VALUES ('80', '解决方案', null, '1', null, '80', null, '8', '1', null);
INSERT INTO `sys_menu` VALUES ('81', '售后列表', null, '1', null, '81', null, '8', '1', null);
INSERT INTO `sys_menu` VALUES ('82', '分配客户', 'sale/custsale', '1', null, '82', null, '8', '1', null);
INSERT INTO `sys_menu` VALUES ('83', '部门任务', null, '1', null, '83', null, '8', '1', null);
INSERT INTO `sys_menu` VALUES ('84', '测试机初始化', null, '1', null, '84', null, '8', '1', null);
INSERT INTO `sys_menu` VALUES ('85', '财务报表', null, '1', null, '85', null, '9', '1', null);
INSERT INTO `sys_menu` VALUES ('86', '销售报表', null, '1', null, '86', null, '9', '1', null);
INSERT INTO `sys_menu` VALUES ('87', '客户资源报表', null, '1', null, '87', null, '9', '1', null);
INSERT INTO `sys_menu` VALUES ('88', '考勤报表', null, '1', null, '88', null, '9', '1', null);
INSERT INTO `sys_menu` VALUES ('89', '产品资源报表', null, '1', null, '89', null, '9', '1', null);
INSERT INTO `sys_menu` VALUES ('90', '库存报表', null, '1', null, '90', null, '9', '1', null);
INSERT INTO `sys_menu` VALUES ('110', '发布公告', 'oa/Gonggao/fabu', '1', null, '2', null, '28', '1', null);
INSERT INTO `sys_menu` VALUES ('92', '团队维护', 'oa/team', '1', null, '92', null, '10', '1', null);
INSERT INTO `sys_menu` VALUES ('93', '渠道管理', 'sale/qudao/0', '1', null, '93', null, '63', '1', null);
INSERT INTO `sys_menu` VALUES ('94', '跟进列表', 'sale/genjin/0', '1', null, '94', null, '63', '1', null);
INSERT INTO `sys_menu` VALUES ('95', '报备列表', 'sale/baobei/0', '1', null, '95', null, '63', '1', null);
INSERT INTO `sys_menu` VALUES ('96', '技术任务', 'sale/techtask/0', '1', null, '96', null, '63', '1', null);
INSERT INTO `sys_menu` VALUES ('97', '合同列表', 'sale/hetong/0', '1', null, '97', null, '63', '1', null);
INSERT INTO `sys_menu` VALUES ('98', '报价列表', 'sale/baojiao/0', '1', null, '98', null, '63', '1', null);
INSERT INTO `sys_menu` VALUES ('99', '订单列表', 'sale/dingdan/0', '1', null, '99', null, '63', '1', null);
INSERT INTO `sys_menu` VALUES ('100', '销售商机', 'sale/xiaoshousj/0', '1', null, '100', null, '63', '1', null);
INSERT INTO `sys_menu` VALUES ('102', '渠道管理', 'sale/qudao/1', '1', null, '102', null, '64', '1', null);
INSERT INTO `sys_menu` VALUES ('103', '跟进列表', 'sale/genjin/1', '1', null, '103', null, '64', '1', null);
INSERT INTO `sys_menu` VALUES ('104', '报备列表', 'sale/baobei/1', '1', null, '104', null, '64', '1', null);
INSERT INTO `sys_menu` VALUES ('105', '技术任务', 'sale/techtask/1', '1', null, '105', null, '64', '1', null);
INSERT INTO `sys_menu` VALUES ('106', '合同列表', 'sale/hetong/1', '1', null, '106', null, '64', '1', null);
INSERT INTO `sys_menu` VALUES ('107', '报价列表', 'sale/baojiao/1', '1', null, '107', null, '64', '1', null);
INSERT INTO `sys_menu` VALUES ('108', '订单列表', 'sale/dingdan/1', '1', null, '108', null, '64', '1', null);
INSERT INTO `sys_menu` VALUES ('109', '销售商机', 'sale/xiaoshousj/1', '1', null, '109', null, '64', '1', null);
INSERT INTO `sys_menu` VALUES ('112', '日志', null, '1', null, '112', null, '3', '1', null);
INSERT INTO `sys_menu` VALUES ('113', '操作日志', 'sys/operaLog', '1', null, '113', null, '112', '1', null);
INSERT INTO `sys_menu` VALUES ('115', '文档分类', 'oa/articleCate', '1', null, '1', null, '17', '1', null);
INSERT INTO `sys_menu` VALUES ('116', '文档管理', 'oa/article', '1', null, '2', null, '17', '1', null);
INSERT INTO `sys_menu` VALUES ('117', '我的公告', 'oa/Gonggao', '1', null, '1', null, '28', '1', null);
INSERT INTO `sys_menu` VALUES ('118', '公告栏设置', 'oa/gglan', '1', null, '1', null, '28', '1', null);
INSERT INTO `sys_menu` VALUES ('119', '文件站', 'oa/fileBox', '1', 'icon-hard', '1', null, '1', '1', null);
INSERT INTO `sys_menu` VALUES ('120', '省份地市', 'sys/area', '1', null, '1', null, '3', '1', null);
INSERT INTO `sys_menu` VALUES ('121', '我发送的信息', 'oa/msg', '1', null, '1', null, '46', '1', null);
INSERT INTO `sys_menu` VALUES ('122', '收件信息', 'oa/recvmsg', '1', null, '1', null, '46', '1', null);
INSERT INTO `sys_menu` VALUES ('123', '我的考勤', 'oa/kaoqing/my', '1', null, '1', null, '22', '1', null);
INSERT INTO `sys_menu` VALUES ('124', '考勤维护', 'oa/kaoqing/wh', '1', null, '1', null, '22', '1', null);
INSERT INTO `sys_menu` VALUES ('125', '考勤设置', 'oa/kqset', '1', null, '1', null, '22', '1', null);
INSERT INTO `sys_menu` VALUES ('126', '公司邮箱', null, '1', null, '1', null, '3', '1', null);
INSERT INTO `sys_menu` VALUES ('127', '邮箱设置', 'oa/mailBox/set1', '1', null, '1', null, '126', '1', null);
INSERT INTO `sys_menu` VALUES ('128', '报备模版', 'sale/baobeimoban', '1', null, '1', null, '5', '1', null);
INSERT INTO `sys_parame` VALUES ('12', '行业', '0', 'HANGYE', '1', null, '0');
INSERT INTO `sys_parame` VALUES ('13', 'IT硬件', '1', '', '1', null, '12');
INSERT INTO `sys_parame` VALUES ('14', 'IT软件', '2', '', '1', null, '12');
INSERT INTO `sys_parame` VALUES ('15', '产品类型', '0', 'CPLX', '1', null, '0');
INSERT INTO `sys_parame` VALUES ('16', '软件', '1', '', '1', null, '15');
INSERT INTO `sys_parame` VALUES ('17', '硬件', '2', '', '1', null, '15');
INSERT INTO `sys_parame` VALUES ('18', '服务', '3', '', '1', null, '15');
INSERT INTO `sys_parame` VALUES ('19', '厂商类型', '0', 'CSLX', '1', null, '0');
INSERT INTO `sys_parame` VALUES ('20', '普通供应商', '1', '', '1', null, '19');
INSERT INTO `sys_parame` VALUES ('21', '重要供应商', '2', '', '1', null, '19');
INSERT INTO `sys_parame` VALUES ('22', '订单阶段', '0', 'DDJD', '1', null, '0');
INSERT INTO `sys_parame` VALUES ('23', '上门造访', '1', '', '1', null, '22');
INSERT INTO `sys_parame` VALUES ('24', '立项评估', '2', '', '1', null, '22');
INSERT INTO `sys_parame` VALUES ('25', '出方案书', '3', null, '0', null, '22');
INSERT INTO `sys_parame` VALUES ('26', '商务洽谈', '4', null, '0', null, '22');
INSERT INTO `sys_parame` VALUES ('27', '技术认可', '5', null, '0', null, '22');
INSERT INTO `sys_parame` VALUES ('28', '高层认同', '6', null, '0', null, '22');
INSERT INTO `sys_parame` VALUES ('29', '签订合同', '7', null, '0', null, '22');
INSERT INTO `sys_parame` VALUES ('30', '开户银行', '0', 'KHYH', '0', null, '0');
INSERT INTO `sys_parame` VALUES ('31', '招商银行', '1', null, '0', null, '30');
INSERT INTO `sys_parame` VALUES ('32', '工商银行', '2', null, '0', null, '30');
INSERT INTO `sys_parame` VALUES ('33', '网络规模', '0', 'WLGM', '0', null, null);
INSERT INTO `sys_parame` VALUES ('34', '厂商来源', '0', 'CSLY', '0', null, '0');
INSERT INTO `sys_parame` VALUES ('35', '直接创建', '0', null, '0', null, '34');
INSERT INTO `sys_parame` VALUES ('36', '快递公司', '0', 'KDGS', '0', null, null);
INSERT INTO `sys_parame` VALUES ('37', '产品单位', '', 'CPDW', '0', null, null);
INSERT INTO `sys_parame` VALUES ('38', '出货方式', '', 'CHFS', '0', null, null);
INSERT INTO `sys_parame` VALUES ('39', '未发送', '1', null, '0', null, '38');
INSERT INTO `sys_parame` VALUES ('40', '已发送', '2', null, '0', null, '38');
INSERT INTO `sys_parame` VALUES ('41', '跟踪进程', '', 'GZJC', '0', null, null);
INSERT INTO `sys_parame` VALUES ('42', '新建客户', '1', null, '0', null, '41');
INSERT INTO `sys_parame` VALUES ('43', '授信账期', '', 'SXZQ', '0', null, null);
INSERT INTO `sys_parame` VALUES ('44', '部门', '0', 'BUMEN', '0', '客户、厂家等联系人用', null);
INSERT INTO `sys_parame` VALUES ('45', '职位', '0', 'ZHIWEI', '0', '客户、厂家等联系人用', null);
INSERT INTO `sys_parame` VALUES ('46', '爱好', '0', 'AIHAO', '0', null, null);
INSERT INTO `sys_parame` VALUES ('47', '足球', '1', null, '0', null, '46');
INSERT INTO `sys_parame` VALUES ('48', '客户类型', '', 'KHLX', '0', null, null);
INSERT INTO `sys_parame` VALUES ('49', '核心供应商', '3', null, '0', null, '19');
INSERT INTO `sys_parame` VALUES ('50', '1-100', '1', null, '1', null, '33');
INSERT INTO `sys_parame` VALUES ('51', '100-500', '2', null, '1', null, '33');
INSERT INTO `sys_parame` VALUES ('52', '朋友介绍', '1', null, '1', null, '34');
INSERT INTO `sys_parame` VALUES ('53', '客户介绍', '2', null, '1', null, '34');
INSERT INTO `sys_partment` VALUES ('1', 'xxx有限公司', null, '0', '01', null, null, null, null, null);
INSERT INTO `sys_partment` VALUES ('8', '技术部', 'fdsfdsafsd', '1', '0101', '100000', '435435435', '12313213', null, 'fdsaf@12.com');
INSERT INTO `sys_partment` VALUES ('9', '销售部', null, '1', '0102', null, null, null, null, null);
INSERT INTO `sys_partment` VALUES ('10', '人力资源部', null, '1', '0103', null, null, null, null, null);
INSERT INTO `sys_partment` VALUES ('11', '后勤部', null, '1', '0104', null, null, null, null, null);
INSERT INTO `sys_partment` VALUES ('13', 'JEE', null, '12', '123213', null, null, null, null, null);
INSERT INTO `sys_post` VALUES ('3', '总经理', null, '1', '20');
INSERT INTO `sys_post` VALUES ('4', '总经理助理', null, '2', '3');
INSERT INTO `sys_post` VALUES ('5', '部门经理', null, '3', '0');
INSERT INTO `sys_post` VALUES ('6', '部门助理', null, '4', '0');
INSERT INTO `sys_post` VALUES ('7', '人力', null, '1', '0');
INSERT INTO `sys_post` VALUES ('8', '行政', null, '1', '0');
INSERT INTO `sys_post` VALUES ('9', '财务', 'dfdsafdsaf', '1', '0');
INSERT INTO `sys_post` VALUES ('10', '出纳', null, '1', '0');
INSERT INTO `sys_post` VALUES ('11', '销售员', null, '1', '0');
INSERT INTO `sys_post` VALUES ('12', '商务', null, '1', '0');
INSERT INTO `sys_post` VALUES ('20', '董事长', null, '1', '0');
INSERT INTO `sys_powermenu` VALUES ('51', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('50', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('49', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('41', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('40', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('39', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('38', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('12', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('92', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('30', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('27', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('26', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('25', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('24', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('23', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('125', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('124', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('123', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('22', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('21', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('20', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('19', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('18', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('10', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('90', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('89', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('88', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('87', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('86', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('85', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('9', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('84', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('83', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('82', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('81', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('80', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('79', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('78', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('8', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('77', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('76', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('75', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('74', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('73', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('72', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('7', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('71', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('70', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('69', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('68', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('67', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('66', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('6', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('128', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('109', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('108', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('107', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('106', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('105', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('104', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('103', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('102', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('64', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('100', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('99', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('98', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('97', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('96', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('95', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('94', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('93', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('63', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('5', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('62', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('61', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('60', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('59', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('58', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('57', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('4', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('127', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('126', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('120', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('114', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('113', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('111', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('112', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('52', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('16', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('15', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('14', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('13', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('11', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('3', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('56', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('55', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('54', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('53', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('2', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('119', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('48', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('47', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('122', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('121', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('46', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('45', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('44', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('43', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('42', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('36', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('35', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('34', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('33', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('32', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('31', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('29', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('118', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('117', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('12', '1', '1');
INSERT INTO `sys_powermenu` VALUES ('119', '1', '1');
INSERT INTO `sys_powermenu` VALUES ('48', '1', '1');
INSERT INTO `sys_powermenu` VALUES ('47', '1', '1');
INSERT INTO `sys_powermenu` VALUES ('122', '1', '1');
INSERT INTO `sys_powermenu` VALUES ('121', '1', '1');
INSERT INTO `sys_powermenu` VALUES ('46', '1', '1');
INSERT INTO `sys_powermenu` VALUES ('45', '1', '1');
INSERT INTO `sys_powermenu` VALUES ('44', '1', '1');
INSERT INTO `sys_powermenu` VALUES ('43', '1', '1');
INSERT INTO `sys_powermenu` VALUES ('42', '1', '1');
INSERT INTO `sys_powermenu` VALUES ('36', '1', '1');
INSERT INTO `sys_powermenu` VALUES ('35', '1', '1');
INSERT INTO `sys_powermenu` VALUES ('34', '1', '1');
INSERT INTO `sys_powermenu` VALUES ('33', '1', '1');
INSERT INTO `sys_powermenu` VALUES ('32', '1', '1');
INSERT INTO `sys_powermenu` VALUES ('31', '1', '1');
INSERT INTO `sys_powermenu` VALUES ('29', '1', '1');
INSERT INTO `sys_powermenu` VALUES ('118', '1', '1');
INSERT INTO `sys_powermenu` VALUES ('117', '1', '1');
INSERT INTO `sys_powermenu` VALUES ('110', '1', '1');
INSERT INTO `sys_powermenu` VALUES ('28', '1', '1');
INSERT INTO `sys_powermenu` VALUES ('116', '1', '1');
INSERT INTO `sys_powermenu` VALUES ('115', '1', '1');
INSERT INTO `sys_powermenu` VALUES ('17', '1', '1');
INSERT INTO `sys_powermenu` VALUES ('1', '1', '1');
INSERT INTO `sys_powermenu` VALUES ('110', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('28', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('116', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('115', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('17', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('116', '20', '1');
INSERT INTO `sys_powermenu` VALUES ('115', '20', '1');
INSERT INTO `sys_powermenu` VALUES ('17', '20', '1');
INSERT INTO `sys_powermenu` VALUES ('1', '20', '1');
INSERT INTO `sys_powermenu` VALUES ('28', '20', '1');
INSERT INTO `sys_powermenu` VALUES ('110', '20', '1');
INSERT INTO `sys_powermenu` VALUES ('117', '20', '1');
INSERT INTO `sys_powermenu` VALUES ('118', '20', '1');
INSERT INTO `sys_powermenu` VALUES ('29', '20', '1');
INSERT INTO `sys_powermenu` VALUES ('31', '20', '1');
INSERT INTO `sys_powermenu` VALUES ('32', '20', '1');
INSERT INTO `sys_powermenu` VALUES ('33', '20', '1');
INSERT INTO `sys_powermenu` VALUES ('34', '20', '1');
INSERT INTO `sys_powermenu` VALUES ('35', '20', '1');
INSERT INTO `sys_powermenu` VALUES ('36', '20', '1');
INSERT INTO `sys_powermenu` VALUES ('42', '20', '1');
INSERT INTO `sys_powermenu` VALUES ('43', '20', '1');
INSERT INTO `sys_powermenu` VALUES ('44', '20', '1');
INSERT INTO `sys_powermenu` VALUES ('45', '20', '1');
INSERT INTO `sys_powermenu` VALUES ('46', '20', '1');
INSERT INTO `sys_powermenu` VALUES ('121', '20', '1');
INSERT INTO `sys_powermenu` VALUES ('122', '20', '1');
INSERT INTO `sys_powermenu` VALUES ('47', '20', '1');
INSERT INTO `sys_powermenu` VALUES ('48', '20', '1');
INSERT INTO `sys_powermenu` VALUES ('119', '20', '1');
INSERT INTO `sys_powermenu` VALUES ('38', '1', '1');
INSERT INTO `sys_powermenu` VALUES ('39', '1', '1');
INSERT INTO `sys_powermenu` VALUES ('40', '1', '1');
INSERT INTO `sys_powermenu` VALUES ('41', '1', '1');
INSERT INTO `sys_powermenu` VALUES ('17', '6', '3');
INSERT INTO `sys_powermenu` VALUES ('115', '6', '3');
INSERT INTO `sys_powermenu` VALUES ('116', '6', '3');
INSERT INTO `sys_powermenu` VALUES ('1', '6', '3');
INSERT INTO `sys_powermenu` VALUES ('1', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('0', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('0', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('1', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('17', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('115', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('116', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('28', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('110', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('117', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('118', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('29', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('31', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('32', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('33', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('34', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('35', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('36', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('42', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('43', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('44', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('45', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('46', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('121', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('122', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('47', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('48', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('119', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('2', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('53', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('54', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('55', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('56', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('3', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('11', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('13', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('14', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('15', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('16', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('52', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('112', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('111', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('113', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('114', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('120', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('126', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('127', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('4', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('57', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('58', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('59', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('60', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('61', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('62', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('5', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('63', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('93', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('94', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('95', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('96', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('97', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('98', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('99', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('100', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('64', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('102', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('103', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('104', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('105', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('106', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('107', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('108', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('109', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('65', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('6', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('66', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('67', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('68', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('69', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('70', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('71', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('7', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('72', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('73', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('74', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('75', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('76', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('77', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('8', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('78', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('79', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('80', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('81', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('82', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('83', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('84', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('9', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('85', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('86', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('87', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('88', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('89', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('90', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('10', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('18', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('19', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('20', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('21', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('22', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('123', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('124', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('125', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('23', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('24', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('25', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('26', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('27', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('30', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('92', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('12', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('38', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('39', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('40', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('41', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('49', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('50', '20', '3');
INSERT INTO `sys_powermenu` VALUES ('51', '20', '3');
INSERT INTO `sys_role` VALUES ('1', '员工', null, '13');
INSERT INTO `sys_role` VALUES ('2', '管理员', '具有管理员权限', '1');
INSERT INTO `sys_role` VALUES ('3', '总经理', null, '1');
INSERT INTO `sys_role` VALUES ('4', '总经理助理', null, '2');
INSERT INTO `sys_role` VALUES ('5', '部门经理', null, '3');
INSERT INTO `sys_role` VALUES ('6', '部门助理', null, '4');
INSERT INTO `sys_role` VALUES ('7', '人力', null, '1');
INSERT INTO `sys_role` VALUES ('8', '行政', null, '1');
INSERT INTO `sys_role` VALUES ('9', '财务', null, '1');
INSERT INTO `sys_role` VALUES ('10', '出纳', null, '1');
INSERT INTO `sys_role` VALUES ('11', '销售员', null, '1');
INSERT INTO `sys_role` VALUES ('13', '库管员', null, '1');
INSERT INTO `sys_userrole` VALUES ('100000', '2');
INSERT INTO `sys_userrole` VALUES ('100000', '1');
INSERT INTO `sys_userrole` VALUES ('100000', '3');
INSERT INTO `sys_userrole` VALUES ('100001', '11');
INSERT INTO `sys_userrole` VALUES ('100002', '7');
INSERT INTO `sys_userrole` VALUES ('100003', '1');
