/*
MySQL Data Transfer
Source Host: localhost
Source Database: easyjfoa
Target Host: localhost
Target Database: easyjfoa
Date: 2013/8/18 15:29:56
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
  `id` bigint(20) NOT NULL auto_increment,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for fa_taxrate
-- ----------------------------
CREATE TABLE `fa_taxrate` (
  `ID` bigint(20) NOT NULL auto_increment,
  `STARTDATE` varchar(10) NOT NULL COMMENT 'yyyy-MM-dd',
  `RATE` float NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for fa_wagepay
-- ----------------------------
CREATE TABLE `fa_wagepay` (
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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM AUTO_INCREMENT=114 DEFAULT CHARSET=utf8 COMMENT='文件站';

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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='考勤';

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
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

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
-- Table structure for sys_area
-- ----------------------------
CREATE TABLE `sys_area` (
  `ID` bigint(20) NOT NULL auto_increment,
  `CNAME` varchar(50) default NULL,
  `PID` bigint(20) NOT NULL,
  `SORTNUM` int(11) default '0',
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

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
-- Table structure for sys_loginlog
-- ----------------------------
CREATE TABLE `sys_loginlog` (
  `id` bigint(20) NOT NULL auto_increment,
  `uid` bigint(20) NOT NULL,
  `loginTime` datetime NOT NULL,
  `ip` varchar(50) NOT NULL,
  `logoutTime` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM AUTO_INCREMENT=126 DEFAULT CHARSET=utf8;

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
  `supervisor` bigint(20) default NULL,
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
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

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
INSERT INTO `fa_taxrate` VALUES ('2', '2013-08-09', '200');
INSERT INTO `fa_taxrate` VALUES ('3', '2013-08-30', '12.5');
INSERT INTO `hr_employee` VALUES ('100000', '龙影', '1', 'loyin', 'e10adc3949ba59abbe56e057f20f883e', '2013-04-01', '13333333333', 'fdsafdgag', 'lsf', '2000-01-01', '1', '362422111112302332', '1', '9', '10000', '/upload/UkqVPCA.jpg', '8', '1', '1', 'fdsagfdsgfdg\r\nfda\r\nfdsa<input type=\'hidden\' name=\'token\' value=\'-3753824874469148842\' />', '<p>\r\n	范德萨飞洒<img src=\"/upload/image/1375874498387.jpg\" alt=\"\" /> \r\n</p>', '5', '127.0.0.1', '2013-08-16 20:35:15', null);
INSERT INTO `hr_employee` VALUES ('100001', '销售人员', '1', '001', null, '2013-08-13', null, null, 'fdsfa', '2013-08-13', '1', '362422111112302332', '1', '7', null, null, '9', null, '1', null, null, '11', null, null, null);
INSERT INTO `hr_employee` VALUES ('100002', '刘声凤', '1', '0233', null, '2013-08-13', null, null, 'fdsa', '2013-08-13', '1', '362422111112302332', '1', '7', null, null, '10', null, '1', null, null, '7', null, null, null);
INSERT INTO `hr_employee` VALUES ('100003', 'fasfdsaf', '1', '3456', null, '2013-08-15', null, null, 'fdsafs', '2013-08-14', '1', '362422111112302332', '1', '7', null, null, '11', null, '1', null, null, '4', null, null, null);
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
INSERT INTO `oa_emailset` VALUES ('2', 'loyin', 'loyin@loyin.net', '100000', 'pop3.loyin.net', '110', 'smtp.loyin.net', '25', '123456', '<p>\r\n	fdsafdsa\r\n</p>\r\n<p>\r\n	fdsafdsaf\r\n</p>\r\n<p>\r\n	<img src=\"/upload/image/UkNF0AL.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	fdsaf\r\n</p>\r\n<p>\r\n	afdsafdsa\r\n</p>\r\n<p>\r\n	fdsagfdsg\r\n</p>', '1', '0');
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
INSERT INTO `oa_filebox` VALUES ('104', 'head.jpg', 'image/UkvdQ5v.jpg', '100000', null, '2013-08-13 21:52:46', 'img', '0.00914574');
INSERT INTO `oa_filebox` VALUES ('105', 'AfUT1_dbmBgD_1R4bAZ6K.jpg.jpg', 'UkrY120.jpg', '100000', null, '2013-08-15 22:07:55', 'img', '0.0204153');
INSERT INTO `oa_filebox` VALUES ('106', 'AfUT1a9_mBg_T1R4bAZ6K.jpg.jpg', 'UkrY1w0.jpg', '100000', null, '2013-08-15 22:07:56', 'img', '0.0154123');
INSERT INTO `oa_filebox` VALUES ('107', 'AfUT1FdVmBCYv1R4bAZ6K.jpg.jpg', 'UkrY1A1.jpg', '100000', null, '2013-08-15 22:07:56', 'img', '0.023056');
INSERT INTO `oa_filebox` VALUES ('108', 'AfUT1FGJmB7xT1R4bAZ6K.jpg.jpg', 'UkrY1uy.jpg', '100000', null, '2013-08-15 22:07:56', 'img', '0.0264235');
INSERT INTO `oa_filebox` VALUES ('109', 'AfUT1GndmB4Z_1R4bAZ6K.jpg.jpg', 'UkrY1PC.jpg', '100000', null, '2013-08-15 22:07:56', 'img', '0.0162706');
INSERT INTO `oa_filebox` VALUES ('110', 'AfUT1hLVmBQWT1R4bAZ6K.jpg.jpg', 'UkrY15m.jpg', '100000', null, '2013-08-15 22:07:56', 'img', '0.017005');
INSERT INTO `oa_filebox` VALUES ('111', 'AfUT1IMDmByAT1R4bAZ6K.jpg.jpg', 'UkrY1MN.jpg', '100000', null, '2013-08-15 22:07:57', 'img', '0.0166931');
INSERT INTO `oa_filebox` VALUES ('112', 'AfUT1inCmBCK_1R4bAZ6K.jpg.jpg', 'UkrY1YU.jpg', '100000', null, '2013-08-15 22:07:57', 'img', '0.0313959');
INSERT INTO `oa_filebox` VALUES ('113', 'AfUT1MgbmBbYT1R4bAZ6K.jpg.jpg', 'UkrY1m0.jpg', '100000', null, '2013-08-15 22:07:57', 'img', '0.0214214');
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
INSERT INTO `oa_gonggao` VALUES ('9', '-==范德萨范德萨发地方', '<p>\r\n	范德萨范德萨发第三方\r\n</p>\r\n<p>\r\n	范德萨分\r\n</p>', '2013-08-13 21:27:39', '100000', '2013-08-13 21:28:03', null, '0', '2013-08-13', null, '1', null, '1');
INSERT INTO `oa_kaoqing` VALUES ('5', '100000', '16:12:41', '18:45:15', '2013-08-17', '8', '17', '2013', '127.0.0.1', '127.0.0.1', null, null, null, 'fdsafdsaf', null, '全匹配查询：查询数据没有特殊格式，默认为全匹配查询', '1');
INSERT INTO `oa_kqset` VALUES ('1', '1', '1', '1', '1', '1', '0', '0', '08:30', '18:00', '2013-08-16');
INSERT INTO `oa_kqset` VALUES ('2', '1', '1', '1', '1', '1', '1', '0', '09:00', '18:00', '2013-08-30');
INSERT INTO `oa_meeting` VALUES ('1', 'fdafa', null, '1', '2013-08-10 13:50:59', 'fdsafdsaf', null, null, '1', null, null, null);
INSERT INTO `oa_meeting` VALUES ('2', 'gfdsgfds', null, '1', '2013-08-10 13:52:29', 'gfdsgfdsgfd', '2013-08-10', '2013-08-10', '1', null, null, null);
INSERT INTO `oa_meeting` VALUES ('3', 'gfdsgfds', null, '1', '2013-08-10 14:03:47', 'gfdsgfdsgfd', '2013-08-10 00:00:00', null, '1', null, null, null);
INSERT INTO `oa_meeting` VALUES ('4', 'dsafdsafdsa', null, '1', '2013-08-10 14:58:11', 'fdsafdsafsdafsadf', '2013-08-10 10:00:00', '2013-08-10 12:00:00', '0', null, null, null);
INSERT INTO `oa_meeting` VALUES ('7', 'sdfdsf', null, '1', '2013-08-10 15:02:22', 'fdsafdsafsdfsafdsaf', '2013-08-10 00:00:00', '2013-08-10 15:02:15', '0', null, null, null);
INSERT INTO `oa_meeting` VALUES ('8', '范德萨范德萨发', null, '100000', '2013-08-13 21:34:59', '范德萨范德萨发', '2013-08-13 00:00:00', '2013-08-22 21:34:46', '0', null, null, null);
INSERT INTO `oa_meeting` VALUES ('9', '范德萨范德萨发', null, '100000', '2013-08-13 21:35:25', '范德萨范德萨发<img src=\"/upload/image/UkvdQ5v.jpg\" alt=\"\" />', '2013-08-13 00:00:00', '2013-08-22 21:34:46', '0', null, null, null);
INSERT INTO `oa_meetingjoin` VALUES ('9', '100002', '9', '0');
INSERT INTO `oa_meetingjoin` VALUES ('8', '100001', '9', '0');
INSERT INTO `oa_meetingjoin` VALUES ('7', '100000', '9', '0');
INSERT INTO `oa_meetingjoin` VALUES ('10', '100003', '9', '0');
INSERT INTO `oa_msg` VALUES ('1', '范德萨分', '100000', '2013-01-01 12:23:23', '范德萨飞洒大', '2');
INSERT INTO `oa_recvmsg` VALUES ('1', '1', '100000', '2013-08-15 22:54:44', '32', '3', '100000');
INSERT INTO `sys_area` VALUES ('8', '北京', '0', '1');
INSERT INTO `sys_area` VALUES ('9', '海淀区', '8', '1');
INSERT INTO `sys_area` VALUES ('10', '江西', '0', '1');
INSERT INTO `sys_area` VALUES ('11', '湖南', '0', '1');
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
INSERT INTO `sys_menu` VALUES ('24', '考核设置', null, '1', null, '24', null, '10', '1', null);
INSERT INTO `sys_menu` VALUES ('25', '员工考核', null, '1', null, '25', null, '10', '1', null);
INSERT INTO `sys_menu` VALUES ('26', '奖惩管理', null, '1', null, '26', null, '10', '1', null);
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
INSERT INTO `sys_menu` VALUES ('54', '客户管理', null, '1', null, '54', null, '2', '1', null);
INSERT INTO `sys_menu` VALUES ('55', '客户分配', null, '1', null, '55', null, '2', '1', null);
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
INSERT INTO `sys_menu` VALUES ('65', '合同管理', null, '1', null, '65', null, '5', '1', null);
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
INSERT INTO `sys_menu` VALUES ('77', '工资发放', null, '1', null, '77', null, '7', '1', null);
INSERT INTO `sys_menu` VALUES ('78', '分配任务', null, '1', null, '78', null, '8', '1', null);
INSERT INTO `sys_menu` VALUES ('79', '我的任务', null, '1', null, '79', null, '8', '1', null);
INSERT INTO `sys_menu` VALUES ('80', '解决方案', null, '1', null, '80', null, '8', '1', null);
INSERT INTO `sys_menu` VALUES ('81', '售后列表', null, '1', null, '81', null, '8', '1', null);
INSERT INTO `sys_menu` VALUES ('82', '分配客户', null, '1', null, '82', null, '8', '1', null);
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
INSERT INTO `sys_menu` VALUES ('93', '渠道管理', null, '1', null, '93', null, '63', '1', null);
INSERT INTO `sys_menu` VALUES ('94', '跟进列表', null, '1', null, '94', null, '63', '1', null);
INSERT INTO `sys_menu` VALUES ('95', '报备列表', null, '1', null, '95', null, '63', '1', null);
INSERT INTO `sys_menu` VALUES ('96', '技术任务', null, '1', null, '96', null, '63', '1', null);
INSERT INTO `sys_menu` VALUES ('97', '合同列表', null, '1', null, '97', null, '63', '1', null);
INSERT INTO `sys_menu` VALUES ('98', '报价列表', null, '1', null, '98', null, '63', '1', null);
INSERT INTO `sys_menu` VALUES ('99', '订单列表', null, '1', null, '99', null, '63', '1', null);
INSERT INTO `sys_menu` VALUES ('100', '销售商机', null, '1', null, '100', null, '63', '1', null);
INSERT INTO `sys_menu` VALUES ('102', '渠道管理', null, '1', null, '102', null, '64', '1', null);
INSERT INTO `sys_menu` VALUES ('103', '跟进列表', null, '1', null, '103', null, '64', '1', null);
INSERT INTO `sys_menu` VALUES ('104', '报备列表', null, '1', null, '104', null, '64', '1', null);
INSERT INTO `sys_menu` VALUES ('105', '技术任务', null, '1', null, '105', null, '64', '1', null);
INSERT INTO `sys_menu` VALUES ('106', '合同列表', null, '1', null, '106', null, '64', '1', null);
INSERT INTO `sys_menu` VALUES ('107', '报价列表', null, '1', null, '107', null, '64', '1', null);
INSERT INTO `sys_menu` VALUES ('108', '订单列表', null, '1', null, '108', null, '64', '1', null);
INSERT INTO `sys_menu` VALUES ('109', '销售商机', null, '1', null, '109', null, '64', '1', null);
INSERT INTO `sys_menu` VALUES ('112', '日志', null, '1', null, '112', null, '3', '1', null);
INSERT INTO `sys_menu` VALUES ('113', '操作日志', 'sys/operaLog', '1', null, '113', null, '112', '1', null);
INSERT INTO `sys_menu` VALUES ('114', '系统日志', 'sys/sysLog', '1', null, '114', null, '112', '1', null);
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
INSERT INTO `sys_partment` VALUES ('1', 'xxx有限公司', null, '0', '01', null);
INSERT INTO `sys_partment` VALUES ('8', '技术部', null, '1', '0101', null);
INSERT INTO `sys_partment` VALUES ('9', '销售部', null, '1', '0102', null);
INSERT INTO `sys_partment` VALUES ('10', '人力资源部', null, '1', '0103', null);
INSERT INTO `sys_partment` VALUES ('11', '后勤部', null, '1', '0104', null);
INSERT INTO `sys_partment` VALUES ('13', 'JEE', null, '12', '123213', null);
INSERT INTO `sys_post` VALUES ('1', '员工', null, '13');
INSERT INTO `sys_post` VALUES ('3', '总经理', null, '1');
INSERT INTO `sys_post` VALUES ('4', '总经理助理', null, '2');
INSERT INTO `sys_post` VALUES ('5', '部门经理', null, '3');
INSERT INTO `sys_post` VALUES ('6', '部门助理', null, '4');
INSERT INTO `sys_post` VALUES ('7', '人力', null, '1');
INSERT INTO `sys_post` VALUES ('8', '行政', null, '1');
INSERT INTO `sys_post` VALUES ('9', '财务', 'dfdsafdsaf', '1');
INSERT INTO `sys_post` VALUES ('10', '出纳', null, '1');
INSERT INTO `sys_post` VALUES ('11', '销售员', null, '1');
INSERT INTO `sys_post` VALUES ('12', '商务', null, '1');
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
INSERT INTO `sys_powermenu` VALUES ('65', '2', '1');
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
INSERT INTO `sys_powermenu` VALUES ('110', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('28', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('116', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('17', '1', '1');
INSERT INTO `sys_powermenu` VALUES ('115', '1', '1');
INSERT INTO `sys_powermenu` VALUES ('116', '1', '1');
INSERT INTO `sys_powermenu` VALUES ('117', '1', '1');
INSERT INTO `sys_powermenu` VALUES ('29', '1', '1');
INSERT INTO `sys_powermenu` VALUES ('31', '1', '1');
INSERT INTO `sys_powermenu` VALUES ('32', '1', '1');
INSERT INTO `sys_powermenu` VALUES ('33', '1', '1');
INSERT INTO `sys_powermenu` VALUES ('34', '1', '1');
INSERT INTO `sys_powermenu` VALUES ('35', '1', '1');
INSERT INTO `sys_powermenu` VALUES ('36', '1', '1');
INSERT INTO `sys_powermenu` VALUES ('42', '1', '1');
INSERT INTO `sys_powermenu` VALUES ('43', '1', '1');
INSERT INTO `sys_powermenu` VALUES ('44', '1', '1');
INSERT INTO `sys_powermenu` VALUES ('45', '1', '1');
INSERT INTO `sys_powermenu` VALUES ('46', '1', '1');
INSERT INTO `sys_powermenu` VALUES ('121', '1', '1');
INSERT INTO `sys_powermenu` VALUES ('122', '1', '1');
INSERT INTO `sys_powermenu` VALUES ('47', '1', '1');
INSERT INTO `sys_powermenu` VALUES ('48', '1', '1');
INSERT INTO `sys_powermenu` VALUES ('119', '1', '1');
INSERT INTO `sys_powermenu` VALUES ('40', '1', '1');
INSERT INTO `sys_powermenu` VALUES ('41', '1', '1');
INSERT INTO `sys_powermenu` VALUES ('1', '1', '1');
INSERT INTO `sys_powermenu` VALUES ('12', '1', '1');
INSERT INTO `sys_powermenu` VALUES ('28', '1', '1');
INSERT INTO `sys_powermenu` VALUES ('115', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('17', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('1', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('0', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('51', '2', '1');
INSERT INTO `sys_powermenu` VALUES ('17', '20', '1');
INSERT INTO `sys_powermenu` VALUES ('115', '20', '1');
INSERT INTO `sys_powermenu` VALUES ('116', '20', '1');
INSERT INTO `sys_powermenu` VALUES ('1', '20', '1');
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
INSERT INTO `sys_role` VALUES ('20', '测试', null, '2');
INSERT INTO `sys_userrole` VALUES ('100000', '2');
INSERT INTO `sys_userrole` VALUES ('100000', '1');
INSERT INTO `sys_userrole` VALUES ('100000', '3');
INSERT INTO `sys_userrole` VALUES ('100001', '11');
INSERT INTO `sys_userrole` VALUES ('100002', '7');
INSERT INTO `sys_userrole` VALUES ('100003', '1');
