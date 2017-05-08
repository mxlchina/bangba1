/*
Navicat MySQL Data Transfer

Source Server         : localhtos
Source Server Version : 50551
Source Host           : localhost:3306
Source Database       : bangba

Target Server Type    : MYSQL
Target Server Version : 50551
File Encoding         : 65001

Date: 2017-05-08 19:23:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for staff
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff` (
  `staff_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `last_name` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `picture` blob,
  `email` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `store_id` tinyint(3) unsigned DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `username` varchar(16) CHARACTER SET utf8 NOT NULL,
  `password` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `role` varchar(1) COLLATE utf8_bin NOT NULL,
  `nameinfo` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `sex` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  `depart` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `birthday` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `iphone` varchar(11) COLLATE utf8_bin DEFAULT NULL,
  `level` varchar(2) COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(5) COLLATE utf8_bin DEFAULT NULL,
  `workNo` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `score` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`staff_id`),
  KEY `idx_fk_store_id` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of staff
-- ----------------------------
INSERT INTO `staff` VALUES ('1', 'Mike', 'Hillyer', null, 'Mike.Hillyer@sakilastaff.com', '1', '1', 'Mike', '1234', '2017-05-03 20:25:11', '', 'test', null, null, null, null, null, null, 'V1', '00001', '1', '12');
INSERT INTO `staff` VALUES ('2', 'Jon', 'Stephens', null, 'Jon.Stephens@sakilastaff.com', '2', '1', 'Jon', '1234', '2017-05-03 20:25:15', '', 'test', null, null, null, null, null, null, 'V1', '00002', '2', '12');
INSERT INTO `staff` VALUES ('3', 'TOM', 'DSA', null, 'DF', '1', '1', 'TOM', '1234', '2017-05-03 20:25:19', '', 'test', null, null, null, null, null, null, 'V1', '00003', '2', '12');
INSERT INTO `staff` VALUES ('4', null, null, null, '11', null, null, '1', null, '2017-05-03 20:25:22', '0', 'test', '11111', '0', '11', '1', '11', '1', 'V1', '00004', '2', '12');
INSERT INTO `staff` VALUES ('5', null, null, null, 'mengxianglei', null, null, 'mengxianglei', 'mengxianglei', '2017-05-03 20:25:27', '1', 'test', 'mengxianglei', '0', 'mengxianglei', '19840430', 'mengxianglei', '13333333333', 'V1', '00005', '1', '12');

-- ----------------------------
-- Table structure for tb_announcement
-- ----------------------------
DROP TABLE IF EXISTS `tb_announcement`;
CREATE TABLE `tb_announcement` (
  `announcement` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_announcement
-- ----------------------------
INSERT INTO `tb_announcement` VALUES ('公告公告测试', '2017-05-02 12:14:04');

-- ----------------------------
-- Table structure for tb_department
-- ----------------------------
DROP TABLE IF EXISTS `tb_department`;
CREATE TABLE `tb_department` (
  `deptno` varchar(5) DEFAULT NULL,
  `deptname` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_department
-- ----------------------------
INSERT INTO `tb_department` VALUES ('00001', '基础设施类1');
INSERT INTO `tb_department` VALUES ('00002', '基础设施类2');
INSERT INTO `tb_department` VALUES ('00003', '网络安全类3');

-- ----------------------------
-- Table structure for tb_notice
-- ----------------------------
DROP TABLE IF EXISTS `tb_notice`;
CREATE TABLE `tb_notice` (
  `notice` varchar(255) DEFAULT '',
  `update_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_notice
-- ----------------------------
INSERT INTO `tb_notice` VALUES ('通知通知测试', '2017-05-24 12:14:39');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `pw` varchar(255) DEFAULT '' COMMENT '密码',
  `id` varchar(32) NOT NULL DEFAULT '' COMMENT '用户ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('aaa', 'aaa');
INSERT INTO `tb_user` VALUES ('bbb', 'bbb');
INSERT INTO `tb_user` VALUES ('ccc', 'ccc');
INSERT INTO `tb_user` VALUES ('ddd', 'ddd');
