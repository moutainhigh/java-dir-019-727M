/*
 Navicat Premium Data Transfer

 Source Server         : 我的腾讯云
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : 81.69.0.88:3306
 Source Schema         : yanxiuhair-cms-1.0

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 11/07/2021 09:07:56
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cms_about
-- ----------------------------
DROP TABLE IF EXISTS `cms_about`;
CREATE TABLE `cms_about`  (
  `about_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '关于我们ID',
  `company_desc` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '关于我们简介',
  `content_info` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容详情',
  `is_publish` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '是否发布（0已发布 1未发布）',
  `publish_time` datetime(0) NULL DEFAULT NULL COMMENT '发布时间',
  `create_by` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_by` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`about_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 108 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '关于我们' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_about
-- ----------------------------
INSERT INTO `cms_about` VALUES (107, '广州市某某智能水表有限公司,是一家由广州市科技局认定为民营科技创新企业,是国内最早致力于远程抄表系统产品的研发、生产、销售、工程安装和售后服务为一体，为客户提供一步到位的能源自动化、信息化管理，节约和治理能源浪费解决方案的高新技术企业。 公司主要在从事各种表计（水、电、气、暖等）的远程抄表系统、工业自动控制系统、楼宇智能化系统和微波通信系统的开发、生产和工程安装，具有对普通水、气表改装成带有多种信号输出功能的资格和能力。 公司一直秉承创新、发展为理念，优化结构为基础，技术创新为动力。十几年来，公司在全国范围内与多个城市的能源部门保持着...', '<p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">广州市某某智能水表有限公司,是一家由广州市科技局认定为民营科技创新企业,是国内最早致力于远程抄表系统产品的研发、生产、销售、工程安装和售后服务为一体，为客户提供一步到位的能源自动化、信息化管理，节约和治理能源浪费解决方案的高新技术企业。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\"><img alt=\"\" src=\"http://www.jrhsz.com/43413/uploads/201711/5a17774ccb999.jpg\" style=\"margin: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); border-width: initial; border-style: none; max-width: 100%;\"></p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">公司主要在从事各种表计（水、电、气、暖等）的远程抄表系统、工业自动控制系统、楼宇智能化系统和微波通信系统的开发、生产和工程安装，具有对普通水、气表改装成带有多种信号输出功能的资格和能力。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">公司一直秉承创新、发展为理念，优化结构为基础，技术创新为动力。十几年来，公司在全国范围内与多个城市的能源部门保持着长期的合作关系，携手万科集团、中海地产、华侨城地产、雅居乐集团、碧桂园集团、合生创展集团、天健集团等为战略合作伙伴，同时为改造和提升中国城市公用事业传统流量计量表具智能化水平和管理信息化水表，贡献着我们的一份力量。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">公司始终坚持“立足广东、以点带面，辐射全国、走出国门”的市场战略方针，立志将最先进的技术，最成熟的产品，最规范的工程和最优质的售后服务提供给客户，实现客户、企业、社会多赢的目标。</p>', '0', '2021-07-07 14:42:33', '妍秀', '2021-07-07 14:42:28', '妍秀', '2021-07-08 09:11:29');

-- ----------------------------
-- Table structure for cms_ads
-- ----------------------------
DROP TABLE IF EXISTS `cms_ads`;
CREATE TABLE `cms_ads`  (
  `ad_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '广告ID',
  `nav_code` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '导航代码',
  `position_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '位置代码',
  `ad_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '广告名称',
  `target` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '链接打开方式（0页签 1新窗口）',
  `path_addr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片存放地址',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接地址',
  `width` int(11) NOT NULL COMMENT '宽度',
  `height` int(11) NOT NULL COMMENT '高度',
  `ad_sort` int(11) NOT NULL COMMENT '显示顺序',
  `is_publish` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '是否发布（0已发布 1未发布）',
  `publish_time` datetime(0) NULL DEFAULT NULL COMMENT '发布时间',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_by` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_by` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ad_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 178 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '广告信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_ads
-- ----------------------------
INSERT INTO `cms_ads` VALUES (162, 'index', 'pc_index', 'banner', '_self', '/profile/upload/2021/07/07/96f314d0-51d9-4139-ae01-5c11957fa316.jpg', NULL, 100, 200, 1, '0', '2021-07-07 14:47:31', '0', '妍秀', '2021-07-07 14:46:59', '妍秀', '2021-07-07 14:47:31', NULL);
INSERT INTO `cms_ads` VALUES (163, 'index', 'pc_index', 'banner2', '_self', '/profile/upload/2021/07/07/74a58a8d-7ea6-417b-99de-623dc7e950f4.jpg', NULL, 100, 200, 2, '0', '2021-07-07 17:35:04', '0', '妍秀', '2021-07-07 17:34:30', '妍秀', '2021-07-07 17:35:04', NULL);
INSERT INTO `cms_ads` VALUES (164, 'product', 'pc_product', 'banner1', '_self', '/profile/upload/2021/07/07/8fdb6a1f-1fd3-47b9-8051-8116f64be169.jpg', NULL, 100, 200, 1, '0', '2021-07-07 17:36:31', '0', '妍秀', '2021-07-07 17:35:57', '妍秀', '2021-07-07 17:36:31', NULL);
INSERT INTO `cms_ads` VALUES (165, 'news', 'pc_news', 'banner1', '_self', '/profile/upload/2021/07/07/2050f191-075a-441b-a23e-568e5577c085.jpg', NULL, 100, 200, 1, '0', '2021-07-07 17:37:08', '0', '妍秀', '2021-07-07 17:36:34', '妍秀', '2021-07-07 17:37:08', NULL);
INSERT INTO `cms_ads` VALUES (166, 'case', 'pc_case', 'banner1', '_self', '/profile/upload/2021/07/07/aca064dc-33e7-43ad-9b9c-7b34cb8681a0.jpg', NULL, 100, 200, 1, '0', '2021-07-07 17:37:46', '0', '妍秀', '2021-07-07 17:37:12', '妍秀', '2021-07-07 17:37:46', NULL);
INSERT INTO `cms_ads` VALUES (167, 'about', 'pc_about', 'banner1', '_self', '/profile/upload/2021/07/07/6ec5d6ac-8cbe-4609-9199-b8da672f8827.jpg', NULL, 100, 200, 1, '0', '2021-07-07 17:38:47', '0', '妍秀', '2021-07-07 17:38:13', '妍秀', '2021-07-07 17:38:47', NULL);
INSERT INTO `cms_ads` VALUES (168, 'msg', 'pc_msg', 'banner1', '_self', '/profile/upload/2021/07/07/d328754d-74cf-4b4c-9d87-12d7dd1ef53a.jpg', NULL, 100, 200, 1, '0', '2021-07-07 17:39:15', '0', '妍秀', '2021-07-07 17:58:06', '妍秀', '2021-07-07 17:58:40', NULL);
INSERT INTO `cms_ads` VALUES (169, 'contact_us', 'pc_contact_us', 'banner1', '_self', '/profile/upload/2021/07/07/535525d5-1da7-417b-be3c-4d1763f9be67.jpg', NULL, 100, 200, 1, '0', '2021-07-07 17:39:33', '0', '妍秀', '2021-07-07 17:46:09', '妍秀', '2021-07-07 17:46:43', NULL);
INSERT INTO `cms_ads` VALUES (170, 'index', 'mobile_index', 'banner1', '_self', '/profile/upload/2021/07/08/cdc70149-c260-4a6b-a643-e0bab09a24de.jpg', NULL, 100, 200, 1, '0', '2021-07-08 09:37:15', '0', '妍秀', '2021-07-08 09:36:30', '妍秀', '2021-07-08 09:37:15', NULL);
INSERT INTO `cms_ads` VALUES (171, 'index', 'mobile_index', 'banner2', '_self', '/profile/upload/2021/07/08/7a3d9490-986c-4db2-9226-f92d2d7ffb03.jpg', NULL, 100, 200, 2, '0', '2021-07-08 09:37:38', '0', '妍秀', '2021-07-08 09:36:53', '妍秀', '2021-07-08 09:37:38', NULL);
INSERT INTO `cms_ads` VALUES (172, 'product', 'mobile_product', 'banner1', '_self', '/profile/upload/2021/07/08/faa635dd-5c9d-4f4a-9ba4-3719a15c7796.jpg', NULL, 100, 200, 1, '0', '2021-07-08 09:38:02', '0', '妍秀', '2021-07-08 09:37:17', '妍秀', '2021-07-08 09:38:02', NULL);
INSERT INTO `cms_ads` VALUES (173, 'news', 'mobile_news', 'banner1', '_self', '/profile/upload/2021/07/08/7304ff58-1ad7-4ce3-aec5-b3068864506a.jpg', NULL, 100, 200, 1, '0', '2021-07-08 09:39:10', '0', '妍秀', '2021-07-08 09:39:47', '妍秀', '2021-07-08 09:40:33', NULL);
INSERT INTO `cms_ads` VALUES (174, 'case', 'mobile_case', 'banner1', '_self', '/profile/upload/2021/07/08/b6f44f5d-35f0-4937-ba1a-7afe507f73e4.jpg', NULL, 100, 200, 1, '0', '2021-07-08 09:39:09', '0', '妍秀', '2021-07-08 09:39:52', '妍秀', '2021-07-08 09:40:37', NULL);
INSERT INTO `cms_ads` VALUES (175, 'about', 'mobile_about', 'banner1', '_self', '/profile/upload/2021/07/08/71085415-6224-4da6-8d1f-8c4268306c9c.jpg', NULL, 100, 200, 1, '0', '2021-07-08 09:39:07', '0', '妍秀', '2021-07-08 09:38:22', '妍秀', '2021-07-08 09:39:07', NULL);
INSERT INTO `cms_ads` VALUES (176, 'msg', 'mobile_msg', 'banner1', '_self', '/profile/upload/2021/07/08/0c676da5-2a93-40ac-94ae-80c35863222c.jpg', NULL, 100, 200, 1, '0', '2021-07-08 09:39:30', '0', '妍秀', '2021-07-08 09:39:43', '妍秀', '2021-07-08 09:40:29', NULL);
INSERT INTO `cms_ads` VALUES (177, 'contact_us', 'mobile_contact_us', 'banner1', '_self', '/profile/upload/2021/07/08/7ad4f9d2-1fef-4c74-87ab-4ebe180fb773.jpg', NULL, 100, 200, 1, '0', '2021-07-08 09:39:47', '0', '妍秀', '2021-07-08 09:39:39', '妍秀', '2021-07-08 09:40:24', NULL);

-- ----------------------------
-- Table structure for cms_ads_position
-- ----------------------------
DROP TABLE IF EXISTS `cms_ads_position`;
CREATE TABLE `cms_ads_position`  (
  `position_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '位置ID',
  `nav_code` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '导航代码，规则为：na+5位流水号，例如：na10000',
  `position_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '位置代码',
  `position_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '位置名称',
  `width` int(11) NOT NULL COMMENT '宽度px',
  `height` int(11) NOT NULL COMMENT '高度px',
  `device_type` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'pc' COMMENT '设备类型（pc电脑端 mobile移动端）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_by` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'admin' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_by` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`position_id`) USING BTREE,
  UNIQUE INDEX `idx_position_code`(`position_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '广告位置信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_ads_position
-- ----------------------------
INSERT INTO `cms_ads_position` VALUES (5, 'index', 'pc_index', '电脑端首页banner', 1912, 600, 'pc', '0', '妍秀', '2021-07-07 10:15:25', '妍秀', '2021-07-07 10:15:55', NULL);
INSERT INTO `cms_ads_position` VALUES (6, 'index', 'mobile_index', '移动端首页banner', 367, 172, 'mobile', '0', '妍秀', '2021-07-07 10:15:43', '妍秀', '2021-07-07 10:16:12', NULL);
INSERT INTO `cms_ads_position` VALUES (7, 'product', 'pc_product', '电脑端产品展示banner', 1912, 600, 'pc', '0', '妍秀', '2021-07-07 10:16:14', '妍秀', '2021-07-07 10:16:44', NULL);
INSERT INTO `cms_ads_position` VALUES (8, 'product', 'mobile_product', '移动端产品展示banner', 367, 172, 'mobile', '0', '妍秀', '2021-07-07 10:16:06', '妍秀', '2021-07-07 10:16:35', NULL);
INSERT INTO `cms_ads_position` VALUES (9, 'news', 'pc_news', '电脑端新闻资讯banner', 1912, 600, 'pc', '0', '妍秀', '2021-07-07 10:16:29', '妍秀', '2021-07-07 10:16:58', NULL);
INSERT INTO `cms_ads_position` VALUES (10, 'news', 'mobile_news', '移动端新闻资讯banner', 367, 172, 'mobile', '0', '妍秀', '2021-07-07 10:16:23', '妍秀', '2021-07-07 10:16:52', NULL);
INSERT INTO `cms_ads_position` VALUES (11, 'case', 'pc_case', '电脑端客户案例banner', 1912, 600, 'pc', '0', '妍秀', '2021-07-07 10:16:42', '妍秀', '2021-07-07 10:17:12', NULL);
INSERT INTO `cms_ads_position` VALUES (12, 'case', 'mobile_case', '移动端客户案例banner', 367, 172, 'mobile', '0', '妍秀', '2021-07-07 10:16:35', '妍秀', '2021-07-07 10:17:04', NULL);
INSERT INTO `cms_ads_position` VALUES (13, 'about', 'pc_about', '电脑端关于我们banner', 1912, 600, 'pc', '0', '妍秀', '2021-07-07 10:16:56', '妍秀', '2021-07-07 10:17:26', NULL);
INSERT INTO `cms_ads_position` VALUES (14, 'about', 'mobile_about', '移动端关于我们banner', 367, 172, 'mobile', '0', '妍秀', '2021-07-07 10:16:50', '妍秀', '2021-07-07 10:17:19', NULL);
INSERT INTO `cms_ads_position` VALUES (15, 'msg', 'pc_msg', '电脑端在线留言banner', 1912, 600, 'pc', '0', '妍秀', '2021-07-07 10:17:12', '妍秀', '2021-07-07 10:17:42', NULL);
INSERT INTO `cms_ads_position` VALUES (16, 'msg', 'mobile_msg', '移动端在线留言banner', 367, 172, 'mobile', '0', '妍秀', '2021-07-07 10:17:06', '妍秀', '2021-07-07 10:17:35', NULL);
INSERT INTO `cms_ads_position` VALUES (17, 'contact_us', 'pc_contact_us', '电脑端联系我们banner', 1912, 600, 'pc', '0', '妍秀', '2021-07-07 14:43:44', '妍秀', '2021-07-07 14:44:17', NULL);
INSERT INTO `cms_ads_position` VALUES (18, 'contact_us', 'mobile_contact_us', '移动端联系我们banner', 367, 172, 'mobile', '0', '妍秀', '2021-07-07 14:43:55', '妍秀', '2021-07-07 14:44:27', NULL);

-- ----------------------------
-- Table structure for cms_article
-- ----------------------------
DROP TABLE IF EXISTS `cms_article`;
CREATE TABLE `cms_article`  (
  `article_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章管理ID',
  `nav_code` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '导航代码',
  `category_code` char(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '栏目代码',
  `key_words` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '搜索关键字',
  `article_title` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章主题',
  `article_desc` varchar(1500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章简介',
  `article_hit` int(11) NOT NULL DEFAULT 0 COMMENT '点击数量',
  `article_sort` int(11) NULL DEFAULT 1 COMMENT '显示顺序',
  `article_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '文章类型（0文章 1图文）',
  `article_source` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '未知' COMMENT '文章来源',
  `article_img_url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章图片链接',
  `is_top` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '是否置顶（0已置顶 1未置顶）',
  `is_publish` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '是否发布（0已发布 1未发布）',
  `publish_time` datetime(0) NULL DEFAULT NULL COMMENT '发布时间',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '删除标志（0存在 1删除）',
  `create_by` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'admin' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_by` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`article_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 286 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文章管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_article
-- ----------------------------
INSERT INTO `cms_article` VALUES (264, 'news', 'ca10010', '', '智能水表领衔水表行业六大优势', '系统是由智能水表、集热器、集中器和传输线组成的远程抄表系统。该系统结合了微机技术、数字通信技术和水表计量技术，将计量、数据采集和处理集成为一体，整合了城市居民的用水信息，取代了传统的手工上门抄表方式。实现智能化，提高工作效率。', 1, 1, '0', '未知', '', '0', '0', '2021-07-07 18:03:52', '0', '妍秀', '2021-07-07 18:03:50', '妍秀', '2021-07-08 09:54:07', '');
INSERT INTO `cms_article` VALUES (265, 'news', 'ca10010', '', 'IC智能水表厂家告诉你ic卡水表的功能和特点', '制造商告诉您IC卡水表的功能和特点。', 1, 2, '0', '未知', '', '0', '0', '2021-07-07 18:04:57', '0', '妍秀', '2021-07-07 18:04:54', '妍秀', '2021-07-08 09:04:42', '');
INSERT INTO `cms_article` VALUES (266, 'news', 'ca10010', '', '智能水表领衔水表行业六大优势', '系统是由智能水表、集热器、集中器和传输线组成的远程抄表系统。该系统结合了微机技术、数字通信技术和水表计量技术，将计量、数据采集和处理集成为一体，整合了城市居民的用水信息，取代了传统的手工上门抄表方式。实现智能化，提高工作效率。', 0, 1, '0', '未知', '', '0', '0', '2021-07-07 18:03:52', '0', '妍秀', '2021-07-07 18:03:50', '妍秀', '2021-07-07 18:03:54', '');
INSERT INTO `cms_article` VALUES (267, 'news', 'ca10010', '', '智能水表领衔水表行业六大优势', '系统是由智能水表、集热器、集中器和传输线组成的远程抄表系统。该系统结合了微机技术、数字通信技术和水表计量技术，将计量、数据采集和处理集成为一体，整合了城市居民的用水信息，取代了传统的手工上门抄表方式。实现智能化，提高工作效率。', 0, 1, '0', '未知', '', '0', '0', '2021-07-07 18:03:52', '0', '妍秀', '2021-07-07 18:03:50', '妍秀', '2021-07-07 18:03:54', '');
INSERT INTO `cms_article` VALUES (268, 'news', 'ca10010', '', '智能水表领衔水表行业六大优势', '系统是由智能水表、集热器、集中器和传输线组成的远程抄表系统。该系统结合了微机技术、数字通信技术和水表计量技术，将计量、数据采集和处理集成为一体，整合了城市居民的用水信息，取代了传统的手工上门抄表方式。实现智能化，提高工作效率。', 0, 1, '0', '未知', '', '0', '0', '2021-07-07 18:03:52', '0', '妍秀', '2021-07-07 18:03:50', '妍秀', '2021-07-07 18:03:54', '');
INSERT INTO `cms_article` VALUES (269, 'news', 'ca10010', '', '智能水表领衔水表行业六大优势', '系统是由智能水表、集热器、集中器和传输线组成的远程抄表系统。该系统结合了微机技术、数字通信技术和水表计量技术，将计量、数据采集和处理集成为一体，整合了城市居民的用水信息，取代了传统的手工上门抄表方式。实现智能化，提高工作效率。', 0, 1, '0', '未知', '', '0', '0', '2021-07-07 18:03:52', '0', '妍秀', '2021-07-07 18:03:50', '妍秀', '2021-07-07 18:03:54', '');
INSERT INTO `cms_article` VALUES (270, 'news', 'ca10010', '', '智能水表领衔水表行业六大优势', '系统是由智能水表、集热器、集中器和传输线组成的远程抄表系统。该系统结合了微机技术、数字通信技术和水表计量技术，将计量、数据采集和处理集成为一体，整合了城市居民的用水信息，取代了传统的手工上门抄表方式。实现智能化，提高工作效率。', 0, 1, '0', '未知', '', '0', '0', '2021-07-07 18:03:52', '0', '妍秀', '2021-07-07 18:03:50', '妍秀', '2021-07-07 18:03:54', '');
INSERT INTO `cms_article` VALUES (271, 'news', 'ca10010', '', '智能水表领衔水表行业六大优势', '系统是由智能水表、集热器、集中器和传输线组成的远程抄表系统。该系统结合了微机技术、数字通信技术和水表计量技术，将计量、数据采集和处理集成为一体，整合了城市居民的用水信息，取代了传统的手工上门抄表方式。实现智能化，提高工作效率。', 0, 1, '0', '未知', '', '0', '0', '2021-07-07 18:03:52', '0', '妍秀', '2021-07-07 18:03:50', '妍秀', '2021-07-07 18:03:54', '');
INSERT INTO `cms_article` VALUES (272, 'news', 'ca10010', '', '智能水表领衔水表行业六大优势', '系统是由智能水表、集热器、集中器和传输线组成的远程抄表系统。该系统结合了微机技术、数字通信技术和水表计量技术，将计量、数据采集和处理集成为一体，整合了城市居民的用水信息，取代了传统的手工上门抄表方式。实现智能化，提高工作效率。', 0, 1, '0', '未知', '', '0', '0', '2021-07-07 18:03:52', '0', '妍秀', '2021-07-07 18:03:50', '妍秀', '2021-07-07 18:03:54', '');
INSERT INTO `cms_article` VALUES (273, 'news', 'ca10010', '', '智能水表领衔水表行业六大优势', '系统是由智能水表、集热器、集中器和传输线组成的远程抄表系统。该系统结合了微机技术、数字通信技术和水表计量技术，将计量、数据采集和处理集成为一体，整合了城市居民的用水信息，取代了传统的手工上门抄表方式。实现智能化，提高工作效率。', 0, 1, '0', '未知', '', '0', '0', '2021-07-07 18:03:52', '0', '妍秀', '2021-07-07 18:03:50', '妍秀', '2021-07-07 18:03:54', '');
INSERT INTO `cms_article` VALUES (274, 'news', 'ca10010', '', '智能水表领衔水表行业六大优势', '系统是由智能水表、集热器、集中器和传输线组成的远程抄表系统。该系统结合了微机技术、数字通信技术和水表计量技术，将计量、数据采集和处理集成为一体，整合了城市居民的用水信息，取代了传统的手工上门抄表方式。实现智能化，提高工作效率。', 0, 1, '0', '未知', '', '0', '0', '2021-07-07 18:03:52', '0', '妍秀', '2021-07-07 18:03:50', '妍秀', '2021-07-07 18:03:54', '');
INSERT INTO `cms_article` VALUES (275, 'news', 'ca10010', '', '智能水表领衔水表行业六大优势', '系统是由智能水表、集热器、集中器和传输线组成的远程抄表系统。该系统结合了微机技术、数字通信技术和水表计量技术，将计量、数据采集和处理集成为一体，整合了城市居民的用水信息，取代了传统的手工上门抄表方式。实现智能化，提高工作效率。', 0, 1, '0', '未知', '', '0', '0', '2021-07-07 18:03:52', '0', '妍秀', '2021-07-07 18:03:50', '妍秀', '2021-07-07 18:03:54', '');
INSERT INTO `cms_article` VALUES (276, 'news', 'ca10010', '', '智能水表领衔水表行业六大优势', '系统是由智能水表、集热器、集中器和传输线组成的远程抄表系统。该系统结合了微机技术、数字通信技术和水表计量技术，将计量、数据采集和处理集成为一体，整合了城市居民的用水信息，取代了传统的手工上门抄表方式。实现智能化，提高工作效率。', 1, 1, '0', '未知', '', '0', '0', '2021-07-07 18:03:52', '0', '妍秀', '2021-07-07 18:03:50', '妍秀', '2021-07-08 09:09:35', '');
INSERT INTO `cms_article` VALUES (277, 'news', 'ca10011', '', '智能水表领衔水表行业六大优势', '系统是由智能水表、集热器、集中器和传输线组成的远程抄表系统。该系统结合了微机技术、数字通信技术和水表计量技术，将计量、数据采集和处理集成为一体，整合了城市居民的用水信息，取代了传统的手工上门抄表方式。实现智能化，提高工作效率。', 0, 1, '0', '未知', '', '0', '0', '2021-07-07 18:03:52', '0', '妍秀', '2021-07-07 18:03:50', '妍秀', '2021-07-07 18:03:54', '');
INSERT INTO `cms_article` VALUES (278, 'news', 'ca10011', '', '智能水表领衔水表行业六大优势', '系统是由智能水表、集热器、集中器和传输线组成的远程抄表系统。该系统结合了微机技术、数字通信技术和水表计量技术，将计量、数据采集和处理集成为一体，整合了城市居民的用水信息，取代了传统的手工上门抄表方式。实现智能化，提高工作效率。', 0, 1, '0', '未知', '', '0', '0', '2021-07-07 18:03:52', '0', '妍秀', '2021-07-07 18:03:50', '妍秀', '2021-07-07 18:03:54', '');
INSERT INTO `cms_article` VALUES (279, 'news', 'ca10011', '', '智能水表领衔水表行业六大优势', '系统是由智能水表、集热器、集中器和传输线组成的远程抄表系统。该系统结合了微机技术、数字通信技术和水表计量技术，将计量、数据采集和处理集成为一体，整合了城市居民的用水信息，取代了传统的手工上门抄表方式。实现智能化，提高工作效率。', 1, 1, '0', '未知', '', '0', '0', '2021-07-07 18:03:52', '0', '妍秀', '2021-07-07 18:03:50', '妍秀', '2021-07-08 09:54:15', '');
INSERT INTO `cms_article` VALUES (280, 'news', 'ca10011', '', '智能水表领衔水表行业六大优势', '系统是由智能水表、集热器、集中器和传输线组成的远程抄表系统。该系统结合了微机技术、数字通信技术和水表计量技术，将计量、数据采集和处理集成为一体，整合了城市居民的用水信息，取代了传统的手工上门抄表方式。实现智能化，提高工作效率。', 0, 1, '0', '未知', '', '0', '0', '2021-07-07 18:03:52', '0', '妍秀', '2021-07-07 18:03:50', '妍秀', '2021-07-07 18:03:54', '');
INSERT INTO `cms_article` VALUES (281, 'news', 'ca10011', '', '智能水表领衔水表行业六大优势', '系统是由智能水表、集热器、集中器和传输线组成的远程抄表系统。该系统结合了微机技术、数字通信技术和水表计量技术，将计量、数据采集和处理集成为一体，整合了城市居民的用水信息，取代了传统的手工上门抄表方式。实现智能化，提高工作效率。', 0, 1, '0', '未知', '', '0', '0', '2021-07-07 18:03:52', '0', '妍秀', '2021-07-07 18:03:50', '妍秀', '2021-07-07 18:03:54', '');
INSERT INTO `cms_article` VALUES (282, 'news', 'ca10011', '', '智能水表领衔水表行业六大优势', '系统是由智能水表、集热器、集中器和传输线组成的远程抄表系统。该系统结合了微机技术、数字通信技术和水表计量技术，将计量、数据采集和处理集成为一体，整合了城市居民的用水信息，取代了传统的手工上门抄表方式。实现智能化，提高工作效率。', 0, 1, '0', '未知', '', '0', '0', '2021-07-07 18:03:52', '0', '妍秀', '2021-07-07 18:03:50', '妍秀', '2021-07-07 18:03:54', '');
INSERT INTO `cms_article` VALUES (283, 'news', 'ca10011', '', '智能水表领衔水表行业六大优势', '系统是由智能水表、集热器、集中器和传输线组成的远程抄表系统。该系统结合了微机技术、数字通信技术和水表计量技术，将计量、数据采集和处理集成为一体，整合了城市居民的用水信息，取代了传统的手工上门抄表方式。实现智能化，提高工作效率。', 0, 1, '0', '未知', '', '0', '0', '2021-07-07 18:03:52', '0', '妍秀', '2021-07-07 18:03:50', '妍秀', '2021-07-07 18:03:54', '');
INSERT INTO `cms_article` VALUES (284, 'news', 'ca10011', '', '智能水表领衔水表行业六大优势', '系统是由智能水表、集热器、集中器和传输线组成的远程抄表系统。该系统结合了微机技术、数字通信技术和水表计量技术，将计量、数据采集和处理集成为一体，整合了城市居民的用水信息，取代了传统的手工上门抄表方式。实现智能化，提高工作效率。', 0, 1, '0', '未知', '', '0', '0', '2021-07-07 18:03:52', '0', '妍秀', '2021-07-07 18:03:50', '妍秀', '2021-07-07 18:03:54', '');
INSERT INTO `cms_article` VALUES (285, 'news', 'ca10011', '', '智能水表领衔水表行业六大优势', '系统是由智能水表、集热器、集中器和传输线组成的远程抄表系统。该系统结合了微机技术、数字通信技术和水表计量技术，将计量、数据采集和处理集成为一体，整合了城市居民的用水信息，取代了传统的手工上门抄表方式。实现智能化，提高工作效率。', 0, 1, '0', '未知', '', '0', '0', '2021-07-07 18:03:52', '0', '妍秀', '2021-07-07 18:03:50', '妍秀', '2021-07-07 18:03:54', '');

-- ----------------------------
-- Table structure for cms_article_info
-- ----------------------------
DROP TABLE IF EXISTS `cms_article_info`;
CREATE TABLE `cms_article_info`  (
  `article_info_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章内容ID',
  `article_id` int(11) NOT NULL COMMENT '文章ID',
  `article_info` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '文章内容详情',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`article_info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 73 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文章信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_article_info
-- ----------------------------
INSERT INTO `cms_article_info` VALUES (51, 264, '<p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">系统是由智能水表、集热器、集中器和传输线组成的远程抄表系统。该系统结合了微机技术、数字通信技术和水表计量技术，将计量、数据采集和处理集成为一体，整合了城市居民的用水信息，取代了传统的手工上门抄表方式。实现智能化，提高工作效率。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　智能水表的普及已成为水渠的一种节奏，普及速度空前。智能水表如此流行的原因在于它自身的优势决定了它的领先地位。这里将从六个方面谈谈智能水表的优点。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　1、降低抄表人员劳动强度，提高抄表效率500倍。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　2、解决了家庭抄表干扰的问题，保护了居民的隐私，避免了抄表造成的隐患。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　3、降低了抄表成本，在稳定、可靠和低维护的前提下，可以节省2/3甚至更高的人工成本。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　4、减少抄表错误率引起的经济纠纷，有助于构建和谐社会。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　5、提高市场营销的科技含量和服务水平。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　6、结合各种支付系统，提供银行代扣、网上支付、电话语音、手机短信等多种服务方式。</p>', '2021-07-07 18:03:50');
INSERT INTO `cms_article_info` VALUES (52, 265, '<p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">制造商告诉您IC卡水表的功能和特点。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　1、优质外壳水表采用全铜外壳，避免生锈和水污染。水表入口设有滤网，避免了水表的堵塞，降低了水表的故障率。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　2、带梯子充电的智能IC卡水表具有自动梯子充电功能，可实现定额内平价计费的耗水功能，以及价格过高的自动梯子充电功能。四种价格可以通过管理系统来设置。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　3、柔性开关由于采用了电磁逻辑控制先导阀(阀门是我们的专利技术)，加上高科技的智能电路，保证了阀门的灵活性、开关的精确性，避免了卡死现象的发生，同时也大大缩短了开关时间。工作时间(动作时间仅为0.5秒左右)，减少了工作电流，大大提高了水表的使用寿命，电池寿命可保证6年以上。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　4、双显示表具有LCD机械双重显示功能。用户可以通过查询键来检查阀门开/关状态、剩余水量、用水量、用水单价、报警量等信息。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　5、超微功耗采用高科技低功耗电路设计，加上进口优质电子元器件(CPU和主芯片均从美国进口，并通过特殊防水处理，确保IC卡水表工作的稳定性，提高可靠性)。使用的重要性。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　6、防潮技术采用我公司自行开发的防潮源材料，用于电路板等暴露部位采用琥珀包装形式，保证封装电路板在盐水中浸泡24小时后各项技术参数不变。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　7、铅封在保护水表的外壳上，以避免用户擅自移走仪表。在管道和管道之间的接口处保留铅封孔。水表安装后，可使用铅封来密封水表。用户不能随意拆卸水表。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　8、防盗功能当水表碰到磁性物质时，水表自动关闭，表示用户偷水，用户可以再次插入用户卡打开水表，这样水表就不会打开四次，管理部门通过管理卡处理。偷水现象已被消除。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　9、欠压保护功能：当水表中的电池电压低于正常工作电压时，IC卡水表关闭，LCD显示“电池欠压”，提醒管理部门更换电池，表中的数据为N。电池更换过程中会丢失。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　10、安全功能是一张卡，非法卡无效，安全性强。</p>', '2021-07-07 18:04:54');
INSERT INTO `cms_article_info` VALUES (53, 266, '<p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">系统是由智能水表、集热器、集中器和传输线组成的远程抄表系统。该系统结合了微机技术、数字通信技术和水表计量技术，将计量、数据采集和处理集成为一体，整合了城市居民的用水信息，取代了传统的手工上门抄表方式。实现智能化，提高工作效率。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　智能水表的普及已成为水渠的一种节奏，普及速度空前。智能水表如此流行的原因在于它自身的优势决定了它的领先地位。这里将从六个方面谈谈智能水表的优点。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　1、降低抄表人员劳动强度，提高抄表效率500倍。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　2、解决了家庭抄表干扰的问题，保护了居民的隐私，避免了抄表造成的隐患。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　3、降低了抄表成本，在稳定、可靠和低维护的前提下，可以节省2/3甚至更高的人工成本。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　4、减少抄表错误率引起的经济纠纷，有助于构建和谐社会。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　5、提高市场营销的科技含量和服务水平。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　6、结合各种支付系统，提供银行代扣、网上支付、电话语音、手机短信等多种服务方式。</p>', '2021-07-07 18:03:50');
INSERT INTO `cms_article_info` VALUES (54, 267, '<p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">系统是由智能水表、集热器、集中器和传输线组成的远程抄表系统。该系统结合了微机技术、数字通信技术和水表计量技术，将计量、数据采集和处理集成为一体，整合了城市居民的用水信息，取代了传统的手工上门抄表方式。实现智能化，提高工作效率。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　智能水表的普及已成为水渠的一种节奏，普及速度空前。智能水表如此流行的原因在于它自身的优势决定了它的领先地位。这里将从六个方面谈谈智能水表的优点。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　1、降低抄表人员劳动强度，提高抄表效率500倍。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　2、解决了家庭抄表干扰的问题，保护了居民的隐私，避免了抄表造成的隐患。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　3、降低了抄表成本，在稳定、可靠和低维护的前提下，可以节省2/3甚至更高的人工成本。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　4、减少抄表错误率引起的经济纠纷，有助于构建和谐社会。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　5、提高市场营销的科技含量和服务水平。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　6、结合各种支付系统，提供银行代扣、网上支付、电话语音、手机短信等多种服务方式。</p>', '2021-07-07 18:03:50');
INSERT INTO `cms_article_info` VALUES (55, 268, '<p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">系统是由智能水表、集热器、集中器和传输线组成的远程抄表系统。该系统结合了微机技术、数字通信技术和水表计量技术，将计量、数据采集和处理集成为一体，整合了城市居民的用水信息，取代了传统的手工上门抄表方式。实现智能化，提高工作效率。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　智能水表的普及已成为水渠的一种节奏，普及速度空前。智能水表如此流行的原因在于它自身的优势决定了它的领先地位。这里将从六个方面谈谈智能水表的优点。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　1、降低抄表人员劳动强度，提高抄表效率500倍。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　2、解决了家庭抄表干扰的问题，保护了居民的隐私，避免了抄表造成的隐患。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　3、降低了抄表成本，在稳定、可靠和低维护的前提下，可以节省2/3甚至更高的人工成本。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　4、减少抄表错误率引起的经济纠纷，有助于构建和谐社会。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　5、提高市场营销的科技含量和服务水平。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　6、结合各种支付系统，提供银行代扣、网上支付、电话语音、手机短信等多种服务方式。</p>', '2021-07-07 18:03:50');
INSERT INTO `cms_article_info` VALUES (56, 269, '<p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">系统是由智能水表、集热器、集中器和传输线组成的远程抄表系统。该系统结合了微机技术、数字通信技术和水表计量技术，将计量、数据采集和处理集成为一体，整合了城市居民的用水信息，取代了传统的手工上门抄表方式。实现智能化，提高工作效率。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　智能水表的普及已成为水渠的一种节奏，普及速度空前。智能水表如此流行的原因在于它自身的优势决定了它的领先地位。这里将从六个方面谈谈智能水表的优点。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　1、降低抄表人员劳动强度，提高抄表效率500倍。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　2、解决了家庭抄表干扰的问题，保护了居民的隐私，避免了抄表造成的隐患。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　3、降低了抄表成本，在稳定、可靠和低维护的前提下，可以节省2/3甚至更高的人工成本。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　4、减少抄表错误率引起的经济纠纷，有助于构建和谐社会。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　5、提高市场营销的科技含量和服务水平。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　6、结合各种支付系统，提供银行代扣、网上支付、电话语音、手机短信等多种服务方式。</p>', '2021-07-07 18:03:50');
INSERT INTO `cms_article_info` VALUES (57, 270, '<p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">系统是由智能水表、集热器、集中器和传输线组成的远程抄表系统。该系统结合了微机技术、数字通信技术和水表计量技术，将计量、数据采集和处理集成为一体，整合了城市居民的用水信息，取代了传统的手工上门抄表方式。实现智能化，提高工作效率。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　智能水表的普及已成为水渠的一种节奏，普及速度空前。智能水表如此流行的原因在于它自身的优势决定了它的领先地位。这里将从六个方面谈谈智能水表的优点。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　1、降低抄表人员劳动强度，提高抄表效率500倍。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　2、解决了家庭抄表干扰的问题，保护了居民的隐私，避免了抄表造成的隐患。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　3、降低了抄表成本，在稳定、可靠和低维护的前提下，可以节省2/3甚至更高的人工成本。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　4、减少抄表错误率引起的经济纠纷，有助于构建和谐社会。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　5、提高市场营销的科技含量和服务水平。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　6、结合各种支付系统，提供银行代扣、网上支付、电话语音、手机短信等多种服务方式。</p>', '2021-07-07 18:03:50');
INSERT INTO `cms_article_info` VALUES (58, 271, '<p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">系统是由智能水表、集热器、集中器和传输线组成的远程抄表系统。该系统结合了微机技术、数字通信技术和水表计量技术，将计量、数据采集和处理集成为一体，整合了城市居民的用水信息，取代了传统的手工上门抄表方式。实现智能化，提高工作效率。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　智能水表的普及已成为水渠的一种节奏，普及速度空前。智能水表如此流行的原因在于它自身的优势决定了它的领先地位。这里将从六个方面谈谈智能水表的优点。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　1、降低抄表人员劳动强度，提高抄表效率500倍。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　2、解决了家庭抄表干扰的问题，保护了居民的隐私，避免了抄表造成的隐患。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　3、降低了抄表成本，在稳定、可靠和低维护的前提下，可以节省2/3甚至更高的人工成本。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　4、减少抄表错误率引起的经济纠纷，有助于构建和谐社会。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　5、提高市场营销的科技含量和服务水平。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　6、结合各种支付系统，提供银行代扣、网上支付、电话语音、手机短信等多种服务方式。</p>', '2021-07-07 18:03:50');
INSERT INTO `cms_article_info` VALUES (59, 272, '<p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">系统是由智能水表、集热器、集中器和传输线组成的远程抄表系统。该系统结合了微机技术、数字通信技术和水表计量技术，将计量、数据采集和处理集成为一体，整合了城市居民的用水信息，取代了传统的手工上门抄表方式。实现智能化，提高工作效率。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　智能水表的普及已成为水渠的一种节奏，普及速度空前。智能水表如此流行的原因在于它自身的优势决定了它的领先地位。这里将从六个方面谈谈智能水表的优点。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　1、降低抄表人员劳动强度，提高抄表效率500倍。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　2、解决了家庭抄表干扰的问题，保护了居民的隐私，避免了抄表造成的隐患。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　3、降低了抄表成本，在稳定、可靠和低维护的前提下，可以节省2/3甚至更高的人工成本。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　4、减少抄表错误率引起的经济纠纷，有助于构建和谐社会。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　5、提高市场营销的科技含量和服务水平。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　6、结合各种支付系统，提供银行代扣、网上支付、电话语音、手机短信等多种服务方式。</p>', '2021-07-07 18:03:50');
INSERT INTO `cms_article_info` VALUES (60, 273, '<p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">系统是由智能水表、集热器、集中器和传输线组成的远程抄表系统。该系统结合了微机技术、数字通信技术和水表计量技术，将计量、数据采集和处理集成为一体，整合了城市居民的用水信息，取代了传统的手工上门抄表方式。实现智能化，提高工作效率。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　智能水表的普及已成为水渠的一种节奏，普及速度空前。智能水表如此流行的原因在于它自身的优势决定了它的领先地位。这里将从六个方面谈谈智能水表的优点。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　1、降低抄表人员劳动强度，提高抄表效率500倍。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　2、解决了家庭抄表干扰的问题，保护了居民的隐私，避免了抄表造成的隐患。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　3、降低了抄表成本，在稳定、可靠和低维护的前提下，可以节省2/3甚至更高的人工成本。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　4、减少抄表错误率引起的经济纠纷，有助于构建和谐社会。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　5、提高市场营销的科技含量和服务水平。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　6、结合各种支付系统，提供银行代扣、网上支付、电话语音、手机短信等多种服务方式。</p>', '2021-07-07 18:03:50');
INSERT INTO `cms_article_info` VALUES (61, 274, '<p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">系统是由智能水表、集热器、集中器和传输线组成的远程抄表系统。该系统结合了微机技术、数字通信技术和水表计量技术，将计量、数据采集和处理集成为一体，整合了城市居民的用水信息，取代了传统的手工上门抄表方式。实现智能化，提高工作效率。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　智能水表的普及已成为水渠的一种节奏，普及速度空前。智能水表如此流行的原因在于它自身的优势决定了它的领先地位。这里将从六个方面谈谈智能水表的优点。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　1、降低抄表人员劳动强度，提高抄表效率500倍。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　2、解决了家庭抄表干扰的问题，保护了居民的隐私，避免了抄表造成的隐患。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　3、降低了抄表成本，在稳定、可靠和低维护的前提下，可以节省2/3甚至更高的人工成本。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　4、减少抄表错误率引起的经济纠纷，有助于构建和谐社会。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　5、提高市场营销的科技含量和服务水平。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　6、结合各种支付系统，提供银行代扣、网上支付、电话语音、手机短信等多种服务方式。</p>', '2021-07-07 18:03:50');
INSERT INTO `cms_article_info` VALUES (62, 275, '<p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">系统是由智能水表、集热器、集中器和传输线组成的远程抄表系统。该系统结合了微机技术、数字通信技术和水表计量技术，将计量、数据采集和处理集成为一体，整合了城市居民的用水信息，取代了传统的手工上门抄表方式。实现智能化，提高工作效率。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　智能水表的普及已成为水渠的一种节奏，普及速度空前。智能水表如此流行的原因在于它自身的优势决定了它的领先地位。这里将从六个方面谈谈智能水表的优点。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　1、降低抄表人员劳动强度，提高抄表效率500倍。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　2、解决了家庭抄表干扰的问题，保护了居民的隐私，避免了抄表造成的隐患。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　3、降低了抄表成本，在稳定、可靠和低维护的前提下，可以节省2/3甚至更高的人工成本。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　4、减少抄表错误率引起的经济纠纷，有助于构建和谐社会。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　5、提高市场营销的科技含量和服务水平。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　6、结合各种支付系统，提供银行代扣、网上支付、电话语音、手机短信等多种服务方式。</p>', '2021-07-07 18:03:50');
INSERT INTO `cms_article_info` VALUES (63, 276, '<p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">系统是由智能水表、集热器、集中器和传输线组成的远程抄表系统。该系统结合了微机技术、数字通信技术和水表计量技术，将计量、数据采集和处理集成为一体，整合了城市居民的用水信息，取代了传统的手工上门抄表方式。实现智能化，提高工作效率。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　智能水表的普及已成为水渠的一种节奏，普及速度空前。智能水表如此流行的原因在于它自身的优势决定了它的领先地位。这里将从六个方面谈谈智能水表的优点。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　1、降低抄表人员劳动强度，提高抄表效率500倍。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　2、解决了家庭抄表干扰的问题，保护了居民的隐私，避免了抄表造成的隐患。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　3、降低了抄表成本，在稳定、可靠和低维护的前提下，可以节省2/3甚至更高的人工成本。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　4、减少抄表错误率引起的经济纠纷，有助于构建和谐社会。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　5、提高市场营销的科技含量和服务水平。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　6、结合各种支付系统，提供银行代扣、网上支付、电话语音、手机短信等多种服务方式。</p>', '2021-07-07 18:03:50');
INSERT INTO `cms_article_info` VALUES (64, 277, '<p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">系统是由智能水表、集热器、集中器和传输线组成的远程抄表系统。该系统结合了微机技术、数字通信技术和水表计量技术，将计量、数据采集和处理集成为一体，整合了城市居民的用水信息，取代了传统的手工上门抄表方式。实现智能化，提高工作效率。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　智能水表的普及已成为水渠的一种节奏，普及速度空前。智能水表如此流行的原因在于它自身的优势决定了它的领先地位。这里将从六个方面谈谈智能水表的优点。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　1、降低抄表人员劳动强度，提高抄表效率500倍。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　2、解决了家庭抄表干扰的问题，保护了居民的隐私，避免了抄表造成的隐患。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　3、降低了抄表成本，在稳定、可靠和低维护的前提下，可以节省2/3甚至更高的人工成本。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　4、减少抄表错误率引起的经济纠纷，有助于构建和谐社会。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　5、提高市场营销的科技含量和服务水平。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　6、结合各种支付系统，提供银行代扣、网上支付、电话语音、手机短信等多种服务方式。</p>', '2021-07-07 18:03:50');
INSERT INTO `cms_article_info` VALUES (65, 278, '<p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">系统是由智能水表、集热器、集中器和传输线组成的远程抄表系统。该系统结合了微机技术、数字通信技术和水表计量技术，将计量、数据采集和处理集成为一体，整合了城市居民的用水信息，取代了传统的手工上门抄表方式。实现智能化，提高工作效率。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　智能水表的普及已成为水渠的一种节奏，普及速度空前。智能水表如此流行的原因在于它自身的优势决定了它的领先地位。这里将从六个方面谈谈智能水表的优点。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　1、降低抄表人员劳动强度，提高抄表效率500倍。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　2、解决了家庭抄表干扰的问题，保护了居民的隐私，避免了抄表造成的隐患。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　3、降低了抄表成本，在稳定、可靠和低维护的前提下，可以节省2/3甚至更高的人工成本。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　4、减少抄表错误率引起的经济纠纷，有助于构建和谐社会。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　5、提高市场营销的科技含量和服务水平。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　6、结合各种支付系统，提供银行代扣、网上支付、电话语音、手机短信等多种服务方式。</p>', '2021-07-07 18:03:50');
INSERT INTO `cms_article_info` VALUES (66, 279, '<p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">系统是由智能水表、集热器、集中器和传输线组成的远程抄表系统。该系统结合了微机技术、数字通信技术和水表计量技术，将计量、数据采集和处理集成为一体，整合了城市居民的用水信息，取代了传统的手工上门抄表方式。实现智能化，提高工作效率。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　智能水表的普及已成为水渠的一种节奏，普及速度空前。智能水表如此流行的原因在于它自身的优势决定了它的领先地位。这里将从六个方面谈谈智能水表的优点。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　1、降低抄表人员劳动强度，提高抄表效率500倍。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　2、解决了家庭抄表干扰的问题，保护了居民的隐私，避免了抄表造成的隐患。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　3、降低了抄表成本，在稳定、可靠和低维护的前提下，可以节省2/3甚至更高的人工成本。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　4、减少抄表错误率引起的经济纠纷，有助于构建和谐社会。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　5、提高市场营销的科技含量和服务水平。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　6、结合各种支付系统，提供银行代扣、网上支付、电话语音、手机短信等多种服务方式。</p>', '2021-07-07 18:03:50');
INSERT INTO `cms_article_info` VALUES (67, 280, '<p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">系统是由智能水表、集热器、集中器和传输线组成的远程抄表系统。该系统结合了微机技术、数字通信技术和水表计量技术，将计量、数据采集和处理集成为一体，整合了城市居民的用水信息，取代了传统的手工上门抄表方式。实现智能化，提高工作效率。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　智能水表的普及已成为水渠的一种节奏，普及速度空前。智能水表如此流行的原因在于它自身的优势决定了它的领先地位。这里将从六个方面谈谈智能水表的优点。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　1、降低抄表人员劳动强度，提高抄表效率500倍。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　2、解决了家庭抄表干扰的问题，保护了居民的隐私，避免了抄表造成的隐患。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　3、降低了抄表成本，在稳定、可靠和低维护的前提下，可以节省2/3甚至更高的人工成本。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　4、减少抄表错误率引起的经济纠纷，有助于构建和谐社会。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　5、提高市场营销的科技含量和服务水平。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　6、结合各种支付系统，提供银行代扣、网上支付、电话语音、手机短信等多种服务方式。</p>', '2021-07-07 18:03:50');
INSERT INTO `cms_article_info` VALUES (68, 281, '<p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">系统是由智能水表、集热器、集中器和传输线组成的远程抄表系统。该系统结合了微机技术、数字通信技术和水表计量技术，将计量、数据采集和处理集成为一体，整合了城市居民的用水信息，取代了传统的手工上门抄表方式。实现智能化，提高工作效率。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　智能水表的普及已成为水渠的一种节奏，普及速度空前。智能水表如此流行的原因在于它自身的优势决定了它的领先地位。这里将从六个方面谈谈智能水表的优点。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　1、降低抄表人员劳动强度，提高抄表效率500倍。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　2、解决了家庭抄表干扰的问题，保护了居民的隐私，避免了抄表造成的隐患。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　3、降低了抄表成本，在稳定、可靠和低维护的前提下，可以节省2/3甚至更高的人工成本。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　4、减少抄表错误率引起的经济纠纷，有助于构建和谐社会。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　5、提高市场营销的科技含量和服务水平。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　6、结合各种支付系统，提供银行代扣、网上支付、电话语音、手机短信等多种服务方式。</p>', '2021-07-07 18:03:50');
INSERT INTO `cms_article_info` VALUES (69, 282, '<p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">系统是由智能水表、集热器、集中器和传输线组成的远程抄表系统。该系统结合了微机技术、数字通信技术和水表计量技术，将计量、数据采集和处理集成为一体，整合了城市居民的用水信息，取代了传统的手工上门抄表方式。实现智能化，提高工作效率。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　智能水表的普及已成为水渠的一种节奏，普及速度空前。智能水表如此流行的原因在于它自身的优势决定了它的领先地位。这里将从六个方面谈谈智能水表的优点。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　1、降低抄表人员劳动强度，提高抄表效率500倍。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　2、解决了家庭抄表干扰的问题，保护了居民的隐私，避免了抄表造成的隐患。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　3、降低了抄表成本，在稳定、可靠和低维护的前提下，可以节省2/3甚至更高的人工成本。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　4、减少抄表错误率引起的经济纠纷，有助于构建和谐社会。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　5、提高市场营销的科技含量和服务水平。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　6、结合各种支付系统，提供银行代扣、网上支付、电话语音、手机短信等多种服务方式。</p>', '2021-07-07 18:03:50');
INSERT INTO `cms_article_info` VALUES (70, 283, '<p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">系统是由智能水表、集热器、集中器和传输线组成的远程抄表系统。该系统结合了微机技术、数字通信技术和水表计量技术，将计量、数据采集和处理集成为一体，整合了城市居民的用水信息，取代了传统的手工上门抄表方式。实现智能化，提高工作效率。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　智能水表的普及已成为水渠的一种节奏，普及速度空前。智能水表如此流行的原因在于它自身的优势决定了它的领先地位。这里将从六个方面谈谈智能水表的优点。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　1、降低抄表人员劳动强度，提高抄表效率500倍。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　2、解决了家庭抄表干扰的问题，保护了居民的隐私，避免了抄表造成的隐患。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　3、降低了抄表成本，在稳定、可靠和低维护的前提下，可以节省2/3甚至更高的人工成本。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　4、减少抄表错误率引起的经济纠纷，有助于构建和谐社会。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　5、提高市场营销的科技含量和服务水平。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　6、结合各种支付系统，提供银行代扣、网上支付、电话语音、手机短信等多种服务方式。</p>', '2021-07-07 18:03:50');
INSERT INTO `cms_article_info` VALUES (71, 284, '<p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">系统是由智能水表、集热器、集中器和传输线组成的远程抄表系统。该系统结合了微机技术、数字通信技术和水表计量技术，将计量、数据采集和处理集成为一体，整合了城市居民的用水信息，取代了传统的手工上门抄表方式。实现智能化，提高工作效率。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　智能水表的普及已成为水渠的一种节奏，普及速度空前。智能水表如此流行的原因在于它自身的优势决定了它的领先地位。这里将从六个方面谈谈智能水表的优点。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　1、降低抄表人员劳动强度，提高抄表效率500倍。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　2、解决了家庭抄表干扰的问题，保护了居民的隐私，避免了抄表造成的隐患。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　3、降低了抄表成本，在稳定、可靠和低维护的前提下，可以节省2/3甚至更高的人工成本。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　4、减少抄表错误率引起的经济纠纷，有助于构建和谐社会。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　5、提高市场营销的科技含量和服务水平。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　6、结合各种支付系统，提供银行代扣、网上支付、电话语音、手机短信等多种服务方式。</p>', '2021-07-07 18:03:50');
INSERT INTO `cms_article_info` VALUES (72, 285, '<p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">系统是由智能水表、集热器、集中器和传输线组成的远程抄表系统。该系统结合了微机技术、数字通信技术和水表计量技术，将计量、数据采集和处理集成为一体，整合了城市居民的用水信息，取代了传统的手工上门抄表方式。实现智能化，提高工作效率。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　智能水表的普及已成为水渠的一种节奏，普及速度空前。智能水表如此流行的原因在于它自身的优势决定了它的领先地位。这里将从六个方面谈谈智能水表的优点。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　1、降低抄表人员劳动强度，提高抄表效率500倍。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　2、解决了家庭抄表干扰的问题，保护了居民的隐私，避免了抄表造成的隐患。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　3、降低了抄表成本，在稳定、可靠和低维护的前提下，可以节省2/3甚至更高的人工成本。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　4、减少抄表错误率引起的经济纠纷，有助于构建和谐社会。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　5、提高市场营销的科技含量和服务水平。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　6、结合各种支付系统，提供银行代扣、网上支付、电话语音、手机短信等多种服务方式。</p>', '2021-07-07 18:03:50');

-- ----------------------------
-- Table structure for cms_case
-- ----------------------------
DROP TABLE IF EXISTS `cms_case`;
CREATE TABLE `cms_case`  (
  `case_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '案例ID',
  `nav_code` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '导航菜单code',
  `category_code` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '导航栏目code',
  `case_title` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '案例标题',
  `key_words` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '搜索关键字',
  `case_desc` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '案例简介 ',
  `front_img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '案例封面图片地址',
  `case_sort` int(11) NOT NULL COMMENT '显示顺序',
  `hit_num` int(11) NOT NULL DEFAULT 0 COMMENT '点击量',
  `is_top` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '是否置顶（0已置顶 1未置顶）',
  `is_publish` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '是否发布（0已发布 1未发布）',
  `publish_time` datetime(0) NULL DEFAULT NULL COMMENT '发布时间',
  `create_by` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `create_time` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_by` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`case_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 74 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '案例管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_case
-- ----------------------------
INSERT INTO `cms_case` VALUES (62, 'case', 'ca10013', '成功案例标题一', '', '公司坚持科学管理与先进制造技术相结合，拥有国内先进的智能水表生产技术及严格的质量管理体系、研发管理体系、售后服务体系、环境管理体系等。', '/profile/upload/2021/07/08/a658ab58-1e03-4721-85c8-9c9bd998e95a.jpg', 1, 3, '0', '0', '2021-07-08 09:21:19', '妍秀', '2021-07-08 09:26:14', '妍秀', '2021-07-08 09:26:59', '');
INSERT INTO `cms_case` VALUES (63, 'case', 'ca10013', '成功案例标题一', '', '公司坚持科学管理与先进制造技术相结合，拥有国内先进的智能水表生产技术及严格的质量管理体系、研发管理体系、售后服务体系、环境管理体系等。', '/profile/upload/2021/07/08/a658ab58-1e03-4721-85c8-9c9bd998e95a.jpg', 1, 3, '0', '0', '2021-07-08 09:21:19', '妍秀', '2021-07-08 09:26:25', '妍秀', '2021-07-08 09:27:10', '');
INSERT INTO `cms_case` VALUES (64, 'case', 'ca10013', '成功案例标题一', '', '公司坚持科学管理与先进制造技术相结合，拥有国内先进的智能水表生产技术及严格的质量管理体系、研发管理体系、售后服务体系、环境管理体系等。', '/profile/upload/2021/07/08/a658ab58-1e03-4721-85c8-9c9bd998e95a.jpg', 1, 2, '0', '0', '2021-07-08 09:21:19', '妍秀', '2021-07-08 09:21:14', '妍秀', '2021-07-08 09:21:59', '');
INSERT INTO `cms_case` VALUES (65, 'case', 'ca10013', '成功案例标题一', '', '公司坚持科学管理与先进制造技术相结合，拥有国内先进的智能水表生产技术及严格的质量管理体系、研发管理体系、售后服务体系、环境管理体系等。', '/profile/upload/2021/07/08/a658ab58-1e03-4721-85c8-9c9bd998e95a.jpg', 1, 2, '0', '0', '2021-07-08 09:21:19', '妍秀', '2021-07-08 09:21:14', '妍秀', '2021-07-08 09:21:59', '');
INSERT INTO `cms_case` VALUES (66, 'case', 'ca10013', '成功案例标题一', '', '公司坚持科学管理与先进制造技术相结合，拥有国内先进的智能水表生产技术及严格的质量管理体系、研发管理体系、售后服务体系、环境管理体系等。', '/profile/upload/2021/07/08/a658ab58-1e03-4721-85c8-9c9bd998e95a.jpg', 1, 2, '0', '0', '2021-07-08 09:21:19', '妍秀', '2021-07-08 09:21:14', '妍秀', '2021-07-08 09:21:59', '');
INSERT INTO `cms_case` VALUES (67, 'case', 'ca10013', '成功案例标题一', '', '公司坚持科学管理与先进制造技术相结合，拥有国内先进的智能水表生产技术及严格的质量管理体系、研发管理体系、售后服务体系、环境管理体系等。', '/profile/upload/2021/07/08/a658ab58-1e03-4721-85c8-9c9bd998e95a.jpg', 1, 2, '0', '0', '2021-07-08 09:21:19', '妍秀', '2021-07-08 09:21:14', '妍秀', '2021-07-08 09:21:59', '');
INSERT INTO `cms_case` VALUES (68, 'case', 'ca10012', '成功案例标题一', '', '公司坚持科学管理与先进制造技术相结合，拥有国内先进的智能水表生产技术及严格的质量管理体系、研发管理体系、售后服务体系、环境管理体系等。', '/profile/upload/2021/07/08/a658ab58-1e03-4721-85c8-9c9bd998e95a.jpg', 1, 2, '0', '0', '2021-07-08 09:21:19', '妍秀', '2021-07-08 09:21:14', '妍秀', '2021-07-08 09:21:59', '');
INSERT INTO `cms_case` VALUES (69, 'case', 'ca10012', '成功案例标题一', '', '公司坚持科学管理与先进制造技术相结合，拥有国内先进的智能水表生产技术及严格的质量管理体系、研发管理体系、售后服务体系、环境管理体系等。', '/profile/upload/2021/07/08/a658ab58-1e03-4721-85c8-9c9bd998e95a.jpg', 1, 2, '0', '0', '2021-07-08 09:21:19', '妍秀', '2021-07-08 09:21:14', '妍秀', '2021-07-08 09:21:59', '');
INSERT INTO `cms_case` VALUES (70, 'case', 'ca10012', '成功案例标题一', '', '公司坚持科学管理与先进制造技术相结合，拥有国内先进的智能水表生产技术及严格的质量管理体系、研发管理体系、售后服务体系、环境管理体系等。', '/profile/upload/2021/07/08/a658ab58-1e03-4721-85c8-9c9bd998e95a.jpg', 1, 2, '0', '0', '2021-07-08 09:21:19', '妍秀', '2021-07-08 09:21:14', '妍秀', '2021-07-08 09:21:59', '');
INSERT INTO `cms_case` VALUES (71, 'case', 'ca10012', '成功案例标题一', '', '公司坚持科学管理与先进制造技术相结合，拥有国内先进的智能水表生产技术及严格的质量管理体系、研发管理体系、售后服务体系、环境管理体系等。', '/profile/upload/2021/07/08/a658ab58-1e03-4721-85c8-9c9bd998e95a.jpg', 1, 2, '0', '0', '2021-07-08 09:21:19', '妍秀', '2021-07-08 09:21:14', '妍秀', '2021-07-08 09:21:59', '');
INSERT INTO `cms_case` VALUES (72, 'case', 'ca10012', '成功案例标题一', '', '公司坚持科学管理与先进制造技术相结合，拥有国内先进的智能水表生产技术及严格的质量管理体系、研发管理体系、售后服务体系、环境管理体系等。', '/profile/upload/2021/07/08/a658ab58-1e03-4721-85c8-9c9bd998e95a.jpg', 1, 2, '0', '0', '2021-07-08 09:21:19', '妍秀', '2021-07-08 09:21:14', '妍秀', '2021-07-08 09:21:59', '');
INSERT INTO `cms_case` VALUES (73, 'case', 'ca10012', '成功案例标题一', '', '公司坚持科学管理与先进制造技术相结合，拥有国内先进的智能水表生产技术及严格的质量管理体系、研发管理体系、售后服务体系、环境管理体系等。', '/profile/upload/2021/07/08/a658ab58-1e03-4721-85c8-9c9bd998e95a.jpg', 1, 2, '0', '0', '2021-07-08 09:21:19', '妍秀', '2021-07-08 09:21:14', '妍秀', '2021-07-08 09:21:59', '');

-- ----------------------------
-- Table structure for cms_case_article
-- ----------------------------
DROP TABLE IF EXISTS `cms_case_article`;
CREATE TABLE `cms_case_article`  (
  `case_content_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '案例内容ID',
  `case_id` int(11) NOT NULL COMMENT '案例ID',
  `content_info` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容详情',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`case_content_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '案例内容信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_case_article
-- ----------------------------
INSERT INTO `cms_case_article` VALUES (52, 62, '<p><span style=\"color: rgb(67, 67, 67); font-family: &quot;Microsoft YaHei&quot;; font-size: 15px; text-align: justify;\">公司坚持科学管理与先进制造技术相结合，拥有国内先进的智能水表生产技术及严格的质量管理体系、研发管理体系、售后服务体系、环境管理体系等。完整的科研、生产、经营体系，特别是在微电子领域、系统管理、机电一体化方面拥有专业的检测手段，可为产品的品质提供有力保障。在微电子、大数据、系统集成方面引领行业核心技术，创造出了一个又一个行业高精尖水表产品，并为行业标准制定做出了突出贡献，得到各级政府及行业高度评价。</span><br style=\"margin: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\"><span style=\"color: rgb(67, 67, 67); font-family: &quot;Microsoft YaHei&quot;; font-size: 15px; text-align: justify;\">公司以“打造百年基业、争创中国一流品牌”为经营宗旨，以“质量可靠求生存、技术创新就发展”为经营目标，真诚服务博源每一位客户。</span><br></p>', '2021-07-08 09:21:16');
INSERT INTO `cms_case_article` VALUES (53, 63, '<p><span style=\"color: rgb(67, 67, 67); font-family: &quot;Microsoft YaHei&quot;; font-size: 15px; text-align: justify;\">公司坚持科学管理与先进制造技术相结合，拥有国内先进的智能水表生产技术及严格的质量管理体系、研发管理体系、售后服务体系、环境管理体系等。完整的科研、生产、经营体系，特别是在微电子领域、系统管理、机电一体化方面拥有专业的检测手段，可为产品的品质提供有力保障。在微电子、大数据、系统集成方面引领行业核心技术，创造出了一个又一个行业高精尖水表产品，并为行业标准制定做出了突出贡献，得到各级政府及行业高度评价。</span><br style=\"margin: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\"><span style=\"color: rgb(67, 67, 67); font-family: &quot;Microsoft YaHei&quot;; font-size: 15px; text-align: justify;\">公司以“打造百年基业、争创中国一流品牌”为经营宗旨，以“质量可靠求生存、技术创新就发展”为经营目标，真诚服务博源每一位客户。</span><br></p>', '2021-07-08 09:21:16');
INSERT INTO `cms_case_article` VALUES (54, 64, '<p><span style=\"color: rgb(67, 67, 67); font-family: &quot;Microsoft YaHei&quot;; font-size: 15px; text-align: justify;\">公司坚持科学管理与先进制造技术相结合，拥有国内先进的智能水表生产技术及严格的质量管理体系、研发管理体系、售后服务体系、环境管理体系等。完整的科研、生产、经营体系，特别是在微电子领域、系统管理、机电一体化方面拥有专业的检测手段，可为产品的品质提供有力保障。在微电子、大数据、系统集成方面引领行业核心技术，创造出了一个又一个行业高精尖水表产品，并为行业标准制定做出了突出贡献，得到各级政府及行业高度评价。</span><br style=\"margin: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\"><span style=\"color: rgb(67, 67, 67); font-family: &quot;Microsoft YaHei&quot;; font-size: 15px; text-align: justify;\">公司以“打造百年基业、争创中国一流品牌”为经营宗旨，以“质量可靠求生存、技术创新就发展”为经营目标，真诚服务博源每一位客户。</span><br></p>', '2021-07-08 09:21:16');
INSERT INTO `cms_case_article` VALUES (55, 65, '<p><span style=\"color: rgb(67, 67, 67); font-family: &quot;Microsoft YaHei&quot;; font-size: 15px; text-align: justify;\">公司坚持科学管理与先进制造技术相结合，拥有国内先进的智能水表生产技术及严格的质量管理体系、研发管理体系、售后服务体系、环境管理体系等。完整的科研、生产、经营体系，特别是在微电子领域、系统管理、机电一体化方面拥有专业的检测手段，可为产品的品质提供有力保障。在微电子、大数据、系统集成方面引领行业核心技术，创造出了一个又一个行业高精尖水表产品，并为行业标准制定做出了突出贡献，得到各级政府及行业高度评价。</span><br style=\"margin: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\"><span style=\"color: rgb(67, 67, 67); font-family: &quot;Microsoft YaHei&quot;; font-size: 15px; text-align: justify;\">公司以“打造百年基业、争创中国一流品牌”为经营宗旨，以“质量可靠求生存、技术创新就发展”为经营目标，真诚服务博源每一位客户。</span><br></p>', '2021-07-08 09:21:16');
INSERT INTO `cms_case_article` VALUES (56, 66, '<p><span style=\"color: rgb(67, 67, 67); font-family: &quot;Microsoft YaHei&quot;; font-size: 15px; text-align: justify;\">公司坚持科学管理与先进制造技术相结合，拥有国内先进的智能水表生产技术及严格的质量管理体系、研发管理体系、售后服务体系、环境管理体系等。完整的科研、生产、经营体系，特别是在微电子领域、系统管理、机电一体化方面拥有专业的检测手段，可为产品的品质提供有力保障。在微电子、大数据、系统集成方面引领行业核心技术，创造出了一个又一个行业高精尖水表产品，并为行业标准制定做出了突出贡献，得到各级政府及行业高度评价。</span><br style=\"margin: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\"><span style=\"color: rgb(67, 67, 67); font-family: &quot;Microsoft YaHei&quot;; font-size: 15px; text-align: justify;\">公司以“打造百年基业、争创中国一流品牌”为经营宗旨，以“质量可靠求生存、技术创新就发展”为经营目标，真诚服务博源每一位客户。</span><br></p>', '2021-07-08 09:21:16');
INSERT INTO `cms_case_article` VALUES (57, 67, '<p><span style=\"color: rgb(67, 67, 67); font-family: &quot;Microsoft YaHei&quot;; font-size: 15px; text-align: justify;\">公司坚持科学管理与先进制造技术相结合，拥有国内先进的智能水表生产技术及严格的质量管理体系、研发管理体系、售后服务体系、环境管理体系等。完整的科研、生产、经营体系，特别是在微电子领域、系统管理、机电一体化方面拥有专业的检测手段，可为产品的品质提供有力保障。在微电子、大数据、系统集成方面引领行业核心技术，创造出了一个又一个行业高精尖水表产品，并为行业标准制定做出了突出贡献，得到各级政府及行业高度评价。</span><br style=\"margin: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\"><span style=\"color: rgb(67, 67, 67); font-family: &quot;Microsoft YaHei&quot;; font-size: 15px; text-align: justify;\">公司以“打造百年基业、争创中国一流品牌”为经营宗旨，以“质量可靠求生存、技术创新就发展”为经营目标，真诚服务博源每一位客户。</span><br></p>', '2021-07-08 09:21:16');
INSERT INTO `cms_case_article` VALUES (58, 68, '<p><span style=\"color: rgb(67, 67, 67); font-family: &quot;Microsoft YaHei&quot;; font-size: 15px; text-align: justify;\">公司坚持科学管理与先进制造技术相结合，拥有国内先进的智能水表生产技术及严格的质量管理体系、研发管理体系、售后服务体系、环境管理体系等。完整的科研、生产、经营体系，特别是在微电子领域、系统管理、机电一体化方面拥有专业的检测手段，可为产品的品质提供有力保障。在微电子、大数据、系统集成方面引领行业核心技术，创造出了一个又一个行业高精尖水表产品，并为行业标准制定做出了突出贡献，得到各级政府及行业高度评价。</span><br style=\"margin: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\"><span style=\"color: rgb(67, 67, 67); font-family: &quot;Microsoft YaHei&quot;; font-size: 15px; text-align: justify;\">公司以“打造百年基业、争创中国一流品牌”为经营宗旨，以“质量可靠求生存、技术创新就发展”为经营目标，真诚服务博源每一位客户。</span><br></p>', '2021-07-08 09:21:16');
INSERT INTO `cms_case_article` VALUES (59, 69, '<p><span style=\"color: rgb(67, 67, 67); font-family: &quot;Microsoft YaHei&quot;; font-size: 15px; text-align: justify;\">公司坚持科学管理与先进制造技术相结合，拥有国内先进的智能水表生产技术及严格的质量管理体系、研发管理体系、售后服务体系、环境管理体系等。完整的科研、生产、经营体系，特别是在微电子领域、系统管理、机电一体化方面拥有专业的检测手段，可为产品的品质提供有力保障。在微电子、大数据、系统集成方面引领行业核心技术，创造出了一个又一个行业高精尖水表产品，并为行业标准制定做出了突出贡献，得到各级政府及行业高度评价。</span><br style=\"margin: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\"><span style=\"color: rgb(67, 67, 67); font-family: &quot;Microsoft YaHei&quot;; font-size: 15px; text-align: justify;\">公司以“打造百年基业、争创中国一流品牌”为经营宗旨，以“质量可靠求生存、技术创新就发展”为经营目标，真诚服务博源每一位客户。</span><br></p>', '2021-07-08 09:21:16');
INSERT INTO `cms_case_article` VALUES (60, 70, '<p><span style=\"color: rgb(67, 67, 67); font-family: &quot;Microsoft YaHei&quot;; font-size: 15px; text-align: justify;\">公司坚持科学管理与先进制造技术相结合，拥有国内先进的智能水表生产技术及严格的质量管理体系、研发管理体系、售后服务体系、环境管理体系等。完整的科研、生产、经营体系，特别是在微电子领域、系统管理、机电一体化方面拥有专业的检测手段，可为产品的品质提供有力保障。在微电子、大数据、系统集成方面引领行业核心技术，创造出了一个又一个行业高精尖水表产品，并为行业标准制定做出了突出贡献，得到各级政府及行业高度评价。</span><br style=\"margin: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\"><span style=\"color: rgb(67, 67, 67); font-family: &quot;Microsoft YaHei&quot;; font-size: 15px; text-align: justify;\">公司以“打造百年基业、争创中国一流品牌”为经营宗旨，以“质量可靠求生存、技术创新就发展”为经营目标，真诚服务博源每一位客户。</span><br></p>', '2021-07-08 09:21:16');
INSERT INTO `cms_case_article` VALUES (61, 71, '<p><span style=\"color: rgb(67, 67, 67); font-family: &quot;Microsoft YaHei&quot;; font-size: 15px; text-align: justify;\">公司坚持科学管理与先进制造技术相结合，拥有国内先进的智能水表生产技术及严格的质量管理体系、研发管理体系、售后服务体系、环境管理体系等。完整的科研、生产、经营体系，特别是在微电子领域、系统管理、机电一体化方面拥有专业的检测手段，可为产品的品质提供有力保障。在微电子、大数据、系统集成方面引领行业核心技术，创造出了一个又一个行业高精尖水表产品，并为行业标准制定做出了突出贡献，得到各级政府及行业高度评价。</span><br style=\"margin: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\"><span style=\"color: rgb(67, 67, 67); font-family: &quot;Microsoft YaHei&quot;; font-size: 15px; text-align: justify;\">公司以“打造百年基业、争创中国一流品牌”为经营宗旨，以“质量可靠求生存、技术创新就发展”为经营目标，真诚服务博源每一位客户。</span><br></p>', '2021-07-08 09:21:16');
INSERT INTO `cms_case_article` VALUES (62, 72, '<p><span style=\"color: rgb(67, 67, 67); font-family: &quot;Microsoft YaHei&quot;; font-size: 15px; text-align: justify;\">公司坚持科学管理与先进制造技术相结合，拥有国内先进的智能水表生产技术及严格的质量管理体系、研发管理体系、售后服务体系、环境管理体系等。完整的科研、生产、经营体系，特别是在微电子领域、系统管理、机电一体化方面拥有专业的检测手段，可为产品的品质提供有力保障。在微电子、大数据、系统集成方面引领行业核心技术，创造出了一个又一个行业高精尖水表产品，并为行业标准制定做出了突出贡献，得到各级政府及行业高度评价。</span><br style=\"margin: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\"><span style=\"color: rgb(67, 67, 67); font-family: &quot;Microsoft YaHei&quot;; font-size: 15px; text-align: justify;\">公司以“打造百年基业、争创中国一流品牌”为经营宗旨，以“质量可靠求生存、技术创新就发展”为经营目标，真诚服务博源每一位客户。</span><br></p>', '2021-07-08 09:21:16');
INSERT INTO `cms_case_article` VALUES (63, 73, '<p><span style=\"color: rgb(67, 67, 67); font-family: &quot;Microsoft YaHei&quot;; font-size: 15px; text-align: justify;\">公司坚持科学管理与先进制造技术相结合，拥有国内先进的智能水表生产技术及严格的质量管理体系、研发管理体系、售后服务体系、环境管理体系等。完整的科研、生产、经营体系，特别是在微电子领域、系统管理、机电一体化方面拥有专业的检测手段，可为产品的品质提供有力保障。在微电子、大数据、系统集成方面引领行业核心技术，创造出了一个又一个行业高精尖水表产品，并为行业标准制定做出了突出贡献，得到各级政府及行业高度评价。</span><br style=\"margin: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\"><span style=\"color: rgb(67, 67, 67); font-family: &quot;Microsoft YaHei&quot;; font-size: 15px; text-align: justify;\">公司以“打造百年基业、争创中国一流品牌”为经营宗旨，以“质量可靠求生存、技术创新就发展”为经营目标，真诚服务博源每一位客户。</span><br></p>', '2021-07-08 09:21:16');

-- ----------------------------
-- Table structure for cms_case_img
-- ----------------------------
DROP TABLE IF EXISTS `cms_case_img`;
CREATE TABLE `cms_case_img`  (
  `case_img_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '产品图片ID',
  `case_id` int(11) NOT NULL COMMENT '案例ID',
  `case_img_url` varchar(350) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品图片地址',
  `case_sort` int(11) NOT NULL DEFAULT 1 COMMENT '显示顺序',
  `create_time` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`case_img_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 66 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '案例图片信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_case_img
-- ----------------------------
INSERT INTO `cms_case_img` VALUES (42, 62, '/profile/upload/2021/07/08/fbe5cd25-6766-40c1-b18a-142b2dc4a201.jpg', 0, '2021-07-08 09:21:54');
INSERT INTO `cms_case_img` VALUES (43, 62, '/profile/upload/2021/07/08/d6cf67dd-fc95-4ec9-b5a5-fb44f6aa8d57.jpg', 1, '2021-07-08 09:21:54');
INSERT INTO `cms_case_img` VALUES (44, 63, '/profile/upload/2021/07/08/fbe5cd25-6766-40c1-b18a-142b2dc4a201.jpg', 0, '2021-07-08 09:21:54');
INSERT INTO `cms_case_img` VALUES (45, 63, '/profile/upload/2021/07/08/d6cf67dd-fc95-4ec9-b5a5-fb44f6aa8d57.jpg', 1, '2021-07-08 09:21:54');
INSERT INTO `cms_case_img` VALUES (46, 64, '/profile/upload/2021/07/08/fbe5cd25-6766-40c1-b18a-142b2dc4a201.jpg', 0, '2021-07-08 09:21:54');
INSERT INTO `cms_case_img` VALUES (47, 64, '/profile/upload/2021/07/08/d6cf67dd-fc95-4ec9-b5a5-fb44f6aa8d57.jpg', 1, '2021-07-08 09:21:54');
INSERT INTO `cms_case_img` VALUES (48, 65, '/profile/upload/2021/07/08/fbe5cd25-6766-40c1-b18a-142b2dc4a201.jpg', 0, '2021-07-08 09:21:54');
INSERT INTO `cms_case_img` VALUES (49, 65, '/profile/upload/2021/07/08/d6cf67dd-fc95-4ec9-b5a5-fb44f6aa8d57.jpg', 1, '2021-07-08 09:21:54');
INSERT INTO `cms_case_img` VALUES (50, 66, '/profile/upload/2021/07/08/fbe5cd25-6766-40c1-b18a-142b2dc4a201.jpg', 0, '2021-07-08 09:21:54');
INSERT INTO `cms_case_img` VALUES (51, 66, '/profile/upload/2021/07/08/d6cf67dd-fc95-4ec9-b5a5-fb44f6aa8d57.jpg', 1, '2021-07-08 09:21:54');
INSERT INTO `cms_case_img` VALUES (52, 67, '/profile/upload/2021/07/08/fbe5cd25-6766-40c1-b18a-142b2dc4a201.jpg', 0, '2021-07-08 09:21:54');
INSERT INTO `cms_case_img` VALUES (53, 67, '/profile/upload/2021/07/08/d6cf67dd-fc95-4ec9-b5a5-fb44f6aa8d57.jpg', 1, '2021-07-08 09:21:54');
INSERT INTO `cms_case_img` VALUES (54, 68, '/profile/upload/2021/07/08/fbe5cd25-6766-40c1-b18a-142b2dc4a201.jpg', 0, '2021-07-08 09:21:54');
INSERT INTO `cms_case_img` VALUES (55, 68, '/profile/upload/2021/07/08/d6cf67dd-fc95-4ec9-b5a5-fb44f6aa8d57.jpg', 1, '2021-07-08 09:21:54');
INSERT INTO `cms_case_img` VALUES (56, 69, '/profile/upload/2021/07/08/fbe5cd25-6766-40c1-b18a-142b2dc4a201.jpg', 0, '2021-07-08 09:21:54');
INSERT INTO `cms_case_img` VALUES (57, 69, '/profile/upload/2021/07/08/d6cf67dd-fc95-4ec9-b5a5-fb44f6aa8d57.jpg', 0, '2021-07-08 09:30:01');
INSERT INTO `cms_case_img` VALUES (58, 70, '/profile/upload/2021/07/08/fbe5cd25-6766-40c1-b18a-142b2dc4a201.jpg', 0, '2021-07-08 09:21:54');
INSERT INTO `cms_case_img` VALUES (59, 70, '/profile/upload/2021/07/08/d6cf67dd-fc95-4ec9-b5a5-fb44f6aa8d57.jpg', 1, '2021-07-08 09:21:54');
INSERT INTO `cms_case_img` VALUES (60, 71, '/profile/upload/2021/07/08/fbe5cd25-6766-40c1-b18a-142b2dc4a201.jpg', 0, '2021-07-08 09:21:54');
INSERT INTO `cms_case_img` VALUES (61, 71, '/profile/upload/2021/07/08/d6cf67dd-fc95-4ec9-b5a5-fb44f6aa8d57.jpg', 1, '2021-07-08 09:31:03');
INSERT INTO `cms_case_img` VALUES (62, 72, '/profile/upload/2021/07/08/fbe5cd25-6766-40c1-b18a-142b2dc4a201.jpg', 0, '2021-07-08 09:21:54');
INSERT INTO `cms_case_img` VALUES (63, 72, '/profile/upload/2021/07/08/d6cf67dd-fc95-4ec9-b5a5-fb44f6aa8d57.jpg', 1, '2021-07-08 09:31:03');
INSERT INTO `cms_case_img` VALUES (64, 73, '/profile/upload/2021/07/08/fbe5cd25-6766-40c1-b18a-142b2dc4a201.jpg', 0, '2021-07-08 09:21:54');
INSERT INTO `cms_case_img` VALUES (65, 73, '/profile/upload/2021/07/08/d6cf67dd-fc95-4ec9-b5a5-fb44f6aa8d57.jpg', 1, '2021-07-08 09:31:03');

-- ----------------------------
-- Table structure for cms_category
-- ----------------------------
DROP TABLE IF EXISTS `cms_category`;
CREATE TABLE `cms_category`  (
  `category_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '导航栏目ID',
  `nav_code` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '导航代码，规则为：na+5位流水号，例如：na10000',
  `category_code` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '栏目代码，规则为：ca+5位流水号，例如：ca10000',
  `category_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '栏目名称',
  `category_type` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'news' COMMENT '栏目类型（product产品 news资讯 case案例）',
  `category_sort` int(11) NOT NULL COMMENT '显示顺序',
  `is_publish` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '是否发布（0已发布 1未发布）',
  `publish_time` datetime(0) NULL DEFAULT NULL COMMENT '发布时间',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '删除标志（0存在 1删除）',
  `create_by` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'admin' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_by` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`category_id`) USING BTREE,
  UNIQUE INDEX `idx_category_code`(`category_code`) USING BTREE,
  UNIQUE INDEX `idx_nav_category_code`(`nav_code`, `category_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 167 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '导航栏目' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_category
-- ----------------------------
INSERT INTO `cms_category` VALUES (154, 'product', 'ca10001', '预付费水表', 'product', 1, '0', '2021-07-07 14:50:23', '0', '妍秀', '2021-07-07 14:50:19', '妍秀', '2021-07-07 14:50:23', NULL);
INSERT INTO `cms_category` VALUES (155, 'product', 'ca10002', '远传水表', 'product', 2, '0', '2021-07-07 14:50:38', '0', '妍秀', '2021-07-07 14:50:36', '妍秀', '2021-07-07 14:50:38', NULL);
INSERT INTO `cms_category` VALUES (156, 'product', 'ca10003', '旋翼式水表', 'product', 3, '0', '2021-07-07 14:50:52', '0', '妍秀', '2021-07-07 14:50:49', '妍秀', '2021-07-07 14:50:52', NULL);
INSERT INTO `cms_category` VALUES (157, 'product', 'ca10004', '单流束水表', 'product', 4, '0', '2021-07-07 14:51:09', '0', '妍秀', '2021-07-07 14:51:08', '妍秀', '2021-07-07 14:51:09', NULL);
INSERT INTO `cms_category` VALUES (158, 'product', 'ca10005', '流量计', 'product', 5, '1', NULL, '0', '妍秀', '2021-07-07 14:51:23', '妍秀', '2021-07-07 17:28:42', NULL);
INSERT INTO `cms_category` VALUES (159, 'product', 'ca10006', '数据采集设备', 'product', 6, '1', NULL, '0', '妍秀', '2021-07-07 14:51:37', '妍秀', '2021-07-07 15:49:23', NULL);
INSERT INTO `cms_category` VALUES (160, 'product', 'ca10007', '多流束水表', 'product', 7, '1', NULL, '0', '妍秀', '2021-07-07 14:51:51', '妍秀', '2021-07-07 15:49:21', NULL);
INSERT INTO `cms_category` VALUES (161, 'product', 'ca10008', '螺翼式水表', 'product', 8, '1', NULL, '0', '妍秀', '2021-07-07 14:52:04', '妍秀', '2021-07-07 15:49:19', NULL);
INSERT INTO `cms_category` VALUES (162, 'product', 'ca10009', '滤水器', 'product', 9, '1', NULL, '0', '妍秀', '2021-07-07 14:52:18', '妍秀', '2021-07-07 15:49:18', NULL);
INSERT INTO `cms_category` VALUES (163, 'news', 'ca10010', '技术文献', 'news', 1, '0', '2021-07-07 14:52:48', '0', '妍秀', '2021-07-07 14:52:46', '妍秀', '2021-07-07 14:52:48', NULL);
INSERT INTO `cms_category` VALUES (164, 'news', 'ca10011', '产品知识', 'news', 2, '0', '2021-07-07 14:54:39', '0', '妍秀', '2021-07-07 14:53:06', '妍秀', '2021-07-07 14:54:39', NULL);
INSERT INTO `cms_category` VALUES (165, 'case', 'ca10012', '远传水表', 'case', 1, '0', '2021-07-07 14:56:00', '0', '妍秀', '2021-07-07 14:55:58', '妍秀', '2021-07-07 14:56:00', NULL);
INSERT INTO `cms_category` VALUES (166, 'case', 'ca10013', '旋翼式水表', 'case', 2, '0', '2021-07-07 14:56:24', '0', '妍秀', '2021-07-07 14:56:21', '妍秀', '2021-07-07 14:56:24', NULL);

-- ----------------------------
-- Table structure for cms_friendly_link
-- ----------------------------
DROP TABLE IF EXISTS `cms_friendly_link`;
CREATE TABLE `cms_friendly_link`  (
  `link_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '友情链接ID',
  `website_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '网站名称',
  `website_url` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '网址',
  `website_sort` int(11) NOT NULL COMMENT '显示顺序',
  `linkman` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `telephone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人电话',
  `email` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人邮箱',
  `is_publish` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '是否发布（0已发布 1未发布）',
  `publish_time` datetime(0) NULL DEFAULT NULL COMMENT '发布时间',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '删除标志（0：存在，1：删除）',
  `create_by` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'admin' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_by` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`link_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '友情链接' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_friendly_link
-- ----------------------------

-- ----------------------------
-- Table structure for cms_msg
-- ----------------------------
DROP TABLE IF EXISTS `cms_msg`;
CREATE TABLE `cms_msg`  (
  `msg_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '留言ID',
  `user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名称',
  `user_mobile` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户手机号',
  `msg_info` varchar(1500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '留言信息',
  `create_by` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_by` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`msg_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 109 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '在线留言' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_msg
-- ----------------------------

-- ----------------------------
-- Table structure for cms_nav
-- ----------------------------
DROP TABLE IF EXISTS `cms_nav`;
CREATE TABLE `cms_nav`  (
  `nav_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '导航菜单ID',
  `nav_code` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '导航代码',
  `nav_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '导航名称',
  `nav_sort` int(11) NOT NULL COMMENT '显示顺序',
  `is_publish` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '是否发布（0已发布 1未发布）',
  `publish_time` datetime(0) NULL DEFAULT NULL COMMENT '发布时间',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '删除标志（0存在 1删除）',
  `create_by` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_by` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  `is_system` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '系统默认（0是 1否）',
  PRIMARY KEY (`nav_id`) USING BTREE,
  UNIQUE INDEX `idx_nav_code`(`nav_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 155 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '导航菜单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_nav
-- ----------------------------
INSERT INTO `cms_nav` VALUES (148, 'index', '首页', 1, '0', '2021-07-07 14:35:55', '0', '妍秀', '2021-07-07 14:35:55', '妍秀', '2021-07-07 14:35:55', '', '0');
INSERT INTO `cms_nav` VALUES (149, 'product', '产品展示', 2, '0', '2021-07-07 14:36:15', '0', '妍秀', '2021-07-07 14:35:55', '妍秀', '2021-07-07 14:36:15', '', '0');
INSERT INTO `cms_nav` VALUES (150, 'news', '新闻资讯', 3, '0', '2021-07-07 14:36:17', '0', '妍秀', '2021-07-07 14:35:55', '妍秀', '2021-07-07 14:36:17', '', '0');
INSERT INTO `cms_nav` VALUES (151, 'case', '客户案例', 4, '0', '2021-07-07 14:36:18', '0', '妍秀', '2021-07-07 14:35:55', '妍秀', '2021-07-07 14:36:18', '', '0');
INSERT INTO `cms_nav` VALUES (152, 'about', '关于我们', 5, '0', '2021-07-07 14:36:20', '0', '妍秀', '2021-07-07 14:35:55', '妍秀', '2021-07-07 14:36:20', '', '0');
INSERT INTO `cms_nav` VALUES (153, 'msg', '在线留言', 6, '0', '2021-07-07 14:36:22', '0', '妍秀', '2021-07-07 14:35:55', '妍秀', '2021-07-07 14:36:22', '', '0');
INSERT INTO `cms_nav` VALUES (154, 'contact_us', '联系我们', 7, '0', '2021-07-07 14:36:24', '0', '妍秀', '2021-07-07 14:35:55', '妍秀', '2021-07-07 14:36:24', '', '0');

-- ----------------------------
-- Table structure for cms_product
-- ----------------------------
DROP TABLE IF EXISTS `cms_product`;
CREATE TABLE `cms_product`  (
  `product_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '产品ID',
  `nav_code` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '导航菜单code',
  `category_code` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '导航栏目code',
  `product_title` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品标题',
  `key_words` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '搜索关键字',
  `product_desc` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品简介 ',
  `front_img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品封面图片地址',
  `product_sort` int(11) NOT NULL COMMENT '显示顺序',
  `hit_num` int(11) NOT NULL DEFAULT 0 COMMENT '点击量',
  `is_top` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '是否置顶（0已置顶 1未置顶）',
  `is_publish` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '是否发布（0已发布 1未发布）',
  `publish_time` datetime(0) NULL DEFAULT NULL COMMENT '发布时间',
  `create_by` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '修改者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 106 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_product
-- ----------------------------
INSERT INTO `cms_product` VALUES (91, 'product', 'ca10001', '产品中心标题一', '', '远距离水表在市场上应用广泛，具有方便快捷的功能。这是电力消费生活中的一大进步。 众所周知，普通的冷水和热水表已经被现代快速家庭生活所淘汰。现在，远程水表越来越复杂，...', '/profile/upload/2021/07/07/d0a80981-4c80-4612-b3d2-787ef7035a6c.jpg', 1, 7, '0', '0', '2021-07-07 15:02:26', '妍秀', '2021-07-07 15:02:23', '妍秀', '2021-07-08 09:10:48', '');
INSERT INTO `cms_product` VALUES (92, 'product', 'ca10001', '产品中心标题二', '', '远距离水表在市场上应用广泛，具有方便快捷的功能。这是电力消费生活中的一大进步。 众所周知，普通的冷水和热水表已经被现代快速家庭生活所淘汰。现在，远程水表越来越复杂，...', '/profile/upload/2021/07/07/0ba780de-e08f-4ee9-9f9c-c8de37acc03a.jpg', 2, 1, '0', '0', '2021-07-07 15:18:42', '妍秀', '2021-07-07 15:14:34', '妍秀', '2021-07-07 15:49:45', '');
INSERT INTO `cms_product` VALUES (93, 'product', 'ca10001', '产品中心标题三', '', '远距离水表在市场上应用广泛，具有方便快捷的功能。这是电力消费生活中的一大进步。 众所周知，普通的冷水和热水表已经被现代快速家庭生活所淘汰。现在，远程水表越来越复杂，...', '/profile/upload/2021/07/07/fec72666-ac99-41da-ba40-3b313bef2c0c.jpg', 3, 2, '0', '0', '2021-07-07 15:31:37', '妍秀', '2021-07-07 15:31:29', '妍秀', '2021-07-07 15:49:42', '');
INSERT INTO `cms_product` VALUES (94, 'product', 'ca10001', '产品中心标题四', '', '远距离水表在市场上应用广泛，具有方便快捷的功能。这是电力消费生活中的一大进步。 众所周知，普通的冷水和热水表已经被现代快速家庭生活所淘汰。现在，远程水表越来越复杂，...', '/profile/upload/2021/07/07/53411cab-e17f-4768-8fe0-747b1d96b7fe.jpg', 4, 1, '0', '0', '2021-07-07 15:41:08', '妍秀', '2021-07-07 15:41:05', '妍秀', '2021-07-07 15:49:43', '');
INSERT INTO `cms_product` VALUES (95, 'product', 'ca10002', '产品中心标题一', '', '远距离水表在市场上应用广泛，具有方便快捷的功能。这是电力消费生活中的一大进步。 众所周知，普通的冷水和热水表已经被现代快速家庭生活所淘汰。现在，远程水表越来越复杂，...', '/profile/upload/2021/07/07/a996dbce-ce7f-442b-bc93-1a4995682ff6.jpg', 1, 3, '0', '0', '2021-07-07 15:47:21', '妍秀', '2021-07-07 15:47:18', '妍秀', '2021-07-07 16:04:38', '');
INSERT INTO `cms_product` VALUES (96, 'product', 'ca10002', '产品中心标题二', '', '远距离水表在市场上应用广泛，具有方便快捷的功能。这是电力消费生活中的一大进步。 众所周知，普通的冷水和热水表已经被现代快速家庭生活所淘汰。现在，远程水表越来越复杂，...', '/profile/upload/2021/07/07/d7d24b13-841c-4e57-a4c4-b6d505a7315d.jpg', 2, 0, '0', '0', '2021-07-07 17:16:21', '妍秀', '2021-07-07 17:16:19', '妍秀', '2021-07-07 17:16:23', '');
INSERT INTO `cms_product` VALUES (97, 'product', 'ca10002', '产品中心标题三', '', '远距离水表在市场上应用广泛，具有方便快捷的功能。这是电力消费生活中的一大进步。 众所周知，普通的冷水和热水表已经被现代快速家庭生活所淘汰。现在，远程水表越来越复杂，...', '/profile/upload/2021/07/07/6b5bf6d8-d86d-4dd8-8ca9-17ece7a3fabc.jpg', 3, 0, '0', '0', '2021-07-07 17:17:56', '妍秀', '2021-07-07 17:17:53', '妍秀', '2021-07-07 17:17:58', '');
INSERT INTO `cms_product` VALUES (98, 'product', 'ca10002', '产品中心标题四', '', '远距离水表在市场上应用广泛，具有方便快捷的功能。这是电力消费生活中的一大进步。 众所周知，普通的冷水和热水表已经被现代快速家庭生活所淘汰。现在，远程水表越来越复杂，...', '/profile/upload/2021/07/07/60633b99-94b9-41f5-90d1-168c3492ba17.jpg', 4, 0, '0', '0', '2021-07-07 17:19:33', '妍秀', '2021-07-07 17:19:29', '妍秀', '2021-07-07 17:19:33', '');
INSERT INTO `cms_product` VALUES (99, 'product', 'ca10003', '产品中心标题一', '', '远距离水表在市场上应用广泛，具有方便快捷的功能。这是电力消费生活中的一大进步。 众所周知，普通的冷水和热水表已经被现代快速家庭生活所淘汰。现在，远程水表越来越复杂，...', '/profile/upload/2021/07/07/155a0de3-8531-4db4-b345-15c6610996e5.jpg', 1, 2, '0', '0', '2021-07-07 17:21:48', '妍秀', '2021-07-07 17:21:43', '妍秀', '2021-07-08 09:40:15', '');
INSERT INTO `cms_product` VALUES (100, 'product', 'ca10003', '产品中心标题二', '', '远距离水表在市场上应用广泛，具有方便快捷的功能。这是电力消费生活中的一大进步。 众所周知，普通的冷水和热水表已经被现代快速家庭生活所淘汰。现在，远程水表越来越复杂，...', '/profile/upload/2021/07/07/13bb5739-b1f9-4a51-bd34-43569f0c982a.jpg', 2, 0, '0', '0', '2021-07-07 17:24:22', '妍秀', '2021-07-07 17:24:18', '妍秀', '2021-07-07 17:24:22', '');
INSERT INTO `cms_product` VALUES (101, 'product', 'ca10003', '产品中心标题三', '', '远距离水表在市场上应用广泛，具有方便快捷的功能。这是电力消费生活中的一大进步。 众所周知，普通的冷水和热水表已经被现代快速家庭生活所淘汰。现在，远程水表越来越复杂，...', '/profile/upload/2021/07/07/2ba7449f-f846-4c80-a87e-4e608ae97524.jpg', 1, 1, '0', '0', '2021-07-07 17:26:55', '妍秀', '2021-07-07 17:26:50', '妍秀', '2021-07-07 18:00:33', '');
INSERT INTO `cms_product` VALUES (102, 'product', 'ca10003', '产品中心标题四', '', '远距离水表在市场上应用广泛，具有方便快捷的功能。这是电力消费生活中的一大进步。 众所周知，普通的冷水和热水表已经被现代快速家庭生活所淘汰。现在，远程水表越来越复杂，...', '/profile/upload/2021/07/07/e0ce9c33-6307-43f5-a130-17856d7c76bc.jpg', 1, 0, '0', '0', '2021-07-07 17:28:07', '妍秀', '2021-07-07 17:28:02', '妍秀', '2021-07-07 17:28:07', '');
INSERT INTO `cms_product` VALUES (103, 'product', 'ca10004', '产品中心标题一', '', '远距离水表在市场上应用广泛，具有方便快捷的功能。这是电力消费生活中的一大进步。 众所周知，普通的冷水和热水表已经被现代快速家庭生活所淘汰。现在，远程水表越来越复杂，...', '/profile/upload/2021/07/07/63eaa2b1-7f83-4d8d-977e-50e9b0029eb4.jpg', 1, 0, '0', '0', '2021-07-07 17:30:14', '妍秀', '2021-07-07 17:30:10', '妍秀', '2021-07-07 17:30:14', '');
INSERT INTO `cms_product` VALUES (104, 'product', 'ca10004', '产品中心标题二', '', '远距离水表在市场上应用广泛，具有方便快捷的功能。这是电力消费生活中的一大进步。 众所周知，普通的冷水和热水表已经被现代快速家庭生活所淘汰。现在，远程水表越来越复杂，...', '/profile/upload/2021/07/07/7388282d-7150-4e23-8946-fa452c73a01e.jpg', 2, 0, '0', '0', '2021-07-07 17:31:38', '妍秀', '2021-07-07 17:31:33', '妍秀', '2021-07-07 17:31:38', '');
INSERT INTO `cms_product` VALUES (105, 'product', 'ca10004', '产品中心标题三', '', '远距离水表在市场上应用广泛，具有方便快捷的功能。这是电力消费生活中的一大进步。 众所周知，普通的冷水和热水表已经被现代快速家庭生活所淘汰。现在，远程水表越来越复杂，...', '/profile/upload/2021/07/07/19eb3e5e-bcf4-4231-b09e-4a6da0160f80.jpg', 3, 0, '0', '0', '2021-07-07 17:32:58', '妍秀', '2021-07-07 17:32:52', '妍秀', '2021-07-07 17:32:58', '');

-- ----------------------------
-- Table structure for cms_product_article
-- ----------------------------
DROP TABLE IF EXISTS `cms_product_article`;
CREATE TABLE `cms_product_article`  (
  `product_content_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '产品内容ID',
  `product_id` int(11) NOT NULL COMMENT '产品ID',
  `content_info` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容详情',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`product_content_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 96 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品内容信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_product_article
-- ----------------------------
INSERT INTO `cms_product_article` VALUES (81, 91, '<p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">远距离水表在市场上应用广泛，具有方便快捷的功能。这是电力消费生活中的一大进步。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　众所周知，普通的冷水和热水表已经被现代快速家庭生活所淘汰。现在，远程水表越来越复杂，基于普通的和更加机械化的冷热水表，结合远程传输系统。它不仅可以清楚地记录交通，而且可以计算最小和最大交通量。它仍能在高压下正常运转。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　随着社会的发展和科学技术的进步，远程水表也在不断地改进，增加了许多技术手段以方便计算机控制。智能远程传输水表现在越来越受到企业和用户的欢迎和信赖。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　增加电子采集模块是智能远传水表的特点。电子采集模块的引入，使水表的应用时代发生了革命性的变化，使得所有的数据都能够网络化和系统化。电子模块完成信号采集、数据处理等处理项目，然后将数据存储在电子线路上至中继器或手动抄表器。远程水表的设计属于集成化，在其内部有一个智能芯片，可以记录最新的传输记录，真正实现智能化。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　远程水表在原有的基础上增加刷卡预付功能，一米多功能，用户方便，是广大居民用户的首选，也是管理部门的依赖，可以远程监控。NG也可以预先支付水费，一次获得更多，这个水表得到支持。相信在不久的将来，智能远程传输水表将在市场上推出。</p>', '2021-07-07 15:02:23');
INSERT INTO `cms_product_article` VALUES (82, 92, '<p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">远距离水表在市场上应用广泛，具有方便快捷的功能。这是电力消费生活中的一大进步。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　众所周知，普通的冷水和热水表已经被现代快速家庭生活所淘汰。现在，远程水表越来越复杂，基于普通的和更加机械化的冷热水表，结合远程传输系统。它不仅可以清楚地记录交通，而且可以计算最小和最大交通量。它仍能在高压下正常运转。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　随着社会的发展和科学技术的进步，远程水表也在不断地改进，增加了许多技术手段以方便计算机控制。智能远程传输水表现在越来越受到企业和用户的欢迎和信赖。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　增加电子采集模块是智能远传水表的特点。电子采集模块的引入，使水表的应用时代发生了革命性的变化，使得所有的数据都能够网络化和系统化。电子模块完成信号采集、数据处理等处理项目，然后将数据存储在电子线路上至中继器或手动抄表器。远程水表的设计属于集成化，在其内部有一个智能芯片，可以记录最新的传输记录，真正实现智能化。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　远程水表在原有的基础上增加刷卡预付功能，一米多功能，用户方便，是广大居民用户的首选，也是管理部门的依赖，可以远程监控。NG也可以预先支付水费，一次获得更多，这个水表得到支持。相信在不久的将来，智能远程传输水表将在市场上推出。</p>', '2021-07-07 15:14:34');
INSERT INTO `cms_product_article` VALUES (83, 93, '<p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">远距离水表在市场上应用广泛，具有方便快捷的功能。这是电力消费生活中的一大进步。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　众所周知，普通的冷水和热水表已经被现代快速家庭生活所淘汰。现在，远程水表越来越复杂，基于普通的和更加机械化的冷热水表，结合远程传输系统。它不仅可以清楚地记录交通，而且可以计算最小和最大交通量。它仍能在高压下正常运转。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　随着社会的发展和科学技术的进步，远程水表也在不断地改进，增加了许多技术手段以方便计算机控制。智能远程传输水表现在越来越受到企业和用户的欢迎和信赖。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　增加电子采集模块是智能远传水表的特点。电子采集模块的引入，使水表的应用时代发生了革命性的变化，使得所有的数据都能够网络化和系统化。电子模块完成信号采集、数据处理等处理项目，然后将数据存储在电子线路上至中继器或手动抄表器。远程水表的设计属于集成化，在其内部有一个智能芯片，可以记录最新的传输记录，真正实现智能化。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　远程水表在原有的基础上增加刷卡预付功能，一米多功能，用户方便，是广大居民用户的首选，也是管理部门的依赖，可以远程监控。NG也可以预先支付水费，一次获得更多，这个水表得到支持。相信在不久的将来，智能远程传输水表将在市场上推出。</p>', '2021-07-07 15:31:29');
INSERT INTO `cms_product_article` VALUES (84, 94, '<p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">远距离水表在市场上应用广泛，具有方便快捷的功能。这是电力消费生活中的一大进步。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　众所周知，普通的冷水和热水表已经被现代快速家庭生活所淘汰。现在，远程水表越来越复杂，基于普通的和更加机械化的冷热水表，结合远程传输系统。它不仅可以清楚地记录交通，而且可以计算最小和最大交通量。它仍能在高压下正常运转。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　随着社会的发展和科学技术的进步，远程水表也在不断地改进，增加了许多技术手段以方便计算机控制。智能远程传输水表现在越来越受到企业和用户的欢迎和信赖。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　增加电子采集模块是智能远传水表的特点。电子采集模块的引入，使水表的应用时代发生了革命性的变化，使得所有的数据都能够网络化和系统化。电子模块完成信号采集、数据处理等处理项目，然后将数据存储在电子线路上至中继器或手动抄表器。远程水表的设计属于集成化，在其内部有一个智能芯片，可以记录最新的传输记录，真正实现智能化。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　远程水表在原有的基础上增加刷卡预付功能，一米多功能，用户方便，是广大居民用户的首选，也是管理部门的依赖，可以远程监控。NG也可以预先支付水费，一次获得更多，这个水表得到支持。相信在不久的将来，智能远程传输水表将在市场上推出。</p>', '2021-07-07 15:41:05');
INSERT INTO `cms_product_article` VALUES (85, 95, '<p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">远距离水表在市场上应用广泛，具有方便快捷的功能。这是电力消费生活中的一大进步。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　众所周知，普通的冷水和热水表已经被现代快速家庭生活所淘汰。现在，远程水表越来越复杂，基于普通的和更加机械化的冷热水表，结合远程传输系统。它不仅可以清楚地记录交通，而且可以计算最小和最大交通量。它仍能在高压下正常运转。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　随着社会的发展和科学技术的进步，远程水表也在不断地改进，增加了许多技术手段以方便计算机控制。智能远程传输水表现在越来越受到企业和用户的欢迎和信赖。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　增加电子采集模块是智能远传水表的特点。电子采集模块的引入，使水表的应用时代发生了革命性的变化，使得所有的数据都能够网络化和系统化。电子模块完成信号采集、数据处理等处理项目，然后将数据存储在电子线路上至中继器或手动抄表器。远程水表的设计属于集成化，在其内部有一个智能芯片，可以记录最新的传输记录，真正实现智能化。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　远程水表在原有的基础上增加刷卡预付功能，一米多功能，用户方便，是广大居民用户的首选，也是管理部门的依赖，可以远程监控。NG也可以预先支付水费，一次获得更多，这个水表得到支持。相信在不久的将来，智能远程传输水表将在市场上推出。</p>', '2021-07-07 15:47:18');
INSERT INTO `cms_product_article` VALUES (86, 96, '<p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">远距离水表在市场上应用广泛，具有方便快捷的功能。这是电力消费生活中的一大进步。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　众所周知，普通的冷水和热水表已经被现代快速家庭生活所淘汰。现在，远程水表越来越复杂，基于普通的和更加机械化的冷热水表，结合远程传输系统。它不仅可以清楚地记录交通，而且可以计算最小和最大交通量。它仍能在高压下正常运转。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　随着社会的发展和科学技术的进步，远程水表也在不断地改进，增加了许多技术手段以方便计算机控制。智能远程传输水表现在越来越受到企业和用户的欢迎和信赖。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　增加电子采集模块是智能远传水表的特点。电子采集模块的引入，使水表的应用时代发生了革命性的变化，使得所有的数据都能够网络化和系统化。电子模块完成信号采集、数据处理等处理项目，然后将数据存储在电子线路上至中继器或手动抄表器。远程水表的设计属于集成化，在其内部有一个智能芯片，可以记录最新的传输记录，真正实现智能化。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　远程水表在原有的基础上增加刷卡预付功能，一米多功能，用户方便，是广大居民用户的首选，也是管理部门的依赖，可以远程监控。NG也可以预先支付水费，一次获得更多，这个水表得到支持。相信在不久的将来，智能远程传输水表将在市场上推出。</p>', '2021-07-07 17:16:19');
INSERT INTO `cms_product_article` VALUES (87, 97, '<p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">远距离水表在市场上应用广泛，具有方便快捷的功能。这是电力消费生活中的一大进步。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　众所周知，普通的冷水和热水表已经被现代快速家庭生活所淘汰。现在，远程水表越来越复杂，基于普通的和更加机械化的冷热水表，结合远程传输系统。它不仅可以清楚地记录交通，而且可以计算最小和最大交通量。它仍能在高压下正常运转。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　随着社会的发展和科学技术的进步，远程水表也在不断地改进，增加了许多技术手段以方便计算机控制。智能远程传输水表现在越来越受到企业和用户的欢迎和信赖。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　增加电子采集模块是智能远传水表的特点。电子采集模块的引入，使水表的应用时代发生了革命性的变化，使得所有的数据都能够网络化和系统化。电子模块完成信号采集、数据处理等处理项目，然后将数据存储在电子线路上至中继器或手动抄表器。远程水表的设计属于集成化，在其内部有一个智能芯片，可以记录最新的传输记录，真正实现智能化。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　远程水表在原有的基础上增加刷卡预付功能，一米多功能，用户方便，是广大居民用户的首选，也是管理部门的依赖，可以远程监控。NG也可以预先支付水费，一次获得更多，这个水表得到支持。相信在不久的将来，智能远程传输水表将在市场上推出。</p>', '2021-07-07 17:17:53');
INSERT INTO `cms_product_article` VALUES (88, 98, '<p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">远距离水表在市场上应用广泛，具有方便快捷的功能。这是电力消费生活中的一大进步。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　众所周知，普通的冷水和热水表已经被现代快速家庭生活所淘汰。现在，远程水表越来越复杂，基于普通的和更加机械化的冷热水表，结合远程传输系统。它不仅可以清楚地记录交通，而且可以计算最小和最大交通量。它仍能在高压下正常运转。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　随着社会的发展和科学技术的进步，远程水表也在不断地改进，增加了许多技术手段以方便计算机控制。智能远程传输水表现在越来越受到企业和用户的欢迎和信赖。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　增加电子采集模块是智能远传水表的特点。电子采集模块的引入，使水表的应用时代发生了革命性的变化，使得所有的数据都能够网络化和系统化。电子模块完成信号采集、数据处理等处理项目，然后将数据存储在电子线路上至中继器或手动抄表器。远程水表的设计属于集成化，在其内部有一个智能芯片，可以记录最新的传输记录，真正实现智能化。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　远程水表在原有的基础上增加刷卡预付功能，一米多功能，用户方便，是广大居民用户的首选，也是管理部门的依赖，可以远程监控。NG也可以预先支付水费，一次获得更多，这个水表得到支持。相信在不久的将来，智能远程传输水表将在市场上推出。</p>', '2021-07-07 17:19:29');
INSERT INTO `cms_product_article` VALUES (89, 99, '<p></p><div class=\"tags\" style=\"margin: 0px 0px 20px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); overflow: hidden; color: rgb(0, 0, 0); font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\"></div><p></p><div class=\"danye\" style=\"margin: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); font-size: 15px; line-height: 28px; color: rgb(67, 67, 67); text-align: justify; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\"><p style=\"margin: 0px 0px 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0);\">远距离水表在市场上应用广泛，具有方便快捷的功能。这是电力消费生活中的一大进步。</p><p style=\"margin: 0px 0px 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0);\">　　众所周知，普通的冷水和热水表已经被现代快速家庭生活所淘汰。现在，远程水表越来越复杂，基于普通的和更加机械化的冷热水表，结合远程传输系统。它不仅可以清楚地记录交通，而且可以计算最小和最大交通量。它仍能在高压下正常运转。</p><p style=\"margin: 0px 0px 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0);\">　　随着社会的发展和科学技术的进步，远程水表也在不断地改进，增加了许多技术手段以方便计算机控制。智能远程传输水表现在越来越受到企业和用户的欢迎和信赖。</p><p style=\"margin: 0px 0px 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0);\">　　增加电子采集模块是智能远传水表的特点。电子采集模块的引入，使水表的应用时代发生了革命性的变化，使得所有的数据都能够网络化和系统化。电子模块完成信号采集、数据处理等处理项目，然后将数据存储在电子线路上至中继器或手动抄表器。远程水表的设计属于集成化，在其内部有一个智能芯片，可以记录最新的传输记录，真正实现智能化。</p><p style=\"margin: 0px 0px 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0);\">　　远程水表在原有的基础上增加刷卡预付功能，一米多功能，用户方便，是广大居民用户的首选，也是管理部门的依赖，可以远程监控。NG也可以预先支付水费，一次获得更多，这个水表得到支持。相信在不久的将来，智能远程传输水表将在市场上推出。</p><p style=\"margin: 0px 0px 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0);\"></p></div>', '2021-07-07 17:21:43');
INSERT INTO `cms_product_article` VALUES (90, 100, '<p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">远距离水表在市场上应用广泛，具有方便快捷的功能。这是电力消费生活中的一大进步。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　众所周知，普通的冷水和热水表已经被现代快速家庭生活所淘汰。现在，远程水表越来越复杂，基于普通的和更加机械化的冷热水表，结合远程传输系统。它不仅可以清楚地记录交通，而且可以计算最小和最大交通量。它仍能在高压下正常运转。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　随着社会的发展和科学技术的进步，远程水表也在不断地改进，增加了许多技术手段以方便计算机控制。智能远程传输水表现在越来越受到企业和用户的欢迎和信赖。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　增加电子采集模块是智能远传水表的特点。电子采集模块的引入，使水表的应用时代发生了革命性的变化，使得所有的数据都能够网络化和系统化。电子模块完成信号采集、数据处理等处理项目，然后将数据存储在电子线路上至中继器或手动抄表器。远程水表的设计属于集成化，在其内部有一个智能芯片，可以记录最新的传输记录，真正实现智能化。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　远程水表在原有的基础上增加刷卡预付功能，一米多功能，用户方便，是广大居民用户的首选，也是管理部门的依赖，可以远程监控。NG也可以预先支付水费，一次获得更多，这个水表得到支持。相信在不久的将来，智能远程传输水表将在市场上推出。</p>', '2021-07-07 17:24:18');
INSERT INTO `cms_product_article` VALUES (91, 101, '<p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">远距离水表在市场上应用广泛，具有方便快捷的功能。这是电力消费生活中的一大进步。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　众所周知，普通的冷水和热水表已经被现代快速家庭生活所淘汰。现在，远程水表越来越复杂，基于普通的和更加机械化的冷热水表，结合远程传输系统。它不仅可以清楚地记录交通，而且可以计算最小和最大交通量。它仍能在高压下正常运转。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　随着社会的发展和科学技术的进步，远程水表也在不断地改进，增加了许多技术手段以方便计算机控制。智能远程传输水表现在越来越受到企业和用户的欢迎和信赖。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　增加电子采集模块是智能远传水表的特点。电子采集模块的引入，使水表的应用时代发生了革命性的变化，使得所有的数据都能够网络化和系统化。电子模块完成信号采集、数据处理等处理项目，然后将数据存储在电子线路上至中继器或手动抄表器。远程水表的设计属于集成化，在其内部有一个智能芯片，可以记录最新的传输记录，真正实现智能化。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　远程水表在原有的基础上增加刷卡预付功能，一米多功能，用户方便，是广大居民用户的首选，也是管理部门的依赖，可以远程监控。NG也可以预先支付水费，一次获得更多，这个水表得到支持。相信在不久的将来，智能远程传输水表将在市场上推出。</p>', '2021-07-07 17:26:50');
INSERT INTO `cms_product_article` VALUES (92, 102, '<p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">远距离水表在市场上应用广泛，具有方便快捷的功能。这是电力消费生活中的一大进步。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　众所周知，普通的冷水和热水表已经被现代快速家庭生活所淘汰。现在，远程水表越来越复杂，基于普通的和更加机械化的冷热水表，结合远程传输系统。它不仅可以清楚地记录交通，而且可以计算最小和最大交通量。它仍能在高压下正常运转。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　随着社会的发展和科学技术的进步，远程水表也在不断地改进，增加了许多技术手段以方便计算机控制。智能远程传输水表现在越来越受到企业和用户的欢迎和信赖。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　增加电子采集模块是智能远传水表的特点。电子采集模块的引入，使水表的应用时代发生了革命性的变化，使得所有的数据都能够网络化和系统化。电子模块完成信号采集、数据处理等处理项目，然后将数据存储在电子线路上至中继器或手动抄表器。远程水表的设计属于集成化，在其内部有一个智能芯片，可以记录最新的传输记录，真正实现智能化。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　远程水表在原有的基础上增加刷卡预付功能，一米多功能，用户方便，是广大居民用户的首选，也是管理部门的依赖，可以远程监控。NG也可以预先支付水费，一次获得更多，这个水表得到支持。相信在不久的将来，智能远程传输水表将在市场上推出。</p>', '2021-07-07 17:28:02');
INSERT INTO `cms_product_article` VALUES (93, 103, '<p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">远距离水表在市场上应用广泛，具有方便快捷的功能。这是电力消费生活中的一大进步。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　众所周知，普通的冷水和热水表已经被现代快速家庭生活所淘汰。现在，远程水表越来越复杂，基于普通的和更加机械化的冷热水表，结合远程传输系统。它不仅可以清楚地记录交通，而且可以计算最小和最大交通量。它仍能在高压下正常运转。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　随着社会的发展和科学技术的进步，远程水表也在不断地改进，增加了许多技术手段以方便计算机控制。智能远程传输水表现在越来越受到企业和用户的欢迎和信赖。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　增加电子采集模块是智能远传水表的特点。电子采集模块的引入，使水表的应用时代发生了革命性的变化，使得所有的数据都能够网络化和系统化。电子模块完成信号采集、数据处理等处理项目，然后将数据存储在电子线路上至中继器或手动抄表器。远程水表的设计属于集成化，在其内部有一个智能芯片，可以记录最新的传输记录，真正实现智能化。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　远程水表在原有的基础上增加刷卡预付功能，一米多功能，用户方便，是广大居民用户的首选，也是管理部门的依赖，可以远程监控。NG也可以预先支付水费，一次获得更多，这个水表得到支持。相信在不久的将来，智能远程传输水表将在市场上推出。</p>', '2021-07-07 17:30:10');
INSERT INTO `cms_product_article` VALUES (94, 104, '<p><div class=\"tags\" style=\"margin: 0px 0px 20px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); overflow: hidden; color: rgb(0, 0, 0); font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\"></div></p><div class=\"danye\" style=\"margin: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); font-size: 15px; line-height: 28px; color: rgb(67, 67, 67); text-align: justify; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\"><p style=\"margin: 0px 0px 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0);\">远距离水表在市场上应用广泛，具有方便快捷的功能。这是电力消费生活中的一大进步。</p><p style=\"margin: 0px 0px 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0);\">　　众所周知，普通的冷水和热水表已经被现代快速家庭生活所淘汰。现在，远程水表越来越复杂，基于普通的和更加机械化的冷热水表，结合远程传输系统。它不仅可以清楚地记录交通，而且可以计算最小和最大交通量。它仍能在高压下正常运转。</p><p style=\"margin: 0px 0px 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0);\">　　随着社会的发展和科学技术的进步，远程水表也在不断地改进，增加了许多技术手段以方便计算机控制。智能远程传输水表现在越来越受到企业和用户的欢迎和信赖。</p><p style=\"margin: 0px 0px 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0);\">　　增加电子采集模块是智能远传水表的特点。电子采集模块的引入，使水表的应用时代发生了革命性的变化，使得所有的数据都能够网络化和系统化。电子模块完成信号采集、数据处理等处理项目，然后将数据存储在电子线路上至中继器或手动抄表器。远程水表的设计属于集成化，在其内部有一个智能芯片，可以记录最新的传输记录，真正实现智能化。</p><p style=\"margin: 0px 0px 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0);\">　　远程水表在原有的基础上增加刷卡预付功能，一米多功能，用户方便，是广大居民用户的首选，也是管理部门的依赖，可以远程监控。NG也可以预先支付水费，一次获得更多，这个水表得到支持。相信在不久的将来，智能远程传输水表将在市场上推出。</p><p style=\"margin: 0px 0px 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0);\"></p></div>', '2021-07-07 17:31:33');
INSERT INTO `cms_product_article` VALUES (95, 105, '<p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">远距离水表在市场上应用广泛，具有方便快捷的功能。这是电力消费生活中的一大进步。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　众所周知，普通的冷水和热水表已经被现代快速家庭生活所淘汰。现在，远程水表越来越复杂，基于普通的和更加机械化的冷热水表，结合远程传输系统。它不仅可以清楚地记录交通，而且可以计算最小和最大交通量。它仍能在高压下正常运转。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　随着社会的发展和科学技术的进步，远程水表也在不断地改进，增加了许多技术手段以方便计算机控制。智能远程传输水表现在越来越受到企业和用户的欢迎和信赖。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　增加电子采集模块是智能远传水表的特点。电子采集模块的引入，使水表的应用时代发生了革命性的变化，使得所有的数据都能够网络化和系统化。电子模块完成信号采集、数据处理等处理项目，然后将数据存储在电子线路上至中继器或手动抄表器。远程水表的设计属于集成化，在其内部有一个智能芯片，可以记录最新的传输记录，真正实现智能化。</p><p style=\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\">　　远程水表在原有的基础上增加刷卡预付功能，一米多功能，用户方便，是广大居民用户的首选，也是管理部门的依赖，可以远程监控。NG也可以预先支付水费，一次获得更多，这个水表得到支持。相信在不久的将来，智能远程传输水表将在市场上推出。</p>', '2021-07-07 17:32:52');

-- ----------------------------
-- Table structure for cms_product_img
-- ----------------------------
DROP TABLE IF EXISTS `cms_product_img`;
CREATE TABLE `cms_product_img`  (
  `product_img_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '产品图片ID',
  `product_id` int(11) NOT NULL COMMENT '产品',
  `product_img_url` varchar(350) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产品图片地址',
  `product_sort` int(11) NOT NULL DEFAULT 1 COMMENT '显示顺序',
  `create_time` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`product_img_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 158 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品图片信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_product_img
-- ----------------------------
INSERT INTO `cms_product_img` VALUES (120, 91, '/profile/upload/2021/07/07/22ebccb6-a321-4dfb-b537-6aa0681e7f8d.jpg', 0, '2021-07-07 15:10:14');
INSERT INTO `cms_product_img` VALUES (121, 91, '/profile/upload/2021/07/07/86a27953-0b19-4312-abcd-6217e4538dd4.jpg', 1, '2021-07-07 15:10:14');
INSERT INTO `cms_product_img` VALUES (126, 93, '/profile/upload/2021/07/07/c2fcbed8-3a42-46b8-9df6-c7e61189e467.jpg', 0, '2021-07-07 15:31:43');
INSERT INTO `cms_product_img` VALUES (127, 93, '/profile/upload/2021/07/07/3176aff3-303a-448f-aaf8-baf21f73f581.jpg', 1, '2021-07-07 15:31:43');
INSERT INTO `cms_product_img` VALUES (128, 92, '/profile/upload/2021/07/07/38070186-dca7-41d9-a5cd-081c66c8e57f.jpg', 0, '2021-07-07 15:31:53');
INSERT INTO `cms_product_img` VALUES (129, 92, '/profile/upload/2021/07/07/074e38d4-25de-4537-93d1-52689b2ac17f.jpg', 1, '2021-07-07 15:31:53');
INSERT INTO `cms_product_img` VALUES (130, 94, '/profile/upload/2021/07/07/aaf42a39-3129-4e2f-8270-5af8d6c02657.jpg', 0, '2021-07-07 15:41:05');
INSERT INTO `cms_product_img` VALUES (131, 94, '/profile/upload/2021/07/07/5c9c62e0-2d6a-440b-8611-111e5fdb792d.jpg', 1, '2021-07-07 15:41:05');
INSERT INTO `cms_product_img` VALUES (134, 95, '/profile/upload/2021/07/07/073e20e3-3277-49bf-aa71-1001d1102685.jpg', 0, '2021-07-07 16:04:28');
INSERT INTO `cms_product_img` VALUES (135, 95, '/profile/upload/2021/07/07/136614db-d53f-4c10-bf21-a594aa81adb7.jpg', 1, '2021-07-07 16:04:28');
INSERT INTO `cms_product_img` VALUES (136, 96, '/profile/upload/2021/07/07/fd1461d0-19d5-472c-8915-24801871ae41.jpg', 0, '2021-07-07 17:16:19');
INSERT INTO `cms_product_img` VALUES (137, 96, '/profile/upload/2021/07/07/30d24ffb-5ef4-4cc0-8e2c-a30445778ebb.jpg', 1, '2021-07-07 17:16:19');
INSERT INTO `cms_product_img` VALUES (138, 97, '/profile/upload/2021/07/07/f52b4221-f84c-44a5-ac83-03c653f6b117.jpg', 0, '2021-07-07 17:17:53');
INSERT INTO `cms_product_img` VALUES (139, 97, '/profile/upload/2021/07/07/a354a7f5-924c-48e6-ad83-421574926e1d.jpg', 1, '2021-07-07 17:17:53');
INSERT INTO `cms_product_img` VALUES (140, 98, '/profile/upload/2021/07/07/2907e511-4663-4f27-95e3-3c06b9b43502.jpg', 0, '2021-07-07 17:19:29');
INSERT INTO `cms_product_img` VALUES (141, 98, '/profile/upload/2021/07/07/2320e0b7-9e5b-4ff2-8c2c-4b20e1f8b37c.jpg', 1, '2021-07-07 17:19:29');
INSERT INTO `cms_product_img` VALUES (144, 99, '/profile/upload/2021/07/07/ebb4efc1-3c25-4c88-bfa4-52cebb65b4df.jpg', 0, '2021-07-07 17:21:59');
INSERT INTO `cms_product_img` VALUES (145, 99, '/profile/upload/2021/07/07/0ccd7eb0-e6f5-44e9-a091-f84d3cb1d782.jpg', 1, '2021-07-07 17:21:59');
INSERT INTO `cms_product_img` VALUES (146, 100, '/profile/upload/2021/07/07/26abda10-5377-415d-bfa0-2af4a87b42b1.jpg', 0, '2021-07-07 17:24:18');
INSERT INTO `cms_product_img` VALUES (147, 100, '/profile/upload/2021/07/07/20e3f4da-d78a-4ae5-91a8-85c4e6ae49d1.jpg', 1, '2021-07-07 17:24:18');
INSERT INTO `cms_product_img` VALUES (148, 101, '/profile/upload/2021/07/07/17c2b4fd-c369-42cb-bbb9-160ba9758a4f.jpg', 0, '2021-07-07 17:26:50');
INSERT INTO `cms_product_img` VALUES (149, 101, '/profile/upload/2021/07/07/28ec6731-62a0-4f4c-a59e-2a20e1665503.jpg', 1, '2021-07-07 17:26:50');
INSERT INTO `cms_product_img` VALUES (150, 102, '/profile/upload/2021/07/07/681c154b-4fb8-440c-9d24-11df46e2b25b.jpg', 0, '2021-07-07 17:28:02');
INSERT INTO `cms_product_img` VALUES (151, 102, '/profile/upload/2021/07/07/9243f6b2-a7ad-44ae-b34c-14e20c6d4892.jpg', 1, '2021-07-07 17:28:02');
INSERT INTO `cms_product_img` VALUES (152, 103, '/profile/upload/2021/07/07/c169c3da-6bdf-43aa-b46c-808d89dbff6a.jpg', 0, '2021-07-07 17:30:10');
INSERT INTO `cms_product_img` VALUES (153, 103, '/profile/upload/2021/07/07/a2526d9a-c568-4201-9cfa-b50fb9f24077.jpg', 1, '2021-07-07 17:30:10');
INSERT INTO `cms_product_img` VALUES (154, 104, '/profile/upload/2021/07/07/61a7e2b4-1e66-4db3-bb71-80a4b1aef1af.jpg', 0, '2021-07-07 17:31:33');
INSERT INTO `cms_product_img` VALUES (155, 104, '/profile/upload/2021/07/07/25214191-969e-40e6-9f6a-750785dc8634.jpg', 1, '2021-07-07 17:31:33');
INSERT INTO `cms_product_img` VALUES (156, 105, '/profile/upload/2021/07/07/5a4cce72-d980-47cf-b19a-57ba531d72be.jpg', 0, '2021-07-07 17:32:52');
INSERT INTO `cms_product_img` VALUES (157, 105, '/profile/upload/2021/07/07/fc0d442a-915b-4d0e-9518-4f1085619c3f.jpg', 1, '2021-07-07 17:32:52');

-- ----------------------------
-- Table structure for cms_website_config
-- ----------------------------
DROP TABLE IF EXISTS `cms_website_config`;
CREATE TABLE `cms_website_config`  (
  `website_config_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `company_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司名称',
  `record_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备案号',
  `company_logo_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司logo地址',
  `contact_man` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司电话',
  `mobile` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号',
  `qq` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qq',
  `email` varchar(160) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱地址',
  `weixin` varchar(130) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信帐号',
  `weixin_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微信图片地址',
  `north_latitude` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '北纬坐标',
  `south_latitude` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '南纬坐标',
  `company_addr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司地址',
  `is_init_data` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '是否初始化（0已完成 1未操作）',
  `is_publish` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '是否发布（0已发布 1未发布）',
  `publish_time` datetime(0) NULL DEFAULT NULL COMMENT '发布时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`website_config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '网站配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_website_config
-- ----------------------------
INSERT INTO `cms_website_config` VALUES (14, '许昌妍秀发制品有限公司', '豫ICP备2020035656号-1', '/profile/upload/2021/07/07/60ea3095-d8c1-4fbe-8a1d-49e9b397df3b.png', '妍秀', '0374-888888', '13288888888', '8888888888', '8888888888@qq.com', '8888888888', '/profile/upload/2021/07/07/b4742366-0aba-46b1-b132-95a47f92f2b2.jpg', '113.826277', '34.02827', '河南省许昌市魏都区许继大道', '0', '0', '2021-07-07 14:35:59', '妍秀', '2021-07-07 14:35:27', '妍秀', '2021-07-07 14:35:59', NULL);

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作 sub主子表操作）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `blob_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'GMT+08:00');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'GMT+08:00');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'GMT+08:00');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 'com.yanxiuhair.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720023636F6D2E79616E786975686169722E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E00097872002C636F6D2E79616E786975686169722E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017A17E737F878707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'com.yanxiuhair.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720023636F6D2E79616E786975686169722E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E00097872002C636F6D2E79616E786975686169722E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017A17E737F878707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 'com.yanxiuhair.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720023636F6D2E79616E786975686169722E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E00097872002C636F6D2E79616E786975686169722E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017A17E737F878707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', '4UW3XNCDP5QFMC41625722537752', 1625723210429, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `int_prop_1` int(11) NULL DEFAULT NULL,
  `int_prop_2` int(11) NULL DEFAULT NULL,
  `long_prop_1` bigint(20) NULL DEFAULT NULL,
  `long_prop_2` bigint(20) NULL DEFAULT NULL,
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL,
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL,
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `next_fire_time` bigint(13) NULL DEFAULT NULL,
  `prev_fire_time` bigint(13) NULL DEFAULT NULL,
  `priority` int(11) NULL DEFAULT NULL,
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) NULL DEFAULT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `misfire_instr` smallint(2) NULL DEFAULT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1625722540000, -1, 5, 'PAUSED', 'CRON', 1625722538000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1625722545000, -1, 5, 'PAUSED', 'CRON', 1625722539000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1625722540000, -1, 5, 'PAUSED', 'CRON', 1625722539000, 0, NULL, 2, '');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 105 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2021-06-17 10:57:47', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2021-06-17 10:57:47', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2021-06-17 10:57:47', '', NULL, '深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue');
INSERT INTO `sys_config` VALUES (4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2021-06-17 10:57:47', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '用户管理-密码字符范围', 'sys.account.chrtype', '0', 'Y', 'admin', '2021-06-17 10:57:47', '', NULL, '默认任意字符范围，0任意（密码可以输入任意字符），1数字（密码只能为0-9数字），2英文字母（密码只能为a-z和A-Z字母），3字母和数字（密码必须包含字母，数字）,4字母数字和特殊字符（目前支持的特殊字符包括：~!@#$%^&*()-=_+）');
INSERT INTO `sys_config` VALUES (6, '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', '0', 'Y', 'admin', '2021-06-17 10:57:47', '', NULL, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (7, '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', '0', 'Y', 'admin', '2021-06-17 10:57:47', '', NULL, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (8, '主框架页-菜单导航显示风格', 'sys.index.menuStyle', 'default', 'Y', 'admin', '2021-06-17 10:57:47', '', NULL, '菜单导航显示风格（default为左侧导航菜单，topnav为顶部导航菜单）');
INSERT INTO `sys_config` VALUES (9, '主框架页-是否开启页脚', 'sys.index.ignoreFooter', 'true', 'Y', 'admin', '2021-06-17 10:57:47', '', NULL, '是否开启底部页脚显示（true显示，false隐藏）');
INSERT INTO `sys_config` VALUES (101, '导航代码', 'cms.navCode', 'na10000', 'Y', 'admin', '2020-05-27 16:46:29', 'admin', '2021-07-07 14:49:27', '');
INSERT INTO `sys_config` VALUES (102, '栏目代码', 'cms.cateCode', 'ca10014', 'Y', 'admin', '2020-05-27 16:47:19', 'admin', '2021-07-07 17:28:27', '');
INSERT INTO `sys_config` VALUES (103, '内容代码', 'cms.contgCode', 'co10000', 'Y', 'admin', '2020-05-27 16:47:56', 'admin', '2021-07-07 14:49:33', '');
INSERT INTO `sys_config` VALUES (104, '广告代码', 'cms.adCode', 'ad10017', 'Y', 'admin', '2020-06-05 15:44:55', '', '2020-11-26 17:17:02', NULL);

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '许昌妍秀发制品有限公司', 0, '妍秀', '15888888888', '123@qq.com', '0', '0', 'admin', '2021-06-17 10:57:46', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '许昌总公司', 1, '妍秀', '15888888888', '123@qq.com', '0', '0', 'admin', '2021-06-17 10:57:46', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '郑州分公司', 2, '妍秀', '15888888888', '123@qq.com', '0', '0', 'admin', '2021-06-17 10:57:46', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '妍秀', '15888888888', '123@qq.com', '0', '0', 'admin', '2021-06-17 10:57:46', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '妍秀', '15888888888', '123@qq.com', '0', '0', 'admin', '2021-06-17 10:57:46', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '妍秀', '15888888888', '123@qq.com', '0', '0', 'admin', '2021-06-17 10:57:46', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '妍秀', '15888888888', '123@qq.com', '0', '0', 'admin', '2021-06-17 10:57:46', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '妍秀', '15888888888', '123@qq.com', '0', '0', 'admin', '2021-06-17 10:57:46', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '妍秀', '15888888888', '123@qq.com', '0', '0', 'admin', '2021-06-17 10:57:46', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '妍秀', '15888888888', '123@qq.com', '0', '0', 'admin', '2021-06-17 10:57:46', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 117 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2021-06-17 10:57:46', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-06-17 10:57:46', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-06-17 10:57:46', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2021-06-17 10:57:46', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2021-06-17 10:57:46', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2021-06-17 10:57:46', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2021-06-17 10:57:46', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2021-06-17 10:57:46', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2021-06-17 10:57:46', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2021-06-17 10:57:46', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2021-06-17 10:57:46', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2021-06-17 10:57:46', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2021-06-17 10:57:46', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2021-06-17 10:57:46', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2021-06-17 10:57:46', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2021-06-17 10:57:46', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2021-06-17 10:57:46', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-06-17 10:57:46', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-06-17 10:57:46', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-06-17 10:57:46', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-06-17 10:57:46', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2021-06-17 10:57:46', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-06-17 10:57:46', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-06-17 10:57:46', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-06-17 10:57:46', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-06-17 10:57:46', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-06-17 10:57:46', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2021-06-17 10:57:46', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2021-06-17 10:57:46', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 1, '已发布', '0', 'cms_is_publish', NULL, 'success', 'N', '0', 'admin', '2021-07-05 14:42:11', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (101, 2, '未发布', '1', 'cms_is_publish', NULL, 'danger', 'Y', '0', 'admin', '2021-07-05 14:42:35', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (102, 1, '已置顶', '0', 'cms_is_top', NULL, 'success', 'N', '0', 'admin', '2021-07-05 15:07:10', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (103, 2, '未置顶', '1', 'cms_is_top', NULL, 'warning', 'Y', '0', 'admin', '2021-07-05 15:07:24', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (104, 1, '已完成', '0', 'cms_is_init_data', NULL, 'success', 'N', '0', 'admin', '2020-12-01 08:33:42', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (105, 2, '未操作', '1', 'cms_is_init_data', NULL, 'warning', 'Y', '0', 'admin', '2020-12-01 08:33:55', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (106, 1, '是', '0', 'cms_is_system', '', 'primary', 'Y', '0', 'admin', '2020-11-21 11:15:38', 'admin', '2020-11-24 10:07:12', '');
INSERT INTO `sys_dict_data` VALUES (107, 2, '否', '1', 'cms_is_system', '', 'warning', 'N', '0', 'admin', '2020-11-21 11:15:50', 'admin', '2020-11-24 10:07:18', '');
INSERT INTO `sys_dict_data` VALUES (108, 1, '文章', '0', 'cms_article_type', NULL, 'success', 'Y', '0', 'admin', '2020-11-25 09:34:36', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (109, 2, '图文', '1', 'cms_article_type', NULL, 'info', 'N', '0', 'admin', '2020-11-25 09:34:50', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (110, 1, '产品', 'product', 'cms_category_type', NULL, 'primary', 'N', '0', 'admin', '2021-07-06 13:53:49', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (111, 2, '资讯', 'news', 'cms_category_type', NULL, 'success', 'Y', '0', 'admin', '2021-07-06 13:54:11', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (112, 3, '案例', 'case', 'cms_category_type', NULL, 'warning', 'N', '0', 'admin', '2021-07-06 13:54:30', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (113, 1, '当前页', '_self', 'cms_target', '', 'success', 'Y', '0', 'admin', '2020-06-05 16:16:25', 'admin', '2020-06-08 14:09:16', '');
INSERT INTO `sys_dict_data` VALUES (114, 2, '新窗口', '_blank', 'cms_target', NULL, 'info', 'N', '0', 'admin', '2020-06-05 16:18:59', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (115, 1, '电脑端', 'pc', 'cms_device_type', NULL, 'success', 'Y', '0', 'admin', '2021-07-07 10:07:28', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (116, 2, '移动端', 'mobile', 'cms_device_type', NULL, 'warning', 'N', '0', 'admin', '2021-07-07 10:07:46', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 108 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2021-06-17 10:57:46', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2021-06-17 10:57:46', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2021-06-17 10:57:46', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2021-06-17 10:57:46', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2021-06-17 10:57:46', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2021-06-17 10:57:46', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2021-06-17 10:57:46', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2021-06-17 10:57:46', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2021-06-17 10:57:46', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2021-06-17 10:57:46', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '发布状态', 'cms_is_publish', '0', 'admin', '2021-07-05 14:41:28', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (101, '是否置顶', 'cms_is_top', '0', 'admin', '2021-07-05 15:06:35', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (102, '链接打开方式', 'cms_target', '0', 'admin', '2020-06-05 16:16:06', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (103, '数据初始化', 'cms_is_init_data', '0', 'admin', '2020-12-01 08:33:26', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (104, '系统默认', 'cms_is_system', '0', 'admin', '2020-11-21 11:15:19', 'admin', '2020-11-24 10:07:35', '');
INSERT INTO `sys_dict_type` VALUES (105, '文章类型', 'cms_article_type', '0', 'admin', '2020-11-25 09:33:12', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (106, '栏目类型', 'cms_category_type', '0', 'admin', '2021-07-06 13:53:16', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (107, '设备类型', 'cms_device_type', '0', 'admin', '2021-07-07 10:06:12', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2021-06-17 10:57:47', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2021-06-17 10:57:47', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2021-06-17 10:57:47', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 178 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-07-07 14:31:58');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-07-07 15:09:20');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-07-07 15:17:58');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-07-07 15:59:07');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '退出成功', '2021-07-07 15:59:23');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '1', '验证码错误', '2021-07-07 16:03:25');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '1', '验证码错误', '2021-07-07 16:03:30');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-07-07 16:03:33');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-07-07 17:13:39');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', '0', '登录成功', '2021-07-08 09:10:33');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `is_refresh` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否刷新（0刷新 1不刷新）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2074 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, '#', '', 'M', '0', '1', '', 'fa fa-gear', 'admin', '2021-06-17 10:57:46', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, '#', '', 'M', '0', '1', '', 'fa fa-video-camera', 'admin', '2021-06-17 10:57:46', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, '#', '', 'M', '0', '1', '', 'fa fa-bars', 'admin', '2021-06-17 10:57:46', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '妍秀官网', 0, 4, 'http://www.yanxiuhair.com', 'menuBlank', 'C', '0', '1', '', 'fa fa-location-arrow', 'admin', '2021-06-17 10:57:46', '', NULL, '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, '/system/user', '', 'C', '0', '1', 'system:user:view', 'fa fa-user-o', 'admin', '2021-06-17 10:57:46', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, '/system/role', '', 'C', '0', '1', 'system:role:view', 'fa fa-user-secret', 'admin', '2021-06-17 10:57:46', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, '/system/menu', '', 'C', '0', '1', 'system:menu:view', 'fa fa-th-list', 'admin', '2021-06-17 10:57:46', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, '/system/dept', '', 'C', '0', '1', 'system:dept:view', 'fa fa-outdent', 'admin', '2021-06-17 10:57:46', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, '/system/post', '', 'C', '0', '1', 'system:post:view', 'fa fa-address-card-o', 'admin', '2021-06-17 10:57:46', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, '/system/dict', '', 'C', '0', '1', 'system:dict:view', 'fa fa-bookmark-o', 'admin', '2021-06-17 10:57:46', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, '/system/config', '', 'C', '0', '1', 'system:config:view', 'fa fa-sun-o', 'admin', '2021-06-17 10:57:46', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, '/system/notice', '', 'C', '0', '1', 'system:notice:view', 'fa fa-bullhorn', 'admin', '2021-06-17 10:57:46', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, '#', '', 'M', '0', '1', '', 'fa fa-pencil-square-o', 'admin', '2021-06-17 10:57:46', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, '/monitor/online', '', 'C', '0', '1', 'monitor:online:view', 'fa fa-user-circle', 'admin', '2021-06-17 10:57:46', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, '/monitor/job', '', 'C', '0', '1', 'monitor:job:view', 'fa fa-tasks', 'admin', '2021-06-17 10:57:46', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, '/monitor/data', '', 'C', '0', '1', 'monitor:data:view', 'fa fa-bug', 'admin', '2021-06-17 10:57:46', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, '/monitor/server', '', 'C', '0', '1', 'monitor:server:view', 'fa fa-server', 'admin', '2021-06-17 10:57:46', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, '/monitor/cache', '', 'C', '0', '1', 'monitor:cache:view', 'fa fa-cube', 'admin', '2021-06-17 10:57:46', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, '/tool/build', '', 'C', '0', '1', 'tool:build:view', 'fa fa-wpforms', 'admin', '2021-06-17 10:57:46', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, '/tool/gen', '', 'C', '0', '1', 'tool:gen:view', 'fa fa-code', 'admin', '2021-06-17 10:57:46', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, '/tool/swagger', '', 'C', '0', '1', 'tool:swagger:view', 'fa fa-gg', 'admin', '2021-06-17 10:57:46', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, '/monitor/operlog', '', 'C', '0', '1', 'monitor:operlog:view', 'fa fa-address-book', 'admin', '2021-06-17 10:57:46', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, '/monitor/logininfor', '', 'C', '0', '1', 'monitor:logininfor:view', 'fa fa-file-image-o', 'admin', '2021-06-17 10:57:46', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '#', '', 'F', '0', '1', 'system:user:list', '#', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '#', '', 'F', '0', '1', 'system:user:add', '#', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '#', '', 'F', '0', '1', 'system:user:edit', '#', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '#', '', 'F', '0', '1', 'system:user:remove', '#', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '#', '', 'F', '0', '1', 'system:user:export', '#', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '#', '', 'F', '0', '1', 'system:user:import', '#', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '#', '', 'F', '0', '1', 'system:user:resetPwd', '#', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '#', '', 'F', '0', '1', 'system:role:list', '#', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '#', '', 'F', '0', '1', 'system:role:add', '#', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '#', '', 'F', '0', '1', 'system:role:edit', '#', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '#', '', 'F', '0', '1', 'system:role:remove', '#', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '#', '', 'F', '0', '1', 'system:role:export', '#', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '#', '', 'F', '0', '1', 'system:menu:list', '#', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '#', '', 'F', '0', '1', 'system:menu:add', '#', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '#', '', 'F', '0', '1', 'system:menu:edit', '#', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '#', '', 'F', '0', '1', 'system:menu:remove', '#', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '#', '', 'F', '0', '1', 'system:dept:list', '#', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '#', '', 'F', '0', '1', 'system:dept:add', '#', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '#', '', 'F', '0', '1', 'system:dept:edit', '#', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '#', '', 'F', '0', '1', 'system:dept:remove', '#', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '#', '', 'F', '0', '1', 'system:post:list', '#', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '#', '', 'F', '0', '1', 'system:post:add', '#', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '#', '', 'F', '0', '1', 'system:post:edit', '#', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '#', '', 'F', '0', '1', 'system:post:remove', '#', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '#', '', 'F', '0', '1', 'system:post:export', '#', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', 'F', '0', '1', 'system:dict:list', '#', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', 'F', '0', '1', 'system:dict:add', '#', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', 'F', '0', '1', 'system:dict:edit', '#', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', 'F', '0', '1', 'system:dict:remove', '#', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', 'F', '0', '1', 'system:dict:export', '#', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', 'F', '0', '1', 'system:config:list', '#', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', 'F', '0', '1', 'system:config:add', '#', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', 'F', '0', '1', 'system:config:edit', '#', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', 'F', '0', '1', 'system:config:remove', '#', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', 'F', '0', '1', 'system:config:export', '#', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', 'F', '0', '1', 'system:notice:list', '#', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', 'F', '0', '1', 'system:notice:add', '#', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', 'F', '0', '1', 'system:notice:edit', '#', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', 'F', '0', '1', 'system:notice:remove', '#', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', 'F', '0', '1', 'monitor:operlog:list', '#', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', 'F', '0', '1', 'monitor:operlog:remove', '#', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '详细信息', 500, 3, '#', '', 'F', '0', '1', 'monitor:operlog:detail', '#', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 'F', '0', '1', 'monitor:operlog:export', '#', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 'F', '0', '1', 'monitor:logininfor:list', '#', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 'F', '0', '1', 'monitor:logininfor:remove', '#', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 'F', '0', '1', 'monitor:logininfor:export', '#', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '账户解锁', 501, 4, '#', '', 'F', '0', '1', 'monitor:logininfor:unlock', '#', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '在线查询', 109, 1, '#', '', 'F', '0', '1', 'monitor:online:list', '#', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '批量强退', 109, 2, '#', '', 'F', '0', '1', 'monitor:online:batchForceLogout', '#', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '单条强退', 109, 3, '#', '', 'F', '0', '1', 'monitor:online:forceLogout', '#', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务查询', 110, 1, '#', '', 'F', '0', '1', 'monitor:job:list', '#', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务新增', 110, 2, '#', '', 'F', '0', '1', 'monitor:job:add', '#', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务修改', 110, 3, '#', '', 'F', '0', '1', 'monitor:job:edit', '#', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '任务删除', 110, 4, '#', '', 'F', '0', '1', 'monitor:job:remove', '#', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '状态修改', 110, 5, '#', '', 'F', '0', '1', 'monitor:job:changeStatus', '#', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '任务详细', 110, 6, '#', '', 'F', '0', '1', 'monitor:job:detail', '#', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '任务导出', 110, 7, '#', '', 'F', '0', '1', 'monitor:job:export', '#', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成查询', 115, 1, '#', '', 'F', '0', '1', 'tool:gen:list', '#', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '生成修改', 115, 2, '#', '', 'F', '0', '1', 'tool:gen:edit', '#', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '生成删除', 115, 3, '#', '', 'F', '0', '1', 'tool:gen:remove', '#', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '预览代码', 115, 4, '#', '', 'F', '0', '1', 'tool:gen:preview', '#', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1061, '生成代码', 115, 5, '#', '', 'F', '0', '1', 'tool:gen:code', '#', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2002, '内容管理', 0, 5, '#', 'menuItem', 'M', '0', '1', NULL, 'fa fa-newspaper-o', 'admin', '2020-05-22 13:44:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, '导航菜单', 2002, 2, '/cms/nav', 'menuItem', 'C', '0', '1', 'cms:nav:view', '#', 'admin', '2020-05-22 13:45:30', 'admin', '2020-11-24 08:51:42', '');
INSERT INTO `sys_menu` VALUES (2004, '栏目分类', 2002, 3, '/cms/category', 'menuItem', 'C', '0', '1', 'cms:category:view', '#', 'admin', '2020-05-22 13:45:49', 'admin', '2020-11-24 08:51:49', '');
INSERT INTO `sys_menu` VALUES (2007, '图片信息', 2002, 10, '/cms/ads', 'menuItem', 'C', '0', '1', 'cms:ads:view', '#', 'admin', '2020-05-22 13:51:30', 'admin', '2020-11-25 09:19:06', '');
INSERT INTO `sys_menu` VALUES (2022, '导航菜单查询', 2003, 1, '#', '', 'F', '0', '1', 'cms:nav:list', '#', 'admin', '2020-05-23 00:00:00', 'admin', '2020-05-23 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2023, '导航菜单新增', 2003, 2, '#', '', 'F', '0', '1', 'cms:nav:add', '#', 'admin', '2020-05-23 00:00:00', 'admin', '2020-05-23 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2024, '导航菜单修改', 2003, 3, '#', '', 'F', '0', '1', 'cms:nav:edit', '#', 'admin', '2020-05-23 00:00:00', 'admin', '2020-05-23 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2025, '导航菜单删除', 2003, 4, '#', '', 'F', '0', '1', 'cms:nav:remove', '#', 'admin', '2020-05-23 00:00:00', 'admin', '2020-05-23 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2026, '导航菜单导出', 2003, 5, '#', '', 'F', '0', '1', 'cms:nav:export', '#', 'admin', '2020-05-23 00:00:00', 'admin', '2020-05-23 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2027, '导航菜单详情', 2003, 6, '#', '', 'F', '0', '1', 'cms:nav:detail', '#', 'admin', '2020-05-23 00:00:00', 'admin', '2020-05-23 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2028, '导航栏目查询', 2004, 1, '#', '', 'F', '0', '1', 'cms:category:list', '#', 'admin', '2020-05-23 00:00:00', 'admin', '2020-05-23 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2029, '导航栏目新增', 2004, 2, '#', '', 'F', '0', '1', 'cms:category:add', '#', 'admin', '2020-05-23 00:00:00', 'admin', '2020-05-23 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2030, '导航栏目修改', 2004, 3, '#', '', 'F', '0', '1', 'cms:category:edit', '#', 'admin', '2020-05-23 00:00:00', 'admin', '2020-05-23 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2031, '导航栏目删除', 2004, 4, '#', '', 'F', '0', '1', 'cms:category:remove', '#', 'admin', '2020-05-23 00:00:00', 'admin', '2020-05-23 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2032, '导航栏目导出', 2004, 5, '#', '', 'F', '0', '1', 'cms:category:export', '#', 'admin', '2020-05-23 00:00:00', 'admin', '2020-05-23 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2033, '导航栏目详情', 2004, 6, '#', '', 'F', '0', '1', 'cms:category:detail', '#', 'admin', '2020-05-23 00:00:00', 'admin', '2020-05-23 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2047, '图片信息查询', 2007, 1, '#', '', 'F', '0', '1', 'cms:ads:list', '#', 'admin', '2020-05-23 00:00:00', 'admin', '2020-05-23 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2048, '图片信息新增', 2007, 2, '#', '', 'F', '0', '1', 'cms:ads:add', '#', 'admin', '2020-05-23 00:00:00', 'admin', '2020-05-23 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2049, '图片信息修改', 2007, 3, '#', '', 'F', '0', '1', 'cms:ads:edit', '#', 'admin', '2020-05-23 00:00:00', 'admin', '2020-05-23 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2050, '图片信息删除', 2007, 4, '#', '', 'F', '0', '1', 'cms:ads:remove', '#', 'admin', '2020-05-23 00:00:00', 'admin', '2020-05-23 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2051, '图片信息导出', 2007, 5, '#', '', 'F', '0', '1', 'cms:ads:export', '#', 'admin', '2020-05-23 00:00:00', 'admin', '2020-05-23 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2052, '图片信息详情', 2007, 6, '#', '', 'F', '0', '1', 'cms:ads:detail', '#', 'admin', '2020-05-23 00:00:00', 'admin', '2020-05-23 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2053, '图片位置', 2002, 9, '/cms/position', 'menuItem', 'C', '0', '1', 'cms:position:view', '#', 'admin', '2020-06-12 08:33:01', 'admin', '2020-11-25 09:18:59', '');
INSERT INTO `sys_menu` VALUES (2054, '图片位置查询', 2053, 1, '#', '', 'F', '0', '1', 'cms:position:list', '#', 'admin', '2020-05-23 00:00:00', 'admin', '2020-05-23 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2055, '图片位置新增', 2053, 2, '#', '', 'F', '0', '1', 'cms:position:add', '#', 'admin', '2020-05-23 00:00:00', 'admin', '2020-05-23 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2056, '图片位置修改', 2053, 3, '#', '', 'F', '0', '1', 'cms:position:edit', '#', 'admin', '2020-05-23 00:00:00', 'admin', '2020-05-23 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2057, '图片位置删除', 2053, 4, '#', '', 'F', '0', '1', 'cms:position:remove', '#', 'admin', '2020-05-23 00:00:00', 'admin', '2020-05-23 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2058, '图片位置导出', 2053, 5, '#', '', 'F', '0', '1', 'cms:position:export', '#', 'admin', '2020-05-23 00:00:00', 'admin', '2020-05-23 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2059, '广告位置详情', 2053, 6, '#', '', 'F', '0', '1', 'cms:position:detail', '#', 'admin', '2020-05-23 00:00:00', 'admin', '2020-05-23 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2060, '友情链接', 2002, 11, '/cms/link', 'menuItem', 'C', '0', '1', 'cms:link:view', '#', 'admin', '2020-05-23 00:00:00', 'admin', '2020-11-25 09:19:13', '友情链接菜单');
INSERT INTO `sys_menu` VALUES (2061, '友情链接查询', 2060, 1, '#', '', 'F', '0', '1', 'cms:link:list', '#', 'admin', '2020-05-23 00:00:00', 'admin', '2020-05-23 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2062, '友情链接新增', 2060, 2, '#', '', 'F', '0', '1', 'cms:link:add', '#', 'admin', '2020-05-23 00:00:00', 'admin', '2020-05-23 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2063, '友情链接修改', 2060, 3, '#', '', 'F', '0', '1', 'cms:link:edit', '#', 'admin', '2020-05-23 00:00:00', 'admin', '2020-05-23 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2064, '友情链接删除', 2060, 4, '#', '', 'F', '0', '1', 'cms:link:remove', '#', 'admin', '2020-05-23 00:00:00', 'admin', '2020-05-23 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2065, '友情链接导出', 2060, 5, '#', '', 'F', '0', '1', 'cms:link:export', '#', 'admin', '2020-05-23 00:00:00', 'admin', '2020-05-23 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2066, '友情链接详情', 2060, 6, '#', '', 'F', '0', '1', 'cms:link:detail', '#', 'admin', '2020-05-23 00:00:00', 'admin', '2020-05-23 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2068, '网站配置', 2002, 1, '/cms/config', 'menuItem', 'C', '0', '1', 'cms:config:view', '#', 'admin', '2020-11-24 08:35:12', 'admin', '2020-11-27 14:47:06', '');
INSERT INTO `sys_menu` VALUES (2069, '产品信息', 2002, 4, '/cms/product', 'menuItem', 'C', '0', '1', 'cms:product:view', '#', 'admin', '2020-11-24 08:37:47', 'admin', '2020-11-27 14:47:21', '');
INSERT INTO `sys_menu` VALUES (2070, '案例信息', 2002, 6, '/cms/case', 'menuItem', 'C', '0', '1', '', '#', 'admin', '2020-11-24 08:38:36', 'admin', '2020-11-24 14:36:01', '');
INSERT INTO `sys_menu` VALUES (2071, '新闻资讯', 2002, 5, '/cms/article', 'menuItem', 'C', '0', '1', '', '#', 'admin', '2020-11-24 08:39:47', 'admin', '2020-11-24 14:41:58', '');
INSERT INTO `sys_menu` VALUES (2072, '关于我们', 2002, 7, '/cms/about', 'menuItem', 'C', '0', '1', '', '#', 'admin', '2020-11-24 08:44:40', 'admin', '2020-11-27 14:07:57', '');
INSERT INTO `sys_menu` VALUES (2073, '在线留言', 2002, 8, '/cms/msg', 'menuItem', 'C', '0', '1', 'cms:msg:view', '#', 'admin', '2020-11-24 08:46:06', 'admin', '2020-11-27 14:46:53', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 新版本发布啦', '2', '新版本内容', '0', 'admin', '2021-06-17 10:57:47', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 系统凌晨维护', '1', '维护内容', '0', 'admin', '2021-06-17 10:57:47', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 390 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (236, '网站配置', 1, 'com.yanxiuhair.cms.controller.WebsiteConfigController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/config/add', '127.0.0.1', '内网IP', '{\"companyLogoUrl\":[\"/profile/upload/2021/07/07/60ea3095-d8c1-4fbe-8a1d-49e9b397df3b.png\"],\"weixinImg\":[\"/profile/upload/2021/07/07/b4742366-0aba-46b1-b132-95a47f92f2b2.jpg\"],\"northLatitude\":[\"113.826277\"],\"southLatitude\":[\"34.02827\"],\"companyName\":[\"许昌妍秀发制品有限公司\"],\"recordNo\":[\"豫ICP备2020035656号-1\"],\"tel\":[\"0374-888888\"],\"mobile\":[\"13288888888\"],\"qq\":[\"8888888888\"],\"weixin\":[\"8888888888\"],\"contactMan\":[\"妍秀\"],\"email\":[\"8888888888@qq.com\"],\"companyAddr\":[\"河南省许昌市魏都区许继大道\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 14:35:17');
INSERT INTO `sys_oper_log` VALUES (237, '网站配置', 2, 'com.yanxiuhair.cms.controller.WebsiteConfigController.importInitData()', 'POST', 1, 'admin', '研发部门', '/cms/config/importInitData', '127.0.0.1', '内网IP', '{\"websiteConfigId\":[\"14\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 14:35:23');
INSERT INTO `sys_oper_log` VALUES (238, '网站配置', 2, 'com.yanxiuhair.cms.controller.WebsiteConfigController.changeIsPublish()', 'POST', 1, 'admin', '研发部门', '/cms/config/changeIsPublish', '127.0.0.1', '内网IP', '{\"websiteConfigId\":[\"14\"],\"isPublish\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 14:35:27');
INSERT INTO `sys_oper_log` VALUES (239, '导航菜单', 2, 'com.yanxiuhair.cms.controller.NavController.changeIsPublish()', 'POST', 1, 'admin', '研发部门', '/cms/nav/changeIsPublish', '127.0.0.1', '内网IP', '{\"navId\":[\"149\"],\"isPublish\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 14:35:43');
INSERT INTO `sys_oper_log` VALUES (240, '导航菜单', 2, 'com.yanxiuhair.cms.controller.NavController.changeIsPublish()', 'POST', 1, 'admin', '研发部门', '/cms/nav/changeIsPublish', '127.0.0.1', '内网IP', '{\"navId\":[\"150\"],\"isPublish\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 14:35:44');
INSERT INTO `sys_oper_log` VALUES (241, '导航菜单', 2, 'com.yanxiuhair.cms.controller.NavController.changeIsPublish()', 'POST', 1, 'admin', '研发部门', '/cms/nav/changeIsPublish', '127.0.0.1', '内网IP', '{\"navId\":[\"151\"],\"isPublish\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 14:35:46');
INSERT INTO `sys_oper_log` VALUES (242, '导航菜单', 2, 'com.yanxiuhair.cms.controller.NavController.changeIsPublish()', 'POST', 1, 'admin', '研发部门', '/cms/nav/changeIsPublish', '127.0.0.1', '内网IP', '{\"navId\":[\"152\"],\"isPublish\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 14:35:48');
INSERT INTO `sys_oper_log` VALUES (243, '导航菜单', 2, 'com.yanxiuhair.cms.controller.NavController.changeIsPublish()', 'POST', 1, 'admin', '研发部门', '/cms/nav/changeIsPublish', '127.0.0.1', '内网IP', '{\"navId\":[\"153\"],\"isPublish\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 14:35:50');
INSERT INTO `sys_oper_log` VALUES (244, '导航菜单', 2, 'com.yanxiuhair.cms.controller.NavController.changeIsPublish()', 'POST', 1, 'admin', '研发部门', '/cms/nav/changeIsPublish', '127.0.0.1', '内网IP', '{\"navId\":[\"154\"],\"isPublish\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 14:35:51');
INSERT INTO `sys_oper_log` VALUES (245, '关于我们', 1, 'com.yanxiuhair.cms.controller.AboutController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/about/add', '127.0.0.1', '内网IP', '{\"contentInfo\":[\"<p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">广州市某某智能水表有限公司,是一家由广州市科技局认定为民营科技创新企业,是国内最早致力于远程抄表系统产品的研发、生产、销售、工程安装和售后服务为一体，为客户提供一步到位的能源自动化、信息化管理，节约和治理能源浪费解决方案的高新技术企业。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\"><img alt=\\\"\\\" src=\\\"http://www.jrhsz.com/43413/uploads/201711/5a17774ccb999.jpg\\\" style=\\\"margin: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); border-width: initial; border-style: none; max-width: 100%;\\\"></p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">公司主要在从事各种表计（水、电、气、暖等）的远程抄表系统、工业自动控制系统、楼宇智能化系统和微波通信系统的开发、生产和工程安装，具有对普通水、气表改装成带有多种信号输出功能的资格和能力。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">公司一直秉承创新、发展为理念，优化结构为基础，技术创新为动力。十几年来，公司在全国范围内与多个城市的能源部门保持着长期的合作关系，携手万科集团、中海地产、华侨城地产、雅居乐集团、碧桂园集团、合生创展集团、天健集团等为战略合作伙伴，同时为改造和提升中国城市公用事业传统流量计量表具智能化水平和管理信息化水表，贡献着我们的一份力量。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">公司始终坚持“立足广东、以点带面，辐射全国、走出国门”的市场战略方针，立志将最先进的技术，最成熟的产品，最规范的工程和最优质的售后服务提供给客户，实现客户、企业、社会多赢的目标。</p>\"],\"companyDesc\":[\"广州市某某智能水表有限公司,是一家由广州市科技局认定为民营科技创新企业,是国内最早致力于远程抄表系统产品的研发、生产、销售、工程安装和售后服务为一体，为客户提供一步到位的能源自动化、信息化管理，节约和治理能源浪费解决方案的高新技术企业。 公司主要在从事各种表计（水、电、气、暖等）的远程抄表系统、工业自动控制系统、楼宇智能化系统和微波通信系统的开发、生产和工程安装，具有对普通水、气表改装成带有多种信号输出功能的资格和能力。 公司一直秉承创新、发', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 14:41:56');
INSERT INTO `sys_oper_log` VALUES (246, '关于我们', 2, 'com.yanxiuhair.cms.controller.AboutController.changeIsPublish()', 'POST', 1, 'admin', '研发部门', '/cms/about/changeIsPublish', '127.0.0.1', '内网IP', '{\"aboutId\":[\"107\"],\"isPublish\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 14:42:01');
INSERT INTO `sys_oper_log` VALUES (247, '图片位置信息', 2, 'com.yanxiuhair.cms.controller.AdsPositionController.editSave()', 'POST', 1, 'admin', '研发部门', '/cms/position/edit', '127.0.0.1', '内网IP', '{\"positionId\":[\"17\"],\"navCode\":[\"contact_us\"],\"deviceType\":[\"pc\"],\"positionCode\":[\"pc_contact_us\"],\"positionName\":[\"电脑端联系我们banner\"],\"width\":[\"1912\"],\"height\":[\"600\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 14:43:44');
INSERT INTO `sys_oper_log` VALUES (248, '图片位置信息', 2, 'com.yanxiuhair.cms.controller.AdsPositionController.editSave()', 'POST', 1, 'admin', '研发部门', '/cms/position/edit', '127.0.0.1', '内网IP', '{\"positionId\":[\"18\"],\"navCode\":[\"contact_us\"],\"deviceType\":[\"mobile\"],\"positionCode\":[\"mobile_contact_us\"],\"positionName\":[\"移动端联系我们banner\"],\"width\":[\"367\"],\"height\":[\"172\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 14:43:55');
INSERT INTO `sys_oper_log` VALUES (249, '图片信息', 1, 'com.yanxiuhair.cms.controller.AdsController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/ads/add', '127.0.0.1', '内网IP', '{\"pathAddr\":[\"/profile/upload/2021/07/07/96f314d0-51d9-4139-ae01-5c11957fa316.jpg\"],\"width\":[\"100\"],\"height\":[\"200\"],\"navCode\":[\"index\"],\"positionCode\":[\"pc_index\"],\"target\":[\"_self\"],\"adSort\":[\"1\"],\"adName\":[\"banner\"],\"url\":[\"\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 14:46:56');
INSERT INTO `sys_oper_log` VALUES (250, '图片信息', 2, 'com.yanxiuhair.cms.controller.AdsController.changeIsPublish()', 'POST', 1, 'admin', '研发部门', '/cms/ads/changeIsPublish', '127.0.0.1', '内网IP', '{\"adId\":[\"162\"],\"isPublish\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 14:46:59');
INSERT INTO `sys_oper_log` VALUES (251, '参数管理', 2, 'com.yanxiuhair.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/config/edit', '127.0.0.1', '内网IP', '{\"configId\":[\"102\"],\"configName\":[\"栏目代码\"],\"configKey\":[\"cms.cateCode\"],\"configValue\":[\"ca10000\"],\"configType\":[\"Y\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 14:49:17');
INSERT INTO `sys_oper_log` VALUES (252, '参数管理', 2, 'com.yanxiuhair.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/config/edit', '127.0.0.1', '内网IP', '{\"configId\":[\"101\"],\"configName\":[\"导航代码\"],\"configKey\":[\"cms.navCode\"],\"configValue\":[\"na10000\"],\"configType\":[\"Y\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 14:49:27');
INSERT INTO `sys_oper_log` VALUES (253, '参数管理', 2, 'com.yanxiuhair.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/config/edit', '127.0.0.1', '内网IP', '{\"configId\":[\"103\"],\"configName\":[\"内容代码\"],\"configKey\":[\"cms.contgCode\"],\"configValue\":[\"co10000\"],\"configType\":[\"Y\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 14:49:33');
INSERT INTO `sys_oper_log` VALUES (254, '导航栏目', 1, 'com.yanxiuhair.cms.controller.CategoryController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/category/add', '127.0.0.1', '内网IP', '{\"navCode\":[\"product\"],\"categoryCode\":[\"ca10001\"],\"categoryName\":[\"预付费水表\"],\"categoryType\":[\"product\"],\"categorySort\":[\"1\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 14:49:47');
INSERT INTO `sys_oper_log` VALUES (255, '导航栏目', 2, 'com.yanxiuhair.cms.controller.CategoryController.changeIsPublish()', 'POST', 1, 'admin', '研发部门', '/cms/category/changeIsPublish', '127.0.0.1', '内网IP', '{\"categoryId\":[\"154\"],\"isPublish\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 14:49:50');
INSERT INTO `sys_oper_log` VALUES (256, '导航栏目', 1, 'com.yanxiuhair.cms.controller.CategoryController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/category/add', '127.0.0.1', '内网IP', '{\"navCode\":[\"product\"],\"categoryCode\":[\"ca10002\"],\"categoryName\":[\"远传水表\"],\"categoryType\":[\"product\"],\"categorySort\":[\"2\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 14:50:03');
INSERT INTO `sys_oper_log` VALUES (257, '导航栏目', 2, 'com.yanxiuhair.cms.controller.CategoryController.changeIsPublish()', 'POST', 1, 'admin', '研发部门', '/cms/category/changeIsPublish', '127.0.0.1', '内网IP', '{\"categoryId\":[\"155\"],\"isPublish\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 14:50:06');
INSERT INTO `sys_oper_log` VALUES (258, '导航栏目', 1, 'com.yanxiuhair.cms.controller.CategoryController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/category/add', '127.0.0.1', '内网IP', '{\"navCode\":[\"product\"],\"categoryCode\":[\"ca10003\"],\"categoryName\":[\"旋翼式水表\"],\"categoryType\":[\"product\"],\"categorySort\":[\"3\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 14:50:17');
INSERT INTO `sys_oper_log` VALUES (259, '导航栏目', 2, 'com.yanxiuhair.cms.controller.CategoryController.changeIsPublish()', 'POST', 1, 'admin', '研发部门', '/cms/category/changeIsPublish', '127.0.0.1', '内网IP', '{\"categoryId\":[\"156\"],\"isPublish\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 14:50:20');
INSERT INTO `sys_oper_log` VALUES (260, '导航栏目', 1, 'com.yanxiuhair.cms.controller.CategoryController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/category/add', '127.0.0.1', '内网IP', '{\"navCode\":[\"product\"],\"categoryCode\":[\"ca10004\"],\"categoryName\":[\"单流束水表\"],\"categoryType\":[\"product\"],\"categorySort\":[\"4\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 14:50:35');
INSERT INTO `sys_oper_log` VALUES (261, '导航栏目', 2, 'com.yanxiuhair.cms.controller.CategoryController.changeIsPublish()', 'POST', 1, 'admin', '研发部门', '/cms/category/changeIsPublish', '127.0.0.1', '内网IP', '{\"categoryId\":[\"157\"],\"isPublish\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 14:50:37');
INSERT INTO `sys_oper_log` VALUES (262, '导航栏目', 1, 'com.yanxiuhair.cms.controller.CategoryController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/category/add', '127.0.0.1', '内网IP', '{\"navCode\":[\"product\"],\"categoryCode\":[\"ca10005\"],\"categoryName\":[\"流量计\"],\"categoryType\":[\"product\"],\"categorySort\":[\"5\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 14:50:50');
INSERT INTO `sys_oper_log` VALUES (263, '导航栏目', 2, 'com.yanxiuhair.cms.controller.CategoryController.changeIsPublish()', 'POST', 1, 'admin', '研发部门', '/cms/category/changeIsPublish', '127.0.0.1', '内网IP', '{\"categoryId\":[\"158\"],\"isPublish\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 14:50:53');
INSERT INTO `sys_oper_log` VALUES (264, '导航栏目', 1, 'com.yanxiuhair.cms.controller.CategoryController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/category/add', '127.0.0.1', '内网IP', '{\"navCode\":[\"product\"],\"categoryCode\":[\"ca10006\"],\"categoryName\":[\"数据采集设备\"],\"categoryType\":[\"product\"],\"categorySort\":[\"6\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 14:51:05');
INSERT INTO `sys_oper_log` VALUES (265, '导航栏目', 2, 'com.yanxiuhair.cms.controller.CategoryController.changeIsPublish()', 'POST', 1, 'admin', '研发部门', '/cms/category/changeIsPublish', '127.0.0.1', '内网IP', '{\"categoryId\":[\"159\"],\"isPublish\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 14:51:07');
INSERT INTO `sys_oper_log` VALUES (266, '导航栏目', 1, 'com.yanxiuhair.cms.controller.CategoryController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/category/add', '127.0.0.1', '内网IP', '{\"navCode\":[\"product\"],\"categoryCode\":[\"ca10007\"],\"categoryName\":[\"多流束水表\"],\"categoryType\":[\"product\"],\"categorySort\":[\"7\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 14:51:18');
INSERT INTO `sys_oper_log` VALUES (267, '导航栏目', 2, 'com.yanxiuhair.cms.controller.CategoryController.changeIsPublish()', 'POST', 1, 'admin', '研发部门', '/cms/category/changeIsPublish', '127.0.0.1', '内网IP', '{\"categoryId\":[\"160\"],\"isPublish\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 14:51:21');
INSERT INTO `sys_oper_log` VALUES (268, '导航栏目', 1, 'com.yanxiuhair.cms.controller.CategoryController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/category/add', '127.0.0.1', '内网IP', '{\"navCode\":[\"product\"],\"categoryCode\":[\"ca10008\"],\"categoryName\":[\"螺翼式水表\"],\"categoryType\":[\"product\"],\"categorySort\":[\"8\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 14:51:32');
INSERT INTO `sys_oper_log` VALUES (269, '导航栏目', 2, 'com.yanxiuhair.cms.controller.CategoryController.changeIsPublish()', 'POST', 1, 'admin', '研发部门', '/cms/category/changeIsPublish', '127.0.0.1', '内网IP', '{\"categoryId\":[\"161\"],\"isPublish\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 14:51:34');
INSERT INTO `sys_oper_log` VALUES (270, '导航栏目', 1, 'com.yanxiuhair.cms.controller.CategoryController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/category/add', '127.0.0.1', '内网IP', '{\"navCode\":[\"product\"],\"categoryCode\":[\"ca10009\"],\"categoryName\":[\"滤水器\"],\"categoryType\":[\"product\"],\"categorySort\":[\"9\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 14:51:45');
INSERT INTO `sys_oper_log` VALUES (271, '导航栏目', 2, 'com.yanxiuhair.cms.controller.CategoryController.changeIsPublish()', 'POST', 1, 'admin', '研发部门', '/cms/category/changeIsPublish', '127.0.0.1', '内网IP', '{\"categoryId\":[\"162\"],\"isPublish\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 14:51:47');
INSERT INTO `sys_oper_log` VALUES (272, '导航栏目', 1, 'com.yanxiuhair.cms.controller.CategoryController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/category/add', '127.0.0.1', '内网IP', '{\"navCode\":[\"news\"],\"categoryCode\":[\"ca10010\"],\"categoryName\":[\"技术文献\"],\"categoryType\":[\"news\"],\"categorySort\":[\"1\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 14:52:13');
INSERT INTO `sys_oper_log` VALUES (273, '导航栏目', 2, 'com.yanxiuhair.cms.controller.CategoryController.changeIsPublish()', 'POST', 1, 'admin', '研发部门', '/cms/category/changeIsPublish', '127.0.0.1', '内网IP', '{\"categoryId\":[\"163\"],\"isPublish\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 14:52:16');
INSERT INTO `sys_oper_log` VALUES (274, '导航栏目', 1, 'com.yanxiuhair.cms.controller.CategoryController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/category/add', '127.0.0.1', '内网IP', '{\"navCode\":[\"product\"],\"categoryCode\":[\"ca10011\"],\"categoryName\":[\"产品知识\"],\"categoryType\":[\"product\"],\"categorySort\":[\"2\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 14:52:34');
INSERT INTO `sys_oper_log` VALUES (275, '导航栏目', 2, 'com.yanxiuhair.cms.controller.CategoryController.changeIsPublish()', 'POST', 1, 'admin', '研发部门', '/cms/category/changeIsPublish', '127.0.0.1', '内网IP', '{\"categoryId\":[\"164\"],\"isPublish\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 14:54:07');
INSERT INTO `sys_oper_log` VALUES (276, '导航栏目', 1, 'com.yanxiuhair.cms.controller.CategoryController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/category/add', '127.0.0.1', '内网IP', '{\"navCode\":[\"case\"],\"categoryCode\":[\"ca10012\"],\"categoryName\":[\"远传水表\"],\"categoryType\":[\"case\"],\"categorySort\":[\"1\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 14:55:26');
INSERT INTO `sys_oper_log` VALUES (277, '导航栏目', 2, 'com.yanxiuhair.cms.controller.CategoryController.changeIsPublish()', 'POST', 1, 'admin', '研发部门', '/cms/category/changeIsPublish', '127.0.0.1', '内网IP', '{\"categoryId\":[\"165\"],\"isPublish\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 14:55:28');
INSERT INTO `sys_oper_log` VALUES (278, '导航栏目', 1, 'com.yanxiuhair.cms.controller.CategoryController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/category/add', '127.0.0.1', '内网IP', '{\"navCode\":[\"case\"],\"categoryCode\":[\"ca10013\"],\"categoryName\":[\"旋翼式水表\"],\"categoryType\":[\"case\"],\"categorySort\":[\"2\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 14:55:48');
INSERT INTO `sys_oper_log` VALUES (279, '导航栏目', 2, 'com.yanxiuhair.cms.controller.CategoryController.changeIsPublish()', 'POST', 1, 'admin', '研发部门', '/cms/category/changeIsPublish', '127.0.0.1', '内网IP', '{\"categoryId\":[\"166\"],\"isPublish\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 14:55:51');
INSERT INTO `sys_oper_log` VALUES (280, '产品管理', 1, 'com.yanxiuhair.cms.controller.ProductController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/product/add', '127.0.0.1', '内网IP', '{\"frontImgUrl\":[\"/profile/upload/2021/07/07/d0a80981-4c80-4612-b3d2-787ef7035a6c.jpg\"],\"productImgUrlJSONArray\":[\"[{\\\"productImgUrl\\\":\\\"/profile/upload/2021/07/07/22ebccb6-a321-4dfb-b537-6aa0681e7f8d.jpg\\\"},{\\\"productImgUrl\\\":\\\"/profile/upload/2021/07/07/86a27953-0b19-4312-abcd-6217e4538dd4.jpg\\\"}]\"],\"contentInfo\":[\"<p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">远距离水表在市场上应用广泛，具有方便快捷的功能。这是电力消费生活中的一大进步。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　众所周知，普通的冷水和热水表已经被现代快速家庭生活所淘汰。现在，远程水表越来越复杂，基于普通的和更加机械化的冷热水表，结合远程传输系统。它不仅可以清楚地记录交通，而且可以计算最小和最大交通量。它仍能在高压下正常运转。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　随着社会的发展和科学技术的进步，远程水表也在不断地改进，增加了许多技术手段以方便计算机控制。智能远程传输水表现在越来越受到企业和用户的欢迎和信赖。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　增加电子采集模块是智能远传水表的特点。电子采集模块的引入，使水表的应用时代发生了革命性的变化，使得所有的数据都能够网络化和系统化。电子模块完成信号采集、数据处理等处理项目，然后将数据存储在电子线路上至中继器或手动抄表器。远程水表的设计属于集成化，在其内部有一个智能芯片，可以记录最新的传输记录，真正实现智能化。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　远程水表在原有的基础上增加刷卡预付功能，一米多功能，用户方便，是广大居民用户的首选，也是管理部门的依赖，可以远程监控。NG也可以预先支付水费，一次获得更多，这个水表得到支持。相信在不久的将来，智能远程传输水表将在市场上推出。</p>\"],\"categoryCode\":[\"ca10001\"],\"productSort\":[\"1\"],\"isTop\":[\"1\"],\"keyWords\":[\"\"],\"productTitle\":[\"产品中心标题一\"],\"productDesc\":[\"远距离水表在市场上应用广泛，具有方便快', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 15:01:51');
INSERT INTO `sys_oper_log` VALUES (281, '产品管理', 2, 'com.yanxiuhair.cms.controller.ProductController.changeIsPublish()', 'POST', 1, 'admin', '研发部门', '/cms/product/changeIsPublish', '127.0.0.1', '内网IP', '{\"productId\":[\"91\"],\"isPublish\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 15:01:53');
INSERT INTO `sys_oper_log` VALUES (282, '产品管理', 2, 'com.yanxiuhair.cms.controller.ProductController.editSave()', 'POST', 1, 'admin', '研发部门', '/cms/product/edit', '127.0.0.1', '内网IP', '{\"productId\":[\"91\"],\"frontImgUrl\":[\"/profile/upload/2021/07/07/d0a80981-4c80-4612-b3d2-787ef7035a6c.jpg\"],\"productImgUrlJSONArray\":[\"[{\\\"productImgUrl\\\":\\\"/profile/upload/2021/07/07/22ebccb6-a321-4dfb-b537-6aa0681e7f8d.jpg\\\"},{\\\"productImgUrl\\\":\\\"/profile/upload/2021/07/07/86a27953-0b19-4312-abcd-6217e4538dd4.jpg\\\"}]\"],\"contentInfo\":[\"<p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">远距离水表在市场上应用广泛，具有方便快捷的功能。这是电力消费生活中的一大进步。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　众所周知，普通的冷水和热水表已经被现代快速家庭生活所淘汰。现在，远程水表越来越复杂，基于普通的和更加机械化的冷热水表，结合远程传输系统。它不仅可以清楚地记录交通，而且可以计算最小和最大交通量。它仍能在高压下正常运转。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　随着社会的发展和科学技术的进步，远程水表也在不断地改进，增加了许多技术手段以方便计算机控制。智能远程传输水表现在越来越受到企业和用户的欢迎和信赖。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　增加电子采集模块是智能远传水表的特点。电子采集模块的引入，使水表的应用时代发生了革命性的变化，使得所有的数据都能够网络化和系统化。电子模块完成信号采集、数据处理等处理项目，然后将数据存储在电子线路上至中继器或手动抄表器。远程水表的设计属于集成化，在其内部有一个智能芯片，可以记录最新的传输记录，真正实现智能化。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　远程水表在原有的基础上增加刷卡预付功能，一米多功能，用户方便，是广大居民用户的首选，也是管理部门的依赖，可以远程监控。NG也可以预先支付水费，一次获得更多，这个水表得到支持。相信在不久的将来，智能远程传输水表将在市场上推出。</p>\"],\"categoryCode\":[\"ca10001\"],\"productSort\":[\"1\"],\"isTop\":[\"1\"],\"keyWords\":[\"\"],\"productTitle\":[\"产品中心标题一\"],\"productDesc\":[\"', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 15:02:32');
INSERT INTO `sys_oper_log` VALUES (283, '产品管理', 2, 'com.yanxiuhair.cms.controller.ProductController.editSave()', 'POST', 1, 'admin', '研发部门', '/cms/product/edit', '127.0.0.1', '内网IP', '{\"productId\":[\"91\"],\"frontImgUrl\":[\"/profile/upload/2021/07/07/d0a80981-4c80-4612-b3d2-787ef7035a6c.jpg\"],\"productImgUrlJSONArray\":[\"[{\\\"productImgUrl\\\":\\\"/profile/upload/2021/07/07/22ebccb6-a321-4dfb-b537-6aa0681e7f8d.jpg\\\"},{\\\"productImgUrl\\\":\\\"/profile/upload/2021/07/07/86a27953-0b19-4312-abcd-6217e4538dd4.jpg\\\"}]\"],\"contentInfo\":[\"<p><div class=\\\"tags\\\" style=\\\"margin: 0px 0px 20px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); overflow: hidden; color: rgb(0, 0, 0); font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\\\"></div></p><div class=\\\"danye\\\" style=\\\"margin: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); font-size: 15px; line-height: 28px; color: rgb(67, 67, 67); text-align: justify; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\\\"><p style=\\\"margin: 0px 0px 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0);\\\">远距离水表在市场上应用广泛，具有方便快捷的功能。这是电力消费生活中的一大进步。</p><p style=\\\"margin: 0px 0px 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0);\\\">　　众所周知，普通的冷水和热水表已经被现代快速家庭生活所淘汰。现在，远程水表越来越复杂，基于普通的和更加机械化的冷热水', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 15:04:39');
INSERT INTO `sys_oper_log` VALUES (284, '产品管理', 2, 'com.yanxiuhair.cms.controller.ProductController.editSave()', 'POST', 1, 'admin', '研发部门', '/cms/product/edit', '127.0.0.1', '内网IP', '{\"productId\":[\"91\"],\"frontImgUrl\":[\"/profile/upload/2021/07/07/d0a80981-4c80-4612-b3d2-787ef7035a6c.jpg\"],\"productImgUrlJSONArray\":[\"[{\\\"productImgUrl\\\":\\\"/profile/upload/2021/07/07/22ebccb6-a321-4dfb-b537-6aa0681e7f8d.jpg\\\"},{\\\"productImgUrl\\\":\\\"/profile/upload/2021/07/07/86a27953-0b19-4312-abcd-6217e4538dd4.jpg\\\"}]\"],\"contentInfo\":[\"<p>远距离水表在市场上应用广泛，具有方便快捷的功能。这是电力消费生活中的一大进步。　　</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;众所周知，普通的冷水和热水表已经被现代快速家庭生活所淘汰。现在，远程水表越来越复杂，基于普通的和更加机械化的冷热水表，</p><p>结合远程传输系统。它不仅可以清楚地记录交通，而且可以计算最小和最大交通量。它仍能在高压下正常运转。　　</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;随着社会的发展和科学技术的进步，远程水表也在不断地改进，增加了许多技术手段以方便计算机控制。智能远程传输水表现在越来越受到企业和用户的欢迎和信赖。　　</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;增加电子采集模块是智能远传水表的特点。电子采集模块的引入，使水表的应用时代发生了革命性的变化，使得所有的数据都能够网络化和系统化。电子模块完成信号采集、数据处理等处理项目，然后将数据存储在电子线路上至中继器或手动抄表器。远程水表的设计属于集成化，在其内部有一个智能芯片，可以记录最新的传输记录，真正实现智能化。　　</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;远程水表在原有的基础上增加刷卡预付功能，一米多功能，用户方便，是广大居民用户的首选，也是管理部门的依赖，可以远程监控。NG也可以预先支付水费，一次获得更多，这个水表得到支持。相信在不久的将来，智能远程传输水表将在市场上推出。</p>\"],\"categoryCode\":[\"ca10001\"],\"productSort\":[\"1\"],\"isTop\":[\"1\"],\"keyWords\":[\"\"],\"productTitle\":[\"产品中心标题一\"],\"productDesc\":[\"远距离水表在市场上应用广泛，具有方便快捷的功能。这是电力消费生活中的一大进步。 众所周知，普通的冷水和热水表已经被现代快速家庭生活所淘汰。现在，远程水表越来越复杂，...\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 15:06:07');
INSERT INTO `sys_oper_log` VALUES (285, '产品管理', 2, 'com.yanxiuhair.cms.controller.ProductController.editSave()', 'POST', 1, 'admin', '研发部门', '/cms/product/edit', '127.0.0.1', '内网IP', '{\"productId\":[\"91\"],\"frontImgUrl\":[\"/profile/upload/2021/07/07/d0a80981-4c80-4612-b3d2-787ef7035a6c.jpg\"],\"productImgUrlJSONArray\":[\"[{\\\"productImgUrl\\\":\\\"/profile/upload/2021/07/07/22ebccb6-a321-4dfb-b537-6aa0681e7f8d.jpg\\\"},{\\\"productImgUrl\\\":\\\"/profile/upload/2021/07/07/86a27953-0b19-4312-abcd-6217e4538dd4.jpg\\\"}]\"],\"contentInfo\":[\"<p>远距离水表在市场上应用广泛，具有方便快捷的功能。这是电力消费生活中的一大进步。　　&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><p>众所周知，普通的冷水和热水表已经被现代快速家庭生活所淘汰。现在，远程水表越来越复杂，基于普通的和更加机械化的冷热水表，结合远程传输系统。它不仅可以清楚地记录交通，而且可以计算最小和最大交通量。它仍能在高压下正常运转。　　&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;随着社会的发展和科学技术的进步，远程水表也在不断地改进，增加了许多技术手段以方便计算机控制。智能远程传输水表现在越来越受到企业和用户的欢迎和信赖。　　&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;增加电子采集模块是智能远传水表的特点。电子采集模块的引入，使水表的应用时代发生了革命性的变化，使得所有的数据都能够网络化和系统化。电子模块完成信号采集、数据处理等处理项目，然后将数据存储在电子线路上至中继器或手动抄表器。远程水表的设计属于集成化，在其内部有一个智能芯片，可以记录最新的传输记录，真正实现智能化。　　&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;远程水表在原有的基础上增加刷卡预付功能，一米多功能，用户方便，是广大居民用户的首选，也是管理部门的依赖，可以远程监控。NG也可以预先支付水费，一次获得更多，这个水表得到支持。相信在不久的将来，智能远程传输水表将在市场上推出。</p>\"],\"categoryCode\":[\"ca10001\"],\"productSort\":[\"1\"],\"isTop\":[\"1\"],\"keyWords\":[\"\"],\"productTitle\":[\"产品中心标题一\"],\"productDesc\":[\"远距离水表在市场上应用广泛，具有方便快捷的功能。这是电力消费生活中的一大进步。 众所周知，普通的冷水和热水表已经被现代快速家庭生活所淘汰。现在，远程水表越来越复杂，...\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 15:06:39');
INSERT INTO `sys_oper_log` VALUES (286, '产品管理', 2, 'com.yanxiuhair.cms.controller.ProductController.editSave()', 'POST', 1, 'admin', '研发部门', '/cms/product/edit', '127.0.0.1', '内网IP', '{\"productId\":[\"91\"],\"frontImgUrl\":[\"/profile/upload/2021/07/07/d0a80981-4c80-4612-b3d2-787ef7035a6c.jpg\"],\"productImgUrlJSONArray\":[\"[{\\\"productImgUrl\\\":\\\"/profile/upload/2021/07/07/22ebccb6-a321-4dfb-b537-6aa0681e7f8d.jpg\\\"},{\\\"productImgUrl\\\":\\\"/profile/upload/2021/07/07/86a27953-0b19-4312-abcd-6217e4538dd4.jpg\\\"}]\"],\"contentInfo\":[\"<p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">远距离水表在市场上应用广泛，具有方便快捷的功能。这是电力消费生活中的一大进步。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　众所周知，普通的冷水和热水表已经被现代快速家庭生活所淘汰。现在，远程水表越来越复杂，基于普通的和更加机械化的冷热水表，结合远程传输系统。它不仅可以清楚地记录交通，而且可以计算最小和最大交通量。它仍能在高压下正常运转。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　随着社会的发展和科学技术的进步，远程水表也在不断地改进，增加了许多技术手段以方便计算机控制。智能远程传输水表现在越来越受到企业和用户的欢迎和信赖。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　增加电子采集模块是智能远传水表的特点。电子采集模块的引入，使水表的应用时代发生了革命性的变化，使得所有的数据都能够网络化和系统化。电子模块完成信号采集、数据处理等处理项目，然后将数据存储在电子线路上至中继器或手动抄表器。远程水表的设计属于集成化，在其内部有一个智能芯片，可以记录最新的传输记录，真正实现智能化。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　远程水表在原有的基础上增加刷卡预付功能，一米多功能，用户方便，是广大居民用户的首选，也是管理部门的依赖，可以远程监控。NG也可以预先支付水费，一次获得更多，这个水表得到支持。相信在不久的将来，智能远程传输水表将在市场上推出。</p>\"],\"categoryCode\":[\"ca10001\"],\"productSort\":[\"1\"],\"isTop\":[\"1\"],\"keyWords\":[\"\"],\"productTitle\":[\"产品中心标题一\"],\"productDesc\":[\"', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 15:09:42');
INSERT INTO `sys_oper_log` VALUES (287, '产品管理', 1, 'com.yanxiuhair.cms.controller.ProductController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/product/add', '127.0.0.1', '内网IP', '{\"frontImgUrl\":[\"/profile/upload/2021/07/07/0ba780de-e08f-4ee9-9f9c-c8de37acc03a.jpg\"],\"productImgUrlJSONArray\":[\"[{\\\"productImgUrl\\\":\\\"/profile/upload/2021/07/07/38070186-dca7-41d9-a5cd-081c66c8e57f.jpg\\\"},{\\\"productImgUrl\\\":\\\"/profile/upload/2021/07/07/074e38d4-25de-4537-93d1-52689b2ac17f.jpg\\\"}]\"],\"contentInfo\":[\"<p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">远距离水表在市场上应用广泛，具有方便快捷的功能。这是电力消费生活中的一大进步。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　众所周知，普通的冷水和热水表已经被现代快速家庭生活所淘汰。现在，远程水表越来越复杂，基于普通的和更加机械化的冷热水表，结合远程传输系统。它不仅可以清楚地记录交通，而且可以计算最小和最大交通量。它仍能在高压下正常运转。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　随着社会的发展和科学技术的进步，远程水表也在不断地改进，增加了许多技术手段以方便计算机控制。智能远程传输水表现在越来越受到企业和用户的欢迎和信赖。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　增加电子采集模块是智能远传水表的特点。电子采集模块的引入，使水表的应用时代发生了革命性的变化，使得所有的数据都能够网络化和系统化。电子模块完成信号采集、数据处理等处理项目，然后将数据存储在电子线路上至中继器或手动抄表器。远程水表的设计属于集成化，在其内部有一个智能芯片，可以记录最新的传输记录，真正实现智能化。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　远程水表在原有的基础上增加刷卡预付功能，一米多功能，用户方便，是广大居民用户的首选，也是管理部门的依赖，可以远程监控。NG也可以预先支付水费，一次获得更多，这个水表得到支持。相信在不久的将来，智能远程传输水表将在市场上推出。</p>\"],\"categoryCode\":[\"ca10001\"],\"productSort\":[\"2\"],\"isTop\":[\"1\"],\"keyWords\":[\"\"],\"productTitle\":[\"产品中心标题二\"],\"productDesc\":[\"远距离水表在市场上应用广泛，具有方便快', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 15:14:02');
INSERT INTO `sys_oper_log` VALUES (288, '产品管理', 2, 'com.yanxiuhair.cms.controller.ProductController.changeIsPublish()', 'POST', 1, 'admin', '研发部门', '/cms/product/changeIsPublish', '127.0.0.1', '内网IP', '{\"productId\":[\"92\"],\"isPublish\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 15:18:09');
INSERT INTO `sys_oper_log` VALUES (289, '产品管理', 1, 'com.yanxiuhair.cms.controller.ProductController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/product/add', '127.0.0.1', '内网IP', '{\"frontImgUrl\":[\"/profile/upload/2021/07/07/fec72666-ac99-41da-ba40-3b313bef2c0c.jpg\"],\"productImgUrlJSONArray\":[\"[{\\\"productImgUrl\\\":\\\"/profile/upload/2021/07/07/c2fcbed8-3a42-46b8-9df6-c7e61189e467.jpg\\\"},{\\\"productImgUrl\\\":\\\"/profile/upload/2021/07/07/3176aff3-303a-448f-aaf8-baf21f73f581.jpg\\\"}]\"],\"contentInfo\":[\"<p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">远距离水表在市场上应用广泛，具有方便快捷的功能。这是电力消费生活中的一大进步。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　众所周知，普通的冷水和热水表已经被现代快速家庭生活所淘汰。现在，远程水表越来越复杂，基于普通的和更加机械化的冷热水表，结合远程传输系统。它不仅可以清楚地记录交通，而且可以计算最小和最大交通量。它仍能在高压下正常运转。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　随着社会的发展和科学技术的进步，远程水表也在不断地改进，增加了许多技术手段以方便计算机控制。智能远程传输水表现在越来越受到企业和用户的欢迎和信赖。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　增加电子采集模块是智能远传水表的特点。电子采集模块的引入，使水表的应用时代发生了革命性的变化，使得所有的数据都能够网络化和系统化。电子模块完成信号采集、数据处理等处理项目，然后将数据存储在电子线路上至中继器或手动抄表器。远程水表的设计属于集成化，在其内部有一个智能芯片，可以记录最新的传输记录，真正实现智能化。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　远程水表在原有的基础上增加刷卡预付功能，一米多功能，用户方便，是广大居民用户的首选，也是管理部门的依赖，可以远程监控。NG也可以预先支付水费，一次获得更多，这个水表得到支持。相信在不久的将来，智能远程传输水表将在市场上推出。</p>\"],\"categoryCode\":[\"ca10001\"],\"productSort\":[\"1\"],\"isTop\":[\"1\"],\"keyWords\":[\"\"],\"productTitle\":[\"产品中心标题三\"],\"productDesc\":[\"远距离水表在市场上应用广泛，具有方便快', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 15:30:57');
INSERT INTO `sys_oper_log` VALUES (290, '产品管理', 2, 'com.yanxiuhair.cms.controller.ProductController.changeIsPublish()', 'POST', 1, 'admin', '研发部门', '/cms/product/changeIsPublish', '127.0.0.1', '内网IP', '{\"productId\":[\"93\"],\"isPublish\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 15:31:04');
INSERT INTO `sys_oper_log` VALUES (291, '产品管理', 2, 'com.yanxiuhair.cms.controller.ProductController.editSave()', 'POST', 1, 'admin', '研发部门', '/cms/product/edit', '127.0.0.1', '内网IP', '{\"productId\":[\"93\"],\"frontImgUrl\":[\"/profile/upload/2021/07/07/fec72666-ac99-41da-ba40-3b313bef2c0c.jpg\"],\"productImgUrlJSONArray\":[\"[{\\\"productImgUrl\\\":\\\"/profile/upload/2021/07/07/c2fcbed8-3a42-46b8-9df6-c7e61189e467.jpg\\\"},{\\\"productImgUrl\\\":\\\"/profile/upload/2021/07/07/3176aff3-303a-448f-aaf8-baf21f73f581.jpg\\\"}]\"],\"contentInfo\":[\"<p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">远距离水表在市场上应用广泛，具有方便快捷的功能。这是电力消费生活中的一大进步。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　众所周知，普通的冷水和热水表已经被现代快速家庭生活所淘汰。现在，远程水表越来越复杂，基于普通的和更加机械化的冷热水表，结合远程传输系统。它不仅可以清楚地记录交通，而且可以计算最小和最大交通量。它仍能在高压下正常运转。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　随着社会的发展和科学技术的进步，远程水表也在不断地改进，增加了许多技术手段以方便计算机控制。智能远程传输水表现在越来越受到企业和用户的欢迎和信赖。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　增加电子采集模块是智能远传水表的特点。电子采集模块的引入，使水表的应用时代发生了革命性的变化，使得所有的数据都能够网络化和系统化。电子模块完成信号采集、数据处理等处理项目，然后将数据存储在电子线路上至中继器或手动抄表器。远程水表的设计属于集成化，在其内部有一个智能芯片，可以记录最新的传输记录，真正实现智能化。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　远程水表在原有的基础上增加刷卡预付功能，一米多功能，用户方便，是广大居民用户的首选，也是管理部门的依赖，可以远程监控。NG也可以预先支付水费，一次获得更多，这个水表得到支持。相信在不久的将来，智能远程传输水表将在市场上推出。</p>\"],\"categoryCode\":[\"ca10001\"],\"productSort\":[\"3\"],\"isTop\":[\"1\"],\"keyWords\":[\"\"],\"productTitle\":[\"产品中心标题三\"],\"productDesc\":[\"', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 15:31:11');
INSERT INTO `sys_oper_log` VALUES (292, '产品管理', 2, 'com.yanxiuhair.cms.controller.ProductController.editSave()', 'POST', 1, 'admin', '研发部门', '/cms/product/edit', '127.0.0.1', '内网IP', '{\"productId\":[\"92\"],\"frontImgUrl\":[\"/profile/upload/2021/07/07/0ba780de-e08f-4ee9-9f9c-c8de37acc03a.jpg\"],\"productImgUrlJSONArray\":[\"[{\\\"productImgUrl\\\":\\\"/profile/upload/2021/07/07/38070186-dca7-41d9-a5cd-081c66c8e57f.jpg\\\"},{\\\"productImgUrl\\\":\\\"/profile/upload/2021/07/07/074e38d4-25de-4537-93d1-52689b2ac17f.jpg\\\"}]\"],\"contentInfo\":[\"<p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">远距离水表在市场上应用广泛，具有方便快捷的功能。这是电力消费生活中的一大进步。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　众所周知，普通的冷水和热水表已经被现代快速家庭生活所淘汰。现在，远程水表越来越复杂，基于普通的和更加机械化的冷热水表，结合远程传输系统。它不仅可以清楚地记录交通，而且可以计算最小和最大交通量。它仍能在高压下正常运转。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　随着社会的发展和科学技术的进步，远程水表也在不断地改进，增加了许多技术手段以方便计算机控制。智能远程传输水表现在越来越受到企业和用户的欢迎和信赖。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　增加电子采集模块是智能远传水表的特点。电子采集模块的引入，使水表的应用时代发生了革命性的变化，使得所有的数据都能够网络化和系统化。电子模块完成信号采集、数据处理等处理项目，然后将数据存储在电子线路上至中继器或手动抄表器。远程水表的设计属于集成化，在其内部有一个智能芯片，可以记录最新的传输记录，真正实现智能化。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　远程水表在原有的基础上增加刷卡预付功能，一米多功能，用户方便，是广大居民用户的首选，也是管理部门的依赖，可以远程监控。NG也可以预先支付水费，一次获得更多，这个水表得到支持。相信在不久的将来，智能远程传输水表将在市场上推出。</p>\"],\"categoryCode\":[\"ca10001\"],\"productSort\":[\"2\"],\"isTop\":[\"1\"],\"keyWords\":[\"\"],\"productTitle\":[\"产品中心标题二\"],\"productDesc\":[\"', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 15:31:21');
INSERT INTO `sys_oper_log` VALUES (293, '产品管理', 1, 'com.yanxiuhair.cms.controller.ProductController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/product/add', '127.0.0.1', '内网IP', '{\"frontImgUrl\":[\"/profile/upload/2021/07/07/53411cab-e17f-4768-8fe0-747b1d96b7fe.jpg\"],\"productImgUrlJSONArray\":[\"[{\\\"productImgUrl\\\":\\\"/profile/upload/2021/07/07/aaf42a39-3129-4e2f-8270-5af8d6c02657.jpg\\\"},{\\\"productImgUrl\\\":\\\"/profile/upload/2021/07/07/5c9c62e0-2d6a-440b-8611-111e5fdb792d.jpg\\\"}]\"],\"contentInfo\":[\"<p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">远距离水表在市场上应用广泛，具有方便快捷的功能。这是电力消费生活中的一大进步。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　众所周知，普通的冷水和热水表已经被现代快速家庭生活所淘汰。现在，远程水表越来越复杂，基于普通的和更加机械化的冷热水表，结合远程传输系统。它不仅可以清楚地记录交通，而且可以计算最小和最大交通量。它仍能在高压下正常运转。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　随着社会的发展和科学技术的进步，远程水表也在不断地改进，增加了许多技术手段以方便计算机控制。智能远程传输水表现在越来越受到企业和用户的欢迎和信赖。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　增加电子采集模块是智能远传水表的特点。电子采集模块的引入，使水表的应用时代发生了革命性的变化，使得所有的数据都能够网络化和系统化。电子模块完成信号采集、数据处理等处理项目，然后将数据存储在电子线路上至中继器或手动抄表器。远程水表的设计属于集成化，在其内部有一个智能芯片，可以记录最新的传输记录，真正实现智能化。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　远程水表在原有的基础上增加刷卡预付功能，一米多功能，用户方便，是广大居民用户的首选，也是管理部门的依赖，可以远程监控。NG也可以预先支付水费，一次获得更多，这个水表得到支持。相信在不久的将来，智能远程传输水表将在市场上推出。</p>\"],\"categoryCode\":[\"ca10001\"],\"productSort\":[\"4\"],\"isTop\":[\"1\"],\"keyWords\":[\"\"],\"productTitle\":[\"产品中心标题四\"],\"productDesc\":[\"远距离水表在市场上应用广泛，具有方便快', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 15:40:32');
INSERT INTO `sys_oper_log` VALUES (294, '产品管理', 2, 'com.yanxiuhair.cms.controller.ProductController.changeIsPublish()', 'POST', 1, 'admin', '研发部门', '/cms/product/changeIsPublish', '127.0.0.1', '内网IP', '{\"productId\":[\"94\"],\"isPublish\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 15:40:35');
INSERT INTO `sys_oper_log` VALUES (295, '产品管理', 1, 'com.yanxiuhair.cms.controller.ProductController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/product/add', '127.0.0.1', '内网IP', '{\"frontImgUrl\":[\"/profile/upload/2021/07/07/a996dbce-ce7f-442b-bc93-1a4995682ff6.jpg\"],\"productImgUrlJSONArray\":[\"[{\\\"productImgUrl\\\":\\\"/profile/upload/2021/07/07/073e20e3-3277-49bf-aa71-1001d1102685.jpg\\\"},{\\\"productImgUrl\\\":\\\"/profile/upload/2021/07/07/136614db-d53f-4c10-bf21-a594aa81adb7.jpg\\\"}]\"],\"contentInfo\":[\"<p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">远距离水表在市场上应用广泛，具有方便快捷的功能。这是电力消费生活中的一大进步。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　众所周知，普通的冷水和热水表已经被现代快速家庭生活所淘汰。现在，远程水表越来越复杂，基于普通的和更加机械化的冷热水表，结合远程传输系统。它不仅可以清楚地记录交通，而且可以计算最小和最大交通量。它仍能在高压下正常运转。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　随着社会的发展和科学技术的进步，远程水表也在不断地改进，增加了许多技术手段以方便计算机控制。智能远程传输水表现在越来越受到企业和用户的欢迎和信赖。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　增加电子采集模块是智能远传水表的特点。电子采集模块的引入，使水表的应用时代发生了革命性的变化，使得所有的数据都能够网络化和系统化。电子模块完成信号采集、数据处理等处理项目，然后将数据存储在电子线路上至中继器或手动抄表器。远程水表的设计属于集成化，在其内部有一个智能芯片，可以记录最新的传输记录，真正实现智能化。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　远程水表在原有的基础上增加刷卡预付功能，一米多功能，用户方便，是广大居民用户的首选，也是管理部门的依赖，可以远程监控。NG也可以预先支付水费，一次获得更多，这个水表得到支持。相信在不久的将来，智能远程传输水表将在市场上推出。</p>\"],\"categoryCode\":[\"ca10002\"],\"productSort\":[\"1\"],\"isTop\":[\"1\"],\"keyWords\":[\"\"],\"productTitle\":[\"产品中心标题一\"],\"productDesc\":[\"远距离水表在市场上应用广泛，具有方便快', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 15:46:45');
INSERT INTO `sys_oper_log` VALUES (296, '产品管理', 2, 'com.yanxiuhair.cms.controller.ProductController.changeIsPublish()', 'POST', 1, 'admin', '研发部门', '/cms/product/changeIsPublish', '127.0.0.1', '内网IP', '{\"productId\":[\"95\"],\"isPublish\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 15:46:48');
INSERT INTO `sys_oper_log` VALUES (297, '导航栏目', 2, 'com.yanxiuhair.cms.controller.CategoryController.changeIsPublish()', 'POST', 1, 'admin', '研发部门', '/cms/category/changeIsPublish', '127.0.0.1', '内网IP', '{\"categoryId\":[\"162\"],\"isPublish\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 15:48:45');
INSERT INTO `sys_oper_log` VALUES (298, '导航栏目', 2, 'com.yanxiuhair.cms.controller.CategoryController.changeIsPublish()', 'POST', 1, 'admin', '研发部门', '/cms/category/changeIsPublish', '127.0.0.1', '内网IP', '{\"categoryId\":[\"161\"],\"isPublish\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 15:48:46');
INSERT INTO `sys_oper_log` VALUES (299, '导航栏目', 2, 'com.yanxiuhair.cms.controller.CategoryController.changeIsPublish()', 'POST', 1, 'admin', '研发部门', '/cms/category/changeIsPublish', '127.0.0.1', '内网IP', '{\"categoryId\":[\"160\"],\"isPublish\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 15:48:48');
INSERT INTO `sys_oper_log` VALUES (300, '导航栏目', 2, 'com.yanxiuhair.cms.controller.CategoryController.changeIsPublish()', 'POST', 1, 'admin', '研发部门', '/cms/category/changeIsPublish', '127.0.0.1', '内网IP', '{\"categoryId\":[\"159\"],\"isPublish\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 15:48:50');
INSERT INTO `sys_oper_log` VALUES (301, '产品管理', 2, 'com.yanxiuhair.cms.controller.ProductController.changeIsTop()', 'POST', 1, 'admin', '研发部门', '/cms/product/changeIsTop', '127.0.0.1', '内网IP', '{\"productId\":[\"95\"],\"isTop\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 15:49:06');
INSERT INTO `sys_oper_log` VALUES (302, '产品管理', 2, 'com.yanxiuhair.cms.controller.ProductController.changeIsTop()', 'POST', 1, 'admin', '研发部门', '/cms/product/changeIsTop', '127.0.0.1', '内网IP', '{\"productId\":[\"93\"],\"isTop\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 15:49:08');
INSERT INTO `sys_oper_log` VALUES (303, '产品管理', 2, 'com.yanxiuhair.cms.controller.ProductController.changeIsTop()', 'POST', 1, 'admin', '研发部门', '/cms/product/changeIsTop', '127.0.0.1', '内网IP', '{\"productId\":[\"94\"],\"isTop\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 15:49:10');
INSERT INTO `sys_oper_log` VALUES (304, '产品管理', 2, 'com.yanxiuhair.cms.controller.ProductController.changeIsTop()', 'POST', 1, 'admin', '研发部门', '/cms/product/changeIsTop', '127.0.0.1', '内网IP', '{\"productId\":[\"92\"],\"isTop\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 15:49:12');
INSERT INTO `sys_oper_log` VALUES (305, '产品管理', 2, 'com.yanxiuhair.cms.controller.ProductController.changeIsTop()', 'POST', 1, 'admin', '研发部门', '/cms/product/changeIsTop', '127.0.0.1', '内网IP', '{\"productId\":[\"91\"],\"isTop\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 15:49:14');
INSERT INTO `sys_oper_log` VALUES (306, '产品管理', 2, 'com.yanxiuhair.cms.controller.ProductController.editSave()', 'POST', 1, 'admin', '研发部门', '/cms/product/edit', '127.0.0.1', '内网IP', '{\"productId\":[\"95\"],\"frontImgUrl\":[\"/profile/upload/2021/07/07/a996dbce-ce7f-442b-bc93-1a4995682ff6.jpg\"],\"productImgUrlJSONArray\":[\"[{\\\"productImgUrl\\\":\\\"/profile/upload/2021/07/07/073e20e3-3277-49bf-aa71-1001d1102685.jpg\\\"},{\\\"productImgUrl\\\":\\\"/profile/upload/2021/07/07/136614db-d53f-4c10-bf21-a594aa81adb7.jpg\\\"}]\"],\"contentInfo\":[\"<p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">远距离水表在市场上应用广泛，具有方便快捷的功能。这是电力消费生活中的一大进步。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　众所周知，普通的冷水和热水表已经被现代快速家庭生活所淘汰。现在，远程水表越来越复杂，基于普通的和更加机械化的冷热水表，结合远程传输系统。它不仅可以清楚地记录交通，而且可以计算最小和最大交通量。它仍能在高压下正常运转。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　随着社会的发展和科学技术的进步，远程水表也在不断地改进，增加了许多技术手段以方便计算机控制。智能远程传输水表现在越来越受到企业和用户的欢迎和信赖。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　增加电子采集模块是智能远传水表的特点。电子采集模块的引入，使水表的应用时代发生了革命性的变化，使得所有的数据都能够网络化和系统化。电子模块完成信号采集、数据处理等处理项目，然后将数据存储在电子线路上至中继器或手动抄表器。远程水表的设计属于集成化，在其内部有一个智能芯片，可以记录最新的传输记录，真正实现智能化。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　远程水表在原有的基础上增加刷卡预付功能，一米多功能，用户方便，是广大居民用户的首选，也是管理部门的依赖，可以远程监控。NG也可以预先支付水费，一次获得更多，这个水表得到支持。相信在不久的将来，智能远程传输水表将在市场上推出。</p>\"],\"categoryCode\":[\"ca10002\"],\"productSort\":[\"1\"],\"isTop\":[\"0\"],\"keyWords\":[\"\"],\"productTitle\":[\"产品中心标题一\"],\"productDesc\":[\"', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 16:03:55');
INSERT INTO `sys_oper_log` VALUES (307, '产品管理', 1, 'com.yanxiuhair.cms.controller.ProductController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/product/add', '127.0.0.1', '内网IP', '{\"frontImgUrl\":[\"/profile/upload/2021/07/07/d7d24b13-841c-4e57-a4c4-b6d505a7315d.jpg\"],\"productImgUrlJSONArray\":[\"[{\\\"productImgUrl\\\":\\\"/profile/upload/2021/07/07/fd1461d0-19d5-472c-8915-24801871ae41.jpg\\\"},{\\\"productImgUrl\\\":\\\"/profile/upload/2021/07/07/30d24ffb-5ef4-4cc0-8e2c-a30445778ebb.jpg\\\"}]\"],\"contentInfo\":[\"<p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">远距离水表在市场上应用广泛，具有方便快捷的功能。这是电力消费生活中的一大进步。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　众所周知，普通的冷水和热水表已经被现代快速家庭生活所淘汰。现在，远程水表越来越复杂，基于普通的和更加机械化的冷热水表，结合远程传输系统。它不仅可以清楚地记录交通，而且可以计算最小和最大交通量。它仍能在高压下正常运转。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　随着社会的发展和科学技术的进步，远程水表也在不断地改进，增加了许多技术手段以方便计算机控制。智能远程传输水表现在越来越受到企业和用户的欢迎和信赖。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　增加电子采集模块是智能远传水表的特点。电子采集模块的引入，使水表的应用时代发生了革命性的变化，使得所有的数据都能够网络化和系统化。电子模块完成信号采集、数据处理等处理项目，然后将数据存储在电子线路上至中继器或手动抄表器。远程水表的设计属于集成化，在其内部有一个智能芯片，可以记录最新的传输记录，真正实现智能化。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　远程水表在原有的基础上增加刷卡预付功能，一米多功能，用户方便，是广大居民用户的首选，也是管理部门的依赖，可以远程监控。NG也可以预先支付水费，一次获得更多，这个水表得到支持。相信在不久的将来，智能远程传输水表将在市场上推出。</p>\"],\"categoryCode\":[\"ca10002\"],\"productSort\":[\"2\"],\"isTop\":[\"1\"],\"keyWords\":[\"\"],\"productTitle\":[\"产品中心标题二\"],\"productDesc\":[\"远距离水表在市场上应用广泛，具有方便快', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 17:15:45');
INSERT INTO `sys_oper_log` VALUES (308, '产品管理', 2, 'com.yanxiuhair.cms.controller.ProductController.changeIsPublish()', 'POST', 1, 'admin', '研发部门', '/cms/product/changeIsPublish', '127.0.0.1', '内网IP', '{\"productId\":[\"96\"],\"isPublish\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 17:15:47');
INSERT INTO `sys_oper_log` VALUES (309, '产品管理', 2, 'com.yanxiuhair.cms.controller.ProductController.changeIsTop()', 'POST', 1, 'admin', '研发部门', '/cms/product/changeIsTop', '127.0.0.1', '内网IP', '{\"productId\":[\"96\"],\"isTop\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 17:15:49');
INSERT INTO `sys_oper_log` VALUES (310, '产品管理', 1, 'com.yanxiuhair.cms.controller.ProductController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/product/add', '127.0.0.1', '内网IP', '{\"frontImgUrl\":[\"/profile/upload/2021/07/07/6b5bf6d8-d86d-4dd8-8ca9-17ece7a3fabc.jpg\"],\"productImgUrlJSONArray\":[\"[{\\\"productImgUrl\\\":\\\"/profile/upload/2021/07/07/f52b4221-f84c-44a5-ac83-03c653f6b117.jpg\\\"},{\\\"productImgUrl\\\":\\\"/profile/upload/2021/07/07/a354a7f5-924c-48e6-ad83-421574926e1d.jpg\\\"}]\"],\"contentInfo\":[\"<p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">远距离水表在市场上应用广泛，具有方便快捷的功能。这是电力消费生活中的一大进步。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　众所周知，普通的冷水和热水表已经被现代快速家庭生活所淘汰。现在，远程水表越来越复杂，基于普通的和更加机械化的冷热水表，结合远程传输系统。它不仅可以清楚地记录交通，而且可以计算最小和最大交通量。它仍能在高压下正常运转。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　随着社会的发展和科学技术的进步，远程水表也在不断地改进，增加了许多技术手段以方便计算机控制。智能远程传输水表现在越来越受到企业和用户的欢迎和信赖。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　增加电子采集模块是智能远传水表的特点。电子采集模块的引入，使水表的应用时代发生了革命性的变化，使得所有的数据都能够网络化和系统化。电子模块完成信号采集、数据处理等处理项目，然后将数据存储在电子线路上至中继器或手动抄表器。远程水表的设计属于集成化，在其内部有一个智能芯片，可以记录最新的传输记录，真正实现智能化。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　远程水表在原有的基础上增加刷卡预付功能，一米多功能，用户方便，是广大居民用户的首选，也是管理部门的依赖，可以远程监控。NG也可以预先支付水费，一次获得更多，这个水表得到支持。相信在不久的将来，智能远程传输水表将在市场上推出。</p>\"],\"categoryCode\":[\"ca10002\"],\"productSort\":[\"3\"],\"isTop\":[\"1\"],\"keyWords\":[\"\"],\"productTitle\":[\"产品中心标题三\"],\"productDesc\":[\"远距离水表在市场上应用广泛，具有方便快', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 17:17:20');
INSERT INTO `sys_oper_log` VALUES (311, '产品管理', 2, 'com.yanxiuhair.cms.controller.ProductController.changeIsPublish()', 'POST', 1, 'admin', '研发部门', '/cms/product/changeIsPublish', '127.0.0.1', '内网IP', '{\"productId\":[\"97\"],\"isPublish\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 17:17:22');
INSERT INTO `sys_oper_log` VALUES (312, '产品管理', 2, 'com.yanxiuhair.cms.controller.ProductController.changeIsTop()', 'POST', 1, 'admin', '研发部门', '/cms/product/changeIsTop', '127.0.0.1', '内网IP', '{\"productId\":[\"97\"],\"isTop\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 17:17:24');
INSERT INTO `sys_oper_log` VALUES (313, '产品管理', 1, 'com.yanxiuhair.cms.controller.ProductController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/product/add', '127.0.0.1', '内网IP', '{\"frontImgUrl\":[\"/profile/upload/2021/07/07/60633b99-94b9-41f5-90d1-168c3492ba17.jpg\"],\"productImgUrlJSONArray\":[\"[{\\\"productImgUrl\\\":\\\"/profile/upload/2021/07/07/2907e511-4663-4f27-95e3-3c06b9b43502.jpg\\\"},{\\\"productImgUrl\\\":\\\"/profile/upload/2021/07/07/2320e0b7-9e5b-4ff2-8c2c-4b20e1f8b37c.jpg\\\"}]\"],\"contentInfo\":[\"<p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">远距离水表在市场上应用广泛，具有方便快捷的功能。这是电力消费生活中的一大进步。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　众所周知，普通的冷水和热水表已经被现代快速家庭生活所淘汰。现在，远程水表越来越复杂，基于普通的和更加机械化的冷热水表，结合远程传输系统。它不仅可以清楚地记录交通，而且可以计算最小和最大交通量。它仍能在高压下正常运转。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　随着社会的发展和科学技术的进步，远程水表也在不断地改进，增加了许多技术手段以方便计算机控制。智能远程传输水表现在越来越受到企业和用户的欢迎和信赖。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　增加电子采集模块是智能远传水表的特点。电子采集模块的引入，使水表的应用时代发生了革命性的变化，使得所有的数据都能够网络化和系统化。电子模块完成信号采集、数据处理等处理项目，然后将数据存储在电子线路上至中继器或手动抄表器。远程水表的设计属于集成化，在其内部有一个智能芯片，可以记录最新的传输记录，真正实现智能化。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　远程水表在原有的基础上增加刷卡预付功能，一米多功能，用户方便，是广大居民用户的首选，也是管理部门的依赖，可以远程监控。NG也可以预先支付水费，一次获得更多，这个水表得到支持。相信在不久的将来，智能远程传输水表将在市场上推出。</p>\"],\"categoryCode\":[\"ca10002\"],\"productSort\":[\"4\"],\"isTop\":[\"1\"],\"keyWords\":[\"\"],\"productTitle\":[\"产品中心标题四\"],\"productDesc\":[\"远距离水表在市场上应用广泛，具有方便快', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 17:18:55');
INSERT INTO `sys_oper_log` VALUES (314, '产品管理', 2, 'com.yanxiuhair.cms.controller.ProductController.changeIsTop()', 'POST', 1, 'admin', '研发部门', '/cms/product/changeIsTop', '127.0.0.1', '内网IP', '{\"productId\":[\"98\"],\"isTop\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 17:18:57');
INSERT INTO `sys_oper_log` VALUES (315, '产品管理', 2, 'com.yanxiuhair.cms.controller.ProductController.changeIsPublish()', 'POST', 1, 'admin', '研发部门', '/cms/product/changeIsPublish', '127.0.0.1', '内网IP', '{\"productId\":[\"98\"],\"isPublish\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 17:18:59');
INSERT INTO `sys_oper_log` VALUES (316, '产品管理', 1, 'com.yanxiuhair.cms.controller.ProductController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/product/add', '127.0.0.1', '内网IP', '{\"frontImgUrl\":[\"/profile/upload/2021/07/07/155a0de3-8531-4db4-b345-15c6610996e5.jpg\"],\"productImgUrlJSONArray\":[\"[{\\\"productImgUrl\\\":\\\"/profile/upload/2021/07/07/ebb4efc1-3c25-4c88-bfa4-52cebb65b4df.jpg\\\"},{\\\"productImgUrl\\\":\\\"/profile/upload/2021/07/07/0ccd7eb0-e6f5-44e9-a091-f84d3cb1d782.jpg\\\"}]\"],\"contentInfo\":[\"<p><div class=\\\"tags\\\" style=\\\"margin: 0px 0px 20px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); overflow: hidden; color: rgb(0, 0, 0); font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\\\"></div></p><div class=\\\"danye\\\" style=\\\"margin: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); font-size: 15px; line-height: 28px; color: rgb(67, 67, 67); text-align: justify; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\\\"><p style=\\\"margin: 0px 0px 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0);\\\">远距离水表在市场上应用广泛，具有方便快捷的功能。这是电力消费生活中的一大进步。</p><p style=\\\"margin: 0px 0px 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0);\\\">　　众所周知，普通的冷水和热水表已经被现代快速家庭生活所淘汰。现在，远程水表越来越复杂，基于普通的和更加机械化的冷热水表，结合远程传输系统。它不仅可以清楚地', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 17:21:09');
INSERT INTO `sys_oper_log` VALUES (317, '产品管理', 2, 'com.yanxiuhair.cms.controller.ProductController.changeIsPublish()', 'POST', 1, 'admin', '研发部门', '/cms/product/changeIsPublish', '127.0.0.1', '内网IP', '{\"productId\":[\"99\"],\"isPublish\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 17:21:14');
INSERT INTO `sys_oper_log` VALUES (318, '产品管理', 2, 'com.yanxiuhair.cms.controller.ProductController.changeIsTop()', 'POST', 1, 'admin', '研发部门', '/cms/product/changeIsTop', '127.0.0.1', '内网IP', '{\"productId\":[\"99\"],\"isTop\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 17:21:16');
INSERT INTO `sys_oper_log` VALUES (319, '产品管理', 2, 'com.yanxiuhair.cms.controller.ProductController.editSave()', 'POST', 1, 'admin', '研发部门', '/cms/product/edit', '127.0.0.1', '内网IP', '{\"productId\":[\"99\"],\"frontImgUrl\":[\"/profile/upload/2021/07/07/155a0de3-8531-4db4-b345-15c6610996e5.jpg\"],\"productImgUrlJSONArray\":[\"[{\\\"productImgUrl\\\":\\\"/profile/upload/2021/07/07/ebb4efc1-3c25-4c88-bfa4-52cebb65b4df.jpg\\\"},{\\\"productImgUrl\\\":\\\"/profile/upload/2021/07/07/0ccd7eb0-e6f5-44e9-a091-f84d3cb1d782.jpg\\\"}]\"],\"contentInfo\":[\"<p></p><div class=\\\"tags\\\" style=\\\"margin: 0px 0px 20px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); overflow: hidden; color: rgb(0, 0, 0); font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\\\"></div><p></p><div class=\\\"danye\\\" style=\\\"margin: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); font-size: 15px; line-height: 28px; color: rgb(67, 67, 67); text-align: justify; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\\\"><p style=\\\"margin: 0px 0px 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0);\\\">远距离水表在市场上应用广泛，具有方便快捷的功能。这是电力消费生活中的一大进步。</p><p style=\\\"margin: 0px 0px 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0);\\\">　　众所周知，普通的冷水和热水表已经被现代快速家庭生活所淘汰。现在，远程水表越来越复杂，基于普通的和更加', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 17:21:25');
INSERT INTO `sys_oper_log` VALUES (320, '产品管理', 1, 'com.yanxiuhair.cms.controller.ProductController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/product/add', '127.0.0.1', '内网IP', '{\"frontImgUrl\":[\"/profile/upload/2021/07/07/13bb5739-b1f9-4a51-bd34-43569f0c982a.jpg\"],\"productImgUrlJSONArray\":[\"[{\\\"productImgUrl\\\":\\\"/profile/upload/2021/07/07/26abda10-5377-415d-bfa0-2af4a87b42b1.jpg\\\"},{\\\"productImgUrl\\\":\\\"/profile/upload/2021/07/07/20e3f4da-d78a-4ae5-91a8-85c4e6ae49d1.jpg\\\"}]\"],\"contentInfo\":[\"<p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">远距离水表在市场上应用广泛，具有方便快捷的功能。这是电力消费生活中的一大进步。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　众所周知，普通的冷水和热水表已经被现代快速家庭生活所淘汰。现在，远程水表越来越复杂，基于普通的和更加机械化的冷热水表，结合远程传输系统。它不仅可以清楚地记录交通，而且可以计算最小和最大交通量。它仍能在高压下正常运转。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　随着社会的发展和科学技术的进步，远程水表也在不断地改进，增加了许多技术手段以方便计算机控制。智能远程传输水表现在越来越受到企业和用户的欢迎和信赖。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　增加电子采集模块是智能远传水表的特点。电子采集模块的引入，使水表的应用时代发生了革命性的变化，使得所有的数据都能够网络化和系统化。电子模块完成信号采集、数据处理等处理项目，然后将数据存储在电子线路上至中继器或手动抄表器。远程水表的设计属于集成化，在其内部有一个智能芯片，可以记录最新的传输记录，真正实现智能化。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　远程水表在原有的基础上增加刷卡预付功能，一米多功能，用户方便，是广大居民用户的首选，也是管理部门的依赖，可以远程监控。NG也可以预先支付水费，一次获得更多，这个水表得到支持。相信在不久的将来，智能远程传输水表将在市场上推出。</p>\"],\"categoryCode\":[\"ca10003\"],\"productSort\":[\"2\"],\"isTop\":[\"1\"],\"keyWords\":[\"\"],\"productTitle\":[\"产品中心标题二\"],\"productDesc\":[\"远距离水表在市场上应用广泛，具有方便快', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 17:23:44');
INSERT INTO `sys_oper_log` VALUES (321, '产品管理', 2, 'com.yanxiuhair.cms.controller.ProductController.changeIsTop()', 'POST', 1, 'admin', '研发部门', '/cms/product/changeIsTop', '127.0.0.1', '内网IP', '{\"productId\":[\"100\"],\"isTop\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 17:23:46');
INSERT INTO `sys_oper_log` VALUES (322, '产品管理', 2, 'com.yanxiuhair.cms.controller.ProductController.changeIsPublish()', 'POST', 1, 'admin', '研发部门', '/cms/product/changeIsPublish', '127.0.0.1', '内网IP', '{\"productId\":[\"100\"],\"isPublish\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 17:23:48');
INSERT INTO `sys_oper_log` VALUES (323, '产品管理', 1, 'com.yanxiuhair.cms.controller.ProductController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/product/add', '127.0.0.1', '内网IP', '{\"frontImgUrl\":[\"/profile/upload/2021/07/07/2ba7449f-f846-4c80-a87e-4e608ae97524.jpg\"],\"productImgUrlJSONArray\":[\"[{\\\"productImgUrl\\\":\\\"/profile/upload/2021/07/07/17c2b4fd-c369-42cb-bbb9-160ba9758a4f.jpg\\\"},{\\\"productImgUrl\\\":\\\"/profile/upload/2021/07/07/28ec6731-62a0-4f4c-a59e-2a20e1665503.jpg\\\"}]\"],\"contentInfo\":[\"<p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">远距离水表在市场上应用广泛，具有方便快捷的功能。这是电力消费生活中的一大进步。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　众所周知，普通的冷水和热水表已经被现代快速家庭生活所淘汰。现在，远程水表越来越复杂，基于普通的和更加机械化的冷热水表，结合远程传输系统。它不仅可以清楚地记录交通，而且可以计算最小和最大交通量。它仍能在高压下正常运转。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　随着社会的发展和科学技术的进步，远程水表也在不断地改进，增加了许多技术手段以方便计算机控制。智能远程传输水表现在越来越受到企业和用户的欢迎和信赖。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　增加电子采集模块是智能远传水表的特点。电子采集模块的引入，使水表的应用时代发生了革命性的变化，使得所有的数据都能够网络化和系统化。电子模块完成信号采集、数据处理等处理项目，然后将数据存储在电子线路上至中继器或手动抄表器。远程水表的设计属于集成化，在其内部有一个智能芯片，可以记录最新的传输记录，真正实现智能化。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　远程水表在原有的基础上增加刷卡预付功能，一米多功能，用户方便，是广大居民用户的首选，也是管理部门的依赖，可以远程监控。NG也可以预先支付水费，一次获得更多，这个水表得到支持。相信在不久的将来，智能远程传输水表将在市场上推出。</p>\"],\"categoryCode\":[\"ca10003\"],\"productSort\":[\"1\"],\"isTop\":[\"1\"],\"keyWords\":[\"\"],\"productTitle\":[\"产品中心标题三\"],\"productDesc\":[\"远距离水表在市场上应用广泛，具有方便快', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 17:26:16');
INSERT INTO `sys_oper_log` VALUES (324, '产品管理', 2, 'com.yanxiuhair.cms.controller.ProductController.changeIsTop()', 'POST', 1, 'admin', '研发部门', '/cms/product/changeIsTop', '127.0.0.1', '内网IP', '{\"productId\":[\"101\"],\"isTop\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 17:26:18');
INSERT INTO `sys_oper_log` VALUES (325, '产品管理', 2, 'com.yanxiuhair.cms.controller.ProductController.changeIsPublish()', 'POST', 1, 'admin', '研发部门', '/cms/product/changeIsPublish', '127.0.0.1', '内网IP', '{\"productId\":[\"101\"],\"isPublish\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 17:26:21');
INSERT INTO `sys_oper_log` VALUES (326, '产品管理', 1, 'com.yanxiuhair.cms.controller.ProductController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/product/add', '127.0.0.1', '内网IP', '{\"frontImgUrl\":[\"/profile/upload/2021/07/07/e0ce9c33-6307-43f5-a130-17856d7c76bc.jpg\"],\"productImgUrlJSONArray\":[\"[{\\\"productImgUrl\\\":\\\"/profile/upload/2021/07/07/681c154b-4fb8-440c-9d24-11df46e2b25b.jpg\\\"},{\\\"productImgUrl\\\":\\\"/profile/upload/2021/07/07/9243f6b2-a7ad-44ae-b34c-14e20c6d4892.jpg\\\"}]\"],\"contentInfo\":[\"<p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">远距离水表在市场上应用广泛，具有方便快捷的功能。这是电力消费生活中的一大进步。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　众所周知，普通的冷水和热水表已经被现代快速家庭生活所淘汰。现在，远程水表越来越复杂，基于普通的和更加机械化的冷热水表，结合远程传输系统。它不仅可以清楚地记录交通，而且可以计算最小和最大交通量。它仍能在高压下正常运转。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　随着社会的发展和科学技术的进步，远程水表也在不断地改进，增加了许多技术手段以方便计算机控制。智能远程传输水表现在越来越受到企业和用户的欢迎和信赖。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　增加电子采集模块是智能远传水表的特点。电子采集模块的引入，使水表的应用时代发生了革命性的变化，使得所有的数据都能够网络化和系统化。电子模块完成信号采集、数据处理等处理项目，然后将数据存储在电子线路上至中继器或手动抄表器。远程水表的设计属于集成化，在其内部有一个智能芯片，可以记录最新的传输记录，真正实现智能化。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　远程水表在原有的基础上增加刷卡预付功能，一米多功能，用户方便，是广大居民用户的首选，也是管理部门的依赖，可以远程监控。NG也可以预先支付水费，一次获得更多，这个水表得到支持。相信在不久的将来，智能远程传输水表将在市场上推出。</p>\"],\"categoryCode\":[\"ca10003\"],\"productSort\":[\"1\"],\"isTop\":[\"1\"],\"keyWords\":[\"\"],\"productTitle\":[\"产品中心标题四\"],\"productDesc\":[\"远距离水表在市场上应用广泛，具有方便快', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 17:27:28');
INSERT INTO `sys_oper_log` VALUES (327, '产品管理', 2, 'com.yanxiuhair.cms.controller.ProductController.changeIsTop()', 'POST', 1, 'admin', '研发部门', '/cms/product/changeIsTop', '127.0.0.1', '内网IP', '{\"productId\":[\"102\"],\"isTop\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 17:27:31');
INSERT INTO `sys_oper_log` VALUES (328, '产品管理', 2, 'com.yanxiuhair.cms.controller.ProductController.changeIsPublish()', 'POST', 1, 'admin', '研发部门', '/cms/product/changeIsPublish', '127.0.0.1', '内网IP', '{\"productId\":[\"102\"],\"isPublish\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 17:27:33');
INSERT INTO `sys_oper_log` VALUES (329, '导航栏目', 2, 'com.yanxiuhair.cms.controller.CategoryController.changeIsPublish()', 'POST', 1, 'admin', '研发部门', '/cms/category/changeIsPublish', '127.0.0.1', '内网IP', '{\"categoryId\":[\"158\"],\"isPublish\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 17:28:08');
INSERT INTO `sys_oper_log` VALUES (330, '产品管理', 1, 'com.yanxiuhair.cms.controller.ProductController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/product/add', '127.0.0.1', '内网IP', '{\"frontImgUrl\":[\"/profile/upload/2021/07/07/63eaa2b1-7f83-4d8d-977e-50e9b0029eb4.jpg\"],\"productImgUrlJSONArray\":[\"[{\\\"productImgUrl\\\":\\\"/profile/upload/2021/07/07/c169c3da-6bdf-43aa-b46c-808d89dbff6a.jpg\\\"},{\\\"productImgUrl\\\":\\\"/profile/upload/2021/07/07/a2526d9a-c568-4201-9cfa-b50fb9f24077.jpg\\\"}]\"],\"contentInfo\":[\"<p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">远距离水表在市场上应用广泛，具有方便快捷的功能。这是电力消费生活中的一大进步。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　众所周知，普通的冷水和热水表已经被现代快速家庭生活所淘汰。现在，远程水表越来越复杂，基于普通的和更加机械化的冷热水表，结合远程传输系统。它不仅可以清楚地记录交通，而且可以计算最小和最大交通量。它仍能在高压下正常运转。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　随着社会的发展和科学技术的进步，远程水表也在不断地改进，增加了许多技术手段以方便计算机控制。智能远程传输水表现在越来越受到企业和用户的欢迎和信赖。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　增加电子采集模块是智能远传水表的特点。电子采集模块的引入，使水表的应用时代发生了革命性的变化，使得所有的数据都能够网络化和系统化。电子模块完成信号采集、数据处理等处理项目，然后将数据存储在电子线路上至中继器或手动抄表器。远程水表的设计属于集成化，在其内部有一个智能芯片，可以记录最新的传输记录，真正实现智能化。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　远程水表在原有的基础上增加刷卡预付功能，一米多功能，用户方便，是广大居民用户的首选，也是管理部门的依赖，可以远程监控。NG也可以预先支付水费，一次获得更多，这个水表得到支持。相信在不久的将来，智能远程传输水表将在市场上推出。</p>\"],\"categoryCode\":[\"ca10004\"],\"productSort\":[\"1\"],\"isTop\":[\"1\"],\"keyWords\":[\"\"],\"productTitle\":[\"产品中心标题一\"],\"productDesc\":[\"远距离水表在市场上应用广泛，具有方便快', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 17:29:36');
INSERT INTO `sys_oper_log` VALUES (331, '产品管理', 2, 'com.yanxiuhair.cms.controller.ProductController.changeIsTop()', 'POST', 1, 'admin', '研发部门', '/cms/product/changeIsTop', '127.0.0.1', '内网IP', '{\"productId\":[\"103\"],\"isTop\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 17:29:38');
INSERT INTO `sys_oper_log` VALUES (332, '产品管理', 2, 'com.yanxiuhair.cms.controller.ProductController.changeIsPublish()', 'POST', 1, 'admin', '研发部门', '/cms/product/changeIsPublish', '127.0.0.1', '内网IP', '{\"productId\":[\"103\"],\"isPublish\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 17:29:40');
INSERT INTO `sys_oper_log` VALUES (333, '产品管理', 1, 'com.yanxiuhair.cms.controller.ProductController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/product/add', '127.0.0.1', '内网IP', '{\"frontImgUrl\":[\"/profile/upload/2021/07/07/7388282d-7150-4e23-8946-fa452c73a01e.jpg\"],\"productImgUrlJSONArray\":[\"[{\\\"productImgUrl\\\":\\\"/profile/upload/2021/07/07/61a7e2b4-1e66-4db3-bb71-80a4b1aef1af.jpg\\\"},{\\\"productImgUrl\\\":\\\"/profile/upload/2021/07/07/25214191-969e-40e6-9f6a-750785dc8634.jpg\\\"}]\"],\"contentInfo\":[\"<p><div class=\\\"tags\\\" style=\\\"margin: 0px 0px 20px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); overflow: hidden; color: rgb(0, 0, 0); font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\\\"></div></p><div class=\\\"danye\\\" style=\\\"margin: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); font-size: 15px; line-height: 28px; color: rgb(67, 67, 67); text-align: justify; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\\\"><p style=\\\"margin: 0px 0px 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0);\\\">远距离水表在市场上应用广泛，具有方便快捷的功能。这是电力消费生活中的一大进步。</p><p style=\\\"margin: 0px 0px 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0);\\\">　　众所周知，普通的冷水和热水表已经被现代快速家庭生活所淘汰。现在，远程水表越来越复杂，基于普通的和更加机械化的冷热水表，结合远程传输系统。它不仅可以清楚地', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 17:30:59');
INSERT INTO `sys_oper_log` VALUES (334, '产品管理', 2, 'com.yanxiuhair.cms.controller.ProductController.changeIsTop()', 'POST', 1, 'admin', '研发部门', '/cms/product/changeIsTop', '127.0.0.1', '内网IP', '{\"productId\":[\"104\"],\"isTop\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 17:31:01');
INSERT INTO `sys_oper_log` VALUES (335, '产品管理', 2, 'com.yanxiuhair.cms.controller.ProductController.changeIsPublish()', 'POST', 1, 'admin', '研发部门', '/cms/product/changeIsPublish', '127.0.0.1', '内网IP', '{\"productId\":[\"104\"],\"isPublish\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 17:31:03');
INSERT INTO `sys_oper_log` VALUES (336, '产品管理', 1, 'com.yanxiuhair.cms.controller.ProductController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/product/add', '127.0.0.1', '内网IP', '{\"frontImgUrl\":[\"/profile/upload/2021/07/07/19eb3e5e-bcf4-4231-b09e-4a6da0160f80.jpg\"],\"productImgUrlJSONArray\":[\"[{\\\"productImgUrl\\\":\\\"/profile/upload/2021/07/07/5a4cce72-d980-47cf-b19a-57ba531d72be.jpg\\\"},{\\\"productImgUrl\\\":\\\"/profile/upload/2021/07/07/fc0d442a-915b-4d0e-9518-4f1085619c3f.jpg\\\"}]\"],\"contentInfo\":[\"<p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">远距离水表在市场上应用广泛，具有方便快捷的功能。这是电力消费生活中的一大进步。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　众所周知，普通的冷水和热水表已经被现代快速家庭生活所淘汰。现在，远程水表越来越复杂，基于普通的和更加机械化的冷热水表，结合远程传输系统。它不仅可以清楚地记录交通，而且可以计算最小和最大交通量。它仍能在高压下正常运转。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　随着社会的发展和科学技术的进步，远程水表也在不断地改进，增加了许多技术手段以方便计算机控制。智能远程传输水表现在越来越受到企业和用户的欢迎和信赖。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　增加电子采集模块是智能远传水表的特点。电子采集模块的引入，使水表的应用时代发生了革命性的变化，使得所有的数据都能够网络化和系统化。电子模块完成信号采集、数据处理等处理项目，然后将数据存储在电子线路上至中继器或手动抄表器。远程水表的设计属于集成化，在其内部有一个智能芯片，可以记录最新的传输记录，真正实现智能化。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　远程水表在原有的基础上增加刷卡预付功能，一米多功能，用户方便，是广大居民用户的首选，也是管理部门的依赖，可以远程监控。NG也可以预先支付水费，一次获得更多，这个水表得到支持。相信在不久的将来，智能远程传输水表将在市场上推出。</p>\"],\"categoryCode\":[\"ca10004\"],\"productSort\":[\"3\"],\"isTop\":[\"1\"],\"keyWords\":[\"\"],\"productTitle\":[\"产品中心标题三\"],\"productDesc\":[\"远距离水表在市场上应用广泛，具有方便快', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 17:32:18');
INSERT INTO `sys_oper_log` VALUES (337, '产品管理', 2, 'com.yanxiuhair.cms.controller.ProductController.changeIsTop()', 'POST', 1, 'admin', '研发部门', '/cms/product/changeIsTop', '127.0.0.1', '内网IP', '{\"productId\":[\"105\"],\"isTop\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 17:32:22');
INSERT INTO `sys_oper_log` VALUES (338, '产品管理', 2, 'com.yanxiuhair.cms.controller.ProductController.changeIsPublish()', 'POST', 1, 'admin', '研发部门', '/cms/product/changeIsPublish', '127.0.0.1', '内网IP', '{\"productId\":[\"105\"],\"isPublish\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 17:32:24');
INSERT INTO `sys_oper_log` VALUES (339, '图片信息', 1, 'com.yanxiuhair.cms.controller.AdsController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/ads/add', '127.0.0.1', '内网IP', '{\"pathAddr\":[\"/profile/upload/2021/07/07/74a58a8d-7ea6-417b-99de-623dc7e950f4.jpg\"],\"width\":[\"100\"],\"height\":[\"200\"],\"navCode\":[\"index\"],\"positionCode\":[\"pc_index\"],\"target\":[\"_self\"],\"adSort\":[\"2\"],\"adName\":[\"banner2\"],\"url\":[\"\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 17:34:27');
INSERT INTO `sys_oper_log` VALUES (340, '图片信息', 2, 'com.yanxiuhair.cms.controller.AdsController.changeIsPublish()', 'POST', 1, 'admin', '研发部门', '/cms/ads/changeIsPublish', '127.0.0.1', '内网IP', '{\"adId\":[\"163\"],\"isPublish\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 17:34:30');
INSERT INTO `sys_oper_log` VALUES (341, '图片信息', 1, 'com.yanxiuhair.cms.controller.AdsController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/ads/add', '127.0.0.1', '内网IP', '{\"pathAddr\":[\"/profile/upload/2021/07/07/8fdb6a1f-1fd3-47b9-8051-8116f64be169.jpg\"],\"width\":[\"100\"],\"height\":[\"200\"],\"navCode\":[\"product\"],\"positionCode\":[\"pc_product\"],\"target\":[\"_self\"],\"adSort\":[\"1\"],\"adName\":[\"banner1\"],\"url\":[\"\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 17:35:51');
INSERT INTO `sys_oper_log` VALUES (342, '图片信息', 2, 'com.yanxiuhair.cms.controller.AdsController.changeIsPublish()', 'POST', 1, 'admin', '研发部门', '/cms/ads/changeIsPublish', '127.0.0.1', '内网IP', '{\"adId\":[\"164\"],\"isPublish\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 17:35:57');
INSERT INTO `sys_oper_log` VALUES (343, '图片信息', 1, 'com.yanxiuhair.cms.controller.AdsController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/ads/add', '127.0.0.1', '内网IP', '{\"pathAddr\":[\"/profile/upload/2021/07/07/2050f191-075a-441b-a23e-568e5577c085.jpg\"],\"width\":[\"100\"],\"height\":[\"200\"],\"navCode\":[\"news\"],\"positionCode\":[\"pc_news\"],\"target\":[\"_self\"],\"adSort\":[\"1\"],\"adName\":[\"banner1\"],\"url\":[\"\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 17:36:31');
INSERT INTO `sys_oper_log` VALUES (344, '图片信息', 2, 'com.yanxiuhair.cms.controller.AdsController.changeIsPublish()', 'POST', 1, 'admin', '研发部门', '/cms/ads/changeIsPublish', '127.0.0.1', '内网IP', '{\"adId\":[\"165\"],\"isPublish\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 17:36:34');
INSERT INTO `sys_oper_log` VALUES (345, '图片信息', 1, 'com.yanxiuhair.cms.controller.AdsController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/ads/add', '127.0.0.1', '内网IP', '{\"pathAddr\":[\"/profile/upload/2021/07/07/aca064dc-33e7-43ad-9b9c-7b34cb8681a0.jpg\"],\"width\":[\"100\"],\"height\":[\"200\"],\"navCode\":[\"case\"],\"positionCode\":[\"pc_case\"],\"target\":[\"_self\"],\"adSort\":[\"1\"],\"adName\":[\"banner1\"],\"url\":[\"\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 17:37:09');
INSERT INTO `sys_oper_log` VALUES (346, '图片信息', 2, 'com.yanxiuhair.cms.controller.AdsController.changeIsPublish()', 'POST', 1, 'admin', '研发部门', '/cms/ads/changeIsPublish', '127.0.0.1', '内网IP', '{\"adId\":[\"166\"],\"isPublish\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 17:37:12');
INSERT INTO `sys_oper_log` VALUES (347, '图片信息', 1, 'com.yanxiuhair.cms.controller.AdsController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/ads/add', '127.0.0.1', '内网IP', '{\"pathAddr\":[\"/profile/upload/2021/07/07/6ec5d6ac-8cbe-4609-9199-b8da672f8827.jpg\"],\"width\":[\"100\"],\"height\":[\"200\"],\"navCode\":[\"about\"],\"positionCode\":[\"pc_about\"],\"target\":[\"_self\"],\"adSort\":[\"1\"],\"adName\":[\"banner1\"],\"url\":[\"\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 17:38:11');
INSERT INTO `sys_oper_log` VALUES (348, '图片信息', 2, 'com.yanxiuhair.cms.controller.AdsController.changeIsPublish()', 'POST', 1, 'admin', '研发部门', '/cms/ads/changeIsPublish', '127.0.0.1', '内网IP', '{\"adId\":[\"167\"],\"isPublish\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 17:38:13');
INSERT INTO `sys_oper_log` VALUES (349, '图片信息', 1, 'com.yanxiuhair.cms.controller.AdsController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/ads/add', '127.0.0.1', '内网IP', '{\"pathAddr\":[\"/profile/upload/2021/07/07/d328754d-74cf-4b4c-9d87-12d7dd1ef53a.jpg\"],\"width\":[\"100\"],\"height\":[\"200\"],\"navCode\":[\"msg\"],\"positionCode\":[\"pc_msg\"],\"target\":[\"_self\"],\"adSort\":[\"1\"],\"adName\":[\"banner1\"],\"url\":[\"\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 17:38:38');
INSERT INTO `sys_oper_log` VALUES (350, '图片信息', 2, 'com.yanxiuhair.cms.controller.AdsController.changeIsPublish()', 'POST', 1, 'admin', '研发部门', '/cms/ads/changeIsPublish', '127.0.0.1', '内网IP', '{\"adId\":[\"168\"],\"isPublish\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 17:38:41');
INSERT INTO `sys_oper_log` VALUES (351, '图片信息', 1, 'com.yanxiuhair.cms.controller.AdsController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/ads/add', '127.0.0.1', '内网IP', '{\"pathAddr\":[\"/profile/upload/2021/07/07/535525d5-1da7-417b-be3c-4d1763f9be67.jpg\"],\"width\":[\"100\"],\"height\":[\"200\"],\"navCode\":[\"contact_us\"],\"positionCode\":[\"mobile_contact_us\"],\"target\":[\"_self\"],\"adSort\":[\"1\"],\"adName\":[\"banner1\"],\"url\":[\"\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 17:38:57');
INSERT INTO `sys_oper_log` VALUES (352, '图片信息', 2, 'com.yanxiuhair.cms.controller.AdsController.changeIsPublish()', 'POST', 1, 'admin', '研发部门', '/cms/ads/changeIsPublish', '127.0.0.1', '内网IP', '{\"adId\":[\"169\"],\"isPublish\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 17:38:59');
INSERT INTO `sys_oper_log` VALUES (353, '图片信息', 2, 'com.yanxiuhair.cms.controller.AdsController.editSave()', 'POST', 1, 'admin', '研发部门', '/cms/ads/edit', '127.0.0.1', '内网IP', '{\"adId\":[\"169\"],\"pathAddr\":[\"/profile/upload/2021/07/07/535525d5-1da7-417b-be3c-4d1763f9be67.jpg\"],\"width\":[\"100\"],\"height\":[\"200\"],\"navCode\":[\"contact_us\"],\"positionCode\":[\"mobile_contact_us\"],\"target\":[\"_self\"],\"adSort\":[\"1\"],\"adName\":[\"banner1\"],\"url\":[\"\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 17:41:59');
INSERT INTO `sys_oper_log` VALUES (354, '图片信息', 2, 'com.yanxiuhair.cms.controller.AdsController.editSave()', 'POST', 1, 'admin', '研发部门', '/cms/ads/edit', '127.0.0.1', '内网IP', '{\"adId\":[\"169\"],\"pathAddr\":[\"/profile/upload/2021/07/07/535525d5-1da7-417b-be3c-4d1763f9be67.jpg\"],\"width\":[\"100\"],\"height\":[\"200\"],\"navCode\":[\"contact_us\"],\"positionCode\":[\"pc_contact_us\"],\"target\":[\"_self\"],\"adSort\":[\"1\"],\"adName\":[\"banner1\"],\"url\":[\"\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 17:44:33');
INSERT INTO `sys_oper_log` VALUES (355, '图片信息', 2, 'com.yanxiuhair.cms.controller.AdsController.editSave()', 'POST', 1, 'admin', '研发部门', '/cms/ads/edit', '127.0.0.1', '内网IP', '{\"adId\":[\"169\"],\"pathAddr\":[\"/profile/upload/2021/07/07/535525d5-1da7-417b-be3c-4d1763f9be67.jpg\"],\"width\":[\"100\"],\"height\":[\"200\"],\"navCode\":[\"contact_us\"],\"positionCode\":[\"pc_contact_us\"],\"target\":[\"_self\"],\"adSort\":[\"1\"],\"adName\":[\"banner1\"],\"url\":[\"\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 17:46:09');
INSERT INTO `sys_oper_log` VALUES (356, '图片信息', 2, 'com.yanxiuhair.cms.controller.AdsController.editSave()', 'POST', 1, 'admin', '研发部门', '/cms/ads/edit', '127.0.0.1', '内网IP', '{\"adId\":[\"168\"],\"pathAddr\":[\"/profile/upload/2021/07/07/d328754d-74cf-4b4c-9d87-12d7dd1ef53a.jpg\"],\"width\":[\"100\"],\"height\":[\"200\"],\"navCode\":[\"msg\"],\"positionCode\":[\"pc_msg\"],\"target\":[\"_self\"],\"adSort\":[\"1\"],\"adName\":[\"banner1\"],\"url\":[\"\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 17:47:02');
INSERT INTO `sys_oper_log` VALUES (357, '图片信息', 2, 'com.yanxiuhair.cms.controller.AdsController.editSave()', 'POST', 1, 'admin', '研发部门', '/cms/ads/edit', '127.0.0.1', '内网IP', '{\"adId\":[\"168\"],\"pathAddr\":[\"/profile/upload/2021/07/07/d328754d-74cf-4b4c-9d87-12d7dd1ef53a.jpg\"],\"width\":[\"100\"],\"height\":[\"200\"],\"navCode\":[\"msg\"],\"positionCode\":[\"pc_msg\"],\"target\":[\"_self\"],\"adSort\":[\"1\"],\"adName\":[\"banner1\"],\"url\":[\"\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 17:54:01');
INSERT INTO `sys_oper_log` VALUES (358, '图片信息', 2, 'com.yanxiuhair.cms.controller.AdsController.editSave()', 'POST', 1, 'admin', '研发部门', '/cms/ads/edit', '127.0.0.1', '内网IP', '{\"adId\":[\"168\"],\"pathAddr\":[\"/profile/upload/2021/07/07/d328754d-74cf-4b4c-9d87-12d7dd1ef53a.jpg\"],\"width\":[\"100\"],\"height\":[\"200\"],\"navCode\":[\"msg\"],\"positionCode\":[\"pc_msg\"],\"target\":[\"_self\"],\"adSort\":[\"1\"],\"adName\":[\"banner1\"],\"url\":[\"\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 17:58:06');
INSERT INTO `sys_oper_log` VALUES (359, '文章管理', 1, 'com.yanxiuhair.cms.controller.ArticleController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/article/add', '127.0.0.1', '内网IP', '{\"articleInfo\":[\"<p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">系统是由智能水表、集热器、集中器和传输线组成的远程抄表系统。该系统结合了微机技术、数字通信技术和水表计量技术，将计量、数据采集和处理集成为一体，整合了城市居民的用水信息，取代了传统的手工上门抄表方式。实现智能化，提高工作效率。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　智能水表的普及已成为水渠的一种节奏，普及速度空前。智能水表如此流行的原因在于它自身的优势决定了它的领先地位。这里将从六个方面谈谈智能水表的优点。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　1、降低抄表人员劳动强度，提高抄表效率500倍。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　2、解决了家庭抄表干扰的问题，保护了居民的隐私，避免了抄表造成的隐患。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　3、降低了抄表成本，在稳定、可靠和低维护的前提下，可以节省2/3甚至更高的人工成本。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　4、减少抄表错误率引起的经济纠纷，有助于构建和谐社会。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　5、提高市场营销的科技含量和服务水平。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: ', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 18:03:15');
INSERT INTO `sys_oper_log` VALUES (360, '文章管理', 2, 'com.yanxiuhair.cms.controller.ArticleController.changeIsPublish()', 'POST', 1, 'admin', '研发部门', '/cms/article/changeIsPublish', '127.0.0.1', '内网IP', '{\"articleId\":[\"264\"],\"isPublish\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 18:03:18');
INSERT INTO `sys_oper_log` VALUES (361, '文章管理', 2, 'com.yanxiuhair.cms.controller.ArticleController.changeIsTop()', 'POST', 1, 'admin', '研发部门', '/cms/article/changeIsTop', '127.0.0.1', '内网IP', '{\"articleId\":[\"264\"],\"isTop\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 18:03:19');
INSERT INTO `sys_oper_log` VALUES (362, '文章管理', 1, 'com.yanxiuhair.cms.controller.ArticleController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/article/add', '127.0.0.1', '内网IP', '{\"articleInfo\":[\"<p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">制造商告诉您IC卡水表的功能和特点。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　1、优质外壳水表采用全铜外壳，避免生锈和水污染。水表入口设有滤网，避免了水表的堵塞，降低了水表的故障率。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　2、带梯子充电的智能IC卡水表具有自动梯子充电功能，可实现定额内平价计费的耗水功能，以及价格过高的自动梯子充电功能。四种价格可以通过管理系统来设置。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　3、柔性开关由于采用了电磁逻辑控制先导阀(阀门是我们的专利技术)，加上高科技的智能电路，保证了阀门的灵活性、开关的精确性，避免了卡死现象的发生，同时也大大缩短了开关时间。工作时间(动作时间仅为0.5秒左右)，减少了工作电流，大大提高了水表的使用寿命，电池寿命可保证6年以上。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　4、双显示表具有LCD机械双重显示功能。用户可以通过查询键来检查阀门开/关状态、剩余水量、用水量、用水单价、报警量等信息。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　5、超微功耗采用高科技低功耗电路设计，加上进口优质电子元器件(CPU和主芯片均从美国进口，并通过特殊防水处理，确保IC卡水表工作的稳定性，提高可靠性)。使用的重要性。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">　　6、防潮技术采用我公司自行开发的防潮源材料，用于电路板等暴露部位采用琥珀包装形式，保证封装电路板在盐水中浸泡24小时后各项技术参数不变。</p><p style=\\\"marg', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 18:04:19');
INSERT INTO `sys_oper_log` VALUES (363, '文章管理', 2, 'com.yanxiuhair.cms.controller.ArticleController.changeIsTop()', 'POST', 1, 'admin', '研发部门', '/cms/article/changeIsTop', '127.0.0.1', '内网IP', '{\"articleId\":[\"265\"],\"isTop\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 18:04:21');
INSERT INTO `sys_oper_log` VALUES (364, '文章管理', 2, 'com.yanxiuhair.cms.controller.ArticleController.changeIsPublish()', 'POST', 1, 'admin', '研发部门', '/cms/article/changeIsPublish', '127.0.0.1', '内网IP', '{\"articleId\":[\"265\"],\"isPublish\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-07 18:04:23');
INSERT INTO `sys_oper_log` VALUES (365, '关于我们', 2, 'com.yanxiuhair.cms.controller.AboutController.editSave()', 'POST', 1, 'admin', '研发部门', '/cms/about/edit', '127.0.0.1', '内网IP', '{\"aboutId\":[\"107\"],\"contentInfo\":[\"<p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">广州市某某智能水表有限公司,是一家由广州市科技局认定为民营科技创新企业,是国内最早致力于远程抄表系统产品的研发、生产、销售、工程安装和售后服务为一体，为客户提供一步到位的能源自动化、信息化管理，节约和治理能源浪费解决方案的高新技术企业。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\"><img alt=\\\"\\\" src=\\\"http://www.jrhsz.com/43413/uploads/201711/5a17774ccb999.jpg\\\" style=\\\"margin: 0px; padding: 0px; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); border-width: initial; border-style: none; max-width: 100%;\\\"></p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">公司主要在从事各种表计（水、电、气、暖等）的远程抄表系统、工业自动控制系统、楼宇智能化系统和微波通信系统的开发、生产和工程安装，具有对普通水、气表改装成带有多种信号输出功能的资格和能力。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">公司一直秉承创新、发展为理念，优化结构为基础，技术创新为动力。十几年来，公司在全国范围内与多个城市的能源部门保持着长期的合作关系，携手万科集团、中海地产、华侨城地产、雅居乐集团、碧桂园集团、合生创展集团、天健集团等为战略合作伙伴，同时为改造和提升中国城市公用事业传统流量计量表具智能化水平和管理信息化水表，贡献着我们的一份力量。</p><p style=\\\"margin-bottom: 15px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\">公司始终坚持“立足广东、以点带面，辐射全国、走出国门”的市场战略方针，立志将最先进的技术，最成熟的产品，最规范的工程和最优质的售后服务提供给客户，实现客户、企业、社会多赢的目标。</p>\"],\"companyDesc\":[\"广州市某某智能水表有限公司,是一家由广州市科技局认定为民营科技创新企业,是国内最早致力于远程抄表系统产品的研发、生产、销售、工程安装和售后服务为一体，为客户提供一步到位的能源自动化、信息化管理，节约和治理能源浪费解决方案的高新技术企业。 公司主要在从事各种表计（水、电、气、暖等）的远程抄表系统、工业自动控制系统、楼宇智能化系统和微波通信系统的开发、生产和工程安装，具有对普通水、气表改装成带有多种信号输出功能', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-08 09:10:44');
INSERT INTO `sys_oper_log` VALUES (366, '案例管理', 1, 'com.yanxiuhair.cms.controller.CaseController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/case/add', '127.0.0.1', '内网IP', '{\"frontImgUrl\":[\"/profile/upload/2021/07/08/a658ab58-1e03-4721-85c8-9c9bd998e95a.jpg\"],\"caseImgUrlJSONArray\":[\"[{\\\"caseImgUrl\\\":\\\"/profile/upload/2021/07/08/fbe5cd25-6766-40c1-b18a-142b2dc4a201.jpg\\\"},{\\\"caseImgUrl\\\":\\\"/profile/upload/2021/07/08/d6cf67dd-fc95-4ec9-b5a5-fb44f6aa8d57.jpg\\\"}]\"],\"contentInfo\":[\"<p><span style=\\\"color: rgb(67, 67, 67); font-family: &quot;Microsoft YaHei&quot;; font-size: 15px; text-align: justify;\\\">公司坚持科学管理与先进制造技术相结合，拥有国内先进的智能水表生产技术及严格的质量管理体系、研发管理体系、售后服务体系、环境管理体系等。完整的科研、生产、经营体系，特别是在微电子领域、系统管理、机电一体化方面拥有专业的检测手段，可为产品的品质提供有力保障。在微电子、大数据、系统集成方面引领行业核心技术，创造出了一个又一个行业高精尖水表产品，并为行业标准制定做出了突出贡献，得到各级政府及行业高度评价。</span><br style=\\\"margin: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\"><span style=\\\"color: rgb(67, 67, 67); font-family: &quot;Microsoft YaHei&quot;; font-size: 15px; text-align: justify;\\\">公司以“打造百年基业、争创中国一流品牌”为经营宗旨，以“质量可靠求生存、技术创新就发展”为经营目标，真诚服务博源每一位客户。</span><br></p>\"],\"categoryCode\":[\"ca10013\"],\"caseSort\":[\"1\"],\"isTop\":[\"1\"],\"keyWords\":[\"\"],\"caseTitle\":[\"成功案例标题一\"],\"caseDesc\":[\"公司坚持科学管理与先进制造技术相结合，拥有国内先进的智能水表生产技术及严格的质量管理体系、研发管理体系、售后服务体系、环境管理体系等。完整的科研、生产、经营体系，特别是在微电子领域、系统管理、机电一体化方面拥有专业的检测手段，可为产品的品质提供有力保障。在微电子、大数据、系统集成方面引领行业核心技术，创造出了一个又一个行业高精尖水表产品，并为行业标准制定做出了突出贡献，得到各级政府及行业高度评价。\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-08 09:20:31');
INSERT INTO `sys_oper_log` VALUES (367, '案例管理', 2, 'com.yanxiuhair.cms.controller.CaseController.changeIsPublish()', 'POST', 1, 'admin', '研发部门', '/cms/case/changeIsPublish', '127.0.0.1', '内网IP', '{\"caseId\":[\"62\"],\"isPublish\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-08 09:20:35');
INSERT INTO `sys_oper_log` VALUES (368, '案例管理', 2, 'com.yanxiuhair.cms.controller.CaseController.changeIsTop()', 'POST', 1, 'admin', '研发部门', '/cms/case/changeIsTop', '127.0.0.1', '内网IP', '{\"caseId\":[\"62\"],\"isTop\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-08 09:20:36');
INSERT INTO `sys_oper_log` VALUES (369, '案例管理', 2, 'com.yanxiuhair.cms.controller.CaseController.editSave()', 'POST', 1, 'admin', '研发部门', '/cms/case/edit', '127.0.0.1', '内网IP', '{\"caseId\":[\"62\"],\"frontImgUrl\":[\"/profile/upload/2021/07/08/a658ab58-1e03-4721-85c8-9c9bd998e95a.jpg\"],\"caseImgUrlJSONArray\":[\"[{\\\"caseImgUrl\\\":\\\"/profile/upload/2021/07/08/fbe5cd25-6766-40c1-b18a-142b2dc4a201.jpg\\\"},{\\\"caseImgUrl\\\":\\\"/profile/upload/2021/07/08/d6cf67dd-fc95-4ec9-b5a5-fb44f6aa8d57.jpg\\\"}]\"],\"contentInfo\":[\"<p><span style=\\\"color: rgb(67, 67, 67); font-family: &quot;Microsoft YaHei&quot;; font-size: 15px; text-align: justify;\\\">公司坚持科学管理与先进制造技术相结合，拥有国内先进的智能水表生产技术及严格的质量管理体系、研发管理体系、售后服务体系、环境管理体系等。完整的科研、生产、经营体系，特别是在微电子领域、系统管理、机电一体化方面拥有专业的检测手段，可为产品的品质提供有力保障。在微电子、大数据、系统集成方面引领行业核心技术，创造出了一个又一个行业高精尖水表产品，并为行业标准制定做出了突出贡献，得到各级政府及行业高度评价。</span><br style=\\\"margin: 0px; padding: 0px; font-family: &quot;Microsoft YaHei&quot;; -webkit-tap-highlight-color: rgba(255, 255, 255, 0); color: rgb(67, 67, 67); font-size: 15px; text-align: justify;\\\"><span style=\\\"color: rgb(67, 67, 67); font-family: &quot;Microsoft YaHei&quot;; font-size: 15px; text-align: justify;\\\">公司以“打造百年基业、争创中国一流品牌”为经营宗旨，以“质量可靠求生存、技术创新就发展”为经营目标，真诚服务博源每一位客户。</span><br></p>\"],\"categoryCode\":[\"ca10013\"],\"caseSort\":[\"1\"],\"isTop\":[\"0\"],\"keyWords\":[\"\"],\"caseTitle\":[\"成功案例标题一\"],\"caseDesc\":[\"公司坚持科学管理与先进制造技术相结合，拥有国内先进的智能水表生产技术及严格的质量管理体系、研发管理体系、售后服务体系、环境管理体系等。\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-08 09:21:10');
INSERT INTO `sys_oper_log` VALUES (370, '图片信息', 1, 'com.yanxiuhair.cms.controller.AdsController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/ads/add', '127.0.0.1', '内网IP', '{\"pathAddr\":[\"/profile/upload/2021/07/08/cdc70149-c260-4a6b-a643-e0bab09a24de.jpg\"],\"width\":[\"100\"],\"height\":[\"200\"],\"navCode\":[\"index\"],\"positionCode\":[\"mobile_index\"],\"target\":[\"_self\"],\"adSort\":[\"1\"],\"adName\":[\"banner1\"],\"url\":[\"\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-08 09:36:27');
INSERT INTO `sys_oper_log` VALUES (371, '图片信息', 2, 'com.yanxiuhair.cms.controller.AdsController.changeIsPublish()', 'POST', 1, 'admin', '研发部门', '/cms/ads/changeIsPublish', '127.0.0.1', '内网IP', '{\"adId\":[\"170\"],\"isPublish\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-08 09:36:30');
INSERT INTO `sys_oper_log` VALUES (372, '图片信息', 1, 'com.yanxiuhair.cms.controller.AdsController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/ads/add', '127.0.0.1', '内网IP', '{\"pathAddr\":[\"/profile/upload/2021/07/08/7a3d9490-986c-4db2-9226-f92d2d7ffb03.jpg\"],\"width\":[\"100\"],\"height\":[\"200\"],\"navCode\":[\"index\"],\"positionCode\":[\"mobile_index\"],\"target\":[\"_self\"],\"adSort\":[\"2\"],\"adName\":[\"banner2\"],\"url\":[\"\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-08 09:36:50');
INSERT INTO `sys_oper_log` VALUES (373, '图片信息', 2, 'com.yanxiuhair.cms.controller.AdsController.changeIsPublish()', 'POST', 1, 'admin', '研发部门', '/cms/ads/changeIsPublish', '127.0.0.1', '内网IP', '{\"adId\":[\"171\"],\"isPublish\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-08 09:36:53');
INSERT INTO `sys_oper_log` VALUES (374, '图片信息', 1, 'com.yanxiuhair.cms.controller.AdsController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/ads/add', '127.0.0.1', '内网IP', '{\"pathAddr\":[\"/profile/upload/2021/07/08/faa635dd-5c9d-4f4a-9ba4-3719a15c7796.jpg\"],\"width\":[\"100\"],\"height\":[\"200\"],\"navCode\":[\"product\"],\"positionCode\":[\"mobile_product\"],\"target\":[\"_self\"],\"adSort\":[\"1\"],\"adName\":[\"banner1\"],\"url\":[\"\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-08 09:37:15');
INSERT INTO `sys_oper_log` VALUES (375, '图片信息', 2, 'com.yanxiuhair.cms.controller.AdsController.changeIsPublish()', 'POST', 1, 'admin', '研发部门', '/cms/ads/changeIsPublish', '127.0.0.1', '内网IP', '{\"adId\":[\"172\"],\"isPublish\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-08 09:37:17');
INSERT INTO `sys_oper_log` VALUES (376, '图片信息', 1, 'com.yanxiuhair.cms.controller.AdsController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/ads/add', '127.0.0.1', '内网IP', '{\"pathAddr\":[\"/profile/upload/2021/07/08/7304ff58-1ad7-4ce3-aec5-b3068864506a.jpg\"],\"width\":[\"100\"],\"height\":[\"200\"],\"navCode\":[\"news\"],\"positionCode\":[\"mobile_news\"],\"target\":[\"_self\"],\"adSort\":[\"1\"],\"adName\":[\"banner1\"],\"url\":[\"\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-08 09:37:43');
INSERT INTO `sys_oper_log` VALUES (377, '图片信息', 1, 'com.yanxiuhair.cms.controller.AdsController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/ads/add', '127.0.0.1', '内网IP', '{\"pathAddr\":[\"/profile/upload/2021/07/08/b6f44f5d-35f0-4937-ba1a-7afe507f73e4.jpg\"],\"width\":[\"100\"],\"height\":[\"200\"],\"navCode\":[\"case\"],\"positionCode\":[\"mobile_case\"],\"target\":[\"_self\"],\"adSort\":[\"1\"],\"adName\":[\"banner1\"],\"url\":[\"\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-08 09:38:00');
INSERT INTO `sys_oper_log` VALUES (378, '图片信息', 1, 'com.yanxiuhair.cms.controller.AdsController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/ads/add', '127.0.0.1', '内网IP', '{\"pathAddr\":[\"/profile/upload/2021/07/08/71085415-6224-4da6-8d1f-8c4268306c9c.jpg\"],\"width\":[\"100\"],\"height\":[\"200\"],\"navCode\":[\"about\"],\"positionCode\":[\"mobile_about\"],\"target\":[\"_self\"],\"adSort\":[\"1\"],\"adName\":[\"banner1\"],\"url\":[\"\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-08 09:38:19');
INSERT INTO `sys_oper_log` VALUES (379, '图片信息', 2, 'com.yanxiuhair.cms.controller.AdsController.changeIsPublish()', 'POST', 1, 'admin', '研发部门', '/cms/ads/changeIsPublish', '127.0.0.1', '内网IP', '{\"adId\":[\"175\"],\"isPublish\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-08 09:38:22');
INSERT INTO `sys_oper_log` VALUES (380, '图片信息', 2, 'com.yanxiuhair.cms.controller.AdsController.changeIsPublish()', 'POST', 1, 'admin', '研发部门', '/cms/ads/changeIsPublish', '127.0.0.1', '内网IP', '{\"adId\":[\"174\"],\"isPublish\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-08 09:38:23');
INSERT INTO `sys_oper_log` VALUES (381, '图片信息', 2, 'com.yanxiuhair.cms.controller.AdsController.changeIsPublish()', 'POST', 1, 'admin', '研发部门', '/cms/ads/changeIsPublish', '127.0.0.1', '内网IP', '{\"adId\":[\"173\"],\"isPublish\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-08 09:38:25');
INSERT INTO `sys_oper_log` VALUES (382, '图片信息', 1, 'com.yanxiuhair.cms.controller.AdsController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/ads/add', '127.0.0.1', '内网IP', '{\"pathAddr\":[\"/profile/upload/2021/07/08/0c676da5-2a93-40ac-94ae-80c35863222c.jpg\"],\"width\":[\"100\"],\"height\":[\"200\"],\"navCode\":[\"msg\"],\"positionCode\":[\"mobile_msg\"],\"target\":[\"_self\"],\"adSort\":[\"1\"],\"adName\":[\"banner1\"],\"url\":[\"\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-08 09:38:42');
INSERT INTO `sys_oper_log` VALUES (383, '图片信息', 2, 'com.yanxiuhair.cms.controller.AdsController.changeIsPublish()', 'POST', 1, 'admin', '研发部门', '/cms/ads/changeIsPublish', '127.0.0.1', '内网IP', '{\"adId\":[\"176\"],\"isPublish\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-08 09:38:45');
INSERT INTO `sys_oper_log` VALUES (384, '图片信息', 1, 'com.yanxiuhair.cms.controller.AdsController.addSave()', 'POST', 1, 'admin', '研发部门', '/cms/ads/add', '127.0.0.1', '内网IP', '{\"pathAddr\":[\"/profile/upload/2021/07/08/7ad4f9d2-1fef-4c74-87ab-4ebe180fb773.jpg\"],\"width\":[\"100\"],\"height\":[\"200\"],\"navCode\":[\"contact_us\"],\"positionCode\":[\"mobile_contact_us\"],\"target\":[\"_self\"],\"adSort\":[\"1\"],\"adName\":[\"banner1\"],\"url\":[\"\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-08 09:38:59');
INSERT INTO `sys_oper_log` VALUES (385, '图片信息', 2, 'com.yanxiuhair.cms.controller.AdsController.changeIsPublish()', 'POST', 1, 'admin', '研发部门', '/cms/ads/changeIsPublish', '127.0.0.1', '内网IP', '{\"adId\":[\"177\"],\"isPublish\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-08 09:39:02');
INSERT INTO `sys_oper_log` VALUES (386, '图片信息', 2, 'com.yanxiuhair.cms.controller.AdsController.editSave()', 'POST', 1, 'admin', '研发部门', '/cms/ads/edit', '127.0.0.1', '内网IP', '{\"adId\":[\"177\"],\"pathAddr\":[\"/profile/upload/2021/07/08/7ad4f9d2-1fef-4c74-87ab-4ebe180fb773.jpg\"],\"width\":[\"100\"],\"height\":[\"200\"],\"navCode\":[\"contact_us\"],\"positionCode\":[\"mobile_contact_us\"],\"target\":[\"_self\"],\"adSort\":[\"1\"],\"adName\":[\"banner1\"],\"url\":[\"\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-08 09:39:39');
INSERT INTO `sys_oper_log` VALUES (387, '图片信息', 2, 'com.yanxiuhair.cms.controller.AdsController.editSave()', 'POST', 1, 'admin', '研发部门', '/cms/ads/edit', '127.0.0.1', '内网IP', '{\"adId\":[\"176\"],\"pathAddr\":[\"/profile/upload/2021/07/08/0c676da5-2a93-40ac-94ae-80c35863222c.jpg\"],\"width\":[\"100\"],\"height\":[\"200\"],\"navCode\":[\"msg\"],\"positionCode\":[\"mobile_msg\"],\"target\":[\"_self\"],\"adSort\":[\"1\"],\"adName\":[\"banner1\"],\"url\":[\"\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-08 09:39:43');
INSERT INTO `sys_oper_log` VALUES (388, '图片信息', 2, 'com.yanxiuhair.cms.controller.AdsController.editSave()', 'POST', 1, 'admin', '研发部门', '/cms/ads/edit', '127.0.0.1', '内网IP', '{\"adId\":[\"173\"],\"pathAddr\":[\"/profile/upload/2021/07/08/7304ff58-1ad7-4ce3-aec5-b3068864506a.jpg\"],\"width\":[\"100\"],\"height\":[\"200\"],\"navCode\":[\"news\"],\"positionCode\":[\"mobile_news\"],\"target\":[\"_self\"],\"adSort\":[\"1\"],\"adName\":[\"banner1\"],\"url\":[\"\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-08 09:39:48');
INSERT INTO `sys_oper_log` VALUES (389, '图片信息', 2, 'com.yanxiuhair.cms.controller.AdsController.editSave()', 'POST', 1, 'admin', '研发部门', '/cms/ads/edit', '127.0.0.1', '内网IP', '{\"adId\":[\"174\"],\"pathAddr\":[\"/profile/upload/2021/07/08/b6f44f5d-35f0-4937-ba1a-7afe507f73e4.jpg\"],\"width\":[\"100\"],\"height\":[\"200\"],\"navCode\":[\"case\"],\"positionCode\":[\"mobile_case\"],\"target\":[\"_self\"],\"adSort\":[\"1\"],\"adName\":[\"banner1\"],\"url\":[\"\"],\"remark\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2021-07-08 09:39:52');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2021-06-17 10:57:46', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2021-06-17 10:57:46', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', '0', '0', 'admin', '2021-06-17 10:57:46', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', '0', '0', 'admin', '2021-06-17 10:57:46', '', NULL, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (2, 1061);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户 01注册用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '盐加密',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime(0) NULL DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '妍秀', '00', '123@163.com', '15888888888', '1', '', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', '2021-07-08 09:11:18', '2021-06-17 10:57:46', 'admin', '2021-06-17 10:57:46', '', '2021-07-08 09:10:33', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'yanxiuhair', '妍秀', '00', '123@qq.com', '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '0', '127.0.0.1', '2021-06-17 10:57:46', '2021-06-17 10:57:46', 'admin', '2021-06-17 10:57:46', '', NULL, '测试员');

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online`  (
  `sessionId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime(0) NULL DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime(0) NULL DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) NULL DEFAULT 0 COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '在线用户记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO `sys_user_online` VALUES ('1d9b4b8b-b009-4ada-b1b4-9a1695f7e36d', 'admin', '研发部门', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 7', 'on_line', '2021-07-08 09:11:15', '2021-07-08 09:42:23', 1800000);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

SET FOREIGN_KEY_CHECKS = 1;
