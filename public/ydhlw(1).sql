/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80037
 Source Host           : localhost:3306
 Source Schema         : ydhlw

 Target Server Type    : MySQL
 Target Server Version : 80037
 File Encoding         : 65001

 Date: 20/12/2024 11:12:57
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments`  (
  `comment_id` int NOT NULL AUTO_INCREMENT COMMENT '评论主键',
  `event_id` int NOT NULL COMMENT '评论活动id',
  `user_id` int NOT NULL COMMENT '评论用户id',
  `comment_text` varchar(900) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论内容',
  `comment_date` datetime NOT NULL COMMENT '评论发表时间',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES (1, 1, 1, '本次技术分享会将邀请行业专家分享最新的技术趋势。', '2024-12-19 14:20:38');
INSERT INTO `comments` VALUES (2, 1, 2, '666', '2024-12-19 14:54:01');
INSERT INTO `comments` VALUES (3, 1, 3, '123456', '2024-12-19 15:50:44');

-- ----------------------------
-- Table structure for events
-- ----------------------------
DROP TABLE IF EXISTS `events`;
CREATE TABLE `events`  (
  `event_id` int NOT NULL AUTO_INCREMENT COMMENT '活动id',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动标题',
  `description` varchar(900) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动描述',
  `pic_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动照片',
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动地点',
  `event_date` datetime NOT NULL COMMENT '活动日期',
  `capacity` int NOT NULL COMMENT '活动最多人数',
  `registration_deadline` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报名截止日期',
  `created_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建活动的管理员id',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`event_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '活动表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of events
-- ----------------------------
INSERT INTO `events` VALUES (1, '技术分享会', '本次技术分享会将邀请行业专家分享最新的技术趋势。', 'http://example.com/images/event.jpg', '公司会议室', '2024-12-30 14:00:00', 50, '2024-12-25 23:59:00', 'admin123', '2024-12-18 19:02:32');
INSERT INTO `events` VALUES (2, '技术分享会2', '本次技术分享会将邀请行业专家分享最新的技术趋势。', 'http://example.com/images/event.jpg', '公司会议室', '2024-12-30 14:00:00', 50, '2024-12-25 23:59:00', 'admin123', '2024-12-18 21:32:38');
INSERT INTO `events` VALUES (3, '技术分享会3', '本次技术分享会将邀请行业专家分享最新的技术趋势。', 'http://example.com/images/event.jpg', '公司会议室', '2024-12-30 14:00:00', 50, '2024-12-25 23:59:00', 'admin123', '2024-12-18 21:32:43');

-- ----------------------------
-- Table structure for registration
-- ----------------------------
DROP TABLE IF EXISTS `registration`;
CREATE TABLE `registration`  (
  `registration_id` int NOT NULL AUTO_INCREMENT COMMENT '报名id',
  `user_id` int NOT NULL COMMENT '报名用户id',
  `event_id` int NOT NULL COMMENT '报名活动id',
  `registration_text` varchar(900) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报名原因',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报名状态',
  `registered_at` datetime NOT NULL COMMENT '报名时间',
  PRIMARY KEY (`registration_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '报名表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of registration
-- ----------------------------
INSERT INTO `registration` VALUES (1, 1, 1, '希望通过此活动增加知识和技术', 'approved', '2024-12-18 19:29:09');
INSERT INTO `registration` VALUES (2, 2, 1, '希望通过此活动增加知识和技术', 'pending', '2024-12-18 21:33:04');
INSERT INTO `registration` VALUES (3, 3, 1, '希望通过此活动增加知识和技术', 'pending', '2024-12-18 21:33:09');
INSERT INTO `registration` VALUES (4, 4, 2, '希望通过此活动增加知识和技术', 'pending', '2024-12-18 21:33:16');
INSERT INTO `registration` VALUES (5, 5, 2, '希望通过此活动增加知识和技术', 'pending', '2024-12-18 21:33:22');
INSERT INTO `registration` VALUES (6, 6, 2, '希望通过此活动增加知识和技术', 'pending', '2024-12-18 21:33:28');
INSERT INTO `registration` VALUES (7, 6, 3, '希望通过此活动增加知识和技术', 'pending', '2024-12-18 21:33:32');
INSERT INTO `registration` VALUES (8, 5, 3, '希望通过此活动增加知识和技术', 'pending', '2024-12-18 21:33:37');
INSERT INTO `registration` VALUES (9, 4, 3, '希望通过此活动增加知识和技术', 'pending', '2024-12-18 21:33:41');
INSERT INTO `registration` VALUES (10, 3, 3, '希望通过此活动增加知识和技术', 'pending', '2024-12-18 21:33:45');
INSERT INTO `registration` VALUES (11, 2, 3, '希望通过此活动增加知识和技术', 'pending', '2024-12-18 21:33:49');
INSERT INTO `registration` VALUES (12, 1, 3, '希望通过此活动增加知识和技术', 'pending', '2024-12-18 21:33:53');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `user_id` int NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `role` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'admin或user',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'testuser', '$2a$10$ZgwZ7vYFAaN1.fLzu/YuyuLgMNL5u/.FoBLeILs0wr4K/.us1UhWm', 'testuser@example.com', NULL, 'admin', '2024-12-18 19:02:22');
INSERT INTO `users` VALUES (2, 'testuser2', '$2a$10$BusSqTHJiNeC7PguZ6oehekDNQs22llMn4tI7bEDMk5obwF53hmEy', 'testuser2@example.com', NULL, 'admin', '2024-12-18 21:31:37');
INSERT INTO `users` VALUES (3, 'user1', '$2a$10$OfhGy4/bfDrsGL0boAfwWeGRupAz4L2F1I.649P2ec3LrqU7btcQe', 'user1@example.com', NULL, 'user', '2024-12-18 21:32:09');
INSERT INTO `users` VALUES (4, 'user2', '$2a$10$icp7MH5SCX3/rqiD5NTpCOqyGBBjzG8zIOU/ceUIfnI492tiAgISS', 'user2@example.com', NULL, 'user', '2024-12-18 21:32:17');
INSERT INTO `users` VALUES (5, 'user3', '$2a$10$EteI.M9j7D1DVQR0EzpnBuH5NdgoQgw.wKBjlga1OGRF9AfwSCR5i', 'user3@example.com', NULL, 'user', '2024-12-18 21:32:25');
INSERT INTO `users` VALUES (6, 'testuser7', '$2a$10$ty2mHZd5fWN.mljb2eL.K.KlfYSa3WjpzSOQJu5lvxfm3pI9w7bGm', 'testuser7@example.com', NULL, 'admin', '2024-12-19 15:48:21');

SET FOREIGN_KEY_CHECKS = 1;
