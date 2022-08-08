/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : rbac_template_2.0

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 29/05/2022 15:00:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NOT NULL COMMENT '上级部门id',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '部门名称',
  `orderNo` bigint(64) NULL DEFAULT NULL COMMENT '排序',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `status` bit(1) NULL DEFAULT b'0' COMMENT '是否禁用 0 false 1true',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (1, 0, '腾讯科技有限公司', 1, '腾讯科技', b'0', '2021-08-08 14:09:48', '2021-08-30 18:01:04');
INSERT INTO `sys_dept` VALUES (2, 1, '软件开发部', 1, '开发部', b'0', '2021-08-08 14:17:15', '2021-08-30 18:01:18');
INSERT INTO `sys_dept` VALUES (3, 0, '微标科技', 0, '微标', b'0', '2021-08-09 10:12:16', '2021-08-30 18:01:12');
INSERT INTO `sys_dept` VALUES (8, 0, '1231', 11, '111', b'0', '2021-08-09 10:36:39', '2021-08-30 18:00:57');
INSERT INTO `sys_dept` VALUES (11, 8, '12321', 14, '1', b'0', '2021-08-09 10:38:50', '2021-08-30 18:01:28');
INSERT INTO `sys_dept` VALUES (19, 2, '测试你2', 1, NULL, b'0', '2021-08-14 12:28:48', '2021-08-30 18:01:21');
INSERT INTO `sys_dept` VALUES (20, 2, '测试2', 2, NULL, b'0', '2021-08-14 12:29:07', '2021-08-30 18:01:25');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典名称',
  `type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典类型',
  `value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典值',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典标签',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `status` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标记  1：启用  0：禁用',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `type`(`type`, `label`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 86 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据字典表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES (75, '颜色类型', 'ColorTypes', '1', '金色', '金色', b'1', '2021-08-30 17:31:05', '2021-08-30 17:31:05');
INSERT INTO `sys_dict` VALUES (76, '颜色类型', 'ColorTypes', '2', '白色', '白色', b'1', '2021-08-30 17:31:15', '2021-08-30 17:31:15');
INSERT INTO `sys_dict` VALUES (78, '颜色类型', 'ColorTypes', '3', '花色', '花色', b'1', '2021-08-30 17:31:40', '2021-08-30 17:31:40');
INSERT INTO `sys_dict` VALUES (79, '颜色类型', 'ColorTypes', '4', '蓝色', '蓝色', b'1', '2021-08-30 17:31:58', '2021-08-30 17:31:58');
INSERT INTO `sys_dict` VALUES (80, '颜色类型', 'ColorTypes', '5', '青色', '青色', b'1', '2021-08-30 17:32:16', '2021-08-30 17:32:16');
INSERT INTO `sys_dict` VALUES (81, '测试1类型', 'test1Types', 'test1', '测试1', '这是一个测试字典', b'1', '2021-08-30 17:58:36', '2021-08-30 18:01:55');
INSERT INTO `sys_dict` VALUES (82, '颜色类型', 'ColorTypes', '6', '天蓝色', '天蓝色', b'1', '2021-09-03 19:07:57', '2021-09-03 19:07:57');
INSERT INTO `sys_dict` VALUES (83, '颜色类型', 'ColorTypes', '7', '墨绿色', '墨绿色', b'1', '2021-09-03 20:09:07', '2021-09-03 20:09:07');
INSERT INTO `sys_dict` VALUES (85, '颜色类型', 'ColorTypes', '8', '乳白色', '乳白色', b'1', '2021-09-03 20:25:57', '2021-09-03 20:25:57');
INSERT INTO `sys_dict` VALUES (86, '测试', 'TestType1', 'values', 'labvels', NULL, b'1', '2021-09-03 22:25:17', '2021-09-03 22:25:17');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户操作',
  `request_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '请求类型',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '请求接口地址',
  `is_success` bit(1) NOT NULL COMMENT '是否成功',
  `method` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求方法',
  `params_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数类型',
  `params` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求参数',
  `optime` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `client_ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `extvalue1` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扩展字段',
  `extvalue2` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扩展字段',
  `extvalue3` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扩展字段',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 650 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (1, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 16, '0:0:0:0:0:0:0:1', '2021-09-03 21:46:03', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (2, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 7, '0:0:0:0:0:0:0:1', '2021-09-03 21:46:05', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (3, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 6, '0:0:0:0:0:0:0:1', '2021-09-03 21:46:07', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (4, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 7, '0:0:0:0:0:0:0:1', '2021-09-03 21:46:08', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (5, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 9, '0:0:0:0:0:0:0:1', '2021-09-03 21:46:24', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (6, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{}]', 43, '0:0:0:0:0:0:0:1', '2021-09-03 21:46:24', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (7, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 12, '0:0:0:0:0:0:0:1', '2021-09-03 21:46:26', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (8, 'admin', '获取登录用户信息', 'GET', '/vbenadmin/sys/user/info', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserInfoController.getUserInfo', '', '[]', 6, '0:0:0:0:0:0:0:1', '2021-09-03 21:51:53', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (9, 'admin', '获取当前用户权限码', 'GET', '/vbenadmin/sys/menu/authCode', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getPermissionCode', '', '[]', 24, '0:0:0:0:0:0:0:1', '2021-09-03 21:51:53', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (10, 'admin', '获取当前用户菜单树', 'GET', '/vbenadmin/sys/menu/auth/tree', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getAuthTree', '', '[]', 37, '0:0:0:0:0:0:0:1', '2021-09-03 21:51:53', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (11, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 22, '0:0:0:0:0:0:0:1', '2021-09-03 21:51:55', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (12, 'admin', '获取登录用户信息', 'GET', '/vbenadmin/sys/user/info', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserInfoController.getUserInfo', '', '[]', 6, '0:0:0:0:0:0:0:1', '2021-09-03 21:53:35', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (13, 'admin', '获取当前用户权限码', 'GET', '/vbenadmin/sys/menu/authCode', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getPermissionCode', '', '[]', 16, '0:0:0:0:0:0:0:1', '2021-09-03 21:53:35', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (14, 'admin', '获取当前用户菜单树', 'GET', '/vbenadmin/sys/menu/auth/tree', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getAuthTree', '', '[]', 24, '0:0:0:0:0:0:0:1', '2021-09-03 21:53:35', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (15, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 11, '0:0:0:0:0:0:0:1', '2021-09-03 21:53:37', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (16, 'admin', '获取登录用户信息', 'GET', '/vbenadmin/sys/user/info', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserInfoController.getUserInfo', '', '[]', 7, '0:0:0:0:0:0:0:1', '2021-09-03 21:54:56', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (17, 'admin', '获取当前用户权限码', 'GET', '/vbenadmin/sys/menu/authCode', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getPermissionCode', '', '[]', 21, '0:0:0:0:0:0:0:1', '2021-09-03 21:54:56', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (18, 'admin', '获取当前用户菜单树', 'GET', '/vbenadmin/sys/menu/auth/tree', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getAuthTree', '', '[]', 26, '0:0:0:0:0:0:0:1', '2021-09-03 21:54:56', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (19, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 12, '0:0:0:0:0:0:0:1', '2021-09-03 21:54:58', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (20, 'admin', '获取登录用户信息', 'GET', '/vbenadmin/sys/user/info', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserInfoController.getUserInfo', '', '[]', 17, '0:0:0:0:0:0:0:1', '2021-09-03 21:56:21', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (21, 'admin', '获取当前用户权限码', 'GET', '/vbenadmin/sys/menu/authCode', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getPermissionCode', '', '[]', 23, '0:0:0:0:0:0:0:1', '2021-09-03 21:56:21', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (22, 'admin', '获取当前用户菜单树', 'GET', '/vbenadmin/sys/menu/auth/tree', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getAuthTree', '', '[]', 32, '0:0:0:0:0:0:0:1', '2021-09-03 21:56:21', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (23, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 10, '0:0:0:0:0:0:0:1', '2021-09-03 21:56:23', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (24, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[2,10,{}]', 10, '0:0:0:0:0:0:0:1', '2021-09-03 21:56:28', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (25, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[3,10,{}]', 9, '0:0:0:0:0:0:0:1', '2021-09-03 21:56:30', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (26, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 28, '0:0:0:0:0:0:0:1', '2021-09-03 21:56:32', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (27, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 57, '0:0:0:0:0:0:0:1', '2021-09-03 21:57:14', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (28, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{}]', 44, '0:0:0:0:0:0:0:1', '2021-09-03 21:57:14', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (29, 'admin', '获取列表', 'GET', '/vbenadmin/sys/interface/category/list', b'1', 'class com.yaolong.rbac.commons.base.BaseController.list', '', '[{}]', 5, '0:0:0:0:0:0:0:1', '2021-09-03 21:59:34', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (30, 'admin', '分页查询', 'GET', '/vbenadmin/sys/dict/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 99, '0:0:0:0:0:0:0:1', '2021-09-03 21:59:58', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (31, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 8, '0:0:0:0:0:0:0:1', '2021-09-03 22:00:02', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (32, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 13, '0:0:0:0:0:0:0:1', '2021-09-03 22:00:30', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (33, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 8, '0:0:0:0:0:0:0:1', '2021-09-03 22:00:34', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (34, 'admin', '获取登录用户信息', 'GET', '/vbenadmin/sys/user/info', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserInfoController.getUserInfo', '', '[]', 5, '0:0:0:0:0:0:0:1', '2021-09-03 22:01:07', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (35, 'admin', '获取当前用户权限码', 'GET', '/vbenadmin/sys/menu/authCode', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getPermissionCode', '', '[]', 14, '0:0:0:0:0:0:0:1', '2021-09-03 22:01:07', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (36, 'admin', '获取当前用户菜单树', 'GET', '/vbenadmin/sys/menu/auth/tree', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getAuthTree', '', '[]', 23, '0:0:0:0:0:0:0:1', '2021-09-03 22:01:07', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (37, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 7, '0:0:0:0:0:0:0:1', '2021-09-03 22:01:09', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (38, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[4,10,{}]', 5, '0:0:0:0:0:0:0:1', '2021-09-03 22:01:13', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (39, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[3,10,{}]', 8, '0:0:0:0:0:0:0:1', '2021-09-03 22:01:15', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (40, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[2,10,{}]', 8, '0:0:0:0:0:0:0:1', '2021-09-03 22:01:17', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (41, 'admin', '获取登录用户信息', 'GET', '/vbenadmin/sys/user/info', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserInfoController.getUserInfo', '', '[]', 7, '0:0:0:0:0:0:0:1', '2021-09-03 22:01:54', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (42, 'admin', '获取当前用户权限码', 'GET', '/vbenadmin/sys/menu/authCode', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getPermissionCode', '', '[]', 15, '0:0:0:0:0:0:0:1', '2021-09-03 22:01:54', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (43, 'admin', '获取当前用户菜单树', 'GET', '/vbenadmin/sys/menu/auth/tree', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getAuthTree', '', '[]', 22, '0:0:0:0:0:0:0:1', '2021-09-03 22:01:54', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (44, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 8, '0:0:0:0:0:0:0:1', '2021-09-03 22:01:56', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (45, 'admin', '获取登录用户信息', 'GET', '/vbenadmin/sys/user/info', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserInfoController.getUserInfo', '', '[]', 6, '0:0:0:0:0:0:0:1', '2021-09-03 22:02:09', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (46, 'admin', '获取当前用户权限码', 'GET', '/vbenadmin/sys/menu/authCode', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getPermissionCode', '', '[]', 13, '0:0:0:0:0:0:0:1', '2021-09-03 22:02:09', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (47, 'admin', '获取当前用户菜单树', 'GET', '/vbenadmin/sys/menu/auth/tree', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getAuthTree', '', '[]', 21, '0:0:0:0:0:0:0:1', '2021-09-03 22:02:09', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (48, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 16, '0:0:0:0:0:0:0:1', '2021-09-03 22:02:10', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (49, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 11, '0:0:0:0:0:0:0:1', '2021-09-03 22:02:22', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (50, 'admin', '获取登录用户信息', 'GET', '/vbenadmin/sys/user/info', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserInfoController.getUserInfo', '', '[]', 7, '0:0:0:0:0:0:0:1', '2021-09-03 22:03:10', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (51, 'admin', '获取当前用户权限码', 'GET', '/vbenadmin/sys/menu/authCode', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getPermissionCode', '', '[]', 17, '0:0:0:0:0:0:0:1', '2021-09-03 22:03:10', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (52, 'admin', '获取当前用户菜单树', 'GET', '/vbenadmin/sys/menu/auth/tree', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getAuthTree', '', '[]', 22, '0:0:0:0:0:0:0:1', '2021-09-03 22:03:10', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (53, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 9, '0:0:0:0:0:0:0:1', '2021-09-03 22:03:11', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (54, 'admin', '获取登录用户信息', 'GET', '/vbenadmin/sys/user/info', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserInfoController.getUserInfo', '', '[]', 6, '0:0:0:0:0:0:0:1', '2021-09-03 22:03:38', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (55, 'admin', '获取当前用户权限码', 'GET', '/vbenadmin/sys/menu/authCode', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getPermissionCode', '', '[]', 18, '0:0:0:0:0:0:0:1', '2021-09-03 22:03:38', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (56, 'admin', '获取当前用户菜单树', 'GET', '/vbenadmin/sys/menu/auth/tree', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getAuthTree', '', '[]', 25, '0:0:0:0:0:0:0:1', '2021-09-03 22:03:38', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (57, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 9, '0:0:0:0:0:0:0:1', '2021-09-03 22:03:40', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (58, 'admin', '获取登录用户信息', 'GET', '/vbenadmin/sys/user/info', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserInfoController.getUserInfo', '', '[]', 6, '0:0:0:0:0:0:0:1', '2021-09-03 22:03:59', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (59, 'admin', '获取当前用户权限码', 'GET', '/vbenadmin/sys/menu/authCode', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getPermissionCode', '', '[]', 15, '0:0:0:0:0:0:0:1', '2021-09-03 22:03:59', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (60, 'admin', '获取当前用户菜单树', 'GET', '/vbenadmin/sys/menu/auth/tree', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getAuthTree', '', '[]', 20, '0:0:0:0:0:0:0:1', '2021-09-03 22:03:59', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (61, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 16, '0:0:0:0:0:0:0:1', '2021-09-03 22:04:01', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (62, 'admin', '获取登录用户信息', 'GET', '/vbenadmin/sys/user/info', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserInfoController.getUserInfo', '', '[]', 8, '0:0:0:0:0:0:0:1', '2021-09-03 22:05:44', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (63, 'admin', '获取当前用户权限码', 'GET', '/vbenadmin/sys/menu/authCode', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getPermissionCode', '', '[]', 15, '0:0:0:0:0:0:0:1', '2021-09-03 22:05:45', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (64, 'admin', '获取当前用户菜单树', 'GET', '/vbenadmin/sys/menu/auth/tree', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getAuthTree', '', '[]', 19, '0:0:0:0:0:0:0:1', '2021-09-03 22:05:45', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (65, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 8, '0:0:0:0:0:0:0:1', '2021-09-03 22:05:46', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (66, 'admin', '获取登录用户信息', 'GET', '/vbenadmin/sys/user/info', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserInfoController.getUserInfo', '', '[]', 5, '0:0:0:0:0:0:0:1', '2021-09-03 22:06:55', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (67, 'admin', '获取当前用户权限码', 'GET', '/vbenadmin/sys/menu/authCode', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getPermissionCode', '', '[]', 22, '0:0:0:0:0:0:0:1', '2021-09-03 22:06:55', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (68, 'admin', '获取当前用户菜单树', 'GET', '/vbenadmin/sys/menu/auth/tree', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getAuthTree', '', '[]', 28, '0:0:0:0:0:0:0:1', '2021-09-03 22:06:55', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (69, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 8, '0:0:0:0:0:0:0:1', '2021-09-03 22:06:57', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (70, 'admin', '获取登录用户信息', 'GET', '/vbenadmin/sys/user/info', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserInfoController.getUserInfo', '', '[]', 5, '0:0:0:0:0:0:0:1', '2021-09-03 22:07:03', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (71, 'admin', '获取当前用户权限码', 'GET', '/vbenadmin/sys/menu/authCode', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getPermissionCode', '', '[]', 21, '0:0:0:0:0:0:0:1', '2021-09-03 22:07:03', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (72, 'admin', '获取当前用户菜单树', 'GET', '/vbenadmin/sys/menu/auth/tree', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getAuthTree', '', '[]', 25, '0:0:0:0:0:0:0:1', '2021-09-03 22:07:03', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (73, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 8, '0:0:0:0:0:0:0:1', '2021-09-03 22:07:05', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (74, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[8,10,{}]', 6, '0:0:0:0:0:0:0:1', '2021-09-03 22:07:07', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (75, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[7,10,{}]', 8, '0:0:0:0:0:0:0:1', '2021-09-03 22:07:09', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (76, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[6,10,{}]', 9, '0:0:0:0:0:0:0:1', '2021-09-03 22:07:10', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (77, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[4,10,{}]', 20, '0:0:0:0:0:0:0:1', '2021-09-03 22:07:11', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (78, 'admin', '获取登录用户信息', 'GET', '/vbenadmin/sys/user/info', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserInfoController.getUserInfo', '', '[]', 7, '0:0:0:0:0:0:0:1', '2021-09-03 22:14:26', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (79, 'admin', '获取当前用户权限码', 'GET', '/vbenadmin/sys/menu/authCode', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getPermissionCode', '', '[]', 20, '0:0:0:0:0:0:0:1', '2021-09-03 22:14:26', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (80, 'admin', '获取当前用户菜单树', 'GET', '/vbenadmin/sys/menu/auth/tree', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getAuthTree', '', '[]', 29, '0:0:0:0:0:0:0:1', '2021-09-03 22:14:26', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (81, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 7, '0:0:0:0:0:0:0:1', '2021-09-03 22:14:29', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (82, 'admin', '获取登录用户信息', 'GET', '/vbenadmin/sys/user/info', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserInfoController.getUserInfo', '', '[]', 6, '0:0:0:0:0:0:0:1', '2021-09-03 22:14:48', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (83, 'admin', '获取当前用户权限码', 'GET', '/vbenadmin/sys/menu/authCode', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getPermissionCode', '', '[]', 16, '0:0:0:0:0:0:0:1', '2021-09-03 22:14:48', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (84, 'admin', '获取当前用户菜单树', 'GET', '/vbenadmin/sys/menu/auth/tree', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getAuthTree', '', '[]', 15, '0:0:0:0:0:0:0:1', '2021-09-03 22:14:48', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (85, 'admin', '获取登录用户信息', 'GET', '/vbenadmin/sys/user/info', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserInfoController.getUserInfo', '', '[]', 5, '0:0:0:0:0:0:0:1', '2021-09-03 22:16:20', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (86, 'admin', '获取当前用户权限码', 'GET', '/vbenadmin/sys/menu/authCode', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getPermissionCode', '', '[]', 14, '0:0:0:0:0:0:0:1', '2021-09-03 22:16:20', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (87, 'admin', '获取当前用户菜单树', 'GET', '/vbenadmin/sys/menu/auth/tree', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getAuthTree', '', '[]', 19, '0:0:0:0:0:0:0:1', '2021-09-03 22:16:20', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (88, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 10, '0:0:0:0:0:0:0:1', '2021-09-03 22:16:22', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (89, 'admin', '获取登录用户信息', 'GET', '/vbenadmin/sys/user/info', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserInfoController.getUserInfo', '', '[]', 5, '0:0:0:0:0:0:0:1', '2021-09-03 22:16:29', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (90, 'admin', '获取当前用户权限码', 'GET', '/vbenadmin/sys/menu/authCode', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getPermissionCode', '', '[]', 23, '0:0:0:0:0:0:0:1', '2021-09-03 22:16:29', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (91, 'admin', '获取当前用户菜单树', 'GET', '/vbenadmin/sys/menu/auth/tree', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getAuthTree', '', '[]', 33, '0:0:0:0:0:0:0:1', '2021-09-03 22:16:29', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (92, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 10, '0:0:0:0:0:0:0:1', '2021-09-03 22:16:31', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (93, 'admin', '获取登录用户信息', 'GET', '/vbenadmin/sys/user/info', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserInfoController.getUserInfo', '', '[]', 6, '0:0:0:0:0:0:0:1', '2021-09-03 22:16:44', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (94, 'admin', '获取当前用户权限码', 'GET', '/vbenadmin/sys/menu/authCode', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getPermissionCode', '', '[]', 16, '0:0:0:0:0:0:0:1', '2021-09-03 22:16:44', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (95, 'admin', '获取当前用户菜单树', 'GET', '/vbenadmin/sys/menu/auth/tree', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getAuthTree', '', '[]', 20, '0:0:0:0:0:0:0:1', '2021-09-03 22:16:44', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (96, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 8, '0:0:0:0:0:0:0:1', '2021-09-03 22:16:47', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (97, 'admin', '获取登录用户信息', 'GET', '/vbenadmin/sys/user/info', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserInfoController.getUserInfo', '', '[]', 6, '0:0:0:0:0:0:0:1', '2021-09-03 22:17:13', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (98, 'admin', '获取当前用户权限码', 'GET', '/vbenadmin/sys/menu/authCode', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getPermissionCode', '', '[]', 21, '0:0:0:0:0:0:0:1', '2021-09-03 22:17:13', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (99, 'admin', '获取当前用户菜单树', 'GET', '/vbenadmin/sys/menu/auth/tree', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getAuthTree', '', '[]', 32, '0:0:0:0:0:0:0:1', '2021-09-03 22:17:13', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (100, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 8, '0:0:0:0:0:0:0:1', '2021-09-03 22:17:15', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (101, 'admin', '获取登录用户信息', 'GET', '/vbenadmin/sys/user/info', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserInfoController.getUserInfo', '', '[]', 5, '0:0:0:0:0:0:0:1', '2021-09-03 22:17:21', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (102, 'admin', '获取当前用户权限码', 'GET', '/vbenadmin/sys/menu/authCode', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getPermissionCode', '', '[]', 26, '0:0:0:0:0:0:0:1', '2021-09-03 22:17:21', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (103, 'admin', '获取当前用户菜单树', 'GET', '/vbenadmin/sys/menu/auth/tree', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getAuthTree', '', '[]', 28, '0:0:0:0:0:0:0:1', '2021-09-03 22:17:21', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (104, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 10, '0:0:0:0:0:0:0:1', '2021-09-03 22:17:24', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (105, 'admin', '获取登录用户信息', 'GET', '/vbenadmin/sys/user/info', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserInfoController.getUserInfo', '', '[]', 5, '0:0:0:0:0:0:0:1', '2021-09-03 22:20:02', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (106, 'admin', '获取当前用户权限码', 'GET', '/vbenadmin/sys/menu/authCode', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getPermissionCode', '', '[]', 18, '0:0:0:0:0:0:0:1', '2021-09-03 22:20:02', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (107, 'admin', '获取当前用户菜单树', 'GET', '/vbenadmin/sys/menu/auth/tree', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getAuthTree', '', '[]', 24, '0:0:0:0:0:0:0:1', '2021-09-03 22:20:02', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (108, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 8, '0:0:0:0:0:0:0:1', '2021-09-03 22:20:04', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (109, 'admin', '获取登录用户信息', 'GET', '/vbenadmin/sys/user/info', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserInfoController.getUserInfo', '', '[]', 6, '0:0:0:0:0:0:0:1', '2021-09-03 22:20:18', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (110, 'admin', '获取当前用户权限码', 'GET', '/vbenadmin/sys/menu/authCode', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getPermissionCode', '', '[]', 21, '0:0:0:0:0:0:0:1', '2021-09-03 22:20:19', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (111, 'admin', '获取当前用户菜单树', 'GET', '/vbenadmin/sys/menu/auth/tree', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getAuthTree', '', '[]', 26, '0:0:0:0:0:0:0:1', '2021-09-03 22:20:19', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (112, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 10, '0:0:0:0:0:0:0:1', '2021-09-03 22:20:21', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (113, 'admin', '获取登录用户信息', 'GET', '/vbenadmin/sys/user/info', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserInfoController.getUserInfo', '', '[]', 5, '0:0:0:0:0:0:0:1', '2021-09-03 22:20:58', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (114, 'admin', '获取当前用户权限码', 'GET', '/vbenadmin/sys/menu/authCode', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getPermissionCode', '', '[]', 26, '0:0:0:0:0:0:0:1', '2021-09-03 22:20:58', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (115, 'admin', '获取当前用户菜单树', 'GET', '/vbenadmin/sys/menu/auth/tree', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getAuthTree', '', '[]', 33, '0:0:0:0:0:0:0:1', '2021-09-03 22:20:58', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (116, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 14, '0:0:0:0:0:0:0:1', '2021-09-03 22:20:59', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (117, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[2,10,{}]', 6, '0:0:0:0:0:0:0:1', '2021-09-03 22:21:03', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (118, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[3,10,{}]', 8, '0:0:0:0:0:0:0:1', '2021-09-03 22:21:04', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (119, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[4,10,{}]', 16, '0:0:0:0:0:0:0:1', '2021-09-03 22:21:06', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (120, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[5,10,{}]', 5, '0:0:0:0:0:0:0:1', '2021-09-03 22:21:07', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (121, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[6,10,{}]', 6, '0:0:0:0:0:0:0:1', '2021-09-03 22:21:08', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (122, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[8,10,{}]', 6, '0:0:0:0:0:0:0:1', '2021-09-03 22:21:10', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (124, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[13,10,{}]', 16, '0:0:0:0:0:0:0:1', '2021-09-03 22:21:16', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (125, 'admin', '删除', 'DELETE', '/vbenadmin/sys/log/123', b'1', 'class com.yaolong.rbac.commons.base.BaseController.remove', 'application/json;charset=UTF-8', '[123]', 99, '0:0:0:0:0:0:0:1', '2021-09-03 22:21:19', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (126, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[13,10,{}]', 7, '0:0:0:0:0:0:0:1', '2021-09-03 22:21:19', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (127, 'admin', '获取登录用户信息', 'GET', '/vbenadmin/sys/user/info', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserInfoController.getUserInfo', '', '[]', 4, '0:0:0:0:0:0:0:1', '2021-09-03 22:23:14', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (128, 'admin', '获取当前用户权限码', 'GET', '/vbenadmin/sys/menu/authCode', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getPermissionCode', '', '[]', 11, '0:0:0:0:0:0:0:1', '2021-09-03 22:23:14', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (129, 'admin', '获取当前用户菜单树', 'GET', '/vbenadmin/sys/menu/auth/tree', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getAuthTree', '', '[]', 14, '0:0:0:0:0:0:0:1', '2021-09-03 22:23:14', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (130, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 7, '0:0:0:0:0:0:0:1', '2021-09-03 22:23:16', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (131, 'admin', '获取登录用户信息', 'GET', '/vbenadmin/sys/user/info', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserInfoController.getUserInfo', '', '[]', 4, '0:0:0:0:0:0:0:1', '2021-09-03 22:23:20', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (132, 'admin', '获取当前用户权限码', 'GET', '/vbenadmin/sys/menu/authCode', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getPermissionCode', '', '[]', 11, '0:0:0:0:0:0:0:1', '2021-09-03 22:23:20', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (133, 'admin', '获取当前用户菜单树', 'GET', '/vbenadmin/sys/menu/auth/tree', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getAuthTree', '', '[]', 16, '0:0:0:0:0:0:0:1', '2021-09-03 22:23:20', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (134, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 10, '0:0:0:0:0:0:0:1', '2021-09-03 22:23:22', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (135, 'admin', '获取登录用户信息', 'GET', '/vbenadmin/sys/user/info', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserInfoController.getUserInfo', '', '[]', 6, '0:0:0:0:0:0:0:1', '2021-09-03 22:23:32', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (136, 'admin', '获取当前用户权限码', 'GET', '/vbenadmin/sys/menu/authCode', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getPermissionCode', '', '[]', 12, '0:0:0:0:0:0:0:1', '2021-09-03 22:23:32', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (137, 'admin', '获取当前用户菜单树', 'GET', '/vbenadmin/sys/menu/auth/tree', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getAuthTree', '', '[]', 15, '0:0:0:0:0:0:0:1', '2021-09-03 22:23:32', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (138, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 6, '0:0:0:0:0:0:0:1', '2021-09-03 22:23:34', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (139, 'admin', '获取登录用户信息', 'GET', '/vbenadmin/sys/user/info', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserInfoController.getUserInfo', '', '[]', 5, '0:0:0:0:0:0:0:1', '2021-09-03 22:23:42', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (140, 'admin', '获取当前用户权限码', 'GET', '/vbenadmin/sys/menu/authCode', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getPermissionCode', '', '[]', 15, '0:0:0:0:0:0:0:1', '2021-09-03 22:23:42', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (141, 'admin', '获取当前用户菜单树', 'GET', '/vbenadmin/sys/menu/auth/tree', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getAuthTree', '', '[]', 18, '0:0:0:0:0:0:0:1', '2021-09-03 22:23:42', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (142, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 10, '0:0:0:0:0:0:0:1', '2021-09-03 22:23:43', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (143, 'admin', '获取登录用户信息', 'GET', '/vbenadmin/sys/user/info', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserInfoController.getUserInfo', '', '[]', 7, '0:0:0:0:0:0:0:1', '2021-09-03 22:24:08', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (144, 'admin', '获取当前用户权限码', 'GET', '/vbenadmin/sys/menu/authCode', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getPermissionCode', '', '[]', 22, '0:0:0:0:0:0:0:1', '2021-09-03 22:24:08', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (145, 'admin', '获取当前用户菜单树', 'GET', '/vbenadmin/sys/menu/auth/tree', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getAuthTree', '', '[]', 27, '0:0:0:0:0:0:0:1', '2021-09-03 22:24:08', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (146, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 11, '0:0:0:0:0:0:0:1', '2021-09-03 22:24:09', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (147, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[6,10,{}]', 11, '0:0:0:0:0:0:0:1', '2021-09-03 22:24:34', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (148, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[11,10,{}]', 19, '0:0:0:0:0:0:0:1', '2021-09-03 22:24:35', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (149, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 15, '0:0:0:0:0:0:0:1', '2021-09-03 22:24:36', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (150, 'admin', '分页查询', 'GET', '/vbenadmin/sys/dict/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 7, '0:0:0:0:0:0:0:1', '2021-09-03 22:24:42', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (151, 'admin', '新增', 'POST', '/vbenadmin/sys/dict', b'1', 'class com.yaolong.rbac.commons.base.BaseController.create', 'application/json;charset=UTF-8', '[{\"createTime\":\"2021-09-03T22:25:16.847\",\"name\":\"测试\",\"updateTime\":\"2021-09-03T22:25:16.847\",\"label\":\"labvels\",\"id\":86,\"type\":\"TestType1\",\"value\":\"values\",\"status\":true}]', 58, '0:0:0:0:0:0:0:1', '2021-09-03 22:25:17', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (152, 'admin', '分页查询', 'GET', '/vbenadmin/sys/dict/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 20, '0:0:0:0:0:0:0:1', '2021-09-03 22:25:17', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (153, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 6, '0:0:0:0:0:0:0:1', '2021-09-03 22:25:22', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (154, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[16,10,{}]', 7, '0:0:0:0:0:0:0:1', '2021-09-03 22:25:25', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (155, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[15,10,{}]', 25, '0:0:0:0:0:0:0:1', '2021-09-03 22:25:30', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (156, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 7, '0:0:0:0:0:0:0:1', '2021-09-03 22:26:30', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (157, 'admin', '获取登录用户信息', 'GET', '/vbenadmin/sys/user/info', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserInfoController.getUserInfo', '', '[]', 5, '0:0:0:0:0:0:0:1', '2021-09-03 22:27:08', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (158, 'admin', '获取当前用户权限码', 'GET', '/vbenadmin/sys/menu/authCode', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getPermissionCode', '', '[]', 16, '0:0:0:0:0:0:0:1', '2021-09-03 22:27:08', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (159, 'admin', '获取当前用户菜单树', 'GET', '/vbenadmin/sys/menu/auth/tree', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getAuthTree', '', '[]', 24, '0:0:0:0:0:0:0:1', '2021-09-03 22:27:08', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (160, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 8, '0:0:0:0:0:0:0:1', '2021-09-03 22:27:09', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (161, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[2,10,{}]', 7, '0:0:0:0:0:0:0:1', '2021-09-03 22:27:20', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (162, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[4,10,{}]', 23, '0:0:0:0:0:0:0:1', '2021-09-03 22:27:21', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (163, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[6,10,{}]', 20, '0:0:0:0:0:0:0:1', '2021-09-03 22:27:23', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (164, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{\"isSuccess\":false}]', 8, '0:0:0:0:0:0:0:1', '2021-09-03 22:27:52', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (165, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{\"isSuccess\":false}]', 87, '0:0:0:0:0:0:0:1', '2021-09-03 22:31:40', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (166, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{\"isSuccess\":false}]', 5, '0:0:0:0:0:0:0:1', '2021-09-03 22:31:42', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (167, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{\"isSuccess\":false}]', 4, '0:0:0:0:0:0:0:1', '2021-09-03 22:31:58', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (168, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{\"isSuccess\":true}]', 12, '0:0:0:0:0:0:0:1', '2021-09-03 22:32:01', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (169, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[2,10,{\"isSuccess\":true}]', 7, '0:0:0:0:0:0:0:1', '2021-09-03 22:32:21', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (170, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{\"isSuccess\":true}]', 18, '0:0:0:0:0:0:0:1', '2021-09-03 22:32:22', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (171, 'admin', '分页查询', 'GET', '/vbenadmin/sys/dict/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 6, '0:0:0:0:0:0:0:1', '2021-09-03 22:32:25', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (172, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 7, '0:0:0:0:0:0:0:1', '2021-09-03 22:32:52', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (173, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{\"requestType\":\"PUT\"}]', 24, '0:0:0:0:0:0:0:1', '2021-09-03 22:33:03', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (174, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{\"requestType\":\"PUT\"}]', 66, '0:0:0:0:0:0:0:1', '2021-09-03 22:33:31', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (175, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{\"requestType\":\"PUT\"}]', 19, '0:0:0:0:0:0:0:1', '2021-09-03 22:33:32', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (176, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{\"requestType\":\"GET\"}]', 9, '0:0:0:0:0:0:0:1', '2021-09-03 22:33:37', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (177, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{\"requestType\":\"POST\"}]', 7, '0:0:0:0:0:0:0:1', '2021-09-03 22:33:40', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (178, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{\"requestType\":\"DELETE\"}]', 23, '0:0:0:0:0:0:0:1', '2021-09-03 22:33:43', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (179, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{\"requestType\":\"DELETE\",\"isSuccess\":true}]', 10, '0:0:0:0:0:0:0:1', '2021-09-03 22:33:51', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (180, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{\"requestType\":\"DELETE\",\"isSuccess\":false}]', 6, '0:0:0:0:0:0:0:1', '2021-09-03 22:33:53', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (181, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{\"requestType\":\"DELETE\",\"isSuccess\":true}]', 15, '0:0:0:0:0:0:0:1', '2021-09-03 22:33:56', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (182, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{\"requestType\":\"GET\",\"isSuccess\":true}]', 9, '0:0:0:0:0:0:0:1', '2021-09-03 22:33:59', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (183, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[18,10,{\"requestType\":\"GET\",\"isSuccess\":true}]', 7, '0:0:0:0:0:0:0:1', '2021-09-03 22:34:02', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (184, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{\"requestType\":\"GET\",\"isSuccess\":true}]', 12, '0:0:0:0:0:0:0:1', '2021-09-03 22:34:04', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (185, 'admin', '分页查询', 'GET', '/vbenadmin/sys/dict/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 6, '0:0:0:0:0:0:0:1', '2021-09-03 22:34:07', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (186, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 5, '0:0:0:0:0:0:0:1', '2021-09-03 22:34:10', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (187, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{}]', 38, '0:0:0:0:0:0:0:1', '2021-09-03 22:34:10', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (188, 'admin', '获取所有权限菜单树', 'GET', '/vbenadmin/sys/menu/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getTreeList', '', '[{}]', 95, '0:0:0:0:0:0:0:1', '2021-09-03 22:34:17', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (189, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 3, '0:0:0:0:0:0:0:1', '2021-09-03 22:34:19', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (190, 'admin', '获取登录用户信息', 'GET', '/vbenadmin/sys/user/info', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserInfoController.getUserInfo', '', '[]', 8, '0:0:0:0:0:0:0:1', '2021-09-03 22:38:26', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (191, 'admin', '获取当前用户权限码', 'GET', '/vbenadmin/sys/menu/authCode', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getPermissionCode', '', '[]', 19, '0:0:0:0:0:0:0:1', '2021-09-03 22:38:26', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (192, 'admin', '获取当前用户菜单树', 'GET', '/vbenadmin/sys/menu/auth/tree', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getAuthTree', '', '[]', 23, '0:0:0:0:0:0:0:1', '2021-09-03 22:38:26', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (193, 'admin', '获取登录用户信息', 'GET', '/vbenadmin/sys/user/info', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserInfoController.getUserInfo', '', '[]', 7, '0:0:0:0:0:0:0:1', '2021-09-03 22:38:37', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (194, 'admin', '获取当前用户权限码', 'GET', '/vbenadmin/sys/menu/authCode', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getPermissionCode', '', '[]', 20, '0:0:0:0:0:0:0:1', '2021-09-03 22:38:37', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (195, 'admin', '获取当前用户菜单树', 'GET', '/vbenadmin/sys/menu/auth/tree', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getAuthTree', '', '[]', 26, '0:0:0:0:0:0:0:1', '2021-09-03 22:38:37', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (196, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 6, '0:0:0:0:0:0:0:1', '2021-09-03 22:38:41', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (197, 'admin', '获取登录用户信息', 'GET', '/vbenadmin/sys/user/info', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserInfoController.getUserInfo', '', '[]', 6, '0:0:0:0:0:0:0:1', '2021-09-03 22:38:45', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (198, 'admin', '获取当前用户权限码', 'GET', '/vbenadmin/sys/menu/authCode', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getPermissionCode', '', '[]', 17, '0:0:0:0:0:0:0:1', '2021-09-03 22:38:45', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (199, 'admin', '获取当前用户菜单树', 'GET', '/vbenadmin/sys/menu/auth/tree', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getAuthTree', '', '[]', 23, '0:0:0:0:0:0:0:1', '2021-09-03 22:38:45', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (200, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 5, '0:0:0:0:0:0:0:1', '2021-09-03 22:38:46', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (201, 'admin', '获取登录用户信息', 'GET', '/vbenadmin/sys/user/info', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserInfoController.getUserInfo', '', '[]', 5, '0:0:0:0:0:0:0:1', '2021-09-03 22:39:04', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (202, 'admin', '获取当前用户权限码', 'GET', '/vbenadmin/sys/menu/authCode', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getPermissionCode', '', '[]', 14, '0:0:0:0:0:0:0:1', '2021-09-03 22:39:04', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (203, 'admin', '获取当前用户菜单树', 'GET', '/vbenadmin/sys/menu/auth/tree', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getAuthTree', '', '[]', 15, '0:0:0:0:0:0:0:1', '2021-09-03 22:39:04', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (204, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 4, '0:0:0:0:0:0:0:1', '2021-09-03 22:39:14', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (205, 'admin', '获取登录用户信息', 'GET', '/vbenadmin/sys/user/info', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserInfoController.getUserInfo', '', '[]', 4, '0:0:0:0:0:0:0:1', '2021-09-03 22:39:44', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (206, 'admin', '获取当前用户权限码', 'GET', '/vbenadmin/sys/menu/authCode', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getPermissionCode', '', '[]', 25, '0:0:0:0:0:0:0:1', '2021-09-03 22:39:44', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (207, 'admin', '获取当前用户菜单树', 'GET', '/vbenadmin/sys/menu/auth/tree', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getAuthTree', '', '[]', 28, '0:0:0:0:0:0:0:1', '2021-09-03 22:39:44', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (208, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 3, '0:0:0:0:0:0:0:1', '2021-09-03 22:39:45', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (209, 'admin', '获取登录用户信息', 'GET', '/vbenadmin/sys/user/info', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserInfoController.getUserInfo', '', '[]', 4, '0:0:0:0:0:0:0:1', '2021-09-03 22:40:04', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (210, 'admin', '获取当前用户权限码', 'GET', '/vbenadmin/sys/menu/authCode', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getPermissionCode', '', '[]', 16, '0:0:0:0:0:0:0:1', '2021-09-03 22:40:04', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (211, 'admin', '获取当前用户菜单树', 'GET', '/vbenadmin/sys/menu/auth/tree', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getAuthTree', '', '[]', 19, '0:0:0:0:0:0:0:1', '2021-09-03 22:40:04', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (212, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 4, '0:0:0:0:0:0:0:1', '2021-09-03 22:40:06', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (213, 'admin', '获取登录用户信息', 'GET', '/vbenadmin/sys/user/info', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserInfoController.getUserInfo', '', '[]', 6, '0:0:0:0:0:0:0:1', '2021-09-03 22:40:24', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (214, 'admin', '获取当前用户权限码', 'GET', '/vbenadmin/sys/menu/authCode', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getPermissionCode', '', '[]', 17, '0:0:0:0:0:0:0:1', '2021-09-03 22:40:24', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (215, 'admin', '获取当前用户菜单树', 'GET', '/vbenadmin/sys/menu/auth/tree', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getAuthTree', '', '[]', 25, '0:0:0:0:0:0:0:1', '2021-09-03 22:40:24', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (216, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 4, '0:0:0:0:0:0:0:1', '2021-09-03 22:40:32', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (217, 'admin', '获取登录用户信息', 'GET', '/vbenadmin/sys/user/info', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserInfoController.getUserInfo', '', '[]', 6, '0:0:0:0:0:0:0:1', '2021-09-03 23:07:29', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (218, 'admin', '获取当前用户权限码', 'GET', '/vbenadmin/sys/menu/authCode', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getPermissionCode', '', '[]', 22, '0:0:0:0:0:0:0:1', '2021-09-03 23:07:29', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (219, 'admin', '获取当前用户菜单树', 'GET', '/vbenadmin/sys/menu/auth/tree', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getAuthTree', '', '[]', 30, '0:0:0:0:0:0:0:1', '2021-09-03 23:07:29', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (220, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 6, '0:0:0:0:0:0:0:1', '2021-09-03 23:07:31', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (221, 'admin', '用户登录', 'POST', '/vbenadmin/sys/login', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminLoginController.login', 'application/json;charset=UTF-8', '[{\"password\":\"123456\",\"username\":\"admin\"},{\"response\":{\"response\":{}}}]', 1898, '0:0:0:0:0:0:0:1', '2021-10-08 08:52:22', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (222, 'admin', '获取登录用户信息', 'GET', '/vbenadmin/sys/user/info', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserInfoController.getUserInfo', '', '[]', 40, '0:0:0:0:0:0:0:1', '2021-10-08 08:52:24', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (223, 'admin', '获取当前用户权限码', 'GET', '/vbenadmin/sys/menu/authCode', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getPermissionCode', '', '[]', 49, '0:0:0:0:0:0:0:1', '2021-10-08 08:52:24', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (224, 'admin', '获取当前用户菜单树', 'GET', '/vbenadmin/sys/menu/auth/tree', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getAuthTree', '', '[]', 72, '0:0:0:0:0:0:0:1', '2021-10-08 08:52:24', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (225, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 73, '0:0:0:0:0:0:0:1', '2021-10-08 08:52:46', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (226, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{}]', 120, '0:0:0:0:0:0:0:1', '2021-10-08 08:52:46', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (227, 'admin', '获取所有权限菜单树', 'GET', '/vbenadmin/sys/menu/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getTreeList', '', '[{}]', 30, '0:0:0:0:0:0:0:1', '2021-10-08 08:52:51', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (228, 'admin', '用户登录', 'POST', '/vbenadmin/sys/login', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminLoginController.login', 'application/json;charset=UTF-8', '[{\"password\":\"123456\",\"username\":\"admin\"},{\"response\":{\"response\":{}}}]', 1559, '0:0:0:0:0:0:0:1', '2021-10-10 19:11:14', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (229, 'admin', '获取登录用户信息', 'GET', '/vbenadmin/sys/user/info', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserInfoController.getUserInfo', '', '[]', 79, '0:0:0:0:0:0:0:1', '2021-10-10 19:11:16', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (230, 'admin', '获取当前用户权限码', 'GET', '/vbenadmin/sys/menu/authCode', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getPermissionCode', '', '[]', 71, '0:0:0:0:0:0:0:1', '2021-10-10 19:11:16', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (231, 'admin', '获取当前用户菜单树', 'GET', '/vbenadmin/sys/menu/auth/tree', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getAuthTree', '', '[]', 124, '0:0:0:0:0:0:0:1', '2021-10-10 19:11:16', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (232, 'admin', '分页查询', 'GET', '/vbenadmin/sys/dict/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 310, '0:0:0:0:0:0:0:1', '2021-10-10 19:14:52', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (233, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 56, '0:0:0:0:0:0:0:1', '2021-10-10 19:15:00', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (234, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[2,10,{}]', 12, '0:0:0:0:0:0:0:1', '2021-10-10 19:15:09', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (235, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[3,10,{}]', 10, '0:0:0:0:0:0:0:1', '2021-10-10 19:15:24', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (236, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[4,10,{}]', 9, '0:0:0:0:0:0:0:1', '2021-10-10 19:15:26', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (237, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[6,10,{}]', 11, '0:0:0:0:0:0:0:1', '2021-10-10 19:15:27', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (238, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[24,10,{}]', 9, '0:0:0:0:0:0:0:1', '2021-10-10 19:15:28', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (239, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 49, '0:0:0:0:0:0:0:1', '2021-10-10 19:15:34', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (240, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{}]', 94, '0:0:0:0:0:0:0:1', '2021-10-10 19:15:34', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (241, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{\"deptId\":1}]', 70, '0:0:0:0:0:0:0:1', '2021-10-10 19:15:37', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (242, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{\"deptId\":20}]', 7, '0:0:0:0:0:0:0:1', '2021-10-10 19:15:39', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (243, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{\"deptId\":19}]', 12, '0:0:0:0:0:0:0:1', '2021-10-10 19:15:41', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (244, 'admin', '获取所有权限菜单树', 'GET', '/vbenadmin/sys/menu/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getTreeList', '', '[{}]', 90, '0:0:0:0:0:0:0:1', '2021-10-10 19:15:44', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (245, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 9, '0:0:0:0:0:0:0:1', '2021-10-10 19:15:50', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (246, 'admin', '分页获取角色列表', 'GET', '/vbenadmin/sys/role/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbendminRoleController.page', '', '[1,10,{}]', 36, '0:0:0:0:0:0:0:1', '2021-10-10 19:16:03', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (247, 'admin', '获取列表', 'GET', '/vbenadmin/sys/interface/category/list', b'1', 'class com.yaolong.rbac.commons.base.BaseController.list', '', '[{}]', 24, '0:0:0:0:0:0:0:1', '2021-10-10 19:16:30', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (248, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 50, '0:0:0:0:0:0:0:1', '2021-10-10 19:16:33', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (249, 'admin', '获取登录用户信息', 'GET', '/vbenadmin/sys/user/info', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserInfoController.getUserInfo', '', '[]', 8, '0:0:0:0:0:0:0:1', '2021-10-10 19:17:45', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (250, 'admin', '获取当前用户权限码', 'GET', '/vbenadmin/sys/menu/authCode', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getPermissionCode', '', '[]', 15, '0:0:0:0:0:0:0:1', '2021-10-10 19:17:45', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (251, 'admin', '获取当前用户菜单树', 'GET', '/vbenadmin/sys/menu/auth/tree', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getAuthTree', '', '[]', 16, '0:0:0:0:0:0:0:1', '2021-10-10 19:17:45', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (252, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 7, '0:0:0:0:0:0:0:1', '2021-10-10 19:22:51', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (253, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{}]', 47, '0:0:0:0:0:0:0:1', '2021-10-10 19:22:51', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (254, 'admin', '用户登录', 'POST', '/vbenadmin/sys/login', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminLoginController.login', 'application/json;charset=UTF-8', '[{\"password\":\"123456\",\"username\":\"admin\"},{\"response\":{\"response\":{}}}]', 2020, '0:0:0:0:0:0:0:1', '2021-11-04 13:30:22', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (255, 'admin', '获取登录用户信息', 'GET', '/vbenadmin/sys/user/info', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserInfoController.getUserInfo', '', '[]', 57, '0:0:0:0:0:0:0:1', '2021-11-04 13:30:25', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (256, 'admin', '获取当前用户权限码', 'GET', '/vbenadmin/sys/menu/authCode', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getPermissionCode', '', '[]', 58, '0:0:0:0:0:0:0:1', '2021-11-04 13:30:25', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (257, 'admin', '获取当前用户菜单树', 'GET', '/vbenadmin/sys/menu/auth/tree', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getAuthTree', '', '[]', 104, '0:0:0:0:0:0:0:1', '2021-11-04 13:30:25', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (258, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 26, '0:0:0:0:0:0:0:1', '2021-11-04 13:30:49', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (259, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{}]', 182, '0:0:0:0:0:0:0:1', '2021-11-04 13:30:50', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (260, 'admin', '获取所有权限菜单树', 'GET', '/vbenadmin/sys/menu/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getTreeList', '', '[{}]', 51, '0:0:0:0:0:0:0:1', '2021-11-04 13:30:59', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (261, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 10, '0:0:0:0:0:0:0:1', '2021-11-04 13:31:23', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (262, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{}]', 50, '0:0:0:0:0:0:0:1', '2021-11-04 13:31:23', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (263, 'admin', '分页获取角色列表', 'GET', '/vbenadmin/sys/role/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbendminRoleController.page', '', '[1,10,{}]', 77, '0:0:0:0:0:0:0:1', '2021-11-04 13:31:29', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (264, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 6, '0:0:0:0:0:0:0:1', '2021-11-04 13:31:44', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (265, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{}]', 35, '0:0:0:0:0:0:0:1', '2021-11-04 13:31:44', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (266, 'admin', '获取所有权限菜单树', 'GET', '/vbenadmin/sys/menu/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getTreeList', '', '[{}]', 12, '0:0:0:0:0:0:0:1', '2021-11-04 13:43:18', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (267, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 6, '0:0:0:0:0:0:0:1', '2021-11-04 13:43:27', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (268, 'admin', '分页获取角色列表', 'GET', '/vbenadmin/sys/role/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbendminRoleController.page', '', '[1,10,{}]', 5, '0:0:0:0:0:0:0:1', '2021-11-04 13:46:02', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (269, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 5, '0:0:0:0:0:0:0:1', '2021-11-04 13:46:08', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (270, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{}]', 32, '0:0:0:0:0:0:0:1', '2021-11-04 13:46:08', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (271, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{\"deptId\":19}]', 21, '0:0:0:0:0:0:0:1', '2021-11-04 13:46:56', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (272, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{\"deptId\":20}]', 7, '0:0:0:0:0:0:0:1', '2021-11-04 13:46:58', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (273, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{\"deptId\":19}]', 7, '0:0:0:0:0:0:0:1', '2021-11-04 13:46:59', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (274, 'admin', '分页获取角色列表', 'GET', '/vbenadmin/sys/role/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbendminRoleController.page', '', '[1,10,{}]', 6, '0:0:0:0:0:0:0:1', '2021-11-04 13:47:28', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (275, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 66, '0:0:0:0:0:0:0:1', '2021-11-04 13:47:51', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (276, 'admin', '分页查询', 'GET', '/vbenadmin/sys/dict/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 73, '0:0:0:0:0:0:0:1', '2021-11-04 13:47:54', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (277, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 10, '0:0:0:0:0:0:0:1', '2021-11-04 13:47:55', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (278, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[28,10,{}]', 7, '0:0:0:0:0:0:0:1', '2021-11-04 13:47:58', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (279, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 2, '0:0:0:0:0:0:0:1', '2021-11-04 13:48:02', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (280, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{}]', 24, '0:0:0:0:0:0:0:1', '2021-11-04 13:48:02', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (281, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{\"deptId\":19}]', 8, '0:0:0:0:0:0:0:1', '2021-11-04 13:49:35', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (282, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{\"deptId\":20}]', 6, '0:0:0:0:0:0:0:1', '2021-11-04 13:49:37', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (283, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{\"deptId\":19}]', 7, '0:0:0:0:0:0:0:1', '2021-11-04 13:49:38', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (284, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{\"deptId\":1}]', 36, '0:0:0:0:0:0:0:1', '2021-11-04 13:49:59', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (285, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 2, '0:0:0:0:0:0:0:1', '2021-11-04 13:50:40', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (286, 'admin', '获取所有角色', 'GET', '/vbenadmin/sys/role/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbendminRoleController.list', '', '[{}]', 3, '0:0:0:0:0:0:0:1', '2021-11-04 13:50:40', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (287, 'admin', '获取列表', 'GET', '/vbenadmin/sys/interface/category/list', b'1', 'class com.yaolong.rbac.commons.base.BaseController.list', '', '[{}]', 20, '0:0:0:0:0:0:0:1', '2021-11-04 14:07:45', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (288, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 5, '0:0:0:0:0:0:0:1', '2021-11-04 14:09:14', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (289, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 6, '0:0:0:0:0:0:0:1', '2021-11-04 14:09:19', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (290, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{}]', 33, '0:0:0:0:0:0:0:1', '2021-11-04 14:09:19', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (291, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{\"deptId\":19}]', 9, '0:0:0:0:0:0:0:1', '2021-11-04 14:09:58', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (292, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{\"deptId\":20}]', 7, '0:0:0:0:0:0:0:1', '2021-11-04 14:10:00', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (293, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{\"deptId\":19}]', 11, '0:0:0:0:0:0:0:1', '2021-11-04 14:10:01', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (294, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{\"deptId\":20}]', 10, '0:0:0:0:0:0:0:1', '2021-11-04 14:10:03', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (295, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{\"deptId\":19}]', 9, '0:0:0:0:0:0:0:1', '2021-11-04 14:10:04', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (296, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{\"deptId\":20}]', 10, '0:0:0:0:0:0:0:1', '2021-11-04 14:10:05', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (297, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{\"deptId\":19}]', 11, '0:0:0:0:0:0:0:1', '2021-11-04 14:10:06', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (298, 'admin', '获取登录用户信息', 'GET', '/vbenadmin/sys/user/info', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserInfoController.getUserInfo', '', '[]', 7, '0:0:0:0:0:0:0:1', '2021-11-04 14:29:53', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (299, 'admin', '获取当前用户权限码', 'GET', '/vbenadmin/sys/menu/authCode', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getPermissionCode', '', '[]', 52, '0:0:0:0:0:0:0:1', '2021-11-04 14:29:53', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (300, 'admin', '获取当前用户菜单树', 'GET', '/vbenadmin/sys/menu/auth/tree', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getAuthTree', '', '[]', 59, '0:0:0:0:0:0:0:1', '2021-11-04 14:29:53', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (301, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 4, '0:0:0:0:0:0:0:1', '2021-11-04 14:29:55', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (302, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{}]', 25, '0:0:0:0:0:0:0:1', '2021-11-04 14:29:55', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (303, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 3, '0:0:0:0:0:0:0:1', '2021-11-04 14:30:11', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (304, 'admin', '分页获取角色列表', 'GET', '/vbenadmin/sys/role/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbendminRoleController.page', '', '[1,10,{}]', 6, '0:0:0:0:0:0:0:1', '2021-11-04 14:30:14', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (305, 'admin', '获取列表', 'GET', '/vbenadmin/sys/interface/category/list', b'1', 'class com.yaolong.rbac.commons.base.BaseController.list', '', '[{}]', 2, '0:0:0:0:0:0:0:1', '2021-11-04 14:30:15', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (306, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 3, '0:0:0:0:0:0:0:1', '2021-11-04 14:30:19', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (307, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{}]', 23, '0:0:0:0:0:0:0:1', '2021-11-04 14:30:19', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (308, 'admin', '用户登录', 'POST', '/vbenadmin/sys/login', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminLoginController.login', 'application/json;charset=UTF-8', '[{\"password\":\"123456\",\"username\":\"admin\"},{\"response\":{\"response\":{}}}]', 1693, '0:0:0:0:0:0:0:1', '2021-12-18 21:21:10', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (309, 'admin', '获取登录用户信息', 'GET', '/vbenadmin/sys/user/info', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserInfoController.getUserInfo', '', '[]', 46, '0:0:0:0:0:0:0:1', '2021-12-18 21:21:11', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (310, 'admin', '获取当前用户权限码', 'GET', '/vbenadmin/sys/menu/authCode', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getPermissionCode', '', '[]', 78, '0:0:0:0:0:0:0:1', '2021-12-18 21:21:12', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (311, 'admin', '获取当前用户菜单树', 'GET', '/vbenadmin/sys/menu/auth/tree', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getAuthTree', '', '[]', 112, '0:0:0:0:0:0:0:1', '2021-12-18 21:21:12', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (312, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 81, '0:0:0:0:0:0:0:1', '2021-12-18 21:21:44', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (313, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{}]', 125, '0:0:0:0:0:0:0:1', '2021-12-18 21:21:44', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (314, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{\"deptId\":8}]', 41, '0:0:0:0:0:0:0:1', '2021-12-18 21:21:50', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (315, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{\"deptId\":11}]', 6, '0:0:0:0:0:0:0:1', '2021-12-18 21:21:52', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (316, 'admin', '获取所有权限菜单树', 'GET', '/vbenadmin/sys/menu/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getTreeList', '', '[{}]', 52, '0:0:0:0:0:0:0:1', '2021-12-18 21:21:55', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (317, 'admin', '分页查询', 'GET', '/vbenadmin/sys/dict/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 72, '0:0:0:0:0:0:0:1', '2021-12-18 21:22:38', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (318, 'admin', '获取所有权限菜单树', 'GET', '/vbenadmin/sys/menu/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getTreeList', '', '[{}]', 22, '0:0:0:0:0:0:0:1', '2021-12-18 21:24:13', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (319, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 15, '0:0:0:0:0:0:0:1', '2021-12-18 21:24:43', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (320, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 5, '0:0:0:0:0:0:0:1', '2021-12-18 21:24:51', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (321, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{}]', 42, '0:0:0:0:0:0:0:1', '2021-12-18 21:24:51', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (322, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{\"deptId\":1}]', 41, '0:0:0:0:0:0:0:1', '2021-12-18 21:25:26', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (323, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{}]', 58, '0:0:0:0:0:0:0:1', '2021-12-18 21:25:28', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (324, 'admin', '获取列表', 'GET', '/vbenadmin/sys/interface/category/list', b'1', 'class com.yaolong.rbac.commons.base.BaseController.list', '', '[{}]', 10, '0:0:0:0:0:0:0:1', '2021-12-18 21:25:49', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (325, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 17, '0:0:0:0:0:0:0:1', '2021-12-18 21:26:34', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (326, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[2,10,{}]', 10, '0:0:0:0:0:0:0:1', '2021-12-18 21:26:54', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (327, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[4,10,{}]', 7, '0:0:0:0:0:0:0:1', '2021-12-18 21:26:55', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (328, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[6,10,{}]', 6, '0:0:0:0:0:0:0:1', '2021-12-18 21:26:56', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (329, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[33,10,{}]', 8, '0:0:0:0:0:0:0:1', '2021-12-18 21:26:57', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (330, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[32,10,{}]', 7, '0:0:0:0:0:0:0:1', '2021-12-18 21:26:59', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (331, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[33,10,{}]', 9, '0:0:0:0:0:0:0:1', '2021-12-18 21:27:01', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (332, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 2, '0:0:0:0:0:0:0:1', '2021-12-18 21:28:05', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (333, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{}]', 33, '0:0:0:0:0:0:0:1', '2021-12-18 21:28:05', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (334, 'admin', '获取所有权限菜单树', 'GET', '/vbenadmin/sys/menu/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getTreeList', '', '[{}]', 7, '0:0:0:0:0:0:0:1', '2021-12-18 21:28:08', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (335, 'admin', '获取所有权限菜单树', 'GET', '/vbenadmin/sys/menu/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getTreeList', '', '[{}]', 7, '0:0:0:0:0:0:0:1', '2021-12-18 21:28:14', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (336, 'admin', '获取登录用户信息', 'GET', '/vbenadmin/sys/user/info', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserInfoController.getUserInfo', '', '[]', 69, '0:0:0:0:0:0:0:1', '2021-12-20 10:10:49', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (337, 'admin', '获取当前用户权限码', 'GET', '/vbenadmin/sys/menu/authCode', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getPermissionCode', '', '[]', 50, '0:0:0:0:0:0:0:1', '2021-12-20 10:10:49', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (338, 'admin', '获取当前用户菜单树', 'GET', '/vbenadmin/sys/menu/auth/tree', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getAuthTree', '', '[]', 67, '0:0:0:0:0:0:0:1', '2021-12-20 10:10:49', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (339, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 35, '0:0:0:0:0:0:0:1', '2021-12-20 10:11:23', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (340, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{}]', 113, '0:0:0:0:0:0:0:1', '2021-12-20 10:11:23', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (341, 'admin', '获取列表', 'GET', '/vbenadmin/sys/interface/category/list', b'1', 'class com.yaolong.rbac.commons.base.BaseController.list', '', '[{}]', 13, '0:0:0:0:0:0:0:1', '2021-12-20 10:11:57', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (342, 'admin', '分页获取角色列表', 'GET', '/vbenadmin/sys/role/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbendminRoleController.page', '', '[1,10,{}]', 19, '0:0:0:0:0:0:0:1', '2021-12-20 10:12:05', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (343, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 6, '0:0:0:0:0:0:0:1', '2021-12-20 10:12:08', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (344, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 6, '0:0:0:0:0:0:0:1', '2021-12-20 10:12:15', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (345, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{}]', 40, '0:0:0:0:0:0:0:1', '2021-12-20 10:12:15', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (346, 'admin', '获取登录用户信息', 'GET', '/vbenadmin/sys/user/info', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserInfoController.getUserInfo', '', '[]', 4, '0:0:0:0:0:0:0:1', '2021-12-20 10:13:08', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (347, 'admin', '获取当前用户权限码', 'GET', '/vbenadmin/sys/menu/authCode', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getPermissionCode', '', '[]', 41, '0:0:0:0:0:0:0:1', '2021-12-20 10:13:08', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (348, 'admin', '获取当前用户菜单树', 'GET', '/vbenadmin/sys/menu/auth/tree', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getAuthTree', '', '[]', 47, '0:0:0:0:0:0:0:1', '2021-12-20 10:13:08', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (349, 'admin', '获取登录用户信息', 'GET', '/vbenadmin/sys/user/info', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserInfoController.getUserInfo', '', '[]', 5, '0:0:0:0:0:0:0:1', '2021-12-20 10:13:14', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (350, 'admin', '获取当前用户权限码', 'GET', '/vbenadmin/sys/menu/authCode', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getPermissionCode', '', '[]', 8, '0:0:0:0:0:0:0:1', '2021-12-20 10:13:14', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (351, 'admin', '获取当前用户菜单树', 'GET', '/vbenadmin/sys/menu/auth/tree', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getAuthTree', '', '[]', 10, '0:0:0:0:0:0:0:1', '2021-12-20 10:13:14', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (352, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 3, '0:0:0:0:0:0:0:1', '2021-12-20 10:13:40', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (353, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{}]', 27, '0:0:0:0:0:0:0:1', '2021-12-20 10:13:40', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (354, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{\"deptId\":1}]', 46, '0:0:0:0:0:0:0:1', '2021-12-20 10:13:56', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (355, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{\"deptId\":2}]', 24, '0:0:0:0:0:0:0:1', '2021-12-20 10:13:57', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (356, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{\"deptId\":19}]', 6, '0:0:0:0:0:0:0:1', '2021-12-20 10:13:59', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (357, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{\"deptId\":20}]', 16, '0:0:0:0:0:0:0:1', '2021-12-20 10:13:59', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (358, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{\"deptId\":19}]', 7, '0:0:0:0:0:0:0:1', '2021-12-20 10:14:00', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (359, 'admin', '分页获取角色列表', 'GET', '/vbenadmin/sys/role/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbendminRoleController.page', '', '[1,10,{}]', 5, '0:0:0:0:0:0:0:1', '2021-12-20 10:14:10', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (360, 'admin', '获取所有权限菜单树', 'GET', '/vbenadmin/sys/menu/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getTreeList', '', '[{}]', 27, '0:0:0:0:0:0:0:1', '2021-12-20 10:14:33', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (361, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 66, '0:0:0:0:0:0:0:1', '2021-12-20 10:14:57', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (362, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 2, '0:0:0:0:0:0:0:1', '2021-12-20 10:15:00', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (363, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{}]', 27, '0:0:0:0:0:0:0:1', '2021-12-20 10:15:00', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (364, 'admin', '获取所有权限菜单树', 'GET', '/vbenadmin/sys/menu/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getTreeList', '', '[{}]', 12, '0:0:0:0:0:0:0:1', '2021-12-20 10:15:03', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (365, 'admin', '获取所有权限菜单树', 'GET', '/vbenadmin/sys/menu/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getTreeList', '', '[{}]', 6, '0:0:0:0:0:0:0:1', '2021-12-20 10:15:15', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (366, 'admin', '分页获取角色列表', 'GET', '/vbenadmin/sys/role/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbendminRoleController.page', '', '[1,10,{}]', 9, '0:0:0:0:0:0:0:1', '2021-12-20 10:16:17', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (367, 'admin', '获取所有权限菜单树', 'GET', '/vbenadmin/sys/menu/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getTreeList', '', '[{}]', 10, '0:0:0:0:0:0:0:1', '2021-12-20 10:16:21', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (368, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 3, '0:0:0:0:0:0:0:1', '2021-12-20 10:16:21', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (369, 'admin', '获取接口权限树', 'GET', '/vbenadmin/sys/interface/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminPermissionController.getPermissionTree', '', '[]', 9, '0:0:0:0:0:0:0:1', '2021-12-20 10:16:21', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (370, 'admin', '根据角色获取菜单列表', 'GET', '/vbenadmin/sys/menu/role/1', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getListByRoleId', '', '[1]', 11, '0:0:0:0:0:0:0:1', '2021-12-20 10:16:21', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (371, 'admin', '根据角色id获取部门列表', 'GET', '/vbenadmin/sys/dept/role/1', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[1]', 11, '0:0:0:0:0:0:0:1', '2021-12-20 10:16:21', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (372, 'admin', '通过角色ID获取权限列表', 'GET', '/vbenadmin/sys/interface/role/1', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminPermissionController.getPermissionListByRoleId', '', '[1]', 5, '0:0:0:0:0:0:0:1', '2021-12-20 10:16:21', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (373, 'admin', '用户登录', 'POST', '/vbenadmin/sys/login', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminLoginController.login', 'application/json;charset=UTF-8', '[{\"password\":\"123456\",\"username\":\"admin\"},{\"response\":{\"response\":{}}}]', 131, '0:0:0:0:0:0:0:1', '2021-12-20 10:24:20', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (374, 'admin', '获取登录用户信息', 'GET', '/vbenadmin/sys/user/info', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserInfoController.getUserInfo', '', '[]', 3, '0:0:0:0:0:0:0:1', '2021-12-20 10:24:20', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (375, 'admin', '获取当前用户权限码', 'GET', '/vbenadmin/sys/menu/authCode', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getPermissionCode', '', '[]', 11, '0:0:0:0:0:0:0:1', '2021-12-20 10:24:20', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (376, 'admin', '获取当前用户菜单树', 'GET', '/vbenadmin/sys/menu/auth/tree', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getAuthTree', '', '[]', 14, '0:0:0:0:0:0:0:1', '2021-12-20 10:24:20', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (377, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 7, '0:0:0:0:0:0:0:1', '2021-12-20 10:24:44', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (378, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 2, '0:0:0:0:0:0:0:1', '2021-12-20 10:24:45', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (379, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{}]', 25, '0:0:0:0:0:0:0:1', '2021-12-20 10:24:45', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (380, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 3, '0:0:0:0:0:0:0:1', '2021-12-20 10:25:21', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (381, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{}]', 24, '0:0:0:0:0:0:0:1', '2021-12-20 10:25:21', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (382, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 3, '0:0:0:0:0:0:0:1', '2021-12-20 10:25:27', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (383, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{}]', 21, '0:0:0:0:0:0:0:1', '2021-12-20 10:25:27', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (384, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 3, '0:0:0:0:0:0:0:1', '2021-12-20 10:25:32', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (385, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{}]', 24, '0:0:0:0:0:0:0:1', '2021-12-20 10:25:32', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (386, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 2, '0:0:0:0:0:0:0:1', '2021-12-20 10:25:34', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (387, 'admin', '获取所有角色', 'GET', '/vbenadmin/sys/role/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbendminRoleController.list', '', '[{}]', 3, '0:0:0:0:0:0:0:1', '2021-12-20 10:25:34', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (388, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 3, '0:0:0:0:0:0:0:1', '2021-12-20 10:25:45', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (389, 'admin', '获取所有角色', 'GET', '/vbenadmin/sys/role/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbendminRoleController.list', '', '[{}]', 2, '0:0:0:0:0:0:0:1', '2021-12-20 10:25:46', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (390, 'admin', '更新账户信息', 'PUT', '/vbenadmin/sys/user/account', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.update', 'application/json;charset=UTF-8', '[{\"realName\":\"小明\",\"nickName\":\"小明\",\"roles\":[1,2],\"deptId\":2,\"remark\":\"小明：超级管理员\",\"id\":1,\"userId\":2,\"email\":\"163@adc.com\",\"username\":\"admin\",\"status\":true}]', 111, '0:0:0:0:0:0:0:1', '2021-12-20 10:25:49', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (391, 'anonymousUser', '用户登录', 'POST', '/vbenadmin/sys/login', b'0', 'class com.yaolong.rbac.jwt.controller.SysVbenadminLoginController.login', 'application/json;charset=UTF-8', '[{\"password\":\"123456\",\"username\":\"admin\"},{\"response\":{\"response\":{}}}]', 5, '0:0:0:0:0:0:0:1', '2021-12-20 10:26:03', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (392, 'anonymousUser', '用户登录', 'POST', '/vbenadmin/sys/login', b'0', 'class com.yaolong.rbac.jwt.controller.SysVbenadminLoginController.login', 'application/json;charset=UTF-8', '[{\"password\":\"123456\",\"username\":\"admin\"},{\"response\":{\"response\":{}}}]', 4, '0:0:0:0:0:0:0:1', '2021-12-20 10:26:05', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (393, 'anonymousUser', '用户登录', 'POST', '/vbenadmin/sys/login', b'0', 'class com.yaolong.rbac.jwt.controller.SysVbenadminLoginController.login', 'application/json;charset=UTF-8', '[{\"password\":\"123456\",\"username\":\"admin\"},{\"response\":{\"response\":{}}}]', 4, '0:0:0:0:0:0:0:1', '2021-12-20 10:26:07', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (394, 'anonymousUser', '用户登录', 'POST', '/vbenadmin/sys/login', b'0', 'class com.yaolong.rbac.jwt.controller.SysVbenadminLoginController.login', 'application/json;charset=UTF-8', '[{\"password\":\"123456\",\"username\":\"admin\"},{\"response\":{\"response\":{}}}]', 4, '0:0:0:0:0:0:0:1', '2021-12-20 10:26:22', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (395, 'anonymousUser', '用户登录', 'POST', '/vbenadmin/sys/login', b'0', 'class com.yaolong.rbac.jwt.controller.SysVbenadminLoginController.login', 'application/json;charset=UTF-8', '[{\"password\":\"123456\",\"username\":\"admin\"},{\"response\":{\"response\":{}}}]', 4, '0:0:0:0:0:0:0:1', '2021-12-20 10:26:58', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (396, 'anonymousUser', '用户登录', 'POST', '/vbenadmin/sys/login', b'0', 'class com.yaolong.rbac.jwt.controller.SysVbenadminLoginController.login', 'application/json;charset=UTF-8', '[{\"password\":\"123456\",\"username\":\"admin\"},{\"response\":{\"response\":{}}}]', 4, '0:0:0:0:0:0:0:1', '2021-12-20 10:27:14', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (397, 'admin', '用户登录', 'POST', '/vbenadmin/sys/login', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminLoginController.login', 'application/json;charset=UTF-8', '[{\"password\":\"123456\",\"username\":\"admin\"},{\"response\":{\"response\":{}}}]', 107, '0:0:0:0:0:0:0:1', '2021-12-20 10:28:15', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (398, 'admin', '获取登录用户信息', 'GET', '/vbenadmin/sys/user/info', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserInfoController.getUserInfo', '', '[]', 4, '0:0:0:0:0:0:0:1', '2021-12-20 10:28:15', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (399, 'admin', '获取当前用户权限码', 'GET', '/vbenadmin/sys/menu/authCode', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getPermissionCode', '', '[]', 12, '0:0:0:0:0:0:0:1', '2021-12-20 10:28:15', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (400, 'admin', '获取当前用户菜单树', 'GET', '/vbenadmin/sys/menu/auth/tree', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getAuthTree', '', '[]', 12, '0:0:0:0:0:0:0:1', '2021-12-20 10:28:15', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (401, 'anonymousUser', '用户登录', 'POST', '/vbenadmin/sys/login', b'0', 'class com.yaolong.rbac.jwt.controller.SysVbenadminLoginController.login', 'application/json;charset=UTF-8', '[{\"password\":\"123456\",\"username\":\"admin\"},{\"response\":{\"response\":{}}}]', 4, '0:0:0:0:0:0:0:1', '2021-12-20 10:28:35', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (402, 'anonymousUser', '用户登录', 'POST', '/vbenadmin/sys/login', b'0', 'class com.yaolong.rbac.jwt.controller.SysVbenadminLoginController.login', 'application/json;charset=UTF-8', '[{\"password\":\"123456\",\"username\":\"admin\"},{\"response\":{\"response\":{}}}]', 4, '0:0:0:0:0:0:0:1', '2021-12-20 10:30:21', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (403, 'anonymousUser', '用户登录', 'POST', '/vbenadmin/sys/login', b'0', 'class com.yaolong.rbac.jwt.controller.SysVbenadminLoginController.login', 'application/json;charset=UTF-8', '[{\"password\":\"123456\",\"username\":\"admin\"},{\"response\":{\"response\":{}}}]', 4, '0:0:0:0:0:0:0:1', '2021-12-20 10:33:47', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (404, 'anonymousUser', '用户登录', 'POST', '/vbenadmin/sys/login', b'0', 'class com.yaolong.rbac.jwt.controller.SysVbenadminLoginController.login', 'application/json', '[{\"password\":\"123456\",\"username\":\"admin\"},{\"response\":{\"response\":{}}}]', 3, '0:0:0:0:0:0:0:1', '2021-12-20 10:37:27', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (405, 'anonymousUser', '用户登录', 'POST', '/vbenadmin/sys/login', b'0', 'class com.yaolong.rbac.jwt.controller.SysVbenadminLoginController.login', 'application/json', '[{\"password\":\"123456\",\"username\":\"admin\"},{\"response\":{\"response\":{}}}]', 3, '0:0:0:0:0:0:0:1', '2021-12-20 10:37:45', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (406, 'admin', '用户登录', 'POST', '/vbenadmin/sys/login', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminLoginController.login', 'application/json', '[{\"password\":\"123456\",\"username\":\"admin\"},{\"response\":{\"response\":{}}}]', 161, '0:0:0:0:0:0:0:1', '2021-12-20 10:38:01', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (407, 'anonymousUser', '用户登录', 'POST', '/vbenadmin/sys/login', b'0', 'class com.yaolong.rbac.jwt.controller.SysVbenadminLoginController.login', 'application/json', '[{\"password\":\"123456\",\"username\":\"admin1\"},{\"response\":{\"response\":{}}}]', 2, '0:0:0:0:0:0:0:1', '2021-12-20 10:38:47', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (408, 'admin', '用户登录', 'POST', '/vbenadmin/sys/login', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminLoginController.login', 'application/json', '[{\"password\":\"123456\",\"username\":\"admin\"},{\"response\":{\"response\":{}}}]', 117, '0:0:0:0:0:0:0:1', '2021-12-20 10:38:51', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (409, 'admin', '用户登录', 'POST', '/vbenadmin/sys/login', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminLoginController.login', 'application/json', '[{\"password\":\"123456\",\"username\":\"admin\"},{\"response\":{\"response\":{}}}]', 1235, '0:0:0:0:0:0:0:1', '2021-12-20 10:41:47', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (410, 'anonymousUser', '用户登录', 'POST', '/vbenadmin/sys/login', b'0', 'class com.yaolong.rbac.jwt.controller.SysVbenadminLoginController.login', 'application/json', '[{\"password\":\"123456\",\"username\":\"admin1\"},{\"response\":{\"response\":{}}}]', 9, '0:0:0:0:0:0:0:1', '2021-12-20 10:41:52', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (411, 'anonymousUser', '用户登录', 'POST', '/vbenadmin/sys/login', b'0', 'class com.yaolong.rbac.jwt.controller.SysVbenadminLoginController.login', 'application/json', '[{\"password\":\"123456\",\"username\":\"admin1\"},{\"response\":{\"response\":{}}}]', 6, '0:0:0:0:0:0:0:1', '2021-12-20 10:43:18', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (412, 'admin', '退出登录', 'GET', '/vbenadmin/sys/logout', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminLoginController.logout', '', '[]', 0, '0:0:0:0:0:0:0:1', '2021-12-20 10:46:05', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (413, 'anonymousUser', '用户登录', 'POST', '/vbenadmin/sys/login', b'0', 'class com.yaolong.rbac.jwt.controller.SysVbenadminLoginController.login', 'application/json;charset=UTF-8', '[{\"password\":\"123456QWE\",\"username\":\"admin请问\"},{\"response\":{\"response\":{}}}]', 17, '0:0:0:0:0:0:0:1', '2021-12-20 10:46:10', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (414, 'anonymousUser', '用户登录', 'POST', '/vbenadmin/sys/login', b'0', 'class com.yaolong.rbac.jwt.controller.SysVbenadminLoginController.login', 'application/json', '[{\"password\":\"123456\",\"username\":\"admin1\"},{\"response\":{\"response\":{}}}]', 617, '0:0:0:0:0:0:0:1', '2021-12-20 10:50:46', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (415, 'anonymousUser', '用户登录', 'POST', '/vbenadmin/sys/login', b'0', 'class com.yaolong.rbac.jwt.controller.SysVbenadminLoginController.login', 'application/json;charset=UTF-8', '[{\"password\":\"123456QWE\",\"username\":\"admin\"},{\"response\":{\"response\":{}}}]', 683, '0:0:0:0:0:0:0:1', '2021-12-20 10:54:14', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (416, 'admin', '用户登录', 'POST', '/vbenadmin/sys/login', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminLoginController.login', 'application/json;charset=UTF-8', '[{\"password\":\"123456\",\"username\":\"admin\"},{\"response\":{\"response\":{}}}]', 185, '0:0:0:0:0:0:0:1', '2021-12-20 10:54:22', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (417, 'admin', '获取登录用户信息', 'GET', '/vbenadmin/sys/user/info', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserInfoController.getUserInfo', '', '[]', 97, '0:0:0:0:0:0:0:1', '2021-12-20 10:54:22', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (418, 'admin', '获取当前用户权限码', 'GET', '/vbenadmin/sys/menu/authCode', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getPermissionCode', '', '[]', 59, '0:0:0:0:0:0:0:1', '2021-12-20 10:54:22', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (419, 'admin', '获取当前用户菜单树', 'GET', '/vbenadmin/sys/menu/auth/tree', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getAuthTree', '', '[]', 88, '0:0:0:0:0:0:0:1', '2021-12-20 10:54:22', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (420, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 56, '0:0:0:0:0:0:0:1', '2021-12-20 10:54:28', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (421, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{}]', 197, '0:0:0:0:0:0:0:1', '2021-12-20 10:54:28', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (422, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 6, '0:0:0:0:0:0:0:1', '2021-12-20 10:54:36', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (423, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{}]', 50, '0:0:0:0:0:0:0:1', '2021-12-20 10:54:36', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (424, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 6, '0:0:0:0:0:0:0:1', '2021-12-20 10:54:47', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (425, 'admin', '获取所有角色', 'GET', '/vbenadmin/sys/role/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbendminRoleController.list', '', '[{}]', 28, '0:0:0:0:0:0:0:1', '2021-12-20 10:54:47', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (426, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 5, '0:0:0:0:0:0:0:1', '2021-12-20 10:54:58', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (427, 'admin', '获取所有角色', 'GET', '/vbenadmin/sys/role/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbendminRoleController.list', '', '[{}]', 2, '0:0:0:0:0:0:0:1', '2021-12-20 10:54:58', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (428, 'admin', '获取所有权限菜单树', 'GET', '/vbenadmin/sys/menu/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getTreeList', '', '[{}]', 32, '0:0:0:0:0:0:0:1', '2021-12-20 10:55:07', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (429, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 4, '0:0:0:0:0:0:0:1', '2021-12-20 10:55:15', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (430, 'admin', '分页获取角色列表', 'GET', '/vbenadmin/sys/role/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbendminRoleController.page', '', '[1,10,{}]', 11, '0:0:0:0:0:0:0:1', '2021-12-20 10:56:12', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (431, 'anonymousUser', '用户登录', 'POST', '/vbenadmin/sys/login', b'0', 'class com.yaolong.rbac.jwt.controller.SysVbenadminLoginController.login', 'application/json', '[{\"password\":\"123456\",\"username\":\"admin1\"},{\"response\":{\"response\":{}}}]', 4, '0:0:0:0:0:0:0:1', '2021-12-20 10:56:25', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (432, 'anonymousUser', '用户登录', 'POST', '/vbenadmin/sys/login', b'0', 'class com.yaolong.rbac.jwt.controller.SysVbenadminLoginController.login', 'application/json', '[{\"password\":\"123456\",\"username\":\"admin1\"},{\"response\":{\"response\":{}}}]', 653, '0:0:0:0:0:0:0:1', '2021-12-20 10:58:37', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (433, 'anonymousUser', '用户登录', 'POST', '/vbenadmin/sys/login', b'0', 'class com.yaolong.rbac.jwt.controller.SysVbenadminLoginController.login', 'application/json', '[{\"password\":\"123456\",\"username\":\"admin1\"},{\"response\":{\"response\":{}}}]', 666, '0:0:0:0:0:0:0:1', '2021-12-20 11:35:25', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (434, 'anonymousUser', '用户登录', 'POST', '/vbenadmin/sys/login', b'0', 'class com.yaolong.rbac.jwt.controller.SysVbenadminLoginController.login', 'application/json', '[{\"password\":\"123456\",\"username\":\"admin1\"},{\"response\":{\"response\":{}}}]', 315, '0:0:0:0:0:0:0:1', '2021-12-20 11:40:49', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (435, 'anonymousUser', '用户登录', 'POST', '/vbenadmin/sys/login', b'0', 'class com.yaolong.rbac.jwt.controller.SysVbenadminLoginController.login', 'application/json', '[{\"password\":\"123456\",\"username\":\"admin1\"},{\"response\":{\"response\":{}}}]', 6, '0:0:0:0:0:0:0:1', '2021-12-20 11:40:52', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (436, 'anonymousUser', '用户登录', 'POST', '/vbenadmin/sys/login', b'0', 'class com.yaolong.rbac.jwt.controller.SysVbenadminLoginController.login', 'application/json', '[{\"password\":\"123ww456\",\"username\":\"admin\"},{\"response\":{\"response\":{}}}]', 128, '0:0:0:0:0:0:0:1', '2021-12-20 11:41:53', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (437, 'anonymousUser', '用户登录', 'POST', '/vbenadmin/sys/login', b'0', 'class com.yaolong.rbac.jwt.controller.SysVbenadminLoginController.login', 'application/json', '[{\"password\":\"123ww456\",\"username\":\"admin\"},{\"response\":{\"response\":{}}}]', 852, '0:0:0:0:0:0:0:1', '2021-12-20 11:43:08', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (438, 'anonymousUser', '用户登录', 'POST', '/vbenadmin/sys/login', b'0', 'class com.yaolong.rbac.jwt.controller.SysVbenadminLoginController.login', 'application/json', '[{\"password\":\"123ww456\",\"username\":\"admin\"},{\"response\":{\"response\":{}}}]', 785, '0:0:0:0:0:0:0:1', '2021-12-20 11:44:15', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (439, 'anonymousUser', '用户登录', 'POST', '/vbenadmin/sys/login', b'0', 'class com.yaolong.rbac.jwt.controller.SysVbenadminLoginController.login', 'application/json', '[{\"password\":\"123ww456\",\"username\":\"admin\"},{\"response\":{\"response\":{}}}]', 131, '0:0:0:0:0:0:0:1', '2021-12-20 11:46:54', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (440, 'anonymousUser', '登录', 'POST', '/vbenadmin/sys/login', b'0', 'class com.yaolong.rbac.jwt.controller.SysVbenadminLoginController.login', 'application/json', '[{\"password\":\"123ww456\",\"username\":\"admin\"},{\"response\":{\"response\":{}}}]', 758, '0:0:0:0:0:0:0:1', '2021-12-20 11:49:58', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (441, 'anonymousUser', '登录', 'POST', '/vbenadmin/sys/login', b'0', 'class com.yaolong.rbac.jwt.controller.SysVbenadminLoginController.login', 'application/json', '[{\"password\":\"123ww456\",\"username\":\"admin\"},{\"response\":{\"response\":{}}}]', 172, '0:0:0:0:0:0:0:1', '2021-12-20 11:50:24', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (442, 'anonymousUser', '登录', 'POST', '/vbenadmin/sys/login', b'0', 'class com.yaolong.rbac.jwt.controller.SysVbenadminLoginController.login', 'application/json', '[{\"password\":\"123ww456\",\"username\":\"admin\"},{\"response\":{\"response\":{}}}]', 426, '0:0:0:0:0:0:0:1', '2021-12-20 11:51:33', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (443, 'anonymousUser', '用户登录', 'POST', '/vbenadmin/sys/login', b'0', 'class com.yaolong.rbac.jwt.controller.SysVbenadminLoginController.login', 'application/json', '[{\"password\":\"123ww456\",\"username\":\"admin\"},{\"response\":{\"response\":{}}}]', 439, '0:0:0:0:0:0:0:1', '2021-12-20 11:59:30', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (444, 'anonymousUser', '用户登录', 'POST', '/vbenadmin/sys/login', b'0', 'class com.yaolong.rbac.jwt.controller.SysVbenadminLoginController.login', 'application/json', '[{\"password\":\"123ww456\",\"username\":\"admin\"},{\"response\":{\"response\":{}}}]', 469, '0:0:0:0:0:0:0:1', '2021-12-20 12:08:32', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (445, 'anonymousUser', '用户登录', 'POST', '/vbenadmin/sys/login', b'0', 'class com.yaolong.rbac.jwt.controller.SysVbenadminLoginController.login', 'application/json', '[{\"password\":\"123ww456\",\"username\":\"admin\"},{\"response\":{\"response\":{}}}]', 580, '0:0:0:0:0:0:0:1', '2021-12-20 12:12:36', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (446, 'admin', '获取登录用户信息', 'GET', '/vbenadmin/sys/user/info', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserInfoController.getUserInfo', '', '[]', 37, '0:0:0:0:0:0:0:1', '2021-12-20 12:13:33', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (447, 'admin', '获取当前用户权限码', 'GET', '/vbenadmin/sys/menu/authCode', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getPermissionCode', '', '[]', 41, '0:0:0:0:0:0:0:1', '2021-12-20 12:13:33', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (448, 'admin', '获取当前用户菜单树', 'GET', '/vbenadmin/sys/menu/auth/tree', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getAuthTree', '', '[]', 84, '0:0:0:0:0:0:0:1', '2021-12-20 12:13:33', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (449, 'admin', '分页获取角色列表', 'GET', '/vbenadmin/sys/role/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbendminRoleController.page', '', '[1,10,{}]', 59, '0:0:0:0:0:0:0:1', '2021-12-20 12:13:50', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (450, 'admin', '用户登录', 'POST', '/vbenadmin/sys/login', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminLoginController.login', 'application/json;charset=UTF-8', '[{\"password\":\"123456\",\"username\":\"admin\"},{\"response\":{\"response\":{}}}]', 125, '0:0:0:0:0:0:0:1', '2021-12-20 12:13:51', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (451, 'admin', '获取登录用户信息', 'GET', '/vbenadmin/sys/user/info', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserInfoController.getUserInfo', '', '[]', 5, '0:0:0:0:0:0:0:1', '2021-12-20 12:13:51', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (452, 'admin', '获取当前用户权限码', 'GET', '/vbenadmin/sys/menu/authCode', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getPermissionCode', '', '[]', 14, '0:0:0:0:0:0:0:1', '2021-12-20 12:13:51', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (453, 'admin', '获取当前用户菜单树', 'GET', '/vbenadmin/sys/menu/auth/tree', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getAuthTree', '', '[]', 21, '0:0:0:0:0:0:0:1', '2021-12-20 12:13:51', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (454, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 25, '0:0:0:0:0:0:0:1', '2021-12-20 12:13:58', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (455, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 67, '0:0:0:0:0:0:0:1', '2021-12-20 12:14:19', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (456, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{}]', 55, '0:0:0:0:0:0:0:1', '2021-12-20 12:14:19', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (457, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{\"deptId\":3}]', 17, '0:0:0:0:0:0:0:1', '2021-12-20 12:14:24', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (458, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{\"deptId\":1}]', 35, '0:0:0:0:0:0:0:1', '2021-12-20 12:14:25', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (459, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 7, '0:0:0:0:0:0:0:1', '2021-12-20 12:14:29', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (460, 'admin', '获取所有角色', 'GET', '/vbenadmin/sys/role/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbendminRoleController.list', '', '[{}]', 3, '0:0:0:0:0:0:0:1', '2021-12-20 12:14:29', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (461, 'admin', '更新账户信息', 'PUT', '/vbenadmin/sys/user/account', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.update', 'application/json;charset=UTF-8', '[{\"realName\":\"小明\",\"nickName\":\"小明\",\"roles\":[1,2],\"deptId\":2,\"remark\":\"小明：超级管理员\",\"id\":1,\"userId\":2,\"email\":\"163@adc.com\",\"username\":\"admin\",\"status\":true}]', 94, '0:0:0:0:0:0:0:1', '2021-12-20 12:14:31', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (462, 'anonymousUser', '用户登录', 'POST', '/vbenadmin/sys/login', b'0', 'class com.yaolong.rbac.jwt.controller.SysVbenadminLoginController.login', 'application/json;charset=UTF-8', '[{\"password\":\"123456\",\"username\":\"admin\"},{\"response\":{\"response\":{}}}]', 5, '0:0:0:0:0:0:0:1', '2021-12-20 12:14:44', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (463, 'anonymousUser', '用户登录', 'POST', '/vbenadmin/sys/login', b'0', 'class com.yaolong.rbac.jwt.controller.SysVbenadminLoginController.login', 'application/json;charset=UTF-8', '[{\"password\":\"123456\",\"username\":\"admin\"},{\"response\":{\"response\":{}}}]', 4, '0:0:0:0:0:0:0:1', '2021-12-20 12:14:47', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (464, 'anonymousUser', '用户登录', 'POST', '/vbenadmin/sys/login', b'0', 'class com.yaolong.rbac.jwt.controller.SysVbenadminLoginController.login', 'application/json;charset=UTF-8', '[{\"password\":\"123456\",\"username\":\"admin\"},{\"response\":{\"response\":{}}}]', 4, '0:0:0:0:0:0:0:1', '2021-12-20 12:14:48', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (465, 'anonymousUser', '用户登录', 'POST', '/vbenadmin/sys/login', b'0', 'class com.yaolong.rbac.jwt.controller.SysVbenadminLoginController.login', 'application/json;charset=UTF-8', '[{\"password\":\"123456\",\"username\":\"admin\"},{\"response\":{\"response\":{}}}]', 298, '0:0:0:0:0:0:0:1', '2021-12-20 12:52:17', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (466, 'admin', '用户登录', 'POST', '/vbenadmin/sys/login', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminLoginController.login', 'application/json;charset=UTF-8', '[{\"password\":\"123456\",\"username\":\"admin\"},{\"response\":{\"response\":{}}}]', 1491, '0:0:0:0:0:0:0:1', '2021-12-20 12:53:00', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (467, 'admin', '获取登录用户信息', 'GET', '/vbenadmin/sys/user/info', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserInfoController.getUserInfo', '', '[]', 30, '0:0:0:0:0:0:0:1', '2021-12-20 12:53:02', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (468, 'admin', '获取当前用户权限码', 'GET', '/vbenadmin/sys/menu/authCode', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getPermissionCode', '', '[]', 26, '0:0:0:0:0:0:0:1', '2021-12-20 12:53:02', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (469, 'admin', '获取当前用户菜单树', 'GET', '/vbenadmin/sys/menu/auth/tree', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getAuthTree', '', '[]', 52, '0:0:0:0:0:0:0:1', '2021-12-20 12:53:02', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (470, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 22, '0:0:0:0:0:0:0:1', '2021-12-20 12:53:08', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (471, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{}]', 99, '0:0:0:0:0:0:0:1', '2021-12-20 12:53:08', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (472, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 4, '0:0:0:0:0:0:0:1', '2021-12-20 12:54:57', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (473, 'admin', '分页获取角色列表', 'GET', '/vbenadmin/sys/role/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbendminRoleController.page', '', '[1,10,{}]', 16, '0:0:0:0:0:0:0:1', '2021-12-20 12:55:07', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (474, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 2, '0:0:0:0:0:0:0:1', '2021-12-20 12:55:38', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (475, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{}]', 39, '0:0:0:0:0:0:0:1', '2021-12-20 12:55:38', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (476, 'admin', '获取所有权限菜单树', 'GET', '/vbenadmin/sys/menu/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getTreeList', '', '[{}]', 28, '0:0:0:0:0:0:0:1', '2021-12-20 12:55:40', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (477, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 2, '0:0:0:0:0:0:0:1', '2021-12-20 12:56:20', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (478, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{}]', 22, '0:0:0:0:0:0:0:1', '2021-12-20 12:56:20', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (479, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{\"deptId\":11}]', 19, '0:0:0:0:0:0:0:1', '2021-12-20 13:03:34', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (480, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{\"deptId\":8}]', 17, '0:0:0:0:0:0:0:1', '2021-12-20 13:03:35', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (481, 'admin', '获取所有权限菜单树', 'GET', '/vbenadmin/sys/menu/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getTreeList', '', '[{}]', 6, '0:0:0:0:0:0:0:1', '2021-12-20 13:04:03', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (482, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 3, '0:0:0:0:0:0:0:1', '2021-12-20 13:04:04', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (483, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{}]', 24, '0:0:0:0:0:0:0:1', '2021-12-20 13:04:04', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (484, 'admin', '获取所有权限菜单树', 'GET', '/vbenadmin/sys/menu/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getTreeList', '', '[{}]', 7, '0:0:0:0:0:0:0:1', '2021-12-20 13:04:15', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (485, 'admin', '获取列表', 'GET', '/vbenadmin/sys/interface/category/list', b'1', 'class com.yaolong.rbac.commons.base.BaseController.list', '', '[{}]', 8, '0:0:0:0:0:0:0:1', '2021-12-20 13:04:20', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (486, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 2, '0:0:0:0:0:0:0:1', '2021-12-20 13:05:11', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (487, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{}]', 18, '0:0:0:0:0:0:0:1', '2021-12-20 13:05:11', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (488, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 5, '0:0:0:0:0:0:0:1', '2021-12-20 13:08:33', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (489, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 3, '0:0:0:0:0:0:0:1', '2021-12-20 13:08:42', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (490, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{}]', 36, '0:0:0:0:0:0:0:1', '2021-12-20 13:08:42', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (491, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 3, '0:0:0:0:0:0:0:1', '2021-12-20 13:09:21', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (492, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{}]', 28, '0:0:0:0:0:0:0:1', '2021-12-20 13:09:21', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (493, 'admin', '分页获取角色列表', 'GET', '/vbenadmin/sys/role/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbendminRoleController.page', '', '[1,10,{}]', 4, '0:0:0:0:0:0:0:1', '2021-12-20 13:09:23', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (494, 'admin', '获取所有权限菜单树', 'GET', '/vbenadmin/sys/menu/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getTreeList', '', '[{}]', 10, '0:0:0:0:0:0:0:1', '2021-12-20 13:09:28', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (495, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 4, '0:0:0:0:0:0:0:1', '2021-12-20 13:09:28', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (496, 'admin', '获取接口权限树', 'GET', '/vbenadmin/sys/interface/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminPermissionController.getPermissionTree', '', '[]', 8, '0:0:0:0:0:0:0:1', '2021-12-20 13:09:28', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (497, 'admin', '根据角色获取菜单列表', 'GET', '/vbenadmin/sys/menu/role/6', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getListByRoleId', '', '[6]', 6, '0:0:0:0:0:0:0:1', '2021-12-20 13:09:28', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (498, 'admin', '根据角色id获取部门列表', 'GET', '/vbenadmin/sys/dept/role/6', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[6]', 4, '0:0:0:0:0:0:0:1', '2021-12-20 13:09:29', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (499, 'admin', '通过角色ID获取权限列表', 'GET', '/vbenadmin/sys/interface/role/6', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminPermissionController.getPermissionListByRoleId', '', '[6]', 4, '0:0:0:0:0:0:0:1', '2021-12-20 13:09:29', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (500, 'admin', '根据角色获取菜单列表', 'GET', '/vbenadmin/sys/menu/role/1', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getListByRoleId', '', '[1]', 6, '0:0:0:0:0:0:0:1', '2021-12-20 13:10:18', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (501, 'admin', '根据角色id获取部门列表', 'GET', '/vbenadmin/sys/dept/role/1', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[1]', 2, '0:0:0:0:0:0:0:1', '2021-12-20 13:10:18', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (502, 'admin', '通过角色ID获取权限列表', 'GET', '/vbenadmin/sys/interface/role/1', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminPermissionController.getPermissionListByRoleId', '', '[1]', 2, '0:0:0:0:0:0:0:1', '2021-12-20 13:10:18', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (503, 'admin', '根据角色获取菜单列表', 'GET', '/vbenadmin/sys/menu/role/1', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getListByRoleId', '', '[1]', 4, '0:0:0:0:0:0:0:1', '2021-12-20 13:10:31', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (504, 'admin', '根据角色id获取部门列表', 'GET', '/vbenadmin/sys/dept/role/1', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[1]', 2, '0:0:0:0:0:0:0:1', '2021-12-20 13:10:31', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (505, 'admin', '通过角色ID获取权限列表', 'GET', '/vbenadmin/sys/interface/role/1', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminPermissionController.getPermissionListByRoleId', '', '[1]', 3, '0:0:0:0:0:0:0:1', '2021-12-20 13:10:31', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (506, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 2, '0:0:0:0:0:0:0:1', '2021-12-20 13:10:46', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (507, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{}]', 18, '0:0:0:0:0:0:0:1', '2021-12-20 13:10:46', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (508, 'admin', '获取所有权限菜单树', 'GET', '/vbenadmin/sys/menu/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getTreeList', '', '[{}]', 6, '0:0:0:0:0:0:0:1', '2021-12-20 13:10:55', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (509, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 3, '0:0:0:0:0:0:0:1', '2021-12-20 13:11:54', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (510, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{}]', 22, '0:0:0:0:0:0:0:1', '2021-12-20 13:11:55', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (511, 'admin', '分页查询', 'GET', '/vbenadmin/sys/dict/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 61, '0:0:0:0:0:0:0:1', '2021-12-20 13:14:33', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (512, 'admin', '分页获取角色列表', 'GET', '/vbenadmin/sys/role/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbendminRoleController.page', '', '[1,10,{}]', 3, '0:0:0:0:0:0:0:1', '2021-12-20 13:14:36', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (513, 'admin', '获取所有权限菜单树', 'GET', '/vbenadmin/sys/menu/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getTreeList', '', '[{}]', 5, '0:0:0:0:0:0:0:1', '2021-12-20 13:14:38', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (514, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 3, '0:0:0:0:0:0:0:1', '2021-12-20 13:14:38', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (515, 'admin', '获取接口权限树', 'GET', '/vbenadmin/sys/interface/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminPermissionController.getPermissionTree', '', '[]', 2, '0:0:0:0:0:0:0:1', '2021-12-20 13:14:38', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (516, 'admin', '根据角色获取菜单列表', 'GET', '/vbenadmin/sys/menu/role/2', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getListByRoleId', '', '[2]', 18, '0:0:0:0:0:0:0:1', '2021-12-20 13:14:38', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (517, 'admin', '根据角色id获取部门列表', 'GET', '/vbenadmin/sys/dept/role/2', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[2]', 2, '0:0:0:0:0:0:0:1', '2021-12-20 13:14:38', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (518, 'admin', '通过角色ID获取权限列表', 'GET', '/vbenadmin/sys/interface/role/2', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminPermissionController.getPermissionListByRoleId', '', '[2]', 2, '0:0:0:0:0:0:0:1', '2021-12-20 13:14:38', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (519, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 2, '0:0:0:0:0:0:0:1', '2021-12-20 13:15:37', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (520, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{}]', 21, '0:0:0:0:0:0:0:1', '2021-12-20 13:15:37', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (521, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 3, '0:0:0:0:0:0:0:1', '2021-12-20 13:15:40', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (522, 'admin', '获取所有角色', 'GET', '/vbenadmin/sys/role/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbendminRoleController.list', '', '[{}]', 3, '0:0:0:0:0:0:0:1', '2021-12-20 13:15:40', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (523, 'admin', '创建账户信息', 'POST', '/vbenadmin/sys/user/account', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.create', 'application/json;charset=UTF-8', '[{\"realName\":\"asdasd\",\"nickName\":\"asdasd\",\"roles\":[2],\"deptId\":3,\"email\":\"12@qq.com\",\"username\":\"abc\",\"status\":false}]', 192, '0:0:0:0:0:0:0:1', '2021-12-20 13:16:03', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (524, 'admin', '创建账户信息', 'POST', '/vbenadmin/sys/user/account', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.create', 'application/json;charset=UTF-8', '[{\"realName\":\"asdasd\",\"nickName\":\"asdasd\",\"roles\":[2],\"deptId\":3,\"email\":\"12@qq.com\",\"username\":\"abcd\",\"status\":false}]', 124, '0:0:0:0:0:0:0:1', '2021-12-20 13:16:08', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (525, 'admin', '创建账户信息', 'POST', '/vbenadmin/sys/user/account', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.create', 'application/json;charset=UTF-8', '[{\"realName\":\"asdasd\",\"nickName\":\"asdasd\",\"roles\":[2],\"deptId\":3,\"email\":\"12@qq.com\",\"username\":\"abcde\",\"status\":false}]', 157, '0:0:0:0:0:0:0:1', '2021-12-20 13:16:11', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (526, 'admin', '创建账户信息', 'POST', '/vbenadmin/sys/user/account', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.create', 'application/json;charset=UTF-8', '[{\"realName\":\"asdasd\",\"nickName\":\"asdasd\",\"roles\":[2],\"deptId\":3,\"email\":\"12@qq.com\",\"username\":\"123456\",\"status\":false}]', 156, '0:0:0:0:0:0:0:1', '2021-12-20 13:17:58', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (527, 'admin', '创建账户信息', 'POST', '/vbenadmin/sys/user/account', b'0', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.create', 'application/json;charset=UTF-8', '[{\"realName\":\"asdasd\",\"nickName\":\"asdasd\",\"roles\":[2],\"deptId\":3,\"email\":\"12@qq.com\",\"username\":\"123456\",\"status\":false}]', 22, '0:0:0:0:0:0:0:1', '2021-12-20 13:21:41', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (528, 'admin', '创建账户信息', 'POST', '/vbenadmin/sys/user/account', b'0', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.create', 'application/json;charset=UTF-8', '[{\"realName\":\"asdasd\",\"nickName\":\"asdasd\",\"roles\":[2],\"deptId\":3,\"email\":\"12@qq.com\",\"username\":\"123456\",\"status\":false}]', 84895, '0:0:0:0:0:0:0:1', '2021-12-20 13:22:42', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (529, 'admin', '创建账户信息', 'POST', '/vbenadmin/sys/user/account', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.create', 'application/json;charset=UTF-8', '[{\"realName\":\"asdasd\",\"nickName\":\"asdasd\",\"roles\":[2],\"deptId\":3,\"email\":\"12@qq.com\",\"username\":\"luo\",\"status\":false}]', 12839, '0:0:0:0:0:0:0:1', '2021-12-20 13:24:07', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (530, 'admin', '创建账户信息', 'POST', '/vbenadmin/sys/user/account', b'0', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.create', 'application/json;charset=UTF-8', '[{\"realName\":\"asdasd\",\"nickName\":\"asdasd\",\"roles\":[2],\"deptId\":3,\"email\":\"12@qq.com\",\"username\":\"luo\",\"status\":false}]', 23, '0:0:0:0:0:0:0:1', '2021-12-20 13:24:39', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (531, 'admin', '创建账户信息', 'POST', '/vbenadmin/sys/user/account', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.create', 'application/json;charset=UTF-8', '[{\"realName\":\"asdasd\",\"nickName\":\"asdasd\",\"roles\":[2],\"deptId\":3,\"email\":\"12@qq.com\",\"username\":\"luo1\",\"status\":false}]', 216, '0:0:0:0:0:0:0:1', '2021-12-20 13:26:04', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (532, 'admin', '创建账户信息', 'POST', '/vbenadmin/sys/user/account', b'0', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.create', 'application/json;charset=UTF-8', '[{\"realName\":\"asdasd\",\"nickName\":\"asdasd\",\"roles\":[2],\"deptId\":3,\"email\":\"12@qq.com\",\"username\":\"luo1\",\"status\":false}]', 36, '0:0:0:0:0:0:0:1', '2021-12-20 13:27:54', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (533, 'admin', '创建账户信息', 'POST', '/vbenadmin/sys/user/account', b'0', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.create', 'application/json;charset=UTF-8', '[{\"realName\":\"asdasd\",\"nickName\":\"asdasd\",\"roles\":[2],\"deptId\":3,\"email\":\"12@qq.com\",\"username\":\"luo1\",\"status\":false}]', 4, '0:0:0:0:0:0:0:1', '2021-12-20 13:27:56', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (534, 'admin', '创建账户信息', 'POST', '/vbenadmin/sys/user/account', b'0', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.create', 'application/json;charset=UTF-8', '[{\"realName\":\"asdasd\",\"nickName\":\"asdasd\",\"roles\":[2],\"deptId\":3,\"email\":\"12@qq.com\",\"username\":\"luo1\",\"status\":false}]', 4, '0:0:0:0:0:0:0:1', '2021-12-20 13:27:57', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (535, 'admin', '创建账户信息', 'POST', '/vbenadmin/sys/user/account', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.create', 'application/json;charset=UTF-8', '[{\"realName\":\"asdasd\",\"nickName\":\"asdasd\",\"roles\":[2],\"deptId\":3,\"email\":\"12@qq.com\",\"username\":\"luo1\",\"status\":false}]', 41, '0:0:0:0:0:0:0:1', '2021-12-20 13:28:46', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (536, 'admin', '创建账户信息', 'POST', '/vbenadmin/sys/user/account', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.create', 'application/json;charset=UTF-8', '[{\"realName\":\"asdasd\",\"nickName\":\"asdasd\",\"roles\":[2],\"deptId\":3,\"email\":\"12@qq.com\",\"username\":\"luo2\",\"status\":false}]', 214, '0:0:0:0:0:0:0:1', '2021-12-20 13:28:50', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (537, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{}]', 107, '0:0:0:0:0:0:0:1', '2021-12-20 13:28:50', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (538, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{}]', 33, '0:0:0:0:0:0:0:1', '2021-12-20 13:28:56', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (539, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[2,10,{}]', 21, '0:0:0:0:0:0:0:1', '2021-12-20 13:29:03', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (540, 'admin', '退出登录', 'GET', '/vbenadmin/sys/logout', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminLoginController.logout', '', '[]', 3, '0:0:0:0:0:0:0:1', '2021-12-20 13:29:14', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (541, 'luo2', '用户登录', 'POST', '/vbenadmin/sys/login', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminLoginController.login', 'application/json;charset=UTF-8', '[{\"password\":\"123456\",\"username\":\"luo2\"},{\"response\":{\"response\":{}}}]', 150, '0:0:0:0:0:0:0:1', '2021-12-20 13:29:19', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (542, 'luo2', '获取登录用户信息', 'GET', '/vbenadmin/sys/user/info', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserInfoController.getUserInfo', '', '[]', 6, '0:0:0:0:0:0:0:1', '2021-12-20 13:29:19', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (543, 'luo2', '获取当前用户权限码', 'GET', '/vbenadmin/sys/menu/authCode', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getPermissionCode', '', '[]', 28, '0:0:0:0:0:0:0:1', '2021-12-20 13:29:19', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (544, 'luo2', '获取当前用户菜单树', 'GET', '/vbenadmin/sys/menu/auth/tree', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getAuthTree', '', '[]', 36, '0:0:0:0:0:0:0:1', '2021-12-20 13:29:19', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (545, 'luo2', '获取登录用户信息', 'GET', '/vbenadmin/sys/user/info', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserInfoController.getUserInfo', '', '[]', 3, '0:0:0:0:0:0:0:1', '2021-12-20 13:29:32', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (546, 'luo2', '获取当前用户权限码', 'GET', '/vbenadmin/sys/menu/authCode', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getPermissionCode', '', '[]', 27, '0:0:0:0:0:0:0:1', '2021-12-20 13:29:33', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (547, 'luo2', '获取当前用户菜单树', 'GET', '/vbenadmin/sys/menu/auth/tree', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getAuthTree', '', '[]', 82, '0:0:0:0:0:0:0:1', '2021-12-20 13:29:33', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (548, 'luo2', '退出登录', 'GET', '/vbenadmin/sys/logout', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminLoginController.logout', '', '[]', 0, '0:0:0:0:0:0:0:1', '2021-12-20 13:29:38', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (549, 'admin', '用户登录', 'POST', '/vbenadmin/sys/login', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminLoginController.login', 'application/json;charset=UTF-8', '[{\"password\":\"123456\",\"username\":\"admin\"},{\"response\":{\"response\":{}}}]', 121, '0:0:0:0:0:0:0:1', '2021-12-20 13:29:41', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (550, 'admin', '获取登录用户信息', 'GET', '/vbenadmin/sys/user/info', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserInfoController.getUserInfo', '', '[]', 4, '0:0:0:0:0:0:0:1', '2021-12-20 13:29:41', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (551, 'admin', '获取当前用户权限码', 'GET', '/vbenadmin/sys/menu/authCode', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getPermissionCode', '', '[]', 8, '0:0:0:0:0:0:0:1', '2021-12-20 13:29:41', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (552, 'admin', '获取当前用户菜单树', 'GET', '/vbenadmin/sys/menu/auth/tree', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getAuthTree', '', '[]', 11, '0:0:0:0:0:0:0:1', '2021-12-20 13:29:41', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (553, 'admin', '分页获取角色列表', 'GET', '/vbenadmin/sys/role/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbendminRoleController.page', '', '[1,10,{}]', 11, '0:0:0:0:0:0:0:1', '2021-12-20 13:29:50', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (554, 'admin', '获取所有权限菜单树', 'GET', '/vbenadmin/sys/menu/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getTreeList', '', '[{}]', 30, '0:0:0:0:0:0:0:1', '2021-12-20 13:29:53', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (555, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 13, '0:0:0:0:0:0:0:1', '2021-12-20 13:29:53', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (556, 'admin', '获取接口权限树', 'GET', '/vbenadmin/sys/interface/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminPermissionController.getPermissionTree', '', '[]', 14, '0:0:0:0:0:0:0:1', '2021-12-20 13:29:53', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (557, 'admin', '根据角色获取菜单列表', 'GET', '/vbenadmin/sys/menu/role/2', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getListByRoleId', '', '[2]', 5, '0:0:0:0:0:0:0:1', '2021-12-20 13:29:53', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (558, 'admin', '根据角色id获取部门列表', 'GET', '/vbenadmin/sys/dept/role/2', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[2]', 3, '0:0:0:0:0:0:0:1', '2021-12-20 13:29:53', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (559, 'admin', '通过角色ID获取权限列表', 'GET', '/vbenadmin/sys/interface/role/2', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminPermissionController.getPermissionListByRoleId', '', '[2]', 4, '0:0:0:0:0:0:0:1', '2021-12-20 13:29:53', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (560, 'admin', '分页获取角色列表', 'GET', '/vbenadmin/sys/role/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbendminRoleController.page', '', '[1,10,{}]', 4, '0:0:0:0:0:0:0:1', '2021-12-20 13:30:20', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (561, 'admin', '更新角色', 'PUT', '/vbenadmin/sys/role', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbendminRoleController.update', 'application/json;charset=UTF-8', '[{\"orderNo\":2,\"itfIds\":[1,2,4,9],\"name\":\"普通用户\",\"enName\":\"ROLE_USER\",\"remark\":\"普通用户\",\"id\":2,\"deptIds\":[3],\"menuIds\":[2,31,3,24,26,20,5,6,30,8,11,12,18,22,21,1],\"status\":true}]', 104, '0:0:0:0:0:0:0:1', '2021-12-20 13:30:20', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (562, 'admin', '退出登录', 'GET', '/vbenadmin/sys/logout', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminLoginController.logout', '', '[]', 1, '0:0:0:0:0:0:0:1', '2021-12-20 13:30:26', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (563, 'luo2', '用户登录', 'POST', '/vbenadmin/sys/login', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminLoginController.login', 'application/json;charset=UTF-8', '[{\"password\":\"123456\",\"username\":\"luo2\"},{\"response\":{\"response\":{}}}]', 355, '0:0:0:0:0:0:0:1', '2021-12-20 13:30:29', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (564, 'luo2', '获取登录用户信息', 'GET', '/vbenadmin/sys/user/info', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserInfoController.getUserInfo', '', '[]', 9, '0:0:0:0:0:0:0:1', '2021-12-20 13:30:29', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (565, 'luo2', '获取当前用户权限码', 'GET', '/vbenadmin/sys/menu/authCode', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getPermissionCode', '', '[]', 22, '0:0:0:0:0:0:0:1', '2021-12-20 13:30:29', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (566, 'luo2', '获取当前用户菜单树', 'GET', '/vbenadmin/sys/menu/auth/tree', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getAuthTree', '', '[]', 29, '0:0:0:0:0:0:0:1', '2021-12-20 13:30:29', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (567, 'luo2', '分页获取角色列表', 'GET', '/vbenadmin/sys/role/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbendminRoleController.page', '', '[1,10,{}]', 5, '0:0:0:0:0:0:0:1', '2021-12-20 13:30:44', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (568, 'luo2', '获取所有权限菜单树', 'GET', '/vbenadmin/sys/menu/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getTreeList', '', '[{}]', 6, '0:0:0:0:0:0:0:1', '2021-12-20 13:30:48', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (569, 'luo2', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 13, '0:0:0:0:0:0:0:1', '2021-12-20 13:30:48', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (570, 'luo2', '获取接口权限树', 'GET', '/vbenadmin/sys/interface/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminPermissionController.getPermissionTree', '', '[]', 6, '0:0:0:0:0:0:0:1', '2021-12-20 13:30:48', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (571, 'luo2', '根据角色获取菜单列表', 'GET', '/vbenadmin/sys/menu/role/2', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getListByRoleId', '', '[2]', 5, '0:0:0:0:0:0:0:1', '2021-12-20 13:30:48', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (572, 'luo2', '根据角色id获取部门列表', 'GET', '/vbenadmin/sys/dept/role/2', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[2]', 2, '0:0:0:0:0:0:0:1', '2021-12-20 13:30:48', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (573, 'luo2', '通过角色ID获取权限列表', 'GET', '/vbenadmin/sys/interface/role/2', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminPermissionController.getPermissionListByRoleId', '', '[2]', 2, '0:0:0:0:0:0:0:1', '2021-12-20 13:30:48', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (574, 'luo2', '分页获取角色列表', 'GET', '/vbenadmin/sys/role/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbendminRoleController.page', '', '[1,10,{}]', 3, '0:0:0:0:0:0:0:1', '2021-12-20 13:30:55', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (575, 'luo2', '更新角色', 'PUT', '/vbenadmin/sys/role', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbendminRoleController.update', 'application/json;charset=UTF-8', '[{\"orderNo\":2,\"itfIds\":[1,2,4,9],\"name\":\"普通用户\",\"enName\":\"ROLE_USER\",\"remark\":\"普通用户\",\"id\":2,\"deptIds\":[3],\"menuIds\":[2,31,3,24,26,20,5,6,30,8,11,12,32,1,18,22,21],\"status\":true}]', 88, '0:0:0:0:0:0:0:1', '2021-12-20 13:30:55', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (576, 'luo2', '获取登录用户信息', 'GET', '/vbenadmin/sys/user/info', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserInfoController.getUserInfo', '', '[]', 4, '0:0:0:0:0:0:0:1', '2021-12-20 13:31:02', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (577, 'luo2', '获取当前用户菜单树', 'GET', '/vbenadmin/sys/menu/auth/tree', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getAuthTree', '', '[]', 12, '0:0:0:0:0:0:0:1', '2021-12-20 13:31:02', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (578, 'luo2', '获取当前用户权限码', 'GET', '/vbenadmin/sys/menu/authCode', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getPermissionCode', '', '[]', 13, '0:0:0:0:0:0:0:1', '2021-12-20 13:31:02', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (579, 'luo2', '分页获取角色列表', 'GET', '/vbenadmin/sys/role/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbendminRoleController.page', '', '[1,10,{}]', 7, '0:0:0:0:0:0:0:1', '2021-12-20 13:31:04', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (580, 'luo2', '分页查询', 'GET', '/vbenadmin/sys/dict/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 46, '0:0:0:0:0:0:0:1', '2021-12-20 13:31:10', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (581, 'luo2', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 13, '0:0:0:0:0:0:0:1', '2021-12-20 13:31:12', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (582, 'luo2', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[2,10,{}]', 6, '0:0:0:0:0:0:0:1', '2021-12-20 13:31:15', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (583, 'luo2', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[3,10,{}]', 5, '0:0:0:0:0:0:0:1', '2021-12-20 13:31:16', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (584, 'luo2', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[4,10,{}]', 5, '0:0:0:0:0:0:0:1', '2021-12-20 13:31:17', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (585, 'luo2', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[6,10,{}]', 4, '0:0:0:0:0:0:0:1', '2021-12-20 13:31:18', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (586, 'luo2', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[59,10,{}]', 5, '0:0:0:0:0:0:0:1', '2021-12-20 13:31:19', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (587, 'luo2', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[57,10,{}]', 8, '0:0:0:0:0:0:0:1', '2021-12-20 13:31:21', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (588, 'luo2', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[58,10,{}]', 5, '0:0:0:0:0:0:0:1', '2021-12-20 13:31:23', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (589, 'luo2', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[59,10,{}]', 5, '0:0:0:0:0:0:0:1', '2021-12-20 13:31:24', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (590, 'luo2', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 3, '0:0:0:0:0:0:0:1', '2021-12-20 13:31:44', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (591, 'luo2', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{}]', 21, '0:0:0:0:0:0:0:1', '2021-12-20 13:31:44', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (592, 'luo2', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 4, '0:0:0:0:0:0:0:1', '2021-12-20 13:31:45', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (593, 'luo2', '获取所有角色', 'GET', '/vbenadmin/sys/role/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbendminRoleController.list', '', '[{}]', 19, '0:0:0:0:0:0:0:1', '2021-12-20 13:31:45', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (594, 'luo2', '创建账户信息', 'POST', '/vbenadmin/sys/user/account', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.create', 'application/json;charset=UTF-8', '[{\"realName\":\"123\",\"nickName\":\"13\",\"roles\":[2],\"deptId\":3,\"remark\":\"123\",\"email\":\"123\",\"username\":\"luo\",\"status\":false}]', 8, '0:0:0:0:0:0:0:1', '2021-12-20 13:31:56', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (595, 'luo2', '获取所有权限菜单树', 'GET', '/vbenadmin/sys/menu/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getTreeList', '', '[{}]', 5, '0:0:0:0:0:0:0:1', '2021-12-20 13:32:05', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (596, 'luo2', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 3, '0:0:0:0:0:0:0:1', '2021-12-20 13:32:08', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (597, 'luo2', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{}]', 20, '0:0:0:0:0:0:0:1', '2021-12-20 13:32:08', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (598, 'luo2', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 3, '0:0:0:0:0:0:0:1', '2021-12-20 13:32:09', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (599, 'luo2', '获取所有角色', 'GET', '/vbenadmin/sys/role/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbendminRoleController.list', '', '[{}]', 6, '0:0:0:0:0:0:0:1', '2021-12-20 13:32:09', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (600, 'luo2', '创建账户信息', 'POST', '/vbenadmin/sys/user/account', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.create', 'application/json;charset=UTF-8', '[{\"realName\":\"13\",\"nickName\":\"123\",\"roles\":[2],\"deptId\":3,\"remark\":\"123\",\"email\":\"123\",\"username\":\"haha\",\"status\":false}]', 160, '0:0:0:0:0:0:0:1', '2021-12-20 13:32:18', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (601, 'luo2', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{}]', 17, '0:0:0:0:0:0:0:1', '2021-12-20 13:32:18', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (602, 'luo2', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 4, '0:0:0:0:0:0:0:1', '2021-12-20 13:32:25', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (603, 'luo2', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[60,10,{}]', 6, '0:0:0:0:0:0:0:1', '2021-12-20 13:32:37', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (604, 'luo2', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[61,10,{}]', 6, '0:0:0:0:0:0:0:1', '2021-12-20 13:32:43', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (605, 'luo2', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[60,10,{}]', 7, '0:0:0:0:0:0:0:1', '2021-12-20 13:32:45', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (606, 'luo2', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[59,10,{}]', 7, '0:0:0:0:0:0:0:1', '2021-12-20 13:32:47', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (607, 'luo2', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[58,10,{}]', 6, '0:0:0:0:0:0:0:1', '2021-12-20 13:32:51', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (608, 'luo2', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[57,10,{}]', 5, '0:0:0:0:0:0:0:1', '2021-12-20 13:32:58', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (609, 'luo2', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[56,10,{}]', 5, '0:0:0:0:0:0:0:1', '2021-12-20 13:33:01', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (610, 'luo2', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[55,10,{}]', 5, '0:0:0:0:0:0:0:1', '2021-12-20 13:33:05', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (611, 'luo2', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[54,10,{}]', 6, '0:0:0:0:0:0:0:1', '2021-12-20 13:33:07', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (612, 'luo2', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[52,10,{}]', 4, '0:0:0:0:0:0:0:1', '2021-12-20 13:33:08', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (613, 'luo2', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[51,10,{}]', 7, '0:0:0:0:0:0:0:1', '2021-12-20 13:33:09', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (614, 'luo2', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 2, '0:0:0:0:0:0:0:1', '2021-12-20 13:33:52', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (615, 'luo2', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{}]', 20, '0:0:0:0:0:0:0:1', '2021-12-20 13:33:52', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (616, 'luo2', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 1, '0:0:0:0:0:0:0:1', '2021-12-20 13:33:53', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (617, 'luo2', '获取所有角色', 'GET', '/vbenadmin/sys/role/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbendminRoleController.list', '', '[{}]', 1, '0:0:0:0:0:0:0:1', '2021-12-20 13:33:53', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (618, 'luo2', '创建账户信息', 'POST', '/vbenadmin/sys/user/account', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.create', 'application/json;charset=UTF-8', '[{\"realName\":\"qwe\",\"nickName\":\"qwe\",\"roles\":[2],\"deptId\":3,\"remark\":\"qwe\",\"email\":\"qwe\",\"username\":\"luo\",\"status\":false}]', 6, '0:0:0:0:0:0:0:1', '2021-12-20 13:34:09', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (619, 'luo2', '创建账户信息', 'POST', '/vbenadmin/sys/user/account', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.create', 'application/json;charset=UTF-8', '[{\"realName\":\"qwe\",\"nickName\":\"qwe\",\"roles\":[2],\"deptId\":3,\"remark\":\"qwe\",\"email\":\"qwe\",\"username\":\"luo\",\"status\":false}]', 5, '0:0:0:0:0:0:0:1', '2021-12-20 13:35:39', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (620, 'luo2', '创建账户信息', 'POST', '/vbenadmin/sys/user/account', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.create', 'application/json;charset=UTF-8', '[{\"realName\":\"qwe\",\"nickName\":\"qwe\",\"roles\":[2],\"deptId\":3,\"remark\":\"qwe\",\"email\":\"qwe\",\"username\":\"luo\",\"status\":false}]', 84, '0:0:0:0:0:0:0:1', '2021-12-20 13:37:36', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (621, 'luo2', '创建账户信息', 'POST', '/vbenadmin/sys/user/account', b'0', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.create', 'application/json;charset=UTF-8', '[{\"realName\":\"qwe\",\"nickName\":\"qwe\",\"roles\":[2],\"deptId\":3,\"remark\":\"qwe\",\"email\":\"qwe\",\"username\":\"luo\",\"status\":false}]', 20, '0:0:0:0:0:0:0:1', '2021-12-20 13:41:20', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (622, 'luo2', '分页查询', 'GET', '/vbenadmin/sys/dict/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 321, '0:0:0:0:0:0:0:1', '2021-12-20 13:42:03', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (623, 'luo2', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 46, '0:0:0:0:0:0:0:1', '2021-12-20 13:42:04', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (624, 'luo2', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[2,10,{}]', 15, '0:0:0:0:0:0:0:1', '2021-12-20 13:42:13', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (625, 'luo2', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[3,10,{}]', 14, '0:0:0:0:0:0:0:1', '2021-12-20 13:42:14', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (626, 'luo2', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 11, '0:0:0:0:0:0:0:1', '2021-12-20 13:42:16', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (627, 'luo2', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 14, '0:0:0:0:0:0:0:1', '2021-12-20 13:42:23', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (628, 'luo2', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[3,10,{}]', 9, '0:0:0:0:0:0:0:1', '2021-12-20 13:42:34', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (629, 'luo2', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[63,10,{}]', 11, '0:0:0:0:0:0:0:1', '2021-12-20 13:42:36', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (630, 'luo2', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[60,10,{}]', 48, '0:0:0:0:0:0:0:1', '2021-12-20 13:42:38', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (631, 'luo2', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 127, '0:0:0:0:0:0:0:1', '2021-12-20 13:42:44', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (632, 'luo2', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{}]', 104, '0:0:0:0:0:0:0:1', '2021-12-20 13:42:44', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (633, 'luo2', '退出登录', 'GET', '/vbenadmin/sys/logout', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminLoginController.logout', '', '[]', 14, '0:0:0:0:0:0:0:1', '2021-12-20 13:43:04', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (634, 'luo', '用户登录', 'POST', '/vbenadmin/sys/login', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminLoginController.login', 'application/json;charset=UTF-8', '[{\"password\":\"123456\",\"username\":\"luo\"},{\"response\":{\"response\":{}}}]', 132, '0:0:0:0:0:0:0:1', '2021-12-20 13:43:09', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (635, 'luo', '获取登录用户信息', 'GET', '/vbenadmin/sys/user/info', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserInfoController.getUserInfo', '', '[]', 64, '0:0:0:0:0:0:0:1', '2021-12-20 13:43:10', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (636, 'luo', '获取当前用户权限码', 'GET', '/vbenadmin/sys/menu/authCode', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getPermissionCode', '', '[]', 145, '0:0:0:0:0:0:0:1', '2021-12-20 13:43:10', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (637, 'luo', '获取当前用户菜单树', 'GET', '/vbenadmin/sys/menu/auth/tree', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getAuthTree', '', '[]', 185, '0:0:0:0:0:0:0:1', '2021-12-20 13:43:10', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (638, 'luo', '分页查询', 'GET', '/vbenadmin/sys/dict/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 6, '0:0:0:0:0:0:0:1', '2021-12-20 13:43:15', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (639, 'luo', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 9, '0:0:0:0:0:0:0:1', '2021-12-20 13:43:20', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (640, 'luo', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{}]', 44, '0:0:0:0:0:0:0:1', '2021-12-20 13:43:20', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (641, 'luo', '获取所有权限菜单树', 'GET', '/vbenadmin/sys/menu/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getTreeList', '', '[{}]', 47, '0:0:0:0:0:0:0:1', '2021-12-20 13:43:22', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (642, 'luo', '获取登录用户信息', 'GET', '/vbenadmin/sys/user/info', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserInfoController.getUserInfo', '', '[]', 3, '0:0:0:0:0:0:0:1', '2021-12-20 14:28:16', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (643, 'luo', '获取当前用户权限码', 'GET', '/vbenadmin/sys/menu/authCode', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getPermissionCode', '', '[]', 8, '0:0:0:0:0:0:0:1', '2021-12-20 14:28:16', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (644, 'luo', '获取当前用户菜单树', 'GET', '/vbenadmin/sys/menu/auth/tree', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getAuthTree', '', '[]', 13, '0:0:0:0:0:0:0:1', '2021-12-20 14:28:16', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (645, 'luo', '获取所有权限菜单树', 'GET', '/vbenadmin/sys/menu/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getTreeList', '', '[{}]', 12, '0:0:0:0:0:0:0:1', '2021-12-20 14:28:18', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (646, 'luo', '获取登录用户信息', 'GET', '/vbenadmin/sys/user/info', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserInfoController.getUserInfo', '', '[]', 4, '0:0:0:0:0:0:0:1', '2021-12-20 14:35:05', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (647, 'luo', '获取当前用户权限码', 'GET', '/vbenadmin/sys/menu/authCode', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getPermissionCode', '', '[]', 9, '0:0:0:0:0:0:0:1', '2021-12-20 14:35:05', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (648, 'luo', '获取当前用户菜单树', 'GET', '/vbenadmin/sys/menu/auth/tree', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getAuthTree', '', '[]', 22, '0:0:0:0:0:0:0:1', '2021-12-20 14:35:05', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (649, 'luo', '获取所有权限菜单树', 'GET', '/vbenadmin/sys/menu/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getTreeList', '', '[{}]', 30, '0:0:0:0:0:0:0:1', '2021-12-20 14:35:07', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (650, 'luo', '退出登录', 'GET', '/vbenadmin/sys/logout', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminLoginController.logout', '', '[]', 0, '0:0:0:0:0:0:0:1', '2021-12-20 14:36:48', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (651, 'admin', '用户登录', 'POST', '/vbenadmin/sys/login', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminLoginController.login', 'application/json;charset=UTF-8', '[{\"password\":\"123456\",\"username\":\"admin\"},{\"response\":{\"response\":{}}}]', 1753, '0:0:0:0:0:0:0:1', '2022-05-29 14:09:10', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (652, 'admin', '获取登录用户信息', 'GET', '/vbenadmin/sys/user/info', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserInfoController.getUserInfo', '', '[]', 43, '0:0:0:0:0:0:0:1', '2022-05-29 14:09:12', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (653, 'admin', '获取当前用户权限码', 'GET', '/vbenadmin/sys/menu/authCode', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getPermissionCode', '', '[]', 46, '0:0:0:0:0:0:0:1', '2022-05-29 14:09:12', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (654, 'admin', '获取当前用户菜单树', 'GET', '/vbenadmin/sys/menu/auth/tree', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getAuthTree', '', '[]', 77, '0:0:0:0:0:0:0:1', '2022-05-29 14:09:12', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (655, 'admin', '分页查询', 'GET', '/vbenadmin/sys/dict/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 61, '0:0:0:0:0:0:0:1', '2022-05-29 14:09:41', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (656, 'admin', '获取所有权限菜单树', 'GET', '/vbenadmin/sys/menu/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getTreeList', '', '[{}]', 28, '0:0:0:0:0:0:0:1', '2022-05-29 14:09:48', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (657, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 16, '0:0:0:0:0:0:0:1', '2022-05-29 14:09:56', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (658, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{}]', 51, '0:0:0:0:0:0:0:1', '2022-05-29 14:09:57', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (659, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{\"deptId\":20}]', 19, '0:0:0:0:0:0:0:1', '2022-05-29 14:10:05', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (660, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{\"deptId\":19}]', 12, '0:0:0:0:0:0:0:1', '2022-05-29 14:10:06', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (661, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{\"deptId\":2}]', 88, '0:0:0:0:0:0:0:1', '2022-05-29 14:10:09', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (662, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{\"deptId\":8}]', 27, '0:0:0:0:0:0:0:1', '2022-05-29 14:10:11', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (663, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 9, '0:0:0:0:0:0:0:1', '2022-05-29 14:10:23', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (664, 'admin', '获取所有角色', 'GET', '/vbenadmin/sys/role/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbendminRoleController.list', '', '[{}]', 13, '0:0:0:0:0:0:0:1', '2022-05-29 14:10:23', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (665, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 4, '0:0:0:0:0:0:0:1', '2022-05-29 14:10:35', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (666, 'admin', '获取所有角色', 'GET', '/vbenadmin/sys/role/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbendminRoleController.list', '', '[{}]', 3, '0:0:0:0:0:0:0:1', '2022-05-29 14:10:35', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (667, 'admin', '分页获取角色列表', 'GET', '/vbenadmin/sys/role/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbendminRoleController.page', '', '[1,10,{}]', 19, '0:0:0:0:0:0:0:1', '2022-05-29 14:12:57', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (668, 'admin', '获取所有权限菜单树', 'GET', '/vbenadmin/sys/menu/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getTreeList', '', '[{}]', 16, '0:0:0:0:0:0:0:1', '2022-05-29 14:13:00', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (669, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 5, '0:0:0:0:0:0:0:1', '2022-05-29 14:13:00', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (670, 'admin', '获取接口权限树', 'GET', '/vbenadmin/sys/interface/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminPermissionController.getPermissionTree', '', '[]', 23, '0:0:0:0:0:0:0:1', '2022-05-29 14:13:00', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (671, 'admin', '根据角色获取菜单列表', 'GET', '/vbenadmin/sys/menu/role/1', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getListByRoleId', '', '[1]', 11, '0:0:0:0:0:0:0:1', '2022-05-29 14:13:00', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (672, 'admin', '根据角色id获取部门列表', 'GET', '/vbenadmin/sys/dept/role/1', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[1]', 4, '0:0:0:0:0:0:0:1', '2022-05-29 14:13:00', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (673, 'admin', '通过角色ID获取权限列表', 'GET', '/vbenadmin/sys/interface/role/1', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminPermissionController.getPermissionListByRoleId', '', '[1]', 4, '0:0:0:0:0:0:0:1', '2022-05-29 14:13:00', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (674, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 3, '0:0:0:0:0:0:0:1', '2022-05-29 14:14:04', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (675, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{}]', 24, '0:0:0:0:0:0:0:1', '2022-05-29 14:14:04', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (676, 'admin', '获取所有权限菜单树', 'GET', '/vbenadmin/sys/menu/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getTreeList', '', '[{}]', 10, '0:0:0:0:0:0:0:1', '2022-05-29 14:14:06', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (677, 'admin', '获取登录用户信息', 'GET', '/vbenadmin/sys/user/info', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserInfoController.getUserInfo', '', '[]', 74, '0:0:0:0:0:0:0:1', '2022-05-29 14:52:37', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (678, 'admin', '获取当前用户权限码', 'GET', '/vbenadmin/sys/menu/authCode', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getPermissionCode', '', '[]', 43, '0:0:0:0:0:0:0:1', '2022-05-29 14:52:37', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (679, 'admin', '获取当前用户菜单树', 'GET', '/vbenadmin/sys/menu/auth/tree', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getAuthTree', '', '[]', 66, '0:0:0:0:0:0:0:1', '2022-05-29 14:52:37', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (680, 'admin', '获取登录用户信息', 'GET', '/vbenadmin/sys/user/info', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserInfoController.getUserInfo', '', '[]', 7, '0:0:0:0:0:0:0:1', '2022-05-29 14:53:04', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (681, 'admin', '获取当前用户权限码', 'GET', '/vbenadmin/sys/menu/authCode', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getPermissionCode', '', '[]', 29, '0:0:0:0:0:0:0:1', '2022-05-29 14:53:04', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (682, 'admin', '获取当前用户菜单树', 'GET', '/vbenadmin/sys/menu/auth/tree', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getAuthTree', '', '[]', 33, '0:0:0:0:0:0:0:1', '2022-05-29 14:53:04', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (683, 'admin', '获取登录用户信息', 'GET', '/vbenadmin/sys/user/info', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserInfoController.getUserInfo', '', '[]', 6, '0:0:0:0:0:0:0:1', '2022-05-29 14:53:58', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (684, 'admin', '获取当前用户权限码', 'GET', '/vbenadmin/sys/menu/authCode', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getPermissionCode', '', '[]', 13, '0:0:0:0:0:0:0:1', '2022-05-29 14:53:58', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (685, 'admin', '获取当前用户菜单树', 'GET', '/vbenadmin/sys/menu/auth/tree', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getAuthTree', '', '[]', 20, '0:0:0:0:0:0:0:1', '2022-05-29 14:53:58', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (686, 'admin', '分页查询', 'GET', '/vbenadmin/sys/dict/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 59, '0:0:0:0:0:0:0:1', '2022-05-29 14:54:25', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (687, 'admin', '分页查询', 'GET', '/vbenadmin/sys/log/page', b'1', 'class com.yaolong.rbac.commons.base.BaseController.page', '', '[1,10,{}]', 28, '0:0:0:0:0:0:0:1', '2022-05-29 14:54:27', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (688, 'admin', '获取部门列表', 'GET', '/vbenadmin/sys/dept/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminDeptController.deptList', '', '[{}]', 15, '0:0:0:0:0:0:0:1', '2022-05-29 14:54:33', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (689, 'admin', '分页获取账户列表', 'GET', '/vbenadmin/sys/user/account/page', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminUserAccountController.pageList', '', '[1,10,{}]', 44, '0:0:0:0:0:0:0:1', '2022-05-29 14:54:33', NULL, NULL, NULL);
INSERT INTO `sys_log` VALUES (690, 'admin', '获取所有权限菜单树', 'GET', '/vbenadmin/sys/menu/tree/list', b'1', 'class com.yaolong.rbac.jwt.controller.SysVbenadminMenuResourceController.getTreeList', '', '[{}]', 28, '0:0:0:0:0:0:0:1', '2022-05-29 14:54:35', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_menu_meta
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu_meta`;
CREATE TABLE `sys_menu_meta`  (
  `id` bigint(10) NOT NULL AUTO_INCREMENT COMMENT 'meta主键',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '路由title  一般必填',
  `ignore_route` bit(1) NULL DEFAULT b'0' COMMENT '忽略路由。用于在ROUTE_MAPPING以及BACK权限模式下，生成对应的菜单而忽略路由。',
  `order_no` bigint(10) NULL DEFAULT NULL COMMENT '菜单排序，只对第一级有效',
  `hide_menu` bit(1) NULL DEFAULT b'0' COMMENT '当前路由不再菜单显示',
  `hide_tab` bit(1) NULL DEFAULT b'0' COMMENT '当前路由不再标签页显示',
  `current_active_menu` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '当前激活的菜单。用于配置详情页时左侧激活的菜单路径',
  `hide_children_in_menu` bit(1) NULL DEFAULT b'0' COMMENT '隐藏所有子菜单',
  `carry_param` bit(1) NULL DEFAULT b'0' COMMENT '如果该路由会携带参数，且需要在tab页上面显示。则需要设置为true',
  `hide_breadcrumb` bit(1) NULL DEFAULT b'0' COMMENT '隐藏该路由在面包屑上面的显示',
  `transition_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '指定该路由切换的动画名',
  `frame_src` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '内嵌iframe的地址',
  `icon` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图标，也是菜单图标',
  `affix` bit(1) NULL DEFAULT b'0' COMMENT '是否固定标签',
  `ignore_keep_alive` bit(1) NULL DEFAULT b'0' COMMENT '是否忽略KeepAlive缓存',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu_meta
-- ----------------------------
INSERT INTO `sys_menu_meta` VALUES (1, 'routes.demo.system.moduleName', b'0', 2, b'0', b'0', NULL, b'0', b'0', b'0', NULL, NULL, 'ion:settings-outline', b'0', b'0', '2021-08-03 16:53:53', '2021-08-04 10:08:34');
INSERT INTO `sys_menu_meta` VALUES (2, 'routes.demo.system.account', b'0', 1, b'0', b'0', NULL, b'0', b'0', b'0', NULL, NULL, 'bx:bx-home', b'0', b'0', '2021-08-03 16:53:53', '2021-08-06 09:21:46');
INSERT INTO `sys_menu_meta` VALUES (3, 'routes.demo.system.account_detail', b'0', 2, b'1', b'0', '', b'0', b'0', b'0', NULL, NULL, 'ant-design:align-center-outlined', b'0', b'1', '2021-08-03 16:53:53', '2021-08-30 16:03:55');
INSERT INTO `sys_menu_meta` VALUES (5, 'routes.demo.system.menu', b'0', 1, b'0', b'0', NULL, b'0', b'0', b'0', NULL, NULL, 'ant-design:menu-outlined', b'0', b'0', '2021-08-03 16:53:53', '2021-08-15 13:58:09');
INSERT INTO `sys_menu_meta` VALUES (6, 'routes.demo.system.dept', b'0', 1, b'0', b'0', NULL, b'0', b'0', b'0', NULL, NULL, 'ant-design:partition-outlined', b'0', b'0', '2021-08-03 16:53:53', '2021-08-11 10:02:05');
INSERT INTO `sys_menu_meta` VALUES (8, 'routes.demo.system.role', b'0', 4, b'0', b'0', NULL, b'0', b'0', b'0', NULL, NULL, 'ant-design:smile-filled', b'0', b'1', '2021-08-03 16:53:53', '2021-08-11 10:03:51');
INSERT INTO `sys_menu_meta` VALUES (9, '菜单分配', b'0', 5, b'1', b'0', NULL, b'0', b'0', b'0', NULL, NULL, NULL, b'0', b'0', '2021-08-03 16:53:53', '2021-08-06 09:22:05');
INSERT INTO `sys_menu_meta` VALUES (11, '接口管理', b'0', 2, b'0', b'0', NULL, b'0', b'0', b'0', NULL, NULL, 'ant-design:interaction-filled', b'0', b'0', '2021-08-03 16:53:53', '2021-08-15 14:11:13');
INSERT INTO `sys_menu_meta` VALUES (12, '接口资源分类', b'0', 1, b'1', b'0', NULL, b'0', b'0', b'0', NULL, NULL, 'ant-design:align-center-outlined', b'0', b'0', '2021-08-03 16:53:53', '2021-08-15 14:10:25');
INSERT INTO `sys_menu_meta` VALUES (13, 'routes.dashboard.dashboard', b'0', 1, b'0', b'0', NULL, b'0', b'0', b'0', NULL, NULL, 'bx:bx-home', b'0', b'0', '2021-08-03 16:53:53', '2021-08-10 17:15:59');
INSERT INTO `sys_menu_meta` VALUES (14, 'routes.dashboard.analysis', b'0', 1, b'0', b'0', '/dashboard/analysis', b'0', b'0', b'0', NULL, NULL, 'bx:bx-home', b'0', b'0', '2021-08-03 16:53:53', '2021-08-06 09:22:36');
INSERT INTO `sys_menu_meta` VALUES (15, 'routes.dashboard.workbench', b'0', 2, b'0', b'0', '', b'0', b'0', b'0', NULL, NULL, 'bx:bx-home', b'0', b'0', '2021-08-03 16:53:53', '2021-08-06 15:43:00');
INSERT INTO `sys_menu_meta` VALUES (16, 'routes.demo.iframe.frame', b'0', 2, b'0', b'0', NULL, b'0', b'0', b'0', NULL, NULL, 'ion:tv-outline', b'0', b'0', '2021-08-04 10:51:28', '2021-08-06 09:22:50');
INSERT INTO `sys_menu_meta` VALUES (17, '博客门户', b'0', 1, b'0', b'0', NULL, b'0', b'0', b'0', NULL, 'https://yaolonga.com', NULL, b'0', b'0', '2021-08-05 10:11:21', '2021-08-06 09:22:23');
INSERT INTO `sys_menu_meta` VALUES (18, '博客后端管理', b'0', 2, b'0', b'0', NULL, b'0', b'0', b'0', NULL, 'https://admin.yaolonga.com', NULL, b'0', b'0', '2021-08-05 10:11:18', '2021-08-06 09:22:27');
INSERT INTO `sys_menu_meta` VALUES (19, '按钮', b'0', 1, b'0', b'0', NULL, b'0', b'0', b'0', NULL, NULL, 'ant-design:check-circle-filled', b'0', b'0', '2021-08-05 10:11:13', '2021-08-10 17:16:05');
INSERT INTO `sys_menu_meta` VALUES (23, '接口文档', b'0', 3, b'0', b'0', NULL, b'0', b'0', b'0', NULL, 'http://localhost:8888/doc.html', 'ant-design:file-markdown-twotone', b'0', b'0', '2021-08-23 14:08:22', '2021-08-23 14:22:23');
INSERT INTO `sys_menu_meta` VALUES (24, '日志管理', b'0', 1, b'0', b'0', NULL, b'0', b'0', b'0', NULL, NULL, 'ant-design:carry-out-twotone', b'0', b'0', '2021-08-30 15:49:37', '2021-08-30 15:51:05');
INSERT INTO `sys_menu_meta` VALUES (31, '权限管理', b'0', 2, b'0', b'0', '/sys/auth/account', b'0', b'0', b'0', NULL, NULL, 'ant-design:unlock-outlined', b'0', b'0', NULL, '2021-08-30 16:06:06');
INSERT INTO `sys_menu_meta` VALUES (32, '字典管理', b'0', 5, b'0', b'0', NULL, b'0', b'0', b'0', NULL, NULL, 'ant-design:project-outlined', b'0', b'0', '2021-08-30 16:18:30', '2021-08-30 16:19:25');

-- ----------------------------
-- Table structure for sys_menu_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu_resource`;
CREATE TABLE `sys_menu_resource`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '前端菜单资源id',
  `parent_id` bigint(11) NOT NULL COMMENT '菜单父级id',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '菜单路由名',
  `menu_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名',
  `path` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'vue前端路由路',
  `component` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件（前端vue的文件位置路径，根路径为Layout）',
  `description` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
  `menu_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '菜单类型 dir目录；menu菜单；button按钮',
  `level` bigint(64) NULL DEFAULT NULL COMMENT '菜单级别 0 1 2',
  `permission` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `redirect` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '重定向路劲',
  `case_sensitive` bit(1) NULL DEFAULT b'0' COMMENT '区分大小写',
  `meta_id` bigint(11) NOT NULL COMMENT '原信息id',
  `is_ext` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '是否外链',
  `status` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '\0' COMMENT '状态 0 ->启用 1 -> 禁用',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu_resource
-- ----------------------------
INSERT INTO `sys_menu_resource` VALUES (1, 0, 'SysManagement', '系统管理', '/sys', 'Layout', '权限管理', 'dir', 0, 'auth:dir', NULL, b'0', 1, '0', '0', 'admin', '2021-05-11 16:01:12', 'admin', '2021-08-30 15:58:45');
INSERT INTO `sys_menu_resource` VALUES (2, 31, 'AccountManagement', '账号管理', 'account', '/sys/auth/account/index', '账户管理', 'menu', 1, 'auth:account:view', NULL, b'0', 2, '0', '0', 'admin', '2021-05-14 14:53:29', 'admin', '2021-08-30 16:04:33');
INSERT INTO `sys_menu_resource` VALUES (3, 31, 'AccountDetail', '账户详情', 'account_detail/:id', '/sys/auth/account/AccountDetail', '详情', 'menu', 1, 'auth:account_details:view', NULL, b'0', 3, '0', '0', 'admin', '2021-05-14 15:28:21', 'admin', '2021-08-30 16:04:35');
INSERT INTO `sys_menu_resource` VALUES (5, 31, 'Menu', '菜单管理', 'menu', '/sys/auth/menu/index', '菜单管理', 'menu', 1, 'auth:menu:view', NULL, b'0', 5, '0', '0', 'admin', '2021-05-14 15:35:43', 'admin', '2021-08-30 16:04:37');
INSERT INTO `sys_menu_resource` VALUES (6, 31, 'Dept', '部门管理', 'dept', '/sys/auth/dept/index', '部门管理', 'menu', 1, 'auth:dept:view', NULL, b'0', 6, '0', '0', 'admin', '2021-05-14 15:35:43', 'admin', '2021-08-30 16:04:38');
INSERT INTO `sys_menu_resource` VALUES (8, 31, 'Role', '角色管理', 'role', '/sys/auth/role/index', '角色管理', 'menu', 1, 'auth:menu:view', NULL, b'0', 8, '0', '0', 'admin', '2021-05-14 15:39:39', 'admin', '2021-08-30 16:04:49');
INSERT INTO `sys_menu_resource` VALUES (11, 31, 'Interface', '接口管理', 'interface', '/sys/auth/interface/index', '接口管理', 'menu', 1, 'auth:interface:view', NULL, b'0', 11, '0', '0', 'admin', '2021-05-14 15:50:04', 'admin', '2021-08-30 16:04:43');
INSERT INTO `sys_menu_resource` VALUES (12, 31, 'permissionCategory', '接口分类', 'interface/category', '/sys/auth/interface/category', '接口资源分配', 'menu', 1, 'auth:interface-cate:view', NULL, b'0', 12, '0', '0', 'admin', '2021-05-14 15:51:47', 'admin', '2021-08-30 16:04:43');
INSERT INTO `sys_menu_resource` VALUES (18, 0, 'dashboard', 'Dashboard', '/dashboard', 'Layout', '首页', 'dir', 0, 'dashboard:dir', '/dashboard/analysis', b'0', 13, '0', '0', 'admin', '2021-08-03 16:46:44', 'admin', '2021-08-10 17:15:59');
INSERT INTO `sys_menu_resource` VALUES (20, 18, 'Analysis', '数据分析页', 'analysis', '/dashboard/analysis/index', '数据分析页', 'menu', 1, 'dashboard:analysis:view', NULL, b'0', 14, '0', '0', 'admin', '2021-08-03 16:50:45', 'admin', '2021-08-05 15:46:37');
INSERT INTO `sys_menu_resource` VALUES (21, 18, 'Workbench', '工作台', 'workbench', '/dashboard/workbench/index', '工作台', 'menu', 1, 'dashboard:workbench:view', NULL, b'0', 15, '0', '0', 'admin', '2021-08-03 16:52:22', 'admin', '2021-08-06 15:41:06');
INSERT INTO `sys_menu_resource` VALUES (22, 0, 'Link', '外部页面', '/link', 'Layout', '链接', 'dir', 0, 'dashboard:link:view', NULL, b'0', 16, '0', '0', 'admin', '2021-08-04 10:45:40', 'admin', '2021-08-05 15:46:37');
INSERT INTO `sys_menu_resource` VALUES (23, 22, 'yaolongBlogProtal', '博客门户', 'yaolongBlogProtal', '', '耀龙博客内部链接', 'menu', 1, NULL, NULL, b'0', 17, '1', '0', 'admin', '2021-08-04 10:47:34', 'admin', '2021-08-05 17:28:45');
INSERT INTO `sys_menu_resource` VALUES (24, 22, 'yaolongblogAdmin', '博客管理', 'yaolongblogAdmin', NULL, '耀龙博客后端管理内部链接', 'menu', 1, NULL, NULL, b'0', 18, '1', '0', 'admin', '2021-08-05 09:34:53', 'admin', '2021-08-05 17:28:43');
INSERT INTO `sys_menu_resource` VALUES (25, 21, '测试按钮', '测试按钮', 'workbench', '/dashboard/workbench/index', '一个测试按钮', 'button', 2, 'dashboard:workbench:view:btnTest', NULL, b'0', 19, '0', '0', 'admin', '2021-08-05 10:10:24', 'admin', '2021-08-10 17:16:05');
INSERT INTO `sys_menu_resource` VALUES (26, 21, '测试按钮2', '测试按钮2', 'workbench', '/dashboard/workbench/index', '一个测试按钮2', 'button', 2, 'dashboard:workbench:view:btnTest2', NULL, b'0', 19, '0', '0', 'admin', '2021-08-05 10:10:24', 'admin', '2021-08-07 16:44:50');
INSERT INTO `sys_menu_resource` VALUES (29, 22, 'ApiDoc', '接口文档', 'ApiDoc', NULL, '项目接口文档', 'menu', NULL, NULL, NULL, b'0', 23, '1', '0', 'admin', '2021-08-23 14:08:22', NULL, '2021-08-23 14:10:46');
INSERT INTO `sys_menu_resource` VALUES (30, 1, 'Log', '日志管理', 'log', '/sys/log/index', '用户操作日志', 'menu', NULL, 'auth:log:view', NULL, b'0', 24, '0', '0', 'admin', '2021-08-30 15:49:37', 'admin', '2021-08-30 15:51:05');
INSERT INTO `sys_menu_resource` VALUES (31, 1, 'AuthManagement', '权限管理', 'auth', '/sys/auth/index', '权限管理', 'dir', 2, NULL, '/sys/auth/account', b'0', 31, '0', '0', 'admin', NULL, 'admin', '2021-08-30 16:06:06');
INSERT INTO `sys_menu_resource` VALUES (32, 1, 'Dict', '字典管理', 'dict', '/sys/dict/index', '字段管理', 'menu', NULL, 'sys:dict:view', NULL, b'0', 32, '0', '0', 'admin', '2021-08-30 16:18:30', 'admin', '2021-08-30 16:19:25');

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(11) NULL DEFAULT NULL COMMENT '分类id',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '接口权限名',
  `path` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '接口权限路劲',
  `type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '接口类型（dashboard、protal）',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '接口描述',
  `status` bit(1) NULL DEFAULT NULL COMMENT '接口是否禁用',
  `sort` bigint(11) NULL DEFAULT NULL COMMENT '排序',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES (1, 1, '用户管理', '/vbenadmin/sys/user/**', 'dashboard', '用户管理', b'0', 1, '2021-05-11 15:58:45', '2021-08-15 16:16:07');
INSERT INTO `sys_permission` VALUES (2, 1, '菜单管理', '/vbenadmin/sys/resource/**', 'dashboard', '菜单管理', b'0', 1, '2021-05-12 12:55:47', '2021-08-15 16:16:07');
INSERT INTO `sys_permission` VALUES (3, 1, '接口管理', '/vbenadmin/sys/permission/**', 'dashboard', '接口权限管理', b'0', 1, '2021-05-14 12:38:14', '2021-08-15 16:16:07');
INSERT INTO `sys_permission` VALUES (4, 1, '角色管理', '/vbenadmin/sys/role/**', 'dashboard', '角色管理', b'0', 1, '2021-05-14 14:45:41', '2021-08-15 16:16:07');
INSERT INTO `sys_permission` VALUES (9, 1, '测试', '/vbenadmin/test/test2', 'dashboard', '测试', b'0', 2, '2021-05-23 19:33:32', '2021-08-15 16:16:17');
INSERT INTO `sys_permission` VALUES (10, 1, '测试2', '/vbenadmin/test/test9', 'dashboard', '测试1', b'0', 2, '2021-05-23 19:33:54', '2021-08-15 18:18:51');

-- ----------------------------
-- Table structure for sys_permission_category
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission_category`;
CREATE TABLE `sys_permission_category`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '权限分类id',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分类名称',
  `description` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `sort` bigint(11) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_permission_category
-- ----------------------------
INSERT INTO `sys_permission_category` VALUES (1, '权限模块', '权限模块', '2021-05-11 16:46:03', '2021-05-23 18:17:12', 1);
INSERT INTO `sys_permission_category` VALUES (3, '系统模块', '123', '2021-08-15 18:55:34', '2021-08-15 18:55:34', 1);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `en_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '英文角色名',
  `order_no` bigint(11) NULL DEFAULT NULL COMMENT '排序',
  `status` bit(1) NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '管理员', '超级管理员', '2021-05-11 15:56:42', '2021-08-30 16:18:40', 'ROLE_ADMIN', 1, b'1');
INSERT INTO `sys_role` VALUES (2, '普通用户', '普通用户', '2021-05-12 12:57:00', '2021-12-20 13:30:55', 'ROLE_USER', 2, b'1');
INSERT INTO `sys_role` VALUES (6, '测试角色', '测试角色', '2021-08-13 19:48:40', '2021-08-14 13:42:38', 'ROLE_TEST', 4, b'1');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(11) NOT NULL COMMENT '角色id',
  `dept_id` bigint(11) NOT NULL COMMENT '部门id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 150 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (148, 1, 3, '2021-08-30 16:18:40', '2021-08-30 16:18:40');
INSERT INTO `sys_role_dept` VALUES (150, 2, 3, '2021-12-20 13:30:55', '2021-12-20 13:30:55');

-- ----------------------------
-- Table structure for sys_role_menu_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu_resource`;
CREATE TABLE `sys_role_menu_resource`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(11) NOT NULL COMMENT '角色id',
  `menu_id` bigint(11) NOT NULL COMMENT '菜单资源id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 597 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu_resource
-- ----------------------------
INSERT INTO `sys_role_menu_resource` VALUES (471, 6, 3, '2021-08-14 13:42:38', '2021-08-14 13:42:38');
INSERT INTO `sys_role_menu_resource` VALUES (472, 6, 2, '2021-08-14 13:42:38', '2021-08-14 13:42:38');
INSERT INTO `sys_role_menu_resource` VALUES (473, 6, 1, '2021-08-14 13:42:38', '2021-08-14 13:42:38');
INSERT INTO `sys_role_menu_resource` VALUES (545, 1, 2, '2021-08-30 16:18:40', '2021-08-30 16:18:40');
INSERT INTO `sys_role_menu_resource` VALUES (546, 1, 31, '2021-08-30 16:18:40', '2021-08-30 16:18:40');
INSERT INTO `sys_role_menu_resource` VALUES (547, 1, 3, '2021-08-30 16:18:40', '2021-08-30 16:18:40');
INSERT INTO `sys_role_menu_resource` VALUES (548, 1, 5, '2021-08-30 16:18:40', '2021-08-30 16:18:40');
INSERT INTO `sys_role_menu_resource` VALUES (549, 1, 6, '2021-08-30 16:18:40', '2021-08-30 16:18:40');
INSERT INTO `sys_role_menu_resource` VALUES (550, 1, 8, '2021-08-30 16:18:40', '2021-08-30 16:18:40');
INSERT INTO `sys_role_menu_resource` VALUES (551, 1, 11, '2021-08-30 16:18:40', '2021-08-30 16:18:40');
INSERT INTO `sys_role_menu_resource` VALUES (552, 1, 12, '2021-08-30 16:18:40', '2021-08-30 16:18:40');
INSERT INTO `sys_role_menu_resource` VALUES (553, 1, 20, '2021-08-30 16:18:40', '2021-08-30 16:18:40');
INSERT INTO `sys_role_menu_resource` VALUES (554, 1, 18, '2021-08-30 16:18:40', '2021-08-30 16:18:40');
INSERT INTO `sys_role_menu_resource` VALUES (555, 1, 23, '2021-08-30 16:18:40', '2021-08-30 16:18:40');
INSERT INTO `sys_role_menu_resource` VALUES (556, 1, 22, '2021-08-30 16:18:40', '2021-08-30 16:18:40');
INSERT INTO `sys_role_menu_resource` VALUES (557, 1, 24, '2021-08-30 16:18:40', '2021-08-30 16:18:40');
INSERT INTO `sys_role_menu_resource` VALUES (558, 1, 25, '2021-08-30 16:18:40', '2021-08-30 16:18:40');
INSERT INTO `sys_role_menu_resource` VALUES (559, 1, 21, '2021-08-30 16:18:40', '2021-08-30 16:18:40');
INSERT INTO `sys_role_menu_resource` VALUES (560, 1, 26, '2021-08-30 16:18:40', '2021-08-30 16:18:40');
INSERT INTO `sys_role_menu_resource` VALUES (561, 1, 29, '2021-08-30 16:18:40', '2021-08-30 16:18:40');
INSERT INTO `sys_role_menu_resource` VALUES (562, 1, 30, '2021-08-30 16:18:40', '2021-08-30 16:18:40');
INSERT INTO `sys_role_menu_resource` VALUES (563, 1, 32, '2021-08-30 16:18:40', '2021-08-30 16:18:40');
INSERT INTO `sys_role_menu_resource` VALUES (564, 1, 1, '2021-08-30 16:18:40', '2021-08-30 16:18:40');
INSERT INTO `sys_role_menu_resource` VALUES (581, 2, 2, '2021-12-20 13:30:55', '2021-12-20 13:30:55');
INSERT INTO `sys_role_menu_resource` VALUES (582, 2, 31, '2021-12-20 13:30:55', '2021-12-20 13:30:55');
INSERT INTO `sys_role_menu_resource` VALUES (583, 2, 3, '2021-12-20 13:30:55', '2021-12-20 13:30:55');
INSERT INTO `sys_role_menu_resource` VALUES (584, 2, 24, '2021-12-20 13:30:55', '2021-12-20 13:30:55');
INSERT INTO `sys_role_menu_resource` VALUES (585, 2, 26, '2021-12-20 13:30:55', '2021-12-20 13:30:55');
INSERT INTO `sys_role_menu_resource` VALUES (586, 2, 20, '2021-12-20 13:30:55', '2021-12-20 13:30:55');
INSERT INTO `sys_role_menu_resource` VALUES (587, 2, 5, '2021-12-20 13:30:55', '2021-12-20 13:30:55');
INSERT INTO `sys_role_menu_resource` VALUES (588, 2, 6, '2021-12-20 13:30:55', '2021-12-20 13:30:55');
INSERT INTO `sys_role_menu_resource` VALUES (589, 2, 30, '2021-12-20 13:30:55', '2021-12-20 13:30:55');
INSERT INTO `sys_role_menu_resource` VALUES (590, 2, 8, '2021-12-20 13:30:55', '2021-12-20 13:30:55');
INSERT INTO `sys_role_menu_resource` VALUES (591, 2, 11, '2021-12-20 13:30:55', '2021-12-20 13:30:55');
INSERT INTO `sys_role_menu_resource` VALUES (592, 2, 12, '2021-12-20 13:30:55', '2021-12-20 13:30:55');
INSERT INTO `sys_role_menu_resource` VALUES (593, 2, 32, '2021-12-20 13:30:55', '2021-12-20 13:30:55');
INSERT INTO `sys_role_menu_resource` VALUES (594, 2, 1, '2021-12-20 13:30:55', '2021-12-20 13:30:55');
INSERT INTO `sys_role_menu_resource` VALUES (595, 2, 18, '2021-12-20 13:30:55', '2021-12-20 13:30:55');
INSERT INTO `sys_role_menu_resource` VALUES (596, 2, 22, '2021-12-20 13:30:55', '2021-12-20 13:30:55');
INSERT INTO `sys_role_menu_resource` VALUES (597, 2, 21, '2021-12-20 13:30:55', '2021-12-20 13:30:55');

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(11) NOT NULL COMMENT '角色id',
  `permission_id` bigint(11) NOT NULL COMMENT '权限id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 179 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES (150, 6, 1, '2021-08-14 13:42:38', '2021-08-14 13:42:38');
INSERT INTO `sys_role_permission` VALUES (151, 6, 10, '2021-08-14 13:42:38', '2021-08-14 13:42:38');
INSERT INTO `sys_role_permission` VALUES (168, 1, 2, '2021-08-30 16:18:40', '2021-08-30 16:18:40');
INSERT INTO `sys_role_permission` VALUES (169, 1, 3, '2021-08-30 16:18:40', '2021-08-30 16:18:40');
INSERT INTO `sys_role_permission` VALUES (170, 1, 4, '2021-08-30 16:18:40', '2021-08-30 16:18:40');
INSERT INTO `sys_role_permission` VALUES (171, 1, 9, '2021-08-30 16:18:40', '2021-08-30 16:18:40');
INSERT INTO `sys_role_permission` VALUES (176, 2, 1, '2021-12-20 13:30:55', '2021-12-20 13:30:55');
INSERT INTO `sys_role_permission` VALUES (177, 2, 2, '2021-12-20 13:30:55', '2021-12-20 13:30:55');
INSERT INTO `sys_role_permission` VALUES (178, 2, 4, '2021-12-20 13:30:55', '2021-12-20 13:30:55');
INSERT INTO `sys_role_permission` VALUES (179, 2, 9, '2021-12-20 13:30:55', '2021-12-20 13:30:55');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `status` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否禁用',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (2, 'admin', '$2a$10$vQxBDXX4jhzqRJntDD9JgOcZpNBX3.9aVQKSHaksAXVeVN.MRGssW', b'0', '小明：超级管理员', '2021-05-11 21:30:02', '2021-12-20 12:52:58');
INSERT INTO `sys_user` VALUES (3, 'user', '$2a$10$kNFFF6oKwLIy9ovTrEZx2uCtqX6tocVccdHyWveGd.wkbZ8gUHkTO', b'0', NULL, '2021-05-12 12:59:25', '2021-08-13 20:17:53');
INSERT INTO `sys_user` VALUES (5, 'yaolong', '$2a$10$HBuEsTwGnIdiv0qkFR1BQu5AKIDTo9We4r5IwLMJ7EDORuXTkK14S', b'0', NULL, '2021-05-14 16:27:45', '2021-08-09 13:51:42');
INSERT INTO `sys_user` VALUES (18, 'test1', '$2a$10$exfPZv7u32d7wpYOCrXyVOF1LvmX9ursC2SZBjyuFWUv8/GyBySMC', b'0', NULL, '2021-08-20 15:28:02', '2021-08-20 15:28:02');
INSERT INTO `sys_user` VALUES (19, 'test2221', '$2a$10$Usvy6mglRpEl70Hl1xn9GeYmf62nxgLRVTlsIoNJK9kgNiiBWFVem', b'0', NULL, '2021-08-20 16:15:54', '2021-08-20 16:18:18');
INSERT INTO `sys_user` VALUES (28, 'test4', '$2a$10$Hx1obi8I8FnF/yl0iyHyjO4uy9ZHsDABNfJ469x293h.wXf3NM6O2', b'0', NULL, '2021-08-20 16:19:53', '2021-08-20 16:19:53');
INSERT INTO `sys_user` VALUES (29, 'qwe', '$2a$10$n3KiYnaHpDGaZnfaj0Srne0yuij0RJZEryCecxxUDu4a5xN.n/qNa', b'0', NULL, '2021-08-20 16:20:02', '2021-08-20 16:20:02');
INSERT INTO `sys_user` VALUES (30, 'qweqwe', '$2a$10$4X3/2wm8M8fIr97uPJn3KOforrkVc7JfovNwFdgR/n65uVufTypWK', b'0', NULL, '2021-08-20 16:20:10', '2021-08-20 16:20:10');
INSERT INTO `sys_user` VALUES (31, 'qwewweq', '$2a$10$m/rNBYj0EZSSIVo.UF6.ye8/xYWdgK.fMZLIJenG6qDPkdn1LhpC6', b'0', NULL, '2021-08-20 16:20:23', '2021-08-20 16:20:23');
INSERT INTO `sys_user` VALUES (32, 'qweqweqwe', '$2a$10$RfOANi6vczPjt/GLtP1QAe0CJYXG6RUB7Xjbgx5gec4s/PADvHwOy', b'0', NULL, '2021-08-20 16:20:32', '2021-08-20 16:20:32');
INSERT INTO `sys_user` VALUES (33, '阿萨德', '$2a$10$Igu13EmMG7Voq9hUkmMF5.e8.9aKGi4z0y.0kPC8fstmnu/f3B6Wm', b'0', NULL, '2021-08-23 17:32:05', '2021-08-23 17:32:05');
INSERT INTO `sys_user` VALUES (34, 'abc', '$2a$10$mjFfM.UrlIlnnoRVXDRkWOfdoYl0v5QdsAzBsr.kxrn/LtbA.CH8u', b'0', NULL, '2021-12-20 13:16:03', '2021-12-20 13:16:03');
INSERT INTO `sys_user` VALUES (35, 'abcd', '$2a$10$iAGyuThME1Yc19OGGgzE5eyGUz4h9QvBvmC8yCC4wg6ENxjluUOxG', b'0', NULL, '2021-12-20 13:16:08', '2021-12-20 13:16:08');
INSERT INTO `sys_user` VALUES (36, 'abcde', '$2a$10$2CvOZD2A.yVrZYDX1HwPt./x7DuI8.pmgXSu02V5CXKx93BzO8h3a', b'0', NULL, '2021-12-20 13:16:11', '2021-12-20 13:16:11');
INSERT INTO `sys_user` VALUES (37, '123456', '$2a$10$Ua2bQzNb/AC44/86twE9PO1zsM0NhfMCDEAxvHFHrtm7TIptb3CdG', b'0', NULL, '2021-12-20 13:17:59', '2021-12-20 13:17:59');
INSERT INTO `sys_user` VALUES (38, 'luo', '$2a$10$lxhtVOrTtabIJX853JGF2eOa22GZi7dPGxXTCzMI8WS4UcvA/13dy', b'0', NULL, '2021-12-20 13:24:19', '2021-12-20 13:24:19');
INSERT INTO `sys_user` VALUES (39, 'luo1', '$2a$10$FigDbuoaqpw1eku8yLsaCeHQf3Ma76A4.rPYsB51YhBLBnh9e8zdC', b'0', NULL, '2021-12-20 13:26:05', '2021-12-20 13:26:05');
INSERT INTO `sys_user` VALUES (40, 'luo2', '$2a$10$XP3aOx5IEk/f4Xln/OCgmes7QvLErTKVg3lu0ty2KuVjgWl8zE/ZW', b'0', NULL, '2021-12-20 13:28:50', '2021-12-20 13:28:50');
INSERT INTO `sys_user` VALUES (41, 'haha', '$2a$10$ZeeLzx0CKHaT8OoLdY3TkugMu60jmpjuLv1LEppkf.WobqUIVdRBe', b'0', NULL, '2021-12-20 13:32:18', '2021-12-20 13:32:18');

-- ----------------------------
-- Table structure for sys_user_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_info`;
CREATE TABLE `sys_user_info`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '用户信息id',
  `user_id` bigint(11) NOT NULL COMMENT '用户id',
  `dept_id` bigint(11) NULL DEFAULT NULL COMMENT '部门id',
  `real_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '真实名字',
  `nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '昵称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户头像',
  `home_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '首页地址',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户备注',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_info
-- ----------------------------
INSERT INTO `sys_user_info` VALUES (1, 2, 2, '小明', '小明', 'https://img0.baidu.com/it/u=3311900507,1448170316&fm=26&fmt=auto&gp=0.jpg', '/dashboard/analysis', '163@adc.com', '小明：超级管理员', '2021-08-19 15:33:31', '2021-12-20 12:14:31');
INSERT INTO `sys_user_info` VALUES (2, 3, 2, '小红', '小红', 'https://img1.baidu.com/it/u=2681504758,1624692466&fm=26&fmt=auto&gp=0.jpg', '/dashboard/analysis', '163@adc.com', '小红', '2021-08-11 15:33:34', '2021-08-13 20:17:53');
INSERT INTO `sys_user_info` VALUES (3, 5, 2, '耀龙', '耀龙', 'https://img1.baidu.com/it/u=1541636380,2661844494&fm=26&fmt=auto&gp=0.jpg', '/dashboard/analysis', '163@adc.com', '测试用户耀龙', '2021-08-02 15:33:37', '2021-08-09 15:03:47');
INSERT INTO `sys_user_info` VALUES (9, 18, 19, '测试', '测试', NULL, NULL, 'a12312@qq.com', 'asdasd', '2021-08-20 15:28:02', '2021-08-20 15:28:02');
INSERT INTO `sys_user_info` VALUES (10, 19, 3, '小员', '小员', NULL, NULL, 'asd@qq.com', '测试', '2021-08-20 16:15:54', '2021-08-20 16:15:54');
INSERT INTO `sys_user_info` VALUES (11, 28, 8, 'qwe', 'cqwe', NULL, NULL, 'qwe', 'qwe', '2021-08-20 16:19:53', '2021-08-20 16:19:53');
INSERT INTO `sys_user_info` VALUES (12, 29, 8, 'qwe', 'qw', NULL, NULL, 'qweq', 'weqwe', '2021-08-20 16:20:02', '2021-08-20 16:20:02');
INSERT INTO `sys_user_info` VALUES (13, 30, 1, 'qwe', 'qwe', NULL, NULL, 'qwe', 'qwe', '2021-08-20 16:20:10', '2021-08-20 16:20:10');
INSERT INTO `sys_user_info` VALUES (14, 31, 8, 'qwe', 'qwe', NULL, NULL, 'qwe', 'qwe', '2021-08-20 16:20:23', '2021-08-20 16:20:23');
INSERT INTO `sys_user_info` VALUES (15, 32, 8, 'qweqw', 'eqweqweqw', NULL, NULL, 'eqwe', 'qweqweqw', '2021-08-20 16:20:32', '2021-08-20 16:20:32');
INSERT INTO `sys_user_info` VALUES (16, 33, 3, '阿萨德', '阿萨德', NULL, NULL, '大声道', '阿萨德', '2021-08-23 17:32:05', '2021-08-23 17:32:05');
INSERT INTO `sys_user_info` VALUES (17, 34, 3, 'asdasd', 'asdasd', NULL, NULL, '12@qq.com', NULL, '2021-12-20 13:16:04', '2021-12-20 13:16:04');
INSERT INTO `sys_user_info` VALUES (18, 35, 3, 'asdasd', 'asdasd', NULL, NULL, '12@qq.com', NULL, '2021-12-20 13:16:08', '2021-12-20 13:16:08');
INSERT INTO `sys_user_info` VALUES (19, 36, 3, 'asdasd', 'asdasd', NULL, NULL, '12@qq.com', NULL, '2021-12-20 13:16:11', '2021-12-20 13:16:11');
INSERT INTO `sys_user_info` VALUES (20, 37, 3, 'asdasd', 'asdasd', NULL, NULL, '12@qq.com', NULL, '2021-12-20 13:17:59', '2021-12-20 13:17:59');
INSERT INTO `sys_user_info` VALUES (21, 38, 3, 'asdasd', 'asdasd', NULL, NULL, '12@qq.com', NULL, '2021-12-20 13:24:20', '2021-12-20 13:24:20');
INSERT INTO `sys_user_info` VALUES (22, 39, 3, 'asdasd', 'asdasd', NULL, NULL, '12@qq.com', NULL, '2021-12-20 13:26:05', '2021-12-20 13:26:05');
INSERT INTO `sys_user_info` VALUES (23, 40, 3, 'asdasd', 'asdasd', NULL, NULL, '12@qq.com', NULL, '2021-12-20 13:28:50', '2021-12-20 13:28:50');
INSERT INTO `sys_user_info` VALUES (24, 41, 3, '13', '123', NULL, NULL, '123', '123', '2021-12-20 13:32:18', '2021-12-20 13:32:18');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(11) NOT NULL COMMENT '用户id',
  `role_id` bigint(11) NOT NULL COMMENT '角色id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (14, 5, 2, '2021-05-23 19:38:38', '2021-05-23 19:38:38');
INSERT INTO `sys_user_role` VALUES (26, 3, 6, '2021-08-13 20:17:53', '2021-08-13 20:17:53');
INSERT INTO `sys_user_role` VALUES (32, 18, 2, '2021-08-20 15:28:02', '2021-08-20 15:28:02');
INSERT INTO `sys_user_role` VALUES (33, 19, 2, '2021-08-20 16:15:54', '2021-08-20 16:15:54');
INSERT INTO `sys_user_role` VALUES (34, 28, 2, '2021-08-20 16:19:53', '2021-08-20 16:19:53');
INSERT INTO `sys_user_role` VALUES (35, 28, 6, '2021-08-20 16:19:53', '2021-08-20 16:19:53');
INSERT INTO `sys_user_role` VALUES (36, 29, 2, '2021-08-20 16:20:02', '2021-08-20 16:20:02');
INSERT INTO `sys_user_role` VALUES (37, 29, 6, '2021-08-20 16:20:02', '2021-08-20 16:20:02');
INSERT INTO `sys_user_role` VALUES (38, 30, 2, '2021-08-20 16:20:10', '2021-08-20 16:20:10');
INSERT INTO `sys_user_role` VALUES (39, 31, 2, '2021-08-20 16:20:23', '2021-08-20 16:20:23');
INSERT INTO `sys_user_role` VALUES (40, 31, 6, '2021-08-20 16:20:23', '2021-08-20 16:20:23');
INSERT INTO `sys_user_role` VALUES (41, 32, 1, '2021-08-20 16:20:32', '2021-08-20 16:20:32');
INSERT INTO `sys_user_role` VALUES (42, 33, 2, '2021-08-23 17:32:05', '2021-08-23 17:32:05');
INSERT INTO `sys_user_role` VALUES (45, 2, 1, '2021-12-20 12:14:31', '2021-12-20 12:14:31');
INSERT INTO `sys_user_role` VALUES (46, 2, 2, '2021-12-20 12:14:31', '2021-12-20 12:14:31');
INSERT INTO `sys_user_role` VALUES (47, 34, 2, '2021-12-20 13:16:04', '2021-12-20 13:16:04');
INSERT INTO `sys_user_role` VALUES (48, 35, 2, '2021-12-20 13:16:08', '2021-12-20 13:16:08');
INSERT INTO `sys_user_role` VALUES (49, 36, 2, '2021-12-20 13:16:11', '2021-12-20 13:16:11');
INSERT INTO `sys_user_role` VALUES (50, 37, 2, '2021-12-20 13:17:59', '2021-12-20 13:17:59');
INSERT INTO `sys_user_role` VALUES (51, 38, 2, '2021-12-20 13:24:20', '2021-12-20 13:24:20');
INSERT INTO `sys_user_role` VALUES (52, 39, 2, '2021-12-20 13:26:05', '2021-12-20 13:26:05');
INSERT INTO `sys_user_role` VALUES (53, 40, 2, '2021-12-20 13:28:50', '2021-12-20 13:28:50');
INSERT INTO `sys_user_role` VALUES (54, 41, 2, '2021-12-20 13:32:18', '2021-12-20 13:32:18');

SET FOREIGN_KEY_CHECKS = 1;
