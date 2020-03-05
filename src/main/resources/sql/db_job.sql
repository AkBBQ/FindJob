/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : db_job

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 05/03/2020 10:31:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `categoryId` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `categoryName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分类名称',
  `categoryPhoto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '分类图片',
  PRIMARY KEY (`categoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='职业分类';

-- ----------------------------
-- Records of category
-- ----------------------------
BEGIN;
INSERT INTO `category` VALUES (1, 'web前端', 'company-logo.png');
INSERT INTO `category` VALUES (2, 'java后端', 'img1.png');
INSERT INTO `category` VALUES (3, 'C++', 'img2.png');
INSERT INTO `category` VALUES (4, 'C#', 'img3.png');
INSERT INTO `category` VALUES (7, '架构师', '');
INSERT INTO `category` VALUES (8, '服务员', '');
INSERT INTO `category` VALUES (9, '销售', NULL);
COMMIT;

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `companyId` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '公司Id',
  `companyName` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公司名称',
  `companyNum` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '登录账号',
  `companyPwd` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '登录密码',
  `companyPerson` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '公司人数',
  `companyShort` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '公司简介（短词）',
  `companyAddr` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '公司地址',
  `companyPhoto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '公司头像',
  `companyIntro` text COLLATE utf8mb4_unicode_ci COMMENT '公司简介',
  `startTime` datetime DEFAULT NULL COMMENT '成立时间',
  `registerPrice` decimal(10,2) DEFAULT NULL COMMENT '注册资本',
  `releaseName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '发布人名称',
  `releasePhoto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '发布人头像',
  `releasePosition` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '发布人职位',
  `companyInfo` text COLLATE utf8mb4_unicode_ci COMMENT '公司介绍',
  `finance` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '公司融资',
  `companyType` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '公司类型',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '身份状态（1.普通用户2.超管）',
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '统一社会信用代码',
  PRIMARY KEY (`companyId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='公司信息表';

-- ----------------------------
-- Records of company
-- ----------------------------
BEGIN;
INSERT INTO `company` VALUES (1, '系统管理员', 'admin', 'admin', '100000', NULL, NULL, '/resource/uploads//admin.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO `company` VALUES (2, '华为', 'huawei', '123', '50000', '中国第一自主品牌', '北京市长兴街201号', '/resource/uploads//1583315551210huawei.jpg', '五险一金|免打卡', '2015-01-01 00:00:00', 8000000.00, '张家辉', 'https://img.bosszhipin.com/beijin/mcs/useravatar/20180507/e3b91ba1cca0bc89152f7b0b1602d28df17a7db4ea68c0ff2a54956dc508bff8_s.jpg?x-oss-process=image/resize,w_60,limit_0', '招聘经理', '为了中华崛起', '已上市', '技术服务', 0, NULL);
INSERT INTO `company` VALUES (3, '苹果', 'apple', '123', '100000', '美国第一科技公司', '美国华盛顿', '/resource/uploads//1583373128579apple.jpeg', '著名的乔布斯起手的企业', '2016-03-01 00:00:00', 5000000.00, 'John', 'https://img.bosszhipin.com/beijin/mcs/useravatar/20190716/a8cdf0b14b39107569a6dfcb3f0f8cd7cfcd208495d565ef66e7dff9f98764da_s.jpg', 'HR', '福利多多|十险八金', '已上市', '技术', 0, NULL);
COMMIT;

-- ----------------------------
-- Table structure for deliver
-- ----------------------------
DROP TABLE IF EXISTS `deliver`;
CREATE TABLE `deliver` (
  `deliverId` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `userId` int(11) NOT NULL COMMENT '用户id',
  `positionId` int(11) NOT NULL COMMENT '职位id',
  `state` int(11) NOT NULL DEFAULT '0' COMMENT '投递状态 1,已同意 2 已拒绝 3 已投递',
  `deliverTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '投递时间',
  `companyId` int(11) NOT NULL COMMENT '公司Id',
  `resumeId` int(11) NOT NULL COMMENT '简历Id',
  `favourite` int(11) DEFAULT '0' COMMENT '0:未收藏 1:已收藏',
  PRIMARY KEY (`deliverId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='投递职位记录表';

-- ----------------------------
-- Table structure for evaluate
-- ----------------------------
DROP TABLE IF EXISTS `evaluate`;
CREATE TABLE `evaluate` (
  `complaintId` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userId` int(11) DEFAULT NULL COMMENT '用户id',
  `positionId` int(11) DEFAULT NULL COMMENT '职位id',
  `content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '评论',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `star` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '评星',
  `companyId` int(11) DEFAULT NULL COMMENT '公司id',
  PRIMARY KEY (`complaintId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='评价表';

-- ----------------------------
-- Table structure for favorite
-- ----------------------------
DROP TABLE IF EXISTS `favorite`;
CREATE TABLE `favorite` (
  `id` int(11) NOT NULL COMMENT '主键',
  `positionId` int(11) DEFAULT NULL COMMENT '职位ID',
  `companyId` int(11) DEFAULT NULL COMMENT '公司id',
  `userId` int(11) DEFAULT NULL COMMENT '用户ID',
  `status` int(11) DEFAULT '0' COMMENT '0:未收藏 1:已收藏',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='个人收藏';

-- ----------------------------
-- Table structure for position
-- ----------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position` (
  `positionId` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `positionName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '职位名称',
  `positionAddr` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '所属地区',
  `positionRequest` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '职位要求',
  `companyId` int(11) NOT NULL COMMENT '所属公司',
  `positionDesc` text COLLATE utf8mb4_unicode_ci COMMENT '职位描述',
  `categoryId` int(11) NOT NULL COMMENT '所属类型',
  `positionPrice` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '月薪',
  `releaseDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '发布日期',
  `status` int(255) DEFAULT NULL,
  PRIMARY KEY (`positionId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='职位表';

-- ----------------------------
-- Records of position
-- ----------------------------
BEGIN;
INSERT INTO `position` VALUES (1, 'Java开发', '北京', '熟练使用Java进行编程', 2, '能够独立自主完成各项工作', 2, '20K', '2020-03-04 14:01:53', 1);
INSERT INTO `position` VALUES (2, 'IOS开发', '上海', '五年开发经验', 3, '能够熟练的使用ios相关技术进行开发', 2, '50K', '2020-03-05 09:53:28', NULL);
COMMIT;

-- ----------------------------
-- Table structure for resume
-- ----------------------------
DROP TABLE IF EXISTS `resume`;
CREATE TABLE `resume` (
  `resumeId` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `personalPoint` text COLLATE utf8mb4_unicode_ci COMMENT '个人优势',
  `desirePosition` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '期望职位',
  `workExperience` text COLLATE utf8mb4_unicode_ci COMMENT '工作经历',
  `projectExp` text COLLATE utf8mb4_unicode_ci COMMENT '项目经历',
  `eduExperience` text COLLATE utf8mb4_unicode_ci COMMENT '教育经历',
  `userId` int(11) DEFAULT NULL COMMENT '用户Id',
  `resumePhoto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '简历照片',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '居住地',
  `resumeName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '真实姓名',
  `resumeTel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '电话',
  PRIMARY KEY (`resumeId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='简历表';

-- ----------------------------
-- Records of resume
-- ----------------------------
BEGIN;
INSERT INTO `resume` VALUES (1, '本人吹逼大王,吹完就跑.真刺激', NULL, '1.在家玩\r\n2.在学校玩\r\n3.压马路', '没有对不起', '本科学历还是花钱买的', 33, '/resource/uploads/2020/3/0.113991341770538620200304214730692.jpeg', '杭州', '刘备', '15251800012');
INSERT INTO `resume` VALUES (4, '浑身是胆', NULL, '帮刘备打工', '血战长坂坡', '没读过书', 36, '/resource/uploads/2020/3/0.89259659029198620200304220352866.jpeg', '江苏省盐城市', '子龙', '110');
INSERT INTO `resume` VALUES (5, '力气大', NULL, '卖肉', '屠夫一号', '小学没毕业', 37, '/resource/uploads/2020/3/0.530117380560316920200304221322835.jpeg', '荆州', '张卖肉', '15251800012');
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userName` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名字',
  `userPwd` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `userTel` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '电话号码',
  `userAge` tinyint(2) DEFAULT NULL COMMENT '年龄',
  `userEdu` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '学历',
  `userState` tinyint(2) NOT NULL COMMENT '求职状态',
  `userSex` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '性别',
  `userBirth` datetime DEFAULT NULL COMMENT '出生日期',
  `userWorkDate` datetime DEFAULT NULL COMMENT '开始工作时间',
  `resumeId` int(2) DEFAULT NULL COMMENT '用户简历',
  `userEmail` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户邮箱',
  `userPhoto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户头像',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户表';

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (33, '张三', '123', '15251800012', 22, '本科', 0, '男', '2020-03-04 00:00:00', '2020-03-04 00:00:00', 1, '15251800012@163.com', '/resource/uploads/2020/3/0.264078955378388320200304214605307.jpeg');
INSERT INTO `user` VALUES (36, '赵云', '123', '15251800010', 45, '硕士', 0, '男', '2020-03-04 00:00:00', '2020-03-04 00:00:00', 4, '15251800012@163.com', '/resource/uploads/2020/3/0.649295756782370320200304220254336.jpeg');
INSERT INTO `user` VALUES (37, '张飞', '123', '15251800013', 22, '小学', 0, '男', '2020-03-04 00:00:00', '2020-03-04 00:00:00', 5, '15251800012@163.com', '/resource/uploads/2020/3/0.905360152496200920200304221239537.jpeg');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
