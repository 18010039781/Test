/*
Navicat MySQL Data Transfer

Source Server         : mySql
Source Server Version : 50518
Source Host           : rm-bp10242541j2rfe74.mysql.rds.aliyuncs.com:3306
Source Database       : r172v08xq9

Target Server Type    : MYSQL
Target Server Version : 50518
File Encoding         : 65001

Date: 2017-03-10 22:12:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sc_department
-- ----------------------------
DROP TABLE IF EXISTS `sc_department`;
CREATE TABLE `sc_department` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `value` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of sc_department
-- ----------------------------
INSERT INTO `sc_department` VALUES ('1', '管理中心');
INSERT INTO `sc_department` VALUES ('2', '技术中心');
INSERT INTO `sc_department` VALUES ('3', '服务中心');

-- ----------------------------
-- Table structure for sc_level
-- ----------------------------
DROP TABLE IF EXISTS `sc_level`;
CREATE TABLE `sc_level` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(5) unsigned NOT NULL,
  `value` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`),
  CONSTRAINT `sc_level_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `sc_quarters` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='级别';

-- ----------------------------
-- Records of sc_level
-- ----------------------------
INSERT INTO `sc_level` VALUES ('1', '1', '管理员');
INSERT INTO `sc_level` VALUES ('4', '3', '界面开发');
INSERT INTO `sc_level` VALUES ('5', '3', '界面设计');
INSERT INTO `sc_level` VALUES ('6', '4', '系统架构');
INSERT INTO `sc_level` VALUES ('7', '4', '数据库设计');
INSERT INTO `sc_level` VALUES ('8', '5', '系统架构');
INSERT INTO `sc_level` VALUES ('9', '5', '数据库设计');
INSERT INTO `sc_level` VALUES ('10', '9', '清洁工');

-- ----------------------------
-- Table structure for sc_quarters
-- ----------------------------
DROP TABLE IF EXISTS `sc_quarters`;
CREATE TABLE `sc_quarters` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(5) unsigned NOT NULL,
  `value` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`),
  CONSTRAINT `sc_quarters_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `sc_department` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='岗位';

-- ----------------------------
-- Records of sc_quarters
-- ----------------------------
INSERT INTO `sc_quarters` VALUES ('1', '1', '管理员');
INSERT INTO `sc_quarters` VALUES ('3', '2', 'web前端');
INSERT INTO `sc_quarters` VALUES ('4', '2', 'php后端');
INSERT INTO `sc_quarters` VALUES ('5', '2', 'java开发');
INSERT INTO `sc_quarters` VALUES ('9', '3', '杂工');
INSERT INTO `sc_quarters` VALUES ('15', '3', '测试岗位');

-- ----------------------------
-- Table structure for sc_score_type
-- ----------------------------
DROP TABLE IF EXISTS `sc_score_type`;
CREATE TABLE `sc_score_type` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `scorename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sc_score_type
-- ----------------------------
INSERT INTO `sc_score_type` VALUES ('1', '签到');
INSERT INTO `sc_score_type` VALUES ('2', '提交阅读分享日志');
INSERT INTO `sc_score_type` VALUES ('3', '培训');
INSERT INTO `sc_score_type` VALUES ('4', '其他类型');
INSERT INTO `sc_score_type` VALUES ('5', '会议记录');
INSERT INTO `sc_score_type` VALUES ('6', '提出合理化建议');
INSERT INTO `sc_score_type` VALUES ('7', '提交日志2');

-- ----------------------------
-- Table structure for sc_svn
-- ----------------------------
DROP TABLE IF EXISTS `sc_svn`;
CREATE TABLE `sc_svn` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `datatime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `text` text,
  `score` int(11) unsigned NOT NULL,
  `scoretype` int(30) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `scoretype` (`scoretype`),
  CONSTRAINT `sc_svn_ibfk_2` FOREIGN KEY (`scoretype`) REFERENCES `sc_score_type` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sc_svn_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `sc_user_info` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sc_svn
-- ----------------------------
INSERT INTO `sc_svn` VALUES ('1', '21', '2017-01-24 13:26:35', '测试', '11', '1');
INSERT INTO `sc_svn` VALUES ('2', '5', '2017-01-24 13:47:04', '测试', '23', '1');
INSERT INTO `sc_svn` VALUES ('3', '5', '2017-01-23 13:47:09', '测试', '5', '1');
INSERT INTO `sc_svn` VALUES ('4', '4', '2017-01-24 13:47:48', '测试', '9', '1');
INSERT INTO `sc_svn` VALUES ('5', '21', '2017-01-24 13:50:53', '测试', '0', '1');
INSERT INTO `sc_svn` VALUES ('6', '21', '2017-01-28 12:07:01', 'dsafsdfa', '2', '3');
INSERT INTO `sc_svn` VALUES ('7', '21', '2016-08-17 13:45:45', '大是大非', '15', '6');
INSERT INTO `sc_svn` VALUES ('8', '21', '2016-12-14 12:48:25', '手动阀撒的发生的', '31', '6');
INSERT INTO `sc_svn` VALUES ('9', '21', '2016-07-12 12:20:15', '分公司风格正常走( ⊙o⊙ )?', '85', '5');
INSERT INTO `sc_svn` VALUES ('10', '21', '2017-02-03 11:32:21', '1fasdfa', '21', '4');
INSERT INTO `sc_svn` VALUES ('11', '5', '2017-02-14 16:49:01', '', '5', '2');
INSERT INTO `sc_svn` VALUES ('12', '21', '2017-02-14 16:07:03', '', '2', '4');
INSERT INTO `sc_svn` VALUES ('13', '21', '2017-02-22 10:11:35', '签到', '55', '1');
INSERT INTO `sc_svn` VALUES ('14', '21', '2017-02-21 13:39:25', '测试', '10', '4');
INSERT INTO `sc_svn` VALUES ('15', '21', '2017-02-27 18:03:22', 'asdd', '41', '1');
INSERT INTO `sc_svn` VALUES ('16', '4', '2017-03-02 11:10:11', 'sdzxc', '4', '1');
INSERT INTO `sc_svn` VALUES ('17', '4', '2017-03-02 11:34:11', 'vczcxv', '3', '1');
INSERT INTO `sc_svn` VALUES ('18', '21', '2017-03-01 14:50:10', 'safda', '21', '5');
INSERT INTO `sc_svn` VALUES ('19', '21', '2017-03-10 21:06:56', 'sadf', '12', '5');
INSERT INTO `sc_svn` VALUES ('20', '21', '2017-03-09 10:56:25', 'zzv', '22', '3');
INSERT INTO `sc_svn` VALUES ('21', '5', '2017-03-10 21:06:59', 'asdfasd', '32', '6');

-- ----------------------------
-- Table structure for sc_user
-- ----------------------------
DROP TABLE IF EXISTS `sc_user`;
CREATE TABLE `sc_user` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `sex` varchar(4) NOT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `datetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of sc_user
-- ----------------------------
INSERT INTO `sc_user` VALUES ('1', 'admin', 'b3111b4337a18bc982497cbfe17a0032', '男', null, null, '2017-01-20 11:18:01');
INSERT INTO `sc_user` VALUES ('2', 'shenchao', 'd91b8ffc23905b66ceece078a455712e', '男', null, null, '2017-01-20 11:18:34');
INSERT INTO `sc_user` VALUES ('5', 'chaochao', 'd91b8ffc23905b66ceece078a455712e', '男', null, null, '2017-01-20 11:18:37');
INSERT INTO `sc_user` VALUES ('6', '18010039781', 'd91b8ffc23905b66ceece078a455712e', '男', null, null, '2017-01-20 11:18:46');
INSERT INTO `sc_user` VALUES ('11', 'username', '998dea2b8ab9c5314ec4ec8a96e0c2b0', '', '192.168.31.157', null, '0000-00-00 00:00:00');
INSERT INTO `sc_user` VALUES ('12', 'password', 'c81508dcba2a3842ffd06945e516d9e9', '', '192.168.31.157', null, '2017-01-24 09:26:27');
INSERT INTO `sc_user` VALUES ('13', 'a123456', '7e296f7bb08c4653969546fabf987556', '', '10.132.98.143', null, '0000-00-00 00:00:00');
INSERT INTO `sc_user` VALUES ('14', 'test1', '6c2b9e439c9f23737430a9cc0eafdfbd', '', '192.168.0.100', '局域网', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for sc_user_info
-- ----------------------------
DROP TABLE IF EXISTS `sc_user_info`;
CREATE TABLE `sc_user_info` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(5) unsigned NOT NULL,
  `username` varchar(10) NOT NULL,
  `usertype` int(20) NOT NULL,
  `userpost` int(20) NOT NULL,
  `userimg` varchar(130) DEFAULT NULL,
  `posttype` int(80) NOT NULL,
  `phone` varchar(15) DEFAULT '',
  `type` int(15) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sc_user_info_ibfk_1` (`uid`),
  CONSTRAINT `sc_user_info_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `sc_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sc_user_info
-- ----------------------------
INSERT INTO `sc_user_info` VALUES ('4', '1', 'VIP', '1', '1', 'img/aaa.jpg', '1', '18010039780', '1');
INSERT INTO `sc_user_info` VALUES ('5', '2', '沈超', '1', '1', 'img/bbb.jpg', '1', null, '1');
INSERT INTO `sc_user_info` VALUES ('21', '12', '不会飞', '2', '3', './Uploads/./2017-01-23/58861d3f7e1ee.jpg', '4', '18010039781', '0');
INSERT INTO `sc_user_info` VALUES ('22', '13', 'a123456', '1', '1', null, '1', '18870238489', '0');
