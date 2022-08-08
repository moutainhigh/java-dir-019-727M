/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : rbac_template_1.0

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 17/08/2021 14:19:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_menu_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu_resource`;
CREATE TABLE `sys_menu_resource`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '前端菜单资源id',
  `parent_id` bigint(11) NOT NULL COMMENT '菜单父级id',
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单标题名称',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名',
  `url` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'vue前端路由路',
  `icon` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图标',
  `component` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '组件（前端vue的文件位置路径，根路径为Layout）',
  `description` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
  `hidden` bit(1) NOT NULL COMMENT '是否隐藏',
  `sort` bigint(64) NOT NULL COMMENT '排序',
  `level` bigint(11) NULL DEFAULT NULL COMMENT '菜单级别',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu_resource
-- ----------------------------
INSERT INTO `sys_menu_resource` VALUES (1, 0, '权限管理', 'auth', '/auth', 'lock', 'Layout', '权限管理', b'0', 1, 0, '2021-05-11 16:01:12', '2021-08-03 13:54:56');
INSERT INTO `sys_menu_resource` VALUES (2, 1, '用户管理', 'user', 'user', 'user', '/auth/user', '用户管理', b'0', 2, 1, '2021-05-14 14:53:29', '2021-08-03 13:54:58');
INSERT INTO `sys_menu_resource` VALUES (3, 1, '新增用户', 'userAdd', 'user/add', 'dashboard', '/auth/user/add', '新增用户', b'1', 2, 1, '2021-05-14 15:28:21', '2021-08-03 13:54:59');
INSERT INTO `sys_menu_resource` VALUES (4, 1, '编辑用户', 'userUpdate', 'user/update', 'dashboard', '/auth/user/update', '编辑用户', b'1', 3, 1, '2021-05-14 15:29:47', '2021-08-03 13:55:01');
INSERT INTO `sys_menu_resource` VALUES (5, 1, '菜单管理', 'menu', 'menu', 'component', '/auth/menu', '菜单管理', b'0', 1, 1, '2021-05-14 15:35:43', '2021-08-03 13:55:02');
INSERT INTO `sys_menu_resource` VALUES (6, 1, '新增菜单', 'menuAdd', 'menu/add', 'dashboard', '/auth/menu/add', '新增菜单', b'1', 1, 1, '2021-05-14 15:36:32', '2021-08-03 13:55:03');
INSERT INTO `sys_menu_resource` VALUES (7, 1, '编辑菜单', 'menuUpdate', 'menu/update', 'dashboard', '/auth/menu/update', '编辑菜单', b'1', 1, 1, '2021-05-14 15:38:19', '2021-08-03 13:55:05');
INSERT INTO `sys_menu_resource` VALUES (8, 1, '角色管理', 'role', 'role', 'peoples', '/auth/role', '角色管理', b'0', 1, 1, '2021-05-14 15:39:39', '2021-08-03 13:55:07');
INSERT INTO `sys_menu_resource` VALUES (9, 1, '菜单分配', 'roleAllotMenu', 'role/allot/menu', 'dashboard', '/auth/role/allot/menu', '菜单分配', b'1', 1, 1, '2021-05-14 15:45:48', '2021-08-03 13:55:10');
INSERT INTO `sys_menu_resource` VALUES (10, 1, '接口分配', 'roleAllotPermission', 'role/allot/permission', 'dashboard', '/auth/role/allot/permission', '接口分配', b'1', 1, 1, '2021-05-14 15:48:22', '2021-08-03 13:55:17');
INSERT INTO `sys_menu_resource` VALUES (11, 1, '接口管理', 'permission', 'permission', 'nested', '/auth/permission', '接口管理', b'0', 1, 1, '2021-05-14 15:50:04', '2021-08-03 13:55:19');
INSERT INTO `sys_menu_resource` VALUES (12, 1, '接口资源分类', 'permissionCategory', 'permission/category', 'dashboard', '/auth/permission/category', '接口资源分配', b'1', 1, 1, '2021-05-14 15:51:47', '2021-08-03 13:55:21');

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
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '接口描述',
  `sort` bigint(11) NULL DEFAULT NULL COMMENT '排序',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES (1, 1, '用户管理', '/eladmin/sys/user/**', 'dashboard', '用户管理', 1, '2021-05-11 15:58:45', '2021-05-12 12:53:42');
INSERT INTO `sys_permission` VALUES (2, 1, '菜单管理', '/eladmin/sys/resource/**', 'dashboard', '菜单管理', 1, '2021-05-12 12:55:47', '2021-05-12 12:55:53');
INSERT INTO `sys_permission` VALUES (3, 1, '接口管理', '/eladmin/sys/permission/**', 'dashboard', '接口权限管理', 1, '2021-05-14 12:38:14', '2021-05-14 14:47:35');
INSERT INTO `sys_permission` VALUES (4, 1, '角色管理', '/eladmin/sys/role/**', 'dashboard', '角色管理', 1, '2021-05-14 14:45:41', '2021-05-14 14:45:43');
INSERT INTO `sys_permission` VALUES (9, 1, '测试', '/eladmin/sys/test', 'dashboard', '测试', NULL, '2021-05-23 19:33:32', '2021-05-23 19:33:32');
INSERT INTO `sys_permission` VALUES (10, 1, '测试2', '/eladmin/sys/test/test1', 'dashboard', '测试2', NULL, '2021-05-23 19:33:54', '2021-05-23 19:33:54');

-- ----------------------------
-- Table structure for sys_permission_category
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission_category`;
CREATE TABLE `sys_permission_category`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '权限分类id',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分类名称',
  `description` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `sort` bigint(11) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_permission_category
-- ----------------------------
INSERT INTO `sys_permission_category` VALUES (1, '权限模块', '权限模块', '2021-05-11 16:46:03', '2021-05-23 18:17:12', 1);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `en_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '英文角色名',
  `status` bit(1) NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '管理员', '超级管理员', '2021-05-11 15:56:42', '2021-05-23 17:22:13', 'ROLE_ADMIN', b'1');
INSERT INTO `sys_role` VALUES (2, '普通用户', '普通用户', '2021-05-12 12:57:00', '2021-05-23 17:22:15', 'ROLE_USER', b'1');

-- ----------------------------
-- Table structure for sys_role_menu_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu_resource`;
CREATE TABLE `sys_role_menu_resource`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(11) NOT NULL COMMENT '角色id',
  `menu_id` bigint(11) NOT NULL COMMENT '菜单资源id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 89 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu_resource
-- ----------------------------
INSERT INTO `sys_role_menu_resource` VALUES (71, 2, 2, '2021-05-23 19:38:54', '2021-05-23 19:38:54');
INSERT INTO `sys_role_menu_resource` VALUES (72, 2, 1, '2021-05-23 19:38:54', '2021-05-23 19:38:54');
INSERT INTO `sys_role_menu_resource` VALUES (73, 2, 3, '2021-05-23 19:38:54', '2021-05-23 19:38:54');
INSERT INTO `sys_role_menu_resource` VALUES (74, 2, 4, '2021-05-23 19:38:54', '2021-05-23 19:38:54');
INSERT INTO `sys_role_menu_resource` VALUES (75, 1, 1, '2021-08-02 11:00:40', '2021-08-02 11:00:40');
INSERT INTO `sys_role_menu_resource` VALUES (76, 1, 2, '2021-08-02 11:00:40', '2021-08-02 11:00:40');
INSERT INTO `sys_role_menu_resource` VALUES (77, 1, 3, '2021-08-02 11:00:40', '2021-08-02 11:00:40');
INSERT INTO `sys_role_menu_resource` VALUES (78, 1, 4, '2021-08-02 11:00:40', '2021-08-02 11:00:40');
INSERT INTO `sys_role_menu_resource` VALUES (79, 1, 5, '2021-08-02 11:00:40', '2021-08-02 11:00:40');
INSERT INTO `sys_role_menu_resource` VALUES (80, 1, 6, '2021-08-02 11:00:40', '2021-08-02 11:00:40');
INSERT INTO `sys_role_menu_resource` VALUES (81, 1, 7, '2021-08-02 11:00:40', '2021-08-02 11:00:40');
INSERT INTO `sys_role_menu_resource` VALUES (82, 1, 8, '2021-08-02 11:00:40', '2021-08-02 11:00:40');
INSERT INTO `sys_role_menu_resource` VALUES (83, 1, 9, '2021-08-02 11:00:40', '2021-08-02 11:00:40');
INSERT INTO `sys_role_menu_resource` VALUES (84, 1, 10, '2021-08-02 11:00:40', '2021-08-02 11:00:40');
INSERT INTO `sys_role_menu_resource` VALUES (85, 1, 11, '2021-08-02 11:00:40', '2021-08-02 11:00:40');
INSERT INTO `sys_role_menu_resource` VALUES (86, 1, 12, '2021-08-02 11:00:40', '2021-08-02 11:00:40');

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(11) NOT NULL COMMENT '角色id',
  `permission_id` bigint(11) NOT NULL COMMENT '权限id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES (29, 2, 1, '2021-05-24 08:48:59', '2021-05-24 08:48:59');
INSERT INTO `sys_role_permission` VALUES (35, 1, 2, '2021-08-02 10:50:44', '2021-08-02 10:50:44');
INSERT INTO `sys_role_permission` VALUES (36, 1, 3, '2021-08-02 10:50:44', '2021-08-02 10:50:44');
INSERT INTO `sys_role_permission` VALUES (37, 1, 4, '2021-08-02 10:50:44', '2021-08-02 10:50:44');
INSERT INTO `sys_role_permission` VALUES (38, 1, 9, '2021-08-02 10:50:44', '2021-08-02 10:50:44');

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
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (2, 'admin', '$2a$10$vQxBDXX4jhzqRJntDD9JgOcZpNBX3.9aVQKSHaksAXVeVN.MRGssW', b'1', NULL, '2021-05-11 21:30:02', '2021-05-22 21:12:46');
INSERT INTO `sys_user` VALUES (3, 'user', '$2a$10$kNFFF6oKwLIy9ovTrEZx2uCtqX6tocVccdHyWveGd.wkbZ8gUHkTO', b'1', NULL, '2021-05-12 12:59:25', '2021-05-22 21:12:47');
INSERT INTO `sys_user` VALUES (5, 'yaolong', '$2a$10$HBuEsTwGnIdiv0qkFR1BQu5AKIDTo9We4r5IwLMJ7EDORuXTkK14S', b'1', NULL, '2021-05-14 16:27:45', '2021-05-22 21:12:48');
INSERT INTO `sys_user` VALUES (7, 'test', '$2a$10$3YQTfGcSO23Ga8z1U9ar4eYBQ0zapXcc1Uf8ovVrdB5hS1oYzzDq2', b'1', NULL, '2021-05-23 19:42:09', '2021-05-23 19:42:15');

-- ----------------------------
-- Table structure for sys_user_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_info`;
CREATE TABLE `sys_user_info`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '用户信息id',
  `user_id` bigint(11) NOT NULL COMMENT '用户id',
  `real_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '真实名字',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户头像',
  `home_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '首页地址',
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户描述',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_info
-- ----------------------------
INSERT INTO `sys_user_info` VALUES (1, 2, '小明', 'https://img0.baidu.com/it/u=3311900507,1448170316&fm=26&fmt=auto&gp=0.jpg', '/dashboard/analysis', '小明：超级管理员', '2021-08-19 15:33:31', '2021-08-03 10:08:38');
INSERT INTO `sys_user_info` VALUES (2, 3, '小红', 'https://img1.baidu.com/it/u=2681504758,1624692466&fm=26&fmt=auto&gp=0.jpg', '/dashboard/analysis', '小红', '2021-08-11 15:33:34', '2021-08-03 10:08:39');
INSERT INTO `sys_user_info` VALUES (3, 5, '耀龙', 'https://img1.baidu.com/it/u=1541636380,2661844494&fm=26&fmt=auto&gp=0.jpg', '/dashboard/analysis', '测试用户耀龙', '2021-08-02 15:33:37', '2021-08-03 10:08:39');
INSERT INTO `sys_user_info` VALUES (4, 7, '测试用户', 'https://img2.baidu.com/it/u=2528264782,1510027207&fm=26&fmt=auto&gp=0.jpg', '/dashboard/analysis', '测试用户', '2021-08-02 15:33:43', '2021-08-03 10:08:40');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(11) NOT NULL COMMENT '用户id',
  `role_id` bigint(11) NOT NULL COMMENT '角色id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (7, 2, 1, '2021-05-22 21:08:11', '2021-05-22 21:08:11');
INSERT INTO `sys_user_role` VALUES (8, 2, 2, '2021-05-22 21:08:11', '2021-05-22 21:08:11');
INSERT INTO `sys_user_role` VALUES (14, 5, 2, '2021-05-23 19:38:38', '2021-05-23 19:38:38');
INSERT INTO `sys_user_role` VALUES (15, 3, 2, '2021-08-02 16:18:23', '2021-08-02 16:18:25');
INSERT INTO `sys_user_role` VALUES (16, 7, 2, '2021-08-03 16:18:25', '2021-08-02 16:19:05');

SET FOREIGN_KEY_CHECKS = 1;
