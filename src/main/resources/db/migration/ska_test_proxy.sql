/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.22.556
 Source Server Type    : MySQL
 Source Server Version : 50720
 Source Host           : 192.168.22.556:3306
 Source Schema         : ska_test_proxy

 Target Server Type    : MySQL
 Target Server Version : 50720
 File Encoding         : 65001

 Date: 01/09/2023 10:26:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for flyway_schema_history
-- ----------------------------
DROP TABLE IF EXISTS `flyway_schema_history`;
CREATE TABLE `flyway_schema_history`  (
  `installed_rank` int(11) NOT NULL,
  `version` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `script` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `checksum` int(11) NULL DEFAULT NULL,
  `installed_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `installed_on` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `execution_time` int(11) NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`installed_rank`) USING BTREE,
  INDEX `flyway_schema_history_s_idx`(`success`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flyway_schema_history
-- ----------------------------
INSERT INTO `flyway_schema_history` VALUES (1, '0.7.5', 'init', 'SQL', 'V0.7.5__init.sql', -1862165774, 'root', '2023-08-30 14:22:36', 329, 1);
INSERT INTO `flyway_schema_history` VALUES (2, '0.7.7', 'delete admin project', 'SQL', 'V0.7.7__delete_admin_project.sql', 1065588794, 'root', '2023-08-30 14:22:36', 7, 1);

-- ----------------------------
-- Table structure for jacoco
-- ----------------------------
DROP TABLE IF EXISTS `jacoco`;
CREATE TABLE `jacoco`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `gitlab_id` int(11) NOT NULL,
  `gitclone_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `jacoco_project_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `childrens` json NULL,
  `compare_type` int(11) NOT NULL COMMENT '1=分支比较 2=提交比较 3=全量比较',
  `current_branch` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '当前分支',
  `compare_branch` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '对比分支',
  `current_commit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '当前commit号',
  `compare_commit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '对比commit号',
  `start_time` datetime(0) NULL DEFAULT NULL,
  `end_time` datetime(0) NULL DEFAULT NULL,
  `report_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报告路径',
  `task_status` int(11) NULL DEFAULT NULL COMMENT '0=未执行 1=执行中 2=已完成',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 136 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jacoco
-- ----------------------------
INSERT INTO `jacoco` VALUES (133, 65, 3, 'zoe-health/zoe-base-mservice.git', 'zoe-base-mservice', '[]', 3, 'master', '', '', '', '2023-08-30 00:00:00', '2023-09-02 00:00:00', 'http://168.12.53.156:8083/frontend/jacoco/zoe-base-mservice/1693502111962/index.html', 2, NULL);
INSERT INTO `jacoco` VALUES (134, 65, 3, 'zoe-health/zoe-base-mservice.git', 'zoe-base-mservice', '[]', 1, 'master', 'dev_healthmanage_20230511', '', '', '2023-09-01 00:00:00', '2023-09-02 00:00:00', 'http://168.12.53.156:8083/frontend/jacoco/zoe-base-mservice/1693531183158/index.html', 2, NULL);
INSERT INTO `jacoco` VALUES (135, 65, 3, 'zoe-health/zoe-base-mservice.git', 'zoe-base-mservice', '[]', 2, 'master', '', 'ec177ea0269660bc87ed0e39bc89064e452f800e', '88eab86cf54409d70fc6b582a46af5fbf174969b', '2023-09-01 00:00:00', '2023-09-02 00:00:00', 'http://168.12.53.156:8083/frontend/jacoco/zoe-base-mservice/1693531992224/index.html', 2, NULL);

-- ----------------------------
-- Table structure for jacoco_config
-- ----------------------------
DROP TABLE IF EXISTS `jacoco_config`;
CREATE TABLE `jacoco_config`  (
  `project_id` int(11) NOT NULL,
  `git_id` int(11) NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `children` json NULL,
  PRIMARY KEY (`project_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jacoco_config
-- ----------------------------
INSERT INTO `jacoco_config` VALUES (65, 3, ' Zoe Base Mservice', '[]');
INSERT INTO `jacoco_config` VALUES (66, 6, 'Zoe Admin Ctr', '[]');

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '项目名',
  `default_forward_host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路径标记',
  `platform` tinyint(4) NULL DEFAULT NULL COMMENT '1.andorid 2.iOS 3.pc web',
  `capabilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '项目描述',
  `creator_uid` int(11) NOT NULL COMMENT '创建人id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_name_platform`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '项目表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES (65, 'Zoe Base Mservice', 'http://168.12.53.156:8001/', NULL, NULL, '', 1, '2023-08-30 16:42:37');
INSERT INTO `project` VALUES (66, 'Zoe Admin Ctr', 'http://168.12.53.156:8001/zoe-health/zoe-admin-ctr', NULL, NULL, '', 1, '2023-08-31 15:38:16');

-- ----------------------------
-- Table structure for proxy_config
-- ----------------------------
DROP TABLE IF EXISTS `proxy_config`;
CREATE TABLE `proxy_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `intercept_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '拦截路径',
  `forward_host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '转发host',
  `mock_requir` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `mock_response` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `is_callback` tinyint(1) NULL DEFAULT NULL,
  `callback_host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `callback_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `callback_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sign_type` int(255) NULL DEFAULT NULL,
  `client_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `client_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `callback_body_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `callback_headers` json NULL,
  `callback_request_json` json NULL,
  `callback_request_query` json NULL,
  `callback_request_form` json NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `creator_uid` int(11) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `intercept_path`(`intercept_path`) USING BTREE,
  INDEX `projectid`(`project_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of proxy_config
-- ----------------------------

-- ----------------------------
-- Table structure for proxy_details
-- ----------------------------
DROP TABLE IF EXISTS `proxy_details`;
CREATE TABLE `proxy_details`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NULL DEFAULT NULL,
  `intercept_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `forward_host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `mock_requir` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `request_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `response_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `callback_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `callback_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `callback_request_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `callback_response_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `creat_time` datetime(0) NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1743 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of proxy_details
-- ----------------------------

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名',
  `alias` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '别名',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'admin', 'admin');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户密码',
  `nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '状态，0:禁用 1:正常',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '$2a$10$qNn28wKayNX/2Az2KleIbem3Birx3p6g6vDEUrg7luk8cnr7H6EEi', 'admin', 1, '2023-08-29 15:27:32');

-- ----------------------------
-- Table structure for user_project
-- ----------------------------
DROP TABLE IF EXISTS `user_project`;
CREATE TABLE `user_project`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_userId_projectId`(`user_id`, `project_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 508 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户项目表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_project
-- ----------------------------

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_userId_roleId`(`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1645 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1644, 1, 1);

SET FOREIGN_KEY_CHECKS = 1;
