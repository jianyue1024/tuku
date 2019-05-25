/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : tuku

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 11/05/2019 11:14:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
BEGIN;
INSERT INTO `admin_menu` VALUES (1, 0, 1, '首页', 'fa-bar-chart', '/', NULL, NULL, '2019-05-09 03:11:16');
INSERT INTO `admin_menu` VALUES (2, 0, 5, '系统管理', 'fa-tasks', NULL, NULL, NULL, '2019-05-09 06:11:22');
INSERT INTO `admin_menu` VALUES (3, 2, 6, '管理员', 'fa-users', 'auth/users', NULL, NULL, '2019-05-09 06:11:22');
INSERT INTO `admin_menu` VALUES (4, 2, 7, '角色', 'fa-user', 'auth/roles', NULL, NULL, '2019-05-09 06:11:22');
INSERT INTO `admin_menu` VALUES (5, 2, 8, '权限', 'fa-ban', 'auth/permissions', NULL, NULL, '2019-05-09 06:11:22');
INSERT INTO `admin_menu` VALUES (6, 2, 9, '菜单', 'fa-bars', 'auth/menu', NULL, NULL, '2019-05-09 06:11:22');
INSERT INTO `admin_menu` VALUES (7, 2, 10, '操作日志', 'fa-history', 'auth/logs', NULL, NULL, '2019-05-09 06:11:22');
INSERT INTO `admin_menu` VALUES (8, 0, 2, '用户管理', 'fa-user', '/users', NULL, '2019-05-09 03:27:47', '2019-05-09 03:27:55');
INSERT INTO `admin_menu` VALUES (9, 0, 3, '栏目分类', 'fa-bars', '/categories', NULL, '2019-05-09 03:58:50', '2019-05-09 03:58:57');
INSERT INTO `admin_menu` VALUES (10, 0, 4, '图库集', 'fa-arrows-alt', '/tukus', NULL, '2019-05-09 06:11:15', '2019-05-09 06:11:22');
COMMIT;

-- ----------------------------
-- Table structure for admin_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `admin_operation_log`;
CREATE TABLE `admin_operation_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_operation_log_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=519 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_operation_log
-- ----------------------------
BEGIN;
INSERT INTO `admin_operation_log` VALUES (1, 1, 'admin', 'GET', '::1', '[]', '2019-05-09 03:01:09', '2019-05-09 03:01:09');
INSERT INTO `admin_operation_log` VALUES (2, 1, 'admin', 'GET', '::1', '[]', '2019-05-09 03:05:03', '2019-05-09 03:05:03');
INSERT INTO `admin_operation_log` VALUES (3, 1, 'admin', 'GET', '::1', '[]', '2019-05-09 03:05:27', '2019-05-09 03:05:27');
INSERT INTO `admin_operation_log` VALUES (4, 1, 'admin', 'GET', '::1', '[]', '2019-05-09 03:05:42', '2019-05-09 03:05:42');
INSERT INTO `admin_operation_log` VALUES (5, 1, 'admin', 'GET', '::1', '[]', '2019-05-09 03:05:58', '2019-05-09 03:05:58');
INSERT INTO `admin_operation_log` VALUES (6, 1, 'admin', 'GET', '::1', '[]', '2019-05-09 03:06:16', '2019-05-09 03:06:16');
INSERT INTO `admin_operation_log` VALUES (7, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 03:10:49', '2019-05-09 03:10:49');
INSERT INTO `admin_operation_log` VALUES (8, 1, 'admin/auth/menu/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 03:11:05', '2019-05-09 03:11:05');
INSERT INTO `admin_operation_log` VALUES (9, 1, 'admin/auth/menu/1', 'PUT', '::1', '{\"parent_id\":\"0\",\"title\":\"\\u9996\\u9875\",\"icon\":\"fa-bar-chart\",\"uri\":\"\\/\",\"roles\":[null],\"permission\":null,\"_token\":\"jR2hHUODFiYu2LxjEd7N3MYfyIrxY5kifDo10Cx7\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/tuku.cool\\/admin\\/auth\\/menu\"}', '2019-05-09 03:11:16', '2019-05-09 03:11:16');
INSERT INTO `admin_operation_log` VALUES (10, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2019-05-09 03:11:16', '2019-05-09 03:11:16');
INSERT INTO `admin_operation_log` VALUES (11, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2019-05-09 03:13:48', '2019-05-09 03:13:48');
INSERT INTO `admin_operation_log` VALUES (12, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2019-05-09 03:13:51', '2019-05-09 03:13:51');
INSERT INTO `admin_operation_log` VALUES (13, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2019-05-09 03:13:53', '2019-05-09 03:13:53');
INSERT INTO `admin_operation_log` VALUES (14, 1, 'admin/auth/menu/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 03:13:59', '2019-05-09 03:13:59');
INSERT INTO `admin_operation_log` VALUES (15, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 03:14:03', '2019-05-09 03:14:03');
INSERT INTO `admin_operation_log` VALUES (16, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2019-05-09 03:15:07', '2019-05-09 03:15:07');
INSERT INTO `admin_operation_log` VALUES (17, 1, 'admin/auth/menu/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 03:15:15', '2019-05-09 03:15:15');
INSERT INTO `admin_operation_log` VALUES (18, 1, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 03:15:48', '2019-05-09 03:15:48');
INSERT INTO `admin_operation_log` VALUES (19, 1, 'admin', 'GET', '::1', '[]', '2019-05-09 03:18:23', '2019-05-09 03:18:23');
INSERT INTO `admin_operation_log` VALUES (20, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 03:18:29', '2019-05-09 03:18:29');
INSERT INTO `admin_operation_log` VALUES (21, 1, 'admin/auth/menu/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 03:18:47', '2019-05-09 03:18:47');
INSERT INTO `admin_operation_log` VALUES (22, 1, 'admin/auth/menu/2', 'PUT', '::1', '{\"parent_id\":\"0\",\"title\":\"\\u7cfb\\u7edf\\u7ba1\\u7406\",\"icon\":\"fa-tasks\",\"uri\":null,\"roles\":[\"1\",null],\"permission\":null,\"_token\":\"0SyrYLfCAl5rCDWHZcC6aoPvk8qS6fJar7onbhqQ\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/tuku.cool\\/admin\\/auth\\/menu\"}', '2019-05-09 03:19:00', '2019-05-09 03:19:00');
INSERT INTO `admin_operation_log` VALUES (23, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2019-05-09 03:19:00', '2019-05-09 03:19:00');
INSERT INTO `admin_operation_log` VALUES (24, 1, 'admin/auth/menu/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 03:19:05', '2019-05-09 03:19:05');
INSERT INTO `admin_operation_log` VALUES (25, 1, 'admin/auth/menu/3', 'PUT', '::1', '{\"parent_id\":\"2\",\"title\":\"\\u7ba1\\u7406\\u5458\",\"icon\":\"fa-users\",\"uri\":\"auth\\/users\",\"roles\":[null],\"permission\":null,\"_token\":\"0SyrYLfCAl5rCDWHZcC6aoPvk8qS6fJar7onbhqQ\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/tuku.cool\\/admin\\/auth\\/menu\"}', '2019-05-09 03:19:19', '2019-05-09 03:19:19');
INSERT INTO `admin_operation_log` VALUES (26, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2019-05-09 03:19:19', '2019-05-09 03:19:19');
INSERT INTO `admin_operation_log` VALUES (27, 1, 'admin/auth/menu/4/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 03:19:23', '2019-05-09 03:19:23');
INSERT INTO `admin_operation_log` VALUES (28, 1, 'admin/auth/menu/4', 'PUT', '::1', '{\"parent_id\":\"2\",\"title\":\"\\u89d2\\u8272\",\"icon\":\"fa-user\",\"uri\":\"auth\\/roles\",\"roles\":[null],\"permission\":null,\"_token\":\"0SyrYLfCAl5rCDWHZcC6aoPvk8qS6fJar7onbhqQ\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/tuku.cool\\/admin\\/auth\\/menu\"}', '2019-05-09 03:19:31', '2019-05-09 03:19:31');
INSERT INTO `admin_operation_log` VALUES (29, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2019-05-09 03:19:31', '2019-05-09 03:19:31');
INSERT INTO `admin_operation_log` VALUES (30, 1, 'admin/auth/menu/5/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 03:19:34', '2019-05-09 03:19:34');
INSERT INTO `admin_operation_log` VALUES (31, 1, 'admin/auth/menu/5', 'PUT', '::1', '{\"parent_id\":\"2\",\"title\":\"\\u6743\\u9650\",\"icon\":\"fa-ban\",\"uri\":\"auth\\/permissions\",\"roles\":[null],\"permission\":null,\"_token\":\"0SyrYLfCAl5rCDWHZcC6aoPvk8qS6fJar7onbhqQ\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/tuku.cool\\/admin\\/auth\\/menu\"}', '2019-05-09 03:19:49', '2019-05-09 03:19:49');
INSERT INTO `admin_operation_log` VALUES (32, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2019-05-09 03:19:49', '2019-05-09 03:19:49');
INSERT INTO `admin_operation_log` VALUES (33, 1, 'admin/auth/menu/6/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 03:19:52', '2019-05-09 03:19:52');
INSERT INTO `admin_operation_log` VALUES (34, 1, 'admin/auth/menu/6', 'PUT', '::1', '{\"parent_id\":\"2\",\"title\":\"\\u83dc\\u5355\",\"icon\":\"fa-bars\",\"uri\":\"auth\\/menu\",\"roles\":[null],\"permission\":null,\"_token\":\"0SyrYLfCAl5rCDWHZcC6aoPvk8qS6fJar7onbhqQ\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/tuku.cool\\/admin\\/auth\\/menu\"}', '2019-05-09 03:20:01', '2019-05-09 03:20:01');
INSERT INTO `admin_operation_log` VALUES (35, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2019-05-09 03:20:01', '2019-05-09 03:20:01');
INSERT INTO `admin_operation_log` VALUES (36, 1, 'admin/auth/menu/7/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 03:20:04', '2019-05-09 03:20:04');
INSERT INTO `admin_operation_log` VALUES (37, 1, 'admin/auth/menu/7', 'PUT', '::1', '{\"parent_id\":\"2\",\"title\":\"\\u64cd\\u4f5c\\u65e5\\u5fd7\",\"icon\":\"fa-history\",\"uri\":\"auth\\/logs\",\"roles\":[null],\"permission\":null,\"_token\":\"0SyrYLfCAl5rCDWHZcC6aoPvk8qS6fJar7onbhqQ\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/tuku.cool\\/admin\\/auth\\/menu\"}', '2019-05-09 03:20:17', '2019-05-09 03:20:17');
INSERT INTO `admin_operation_log` VALUES (38, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2019-05-09 03:20:17', '2019-05-09 03:20:17');
INSERT INTO `admin_operation_log` VALUES (39, 1, 'admin/auth/menu', 'POST', '::1', '{\"_token\":\"0SyrYLfCAl5rCDWHZcC6aoPvk8qS6fJar7onbhqQ\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2019-05-09 03:20:28', '2019-05-09 03:20:28');
INSERT INTO `admin_operation_log` VALUES (40, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 03:20:28', '2019-05-09 03:20:28');
INSERT INTO `admin_operation_log` VALUES (41, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2019-05-09 03:20:30', '2019-05-09 03:20:30');
INSERT INTO `admin_operation_log` VALUES (42, 1, 'admin', 'GET', '::1', '[]', '2019-05-09 03:26:12', '2019-05-09 03:26:12');
INSERT INTO `admin_operation_log` VALUES (43, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 03:26:17', '2019-05-09 03:26:17');
INSERT INTO `admin_operation_log` VALUES (44, 1, 'admin/auth/menu', 'POST', '::1', '{\"parent_id\":\"0\",\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"fa-user\",\"uri\":\"\\/users\",\"roles\":[null],\"permission\":null,\"_token\":\"rhgioRzkvDRCeWj4difmEuqY4iX5dLPIDDjbhyfG\"}', '2019-05-09 03:27:47', '2019-05-09 03:27:47');
INSERT INTO `admin_operation_log` VALUES (45, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2019-05-09 03:27:47', '2019-05-09 03:27:47');
INSERT INTO `admin_operation_log` VALUES (46, 1, 'admin/auth/menu', 'POST', '::1', '{\"_token\":\"rhgioRzkvDRCeWj4difmEuqY4iX5dLPIDDjbhyfG\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":8},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2019-05-09 03:27:55', '2019-05-09 03:27:55');
INSERT INTO `admin_operation_log` VALUES (47, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 03:27:55', '2019-05-09 03:27:55');
INSERT INTO `admin_operation_log` VALUES (48, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2019-05-09 03:27:57', '2019-05-09 03:27:57');
INSERT INTO `admin_operation_log` VALUES (49, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 03:27:58', '2019-05-09 03:27:58');
INSERT INTO `admin_operation_log` VALUES (50, 1, 'admin/auth/roles', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 03:29:34', '2019-05-09 03:29:34');
INSERT INTO `admin_operation_log` VALUES (51, 1, 'admin/auth/permissions', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 03:29:35', '2019-05-09 03:29:35');
INSERT INTO `admin_operation_log` VALUES (52, 1, 'admin/auth/permissions/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 03:29:40', '2019-05-09 03:29:40');
INSERT INTO `admin_operation_log` VALUES (53, 1, 'admin/auth/permissions', 'POST', '::1', '{\"slug\":\"users\",\"name\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"http_method\":[null],\"http_path\":\"\\/users*\",\"_token\":\"rhgioRzkvDRCeWj4difmEuqY4iX5dLPIDDjbhyfG\",\"_previous_\":\"http:\\/\\/tuku.cool\\/admin\\/auth\\/permissions\"}', '2019-05-09 03:30:08', '2019-05-09 03:30:08');
INSERT INTO `admin_operation_log` VALUES (54, 1, 'admin/auth/permissions', 'GET', '::1', '[]', '2019-05-09 03:30:08', '2019-05-09 03:30:08');
INSERT INTO `admin_operation_log` VALUES (55, 1, 'admin/auth/roles', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 03:30:28', '2019-05-09 03:30:28');
INSERT INTO `admin_operation_log` VALUES (56, 1, 'admin/auth/roles/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 03:30:29', '2019-05-09 03:30:29');
INSERT INTO `admin_operation_log` VALUES (57, 1, 'admin/auth/roles/create', 'GET', '::1', '[]', '2019-05-09 03:31:28', '2019-05-09 03:31:28');
INSERT INTO `admin_operation_log` VALUES (58, 1, 'admin/auth/roles', 'POST', '::1', '{\"slug\":\"operation\",\"name\":\"\\u8fd0\\u8425\",\"permissions\":[\"2\",\"3\",\"4\",\"6\",null],\"_token\":\"rhgioRzkvDRCeWj4difmEuqY4iX5dLPIDDjbhyfG\"}', '2019-05-09 03:31:48', '2019-05-09 03:31:48');
INSERT INTO `admin_operation_log` VALUES (59, 1, 'admin/auth/roles', 'GET', '::1', '[]', '2019-05-09 03:31:49', '2019-05-09 03:31:49');
INSERT INTO `admin_operation_log` VALUES (60, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 03:58:33', '2019-05-09 03:58:33');
INSERT INTO `admin_operation_log` VALUES (61, 1, 'admin/auth/menu', 'POST', '::1', '{\"parent_id\":\"0\",\"title\":\"\\u680f\\u76ee\\u5206\\u7c7b\",\"icon\":\"fa-bars\",\"uri\":\"\\/categories\",\"roles\":[null],\"permission\":null,\"_token\":\"rhgioRzkvDRCeWj4difmEuqY4iX5dLPIDDjbhyfG\"}', '2019-05-09 03:58:50', '2019-05-09 03:58:50');
INSERT INTO `admin_operation_log` VALUES (62, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2019-05-09 03:58:50', '2019-05-09 03:58:50');
INSERT INTO `admin_operation_log` VALUES (63, 1, 'admin/auth/menu', 'POST', '::1', '{\"_token\":\"rhgioRzkvDRCeWj4difmEuqY4iX5dLPIDDjbhyfG\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":8},{\\\"id\\\":9},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2019-05-09 03:58:57', '2019-05-09 03:58:57');
INSERT INTO `admin_operation_log` VALUES (64, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 03:58:57', '2019-05-09 03:58:57');
INSERT INTO `admin_operation_log` VALUES (65, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2019-05-09 03:59:01', '2019-05-09 03:59:01');
INSERT INTO `admin_operation_log` VALUES (66, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2019-05-09 04:01:27', '2019-05-09 04:01:27');
INSERT INTO `admin_operation_log` VALUES (67, 1, 'admin/auth/menu', 'POST', '::1', '{\"_token\":\"rhgioRzkvDRCeWj4difmEuqY4iX5dLPIDDjbhyfG\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":8},{\\\"id\\\":9},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2019-05-09 04:01:37', '2019-05-09 04:01:37');
INSERT INTO `admin_operation_log` VALUES (68, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 04:01:37', '2019-05-09 04:01:37');
INSERT INTO `admin_operation_log` VALUES (69, 1, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 04:01:39', '2019-05-09 04:01:39');
INSERT INTO `admin_operation_log` VALUES (70, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2019-05-09 04:02:09', '2019-05-09 04:02:09');
INSERT INTO `admin_operation_log` VALUES (71, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 04:04:13', '2019-05-09 04:04:13');
INSERT INTO `admin_operation_log` VALUES (72, 1, 'admin/auth/menu/9/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 04:04:21', '2019-05-09 04:04:21');
INSERT INTO `admin_operation_log` VALUES (73, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 04:04:27', '2019-05-09 04:04:27');
INSERT INTO `admin_operation_log` VALUES (74, 1, 'admin/auth/menu/8/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 04:04:33', '2019-05-09 04:04:33');
INSERT INTO `admin_operation_log` VALUES (75, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 04:04:38', '2019-05-09 04:04:38');
INSERT INTO `admin_operation_log` VALUES (76, 1, 'admin/auth/menu/9/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 04:04:45', '2019-05-09 04:04:45');
INSERT INTO `admin_operation_log` VALUES (77, 1, 'admin', 'GET', '::1', '[]', '2019-05-09 05:42:17', '2019-05-09 05:42:17');
INSERT INTO `admin_operation_log` VALUES (78, 1, 'admin/auth/menu/7/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 05:45:12', '2019-05-09 05:45:12');
INSERT INTO `admin_operation_log` VALUES (79, 1, 'admin/auth/menu/7/edit', 'GET', '::1', '[]', '2019-05-09 05:45:13', '2019-05-09 05:45:13');
INSERT INTO `admin_operation_log` VALUES (80, 1, 'admin/categories', 'GET', '::1', '[]', '2019-05-09 06:00:10', '2019-05-09 06:00:10');
INSERT INTO `admin_operation_log` VALUES (81, 1, 'admin/categories', 'GET', '::1', '[]', '2019-05-09 06:06:45', '2019-05-09 06:06:45');
INSERT INTO `admin_operation_log` VALUES (82, 1, 'admin/categories', 'GET', '::1', '[]', '2019-05-09 06:08:13', '2019-05-09 06:08:13');
INSERT INTO `admin_operation_log` VALUES (83, 1, 'admin/categories', 'GET', '::1', '[]', '2019-05-09 06:08:22', '2019-05-09 06:08:22');
INSERT INTO `admin_operation_log` VALUES (84, 1, 'admin/auth/menu/9/edit', 'GET', '::1', '[]', '2019-05-09 06:08:31', '2019-05-09 06:08:31');
INSERT INTO `admin_operation_log` VALUES (85, 1, 'admin/categories', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 06:08:37', '2019-05-09 06:08:37');
INSERT INTO `admin_operation_log` VALUES (86, 1, 'admin/categories', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 06:08:47', '2019-05-09 06:08:47');
INSERT INTO `admin_operation_log` VALUES (87, 1, 'admin/categories', 'GET', '::1', '[]', '2019-05-09 06:09:35', '2019-05-09 06:09:35');
INSERT INTO `admin_operation_log` VALUES (88, 1, 'admin/categories', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 06:09:40', '2019-05-09 06:09:40');
INSERT INTO `admin_operation_log` VALUES (89, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 06:09:48', '2019-05-09 06:09:48');
INSERT INTO `admin_operation_log` VALUES (90, 1, 'admin/categories', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 06:09:50', '2019-05-09 06:09:50');
INSERT INTO `admin_operation_log` VALUES (91, 1, 'admin/categories', 'GET', '::1', '[]', '2019-05-09 06:09:55', '2019-05-09 06:09:55');
INSERT INTO `admin_operation_log` VALUES (92, 1, 'admin/categories', 'POST', '::1', '{\"name\":\"\\u70ed\\u95e8\\u5c0f\\u5403\",\"description\":null,\"order\":\"1\",\"parent_id\":\"0\",\"_token\":\"kIurnG30dQdyHLMEXU2am237ewC0esn3m2r3thqC\"}', '2019-05-09 06:10:09', '2019-05-09 06:10:09');
INSERT INTO `admin_operation_log` VALUES (93, 1, 'admin/categories', 'GET', '::1', '[]', '2019-05-09 06:10:09', '2019-05-09 06:10:09');
INSERT INTO `admin_operation_log` VALUES (94, 1, 'admin/categories', 'POST', '::1', '{\"_token\":\"kIurnG30dQdyHLMEXU2am237ewC0esn3m2r3thqC\",\"_order\":\"[{\\\"id\\\":1}]\"}', '2019-05-09 06:10:11', '2019-05-09 06:10:11');
INSERT INTO `admin_operation_log` VALUES (95, 1, 'admin/categories', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 06:10:11', '2019-05-09 06:10:11');
INSERT INTO `admin_operation_log` VALUES (96, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 06:10:14', '2019-05-09 06:10:14');
INSERT INTO `admin_operation_log` VALUES (97, 1, 'admin/categories', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 06:10:15', '2019-05-09 06:10:15');
INSERT INTO `admin_operation_log` VALUES (98, 1, 'admin/categories', 'POST', '::1', '{\"name\":\"\\u65b0\\u9c9c\\u996e\\u54c1\",\"description\":null,\"order\":\"2\",\"parent_id\":\"0\",\"_token\":\"kIurnG30dQdyHLMEXU2am237ewC0esn3m2r3thqC\"}', '2019-05-09 06:10:24', '2019-05-09 06:10:24');
INSERT INTO `admin_operation_log` VALUES (99, 1, 'admin/categories', 'GET', '::1', '[]', '2019-05-09 06:10:24', '2019-05-09 06:10:24');
INSERT INTO `admin_operation_log` VALUES (100, 1, 'admin/categories', 'POST', '::1', '{\"name\":\"\\u70b8\\u9e21\",\"description\":null,\"order\":\"1\",\"parent_id\":\"1\",\"_token\":\"kIurnG30dQdyHLMEXU2am237ewC0esn3m2r3thqC\"}', '2019-05-09 06:10:33', '2019-05-09 06:10:33');
INSERT INTO `admin_operation_log` VALUES (101, 1, 'admin/categories', 'GET', '::1', '[]', '2019-05-09 06:10:33', '2019-05-09 06:10:33');
INSERT INTO `admin_operation_log` VALUES (102, 1, 'admin/categories', 'POST', '::1', '{\"_token\":\"kIurnG30dQdyHLMEXU2am237ewC0esn3m2r3thqC\",\"_order\":\"[{\\\"id\\\":1,\\\"children\\\":[{\\\"id\\\":3}]},{\\\"id\\\":2}]\"}', '2019-05-09 06:10:39', '2019-05-09 06:10:39');
INSERT INTO `admin_operation_log` VALUES (103, 1, 'admin/categories', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 06:10:39', '2019-05-09 06:10:39');
INSERT INTO `admin_operation_log` VALUES (104, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 06:10:44', '2019-05-09 06:10:44');
INSERT INTO `admin_operation_log` VALUES (105, 1, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 06:10:45', '2019-05-09 06:10:45');
INSERT INTO `admin_operation_log` VALUES (106, 1, 'admin/categories', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 06:10:46', '2019-05-09 06:10:46');
INSERT INTO `admin_operation_log` VALUES (107, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 06:10:50', '2019-05-09 06:10:50');
INSERT INTO `admin_operation_log` VALUES (108, 1, 'admin/auth/menu', 'POST', '::1', '{\"parent_id\":\"0\",\"title\":\"\\u56fe\\u5e93\\u96c6\",\"icon\":\"fa-arrows-alt\",\"uri\":\"\\/tukus\",\"roles\":[null],\"permission\":null,\"_token\":\"kIurnG30dQdyHLMEXU2am237ewC0esn3m2r3thqC\"}', '2019-05-09 06:11:15', '2019-05-09 06:11:15');
INSERT INTO `admin_operation_log` VALUES (109, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2019-05-09 06:11:16', '2019-05-09 06:11:16');
INSERT INTO `admin_operation_log` VALUES (110, 1, 'admin/auth/menu', 'POST', '::1', '{\"_token\":\"kIurnG30dQdyHLMEXU2am237ewC0esn3m2r3thqC\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":8},{\\\"id\\\":9},{\\\"id\\\":10},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2019-05-09 06:11:22', '2019-05-09 06:11:22');
INSERT INTO `admin_operation_log` VALUES (111, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 06:11:22', '2019-05-09 06:11:22');
INSERT INTO `admin_operation_log` VALUES (112, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2019-05-09 06:11:24', '2019-05-09 06:11:24');
INSERT INTO `admin_operation_log` VALUES (113, 1, 'admin', 'GET', '::1', '[]', '2019-05-09 06:16:12', '2019-05-09 06:16:12');
INSERT INTO `admin_operation_log` VALUES (114, 1, 'admin', 'GET', '::1', '[]', '2019-05-09 06:16:14', '2019-05-09 06:16:14');
INSERT INTO `admin_operation_log` VALUES (115, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-09 06:17:02', '2019-05-09 06:17:02');
INSERT INTO `admin_operation_log` VALUES (116, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-09 06:19:14', '2019-05-09 06:19:14');
INSERT INTO `admin_operation_log` VALUES (117, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-09 06:20:15', '2019-05-09 06:20:15');
INSERT INTO `admin_operation_log` VALUES (118, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-09 06:21:31', '2019-05-09 06:21:31');
INSERT INTO `admin_operation_log` VALUES (119, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-09 06:22:42', '2019-05-09 06:22:42');
INSERT INTO `admin_operation_log` VALUES (120, 1, 'admin', 'GET', '::1', '[]', '2019-05-09 06:22:57', '2019-05-09 06:22:57');
INSERT INTO `admin_operation_log` VALUES (121, 1, 'admin/tukus', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 06:22:59', '2019-05-09 06:22:59');
INSERT INTO `admin_operation_log` VALUES (122, 1, 'admin', 'GET', '::1', '[]', '2019-05-09 06:22:59', '2019-05-09 06:22:59');
INSERT INTO `admin_operation_log` VALUES (123, 1, 'admin/auth/permissions', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 06:23:47', '2019-05-09 06:23:47');
INSERT INTO `admin_operation_log` VALUES (124, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 06:23:52', '2019-05-09 06:23:52');
INSERT INTO `admin_operation_log` VALUES (125, 1, 'admin/tukus', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 06:24:58', '2019-05-09 06:24:58');
INSERT INTO `admin_operation_log` VALUES (126, 1, 'admin/tukus/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 06:25:04', '2019-05-09 06:25:04');
INSERT INTO `admin_operation_log` VALUES (127, 1, 'admin/tukus', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 06:27:16', '2019-05-09 06:27:16');
INSERT INTO `admin_operation_log` VALUES (128, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 06:27:30', '2019-05-09 06:27:30');
INSERT INTO `admin_operation_log` VALUES (129, 1, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 06:29:14', '2019-05-09 06:29:14');
INSERT INTO `admin_operation_log` VALUES (130, 1, 'admin/tukus', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 06:30:16', '2019-05-09 06:30:16');
INSERT INTO `admin_operation_log` VALUES (131, 1, 'admin/tukus/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 06:30:19', '2019-05-09 06:30:19');
INSERT INTO `admin_operation_log` VALUES (132, 1, 'admin/tukus', 'POST', '::1', '{\"class_id\":\"3\",\"notes\":\"\\u70b8\\u9e21\\u7c7b\\u522b\\u7684\\u56fe\\u7247demo\",\"editer\":\"1\",\"_token\":\"kIurnG30dQdyHLMEXU2am237ewC0esn3m2r3thqC\",\"_previous_\":\"http:\\/\\/tuku.cool\\/admin\\/tukus\"}', '2019-05-09 06:30:57', '2019-05-09 06:30:57');
INSERT INTO `admin_operation_log` VALUES (133, 1, 'admin/tukus/create', 'GET', '::1', '[]', '2019-05-09 06:30:58', '2019-05-09 06:30:58');
INSERT INTO `admin_operation_log` VALUES (134, 1, 'admin/tukus/create', 'GET', '::1', '[]', '2019-05-09 06:44:43', '2019-05-09 06:44:43');
INSERT INTO `admin_operation_log` VALUES (135, 1, 'admin/tukus', 'POST', '::1', '{\"class_id\":\"0\",\"notes\":\"2\",\"editer\":\"1\",\"recommend\":null,\"_token\":\"kIurnG30dQdyHLMEXU2am237ewC0esn3m2r3thqC\"}', '2019-05-09 06:44:54', '2019-05-09 06:44:54');
INSERT INTO `admin_operation_log` VALUES (136, 1, 'admin/tukus/create', 'GET', '::1', '[]', '2019-05-09 06:44:54', '2019-05-09 06:44:54');
INSERT INTO `admin_operation_log` VALUES (137, 1, 'admin/tukus/create', 'GET', '::1', '[]', '2019-05-09 06:46:35', '2019-05-09 06:46:35');
INSERT INTO `admin_operation_log` VALUES (138, 1, 'admin/tukus', 'POST', '::1', '{\"class_id\":\"0\",\"notes\":null,\"editer\":\"1\",\"recommend\":null,\"_token\":\"kIurnG30dQdyHLMEXU2am237ewC0esn3m2r3thqC\"}', '2019-05-09 06:46:37', '2019-05-09 06:46:37');
INSERT INTO `admin_operation_log` VALUES (139, 1, 'admin/tukus/create', 'GET', '::1', '[]', '2019-05-09 06:46:38', '2019-05-09 06:46:38');
INSERT INTO `admin_operation_log` VALUES (140, 1, 'admin/tukus/create', 'GET', '::1', '[]', '2019-05-09 06:46:43', '2019-05-09 06:46:43');
INSERT INTO `admin_operation_log` VALUES (141, 1, 'admin/tukus', 'POST', '::1', '{\"class_id\":\"1\",\"notes\":\"demo\",\"editer\":\"1\",\"recommend\":null,\"_token\":\"kIurnG30dQdyHLMEXU2am237ewC0esn3m2r3thqC\"}', '2019-05-09 06:46:55', '2019-05-09 06:46:55');
INSERT INTO `admin_operation_log` VALUES (142, 1, 'admin/tukus/create', 'GET', '::1', '[]', '2019-05-09 06:46:56', '2019-05-09 06:46:56');
INSERT INTO `admin_operation_log` VALUES (143, 1, 'admin/tukus/create', 'GET', '::1', '[]', '2019-05-09 06:47:43', '2019-05-09 06:47:43');
INSERT INTO `admin_operation_log` VALUES (144, 1, 'admin/tukus', 'POST', '::1', '{\"class_id\":\"1\",\"notes\":\"demo\",\"editer\":\"1\",\"recommend\":\"1\",\"_token\":\"kIurnG30dQdyHLMEXU2am237ewC0esn3m2r3thqC\"}', '2019-05-09 06:47:53', '2019-05-09 06:47:53');
INSERT INTO `admin_operation_log` VALUES (145, 1, 'admin/tukus/create', 'GET', '::1', '[]', '2019-05-09 06:47:53', '2019-05-09 06:47:53');
INSERT INTO `admin_operation_log` VALUES (146, 1, 'admin/tukus/create', 'GET', '::1', '[]', '2019-05-09 06:52:05', '2019-05-09 06:52:05');
INSERT INTO `admin_operation_log` VALUES (147, 1, 'admin/tukus/create', 'GET', '::1', '[]', '2019-05-09 06:52:20', '2019-05-09 06:52:20');
INSERT INTO `admin_operation_log` VALUES (148, 1, 'admin/tukus', 'POST', '::1', '{\"class_id\":\"1\",\"notes\":\"demo\",\"editer\":\"1\",\"_token\":\"kIurnG30dQdyHLMEXU2am237ewC0esn3m2r3thqC\"}', '2019-05-09 06:52:31', '2019-05-09 06:52:31');
INSERT INTO `admin_operation_log` VALUES (149, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-09 06:52:31', '2019-05-09 06:52:31');
INSERT INTO `admin_operation_log` VALUES (150, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-09 06:52:56', '2019-05-09 06:52:56');
INSERT INTO `admin_operation_log` VALUES (151, 1, 'admin/tukus', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 06:52:57', '2019-05-09 06:52:57');
INSERT INTO `admin_operation_log` VALUES (152, 1, 'admin/users', 'GET', '::1', '[]', '2019-05-09 06:56:46', '2019-05-09 06:56:46');
INSERT INTO `admin_operation_log` VALUES (153, 1, 'admin/tukus', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 06:56:48', '2019-05-09 06:56:48');
INSERT INTO `admin_operation_log` VALUES (154, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-09 06:58:09', '2019-05-09 06:58:09');
INSERT INTO `admin_operation_log` VALUES (155, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-09 06:58:09', '2019-05-09 06:58:09');
INSERT INTO `admin_operation_log` VALUES (156, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-09 06:58:58', '2019-05-09 06:58:58');
INSERT INTO `admin_operation_log` VALUES (157, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-09 06:59:34', '2019-05-09 06:59:34');
INSERT INTO `admin_operation_log` VALUES (158, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-09 06:59:55', '2019-05-09 06:59:55');
INSERT INTO `admin_operation_log` VALUES (159, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-09 07:00:04', '2019-05-09 07:00:04');
INSERT INTO `admin_operation_log` VALUES (160, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-09 07:03:20', '2019-05-09 07:03:20');
INSERT INTO `admin_operation_log` VALUES (161, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-09 07:03:33', '2019-05-09 07:03:33');
INSERT INTO `admin_operation_log` VALUES (162, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-09 07:03:41', '2019-05-09 07:03:41');
INSERT INTO `admin_operation_log` VALUES (163, 1, 'admin/tukus', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 07:03:47', '2019-05-09 07:03:47');
INSERT INTO `admin_operation_log` VALUES (164, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-09 07:03:51', '2019-05-09 07:03:51');
INSERT INTO `admin_operation_log` VALUES (165, 1, 'admin/tukus', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 07:03:57', '2019-05-09 07:03:57');
INSERT INTO `admin_operation_log` VALUES (166, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-09 07:04:04', '2019-05-09 07:04:04');
INSERT INTO `admin_operation_log` VALUES (167, 1, 'admin/tukus', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 07:04:08', '2019-05-09 07:04:08');
INSERT INTO `admin_operation_log` VALUES (168, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-09 07:04:18', '2019-05-09 07:04:18');
INSERT INTO `admin_operation_log` VALUES (169, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-09 07:10:41', '2019-05-09 07:10:41');
INSERT INTO `admin_operation_log` VALUES (170, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-09 07:10:43', '2019-05-09 07:10:43');
INSERT INTO `admin_operation_log` VALUES (171, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-09 07:11:38', '2019-05-09 07:11:38');
INSERT INTO `admin_operation_log` VALUES (172, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-09 07:11:42', '2019-05-09 07:11:42');
INSERT INTO `admin_operation_log` VALUES (173, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-09 07:13:35', '2019-05-09 07:13:35');
INSERT INTO `admin_operation_log` VALUES (174, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-09 07:14:40', '2019-05-09 07:14:40');
INSERT INTO `admin_operation_log` VALUES (175, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-09 07:16:04', '2019-05-09 07:16:04');
INSERT INTO `admin_operation_log` VALUES (176, 1, 'admin/tukus/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 07:16:06', '2019-05-09 07:16:06');
INSERT INTO `admin_operation_log` VALUES (177, 1, 'admin/tukus', 'POST', '::1', '{\"class_id\":\"1\",\"notes\":\"\\u7684\\u819c\",\"editer\":\"1\",\"_token\":\"0SyrYLfCAl5rCDWHZcC6aoPvk8qS6fJar7onbhqQ\",\"_previous_\":\"http:\\/\\/tuku.cool\\/admin\\/tukus\"}', '2019-05-09 07:16:18', '2019-05-09 07:16:18');
INSERT INTO `admin_operation_log` VALUES (178, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-09 07:16:18', '2019-05-09 07:16:18');
INSERT INTO `admin_operation_log` VALUES (179, 1, 'admin/tukus', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 07:16:31', '2019-05-09 07:16:31');
INSERT INTO `admin_operation_log` VALUES (180, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-09 07:33:41', '2019-05-09 07:33:41');
INSERT INTO `admin_operation_log` VALUES (181, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-09 08:09:40', '2019-05-09 08:09:40');
INSERT INTO `admin_operation_log` VALUES (182, 1, 'admin', 'GET', '::1', '[]', '2019-05-09 08:09:47', '2019-05-09 08:09:47');
INSERT INTO `admin_operation_log` VALUES (183, 1, 'admin', 'GET', '::1', '[]', '2019-05-09 09:32:48', '2019-05-09 09:32:48');
INSERT INTO `admin_operation_log` VALUES (184, 1, 'admin/tukus', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 09:32:52', '2019-05-09 09:32:52');
INSERT INTO `admin_operation_log` VALUES (185, 1, 'admin/tukus/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 09:32:53', '2019-05-09 09:32:53');
INSERT INTO `admin_operation_log` VALUES (186, 1, 'admin/tukus', 'POST', '::1', '{\"class_id\":\"2\",\"notes\":\"\\u6d4b\\u8bd5\\u6570\\u636e\",\"editer\":\"1\",\"_token\":\"0SyrYLfCAl5rCDWHZcC6aoPvk8qS6fJar7onbhqQ\",\"_previous_\":\"http:\\/\\/tuku.cool\\/admin\\/tukus\"}', '2019-05-09 09:33:17', '2019-05-09 09:33:17');
INSERT INTO `admin_operation_log` VALUES (187, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-09 09:33:17', '2019-05-09 09:33:17');
INSERT INTO `admin_operation_log` VALUES (188, 1, 'admin', 'GET', '::1', '[]', '2019-05-09 12:00:03', '2019-05-09 12:00:03');
INSERT INTO `admin_operation_log` VALUES (189, 1, 'admin/tukus', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-09 12:00:06', '2019-05-09 12:00:06');
INSERT INTO `admin_operation_log` VALUES (190, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-09 12:02:33', '2019-05-09 12:02:33');
INSERT INTO `admin_operation_log` VALUES (191, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-09 12:03:21', '2019-05-09 12:03:21');
INSERT INTO `admin_operation_log` VALUES (192, 1, 'admin', 'GET', '::1', '[]', '2019-05-10 00:26:26', '2019-05-10 00:26:26');
INSERT INTO `admin_operation_log` VALUES (193, 1, 'admin/tukus', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 00:26:38', '2019-05-10 00:26:38');
INSERT INTO `admin_operation_log` VALUES (194, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 00:31:00', '2019-05-10 00:31:00');
INSERT INTO `admin_operation_log` VALUES (195, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 00:31:13', '2019-05-10 00:31:13');
INSERT INTO `admin_operation_log` VALUES (196, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 00:31:37', '2019-05-10 00:31:37');
INSERT INTO `admin_operation_log` VALUES (197, 1, 'admin/tukus', 'GET', '::1', '{\"created_at\":{\"start\":null,\"end\":null},\"notes\":null,\"class_id\":\"2\",\"_pjax\":\"#pjax-container\"}', '2019-05-10 00:31:59', '2019-05-10 00:31:59');
INSERT INTO `admin_operation_log` VALUES (198, 1, 'admin/tukus', 'GET', '::1', '{\"created_at\":{\"start\":null,\"end\":null},\"notes\":null,\"class_id\":\"2\"}', '2019-05-10 00:57:34', '2019-05-10 00:57:34');
INSERT INTO `admin_operation_log` VALUES (199, 1, 'admin', 'GET', '::1', '[]', '2019-05-10 02:15:40', '2019-05-10 02:15:40');
INSERT INTO `admin_operation_log` VALUES (200, 1, 'admin/tukus', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 02:15:43', '2019-05-10 02:15:43');
INSERT INTO `admin_operation_log` VALUES (201, 1, 'admin/tukus/5', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 02:15:55', '2019-05-10 02:15:55');
INSERT INTO `admin_operation_log` VALUES (202, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 02:15:55', '2019-05-10 02:15:55');
INSERT INTO `admin_operation_log` VALUES (203, 1, 'admin/tukus/1', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 02:16:35', '2019-05-10 02:16:35');
INSERT INTO `admin_operation_log` VALUES (204, 1, 'admin/tukus', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 02:16:38', '2019-05-10 02:16:38');
INSERT INTO `admin_operation_log` VALUES (205, 1, 'admin/tukus/1', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 02:16:40', '2019-05-10 02:16:40');
INSERT INTO `admin_operation_log` VALUES (206, 1, 'admin/tukus', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 02:16:46', '2019-05-10 02:16:46');
INSERT INTO `admin_operation_log` VALUES (207, 1, 'admin/tukus/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 02:16:49', '2019-05-10 02:16:49');
INSERT INTO `admin_operation_log` VALUES (208, 1, 'admin/tukus', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 02:16:56', '2019-05-10 02:16:56');
INSERT INTO `admin_operation_log` VALUES (209, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 02:25:28', '2019-05-10 02:25:28');
INSERT INTO `admin_operation_log` VALUES (210, 1, 'admin/tukus/1', 'DELETE', '::1', '{\"_method\":\"delete\",\"_token\":\"e1wNaiCKIu8fQlP7GH4PsJCOlcNCQa21zcFbTGWp\"}', '2019-05-10 02:25:33', '2019-05-10 02:25:33');
INSERT INTO `admin_operation_log` VALUES (211, 1, 'admin/tukus', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 02:25:33', '2019-05-10 02:25:33');
INSERT INTO `admin_operation_log` VALUES (212, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 02:25:37', '2019-05-10 02:25:37');
INSERT INTO `admin_operation_log` VALUES (213, 1, 'admin/tukus/1,2', 'DELETE', '::1', '{\"_method\":\"delete\",\"_token\":\"e1wNaiCKIu8fQlP7GH4PsJCOlcNCQa21zcFbTGWp\"}', '2019-05-10 02:25:50', '2019-05-10 02:25:50');
INSERT INTO `admin_operation_log` VALUES (214, 1, 'admin/tukus', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 02:25:50', '2019-05-10 02:25:50');
INSERT INTO `admin_operation_log` VALUES (215, 1, 'admin/tukus/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 02:26:01', '2019-05-10 02:26:01');
INSERT INTO `admin_operation_log` VALUES (216, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 02:26:02', '2019-05-10 02:26:02');
INSERT INTO `admin_operation_log` VALUES (217, 1, 'admin/tukus/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 02:26:04', '2019-05-10 02:26:04');
INSERT INTO `admin_operation_log` VALUES (218, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 02:26:05', '2019-05-10 02:26:05');
INSERT INTO `admin_operation_log` VALUES (219, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 02:26:07', '2019-05-10 02:26:07');
INSERT INTO `admin_operation_log` VALUES (220, 1, 'admin/tukus/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 02:26:09', '2019-05-10 02:26:09');
INSERT INTO `admin_operation_log` VALUES (221, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 02:26:09', '2019-05-10 02:26:09');
INSERT INTO `admin_operation_log` VALUES (222, 1, 'admin/tukus/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 02:26:13', '2019-05-10 02:26:13');
INSERT INTO `admin_operation_log` VALUES (223, 1, 'admin/tukus', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 02:26:15', '2019-05-10 02:26:15');
INSERT INTO `admin_operation_log` VALUES (224, 1, 'admin/tukus/4/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 02:26:20', '2019-05-10 02:26:20');
INSERT INTO `admin_operation_log` VALUES (225, 1, 'admin/tukus', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 02:26:23', '2019-05-10 02:26:23');
INSERT INTO `admin_operation_log` VALUES (226, 1, 'admin/tukus/4', 'DELETE', '::1', '{\"_method\":\"delete\",\"_token\":\"e1wNaiCKIu8fQlP7GH4PsJCOlcNCQa21zcFbTGWp\"}', '2019-05-10 02:26:28', '2019-05-10 02:26:28');
INSERT INTO `admin_operation_log` VALUES (227, 1, 'admin/tukus', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 02:26:28', '2019-05-10 02:26:28');
INSERT INTO `admin_operation_log` VALUES (228, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 02:26:34', '2019-05-10 02:26:34');
INSERT INTO `admin_operation_log` VALUES (229, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 02:26:35', '2019-05-10 02:26:35');
INSERT INTO `admin_operation_log` VALUES (230, 1, 'admin/tukus/6/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 02:26:40', '2019-05-10 02:26:40');
INSERT INTO `admin_operation_log` VALUES (231, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 02:26:41', '2019-05-10 02:26:41');
INSERT INTO `admin_operation_log` VALUES (232, 1, 'admin/tukus', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 02:26:45', '2019-05-10 02:26:45');
INSERT INTO `admin_operation_log` VALUES (233, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 02:26:50', '2019-05-10 02:26:50');
INSERT INTO `admin_operation_log` VALUES (234, 1, 'admin/tukus/1', 'DELETE', '::1', '{\"_method\":\"delete\",\"_token\":\"e1wNaiCKIu8fQlP7GH4PsJCOlcNCQa21zcFbTGWp\"}', '2019-05-10 02:27:41', '2019-05-10 02:27:41');
INSERT INTO `admin_operation_log` VALUES (235, 1, 'admin/tukus', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 02:27:42', '2019-05-10 02:27:42');
INSERT INTO `admin_operation_log` VALUES (236, 1, 'admin/tukus/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 02:31:59', '2019-05-10 02:31:59');
INSERT INTO `admin_operation_log` VALUES (237, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 02:32:00', '2019-05-10 02:32:00');
INSERT INTO `admin_operation_log` VALUES (238, 1, 'admin/tukus/3', 'DELETE', '::1', '{\"_method\":\"delete\",\"_token\":\"e1wNaiCKIu8fQlP7GH4PsJCOlcNCQa21zcFbTGWp\"}', '2019-05-10 02:33:00', '2019-05-10 02:33:00');
INSERT INTO `admin_operation_log` VALUES (239, 1, 'admin/tukus', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 02:33:01', '2019-05-10 02:33:01');
INSERT INTO `admin_operation_log` VALUES (240, 1, 'admin/tukus/2', 'DELETE', '::1', '{\"_method\":\"delete\",\"_token\":\"e1wNaiCKIu8fQlP7GH4PsJCOlcNCQa21zcFbTGWp\"}', '2019-05-10 02:33:07', '2019-05-10 02:33:07');
INSERT INTO `admin_operation_log` VALUES (241, 1, 'admin/tukus', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 02:33:07', '2019-05-10 02:33:07');
INSERT INTO `admin_operation_log` VALUES (242, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 02:33:41', '2019-05-10 02:33:41');
INSERT INTO `admin_operation_log` VALUES (243, 1, 'admin/tukus/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 02:33:43', '2019-05-10 02:33:43');
INSERT INTO `admin_operation_log` VALUES (244, 1, 'admin/tukus', 'POST', '::1', '{\"class_id\":\"1\",\"notes\":\"de mo\",\"editer\":\"1\",\"_token\":\"e1wNaiCKIu8fQlP7GH4PsJCOlcNCQa21zcFbTGWp\",\"_previous_\":\"http:\\/\\/tuku.local\\/admin\\/tukus\"}', '2019-05-10 02:34:00', '2019-05-10 02:34:00');
INSERT INTO `admin_operation_log` VALUES (245, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 02:34:01', '2019-05-10 02:34:01');
INSERT INTO `admin_operation_log` VALUES (246, 1, 'admin/tukus/12/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 02:34:20', '2019-05-10 02:34:20');
INSERT INTO `admin_operation_log` VALUES (247, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 02:34:20', '2019-05-10 02:34:20');
INSERT INTO `admin_operation_log` VALUES (248, 1, 'admin/tukus/14/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 02:34:29', '2019-05-10 02:34:29');
INSERT INTO `admin_operation_log` VALUES (249, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 02:34:29', '2019-05-10 02:34:29');
INSERT INTO `admin_operation_log` VALUES (250, 1, 'admin/tukus/15/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 02:34:31', '2019-05-10 02:34:31');
INSERT INTO `admin_operation_log` VALUES (251, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 02:34:31', '2019-05-10 02:34:31');
INSERT INTO `admin_operation_log` VALUES (252, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 02:34:32', '2019-05-10 02:34:32');
INSERT INTO `admin_operation_log` VALUES (253, 1, 'admin/tukus/15/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 02:34:35', '2019-05-10 02:34:35');
INSERT INTO `admin_operation_log` VALUES (254, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 02:34:35', '2019-05-10 02:34:35');
INSERT INTO `admin_operation_log` VALUES (255, 1, 'admin/tukus/12/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 02:35:26', '2019-05-10 02:35:26');
INSERT INTO `admin_operation_log` VALUES (256, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 02:35:26', '2019-05-10 02:35:26');
INSERT INTO `admin_operation_log` VALUES (257, 1, 'admin/tukus/13/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 02:35:28', '2019-05-10 02:35:28');
INSERT INTO `admin_operation_log` VALUES (258, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 02:35:28', '2019-05-10 02:35:28');
INSERT INTO `admin_operation_log` VALUES (259, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 02:35:31', '2019-05-10 02:35:31');
INSERT INTO `admin_operation_log` VALUES (260, 1, 'admin/tukus/15/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 02:35:33', '2019-05-10 02:35:33');
INSERT INTO `admin_operation_log` VALUES (261, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 02:35:34', '2019-05-10 02:35:34');
INSERT INTO `admin_operation_log` VALUES (262, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 02:53:19', '2019-05-10 02:53:19');
INSERT INTO `admin_operation_log` VALUES (263, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 02:56:26', '2019-05-10 02:56:26');
INSERT INTO `admin_operation_log` VALUES (264, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 03:00:33', '2019-05-10 03:00:33');
INSERT INTO `admin_operation_log` VALUES (265, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 03:01:12', '2019-05-10 03:01:12');
INSERT INTO `admin_operation_log` VALUES (266, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 03:01:24', '2019-05-10 03:01:24');
INSERT INTO `admin_operation_log` VALUES (267, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 03:01:41', '2019-05-10 03:01:41');
INSERT INTO `admin_operation_log` VALUES (268, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 03:02:26', '2019-05-10 03:02:26');
INSERT INTO `admin_operation_log` VALUES (269, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 03:03:38', '2019-05-10 03:03:38');
INSERT INTO `admin_operation_log` VALUES (270, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 03:05:04', '2019-05-10 03:05:04');
INSERT INTO `admin_operation_log` VALUES (271, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 03:05:22', '2019-05-10 03:05:22');
INSERT INTO `admin_operation_log` VALUES (272, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 03:14:05', '2019-05-10 03:14:05');
INSERT INTO `admin_operation_log` VALUES (273, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 03:14:07', '2019-05-10 03:14:07');
INSERT INTO `admin_operation_log` VALUES (274, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 03:14:08', '2019-05-10 03:14:08');
INSERT INTO `admin_operation_log` VALUES (275, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 03:14:08', '2019-05-10 03:14:08');
INSERT INTO `admin_operation_log` VALUES (276, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 03:14:08', '2019-05-10 03:14:08');
INSERT INTO `admin_operation_log` VALUES (277, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 03:14:08', '2019-05-10 03:14:08');
INSERT INTO `admin_operation_log` VALUES (278, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 03:25:17', '2019-05-10 03:25:17');
INSERT INTO `admin_operation_log` VALUES (279, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 03:25:24', '2019-05-10 03:25:24');
INSERT INTO `admin_operation_log` VALUES (280, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 03:26:44', '2019-05-10 03:26:44');
INSERT INTO `admin_operation_log` VALUES (281, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 03:27:02', '2019-05-10 03:27:02');
INSERT INTO `admin_operation_log` VALUES (282, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 03:27:51', '2019-05-10 03:27:51');
INSERT INTO `admin_operation_log` VALUES (283, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 03:28:50', '2019-05-10 03:28:50');
INSERT INTO `admin_operation_log` VALUES (284, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 03:34:49', '2019-05-10 03:34:49');
INSERT INTO `admin_operation_log` VALUES (285, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 03:38:38', '2019-05-10 03:38:38');
INSERT INTO `admin_operation_log` VALUES (286, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 03:43:16', '2019-05-10 03:43:16');
INSERT INTO `admin_operation_log` VALUES (287, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 03:44:53', '2019-05-10 03:44:53');
INSERT INTO `admin_operation_log` VALUES (288, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 03:46:04', '2019-05-10 03:46:04');
INSERT INTO `admin_operation_log` VALUES (289, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 03:46:15', '2019-05-10 03:46:15');
INSERT INTO `admin_operation_log` VALUES (290, 1, 'admin', 'GET', '::1', '[]', '2019-05-10 03:46:38', '2019-05-10 03:46:38');
INSERT INTO `admin_operation_log` VALUES (291, 1, 'admin/categories', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 03:46:44', '2019-05-10 03:46:44');
INSERT INTO `admin_operation_log` VALUES (292, 1, 'admin/tukus', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 03:46:45', '2019-05-10 03:46:45');
INSERT INTO `admin_operation_log` VALUES (293, 1, 'admin/tukus', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 03:46:47', '2019-05-10 03:46:47');
INSERT INTO `admin_operation_log` VALUES (294, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 03:47:05', '2019-05-10 03:47:05');
INSERT INTO `admin_operation_log` VALUES (295, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 03:51:42', '2019-05-10 03:51:42');
INSERT INTO `admin_operation_log` VALUES (296, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 03:52:43', '2019-05-10 03:52:43');
INSERT INTO `admin_operation_log` VALUES (297, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 03:57:09', '2019-05-10 03:57:09');
INSERT INTO `admin_operation_log` VALUES (298, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 03:58:05', '2019-05-10 03:58:05');
INSERT INTO `admin_operation_log` VALUES (299, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 04:00:21', '2019-05-10 04:00:21');
INSERT INTO `admin_operation_log` VALUES (300, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 04:02:51', '2019-05-10 04:02:51');
INSERT INTO `admin_operation_log` VALUES (301, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 04:02:58', '2019-05-10 04:02:58');
INSERT INTO `admin_operation_log` VALUES (302, 1, 'admin/tukus', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 04:03:03', '2019-05-10 04:03:03');
INSERT INTO `admin_operation_log` VALUES (303, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 04:45:33', '2019-05-10 04:45:33');
INSERT INTO `admin_operation_log` VALUES (304, 1, 'admin/tukus/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 04:45:37', '2019-05-10 04:45:37');
INSERT INTO `admin_operation_log` VALUES (305, 1, 'admin/tukus', 'POST', '::1', '{\"class_id\":\"3\",\"notes\":null,\"editer\":\"1\",\"_token\":\"e1wNaiCKIu8fQlP7GH4PsJCOlcNCQa21zcFbTGWp\",\"_previous_\":\"http:\\/\\/tuku.local\\/admin\\/tukus\"}', '2019-05-10 04:45:47', '2019-05-10 04:45:47');
INSERT INTO `admin_operation_log` VALUES (306, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 04:45:48', '2019-05-10 04:45:48');
INSERT INTO `admin_operation_log` VALUES (307, 1, 'admin/tukus', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 04:46:00', '2019-05-10 04:46:00');
INSERT INTO `admin_operation_log` VALUES (308, 1, 'admin/tukus/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 04:46:02', '2019-05-10 04:46:02');
INSERT INTO `admin_operation_log` VALUES (309, 1, 'admin/tukus', 'POST', '::1', '{\"class_id\":\"3\",\"notes\":null,\"editer\":\"1\",\"_token\":\"e1wNaiCKIu8fQlP7GH4PsJCOlcNCQa21zcFbTGWp\",\"_previous_\":\"http:\\/\\/tuku.local\\/admin\\/tukus\"}', '2019-05-10 04:46:11', '2019-05-10 04:46:11');
INSERT INTO `admin_operation_log` VALUES (310, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 04:46:11', '2019-05-10 04:46:11');
INSERT INTO `admin_operation_log` VALUES (311, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 04:47:58', '2019-05-10 04:47:58');
INSERT INTO `admin_operation_log` VALUES (312, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 04:48:12', '2019-05-10 04:48:12');
INSERT INTO `admin_operation_log` VALUES (313, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 04:48:14', '2019-05-10 04:48:14');
INSERT INTO `admin_operation_log` VALUES (314, 1, 'admin/tukus/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 04:48:16', '2019-05-10 04:48:16');
INSERT INTO `admin_operation_log` VALUES (315, 1, 'admin/tukus', 'POST', '::1', '{\"class_id\":\"3\",\"notes\":null,\"editer\":\"1\",\"_token\":\"e1wNaiCKIu8fQlP7GH4PsJCOlcNCQa21zcFbTGWp\",\"_previous_\":\"http:\\/\\/tuku.local\\/admin\\/tukus\"}', '2019-05-10 04:48:25', '2019-05-10 04:48:25');
INSERT INTO `admin_operation_log` VALUES (316, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 04:48:26', '2019-05-10 04:48:26');
INSERT INTO `admin_operation_log` VALUES (317, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 04:49:42', '2019-05-10 04:49:42');
INSERT INTO `admin_operation_log` VALUES (318, 1, 'admin/tukus/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 04:49:42', '2019-05-10 04:49:42');
INSERT INTO `admin_operation_log` VALUES (319, 1, 'admin/tukus/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 04:50:50', '2019-05-10 04:50:50');
INSERT INTO `admin_operation_log` VALUES (320, 1, 'admin/tukus', 'POST', '::1', '{\"class_id\":\"3\",\"notes\":null,\"editer\":\"1\",\"_token\":\"e1wNaiCKIu8fQlP7GH4PsJCOlcNCQa21zcFbTGWp\",\"_previous_\":\"http:\\/\\/tuku.local\\/admin\\/tukus\"}', '2019-05-10 04:50:59', '2019-05-10 04:50:59');
INSERT INTO `admin_operation_log` VALUES (321, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 04:50:59', '2019-05-10 04:50:59');
INSERT INTO `admin_operation_log` VALUES (322, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 04:51:18', '2019-05-10 04:51:18');
INSERT INTO `admin_operation_log` VALUES (323, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 04:51:55', '2019-05-10 04:51:55');
INSERT INTO `admin_operation_log` VALUES (324, 1, 'admin/tukus/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 04:51:57', '2019-05-10 04:51:57');
INSERT INTO `admin_operation_log` VALUES (325, 1, 'admin/tukus', 'POST', '::1', '{\"class_id\":\"3\",\"notes\":null,\"editer\":\"1\",\"_token\":\"e1wNaiCKIu8fQlP7GH4PsJCOlcNCQa21zcFbTGWp\",\"_previous_\":\"http:\\/\\/tuku.local\\/admin\\/tukus\"}', '2019-05-10 04:52:05', '2019-05-10 04:52:05');
INSERT INTO `admin_operation_log` VALUES (326, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 04:52:05', '2019-05-10 04:52:05');
INSERT INTO `admin_operation_log` VALUES (327, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 04:52:17', '2019-05-10 04:52:17');
INSERT INTO `admin_operation_log` VALUES (328, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 04:53:50', '2019-05-10 04:53:50');
INSERT INTO `admin_operation_log` VALUES (329, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 04:55:25', '2019-05-10 04:55:25');
INSERT INTO `admin_operation_log` VALUES (330, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 04:55:51', '2019-05-10 04:55:51');
INSERT INTO `admin_operation_log` VALUES (331, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 04:55:59', '2019-05-10 04:55:59');
INSERT INTO `admin_operation_log` VALUES (332, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 04:56:09', '2019-05-10 04:56:09');
INSERT INTO `admin_operation_log` VALUES (333, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 05:24:08', '2019-05-10 05:24:08');
INSERT INTO `admin_operation_log` VALUES (334, 1, 'admin/tukus/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 05:24:36', '2019-05-10 05:24:36');
INSERT INTO `admin_operation_log` VALUES (335, 1, 'admin/tukus', 'POST', '::1', '{\"class_id\":\"1\",\"notes\":null,\"editer\":\"1\",\"_token\":\"e1wNaiCKIu8fQlP7GH4PsJCOlcNCQa21zcFbTGWp\",\"_previous_\":\"http:\\/\\/tuku.local\\/admin\\/tukus\"}', '2019-05-10 05:24:47', '2019-05-10 05:24:47');
INSERT INTO `admin_operation_log` VALUES (336, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 05:24:48', '2019-05-10 05:24:48');
INSERT INTO `admin_operation_log` VALUES (337, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 05:25:40', '2019-05-10 05:25:40');
INSERT INTO `admin_operation_log` VALUES (338, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 05:25:47', '2019-05-10 05:25:47');
INSERT INTO `admin_operation_log` VALUES (339, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 05:26:09', '2019-05-10 05:26:09');
INSERT INTO `admin_operation_log` VALUES (340, 1, 'admin/tukus/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 05:26:11', '2019-05-10 05:26:11');
INSERT INTO `admin_operation_log` VALUES (341, 1, 'admin/tukus', 'POST', '::1', '{\"class_id\":\"0\",\"notes\":null,\"editer\":\"1\",\"_token\":\"e1wNaiCKIu8fQlP7GH4PsJCOlcNCQa21zcFbTGWp\",\"_previous_\":\"http:\\/\\/tuku.local\\/admin\\/tukus\"}', '2019-05-10 05:26:16', '2019-05-10 05:26:16');
INSERT INTO `admin_operation_log` VALUES (342, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 05:26:16', '2019-05-10 05:26:16');
INSERT INTO `admin_operation_log` VALUES (343, 1, 'admin/tukus/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 05:26:30', '2019-05-10 05:26:30');
INSERT INTO `admin_operation_log` VALUES (344, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 05:26:30', '2019-05-10 05:26:30');
INSERT INTO `admin_operation_log` VALUES (345, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 05:26:38', '2019-05-10 05:26:38');
INSERT INTO `admin_operation_log` VALUES (346, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 05:33:27', '2019-05-10 05:33:27');
INSERT INTO `admin_operation_log` VALUES (347, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 05:33:41', '2019-05-10 05:33:41');
INSERT INTO `admin_operation_log` VALUES (348, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 05:33:50', '2019-05-10 05:33:50');
INSERT INTO `admin_operation_log` VALUES (349, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 05:33:53', '2019-05-10 05:33:53');
INSERT INTO `admin_operation_log` VALUES (350, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 05:35:54', '2019-05-10 05:35:54');
INSERT INTO `admin_operation_log` VALUES (351, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 05:35:55', '2019-05-10 05:35:55');
INSERT INTO `admin_operation_log` VALUES (352, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 05:59:09', '2019-05-10 05:59:09');
INSERT INTO `admin_operation_log` VALUES (353, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 06:01:42', '2019-05-10 06:01:42');
INSERT INTO `admin_operation_log` VALUES (354, 1, 'admin/tukus/44/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 06:01:45', '2019-05-10 06:01:45');
INSERT INTO `admin_operation_log` VALUES (355, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 06:01:45', '2019-05-10 06:01:45');
INSERT INTO `admin_operation_log` VALUES (356, 1, 'admin/tukus/44/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 06:04:28', '2019-05-10 06:04:28');
INSERT INTO `admin_operation_log` VALUES (357, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 06:04:29', '2019-05-10 06:04:29');
INSERT INTO `admin_operation_log` VALUES (358, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 06:04:30', '2019-05-10 06:04:30');
INSERT INTO `admin_operation_log` VALUES (359, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 06:04:32', '2019-05-10 06:04:32');
INSERT INTO `admin_operation_log` VALUES (360, 1, 'admin/tukus', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 06:04:33', '2019-05-10 06:04:33');
INSERT INTO `admin_operation_log` VALUES (361, 1, 'admin/tukus', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 06:04:35', '2019-05-10 06:04:35');
INSERT INTO `admin_operation_log` VALUES (362, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 06:05:00', '2019-05-10 06:05:00');
INSERT INTO `admin_operation_log` VALUES (363, 1, 'admin/tukus/44/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 06:05:11', '2019-05-10 06:05:11');
INSERT INTO `admin_operation_log` VALUES (364, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 06:05:11', '2019-05-10 06:05:11');
INSERT INTO `admin_operation_log` VALUES (365, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 06:07:05', '2019-05-10 06:07:05');
INSERT INTO `admin_operation_log` VALUES (366, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 06:07:49', '2019-05-10 06:07:49');
INSERT INTO `admin_operation_log` VALUES (367, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 06:07:59', '2019-05-10 06:07:59');
INSERT INTO `admin_operation_log` VALUES (368, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 06:08:32', '2019-05-10 06:08:32');
INSERT INTO `admin_operation_log` VALUES (369, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 06:11:04', '2019-05-10 06:11:04');
INSERT INTO `admin_operation_log` VALUES (370, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 06:11:55', '2019-05-10 06:11:55');
INSERT INTO `admin_operation_log` VALUES (371, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 06:12:13', '2019-05-10 06:12:13');
INSERT INTO `admin_operation_log` VALUES (372, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 06:12:17', '2019-05-10 06:12:17');
INSERT INTO `admin_operation_log` VALUES (373, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 06:12:20', '2019-05-10 06:12:20');
INSERT INTO `admin_operation_log` VALUES (374, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 06:12:50', '2019-05-10 06:12:50');
INSERT INTO `admin_operation_log` VALUES (375, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 06:13:50', '2019-05-10 06:13:50');
INSERT INTO `admin_operation_log` VALUES (376, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 06:15:14', '2019-05-10 06:15:14');
INSERT INTO `admin_operation_log` VALUES (377, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 06:16:14', '2019-05-10 06:16:14');
INSERT INTO `admin_operation_log` VALUES (378, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 06:16:15', '2019-05-10 06:16:15');
INSERT INTO `admin_operation_log` VALUES (379, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 06:16:37', '2019-05-10 06:16:37');
INSERT INTO `admin_operation_log` VALUES (380, 1, 'admin/tukus', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 06:19:16', '2019-05-10 06:19:16');
INSERT INTO `admin_operation_log` VALUES (381, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 06:19:19', '2019-05-10 06:19:19');
INSERT INTO `admin_operation_log` VALUES (382, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 06:19:20', '2019-05-10 06:19:20');
INSERT INTO `admin_operation_log` VALUES (383, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 06:24:41', '2019-05-10 06:24:41');
INSERT INTO `admin_operation_log` VALUES (384, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 06:25:28', '2019-05-10 06:25:28');
INSERT INTO `admin_operation_log` VALUES (385, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 06:25:37', '2019-05-10 06:25:37');
INSERT INTO `admin_operation_log` VALUES (386, 1, 'admin/tukus/del/44', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 06:25:41', '2019-05-10 06:25:41');
INSERT INTO `admin_operation_log` VALUES (387, 1, 'admin/tukus', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 06:27:38', '2019-05-10 06:27:38');
INSERT INTO `admin_operation_log` VALUES (388, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 06:27:40', '2019-05-10 06:27:40');
INSERT INTO `admin_operation_log` VALUES (389, 1, 'admin/tukus/del/44', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 06:27:42', '2019-05-10 06:27:42');
INSERT INTO `admin_operation_log` VALUES (390, 1, 'admin/tukus', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 06:27:44', '2019-05-10 06:27:44');
INSERT INTO `admin_operation_log` VALUES (391, 1, 'admin/tukus/del/44', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 06:28:49', '2019-05-10 06:28:49');
INSERT INTO `admin_operation_log` VALUES (392, 1, 'admin/tukus', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 06:28:54', '2019-05-10 06:28:54');
INSERT INTO `admin_operation_log` VALUES (393, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 06:32:22', '2019-05-10 06:32:22');
INSERT INTO `admin_operation_log` VALUES (394, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 06:34:38', '2019-05-10 06:34:38');
INSERT INTO `admin_operation_log` VALUES (395, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 06:35:07', '2019-05-10 06:35:07');
INSERT INTO `admin_operation_log` VALUES (396, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 06:35:17', '2019-05-10 06:35:17');
INSERT INTO `admin_operation_log` VALUES (397, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 06:35:49', '2019-05-10 06:35:49');
INSERT INTO `admin_operation_log` VALUES (398, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 06:35:55', '2019-05-10 06:35:55');
INSERT INTO `admin_operation_log` VALUES (399, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 06:37:40', '2019-05-10 06:37:40');
INSERT INTO `admin_operation_log` VALUES (400, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 06:39:21', '2019-05-10 06:39:21');
INSERT INTO `admin_operation_log` VALUES (401, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 06:41:57', '2019-05-10 06:41:57');
INSERT INTO `admin_operation_log` VALUES (402, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 06:42:05', '2019-05-10 06:42:05');
INSERT INTO `admin_operation_log` VALUES (403, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 06:43:09', '2019-05-10 06:43:09');
INSERT INTO `admin_operation_log` VALUES (404, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 06:43:15', '2019-05-10 06:43:15');
INSERT INTO `admin_operation_log` VALUES (405, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 06:43:18', '2019-05-10 06:43:18');
INSERT INTO `admin_operation_log` VALUES (406, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 07:12:37', '2019-05-10 07:12:37');
INSERT INTO `admin_operation_log` VALUES (407, 1, 'admin/tukus/del/44', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 07:12:48', '2019-05-10 07:12:48');
INSERT INTO `admin_operation_log` VALUES (408, 1, 'admin/tukus/del/44', 'GET', '::1', '[]', '2019-05-10 07:12:51', '2019-05-10 07:12:51');
INSERT INTO `admin_operation_log` VALUES (409, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 07:12:58', '2019-05-10 07:12:58');
INSERT INTO `admin_operation_log` VALUES (410, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 07:13:01', '2019-05-10 07:13:01');
INSERT INTO `admin_operation_log` VALUES (411, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 07:13:57', '2019-05-10 07:13:57');
INSERT INTO `admin_operation_log` VALUES (412, 1, 'admin/tukus/del/44', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 07:13:59', '2019-05-10 07:13:59');
INSERT INTO `admin_operation_log` VALUES (413, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 07:14:00', '2019-05-10 07:14:00');
INSERT INTO `admin_operation_log` VALUES (414, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 07:14:20', '2019-05-10 07:14:20');
INSERT INTO `admin_operation_log` VALUES (415, 1, 'admin/tukus/del/45', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 07:14:22', '2019-05-10 07:14:22');
INSERT INTO `admin_operation_log` VALUES (416, 1, 'admin/tukus/del/45', 'GET', '::1', '[]', '2019-05-10 07:14:22', '2019-05-10 07:14:22');
INSERT INTO `admin_operation_log` VALUES (417, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 07:15:23', '2019-05-10 07:15:23');
INSERT INTO `admin_operation_log` VALUES (418, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 07:15:25', '2019-05-10 07:15:25');
INSERT INTO `admin_operation_log` VALUES (419, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 07:15:27', '2019-05-10 07:15:27');
INSERT INTO `admin_operation_log` VALUES (420, 1, 'admin/tukus/del/46', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 07:15:29', '2019-05-10 07:15:29');
INSERT INTO `admin_operation_log` VALUES (421, 1, 'admin/tukus/del/46', 'GET', '::1', '[]', '2019-05-10 07:15:29', '2019-05-10 07:15:29');
INSERT INTO `admin_operation_log` VALUES (422, 1, 'admin/tukus/del/46', 'GET', '::1', '[]', '2019-05-10 07:15:31', '2019-05-10 07:15:31');
INSERT INTO `admin_operation_log` VALUES (423, 1, 'admin/tukus/create', 'GET', '::1', '[]', '2019-05-10 07:15:37', '2019-05-10 07:15:37');
INSERT INTO `admin_operation_log` VALUES (424, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 07:15:38', '2019-05-10 07:15:38');
INSERT INTO `admin_operation_log` VALUES (425, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 07:15:38', '2019-05-10 07:15:38');
INSERT INTO `admin_operation_log` VALUES (426, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 07:15:40', '2019-05-10 07:15:40');
INSERT INTO `admin_operation_log` VALUES (427, 1, 'admin/tukus/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 07:16:26', '2019-05-10 07:16:26');
INSERT INTO `admin_operation_log` VALUES (428, 1, 'admin/tukus', 'POST', '::1', '{\"class_id\":\"0\",\"notes\":null,\"editer\":\"1\",\"_token\":\"e1wNaiCKIu8fQlP7GH4PsJCOlcNCQa21zcFbTGWp\",\"_previous_\":\"http:\\/\\/tuku.local\\/admin\\/tukus\"}', '2019-05-10 07:16:32', '2019-05-10 07:16:32');
INSERT INTO `admin_operation_log` VALUES (429, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 07:16:33', '2019-05-10 07:16:33');
INSERT INTO `admin_operation_log` VALUES (430, 1, 'admin/tukus/del/47', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 07:16:35', '2019-05-10 07:16:35');
INSERT INTO `admin_operation_log` VALUES (431, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 07:16:35', '2019-05-10 07:16:35');
INSERT INTO `admin_operation_log` VALUES (432, 1, 'admin/tukus', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 07:16:39', '2019-05-10 07:16:39');
INSERT INTO `admin_operation_log` VALUES (433, 1, 'admin/tukus/del/48', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 07:16:41', '2019-05-10 07:16:41');
INSERT INTO `admin_operation_log` VALUES (434, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 07:16:41', '2019-05-10 07:16:41');
INSERT INTO `admin_operation_log` VALUES (435, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 07:17:02', '2019-05-10 07:17:02');
INSERT INTO `admin_operation_log` VALUES (436, 1, 'admin/tukus/del/49', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 07:17:05', '2019-05-10 07:17:05');
INSERT INTO `admin_operation_log` VALUES (437, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 07:17:05', '2019-05-10 07:17:05');
INSERT INTO `admin_operation_log` VALUES (438, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 07:17:07', '2019-05-10 07:17:07');
INSERT INTO `admin_operation_log` VALUES (439, 1, 'admin/tukus/del/50', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 07:17:09', '2019-05-10 07:17:09');
INSERT INTO `admin_operation_log` VALUES (440, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 07:17:10', '2019-05-10 07:17:10');
INSERT INTO `admin_operation_log` VALUES (441, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 07:17:12', '2019-05-10 07:17:12');
INSERT INTO `admin_operation_log` VALUES (442, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 07:19:40', '2019-05-10 07:19:40');
INSERT INTO `admin_operation_log` VALUES (443, 1, 'admin/tukus/del/51', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 07:19:46', '2019-05-10 07:19:46');
INSERT INTO `admin_operation_log` VALUES (444, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 07:19:46', '2019-05-10 07:19:46');
INSERT INTO `admin_operation_log` VALUES (445, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 07:22:59', '2019-05-10 07:22:59');
INSERT INTO `admin_operation_log` VALUES (446, 1, 'admin/tukus/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 07:23:00', '2019-05-10 07:23:00');
INSERT INTO `admin_operation_log` VALUES (447, 1, 'admin/tukus', 'POST', '::1', '{\"class_id\":\"0\",\"notes\":null,\"editer\":\"1\",\"_token\":\"e1wNaiCKIu8fQlP7GH4PsJCOlcNCQa21zcFbTGWp\",\"_previous_\":\"http:\\/\\/tuku.local\\/admin\\/tukus\"}', '2019-05-10 07:23:08', '2019-05-10 07:23:08');
INSERT INTO `admin_operation_log` VALUES (448, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 07:23:09', '2019-05-10 07:23:09');
INSERT INTO `admin_operation_log` VALUES (449, 1, 'admin/tukus/del/52', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 07:23:12', '2019-05-10 07:23:12');
INSERT INTO `admin_operation_log` VALUES (450, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 07:23:12', '2019-05-10 07:23:12');
INSERT INTO `admin_operation_log` VALUES (451, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 07:24:19', '2019-05-10 07:24:19');
INSERT INTO `admin_operation_log` VALUES (452, 1, 'admin/tukus/del/53', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 07:24:24', '2019-05-10 07:24:24');
INSERT INTO `admin_operation_log` VALUES (453, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 07:24:24', '2019-05-10 07:24:24');
INSERT INTO `admin_operation_log` VALUES (454, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 07:24:26', '2019-05-10 07:24:26');
INSERT INTO `admin_operation_log` VALUES (455, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 07:25:58', '2019-05-10 07:25:58');
INSERT INTO `admin_operation_log` VALUES (456, 1, 'admin/tukus/del/54', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 07:26:00', '2019-05-10 07:26:00');
INSERT INTO `admin_operation_log` VALUES (457, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 07:26:00', '2019-05-10 07:26:00');
INSERT INTO `admin_operation_log` VALUES (458, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 07:26:45', '2019-05-10 07:26:45');
INSERT INTO `admin_operation_log` VALUES (459, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 07:28:35', '2019-05-10 07:28:35');
INSERT INTO `admin_operation_log` VALUES (460, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 07:31:54', '2019-05-10 07:31:54');
INSERT INTO `admin_operation_log` VALUES (461, 1, 'admin/tukus/del/55', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 07:31:57', '2019-05-10 07:31:57');
INSERT INTO `admin_operation_log` VALUES (462, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 07:31:57', '2019-05-10 07:31:57');
INSERT INTO `admin_operation_log` VALUES (463, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 07:32:01', '2019-05-10 07:32:01');
INSERT INTO `admin_operation_log` VALUES (464, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 07:34:04', '2019-05-10 07:34:04');
INSERT INTO `admin_operation_log` VALUES (465, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 07:34:28', '2019-05-10 07:34:28');
INSERT INTO `admin_operation_log` VALUES (466, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 07:34:37', '2019-05-10 07:34:37');
INSERT INTO `admin_operation_log` VALUES (467, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 07:35:13', '2019-05-10 07:35:13');
INSERT INTO `admin_operation_log` VALUES (468, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 07:35:18', '2019-05-10 07:35:18');
INSERT INTO `admin_operation_log` VALUES (469, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 07:36:42', '2019-05-10 07:36:42');
INSERT INTO `admin_operation_log` VALUES (470, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 07:36:46', '2019-05-10 07:36:46');
INSERT INTO `admin_operation_log` VALUES (471, 1, 'admin/tukus/del/56', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 07:36:51', '2019-05-10 07:36:51');
INSERT INTO `admin_operation_log` VALUES (472, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 07:36:51', '2019-05-10 07:36:51');
INSERT INTO `admin_operation_log` VALUES (473, 1, 'admin/tukus/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 07:36:53', '2019-05-10 07:36:53');
INSERT INTO `admin_operation_log` VALUES (474, 1, 'admin/tukus', 'POST', '::1', '{\"class_id\":\"0\",\"notes\":null,\"editer\":\"1\",\"_token\":\"Gw5KHjWto6lEGqiZuyPvMeCsUhufXvjXbJojoy9o\",\"_previous_\":\"http:\\/\\/tuku.local\\/admin\\/tukus\"}', '2019-05-10 07:37:01', '2019-05-10 07:37:01');
INSERT INTO `admin_operation_log` VALUES (475, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 07:37:02', '2019-05-10 07:37:02');
INSERT INTO `admin_operation_log` VALUES (476, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 07:37:12', '2019-05-10 07:37:12');
INSERT INTO `admin_operation_log` VALUES (477, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 07:45:55', '2019-05-10 07:45:55');
INSERT INTO `admin_operation_log` VALUES (478, 1, 'admin/tukus/del/57', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 07:45:59', '2019-05-10 07:45:59');
INSERT INTO `admin_operation_log` VALUES (479, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 07:45:59', '2019-05-10 07:45:59');
INSERT INTO `admin_operation_log` VALUES (480, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 07:46:01', '2019-05-10 07:46:01');
INSERT INTO `admin_operation_log` VALUES (481, 1, 'admin/tukus', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 07:46:12', '2019-05-10 07:46:12');
INSERT INTO `admin_operation_log` VALUES (482, 1, 'admin/tukus/del/58', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 07:46:15', '2019-05-10 07:46:15');
INSERT INTO `admin_operation_log` VALUES (483, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 07:46:15', '2019-05-10 07:46:15');
INSERT INTO `admin_operation_log` VALUES (484, 1, 'admin/tukus/del/64', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 07:46:24', '2019-05-10 07:46:24');
INSERT INTO `admin_operation_log` VALUES (485, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 07:46:24', '2019-05-10 07:46:24');
INSERT INTO `admin_operation_log` VALUES (486, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 07:46:37', '2019-05-10 07:46:37');
INSERT INTO `admin_operation_log` VALUES (487, 1, 'admin/tukus/del/59', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 07:46:42', '2019-05-10 07:46:42');
INSERT INTO `admin_operation_log` VALUES (488, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 07:46:42', '2019-05-10 07:46:42');
INSERT INTO `admin_operation_log` VALUES (489, 1, 'admin/tukus/60,61,62,63', 'DELETE', '::1', '{\"_method\":\"delete\",\"_token\":\"e1wNaiCKIu8fQlP7GH4PsJCOlcNCQa21zcFbTGWp\"}', '2019-05-10 07:46:56', '2019-05-10 07:46:56');
INSERT INTO `admin_operation_log` VALUES (490, 1, 'admin/tukus', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 07:46:57', '2019-05-10 07:46:57');
INSERT INTO `admin_operation_log` VALUES (491, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 07:47:07', '2019-05-10 07:47:07');
INSERT INTO `admin_operation_log` VALUES (492, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 08:25:19', '2019-05-10 08:25:19');
INSERT INTO `admin_operation_log` VALUES (493, 1, 'admin/tukus/del/60', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 08:25:23', '2019-05-10 08:25:23');
INSERT INTO `admin_operation_log` VALUES (494, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 08:25:23', '2019-05-10 08:25:23');
INSERT INTO `admin_operation_log` VALUES (495, 1, 'admin/tukus/del/61', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 08:25:26', '2019-05-10 08:25:26');
INSERT INTO `admin_operation_log` VALUES (496, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 08:25:26', '2019-05-10 08:25:26');
INSERT INTO `admin_operation_log` VALUES (497, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 08:33:14', '2019-05-10 08:33:14');
INSERT INTO `admin_operation_log` VALUES (498, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 08:33:35', '2019-05-10 08:33:35');
INSERT INTO `admin_operation_log` VALUES (499, 1, 'admin', 'GET', '::1', '[]', '2019-05-10 08:33:36', '2019-05-10 08:33:36');
INSERT INTO `admin_operation_log` VALUES (500, 1, 'admin', 'GET', '::1', '[]', '2019-05-10 08:33:36', '2019-05-10 08:33:36');
INSERT INTO `admin_operation_log` VALUES (501, 1, 'admin/tukus', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 08:33:38', '2019-05-10 08:33:38');
INSERT INTO `admin_operation_log` VALUES (502, 1, 'admin/tukus/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 08:33:41', '2019-05-10 08:33:41');
INSERT INTO `admin_operation_log` VALUES (503, 1, 'admin/tukus', 'POST', '::1', '{\"class_id\":\"1\",\"notes\":null,\"editer\":\"1\",\"_token\":\"e1wNaiCKIu8fQlP7GH4PsJCOlcNCQa21zcFbTGWp\",\"_previous_\":\"http:\\/\\/tuku.local\\/admin\\/tukus\"}', '2019-05-10 08:33:56', '2019-05-10 08:33:56');
INSERT INTO `admin_operation_log` VALUES (504, 1, 'admin/tukus/create', 'GET', '::1', '[]', '2019-05-10 08:33:58', '2019-05-10 08:33:58');
INSERT INTO `admin_operation_log` VALUES (505, 1, 'admin/tukus/create', 'GET', '::1', '[]', '2019-05-10 08:35:31', '2019-05-10 08:35:31');
INSERT INTO `admin_operation_log` VALUES (506, 1, 'admin/tukus', 'POST', '::1', '{\"class_id\":\"1\",\"notes\":null,\"editer\":\"1\",\"_token\":\"e1wNaiCKIu8fQlP7GH4PsJCOlcNCQa21zcFbTGWp\"}', '2019-05-10 08:35:43', '2019-05-10 08:35:43');
INSERT INTO `admin_operation_log` VALUES (507, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 08:35:44', '2019-05-10 08:35:44');
INSERT INTO `admin_operation_log` VALUES (508, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 08:36:09', '2019-05-10 08:36:09');
INSERT INTO `admin_operation_log` VALUES (509, 1, 'admin', 'GET', '::1', '[]', '2019-05-10 08:36:39', '2019-05-10 08:36:39');
INSERT INTO `admin_operation_log` VALUES (510, 1, 'admin/tukus', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 08:36:42', '2019-05-10 08:36:42');
INSERT INTO `admin_operation_log` VALUES (511, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 08:37:08', '2019-05-10 08:37:08');
INSERT INTO `admin_operation_log` VALUES (512, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 08:37:21', '2019-05-10 08:37:21');
INSERT INTO `admin_operation_log` VALUES (513, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 08:37:32', '2019-05-10 08:37:32');
INSERT INTO `admin_operation_log` VALUES (514, 1, 'admin/tukus/del/62', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 08:48:55', '2019-05-10 08:48:55');
INSERT INTO `admin_operation_log` VALUES (515, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 08:48:55', '2019-05-10 08:48:55');
INSERT INTO `admin_operation_log` VALUES (516, 1, 'admin/tukus/del/63', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2019-05-10 08:48:57', '2019-05-10 08:48:57');
INSERT INTO `admin_operation_log` VALUES (517, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 08:48:58', '2019-05-10 08:48:58');
INSERT INTO `admin_operation_log` VALUES (518, 1, 'admin/tukus', 'GET', '::1', '[]', '2019-05-10 09:24:12', '2019-05-10 09:24:12');
COMMIT;

-- ----------------------------
-- Table structure for admin_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_permissions`;
CREATE TABLE `admin_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_permissions_name_unique` (`name`),
  UNIQUE KEY `admin_permissions_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_permissions
-- ----------------------------
BEGIN;
INSERT INTO `admin_permissions` VALUES (1, 'All permission', '*', '', '*', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (2, 'Dashboard', 'dashboard', 'GET', '/', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (3, 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (4, 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (5, 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (6, '用户管理', 'users', '', '/users*', '2019-05-09 03:30:08', '2019-05-09 03:30:08');
COMMIT;

-- ----------------------------
-- Table structure for admin_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_menu`;
CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `admin_role_menu` VALUES (1, 2, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for admin_role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_permissions`;
CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_role_permissions
-- ----------------------------
BEGIN;
INSERT INTO `admin_role_permissions` VALUES (1, 1, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (2, 2, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (2, 3, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (2, 4, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (2, 6, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for admin_role_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_users`;
CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_role_users
-- ----------------------------
BEGIN;
INSERT INTO `admin_role_users` VALUES (1, 1, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE `admin_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_roles_name_unique` (`name`),
  UNIQUE KEY `admin_roles_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_roles
-- ----------------------------
BEGIN;
INSERT INTO `admin_roles` VALUES (1, 'Administrator', 'administrator', '2019-05-09 03:00:17', '2019-05-09 03:00:17');
INSERT INTO `admin_roles` VALUES (2, '运营', 'operation', '2019-05-09 03:31:48', '2019-05-09 03:31:48');
COMMIT;

-- ----------------------------
-- Table structure for admin_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_permissions`;
CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for admin_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_users
-- ----------------------------
BEGIN;
INSERT INTO `admin_users` VALUES (1, 'admin', '$2y$10$Eir9RYJodJ5W49JMutjYVuGm0fX7aEycPLPAIZuME3QmWLqsyC1.i', 'Administrator', NULL, 'AjtTXFrmvmTDa3MZMbw3cFi9TOKQ4Sqy7RumdFTiRBsqRgJ9z17YZU918AAw', '2019-05-09 03:00:17', '2019-05-09 03:00:17');
COMMIT;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of categories
-- ----------------------------
BEGIN;
INSERT INTO `categories` VALUES (1, '热门小吃', NULL, 1, 0, '2019-05-09 06:10:09', '2019-05-09 06:10:09');
INSERT INTO `categories` VALUES (2, '新鲜饮品', NULL, 3, 0, '2019-05-09 06:10:24', '2019-05-09 06:10:39');
INSERT INTO `categories` VALUES (3, '炸鸡', NULL, 2, 1, '2019-05-09 06:10:33', '2019-05-09 06:10:39');
COMMIT;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
BEGIN;
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2016_01_04_173148_create_admin_tables', 2);
INSERT INTO `migrations` VALUES (4, '2019_05_09_034218_create_pictures_table', 3);
INSERT INTO `migrations` VALUES (5, '2019_05_09_034229_create_tukus_table', 3);
INSERT INTO `migrations` VALUES (6, '2019_05_09_035432_create_categories_table', 3);
COMMIT;

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for pictures
-- ----------------------------
DROP TABLE IF EXISTS `pictures`;
CREATE TABLE `pictures` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '图片名',
  `size` double(8,2) NOT NULL COMMENT '图片大小',
  `width` smallint(6) NOT NULL COMMENT '宽',
  `height` smallint(6) NOT NULL COMMENT '高',
  `tuku_id` smallint(6) NOT NULL COMMENT '图库集合id',
  `user_id` smallint(6) NOT NULL COMMENT '编辑人id',
  `class_id` smallint(6) NOT NULL COMMENT '类别id',
  `notes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '注释',
  `recommend` smallint(6) DEFAULT NULL COMMENT '下载次数',
  `retime` int(11) DEFAULT NULL COMMENT '最后一次下载时间',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of pictures
-- ----------------------------
BEGIN;
INSERT INTO `pictures` VALUES (65, 'images/f719641b83dbb94d1522600815bf6192.jpg', 126.25, 600, 400, 16, 1, 1, NULL, 3, 1557477477, '2019-05-10 08:35:43', '2019-05-10 08:37:57');
INSERT INTO `pictures` VALUES (66, 'images/6edd7d362cbbcb77fda200fcc6d8f431.jpg', 124.38, 600, 400, 16, 1, 1, NULL, 3, 1557477477, '2019-05-10 08:35:43', '2019-05-10 08:37:57');
INSERT INTO `pictures` VALUES (67, 'images/0ccaec699d17497c9464727c5372209d.jpg', 136.36, 600, 400, 16, 1, 1, NULL, 3, 1557477477, '2019-05-10 08:35:43', '2019-05-10 08:37:57');
INSERT INTO `pictures` VALUES (68, 'images/4f6d88bf912ae0d95aa33d1e0875b354.jpg', 125.54, 600, 400, 16, 1, 1, NULL, 3, 1557477477, '2019-05-10 08:35:43', '2019-05-10 08:37:57');
INSERT INTO `pictures` VALUES (69, 'images/7d7aaf8c173ebc0be367e98ab4edd7c1.jpg', 161.96, 600, 400, 16, 1, 1, NULL, 3, 1557477477, '2019-05-10 08:35:43', '2019-05-10 08:37:57');
INSERT INTO `pictures` VALUES (70, 'images/8b9deaff38443b625f2c749215ab13c2.jpg', 128.73, 600, 400, 16, 1, 1, NULL, 3, 1557477477, '2019-05-10 08:35:43', '2019-05-10 08:37:57');
INSERT INTO `pictures` VALUES (71, 'images/a78ab0f8fb330c9810e442928f446d61.jpg', 168.58, 600, 400, 16, 1, 1, NULL, 3, 1557477477, '2019-05-10 08:35:43', '2019-05-10 08:37:57');
INSERT INTO `pictures` VALUES (72, 'images/1cfbe478bbb523173dcef6b794443bc7.jpg', 159.95, 600, 400, 16, 1, 1, NULL, 3, 1557477477, '2019-05-10 08:35:43', '2019-05-10 08:37:57');
INSERT INTO `pictures` VALUES (73, 'images/227204df512e293be1dcbe07a0f89dc7.jpg', 139.16, 600, 400, 16, 1, 1, NULL, 2, 1557477477, '2019-05-10 08:35:43', '2019-05-10 08:37:57');
INSERT INTO `pictures` VALUES (74, 'images/465e93379f5a8be90431a07acd557891.jpg', 184.58, 600, 400, 16, 1, 1, NULL, 2, 1557477477, '2019-05-10 08:35:43', '2019-05-10 08:37:57');
INSERT INTO `pictures` VALUES (75, 'images/ce7a82ba70ac796a618efd85c7a58421.jpg', 156.32, 600, 400, 16, 1, 1, NULL, 2, 1557477477, '2019-05-10 08:35:43', '2019-05-10 08:37:57');
INSERT INTO `pictures` VALUES (76, 'images/352a1c2804f265718905f93326ff6b64.jpg', 139.41, 600, 400, 16, 1, 1, NULL, 2, 1557477477, '2019-05-10 08:35:43', '2019-05-10 08:37:57');
INSERT INTO `pictures` VALUES (77, 'images/41c63eae53c941a03ebb50800344851d.jpg', 170.67, 600, 400, 16, 1, 1, NULL, 2, 1557477477, '2019-05-10 08:35:43', '2019-05-10 08:37:57');
INSERT INTO `pictures` VALUES (78, 'images/564c5d2478642f61d854a2bb50d556ee.jpg', 169.37, 600, 400, 16, 1, 1, NULL, 2, 1557477477, '2019-05-10 08:35:43', '2019-05-10 08:37:57');
INSERT INTO `pictures` VALUES (79, 'images/c9c7d94067124f87b465987ca7122fef.jpg', 178.02, 600, 400, 16, 1, 1, NULL, 2, 1557477477, '2019-05-10 08:35:43', '2019-05-10 08:37:57');
INSERT INTO `pictures` VALUES (80, 'images/28a4a0bc5373a7135bb6849389e37ee3.jpg', 141.39, 600, 400, 16, 1, 1, NULL, 2, 1557477477, '2019-05-10 08:35:43', '2019-05-10 08:37:57');
INSERT INTO `pictures` VALUES (81, 'images/d9ce8b03c0e9feeb40666bab058eb67c.jpg', 208.02, 600, 400, 16, 1, 1, NULL, 2, 1557477477, '2019-05-10 08:35:43', '2019-05-10 08:37:57');
INSERT INTO `pictures` VALUES (82, 'images/5c75dbbc54688152fa82cc83c926e6fc.jpg', 149.02, 600, 400, 16, 1, 1, NULL, 2, 1557477477, '2019-05-10 08:35:43', '2019-05-10 08:37:57');
INSERT INTO `pictures` VALUES (83, 'images/a62228abef7db7d21cd41fb3e431e33f.jpg', 191.33, 600, 400, 16, 1, 1, NULL, 2, 1557477477, '2019-05-10 08:35:43', '2019-05-10 08:37:57');
INSERT INTO `pictures` VALUES (84, 'images/259620423724bbd2d0f593e8df815c6c.jpg', 150.57, 600, 400, 16, 1, 1, NULL, 2, 1557477477, '2019-05-10 08:35:43', '2019-05-10 08:37:57');
COMMIT;

-- ----------------------------
-- Table structure for tukus
-- ----------------------------
DROP TABLE IF EXISTS `tukus`;
CREATE TABLE `tukus` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `photos` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '上传图片集合',
  `notes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '注释',
  `class_id` smallint(6) NOT NULL COMMENT '图片类别ID',
  `editer` smallint(6) NOT NULL COMMENT '编辑人ID',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tukus
-- ----------------------------
BEGIN;
INSERT INTO `tukus` VALUES (5, 'images/f0d7215273114de1c320fa6bd488b210.jpg,images/c5ef64d5708c4edd88d1bf818ffd7d86.jpg,images/c7e140faee2c98ea68ee8521d8323749.jpg,images/fc88b8a63e75e3765ba5726b6590d1a3.jpg', 'de mo', 1, 1, '2019-05-10 02:34:00', '2019-05-10 02:34:00');
INSERT INTO `tukus` VALUES (6, 'images/潘大师炸鸡.jpg,images/上帝炸鸡.jpg,images/上豪鸡排.jpg,images/上品鸡排.jpg,images/台湾3q炸鸡.jpg', NULL, 3, 1, '2019-05-10 04:45:47', '2019-05-10 04:45:47');
INSERT INTO `tukus` VALUES (7, 'images/23b5a0698ff30b24b0e2eb3036f9a78b.jpg,images/d18a388f222cdb295e28ab94bcfff98d.jpg,images/a3944f3674928f71951eb7f3eeae3d2f.jpg,images/5463265fbb1e3b8114ae1738032d36d6.jpg,images/af847fda8434b2a2e33ff922b2195fec.jpg', NULL, 3, 1, '2019-05-10 04:46:11', '2019-05-10 04:46:11');
INSERT INTO `tukus` VALUES (8, 'images/60b97d759ac826c412d3825786a7b728.jpg,images/1bfea929fd9d4d2bb0cbed9d5a899ec8.jpg,images/b9c6b1f82ec3bde1a915992e3473bcbb.jpg,images/b3b6557f4c004108328dca09c72a42c8.jpg,images/84649369d1048ee36cbbce913dea70e8.jpg', NULL, 3, 1, '2019-05-10 04:48:25', '2019-05-10 04:48:25');
INSERT INTO `tukus` VALUES (9, 'images/d5e8136927ec65d887a6f5ac69507a93.jpg,images/e29df68cb6360c92004fc94570f1a082.jpg,images/c68d97cb13c24f36630a18493107d114.jpg,images/31522e5f3925ce6c62bb5b32a9e0a91c.jpg,images/0ffcbd699f06454983eb5142e50b9d94.jpg', NULL, 3, 1, '2019-05-10 04:50:59', '2019-05-10 04:50:59');
INSERT INTO `tukus` VALUES (10, 'images/7b4d85d89d4c083b46ec99e34a2c5040.jpg,images/838740be851dd57ff7d6979619a75c5e.jpg,images/e9422fdd7ab9a8004a8620130ebcfd9d.jpg,images/8a4d8ffb375fe937725ba973af4436d4.jpg,images/efee76b48de0765dfee24af4245b90f6.jpg', NULL, 3, 1, '2019-05-10 04:52:05', '2019-05-10 04:52:05');
INSERT INTO `tukus` VALUES (11, 'images/2c7b0012c871e345bdfb3141b685771b.jpg,images/1e3048bd00188340d0ba2d4b1df34aa7.jpg,images/af389a2455332ed91d6092d19489ecc7.jpg', NULL, 1, 1, '2019-05-10 05:24:47', '2019-05-10 05:24:47');
INSERT INTO `tukus` VALUES (12, 'images/86dab312fb6c8c14056a816ea5d0290e.jpg,images/3ea0487d6e983576c30e63a465f565a4.jpg,images/8ecf57b02f20d8b65770fabf511401fd.jpg', NULL, 0, 1, '2019-05-10 05:26:16', '2019-05-10 05:26:16');
INSERT INTO `tukus` VALUES (13, 'images/ffd36b5ae0200835289d3da8a5d7deac.jpg,images/f06a6fbca466ba0162374f9777c74a55.jpg,images/2ca3d7a56cc83dd550218414af64a143.jpg,images/620ef1852a9d5e4748b49d10c4a2c566.jpg,images/0dcae7bc2bfea25756d1ffde46ee4170.jpg', NULL, 0, 1, '2019-05-10 07:16:32', '2019-05-10 07:16:32');
INSERT INTO `tukus` VALUES (14, 'images/3ac8719fe59a2140e230026063c53029.jpg,images/5eb3f7ecb8e9d8f848388a0c26e54722.jpg,images/90a5d4f26cf39bcbf58c1291014347f5.jpg,images/3494f3df170dea4f178b3b3ed7cc58ca.jpg,images/65b37df965f5a762395e579a9882e3e0.jpg', NULL, 0, 1, '2019-05-10 07:23:08', '2019-05-10 07:23:08');
INSERT INTO `tukus` VALUES (15, 'images/logo_20190505mxzy.jpg,images/logo_20190505smc.jpg,images/logo_20190505tbnc.jpg,images/525e274ab85f78da2e25f04ca23b141c.jpg,images/logo_20190509csnmlt.jpg,images/logo_20190509dcygtc.jpg,images/logo_20190509dzstpd.jpg,images/logo_20190509emxst.jpg', NULL, 0, 1, '2019-05-10 07:37:01', '2019-05-10 07:37:01');
INSERT INTO `tukus` VALUES (16, 'images/f719641b83dbb94d1522600815bf6192.jpg,images/6edd7d362cbbcb77fda200fcc6d8f431.jpg,images/0ccaec699d17497c9464727c5372209d.jpg,images/4f6d88bf912ae0d95aa33d1e0875b354.jpg,images/7d7aaf8c173ebc0be367e98ab4edd7c1.jpg,images/8b9deaff38443b625f2c749215ab13c2.jpg,images/a78ab0f8fb330c9810e442928f446d61.jpg,images/1cfbe478bbb523173dcef6b794443bc7.jpg,images/227204df512e293be1dcbe07a0f89dc7.jpg,images/465e93379f5a8be90431a07acd557891.jpg,images/ce7a82ba70ac796a618efd85c7a58421.jpg,images/352a1c2804f265718905f93326ff6b64.jpg,images/41c63eae53c941a03ebb50800344851d.jpg,images/564c5d2478642f61d854a2bb50d556ee.jpg,images/c9c7d94067124f87b465987ca7122fef.jpg,images/28a4a0bc5373a7135bb6849389e37ee3.jpg,images/d9ce8b03c0e9feeb40666bab058eb67c.jpg,images/5c75dbbc54688152fa82cc83c926e6fc.jpg,images/a62228abef7db7d21cd41fb3e431e33f.jpg,images/259620423724bbd2d0f593e8df815c6c.jpg', NULL, 1, 1, '2019-05-10 08:35:43', '2019-05-10 08:35:43');
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES (1, 'xiangyu', 'cxy646460179@gmail.com', '2019-05-09 02:56:49', '$2y$10$bU5erDQAR3RVbwh.XSO/D.7uxAGI.PdPp1AB.4VBQe4l6tsWWNoTG', NULL, '2019-05-09 02:56:01', '2019-05-09 02:56:49');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
