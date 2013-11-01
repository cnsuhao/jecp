CREATE TABLE `bbs_module` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `detail` varchar(100) DEFAULT NULL,
  `turn` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
)DEFAULT CHARSET=utf8;
CREATE TABLE `bbs_post` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `topicID` bigint NOT NULL,
  `userID` bigint NOT NULL DEFAULT '0',
  `content` text NOT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `hasReply` bit(1) NOT NULL DEFAULT b'0',
  `updateTime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
)DEFAULT CHARSET=utf8;
CREATE TABLE `bbs_reply` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `topicID` bigint NOT NULL DEFAULT '1',
  `postID` bigint NOT NULL,
  `userID` bigint NOT NULL DEFAULT '0',
  `content` varchar(300) NOT NULL,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
)  DEFAULT CHARSET=utf8;
CREATE TABLE `bbs_topic` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userID` bigint NOT NULL DEFAULT '0',
  `moduleID` bigint NOT NULL,
  `postCount` bigint NOT NULL DEFAULT '1',
  `replyCount` bigint NOT NULL DEFAULT '0',
  `pv` bigint NOT NULL DEFAULT '0',
  `content` varchar(60) NOT NULL,
  `emotion` tinyint(2) DEFAULT NULL,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isNice` bit(1) NOT NULL DEFAULT b'0',
  `isUp` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`)
) DEFAULT CHARSET=utf8;