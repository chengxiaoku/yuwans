/*
Navicat MySQL Data Transfer

Source Server         : 本地连接
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : yuwan

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2016-10-28 13:43:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for yw_admin
-- ----------------------------
DROP TABLE IF EXISTS `yw_admin`;
CREATE TABLE `yw_admin` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) DEFAULT NULL COMMENT '用户名',
  `pwd` varchar(60) DEFAULT NULL COMMENT '密码',
  `role_id` int(10) DEFAULT NULL COMMENT '角色ID',
  `last_ip` varchar(15) DEFAULT NULL COMMENT '最后登录的IP',
  `last_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `realname` varchar(60) DEFAULT NULL COMMENT '真实姓名',
  `lock` tinyint(1) DEFAULT '0' COMMENT '1：表示无法修改，如超级管理员',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yw_admin
-- ----------------------------
INSERT INTO `yw_admin` VALUES ('1', 'admin', '670b14728ad9902aecba32e22fa4f6bd', null, null, '2016-10-28 13:18:37', '你好啊121', '0');
INSERT INTO `yw_admin` VALUES ('3', 'root', '670b14728ad9902aecba32e22fa4f6bd', null, null, null, '小ROOY', '0');

-- ----------------------------
-- Table structure for yw_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `yw_admin_role`;
CREATE TABLE `yw_admin_role` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) DEFAULT NULL COMMENT '角色名',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `enabled` tinyint(1) DEFAULT '1' COMMENT '是否启用：1代表已启用0代表未启用；默认值是1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yw_admin_role
-- ----------------------------

-- ----------------------------
-- Table structure for yw_admin_role_priv
-- ----------------------------
DROP TABLE IF EXISTS `yw_admin_role_priv`;
CREATE TABLE `yw_admin_role_priv` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `role_id` int(10) DEFAULT NULL COMMENT '角色ID',
  `module` varchar(60) DEFAULT NULL COMMENT '模块',
  `controller` varchar(60) DEFAULT NULL COMMENT '控制器',
  `action` varchar(60) DEFAULT NULL COMMENT '动作',
  `data` varchar(60) DEFAULT NULL COMMENT '传参',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yw_admin_role_priv
-- ----------------------------

-- ----------------------------
-- Table structure for yw_chat
-- ----------------------------
DROP TABLE IF EXISTS `yw_chat`;
CREATE TABLE `yw_chat` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `from_user` int(10) DEFAULT NULL COMMENT '发送者ID',
  `to_user` int(10) DEFAULT NULL COMMENT '接受者ID',
  `add_time` datetime DEFAULT NULL COMMENT '发送时间',
  `status` enum('disabled','enabled') DEFAULT 'enabled' COMMENT '状态：enabled表示正常disabled表示冻结不显示',
  `content` text COMMENT '消息内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yw_chat
-- ----------------------------

-- ----------------------------
-- Table structure for yw_comments
-- ----------------------------
DROP TABLE IF EXISTS `yw_comments`;
CREATE TABLE `yw_comments` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `post_id` int(10) DEFAULT NULL COMMENT '说说ID',
  `content` text COMMENT '留言内容',
  `type` enum('reply','like') DEFAULT NULL COMMENT '回复类型：like赞，reply留言',
  `user_id` int(10) DEFAULT NULL COMMENT '回复人ID',
  `parent` int(10) DEFAULT NULL,
  `ancestors` int(10) DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yw_comments
-- ----------------------------
INSERT INTO `yw_comments` VALUES ('7', '1', null, 'like', '1', null, null, '2016-08-12 16:17:17');

-- ----------------------------
-- Table structure for yw_community
-- ----------------------------
DROP TABLE IF EXISTS `yw_community`;
CREATE TABLE `yw_community` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) DEFAULT NULL COMMENT '圈子名称',
  `thumb` varchar(255) DEFAULT NULL COMMENT '头像',
  `longitude` varchar(60) DEFAULT NULL COMMENT '经度',
  `latitude` varchar(60) DEFAULT NULL COMMENT '纬度',
  `description` text COMMENT '圈子说明',
  `games` varchar(255) DEFAULT NULL COMMENT '游戏：表示当前圈子关注的游戏，格式：游戏ID，游戏ID，....',
  `user_id` int(10) DEFAULT NULL COMMENT '创建者ID',
  `add_time` datetime DEFAULT NULL COMMENT '创建时间',
  `status` enum('close','normal') DEFAULT 'normal' COMMENT '状态：normal表示正常close关闭，当圈子关闭的时候一般要有关闭的原因remark',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `views` int(10) DEFAULT '0',
  `likes` int(10) DEFAULT '0',
  `posts` int(10) DEFAULT '0' COMMENT '文章数量',
  `users` int(10) DEFAULT '0' COMMENT '用户数量',
  `comments` int(10) DEFAULT '0' COMMENT '评论数量',
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yw_community
-- ----------------------------
INSERT INTO `yw_community` VALUES ('36', '我我就不会有！', 'http://oaqx2e3yr.bkt.clouddn.com/Group1472118847', '116.0646', '22.3237', '吊谭谭', '7,9', '1', '2016-08-25 17:54:34', 'normal', null, '0', '0', '0', '0', '0', '中国河南省洛阳市涧西区郑州路街道青滇路30号');
INSERT INTO `yw_community` VALUES ('16', '我想要是好好多', 'http://oaqx2e3yr.bkt.clouddn.com/Group1472000721', '116.0646', '22.3237', '吊谭谭', '9', '1', '2016-08-11 19:46:14', 'normal', null, '0', '0', '0', '0', '0', '中国河南省洛阳市涧西区郑州路街道青滇路30号');
INSERT INTO `yw_community` VALUES ('61', '测试26', 'http://oaqx2e3yr.bkt.clouddn.com/Group1472640835', '116.0646', '22.3237', '你', '7,9', '1', '2016-08-31 18:53:56', 'normal', null, '0', '0', '0', '0', '0', '假地址');
INSERT INTO `yw_community` VALUES ('33', '你说你是我的小伙伴', '', '116.0646', '22.3237', '吊谭', '8', '1', '2016-08-23 10:00:07', 'normal', null, '0', '0', '0', '0', '0', '中国河南省洛阳市涧西区长安路街道陇北二路');
INSERT INTO `yw_community` VALUES ('35', '测试图片中间', 'http://oaqx2e3yr.bkt.clouddn.com/Group1472002310', '116.0646', '22.3237', 'qqqq', '9', '1', '2016-08-23 10:51:47', 'normal', null, '0', '0', '0', '0', '0', '中国河南省洛阳市涧西区长安路街道陇北二路');
INSERT INTO `yw_community` VALUES ('34', '你们都市田园风光', 'http://oaqx2e3yr.bkt.clouddn.com/Group1472001670', '116.0646', '22.3237', '你是我的小伙伴', '10', '1', '2016-08-23 10:45:56', 'normal', null, '0', '0', '0', '0', '0', '中国河南省洛阳市涧西区长安路街道陇北二路');
INSERT INTO `yw_community` VALUES ('17', '111', 'http://oaqx2e3yr.bkt.clouddn.com/Group1471949421', '116.0646', '22.3237', '111111', '9', '1', '2016-08-11 21:39:24', 'normal', null, '0', '0', '0', '0', '0', '中国河南省洛阳市涧西区郑州路街道青滇路30号');
INSERT INTO `yw_community` VALUES ('19', '我会好好的', 'http://oaqx2e3yr.bkt.clouddn.com/Group1470968471', '116.0646', '22.3237', '我想要的结果', '7,9', '1', '2016-08-12 10:21:41', 'normal', null, '0', '0', '0', '0', '0', '中国河南省洛阳市涧西区长安路街道景华路66号');
INSERT INTO `yw_community` VALUES ('21', '吊谭吗', 'http://oaqx2e3yr.bkt.clouddn.com/Group1471248355', '116.0646', '22.3237', '吊谭谭校长', '7,9', '1', '2016-08-15 16:06:12', 'normal', null, '0', '0', '0', '0', '0', '中国河南省洛阳市涧西区郑州路街道青滇路30号');
INSERT INTO `yw_community` VALUES ('62', '测试27', 'http://oaqx2e3yr.bkt.clouddn.com/Group1472694066', '116.0646', '22.3237', '你', '7,9', '1', '2016-09-01 09:41:07', 'normal', null, '0', '0', '0', '0', '0', '假地址');
INSERT INTO `yw_community` VALUES ('40', '测试1', 'http://oaqx2e3yr.bkt.clouddn.com/Group1472199222', '116.0646', '22.3237', '吊牌齐全1', '7,9', '1', '2016-08-26 16:13:43', 'normal', null, '0', '0', '0', '0', '0', '中国河南省洛阳市涧西区郑州路街道青滇路30号');
INSERT INTO `yw_community` VALUES ('39', '吊谭盾舰机上', 'http://oaqx2e3yr.bkt.clouddn.com/Group1472199103', '116.0646', '22.3237', '你的时候就', '7,9', '1', '2016-08-26 16:11:44', 'normal', null, '0', '0', '0', '0', '0', '中国河南省洛阳市涧西区郑州路街道青滇路11号');
INSERT INTO `yw_community` VALUES ('37', '我想我是有时候性格不合只是不想让自己变得越来越复杂！', 'http://oaqx2e3yr.bkt.clouddn.com/Group1472123148', '116.0646', '22.3237', '页游平台', '5,9', '1', '2016-08-25 19:05:49', 'normal', null, '0', '0', '0', '0', '0', '中国河南省洛阳市涧西区郑州路街道青滇路11号');
INSERT INTO `yw_community` VALUES ('38', '吊坠女毛衣水晶项链', 'http://oaqx2e3yr.bkt.clouddn.com/Group1472198832', '116.0646', '22.3237', '吊带背心', '7,9', '1', '2016-08-26 16:07:13', 'normal', null, '0', '0', '0', '0', '0', '中国河南省洛阳市涧西区郑州路街道青滇路11号');
INSERT INTO `yw_community` VALUES ('24', '吊牌齐全', 'http://oaqx2e3yr.bkt.clouddn.com/Group1471249058', '116.0646', '22.3237', '吊带连衣裙夏季', '9', '1', '2016-08-15 16:17:50', 'normal', null, '0', '0', '0', '0', '0', '河南省洛阳市涧西区青滇路小舞林舞蹈');
INSERT INTO `yw_community` VALUES ('25', '真是无语凝噎！', 'http://oaqx2e3yr.bkt.clouddn.com/Group1472002372', '116.0646', '22.3237', '吊带雪纺长连衣裙', '6', '1', '2016-08-15 18:42:38', 'normal', null, '0', '0', '0', '0', '0', '河南省洛阳市涧西区青滇路30号');
INSERT INTO `yw_community` VALUES ('26', '一个圈子', '', '116.0646', '22.3237', '看', '9', '1', '2016-08-17 16:31:18', 'normal', null, '0', '0', '0', '0', '0', '中国河南省洛阳市涧西区郑州路街道青滇路30号');
INSERT INTO `yw_community` VALUES ('66', '测试游戏1', 'http://oaqx2e3yr.bkt.clouddn.com/Group1472720139', '116.0646', '22.3237', '我', '5,6,7', '1', '2016-09-01 16:55:50', 'normal', null, '0', '0', '0', '0', '0', '假地址');
INSERT INTO `yw_community` VALUES ('67', '测试游戏2', 'http://oaqx2e3yr.bkt.clouddn.com/Group1472725432', '116.0646', '22.3237', '这', '5,7', '1', '2016-09-01 18:23:59', 'normal', null, '0', '0', '0', '0', '0', '假地址');
INSERT INTO `yw_community` VALUES ('68', '测试游戏3', 'http://oaqx2e3yr.bkt.clouddn.com/Group1472726325', '116.0646', '22.3237', '你', '', '1', '2016-09-01 18:39:35', 'normal', null, '0', '0', '0', '0', '0', '中国河南省洛阳市涧西区郑州路街道青滇路11号');
INSERT INTO `yw_community` VALUES ('31', '大傻', 'http://oaqx2e3yr.bkt.clouddn.com/Group1471765930', '116.0646', '22.3237', '吊牌齐全，', '1,2', '1', '2016-08-21 15:52:28', 'normal', null, '0', '0', '0', '0', '0', '中国河南省洛阳市涧西区长安路街道景华路105号门面房');
INSERT INTO `yw_community` VALUES ('32', '你是我', 'http://oaqx2e3yr.bkt.clouddn.com/Group1471829969', '116.0646', '22.3237', '吊牌包装设计', '9', '1', '2016-08-22 09:40:24', 'normal', null, '0', '0', '0', '0', '0', '中国河南省洛阳市涧西区长安路街道中州西路217号');
INSERT INTO `yw_community` VALUES ('41', '测试2', 'http://oaqx2e3yr.bkt.clouddn.com/Group1472199309', '116.0646', '22.3237', '我们的', '7,9', '1', '2016-08-26 16:15:10', 'normal', null, '0', '0', '0', '0', '0', '中国河南省洛阳市涧西区郑州路街道青滇路11号');
INSERT INTO `yw_community` VALUES ('42', '测试3', 'http://oaqx2e3yr.bkt.clouddn.com/Group1472199353', '116.0646', '22.3237', '853', '7,9', '1', '2016-08-26 16:15:54', 'normal', null, '0', '0', '0', '0', '0', '中国河南省洛阳市涧西区郑州路街道青滇路11号');
INSERT INTO `yw_community` VALUES ('43', '测试4', 'http://oaqx2e3yr.bkt.clouddn.com/Group1472199377', '116.0646', '22.3237', '我想4', '7,9', '1', '2016-08-26 16:16:19', 'normal', null, '0', '0', '0', '0', '0', '亲，歇息片刻！');
INSERT INTO `yw_community` VALUES ('44', '测试5', 'http://oaqx2e3yr.bkt.clouddn.com/Group1472199399', '116.0646', '22.3237', '吊5', '7,9', '1', '2016-08-26 16:16:40', 'normal', null, '0', '0', '0', '0', '0', '亲，歇息片刻！');
INSERT INTO `yw_community` VALUES ('45', '测试6', 'http://oaqx2e3yr.bkt.clouddn.com/Group1472199512', '116.0646', '22.3237', '吊牌齐全', '7,9', '1', '2016-08-26 16:18:33', 'normal', null, '0', '0', '0', '0', '0', '中国河南省洛阳市涧西区郑州路街道青滇路11号');
INSERT INTO `yw_community` VALUES ('46', '测试7', 'http://oaqx2e3yr.bkt.clouddn.com/Group1472199552', '116.0646', '22.3237', '7', '7,9', '1', '2016-08-26 16:19:13', 'normal', null, '0', '0', '0', '0', '0', '中国河南省洛阳市涧西区郑州路街道青滇路11号');
INSERT INTO `yw_community` VALUES ('47', '测试8', 'http://oaqx2e3yr.bkt.clouddn.com/Group1472380030', '116.0646', '22.3237', '测试8', '7,9', '1', '2016-08-28 18:27:11', 'normal', null, '0', '0', '0', '0', '0', '中国河南省洛阳市涧西区郑州路街道青滇路11号');
INSERT INTO `yw_community` VALUES ('65', '测试游戏编辑', 'http://oaqx2e3yr.bkt.clouddn.com/Group1472719884', '116.0646', '22.3237', '？', '5', '84', '2016-09-01 16:51:25', 'normal', null, '0', '0', '0', '0', '0', '假地址');
INSERT INTO `yw_community` VALUES ('48', '测试9', 'http://oaqx2e3yr.bkt.clouddn.com/Group1472436577', '116.0646', '22.3237', '吊牌齐全…………^_^nihkulo', '7,9', '1', '2016-08-29 10:09:38', 'normal', null, '0', '0', '0', '0', '0', '中国河南省洛阳市涧西区郑州路街道青滇路11号');
INSERT INTO `yw_community` VALUES ('64', '哦啦啦啦', 'http://oaqx2e3yr.bkt.clouddn.com/Group1472706592', '116.0646', '22.3237', '122', '5,6,7', '1', '2016-09-01 13:09:58', 'normal', null, '0', '0', '0', '0', '0', '假地址');
INSERT INTO `yw_community` VALUES ('50', '测试12', 'http://oaqx2e3yr.bkt.clouddn.com/Group1472456267', '116.0646', '22.3237', '我是个', '7,9', '1', '2016-08-29 15:37:49', 'normal', null, '0', '0', '0', '0', '0', '亲，歇息片刻！');
INSERT INTO `yw_community` VALUES ('51', '测试14', 'http://oaqx2e3yr.bkt.clouddn.com/Group1472456401', '116.0646', '22.3237', '吊带', '7,9', '1', '2016-08-29 15:40:02', 'normal', null, '0', '0', '0', '0', '0', '中国河南省洛阳市涧西区郑州路街道青滇路11号');
INSERT INTO `yw_community` VALUES ('52', '测试15', 'http://oaqx2e3yr.bkt.clouddn.com/Group1472456967', '116.0646', '22.3237', '吊', '7,9', '1', '2016-08-29 15:49:28', 'normal', null, '0', '0', '0', '0', '0', '中国河南省洛阳市涧西区长安路街道长安路22街坊');
INSERT INTO `yw_community` VALUES ('53', '看咯哦', 'http://oaqx2e3yr.bkt.clouddn.com/Group1472558494', '116.0646', '22.3237', '，鳄鱼天咯某呼吸', '5,6,7', '1', '2016-08-30 20:02:34', 'normal', null, '0', '0', '0', '0', '0', '假地址');
INSERT INTO `yw_community` VALUES ('54', '骷髅头', 'http://oaqx2e3yr.bkt.clouddn.com/Group1472558772', '116.0646', '22.3237', '来记录了落寞', '7,9', '1', '2016-08-30 20:06:39', 'normal', null, '0', '0', '0', '0', '0', '假地址');
INSERT INTO `yw_community` VALUES ('63', '测试28', 'http://oaqx2e3yr.bkt.clouddn.com/Group1472698279', '116.0646', '22.3237', '你', '5,6,7,8', '1', '2016-09-01 10:52:40', 'normal', null, '0', '0', '0', '0', '0', '假地址');
INSERT INTO `yw_community` VALUES ('55', '我gujl', 'http://oaqx2e3yr.bkt.clouddn.com/Group1472559229', '116.0646', '22.3237', '了！t', '8,9,7,5', '1', '2016-08-30 20:14:17', 'normal', null, '0', '0', '0', '0', '0', '假地址');
INSERT INTO `yw_community` VALUES ('56', '测试19', 'http://oaqx2e3yr.bkt.clouddn.com/Group1472609487', '116.0646', '22.3237', '民俗', '5,6,8', '1', '2016-08-31 10:11:28', 'normal', null, '0', '0', '0', '0', '0', '假地址');
INSERT INTO `yw_community` VALUES ('57', '测试20', 'http://oaqx2e3yr.bkt.clouddn.com/Group1472610144', '116.0646', '22.3237', '你', '7,9', '1', '2016-08-31 10:22:25', 'normal', null, '0', '0', '0', '0', '0', '假地址');
INSERT INTO `yw_community` VALUES ('58', '测试23', 'http://oaqx2e3yr.bkt.clouddn.com/Group1472616351', '116.0646', '22.3237', '吊', '5,6,7,8,9,6', '1', '2016-08-31 12:05:52', 'normal', null, '0', '0', '0', '0', '0', '假地址');
INSERT INTO `yw_community` VALUES ('59', '测试24', 'http://oaqx2e3yr.bkt.clouddn.com/Group1472631785', '116.0646', '22.3237', '吊', '5,6,7', '1', '2016-08-31 16:23:07', 'normal', null, '0', '0', '0', '0', '0', '假地址');
INSERT INTO `yw_community` VALUES ('60', '测试25', 'http://oaqx2e3yr.bkt.clouddn.com/Group1472632825', '116.0646', '22.3237', '八', '6', '1', '2016-08-31 16:40:26', 'normal', null, '0', '0', '0', '0', '0', '假地址');

-- ----------------------------
-- Table structure for yw_community_comments
-- ----------------------------
DROP TABLE IF EXISTS `yw_community_comments`;
CREATE TABLE `yw_community_comments` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `post_id` int(10) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `type` enum('like','reply') DEFAULT 'reply',
  `user_id` int(10) DEFAULT NULL,
  `parent` int(10) DEFAULT NULL,
  `ancestors` varchar(255) DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  `class` tinyint(4) DEFAULT NULL COMMENT '1代表全局动态的评论',
  `replay_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=509 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yw_community_comments
-- ----------------------------
INSERT INTO `yw_community_comments` VALUES ('6', '1', '达瓦大大', 'reply', '1', null, null, '2016-08-04 18:26:38', '0', null);
INSERT INTO `yw_community_comments` VALUES ('7', '1', '达瓦大大', 'reply', '1', null, null, '2016-08-04 18:26:39', '0', null);
INSERT INTO `yw_community_comments` VALUES ('8', '1', '达瓦大大', 'reply', '5', '6', null, '2016-08-04 18:26:41', '0', null);
INSERT INTO `yw_community_comments` VALUES ('9', '1', '达瓦大大', 'reply', '1', '6', null, '2016-08-04 18:26:43', '0', '8');
INSERT INTO `yw_community_comments` VALUES ('10', '1', '达瓦大大', 'reply', '1', '11', null, '2016-08-04 18:26:45', '0', null);
INSERT INTO `yw_community_comments` VALUES ('11', '1', '达瓦大大', 'reply', '1', null, null, '2016-08-04 18:26:47', '0', null);
INSERT INTO `yw_community_comments` VALUES ('12', '1', '123dwa5d4', 'reply', '1', null, null, '2016-08-04 18:51:41', '0', null);
INSERT INTO `yw_community_comments` VALUES ('13', '1', '我是子评论', 'reply', '1', '12', null, '2016-08-04 19:00:45', '0', null);
INSERT INTO `yw_community_comments` VALUES ('14', '1', '123dwa5d4', 'reply', '1', null, null, '2016-08-05 01:21:41', '0', null);
INSERT INTO `yw_community_comments` VALUES ('15', '1', '123dwa5d4', 'reply', '1', null, null, '2016-08-05 01:22:07', '0', null);
INSERT INTO `yw_community_comments` VALUES ('16', '2', '123dwa5d4', 'reply', '1', null, null, '2016-08-05 01:22:41', '0', null);
INSERT INTO `yw_community_comments` VALUES ('17', '2', '123dwa5d4', 'reply', '1', null, null, '2016-08-05 01:23:05', '0', null);
INSERT INTO `yw_community_comments` VALUES ('18', '1', '123', 'reply', '1', null, null, '2016-08-12 17:22:05', '0', null);
INSERT INTO `yw_community_comments` VALUES ('19', '1', '123', 'reply', '1', null, null, '2016-08-12 17:22:10', '0', null);
INSERT INTO `yw_community_comments` VALUES ('20', '2', '123', 'reply', '1', null, null, '2016-08-12 17:24:02', '0', null);
INSERT INTO `yw_community_comments` VALUES ('21', '2', '123', 'reply', '1', null, null, '2016-08-12 17:24:53', '0', null);
INSERT INTO `yw_community_comments` VALUES ('22', '2', '123', 'reply', '1', null, null, '2016-08-12 17:27:38', '0', null);
INSERT INTO `yw_community_comments` VALUES ('23', '2', '123', 'reply', '1', null, null, '2016-08-12 17:32:16', '0', null);
INSERT INTO `yw_community_comments` VALUES ('24', '2', '123', 'reply', '1', null, null, '2016-08-12 17:36:16', '0', null);
INSERT INTO `yw_community_comments` VALUES ('25', '2', '123', 'reply', '1', null, null, '2016-08-12 17:36:27', '0', null);
INSERT INTO `yw_community_comments` VALUES ('26', '81', '123', 'reply', '1', null, null, '2016-08-12 17:36:47', '0', null);
INSERT INTO `yw_community_comments` VALUES ('27', '136', '123', 'reply', '1', null, null, '2016-08-12 20:20:23', '0', null);
INSERT INTO `yw_community_comments` VALUES ('28', '136', '123', 'reply', '1', null, null, '2016-08-12 20:21:12', '0', null);
INSERT INTO `yw_community_comments` VALUES ('29', '136', '123', 'reply', '1', null, null, '2016-08-12 20:21:14', '0', null);
INSERT INTO `yw_community_comments` VALUES ('30', '136', '123', 'reply', '1', null, null, '2016-08-12 20:21:16', '0', null);
INSERT INTO `yw_community_comments` VALUES ('31', '136', '123', 'reply', '1', null, null, '2016-08-12 20:21:39', '0', null);
INSERT INTO `yw_community_comments` VALUES ('32', '136', '哈哈', 'reply', '1', null, null, '2016-08-12 20:21:42', '0', null);
INSERT INTO `yw_community_comments` VALUES ('38', '2', '123', 'reply', '1', null, null, '2016-08-13 10:42:10', '0', null);
INSERT INTO `yw_community_comments` VALUES ('44', '4', 'PingLun', 'reply', '1', null, null, '2016-08-13 16:51:39', '0', null);
INSERT INTO `yw_community_comments` VALUES ('45', '1', 'PingLun2', 'reply', '1', null, null, '2016-08-13 16:52:07', '0', null);
INSERT INTO `yw_community_comments` VALUES ('46', '1', 'PingLun', 'reply', '1', null, null, '2016-08-13 16:52:07', '1', null);
INSERT INTO `yw_community_comments` VALUES ('47', '4', 'PingLun', 'reply', '1', null, null, '2016-08-13 16:53:04', '0', null);
INSERT INTO `yw_community_comments` VALUES ('48', '4', 'PingLun', 'reply', '1', null, null, '2016-08-13 16:53:04', '0', null);
INSERT INTO `yw_community_comments` VALUES ('49', '4', 'PingLun', 'reply', '3', null, null, '2016-08-13 16:53:29', '0', null);
INSERT INTO `yw_community_comments` VALUES ('50', '4', 'PingLun', 'reply', '1', null, null, '2016-08-13 16:53:34', '0', null);
INSERT INTO `yw_community_comments` VALUES ('51', '4', 'PingLun', 'reply', '1', null, null, '2016-08-13 16:53:35', '0', null);
INSERT INTO `yw_community_comments` VALUES ('52', '4', 'PingLun', 'reply', '1', null, null, '2016-08-13 16:54:22', '0', null);
INSERT INTO `yw_community_comments` VALUES ('53', '4', 'PingLun', 'reply', '1', null, null, '2016-08-13 16:54:29', '0', null);
INSERT INTO `yw_community_comments` VALUES ('54', '4', 'PingLun', 'reply', '1', null, null, '2016-08-13 16:54:32', '0', null);
INSERT INTO `yw_community_comments` VALUES ('55', '4', 'PingLun', 'reply', '1', null, null, '2016-08-13 16:54:37', '0', null);
INSERT INTO `yw_community_comments` VALUES ('59', '6', '123', 'reply', '1', null, null, '2016-08-13 17:06:44', '0', null);
INSERT INTO `yw_community_comments` VALUES ('60', '6', '123', 'reply', '1', null, null, '2016-08-13 17:07:34', '0', null);
INSERT INTO `yw_community_comments` VALUES ('61', '6', '123', 'reply', '1', null, null, '2016-08-13 17:07:40', '0', null);
INSERT INTO `yw_community_comments` VALUES ('62', '6', '123', 'reply', '1', null, null, '2016-08-13 17:13:04', '0', null);
INSERT INTO `yw_community_comments` VALUES ('63', '6', '123', 'reply', '1', null, null, '2016-08-13 17:13:32', '0', null);
INSERT INTO `yw_community_comments` VALUES ('64', '6', '123', 'reply', '1', null, null, '2016-08-13 17:15:16', '0', null);
INSERT INTO `yw_community_comments` VALUES ('67', '6', null, 'like', '1', null, null, '2016-08-14 12:47:09', '0', null);
INSERT INTO `yw_community_comments` VALUES ('68', '1', '', 'like', '3', null, '', '2016-08-14 12:47:09', '0', null);
INSERT INTO `yw_community_comments` VALUES ('69', '1', '', 'like', '5', null, '', '2016-08-14 12:47:09', '0', null);
INSERT INTO `yw_community_comments` VALUES ('70', '1', '', 'like', '67', null, '', '2016-08-14 12:47:09', '0', null);
INSERT INTO `yw_community_comments` VALUES ('71', '1', '', 'like', '63', null, '', '2016-08-14 12:47:09', '0', null);
INSERT INTO `yw_community_comments` VALUES ('72', '1', '', 'like', '61', null, '', '2016-08-14 12:47:09', '0', null);
INSERT INTO `yw_community_comments` VALUES ('73', '1', '', 'like', '46', null, '', '2016-08-14 12:47:09', '0', null);
INSERT INTO `yw_community_comments` VALUES ('74', '1', '', 'like', '47', null, '', '2016-08-14 12:47:09', '0', null);
INSERT INTO `yw_community_comments` VALUES ('75', '1', '', 'like', '54', null, '', '2016-08-14 12:47:09', '0', null);
INSERT INTO `yw_community_comments` VALUES ('76', '1', '', 'like', '64', null, '', '2016-08-14 12:47:09', '0', null);
INSERT INTO `yw_community_comments` VALUES ('77', '4', 'PingLun', 'reply', '1', null, null, '2016-08-15 10:08:51', '0', null);
INSERT INTO `yw_community_comments` VALUES ('78', '4', 'PingLun', 'reply', '1', null, null, '2016-08-15 10:09:28', '0', null);
INSERT INTO `yw_community_comments` VALUES ('79', '4', 'PingLun', 'reply', '1', null, null, '2016-08-15 10:09:32', '0', null);
INSERT INTO `yw_community_comments` VALUES ('80', '1', 'PingLun', 'reply', '1', null, null, '2016-08-15 10:09:44', '0', null);
INSERT INTO `yw_community_comments` VALUES ('81', '1', 'PingLun', 'reply', '1', null, null, '2016-08-15 10:09:45', '0', null);
INSERT INTO `yw_community_comments` VALUES ('82', '4', 'PingLun', 'reply', '1', null, null, '2016-08-15 10:09:50', '0', null);
INSERT INTO `yw_community_comments` VALUES ('83', '4', 'PingLun', 'reply', '1', null, null, '2016-08-15 10:09:50', '0', null);
INSERT INTO `yw_community_comments` VALUES ('84', '4', 'PingLun', 'reply', '1', null, null, '2016-08-15 10:09:56', '1', null);
INSERT INTO `yw_community_comments` VALUES ('85', '4', 'PingLun', 'reply', '1', null, null, '2016-08-15 10:09:57', '1', null);
INSERT INTO `yw_community_comments` VALUES ('86', '4', 'PingLun', 'reply', '1', null, null, '2016-08-15 16:24:04', '1', null);
INSERT INTO `yw_community_comments` VALUES ('87', '38', null, 'like', '1', null, null, '2016-08-15 16:46:01', '1', null);
INSERT INTO `yw_community_comments` VALUES ('88', '3', null, 'like', '1', null, null, '2016-08-15 16:46:09', '1', null);
INSERT INTO `yw_community_comments` VALUES ('90', '141', null, 'like', '1', null, null, '2016-08-15 16:46:13', '1', null);
INSERT INTO `yw_community_comments` VALUES ('91', '141', null, 'like', '1', null, null, '2016-08-15 16:47:00', '0', null);
INSERT INTO `yw_community_comments` VALUES ('92', '138', null, 'like', '1', null, null, '2016-08-15 16:58:59', '0', null);
INSERT INTO `yw_community_comments` VALUES ('94', '138', null, 'like', '1', null, null, '2016-08-17 10:18:21', '1', null);
INSERT INTO `yw_community_comments` VALUES ('95', '138', null, 'like', '2', null, null, '2016-08-17 10:18:51', '0', null);
INSERT INTO `yw_community_comments` VALUES ('96', '143', null, 'like', '1', null, null, '2016-08-17 11:09:11', '0', null);
INSERT INTO `yw_community_comments` VALUES ('98', '136', null, 'like', '1', null, null, '2016-08-17 14:46:53', '1', null);
INSERT INTO `yw_community_comments` VALUES ('99', '4', 'PingLun', 'reply', '1', null, null, '2016-08-17 14:47:18', '0', null);
INSERT INTO `yw_community_comments` VALUES ('100', '1', 'PingLun', 'reply', '1', null, null, '2016-08-17 14:47:58', '0', null);
INSERT INTO `yw_community_comments` VALUES ('101', '1', 'PingLun', 'reply', '1', null, null, '2016-08-17 14:48:00', '0', null);
INSERT INTO `yw_community_comments` VALUES ('102', '143', 'PingLun', 'reply', '1', null, null, '2016-08-17 14:48:16', '0', null);
INSERT INTO `yw_community_comments` VALUES ('103', '143', 'UserID2DePingLun', 'reply', '2', null, null, '2016-08-17 14:53:11', '0', null);
INSERT INTO `yw_community_comments` VALUES ('106', '120', null, 'like', '3', null, null, '2016-08-17 15:47:13', '0', null);
INSERT INTO `yw_community_comments` VALUES ('121', '120', null, 'like', '1', null, null, '2016-08-17 19:13:20', '0', null);
INSERT INTO `yw_community_comments` VALUES ('122', '8', null, 'like', '1', null, null, '2016-08-17 19:13:35', '0', null);
INSERT INTO `yw_community_comments` VALUES ('151', '157', null, 'like', '1', null, null, '2016-08-17 21:36:05', '0', null);
INSERT INTO `yw_community_comments` VALUES ('159', '159', null, 'like', '1', null, null, '2016-08-17 21:46:15', '0', null);
INSERT INTO `yw_community_comments` VALUES ('182', '160', null, 'like', '1', null, null, '2016-08-17 22:06:53', '0', null);
INSERT INTO `yw_community_comments` VALUES ('197', '154', null, 'like', '1', null, null, '2016-08-18 08:58:07', '0', null);
INSERT INTO `yw_community_comments` VALUES ('202', '153', null, 'like', '1', null, null, '2016-08-18 09:17:36', '0', null);
INSERT INTO `yw_community_comments` VALUES ('203', '146', null, 'like', '1', null, null, '2016-08-18 09:17:47', '0', null);
INSERT INTO `yw_community_comments` VALUES ('205', '145', null, 'like', '1', null, null, '2016-08-18 09:18:15', '0', null);
INSERT INTO `yw_community_comments` VALUES ('211', '161', null, 'like', '1', null, null, '2016-08-18 09:26:38', '0', null);
INSERT INTO `yw_community_comments` VALUES ('212', '-2147483648', null, 'like', '1', null, null, '2016-08-18 09:40:00', '0', null);
INSERT INTO `yw_community_comments` VALUES ('213', '2147483647', null, 'like', '1', null, null, '2016-08-18 09:45:43', '0', null);
INSERT INTO `yw_community_comments` VALUES ('214', '-2147483648', null, 'like', '1', null, null, '2016-08-18 09:45:46', '0', null);
INSERT INTO `yw_community_comments` VALUES ('215', '2147483647', null, 'like', '1', null, null, '2016-08-18 09:45:50', '0', null);
INSERT INTO `yw_community_comments` VALUES ('216', '2147483647', null, 'like', '1', null, null, '2016-08-18 09:45:58', '0', null);
INSERT INTO `yw_community_comments` VALUES ('217', '-2147483648', null, 'like', '1', null, null, '2016-08-18 09:46:02', '0', null);
INSERT INTO `yw_community_comments` VALUES ('218', '-2147483648', null, 'like', '1', null, null, '2016-08-18 09:47:03', '0', null);
INSERT INTO `yw_community_comments` VALUES ('219', '-2147483648', null, 'like', '1', null, null, '2016-08-18 10:04:56', '0', null);
INSERT INTO `yw_community_comments` VALUES ('221', '164', null, 'like', '1', null, null, '2016-08-18 13:14:14', '0', null);
INSERT INTO `yw_community_comments` VALUES ('223', '1', 'PingLun', 'reply', '1', null, null, '2016-08-18 15:23:52', '0', null);
INSERT INTO `yw_community_comments` VALUES ('224', '165', 'PingLun', 'reply', '1', null, null, '2016-08-18 15:24:44', '0', null);
INSERT INTO `yw_community_comments` VALUES ('225', '165', '我也来评论一下玩玩吧', 'reply', '1', null, null, '2016-08-18 15:25:21', '0', null);
INSERT INTO `yw_community_comments` VALUES ('226', '165', '哈哈哈哈哈哈哈哈哈哈哈哈哈哈啊哈哈，你们都评论啦，我来个长的！！！！！！！！！！！！！！！！！！！！！！！！！！！！！', 'reply', '1', null, null, '2016-08-18 15:26:24', '0', null);
INSERT INTO `yw_community_comments` VALUES ('227', '165', '评论回复的内容', 'reply', '1', '224', null, '2016-08-18 19:10:38', null, null);
INSERT INTO `yw_community_comments` VALUES ('228', '163', null, 'like', '1', null, null, '2016-08-18 19:34:40', '0', null);
INSERT INTO `yw_community_comments` VALUES ('229', '-2147483648', null, 'like', '1', null, null, '2016-08-18 19:34:58', '0', null);
INSERT INTO `yw_community_comments` VALUES ('230', '165', '评论回复的内容', 'reply', '1', '224', null, '2016-08-18 20:07:30', null, null);
INSERT INTO `yw_community_comments` VALUES ('231', '163', '哈哈哈哈哈哈哈哈哈哈哈哈哈哈啊哈哈', 'reply', '1', null, null, '2016-08-18 20:59:35', '0', null);
INSERT INTO `yw_community_comments` VALUES ('232', '163', '哈哈', 'reply', '1', null, null, '2016-08-18 21:29:37', '0', null);
INSERT INTO `yw_community_comments` VALUES ('233', '163', '哈哈哈哈', 'reply', '1', null, null, '2016-08-18 21:31:27', '0', null);
INSERT INTO `yw_community_comments` VALUES ('234', '163', '123', 'reply', '1', null, null, '2016-08-18 21:37:06', '0', null);
INSERT INTO `yw_community_comments` VALUES ('235', '145', '123', 'reply', '1', null, null, '2016-08-18 21:55:25', '0', null);
INSERT INTO `yw_community_comments` VALUES ('236', '163', '12312311231231231231231231', 'reply', '1', null, null, '2016-08-18 21:56:01', '0', null);
INSERT INTO `yw_community_comments` VALUES ('237', '145', 'f g h j g h j', 'reply', '1', null, null, '2016-08-18 21:58:29', '0', null);
INSERT INTO `yw_community_comments` VALUES ('238', '154', '123', 'reply', '1', null, null, '2016-08-18 22:00:45', '0', null);
INSERT INTO `yw_community_comments` VALUES ('239', '165', '哈哈', 'reply', '1', null, null, '2016-08-18 22:01:10', '0', null);
INSERT INTO `yw_community_comments` VALUES ('240', '163', 'derftgyuhjl；，\'.', 'reply', '1', null, null, '2016-08-18 22:01:26', '0', null);
INSERT INTO `yw_community_comments` VALUES ('241', '165', '评论回复的内容', 'reply', '1', '224', null, '2016-08-19 10:00:38', '0', null);
INSERT INTO `yw_community_comments` VALUES ('242', '165', '我也来评论一下', 'reply', '1', '225', null, '2016-08-19 10:07:00', '0', null);
INSERT INTO `yw_community_comments` VALUES ('243', '165', '1111', 'reply', '1', '241', null, '2016-08-19 10:19:55', '0', null);
INSERT INTO `yw_community_comments` VALUES ('244', '165', '2222', 'reply', '1', '243', null, '2016-08-19 10:22:12', '0', null);
INSERT INTO `yw_community_comments` VALUES ('245', '165', '2222', 'reply', '1', '224', null, '2016-08-19 10:26:08', '0', null);
INSERT INTO `yw_community_comments` VALUES ('246', '165', '2222', 'reply', '1', '241', null, '2016-08-19 10:32:50', '0', null);
INSERT INTO `yw_community_comments` VALUES ('247', '165', '2222', 'reply', '1', '224', null, '2016-08-19 10:34:07', '0', null);
INSERT INTO `yw_community_comments` VALUES ('248', '165', '333', 'reply', '1', '224', null, '2016-08-19 10:34:12', '0', null);
INSERT INTO `yw_community_comments` VALUES ('250', '165', '哎呦，你的评论好长啊()', 'reply', '1', '226', null, '2016-08-21 10:15:21', '0', null);
INSERT INTO `yw_community_comments` VALUES ('251', '154', '哈哈', 'reply', '1', null, null, '2016-08-21 10:28:09', '0', null);
INSERT INTO `yw_community_comments` VALUES ('252', '163', '哈哈哈哈哈哈哈哈', 'reply', '1', null, null, '2016-08-21 10:33:56', '0', null);
INSERT INTO `yw_community_comments` VALUES ('253', '154', '笑个屁呀', 'reply', '1', null, null, '2016-08-21 10:34:21', '0', null);
INSERT INTO `yw_community_comments` VALUES ('254', '154', '咋的啦', 'reply', '1', null, null, '2016-08-21 10:34:37', '0', null);
INSERT INTO `yw_community_comments` VALUES ('255', '146', '你四不四撒', 'reply', '1', null, null, '2016-08-21 10:36:33', '0', null);
INSERT INTO `yw_community_comments` VALUES ('256', '145', '啥玩意', 'reply', '1', null, null, '2016-08-21 10:40:58', '0', null);
INSERT INTO `yw_community_comments` VALUES ('257', '7', 'hello。 －iOS', 'reply', '1', null, null, '2016-08-21 10:41:17', '0', null);
INSERT INTO `yw_community_comments` VALUES ('258', '7', 'iOS', 'reply', '1', null, null, '2016-08-21 10:41:28', '0', null);
INSERT INTO `yw_community_comments` VALUES ('259', '145', '哼', 'reply', '1', null, null, '2016-08-21 10:42:32', '0', null);
INSERT INTO `yw_community_comments` VALUES ('260', '120', '9咋啦', 'reply', '1', null, null, '2016-08-21 10:42:49', '0', null);
INSERT INTO `yw_community_comments` VALUES ('261', '165', null, 'like', '1', null, null, '2016-08-21 10:44:38', '0', null);
INSERT INTO `yw_community_comments` VALUES ('262', '165', '哎呦，你的评论好长啊()', 'reply', '1', '226', null, '2016-08-21 14:59:58', '0', null);
INSERT INTO `yw_community_comments` VALUES ('263', '163', '丫丫', 'reply', '1', null, null, '2016-08-21 15:00:55', '0', null);
INSERT INTO `yw_community_comments` VALUES ('264', '165', '哎呦', 'reply', '1', '241', null, '2016-08-21 16:04:34', '0', null);
INSERT INTO `yw_community_comments` VALUES ('265', '165', '哎呦', 'reply', '1', '224', null, '2016-08-21 16:06:11', '0', null);
INSERT INTO `yw_community_comments` VALUES ('266', '165', '哎呦1', 'reply', '1', '224', null, '2016-08-21 16:10:54', '0', null);
INSERT INTO `yw_community_comments` VALUES ('267', '165', '哎呦2', 'reply', '1', '224', null, '2016-08-21 16:11:16', '0', null);
INSERT INTO `yw_community_comments` VALUES ('268', '165', '哎呦2', 'reply', '1', '224', null, '2016-08-21 16:12:42', '0', null);
INSERT INTO `yw_community_comments` VALUES ('269', '165', '哎呦3', 'reply', '1', '224', null, '2016-08-21 16:12:58', '0', null);
INSERT INTO `yw_community_comments` VALUES ('270', '165', '哎呦3', 'reply', '1', '245', null, '2016-08-21 16:14:15', '0', null);
INSERT INTO `yw_community_comments` VALUES ('271', '165', '哎呦4', 'reply', '1', '245', null, '2016-08-21 16:14:58', '0', null);
INSERT INTO `yw_community_comments` VALUES ('272', '165', '玩玩', 'reply', '1', '225', null, '2016-08-21 16:17:35', '0', null);
INSERT INTO `yw_community_comments` VALUES ('273', '165', '玩玩', 'reply', '1', '225', null, '2016-08-21 16:18:30', '0', null);
INSERT INTO `yw_community_comments` VALUES ('274', '165', '玩玩', 'reply', '1', '224', null, '2016-08-21 16:18:57', '0', null);
INSERT INTO `yw_community_comments` VALUES ('275', '165', '评论', 'reply', '1', null, null, '2016-08-21 16:36:59', '0', null);
INSERT INTO `yw_community_comments` VALUES ('276', '165', '在评论', 'reply', '1', null, null, '2016-08-21 16:37:16', '0', null);
INSERT INTO `yw_community_comments` VALUES ('277', '165', '呵呵', 'reply', '1', null, null, '2016-08-21 17:01:38', '0', null);
INSERT INTO `yw_community_comments` VALUES ('278', '165', '呵呵啥呀', 'reply', '1', '277', null, '2016-08-21 17:15:39', '0', null);
INSERT INTO `yw_community_comments` VALUES ('279', '277', '哈哈，评论', 'reply', '1', null, null, '2016-08-21 17:15:59', '0', null);
INSERT INTO `yw_community_comments` VALUES ('280', '165', '5', 'reply', '1', null, null, '2016-08-21 17:16:56', '0', null);
INSERT INTO `yw_community_comments` VALUES ('281', '165', '5咋啦', 'reply', '1', '280', null, '2016-08-21 17:17:07', '0', null);
INSERT INTO `yw_community_comments` VALUES ('282', '280', '6', 'reply', '1', null, null, '2016-08-21 17:17:15', '0', null);
INSERT INTO `yw_community_comments` VALUES ('283', '163', '傻啊', 'reply', '1', '231', null, '2016-08-21 17:23:05', '0', null);
INSERT INTO `yw_community_comments` VALUES ('284', '163', '不傻呀', 'reply', '1', '231', null, '2016-08-21 17:23:15', '0', null);
INSERT INTO `yw_community_comments` VALUES ('285', '163', '哈哈，真有意思', 'reply', '1', null, null, '2016-08-21 17:23:35', '0', null);
INSERT INTO `yw_community_comments` VALUES ('286', '163', '你们真有意思', 'reply', '1', '231', null, '2016-08-21 17:23:49', '0', null);
INSERT INTO `yw_community_comments` VALUES ('287', '163', '456456456', 'reply', '1', '236', null, '2016-08-21 17:24:04', '0', null);
INSERT INTO `yw_community_comments` VALUES ('288', '163', '这是啥', 'reply', '1', '240', null, '2016-08-21 17:24:15', '0', null);
INSERT INTO `yw_community_comments` VALUES ('289', '163', '来个翻译', 'reply', '1', '240', null, '2016-08-21 17:24:25', '0', null);
INSERT INTO `yw_community_comments` VALUES ('290', '162', '饿了去吃呀', 'reply', '1', null, null, '2016-08-21 17:24:44', '0', null);
INSERT INTO `yw_community_comments` VALUES ('291', '162', '吃啥呀', 'reply', '1', '290', null, '2016-08-21 17:24:54', '0', null);
INSERT INTO `yw_community_comments` VALUES ('292', '162', '吃药', 'reply', '1', '290', null, '2016-08-21 17:25:03', '0', null);
INSERT INTO `yw_community_comments` VALUES ('293', '162', '哦好吧', 'reply', '1', '290', null, '2016-08-21 17:25:12', '0', null);
INSERT INTO `yw_community_comments` VALUES ('294', '162', '哎', 'reply', '1', null, null, '2016-08-21 17:25:25', '0', null);
INSERT INTO `yw_community_comments` VALUES ('295', '142', '456456', 'reply', '1', null, null, '2016-08-21 17:26:23', '0', null);
INSERT INTO `yw_community_comments` VALUES ('296', '154', '哈哈哈哈', 'reply', '1', null, null, '2016-08-21 17:28:15', '0', null);
INSERT INTO `yw_community_comments` VALUES ('297', '154', '哼', 'reply', '1', '253', null, '2016-08-21 17:28:24', '0', null);
INSERT INTO `yw_community_comments` VALUES ('298', '119', '一楼沙发', 'reply', '1', null, null, '2016-08-21 17:28:41', '0', null);
INSERT INTO `yw_community_comments` VALUES ('299', '162', '我也可以评论吗', 'reply', '83', null, null, '2016-08-21 17:36:23', '0', null);
INSERT INTO `yw_community_comments` VALUES ('300', '162', '居然可以呀', 'reply', '83', '299', null, '2016-08-21 17:36:39', '0', null);
INSERT INTO `yw_community_comments` VALUES ('301', '165', '我看看我能不能评论', 'reply', '83', '224', null, '2016-08-21 17:37:02', '0', null);
INSERT INTO `yw_community_comments` VALUES ('302', '165', '玩吧', 'reply', '83', '225', null, '2016-08-21 17:37:15', '0', null);
INSERT INTO `yw_community_comments` VALUES ('303', '165', '哈哈哈啊哈，刚注册的号码', 'reply', '83', null, null, '2016-08-21 17:37:40', '0', null);
INSERT INTO `yw_community_comments` VALUES ('304', '165', '没事', 'reply', '83', '280', null, '2016-08-21 17:37:55', '0', null);
INSERT INTO `yw_community_comments` VALUES ('305', '165', '挺好玩', 'reply', '83', null, null, '2016-08-21 17:38:07', '0', null);
INSERT INTO `yw_community_comments` VALUES ('306', '165', '俄好', 'reply', '83', '303', null, '2016-08-21 17:38:21', '0', null);
INSERT INTO `yw_community_comments` VALUES ('307', '1', null, 'like', '1', null, null, '2016-08-21 18:16:40', '1', null);
INSERT INTO `yw_community_comments` VALUES ('308', '119', '二楼', 'reply', '83', null, null, '2016-08-22 09:26:44', '0', null);
INSERT INTO `yw_community_comments` VALUES ('309', '119', '123', 'reply', '83', '298', null, '2016-08-22 09:26:53', '0', null);
INSERT INTO `yw_community_comments` VALUES ('310', '4', null, 'like', '1', null, null, '2016-08-22 10:42:04', '1', null);
INSERT INTO `yw_community_comments` VALUES ('311', '154', '哈哈', 'reply', '83', '238', null, '2016-08-22 11:02:36', '0', null);
INSERT INTO `yw_community_comments` VALUES ('312', '154', '笑啥呢', 'reply', '83', '238', null, '2016-08-22 11:02:47', '0', null);
INSERT INTO `yw_community_comments` VALUES ('313', '154', '哎呦', 'reply', '83', '251', null, '2016-08-22 11:03:10', '0', null);
INSERT INTO `yw_community_comments` VALUES ('314', '154', '1', 'reply', '83', '251', null, '2016-08-22 11:03:16', '0', null);
INSERT INTO `yw_community_comments` VALUES ('315', '154', '是对方', 'reply', '83', null, null, '2016-08-22 11:03:23', '0', null);
INSERT INTO `yw_community_comments` VALUES ('316', '154', '是短发舒服', 'reply', '83', '315', null, '2016-08-22 11:03:32', '0', null);
INSERT INTO `yw_community_comments` VALUES ('317', '154', '玩儿', 'reply', '83', '315', null, '2016-08-22 11:03:40', '0', null);
INSERT INTO `yw_community_comments` VALUES ('318', '154', '玩儿', 'reply', '83', '315', null, '2016-08-22 11:03:48', '0', null);
INSERT INTO `yw_community_comments` VALUES ('319', '154', '对方', 'reply', '83', '238', null, '2016-08-22 11:04:02', '0', null);
INSERT INTO `yw_community_comments` VALUES ('320', '163', '70', 'reply', '83', '231', null, '2016-08-22 11:07:21', '0', null);
INSERT INTO `yw_community_comments` VALUES ('321', '163', '的份', 'reply', '83', '232', null, '2016-08-22 11:07:40', '0', null);
INSERT INTO `yw_community_comments` VALUES ('322', '163', '的', 'reply', '83', '232', null, '2016-08-22 11:07:52', '0', null);
INSERT INTO `yw_community_comments` VALUES ('323', '163', '更好', 'reply', '83', '232', null, '2016-08-22 11:08:16', '0', null);
INSERT INTO `yw_community_comments` VALUES ('324', '163', '放 v 吧', 'reply', '83', '233', null, '2016-08-22 11:09:39', '0', null);
INSERT INTO `yw_community_comments` VALUES ('325', '163', '是对方', 'reply', '83', '231', null, '2016-08-22 11:11:47', '0', null);
INSERT INTO `yw_community_comments` VALUES ('326', '165', '321456465464684563145314356435645645631456346541352143564685465413514564768545643564654685476565464561465465746846515645647869456', 'reply', '1', '305', null, '2016-08-22 15:28:02', '0', null);
INSERT INTO `yw_community_comments` VALUES ('327', '165', '235135435353535351435435435143351313131454', 'reply', '1', '305', null, '2016-08-22 15:29:03', '0', null);
INSERT INTO `yw_community_comments` VALUES ('328', '165', '45454545', 'reply', '1', '305', null, '2016-08-22 15:29:12', '0', null);
INSERT INTO `yw_community_comments` VALUES ('329', '165', '为啥会自动换行啊', 'reply', '1', '305', null, '2016-08-22 15:36:40', '0', null);
INSERT INTO `yw_community_comments` VALUES ('330', '165', '评论回复的内容', 'reply', '1', '224', null, '2016-08-23 10:37:01', '0', null);
INSERT INTO `yw_community_comments` VALUES ('331', '165', '有没有名字', 'reply', '1', '224', null, '2016-08-23 10:37:30', '0', null);
INSERT INTO `yw_community_comments` VALUES ('332', '165', '有没有名字', 'reply', '1', '224', null, '2016-08-23 10:48:23', '0', null);
INSERT INTO `yw_community_comments` VALUES ('333', '163', '下是加夫里什啊大家反馈就是离开的肌肤', 'reply', '1', '252', null, '2016-08-23 10:51:57', '0', null);
INSERT INTO `yw_community_comments` VALUES ('334', '163', '1', 'reply', '1', null, null, '2016-08-23 11:15:18', '0', null);
INSERT INTO `yw_community_comments` VALUES ('335', '163', '2', 'reply', '1', null, null, '2016-08-23 11:15:38', '0', null);
INSERT INTO `yw_community_comments` VALUES ('336', '163', '3', 'reply', '1', null, null, '2016-08-23 11:15:51', '0', null);
INSERT INTO `yw_community_comments` VALUES ('337', '163', '1', 'reply', '1', '334', null, '2016-08-23 11:16:00', '0', null);
INSERT INTO `yw_community_comments` VALUES ('338', '163', '2', 'reply', '1', '335', null, '2016-08-23 11:16:09', '0', null);
INSERT INTO `yw_community_comments` VALUES ('339', '163', '1', 'reply', '1', '334', null, '2016-08-23 11:16:17', '0', null);
INSERT INTO `yw_community_comments` VALUES ('340', '163', '有没有名字', 'reply', '1', '231', null, '2016-08-23 11:19:57', '0', null);
INSERT INTO `yw_community_comments` VALUES ('341', '163', '撒地方', 'reply', '1', '231', null, '2016-08-23 15:10:16', '0', null);
INSERT INTO `yw_community_comments` VALUES ('342', '163', '风格', 'reply', '1', '252', null, '2016-08-23 15:10:34', '0', null);
INSERT INTO `yw_community_comments` VALUES ('343', '163', '是的发生的发生的', 'reply', '1', '232', null, '2016-08-23 15:10:47', '0', null);
INSERT INTO `yw_community_comments` VALUES ('344', '1', '有没有名字', 'reply', '1', '6', null, '2016-08-23 15:13:44', '0', null);
INSERT INTO `yw_community_comments` VALUES ('345', '163', '有没有名字1', 'reply', '1', '231', null, '2016-08-23 15:14:25', '0', null);
INSERT INTO `yw_community_comments` VALUES ('346', '163', '回复评论1', 'reply', '1', '231', null, '2016-08-23 15:18:31', '0', null);
INSERT INTO `yw_community_comments` VALUES ('347', '163', '回复评论1', 'reply', '1', '231', null, '2016-08-23 15:29:08', '0', null);
INSERT INTO `yw_community_comments` VALUES ('348', '163', '回复评论1', 'reply', '1', '231', null, '2016-08-23 15:29:59', '0', null);
INSERT INTO `yw_community_comments` VALUES ('349', '163', '回复评论1', 'reply', '1', '231', null, '2016-08-23 15:39:05', '0', '283');
INSERT INTO `yw_community_comments` VALUES ('350', '163', '回复评论2', 'reply', '1', '231', null, '2016-08-23 15:40:44', '0', '283');
INSERT INTO `yw_community_comments` VALUES ('351', '163', '回复评论3', 'reply', '1', '231', null, '2016-08-23 15:41:18', '0', null);
INSERT INTO `yw_community_comments` VALUES ('352', '163', '回复评论4', 'reply', '1', '231', null, '2016-08-23 15:42:04', '0', null);
INSERT INTO `yw_community_comments` VALUES ('353', '163', '回复评论5', 'reply', '1', '231', null, '2016-08-23 15:42:57', '0', '0');
INSERT INTO `yw_community_comments` VALUES ('354', '163', '回复评论5', 'reply', '1', '231', null, '2016-08-23 15:43:35', '0', '0');
INSERT INTO `yw_community_comments` VALUES ('355', '162', '回复哈哈谁是俄方的身份', 'reply', '1', '299', null, '2016-08-23 15:52:23', '0', null);
INSERT INTO `yw_community_comments` VALUES ('356', '162', '嗯', 'reply', '1', '294', null, '2016-08-23 15:55:09', '0', null);
INSERT INTO `yw_community_comments` VALUES ('357', '162', '可以', 'reply', '1', '299', null, '2016-08-23 15:55:22', '0', null);
INSERT INTO `yw_community_comments` VALUES ('358', '162', '可以', 'reply', '1', '299', null, '2016-08-23 15:55:34', '0', null);
INSERT INTO `yw_community_comments` VALUES ('359', '146', '是', 'reply', '1', '255', null, '2016-08-23 16:09:17', '0', null);
INSERT INTO `yw_community_comments` VALUES ('360', '146', '时间', 'reply', '83', null, null, '2016-08-23 16:11:59', '0', null);
INSERT INTO `yw_community_comments` VALUES ('361', '146', '傻啊', 'reply', '83', '255', null, '2016-08-23 16:12:21', '0', null);
INSERT INTO `yw_community_comments` VALUES ('362', '146', '什么鬼', 'reply', '83', '255', null, '2016-08-23 16:12:40', '0', null);
INSERT INTO `yw_community_comments` VALUES ('363', '146', '啊', 'reply', '83', '255', null, '2016-08-23 16:12:49', '0', null);
INSERT INTO `yw_community_comments` VALUES ('364', '146', 'vdfg', 'reply', '83', '360', null, '2016-08-23 16:13:33', '0', null);
INSERT INTO `yw_community_comments` VALUES ('365', '146', '更好', 'reply', '83', '360', null, '2016-08-23 16:20:23', '0', null);
INSERT INTO `yw_community_comments` VALUES ('366', '146', '电饭锅', 'reply', '83', null, null, '2016-08-23 16:20:35', '0', null);
INSERT INTO `yw_community_comments` VALUES ('367', '146', '电饭锅', 'reply', '83', '366', null, '2016-08-23 16:20:42', '0', null);
INSERT INTO `yw_community_comments` VALUES ('368', '146', '我饿', 'reply', '83', '255', null, '2016-08-23 16:20:55', '0', null);
INSERT INTO `yw_community_comments` VALUES ('369', '146', '发', 'reply', '83', '255', null, '2016-08-23 16:21:42', '0', null);
INSERT INTO `yw_community_comments` VALUES ('370', '145', '456', 'reply', '83', '235', null, '2016-08-23 16:23:44', '0', null);
INSERT INTO `yw_community_comments` VALUES ('371', '145', '的身份', 'reply', '83', '235', null, '2016-08-23 16:24:50', '0', null);
INSERT INTO `yw_community_comments` VALUES ('372', '145', '史蒂夫', 'reply', '83', '235', null, '2016-08-23 16:26:42', '0', null);
INSERT INTO `yw_community_comments` VALUES ('373', '145', '1', 'reply', '83', '235', null, '2016-08-23 16:28:15', '0', null);
INSERT INTO `yw_community_comments` VALUES ('374', '145', '2', 'reply', '83', '235', null, '2016-08-23 16:31:55', '0', null);
INSERT INTO `yw_community_comments` VALUES ('375', '145', '3', 'reply', '83', '235', null, '2016-08-23 16:35:24', '0', null);
INSERT INTO `yw_community_comments` VALUES ('376', '145', '回复评论5', 'reply', '83', '235', null, '2016-08-23 16:36:41', '0', '372');
INSERT INTO `yw_community_comments` VALUES ('377', '145', '6', 'reply', '83', '235', null, '2016-08-23 16:40:36', '0', '372');
INSERT INTO `yw_community_comments` VALUES ('378', '145', '史', 'reply', '83', '235', null, '2016-08-23 16:41:15', '0', null);
INSERT INTO `yw_community_comments` VALUES ('379', '146', '发', 'reply', '1', '255', null, '2016-08-23 16:43:58', '0', null);
INSERT INTO `yw_community_comments` VALUES ('380', '145', '7', 'reply', '1', '235', null, '2016-08-23 16:44:16', '0', '372');
INSERT INTO `yw_community_comments` VALUES ('385', '145', '8', 'reply', '1', '235', null, '2016-08-23 21:13:27', '0', '380');
INSERT INTO `yw_community_comments` VALUES ('386', '145', '9', 'reply', '1', '235', null, '2016-08-23 21:13:38', '0', '370');
INSERT INTO `yw_community_comments` VALUES ('387', '145', '10', 'reply', '1', '235', null, '2016-08-23 21:13:45', '0', null);
INSERT INTO `yw_community_comments` VALUES ('388', '145', '1', 'reply', '1', '259', null, '2016-08-23 21:14:12', '0', null);
INSERT INTO `yw_community_comments` VALUES ('389', '145', '2', 'reply', '1', '259', null, '2016-08-23 21:14:27', '0', '388');
INSERT INTO `yw_community_comments` VALUES ('390', '17', '1213', 'reply', '1', null, null, '2016-08-23 21:14:50', '0', null);
INSERT INTO `yw_community_comments` VALUES ('391', '142', '789789', 'reply', '1', null, null, '2016-08-23 21:30:18', '0', null);
INSERT INTO `yw_community_comments` VALUES ('392', '142', '10', 'reply', '1', null, null, '2016-08-23 21:34:30', '0', null);
INSERT INTO `yw_community_comments` VALUES ('393', '142', '1', 'reply', '1', '295', null, '2016-08-23 21:35:05', '0', null);
INSERT INTO `yw_community_comments` VALUES ('394', '142', '2', 'reply', '1', '295', null, '2016-08-23 21:35:13', '0', '393');
INSERT INTO `yw_community_comments` VALUES ('395', '142', '3', 'reply', '1', '295', null, '2016-08-23 21:35:19', '0', '394');
INSERT INTO `yw_community_comments` VALUES ('396', '142', '23', 'reply', '1', '391', null, '2016-08-23 21:35:24', '0', null);
INSERT INTO `yw_community_comments` VALUES ('397', '142', '4', 'reply', '1', null, null, '2016-08-23 21:35:31', '0', null);
INSERT INTO `yw_community_comments` VALUES ('398', '142', '5', 'reply', '1', null, null, '2016-08-23 21:35:44', '0', null);
INSERT INTO `yw_community_comments` VALUES ('399', '142', '6', 'reply', '1', '397', null, '2016-08-23 21:36:27', '0', null);
INSERT INTO `yw_community_comments` VALUES ('400', '17', '发', 'reply', '1', null, null, '2016-08-24 09:25:25', '1', null);
INSERT INTO `yw_community_comments` VALUES ('401', '17', '1', 'reply', '1', null, null, '2016-08-24 09:25:43', '1', null);
INSERT INTO `yw_community_comments` VALUES ('402', '17', '1', 'reply', '1', null, null, '2016-08-24 09:25:43', '1', null);
INSERT INTO `yw_community_comments` VALUES ('403', '145', '好', 'reply', '1', null, null, '2016-08-24 09:31:34', '0', null);
INSERT INTO `yw_community_comments` VALUES ('404', '145', '好', 'reply', '1', null, null, '2016-08-24 09:31:48', '0', null);
INSERT INTO `yw_community_comments` VALUES ('405', '145', '7啥', 'reply', '1', '235', null, '2016-08-24 09:32:04', '0', '378');
INSERT INTO `yw_community_comments` VALUES ('406', '146', '1', 'reply', '1', '360', null, '2016-08-24 09:32:24', '0', null);
INSERT INTO `yw_community_comments` VALUES ('407', '146', '2', 'reply', '1', '360', null, '2016-08-24 09:32:32', '0', '406');
INSERT INTO `yw_community_comments` VALUES ('408', '146', '电饭煲', 'reply', '1', '366', null, '2016-08-24 09:32:51', '0', null);
INSERT INTO `yw_community_comments` VALUES ('409', '146', '可以', 'reply', '1', null, null, '2016-08-24 09:33:05', '0', null);
INSERT INTO `yw_community_comments` VALUES ('410', '146', '的', 'reply', '1', '366', null, '2016-08-24 09:33:17', '0', null);
INSERT INTO `yw_community_comments` VALUES ('411', '154', '好', 'reply', '1', '315', null, '2016-08-24 09:33:31', '0', null);
INSERT INTO `yw_community_comments` VALUES ('412', '154', '好', 'reply', '1', '315', null, '2016-08-24 09:33:40', '0', null);
INSERT INTO `yw_community_comments` VALUES ('413', '154', '饿', 'reply', '1', '296', null, '2016-08-24 09:33:48', '0', null);
INSERT INTO `yw_community_comments` VALUES ('414', '142', '发', 'reply', '1', '392', null, '2016-08-24 09:34:03', '0', null);
INSERT INTO `yw_community_comments` VALUES ('415', '142', '发', 'reply', '1', null, null, '2016-08-24 09:34:09', '0', null);
INSERT INTO `yw_community_comments` VALUES ('416', '16', '的', 'reply', '1', null, null, '2016-08-24 09:35:47', '0', null);
INSERT INTO `yw_community_comments` VALUES ('417', '16', '好', 'reply', '1', null, null, '2016-08-24 09:35:59', '0', null);
INSERT INTO `yw_community_comments` VALUES ('418', '16', '发方法', 'reply', '1', null, null, '2016-08-24 09:37:15', '0', null);
INSERT INTO `yw_community_comments` VALUES ('419', '16', '到发疯', 'reply', '1', null, null, '2016-08-24 09:37:27', '0', null);
INSERT INTO `yw_community_comments` VALUES ('420', '16', '史蒂夫', 'reply', '1', '416', null, '2016-08-24 09:37:34', '0', null);
INSERT INTO `yw_community_comments` VALUES ('421', '16', '史蒂夫', 'reply', '1', '416', null, '2016-08-24 09:37:38', '0', null);
INSERT INTO `yw_community_comments` VALUES ('422', '16', '史蒂夫', 'reply', '1', '416', null, '2016-08-24 09:37:41', '0', null);
INSERT INTO `yw_community_comments` VALUES ('423', '16', '史蒂夫', 'reply', '1', '416', null, '2016-08-24 09:37:45', '0', null);
INSERT INTO `yw_community_comments` VALUES ('424', '16', '史蒂夫', 'reply', '1', '417', null, '2016-08-24 09:37:49', '0', null);
INSERT INTO `yw_community_comments` VALUES ('425', '16', '史蒂夫', 'reply', '1', '418', null, '2016-08-24 09:38:01', '0', null);
INSERT INTO `yw_community_comments` VALUES ('426', '17', '好', 'reply', '1', null, null, '2016-08-24 09:38:22', '0', null);
INSERT INTO `yw_community_comments` VALUES ('427', '17', '123', 'reply', '1', '390', null, '2016-08-24 09:38:29', '0', null);
INSERT INTO `yw_community_comments` VALUES ('428', '17', '1', 'reply', '1', '390', null, '2016-08-24 09:43:20', '0', null);
INSERT INTO `yw_community_comments` VALUES ('429', '17', '1', 'reply', '1', '390', null, '2016-08-24 09:43:21', '0', null);
INSERT INTO `yw_community_comments` VALUES ('430', '17', '2', 'reply', '1', '390', null, '2016-08-24 09:43:47', '0', null);
INSERT INTO `yw_community_comments` VALUES ('431', '17', '3', 'reply', '1', '390', null, '2016-08-24 09:45:38', '0', null);
INSERT INTO `yw_community_comments` VALUES ('432', '17', '4', 'reply', '1', '390', null, '2016-08-24 09:47:14', '0', null);
INSERT INTO `yw_community_comments` VALUES ('433', '17', '5', 'reply', '1', '390', null, '2016-08-24 09:47:30', '0', null);
INSERT INTO `yw_community_comments` VALUES ('434', '17', '可以', 'reply', '1', null, null, '2016-08-24 10:00:20', '0', null);
INSERT INTO `yw_community_comments` VALUES ('435', '17', '1', 'reply', '1', '426', null, '2016-08-24 10:01:17', '0', null);
INSERT INTO `yw_community_comments` VALUES ('436', '17', '2', 'reply', '1', '426', null, '2016-08-24 10:02:05', '0', '435');
INSERT INTO `yw_community_comments` VALUES ('437', '145', '45345354', 'reply', '1', null, null, '2016-08-24 10:03:26', '0', null);
INSERT INTO `yw_community_comments` VALUES ('438', '145', '1', 'reply', '1', '237', null, '2016-08-24 10:03:38', '0', null);
INSERT INTO `yw_community_comments` VALUES ('439', '145', '2', 'reply', '1', '237', null, '2016-08-24 10:03:53', '0', null);
INSERT INTO `yw_community_comments` VALUES ('440', '145', '3', 'reply', '1', '237', null, '2016-08-24 10:04:08', '0', null);
INSERT INTO `yw_community_comments` VALUES ('441', '16', '3。', 'reply', '1', '419', null, '2016-08-24 10:04:24', '0', null);
INSERT INTO `yw_community_comments` VALUES ('442', '16', '3。', 'reply', '1', '419', null, '2016-08-24 10:04:30', '0', null);
INSERT INTO `yw_community_comments` VALUES ('443', '142', '3', 'reply', '1', '397', null, '2016-08-24 10:04:44', '0', '399');
INSERT INTO `yw_community_comments` VALUES ('444', '16', '3。3。', 'reply', '1', '418', null, '2016-08-24 10:04:56', '0', '425');
INSERT INTO `yw_community_comments` VALUES ('445', '16', '3。3。', 'reply', '1', '419', null, '2016-08-24 10:05:02', '0', '441');
INSERT INTO `yw_community_comments` VALUES ('446', '17', '3。3。3', 'reply', '1', '426', null, '2016-08-24 10:05:14', '0', '435');
INSERT INTO `yw_community_comments` VALUES ('447', '4', '3。3。3。', 'reply', '1', '44', null, '2016-08-24 10:05:28', '0', null);
INSERT INTO `yw_community_comments` VALUES ('448', '4', '3。', 'reply', '1', '44', null, '2016-08-24 10:05:39', '0', null);
INSERT INTO `yw_community_comments` VALUES ('449', '142', '12', 'reply', '1', '392', null, '2016-08-24 10:05:51', '0', '414');
INSERT INTO `yw_community_comments` VALUES ('450', '20', '出现', 'reply', '1', null, null, '2016-08-24 10:52:30', '1', null);
INSERT INTO `yw_community_comments` VALUES ('451', '20', '不会', 'reply', '1', null, null, '2016-08-24 10:52:36', '1', null);
INSERT INTO `yw_community_comments` VALUES ('452', '20', '1', 'reply', '1', '450', null, '2016-08-24 10:52:50', '1', null);
INSERT INTO `yw_community_comments` VALUES ('453', '20', '2', 'reply', '1', '450', null, '2016-08-24 10:52:58', '1', null);
INSERT INTO `yw_community_comments` VALUES ('454', '20', '3', 'reply', '1', '451', null, '2016-08-24 10:53:03', '1', null);
INSERT INTO `yw_community_comments` VALUES ('455', '20', '1', 'reply', '1', '450', null, '2016-08-24 10:53:11', '1', '452');
INSERT INTO `yw_community_comments` VALUES ('456', '20', '32', 'reply', '1', '451', null, '2016-08-24 10:53:18', '1', '454');
INSERT INTO `yw_community_comments` VALUES ('457', '17', '23', 'reply', '1', '400', null, '2016-08-24 10:53:34', '1', null);
INSERT INTO `yw_community_comments` VALUES ('458', '4', '1', 'reply', '1', '84', null, '2016-08-24 10:53:45', '1', null);
INSERT INTO `yw_community_comments` VALUES ('459', '4', '2', 'reply', '1', '84', null, '2016-08-24 10:53:52', '1', '458');
INSERT INTO `yw_community_comments` VALUES ('460', '145', '3', 'reply', '1', '259', null, '2016-08-24 10:54:06', '0', '389');
INSERT INTO `yw_community_comments` VALUES ('461', '18', '3', 'reply', '1', null, null, '2016-08-24 10:54:17', '0', null);
INSERT INTO `yw_community_comments` VALUES ('462', '18', '4', 'reply', '1', '461', null, '2016-08-24 10:54:24', '0', null);
INSERT INTO `yw_community_comments` VALUES ('463', '18', '4', 'reply', '1', '461', null, '2016-08-24 10:54:28', '0', null);
INSERT INTO `yw_community_comments` VALUES ('464', '162', '1', 'reply', '1', '290', null, '2016-08-24 10:54:38', '0', null);
INSERT INTO `yw_community_comments` VALUES ('465', '4', '1', 'reply', '1', '82', null, '2016-08-24 10:55:08', '0', null);
INSERT INTO `yw_community_comments` VALUES ('466', '20', null, 'like', '1', null, null, '2016-08-25 11:43:32', '1', null);
INSERT INTO `yw_community_comments` VALUES ('470', '21', null, 'like', '77', null, null, '2016-08-28 17:01:10', '1', null);
INSERT INTO `yw_community_comments` VALUES ('471', '20', null, 'like', '77', null, null, '2016-08-28 17:01:15', '1', null);
INSERT INTO `yw_community_comments` VALUES ('472', '17', null, 'like', '77', null, null, '2016-08-28 17:01:21', '1', null);
INSERT INTO `yw_community_comments` VALUES ('473', '16', null, 'like', '77', null, null, '2016-08-28 17:01:35', '1', null);
INSERT INTO `yw_community_comments` VALUES ('474', '18', null, 'like', '77', null, null, '2016-08-28 17:01:41', '1', null);
INSERT INTO `yw_community_comments` VALUES ('475', '20', null, 'like', '84', null, null, '2016-08-29 15:56:56', '1', null);
INSERT INTO `yw_community_comments` VALUES ('476', '21', null, 'like', '84', null, null, '2016-08-29 15:57:06', '1', null);
INSERT INTO `yw_community_comments` VALUES ('477', '22', null, 'like', '84', null, null, '2016-08-29 15:57:17', '1', null);
INSERT INTO `yw_community_comments` VALUES ('478', '22', '123', 'reply', '84', null, null, '2016-08-29 15:57:31', '1', null);
INSERT INTO `yw_community_comments` VALUES ('479', '18', null, 'like', '84', null, null, '2016-08-29 15:58:28', '1', null);
INSERT INTO `yw_community_comments` VALUES ('480', '23', null, 'like', '83', null, null, '2016-08-29 16:43:55', '1', null);
INSERT INTO `yw_community_comments` VALUES ('481', '21', null, 'like', '83', null, null, '2016-08-29 17:09:25', '1', null);
INSERT INTO `yw_community_comments` VALUES ('482', '24', null, 'like', '3', null, null, '2016-08-29 17:46:22', '1', null);
INSERT INTO `yw_community_comments` VALUES ('487', '25', null, 'like', '3', null, null, '2016-08-30 14:57:59', '1', null);
INSERT INTO `yw_community_comments` VALUES ('488', '20', null, 'like', '3', null, null, '2016-08-30 15:21:10', '1', null);
INSERT INTO `yw_community_comments` VALUES ('489', '21', null, 'like', '3', null, null, '2016-08-30 18:27:20', '1', null);
INSERT INTO `yw_community_comments` VALUES ('491', '27', null, 'like', '3', null, null, '2016-08-31 09:39:20', '1', null);
INSERT INTO `yw_community_comments` VALUES ('492', '31', null, 'like', '83', null, null, '2016-08-31 11:43:00', '1', null);
INSERT INTO `yw_community_comments` VALUES ('493', '31', null, 'like', '3', null, null, '2016-09-01 09:39:29', '1', null);
INSERT INTO `yw_community_comments` VALUES ('495', '30', null, 'like', '147', null, null, '2016-09-02 14:57:13', '1', null);
INSERT INTO `yw_community_comments` VALUES ('496', '30', '宇宛', 'reply', '147', null, null, '2016-09-02 14:57:25', '1', null);
INSERT INTO `yw_community_comments` VALUES ('497', '23', null, 'like', '1', null, null, '2016-09-02 17:33:11', '1', null);
INSERT INTO `yw_community_comments` VALUES ('499', '16', null, 'like', '1', null, null, '2016-09-02 17:33:25', '1', null);
INSERT INTO `yw_community_comments` VALUES ('500', '22', null, 'like', '1', null, null, '2016-09-02 17:35:20', '1', null);
INSERT INTO `yw_community_comments` VALUES ('501', '33', null, 'like', '1', null, null, '2016-09-03 18:15:47', '1', null);
INSERT INTO `yw_community_comments` VALUES ('502', '33', 'Resghh ccvbfbb fcvnkyt', 'reply', '1', null, null, '2016-09-04 10:26:16', '1', null);
INSERT INTO `yw_community_comments` VALUES ('503', '33', null, 'like', '147', null, null, '2016-09-07 09:36:45', '1', null);
INSERT INTO `yw_community_comments` VALUES ('504', '26', null, 'like', '147', null, null, '2016-09-13 14:40:54', '1', null);
INSERT INTO `yw_community_comments` VALUES ('505', '25', null, 'like', '83', null, null, '2016-10-12 18:26:20', '1', null);
INSERT INTO `yw_community_comments` VALUES ('506', '20', null, 'like', '83', null, null, '2016-10-12 18:26:28', '1', null);
INSERT INTO `yw_community_comments` VALUES ('507', '34', null, 'like', '83', null, null, '2016-10-12 18:28:13', '1', null);
INSERT INTO `yw_community_comments` VALUES ('508', '24', 'hhh\n啦啦啦啦啦', 'reply', '79', null, null, '2016-10-13 11:15:42', '1', null);

-- ----------------------------
-- Table structure for yw_community_post
-- ----------------------------
DROP TABLE IF EXISTS `yw_community_post`;
CREATE TABLE `yw_community_post` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `comm_id` int(10) DEFAULT NULL COMMENT '圈子ID',
  `user_id` int(10) DEFAULT NULL COMMENT '用户ID',
  `content` text COMMENT '内容',
  `images` text,
  `status` enum('disabled','enabled') DEFAULT 'enabled' COMMENT '状态：enabled表示正常disabled表示冻结不显示',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  `source` varchar(255) DEFAULT NULL,
  `comments` int(10) DEFAULT '0',
  `views` int(10) DEFAULT '0',
  `likes` int(10) DEFAULT '0',
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=179 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yw_community_post
-- ----------------------------
INSERT INTO `yw_community_post` VALUES ('169', '33', '1', '圈子为21的动态', 'http://oaqx2e3yr.bkt.clouddn.com/Group1471835953,http://oaqx2e3yr.bkt.clouddn.com/Active14715049044,http://oaqx2e3yr.bkt.clouddn.com/Active14722002961,http://oaqx2e3yr.bkt.clouddn.com/Active14714876074,http://oaqx2e3yr.bkt.clouddn.com/Active14714876076,http://oaqx2e3yr.bkt.clouddn.com/Active14715049044,http://oaqx2e3yr.bkt.clouddn.com/Active14722002961,http://oaqx2e3yr.bkt.clouddn.com/Active14714876074,http://oaqx2e3yr.bkt.clouddn.com/Active14714876076', 'enabled', '2010-08-08 00:00:00', '33', '0', '0', '0', null);
INSERT INTO `yw_community_post` VALUES ('6', '1', '2', 'HelloiOS', 'http://78re52.com1.z0.glb.clouddn.com/resource/gogopher.jpg?imageView2/1/w/200/h/200', 'enabled', '2008-08-08 00:00:00', null, '3', '0', '1', null);
INSERT INTO `yw_community_post` VALUES ('7', '1', '2', 'HelloiOS', 'http://78re52.com1.z0.glb.clouddn.com/resource/gogopher.jpg?imageView2/1/w/200/h/200', 'enabled', '2008-08-08 00:00:00', null, '2', '0', '0', null);
INSERT INTO `yw_community_post` VALUES ('8', '1', '3', 'HelloiOS', 'http://78re52.com1.z0.glb.clouddn.com/resource/gogopher.jpg?imageView2/1/w/200/h/200', 'enabled', '2008-08-08 00:00:00', null, '0', '0', '1', null);
INSERT INTO `yw_community_post` VALUES ('10', '1', '4', 'HelloiOS', 'http://78re52.com1.z0.glb.clouddn.com/resource/gogopher.jpg?imageView2/1/w/200/h/200', 'enabled', '2008-08-08 00:00:00', null, '0', '0', '0', null);
INSERT INTO `yw_community_post` VALUES ('11', '1', '4', 'HelloiOS', 'http://78re52.com1.z0.glb.clouddn.com/resource/gogopher.jpg?imageView2/1/w/200/h/200', 'enabled', '2008-08-08 00:00:00', null, '0', '0', '0', null);
INSERT INTO `yw_community_post` VALUES ('12', '1', '5', 'HelloiOS', 'http://78re52.com1.z0.glb.clouddn.com/resource/gogopher.jpg?imageView2/1/w/200/h/200', 'enabled', '2008-08-08 00:00:00', null, '0', '0', '0', null);
INSERT INTO `yw_community_post` VALUES ('170', '21', '1', '圈子为21的动态', 'http://oaqx2e3yr.bkt.clouddn.com/Group1471835953,http://oaqx2e3yr.bkt.clouddn.com/Active14715049044,http://oaqx2e3yr.bkt.clouddn.com/Active14722002961,http://oaqx2e3yr.bkt.clouddn.com/Active14714876074,http://oaqx2e3yr.bkt.clouddn.com/Active14714876076,http://oaqx2e3yr.bkt.clouddn.com/Active14715049044,http://oaqx2e3yr.bkt.clouddn.com/Active14722002961,http://oaqx2e3yr.bkt.clouddn.com/Active14714876074,http://oaqx2e3yr.bkt.clouddn.com/Active14714876076', 'enabled', '2010-08-08 00:00:00', '21', '0', '0', '0', null);
INSERT INTO `yw_community_post` VALUES ('166', '21', '1', '圈子为21的动态', 'http://78re52.com1.z0.glb.clouddn.com/resource/gogopher.jpg?imageView2/1/w/200/h/200', 'enabled', '2010-08-08 00:00:00', '21', '0', '0', '0', null);
INSERT INTO `yw_community_post` VALUES ('168', '33', '1', '圈子为21的动态', 'http://oaqx2e3yr.bkt.clouddn.com/Active14715049044,http://oaqx2e3yr.bkt.clouddn.com/Active14722002961,http://oaqx2e3yr.bkt.clouddn.com/Active14714876074,http://oaqx2e3yr.bkt.clouddn.com/Active14714876076', 'enabled', '2010-08-08 00:00:00', '33', '0', '0', '0', null);
INSERT INTO `yw_community_post` VALUES ('19', '1', '2', 'Hello', 'http://78re52.com1.z0.glb.clouddn.com/resource/gogopher.jpg?imageView2/1/w/200/h/200', 'enabled', '2008-08-08 00:00:00', null, '0', '0', '0', null);
INSERT INTO `yw_community_post` VALUES ('20', '1', '3', 'Hello', 'http://78re52.com1.z0.glb.clouddn.com/resource/gogopher.jpg?imageView2/1/w/200/h/200', 'enabled', '2008-08-08 00:00:00', null, '0', '0', '0', null);
INSERT INTO `yw_community_post` VALUES ('21', '1', '3', 'Hello', 'http://78re52.com1.z0.glb.clouddn.com/resource/gogopher.jpg?imageView2/1/w/200/h/200', 'enabled', '2008-08-08 00:00:00', null, '0', '0', '0', null);
INSERT INTO `yw_community_post` VALUES ('167', '21', '1', '圈子为21的动态', 'http://oaqx2e3yr.bkt.clouddn.com/Active14715049044,http://oaqx2e3yr.bkt.clouddn.com/Active14722002961,http://oaqx2e3yr.bkt.clouddn.com/Active14714876074,http://oaqx2e3yr.bkt.clouddn.com/Active14714876076', 'enabled', '2010-08-08 00:00:00', '21', '0', '0', '0', null);
INSERT INTO `yw_community_post` VALUES ('142', '1', '1', '123123', '', 'enabled', '2016-08-17 10:25:08', '1', '14', '0', '0', null);
INSERT INTO `yw_community_post` VALUES ('119', '1', '2', '9', 'http://78re52.com1.z0.glb.clouddn.com/resource/gogopher.jpg?imageView2/1/w/200/h/200', 'enabled', '2016-08-12 00:00:00', '1', '3', '0', '0', null);
INSERT INTO `yw_community_post` VALUES ('120', '1', '3', '9', 'http://78re52.com1.z0.glb.clouddn.com/resource/gogopher.jpg?imageView2/1/w/200/h/200', 'enabled', '2016-08-12 00:00:00', '1', '1', '0', '2', null);
INSERT INTO `yw_community_post` VALUES ('162', '1', '1', '饿啊', 'http://oaqx2e3yr.bkt.clouddn.com/Active14714875840,http://oaqx2e3yr.bkt.clouddn.com/Active14714876031,http://oaqx2e3yr.bkt.clouddn.com/Active14714876074,http://oaqx2e3yr.bkt.clouddn.com/Active14714876032,http://oaqx2e3yr.bkt.clouddn.com/Active14714876033,http://oaqx2e3yr.bkt.clouddn.com/Active14714876076,http://oaqx2e3yr.bkt.clouddn.com/Active14714876075,http://oaqx2e3yr.bkt.clouddn.com/Active14714876078,http://oaqx2e3yr.bkt.clouddn.com/Active14714876077', 'enabled', '2016-08-18 10:33:04', '1', '9', '0', '0', null);
INSERT INTO `yw_community_post` VALUES ('145', '1', '1', 'Hi.  12345678991234567897000000.  Hahahahahahhaahhahahahahahahahahahaha', '', 'enabled', '2016-08-17 17:39:47', '1', '27', '0', '1', null);
INSERT INTO `yw_community_post` VALUES ('146', '1', '1', 'Huang zhengwei.   Nishibushisha. Hahahahahahhahahhahahahahahahh', '', 'enabled', '2016-08-17 17:41:31', '1', '18', '0', '1', null);
INSERT INTO `yw_community_post` VALUES ('154', '1', '1', '哈哈', '', 'enabled', '2016-08-17 21:24:14', '1', '17', '0', '1', null);
INSERT INTO `yw_community_post` VALUES ('171', '33', '1', '圈子为21的动态', 'http://oaqx2e3yr.bkt.clouddn.com/Group1471835953,http://oaqx2e3yr.bkt.clouddn.com/Active14715049044,http://oaqx2e3yr.bkt.clouddn.com/Active14722002961,http://oaqx2e3yr.bkt.clouddn.com/Active14714876074,http://oaqx2e3yr.bkt.clouddn.com/Active14714876076,http://oaqx2e3yr.bkt.clouddn.com/Active14715049044,http://oaqx2e3yr.bkt.clouddn.com/Active14714876076', 'enabled', '2016-08-08 00:00:00', '33', '0', '0', '0', null);
INSERT INTO `yw_community_post` VALUES ('172', '34', '83', 'qqq', '', 'enabled', '2016-08-29 16:37:47', '34', '0', '0', '0', null);
INSERT INTO `yw_community_post` VALUES ('173', '35', '83', 'PSP', '', 'enabled', '2016-08-29 16:38:13', '35', '0', '0', '0', null);
INSERT INTO `yw_community_post` VALUES ('174', '34', '84', '…', '', 'enabled', '2016-08-31 10:19:44', '34', '0', '0', '0', null);
INSERT INTO `yw_community_post` VALUES ('176', '16', '1', '发动态试试', 'http://oaqx2e3yr.bkt.clouddn.com/Active14726354670', 'enabled', '2016-08-31 17:24:27', '16', '0', '0', '0', null);
INSERT INTO `yw_community_post` VALUES ('177', '1', '1', '1111111', '', 'enabled', '2016-09-18 00:00:00', '1', '0', '0', '0', null);
INSERT INTO `yw_community_post` VALUES ('178', '1', '1', '1111111', '', 'enabled', '2016-09-18 00:00:00', '1', '0', '0', '0', '洛阳市涧西区');

-- ----------------------------
-- Table structure for yw_community_users
-- ----------------------------
DROP TABLE IF EXISTS `yw_community_users`;
CREATE TABLE `yw_community_users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL COMMENT '用户ID',
  `comm_id` int(10) DEFAULT NULL,
  `status` enum('close','open') DEFAULT 'open' COMMENT '状态：open表示正常close禁言，禁言的时候如果需要说明原因remark',
  `add_time` datetime DEFAULT NULL COMMENT '加入时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yw_community_users
-- ----------------------------
INSERT INTO `yw_community_users` VALUES ('3', '1', '17', 'open', '2016-08-11 22:43:33', '圈子创建者');
INSERT INTO `yw_community_users` VALUES ('4', '1', '21', 'open', '2016-08-12 10:21:41', '圈子创建者');
INSERT INTO `yw_community_users` VALUES ('22', '1', '25', 'open', '2016-08-25 19:05:49', '圈子创建者');
INSERT INTO `yw_community_users` VALUES ('6', '1', '32', 'open', '2016-08-15 16:06:12', '圈子创建者');
INSERT INTO `yw_community_users` VALUES ('23', '1', '38', 'open', '2016-08-26 16:07:13', '圈子创建者');
INSERT INTO `yw_community_users` VALUES ('21', '1', '33', 'open', '2016-08-25 17:54:34', '圈子创建者');
INSERT INTO `yw_community_users` VALUES ('9', '77', '17', 'open', '2016-08-15 16:17:51', '圈子创建者');
INSERT INTO `yw_community_users` VALUES ('10', '77', '21', 'open', '2016-08-15 18:42:42', '圈子创建者');
INSERT INTO `yw_community_users` VALUES ('11', '77', '25', 'open', '2016-08-17 16:31:18', '圈子创建者');
INSERT INTO `yw_community_users` VALUES ('12', '77', '32', 'open', '2016-08-17 21:05:56', '圈子创建者');
INSERT INTO `yw_community_users` VALUES ('18', '77', '33', 'open', '2016-08-23 10:00:08', '圈子创建者');
INSERT INTO `yw_community_users` VALUES ('17', '79', '17', 'open', '2016-08-22 09:40:24', '圈子创建者');
INSERT INTO `yw_community_users` VALUES ('19', '79', '21', 'open', '2016-08-23 10:45:56', '圈子创建者');
INSERT INTO `yw_community_users` VALUES ('16', '79', '25', 'open', '2016-08-21 15:52:28', '圈子创建者');
INSERT INTO `yw_community_users` VALUES ('20', '79', '32', 'open', '2016-08-23 10:51:47', '圈子创建者');
INSERT INTO `yw_community_users` VALUES ('24', '1', '39', 'open', '2016-08-26 16:11:44', '圈子创建者');
INSERT INTO `yw_community_users` VALUES ('25', '1', '40', 'open', '2016-08-26 16:13:43', '圈子创建者');
INSERT INTO `yw_community_users` VALUES ('26', '1', '41', 'open', '2016-08-26 16:15:10', '圈子创建者');
INSERT INTO `yw_community_users` VALUES ('27', '1', '42', 'open', '2016-08-26 16:15:54', '圈子创建者');
INSERT INTO `yw_community_users` VALUES ('28', '1', '43', 'open', '2016-08-26 16:16:19', '圈子创建者');
INSERT INTO `yw_community_users` VALUES ('29', '1', '44', 'open', '2016-08-26 16:16:39', '圈子创建者');
INSERT INTO `yw_community_users` VALUES ('30', '1', '45', 'open', '2016-08-26 16:18:34', '圈子创建者');
INSERT INTO `yw_community_users` VALUES ('31', '1', '46', 'open', '2016-08-26 16:19:13', '圈子创建者');
INSERT INTO `yw_community_users` VALUES ('32', '1', '47', 'open', '2016-08-28 18:27:12', '圈子创建者');
INSERT INTO `yw_community_users` VALUES ('33', '1', '48', 'open', '2016-08-29 10:09:38', '圈子创建者');
INSERT INTO `yw_community_users` VALUES ('34', '1', '49', 'open', '2016-08-29 10:15:48', '圈子创建者');
INSERT INTO `yw_community_users` VALUES ('35', '1', '50', 'open', '2016-08-29 15:37:49', '圈子创建者');
INSERT INTO `yw_community_users` VALUES ('36', '1', '51', 'open', '2016-08-29 15:40:03', '圈子创建者');
INSERT INTO `yw_community_users` VALUES ('37', '1', '52', 'open', '2016-08-29 15:49:28', '圈子创建者');
INSERT INTO `yw_community_users` VALUES ('38', '1', '53', 'open', '2016-08-30 20:02:34', '圈子创建者');
INSERT INTO `yw_community_users` VALUES ('39', '1', '54', 'open', '2016-08-30 20:06:39', '圈子创建者');
INSERT INTO `yw_community_users` VALUES ('40', '1', '55', 'open', '2016-08-30 20:14:17', '圈子创建者');
INSERT INTO `yw_community_users` VALUES ('41', '1', '56', 'open', '2016-08-31 10:11:28', '圈子创建者');
INSERT INTO `yw_community_users` VALUES ('42', '1', '57', 'open', '2016-08-31 10:22:25', '圈子创建者');
INSERT INTO `yw_community_users` VALUES ('43', '1', '58', 'open', '2016-08-31 12:05:52', '圈子创建者');
INSERT INTO `yw_community_users` VALUES ('44', '84', '40', 'open', '2016-08-31 15:48:39', null);
INSERT INTO `yw_community_users` VALUES ('50', '1', '59', 'open', '2016-08-31 16:23:07', '圈子创建者');
INSERT INTO `yw_community_users` VALUES ('46', '84', '35', 'open', '2016-08-31 16:01:47', null);
INSERT INTO `yw_community_users` VALUES ('47', '84', '16', 'open', '2016-08-31 16:04:38', null);
INSERT INTO `yw_community_users` VALUES ('48', '84', '21', 'open', '2016-08-31 16:06:17', null);
INSERT INTO `yw_community_users` VALUES ('49', '84', '36', 'open', '2016-08-31 16:08:56', null);
INSERT INTO `yw_community_users` VALUES ('51', '1', '60', 'open', '2016-08-31 16:40:26', '圈子创建者');
INSERT INTO `yw_community_users` VALUES ('52', '1', '61', 'open', '2016-08-31 18:53:57', '圈子创建者');
INSERT INTO `yw_community_users` VALUES ('53', '1', '62', 'open', '2016-09-01 09:41:07', '圈子创建者');
INSERT INTO `yw_community_users` VALUES ('54', '1', '63', 'open', '2016-09-01 10:53:36', '圈子创建者');
INSERT INTO `yw_community_users` VALUES ('55', '1', '64', 'open', '2016-09-01 13:10:18', '圈子创建者');
INSERT INTO `yw_community_users` VALUES ('56', '84', '65', 'open', '2016-09-01 16:51:25', '圈子创建者');
INSERT INTO `yw_community_users` VALUES ('57', '1', '66', 'open', '2016-09-01 16:55:53', '圈子创建者');
INSERT INTO `yw_community_users` VALUES ('58', '1', '67', 'open', '2016-09-01 18:24:01', '圈子创建者');
INSERT INTO `yw_community_users` VALUES ('59', '1', '68', 'open', '2016-09-01 18:39:39', '圈子创建者');

-- ----------------------------
-- Table structure for yw_games
-- ----------------------------
DROP TABLE IF EXISTS `yw_games`;
CREATE TABLE `yw_games` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) DEFAULT NULL COMMENT '游戏标题',
  `description` varchar(255) DEFAULT NULL COMMENT '游戏描述',
  `thumb` varchar(255) DEFAULT NULL COMMENT '游戏缩略图',
  `icon` varchar(255) DEFAULT NULL,
  `player_max` int(10) DEFAULT NULL,
  `player_min` int(10) DEFAULT NULL,
  `prize_max` decimal(10,2) DEFAULT NULL,
  `prize_min` decimal(10,2) DEFAULT NULL,
  `add_time` datetime DEFAULT NULL COMMENT '游戏添加时间',
  `times` int(10) DEFAULT NULL COMMENT '场次',
  `bgimage` varchar(255) DEFAULT NULL COMMENT '背景图',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yw_games
-- ----------------------------
INSERT INTO `yw_games` VALUES ('5', '魔兽世界', '魔兽世界', 'http://oaqx2e3yr.bkt.clouddn.com/57c3f5ded1475.jpg', null, '10', '6', '500.00', '100.00', '2016-07-27 21:59:13', '5', null);
INSERT INTO `yw_games` VALUES ('6', 'LOL英雄联盟', '23124', 'http://oaqx2e3yr.bkt.clouddn.com/57c3f41d1be79.jpg', null, '6', '2', '200.00', '100.00', null, '10', null);
INSERT INTO `yw_games` VALUES ('7', '魔兽争霸', '125236236', 'http://oaqx2e3yr.bkt.clouddn.com/57c3f6a0267f9.jpg', null, '10', null, '400.00', '200.00', null, '5', null);
INSERT INTO `yw_games` VALUES ('8', '斗地主', '斗地主', 'http://oaqx2e3yr.bkt.clouddn.com/57c3f71d32875.jpg', null, '10', null, '300.00', '100.00', null, '5', 'http://oaqx2e3yr.bkt.clouddn.com/57b57850d68ca.jpg');
INSERT INTO `yw_games` VALUES ('9', '守望先锋', '守望先锋', 'http://oaqx2e3yr.bkt.clouddn.com/57b575f7d0415.jpeg', null, '12', null, '500.00', '300.00', null, '5', 'http://oaqx2e3yr.bkt.clouddn.com/57b577e4918be.jpg');
INSERT INTO `yw_games` VALUES ('10', 'Dota2', 'Dota2', 'http://oaqx2e3yr.bkt.clouddn.com/57b57627b1f64.jpg', null, '10', null, '1000.00', '200.00', null, '5', 'http://oaqx2e3yr.bkt.clouddn.com/57b5770035178.jpg');
INSERT INTO `yw_games` VALUES ('11', '使命召唤online', '', 'http://oaqx2e3yr.bkt.clouddn.com/57c3f79a87031.jpg', null, '20', null, '100.00', '2.00', null, '1', null);
INSERT INTO `yw_games` VALUES ('12', '炉石传说', '', 'http://oaqx2e3yr.bkt.clouddn.com/57c3f7e6705c7.jpg', null, '2', null, '20.00', '1.00', null, '10', null);
INSERT INTO `yw_games` VALUES ('13', '风暴英雄', '', 'http://oaqx2e3yr.bkt.clouddn.com/57c3f8ea8bf5e.jpg', null, '20', null, '1000.00', '10.00', null, '2', null);
INSERT INTO `yw_games` VALUES ('14', '星际争霸2', '', 'http://oaqx2e3yr.bkt.clouddn.com/57c3f90ae7aa3.jpg', null, '10', null, '200.00', '5.00', null, '6', null);

-- ----------------------------
-- Table structure for yw_goods
-- ----------------------------
DROP TABLE IF EXISTS `yw_goods`;
CREATE TABLE `yw_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) DEFAULT NULL COMMENT '商品标题',
  `num` int(11) DEFAULT '0' COMMENT '库存',
  `image` varchar(255) DEFAULT NULL COMMENT '图片封面',
  `summary` varchar(255) DEFAULT NULL COMMENT '描述',
  `payMoney` decimal(10,2) DEFAULT '0.00',
  `price` decimal(10,2) DEFAULT '0.00',
  `sales` int(10) DEFAULT '0' COMMENT '销量',
  `details` text COMMENT '图文详情',
  `cdkey` text COMMENT '商品兑换码',
  `url` varchar(255) DEFAULT NULL COMMENT '商品兑换链接',
  `add_time` datetime DEFAULT NULL,
  `images` varchar(255) DEFAULT NULL COMMENT '图片集',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yw_goods
-- ----------------------------
INSERT INTO `yw_goods` VALUES ('1', '天下激活码', '1', 'http://picm.photophoto.cn/005/008/007/0080071498.jpg', '天下手游内测激活码', '100.00', '105.00', '3', '<span>厉害</span>', '44', 'http://163.com', '2016-08-24 14:49:26', 'http://121.42.172.61/public/images/defaultAvatar.png,http://121.42.172.61/public/images/defaultAvatar.png,http://121.42.172.61/public/images/defaultAvatar.png');

-- ----------------------------
-- Table structure for yw_log
-- ----------------------------
DROP TABLE IF EXISTS `yw_log`;
CREATE TABLE `yw_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `log` varchar(255) DEFAULT NULL COMMENT '操作描述',
  `add_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yw_log
-- ----------------------------
INSERT INTO `yw_log` VALUES ('1', '[自动关闭游戏桌]2016-08-03 17:08:05,系统定时器关闭已到规定时间，人数不足的游戏桌1,9,7,11,12(数字代表任务id)', '2016-08-03 17:08:05');
INSERT INTO `yw_log` VALUES ('2', '[自动关闭游戏桌]2016-08-03 17:09:29,系统定时器关闭已到规定时间，人数不足的游戏桌1,8,9,7,10,11,12(数字代表任务id)', '2016-08-03 17:09:29');

-- ----------------------------
-- Table structure for yw_messages
-- ----------------------------
DROP TABLE IF EXISTS `yw_messages`;
CREATE TABLE `yw_messages` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL COMMENT '用户ID',
  `message` varchar(255) DEFAULT NULL COMMENT '消息内容',
  `type` enum('payment','message','join') DEFAULT NULL COMMENT '消息类型：join添加好友验证，message普通消息，payment支付消息',
  `status` enum('reject','pedding','accept') DEFAULT NULL COMMENT '状态：accept同意，reject拒绝pedding带审核',
  `do_action` tinyint(1) DEFAULT '0' COMMENT '动作（24）：表示当前用户是否处理该条信息，默认是0，当用户打开这个消息查看，则修改值为1',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  `from_user` int(10) DEFAULT NULL COMMENT '添加好友时的来源用户id',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yw_messages
-- ----------------------------
INSERT INTO `yw_messages` VALUES ('44', '5', '123', 'join', 'reject', '0', '2016-08-22 19:02:09', '1', '123');
INSERT INTO `yw_messages` VALUES ('45', '1', '123', 'join', 'accept', '0', '2016-08-22 19:22:17', '83', '');
INSERT INTO `yw_messages` VALUES ('46', '54', '888', 'join', 'accept', '0', '2016-08-22 20:03:37', '1', '');
INSERT INTO `yw_messages` VALUES ('47', '67', '123', 'join', 'accept', '0', '2016-08-24 17:54:14', '1', '');
INSERT INTO `yw_messages` VALUES ('48', '77', '123', 'join', 'reject', '0', '2016-08-24 17:57:54', '1', 'buxihuan');
INSERT INTO `yw_messages` VALUES ('49', '1', '123', 'join', 'reject', '0', '2016-08-24 17:58:55', '77', 'buxihuan');
INSERT INTO `yw_messages` VALUES ('50', '47', '123', 'join', 'accept', '0', '2016-08-24 19:24:17', '67', '');
INSERT INTO `yw_messages` VALUES ('51', '1', '123', 'join', 'reject', '0', '2016-08-24 19:47:49', '46', 'heheh');
INSERT INTO `yw_messages` VALUES ('52', '84', 'a', 'join', 'pedding', '0', '2016-08-24 20:05:25', '67', null);
INSERT INTO `yw_messages` VALUES ('53', '1', '1111', 'join', 'accept', '0', '2016-08-24 20:12:25', '84', '');
INSERT INTO `yw_messages` VALUES ('54', '47', '111', 'join', 'pedding', '0', '2016-08-24 20:17:43', '1', null);
INSERT INTO `yw_messages` VALUES ('55', '83', '二货', 'join', 'reject', '0', '2016-08-25 10:22:19', '84', '111');
INSERT INTO `yw_messages` VALUES ('56', '84', '', 'join', 'reject', '0', '2016-08-25 15:46:05', '77', '2');
INSERT INTO `yw_messages` VALUES ('57', '79', 'Assa', 'join', 'pedding', '0', '2016-08-25 15:46:47', '77', null);
INSERT INTO `yw_messages` VALUES ('58', '1', '1', 'join', 'reject', '0', '2016-08-25 16:42:32', '5', '123');
INSERT INTO `yw_messages` VALUES ('59', '5', '3636', 'join', 'reject', '0', '2016-08-25 16:55:22', '46', '不喜欢');
INSERT INTO `yw_messages` VALUES ('60', '5', null, 'join', 'accept', '0', '2016-08-25 16:58:58', '1', '');
INSERT INTO `yw_messages` VALUES ('61', '5', 'o o o', 'join', 'accept', '0', '2016-08-25 17:09:13', '47', '');
INSERT INTO `yw_messages` VALUES ('62', '47', '我', 'join', 'pedding', '0', '2016-08-25 17:33:37', '54', null);
INSERT INTO `yw_messages` VALUES ('63', '54', 'I', 'join', 'pedding', '0', '2016-08-25 17:34:52', '47', null);
INSERT INTO `yw_messages` VALUES ('64', '67', '135693', 'join', 'accept', '0', '2016-08-25 18:46:07', '83', '');
INSERT INTO `yw_messages` VALUES ('65', '5', '8', 'join', 'accept', '0', '2016-08-25 19:14:06', '67', '');
INSERT INTO `yw_messages` VALUES ('66', '5', '111111', 'join', 'accept', '0', '2016-08-25 19:36:52', '119', '');
INSERT INTO `yw_messages` VALUES ('67', '5', '999', 'join', 'reject', '0', '2016-08-25 19:54:10', '83', '空军');
INSERT INTO `yw_messages` VALUES ('68', '67', '123456789', 'join', 'accept', '0', '2016-08-26 11:02:02', '46', '');
INSERT INTO `yw_messages` VALUES ('69', '67', '你是', 'join', 'accept', '0', '2016-08-26 11:12:21', '47', '');
INSERT INTO `yw_messages` VALUES ('70', '77', '在', 'join', 'reject', '0', '2016-08-28 16:17:06', '1', '，');
INSERT INTO `yw_messages` VALUES ('71', '77', '在', 'join', 'accept', '0', '2016-08-28 16:23:06', '1', '');
INSERT INTO `yw_messages` VALUES ('72', '77', '12111', 'join', 'accept', '0', '2016-08-28 16:32:25', '119', '');
INSERT INTO `yw_messages` VALUES ('73', '77', '', 'join', 'reject', '0', '2016-08-28 16:44:20', '84', '2');
INSERT INTO `yw_messages` VALUES ('74', '77', '', 'join', 'reject', '0', '2016-08-28 16:48:02', '84', '。');
INSERT INTO `yw_messages` VALUES ('75', '77', '不', 'join', 'reject', '0', '2016-08-28 16:51:32', '84', '。');
INSERT INTO `yw_messages` VALUES ('76', '77', '', 'join', 'accept', '0', '2016-08-28 16:57:12', '5', '');
INSERT INTO `yw_messages` VALUES ('77', '1', '', 'join', 'accept', '0', '2016-08-28 16:57:58', '77', '');
INSERT INTO `yw_messages` VALUES ('78', '5', '', 'join', 'accept', '0', '2016-08-28 16:58:04', '77', '');
INSERT INTO `yw_messages` VALUES ('79', '46', '', 'join', 'reject', '0', '2016-08-28 16:58:07', '77', '');
INSERT INTO `yw_messages` VALUES ('80', '47', '', 'join', 'pedding', '0', '2016-08-28 16:58:10', '77', null);
INSERT INTO `yw_messages` VALUES ('81', '119', '', 'join', 'pedding', '0', '2016-08-28 16:58:19', '77', null);
INSERT INTO `yw_messages` VALUES ('82', '77', '', 'join', 'reject', '0', '2016-08-28 17:06:30', '67', '');
INSERT INTO `yw_messages` VALUES ('83', '1', '55555', 'join', 'pedding', '0', '2016-09-10 17:31:33', '67', null);

-- ----------------------------
-- Table structure for yw_money
-- ----------------------------
DROP TABLE IF EXISTS `yw_money`;
CREATE TABLE `yw_money` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `sn` varchar(30) DEFAULT NULL COMMENT '流水号',
  `user_id` int(10) DEFAULT NULL COMMENT '转账人ID',
  `money` decimal(10,2) DEFAULT NULL COMMENT '收入金额',
  `balance` decimal(10,2) DEFAULT NULL COMMENT '实时金额',
  `type` enum('prize','recharge','transfer','payment') DEFAULT NULL COMMENT '类型（16）：payment表示在线支付，transfer转账，recharge充值，prize奖金（网吧支付给赢方）',
  `pay_type` enum('wx','alipay','paymoney') DEFAULT NULL COMMENT '支付方式：alipay表示支付宝支付，wx表示微信支付',
  `pay_status` enum('fail','success','pedding') DEFAULT 'pedding' COMMENT '支付状态：pedding待支付success支付成功fail支付失败',
  `status` enum('cancel','done','pedding') DEFAULT NULL COMMENT '收款状态：表示收款方确认状态pedding等待确认，done已确认，cancel取消',
  `add_time` datetime DEFAULT NULL COMMENT '时间',
  `agent` int(11) DEFAULT NULL COMMENT '代人充值：即存放网吧管理员ID，网吧管理员可以替玩家充值',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `war_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yw_money
-- ----------------------------
INSERT INTO `yw_money` VALUES ('1', '12312312132123', '79', '100.00', '50.00', 'recharge', 'alipay', 'success', 'done', '2016-07-29 03:10:52', null, '用户通过支付宝充值', null);
INSERT INTO `yw_money` VALUES ('2', null, '1', '10.00', null, '', null, 'success', 'done', '2016-08-13 16:12:01', null, '签到奖励', null);
INSERT INTO `yw_money` VALUES ('3', null, '1', '10.00', null, '', null, 'success', 'done', '2016-08-15 10:32:24', null, '签到奖励', null);
INSERT INTO `yw_money` VALUES ('4', null, '1', '10.00', null, '', null, 'success', 'done', '2016-08-15 10:34:18', null, '签到奖励', null);
INSERT INTO `yw_money` VALUES ('5', null, '1', '10.00', null, '', null, 'success', 'done', '2016-08-15 17:03:40', null, '签到奖励', null);
INSERT INTO `yw_money` VALUES ('6', null, '1', '10.00', null, '', null, 'success', 'done', '2016-08-15 17:05:13', null, '签到奖励', null);
INSERT INTO `yw_money` VALUES ('7', null, '1', '10.00', null, '', null, 'success', 'done', '2016-08-15 18:25:28', null, '签到奖励', null);
INSERT INTO `yw_money` VALUES ('8', null, '1', '10.00', null, '', null, 'success', 'done', '2016-08-15 18:34:31', null, '签到奖励', null);
INSERT INTO `yw_money` VALUES ('9', null, '1', '10.00', null, '', null, 'success', 'done', '2016-08-15 18:40:00', null, '签到奖励', null);
INSERT INTO `yw_money` VALUES ('10', null, '1', '10.00', null, '', null, 'success', 'done', '2016-08-15 19:37:47', null, '签到奖励', null);
INSERT INTO `yw_money` VALUES ('11', null, '1', '10.00', null, '', null, 'success', 'done', '2016-08-15 19:46:32', null, '签到奖励', null);
INSERT INTO `yw_money` VALUES ('12', null, '1', '10.00', null, '', null, 'success', 'done', '2016-08-15 19:49:31', null, '签到奖励', null);
INSERT INTO `yw_money` VALUES ('13', null, '1', '10.00', null, '', null, 'success', 'done', '2016-08-15 19:51:19', null, '签到奖励', null);
INSERT INTO `yw_money` VALUES ('14', null, '1', '10.00', null, '', null, 'success', 'done', '2016-08-15 19:56:30', null, '签到奖励', null);
INSERT INTO `yw_money` VALUES ('15', null, '1', '10.00', null, '', null, 'success', 'done', '2016-08-15 20:00:31', null, '签到奖励', null);
INSERT INTO `yw_money` VALUES ('16', null, '1', '10.00', null, '', null, 'success', 'done', '2016-08-15 20:02:45', null, '签到奖励', null);
INSERT INTO `yw_money` VALUES ('17', null, '1', '10.00', null, '', null, 'success', 'done', '2016-08-15 20:09:59', null, '签到奖励', null);
INSERT INTO `yw_money` VALUES ('18', null, '1', '10.00', null, '', null, 'success', 'done', '2016-08-15 20:12:31', null, '签到奖励', null);
INSERT INTO `yw_money` VALUES ('19', null, '1', '10.00', null, '', null, 'success', 'done', '2016-08-15 20:14:59', null, '签到奖励', null);
INSERT INTO `yw_money` VALUES ('20', null, '1', '10.00', null, '', null, 'success', 'done', '2016-08-15 20:15:52', null, '签到奖励', null);
INSERT INTO `yw_money` VALUES ('21', null, '1', '20.00', null, '', null, 'success', 'done', '2016-08-15 20:19:28', null, '签到奖励', null);
INSERT INTO `yw_money` VALUES ('22', null, '1', '20.00', null, '', null, 'success', 'done', '2016-08-15 20:21:10', null, '签到奖励', null);
INSERT INTO `yw_money` VALUES ('23', null, '1', '20.00', null, '', null, 'success', 'done', '2016-08-15 20:23:56', null, '签到奖励', null);
INSERT INTO `yw_money` VALUES ('24', null, '1', '20.00', null, '', null, 'success', 'done', '2016-08-15 20:24:52', null, '签到奖励', null);
INSERT INTO `yw_money` VALUES ('25', null, '1', '20.00', null, '', null, 'success', 'done', '2016-08-15 20:27:01', null, '签到奖励', null);
INSERT INTO `yw_money` VALUES ('26', null, '1', '10.00', null, '', null, 'success', 'done', '2016-08-16 11:17:20', null, '签到奖励', null);
INSERT INTO `yw_money` VALUES ('27', null, '1', '10.00', null, '', null, 'success', 'done', '2016-08-16 11:29:19', null, '签到奖励', null);
INSERT INTO `yw_money` VALUES ('28', null, '1', '10.00', null, '', null, 'success', 'done', '2016-08-16 11:33:55', null, '签到奖励', null);
INSERT INTO `yw_money` VALUES ('29', null, '1', '10.00', null, '', null, 'success', 'done', '2016-08-16 11:45:31', null, '签到奖励', null);
INSERT INTO `yw_money` VALUES ('30', null, '1', '10.00', null, '', null, 'success', 'done', '2016-08-16 12:12:39', null, '签到奖励', null);
INSERT INTO `yw_money` VALUES ('31', null, '1', '10.00', null, '', null, 'success', 'done', '2016-08-16 12:20:00', null, '签到奖励', null);
INSERT INTO `yw_money` VALUES ('32', null, '1', '10.00', null, '', null, 'success', 'done', '2016-08-16 12:30:57', null, '签到奖励', null);
INSERT INTO `yw_money` VALUES ('33', null, '1', '10.00', null, '', null, 'success', 'done', '2016-08-16 15:02:00', null, '签到奖励', null);
INSERT INTO `yw_money` VALUES ('34', null, '1', '10.00', null, '', null, 'success', 'done', '2016-08-17 10:07:29', null, '签到奖励', null);
INSERT INTO `yw_money` VALUES ('35', null, '1', '10.00', null, '', null, 'success', 'done', '2016-08-17 10:11:30', null, '签到奖励', null);
INSERT INTO `yw_money` VALUES ('36', null, '1', '10.00', null, '', null, 'success', 'done', '2016-08-17 10:19:55', null, '签到奖励', null);
INSERT INTO `yw_money` VALUES ('37', null, '1', '10.00', null, '', null, 'success', 'done', '2016-08-17 10:20:54', null, '签到奖励', null);
INSERT INTO `yw_money` VALUES ('38', null, '1', '10.00', null, '', null, 'success', 'done', '2016-08-17 16:45:21', null, '签到奖励', null);
INSERT INTO `yw_money` VALUES ('39', null, '1', '10.00', null, '', null, 'success', 'done', '2016-08-18 18:33:50', null, '签到奖励', null);
INSERT INTO `yw_money` VALUES ('40', null, '1', '10.00', null, '', null, 'success', 'done', '2016-08-21 09:52:24', null, '签到奖励', null);
INSERT INTO `yw_money` VALUES ('41', null, '1', '100.00', '100.00', '', 'paymoney', 'success', 'done', '2016-08-24 14:55:37', null, '11', null);
INSERT INTO `yw_money` VALUES ('42', null, '1', '100.00', '0.00', '', 'paymoney', 'success', 'done', '2016-08-24 14:59:44', null, '22', null);
INSERT INTO `yw_money` VALUES ('43', null, '1', '20.00', '20.00', '', null, 'success', 'done', '2016-08-29 19:55:37', null, '签到奖励', null);
INSERT INTO `yw_money` VALUES ('44', null, '1', '20.00', '40.00', '', null, 'success', 'done', '2016-08-29 19:58:53', null, '签到奖励', null);
INSERT INTO `yw_money` VALUES ('45', null, '5', '10.00', '10.00', '', null, 'success', 'done', '2016-08-29 20:00:31', null, '签到奖励', null);
INSERT INTO `yw_money` VALUES ('46', null, '5', '10.00', '20.00', '', null, 'success', 'done', '2016-08-29 20:00:44', null, '签到奖励', null);
INSERT INTO `yw_money` VALUES ('47', null, '1', '10.00', '50.00', '', null, 'success', 'done', '2016-08-30 10:20:29', null, '签到奖励', null);
INSERT INTO `yw_money` VALUES ('48', null, '1', '10.00', '60.00', '', null, 'success', 'done', '2016-08-30 14:48:35', null, '签到奖励', null);
INSERT INTO `yw_money` VALUES ('49', null, '77', '10.00', '10.00', '', null, 'success', 'done', '2016-08-30 14:54:49', null, '签到奖励', null);
INSERT INTO `yw_money` VALUES ('50', null, '67', '10.00', '10.00', '', null, 'success', 'done', '2016-08-30 16:08:43', null, '签到奖励', null);
INSERT INTO `yw_money` VALUES ('51', null, '54', '10.00', '10.00', '', null, 'success', 'done', '2016-08-30 16:13:36', null, '签到奖励', null);
INSERT INTO `yw_money` VALUES ('52', null, '83', '10.00', '10.00', '', null, 'success', 'done', '2016-08-30 16:19:49', null, '签到奖励', null);
INSERT INTO `yw_money` VALUES ('53', null, '1', '10.00', '70.00', '', null, 'success', 'done', '2016-09-01 10:05:48', null, '签到奖励', null);
INSERT INTO `yw_money` VALUES ('54', null, '147', '10.00', '10.00', '', null, 'success', 'done', '2016-09-06 13:18:03', null, '签到奖励', null);
INSERT INTO `yw_money` VALUES ('55', null, '1', '10.00', '80.00', '', null, 'success', 'done', '2016-09-06 16:02:46', null, '签到奖励', null);
INSERT INTO `yw_money` VALUES ('56', null, '1', '10.00', '90.00', '', null, 'success', 'done', '2016-09-07 10:31:56', null, '签到奖励', null);
INSERT INTO `yw_money` VALUES ('57', null, '5', '10.00', '30.00', '', null, 'success', 'done', '2016-09-10 10:41:12', null, '签到奖励', null);
INSERT INTO `yw_money` VALUES ('58', null, '67', '10.00', '20.00', '', null, 'success', 'done', '2016-09-10 15:33:24', null, '签到奖励', null);
INSERT INTO `yw_money` VALUES ('59', null, '67', '10.00', '30.00', '', null, 'success', 'done', '2016-09-12 12:09:36', null, '签到奖励', null);
INSERT INTO `yw_money` VALUES ('60', null, '1', '10.00', '100.00', '', null, 'success', 'done', '2016-09-13 16:39:16', null, '签到奖励', null);
INSERT INTO `yw_money` VALUES ('61', null, '1', '10.00', '110.00', '', null, 'success', 'done', '2016-09-18 10:47:00', null, '签到奖励', null);
INSERT INTO `yw_money` VALUES ('62', null, '79', '100.00', '400.00', '', 'paymoney', 'success', 'done', '2016-10-13 21:51:25', null, '33', null);
INSERT INTO `yw_money` VALUES ('63', null, '79', '10.00', '410.00', '', null, 'success', 'done', '2016-10-13 21:52:45', null, '签到奖励', null);

-- ----------------------------
-- Table structure for yw_myspace
-- ----------------------------
DROP TABLE IF EXISTS `yw_myspace`;
CREATE TABLE `yw_myspace` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL COMMENT '用户ID',
  `images` text COMMENT '缩略图',
  `content` text COMMENT '内容',
  `likes` int(10) DEFAULT '0' COMMENT '喜欢的数量',
  `comments` int(10) DEFAULT '0' COMMENT '评论数量',
  `type` enum('join','normal') DEFAULT NULL COMMENT '类型：normal普通文章，join加好友',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  `stick` enum('true','false') DEFAULT NULL COMMENT '1置顶',
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yw_myspace
-- ----------------------------
INSERT INTO `yw_myspace` VALUES ('4', '1', 'http://78re52.com1.z0.glb.clouddn.com/resource/gogopher.jpg?imageView2/1/w/200/h/200', 'HelloiOS', '2', '5', 'normal', '2008-08-08 00:00:00', null, null);
INSERT INTO `yw_myspace` VALUES ('17', '1', 'http://78re52.com1.z0.glb.clouddn.com/resource/gogopher.jpg?imageView2/1/w/200/h/200,http://78re52.com1.z0.glb.clouddn.com/resource/gogopher.jpg?imageView2/1/w/200/h/200,http://78re52.com1.z0.glb.clouddn.com/resource/gogopher.jpg?imageView2/1/w/200/h/200,http://78re52.com1.z0.glb.clouddn.com/resource/gogopher.jpg?imageView2/1/w/200/h/200,http://78re52.com1.z0.glb.clouddn.com/resource/gogopher.jpg?imageView2/1/w/200/h/200,http://78re52.com1.z0.glb.clouddn.com/resource/gogopher.jpg?imageView2/1/w/200/h/200,http://78re52.com1.z0.glb.clouddn.com/resource/gogopher.jpg?imageView2/1/w/200/h/200', 'hhahahahahah', '1', '4', 'normal', '2016-06-06 00:00:00', null, null);
INSERT INTO `yw_myspace` VALUES ('16', '1', 'http://78re52.com1.z0.glb.clouddn.com/resource/gogopher.jpg?imageView2/1/w/200/h/200,http://78re52.com1.z0.glb.clouddn.com/resource/gogopher.jpg?imageView2/1/w/200/h/200,http://78re52.com1.z0.glb.clouddn.com/resource/gogopher.jpg?imageView2/1/w/200/h/200,http://78re52.com1.z0.glb.clouddn.com/resource/gogopher.jpg?imageView2/1/w/200/h/200,http://78re52.com1.z0.glb.clouddn.com/resource/gogopher.jpg?imageView2/1/w/200/h/200,http://78re52.com1.z0.glb.clouddn.com/resource/gogopher.jpg?imageView2/1/w/200/h/200,http://78re52.com1.z0.glb.clouddn.com/resource/gogopher.jpg?imageView2/1/w/200/h/200,http://78re52.com1.z0.glb.clouddn.com/resource/gogopher.jpg?imageView2/1/w/200/h/200,http://78re52.com1.z0.glb.clouddn.com/resource/gogopher.jpg?imageView2/1/w/200/h/200', 'hhahahahahah', '2', '0', 'normal', '2016-06-06 00:00:00', null, null);
INSERT INTO `yw_myspace` VALUES ('18', '1', 'http://78re52.com1.z0.glb.clouddn.com/resource/gogopher.jpg?imageView2/1/w/200/h/200,http://78re52.com1.z0.glb.clouddn.com/resource/gogopher.jpg?imageView2/1/w/200/h/200,http://78re52.com1.z0.glb.clouddn.com/resource/gogopher.jpg?imageView2/1/w/200/h/200,http://78re52.com1.z0.glb.clouddn.com/resource/gogopher.jpg?imageView2/1/w/200/h/200', 'hhahahahahah', '2', '0', 'normal', '2016-06-06 00:00:00', null, null);
INSERT INTO `yw_myspace` VALUES ('21', '83', 'http://oaqx2e3yr.bkt.clouddn.com/Active14722002961,http://oaqx2e3yr.bkt.clouddn.com/Active14722002960,http://oaqx2e3yr.bkt.clouddn.com/Active14722002962', '是不是全局动态', '4', '0', 'normal', '2016-08-26 16:31:36', null, null);
INSERT INTO `yw_myspace` VALUES ('20', '1', '', 'nihaoa,mingtian', '5', '7', 'normal', '2016-08-22 00:00:00', null, null);
INSERT INTO `yw_myspace` VALUES ('22', '83', 'http://oaqx2e3yr.bkt.clouddn.com/Active14724540470,http://oaqx2e3yr.bkt.clouddn.com/Active14724540471', '嗯嗯嗯，嘻嘻磨破惹人破婆婆看脸色欧漏魔女哦哦哦吐了口魔图咯努力具体了', '2', '1', 'normal', '2016-08-29 15:00:47', null, null);
INSERT INTO `yw_myspace` VALUES ('23', '83', '', '好好好好好好好好好好好好好好好好好好好好好好好好好好好好好好好好好好好好好好好', '2', '0', 'normal', '2016-08-29 16:41:39', null, null);
INSERT INTO `yw_myspace` VALUES ('24', '1', 'http://oaqx2e3yr.bkt.clouddn.com/Active14724638190', '接力', '1', '1', 'normal', '2016-08-29 17:43:39', null, null);
INSERT INTO `yw_myspace` VALUES ('25', '83', '', '删了哈', '2', '0', 'normal', '2016-08-30 11:53:15', null, null);
INSERT INTO `yw_myspace` VALUES ('26', '3', '', '1231231231231321231231231231321321321321321321231321321321', '1', '0', 'normal', '2016-08-30 15:22:11', null, null);
INSERT INTO `yw_myspace` VALUES ('27', '1', '', 'Dyhht', '1', '0', 'normal', '2016-08-30 16:31:15', null, null);
INSERT INTO `yw_myspace` VALUES ('28', '3', '', 'Ghkh', '0', '0', 'normal', '2016-08-30 18:48:45', null, null);
INSERT INTO `yw_myspace` VALUES ('29', '84', '', '…', '0', '0', 'normal', '2016-08-31 10:19:22', null, null);
INSERT INTO `yw_myspace` VALUES ('30', '84', '', '测试合并代码是否出错', '1', '1', 'normal', '2016-08-31 10:26:12', null, null);
INSERT INTO `yw_myspace` VALUES ('31', '84', '', '测试合并代码是否出错', '2', '0', 'normal', '2016-08-31 10:28:00', null, null);
INSERT INTO `yw_myspace` VALUES ('32', '83', 'http://oaqx2e3yr.bkt.clouddn.com/Active14726997192,http://oaqx2e3yr.bkt.clouddn.com/Active14726997190,http://oaqx2e3yr.bkt.clouddn.com/Active14726997193,http://oaqx2e3yr.bkt.clouddn.com/Active14726997204,http://oaqx2e3yr.bkt.clouddn.com/Active14726997191,http://oaqx2e3yr.bkt.clouddn.com/Active14726997205', '来咯娱乐女可恶可以撒额醉的与他', '0', '0', 'normal', '2016-09-01 11:15:19', null, null);
INSERT INTO `yw_myspace` VALUES ('33', '1', 'http://oaqx2e3yr.bkt.clouddn.com/Active14728965951,http://oaqx2e3yr.bkt.clouddn.com/Active14728965950,http://oaqx2e3yr.bkt.clouddn.com/Active14728965952,http://oaqx2e3yr.bkt.clouddn.com/Active14728965953', '开学了，大家都来上学呀哈哈哈哈哈哈', '2', '1', 'normal', '2016-09-03 17:56:35', null, '河南省涧西');
INSERT INTO `yw_myspace` VALUES ('34', '83', 'http://oaqx2e3yr.bkt.clouddn.com/Active14762680570', '哈哈哈，', '1', '0', 'normal', '2016-10-12 18:27:37', null, null);

-- ----------------------------
-- Table structure for yw_my_team
-- ----------------------------
DROP TABLE IF EXISTS `yw_my_team`;
CREATE TABLE `yw_my_team` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `owner` int(10) DEFAULT NULL COMMENT '主人ID',
  `user_id` int(10) DEFAULT NULL COMMENT '队友ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yw_my_team
-- ----------------------------

-- ----------------------------
-- Table structure for yw_region
-- ----------------------------
DROP TABLE IF EXISTS `yw_region`;
CREATE TABLE `yw_region` (
  `region_id` double NOT NULL,
  `region_code` varchar(100) NOT NULL,
  `region_name` varchar(100) NOT NULL,
  `parent_id` double NOT NULL,
  `region_level` double NOT NULL,
  `region_order` double NOT NULL,
  `region_name_en` varchar(100) NOT NULL,
  `region_shortname_en` varchar(10) NOT NULL,
  PRIMARY KEY (`region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yw_region
-- ----------------------------
INSERT INTO `yw_region` VALUES ('1', '中国', '中国', '0', '0', '0', 'Zhong Guo', '2');
INSERT INTO `yw_region` VALUES ('2', '110000', '北京市', '1', '0', '0', 'Beijing Shi', 'BJ');
INSERT INTO `yw_region` VALUES ('3', '120000', '天津市', '1', '0', '0', 'Tianjin Shi', 'TJ');
INSERT INTO `yw_region` VALUES ('4', '130000', '河北省', '1', '0', '0', 'Hebei Sheng', 'HE');
INSERT INTO `yw_region` VALUES ('5', '140000', '山西省', '1', '0', '0', 'Shanxi Sheng ', 'SX');
INSERT INTO `yw_region` VALUES ('6', '150000', '内蒙古自治区', '1', '0', '0', 'Nei Mongol Zizhiqu', 'NM');
INSERT INTO `yw_region` VALUES ('7', '210000', '辽宁省', '1', '0', '0', 'Liaoning Sheng', 'LN');
INSERT INTO `yw_region` VALUES ('8', '220000', '吉林省', '1', '0', '0', 'Jilin Sheng', 'JL');
INSERT INTO `yw_region` VALUES ('9', '230000', '黑龙江省', '1', '0', '0', 'Heilongjiang Sheng', 'HL');
INSERT INTO `yw_region` VALUES ('10', '310000', '上海市', '1', '0', '0', 'Shanghai Shi', 'SH');
INSERT INTO `yw_region` VALUES ('11', '320000', '江苏省', '1', '0', '0', 'Jiangsu Sheng', 'JS');
INSERT INTO `yw_region` VALUES ('12', '330000', '浙江省', '1', '0', '0', 'Zhejiang Sheng', 'ZJ');
INSERT INTO `yw_region` VALUES ('13', '340000', '安徽省', '1', '0', '0', 'Anhui Sheng', 'AH');
INSERT INTO `yw_region` VALUES ('14', '350000', '福建省', '1', '0', '0', 'Fujian Sheng ', 'FJ');
INSERT INTO `yw_region` VALUES ('15', '360000', '江西省', '1', '0', '0', 'Jiangxi Sheng', 'JX');
INSERT INTO `yw_region` VALUES ('16', '370000', '山东省', '1', '0', '0', 'Shandong Sheng ', 'SD');
INSERT INTO `yw_region` VALUES ('17', '410000', '河南省', '1', '0', '0', 'Henan Sheng', 'HA');
INSERT INTO `yw_region` VALUES ('18', '420000', '湖北省', '1', '0', '0', 'Hubei Sheng', 'HB');
INSERT INTO `yw_region` VALUES ('19', '430000', '湖南省', '1', '0', '0', 'Hunan Sheng', 'HN');
INSERT INTO `yw_region` VALUES ('20', '440000', '广东省', '1', '0', '0', 'Guangdong Sheng', 'GD');
INSERT INTO `yw_region` VALUES ('21', '450000', '广西壮族自治区', '1', '0', '0', 'Guangxi Zhuangzu Zizhiqu', 'GX');
INSERT INTO `yw_region` VALUES ('22', '460000', '海南省', '1', '0', '0', 'Hainan Sheng', 'HI');
INSERT INTO `yw_region` VALUES ('23', '500000', '重庆市', '1', '0', '0', 'Chongqing Shi', 'CQ');
INSERT INTO `yw_region` VALUES ('24', '510000', '四川省', '1', '0', '0', 'Sichuan Sheng', 'SC');
INSERT INTO `yw_region` VALUES ('25', '520000', '贵州省', '1', '0', '0', 'Guizhou Sheng', 'GZ');
INSERT INTO `yw_region` VALUES ('26', '530000', '云南省', '1', '0', '0', 'Yunnan Sheng', 'YN');
INSERT INTO `yw_region` VALUES ('27', '540000', '西藏自治区', '1', '0', '0', 'Xizang Zizhiqu', 'XZ');
INSERT INTO `yw_region` VALUES ('28', '610000', '陕西省', '1', '0', '0', 'Shanxi Sheng ', 'SN');
INSERT INTO `yw_region` VALUES ('29', '620000', '甘肃省', '1', '0', '0', 'Gansu Sheng', 'GS');
INSERT INTO `yw_region` VALUES ('30', '630000', '青海省', '1', '0', '0', 'Qinghai Sheng', 'QH');
INSERT INTO `yw_region` VALUES ('31', '640000', '宁夏回族自治区', '1', '0', '0', 'Ningxia Huizu Zizhiqu', 'NX');
INSERT INTO `yw_region` VALUES ('32', '650000', '新疆维吾尔自治区', '1', '0', '0', 'Xinjiang Uygur Zizhiqu', 'XJ');
INSERT INTO `yw_region` VALUES ('33', '110100', '市辖区', '2', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('34', '110200', '县', '2', '0', '0', 'Xian', '2');
INSERT INTO `yw_region` VALUES ('35', '120100', '市辖区', '3', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('36', '120200', '县', '3', '0', '0', 'Xian', '2');
INSERT INTO `yw_region` VALUES ('37', '130100', '石家庄市', '4', '0', '0', 'Shijiazhuang Shi', 'SJW');
INSERT INTO `yw_region` VALUES ('38', '130200', '唐山市', '4', '0', '0', 'Tangshan Shi', 'TGS');
INSERT INTO `yw_region` VALUES ('39', '130300', '秦皇岛市', '4', '0', '0', 'Qinhuangdao Shi', 'SHP');
INSERT INTO `yw_region` VALUES ('40', '130400', '邯郸市', '4', '0', '0', 'Handan Shi', 'HDS');
INSERT INTO `yw_region` VALUES ('41', '130500', '邢台市', '4', '0', '0', 'Xingtai Shi', 'XTS');
INSERT INTO `yw_region` VALUES ('42', '130600', '保定市', '4', '0', '0', 'Baoding Shi', 'BDS');
INSERT INTO `yw_region` VALUES ('43', '130700', '张家口市', '4', '0', '0', 'Zhangjiakou Shi ', 'ZJK');
INSERT INTO `yw_region` VALUES ('44', '130800', '承德市', '4', '0', '0', 'Chengde Shi', 'CDS');
INSERT INTO `yw_region` VALUES ('45', '130900', '沧州市', '4', '0', '0', 'Cangzhou Shi', 'CGZ');
INSERT INTO `yw_region` VALUES ('46', '131000', '廊坊市', '4', '0', '0', 'Langfang Shi', 'LFS');
INSERT INTO `yw_region` VALUES ('47', '131100', '衡水市', '4', '0', '0', 'Hengshui Shi ', 'HGS');
INSERT INTO `yw_region` VALUES ('48', '140100', '太原市', '5', '0', '0', 'Taiyuan Shi', 'TYN');
INSERT INTO `yw_region` VALUES ('49', '140200', '大同市', '5', '0', '0', 'Datong Shi ', 'DTG');
INSERT INTO `yw_region` VALUES ('50', '140300', '阳泉市', '5', '0', '0', 'Yangquan Shi', 'YQS');
INSERT INTO `yw_region` VALUES ('51', '140400', '长治市', '5', '0', '0', 'Changzhi Shi', 'CZS');
INSERT INTO `yw_region` VALUES ('52', '140500', '晋城市', '5', '0', '0', 'Jincheng Shi ', 'JCG');
INSERT INTO `yw_region` VALUES ('53', '140600', '朔州市', '5', '0', '0', 'Shuozhou Shi ', 'SZJ');
INSERT INTO `yw_region` VALUES ('54', '140700', '晋中市', '5', '0', '0', 'Jinzhong Shi', '2');
INSERT INTO `yw_region` VALUES ('55', '140800', '运城市', '5', '0', '0', 'Yuncheng Shi', '2');
INSERT INTO `yw_region` VALUES ('56', '140900', '忻州市', '5', '0', '0', 'Xinzhou Shi', '2');
INSERT INTO `yw_region` VALUES ('57', '141000', '临汾市', '5', '0', '0', 'Linfen Shi', '2');
INSERT INTO `yw_region` VALUES ('58', '141100', '吕梁市', '5', '0', '0', 'Lvliang Shi', '2');
INSERT INTO `yw_region` VALUES ('59', '150100', '呼和浩特市', '6', '0', '0', 'Hohhot Shi', 'Hhht');
INSERT INTO `yw_region` VALUES ('60', '150200', '包头市', '6', '0', '0', 'Baotou Shi ', 'BTS');
INSERT INTO `yw_region` VALUES ('61', '150300', '乌海市', '6', '0', '0', 'Wuhai Shi', 'WHM');
INSERT INTO `yw_region` VALUES ('62', '150400', '赤峰市', '6', '0', '0', 'Chifeng (Ulanhad)Shi', 'CFS');
INSERT INTO `yw_region` VALUES ('63', '150500', '通辽市', '6', '0', '0', 'Tongliao Shi', '2');
INSERT INTO `yw_region` VALUES ('64', '150600', '鄂尔多斯市', '6', '0', '0', 'Eerduosi Shi', '2');
INSERT INTO `yw_region` VALUES ('65', '150700', '呼伦贝尔市', '6', '0', '0', 'Hulunbeier Shi ', '2');
INSERT INTO `yw_region` VALUES ('66', '150800', '巴彦淖尔市', '6', '0', '0', 'Bayannaoer Shi', '2');
INSERT INTO `yw_region` VALUES ('67', '150900', '乌兰察布市', '6', '0', '0', 'Wulanchabu Shi', '2');
INSERT INTO `yw_region` VALUES ('68', '152200', '兴安盟', '6', '0', '0', 'Hinggan Meng', 'HIN');
INSERT INTO `yw_region` VALUES ('69', '152500', '锡林郭勒盟', '6', '0', '0', 'Xilin Gol Meng', 'XGO');
INSERT INTO `yw_region` VALUES ('70', '152900', '阿拉善盟', '6', '0', '0', 'Alxa Meng', 'ALM');
INSERT INTO `yw_region` VALUES ('71', '210100', '沈阳市', '7', '0', '0', 'Shenyang Shi', 'SHE');
INSERT INTO `yw_region` VALUES ('72', '210200', '大连市', '7', '0', '0', 'Dalian Shi', 'DLC');
INSERT INTO `yw_region` VALUES ('73', '210300', '鞍山市', '7', '0', '0', 'AnShan Shi', 'ASN');
INSERT INTO `yw_region` VALUES ('74', '210400', '抚顺市', '7', '0', '0', 'Fushun Shi', 'FSN');
INSERT INTO `yw_region` VALUES ('75', '210500', '本溪市', '7', '0', '0', 'Benxi Shi', 'BXS');
INSERT INTO `yw_region` VALUES ('76', '210600', '丹东市', '7', '0', '0', 'Dandong Shi', 'DDG');
INSERT INTO `yw_region` VALUES ('77', '210700', '锦州市', '7', '0', '0', 'Jinzhou Shi', 'JNZ');
INSERT INTO `yw_region` VALUES ('78', '210800', '营口市', '7', '0', '0', 'Yingkou Shi', 'YIK');
INSERT INTO `yw_region` VALUES ('79', '210900', '阜新市', '7', '0', '0', 'Fuxin Shi', 'FXS');
INSERT INTO `yw_region` VALUES ('80', '211000', '辽阳市', '7', '0', '0', 'Liaoyang Shi', 'LYL');
INSERT INTO `yw_region` VALUES ('81', '211100', '盘锦市', '7', '0', '0', 'Panjin Shi', 'PJS');
INSERT INTO `yw_region` VALUES ('82', '211200', '铁岭市', '7', '0', '0', 'Tieling Shi', 'TLS');
INSERT INTO `yw_region` VALUES ('83', '211300', '朝阳市', '7', '0', '0', 'Chaoyang Shi', 'CYS');
INSERT INTO `yw_region` VALUES ('84', '211400', '葫芦岛市', '7', '0', '0', 'Huludao Shi', 'HLD');
INSERT INTO `yw_region` VALUES ('85', '220100', '长春市', '8', '0', '0', 'Changchun Shi ', 'CGQ');
INSERT INTO `yw_region` VALUES ('86', '220200', '吉林市', '8', '0', '0', 'Jilin Shi ', 'JLS');
INSERT INTO `yw_region` VALUES ('87', '220300', '四平市', '8', '0', '0', 'Siping Shi', 'SPS');
INSERT INTO `yw_region` VALUES ('88', '220400', '辽源市', '8', '0', '0', 'Liaoyuan Shi', 'LYH');
INSERT INTO `yw_region` VALUES ('89', '220500', '通化市', '8', '0', '0', 'Tonghua Shi', 'THS');
INSERT INTO `yw_region` VALUES ('90', '220600', '白山市', '8', '0', '0', 'Baishan Shi', 'BSN');
INSERT INTO `yw_region` VALUES ('91', '220700', '松原市', '8', '0', '0', 'Songyuan Shi', 'SYU');
INSERT INTO `yw_region` VALUES ('92', '220800', '白城市', '8', '0', '0', 'Baicheng Shi', 'BCS');
INSERT INTO `yw_region` VALUES ('93', '222400', '延边朝鲜族自治州', '8', '0', '0', 'Yanbian Chosenzu Zizhizhou', 'YBZ');
INSERT INTO `yw_region` VALUES ('94', '230100', '哈尔滨市', '9', '0', '0', 'Harbin Shi', 'HRB');
INSERT INTO `yw_region` VALUES ('95', '230200', '齐齐哈尔市', '9', '0', '0', 'Qiqihar Shi', 'NDG');
INSERT INTO `yw_region` VALUES ('96', '230300', '鸡西市', '9', '0', '0', 'Jixi Shi', 'JXI');
INSERT INTO `yw_region` VALUES ('97', '230400', '鹤岗市', '9', '0', '0', 'Hegang Shi', 'HEG');
INSERT INTO `yw_region` VALUES ('98', '230500', '双鸭山市', '9', '0', '0', 'Shuangyashan Shi', 'SYS');
INSERT INTO `yw_region` VALUES ('99', '230600', '大庆市', '9', '0', '0', 'Daqing Shi', 'DQG');
INSERT INTO `yw_region` VALUES ('100', '230700', '伊春市', '9', '0', '0', 'Yichun Shi', 'YCH');
INSERT INTO `yw_region` VALUES ('101', '230800', '佳木斯市', '9', '0', '0', 'Jiamusi Shi', 'JMU');
INSERT INTO `yw_region` VALUES ('102', '230900', '七台河市', '9', '0', '0', 'Qitaihe Shi', 'QTH');
INSERT INTO `yw_region` VALUES ('103', '231000', '牡丹江市', '9', '0', '0', 'Mudanjiang Shi', 'MDG');
INSERT INTO `yw_region` VALUES ('104', '231100', '黑河市', '9', '0', '0', 'Heihe Shi', 'HEK');
INSERT INTO `yw_region` VALUES ('105', '231200', '绥化市', '9', '0', '0', 'Suihua Shi', '2');
INSERT INTO `yw_region` VALUES ('106', '232700', '大兴安岭地区', '9', '0', '0', 'Da Hinggan Ling Diqu', 'DHL');
INSERT INTO `yw_region` VALUES ('107', '310100', '市辖区', '10', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('108', '310200', '县', '10', '0', '0', 'Xian', '2');
INSERT INTO `yw_region` VALUES ('109', '320100', '南京市', '11', '0', '0', 'Nanjing Shi', 'NKG');
INSERT INTO `yw_region` VALUES ('110', '320200', '无锡市', '11', '0', '0', 'Wuxi Shi', 'WUX');
INSERT INTO `yw_region` VALUES ('111', '320300', '徐州市', '11', '0', '0', 'Xuzhou Shi', 'XUZ');
INSERT INTO `yw_region` VALUES ('112', '320400', '常州市', '11', '0', '0', 'Changzhou Shi', 'CZX');
INSERT INTO `yw_region` VALUES ('113', '320500', '苏州市', '11', '0', '0', 'Suzhou Shi', 'SZH');
INSERT INTO `yw_region` VALUES ('114', '320600', '南通市', '11', '0', '0', 'Nantong Shi', 'NTG');
INSERT INTO `yw_region` VALUES ('115', '320700', '连云港市', '11', '0', '0', 'Lianyungang Shi', 'LYG');
INSERT INTO `yw_region` VALUES ('116', '320800', '淮安市', '11', '0', '0', 'Huai,an Xian', '2');
INSERT INTO `yw_region` VALUES ('117', '320900', '盐城市', '11', '0', '0', 'Yancheng Shi', 'YCK');
INSERT INTO `yw_region` VALUES ('118', '321000', '扬州市', '11', '0', '0', 'Yangzhou Shi', 'YZH');
INSERT INTO `yw_region` VALUES ('119', '321100', '镇江市', '11', '0', '0', 'Zhenjiang Shi', 'ZHE');
INSERT INTO `yw_region` VALUES ('120', '321200', '泰州市', '11', '0', '0', 'Taizhou Shi', 'TZS');
INSERT INTO `yw_region` VALUES ('121', '321300', '宿迁市', '11', '0', '0', 'Suqian Shi', 'SUQ');
INSERT INTO `yw_region` VALUES ('122', '330100', '杭州市', '12', '0', '0', 'Hangzhou Shi', 'HGH');
INSERT INTO `yw_region` VALUES ('123', '330200', '宁波市', '12', '0', '0', 'Ningbo Shi', 'NGB');
INSERT INTO `yw_region` VALUES ('124', '330300', '温州市', '12', '0', '0', 'Wenzhou Shi', 'WNZ');
INSERT INTO `yw_region` VALUES ('125', '330400', '嘉兴市', '12', '0', '0', 'Jiaxing Shi', 'JIX');
INSERT INTO `yw_region` VALUES ('126', '330500', '湖州市', '12', '0', '0', 'Huzhou Shi ', 'HZH');
INSERT INTO `yw_region` VALUES ('127', '330600', '绍兴市', '12', '0', '0', 'Shaoxing Shi', 'SXG');
INSERT INTO `yw_region` VALUES ('128', '330700', '金华市', '12', '0', '0', 'Jinhua Shi', 'JHA');
INSERT INTO `yw_region` VALUES ('129', '330800', '衢州市', '12', '0', '0', 'Quzhou Shi', 'QUZ');
INSERT INTO `yw_region` VALUES ('130', '330900', '舟山市', '12', '0', '0', 'Zhoushan Shi', 'ZOS');
INSERT INTO `yw_region` VALUES ('131', '331000', '台州市', '12', '0', '0', 'Taizhou Shi', 'TZZ');
INSERT INTO `yw_region` VALUES ('132', '331100', '丽水市', '12', '0', '0', 'Lishui Shi', '2');
INSERT INTO `yw_region` VALUES ('133', '340100', '合肥市', '13', '0', '0', 'Hefei Shi', 'HFE');
INSERT INTO `yw_region` VALUES ('134', '340200', '芜湖市', '13', '0', '0', 'Wuhu Shi', 'WHI');
INSERT INTO `yw_region` VALUES ('135', '340300', '蚌埠市', '13', '0', '0', 'Bengbu Shi', 'BBU');
INSERT INTO `yw_region` VALUES ('136', '340400', '淮南市', '13', '0', '0', 'Huainan Shi', 'HNS');
INSERT INTO `yw_region` VALUES ('137', '340500', '马鞍山市', '13', '0', '0', 'Ma,anshan Shi', 'MAA');
INSERT INTO `yw_region` VALUES ('138', '340600', '淮北市', '13', '0', '0', 'Huaibei Shi', 'HBE');
INSERT INTO `yw_region` VALUES ('139', '340700', '铜陵市', '13', '0', '0', 'Tongling Shi', 'TOL');
INSERT INTO `yw_region` VALUES ('140', '340800', '安庆市', '13', '0', '0', 'Anqing Shi', 'AQG');
INSERT INTO `yw_region` VALUES ('141', '341000', '黄山市', '13', '0', '0', 'Huangshan Shi', 'HSN');
INSERT INTO `yw_region` VALUES ('142', '341100', '滁州市', '13', '0', '0', 'Chuzhou Shi', 'CUZ');
INSERT INTO `yw_region` VALUES ('143', '341200', '阜阳市', '13', '0', '0', 'Fuyang Shi', 'FYS');
INSERT INTO `yw_region` VALUES ('144', '341300', '宿州市', '13', '0', '0', 'Suzhou Shi', 'SUZ');
INSERT INTO `yw_region` VALUES ('145', '341400', '巢湖市', '13', '0', '0', 'Chaohu Shi', '2');
INSERT INTO `yw_region` VALUES ('146', '341500', '六安市', '13', '0', '0', 'Liu,an Shi', '2');
INSERT INTO `yw_region` VALUES ('147', '341600', '亳州市', '13', '0', '0', 'Bozhou Shi', '2');
INSERT INTO `yw_region` VALUES ('148', '341700', '池州市', '13', '0', '0', 'Chizhou Shi', '2');
INSERT INTO `yw_region` VALUES ('149', '341800', '宣城市', '13', '0', '0', 'Xuancheng Shi', '2');
INSERT INTO `yw_region` VALUES ('150', '350100', '福州市', '14', '0', '0', 'Fuzhou Shi', 'FOC');
INSERT INTO `yw_region` VALUES ('151', '350200', '厦门市', '14', '0', '0', 'Xiamen Shi', 'XMN');
INSERT INTO `yw_region` VALUES ('152', '350300', '莆田市', '14', '0', '0', 'Putian Shi', 'PUT');
INSERT INTO `yw_region` VALUES ('153', '350400', '三明市', '14', '0', '0', 'Sanming Shi', 'SMS');
INSERT INTO `yw_region` VALUES ('154', '350500', '泉州市', '14', '0', '0', 'Quanzhou Shi', 'QZJ');
INSERT INTO `yw_region` VALUES ('155', '350600', '漳州市', '14', '0', '0', 'Zhangzhou Shi', 'ZZU');
INSERT INTO `yw_region` VALUES ('156', '350700', '南平市', '14', '0', '0', 'Nanping Shi', 'NPS');
INSERT INTO `yw_region` VALUES ('157', '350800', '龙岩市', '14', '0', '0', 'Longyan Shi', 'LYF');
INSERT INTO `yw_region` VALUES ('158', '350900', '宁德市', '14', '0', '0', 'Ningde Shi', '2');
INSERT INTO `yw_region` VALUES ('159', '360100', '南昌市', '15', '0', '0', 'Nanchang Shi', 'KHN');
INSERT INTO `yw_region` VALUES ('160', '360200', '景德镇市', '15', '0', '0', 'Jingdezhen Shi', 'JDZ');
INSERT INTO `yw_region` VALUES ('161', '360300', '萍乡市', '15', '0', '0', 'Pingxiang Shi', 'PXS');
INSERT INTO `yw_region` VALUES ('162', '360400', '九江市', '15', '0', '0', 'Jiujiang Shi', 'JIU');
INSERT INTO `yw_region` VALUES ('163', '360500', '新余市', '15', '0', '0', 'Xinyu Shi', 'XYU');
INSERT INTO `yw_region` VALUES ('164', '360600', '鹰潭市', '15', '0', '0', 'Yingtan Shi', '2');
INSERT INTO `yw_region` VALUES ('165', '360700', '赣州市', '15', '0', '0', 'Ganzhou Shi', 'GZH');
INSERT INTO `yw_region` VALUES ('166', '360800', '吉安市', '15', '0', '0', 'Ji,an Shi', '2');
INSERT INTO `yw_region` VALUES ('167', '360900', '宜春市', '15', '0', '0', 'Yichun Shi', '2');
INSERT INTO `yw_region` VALUES ('168', '361000', '抚州市', '15', '0', '0', 'Wuzhou Shi', '2');
INSERT INTO `yw_region` VALUES ('169', '361100', '上饶市', '15', '0', '0', 'Shangrao Shi', '2');
INSERT INTO `yw_region` VALUES ('170', '370100', '济南市', '16', '0', '0', 'Jinan Shi', 'TNA');
INSERT INTO `yw_region` VALUES ('171', '370200', '青岛市', '16', '0', '0', 'Qingdao Shi', 'TAO');
INSERT INTO `yw_region` VALUES ('172', '370300', '淄博市', '16', '0', '0', 'Zibo Shi', 'ZBO');
INSERT INTO `yw_region` VALUES ('173', '370400', '枣庄市', '16', '0', '0', 'Zaozhuang Shi', 'ZZG');
INSERT INTO `yw_region` VALUES ('174', '370500', '东营市', '16', '0', '0', 'Dongying Shi', 'DYG');
INSERT INTO `yw_region` VALUES ('175', '370600', '烟台市', '16', '0', '0', 'Yantai Shi', 'YNT');
INSERT INTO `yw_region` VALUES ('176', '370700', '潍坊市', '16', '0', '0', 'Weifang Shi', 'WEF');
INSERT INTO `yw_region` VALUES ('177', '370800', '济宁市', '16', '0', '0', 'Jining Shi', 'JNG');
INSERT INTO `yw_region` VALUES ('178', '370900', '泰安市', '16', '0', '0', 'Tai,an Shi', 'TAI');
INSERT INTO `yw_region` VALUES ('179', '371000', '威海市', '16', '0', '0', 'Weihai Shi', 'WEH');
INSERT INTO `yw_region` VALUES ('180', '371100', '日照市', '16', '0', '0', 'Rizhao Shi', 'RZH');
INSERT INTO `yw_region` VALUES ('181', '371200', '莱芜市', '16', '0', '0', 'Laiwu Shi', 'LWS');
INSERT INTO `yw_region` VALUES ('182', '371300', '临沂市', '16', '0', '0', 'Linyi Shi', 'LYI');
INSERT INTO `yw_region` VALUES ('183', '371400', '德州市', '16', '0', '0', 'Dezhou Shi', 'DZS');
INSERT INTO `yw_region` VALUES ('184', '371500', '聊城市', '16', '0', '0', 'Liaocheng Shi', 'LCH');
INSERT INTO `yw_region` VALUES ('185', '371600', '滨州市', '16', '0', '0', 'Binzhou Shi', '2');
INSERT INTO `yw_region` VALUES ('186', '371700', '菏泽市', '16', '3', '0', 'Heze Shi', 'HZ');
INSERT INTO `yw_region` VALUES ('187', '410100', '郑州市', '17', '0', '0', 'Zhengzhou Shi', 'CGO');
INSERT INTO `yw_region` VALUES ('188', '410200', '开封市', '17', '0', '0', 'Kaifeng Shi', 'KFS');
INSERT INTO `yw_region` VALUES ('189', '410300', '洛阳市', '17', '0', '0', 'Luoyang Shi', 'LYA');
INSERT INTO `yw_region` VALUES ('190', '410400', '平顶山市', '17', '0', '0', 'Pingdingshan Shi', 'PDS');
INSERT INTO `yw_region` VALUES ('191', '410500', '安阳市', '17', '0', '0', 'Anyang Shi', 'AYS');
INSERT INTO `yw_region` VALUES ('192', '410600', '鹤壁市', '17', '0', '0', 'Hebi Shi', 'HBS');
INSERT INTO `yw_region` VALUES ('193', '410700', '新乡市', '17', '0', '0', 'Xinxiang Shi', 'XXS');
INSERT INTO `yw_region` VALUES ('194', '410800', '焦作市', '17', '0', '0', 'Jiaozuo Shi', 'JZY');
INSERT INTO `yw_region` VALUES ('195', '410900', '濮阳市', '17', '0', '0', 'Puyang Shi', 'PYS');
INSERT INTO `yw_region` VALUES ('196', '411000', '许昌市', '17', '0', '0', 'Xuchang Shi', 'XCS');
INSERT INTO `yw_region` VALUES ('197', '411100', '漯河市', '17', '0', '0', 'Luohe Shi', 'LHS');
INSERT INTO `yw_region` VALUES ('198', '411200', '三门峡市', '17', '0', '0', 'Sanmenxia Shi', 'SMX');
INSERT INTO `yw_region` VALUES ('199', '411300', '南阳市', '17', '0', '0', 'Nanyang Shi', 'NYS');
INSERT INTO `yw_region` VALUES ('200', '411400', '商丘市', '17', '0', '0', 'Shangqiu Shi', 'SQS');
INSERT INTO `yw_region` VALUES ('201', '411500', '信阳市', '17', '0', '0', 'Xinyang Shi', 'XYG');
INSERT INTO `yw_region` VALUES ('202', '411600', '周口市', '17', '0', '0', 'Zhoukou Shi', '2');
INSERT INTO `yw_region` VALUES ('203', '411700', '驻马店市', '17', '0', '0', 'Zhumadian Shi', '2');
INSERT INTO `yw_region` VALUES ('204', '420100', '武汉市', '18', '0', '0', 'Wuhan Shi', 'WUH');
INSERT INTO `yw_region` VALUES ('205', '420200', '黄石市', '18', '0', '0', 'Huangshi Shi', 'HIS');
INSERT INTO `yw_region` VALUES ('206', '420300', '十堰市', '18', '0', '0', 'Shiyan Shi', 'SYE');
INSERT INTO `yw_region` VALUES ('207', '420500', '宜昌市', '18', '0', '0', 'Yichang Shi', 'YCO');
INSERT INTO `yw_region` VALUES ('208', '420600', '襄樊市', '18', '0', '0', 'Xiangfan Shi', 'XFN');
INSERT INTO `yw_region` VALUES ('209', '420700', '鄂州市', '18', '0', '0', 'Ezhou Shi', 'EZS');
INSERT INTO `yw_region` VALUES ('210', '420800', '荆门市', '18', '0', '0', 'Jingmen Shi', 'JMS');
INSERT INTO `yw_region` VALUES ('211', '420900', '孝感市', '18', '0', '0', 'Xiaogan Shi', 'XGE');
INSERT INTO `yw_region` VALUES ('212', '421000', '荆州市', '18', '0', '0', 'Jingzhou Shi', 'JGZ');
INSERT INTO `yw_region` VALUES ('213', '421100', '黄冈市', '18', '0', '0', 'Huanggang Shi', 'HE');
INSERT INTO `yw_region` VALUES ('214', '421200', '咸宁市', '18', '0', '0', 'Xianning Xian', 'XNS');
INSERT INTO `yw_region` VALUES ('215', '421300', '随州市', '18', '0', '0', 'Suizhou Shi', '2');
INSERT INTO `yw_region` VALUES ('216', '422800', '恩施土家族苗族自治州', '18', '0', '0', 'Enshi Tujiazu Miaozu Zizhizhou', 'ESH');
INSERT INTO `yw_region` VALUES ('217', '429000', '省直辖县级行政区划', '18', '0', '0', 'shengzhixiaxianjixingzhengquhua', '2');
INSERT INTO `yw_region` VALUES ('218', '430100', '长沙市', '19', '0', '0', 'Changsha Shi', 'CSX');
INSERT INTO `yw_region` VALUES ('219', '430200', '株洲市', '19', '0', '0', 'Zhuzhou Shi', 'ZZS');
INSERT INTO `yw_region` VALUES ('220', '430300', '湘潭市', '19', '0', '0', 'Xiangtan Shi', 'XGT');
INSERT INTO `yw_region` VALUES ('221', '430400', '衡阳市', '19', '0', '0', 'Hengyang Shi', 'HNY');
INSERT INTO `yw_region` VALUES ('222', '430500', '邵阳市', '19', '0', '0', 'Shaoyang Shi', 'SYR');
INSERT INTO `yw_region` VALUES ('223', '430600', '岳阳市', '19', '0', '0', 'Yueyang Shi', 'YYG');
INSERT INTO `yw_region` VALUES ('224', '430700', '常德市', '19', '0', '0', 'Changde Shi', 'CDE');
INSERT INTO `yw_region` VALUES ('225', '430800', '张家界市', '19', '0', '0', 'Zhangjiajie Shi', 'ZJJ');
INSERT INTO `yw_region` VALUES ('226', '430900', '益阳市', '19', '0', '0', 'Yiyang Shi', 'YYS');
INSERT INTO `yw_region` VALUES ('227', '431000', '郴州市', '19', '0', '0', 'Chenzhou Shi', 'CNZ');
INSERT INTO `yw_region` VALUES ('228', '431100', '永州市', '19', '0', '0', 'Yongzhou Shi', 'YZS');
INSERT INTO `yw_region` VALUES ('229', '431200', '怀化市', '19', '0', '0', 'Huaihua Shi', 'HHS');
INSERT INTO `yw_region` VALUES ('230', '431300', '娄底市', '19', '0', '0', 'Loudi Shi', '2');
INSERT INTO `yw_region` VALUES ('231', '433100', '湘西土家族苗族自治州', '19', '0', '0', 'Xiangxi Tujiazu Miaozu Zizhizhou ', 'XXZ');
INSERT INTO `yw_region` VALUES ('232', '440100', '广州市', '20', '0', '0', 'Guangzhou Shi', 'CAN');
INSERT INTO `yw_region` VALUES ('233', '440200', '韶关市', '20', '0', '0', 'Shaoguan Shi', 'HSC');
INSERT INTO `yw_region` VALUES ('234', '440300', '深圳市', '20', '0', '0', 'Shenzhen Shi', 'SZX');
INSERT INTO `yw_region` VALUES ('235', '440400', '珠海市', '20', '0', '0', 'Zhuhai Shi', 'ZUH');
INSERT INTO `yw_region` VALUES ('236', '440500', '汕头市', '20', '0', '0', 'Shantou Shi', 'SWA');
INSERT INTO `yw_region` VALUES ('237', '440600', '佛山市', '20', '0', '0', 'Foshan Shi', 'FOS');
INSERT INTO `yw_region` VALUES ('238', '440700', '江门市', '20', '0', '0', 'Jiangmen Shi', 'JMN');
INSERT INTO `yw_region` VALUES ('239', '440800', '湛江市', '20', '0', '0', 'Zhanjiang Shi', 'ZHA');
INSERT INTO `yw_region` VALUES ('240', '440900', '茂名市', '20', '0', '0', 'Maoming Shi', 'MMI');
INSERT INTO `yw_region` VALUES ('241', '441200', '肇庆市', '20', '0', '0', 'Zhaoqing Shi', 'ZQG');
INSERT INTO `yw_region` VALUES ('242', '441300', '惠州市', '20', '0', '0', 'Huizhou Shi', 'HUI');
INSERT INTO `yw_region` VALUES ('243', '441400', '梅州市', '20', '0', '0', 'Meizhou Shi', 'MXZ');
INSERT INTO `yw_region` VALUES ('244', '441500', '汕尾市', '20', '0', '0', 'Shanwei Shi', 'SWE');
INSERT INTO `yw_region` VALUES ('245', '441600', '河源市', '20', '0', '0', 'Heyuan Shi', 'HEY');
INSERT INTO `yw_region` VALUES ('246', '441700', '阳江市', '20', '0', '0', 'Yangjiang Shi', 'YJI');
INSERT INTO `yw_region` VALUES ('247', '441800', '清远市', '20', '0', '0', 'Qingyuan Shi', 'QYN');
INSERT INTO `yw_region` VALUES ('248', '441900', '东莞市', '20', '0', '0', 'Dongguan Shi', 'DGG');
INSERT INTO `yw_region` VALUES ('249', '442000', '中山市', '20', '0', '0', 'Zhongshan Shi', 'ZSN');
INSERT INTO `yw_region` VALUES ('250', '445100', '潮州市', '20', '0', '0', 'Chaozhou Shi', 'CZY');
INSERT INTO `yw_region` VALUES ('251', '445200', '揭阳市', '20', '0', '0', 'Jieyang Shi', 'JIY');
INSERT INTO `yw_region` VALUES ('252', '445300', '云浮市', '20', '0', '0', 'Yunfu Shi', 'YFS');
INSERT INTO `yw_region` VALUES ('253', '450100', '南宁市', '21', '0', '0', 'Nanning Shi', 'NNG');
INSERT INTO `yw_region` VALUES ('254', '450200', '柳州市', '21', '0', '0', 'Liuzhou Shi', 'LZH');
INSERT INTO `yw_region` VALUES ('255', '450300', '桂林市', '21', '0', '0', 'Guilin Shi', 'KWL');
INSERT INTO `yw_region` VALUES ('256', '450400', '梧州市', '21', '0', '0', 'Wuzhou Shi', 'WUZ');
INSERT INTO `yw_region` VALUES ('257', '450500', '北海市', '21', '0', '0', 'Beihai Shi', 'BHY');
INSERT INTO `yw_region` VALUES ('258', '450600', '防城港市', '21', '0', '0', 'Fangchenggang Shi', 'FAN');
INSERT INTO `yw_region` VALUES ('259', '450700', '钦州市', '21', '0', '0', 'Qinzhou Shi', 'QZH');
INSERT INTO `yw_region` VALUES ('260', '450800', '贵港市', '21', '0', '0', 'Guigang Shi', 'GUG');
INSERT INTO `yw_region` VALUES ('261', '450900', '玉林市', '21', '0', '0', 'Yulin Shi', 'YUL');
INSERT INTO `yw_region` VALUES ('262', '451000', '百色市', '21', '0', '0', 'Baise Shi', '2');
INSERT INTO `yw_region` VALUES ('263', '451100', '贺州市', '21', '0', '0', 'Hezhou Shi', '2');
INSERT INTO `yw_region` VALUES ('264', '451200', '河池市', '21', '0', '0', 'Hechi Shi', '2');
INSERT INTO `yw_region` VALUES ('265', '451300', '来宾市', '21', '0', '0', 'Laibin Shi', '2');
INSERT INTO `yw_region` VALUES ('266', '451400', '崇左市', '21', '0', '0', 'Chongzuo Shi', '2');
INSERT INTO `yw_region` VALUES ('267', '460100', '海口市', '22', '0', '0', 'Haikou Shi', 'HAK');
INSERT INTO `yw_region` VALUES ('268', '460200', '三亚市', '22', '0', '0', 'Sanya Shi', 'SYX');
INSERT INTO `yw_region` VALUES ('269', '469000', '省直辖县级行政区划', '22', '0', '0', 'shengzhixiaxianjixingzhengquhua', '2');
INSERT INTO `yw_region` VALUES ('270', '500100', '市辖区', '23', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('271', '500200', '县', '23', '0', '0', 'Xian', '2');
INSERT INTO `yw_region` VALUES ('273', '510100', '成都市', '24', '0', '0', 'Chengdu Shi', 'CTU');
INSERT INTO `yw_region` VALUES ('274', '510300', '自贡市', '24', '0', '0', 'Zigong Shi', 'ZGS');
INSERT INTO `yw_region` VALUES ('275', '510400', '攀枝花市', '24', '0', '0', 'Panzhihua Shi', 'PZH');
INSERT INTO `yw_region` VALUES ('276', '510500', '泸州市', '24', '0', '0', 'Luzhou Shi', 'LUZ');
INSERT INTO `yw_region` VALUES ('277', '510600', '德阳市', '24', '0', '0', 'Deyang Shi', 'DEY');
INSERT INTO `yw_region` VALUES ('278', '510700', '绵阳市', '24', '0', '0', 'Mianyang Shi', 'MYG');
INSERT INTO `yw_region` VALUES ('279', '510800', '广元市', '24', '0', '0', 'Guangyuan Shi', 'GYC');
INSERT INTO `yw_region` VALUES ('280', '510900', '遂宁市', '24', '0', '0', 'Suining Shi', 'SNS');
INSERT INTO `yw_region` VALUES ('281', '511000', '内江市', '24', '0', '0', 'Neijiang Shi', 'NJS');
INSERT INTO `yw_region` VALUES ('282', '511100', '乐山市', '24', '0', '0', 'Leshan Shi', 'LES');
INSERT INTO `yw_region` VALUES ('283', '511300', '南充市', '24', '0', '0', 'Nanchong Shi', 'NCO');
INSERT INTO `yw_region` VALUES ('284', '511400', '眉山市', '24', '0', '0', 'Meishan Shi', '2');
INSERT INTO `yw_region` VALUES ('285', '511500', '宜宾市', '24', '0', '0', 'Yibin Shi', 'YBS');
INSERT INTO `yw_region` VALUES ('286', '511600', '广安市', '24', '0', '0', 'Guang,an Shi', 'GAC');
INSERT INTO `yw_region` VALUES ('287', '511700', '达州市', '24', '0', '0', 'Dazhou Shi', '2');
INSERT INTO `yw_region` VALUES ('288', '511800', '雅安市', '24', '0', '0', 'Ya,an Shi', '2');
INSERT INTO `yw_region` VALUES ('289', '511900', '巴中市', '24', '0', '0', 'Bazhong Shi', '2');
INSERT INTO `yw_region` VALUES ('290', '512000', '资阳市', '24', '0', '0', 'Ziyang Shi', '2');
INSERT INTO `yw_region` VALUES ('291', '513200', '阿坝藏族羌族自治州', '24', '0', '0', 'Aba(Ngawa) Zangzu Qiangzu Zizhizhou', 'ABA');
INSERT INTO `yw_region` VALUES ('292', '513300', '甘孜藏族自治州', '24', '0', '0', 'Garze Zangzu Zizhizhou', 'GAZ');
INSERT INTO `yw_region` VALUES ('293', '513400', '凉山彝族自治州', '24', '0', '0', 'Liangshan Yizu Zizhizhou', 'LSY');
INSERT INTO `yw_region` VALUES ('294', '520100', '贵阳市', '25', '0', '0', 'Guiyang Shi', 'KWE');
INSERT INTO `yw_region` VALUES ('295', '520200', '六盘水市', '25', '0', '0', 'Liupanshui Shi', 'LPS');
INSERT INTO `yw_region` VALUES ('296', '520300', '遵义市', '25', '0', '0', 'Zunyi Shi', 'ZNY');
INSERT INTO `yw_region` VALUES ('297', '520400', '安顺市', '25', '0', '0', 'Anshun Xian', '2');
INSERT INTO `yw_region` VALUES ('298', '522200', '铜仁地区', '25', '0', '0', 'Tongren Diqu', 'TRD');
INSERT INTO `yw_region` VALUES ('299', '522300', '黔西南布依族苗族自治州', '25', '0', '0', 'Qianxinan Buyeizu Zizhizhou', 'QXZ');
INSERT INTO `yw_region` VALUES ('300', '522400', '毕节地区', '25', '0', '0', 'Bijie Diqu', 'BJD');
INSERT INTO `yw_region` VALUES ('301', '522600', '黔东南苗族侗族自治州', '25', '0', '0', 'Qiandongnan Miaozu Dongzu Zizhizhou', 'QND');
INSERT INTO `yw_region` VALUES ('302', '522700', '黔南布依族苗族自治州', '25', '0', '0', 'Qiannan Buyeizu Miaozu Zizhizhou', 'QNZ');
INSERT INTO `yw_region` VALUES ('303', '530100', '昆明市', '26', '0', '0', 'Kunming Shi', 'KMG');
INSERT INTO `yw_region` VALUES ('304', '530300', '曲靖市', '26', '0', '0', 'Qujing Shi', 'QJS');
INSERT INTO `yw_region` VALUES ('305', '530400', '玉溪市', '26', '0', '0', 'Yuxi Shi', 'YXS');
INSERT INTO `yw_region` VALUES ('306', '530500', '保山市', '26', '0', '0', 'Baoshan Shi', '2');
INSERT INTO `yw_region` VALUES ('307', '530600', '昭通市', '26', '0', '0', 'Zhaotong Shi', '2');
INSERT INTO `yw_region` VALUES ('308', '530700', '丽江市', '26', '0', '0', 'Lijiang Shi', '2');
INSERT INTO `yw_region` VALUES ('309', '530800', '普洱市', '26', '0', '0', 'Simao Shi', '2');
INSERT INTO `yw_region` VALUES ('310', '530900', '临沧市', '26', '0', '0', 'Lincang Shi', '2');
INSERT INTO `yw_region` VALUES ('311', '532300', '楚雄彝族自治州', '26', '0', '0', 'Chuxiong Yizu Zizhizhou', 'CXD');
INSERT INTO `yw_region` VALUES ('312', '532500', '红河哈尼族彝族自治州', '26', '0', '0', 'Honghe Hanizu Yizu Zizhizhou', 'HHZ');
INSERT INTO `yw_region` VALUES ('313', '532600', '文山壮族苗族自治州', '26', '0', '0', 'Wenshan Zhuangzu Miaozu Zizhizhou', 'WSZ');
INSERT INTO `yw_region` VALUES ('314', '532800', '西双版纳傣族自治州', '26', '0', '0', 'Xishuangbanna Daizu Zizhizhou', 'XSB');
INSERT INTO `yw_region` VALUES ('315', '532900', '大理白族自治州', '26', '0', '0', 'Dali Baizu Zizhizhou', 'DLZ');
INSERT INTO `yw_region` VALUES ('316', '533100', '德宏傣族景颇族自治州', '26', '0', '0', 'Dehong Daizu Jingpozu Zizhizhou', 'DHG');
INSERT INTO `yw_region` VALUES ('317', '533300', '怒江傈僳族自治州', '26', '0', '0', 'Nujiang Lisuzu Zizhizhou', 'NUJ');
INSERT INTO `yw_region` VALUES ('318', '533400', '迪庆藏族自治州', '26', '0', '0', 'Deqen Zangzu Zizhizhou', 'DEZ');
INSERT INTO `yw_region` VALUES ('319', '540100', '拉萨市', '27', '0', '0', 'Lhasa Shi', 'LXA');
INSERT INTO `yw_region` VALUES ('320', '542100', '昌都地区', '27', '0', '0', 'Qamdo Diqu', 'QAD');
INSERT INTO `yw_region` VALUES ('321', '542200', '山南地区', '27', '0', '0', 'Shannan Diqu', 'SND');
INSERT INTO `yw_region` VALUES ('322', '542300', '日喀则地区', '27', '0', '0', 'Xigaze Diqu', 'XID');
INSERT INTO `yw_region` VALUES ('323', '542400', '那曲地区', '27', '0', '0', 'Nagqu Diqu', 'NAD');
INSERT INTO `yw_region` VALUES ('324', '542500', '阿里地区', '27', '0', '0', 'Ngari Diqu', 'NGD');
INSERT INTO `yw_region` VALUES ('325', '542600', '林芝地区', '27', '0', '0', 'Nyingchi Diqu', 'NYD');
INSERT INTO `yw_region` VALUES ('326', '610100', '西安市', '28', '0', '0', 'Xi,an Shi', 'SIA');
INSERT INTO `yw_region` VALUES ('327', '610200', '铜川市', '28', '0', '0', 'Tongchuan Shi', 'TCN');
INSERT INTO `yw_region` VALUES ('328', '610300', '宝鸡市', '28', '0', '0', 'Baoji Shi', 'BJI');
INSERT INTO `yw_region` VALUES ('329', '610400', '咸阳市', '28', '0', '0', 'Xianyang Shi', 'XYS');
INSERT INTO `yw_region` VALUES ('330', '610500', '渭南市', '28', '0', '0', 'Weinan Shi', 'WNA');
INSERT INTO `yw_region` VALUES ('331', '610600', '延安市', '28', '0', '0', 'Yan,an Shi', 'YNA');
INSERT INTO `yw_region` VALUES ('332', '610700', '汉中市', '28', '0', '0', 'Hanzhong Shi', 'HZJ');
INSERT INTO `yw_region` VALUES ('333', '610800', '榆林市', '28', '0', '0', 'Yulin Shi', '2');
INSERT INTO `yw_region` VALUES ('334', '610900', '安康市', '28', '0', '0', 'Ankang Shi', '2');
INSERT INTO `yw_region` VALUES ('335', '611000', '商洛市', '28', '0', '0', 'Shangluo Shi', '2');
INSERT INTO `yw_region` VALUES ('336', '620100', '兰州市', '29', '0', '0', 'Lanzhou Shi', 'LHW');
INSERT INTO `yw_region` VALUES ('337', '620200', '嘉峪关市', '29', '0', '0', 'Jiayuguan Shi', 'JYG');
INSERT INTO `yw_region` VALUES ('338', '620300', '金昌市', '29', '0', '0', 'Jinchang Shi', 'JCS');
INSERT INTO `yw_region` VALUES ('339', '620400', '白银市', '29', '0', '0', 'Baiyin Shi', 'BYS');
INSERT INTO `yw_region` VALUES ('340', '620500', '天水市', '29', '0', '0', 'Tianshui Shi', 'TSU');
INSERT INTO `yw_region` VALUES ('341', '620600', '武威市', '29', '0', '0', 'Wuwei Shi', '2');
INSERT INTO `yw_region` VALUES ('342', '620700', '张掖市', '29', '0', '0', 'Zhangye Shi', '2');
INSERT INTO `yw_region` VALUES ('343', '620800', '平凉市', '29', '0', '0', 'Pingliang Shi', '2');
INSERT INTO `yw_region` VALUES ('344', '620900', '酒泉市', '29', '0', '0', 'Jiuquan Shi', '2');
INSERT INTO `yw_region` VALUES ('345', '621000', '庆阳市', '29', '0', '0', 'Qingyang Shi', '2');
INSERT INTO `yw_region` VALUES ('346', '621100', '定西市', '29', '0', '0', 'Dingxi Shi', '2');
INSERT INTO `yw_region` VALUES ('347', '621200', '陇南市', '29', '0', '0', 'Longnan Shi', '2');
INSERT INTO `yw_region` VALUES ('348', '622900', '临夏回族自治州', '29', '0', '0', 'Linxia Huizu Zizhizhou ', 'LXH');
INSERT INTO `yw_region` VALUES ('349', '623000', '甘南藏族自治州', '29', '0', '0', 'Gannan Zangzu Zizhizhou', 'GNZ');
INSERT INTO `yw_region` VALUES ('350', '630100', '西宁市', '30', '0', '0', 'Xining Shi', 'XNN');
INSERT INTO `yw_region` VALUES ('351', '632100', '海东地区', '30', '0', '0', 'Haidong Diqu', 'HDD');
INSERT INTO `yw_region` VALUES ('352', '632200', '海北藏族自治州', '30', '0', '0', 'Haibei Zangzu Zizhizhou', 'HBZ');
INSERT INTO `yw_region` VALUES ('353', '632300', '黄南藏族自治州', '30', '0', '0', 'Huangnan Zangzu Zizhizhou', 'HNZ');
INSERT INTO `yw_region` VALUES ('354', '632500', '海南藏族自治州', '30', '0', '0', 'Hainan Zangzu Zizhizhou', 'HNN');
INSERT INTO `yw_region` VALUES ('355', '632600', '果洛藏族自治州', '30', '0', '0', 'Golog Zangzu Zizhizhou', 'GOL');
INSERT INTO `yw_region` VALUES ('356', '632700', '玉树藏族自治州', '30', '0', '0', 'Yushu Zangzu Zizhizhou', 'YSZ');
INSERT INTO `yw_region` VALUES ('357', '632800', '海西蒙古族藏族自治州', '30', '0', '0', 'Haixi Mongolzu Zangzu Zizhizhou', 'HXZ');
INSERT INTO `yw_region` VALUES ('358', '640100', '银川市', '31', '0', '0', 'Yinchuan Shi', 'INC');
INSERT INTO `yw_region` VALUES ('359', '640200', '石嘴山市', '31', '0', '0', 'Shizuishan Shi', 'SZS');
INSERT INTO `yw_region` VALUES ('360', '640300', '吴忠市', '31', '0', '0', 'Wuzhong Shi', 'WZS');
INSERT INTO `yw_region` VALUES ('361', '640400', '固原市', '31', '0', '0', 'Guyuan Shi', '2');
INSERT INTO `yw_region` VALUES ('362', '640500', '中卫市', '31', '0', '0', 'Zhongwei Shi', '2');
INSERT INTO `yw_region` VALUES ('363', '650100', '乌鲁木齐市', '32', '0', '0', 'Urumqi Shi', 'URC');
INSERT INTO `yw_region` VALUES ('364', '650200', '克拉玛依市', '32', '0', '0', 'Karamay Shi', 'KAR');
INSERT INTO `yw_region` VALUES ('365', '652100', '吐鲁番地区', '32', '0', '0', 'Turpan Diqu', 'TUD');
INSERT INTO `yw_region` VALUES ('366', '652200', '哈密地区', '32', '0', '0', 'Hami(kumul) Diqu', 'HMD');
INSERT INTO `yw_region` VALUES ('367', '652300', '昌吉回族自治州', '32', '0', '0', 'Changji Huizu Zizhizhou', 'CJZ');
INSERT INTO `yw_region` VALUES ('368', '652700', '博尔塔拉蒙古自治州', '32', '0', '0', 'Bortala Monglo Zizhizhou', 'BOR');
INSERT INTO `yw_region` VALUES ('369', '652800', '巴音郭楞蒙古自治州', '32', '0', '0', 'bayinguolengmengguzizhizhou', '2');
INSERT INTO `yw_region` VALUES ('370', '652900', '阿克苏地区', '32', '0', '0', 'Aksu Diqu', 'AKD');
INSERT INTO `yw_region` VALUES ('371', '653000', '克孜勒苏柯尔克孜自治州', '32', '0', '0', 'Kizilsu Kirgiz Zizhizhou', 'KIZ');
INSERT INTO `yw_region` VALUES ('372', '653100', '喀什地区', '32', '0', '0', 'Kashi(Kaxgar) Diqu', 'KSI');
INSERT INTO `yw_region` VALUES ('373', '653200', '和田地区', '32', '0', '0', 'Hotan Diqu', 'HOD');
INSERT INTO `yw_region` VALUES ('374', '654000', '伊犁哈萨克自治州', '32', '0', '0', 'Ili Kazak Zizhizhou', 'ILD');
INSERT INTO `yw_region` VALUES ('375', '654200', '塔城地区', '32', '0', '0', 'Tacheng(Qoqek) Diqu', 'TCD');
INSERT INTO `yw_region` VALUES ('376', '654300', '阿勒泰地区', '32', '0', '0', 'Altay Diqu', 'ALD');
INSERT INTO `yw_region` VALUES ('377', '659000', '自治区直辖县级行政区划', '32', '0', '0', 'zizhiquzhixiaxianjixingzhengquhua', '2');
INSERT INTO `yw_region` VALUES ('378', '110101', '东城区', '33', '0', '0', 'Dongcheng Qu', 'DCQ');
INSERT INTO `yw_region` VALUES ('379', '110102', '西城区', '33', '0', '0', 'Xicheng Qu', 'XCQ');
INSERT INTO `yw_region` VALUES ('382', '110105', '朝阳区', '33', '0', '0', 'Chaoyang Qu', 'CYQ');
INSERT INTO `yw_region` VALUES ('383', '110106', '丰台区', '33', '0', '0', 'Fengtai Qu', 'FTQ');
INSERT INTO `yw_region` VALUES ('384', '110107', '石景山区', '33', '0', '0', 'Shijingshan Qu', 'SJS');
INSERT INTO `yw_region` VALUES ('385', '110108', '海淀区', '33', '0', '0', 'Haidian Qu', 'HDN');
INSERT INTO `yw_region` VALUES ('386', '110109', '门头沟区', '33', '0', '0', 'Mentougou Qu', 'MTG');
INSERT INTO `yw_region` VALUES ('387', '110111', '房山区', '33', '0', '0', 'Fangshan Qu', 'FSQ');
INSERT INTO `yw_region` VALUES ('388', '110112', '通州区', '33', '0', '0', 'Tongzhou Qu', 'TZQ');
INSERT INTO `yw_region` VALUES ('389', '110113', '顺义区', '33', '0', '0', 'Shunyi Qu', 'SYI');
INSERT INTO `yw_region` VALUES ('390', '110114', '昌平区', '33', '0', '0', 'Changping Qu', 'CP Q');
INSERT INTO `yw_region` VALUES ('391', '110115', '大兴区', '33', '0', '0', 'Daxing Qu', 'DX Q');
INSERT INTO `yw_region` VALUES ('392', '110116', '怀柔区', '33', '0', '0', 'Huairou Qu', 'HR Q');
INSERT INTO `yw_region` VALUES ('393', '110117', '平谷区', '33', '0', '0', 'Pinggu Qu', 'PG Q');
INSERT INTO `yw_region` VALUES ('394', '110228', '密云县', '34', '0', '0', 'Miyun Xian ', 'MYN');
INSERT INTO `yw_region` VALUES ('395', '110229', '延庆县', '34', '0', '0', 'Yanqing Xian', 'YQX');
INSERT INTO `yw_region` VALUES ('396', '120101', '和平区', '35', '0', '0', 'Heping Qu', 'HPG');
INSERT INTO `yw_region` VALUES ('397', '120102', '河东区', '35', '0', '0', 'Hedong Qu', 'HDQ');
INSERT INTO `yw_region` VALUES ('398', '120103', '河西区', '35', '0', '0', 'Hexi Qu', 'HXQ');
INSERT INTO `yw_region` VALUES ('399', '120104', '南开区', '35', '0', '0', 'Nankai Qu', 'NKQ');
INSERT INTO `yw_region` VALUES ('400', '120105', '河北区', '35', '0', '0', 'Hebei Qu', 'HBQ');
INSERT INTO `yw_region` VALUES ('401', '120106', '红桥区', '35', '0', '0', 'Hongqiao Qu', 'HQO');
INSERT INTO `yw_region` VALUES ('404', '120116', '滨海新区', '35', '0', '0', 'Dagang Qu', '2');
INSERT INTO `yw_region` VALUES ('405', '120110', '东丽区', '35', '0', '0', 'Dongli Qu', 'DLI');
INSERT INTO `yw_region` VALUES ('406', '120111', '西青区', '35', '0', '0', 'Xiqing Qu', 'XQG');
INSERT INTO `yw_region` VALUES ('407', '120112', '津南区', '35', '0', '0', 'Jinnan Qu', 'JNQ');
INSERT INTO `yw_region` VALUES ('408', '120113', '北辰区', '35', '0', '0', 'Beichen Qu', 'BCQ');
INSERT INTO `yw_region` VALUES ('409', '120114', '武清区', '35', '0', '0', 'Wuqing Qu', 'WQ Q');
INSERT INTO `yw_region` VALUES ('410', '120115', '宝坻区', '35', '0', '0', 'Baodi Qu', 'BDI');
INSERT INTO `yw_region` VALUES ('411', '120221', '宁河县', '36', '0', '0', 'Ninghe Xian', 'NHE');
INSERT INTO `yw_region` VALUES ('412', '120223', '静海县', '36', '0', '0', 'Jinghai Xian', 'JHT');
INSERT INTO `yw_region` VALUES ('413', '120225', '蓟县', '36', '0', '0', 'Ji Xian', 'JIT');
INSERT INTO `yw_region` VALUES ('414', '130101', '市辖区', '37', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('415', '130102', '长安区', '37', '0', '0', 'Chang,an Qu', 'CAQ');
INSERT INTO `yw_region` VALUES ('416', '130103', '桥东区', '37', '0', '0', 'Qiaodong Qu', 'QDQ');
INSERT INTO `yw_region` VALUES ('417', '130104', '桥西区', '37', '0', '0', 'Qiaoxi Qu', 'QXQ');
INSERT INTO `yw_region` VALUES ('418', '130105', '新华区', '37', '0', '0', 'Xinhua Qu', 'XHK');
INSERT INTO `yw_region` VALUES ('419', '130107', '井陉矿区', '37', '0', '0', 'Jingxing Kuangqu', 'JXK');
INSERT INTO `yw_region` VALUES ('420', '130108', '裕华区', '37', '0', '0', 'Yuhua Qu', '2');
INSERT INTO `yw_region` VALUES ('421', '130121', '井陉县', '37', '0', '0', 'Jingxing Xian', 'JXJ');
INSERT INTO `yw_region` VALUES ('422', '130123', '正定县', '37', '0', '0', 'Zhengding Xian', 'ZDJ');
INSERT INTO `yw_region` VALUES ('423', '130124', '栾城县', '37', '0', '0', 'Luancheng Xian', 'LCG');
INSERT INTO `yw_region` VALUES ('424', '130125', '行唐县', '37', '0', '0', 'Xingtang Xian', 'XTG');
INSERT INTO `yw_region` VALUES ('425', '130126', '灵寿县', '37', '0', '0', 'Lingshou Xian ', 'LSO');
INSERT INTO `yw_region` VALUES ('426', '130127', '高邑县', '37', '0', '0', 'Gaoyi Xian', 'GYJ');
INSERT INTO `yw_region` VALUES ('427', '130128', '深泽县', '37', '0', '0', 'Shenze Xian', '2');
INSERT INTO `yw_region` VALUES ('428', '130129', '赞皇县', '37', '0', '0', 'Zanhuang Xian', 'ZHG');
INSERT INTO `yw_region` VALUES ('429', '130130', '无极县', '37', '0', '0', 'Wuji Xian', 'WJI');
INSERT INTO `yw_region` VALUES ('430', '130131', '平山县', '37', '0', '0', 'Pingshan Xian', 'PSH');
INSERT INTO `yw_region` VALUES ('431', '130132', '元氏县', '37', '0', '0', 'Yuanshi Xian', 'YSI');
INSERT INTO `yw_region` VALUES ('432', '130133', '赵县', '37', '0', '0', 'Zhao Xian', 'ZAO');
INSERT INTO `yw_region` VALUES ('433', '130181', '辛集市', '37', '0', '0', 'Xinji Shi', 'XJS');
INSERT INTO `yw_region` VALUES ('434', '130182', '藁城市', '37', '0', '0', 'Gaocheng Shi', 'GCS');
INSERT INTO `yw_region` VALUES ('435', '130183', '晋州市', '37', '0', '0', 'Jinzhou Shi', 'JZJ');
INSERT INTO `yw_region` VALUES ('436', '130184', '新乐市', '37', '0', '0', 'Xinle Shi', 'XLE');
INSERT INTO `yw_region` VALUES ('437', '130185', '鹿泉市', '37', '0', '0', 'Luquan Shi', 'LUQ');
INSERT INTO `yw_region` VALUES ('438', '130201', '市辖区', '38', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('439', '130202', '路南区', '38', '0', '0', 'Lunan Qu', 'LNB');
INSERT INTO `yw_region` VALUES ('440', '130203', '路北区', '38', '0', '0', 'Lubei Qu', 'LBQ');
INSERT INTO `yw_region` VALUES ('441', '130204', '古冶区', '38', '0', '0', 'Guye Qu', 'GYE');
INSERT INTO `yw_region` VALUES ('442', '130205', '开平区', '38', '0', '0', 'Kaiping Qu', 'KPQ');
INSERT INTO `yw_region` VALUES ('443', '130207', '丰南区', '38', '0', '0', 'Fengnan Qu', '2');
INSERT INTO `yw_region` VALUES ('444', '130208', '丰润区', '38', '0', '0', 'Fengrun Qu', '2');
INSERT INTO `yw_region` VALUES ('445', '130223', '滦县', '38', '0', '0', 'Luan Xian', 'LUA');
INSERT INTO `yw_region` VALUES ('446', '130224', '滦南县', '38', '0', '0', 'Luannan Xian', 'LNJ');
INSERT INTO `yw_region` VALUES ('447', '130225', '乐亭县', '38', '0', '0', 'Leting Xian', 'LTJ');
INSERT INTO `yw_region` VALUES ('448', '130227', '迁西县', '38', '0', '0', 'Qianxi Xian', 'QXX');
INSERT INTO `yw_region` VALUES ('449', '130229', '玉田县', '38', '0', '0', 'Yutian Xian', 'YTJ');
INSERT INTO `yw_region` VALUES ('450', '130230', '唐海县', '38', '0', '0', 'Tanghai Xian ', 'THA');
INSERT INTO `yw_region` VALUES ('451', '130281', '遵化市', '38', '0', '0', 'Zunhua Shi', 'ZNH');
INSERT INTO `yw_region` VALUES ('452', '130283', '迁安市', '38', '0', '0', 'Qian,an Shi', 'QAS');
INSERT INTO `yw_region` VALUES ('453', '130301', '市辖区', '39', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('454', '130302', '海港区', '39', '0', '0', 'Haigang Qu', 'HGG');
INSERT INTO `yw_region` VALUES ('455', '130303', '山海关区', '39', '0', '0', 'Shanhaiguan Qu', 'SHG');
INSERT INTO `yw_region` VALUES ('456', '130304', '北戴河区', '39', '0', '0', 'Beidaihe Qu', 'BDH');
INSERT INTO `yw_region` VALUES ('457', '130321', '青龙满族自治县', '39', '0', '0', 'Qinglong Manzu Zizhixian', 'QLM');
INSERT INTO `yw_region` VALUES ('458', '130322', '昌黎县', '39', '0', '0', 'Changli Xian', 'CGL');
INSERT INTO `yw_region` VALUES ('459', '130323', '抚宁县', '39', '0', '0', 'Funing Xian ', 'FUN');
INSERT INTO `yw_region` VALUES ('460', '130324', '卢龙县', '39', '0', '0', 'Lulong Xian', 'LLG');
INSERT INTO `yw_region` VALUES ('461', '130401', '市辖区', '40', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('462', '130402', '邯山区', '40', '0', '0', 'Hanshan Qu', 'HHD');
INSERT INTO `yw_region` VALUES ('463', '130403', '丛台区', '40', '0', '0', 'Congtai Qu', 'CTQ');
INSERT INTO `yw_region` VALUES ('464', '130404', '复兴区', '40', '0', '0', 'Fuxing Qu', 'FXQ');
INSERT INTO `yw_region` VALUES ('465', '130406', '峰峰矿区', '40', '0', '0', 'Fengfeng Kuangqu', 'FFK');
INSERT INTO `yw_region` VALUES ('466', '130421', '邯郸县', '40', '0', '0', 'Handan Xian ', 'HDX');
INSERT INTO `yw_region` VALUES ('467', '130423', '临漳县', '40', '0', '0', 'Linzhang Xian ', 'LNZ');
INSERT INTO `yw_region` VALUES ('468', '130424', '成安县', '40', '0', '0', 'Cheng,an Xian', 'CAJ');
INSERT INTO `yw_region` VALUES ('469', '130425', '大名县', '40', '0', '0', 'Daming Xian', 'DMX');
INSERT INTO `yw_region` VALUES ('470', '130426', '涉县', '40', '0', '0', 'She Xian', 'SEJ');
INSERT INTO `yw_region` VALUES ('471', '130427', '磁县', '40', '0', '0', 'Ci Xian', 'CIX');
INSERT INTO `yw_region` VALUES ('472', '130428', '肥乡县', '40', '0', '0', 'Feixiang Xian', 'FXJ');
INSERT INTO `yw_region` VALUES ('473', '130429', '永年县', '40', '0', '0', 'Yongnian Xian', 'YON');
INSERT INTO `yw_region` VALUES ('474', '130430', '邱县', '40', '0', '0', 'Qiu Xian', 'QIU');
INSERT INTO `yw_region` VALUES ('475', '130431', '鸡泽县', '40', '0', '0', 'Jize Xian', 'JZE');
INSERT INTO `yw_region` VALUES ('476', '130432', '广平县', '40', '0', '0', 'Guangping Xian ', 'GPX');
INSERT INTO `yw_region` VALUES ('477', '130433', '馆陶县', '40', '0', '0', 'Guantao Xian', 'GTO');
INSERT INTO `yw_region` VALUES ('478', '130434', '魏县', '40', '0', '0', 'Wei Xian ', 'WEI');
INSERT INTO `yw_region` VALUES ('479', '130435', '曲周县', '40', '0', '0', 'Quzhou Xian ', 'QZX');
INSERT INTO `yw_region` VALUES ('480', '130481', '武安市', '40', '0', '0', 'Wu,an Shi', 'WUA');
INSERT INTO `yw_region` VALUES ('481', '130501', '市辖区', '41', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('482', '130502', '桥东区', '41', '0', '0', 'Qiaodong Qu', 'QDG');
INSERT INTO `yw_region` VALUES ('483', '130503', '桥西区', '41', '0', '0', 'Qiaoxi Qu', 'QXT');
INSERT INTO `yw_region` VALUES ('484', '130521', '邢台县', '41', '0', '0', 'Xingtai Xian', 'XTJ');
INSERT INTO `yw_region` VALUES ('485', '130522', '临城县', '41', '0', '0', 'Lincheng Xian ', 'LNC');
INSERT INTO `yw_region` VALUES ('486', '130523', '内丘县', '41', '0', '0', 'Neiqiu Xian ', 'NQU');
INSERT INTO `yw_region` VALUES ('487', '130524', '柏乡县', '41', '0', '0', 'Baixiang Xian', 'BXG');
INSERT INTO `yw_region` VALUES ('488', '130525', '隆尧县', '41', '0', '0', 'Longyao Xian', 'LYO');
INSERT INTO `yw_region` VALUES ('489', '130526', '任县', '41', '0', '0', 'Ren Xian', 'REN');
INSERT INTO `yw_region` VALUES ('490', '130527', '南和县', '41', '0', '0', 'Nanhe Xian', 'NHX');
INSERT INTO `yw_region` VALUES ('491', '130528', '宁晋县', '41', '0', '0', 'Ningjin Xian', 'NJN');
INSERT INTO `yw_region` VALUES ('492', '130529', '巨鹿县', '41', '0', '0', 'Julu Xian', 'JLU');
INSERT INTO `yw_region` VALUES ('493', '130530', '新河县', '41', '0', '0', 'Xinhe Xian ', 'XHJ');
INSERT INTO `yw_region` VALUES ('494', '130531', '广宗县', '41', '0', '0', 'Guangzong Xian ', 'GZJ');
INSERT INTO `yw_region` VALUES ('495', '130532', '平乡县', '41', '0', '0', 'Pingxiang Xian', 'PXX');
INSERT INTO `yw_region` VALUES ('496', '130533', '威县', '41', '0', '0', 'Wei Xian ', 'WEX');
INSERT INTO `yw_region` VALUES ('497', '130534', '清河县', '41', '0', '0', 'Qinghe Xian', 'QHE');
INSERT INTO `yw_region` VALUES ('498', '130535', '临西县', '41', '0', '0', 'Linxi Xian', 'LXI');
INSERT INTO `yw_region` VALUES ('499', '130581', '南宫市', '41', '0', '0', 'Nangong Shi', 'NGO');
INSERT INTO `yw_region` VALUES ('500', '130582', '沙河市', '41', '0', '0', 'Shahe Shi', 'SHS');
INSERT INTO `yw_region` VALUES ('501', '130601', '市辖区', '42', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('502', '130600', '新市区', '42', '0', '0', 'Xinshi Qu', '2');
INSERT INTO `yw_region` VALUES ('503', '130603', '北市区', '42', '0', '0', 'Beishi Qu', 'BSI');
INSERT INTO `yw_region` VALUES ('504', '130604', '南市区', '42', '0', '0', 'Nanshi Qu', 'NSB');
INSERT INTO `yw_region` VALUES ('505', '130621', '满城县', '42', '0', '0', 'Mancheng Xian ', 'MCE');
INSERT INTO `yw_region` VALUES ('506', '130622', '清苑县', '42', '0', '0', 'Qingyuan Xian', 'QYJ');
INSERT INTO `yw_region` VALUES ('507', '130623', '涞水县', '42', '0', '0', 'Laishui Xian', 'LSM');
INSERT INTO `yw_region` VALUES ('508', '130624', '阜平县', '42', '0', '0', 'Fuping Xian ', 'FUP');
INSERT INTO `yw_region` VALUES ('509', '130625', '徐水县', '42', '0', '0', 'Xushui Xian ', 'XSJ');
INSERT INTO `yw_region` VALUES ('510', '130626', '定兴县', '42', '0', '0', 'Dingxing Xian ', 'DXG');
INSERT INTO `yw_region` VALUES ('511', '130627', '唐县', '42', '0', '0', 'Tang Xian ', 'TAG');
INSERT INTO `yw_region` VALUES ('512', '130628', '高阳县', '42', '0', '0', 'Gaoyang Xian ', 'GAY');
INSERT INTO `yw_region` VALUES ('513', '130629', '容城县', '42', '0', '0', 'Rongcheng Xian ', 'RCX');
INSERT INTO `yw_region` VALUES ('514', '130630', '涞源县', '42', '0', '0', 'Laiyuan Xian ', 'LIY');
INSERT INTO `yw_region` VALUES ('515', '130631', '望都县', '42', '0', '0', 'Wangdu Xian ', 'WDU');
INSERT INTO `yw_region` VALUES ('516', '130632', '安新县', '42', '0', '0', 'Anxin Xian ', 'AXX');
INSERT INTO `yw_region` VALUES ('517', '130633', '易县', '42', '0', '0', 'Yi Xian', 'YII');
INSERT INTO `yw_region` VALUES ('518', '130634', '曲阳县', '42', '0', '0', 'Quyang Xian ', 'QUY');
INSERT INTO `yw_region` VALUES ('519', '130635', '蠡县', '42', '0', '0', 'Li Xian', 'LXJ');
INSERT INTO `yw_region` VALUES ('520', '130636', '顺平县', '42', '0', '0', 'Shunping Xian ', 'SPI');
INSERT INTO `yw_region` VALUES ('521', '130637', '博野县', '42', '0', '0', 'Boye Xian ', 'BYE');
INSERT INTO `yw_region` VALUES ('522', '130638', '雄县', '42', '0', '0', 'Xiong Xian', 'XOX');
INSERT INTO `yw_region` VALUES ('523', '130681', '涿州市', '42', '0', '0', 'Zhuozhou Shi', 'ZZO');
INSERT INTO `yw_region` VALUES ('524', '130682', '定州市', '42', '0', '0', 'Dingzhou Shi ', 'DZO');
INSERT INTO `yw_region` VALUES ('525', '130683', '安国市', '42', '0', '0', 'Anguo Shi ', 'AGO');
INSERT INTO `yw_region` VALUES ('526', '130684', '高碑店市', '42', '0', '0', 'Gaobeidian Shi', 'GBD');
INSERT INTO `yw_region` VALUES ('527', '130701', '市辖区', '43', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('528', '130702', '桥东区', '43', '0', '0', 'Qiaodong Qu', 'QDZ');
INSERT INTO `yw_region` VALUES ('529', '130703', '桥西区', '43', '0', '0', 'Qiaoxi Qu', 'QXI');
INSERT INTO `yw_region` VALUES ('530', '130705', '宣化区', '43', '0', '0', 'Xuanhua Qu', 'XHZ');
INSERT INTO `yw_region` VALUES ('531', '130706', '下花园区', '43', '0', '0', 'Xiahuayuan Qu ', 'XHY');
INSERT INTO `yw_region` VALUES ('532', '130721', '宣化县', '43', '0', '0', 'Xuanhua Xian ', 'XHX');
INSERT INTO `yw_region` VALUES ('533', '130722', '张北县', '43', '0', '0', 'Zhangbei Xian ', 'ZGB');
INSERT INTO `yw_region` VALUES ('534', '130723', '康保县', '43', '0', '0', 'Kangbao Xian', 'KBO');
INSERT INTO `yw_region` VALUES ('535', '130724', '沽源县', '43', '0', '0', 'Guyuan Xian', '2');
INSERT INTO `yw_region` VALUES ('536', '130725', '尚义县', '43', '0', '0', 'Shangyi Xian', 'SYK');
INSERT INTO `yw_region` VALUES ('537', '130726', '蔚县', '43', '0', '0', 'Yu Xian', 'YXJ');
INSERT INTO `yw_region` VALUES ('538', '130727', '阳原县', '43', '0', '0', 'Yangyuan Xian', 'YYN');
INSERT INTO `yw_region` VALUES ('539', '130728', '怀安县', '43', '0', '0', 'Huai,an Xian', 'HAX');
INSERT INTO `yw_region` VALUES ('540', '130729', '万全县', '43', '0', '0', 'Wanquan Xian ', 'WQN');
INSERT INTO `yw_region` VALUES ('541', '130730', '怀来县', '43', '0', '0', 'Huailai Xian', 'HLA');
INSERT INTO `yw_region` VALUES ('542', '130731', '涿鹿县', '43', '0', '0', 'Zhuolu Xian ', 'ZLU');
INSERT INTO `yw_region` VALUES ('543', '130732', '赤城县', '43', '0', '0', 'Chicheng Xian', 'CCX');
INSERT INTO `yw_region` VALUES ('544', '130733', '崇礼县', '43', '0', '0', 'Chongli Xian', 'COL');
INSERT INTO `yw_region` VALUES ('545', '130801', '市辖区', '44', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('546', '130802', '双桥区', '44', '0', '0', 'Shuangqiao Qu ', 'SQO');
INSERT INTO `yw_region` VALUES ('547', '130803', '双滦区', '44', '0', '0', 'Shuangluan Qu', 'SLQ');
INSERT INTO `yw_region` VALUES ('548', '130804', '鹰手营子矿区', '44', '0', '0', 'Yingshouyingzi Kuangqu', 'YSY');
INSERT INTO `yw_region` VALUES ('549', '130821', '承德县', '44', '0', '0', 'Chengde Xian', 'CDX');
INSERT INTO `yw_region` VALUES ('550', '130822', '兴隆县', '44', '0', '0', 'Xinglong Xian', 'XLJ');
INSERT INTO `yw_region` VALUES ('551', '130823', '平泉县', '44', '0', '0', 'Pingquan Xian', 'PQN');
INSERT INTO `yw_region` VALUES ('552', '130824', '滦平县', '44', '0', '0', 'Luanping Xian ', 'LUP');
INSERT INTO `yw_region` VALUES ('553', '130825', '隆化县', '44', '0', '0', 'Longhua Xian', 'LHJ');
INSERT INTO `yw_region` VALUES ('554', '130826', '丰宁满族自治县', '44', '0', '0', 'Fengning Manzu Zizhixian', 'FNJ');
INSERT INTO `yw_region` VALUES ('555', '130827', '宽城满族自治县', '44', '0', '0', 'Kuancheng Manzu Zizhixian', 'KCX');
INSERT INTO `yw_region` VALUES ('556', '130828', '围场满族蒙古族自治县', '44', '0', '0', 'Weichang Manzu Menggolzu Zizhixian', 'WCJ');
INSERT INTO `yw_region` VALUES ('557', '130901', '市辖区', '45', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('558', '130902', '新华区', '45', '0', '0', 'Xinhua Qu', 'XHF');
INSERT INTO `yw_region` VALUES ('559', '130903', '运河区', '45', '0', '0', 'Yunhe Qu', 'YHC');
INSERT INTO `yw_region` VALUES ('560', '130921', '沧县', '45', '0', '0', 'Cang Xian', 'CAG');
INSERT INTO `yw_region` VALUES ('561', '130922', '青县', '45', '0', '0', 'Qing Xian', 'QIG');
INSERT INTO `yw_region` VALUES ('562', '130923', '东光县', '45', '0', '0', 'Dongguang Xian ', 'DGU');
INSERT INTO `yw_region` VALUES ('563', '130924', '海兴县', '45', '0', '0', 'Haixing Xian', 'HXG');
INSERT INTO `yw_region` VALUES ('564', '130925', '盐山县', '45', '0', '0', 'Yanshan Xian', 'YNS');
INSERT INTO `yw_region` VALUES ('565', '130926', '肃宁县', '45', '0', '0', 'Suning Xian ', 'SNG');
INSERT INTO `yw_region` VALUES ('566', '130927', '南皮县', '45', '0', '0', 'Nanpi Xian', 'NPI');
INSERT INTO `yw_region` VALUES ('567', '130928', '吴桥县', '45', '0', '0', 'Wuqiao Xian ', 'WUQ');
INSERT INTO `yw_region` VALUES ('568', '130929', '献县', '45', '0', '0', 'Xian Xian ', 'XXN');
INSERT INTO `yw_region` VALUES ('569', '130930', '孟村回族自治县', '45', '0', '0', 'Mengcun Huizu Zizhixian', 'MCN');
INSERT INTO `yw_region` VALUES ('570', '130981', '泊头市', '45', '0', '0', 'Botou Shi ', 'BOT');
INSERT INTO `yw_region` VALUES ('571', '130982', '任丘市', '45', '0', '0', 'Renqiu Shi', 'RQS');
INSERT INTO `yw_region` VALUES ('572', '130983', '黄骅市', '45', '0', '0', 'Huanghua Shi', 'HHJ');
INSERT INTO `yw_region` VALUES ('573', '130984', '河间市', '45', '0', '0', 'Hejian Shi', 'HJN');
INSERT INTO `yw_region` VALUES ('574', '131001', '市辖区', '46', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('575', '131002', '安次区', '46', '0', '0', 'Anci Qu', 'ACI');
INSERT INTO `yw_region` VALUES ('576', '131003', '广阳区', '46', '0', '0', 'Guangyang Qu', '2');
INSERT INTO `yw_region` VALUES ('577', '131022', '固安县', '46', '0', '0', 'Gu,an Xian', 'GUA');
INSERT INTO `yw_region` VALUES ('578', '131023', '永清县', '46', '0', '0', 'Yongqing Xian ', 'YQG');
INSERT INTO `yw_region` VALUES ('579', '131024', '香河县', '46', '0', '0', 'Xianghe Xian', 'XGH');
INSERT INTO `yw_region` VALUES ('580', '131025', '大城县', '46', '0', '0', 'Dacheng Xian', 'DCJ');
INSERT INTO `yw_region` VALUES ('581', '131026', '文安县', '46', '0', '0', 'Wen,an Xian', 'WEA');
INSERT INTO `yw_region` VALUES ('582', '131028', '大厂回族自治县', '46', '0', '0', 'Dachang Huizu Zizhixian', 'DCG');
INSERT INTO `yw_region` VALUES ('583', '131081', '霸州市', '46', '0', '0', 'Bazhou Shi', 'BZO');
INSERT INTO `yw_region` VALUES ('584', '131082', '三河市', '46', '0', '0', 'Sanhe Shi', 'SNH');
INSERT INTO `yw_region` VALUES ('585', '131101', '市辖区', '47', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('586', '131102', '桃城区', '47', '0', '0', 'Taocheng Qu', 'TOC');
INSERT INTO `yw_region` VALUES ('587', '131121', '枣强县', '47', '0', '0', 'Zaoqiang Xian ', 'ZQJ');
INSERT INTO `yw_region` VALUES ('588', '131122', '武邑县', '47', '0', '0', 'Wuyi Xian', 'WYI');
INSERT INTO `yw_region` VALUES ('589', '131123', '武强县', '47', '0', '0', 'Wuqiang Xian ', 'WQG');
INSERT INTO `yw_region` VALUES ('590', '131124', '饶阳县', '47', '0', '0', 'Raoyang Xian', 'RYG');
INSERT INTO `yw_region` VALUES ('591', '131125', '安平县', '47', '0', '0', 'Anping Xian', 'APG');
INSERT INTO `yw_region` VALUES ('592', '131126', '故城县', '47', '0', '0', 'Gucheng Xian', 'GCE');
INSERT INTO `yw_region` VALUES ('593', '131127', '景县', '47', '0', '0', 'Jing Xian ', 'JIG');
INSERT INTO `yw_region` VALUES ('594', '131128', '阜城县', '47', '0', '0', 'Fucheng Xian ', 'FCE');
INSERT INTO `yw_region` VALUES ('595', '131181', '冀州市', '47', '0', '0', 'Jizhou Shi ', 'JIZ');
INSERT INTO `yw_region` VALUES ('596', '131182', '深州市', '47', '0', '0', 'Shenzhou Shi', 'SNZ');
INSERT INTO `yw_region` VALUES ('597', '140101', '市辖区', '48', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('598', '140105', '小店区', '48', '0', '0', 'Xiaodian Qu', 'XDQ');
INSERT INTO `yw_region` VALUES ('599', '140106', '迎泽区', '48', '0', '0', 'Yingze Qu', 'YZT');
INSERT INTO `yw_region` VALUES ('600', '140107', '杏花岭区', '48', '0', '0', 'Xinghualing Qu', 'XHL');
INSERT INTO `yw_region` VALUES ('601', '140108', '尖草坪区', '48', '0', '0', 'Jiancaoping Qu', 'JCP');
INSERT INTO `yw_region` VALUES ('602', '140109', '万柏林区', '48', '0', '0', 'Wanbailin Qu', 'WBL');
INSERT INTO `yw_region` VALUES ('603', '140110', '晋源区', '48', '0', '0', 'Jinyuan Qu', 'JYM');
INSERT INTO `yw_region` VALUES ('604', '140121', '清徐县', '48', '0', '0', 'Qingxu Xian ', 'QXU');
INSERT INTO `yw_region` VALUES ('605', '140122', '阳曲县', '48', '0', '0', 'Yangqu Xian ', 'YGQ');
INSERT INTO `yw_region` VALUES ('606', '140123', '娄烦县', '48', '0', '0', 'Loufan Xian', 'LFA');
INSERT INTO `yw_region` VALUES ('607', '140181', '古交市', '48', '0', '0', 'Gujiao Shi', 'GUJ');
INSERT INTO `yw_region` VALUES ('608', '140201', '市辖区', '49', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('609', '140202', '城区', '49', '0', '0', 'Chengqu', 'CQD');
INSERT INTO `yw_region` VALUES ('610', '140203', '矿区', '49', '0', '0', 'Kuangqu', 'KQD');
INSERT INTO `yw_region` VALUES ('611', '140211', '南郊区', '49', '0', '0', 'Nanjiao Qu', 'NJQ');
INSERT INTO `yw_region` VALUES ('612', '140212', '新荣区', '49', '0', '0', 'Xinrong Qu', 'XRQ');
INSERT INTO `yw_region` VALUES ('613', '140221', '阳高县', '49', '0', '0', 'Yanggao Xian ', 'YGO');
INSERT INTO `yw_region` VALUES ('614', '140222', '天镇县', '49', '0', '0', 'Tianzhen Xian ', 'TZE');
INSERT INTO `yw_region` VALUES ('615', '140223', '广灵县', '49', '0', '0', 'Guangling Xian ', 'GLJ');
INSERT INTO `yw_region` VALUES ('616', '140224', '灵丘县', '49', '0', '0', 'Lingqiu Xian ', 'LQX');
INSERT INTO `yw_region` VALUES ('617', '140225', '浑源县', '49', '0', '0', 'Hunyuan Xian', 'HYM');
INSERT INTO `yw_region` VALUES ('618', '140226', '左云县', '49', '0', '0', 'Zuoyun Xian', 'ZUY');
INSERT INTO `yw_region` VALUES ('619', '140227', '大同县', '49', '0', '0', 'Datong Xian ', 'DTX');
INSERT INTO `yw_region` VALUES ('620', '140301', '市辖区', '50', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('621', '140302', '城区', '50', '0', '0', 'Chengqu', 'CQU');
INSERT INTO `yw_region` VALUES ('622', '140303', '矿区', '50', '0', '0', 'Kuangqu', 'KQY');
INSERT INTO `yw_region` VALUES ('623', '140311', '郊区', '50', '0', '0', 'Jiaoqu', 'JQY');
INSERT INTO `yw_region` VALUES ('624', '140321', '平定县', '50', '0', '0', 'Pingding Xian', 'PDG');
INSERT INTO `yw_region` VALUES ('625', '140322', '盂县', '50', '0', '0', 'Yu Xian', 'YUX');
INSERT INTO `yw_region` VALUES ('626', '140401', '市辖区', '51', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('627', '140402', '城区', '51', '0', '0', 'Chengqu ', 'CQC');
INSERT INTO `yw_region` VALUES ('628', '140411', '郊区', '51', '0', '0', 'Jiaoqu', 'JQZ');
INSERT INTO `yw_region` VALUES ('629', '140421', '长治县', '51', '0', '0', 'Changzhi Xian', 'CZI');
INSERT INTO `yw_region` VALUES ('630', '140423', '襄垣县', '51', '0', '0', 'Xiangyuan Xian', 'XYJ');
INSERT INTO `yw_region` VALUES ('631', '140424', '屯留县', '51', '0', '0', 'Tunliu Xian', 'TNL');
INSERT INTO `yw_region` VALUES ('632', '140425', '平顺县', '51', '0', '0', 'Pingshun Xian', 'PSX');
INSERT INTO `yw_region` VALUES ('633', '140426', '黎城县', '51', '0', '0', 'Licheng Xian', 'LIC');
INSERT INTO `yw_region` VALUES ('634', '140427', '壶关县', '51', '0', '0', 'Huguan Xian', 'HGN');
INSERT INTO `yw_region` VALUES ('635', '140428', '长子县', '51', '0', '0', 'Zhangzi Xian ', 'ZHZ');
INSERT INTO `yw_region` VALUES ('636', '140429', '武乡县', '51', '0', '0', 'Wuxiang Xian', 'WXG');
INSERT INTO `yw_region` VALUES ('637', '140430', '沁县', '51', '0', '0', 'Qin Xian', 'QIN');
INSERT INTO `yw_region` VALUES ('638', '140431', '沁源县', '51', '0', '0', 'Qinyuan Xian ', 'QYU');
INSERT INTO `yw_region` VALUES ('639', '140481', '潞城市', '51', '0', '0', 'Lucheng Shi', 'LCS');
INSERT INTO `yw_region` VALUES ('640', '140501', '市辖区', '52', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('641', '140502', '城区', '52', '0', '0', 'Chengqu ', 'CQJ');
INSERT INTO `yw_region` VALUES ('642', '140521', '沁水县', '52', '0', '0', 'Qinshui Xian', 'QSI');
INSERT INTO `yw_region` VALUES ('643', '140522', '阳城县', '52', '0', '0', 'Yangcheng Xian ', 'YGC');
INSERT INTO `yw_region` VALUES ('644', '140524', '陵川县', '52', '0', '0', 'Lingchuan Xian', 'LGC');
INSERT INTO `yw_region` VALUES ('645', '140525', '泽州县', '52', '0', '0', 'Zezhou Xian', 'ZEZ');
INSERT INTO `yw_region` VALUES ('646', '140581', '高平市', '52', '0', '0', 'Gaoping Shi ', 'GPG');
INSERT INTO `yw_region` VALUES ('647', '140601', '市辖区', '53', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('648', '140602', '朔城区', '53', '0', '0', 'Shuocheng Qu', 'SCH');
INSERT INTO `yw_region` VALUES ('649', '140603', '平鲁区', '53', '0', '0', 'Pinglu Qu', 'PLU');
INSERT INTO `yw_region` VALUES ('650', '140621', '山阴县', '53', '0', '0', 'Shanyin Xian', 'SYP');
INSERT INTO `yw_region` VALUES ('651', '140622', '应县', '53', '0', '0', 'Ying Xian', 'YIG');
INSERT INTO `yw_region` VALUES ('652', '140623', '右玉县', '53', '0', '0', 'Youyu Xian ', 'YOY');
INSERT INTO `yw_region` VALUES ('653', '140624', '怀仁县', '53', '0', '0', 'Huairen Xian', 'HRN');
INSERT INTO `yw_region` VALUES ('654', '140701', '市辖区', '54', '0', '0', '1', '2');
INSERT INTO `yw_region` VALUES ('655', '140702', '榆次区', '54', '0', '0', 'Yuci Qu', '2');
INSERT INTO `yw_region` VALUES ('656', '140721', '榆社县', '54', '0', '0', 'Yushe Xian', '2');
INSERT INTO `yw_region` VALUES ('657', '140722', '左权县', '54', '0', '0', 'Zuoquan Xian', '2');
INSERT INTO `yw_region` VALUES ('658', '140723', '和顺县', '54', '0', '0', 'Heshun Xian', '2');
INSERT INTO `yw_region` VALUES ('659', '140724', '昔阳县', '54', '0', '0', 'Xiyang Xian', '2');
INSERT INTO `yw_region` VALUES ('660', '140725', '寿阳县', '54', '0', '0', 'Shouyang Xian', '2');
INSERT INTO `yw_region` VALUES ('661', '140726', '太谷县', '54', '0', '0', 'Taigu Xian', '2');
INSERT INTO `yw_region` VALUES ('662', '140727', '祁县', '54', '0', '0', 'Qi Xian', '2');
INSERT INTO `yw_region` VALUES ('663', '140728', '平遥县', '54', '0', '0', 'Pingyao Xian', '2');
INSERT INTO `yw_region` VALUES ('664', '140729', '灵石县', '54', '0', '0', 'Lingshi Xian', '2');
INSERT INTO `yw_region` VALUES ('665', '140781', '介休市', '54', '0', '0', 'Jiexiu Shi', '2');
INSERT INTO `yw_region` VALUES ('666', '140801', '市辖区', '55', '0', '0', '1', '2');
INSERT INTO `yw_region` VALUES ('667', '140802', '盐湖区', '55', '0', '0', 'Yanhu Qu', '2');
INSERT INTO `yw_region` VALUES ('668', '140821', '临猗县', '55', '0', '0', 'Linyi Xian', '2');
INSERT INTO `yw_region` VALUES ('669', '140822', '万荣县', '55', '0', '0', 'Wanrong Xian', '2');
INSERT INTO `yw_region` VALUES ('670', '140823', '闻喜县', '55', '0', '0', 'Wenxi Xian', '2');
INSERT INTO `yw_region` VALUES ('671', '140824', '稷山县', '55', '0', '0', 'Jishan Xian', '2');
INSERT INTO `yw_region` VALUES ('672', '140825', '新绛县', '55', '0', '0', 'Xinjiang Xian', '2');
INSERT INTO `yw_region` VALUES ('673', '140826', '绛县', '55', '0', '0', 'Jiang Xian', '2');
INSERT INTO `yw_region` VALUES ('674', '140827', '垣曲县', '55', '0', '0', 'Yuanqu Xian', '2');
INSERT INTO `yw_region` VALUES ('675', '140828', '夏县', '55', '0', '0', 'Xia Xian ', '2');
INSERT INTO `yw_region` VALUES ('676', '140829', '平陆县', '55', '0', '0', 'Pinglu Xian', '2');
INSERT INTO `yw_region` VALUES ('677', '140830', '芮城县', '55', '0', '0', 'Ruicheng Xian', '2');
INSERT INTO `yw_region` VALUES ('678', '140881', '永济市', '55', '0', '0', 'Yongji Shi ', '2');
INSERT INTO `yw_region` VALUES ('679', '140882', '河津市', '55', '0', '0', 'Hejin Shi', '2');
INSERT INTO `yw_region` VALUES ('680', '140901', '市辖区', '56', '0', '0', '1', '2');
INSERT INTO `yw_region` VALUES ('681', '140902', '忻府区', '56', '0', '0', 'Xinfu Qu', '2');
INSERT INTO `yw_region` VALUES ('682', '140921', '定襄县', '56', '0', '0', 'Dingxiang Xian', '2');
INSERT INTO `yw_region` VALUES ('683', '140922', '五台县', '56', '0', '0', 'Wutai Xian', '2');
INSERT INTO `yw_region` VALUES ('684', '140923', '代县', '56', '0', '0', 'Dai Xian', '2');
INSERT INTO `yw_region` VALUES ('685', '140924', '繁峙县', '56', '0', '0', 'Fanshi Xian', '2');
INSERT INTO `yw_region` VALUES ('686', '140925', '宁武县', '56', '0', '0', 'Ningwu Xian', '2');
INSERT INTO `yw_region` VALUES ('687', '140926', '静乐县', '56', '0', '0', 'Jingle Xian', '2');
INSERT INTO `yw_region` VALUES ('688', '140927', '神池县', '56', '0', '0', 'Shenchi Xian', '2');
INSERT INTO `yw_region` VALUES ('689', '140928', '五寨县', '56', '0', '0', 'Wuzhai Xian', '2');
INSERT INTO `yw_region` VALUES ('690', '140929', '岢岚县', '56', '0', '0', 'Kelan Xian', '2');
INSERT INTO `yw_region` VALUES ('691', '140930', '河曲县', '56', '0', '0', 'Hequ Xian ', '2');
INSERT INTO `yw_region` VALUES ('692', '140931', '保德县', '56', '0', '0', 'Baode Xian', '2');
INSERT INTO `yw_region` VALUES ('693', '140932', '偏关县', '56', '0', '0', 'Pianguan Xian', '2');
INSERT INTO `yw_region` VALUES ('694', '140981', '原平市', '56', '0', '0', 'Yuanping Shi', '2');
INSERT INTO `yw_region` VALUES ('695', '141001', '市辖区', '57', '0', '0', '1', '2');
INSERT INTO `yw_region` VALUES ('696', '141002', '尧都区', '57', '0', '0', 'Yaodu Qu', '2');
INSERT INTO `yw_region` VALUES ('697', '141021', '曲沃县', '57', '0', '0', 'Quwo Xian ', '2');
INSERT INTO `yw_region` VALUES ('698', '141022', '翼城县', '57', '0', '0', 'Yicheng Xian', '2');
INSERT INTO `yw_region` VALUES ('699', '141023', '襄汾县', '57', '0', '0', 'Xiangfen Xian', '2');
INSERT INTO `yw_region` VALUES ('700', '141024', '洪洞县', '57', '0', '0', 'Hongtong Xian', '2');
INSERT INTO `yw_region` VALUES ('701', '141025', '古县', '57', '0', '0', 'Gu Xian', '2');
INSERT INTO `yw_region` VALUES ('702', '141026', '安泽县', '57', '0', '0', 'Anze Xian', '2');
INSERT INTO `yw_region` VALUES ('703', '141027', '浮山县', '57', '0', '0', 'Fushan Xian ', '2');
INSERT INTO `yw_region` VALUES ('704', '141028', '吉县', '57', '0', '0', 'Ji Xian', '2');
INSERT INTO `yw_region` VALUES ('705', '141029', '乡宁县', '57', '0', '0', 'Xiangning Xian', '2');
INSERT INTO `yw_region` VALUES ('706', '141030', '大宁县', '57', '0', '0', 'Daning Xian', '2');
INSERT INTO `yw_region` VALUES ('707', '141031', '隰县', '57', '0', '0', 'Xi Xian', '2');
INSERT INTO `yw_region` VALUES ('708', '141032', '永和县', '57', '0', '0', 'Yonghe Xian', '2');
INSERT INTO `yw_region` VALUES ('709', '141033', '蒲县', '57', '0', '0', 'Pu Xian', '2');
INSERT INTO `yw_region` VALUES ('710', '141034', '汾西县', '57', '0', '0', 'Fenxi Xian', '2');
INSERT INTO `yw_region` VALUES ('711', '141081', '侯马市', '57', '0', '0', 'Houma Shi ', '2');
INSERT INTO `yw_region` VALUES ('712', '141082', '霍州市', '57', '0', '0', 'Huozhou Shi ', '2');
INSERT INTO `yw_region` VALUES ('713', '141101', '市辖区', '58', '0', '0', '1', '2');
INSERT INTO `yw_region` VALUES ('714', '141102', '离石区', '58', '0', '0', 'Lishi Qu', '2');
INSERT INTO `yw_region` VALUES ('715', '141121', '文水县', '58', '0', '0', 'Wenshui Xian', '2');
INSERT INTO `yw_region` VALUES ('716', '141122', '交城县', '58', '0', '0', 'Jiaocheng Xian', '2');
INSERT INTO `yw_region` VALUES ('717', '141123', '兴县', '58', '0', '0', 'Xing Xian', '2');
INSERT INTO `yw_region` VALUES ('718', '141124', '临县', '58', '0', '0', 'Lin Xian ', '2');
INSERT INTO `yw_region` VALUES ('719', '141125', '柳林县', '58', '0', '0', 'Liulin Xian', '2');
INSERT INTO `yw_region` VALUES ('720', '141126', '石楼县', '58', '0', '0', 'Shilou Xian', '2');
INSERT INTO `yw_region` VALUES ('721', '141127', '岚县', '58', '0', '0', 'Lan Xian', '2');
INSERT INTO `yw_region` VALUES ('722', '141128', '方山县', '58', '0', '0', 'Fangshan Xian', '2');
INSERT INTO `yw_region` VALUES ('723', '141129', '中阳县', '58', '0', '0', 'Zhongyang Xian', '2');
INSERT INTO `yw_region` VALUES ('724', '141130', '交口县', '58', '0', '0', 'Jiaokou Xian', '2');
INSERT INTO `yw_region` VALUES ('725', '141181', '孝义市', '58', '0', '0', 'Xiaoyi Shi', '2');
INSERT INTO `yw_region` VALUES ('726', '141182', '汾阳市', '58', '0', '0', 'Fenyang Shi', '2');
INSERT INTO `yw_region` VALUES ('727', '150101', '市辖区', '59', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('728', '150102', '新城区', '59', '0', '0', 'Xincheng Qu', 'XCN');
INSERT INTO `yw_region` VALUES ('729', '150103', '回民区', '59', '0', '0', 'Huimin Qu', 'HMQ');
INSERT INTO `yw_region` VALUES ('730', '150104', '玉泉区', '59', '0', '0', 'Yuquan Qu', 'YQN');
INSERT INTO `yw_region` VALUES ('731', '150105', '赛罕区', '59', '0', '0', 'Saihan Qu', '2');
INSERT INTO `yw_region` VALUES ('732', '150121', '土默特左旗', '59', '0', '0', 'Tumd Zuoqi', 'TUZ');
INSERT INTO `yw_region` VALUES ('733', '150122', '托克托县', '59', '0', '0', 'Togtoh Xian', 'TOG');
INSERT INTO `yw_region` VALUES ('734', '150123', '和林格尔县', '59', '0', '0', 'Horinger Xian', 'HOR');
INSERT INTO `yw_region` VALUES ('735', '150124', '清水河县', '59', '0', '0', 'Qingshuihe Xian', 'QSH');
INSERT INTO `yw_region` VALUES ('736', '150125', '武川县', '59', '0', '0', 'Wuchuan Xian', 'WCX');
INSERT INTO `yw_region` VALUES ('737', '150201', '市辖区', '60', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('738', '150202', '东河区', '60', '0', '0', 'Donghe Qu', 'DHE');
INSERT INTO `yw_region` VALUES ('739', '150203', '昆都仑区', '60', '0', '0', 'Kundulun Qu', '2');
INSERT INTO `yw_region` VALUES ('740', '150204', '青山区', '60', '0', '0', 'Qingshan Qu', 'QSB');
INSERT INTO `yw_region` VALUES ('741', '150205', '石拐区', '60', '0', '0', 'Shiguai Qu', '2');
INSERT INTO `yw_region` VALUES ('742', '150206', '白云鄂博矿区', '60', '0', '0', 'Baiyun Kuangqu', '2');
INSERT INTO `yw_region` VALUES ('743', '150207', '九原区', '60', '0', '0', 'Jiuyuan Qu', '2');
INSERT INTO `yw_region` VALUES ('744', '150221', '土默特右旗', '60', '0', '0', 'Tumd Youqi', 'TUY');
INSERT INTO `yw_region` VALUES ('745', '150222', '固阳县', '60', '0', '0', 'Guyang Xian', 'GYM');
INSERT INTO `yw_region` VALUES ('746', '150223', '达尔罕茂明安联合旗', '60', '0', '0', 'Darhan Muminggan Lianheqi', 'DML');
INSERT INTO `yw_region` VALUES ('747', '150301', '市辖区', '61', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('748', '150302', '海勃湾区', '61', '0', '0', 'Haibowan Qu', 'HBW');
INSERT INTO `yw_region` VALUES ('749', '150303', '海南区', '61', '0', '0', 'Hainan Qu', 'HNU');
INSERT INTO `yw_region` VALUES ('750', '150304', '乌达区', '61', '0', '0', 'Ud Qu', 'UDQ');
INSERT INTO `yw_region` VALUES ('751', '150401', '市辖区', '62', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('752', '150402', '红山区', '62', '0', '0', 'Hongshan Qu', 'HSZ');
INSERT INTO `yw_region` VALUES ('753', '150403', '元宝山区', '62', '0', '0', 'Yuanbaoshan Qu', 'YBO');
INSERT INTO `yw_region` VALUES ('754', '150404', '松山区', '62', '0', '0', 'Songshan Qu', 'SSQ');
INSERT INTO `yw_region` VALUES ('755', '150421', '阿鲁科尔沁旗', '62', '0', '0', 'Ar Horqin Qi', 'AHO');
INSERT INTO `yw_region` VALUES ('756', '150422', '巴林左旗', '62', '0', '0', 'Bairin Zuoqi', 'BAZ');
INSERT INTO `yw_region` VALUES ('757', '150423', '巴林右旗', '62', '0', '0', 'Bairin Youqi', 'BAY');
INSERT INTO `yw_region` VALUES ('758', '150424', '林西县', '62', '0', '0', 'Linxi Xian', 'LXM');
INSERT INTO `yw_region` VALUES ('759', '150425', '克什克腾旗', '62', '0', '0', 'Hexigten Qi', 'HXT');
INSERT INTO `yw_region` VALUES ('760', '150426', '翁牛特旗', '62', '0', '0', 'Ongniud Qi', 'ONG');
INSERT INTO `yw_region` VALUES ('761', '150428', '喀喇沁旗', '62', '0', '0', 'Harqin Qi', 'HAR');
INSERT INTO `yw_region` VALUES ('762', '150429', '宁城县', '62', '0', '0', 'Ningcheng Xian', 'NCH');
INSERT INTO `yw_region` VALUES ('763', '150430', '敖汉旗', '62', '0', '0', 'Aohan Qi', 'AHN');
INSERT INTO `yw_region` VALUES ('764', '150501', '市辖区', '63', '0', '0', '1', '2');
INSERT INTO `yw_region` VALUES ('765', '150502', '科尔沁区', '63', '0', '0', 'Keermi Qu', '2');
INSERT INTO `yw_region` VALUES ('766', '150521', '科尔沁左翼中旗', '63', '0', '0', 'Horqin Zuoyi Zhongqi', '2');
INSERT INTO `yw_region` VALUES ('767', '150522', '科尔沁左翼后旗', '63', '0', '0', 'Horqin Zuoyi Houqi', '2');
INSERT INTO `yw_region` VALUES ('768', '150523', '开鲁县', '63', '0', '0', 'Kailu Xian', '2');
INSERT INTO `yw_region` VALUES ('769', '150524', '库伦旗', '63', '0', '0', 'Hure Qi', '2');
INSERT INTO `yw_region` VALUES ('770', '150525', '奈曼旗', '63', '0', '0', 'Naiman Qi', '2');
INSERT INTO `yw_region` VALUES ('771', '150526', '扎鲁特旗', '63', '0', '0', 'Jarud Qi', '2');
INSERT INTO `yw_region` VALUES ('772', '150581', '霍林郭勒市', '63', '0', '0', 'Holingol Shi', '2');
INSERT INTO `yw_region` VALUES ('773', '150602', '东胜区', '64', '0', '0', 'Dongsheng Qu', '2');
INSERT INTO `yw_region` VALUES ('774', '150621', '达拉特旗', '64', '0', '0', 'Dalad Qi', '2');
INSERT INTO `yw_region` VALUES ('775', '150622', '准格尔旗', '64', '0', '0', 'Jungar Qi', '2');
INSERT INTO `yw_region` VALUES ('776', '150623', '鄂托克前旗', '64', '0', '0', 'Otog Qianqi', '2');
INSERT INTO `yw_region` VALUES ('777', '150624', '鄂托克旗', '64', '0', '0', 'Otog Qi', '2');
INSERT INTO `yw_region` VALUES ('778', '150625', '杭锦旗', '64', '0', '0', 'Hanggin Qi', '2');
INSERT INTO `yw_region` VALUES ('779', '150626', '乌审旗', '64', '0', '0', 'Uxin Qi', '2');
INSERT INTO `yw_region` VALUES ('780', '150627', '伊金霍洛旗', '64', '0', '0', 'Ejin Horo Qi', '2');
INSERT INTO `yw_region` VALUES ('781', '150701', '市辖区', '65', '0', '0', '1', '2');
INSERT INTO `yw_region` VALUES ('782', '150702', '海拉尔区', '65', '0', '0', 'Hailaer Qu', '2');
INSERT INTO `yw_region` VALUES ('783', '150721', '阿荣旗', '65', '0', '0', 'Arun Qi', '2');
INSERT INTO `yw_region` VALUES ('784', '150722', '莫力达瓦达斡尔族自治旗', '65', '0', '0', 'Morin Dawa Daurzu Zizhiqi', '2');
INSERT INTO `yw_region` VALUES ('785', '150723', '鄂伦春自治旗', '65', '0', '0', 'Oroqen Zizhiqi', '2');
INSERT INTO `yw_region` VALUES ('786', '150724', '鄂温克族自治旗', '65', '0', '0', 'Ewenkizu Zizhiqi', '2');
INSERT INTO `yw_region` VALUES ('787', '150725', '陈巴尔虎旗', '65', '0', '0', 'Chen Barag Qi', '2');
INSERT INTO `yw_region` VALUES ('788', '150726', '新巴尔虎左旗', '65', '0', '0', 'Xin Barag Zuoqi', '2');
INSERT INTO `yw_region` VALUES ('789', '150727', '新巴尔虎右旗', '65', '0', '0', 'Xin Barag Youqi', '2');
INSERT INTO `yw_region` VALUES ('790', '150781', '满洲里市', '65', '0', '0', 'Manzhouli Shi', '2');
INSERT INTO `yw_region` VALUES ('791', '150782', '牙克石市', '65', '0', '0', 'Yakeshi Shi', '2');
INSERT INTO `yw_region` VALUES ('792', '150783', '扎兰屯市', '65', '0', '0', 'Zalantun Shi', '2');
INSERT INTO `yw_region` VALUES ('793', '150784', '额尔古纳市', '65', '0', '0', 'Ergun Shi', '2');
INSERT INTO `yw_region` VALUES ('794', '150785', '根河市', '65', '0', '0', 'Genhe Shi', '2');
INSERT INTO `yw_region` VALUES ('795', '150801', '市辖区', '66', '0', '0', '1', '2');
INSERT INTO `yw_region` VALUES ('796', '150802', '临河区', '66', '0', '0', 'Linhe Qu', '2');
INSERT INTO `yw_region` VALUES ('797', '150821', '五原县', '66', '0', '0', 'Wuyuan Xian', '2');
INSERT INTO `yw_region` VALUES ('798', '150822', '磴口县', '66', '0', '0', 'Dengkou Xian', '2');
INSERT INTO `yw_region` VALUES ('799', '150823', '乌拉特前旗', '66', '0', '0', 'Urad Qianqi', '2');
INSERT INTO `yw_region` VALUES ('800', '150824', '乌拉特中旗', '66', '0', '0', 'Urad Zhongqi', '2');
INSERT INTO `yw_region` VALUES ('801', '150825', '乌拉特后旗', '66', '0', '0', 'Urad Houqi', '2');
INSERT INTO `yw_region` VALUES ('802', '150826', '杭锦后旗', '66', '0', '0', 'Hanggin Houqi', '2');
INSERT INTO `yw_region` VALUES ('803', '150901', '市辖区', '67', '0', '0', '1', '2');
INSERT INTO `yw_region` VALUES ('804', '150902', '集宁区', '67', '0', '0', 'Jining Qu', '2');
INSERT INTO `yw_region` VALUES ('805', '150921', '卓资县', '67', '0', '0', 'Zhuozi Xian', '2');
INSERT INTO `yw_region` VALUES ('806', '150922', '化德县', '67', '0', '0', 'Huade Xian', '2');
INSERT INTO `yw_region` VALUES ('807', '150923', '商都县', '67', '0', '0', 'Shangdu Xian', '2');
INSERT INTO `yw_region` VALUES ('808', '150924', '兴和县', '67', '0', '0', 'Xinghe Xian', '2');
INSERT INTO `yw_region` VALUES ('809', '150925', '凉城县', '67', '0', '0', 'Liangcheng Xian', '2');
INSERT INTO `yw_region` VALUES ('810', '150926', '察哈尔右翼前旗', '67', '0', '0', 'Qahar Youyi Qianqi', '2');
INSERT INTO `yw_region` VALUES ('811', '150927', '察哈尔右翼中旗', '67', '0', '0', 'Qahar Youyi Zhongqi', '2');
INSERT INTO `yw_region` VALUES ('812', '150928', '察哈尔右翼后旗', '67', '0', '0', 'Qahar Youyi Houqi', '2');
INSERT INTO `yw_region` VALUES ('813', '150929', '四子王旗', '67', '0', '0', 'Dorbod Qi', '2');
INSERT INTO `yw_region` VALUES ('814', '150981', '丰镇市', '67', '0', '0', 'Fengzhen Shi', '2');
INSERT INTO `yw_region` VALUES ('815', '152201', '乌兰浩特市', '68', '0', '0', 'Ulan Hot Shi', 'ULO');
INSERT INTO `yw_region` VALUES ('816', '152202', '阿尔山市', '68', '0', '0', 'Arxan Shi', 'ARS');
INSERT INTO `yw_region` VALUES ('817', '152221', '科尔沁右翼前旗', '68', '0', '0', 'Horqin Youyi Qianqi', 'HYQ');
INSERT INTO `yw_region` VALUES ('818', '152222', '科尔沁右翼中旗', '68', '0', '0', 'Horqin Youyi Zhongqi', 'HYZ');
INSERT INTO `yw_region` VALUES ('819', '152223', '扎赉特旗', '68', '0', '0', 'Jalaid Qi', 'JAL');
INSERT INTO `yw_region` VALUES ('820', '152224', '突泉县', '68', '0', '0', 'Tuquan Xian', 'TUQ');
INSERT INTO `yw_region` VALUES ('821', '152501', '二连浩特市', '69', '0', '0', 'Erenhot Shi', 'ERC');
INSERT INTO `yw_region` VALUES ('822', '152502', '锡林浩特市', '69', '0', '0', 'Xilinhot Shi', 'XLI');
INSERT INTO `yw_region` VALUES ('823', '152522', '阿巴嘎旗', '69', '0', '0', 'Abag Qi', 'ABG');
INSERT INTO `yw_region` VALUES ('824', '152523', '苏尼特左旗', '69', '0', '0', 'Sonid Zuoqi', 'SOZ');
INSERT INTO `yw_region` VALUES ('825', '152524', '苏尼特右旗', '69', '0', '0', 'Sonid Youqi', 'SOY');
INSERT INTO `yw_region` VALUES ('826', '152525', '东乌珠穆沁旗', '69', '0', '0', 'Dong Ujimqin Qi', 'DUJ');
INSERT INTO `yw_region` VALUES ('827', '152526', '西乌珠穆沁旗', '69', '0', '0', 'Xi Ujimqin Qi', 'XUJ');
INSERT INTO `yw_region` VALUES ('828', '152527', '太仆寺旗', '69', '0', '0', 'Taibus Qi', 'TAB');
INSERT INTO `yw_region` VALUES ('829', '152528', '镶黄旗', '69', '0', '0', 'Xianghuang(Hobot Xar) Qi', 'XHG');
INSERT INTO `yw_region` VALUES ('830', '152529', '正镶白旗', '69', '0', '0', 'Zhengxiangbai(Xulun Hobot Qagan)Qi', 'ZXB');
INSERT INTO `yw_region` VALUES ('831', '152530', '正蓝旗', '69', '0', '0', 'Zhenglan(Xulun Hoh)Qi', 'ZLM');
INSERT INTO `yw_region` VALUES ('832', '152531', '多伦县', '69', '0', '0', 'Duolun (Dolonnur)Xian', 'DLM');
INSERT INTO `yw_region` VALUES ('833', '152921', '阿拉善左旗', '70', '0', '0', 'Alxa Zuoqi', 'ALZ');
INSERT INTO `yw_region` VALUES ('834', '152922', '阿拉善右旗', '70', '0', '0', 'Alxa Youqi', 'ALY');
INSERT INTO `yw_region` VALUES ('835', '152923', '额济纳旗', '70', '0', '0', 'Ejin Qi', 'EJI');
INSERT INTO `yw_region` VALUES ('836', '210101', '市辖区', '71', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('837', '210102', '和平区', '71', '0', '0', 'Heping Qu', 'HEP');
INSERT INTO `yw_region` VALUES ('838', '210103', '沈河区', '71', '0', '0', 'Shenhe Qu ', 'SHQ');
INSERT INTO `yw_region` VALUES ('839', '210104', '大东区', '71', '0', '0', 'Dadong Qu ', 'DDQ');
INSERT INTO `yw_region` VALUES ('840', '210105', '皇姑区', '71', '0', '0', 'Huanggu Qu', 'HGU');
INSERT INTO `yw_region` VALUES ('841', '210106', '铁西区', '71', '0', '0', 'Tiexi Qu', 'TXI');
INSERT INTO `yw_region` VALUES ('842', '210111', '苏家屯区', '71', '0', '0', 'Sujiatun Qu', 'SJT');
INSERT INTO `yw_region` VALUES ('843', '210112', '东陵区', '71', '0', '0', 'Dongling Qu ', 'DLQ');
INSERT INTO `yw_region` VALUES ('844', '210113', '沈北新区', '71', '0', '0', 'Xinchengzi Qu', '2');
INSERT INTO `yw_region` VALUES ('845', '210114', '于洪区', '71', '0', '0', 'Yuhong Qu ', 'YHQ');
INSERT INTO `yw_region` VALUES ('846', '210122', '辽中县', '71', '0', '0', 'Liaozhong Xian', 'LZL');
INSERT INTO `yw_region` VALUES ('847', '210123', '康平县', '71', '0', '0', 'Kangping Xian', 'KPG');
INSERT INTO `yw_region` VALUES ('848', '210124', '法库县', '71', '0', '0', 'Faku Xian', 'FKU');
INSERT INTO `yw_region` VALUES ('849', '210181', '新民市', '71', '0', '0', 'Xinmin Shi', 'XMS');
INSERT INTO `yw_region` VALUES ('850', '210201', '市辖区', '72', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('851', '210202', '中山区', '72', '0', '0', 'Zhongshan Qu', 'ZSD');
INSERT INTO `yw_region` VALUES ('852', '210203', '西岗区', '72', '0', '0', 'Xigang Qu', 'XGD');
INSERT INTO `yw_region` VALUES ('853', '210204', '沙河口区', '72', '0', '0', 'Shahekou Qu', 'SHK');
INSERT INTO `yw_region` VALUES ('854', '210211', '甘井子区', '72', '0', '0', 'Ganjingzi Qu', 'GJZ');
INSERT INTO `yw_region` VALUES ('855', '210212', '旅顺口区', '72', '0', '0', 'Lvshunkou Qu ', 'LSK');
INSERT INTO `yw_region` VALUES ('856', '210213', '金州区', '72', '0', '0', 'Jinzhou Qu', 'JZH');
INSERT INTO `yw_region` VALUES ('857', '210224', '长海县', '72', '0', '0', 'Changhai Xian', 'CHX');
INSERT INTO `yw_region` VALUES ('858', '210281', '瓦房店市', '72', '0', '0', 'Wafangdian Shi', 'WFD');
INSERT INTO `yw_region` VALUES ('859', '210282', '普兰店市', '72', '0', '0', 'Pulandian Shi', 'PLD');
INSERT INTO `yw_region` VALUES ('860', '210283', '庄河市', '72', '0', '0', 'Zhuanghe Shi', 'ZHH');
INSERT INTO `yw_region` VALUES ('861', '210301', '市辖区', '73', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('862', '210302', '铁东区', '73', '0', '0', 'Tiedong Qu ', 'TED');
INSERT INTO `yw_region` VALUES ('863', '210303', '铁西区', '73', '0', '0', 'Tiexi Qu', 'TXL');
INSERT INTO `yw_region` VALUES ('864', '210304', '立山区', '73', '0', '0', 'Lishan Qu', 'LAS');
INSERT INTO `yw_region` VALUES ('865', '210311', '千山区', '73', '0', '0', 'Qianshan Qu ', 'QSQ');
INSERT INTO `yw_region` VALUES ('866', '210321', '台安县', '73', '0', '0', 'Tai,an Xian', 'TAX');
INSERT INTO `yw_region` VALUES ('867', '210323', '岫岩满族自治县', '73', '0', '0', 'Xiuyan Manzu Zizhixian', 'XYL');
INSERT INTO `yw_region` VALUES ('868', '210381', '海城市', '73', '0', '0', 'Haicheng Shi', 'HCL');
INSERT INTO `yw_region` VALUES ('869', '210401', '市辖区', '74', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('870', '210402', '新抚区', '74', '0', '0', 'Xinfu Qu', 'XFU');
INSERT INTO `yw_region` VALUES ('871', '210403', '东洲区', '74', '0', '0', 'Dongzhou Qu', '2');
INSERT INTO `yw_region` VALUES ('872', '210404', '望花区', '74', '0', '0', 'Wanghua Qu', 'WHF');
INSERT INTO `yw_region` VALUES ('873', '210411', '顺城区', '74', '0', '0', 'Shuncheng Qu', 'SCF');
INSERT INTO `yw_region` VALUES ('874', '210421', '抚顺县', '74', '0', '0', 'Fushun Xian', 'FSX');
INSERT INTO `yw_region` VALUES ('875', '210422', '新宾满族自治县', '74', '0', '0', 'Xinbinmanzuzizhi Xian', '2');
INSERT INTO `yw_region` VALUES ('876', '210423', '清原满族自治县', '74', '0', '0', 'Qingyuanmanzuzizhi Xian', '2');
INSERT INTO `yw_region` VALUES ('877', '210501', '市辖区', '75', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('878', '210502', '平山区', '75', '0', '0', 'Pingshan Qu', 'PSN');
INSERT INTO `yw_region` VALUES ('879', '210503', '溪湖区', '75', '0', '0', 'Xihu Qu ', 'XHB');
INSERT INTO `yw_region` VALUES ('880', '210504', '明山区', '75', '0', '0', 'Mingshan Qu', 'MSB');
INSERT INTO `yw_region` VALUES ('881', '210505', '南芬区', '75', '0', '0', 'Nanfen Qu', 'NFQ');
INSERT INTO `yw_region` VALUES ('882', '210521', '本溪满族自治县', '75', '0', '0', 'Benxi Manzu Zizhixian', 'BXX');
INSERT INTO `yw_region` VALUES ('883', '210522', '桓仁满族自治县', '75', '0', '0', 'Huanren Manzu Zizhixian', 'HRL');
INSERT INTO `yw_region` VALUES ('884', '210601', '市辖区', '76', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('885', '210602', '元宝区', '76', '0', '0', 'Yuanbao Qu', 'YBD');
INSERT INTO `yw_region` VALUES ('886', '210603', '振兴区', '76', '0', '0', 'Zhenxing Qu ', 'ZXQ');
INSERT INTO `yw_region` VALUES ('887', '210604', '振安区', '76', '0', '0', 'Zhen,an Qu', 'ZAQ');
INSERT INTO `yw_region` VALUES ('888', '210624', '宽甸满族自治县', '76', '0', '0', 'Kuandian Manzu Zizhixian', 'KDN');
INSERT INTO `yw_region` VALUES ('889', '210681', '东港市', '76', '0', '0', 'Donggang Shi', 'DGS');
INSERT INTO `yw_region` VALUES ('890', '210682', '凤城市', '76', '0', '0', 'Fengcheng Shi', 'FCL');
INSERT INTO `yw_region` VALUES ('891', '210701', '市辖区', '77', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('892', '210702', '古塔区', '77', '0', '0', 'Guta Qu', 'GTQ');
INSERT INTO `yw_region` VALUES ('893', '210703', '凌河区', '77', '0', '0', 'Linghe Qu', 'LHF');
INSERT INTO `yw_region` VALUES ('894', '210711', '太和区', '77', '0', '0', 'Taihe Qu', '2');
INSERT INTO `yw_region` VALUES ('895', '210726', '黑山县', '77', '0', '0', 'Heishan Xian', 'HSL');
INSERT INTO `yw_region` VALUES ('896', '210727', '义县', '77', '0', '0', 'Yi Xian', 'YXL');
INSERT INTO `yw_region` VALUES ('897', '210781', '凌海市', '77', '0', '0', 'Linghai Shi ', 'LHL');
INSERT INTO `yw_region` VALUES ('898', '210782', '北镇市', '77', '0', '0', 'Beining Shi', '2');
INSERT INTO `yw_region` VALUES ('899', '210801', '市辖区', '78', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('900', '210802', '站前区', '78', '0', '0', 'Zhanqian Qu', 'ZQQ');
INSERT INTO `yw_region` VALUES ('901', '210803', '西市区', '78', '0', '0', 'Xishi Qu', 'XII');
INSERT INTO `yw_region` VALUES ('902', '210804', '鲅鱼圈区', '78', '0', '0', 'Bayuquan Qu', 'BYQ');
INSERT INTO `yw_region` VALUES ('903', '210811', '老边区', '78', '0', '0', 'Laobian Qu', 'LOB');
INSERT INTO `yw_region` VALUES ('904', '210881', '盖州市', '78', '0', '0', 'Gaizhou Shi', 'GZU');
INSERT INTO `yw_region` VALUES ('905', '210882', '大石桥市', '78', '0', '0', 'Dashiqiao Shi', 'DSQ');
INSERT INTO `yw_region` VALUES ('906', '210901', '市辖区', '79', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('907', '210902', '海州区', '79', '0', '0', 'Haizhou Qu', 'HZF');
INSERT INTO `yw_region` VALUES ('908', '210903', '新邱区', '79', '0', '0', 'Xinqiu Qu', 'XQF');
INSERT INTO `yw_region` VALUES ('909', '210904', '太平区', '79', '0', '0', 'Taiping Qu', 'TPG');
INSERT INTO `yw_region` VALUES ('910', '210905', '清河门区', '79', '0', '0', 'Qinghemen Qu', 'QHM');
INSERT INTO `yw_region` VALUES ('911', '210911', '细河区', '79', '0', '0', 'Xihe Qu', 'XHO');
INSERT INTO `yw_region` VALUES ('912', '210921', '阜新蒙古族自治县', '79', '0', '0', 'Fuxin Mongolzu Zizhixian', 'FXX');
INSERT INTO `yw_region` VALUES ('913', '210922', '彰武县', '79', '0', '0', 'Zhangwu Xian', 'ZWU');
INSERT INTO `yw_region` VALUES ('914', '211001', '市辖区', '80', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('915', '211002', '白塔区', '80', '0', '0', 'Baita Qu', 'BTL');
INSERT INTO `yw_region` VALUES ('916', '211003', '文圣区', '80', '0', '0', 'Wensheng Qu', 'WST');
INSERT INTO `yw_region` VALUES ('917', '211004', '宏伟区', '80', '0', '0', 'Hongwei Qu', 'HWQ');
INSERT INTO `yw_region` VALUES ('918', '211005', '弓长岭区', '80', '0', '0', 'Gongchangling Qu', 'GCL');
INSERT INTO `yw_region` VALUES ('919', '211011', '太子河区', '80', '0', '0', 'Taizihe Qu', 'TZH');
INSERT INTO `yw_region` VALUES ('920', '211021', '辽阳县', '80', '0', '0', 'Liaoyang Xian', 'LYX');
INSERT INTO `yw_region` VALUES ('921', '211081', '灯塔市', '80', '0', '0', 'Dengta Shi', 'DTL');
INSERT INTO `yw_region` VALUES ('922', '211101', '市辖区', '81', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('923', '211102', '双台子区', '81', '0', '0', 'Shuangtaizi Qu', 'STZ');
INSERT INTO `yw_region` VALUES ('924', '211103', '兴隆台区', '81', '0', '0', 'Xinglongtai Qu', 'XLT');
INSERT INTO `yw_region` VALUES ('925', '211121', '大洼县', '81', '0', '0', 'Dawa Xian', 'DWA');
INSERT INTO `yw_region` VALUES ('926', '211122', '盘山县', '81', '0', '0', 'Panshan Xian', 'PNS');
INSERT INTO `yw_region` VALUES ('927', '211201', '市辖区', '82', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('928', '211202', '银州区', '82', '0', '0', 'Yinzhou Qu', 'YZU');
INSERT INTO `yw_region` VALUES ('929', '211204', '清河区', '82', '0', '0', 'Qinghe Qu', 'QHQ');
INSERT INTO `yw_region` VALUES ('930', '211221', '铁岭县', '82', '0', '0', 'Tieling Xian', 'TLG');
INSERT INTO `yw_region` VALUES ('931', '211223', '西丰县', '82', '0', '0', 'Xifeng Xian', 'XIF');
INSERT INTO `yw_region` VALUES ('932', '211224', '昌图县', '82', '0', '0', 'Changtu Xian', 'CTX');
INSERT INTO `yw_region` VALUES ('933', '211281', '调兵山市', '82', '0', '0', 'Diaobingshan Shi', '2');
INSERT INTO `yw_region` VALUES ('934', '211282', '开原市', '82', '0', '0', 'Kaiyuan Shi', 'KYS');
INSERT INTO `yw_region` VALUES ('935', '211301', '市辖区', '83', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('936', '211302', '双塔区', '83', '0', '0', 'Shuangta Qu', 'STQ');
INSERT INTO `yw_region` VALUES ('937', '211303', '龙城区', '83', '0', '0', 'Longcheng Qu', 'LCL');
INSERT INTO `yw_region` VALUES ('938', '211321', '朝阳县', '83', '0', '0', 'Chaoyang Xian', 'CYG');
INSERT INTO `yw_region` VALUES ('939', '211322', '建平县', '83', '0', '0', 'Jianping Xian', 'JPG');
INSERT INTO `yw_region` VALUES ('940', '211324', '喀喇沁左翼蒙古族自治县', '83', '0', '0', 'Harqin Zuoyi Mongolzu Zizhixian', 'HAZ');
INSERT INTO `yw_region` VALUES ('941', '211381', '北票市', '83', '0', '0', 'Beipiao Shi', 'BPO');
INSERT INTO `yw_region` VALUES ('942', '211382', '凌源市', '83', '0', '0', 'Lingyuan Shi', 'LYK');
INSERT INTO `yw_region` VALUES ('943', '211401', '市辖区', '84', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('944', '211402', '连山区', '84', '0', '0', 'Lianshan Qu', 'LSQ');
INSERT INTO `yw_region` VALUES ('945', '211403', '龙港区', '84', '0', '0', 'Longgang Qu', 'LGD');
INSERT INTO `yw_region` VALUES ('946', '211404', '南票区', '84', '0', '0', 'Nanpiao Qu', 'NPQ');
INSERT INTO `yw_region` VALUES ('947', '211421', '绥中县', '84', '0', '0', 'Suizhong Xian', 'SZL');
INSERT INTO `yw_region` VALUES ('948', '211422', '建昌县', '84', '0', '0', 'Jianchang Xian', 'JCL');
INSERT INTO `yw_region` VALUES ('949', '211481', '兴城市', '84', '0', '0', 'Xingcheng Shi', 'XCL');
INSERT INTO `yw_region` VALUES ('950', '220101', '市辖区', '85', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('951', '220102', '南关区', '85', '0', '0', 'Nanguan Qu', 'NGN');
INSERT INTO `yw_region` VALUES ('952', '220103', '宽城区', '85', '0', '0', 'Kuancheng Qu', 'KCQ');
INSERT INTO `yw_region` VALUES ('953', '220104', '朝阳区', '85', '0', '0', 'Chaoyang Qu ', 'CYC');
INSERT INTO `yw_region` VALUES ('954', '220105', '二道区', '85', '0', '0', 'Erdao Qu', 'EDQ');
INSERT INTO `yw_region` VALUES ('955', '220106', '绿园区', '85', '0', '0', 'Lvyuan Qu', 'LYQ');
INSERT INTO `yw_region` VALUES ('956', '220112', '双阳区', '85', '0', '0', 'Shuangyang Qu', 'SYQ');
INSERT INTO `yw_region` VALUES ('957', '220122', '农安县', '85', '0', '0', 'Nong,an Xian ', 'NAJ');
INSERT INTO `yw_region` VALUES ('958', '220181', '九台市', '85', '0', '0', 'Jiutai Shi', '2');
INSERT INTO `yw_region` VALUES ('959', '220182', '榆树市', '85', '0', '0', 'Yushu Shi', 'YSS');
INSERT INTO `yw_region` VALUES ('960', '220183', '德惠市', '85', '0', '0', 'Dehui Shi', 'DEH');
INSERT INTO `yw_region` VALUES ('961', '220201', '市辖区', '86', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('962', '220202', '昌邑区', '86', '0', '0', 'Changyi Qu', 'CYI');
INSERT INTO `yw_region` VALUES ('963', '220203', '龙潭区', '86', '0', '0', 'Longtan Qu', 'LTQ');
INSERT INTO `yw_region` VALUES ('964', '220204', '船营区', '86', '0', '0', 'Chuanying Qu', 'CYJ');
INSERT INTO `yw_region` VALUES ('965', '220211', '丰满区', '86', '0', '0', 'Fengman Qu', 'FMQ');
INSERT INTO `yw_region` VALUES ('966', '220221', '永吉县', '86', '0', '0', 'Yongji Xian', 'YOJ');
INSERT INTO `yw_region` VALUES ('967', '220281', '蛟河市', '86', '0', '0', 'Jiaohe Shi', 'JHJ');
INSERT INTO `yw_region` VALUES ('968', '220282', '桦甸市', '86', '0', '0', 'Huadian Shi', 'HDJ');
INSERT INTO `yw_region` VALUES ('969', '220283', '舒兰市', '86', '0', '0', 'Shulan Shi', 'SLN');
INSERT INTO `yw_region` VALUES ('970', '220284', '磐石市', '86', '0', '0', 'Panshi Shi', 'PSI');
INSERT INTO `yw_region` VALUES ('971', '220301', '市辖区', '87', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('972', '220302', '铁西区', '87', '0', '0', 'Tiexi Qu', 'TXS');
INSERT INTO `yw_region` VALUES ('973', '220303', '铁东区', '87', '0', '0', 'Tiedong Qu ', 'TDQ');
INSERT INTO `yw_region` VALUES ('974', '220322', '梨树县', '87', '0', '0', 'Lishu Xian', 'LSU');
INSERT INTO `yw_region` VALUES ('975', '220323', '伊通满族自治县', '87', '0', '0', 'Yitong Manzu Zizhixian', 'YTO');
INSERT INTO `yw_region` VALUES ('976', '220381', '公主岭市', '87', '0', '0', 'Gongzhuling Shi', 'GZL');
INSERT INTO `yw_region` VALUES ('977', '220382', '双辽市', '87', '0', '0', 'Shuangliao Shi', 'SLS');
INSERT INTO `yw_region` VALUES ('978', '220401', '市辖区', '88', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('979', '220402', '龙山区', '88', '0', '0', 'Longshan Qu', 'LGS');
INSERT INTO `yw_region` VALUES ('980', '220403', '西安区', '88', '0', '0', 'Xi,an Qu', 'XAA');
INSERT INTO `yw_region` VALUES ('981', '220421', '东丰县', '88', '0', '0', 'Dongfeng Xian', 'DGF');
INSERT INTO `yw_region` VALUES ('982', '220422', '东辽县', '88', '0', '0', 'Dongliao Xian ', 'DLX');
INSERT INTO `yw_region` VALUES ('983', '220501', '市辖区', '89', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('984', '220502', '东昌区', '89', '0', '0', 'Dongchang Qu', 'DCT');
INSERT INTO `yw_region` VALUES ('985', '220503', '二道江区', '89', '0', '0', 'Erdaojiang Qu', 'EDJ');
INSERT INTO `yw_region` VALUES ('986', '220521', '通化县', '89', '0', '0', 'Tonghua Xian ', 'THX');
INSERT INTO `yw_region` VALUES ('987', '220523', '辉南县', '89', '0', '0', 'Huinan Xian ', 'HNA');
INSERT INTO `yw_region` VALUES ('988', '220524', '柳河县', '89', '0', '0', 'Liuhe Xian ', 'LHC');
INSERT INTO `yw_region` VALUES ('989', '220581', '梅河口市', '89', '0', '0', 'Meihekou Shi', 'MHK');
INSERT INTO `yw_region` VALUES ('990', '220582', '集安市', '89', '0', '0', 'Ji,an Shi', 'KNC');
INSERT INTO `yw_region` VALUES ('991', '220601', '市辖区', '90', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('992', '220602', '八道江区', '90', '0', '0', 'Badaojiang Qu', 'BDJ');
INSERT INTO `yw_region` VALUES ('993', '220621', '抚松县', '90', '0', '0', 'Fusong Xian', 'FSG');
INSERT INTO `yw_region` VALUES ('994', '220622', '靖宇县', '90', '0', '0', 'Jingyu Xian', 'JYJ');
INSERT INTO `yw_region` VALUES ('995', '220623', '长白朝鲜族自治县', '90', '0', '0', 'Changbaichaoxianzuzizhi Xian', '2');
INSERT INTO `yw_region` VALUES ('996', '220605', '江源区', '90', '0', '0', 'Jiangyuan Xian', '2');
INSERT INTO `yw_region` VALUES ('997', '220681', '临江市', '90', '0', '0', 'Linjiang Shi', 'LIN');
INSERT INTO `yw_region` VALUES ('998', '220701', '市辖区', '91', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('999', '220702', '宁江区', '91', '0', '0', 'Ningjiang Qu', 'NJA');
INSERT INTO `yw_region` VALUES ('1000', '220721', '前郭尔罗斯蒙古族自治县', '91', '0', '0', 'Qian Gorlos Mongolzu Zizhixian', 'QGO');
INSERT INTO `yw_region` VALUES ('1001', '220722', '长岭县', '91', '0', '0', 'Changling Xian', 'CLG');
INSERT INTO `yw_region` VALUES ('1002', '220723', '乾安县', '91', '0', '0', 'Qian,an Xian', 'QAJ');
INSERT INTO `yw_region` VALUES ('1003', '220724', '扶余县', '91', '0', '0', 'Fuyu Xian', 'FYU');
INSERT INTO `yw_region` VALUES ('1004', '220801', '市辖区', '92', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1005', '220802', '洮北区', '92', '0', '0', 'Taobei Qu', 'TBQ');
INSERT INTO `yw_region` VALUES ('1006', '220821', '镇赉县', '92', '0', '0', 'Zhenlai Xian', 'ZLA');
INSERT INTO `yw_region` VALUES ('1007', '220822', '通榆县', '92', '0', '0', 'Tongyu Xian', 'TGY');
INSERT INTO `yw_region` VALUES ('1008', '220881', '洮南市', '92', '0', '0', 'Taonan Shi', 'TNS');
INSERT INTO `yw_region` VALUES ('1009', '220882', '大安市', '92', '0', '0', 'Da,an Shi', 'DNA');
INSERT INTO `yw_region` VALUES ('1010', '222401', '延吉市', '93', '0', '0', 'Yanji Shi', 'YNJ');
INSERT INTO `yw_region` VALUES ('1011', '222402', '图们市', '93', '0', '0', 'Tumen Shi', 'TME');
INSERT INTO `yw_region` VALUES ('1012', '222403', '敦化市', '93', '0', '0', 'Dunhua Shi', 'DHS');
INSERT INTO `yw_region` VALUES ('1013', '222404', '珲春市', '93', '0', '0', 'Hunchun Shi', 'HUC');
INSERT INTO `yw_region` VALUES ('1014', '222405', '龙井市', '93', '0', '0', 'Longjing Shi', 'LJJ');
INSERT INTO `yw_region` VALUES ('1015', '222406', '和龙市', '93', '0', '0', 'Helong Shi', 'HEL');
INSERT INTO `yw_region` VALUES ('1016', '222424', '汪清县', '93', '0', '0', 'Wangqing Xian', 'WGQ');
INSERT INTO `yw_region` VALUES ('1017', '222426', '安图县', '93', '0', '0', 'Antu Xian', 'ATU');
INSERT INTO `yw_region` VALUES ('1018', '230101', '市辖区', '94', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1019', '230102', '道里区', '94', '0', '0', 'Daoli Qu', 'DLH');
INSERT INTO `yw_region` VALUES ('1020', '230103', '南岗区', '94', '0', '0', 'Nangang Qu', 'NGQ');
INSERT INTO `yw_region` VALUES ('1021', '230104', '道外区', '94', '0', '0', 'Daowai Qu', 'DWQ');
INSERT INTO `yw_region` VALUES ('1022', '230110', '香坊区', '94', '0', '0', 'Xiangfang Qu', '2');
INSERT INTO `yw_region` VALUES ('1024', '230108', '平房区', '94', '0', '0', 'Pingfang Qu', 'PFQ');
INSERT INTO `yw_region` VALUES ('1025', '230109', '松北区', '94', '0', '0', 'Songbei Qu', '2');
INSERT INTO `yw_region` VALUES ('1026', '230111', '呼兰区', '94', '0', '0', 'Hulan Qu', '2');
INSERT INTO `yw_region` VALUES ('1027', '230123', '依兰县', '94', '0', '0', 'Yilan Xian', 'YLH');
INSERT INTO `yw_region` VALUES ('1028', '230124', '方正县', '94', '0', '0', 'Fangzheng Xian', 'FZH');
INSERT INTO `yw_region` VALUES ('1029', '230125', '宾县', '94', '0', '0', 'Bin Xian', 'BNX');
INSERT INTO `yw_region` VALUES ('1030', '230126', '巴彦县', '94', '0', '0', 'Bayan Xian', 'BYH');
INSERT INTO `yw_region` VALUES ('1031', '230127', '木兰县', '94', '0', '0', 'Mulan Xian ', 'MUL');
INSERT INTO `yw_region` VALUES ('1032', '230128', '通河县', '94', '0', '0', 'Tonghe Xian', 'TOH');
INSERT INTO `yw_region` VALUES ('1033', '230129', '延寿县', '94', '0', '0', 'Yanshou Xian', 'YSU');
INSERT INTO `yw_region` VALUES ('1034', '230112', '阿城区', '94', '0', '0', 'Acheng Shi', '2');
INSERT INTO `yw_region` VALUES ('1035', '230182', '双城市', '94', '0', '0', 'Shuangcheng Shi', 'SCS');
INSERT INTO `yw_region` VALUES ('1036', '230183', '尚志市', '94', '0', '0', 'Shangzhi Shi', 'SZI');
INSERT INTO `yw_region` VALUES ('1037', '230184', '五常市', '94', '0', '0', 'Wuchang Shi', 'WCA');
INSERT INTO `yw_region` VALUES ('1038', '230201', '市辖区', '95', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1039', '230202', '龙沙区', '95', '0', '0', 'Longsha Qu', 'LQQ');
INSERT INTO `yw_region` VALUES ('1040', '230203', '建华区', '95', '0', '0', 'Jianhua Qu', 'JHQ');
INSERT INTO `yw_region` VALUES ('1041', '230204', '铁锋区', '95', '0', '0', 'Tiefeng Qu', '2');
INSERT INTO `yw_region` VALUES ('1042', '230205', '昂昂溪区', '95', '0', '0', 'Ang,angxi Qu', 'AAX');
INSERT INTO `yw_region` VALUES ('1043', '230206', '富拉尔基区', '95', '0', '0', 'Hulan Ergi Qu', 'HUE');
INSERT INTO `yw_region` VALUES ('1044', '230207', '碾子山区', '95', '0', '0', 'Nianzishan Qu', 'NZS');
INSERT INTO `yw_region` VALUES ('1045', '230208', '梅里斯达斡尔族区', '95', '0', '0', 'Meilisidawoerzu Qu', '2');
INSERT INTO `yw_region` VALUES ('1046', '230221', '龙江县', '95', '0', '0', 'Longjiang Xian', 'LGJ');
INSERT INTO `yw_region` VALUES ('1047', '230223', '依安县', '95', '0', '0', 'Yi,an Xian', 'YAN');
INSERT INTO `yw_region` VALUES ('1048', '230224', '泰来县', '95', '0', '0', 'Tailai Xian', 'TLA');
INSERT INTO `yw_region` VALUES ('1049', '230225', '甘南县', '95', '0', '0', 'Gannan Xian', 'GNX');
INSERT INTO `yw_region` VALUES ('1050', '230227', '富裕县', '95', '0', '0', 'Fuyu Xian', 'FYX');
INSERT INTO `yw_region` VALUES ('1051', '230229', '克山县', '95', '0', '0', 'Keshan Xian', 'KSN');
INSERT INTO `yw_region` VALUES ('1052', '230230', '克东县', '95', '0', '0', 'Kedong Xian', 'KDO');
INSERT INTO `yw_region` VALUES ('1053', '230231', '拜泉县', '95', '0', '0', 'Baiquan Xian', 'BQN');
INSERT INTO `yw_region` VALUES ('1054', '230281', '讷河市', '95', '0', '0', 'Nehe Shi', 'NEH');
INSERT INTO `yw_region` VALUES ('1055', '230301', '市辖区', '96', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1056', '230302', '鸡冠区', '96', '0', '0', 'Jiguan Qu', 'JGU');
INSERT INTO `yw_region` VALUES ('1057', '230303', '恒山区', '96', '0', '0', 'Hengshan Qu', 'HSD');
INSERT INTO `yw_region` VALUES ('1058', '230304', '滴道区', '96', '0', '0', 'Didao Qu', 'DDO');
INSERT INTO `yw_region` VALUES ('1059', '230305', '梨树区', '96', '0', '0', 'Lishu Qu', 'LJX');
INSERT INTO `yw_region` VALUES ('1060', '230306', '城子河区', '96', '0', '0', 'Chengzihe Qu', 'CZH');
INSERT INTO `yw_region` VALUES ('1061', '230307', '麻山区', '96', '0', '0', 'Mashan Qu', 'MSN');
INSERT INTO `yw_region` VALUES ('1062', '230321', '鸡东县', '96', '0', '0', 'Jidong Xian', 'JID');
INSERT INTO `yw_region` VALUES ('1063', '230381', '虎林市', '96', '0', '0', 'Hulin Shi', 'HUL');
INSERT INTO `yw_region` VALUES ('1064', '230382', '密山市', '96', '0', '0', 'Mishan Shi', 'MIS');
INSERT INTO `yw_region` VALUES ('1065', '230401', '市辖区', '97', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1066', '230402', '向阳区', '97', '0', '0', 'Xiangyang  Qu ', 'XYZ');
INSERT INTO `yw_region` VALUES ('1067', '230403', '工农区', '97', '0', '0', 'Gongnong Qu', 'GNH');
INSERT INTO `yw_region` VALUES ('1068', '230404', '南山区', '97', '0', '0', 'Nanshan Qu', 'NSQ');
INSERT INTO `yw_region` VALUES ('1069', '230405', '兴安区', '97', '0', '0', 'Xing,an Qu', 'XAH');
INSERT INTO `yw_region` VALUES ('1070', '230406', '东山区', '97', '0', '0', 'Dongshan Qu', 'DSA');
INSERT INTO `yw_region` VALUES ('1071', '230407', '兴山区', '97', '0', '0', 'Xingshan Qu', 'XSQ');
INSERT INTO `yw_region` VALUES ('1072', '230421', '萝北县', '97', '0', '0', 'Luobei Xian', 'LUB');
INSERT INTO `yw_region` VALUES ('1073', '230422', '绥滨县', '97', '0', '0', 'Suibin Xian', '2');
INSERT INTO `yw_region` VALUES ('1074', '230501', '市辖区', '98', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1075', '230502', '尖山区', '98', '0', '0', 'Jianshan Qu', 'JSQ');
INSERT INTO `yw_region` VALUES ('1076', '230503', '岭东区', '98', '0', '0', 'Lingdong Qu', 'LDQ');
INSERT INTO `yw_region` VALUES ('1077', '230505', '四方台区', '98', '0', '0', 'Sifangtai Qu', 'SFT');
INSERT INTO `yw_region` VALUES ('1078', '230506', '宝山区', '98', '0', '0', 'Baoshan Qu', 'BSQ');
INSERT INTO `yw_region` VALUES ('1079', '230521', '集贤县', '98', '0', '0', 'Jixian Xian', 'JXH');
INSERT INTO `yw_region` VALUES ('1080', '230522', '友谊县', '98', '0', '0', 'Youyi Xian', 'YYI');
INSERT INTO `yw_region` VALUES ('1081', '230523', '宝清县', '98', '0', '0', 'Baoqing Xian', 'BQG');
INSERT INTO `yw_region` VALUES ('1082', '230524', '饶河县', '98', '0', '0', 'Raohe Xian ', 'ROH');
INSERT INTO `yw_region` VALUES ('1083', '230601', '市辖区', '99', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1084', '230602', '萨尔图区', '99', '0', '0', 'Sairt Qu', 'SAI');
INSERT INTO `yw_region` VALUES ('1085', '230603', '龙凤区', '99', '0', '0', 'Longfeng Qu', 'LFQ');
INSERT INTO `yw_region` VALUES ('1086', '230604', '让胡路区', '99', '0', '0', 'Ranghulu Qu', 'RHL');
INSERT INTO `yw_region` VALUES ('1087', '230605', '红岗区', '99', '0', '0', 'Honggang Qu', 'HGD');
INSERT INTO `yw_region` VALUES ('1088', '230606', '大同区', '99', '0', '0', 'Datong Qu', 'DHD');
INSERT INTO `yw_region` VALUES ('1089', '230621', '肇州县', '99', '0', '0', 'Zhaozhou Xian', 'ZAZ');
INSERT INTO `yw_region` VALUES ('1090', '230622', '肇源县', '99', '0', '0', 'Zhaoyuan Xian', 'ZYH');
INSERT INTO `yw_region` VALUES ('1091', '230623', '林甸县', '99', '0', '0', 'Lindian Xian ', 'LDN');
INSERT INTO `yw_region` VALUES ('1092', '230624', '杜尔伯特蒙古族自治县', '99', '0', '0', 'Dorbod Mongolzu Zizhixian', 'DOM');
INSERT INTO `yw_region` VALUES ('1093', '230701', '市辖区', '100', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1094', '230702', '伊春区', '100', '0', '0', 'Yichun Qu', 'YYC');
INSERT INTO `yw_region` VALUES ('1095', '230703', '南岔区', '100', '0', '0', 'Nancha Qu', 'NCQ');
INSERT INTO `yw_region` VALUES ('1096', '230704', '友好区', '100', '0', '0', 'Youhao Qu', 'YOH');
INSERT INTO `yw_region` VALUES ('1097', '230705', '西林区', '100', '0', '0', 'Xilin Qu', 'XIL');
INSERT INTO `yw_region` VALUES ('1098', '230706', '翠峦区', '100', '0', '0', 'Cuiluan Qu', 'CLN');
INSERT INTO `yw_region` VALUES ('1099', '230707', '新青区', '100', '0', '0', 'Xinqing Qu', 'XQQ');
INSERT INTO `yw_region` VALUES ('1100', '230708', '美溪区', '100', '0', '0', 'Meixi Qu', 'MXQ');
INSERT INTO `yw_region` VALUES ('1101', '230709', '金山屯区', '100', '0', '0', 'Jinshantun Qu', 'JST');
INSERT INTO `yw_region` VALUES ('1102', '230710', '五营区', '100', '0', '0', 'Wuying Qu', 'WYQ');
INSERT INTO `yw_region` VALUES ('1103', '230711', '乌马河区', '100', '0', '0', 'Wumahe Qu', 'WMH');
INSERT INTO `yw_region` VALUES ('1104', '230712', '汤旺河区', '100', '0', '0', 'Tangwanghe Qu', 'TWH');
INSERT INTO `yw_region` VALUES ('1105', '230713', '带岭区', '100', '0', '0', 'Dailing Qu', 'DLY');
INSERT INTO `yw_region` VALUES ('1106', '230714', '乌伊岭区', '100', '0', '0', 'Wuyiling Qu', 'WYL');
INSERT INTO `yw_region` VALUES ('1107', '230715', '红星区', '100', '0', '0', 'Hongxing Qu', 'HGX');
INSERT INTO `yw_region` VALUES ('1108', '230716', '上甘岭区', '100', '0', '0', 'Shangganling Qu', 'SGL');
INSERT INTO `yw_region` VALUES ('1109', '230722', '嘉荫县', '100', '0', '0', 'Jiayin Xian', '2');
INSERT INTO `yw_region` VALUES ('1110', '230781', '铁力市', '100', '0', '0', 'Tieli Shi', 'TEL');
INSERT INTO `yw_region` VALUES ('1111', '230801', '市辖区', '101', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1113', '230803', '向阳区', '101', '0', '0', 'Xiangyang  Qu ', 'XYQ');
INSERT INTO `yw_region` VALUES ('1114', '230804', '前进区', '101', '0', '0', 'Qianjin Qu', 'QJQ');
INSERT INTO `yw_region` VALUES ('1115', '230805', '东风区', '101', '0', '0', 'Dongfeng Qu', 'DFQ');
INSERT INTO `yw_region` VALUES ('1116', '230811', '郊区', '101', '0', '0', 'Jiaoqu', 'JQJ');
INSERT INTO `yw_region` VALUES ('1117', '230822', '桦南县', '101', '0', '0', 'Huanan Xian', 'HNH');
INSERT INTO `yw_region` VALUES ('1118', '230826', '桦川县', '101', '0', '0', 'Huachuan Xian', 'HCN');
INSERT INTO `yw_region` VALUES ('1119', '230828', '汤原县', '101', '0', '0', 'Tangyuan Xian', 'TYX');
INSERT INTO `yw_region` VALUES ('1120', '230833', '抚远县', '101', '0', '0', 'Fuyuan Xian', 'FUY');
INSERT INTO `yw_region` VALUES ('1121', '230881', '同江市', '101', '0', '0', 'Tongjiang Shi', 'TOJ');
INSERT INTO `yw_region` VALUES ('1122', '230882', '富锦市', '101', '0', '0', 'Fujin Shi', 'FUJ');
INSERT INTO `yw_region` VALUES ('1123', '230901', '市辖区', '102', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1124', '230902', '新兴区', '102', '0', '0', 'Xinxing Qu', 'XXQ');
INSERT INTO `yw_region` VALUES ('1125', '230903', '桃山区', '102', '0', '0', 'Taoshan Qu', 'TSC');
INSERT INTO `yw_region` VALUES ('1126', '230904', '茄子河区', '102', '0', '0', 'Qiezihe Qu', 'QZI');
INSERT INTO `yw_region` VALUES ('1127', '230921', '勃利县', '102', '0', '0', 'Boli Xian', 'BLI');
INSERT INTO `yw_region` VALUES ('1128', '231001', '市辖区', '103', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1129', '231002', '东安区', '103', '0', '0', 'Dong,an Qu', 'DGA');
INSERT INTO `yw_region` VALUES ('1130', '231003', '阳明区', '103', '0', '0', 'Yangming Qu', 'YMQ');
INSERT INTO `yw_region` VALUES ('1131', '231004', '爱民区', '103', '0', '0', 'Aimin Qu', 'AMQ');
INSERT INTO `yw_region` VALUES ('1132', '231005', '西安区', '103', '0', '0', 'Xi,an Qu', 'XAQ');
INSERT INTO `yw_region` VALUES ('1133', '231024', '东宁县', '103', '0', '0', 'Dongning Xian', 'DON');
INSERT INTO `yw_region` VALUES ('1134', '231025', '林口县', '103', '0', '0', 'Linkou Xian', 'LKO');
INSERT INTO `yw_region` VALUES ('1135', '231081', '绥芬河市', '103', '0', '0', 'Suifenhe Shi', 'SFE');
INSERT INTO `yw_region` VALUES ('1136', '231083', '海林市', '103', '0', '0', 'Hailin Shi', 'HLS');
INSERT INTO `yw_region` VALUES ('1137', '231084', '宁安市', '103', '0', '0', 'Ning,an Shi', 'NAI');
INSERT INTO `yw_region` VALUES ('1138', '231085', '穆棱市', '103', '0', '0', 'Muling Shi', 'MLG');
INSERT INTO `yw_region` VALUES ('1139', '231101', '市辖区', '104', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1140', '231102', '爱辉区', '104', '0', '0', 'Aihui Qu', 'AHQ');
INSERT INTO `yw_region` VALUES ('1141', '231121', '嫩江县', '104', '0', '0', 'Nenjiang Xian', 'NJH');
INSERT INTO `yw_region` VALUES ('1142', '231123', '逊克县', '104', '0', '0', 'Xunke Xian', 'XUK');
INSERT INTO `yw_region` VALUES ('1143', '231124', '孙吴县', '104', '0', '0', 'Sunwu Xian', 'SUW');
INSERT INTO `yw_region` VALUES ('1144', '231181', '北安市', '104', '0', '0', 'Bei,an Shi', 'BAS');
INSERT INTO `yw_region` VALUES ('1145', '231182', '五大连池市', '104', '0', '0', 'Wudalianchi Shi', 'WDL');
INSERT INTO `yw_region` VALUES ('1146', '231201', '市辖区', '105', '0', '0', '1', '2');
INSERT INTO `yw_region` VALUES ('1147', '231202', '北林区', '105', '0', '0', 'Beilin Qu', '2');
INSERT INTO `yw_region` VALUES ('1148', '231221', '望奎县', '105', '0', '0', 'Wangkui Xian', '2');
INSERT INTO `yw_region` VALUES ('1149', '231222', '兰西县', '105', '0', '0', 'Lanxi Xian', '2');
INSERT INTO `yw_region` VALUES ('1150', '231223', '青冈县', '105', '0', '0', 'Qinggang Xian', '2');
INSERT INTO `yw_region` VALUES ('1151', '231224', '庆安县', '105', '0', '0', 'Qing,an Xian', '2');
INSERT INTO `yw_region` VALUES ('1152', '231225', '明水县', '105', '0', '0', 'Mingshui Xian', '2');
INSERT INTO `yw_region` VALUES ('1153', '231226', '绥棱县', '105', '0', '0', 'Suileng Xian', '2');
INSERT INTO `yw_region` VALUES ('1154', '231281', '安达市', '105', '0', '0', 'Anda Shi', '2');
INSERT INTO `yw_region` VALUES ('1155', '231282', '肇东市', '105', '0', '0', 'Zhaodong Shi', '2');
INSERT INTO `yw_region` VALUES ('1156', '231283', '海伦市', '105', '0', '0', 'Hailun Shi', '2');
INSERT INTO `yw_region` VALUES ('1157', '232721', '呼玛县', '106', '0', '0', 'Huma Xian', 'HUM');
INSERT INTO `yw_region` VALUES ('1158', '232722', '塔河县', '106', '0', '0', 'Tahe Xian', 'TAH');
INSERT INTO `yw_region` VALUES ('1159', '232723', '漠河县', '106', '0', '0', 'Mohe Xian', 'MOH');
INSERT INTO `yw_region` VALUES ('1160', '310101', '黄浦区', '107', '0', '0', 'Huangpu Qu', 'HGP');
INSERT INTO `yw_region` VALUES ('1161', '310103', '卢湾区', '107', '0', '0', 'Luwan Qu', 'LWN');
INSERT INTO `yw_region` VALUES ('1162', '310104', '徐汇区', '107', '0', '0', 'Xuhui Qu', 'XHI');
INSERT INTO `yw_region` VALUES ('1163', '310105', '长宁区', '107', '0', '0', 'Changning Qu', 'CNQ');
INSERT INTO `yw_region` VALUES ('1164', '310106', '静安区', '107', '0', '0', 'Jing,an Qu', 'JAQ');
INSERT INTO `yw_region` VALUES ('1165', '310107', '普陀区', '107', '0', '0', 'Putuo Qu', 'PTQ');
INSERT INTO `yw_region` VALUES ('1166', '310108', '闸北区', '107', '0', '0', 'Zhabei Qu', 'ZBE');
INSERT INTO `yw_region` VALUES ('1167', '310109', '虹口区', '107', '0', '0', 'Hongkou Qu', 'HKQ');
INSERT INTO `yw_region` VALUES ('1168', '310110', '杨浦区', '107', '0', '0', 'Yangpu Qu', 'YPU');
INSERT INTO `yw_region` VALUES ('1169', '310112', '闵行区', '107', '0', '0', 'Minhang Qu', 'MHQ');
INSERT INTO `yw_region` VALUES ('1170', '310113', '宝山区', '107', '0', '0', 'Baoshan Qu', 'BAO');
INSERT INTO `yw_region` VALUES ('1171', '310114', '嘉定区', '107', '0', '0', 'Jiading Qu', 'JDG');
INSERT INTO `yw_region` VALUES ('1172', '310115', '浦东新区', '107', '0', '0', 'Pudong Xinqu', 'PDX');
INSERT INTO `yw_region` VALUES ('1173', '310116', '金山区', '107', '0', '0', 'Jinshan Qu', 'JSH');
INSERT INTO `yw_region` VALUES ('1174', '310117', '松江区', '107', '0', '0', 'Songjiang Qu', 'SOJ');
INSERT INTO `yw_region` VALUES ('1175', '310118', '青浦区', '107', '0', '0', 'Qingpu  Qu', 'QPU');
INSERT INTO `yw_region` VALUES ('1177', '310120', '奉贤区', '107', '0', '0', 'Fengxian Qu', 'FXI');
INSERT INTO `yw_region` VALUES ('1178', '310230', '崇明县', '108', '0', '0', 'Chongming Xian', 'CMI');
INSERT INTO `yw_region` VALUES ('1179', '320101', '市辖区', '109', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1180', '320102', '玄武区', '109', '0', '0', 'Xuanwu Qu', 'XWU');
INSERT INTO `yw_region` VALUES ('1181', '320103', '白下区', '109', '0', '0', 'Baixia Qu', 'BXQ');
INSERT INTO `yw_region` VALUES ('1182', '320104', '秦淮区', '109', '0', '0', 'Qinhuai Qu', 'QHU');
INSERT INTO `yw_region` VALUES ('1183', '320105', '建邺区', '109', '0', '0', 'Jianye Qu', 'JYQ');
INSERT INTO `yw_region` VALUES ('1184', '320106', '鼓楼区', '109', '0', '0', 'Gulou Qu', 'GLQ');
INSERT INTO `yw_region` VALUES ('1185', '320107', '下关区', '109', '0', '0', 'Xiaguan Qu', 'XGQ');
INSERT INTO `yw_region` VALUES ('1186', '320111', '浦口区', '109', '0', '0', 'Pukou Qu', 'PKO');
INSERT INTO `yw_region` VALUES ('1187', '320113', '栖霞区', '109', '0', '0', 'Qixia Qu', 'QAX');
INSERT INTO `yw_region` VALUES ('1188', '320114', '雨花台区', '109', '0', '0', 'Yuhuatai Qu', 'YHT');
INSERT INTO `yw_region` VALUES ('1189', '320115', '江宁区', '109', '0', '0', 'Jiangning Qu', '2');
INSERT INTO `yw_region` VALUES ('1190', '320116', '六合区', '109', '0', '0', 'Liuhe Qu', '2');
INSERT INTO `yw_region` VALUES ('1191', '320124', '溧水县', '109', '0', '0', 'Lishui Xian', 'LIS');
INSERT INTO `yw_region` VALUES ('1192', '320125', '高淳县', '109', '0', '0', 'Gaochun Xian', 'GCN');
INSERT INTO `yw_region` VALUES ('1193', '320201', '市辖区', '110', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1194', '320202', '崇安区', '110', '0', '0', 'Chong,an Qu', 'CGA');
INSERT INTO `yw_region` VALUES ('1195', '320203', '南长区', '110', '0', '0', 'Nanchang Qu', 'NCG');
INSERT INTO `yw_region` VALUES ('1196', '320204', '北塘区', '110', '0', '0', 'Beitang Qu', 'BTQ');
INSERT INTO `yw_region` VALUES ('1197', '320205', '锡山区', '110', '0', '0', 'Xishan Qu', '2');
INSERT INTO `yw_region` VALUES ('1198', '320206', '惠山区', '110', '0', '0', 'Huishan Qu', '2');
INSERT INTO `yw_region` VALUES ('1199', '320211', '滨湖区', '110', '0', '0', 'Binhu Qu', '2');
INSERT INTO `yw_region` VALUES ('1200', '320281', '江阴市', '110', '0', '0', 'Jiangyin Shi', 'JIA');
INSERT INTO `yw_region` VALUES ('1201', '320282', '宜兴市', '110', '0', '0', 'Yixing Shi', 'YIX');
INSERT INTO `yw_region` VALUES ('1202', '320301', '市辖区', '111', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1203', '320302', '鼓楼区', '111', '0', '0', 'Gulou Qu', 'GLU');
INSERT INTO `yw_region` VALUES ('1204', '320303', '云龙区', '111', '0', '0', 'Yunlong Qu', 'YLF');
INSERT INTO `yw_region` VALUES ('1206', '320305', '贾汪区', '111', '0', '0', 'Jiawang Qu', 'JWQ');
INSERT INTO `yw_region` VALUES ('1207', '320311', '泉山区', '111', '0', '0', 'Quanshan Qu', 'QSX');
INSERT INTO `yw_region` VALUES ('1208', '320321', '丰县', '111', '0', '0', 'Feng Xian', 'FXN');
INSERT INTO `yw_region` VALUES ('1209', '320322', '沛县', '111', '0', '0', 'Pei Xian', 'PEI');
INSERT INTO `yw_region` VALUES ('1210', '320312', '铜山区', '111', '0', '0', 'Tongshan Xian', '2');
INSERT INTO `yw_region` VALUES ('1211', '320324', '睢宁县', '111', '0', '0', 'Suining Xian', 'SNI');
INSERT INTO `yw_region` VALUES ('1212', '320381', '新沂市', '111', '0', '0', 'Xinyi Shi', 'XYW');
INSERT INTO `yw_region` VALUES ('1213', '320382', '邳州市', '111', '0', '0', 'Pizhou Shi', 'PZO');
INSERT INTO `yw_region` VALUES ('1214', '320401', '市辖区', '112', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1215', '320402', '天宁区', '112', '0', '0', 'Tianning Qu', 'TNQ');
INSERT INTO `yw_region` VALUES ('1216', '320404', '钟楼区', '112', '0', '0', 'Zhonglou Qu', 'ZLQ');
INSERT INTO `yw_region` VALUES ('1217', '320405', '戚墅堰区', '112', '0', '0', 'Qishuyan Qu', 'QSY');
INSERT INTO `yw_region` VALUES ('1218', '320411', '新北区', '112', '0', '0', 'Xinbei Qu', '2');
INSERT INTO `yw_region` VALUES ('1219', '320412', '武进区', '112', '0', '0', 'Wujin Qu', '2');
INSERT INTO `yw_region` VALUES ('1220', '320481', '溧阳市', '112', '0', '0', 'Liyang Shi', 'LYR');
INSERT INTO `yw_region` VALUES ('1221', '320482', '金坛市', '112', '0', '0', 'Jintan Shi', 'JTS');
INSERT INTO `yw_region` VALUES ('1222', '320501', '市辖区', '113', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1223', '320502', '沧浪区', '113', '0', '0', 'Canglang Qu', 'CLQ');
INSERT INTO `yw_region` VALUES ('1224', '320503', '平江区', '113', '0', '0', 'Pingjiang Qu', 'PJQ');
INSERT INTO `yw_region` VALUES ('1225', '320504', '金阊区', '113', '0', '0', 'Jinchang Qu', 'JCA');
INSERT INTO `yw_region` VALUES ('1226', '320505', '虎丘区', '113', '0', '0', 'Huqiu Qu', '2');
INSERT INTO `yw_region` VALUES ('1227', '320506', '吴中区', '113', '0', '0', 'Wuzhong Qu', '2');
INSERT INTO `yw_region` VALUES ('1228', '320507', '相城区', '113', '0', '0', 'Xiangcheng Qu', '2');
INSERT INTO `yw_region` VALUES ('1229', '320581', '常熟市', '113', '0', '0', 'Changshu Shi', 'CGS');
INSERT INTO `yw_region` VALUES ('1230', '320582', '张家港市', '113', '0', '0', 'Zhangjiagang Shi ', 'ZJG');
INSERT INTO `yw_region` VALUES ('1231', '320583', '昆山市', '113', '0', '0', 'Kunshan Shi', 'KUS');
INSERT INTO `yw_region` VALUES ('1232', '320584', '吴江市', '113', '0', '0', 'Wujiang Shi', 'WUJ');
INSERT INTO `yw_region` VALUES ('1233', '320585', '太仓市', '113', '0', '0', 'Taicang Shi', 'TAC');
INSERT INTO `yw_region` VALUES ('1234', '320601', '市辖区', '114', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1235', '320602', '崇川区', '114', '0', '0', 'Chongchuan Qu', 'CCQ');
INSERT INTO `yw_region` VALUES ('1236', '320611', '港闸区', '114', '0', '0', 'Gangzha Qu', 'GZQ');
INSERT INTO `yw_region` VALUES ('1237', '320621', '海安县', '114', '0', '0', 'Hai,an Xian', 'HIA');
INSERT INTO `yw_region` VALUES ('1238', '320623', '如东县', '114', '0', '0', 'Rudong Xian', 'RDG');
INSERT INTO `yw_region` VALUES ('1239', '320681', '启东市', '114', '0', '0', 'Qidong Shi', 'QID');
INSERT INTO `yw_region` VALUES ('1240', '320682', '如皋市', '114', '0', '0', 'Rugao Shi', 'RGO');
INSERT INTO `yw_region` VALUES ('1241', '320612', '通州区', '114', '0', '0', 'Tongzhou Shi', '2');
INSERT INTO `yw_region` VALUES ('1242', '320684', '海门市', '114', '0', '0', 'Haimen Shi', 'HME');
INSERT INTO `yw_region` VALUES ('1243', '320701', '市辖区', '115', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1244', '320703', '连云区', '115', '0', '0', 'Lianyun Qu', 'LYB');
INSERT INTO `yw_region` VALUES ('1245', '320705', '新浦区', '115', '0', '0', 'Xinpu Qu', 'XPQ');
INSERT INTO `yw_region` VALUES ('1246', '320706', '海州区', '115', '0', '0', 'Haizhou Qu', 'HIZ');
INSERT INTO `yw_region` VALUES ('1247', '320721', '赣榆县', '115', '0', '0', 'Ganyu Xian', 'GYU');
INSERT INTO `yw_region` VALUES ('1248', '320722', '东海县', '115', '0', '0', 'Donghai Xian', 'DHX');
INSERT INTO `yw_region` VALUES ('1249', '320723', '灌云县', '115', '0', '0', 'Guanyun Xian', 'GYS');
INSERT INTO `yw_region` VALUES ('1250', '320724', '灌南县', '115', '0', '0', 'Guannan Xian', 'GUN');
INSERT INTO `yw_region` VALUES ('1251', '320801', '市辖区', '116', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1252', '320802', '清河区', '116', '0', '0', 'Qinghe Qu', 'QHH');
INSERT INTO `yw_region` VALUES ('1253', '320803', '楚州区', '116', '0', '0', 'Chuzhou Qu', '2');
INSERT INTO `yw_region` VALUES ('1254', '320804', '淮阴区', '116', '0', '0', 'Huaiyin Qu', '2');
INSERT INTO `yw_region` VALUES ('1255', '320811', '清浦区', '116', '0', '0', 'Qingpu Qu', 'QPQ');
INSERT INTO `yw_region` VALUES ('1256', '320826', '涟水县', '116', '0', '0', 'Lianshui Xian', 'LSI');
INSERT INTO `yw_region` VALUES ('1257', '320829', '洪泽县', '116', '0', '0', 'Hongze Xian', 'HGZ');
INSERT INTO `yw_region` VALUES ('1258', '320830', '盱眙县', '116', '0', '0', 'Xuyi Xian', 'XUY');
INSERT INTO `yw_region` VALUES ('1259', '320831', '金湖县', '116', '0', '0', 'Jinhu Xian', 'JHU');
INSERT INTO `yw_region` VALUES ('1260', '320901', '市辖区', '117', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1261', '320902', '亭湖区', '117', '0', '0', 'Tinghu Qu', '2');
INSERT INTO `yw_region` VALUES ('1262', '320903', '盐都区', '117', '0', '0', 'Yandu Qu', '2');
INSERT INTO `yw_region` VALUES ('1263', '320921', '响水县', '117', '0', '0', 'Xiangshui Xian', 'XSH');
INSERT INTO `yw_region` VALUES ('1264', '320922', '滨海县', '117', '0', '0', 'Binhai Xian', 'BHI');
INSERT INTO `yw_region` VALUES ('1265', '320923', '阜宁县', '117', '0', '0', 'Funing Xian', 'FNG');
INSERT INTO `yw_region` VALUES ('1266', '320924', '射阳县', '117', '0', '0', 'Sheyang Xian', 'SEY');
INSERT INTO `yw_region` VALUES ('1267', '320925', '建湖县', '117', '0', '0', 'Jianhu Xian', 'JIH');
INSERT INTO `yw_region` VALUES ('1268', '320981', '东台市', '117', '0', '0', 'Dongtai Shi', 'DTS');
INSERT INTO `yw_region` VALUES ('1269', '320982', '大丰市', '117', '0', '0', 'Dafeng Shi', 'DFS');
INSERT INTO `yw_region` VALUES ('1270', '321001', '市辖区', '118', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1271', '321002', '广陵区', '118', '0', '0', 'Guangling Qu', 'GGL');
INSERT INTO `yw_region` VALUES ('1272', '321003', '邗江区', '118', '0', '0', 'Hanjiang Qu', '2');
INSERT INTO `yw_region` VALUES ('1273', '321011', '维扬区', '118', '0', '0', 'Weiyang Qu', '2');
INSERT INTO `yw_region` VALUES ('1274', '321023', '宝应县', '118', '0', '0', 'Baoying Xian ', 'BYI');
INSERT INTO `yw_region` VALUES ('1275', '321081', '仪征市', '118', '0', '0', 'Yizheng Shi', 'YZE');
INSERT INTO `yw_region` VALUES ('1276', '321084', '高邮市', '118', '0', '0', 'Gaoyou Shi', 'GYO');
INSERT INTO `yw_region` VALUES ('1277', '321088', '江都市', '118', '0', '0', 'Jiangdu Shi', 'JDU');
INSERT INTO `yw_region` VALUES ('1278', '321101', '市辖区', '119', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1279', '321102', '京口区', '119', '0', '0', 'Jingkou Qu', '2');
INSERT INTO `yw_region` VALUES ('1280', '321111', '润州区', '119', '0', '0', 'Runzhou Qu', 'RZQ');
INSERT INTO `yw_region` VALUES ('1281', '321112', '丹徒区', '119', '0', '0', 'Dantu Qu', '2');
INSERT INTO `yw_region` VALUES ('1282', '321181', '丹阳市', '119', '0', '0', 'Danyang Xian', 'DNY');
INSERT INTO `yw_region` VALUES ('1283', '321182', '扬中市', '119', '0', '0', 'Yangzhong Shi', 'YZG');
INSERT INTO `yw_region` VALUES ('1284', '321183', '句容市', '119', '0', '0', 'Jurong Shi', 'JRG');
INSERT INTO `yw_region` VALUES ('1285', '321201', '市辖区', '120', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1286', '321202', '海陵区', '120', '0', '0', 'Hailing Qu', 'HIL');
INSERT INTO `yw_region` VALUES ('1287', '321203', '高港区', '120', '0', '0', 'Gaogang Qu', 'GGQ');
INSERT INTO `yw_region` VALUES ('1288', '321281', '兴化市', '120', '0', '0', 'Xinghua Shi', 'XHS');
INSERT INTO `yw_region` VALUES ('1289', '321282', '靖江市', '120', '0', '0', 'Jingjiang Shi', 'JGJ');
INSERT INTO `yw_region` VALUES ('1290', '321283', '泰兴市', '120', '0', '0', 'Taixing Shi', 'TXG');
INSERT INTO `yw_region` VALUES ('1291', '321284', '姜堰市', '120', '0', '0', 'Jiangyan Shi', 'JYS');
INSERT INTO `yw_region` VALUES ('1292', '321301', '市辖区', '121', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1293', '321302', '宿城区', '121', '0', '0', 'Sucheng Qu', 'SCE');
INSERT INTO `yw_region` VALUES ('1294', '321311', '宿豫区', '121', '0', '0', 'Suyu Qu', '2');
INSERT INTO `yw_region` VALUES ('1295', '321322', '沭阳县', '121', '0', '0', 'Shuyang Xian', 'SYD');
INSERT INTO `yw_region` VALUES ('1296', '321323', '泗阳县', '121', '0', '0', 'Siyang Xian ', 'SIY');
INSERT INTO `yw_region` VALUES ('1297', '321324', '泗洪县', '121', '0', '0', 'Sihong Xian', 'SIH');
INSERT INTO `yw_region` VALUES ('1298', '330101', '市辖区', '122', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1299', '330102', '上城区', '122', '0', '0', 'Shangcheng Qu', 'SCQ');
INSERT INTO `yw_region` VALUES ('1300', '330103', '下城区', '122', '0', '0', 'Xiacheng Qu', 'XCG');
INSERT INTO `yw_region` VALUES ('1301', '330104', '江干区', '122', '0', '0', 'Jianggan Qu', 'JGQ');
INSERT INTO `yw_region` VALUES ('1302', '330105', '拱墅区', '122', '0', '0', 'Gongshu Qu', 'GSQ');
INSERT INTO `yw_region` VALUES ('1303', '330106', '西湖区', '122', '0', '0', 'Xihu Qu ', 'XHU');
INSERT INTO `yw_region` VALUES ('1304', '330108', '滨江区', '122', '0', '0', 'Binjiang Qu', 'BJQ');
INSERT INTO `yw_region` VALUES ('1305', '330109', '萧山区', '122', '0', '0', 'Xiaoshan Qu', '2');
INSERT INTO `yw_region` VALUES ('1306', '330110', '余杭区', '122', '0', '0', 'Yuhang Qu', '2');
INSERT INTO `yw_region` VALUES ('1307', '330122', '桐庐县', '122', '0', '0', 'Tonglu Xian', 'TLU');
INSERT INTO `yw_region` VALUES ('1308', '330127', '淳安县', '122', '0', '0', 'Chun,an Xian', 'CAZ');
INSERT INTO `yw_region` VALUES ('1309', '330182', '建德市', '122', '0', '0', 'Jiande Shi', 'JDS');
INSERT INTO `yw_region` VALUES ('1310', '330183', '富阳市', '122', '0', '0', 'Fuyang Shi', 'FYZ');
INSERT INTO `yw_region` VALUES ('1311', '330185', '临安市', '122', '0', '0', 'Lin,an Shi', 'LNA');
INSERT INTO `yw_region` VALUES ('1312', '330201', '市辖区', '123', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1313', '330203', '海曙区', '123', '0', '0', 'Haishu Qu', 'HNB');
INSERT INTO `yw_region` VALUES ('1314', '330204', '江东区', '123', '0', '0', 'Jiangdong Qu', 'JDO');
INSERT INTO `yw_region` VALUES ('1315', '330205', '江北区', '123', '0', '0', 'Jiangbei Qu', 'JBQ');
INSERT INTO `yw_region` VALUES ('1316', '330206', '北仑区', '123', '0', '0', 'Beilun Qu', 'BLN');
INSERT INTO `yw_region` VALUES ('1317', '330211', '镇海区', '123', '0', '0', 'Zhenhai Qu', 'ZHF');
INSERT INTO `yw_region` VALUES ('1318', '330212', '鄞州区', '123', '0', '0', 'Yinzhou Qu', '2');
INSERT INTO `yw_region` VALUES ('1319', '330225', '象山县', '123', '0', '0', 'Xiangshan Xian', 'YSZ');
INSERT INTO `yw_region` VALUES ('1320', '330226', '宁海县', '123', '0', '0', 'Ninghai Xian', 'NHI');
INSERT INTO `yw_region` VALUES ('1321', '330281', '余姚市', '123', '0', '0', 'Yuyao Shi', 'YYO');
INSERT INTO `yw_region` VALUES ('1322', '330282', '慈溪市', '123', '0', '0', 'Cixi Shi', 'CXI');
INSERT INTO `yw_region` VALUES ('1323', '330283', '奉化市', '123', '0', '0', 'Fenghua Shi', 'FHU');
INSERT INTO `yw_region` VALUES ('1324', '330301', '市辖区', '124', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1325', '330302', '鹿城区', '124', '0', '0', 'Lucheng Qu', 'LUW');
INSERT INTO `yw_region` VALUES ('1326', '330303', '龙湾区', '124', '0', '0', 'Longwan Qu', 'LWW');
INSERT INTO `yw_region` VALUES ('1327', '330304', '瓯海区', '124', '0', '0', 'Ouhai Qu', 'OHQ');
INSERT INTO `yw_region` VALUES ('1328', '330322', '洞头县', '124', '0', '0', 'Dongtou Xian', 'DTO');
INSERT INTO `yw_region` VALUES ('1329', '330324', '永嘉县', '124', '0', '0', 'Yongjia Xian', 'YJX');
INSERT INTO `yw_region` VALUES ('1330', '330326', '平阳县', '124', '0', '0', 'Pingyang Xian', 'PYG');
INSERT INTO `yw_region` VALUES ('1331', '330327', '苍南县', '124', '0', '0', 'Cangnan Xian', 'CAN');
INSERT INTO `yw_region` VALUES ('1332', '330328', '文成县', '124', '0', '0', 'Wencheng Xian', 'WCZ');
INSERT INTO `yw_region` VALUES ('1333', '330329', '泰顺县', '124', '0', '0', 'Taishun Xian', 'TSZ');
INSERT INTO `yw_region` VALUES ('1334', '330381', '瑞安市', '124', '0', '0', 'Rui,an Xian', 'RAS');
INSERT INTO `yw_region` VALUES ('1335', '330382', '乐清市', '124', '0', '0', 'Yueqing Shi', 'YQZ');
INSERT INTO `yw_region` VALUES ('1336', '330401', '市辖区', '125', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1338', '330411', '秀洲区', '125', '0', '0', 'Xiuzhou Qu', '2');
INSERT INTO `yw_region` VALUES ('1339', '330421', '嘉善县', '125', '0', '0', 'Jiashan Xian', 'JSK');
INSERT INTO `yw_region` VALUES ('1340', '330424', '海盐县', '125', '0', '0', 'Haiyan Xian', 'HYN');
INSERT INTO `yw_region` VALUES ('1341', '330481', '海宁市', '125', '0', '0', 'Haining Shi', 'HNG');
INSERT INTO `yw_region` VALUES ('1342', '330482', '平湖市', '125', '0', '0', 'Pinghu Shi', 'PHU');
INSERT INTO `yw_region` VALUES ('1343', '330483', '桐乡市', '125', '0', '0', 'Tongxiang Shi', 'TXZ');
INSERT INTO `yw_region` VALUES ('1344', '330501', '市辖区', '126', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1345', '330502', '吴兴区', '126', '0', '0', 'Wuxing Qu', '2');
INSERT INTO `yw_region` VALUES ('1346', '330503', '南浔区', '126', '0', '0', 'Nanxun Qu', '2');
INSERT INTO `yw_region` VALUES ('1347', '330521', '德清县', '126', '0', '0', 'Deqing Xian', 'DQX');
INSERT INTO `yw_region` VALUES ('1348', '330522', '长兴县', '126', '0', '0', 'Changxing Xian', 'CXG');
INSERT INTO `yw_region` VALUES ('1349', '330523', '安吉县', '126', '0', '0', 'Anji Xian', 'AJI');
INSERT INTO `yw_region` VALUES ('1350', '330601', '市辖区', '127', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1351', '330602', '越城区', '127', '0', '0', 'Yuecheng Qu', 'YSX');
INSERT INTO `yw_region` VALUES ('1352', '330621', '绍兴县', '127', '0', '0', 'Shaoxing Xian', 'SXZ');
INSERT INTO `yw_region` VALUES ('1353', '330624', '新昌县', '127', '0', '0', 'Xinchang Xian', 'XCX');
INSERT INTO `yw_region` VALUES ('1354', '330681', '诸暨市', '127', '0', '0', 'Zhuji Shi', 'ZHJ');
INSERT INTO `yw_region` VALUES ('1355', '330682', '上虞市', '127', '0', '0', 'Shangyu Shi', 'SYZ');
INSERT INTO `yw_region` VALUES ('1356', '330683', '嵊州市', '127', '0', '0', 'Shengzhou Shi', 'SGZ');
INSERT INTO `yw_region` VALUES ('1357', '330701', '市辖区', '128', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1358', '330702', '婺城区', '128', '0', '0', 'Wucheng Qu', 'WCF');
INSERT INTO `yw_region` VALUES ('1359', '330703', '金东区', '128', '0', '0', 'Jindong Qu', '2');
INSERT INTO `yw_region` VALUES ('1360', '330723', '武义县', '128', '0', '0', 'Wuyi Xian', 'WYX');
INSERT INTO `yw_region` VALUES ('1361', '330726', '浦江县', '128', '0', '0', 'Pujiang Xian ', 'PJG');
INSERT INTO `yw_region` VALUES ('1362', '330727', '磐安县', '128', '0', '0', 'Pan,an Xian', 'PAX');
INSERT INTO `yw_region` VALUES ('1363', '330781', '兰溪市', '128', '0', '0', 'Lanxi Shi', 'LXZ');
INSERT INTO `yw_region` VALUES ('1364', '330782', '义乌市', '128', '0', '0', 'Yiwu Shi', 'YWS');
INSERT INTO `yw_region` VALUES ('1365', '330783', '东阳市', '128', '0', '0', 'Dongyang Shi', 'DGY');
INSERT INTO `yw_region` VALUES ('1366', '330784', '永康市', '128', '0', '0', 'Yongkang Shi', 'YKG');
INSERT INTO `yw_region` VALUES ('1367', '330801', '市辖区', '129', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1368', '330802', '柯城区', '129', '0', '0', 'Kecheng Qu', 'KEC');
INSERT INTO `yw_region` VALUES ('1369', '330803', '衢江区', '129', '0', '0', 'Qujiang Qu', '2');
INSERT INTO `yw_region` VALUES ('1370', '330822', '常山县', '129', '0', '0', 'Changshan Xian', 'CSN');
INSERT INTO `yw_region` VALUES ('1371', '330824', '开化县', '129', '0', '0', 'Kaihua Xian', 'KHU');
INSERT INTO `yw_region` VALUES ('1372', '330825', '龙游县', '129', '0', '0', 'Longyou Xian ', 'LGY');
INSERT INTO `yw_region` VALUES ('1373', '330881', '江山市', '129', '0', '0', 'Jiangshan Shi', 'JIS');
INSERT INTO `yw_region` VALUES ('1374', '330901', '市辖区', '130', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1375', '330902', '定海区', '130', '0', '0', 'Dinghai Qu', 'DHQ');
INSERT INTO `yw_region` VALUES ('1376', '330903', '普陀区', '130', '0', '0', 'Putuo Qu', 'PTO');
INSERT INTO `yw_region` VALUES ('1377', '330921', '岱山县', '130', '0', '0', 'Daishan Xian', 'DSH');
INSERT INTO `yw_region` VALUES ('1378', '330922', '嵊泗县', '130', '0', '0', 'Shengsi Xian', 'SSZ');
INSERT INTO `yw_region` VALUES ('1379', '331001', '市辖区', '131', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1380', '331002', '椒江区', '131', '0', '0', 'Jiaojiang Qu', 'JJT');
INSERT INTO `yw_region` VALUES ('1381', '331003', '黄岩区', '131', '0', '0', 'Huangyan Qu', 'HYT');
INSERT INTO `yw_region` VALUES ('1382', '331004', '路桥区', '131', '0', '0', 'Luqiao Qu', 'LQT');
INSERT INTO `yw_region` VALUES ('1383', '331021', '玉环县', '131', '0', '0', 'Yuhuan Xian', 'YHN');
INSERT INTO `yw_region` VALUES ('1384', '331022', '三门县', '131', '0', '0', 'Sanmen Xian', 'SMN');
INSERT INTO `yw_region` VALUES ('1385', '331023', '天台县', '131', '0', '0', 'Tiantai Xian', 'TTA');
INSERT INTO `yw_region` VALUES ('1386', '331024', '仙居县', '131', '0', '0', 'Xianju Xian', 'XJU');
INSERT INTO `yw_region` VALUES ('1387', '331081', '温岭市', '131', '0', '0', 'Wenling Shi', 'WLS');
INSERT INTO `yw_region` VALUES ('1388', '331082', '临海市', '131', '0', '0', 'Linhai Shi', 'LHI');
INSERT INTO `yw_region` VALUES ('1389', '331101', '市辖区', '132', '0', '0', '1', '2');
INSERT INTO `yw_region` VALUES ('1390', '331102', '莲都区', '132', '0', '0', 'Liandu Qu', '2');
INSERT INTO `yw_region` VALUES ('1391', '331121', '青田县', '132', '0', '0', 'Qingtian Xian', '2');
INSERT INTO `yw_region` VALUES ('1392', '331122', '缙云县', '132', '0', '0', 'Jinyun Xian', '2');
INSERT INTO `yw_region` VALUES ('1393', '331123', '遂昌县', '132', '0', '0', 'Suichang Xian', '2');
INSERT INTO `yw_region` VALUES ('1394', '331124', '松阳县', '132', '0', '0', 'Songyang Xian', '2');
INSERT INTO `yw_region` VALUES ('1395', '331125', '云和县', '132', '0', '0', 'Yunhe Xian', '2');
INSERT INTO `yw_region` VALUES ('1396', '331126', '庆元县', '132', '0', '0', 'Qingyuan Xian', '2');
INSERT INTO `yw_region` VALUES ('1397', '331127', '景宁畲族自治县', '132', '0', '0', 'Jingning Shezu Zizhixian', '2');
INSERT INTO `yw_region` VALUES ('1398', '331181', '龙泉市', '132', '0', '0', 'Longquan Shi', '2');
INSERT INTO `yw_region` VALUES ('1399', '340101', '市辖区', '133', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1400', '340102', '瑶海区', '133', '0', '0', 'Yaohai Qu', '2');
INSERT INTO `yw_region` VALUES ('1401', '340103', '庐阳区', '133', '0', '0', 'Luyang Qu', '2');
INSERT INTO `yw_region` VALUES ('1402', '340104', '蜀山区', '133', '0', '0', 'Shushan Qu', '2');
INSERT INTO `yw_region` VALUES ('1403', '340111', '包河区', '133', '0', '0', 'Baohe Qu', '2');
INSERT INTO `yw_region` VALUES ('1404', '340121', '长丰县', '133', '0', '0', 'Changfeng Xian', 'CFG');
INSERT INTO `yw_region` VALUES ('1405', '340122', '肥东县', '133', '0', '0', 'Feidong Xian', 'FDO');
INSERT INTO `yw_region` VALUES ('1406', '340123', '肥西县', '133', '0', '0', 'Feixi Xian', 'FIX');
INSERT INTO `yw_region` VALUES ('1407', '340201', '市辖区', '1412', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1408', '340202', '镜湖区', '1412', '0', '0', 'Jinghu Qu', 'JHW');
INSERT INTO `yw_region` VALUES ('1409', '340208', '三山区', '1412', '0', '0', 'Matang Qu', '2');
INSERT INTO `yw_region` VALUES ('1410', '340203', '弋江区', '1412', '0', '0', 'Xinwu Qu', '2');
INSERT INTO `yw_region` VALUES ('1411', '340207', '鸠江区', '1412', '0', '0', 'Jiujiang Qu', 'JJW');
INSERT INTO `yw_region` VALUES ('1412', '340200', '芜湖市', '134', '0', '0', 'Wuhu Shi', 'WHI');
INSERT INTO `yw_region` VALUES ('1413', '340222', '繁昌县', '1412', '0', '0', 'Fanchang Xian', 'FCH');
INSERT INTO `yw_region` VALUES ('1414', '340223', '南陵县', '1412', '0', '0', 'Nanling Xian', 'NLX');
INSERT INTO `yw_region` VALUES ('1415', '340301', '市辖区', '135', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1416', '340302', '龙子湖区', '135', '0', '0', 'Longzihu Qu', '2');
INSERT INTO `yw_region` VALUES ('1417', '340303', '蚌山区', '135', '0', '0', 'Bangshan Qu', '2');
INSERT INTO `yw_region` VALUES ('1418', '340304', '禹会区', '135', '0', '0', 'Yuhui Qu', '2');
INSERT INTO `yw_region` VALUES ('1419', '340311', '淮上区', '135', '0', '0', 'Huaishang Qu', '2');
INSERT INTO `yw_region` VALUES ('1420', '340321', '怀远县', '135', '0', '0', 'Huaiyuan Qu', 'HYW');
INSERT INTO `yw_region` VALUES ('1421', '340322', '五河县', '135', '0', '0', 'Wuhe Xian', 'WHE');
INSERT INTO `yw_region` VALUES ('1422', '340323', '固镇县', '135', '0', '0', 'Guzhen Xian', 'GZX');
INSERT INTO `yw_region` VALUES ('1423', '340401', '市辖区', '136', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1424', '340402', '大通区', '136', '0', '0', 'Datong Qu', 'DTQ');
INSERT INTO `yw_region` VALUES ('1425', '340403', '田家庵区', '136', '0', '0', 'Tianjia,an Qu', 'TJA');
INSERT INTO `yw_region` VALUES ('1426', '340404', '谢家集区', '136', '0', '0', 'Xiejiaji Qu', 'XJJ');
INSERT INTO `yw_region` VALUES ('1427', '340405', '八公山区', '136', '0', '0', 'Bagongshan Qu', 'BGS');
INSERT INTO `yw_region` VALUES ('1428', '340406', '潘集区', '136', '0', '0', 'Panji Qu', 'PJI');
INSERT INTO `yw_region` VALUES ('1429', '340421', '凤台县', '136', '0', '0', 'Fengtai Xian', '2');
INSERT INTO `yw_region` VALUES ('1430', '340501', '市辖区', '137', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1431', '340502', '金家庄区', '137', '0', '0', 'Jinjiazhuang Qu', 'JJZ');
INSERT INTO `yw_region` VALUES ('1432', '340503', '花山区', '137', '0', '0', 'Huashan Qu', 'HSM');
INSERT INTO `yw_region` VALUES ('1433', '340504', '雨山区', '137', '0', '0', 'Yushan Qu', 'YSQ');
INSERT INTO `yw_region` VALUES ('1434', '340521', '当涂县', '137', '0', '0', 'Dangtu Xian', 'DTU');
INSERT INTO `yw_region` VALUES ('1435', '340601', '市辖区', '138', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1436', '340602', '杜集区', '138', '0', '0', 'Duji Qu', 'DJQ');
INSERT INTO `yw_region` VALUES ('1437', '340603', '相山区', '138', '0', '0', 'Xiangshan Qu', 'XSA');
INSERT INTO `yw_region` VALUES ('1438', '340604', '烈山区', '138', '0', '0', 'Lieshan Qu', 'LHB');
INSERT INTO `yw_region` VALUES ('1439', '340621', '濉溪县', '138', '0', '0', 'Suixi Xian', 'SXW');
INSERT INTO `yw_region` VALUES ('1440', '340701', '市辖区', '139', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1441', '340702', '铜官山区', '139', '0', '0', 'Tongguanshan Qu', 'TGQ');
INSERT INTO `yw_region` VALUES ('1442', '340703', '狮子山区', '139', '0', '0', 'Shizishan Qu', 'SZN');
INSERT INTO `yw_region` VALUES ('1443', '340711', '郊区', '139', '0', '0', 'Jiaoqu', 'JTL');
INSERT INTO `yw_region` VALUES ('1444', '340721', '铜陵县', '139', '0', '0', 'Tongling Xian', 'TLX');
INSERT INTO `yw_region` VALUES ('1445', '340801', '市辖区', '140', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1446', '340802', '迎江区', '140', '0', '0', 'Yingjiang Qu', 'YJQ');
INSERT INTO `yw_region` VALUES ('1447', '340803', '大观区', '140', '0', '0', 'Daguan Qu', 'DGQ');
INSERT INTO `yw_region` VALUES ('1448', '340811', '宜秀区', '140', '0', '0', 'Yixiu Qu', '2');
INSERT INTO `yw_region` VALUES ('1449', '340822', '怀宁县', '140', '0', '0', 'Huaining Xian', 'HNW');
INSERT INTO `yw_region` VALUES ('1450', '340823', '枞阳县', '140', '0', '0', 'Zongyang Xian', 'ZYW');
INSERT INTO `yw_region` VALUES ('1451', '340824', '潜山县', '140', '0', '0', 'Qianshan Xian', 'QSW');
INSERT INTO `yw_region` VALUES ('1452', '340825', '太湖县', '140', '0', '0', 'Taihu Xian', 'THU');
INSERT INTO `yw_region` VALUES ('1453', '340826', '宿松县', '140', '0', '0', 'Susong Xian', 'SUS');
INSERT INTO `yw_region` VALUES ('1454', '340827', '望江县', '140', '0', '0', 'Wangjiang Xian', 'WJX');
INSERT INTO `yw_region` VALUES ('1455', '340828', '岳西县', '140', '0', '0', 'Yuexi Xian', 'YXW');
INSERT INTO `yw_region` VALUES ('1456', '340881', '桐城市', '140', '0', '0', 'Tongcheng Shi', 'TCW');
INSERT INTO `yw_region` VALUES ('1457', '341001', '市辖区', '141', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1458', '341002', '屯溪区', '141', '0', '0', 'Tunxi Qu', 'TXN');
INSERT INTO `yw_region` VALUES ('1459', '341003', '黄山区', '141', '0', '0', 'Huangshan Qu', 'HSK');
INSERT INTO `yw_region` VALUES ('1460', '341004', '徽州区', '141', '0', '0', 'Huizhou Qu', 'HZQ');
INSERT INTO `yw_region` VALUES ('1461', '341021', '歙县', '141', '0', '0', 'She Xian', 'SEX');
INSERT INTO `yw_region` VALUES ('1462', '341022', '休宁县', '141', '0', '0', 'Xiuning Xian', 'XUN');
INSERT INTO `yw_region` VALUES ('1463', '341023', '黟县', '141', '0', '0', 'Yi Xian', 'YIW');
INSERT INTO `yw_region` VALUES ('1464', '341024', '祁门县', '141', '0', '0', 'Qimen Xian', 'QMN');
INSERT INTO `yw_region` VALUES ('1465', '341101', '市辖区', '142', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1466', '341102', '琅琊区', '142', '0', '0', 'Langya Qu', 'LYU');
INSERT INTO `yw_region` VALUES ('1467', '341103', '南谯区', '142', '0', '0', 'Nanqiao Qu', 'NQQ');
INSERT INTO `yw_region` VALUES ('1468', '341122', '来安县', '142', '0', '0', 'Lai,an Xian', 'LAX');
INSERT INTO `yw_region` VALUES ('1469', '341124', '全椒县', '142', '0', '0', 'Quanjiao Xian', 'QJO');
INSERT INTO `yw_region` VALUES ('1470', '341125', '定远县', '142', '0', '0', 'Dingyuan Xian', 'DYW');
INSERT INTO `yw_region` VALUES ('1471', '341126', '凤阳县', '142', '0', '0', 'Fengyang Xian', 'FYG');
INSERT INTO `yw_region` VALUES ('1472', '341181', '天长市', '142', '0', '0', 'Tianchang Shi', 'TNC');
INSERT INTO `yw_region` VALUES ('1473', '341182', '明光市', '142', '0', '0', 'Mingguang Shi', 'MGG');
INSERT INTO `yw_region` VALUES ('1474', '341201', '市辖区', '143', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1475', '341202', '颍州区', '143', '0', '0', 'Yingzhou Qu', '2');
INSERT INTO `yw_region` VALUES ('1476', '341203', '颍东区', '143', '0', '0', 'Yingdong Qu', '2');
INSERT INTO `yw_region` VALUES ('1477', '341204', '颍泉区', '143', '0', '0', 'Yingquan Qu', '2');
INSERT INTO `yw_region` VALUES ('1478', '341221', '临泉县', '143', '0', '0', 'Linquan Xian', 'LQN');
INSERT INTO `yw_region` VALUES ('1479', '341222', '太和县', '143', '0', '0', 'Taihe Xian', 'TIH');
INSERT INTO `yw_region` VALUES ('1480', '341225', '阜南县', '143', '0', '0', 'Funan Xian', 'FNX');
INSERT INTO `yw_region` VALUES ('1481', '341226', '颍上县', '143', '0', '0', 'Yingshang Xian', '2');
INSERT INTO `yw_region` VALUES ('1482', '341282', '界首市', '143', '0', '0', 'Jieshou Shi', 'JSW');
INSERT INTO `yw_region` VALUES ('1483', '341301', '市辖区', '144', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1484', '341302', '埇桥区', '144', '0', '0', 'Yongqiao Qu', '2');
INSERT INTO `yw_region` VALUES ('1485', '341321', '砀山县', '144', '0', '0', 'Dangshan Xian', 'DSW');
INSERT INTO `yw_region` VALUES ('1486', '341322', '萧县', '144', '0', '0', 'Xiao Xian', 'XIO');
INSERT INTO `yw_region` VALUES ('1487', '341323', '灵璧县', '144', '0', '0', 'Lingbi Xian', 'LBI');
INSERT INTO `yw_region` VALUES ('1488', '341324', '泗县', '144', '0', '0', 'Si Xian ', 'SIX');
INSERT INTO `yw_region` VALUES ('1489', '341401', '市辖区', '145', '0', '0', '1', '2');
INSERT INTO `yw_region` VALUES ('1490', '341402', '居巢区', '145', '0', '0', 'Juchao Qu', '2');
INSERT INTO `yw_region` VALUES ('1491', '341421', '庐江县', '145', '0', '0', 'Lujiang Xian', '2');
INSERT INTO `yw_region` VALUES ('1492', '341422', '无为县', '145', '0', '0', 'Wuwei Xian', '2');
INSERT INTO `yw_region` VALUES ('1493', '341423', '含山县', '145', '0', '0', 'Hanshan Xian', '2');
INSERT INTO `yw_region` VALUES ('1494', '341424', '和县', '145', '0', '0', 'He Xian ', '2');
INSERT INTO `yw_region` VALUES ('1495', '341501', '市辖区', '146', '0', '0', '1', '2');
INSERT INTO `yw_region` VALUES ('1496', '341502', '金安区', '146', '0', '0', 'Jinan Qu', '2');
INSERT INTO `yw_region` VALUES ('1497', '341503', '裕安区', '146', '0', '0', 'Yuan Qu', '2');
INSERT INTO `yw_region` VALUES ('1498', '341521', '寿县', '146', '0', '0', 'Shou Xian', '2');
INSERT INTO `yw_region` VALUES ('1499', '341522', '霍邱县', '146', '0', '0', 'Huoqiu Xian', '2');
INSERT INTO `yw_region` VALUES ('1500', '341523', '舒城县', '146', '0', '0', 'Shucheng Xian', '2');
INSERT INTO `yw_region` VALUES ('1501', '341524', '金寨县', '146', '0', '0', 'Jingzhai Xian', '2');
INSERT INTO `yw_region` VALUES ('1502', '341525', '霍山县', '146', '0', '0', 'Huoshan Xian', '2');
INSERT INTO `yw_region` VALUES ('1503', '341601', '市辖区', '147', '0', '0', '1', '2');
INSERT INTO `yw_region` VALUES ('1504', '341602', '谯城区', '147', '0', '0', 'Qiaocheng Qu', '2');
INSERT INTO `yw_region` VALUES ('1505', '341621', '涡阳县', '147', '0', '0', 'Guoyang Xian', '2');
INSERT INTO `yw_region` VALUES ('1506', '341622', '蒙城县', '147', '0', '0', 'Mengcheng Xian', '2');
INSERT INTO `yw_region` VALUES ('1507', '341623', '利辛县', '147', '0', '0', 'Lixin Xian', '2');
INSERT INTO `yw_region` VALUES ('1508', '341701', '市辖区', '148', '0', '0', '1', '2');
INSERT INTO `yw_region` VALUES ('1509', '341702', '贵池区', '148', '0', '0', 'Guichi Qu', '2');
INSERT INTO `yw_region` VALUES ('1510', '341721', '东至县', '148', '0', '0', 'Dongzhi Xian', '2');
INSERT INTO `yw_region` VALUES ('1511', '341722', '石台县', '148', '0', '0', 'Shitai Xian', '2');
INSERT INTO `yw_region` VALUES ('1512', '341723', '青阳县', '148', '0', '0', 'Qingyang Xian', '2');
INSERT INTO `yw_region` VALUES ('1513', '341801', '市辖区', '149', '0', '0', '1', '2');
INSERT INTO `yw_region` VALUES ('1514', '341802', '宣州区', '149', '0', '0', 'Xuanzhou Qu', '2');
INSERT INTO `yw_region` VALUES ('1515', '341821', '郎溪县', '149', '0', '0', 'Langxi Xian', '2');
INSERT INTO `yw_region` VALUES ('1516', '341822', '广德县', '149', '0', '0', 'Guangde Xian', '2');
INSERT INTO `yw_region` VALUES ('1517', '341823', '泾县', '149', '0', '0', 'Jing Xian', '2');
INSERT INTO `yw_region` VALUES ('1518', '341824', '绩溪县', '149', '0', '0', 'Jixi Xian', '2');
INSERT INTO `yw_region` VALUES ('1519', '341825', '旌德县', '149', '0', '0', 'Jingde Xian', '2');
INSERT INTO `yw_region` VALUES ('1520', '341881', '宁国市', '149', '0', '0', 'Ningguo Shi', '2');
INSERT INTO `yw_region` VALUES ('1521', '350101', '市辖区', '150', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1522', '350102', '鼓楼区', '150', '0', '0', 'Gulou Qu', 'GLR');
INSERT INTO `yw_region` VALUES ('1523', '350103', '台江区', '150', '0', '0', 'Taijiang Qu', 'TJQ');
INSERT INTO `yw_region` VALUES ('1524', '350104', '仓山区', '150', '0', '0', 'Cangshan Qu', 'CSQ');
INSERT INTO `yw_region` VALUES ('1525', '350105', '马尾区', '150', '0', '0', 'Mawei Qu', 'MWQ');
INSERT INTO `yw_region` VALUES ('1526', '350111', '晋安区', '150', '0', '0', 'Jin,an Qu', 'JAF');
INSERT INTO `yw_region` VALUES ('1527', '350121', '闽侯县', '150', '0', '0', 'Minhou Qu', 'MHO');
INSERT INTO `yw_region` VALUES ('1528', '350122', '连江县', '150', '0', '0', 'Lianjiang Xian', 'LJF');
INSERT INTO `yw_region` VALUES ('1529', '350123', '罗源县', '150', '0', '0', 'Luoyuan Xian', 'LOY');
INSERT INTO `yw_region` VALUES ('1530', '350124', '闽清县', '150', '0', '0', 'Minqing Xian', 'MQG');
INSERT INTO `yw_region` VALUES ('1531', '350125', '永泰县', '150', '0', '0', 'Yongtai Xian', 'YTX');
INSERT INTO `yw_region` VALUES ('1532', '350128', '平潭县', '150', '0', '0', 'Pingtan Xian', 'PTN');
INSERT INTO `yw_region` VALUES ('1533', '350181', '福清市', '150', '0', '0', 'Fuqing Shi', 'FQS');
INSERT INTO `yw_region` VALUES ('1534', '350182', '长乐市', '150', '0', '0', 'Changle Shi', 'CLS');
INSERT INTO `yw_region` VALUES ('1535', '350201', '市辖区', '151', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1536', '350203', '思明区', '151', '0', '0', 'Siming Qu', 'SMQ');
INSERT INTO `yw_region` VALUES ('1537', '350205', '海沧区', '151', '0', '0', 'Haicang Qu', '2');
INSERT INTO `yw_region` VALUES ('1538', '350206', '湖里区', '151', '0', '0', 'Huli Qu', 'HLQ');
INSERT INTO `yw_region` VALUES ('1539', '350211', '集美区', '151', '0', '0', 'Jimei Qu', 'JMQ');
INSERT INTO `yw_region` VALUES ('1540', '350212', '同安区', '151', '0', '0', 'Tong,an Qu', 'TAQ');
INSERT INTO `yw_region` VALUES ('1541', '350213', '翔安区', '151', '0', '0', 'Xiangan Qu', '2');
INSERT INTO `yw_region` VALUES ('1542', '350301', '市辖区', '152', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1543', '350302', '城厢区', '152', '0', '0', 'Chengxiang Qu', 'CXP');
INSERT INTO `yw_region` VALUES ('1544', '350303', '涵江区', '152', '0', '0', 'Hanjiang Qu', 'HJQ');
INSERT INTO `yw_region` VALUES ('1545', '350304', '荔城区', '152', '0', '0', 'Licheng Qu', '2');
INSERT INTO `yw_region` VALUES ('1546', '350305', '秀屿区', '152', '0', '0', 'Xiuyu Qu', '2');
INSERT INTO `yw_region` VALUES ('1547', '350322', '仙游县', '152', '0', '0', 'Xianyou Xian', 'XYF');
INSERT INTO `yw_region` VALUES ('1548', '350401', '市辖区', '153', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1549', '350402', '梅列区', '153', '0', '0', 'Meilie Qu', 'MLQ');
INSERT INTO `yw_region` VALUES ('1550', '350403', '三元区', '153', '0', '0', 'Sanyuan Qu', 'SYB');
INSERT INTO `yw_region` VALUES ('1551', '350421', '明溪县', '153', '0', '0', 'Mingxi Xian', 'MXI');
INSERT INTO `yw_region` VALUES ('1552', '350423', '清流县', '153', '0', '0', 'Qingliu Xian', 'QLX');
INSERT INTO `yw_region` VALUES ('1553', '350424', '宁化县', '153', '0', '0', 'Ninghua Xian', 'NGH');
INSERT INTO `yw_region` VALUES ('1554', '350425', '大田县', '153', '0', '0', 'Datian Xian', 'DTM');
INSERT INTO `yw_region` VALUES ('1555', '350426', '尤溪县', '153', '0', '0', 'Youxi Xian', 'YXF');
INSERT INTO `yw_region` VALUES ('1556', '350427', '沙县', '153', '0', '0', 'Sha Xian', 'SAX');
INSERT INTO `yw_region` VALUES ('1557', '350428', '将乐县', '153', '0', '0', 'Jiangle Xian', 'JLE');
INSERT INTO `yw_region` VALUES ('1558', '350429', '泰宁县', '153', '0', '0', 'Taining Xian', 'TNG');
INSERT INTO `yw_region` VALUES ('1559', '350430', '建宁县', '153', '0', '0', 'Jianning Xian', 'JNF');
INSERT INTO `yw_region` VALUES ('1560', '350481', '永安市', '153', '0', '0', 'Yong,an Shi', 'YAF');
INSERT INTO `yw_region` VALUES ('1561', '350501', '市辖区', '154', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1562', '350502', '鲤城区', '154', '0', '0', 'Licheng Qu', 'LCQ');
INSERT INTO `yw_region` VALUES ('1563', '350503', '丰泽区', '154', '0', '0', 'Fengze Qu', 'FZE');
INSERT INTO `yw_region` VALUES ('1564', '350504', '洛江区', '154', '0', '0', 'Luojiang Qu', 'LJQ');
INSERT INTO `yw_region` VALUES ('1565', '350505', '泉港区', '154', '0', '0', 'Quangang Qu', '2');
INSERT INTO `yw_region` VALUES ('1566', '350521', '惠安县', '154', '0', '0', 'Hui,an Xian', 'HAF');
INSERT INTO `yw_region` VALUES ('1567', '350524', '安溪县', '154', '0', '0', 'Anxi Xian', 'ANX');
INSERT INTO `yw_region` VALUES ('1568', '350525', '永春县', '154', '0', '0', 'Yongchun Xian', 'YCM');
INSERT INTO `yw_region` VALUES ('1569', '350526', '德化县', '154', '0', '0', 'Dehua Xian', 'DHA');
INSERT INTO `yw_region` VALUES ('1570', '350527', '金门县', '154', '0', '0', 'Jinmen Xian', 'JME');
INSERT INTO `yw_region` VALUES ('1571', '350581', '石狮市', '154', '0', '0', 'Shishi Shi', 'SHH');
INSERT INTO `yw_region` VALUES ('1572', '350582', '晋江市', '154', '0', '0', 'Jinjiang Shi', 'JJG');
INSERT INTO `yw_region` VALUES ('1573', '350583', '南安市', '154', '0', '0', 'Nan,an Shi', 'NAS');
INSERT INTO `yw_region` VALUES ('1574', '350601', '市辖区', '155', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1575', '350602', '芗城区', '155', '0', '0', 'Xiangcheng Qu', 'XZZ');
INSERT INTO `yw_region` VALUES ('1576', '350603', '龙文区', '155', '0', '0', 'Longwen Qu', 'LWZ');
INSERT INTO `yw_region` VALUES ('1577', '350622', '云霄县', '155', '0', '0', 'Yunxiao Xian', 'YXO');
INSERT INTO `yw_region` VALUES ('1578', '350623', '漳浦县', '155', '0', '0', 'Zhangpu Xian', 'ZPU');
INSERT INTO `yw_region` VALUES ('1579', '350624', '诏安县', '155', '0', '0', 'Zhao,an Xian', 'ZAF');
INSERT INTO `yw_region` VALUES ('1580', '350625', '长泰县', '155', '0', '0', 'Changtai Xian', 'CTA');
INSERT INTO `yw_region` VALUES ('1581', '350626', '东山县', '155', '0', '0', 'Dongshan Xian', 'DSN');
INSERT INTO `yw_region` VALUES ('1582', '350627', '南靖县', '155', '0', '0', 'Nanjing Xian', 'NJX');
INSERT INTO `yw_region` VALUES ('1583', '350628', '平和县', '155', '0', '0', 'Pinghe Xian', 'PHE');
INSERT INTO `yw_region` VALUES ('1584', '350629', '华安县', '155', '0', '0', 'Hua,an Xian', 'HAN');
INSERT INTO `yw_region` VALUES ('1585', '350681', '龙海市', '155', '0', '0', 'Longhai Shi', 'LHM');
INSERT INTO `yw_region` VALUES ('1586', '350701', '市辖区', '156', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1587', '350702', '延平区', '156', '0', '0', 'Yanping Qu', 'YPQ');
INSERT INTO `yw_region` VALUES ('1588', '350721', '顺昌县', '156', '0', '0', 'Shunchang Xian', 'SCG');
INSERT INTO `yw_region` VALUES ('1589', '350722', '浦城县', '156', '0', '0', 'Pucheng Xian', 'PCX');
INSERT INTO `yw_region` VALUES ('1590', '350723', '光泽县', '156', '0', '0', 'Guangze Xian', 'GZE');
INSERT INTO `yw_region` VALUES ('1591', '350724', '松溪县', '156', '0', '0', 'Songxi Xian', 'SOX');
INSERT INTO `yw_region` VALUES ('1592', '350725', '政和县', '156', '0', '0', 'Zhenghe Xian', 'ZGH');
INSERT INTO `yw_region` VALUES ('1593', '350781', '邵武市', '156', '0', '0', 'Shaowu Shi', 'SWU');
INSERT INTO `yw_region` VALUES ('1594', '350782', '武夷山市', '156', '0', '0', 'Wuyishan Shi', 'WUS');
INSERT INTO `yw_region` VALUES ('1595', '350783', '建瓯市', '156', '0', '0', 'Jian,ou Shi', 'JOU');
INSERT INTO `yw_region` VALUES ('1596', '350784', '建阳市', '156', '0', '0', 'Jianyang Shi', 'JNY');
INSERT INTO `yw_region` VALUES ('1597', '350801', '市辖区', '157', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1598', '350802', '新罗区', '157', '0', '0', 'Xinluo Qu', 'XNL');
INSERT INTO `yw_region` VALUES ('1599', '350821', '长汀县', '157', '0', '0', 'Changting Xian', 'CTG');
INSERT INTO `yw_region` VALUES ('1600', '350822', '永定县', '157', '0', '0', 'Yongding Xian', 'YDI');
INSERT INTO `yw_region` VALUES ('1601', '350823', '上杭县', '157', '0', '0', 'Shanghang Xian', 'SHF');
INSERT INTO `yw_region` VALUES ('1602', '350824', '武平县', '157', '0', '0', 'Wuping Xian', 'WPG');
INSERT INTO `yw_region` VALUES ('1603', '350825', '连城县', '157', '0', '0', 'Liancheng Xian', 'LCF');
INSERT INTO `yw_region` VALUES ('1604', '350881', '漳平市', '157', '0', '0', 'Zhangping Xian', 'ZGP');
INSERT INTO `yw_region` VALUES ('1605', '350901', '市辖区', '158', '0', '0', '1', '2');
INSERT INTO `yw_region` VALUES ('1606', '350902', '蕉城区', '158', '0', '0', 'Jiaocheng Qu', '2');
INSERT INTO `yw_region` VALUES ('1607', '350921', '霞浦县', '158', '0', '0', 'Xiapu Xian', '2');
INSERT INTO `yw_region` VALUES ('1608', '350922', '古田县', '158', '0', '0', 'Gutian Xian', '2');
INSERT INTO `yw_region` VALUES ('1609', '350923', '屏南县', '158', '0', '0', 'Pingnan Xian', '2');
INSERT INTO `yw_region` VALUES ('1610', '350924', '寿宁县', '158', '0', '0', 'Shouning Xian', '2');
INSERT INTO `yw_region` VALUES ('1611', '350925', '周宁县', '158', '0', '0', 'Zhouning Xian', '2');
INSERT INTO `yw_region` VALUES ('1612', '350926', '柘荣县', '158', '0', '0', 'Zherong Xian', '2');
INSERT INTO `yw_region` VALUES ('1613', '350981', '福安市', '158', '0', '0', 'Fu,an Shi', '2');
INSERT INTO `yw_region` VALUES ('1614', '350982', '福鼎市', '158', '0', '0', 'Fuding Shi', '2');
INSERT INTO `yw_region` VALUES ('1615', '360101', '市辖区', '159', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1616', '360102', '东湖区', '159', '0', '0', 'Donghu Qu', 'DHU');
INSERT INTO `yw_region` VALUES ('1617', '360103', '西湖区', '159', '0', '0', 'Xihu Qu ', 'XHQ');
INSERT INTO `yw_region` VALUES ('1618', '360104', '青云谱区', '159', '0', '0', 'Qingyunpu Qu', 'QYP');
INSERT INTO `yw_region` VALUES ('1619', '360105', '湾里区', '159', '0', '0', 'Wanli Qu', 'WLI');
INSERT INTO `yw_region` VALUES ('1620', '360111', '青山湖区', '159', '0', '0', 'Qingshanhu Qu', '2');
INSERT INTO `yw_region` VALUES ('1621', '360121', '南昌县', '159', '0', '0', 'Nanchang Xian', 'NCA');
INSERT INTO `yw_region` VALUES ('1622', '360122', '新建县', '159', '0', '0', 'Xinjian Xian', 'XJN');
INSERT INTO `yw_region` VALUES ('1623', '360123', '安义县', '159', '0', '0', 'Anyi Xian', 'AYI');
INSERT INTO `yw_region` VALUES ('1624', '360124', '进贤县', '159', '0', '0', 'Jinxian Xian', 'JXX');
INSERT INTO `yw_region` VALUES ('1625', '360201', '市辖区', '160', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1626', '360202', '昌江区', '160', '0', '0', 'Changjiang Qu', 'CJG');
INSERT INTO `yw_region` VALUES ('1627', '360203', '珠山区', '160', '0', '0', 'Zhushan Qu', 'ZSJ');
INSERT INTO `yw_region` VALUES ('1628', '360222', '浮梁县', '160', '0', '0', 'Fuliang Xian', 'FLX');
INSERT INTO `yw_region` VALUES ('1629', '360281', '乐平市', '160', '0', '0', 'Leping Shi', 'LEP');
INSERT INTO `yw_region` VALUES ('1630', '360301', '市辖区', '161', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1631', '360302', '安源区', '161', '0', '0', 'Anyuan Qu', 'AYQ');
INSERT INTO `yw_region` VALUES ('1632', '360313', '湘东区', '161', '0', '0', 'Xiangdong Qu', 'XDG');
INSERT INTO `yw_region` VALUES ('1633', '360321', '莲花县', '161', '0', '0', 'Lianhua Xian', 'LHG');
INSERT INTO `yw_region` VALUES ('1634', '360322', '上栗县', '161', '0', '0', 'Shangli Xian', 'SLI');
INSERT INTO `yw_region` VALUES ('1635', '360323', '芦溪县', '161', '0', '0', 'Lixi Xian', 'LXP');
INSERT INTO `yw_region` VALUES ('1636', '360401', '市辖区', '162', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1637', '360402', '庐山区', '162', '0', '0', 'Lushan Qu', 'LSV');
INSERT INTO `yw_region` VALUES ('1638', '360403', '浔阳区', '162', '0', '0', 'Xunyang Qu', 'XYC');
INSERT INTO `yw_region` VALUES ('1639', '360421', '九江县', '162', '0', '0', 'Jiujiang Xian', 'JUJ');
INSERT INTO `yw_region` VALUES ('1640', '360423', '武宁县', '162', '0', '0', 'Wuning Xian', 'WUN');
INSERT INTO `yw_region` VALUES ('1641', '360424', '修水县', '162', '0', '0', 'Xiushui Xian', 'XSG');
INSERT INTO `yw_region` VALUES ('1642', '360425', '永修县', '162', '0', '0', 'Yongxiu Xian', 'YOX');
INSERT INTO `yw_region` VALUES ('1643', '360426', '德安县', '162', '0', '0', 'De,an Xian', 'DEA');
INSERT INTO `yw_region` VALUES ('1644', '360427', '星子县', '162', '0', '0', 'Xingzi Xian', 'XZI');
INSERT INTO `yw_region` VALUES ('1645', '360428', '都昌县', '162', '0', '0', 'Duchang Xian', 'DUC');
INSERT INTO `yw_region` VALUES ('1646', '360429', '湖口县', '162', '0', '0', 'Hukou Xian', 'HUK');
INSERT INTO `yw_region` VALUES ('1647', '360430', '彭泽县', '162', '0', '0', 'Pengze Xian', 'PZE');
INSERT INTO `yw_region` VALUES ('1648', '360481', '瑞昌市', '162', '0', '0', 'Ruichang Shi', 'RCG');
INSERT INTO `yw_region` VALUES ('1649', '360501', '市辖区', '163', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1650', '360502', '渝水区', '163', '0', '0', 'Yushui Qu', 'YSR');
INSERT INTO `yw_region` VALUES ('1651', '360521', '分宜县', '163', '0', '0', 'Fenyi Xian', 'FYI');
INSERT INTO `yw_region` VALUES ('1652', '360601', '市辖区', '164', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1653', '360602', '月湖区', '164', '0', '0', 'Yuehu Qu', 'YHY');
INSERT INTO `yw_region` VALUES ('1654', '360622', '余江县', '164', '0', '0', 'Yujiang Xian', 'YUJ');
INSERT INTO `yw_region` VALUES ('1655', '360681', '贵溪市', '164', '0', '0', 'Guixi Shi', 'GXS');
INSERT INTO `yw_region` VALUES ('1656', '360701', '市辖区', '165', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1657', '360702', '章贡区', '165', '0', '0', 'Zhanggong Qu', 'ZGG');
INSERT INTO `yw_region` VALUES ('1658', '360721', '赣县', '165', '0', '0', 'Gan Xian', 'GXN');
INSERT INTO `yw_region` VALUES ('1659', '360722', '信丰县', '165', '0', '0', 'Xinfeng Xian ', 'XNF');
INSERT INTO `yw_region` VALUES ('1660', '360723', '大余县', '165', '0', '0', 'Dayu Xian', 'DYX');
INSERT INTO `yw_region` VALUES ('1661', '360724', '上犹县', '165', '0', '0', 'Shangyou Xian', 'SYO');
INSERT INTO `yw_region` VALUES ('1662', '360725', '崇义县', '165', '0', '0', 'Chongyi Xian', 'CYX');
INSERT INTO `yw_region` VALUES ('1663', '360726', '安远县', '165', '0', '0', 'Anyuan Xian', 'AYN');
INSERT INTO `yw_region` VALUES ('1664', '360727', '龙南县', '165', '0', '0', 'Longnan Xian', 'LNX');
INSERT INTO `yw_region` VALUES ('1665', '360728', '定南县', '165', '0', '0', 'Dingnan Xian', 'DNN');
INSERT INTO `yw_region` VALUES ('1666', '360729', '全南县', '165', '0', '0', 'Quannan Xian', 'QNN');
INSERT INTO `yw_region` VALUES ('1667', '360730', '宁都县', '165', '0', '0', 'Ningdu Xian', 'NDU');
INSERT INTO `yw_region` VALUES ('1668', '360731', '于都县', '165', '0', '0', 'Yudu Xian', 'YUD');
INSERT INTO `yw_region` VALUES ('1669', '360732', '兴国县', '165', '0', '0', 'Xingguo Xian', 'XGG');
INSERT INTO `yw_region` VALUES ('1670', '360733', '会昌县', '165', '0', '0', 'Huichang Xian', 'HIC');
INSERT INTO `yw_region` VALUES ('1671', '360734', '寻乌县', '165', '0', '0', 'Xunwu Xian', 'XNW');
INSERT INTO `yw_region` VALUES ('1672', '360735', '石城县', '165', '0', '0', 'Shicheng Xian', 'SIC');
INSERT INTO `yw_region` VALUES ('1673', '360781', '瑞金市', '165', '0', '0', 'Ruijin Shi', 'RJS');
INSERT INTO `yw_region` VALUES ('1674', '360782', '南康市', '165', '0', '0', 'Nankang Shi', 'NNK');
INSERT INTO `yw_region` VALUES ('1675', '360801', '市辖区', '166', '0', '0', '1', '2');
INSERT INTO `yw_region` VALUES ('1676', '360802', '吉州区', '166', '0', '0', 'Jizhou Qu', '2');
INSERT INTO `yw_region` VALUES ('1677', '360803', '青原区', '166', '0', '0', 'Qingyuan Qu', '2');
INSERT INTO `yw_region` VALUES ('1678', '360821', '吉安县', '166', '0', '0', 'Ji,an Xian', '2');
INSERT INTO `yw_region` VALUES ('1679', '360822', '吉水县', '166', '0', '0', 'Jishui Xian', '2');
INSERT INTO `yw_region` VALUES ('1680', '360823', '峡江县', '166', '0', '0', 'Xiajiang Xian', '2');
INSERT INTO `yw_region` VALUES ('1681', '360824', '新干县', '166', '0', '0', 'Xingan Xian', '2');
INSERT INTO `yw_region` VALUES ('1682', '360825', '永丰县', '166', '0', '0', 'Yongfeng Xian', '2');
INSERT INTO `yw_region` VALUES ('1683', '360826', '泰和县', '166', '0', '0', 'Taihe Xian', '2');
INSERT INTO `yw_region` VALUES ('1684', '360827', '遂川县', '166', '0', '0', 'Suichuan Xian', '2');
INSERT INTO `yw_region` VALUES ('1685', '360828', '万安县', '166', '0', '0', 'Wan,an Xian', '2');
INSERT INTO `yw_region` VALUES ('1686', '360829', '安福县', '166', '0', '0', 'Anfu Xian', '2');
INSERT INTO `yw_region` VALUES ('1687', '360830', '永新县', '166', '0', '0', 'Yongxin Xian ', '2');
INSERT INTO `yw_region` VALUES ('1688', '360881', '井冈山市', '166', '0', '0', 'Jinggangshan Shi', '2');
INSERT INTO `yw_region` VALUES ('1689', '360901', '市辖区', '167', '0', '0', '1', '2');
INSERT INTO `yw_region` VALUES ('1690', '360902', '袁州区', '167', '0', '0', 'Yuanzhou Qu', '2');
INSERT INTO `yw_region` VALUES ('1691', '360921', '奉新县', '167', '0', '0', 'Fengxin Xian', '2');
INSERT INTO `yw_region` VALUES ('1692', '360922', '万载县', '167', '0', '0', 'Wanzai Xian', '2');
INSERT INTO `yw_region` VALUES ('1693', '360923', '上高县', '167', '0', '0', 'Shanggao Xian', '2');
INSERT INTO `yw_region` VALUES ('1694', '360924', '宜丰县', '167', '0', '0', 'Yifeng Xian', '2');
INSERT INTO `yw_region` VALUES ('1695', '360925', '靖安县', '167', '0', '0', 'Jing,an Xian', '2');
INSERT INTO `yw_region` VALUES ('1696', '360926', '铜鼓县', '167', '0', '0', 'Tonggu Xian', '2');
INSERT INTO `yw_region` VALUES ('1697', '360981', '丰城市', '167', '0', '0', 'Fengcheng Shi', '2');
INSERT INTO `yw_region` VALUES ('1698', '360982', '樟树市', '167', '0', '0', 'Zhangshu Shi', '2');
INSERT INTO `yw_region` VALUES ('1699', '360983', '高安市', '167', '0', '0', 'Gao,an Shi', '2');
INSERT INTO `yw_region` VALUES ('1700', '361001', '市辖区', '168', '0', '0', '1', '2');
INSERT INTO `yw_region` VALUES ('1701', '361002', '临川区', '168', '0', '0', 'Linchuan Qu', '2');
INSERT INTO `yw_region` VALUES ('1702', '361021', '南城县', '168', '0', '0', 'Nancheng Xian', '2');
INSERT INTO `yw_region` VALUES ('1703', '361022', '黎川县', '168', '0', '0', 'Lichuan Xian', '2');
INSERT INTO `yw_region` VALUES ('1704', '361023', '南丰县', '168', '0', '0', 'Nanfeng Xian', '2');
INSERT INTO `yw_region` VALUES ('1705', '361024', '崇仁县', '168', '0', '0', 'Chongren Xian', '2');
INSERT INTO `yw_region` VALUES ('1706', '361025', '乐安县', '168', '0', '0', 'Le,an Xian', '2');
INSERT INTO `yw_region` VALUES ('1707', '361026', '宜黄县', '168', '0', '0', 'Yihuang Xian', '2');
INSERT INTO `yw_region` VALUES ('1708', '361027', '金溪县', '168', '0', '0', 'Jinxi Xian', '2');
INSERT INTO `yw_region` VALUES ('1709', '361028', '资溪县', '168', '0', '0', 'Zixi Xian', '2');
INSERT INTO `yw_region` VALUES ('1710', '361029', '东乡县', '168', '0', '0', 'Dongxiang Xian', '2');
INSERT INTO `yw_region` VALUES ('1711', '361030', '广昌县', '168', '0', '0', 'Guangchang Xian', '2');
INSERT INTO `yw_region` VALUES ('1712', '361101', '市辖区', '169', '0', '0', '1', '2');
INSERT INTO `yw_region` VALUES ('1713', '361102', '信州区', '169', '0', '0', 'Xinzhou Qu', 'XZQ');
INSERT INTO `yw_region` VALUES ('1714', '361121', '上饶县', '169', '0', '0', 'Shangrao Xian ', '2');
INSERT INTO `yw_region` VALUES ('1715', '361122', '广丰县', '169', '0', '0', 'Guangfeng Xian', '2');
INSERT INTO `yw_region` VALUES ('1716', '361123', '玉山县', '169', '0', '0', 'Yushan Xian', '2');
INSERT INTO `yw_region` VALUES ('1717', '361124', '铅山县', '169', '0', '0', 'Qianshan Xian', '2');
INSERT INTO `yw_region` VALUES ('1718', '361125', '横峰县', '169', '0', '0', 'Hengfeng Xian', '2');
INSERT INTO `yw_region` VALUES ('1719', '361126', '弋阳县', '169', '0', '0', 'Yiyang Xian', '2');
INSERT INTO `yw_region` VALUES ('1720', '361127', '余干县', '169', '0', '0', 'Yugan Xian', '2');
INSERT INTO `yw_region` VALUES ('1721', '361128', '鄱阳县', '169', '0', '0', 'Poyang Xian', 'PYX');
INSERT INTO `yw_region` VALUES ('1722', '361129', '万年县', '169', '0', '0', 'Wannian Xian', '2');
INSERT INTO `yw_region` VALUES ('1723', '361130', '婺源县', '169', '0', '0', 'Wuyuan Xian', '2');
INSERT INTO `yw_region` VALUES ('1724', '361181', '德兴市', '169', '0', '0', 'Dexing Shi', '2');
INSERT INTO `yw_region` VALUES ('1725', '370101', '市辖区', '170', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1726', '370102', '历下区', '170', '0', '0', 'Lixia Qu', 'LXQ');
INSERT INTO `yw_region` VALUES ('1727', '370101', '市中区', '170', '0', '0', 'Shizhong Qu', 'SZQ');
INSERT INTO `yw_region` VALUES ('1728', '370104', '槐荫区', '170', '0', '0', 'Huaiyin Qu', 'HYF');
INSERT INTO `yw_region` VALUES ('1729', '370105', '天桥区', '170', '0', '0', 'Tianqiao Qu', 'TQQ');
INSERT INTO `yw_region` VALUES ('1730', '370112', '历城区', '170', '0', '0', 'Licheng Qu', 'LCZ');
INSERT INTO `yw_region` VALUES ('1731', '370113', '长清区', '170', '0', '0', 'Changqing Qu', '2');
INSERT INTO `yw_region` VALUES ('1732', '370124', '平阴县', '170', '0', '0', 'Pingyin Xian', 'PYL');
INSERT INTO `yw_region` VALUES ('1733', '370125', '济阳县', '170', '0', '0', 'Jiyang Xian', 'JYL');
INSERT INTO `yw_region` VALUES ('1734', '370126', '商河县', '170', '0', '0', 'Shanghe Xian', 'SGH');
INSERT INTO `yw_region` VALUES ('1735', '370181', '章丘市', '170', '0', '0', 'Zhangqiu Shi', 'ZQS');
INSERT INTO `yw_region` VALUES ('1736', '370201', '市辖区', '171', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1737', '370202', '市南区', '171', '0', '0', 'Shinan Qu', 'SNQ');
INSERT INTO `yw_region` VALUES ('1738', '370203', '市北区', '171', '0', '0', 'Shibei Qu', 'SBQ');
INSERT INTO `yw_region` VALUES ('1739', '370205', '四方区', '171', '0', '0', 'Sifang Qu', 'SFQ');
INSERT INTO `yw_region` VALUES ('1740', '370211', '黄岛区', '171', '0', '0', 'Huangdao Qu', 'HDO');
INSERT INTO `yw_region` VALUES ('1741', '370212', '崂山区', '171', '0', '0', 'Laoshan Qu', 'LQD');
INSERT INTO `yw_region` VALUES ('1742', '370213', '李沧区', '171', '0', '0', 'Licang Qu', 'LCT');
INSERT INTO `yw_region` VALUES ('1743', '370214', '城阳区', '171', '0', '0', 'Chengyang Qu', 'CEY');
INSERT INTO `yw_region` VALUES ('1744', '370281', '胶州市', '171', '0', '0', 'Jiaozhou Shi', 'JZS');
INSERT INTO `yw_region` VALUES ('1745', '370282', '即墨市', '171', '0', '0', 'Jimo Shi', 'JMO');
INSERT INTO `yw_region` VALUES ('1746', '370283', '平度市', '171', '0', '0', 'Pingdu Shi', 'PDU');
INSERT INTO `yw_region` VALUES ('1747', '370284', '胶南市', '171', '0', '0', 'Jiaonan Shi', 'JNS');
INSERT INTO `yw_region` VALUES ('1748', '370285', '莱西市', '171', '0', '0', 'Laixi Shi', 'LXE');
INSERT INTO `yw_region` VALUES ('1749', '370301', '市辖区', '172', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1750', '370302', '淄川区', '172', '0', '0', 'Zichuan Qu', 'ZCQ');
INSERT INTO `yw_region` VALUES ('1751', '370303', '张店区', '172', '0', '0', 'Zhangdian Qu', 'ZDQ');
INSERT INTO `yw_region` VALUES ('1752', '370304', '博山区', '172', '0', '0', 'Boshan Qu', 'BSZ');
INSERT INTO `yw_region` VALUES ('1753', '370305', '临淄区', '172', '0', '0', 'Linzi Qu', 'LZQ');
INSERT INTO `yw_region` VALUES ('1754', '370306', '周村区', '172', '0', '0', 'Zhoucun Qu', 'ZCN');
INSERT INTO `yw_region` VALUES ('1755', '370321', '桓台县', '172', '0', '0', 'Huantai Xian', 'HTL');
INSERT INTO `yw_region` VALUES ('1756', '370322', '高青县', '172', '0', '0', 'Gaoqing Xian', 'GQG');
INSERT INTO `yw_region` VALUES ('1757', '370323', '沂源县', '172', '0', '0', 'Yiyuan Xian', 'YIY');
INSERT INTO `yw_region` VALUES ('1758', '370401', '市辖区', '173', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1759', '370402', '市中区', '173', '0', '0', 'Shizhong Qu', 'SZZ');
INSERT INTO `yw_region` VALUES ('1760', '370403', '薛城区', '173', '0', '0', 'Xuecheng Qu', 'XEC');
INSERT INTO `yw_region` VALUES ('1761', '370404', '峄城区', '173', '0', '0', 'Yicheng Qu', 'YZZ');
INSERT INTO `yw_region` VALUES ('1762', '370405', '台儿庄区', '173', '0', '0', 'Tai,erzhuang Qu', 'TEZ');
INSERT INTO `yw_region` VALUES ('1763', '370406', '山亭区', '173', '0', '0', 'Shanting Qu', 'STG');
INSERT INTO `yw_region` VALUES ('1764', '370481', '滕州市', '173', '0', '0', 'Tengzhou Shi', 'TZO');
INSERT INTO `yw_region` VALUES ('1765', '370501', '市辖区', '174', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1766', '370502', '东营区', '174', '0', '0', 'Dongying Qu', 'DYQ');
INSERT INTO `yw_region` VALUES ('1767', '370503', '河口区', '174', '0', '0', 'Hekou Qu', 'HKO');
INSERT INTO `yw_region` VALUES ('1768', '370521', '垦利县', '174', '0', '0', 'Kenli Xian', 'KLI');
INSERT INTO `yw_region` VALUES ('1769', '370522', '利津县', '174', '0', '0', 'Lijin Xian', 'LJN');
INSERT INTO `yw_region` VALUES ('1770', '370523', '广饶县', '174', '0', '0', 'Guangrao Xian ', 'GRO');
INSERT INTO `yw_region` VALUES ('1771', '370601', '市辖区', '175', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1772', '370602', '芝罘区', '175', '0', '0', 'Zhifu Qu', 'ZFQ');
INSERT INTO `yw_region` VALUES ('1773', '370611', '福山区', '175', '0', '0', 'Fushan Qu', 'FUS');
INSERT INTO `yw_region` VALUES ('1774', '370612', '牟平区', '175', '0', '0', 'Muping Qu', 'MPQ');
INSERT INTO `yw_region` VALUES ('1775', '370613', '莱山区', '175', '0', '0', 'Laishan Qu', 'LYT');
INSERT INTO `yw_region` VALUES ('1776', '370634', '长岛县', '175', '0', '0', 'Changdao Xian', 'CDO');
INSERT INTO `yw_region` VALUES ('1777', '370681', '龙口市', '175', '0', '0', 'Longkou Shi', 'LKU');
INSERT INTO `yw_region` VALUES ('1778', '370682', '莱阳市', '175', '0', '0', 'Laiyang Shi', 'LYD');
INSERT INTO `yw_region` VALUES ('1779', '370683', '莱州市', '175', '0', '0', 'Laizhou Shi', 'LZG');
INSERT INTO `yw_region` VALUES ('1780', '370684', '蓬莱市', '175', '0', '0', 'Penglai Shi', 'PLI');
INSERT INTO `yw_region` VALUES ('1781', '370685', '招远市', '175', '0', '0', 'Zhaoyuan Shi', 'ZYL');
INSERT INTO `yw_region` VALUES ('1782', '370686', '栖霞市', '175', '0', '0', 'Qixia Shi', 'QXS');
INSERT INTO `yw_region` VALUES ('1783', '370687', '海阳市', '175', '0', '0', 'Haiyang Shi', 'HYL');
INSERT INTO `yw_region` VALUES ('1784', '370701', '市辖区', '176', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1785', '370702', '潍城区', '176', '0', '0', 'Weicheng Qu', 'WCG');
INSERT INTO `yw_region` VALUES ('1786', '370703', '寒亭区', '176', '0', '0', 'Hanting Qu', 'HNT');
INSERT INTO `yw_region` VALUES ('1787', '370704', '坊子区', '176', '0', '0', 'Fangzi Qu', 'FZQ');
INSERT INTO `yw_region` VALUES ('1788', '370705', '奎文区', '176', '0', '0', 'Kuiwen Qu', 'KWN');
INSERT INTO `yw_region` VALUES ('1789', '370724', '临朐县', '176', '0', '0', 'Linqu Xian', 'LNQ');
INSERT INTO `yw_region` VALUES ('1790', '370725', '昌乐县', '176', '0', '0', 'Changle Xian', 'CLX');
INSERT INTO `yw_region` VALUES ('1791', '370781', '青州市', '176', '0', '0', 'Qingzhou Shi', 'QGZ');
INSERT INTO `yw_region` VALUES ('1792', '370782', '诸城市', '176', '0', '0', 'Zhucheng Shi', 'ZCL');
INSERT INTO `yw_region` VALUES ('1793', '370783', '寿光市', '176', '0', '0', 'Shouguang Shi', 'SGG');
INSERT INTO `yw_region` VALUES ('1794', '370784', '安丘市', '176', '0', '0', 'Anqiu Shi', 'AQU');
INSERT INTO `yw_region` VALUES ('1795', '370785', '高密市', '176', '0', '0', 'Gaomi Shi', 'GMI');
INSERT INTO `yw_region` VALUES ('1796', '370786', '昌邑市', '176', '0', '0', 'Changyi Shi', 'CYL');
INSERT INTO `yw_region` VALUES ('1797', '370801', '市辖区', '177', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1798', '370802', '市中区', '177', '0', '0', 'Shizhong Qu', 'SZU');
INSERT INTO `yw_region` VALUES ('1799', '370811', '任城区', '177', '0', '0', 'Rencheng Qu', 'RCQ');
INSERT INTO `yw_region` VALUES ('1800', '370826', '微山县', '177', '0', '0', 'Weishan Xian', 'WSA');
INSERT INTO `yw_region` VALUES ('1801', '370827', '鱼台县', '177', '0', '0', 'Yutai Xian', 'YTL');
INSERT INTO `yw_region` VALUES ('1802', '370828', '金乡县', '177', '0', '0', 'Jinxiang Xian', 'JXG');
INSERT INTO `yw_region` VALUES ('1803', '370829', '嘉祥县', '177', '0', '0', 'Jiaxiang Xian', 'JXP');
INSERT INTO `yw_region` VALUES ('1804', '370830', '汶上县', '177', '0', '0', 'Wenshang Xian', 'WNS');
INSERT INTO `yw_region` VALUES ('1805', '370831', '泗水县', '177', '0', '0', 'Sishui Xian', 'SSH');
INSERT INTO `yw_region` VALUES ('1806', '370832', '梁山县', '177', '0', '0', 'Liangshan Xian', 'LSN');
INSERT INTO `yw_region` VALUES ('1807', '370881', '曲阜市', '177', '0', '0', 'Qufu Shi', 'QFU');
INSERT INTO `yw_region` VALUES ('1808', '370882', '兖州市', '177', '0', '0', 'Yanzhou Shi', 'YZL');
INSERT INTO `yw_region` VALUES ('1809', '370883', '邹城市', '177', '0', '0', 'Zoucheng Shi', 'ZCG');
INSERT INTO `yw_region` VALUES ('1810', '370901', '市辖区', '178', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1811', '370902', '泰山区', '178', '0', '0', 'Taishan Qu', 'TSQ');
INSERT INTO `yw_region` VALUES ('1812', '370911', '岱岳区', '178', '0', '0', 'Daiyue Qu', '2');
INSERT INTO `yw_region` VALUES ('1813', '370921', '宁阳县', '178', '0', '0', 'Ningyang Xian', 'NGY');
INSERT INTO `yw_region` VALUES ('1814', '370923', '东平县', '178', '0', '0', 'Dongping Xian', 'DPG');
INSERT INTO `yw_region` VALUES ('1815', '370982', '新泰市', '178', '0', '0', 'Xintai Shi', 'XTA');
INSERT INTO `yw_region` VALUES ('1816', '370983', '肥城市', '178', '0', '0', 'Feicheng Shi', 'FEC');
INSERT INTO `yw_region` VALUES ('1817', '371001', '市辖区', '179', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1818', '371002', '环翠区', '179', '0', '0', 'Huancui Qu', 'HNC');
INSERT INTO `yw_region` VALUES ('1819', '371081', '文登市', '179', '0', '0', 'Wendeng Shi', 'WDS');
INSERT INTO `yw_region` VALUES ('1820', '371082', '荣成市', '179', '0', '0', 'Rongcheng Shi', '2');
INSERT INTO `yw_region` VALUES ('1821', '371083', '乳山市', '179', '0', '0', 'Rushan Shi', 'RSN');
INSERT INTO `yw_region` VALUES ('1822', '371101', '市辖区', '180', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1823', '371102', '东港区', '180', '0', '0', 'Donggang Qu', 'DGR');
INSERT INTO `yw_region` VALUES ('1824', '371103', '岚山区', '180', '0', '0', 'Lanshan Qu', '2');
INSERT INTO `yw_region` VALUES ('1825', '371121', '五莲县', '180', '0', '0', 'Wulian Xian', 'WLN');
INSERT INTO `yw_region` VALUES ('1826', '371122', '莒县', '180', '0', '0', 'Ju Xian', 'JUX');
INSERT INTO `yw_region` VALUES ('1827', '371201', '市辖区', '181', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1828', '371202', '莱城区', '181', '0', '0', 'Laicheng Qu', 'LAC');
INSERT INTO `yw_region` VALUES ('1829', '371203', '钢城区', '181', '0', '0', 'Gangcheng Qu', 'GCQ');
INSERT INTO `yw_region` VALUES ('1830', '371301', '市辖区', '182', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1831', '371302', '兰山区', '182', '0', '0', 'Lanshan Qu', 'LLS');
INSERT INTO `yw_region` VALUES ('1832', '371311', '罗庄区', '182', '0', '0', 'Luozhuang Qu', 'LZU');
INSERT INTO `yw_region` VALUES ('1833', '371301', '河东区', '182', '0', '0', 'Hedong Qu', '2');
INSERT INTO `yw_region` VALUES ('1834', '371321', '沂南县', '182', '0', '0', 'Yinan Xian', 'YNN');
INSERT INTO `yw_region` VALUES ('1835', '371322', '郯城县', '182', '0', '0', 'Tancheng Xian', 'TCE');
INSERT INTO `yw_region` VALUES ('1836', '371323', '沂水县', '182', '0', '0', 'Yishui Xian', 'YIS');
INSERT INTO `yw_region` VALUES ('1837', '371324', '苍山县', '182', '0', '0', 'Cangshan Xian', 'CSH');
INSERT INTO `yw_region` VALUES ('1838', '371325', '费县', '182', '0', '0', 'Fei Xian', 'FEI');
INSERT INTO `yw_region` VALUES ('1839', '371326', '平邑县', '182', '0', '0', 'Pingyi Xian', 'PYI');
INSERT INTO `yw_region` VALUES ('1840', '371327', '莒南县', '182', '0', '0', 'Junan Xian', 'JNB');
INSERT INTO `yw_region` VALUES ('1841', '371328', '蒙阴县', '182', '0', '0', 'Mengyin Xian', 'MYL');
INSERT INTO `yw_region` VALUES ('1842', '371329', '临沭县', '182', '0', '0', 'Linshu Xian', 'LSP');
INSERT INTO `yw_region` VALUES ('1843', '371401', '市辖区', '183', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1844', '371402', '德城区', '183', '0', '0', 'Decheng Qu', 'DCD');
INSERT INTO `yw_region` VALUES ('1845', '371421', '陵县', '183', '0', '0', 'Ling Xian', 'LXL');
INSERT INTO `yw_region` VALUES ('1846', '371422', '宁津县', '183', '0', '0', 'Ningjin Xian', 'NGJ');
INSERT INTO `yw_region` VALUES ('1847', '371423', '庆云县', '183', '0', '0', 'Qingyun Xian', 'QYL');
INSERT INTO `yw_region` VALUES ('1848', '371424', '临邑县', '183', '0', '0', 'Linyi xian', 'LYM');
INSERT INTO `yw_region` VALUES ('1849', '371425', '齐河县', '183', '0', '0', 'Qihe Xian', 'QIH');
INSERT INTO `yw_region` VALUES ('1850', '371426', '平原县', '183', '0', '0', 'Pingyuan Xian', 'PYN');
INSERT INTO `yw_region` VALUES ('1851', '371427', '夏津县', '183', '0', '0', 'Xiajin Xian', 'XAJ');
INSERT INTO `yw_region` VALUES ('1852', '371428', '武城县', '183', '0', '0', 'Wucheng Xian', 'WUC');
INSERT INTO `yw_region` VALUES ('1853', '371481', '乐陵市', '183', '0', '0', 'Leling Shi', 'LEL');
INSERT INTO `yw_region` VALUES ('1854', '371482', '禹城市', '183', '0', '0', 'Yucheng Shi', 'YCL');
INSERT INTO `yw_region` VALUES ('1855', '371501', '市辖区', '184', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1856', '371502', '东昌府区', '184', '0', '0', 'Dongchangfu Qu', 'DCF');
INSERT INTO `yw_region` VALUES ('1857', '371521', '阳谷县', '184', '0', '0', 'Yanggu Xian ', 'YGU');
INSERT INTO `yw_region` VALUES ('1858', '371522', '莘县', '184', '0', '0', 'Shen Xian', 'SHN');
INSERT INTO `yw_region` VALUES ('1859', '371523', '茌平县', '184', '0', '0', 'Chiping Xian ', 'CPG');
INSERT INTO `yw_region` VALUES ('1860', '371524', '东阿县', '184', '0', '0', 'Dong,e Xian', 'DGE');
INSERT INTO `yw_region` VALUES ('1861', '371525', '冠县', '184', '0', '0', 'Guan Xian', 'GXL');
INSERT INTO `yw_region` VALUES ('1862', '371526', '高唐县', '184', '0', '0', 'Gaotang Xian', 'GTG');
INSERT INTO `yw_region` VALUES ('1863', '371581', '临清市', '184', '0', '0', 'Linqing Xian', 'LQS');
INSERT INTO `yw_region` VALUES ('1864', '371601', '市辖区', '185', '0', '0', '1', '2');
INSERT INTO `yw_region` VALUES ('1865', '371602', '滨城区', '185', '0', '0', 'Bincheng Qu', '2');
INSERT INTO `yw_region` VALUES ('1866', '371621', '惠民县', '185', '0', '0', 'Huimin Xian', '2');
INSERT INTO `yw_region` VALUES ('1867', '371622', '阳信县', '185', '0', '0', 'Yangxin Xian', '2');
INSERT INTO `yw_region` VALUES ('1868', '371623', '无棣县', '185', '0', '0', 'Wudi Xian', '2');
INSERT INTO `yw_region` VALUES ('1869', '371624', '沾化县', '185', '0', '0', 'Zhanhua Xian', '2');
INSERT INTO `yw_region` VALUES ('1870', '371625', '博兴县', '185', '0', '0', 'Boxing Xian', '2');
INSERT INTO `yw_region` VALUES ('1871', '371626', '邹平县', '185', '0', '0', 'Zouping Xian', '2');
INSERT INTO `yw_region` VALUES ('1873', '371702', '牡丹区', '186', '0', '0', 'Mudan Qu', '2');
INSERT INTO `yw_region` VALUES ('1874', '371721', '曹县', '186', '0', '0', 'Cao Xian', '2');
INSERT INTO `yw_region` VALUES ('1875', '371722', '单县', '186', '0', '0', 'Shan Xian', '2');
INSERT INTO `yw_region` VALUES ('1876', '371723', '成武县', '186', '0', '0', 'Chengwu Xian', '2');
INSERT INTO `yw_region` VALUES ('1877', '371724', '巨野县', '186', '0', '0', 'Juye Xian', '2');
INSERT INTO `yw_region` VALUES ('1878', '371725', '郓城县', '186', '0', '0', 'Yuncheng Xian', '2');
INSERT INTO `yw_region` VALUES ('1879', '371726', '鄄城县', '186', '0', '0', 'Juancheng Xian', '2');
INSERT INTO `yw_region` VALUES ('1880', '371727', '定陶县', '186', '0', '0', 'Dingtao Xian', '2');
INSERT INTO `yw_region` VALUES ('1881', '371728', '东明县', '186', '0', '0', 'Dongming Xian', '2');
INSERT INTO `yw_region` VALUES ('1882', '410101', '市辖区', '187', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1883', '410102', '中原区', '187', '0', '0', 'Zhongyuan Qu', 'ZYQ');
INSERT INTO `yw_region` VALUES ('1884', '410103', '二七区', '187', '0', '0', 'Erqi Qu', 'EQQ');
INSERT INTO `yw_region` VALUES ('1885', '410104', '管城回族区', '187', '0', '0', 'Guancheng Huizu Qu', 'GCH');
INSERT INTO `yw_region` VALUES ('1886', '410105', '金水区', '187', '0', '0', 'Jinshui Qu', 'JSU');
INSERT INTO `yw_region` VALUES ('1887', '410106', '上街区', '187', '0', '0', 'Shangjie Qu', 'SJE');
INSERT INTO `yw_region` VALUES ('1888', '410108', '惠济区', '187', '0', '0', 'Mangshan Qu', '2');
INSERT INTO `yw_region` VALUES ('1889', '410122', '中牟县', '187', '0', '0', 'Zhongmou Xian', 'ZMO');
INSERT INTO `yw_region` VALUES ('1890', '410181', '巩义市', '187', '0', '0', 'Gongyi Shi', 'GYI');
INSERT INTO `yw_region` VALUES ('1891', '410182', '荥阳市', '187', '0', '0', 'Xingyang Shi', 'XYK');
INSERT INTO `yw_region` VALUES ('1892', '410183', '新密市', '187', '0', '0', 'Xinmi Shi', 'XMI');
INSERT INTO `yw_region` VALUES ('1893', '410184', '新郑市', '187', '0', '0', 'Xinzheng Shi', 'XZG');
INSERT INTO `yw_region` VALUES ('1894', '410185', '登封市', '187', '0', '0', 'Dengfeng Shi', '2');
INSERT INTO `yw_region` VALUES ('1895', '410201', '市辖区', '188', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1896', '410202', '龙亭区', '188', '0', '0', 'Longting Qu', 'LTK');
INSERT INTO `yw_region` VALUES ('1897', '410203', '顺河回族区', '188', '0', '0', 'Shunhe Huizu Qu', 'SHR');
INSERT INTO `yw_region` VALUES ('1898', '410204', '鼓楼区', '188', '0', '0', 'Gulou Qu', 'GLK');
INSERT INTO `yw_region` VALUES ('1899', '410205', '禹王台区', '188', '0', '0', 'Yuwangtai Qu', '2');
INSERT INTO `yw_region` VALUES ('1900', '410211', '金明区', '188', '0', '0', 'Jinming Qu', '2');
INSERT INTO `yw_region` VALUES ('1901', '410221', '杞县', '188', '0', '0', 'Qi Xian', 'QIX');
INSERT INTO `yw_region` VALUES ('1902', '410222', '通许县', '188', '0', '0', 'Tongxu Xian', 'TXY');
INSERT INTO `yw_region` VALUES ('1903', '410223', '尉氏县', '188', '0', '0', 'Weishi Xian', 'WSI');
INSERT INTO `yw_region` VALUES ('1904', '410224', '开封县', '188', '0', '0', 'Kaifeng Xian', 'KFX');
INSERT INTO `yw_region` VALUES ('1905', '410225', '兰考县', '188', '0', '0', 'Lankao Xian', 'LKA');
INSERT INTO `yw_region` VALUES ('1906', '410301', '市辖区', '189', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1907', '410302', '老城区', '189', '0', '0', 'Laocheng Qu', 'LLY');
INSERT INTO `yw_region` VALUES ('1908', '410303', '西工区', '189', '0', '0', 'Xigong Qu', 'XGL');
INSERT INTO `yw_region` VALUES ('1909', '410304', '瀍河回族区', '189', '0', '0', 'Chanhehuizu Qu', '2');
INSERT INTO `yw_region` VALUES ('1910', '410305', '涧西区', '189', '0', '0', 'Jianxi Qu', 'JXL');
INSERT INTO `yw_region` VALUES ('1911', '410306', '吉利区', '189', '0', '0', 'Jili Qu', 'JLL');
INSERT INTO `yw_region` VALUES ('1912', '410311', '洛龙区', '189', '0', '0', 'Luolong Qu', '2');
INSERT INTO `yw_region` VALUES ('1913', '410322', '孟津县', '189', '0', '0', 'Mengjin Xian', 'MGJ');
INSERT INTO `yw_region` VALUES ('1914', '410323', '新安县', '189', '0', '0', 'Xin,an Xian', 'XAX');
INSERT INTO `yw_region` VALUES ('1915', '410324', '栾川县', '189', '0', '0', 'Luanchuan Xian', 'LCK');
INSERT INTO `yw_region` VALUES ('1916', '410325', '嵩县', '189', '0', '0', 'Song Xian', 'SON');
INSERT INTO `yw_region` VALUES ('1917', '410326', '汝阳县', '189', '0', '0', 'Ruyang Xian', 'RUY');
INSERT INTO `yw_region` VALUES ('1918', '410327', '宜阳县', '189', '0', '0', 'Yiyang Xian', 'YYY');
INSERT INTO `yw_region` VALUES ('1919', '410328', '洛宁县', '189', '0', '0', 'Luoning Xian', 'LNI');
INSERT INTO `yw_region` VALUES ('1920', '410329', '伊川县', '189', '0', '0', 'Yichuan Xian', 'YCZ');
INSERT INTO `yw_region` VALUES ('1921', '410381', '偃师市', '189', '0', '0', 'Yanshi Shi', 'YST');
INSERT INTO `yw_region` VALUES ('1922', '410401', '市辖区', '190', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1923', '410402', '新华区', '190', '0', '0', 'Xinhua Qu', 'XHP');
INSERT INTO `yw_region` VALUES ('1924', '410403', '卫东区', '190', '0', '0', 'Weidong Qu', 'WDG');
INSERT INTO `yw_region` VALUES ('1925', '410404', '石龙区', '190', '0', '0', 'Shilong Qu', 'SIL');
INSERT INTO `yw_region` VALUES ('1926', '410411', '湛河区', '190', '0', '0', 'Zhanhe Qu', 'ZHQ');
INSERT INTO `yw_region` VALUES ('1927', '410421', '宝丰县', '190', '0', '0', 'Baofeng Xian', 'BFG');
INSERT INTO `yw_region` VALUES ('1928', '410422', '叶县', '190', '0', '0', 'Ye Xian', 'YEX');
INSERT INTO `yw_region` VALUES ('1929', '410423', '鲁山县', '190', '0', '0', 'Lushan Xian', 'LUS');
INSERT INTO `yw_region` VALUES ('1930', '410425', '郏县', '190', '0', '0', 'Jia Xian', 'JXY');
INSERT INTO `yw_region` VALUES ('1931', '410481', '舞钢市', '190', '0', '0', 'Wugang Shi', 'WGY');
INSERT INTO `yw_region` VALUES ('1932', '410482', '汝州市', '190', '0', '0', 'Ruzhou Shi', 'RZO');
INSERT INTO `yw_region` VALUES ('1933', '410501', '市辖区', '191', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1934', '410502', '文峰区', '191', '0', '0', 'Wenfeng Qu', 'WFQ');
INSERT INTO `yw_region` VALUES ('1935', '410503', '北关区', '191', '0', '0', 'Beiguan Qu', 'BGQ');
INSERT INTO `yw_region` VALUES ('1936', '410505', '殷都区', '191', '0', '0', 'Yindu Qu', '2');
INSERT INTO `yw_region` VALUES ('1937', '410506', '龙安区', '191', '0', '0', 'Longan Qu', '2');
INSERT INTO `yw_region` VALUES ('1938', '410522', '安阳县', '191', '0', '0', 'Anyang Xian', 'AYX');
INSERT INTO `yw_region` VALUES ('1939', '410523', '汤阴县', '191', '0', '0', 'Tangyin Xian', 'TYI');
INSERT INTO `yw_region` VALUES ('1940', '410526', '滑县', '191', '0', '0', 'Hua Xian', 'HUA');
INSERT INTO `yw_region` VALUES ('1941', '410527', '内黄县', '191', '0', '0', 'Neihuang Xian', 'NHG');
INSERT INTO `yw_region` VALUES ('1942', '410581', '林州市', '191', '0', '0', 'Linzhou Shi', 'LZY');
INSERT INTO `yw_region` VALUES ('1943', '410601', '市辖区', '192', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1944', '410602', '鹤山区', '192', '0', '0', 'Heshan Qu', 'HSF');
INSERT INTO `yw_region` VALUES ('1945', '410603', '山城区', '192', '0', '0', 'Shancheng Qu', 'SCB');
INSERT INTO `yw_region` VALUES ('1946', '410611', '淇滨区', '192', '0', '0', 'Qibin Qu', '2');
INSERT INTO `yw_region` VALUES ('1947', '410621', '浚县', '192', '0', '0', 'Xun Xian', 'XUX');
INSERT INTO `yw_region` VALUES ('1948', '410622', '淇县', '192', '0', '0', 'Qi Xian', 'QXY');
INSERT INTO `yw_region` VALUES ('1949', '410701', '市辖区', '193', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1950', '410702', '红旗区', '193', '0', '0', 'Hongqi Qu', 'HQQ');
INSERT INTO `yw_region` VALUES ('1951', '410703', '卫滨区', '193', '0', '0', 'Weibin Qu', '2');
INSERT INTO `yw_region` VALUES ('1952', '410704', '凤泉区', '193', '0', '0', 'Fengquan Qu', '2');
INSERT INTO `yw_region` VALUES ('1953', '410711', '牧野区', '193', '0', '0', 'Muye Qu', '2');
INSERT INTO `yw_region` VALUES ('1954', '410721', '新乡县', '193', '0', '0', 'Xinxiang Xian', 'XXX');
INSERT INTO `yw_region` VALUES ('1955', '410724', '获嘉县', '193', '0', '0', 'Huojia Xian', 'HOJ');
INSERT INTO `yw_region` VALUES ('1956', '410725', '原阳县', '193', '0', '0', 'Yuanyang Xian', 'YYA');
INSERT INTO `yw_region` VALUES ('1957', '410726', '延津县', '193', '0', '0', 'Yanjin Xian', 'YJN');
INSERT INTO `yw_region` VALUES ('1958', '410727', '封丘县', '193', '0', '0', 'Fengqiu Xian', 'FQU');
INSERT INTO `yw_region` VALUES ('1959', '410728', '长垣县', '193', '0', '0', 'Changyuan Xian', 'CYU');
INSERT INTO `yw_region` VALUES ('1960', '410781', '卫辉市', '193', '0', '0', 'Weihui Shi', 'WHS');
INSERT INTO `yw_region` VALUES ('1961', '410782', '辉县市', '193', '0', '0', 'Huixian Shi', 'HXS');
INSERT INTO `yw_region` VALUES ('1962', '410801', '市辖区', '194', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1963', '410802', '解放区', '194', '0', '0', 'Jiefang Qu', 'JFQ');
INSERT INTO `yw_region` VALUES ('1964', '410803', '中站区', '194', '0', '0', 'Zhongzhan Qu', 'ZZQ');
INSERT INTO `yw_region` VALUES ('1965', '410804', '马村区', '194', '0', '0', 'Macun Qu', 'MCQ');
INSERT INTO `yw_region` VALUES ('1966', '410811', '山阳区', '194', '0', '0', 'Shanyang Qu', 'SYC');
INSERT INTO `yw_region` VALUES ('1967', '410821', '修武县', '194', '0', '0', 'Xiuwu Xian', 'XUW');
INSERT INTO `yw_region` VALUES ('1968', '410822', '博爱县', '194', '0', '0', 'Bo,ai Xian', 'BOA');
INSERT INTO `yw_region` VALUES ('1969', '410823', '武陟县', '194', '0', '0', 'Wuzhi Xian', 'WZI');
INSERT INTO `yw_region` VALUES ('1970', '410825', '温县', '194', '0', '0', 'Wen Xian', 'WEN');
INSERT INTO `yw_region` VALUES ('1971', '419001', '济源市', '194', '0', '0', 'Jiyuan Shi', '2');
INSERT INTO `yw_region` VALUES ('1972', '410882', '沁阳市', '194', '0', '0', 'Qinyang Shi', 'QYS');
INSERT INTO `yw_region` VALUES ('1973', '410883', '孟州市', '194', '0', '0', 'Mengzhou Shi', 'MZO');
INSERT INTO `yw_region` VALUES ('1974', '410901', '市辖区', '195', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1975', '410902', '华龙区', '195', '0', '0', 'Hualong Qu', '2');
INSERT INTO `yw_region` VALUES ('1976', '410922', '清丰县', '195', '0', '0', 'Qingfeng Xian', 'QFG');
INSERT INTO `yw_region` VALUES ('1977', '410923', '南乐县', '195', '0', '0', 'Nanle Xian', 'NLE');
INSERT INTO `yw_region` VALUES ('1978', '410926', '范县', '195', '0', '0', 'Fan Xian', 'FAX');
INSERT INTO `yw_region` VALUES ('1979', '410927', '台前县', '195', '0', '0', 'Taiqian Xian', 'TQN');
INSERT INTO `yw_region` VALUES ('1980', '410928', '濮阳县', '195', '0', '0', 'Puyang Xian', 'PUY');
INSERT INTO `yw_region` VALUES ('1981', '411001', '市辖区', '196', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1982', '411002', '魏都区', '196', '0', '0', 'Weidu Qu', 'WED');
INSERT INTO `yw_region` VALUES ('1983', '411023', '许昌县', '196', '0', '0', 'Xuchang Xian', 'XUC');
INSERT INTO `yw_region` VALUES ('1984', '411024', '鄢陵县', '196', '0', '0', 'Yanling Xian', 'YLY');
INSERT INTO `yw_region` VALUES ('1985', '411025', '襄城县', '196', '0', '0', 'Xiangcheng Xian', 'XAC');
INSERT INTO `yw_region` VALUES ('1986', '411081', '禹州市', '196', '0', '0', 'Yuzhou Shi', 'YUZ');
INSERT INTO `yw_region` VALUES ('1987', '411082', '长葛市', '196', '0', '0', 'Changge Shi', 'CGE');
INSERT INTO `yw_region` VALUES ('1988', '411101', '市辖区', '197', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1989', '411102', '源汇区', '197', '0', '0', 'Yuanhui Qu', 'YHI');
INSERT INTO `yw_region` VALUES ('1990', '411103', '郾城区', '197', '0', '0', 'Yancheng Qu', '2');
INSERT INTO `yw_region` VALUES ('1991', '411104', '召陵区', '197', '0', '0', 'Zhaoling Qu', '2');
INSERT INTO `yw_region` VALUES ('1992', '411121', '舞阳县', '197', '0', '0', 'Wuyang Xian', 'WYG');
INSERT INTO `yw_region` VALUES ('1993', '411122', '临颍县', '197', '0', '0', 'Linying Xian', 'LNY');
INSERT INTO `yw_region` VALUES ('1994', '411201', '市辖区', '198', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('1995', '411202', '湖滨区', '198', '0', '0', 'Hubin Qu', 'HBI');
INSERT INTO `yw_region` VALUES ('1996', '411221', '渑池县', '198', '0', '0', 'Mianchi Xian', 'MCI');
INSERT INTO `yw_region` VALUES ('1997', '411222', '陕县', '198', '0', '0', 'Shan Xian', 'SHX');
INSERT INTO `yw_region` VALUES ('1998', '411224', '卢氏县', '198', '0', '0', 'Lushi Xian', 'LUU');
INSERT INTO `yw_region` VALUES ('1999', '411281', '义马市', '198', '0', '0', 'Yima Shi', 'YMA');
INSERT INTO `yw_region` VALUES ('2000', '411282', '灵宝市', '198', '0', '0', 'Lingbao Shi', 'LBS');
INSERT INTO `yw_region` VALUES ('2001', '411301', '市辖区', '199', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2002', '411302', '宛城区', '199', '0', '0', 'Wancheng Qu', 'WCN');
INSERT INTO `yw_region` VALUES ('2003', '411303', '卧龙区', '199', '0', '0', 'Wolong Qu', 'WOL');
INSERT INTO `yw_region` VALUES ('2004', '411321', '南召县', '199', '0', '0', 'Nanzhao Xian', 'NZO');
INSERT INTO `yw_region` VALUES ('2005', '411322', '方城县', '199', '0', '0', 'Fangcheng Xian', 'FCX');
INSERT INTO `yw_region` VALUES ('2006', '411323', '西峡县', '199', '0', '0', 'Xixia Xian', 'XXY');
INSERT INTO `yw_region` VALUES ('2007', '411324', '镇平县', '199', '0', '0', 'Zhenping Xian', 'ZPX');
INSERT INTO `yw_region` VALUES ('2008', '411325', '内乡县', '199', '0', '0', 'Neixiang Xian', 'NXG');
INSERT INTO `yw_region` VALUES ('2009', '411326', '淅川县', '199', '0', '0', 'Xichuan Xian', 'XCY');
INSERT INTO `yw_region` VALUES ('2010', '411327', '社旗县', '199', '0', '0', 'Sheqi Xian', 'SEQ');
INSERT INTO `yw_region` VALUES ('2011', '411328', '唐河县', '199', '0', '0', 'Tanghe Xian', 'TGH');
INSERT INTO `yw_region` VALUES ('2012', '411329', '新野县', '199', '0', '0', 'Xinye Xian', 'XYE');
INSERT INTO `yw_region` VALUES ('2013', '411330', '桐柏县', '199', '0', '0', 'Tongbai Xian', 'TBX');
INSERT INTO `yw_region` VALUES ('2014', '411381', '邓州市', '199', '0', '0', 'Dengzhou Shi', 'DGZ');
INSERT INTO `yw_region` VALUES ('2015', '411401', '市辖区', '200', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2016', '411402', '梁园区', '200', '0', '0', 'Liangyuan Qu', 'LYY');
INSERT INTO `yw_region` VALUES ('2017', '411403', '睢阳区', '200', '0', '0', 'Suiyang Qu', 'SYA');
INSERT INTO `yw_region` VALUES ('2018', '411421', '民权县', '200', '0', '0', 'Minquan Xian', 'MQY');
INSERT INTO `yw_region` VALUES ('2019', '411422', '睢县', '200', '0', '0', 'Sui Xian', 'SUI');
INSERT INTO `yw_region` VALUES ('2020', '411423', '宁陵县', '200', '0', '0', 'Ningling Xian', 'NGL');
INSERT INTO `yw_region` VALUES ('2021', '411424', '柘城县', '200', '0', '0', 'Zhecheng Xian', 'ZHC');
INSERT INTO `yw_region` VALUES ('2022', '411425', '虞城县', '200', '0', '0', 'Yucheng Xian', 'YUC');
INSERT INTO `yw_region` VALUES ('2023', '411426', '夏邑县', '200', '0', '0', 'Xiayi Xian', 'XAY');
INSERT INTO `yw_region` VALUES ('2024', '411481', '永城市', '200', '0', '0', 'Yongcheng Shi', 'YOC');
INSERT INTO `yw_region` VALUES ('2025', '411501', '市辖区', '201', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2026', '411502', '浉河区', '201', '0', '0', 'Shihe Qu', 'SHU');
INSERT INTO `yw_region` VALUES ('2027', '411503', '平桥区', '201', '0', '0', 'Pingqiao Qu', 'PQQ');
INSERT INTO `yw_region` VALUES ('2028', '411521', '罗山县', '201', '0', '0', 'Luoshan Xian', 'LSE');
INSERT INTO `yw_region` VALUES ('2029', '411522', '光山县', '201', '0', '0', 'Guangshan Xian', 'GSX');
INSERT INTO `yw_region` VALUES ('2030', '411523', '新县', '201', '0', '0', 'Xin Xian', 'XXI');
INSERT INTO `yw_region` VALUES ('2031', '411524', '商城县', '201', '0', '0', 'Shangcheng Xian', 'SCX');
INSERT INTO `yw_region` VALUES ('2032', '411525', '固始县', '201', '0', '0', 'Gushi Xian', 'GSI');
INSERT INTO `yw_region` VALUES ('2033', '411526', '潢川县', '201', '0', '0', 'Huangchuan Xian', 'HCU');
INSERT INTO `yw_region` VALUES ('2034', '411527', '淮滨县', '201', '0', '0', 'Huaibin Xian', 'HBN');
INSERT INTO `yw_region` VALUES ('2035', '411528', '息县', '201', '0', '0', 'Xi Xian', 'XIX');
INSERT INTO `yw_region` VALUES ('2036', '411601', '市辖区', '202', '0', '0', '1', '2');
INSERT INTO `yw_region` VALUES ('2037', '411602', '川汇区', '202', '0', '0', 'Chuanhui Qu', '2');
INSERT INTO `yw_region` VALUES ('2038', '411621', '扶沟县', '202', '0', '0', 'Fugou Xian', '2');
INSERT INTO `yw_region` VALUES ('2039', '411622', '西华县', '202', '0', '0', 'Xihua Xian', '2');
INSERT INTO `yw_region` VALUES ('2040', '411623', '商水县', '202', '0', '0', 'Shangshui Xian', '2');
INSERT INTO `yw_region` VALUES ('2041', '411624', '沈丘县', '202', '0', '0', 'Shenqiu Xian', '2');
INSERT INTO `yw_region` VALUES ('2042', '411625', '郸城县', '202', '0', '0', 'Dancheng Xian', '2');
INSERT INTO `yw_region` VALUES ('2043', '411626', '淮阳县', '202', '0', '0', 'Huaiyang Xian', '2');
INSERT INTO `yw_region` VALUES ('2044', '411627', '太康县', '202', '0', '0', 'Taikang Xian', '2');
INSERT INTO `yw_region` VALUES ('2045', '411628', '鹿邑县', '202', '0', '0', 'Luyi Xian', '2');
INSERT INTO `yw_region` VALUES ('2046', '411681', '项城市', '202', '0', '0', 'Xiangcheng Shi', '2');
INSERT INTO `yw_region` VALUES ('2047', '411701', '市辖区', '203', '0', '0', '1', '2');
INSERT INTO `yw_region` VALUES ('2048', '411702', '驿城区', '203', '0', '0', 'Yicheng Qu', '2');
INSERT INTO `yw_region` VALUES ('2049', '411721', '西平县', '203', '0', '0', 'Xiping Xian', '2');
INSERT INTO `yw_region` VALUES ('2050', '411722', '上蔡县', '203', '0', '0', 'Shangcai Xian', '2');
INSERT INTO `yw_region` VALUES ('2051', '411723', '平舆县', '203', '0', '0', 'Pingyu Xian', '2');
INSERT INTO `yw_region` VALUES ('2052', '411724', '正阳县', '203', '0', '0', 'Zhengyang Xian', '2');
INSERT INTO `yw_region` VALUES ('2053', '411725', '确山县', '203', '0', '0', 'Queshan Xian', '2');
INSERT INTO `yw_region` VALUES ('2054', '411726', '泌阳县', '203', '0', '0', 'Biyang Xian', '2');
INSERT INTO `yw_region` VALUES ('2055', '411727', '汝南县', '203', '0', '0', 'Runan Xian', '2');
INSERT INTO `yw_region` VALUES ('2056', '411728', '遂平县', '203', '0', '0', 'Suiping Xian', '2');
INSERT INTO `yw_region` VALUES ('2057', '411729', '新蔡县', '203', '0', '0', 'Xincai Xian', '2');
INSERT INTO `yw_region` VALUES ('2058', '420101', '市辖区', '204', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2059', '420102', '江岸区', '204', '0', '0', 'Jiang,an Qu', 'JAA');
INSERT INTO `yw_region` VALUES ('2060', '420103', '江汉区', '204', '0', '0', 'Jianghan Qu', 'JHN');
INSERT INTO `yw_region` VALUES ('2061', '420104', '硚口区', '204', '0', '0', 'Qiaokou Qu', 'QKQ');
INSERT INTO `yw_region` VALUES ('2062', '420105', '汉阳区', '204', '0', '0', 'Hanyang Qu', 'HYA');
INSERT INTO `yw_region` VALUES ('2063', '420106', '武昌区', '204', '0', '0', 'Wuchang Qu', 'WCQ');
INSERT INTO `yw_region` VALUES ('2064', '420107', '青山区', '204', '0', '0', 'Qingshan Qu', 'QSN');
INSERT INTO `yw_region` VALUES ('2065', '420111', '洪山区', '204', '0', '0', 'Hongshan Qu', 'HSQ');
INSERT INTO `yw_region` VALUES ('2066', '420112', '东西湖区', '204', '0', '0', 'Dongxihu Qu', 'DXH');
INSERT INTO `yw_region` VALUES ('2067', '420113', '汉南区', '204', '0', '0', 'Hannan Qu', 'HNQ');
INSERT INTO `yw_region` VALUES ('2068', '420114', '蔡甸区', '204', '0', '0', 'Caidian Qu', 'CDN');
INSERT INTO `yw_region` VALUES ('2069', '420115', '江夏区', '204', '0', '0', 'Jiangxia Qu', 'JXQ');
INSERT INTO `yw_region` VALUES ('2070', '420116', '黄陂区', '204', '0', '0', 'Huangpi Qu', 'HPI');
INSERT INTO `yw_region` VALUES ('2071', '420117', '新洲区', '204', '0', '0', 'Xinzhou Qu', 'XNZ');
INSERT INTO `yw_region` VALUES ('2072', '420201', '市辖区', '205', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2073', '420202', '黄石港区', '205', '0', '0', 'Huangshigang Qu', 'HSG');
INSERT INTO `yw_region` VALUES ('2074', '420203', '西塞山区', '205', '0', '0', 'Xisaishan Qu', '2');
INSERT INTO `yw_region` VALUES ('2075', '420204', '下陆区', '205', '0', '0', 'Xialu Qu', 'XAL');
INSERT INTO `yw_region` VALUES ('2076', '420205', '铁山区', '205', '0', '0', 'Tieshan Qu', 'TSH');
INSERT INTO `yw_region` VALUES ('2077', '420222', '阳新县', '205', '0', '0', 'Yangxin Xian', 'YXE');
INSERT INTO `yw_region` VALUES ('2078', '420281', '大冶市', '205', '0', '0', 'Daye Shi', 'DYE');
INSERT INTO `yw_region` VALUES ('2079', '420301', '市辖区', '206', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2080', '420302', '茅箭区', '206', '0', '0', 'Maojian Qu', 'MJN');
INSERT INTO `yw_region` VALUES ('2081', '420303', '张湾区', '206', '0', '0', 'Zhangwan Qu', 'ZWQ');
INSERT INTO `yw_region` VALUES ('2082', '420321', '郧县', '206', '0', '0', 'Yun Xian', 'YUN');
INSERT INTO `yw_region` VALUES ('2083', '420322', '郧西县', '206', '0', '0', 'Yunxi Xian', 'YNX');
INSERT INTO `yw_region` VALUES ('2084', '420323', '竹山县', '206', '0', '0', 'Zhushan Xian', 'ZHS');
INSERT INTO `yw_region` VALUES ('2085', '420324', '竹溪县', '206', '0', '0', 'Zhuxi Xian', 'ZXX');
INSERT INTO `yw_region` VALUES ('2086', '420325', '房县', '206', '0', '0', 'Fang Xian', 'FAG');
INSERT INTO `yw_region` VALUES ('2087', '420381', '丹江口市', '206', '0', '0', 'Danjiangkou Shi', 'DJK');
INSERT INTO `yw_region` VALUES ('2088', '420501', '市辖区', '207', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2089', '420502', '西陵区', '207', '0', '0', 'Xiling Qu', 'XLQ');
INSERT INTO `yw_region` VALUES ('2090', '420503', '伍家岗区', '207', '0', '0', 'Wujiagang Qu', 'WJG');
INSERT INTO `yw_region` VALUES ('2091', '420504', '点军区', '207', '0', '0', 'Dianjun Qu', 'DJN');
INSERT INTO `yw_region` VALUES ('2092', '420505', '猇亭区', '207', '0', '0', 'Xiaoting Qu', 'XTQ');
INSERT INTO `yw_region` VALUES ('2093', '420506', '夷陵区', '207', '0', '0', 'Yiling Qu', '2');
INSERT INTO `yw_region` VALUES ('2094', '420525', '远安县', '207', '0', '0', 'Yuan,an Xian', 'YAX');
INSERT INTO `yw_region` VALUES ('2095', '420526', '兴山县', '207', '0', '0', 'Xingshan Xian', 'XSX');
INSERT INTO `yw_region` VALUES ('2096', '420527', '秭归县', '207', '0', '0', 'Zigui Xian', 'ZGI');
INSERT INTO `yw_region` VALUES ('2097', '420528', '长阳土家族自治县', '207', '0', '0', 'Changyang Tujiazu Zizhixian', 'CYA');
INSERT INTO `yw_region` VALUES ('2098', '420529', '五峰土家族自治县', '207', '0', '0', 'Wufeng Tujiazu Zizhixian', 'WFG');
INSERT INTO `yw_region` VALUES ('2099', '420581', '宜都市', '207', '0', '0', 'Yidu Shi', 'YID');
INSERT INTO `yw_region` VALUES ('2100', '420582', '当阳市', '207', '0', '0', 'Dangyang Shi', 'DYS');
INSERT INTO `yw_region` VALUES ('2101', '420583', '枝江市', '207', '0', '0', 'Zhijiang Shi', 'ZIJ');
INSERT INTO `yw_region` VALUES ('2102', '420601', '市辖区', '208', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2103', '420602', '襄城区', '208', '0', '0', 'Xiangcheng Qu', 'XXF');
INSERT INTO `yw_region` VALUES ('2104', '420606', '樊城区', '208', '0', '0', 'Fancheng Qu', 'FNC');
INSERT INTO `yw_region` VALUES ('2105', '420607', '襄阳区', '208', '0', '0', 'Xiangyang Qu', '2');
INSERT INTO `yw_region` VALUES ('2106', '420624', '南漳县', '208', '0', '0', 'Nanzhang Xian', 'NZH');
INSERT INTO `yw_region` VALUES ('2107', '420625', '谷城县', '208', '0', '0', 'Gucheng Xian', 'GUC');
INSERT INTO `yw_region` VALUES ('2108', '420626', '保康县', '208', '0', '0', 'Baokang Xian', 'BKG');
INSERT INTO `yw_region` VALUES ('2109', '420682', '老河口市', '208', '0', '0', 'Laohekou Shi', 'LHK');
INSERT INTO `yw_region` VALUES ('2110', '420683', '枣阳市', '208', '0', '0', 'Zaoyang Shi', 'ZOY');
INSERT INTO `yw_region` VALUES ('2111', '420684', '宜城市', '208', '0', '0', 'Yicheng Shi', 'YCW');
INSERT INTO `yw_region` VALUES ('2112', '420701', '市辖区', '209', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2113', '420702', '梁子湖区', '209', '0', '0', 'Liangzihu Qu', 'LZI');
INSERT INTO `yw_region` VALUES ('2114', '420703', '华容区', '209', '0', '0', 'Huarong Qu', 'HRQ');
INSERT INTO `yw_region` VALUES ('2115', '420704', '鄂城区', '209', '0', '0', 'Echeng Qu', 'ECQ');
INSERT INTO `yw_region` VALUES ('2116', '420801', '市辖区', '210', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2117', '420802', '东宝区', '210', '0', '0', 'Dongbao Qu', 'DBQ');
INSERT INTO `yw_region` VALUES ('2118', '420804', '掇刀区', '210', '0', '0', 'Duodao Qu', '2');
INSERT INTO `yw_region` VALUES ('2119', '420821', '京山县', '210', '0', '0', 'Jingshan Xian', 'JSA');
INSERT INTO `yw_region` VALUES ('2120', '420822', '沙洋县', '210', '0', '0', 'Shayang Xian', 'SYF');
INSERT INTO `yw_region` VALUES ('2121', '420881', '钟祥市', '210', '0', '0', 'Zhongxiang Shi', '2');
INSERT INTO `yw_region` VALUES ('2122', '420901', '市辖区', '211', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2123', '420902', '孝南区', '211', '0', '0', 'Xiaonan Qu', 'XNA');
INSERT INTO `yw_region` VALUES ('2124', '420921', '孝昌县', '211', '0', '0', 'Xiaochang Xian', 'XOC');
INSERT INTO `yw_region` VALUES ('2125', '420922', '大悟县', '211', '0', '0', 'Dawu Xian', 'DWU');
INSERT INTO `yw_region` VALUES ('2126', '420923', '云梦县', '211', '0', '0', 'Yunmeng Xian', 'YMX');
INSERT INTO `yw_region` VALUES ('2127', '420981', '应城市', '211', '0', '0', 'Yingcheng Shi', 'YCG');
INSERT INTO `yw_region` VALUES ('2128', '420982', '安陆市', '211', '0', '0', 'Anlu Shi', 'ALU');
INSERT INTO `yw_region` VALUES ('2129', '420984', '汉川市', '211', '0', '0', 'Hanchuan Shi', 'HCH');
INSERT INTO `yw_region` VALUES ('2130', '421001', '市辖区', '212', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2131', '421002', '沙市区', '212', '0', '0', 'Shashi Qu', 'SSJ');
INSERT INTO `yw_region` VALUES ('2132', '421003', '荆州区', '212', '0', '0', 'Jingzhou Qu', 'JZQ');
INSERT INTO `yw_region` VALUES ('2133', '421022', '公安县', '212', '0', '0', 'Gong,an Xian', 'GGA');
INSERT INTO `yw_region` VALUES ('2134', '421023', '监利县', '212', '0', '0', 'Jianli Xian', 'JLI');
INSERT INTO `yw_region` VALUES ('2135', '421024', '江陵县', '212', '0', '0', 'Jiangling Xian', 'JLX');
INSERT INTO `yw_region` VALUES ('2136', '421081', '石首市', '212', '0', '0', 'Shishou Shi', 'SSO');
INSERT INTO `yw_region` VALUES ('2137', '421083', '洪湖市', '212', '0', '0', 'Honghu Shi', 'HHU');
INSERT INTO `yw_region` VALUES ('2138', '421087', '松滋市', '212', '0', '0', 'Songzi Shi', 'SZF');
INSERT INTO `yw_region` VALUES ('2139', '421101', '市辖区', '213', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2140', '421102', '黄州区', '213', '0', '0', 'Huangzhou Qu', 'HZC');
INSERT INTO `yw_region` VALUES ('2141', '421121', '团风县', '213', '0', '0', 'Tuanfeng Xian', 'TFG');
INSERT INTO `yw_region` VALUES ('2142', '421122', '红安县', '213', '0', '0', 'Hong,an Xian', 'HGA');
INSERT INTO `yw_region` VALUES ('2143', '421123', '罗田县', '213', '0', '0', 'Luotian Xian', 'LTE');
INSERT INTO `yw_region` VALUES ('2144', '421124', '英山县', '213', '0', '0', 'Yingshan Xian', 'YSE');
INSERT INTO `yw_region` VALUES ('2145', '421125', '浠水县', '213', '0', '0', 'Xishui Xian', 'XSE');
INSERT INTO `yw_region` VALUES ('2146', '421126', '蕲春县', '213', '0', '0', 'Qichun Xian', 'QCN');
INSERT INTO `yw_region` VALUES ('2147', '421127', '黄梅县', '213', '0', '0', 'Huangmei Xian', 'HGM');
INSERT INTO `yw_region` VALUES ('2148', '421181', '麻城市', '213', '0', '0', 'Macheng Shi', 'MCS');
INSERT INTO `yw_region` VALUES ('2149', '421182', '武穴市', '213', '0', '0', 'Wuxue Shi', 'WXE');
INSERT INTO `yw_region` VALUES ('2150', '421201', '市辖区', '214', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2151', '421202', '咸安区', '214', '0', '0', 'Xian,an Qu', 'XAN');
INSERT INTO `yw_region` VALUES ('2152', '421221', '嘉鱼县', '214', '0', '0', 'Jiayu Xian', 'JYX');
INSERT INTO `yw_region` VALUES ('2153', '421222', '通城县', '214', '0', '0', 'Tongcheng Xian', 'TCX');
INSERT INTO `yw_region` VALUES ('2154', '421223', '崇阳县', '214', '0', '0', 'Chongyang Xian', 'CGY');
INSERT INTO `yw_region` VALUES ('2155', '421224', '通山县', '214', '0', '0', 'Tongshan Xian', 'TSA');
INSERT INTO `yw_region` VALUES ('2156', '421281', '赤壁市', '214', '0', '0', 'Chibi Shi', 'CBI');
INSERT INTO `yw_region` VALUES ('2157', '421301', '市辖区', '215', '0', '0', '1', '2');
INSERT INTO `yw_region` VALUES ('2158', '421303', '曾都区', '215', '0', '0', 'Zengdu Qu', '2');
INSERT INTO `yw_region` VALUES ('2159', '421381', '广水市', '215', '0', '0', 'Guangshui Shi', '2');
INSERT INTO `yw_region` VALUES ('2160', '422801', '恩施市', '216', '0', '0', 'Enshi Shi', 'ESS');
INSERT INTO `yw_region` VALUES ('2161', '422802', '利川市', '216', '0', '0', 'Lichuan Shi', 'LCE');
INSERT INTO `yw_region` VALUES ('2162', '422822', '建始县', '216', '0', '0', 'Jianshi Xian', 'JSE');
INSERT INTO `yw_region` VALUES ('2163', '422823', '巴东县', '216', '0', '0', 'Badong Xian', 'BDG');
INSERT INTO `yw_region` VALUES ('2164', '422825', '宣恩县', '216', '0', '0', 'Xuan,en Xian', 'XEN');
INSERT INTO `yw_region` VALUES ('2165', '422826', '咸丰县', '216', '0', '0', 'Xianfeng Xian', 'XFG');
INSERT INTO `yw_region` VALUES ('2166', '422827', '来凤县', '216', '0', '0', 'Laifeng Xian', 'LFG');
INSERT INTO `yw_region` VALUES ('2167', '422828', '鹤峰县', '216', '0', '0', 'Hefeng Xian', 'HEF');
INSERT INTO `yw_region` VALUES ('2168', '429004', '仙桃市', '217', '0', '0', 'Xiantao Shi', 'XNT');
INSERT INTO `yw_region` VALUES ('2169', '429005', '潜江市', '217', '0', '0', 'Qianjiang Shi', 'QNJ');
INSERT INTO `yw_region` VALUES ('2170', '429006', '天门市', '217', '0', '0', 'Tianmen Shi', 'TMS');
INSERT INTO `yw_region` VALUES ('2171', '429021', '神农架林区', '217', '0', '0', 'Shennongjia Linqu', 'SNJ');
INSERT INTO `yw_region` VALUES ('2172', '430101', '市辖区', '218', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2173', '430102', '芙蓉区', '218', '0', '0', 'Furong Qu', 'FRQ');
INSERT INTO `yw_region` VALUES ('2174', '430103', '天心区', '218', '0', '0', 'Tianxin Qu', 'TXQ');
INSERT INTO `yw_region` VALUES ('2175', '430104', '岳麓区', '218', '0', '0', 'Yuelu Qu', 'YLU');
INSERT INTO `yw_region` VALUES ('2176', '430105', '开福区', '218', '0', '0', 'Kaifu Qu', 'KFQ');
INSERT INTO `yw_region` VALUES ('2177', '430111', '雨花区', '218', '0', '0', 'Yuhua Qu', 'YHA');
INSERT INTO `yw_region` VALUES ('2178', '430121', '长沙县', '218', '0', '0', 'Changsha Xian', 'CSA');
INSERT INTO `yw_region` VALUES ('2179', '430122', '望城县', '218', '0', '0', 'Wangcheng Xian', 'WCH');
INSERT INTO `yw_region` VALUES ('2180', '430124', '宁乡县', '218', '0', '0', 'Ningxiang Xian', 'NXX');
INSERT INTO `yw_region` VALUES ('2181', '430181', '浏阳市', '218', '0', '0', 'Liuyang Shi', 'LYS');
INSERT INTO `yw_region` VALUES ('2182', '430201', '市辖区', '219', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2183', '430202', '荷塘区', '219', '0', '0', 'Hetang Qu', 'HTZ');
INSERT INTO `yw_region` VALUES ('2184', '430203', '芦淞区', '219', '0', '0', 'Lusong Qu', 'LZZ');
INSERT INTO `yw_region` VALUES ('2185', '430204', '石峰区', '219', '0', '0', 'Shifeng Qu', 'SFG');
INSERT INTO `yw_region` VALUES ('2186', '430211', '天元区', '219', '0', '0', 'Tianyuan Qu', 'TYQ');
INSERT INTO `yw_region` VALUES ('2187', '430221', '株洲县', '219', '0', '0', 'Zhuzhou Xian', 'ZZX');
INSERT INTO `yw_region` VALUES ('2188', '430223', '攸县', '219', '0', '0', 'You Xian', 'YOU');
INSERT INTO `yw_region` VALUES ('2189', '430224', '茶陵县', '219', '0', '0', 'Chaling Xian', 'CAL');
INSERT INTO `yw_region` VALUES ('2190', '430225', '炎陵县', '219', '0', '0', 'Yanling Xian', 'YLX');
INSERT INTO `yw_region` VALUES ('2191', '430281', '醴陵市', '219', '0', '0', 'Liling Shi', 'LIL');
INSERT INTO `yw_region` VALUES ('2192', '430301', '市辖区', '220', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2193', '430302', '雨湖区', '220', '0', '0', 'Yuhu Qu', 'YHU');
INSERT INTO `yw_region` VALUES ('2194', '430304', '岳塘区', '220', '0', '0', 'Yuetang Qu', 'YTG');
INSERT INTO `yw_region` VALUES ('2195', '430321', '湘潭县', '220', '0', '0', 'Xiangtan Qu', 'XTX');
INSERT INTO `yw_region` VALUES ('2196', '430381', '湘乡市', '220', '0', '0', 'Xiangxiang Shi', 'XXG');
INSERT INTO `yw_region` VALUES ('2197', '430382', '韶山市', '220', '0', '0', 'Shaoshan Shi', 'SSN');
INSERT INTO `yw_region` VALUES ('2198', '430401', '市辖区', '221', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2199', '430405', '珠晖区', '221', '0', '0', 'Zhuhui Qu', '2');
INSERT INTO `yw_region` VALUES ('2200', '430406', '雁峰区', '221', '0', '0', 'Yanfeng Qu', '2');
INSERT INTO `yw_region` VALUES ('2201', '430407', '石鼓区', '221', '0', '0', 'Shigu Qu', '2');
INSERT INTO `yw_region` VALUES ('2202', '430408', '蒸湘区', '221', '0', '0', 'Zhengxiang Qu', '2');
INSERT INTO `yw_region` VALUES ('2203', '430412', '南岳区', '221', '0', '0', 'Nanyue Qu', 'NYQ');
INSERT INTO `yw_region` VALUES ('2204', '430421', '衡阳县', '221', '0', '0', 'Hengyang Xian', 'HYO');
INSERT INTO `yw_region` VALUES ('2205', '430422', '衡南县', '221', '0', '0', 'Hengnan Xian', 'HNX');
INSERT INTO `yw_region` VALUES ('2206', '430423', '衡山县', '221', '0', '0', 'Hengshan Xian', 'HSH');
INSERT INTO `yw_region` VALUES ('2207', '430424', '衡东县', '221', '0', '0', 'Hengdong Xian', 'HED');
INSERT INTO `yw_region` VALUES ('2208', '430426', '祁东县', '221', '0', '0', 'Qidong Xian', 'QDX');
INSERT INTO `yw_region` VALUES ('2209', '430481', '耒阳市', '221', '0', '0', 'Leiyang Shi', 'LEY');
INSERT INTO `yw_region` VALUES ('2210', '430482', '常宁市', '221', '0', '0', 'Changning Shi', 'CNS');
INSERT INTO `yw_region` VALUES ('2211', '430501', '市辖区', '222', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2212', '430502', '双清区', '222', '0', '0', 'Shuangqing Qu', 'SGQ');
INSERT INTO `yw_region` VALUES ('2213', '430503', '大祥区', '222', '0', '0', 'Daxiang Qu', 'DXS');
INSERT INTO `yw_region` VALUES ('2214', '430511', '北塔区', '222', '0', '0', 'Beita Qu', 'BET');
INSERT INTO `yw_region` VALUES ('2215', '430521', '邵东县', '222', '0', '0', 'Shaodong Xian', 'SDG');
INSERT INTO `yw_region` VALUES ('2216', '430522', '新邵县', '222', '0', '0', 'Xinshao Xian', 'XSO');
INSERT INTO `yw_region` VALUES ('2217', '430523', '邵阳县', '222', '0', '0', 'Shaoyang Xian', 'SYW');
INSERT INTO `yw_region` VALUES ('2218', '430524', '隆回县', '222', '0', '0', 'Longhui Xian', 'LGH');
INSERT INTO `yw_region` VALUES ('2219', '430525', '洞口县', '222', '0', '0', 'Dongkou Xian', 'DGK');
INSERT INTO `yw_region` VALUES ('2220', '430527', '绥宁县', '222', '0', '0', 'Suining Xian', 'SNX');
INSERT INTO `yw_region` VALUES ('2221', '430528', '新宁县', '222', '0', '0', 'Xinning Xian', 'XNI');
INSERT INTO `yw_region` VALUES ('2222', '430529', '城步苗族自治县', '222', '0', '0', 'Chengbu Miaozu Zizhixian', 'CBU');
INSERT INTO `yw_region` VALUES ('2223', '430581', '武冈市', '222', '0', '0', 'Wugang Shi', 'WGS');
INSERT INTO `yw_region` VALUES ('2224', '430601', '市辖区', '223', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2225', '430602', '岳阳楼区', '223', '0', '0', 'Yueyanglou Qu', 'YYL');
INSERT INTO `yw_region` VALUES ('2226', '430603', '云溪区', '223', '0', '0', 'Yunxi Qu', 'YXI');
INSERT INTO `yw_region` VALUES ('2227', '430611', '君山区', '223', '0', '0', 'Junshan Qu', 'JUS');
INSERT INTO `yw_region` VALUES ('2228', '430621', '岳阳县', '223', '0', '0', 'Yueyang Xian', 'YYX');
INSERT INTO `yw_region` VALUES ('2229', '430623', '华容县', '223', '0', '0', 'Huarong Xian', 'HRG');
INSERT INTO `yw_region` VALUES ('2230', '430624', '湘阴县', '223', '0', '0', 'Xiangyin Xian', 'XYN');
INSERT INTO `yw_region` VALUES ('2231', '430626', '平江县', '223', '0', '0', 'Pingjiang Xian', 'PJH');
INSERT INTO `yw_region` VALUES ('2232', '430681', '汨罗市', '223', '0', '0', 'Miluo Shi', 'MLU');
INSERT INTO `yw_region` VALUES ('2233', '430682', '临湘市', '223', '0', '0', 'Linxiang Shi', 'LXY');
INSERT INTO `yw_region` VALUES ('2234', '430701', '市辖区', '224', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2235', '430702', '武陵区', '224', '0', '0', 'Wuling Qu', 'WLQ');
INSERT INTO `yw_region` VALUES ('2236', '430703', '鼎城区', '224', '0', '0', 'Dingcheng Qu', 'DCE');
INSERT INTO `yw_region` VALUES ('2237', '430721', '安乡县', '224', '0', '0', 'Anxiang Xian', 'AXG');
INSERT INTO `yw_region` VALUES ('2238', '430722', '汉寿县', '224', '0', '0', 'Hanshou Xian', 'HSO');
INSERT INTO `yw_region` VALUES ('2239', '430723', '澧县', '224', '0', '0', 'Li Xian', 'LXX');
INSERT INTO `yw_region` VALUES ('2240', '430724', '临澧县', '224', '0', '0', 'Linli Xian', 'LNL');
INSERT INTO `yw_region` VALUES ('2241', '430725', '桃源县', '224', '0', '0', 'Taoyuan Xian', 'TOY');
INSERT INTO `yw_region` VALUES ('2242', '430726', '石门县', '224', '0', '0', 'Shimen Xian', 'SHM');
INSERT INTO `yw_region` VALUES ('2243', '430781', '津市市', '224', '0', '0', 'Jinshi Shi', 'JSS');
INSERT INTO `yw_region` VALUES ('2244', '430801', '市辖区', '225', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2245', '430802', '永定区', '225', '0', '0', 'Yongding Qu', 'YDQ');
INSERT INTO `yw_region` VALUES ('2246', '430811', '武陵源区', '225', '0', '0', 'Wulingyuan Qu', 'WLY');
INSERT INTO `yw_region` VALUES ('2247', '430821', '慈利县', '225', '0', '0', 'Cili Xian', 'CLI');
INSERT INTO `yw_region` VALUES ('2248', '430822', '桑植县', '225', '0', '0', 'Sangzhi Xian', 'SZT');
INSERT INTO `yw_region` VALUES ('2249', '430901', '市辖区', '226', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2250', '430902', '资阳区', '226', '0', '0', 'Ziyang Qu', 'ZYC');
INSERT INTO `yw_region` VALUES ('2251', '430903', '赫山区', '226', '0', '0', 'Heshan Qu', 'HSY');
INSERT INTO `yw_region` VALUES ('2252', '430921', '南县', '226', '0', '0', 'Nan Xian', 'NXN');
INSERT INTO `yw_region` VALUES ('2253', '430922', '桃江县', '226', '0', '0', 'Taojiang Xian', 'TJG');
INSERT INTO `yw_region` VALUES ('2254', '430923', '安化县', '226', '0', '0', 'Anhua Xian', 'ANH');
INSERT INTO `yw_region` VALUES ('2255', '430981', '沅江市', '226', '0', '0', 'Yuanjiang Shi', 'YJS');
INSERT INTO `yw_region` VALUES ('2256', '431001', '市辖区', '227', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2257', '431002', '北湖区', '227', '0', '0', 'Beihu Qu', 'BHQ');
INSERT INTO `yw_region` VALUES ('2258', '431003', '苏仙区', '227', '0', '0', 'Suxian Qu', '2');
INSERT INTO `yw_region` VALUES ('2259', '431021', '桂阳县', '227', '0', '0', 'Guiyang Xian', 'GYX');
INSERT INTO `yw_region` VALUES ('2260', '431022', '宜章县', '227', '0', '0', 'yizhang Xian', 'YZA');
INSERT INTO `yw_region` VALUES ('2261', '431023', '永兴县', '227', '0', '0', 'Yongxing Xian', 'YXX');
INSERT INTO `yw_region` VALUES ('2262', '431024', '嘉禾县', '227', '0', '0', 'Jiahe Xian', 'JAH');
INSERT INTO `yw_region` VALUES ('2263', '431025', '临武县', '227', '0', '0', 'Linwu Xian', 'LWX');
INSERT INTO `yw_region` VALUES ('2264', '431026', '汝城县', '227', '0', '0', 'Rucheng Xian', 'RCE');
INSERT INTO `yw_region` VALUES ('2265', '431027', '桂东县', '227', '0', '0', 'Guidong Xian', 'GDO');
INSERT INTO `yw_region` VALUES ('2266', '431028', '安仁县', '227', '0', '0', 'Anren Xian', 'ARN');
INSERT INTO `yw_region` VALUES ('2267', '431081', '资兴市', '227', '0', '0', 'Zixing Shi', 'ZXG');
INSERT INTO `yw_region` VALUES ('2268', '431101', '市辖区', '228', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2270', '431103', '冷水滩区', '228', '0', '0', 'Lengshuitan Qu', 'LST');
INSERT INTO `yw_region` VALUES ('2271', '431121', '祁阳县', '228', '0', '0', 'Qiyang Xian', 'QJY');
INSERT INTO `yw_region` VALUES ('2272', '431122', '东安县', '228', '0', '0', 'Dong,an Xian', 'DOA');
INSERT INTO `yw_region` VALUES ('2273', '431123', '双牌县', '228', '0', '0', 'Shuangpai Xian', 'SPA');
INSERT INTO `yw_region` VALUES ('2274', '431124', '道县', '228', '0', '0', 'Dao Xian', 'DAO');
INSERT INTO `yw_region` VALUES ('2275', '431125', '江永县', '228', '0', '0', 'Jiangyong Xian', 'JYD');
INSERT INTO `yw_region` VALUES ('2276', '431126', '宁远县', '228', '0', '0', 'Ningyuan Xian', 'NYN');
INSERT INTO `yw_region` VALUES ('2277', '431127', '蓝山县', '228', '0', '0', 'Lanshan Xian', 'LNS');
INSERT INTO `yw_region` VALUES ('2278', '431128', '新田县', '228', '0', '0', 'Xintian Xian', 'XTN');
INSERT INTO `yw_region` VALUES ('2279', '431129', '江华瑶族自治县', '228', '0', '0', 'Jianghua Yaozu Zizhixian', 'JHX');
INSERT INTO `yw_region` VALUES ('2280', '431201', '市辖区', '229', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2281', '431202', '鹤城区', '229', '0', '0', 'Hecheng Qu', 'HCG');
INSERT INTO `yw_region` VALUES ('2282', '431221', '中方县', '229', '0', '0', 'Zhongfang Xian', 'ZFX');
INSERT INTO `yw_region` VALUES ('2283', '431222', '沅陵县', '229', '0', '0', 'Yuanling Xian', 'YNL');
INSERT INTO `yw_region` VALUES ('2284', '431223', '辰溪县', '229', '0', '0', 'Chenxi Xian', 'CXX');
INSERT INTO `yw_region` VALUES ('2285', '431224', '溆浦县', '229', '0', '0', 'Xupu Xian', 'XUP');
INSERT INTO `yw_region` VALUES ('2286', '431225', '会同县', '229', '0', '0', 'Huitong Xian', 'HTG');
INSERT INTO `yw_region` VALUES ('2287', '431226', '麻阳苗族自治县', '229', '0', '0', 'Mayang Miaozu Zizhixian', 'MYX');
INSERT INTO `yw_region` VALUES ('2288', '431227', '新晃侗族自治县', '229', '0', '0', 'Xinhuang Dongzu Zizhixian', 'XHD');
INSERT INTO `yw_region` VALUES ('2289', '431228', '芷江侗族自治县', '229', '0', '0', 'Zhijiang Dongzu Zizhixian', 'ZJX');
INSERT INTO `yw_region` VALUES ('2290', '431229', '靖州苗族侗族自治县', '229', '0', '0', 'Jingzhou Miaozu Dongzu Zizhixian', 'JZO');
INSERT INTO `yw_region` VALUES ('2291', '431230', '通道侗族自治县', '229', '0', '0', 'Tongdao Dongzu Zizhixian', 'TDD');
INSERT INTO `yw_region` VALUES ('2292', '431281', '洪江市', '229', '0', '0', 'Hongjiang Shi', 'HGJ');
INSERT INTO `yw_region` VALUES ('2293', '431301', '市辖区', '230', '0', '0', '1', '2');
INSERT INTO `yw_region` VALUES ('2294', '431302', '娄星区', '230', '0', '0', 'Louxing Qu', '2');
INSERT INTO `yw_region` VALUES ('2295', '431321', '双峰县', '230', '0', '0', 'Shuangfeng Xian', '2');
INSERT INTO `yw_region` VALUES ('2296', '431322', '新化县', '230', '0', '0', 'Xinhua Xian', '2');
INSERT INTO `yw_region` VALUES ('2297', '431381', '冷水江市', '230', '0', '0', 'Lengshuijiang Shi', '2');
INSERT INTO `yw_region` VALUES ('2298', '431382', '涟源市', '230', '0', '0', 'Lianyuan Shi', '2');
INSERT INTO `yw_region` VALUES ('2299', '433101', '吉首市', '231', '0', '0', 'Jishou Shi', 'JSO');
INSERT INTO `yw_region` VALUES ('2300', '433122', '泸溪县', '231', '0', '0', 'Luxi Xian', 'LXW');
INSERT INTO `yw_region` VALUES ('2301', '433123', '凤凰县', '231', '0', '0', 'Fenghuang Xian', 'FHX');
INSERT INTO `yw_region` VALUES ('2302', '433124', '花垣县', '231', '0', '0', 'Huayuan Xian', 'HYH');
INSERT INTO `yw_region` VALUES ('2303', '433125', '保靖县', '231', '0', '0', 'Baojing Xian', 'BJG');
INSERT INTO `yw_region` VALUES ('2304', '433126', '古丈县', '231', '0', '0', 'Guzhang Xian', 'GZG');
INSERT INTO `yw_region` VALUES ('2305', '433127', '永顺县', '231', '0', '0', 'Yongshun Xian', 'YSF');
INSERT INTO `yw_region` VALUES ('2306', '433130', '龙山县', '231', '0', '0', 'Longshan Xian', 'LSR');
INSERT INTO `yw_region` VALUES ('2307', '440101', '市辖区', '232', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2308', '440115', '南沙区', '232', '0', '0', 'Nansha Qu', '2');
INSERT INTO `yw_region` VALUES ('2309', '440103', '荔湾区', '232', '0', '0', 'Liwan Qu', 'LWQ');
INSERT INTO `yw_region` VALUES ('2310', '440104', '越秀区', '232', '0', '0', 'Yuexiu Qu', 'YXU');
INSERT INTO `yw_region` VALUES ('2311', '440105', '海珠区', '232', '0', '0', 'Haizhu Qu', 'HZU');
INSERT INTO `yw_region` VALUES ('2312', '440106', '天河区', '232', '0', '0', 'Tianhe Qu', 'THQ');
INSERT INTO `yw_region` VALUES ('2313', '440116', '萝岗区', '232', '0', '0', 'Luogang Qu', '2');
INSERT INTO `yw_region` VALUES ('2314', '440111', '白云区', '232', '0', '0', 'Baiyun Qu', 'BYN');
INSERT INTO `yw_region` VALUES ('2315', '440112', '黄埔区', '232', '0', '0', 'Huangpu Qu', 'HPU');
INSERT INTO `yw_region` VALUES ('2316', '440113', '番禺区', '232', '0', '0', 'Panyu Qu', 'PNY');
INSERT INTO `yw_region` VALUES ('2317', '440114', '花都区', '232', '0', '0', 'Huadu Qu', 'HDU');
INSERT INTO `yw_region` VALUES ('2318', '440183', '增城市', '232', '0', '0', 'Zengcheng Shi', 'ZEC');
INSERT INTO `yw_region` VALUES ('2319', '440184', '从化市', '232', '0', '0', 'Conghua Shi', 'CNH');
INSERT INTO `yw_region` VALUES ('2320', '440201', '市辖区', '233', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2321', '440203', '武江区', '233', '0', '0', 'Wujiang Qu', 'WJQ');
INSERT INTO `yw_region` VALUES ('2322', '440204', '浈江区', '233', '0', '0', 'Zhenjiang Qu', 'ZJQ');
INSERT INTO `yw_region` VALUES ('2323', '440205', '曲江区', '233', '0', '0', 'Qujiang Qu', '2');
INSERT INTO `yw_region` VALUES ('2324', '440222', '始兴县', '233', '0', '0', 'Shixing Xian', 'SXX');
INSERT INTO `yw_region` VALUES ('2325', '440224', '仁化县', '233', '0', '0', 'Renhua Xian', 'RHA');
INSERT INTO `yw_region` VALUES ('2326', '440229', '翁源县', '233', '0', '0', 'Wengyuan Xian', 'WYN');
INSERT INTO `yw_region` VALUES ('2327', '440232', '乳源瑶族自治县', '233', '0', '0', 'Ruyuan Yaozu Zizhixian', 'RYN');
INSERT INTO `yw_region` VALUES ('2328', '440233', '新丰县', '233', '0', '0', 'Xinfeng Xian', 'XFY');
INSERT INTO `yw_region` VALUES ('2329', '440281', '乐昌市', '233', '0', '0', 'Lechang Shi', 'LEC');
INSERT INTO `yw_region` VALUES ('2330', '440282', '南雄市', '233', '0', '0', 'Nanxiong Shi', 'NXS');
INSERT INTO `yw_region` VALUES ('2331', '440301', '市辖区', '234', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2332', '440303', '罗湖区', '234', '0', '0', 'Luohu Qu', 'LHQ');
INSERT INTO `yw_region` VALUES ('2333', '440304', '福田区', '234', '0', '0', 'Futian Qu', 'FTN');
INSERT INTO `yw_region` VALUES ('2334', '440305', '南山区', '234', '0', '0', 'Nanshan Qu', 'NSN');
INSERT INTO `yw_region` VALUES ('2335', '440306', '宝安区', '234', '0', '0', 'Bao,an Qu', 'BAQ');
INSERT INTO `yw_region` VALUES ('2336', '440307', '龙岗区', '234', '0', '0', 'Longgang Qu', 'LGG');
INSERT INTO `yw_region` VALUES ('2337', '440308', '盐田区', '234', '0', '0', 'Yan Tian Qu', 'YTQ');
INSERT INTO `yw_region` VALUES ('2338', '440401', '市辖区', '235', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2339', '440402', '香洲区', '235', '0', '0', 'Xiangzhou Qu', 'XZQ');
INSERT INTO `yw_region` VALUES ('2340', '440403', '斗门区', '235', '0', '0', 'Doumen Qu', 'DOU');
INSERT INTO `yw_region` VALUES ('2341', '440404', '金湾区', '235', '0', '0', 'Jinwan Qu', 'JW Q');
INSERT INTO `yw_region` VALUES ('2342', '440501', '市辖区', '236', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2343', '440507', '龙湖区', '236', '0', '0', 'Longhu Qu', 'LHH');
INSERT INTO `yw_region` VALUES ('2344', '440511', '金平区', '236', '0', '0', 'Jinping Qu', 'JPQ');
INSERT INTO `yw_region` VALUES ('2345', '440512', '濠江区', '236', '0', '0', 'Haojiang Qu', 'HJ Q');
INSERT INTO `yw_region` VALUES ('2346', '440513', '潮阳区', '236', '0', '0', 'Chaoyang  Qu', 'CHY');
INSERT INTO `yw_region` VALUES ('2347', '440514', '潮南区', '236', '0', '0', 'Chaonan Qu', 'CN Q');
INSERT INTO `yw_region` VALUES ('2348', '440515', '澄海区', '236', '0', '0', 'Chenghai QU', 'CHS');
INSERT INTO `yw_region` VALUES ('2349', '440523', '南澳县', '236', '0', '0', 'Nan,ao Xian', 'NAN');
INSERT INTO `yw_region` VALUES ('2350', '440601', '市辖区', '237', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2351', '440604', '禅城区', '237', '0', '0', 'Chancheng Qu', 'CC Q');
INSERT INTO `yw_region` VALUES ('2352', '440605', '南海区', '237', '0', '0', 'Nanhai Shi', 'NAH');
INSERT INTO `yw_region` VALUES ('2353', '440606', '顺德区', '237', '0', '0', 'Shunde Shi', 'SUD');
INSERT INTO `yw_region` VALUES ('2354', '440607', '三水区', '237', '0', '0', 'Sanshui Shi', 'SJQ');
INSERT INTO `yw_region` VALUES ('2355', '440608', '高明区', '237', '0', '0', 'Gaoming Shi', 'GOM');
INSERT INTO `yw_region` VALUES ('2356', '440701', '市辖区', '238', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2357', '440703', '蓬江区', '238', '0', '0', 'Pengjiang Qu', 'PJJ');
INSERT INTO `yw_region` VALUES ('2358', '440704', '江海区', '238', '0', '0', 'Jianghai Qu', 'JHI');
INSERT INTO `yw_region` VALUES ('2359', '440705', '新会区', '238', '0', '0', 'Xinhui Shi', 'XIN');
INSERT INTO `yw_region` VALUES ('2360', '440781', '台山市', '238', '0', '0', 'Taishan Shi', 'TSS');
INSERT INTO `yw_region` VALUES ('2361', '440783', '开平市', '238', '0', '0', 'Kaiping Shi', 'KPS');
INSERT INTO `yw_region` VALUES ('2362', '440784', '鹤山市', '238', '0', '0', 'Heshan Shi', 'HES');
INSERT INTO `yw_region` VALUES ('2363', '440785', '恩平市', '238', '0', '0', 'Enping Shi', 'ENP');
INSERT INTO `yw_region` VALUES ('2364', '440801', '市辖区', '239', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2365', '440802', '赤坎区', '239', '0', '0', 'Chikan Qu', 'CKQ');
INSERT INTO `yw_region` VALUES ('2366', '440803', '霞山区', '239', '0', '0', 'Xiashan Qu', 'XAS');
INSERT INTO `yw_region` VALUES ('2367', '440804', '坡头区', '239', '0', '0', 'Potou Qu', 'PTU');
INSERT INTO `yw_region` VALUES ('2368', '440811', '麻章区', '239', '0', '0', 'Mazhang Qu', 'MZQ');
INSERT INTO `yw_region` VALUES ('2369', '440823', '遂溪县', '239', '0', '0', 'Suixi Xian', 'SXI');
INSERT INTO `yw_region` VALUES ('2370', '440825', '徐闻县', '239', '0', '0', 'Xuwen Xian', 'XWN');
INSERT INTO `yw_region` VALUES ('2371', '440881', '廉江市', '239', '0', '0', 'Lianjiang Shi', 'LJS');
INSERT INTO `yw_region` VALUES ('2372', '440882', '雷州市', '239', '0', '0', 'Leizhou Shi', 'LEZ');
INSERT INTO `yw_region` VALUES ('2373', '440883', '吴川市', '239', '0', '0', 'Wuchuan Shi', 'WCS');
INSERT INTO `yw_region` VALUES ('2374', '440901', '市辖区', '240', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2375', '440902', '茂南区', '240', '0', '0', 'Maonan Qu', 'MNQ');
INSERT INTO `yw_region` VALUES ('2376', '440903', '茂港区', '240', '0', '0', 'Maogang Qu', 'MGQ');
INSERT INTO `yw_region` VALUES ('2377', '440923', '电白县', '240', '0', '0', 'Dianbai Xian', 'DBI');
INSERT INTO `yw_region` VALUES ('2378', '440981', '高州市', '240', '0', '0', 'Gaozhou Shi', 'GZO');
INSERT INTO `yw_region` VALUES ('2379', '440982', '化州市', '240', '0', '0', 'Huazhou Shi', 'HZY');
INSERT INTO `yw_region` VALUES ('2380', '440983', '信宜市', '240', '0', '0', 'Xinyi Shi', 'XYY');
INSERT INTO `yw_region` VALUES ('2381', '441201', '市辖区', '241', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2382', '441202', '端州区', '241', '0', '0', 'Duanzhou Qu', 'DZQ');
INSERT INTO `yw_region` VALUES ('2383', '441203', '鼎湖区', '241', '0', '0', 'Dinghu Qu', 'DGH');
INSERT INTO `yw_region` VALUES ('2384', '441223', '广宁县', '241', '0', '0', 'Guangning Xian', 'GNG');
INSERT INTO `yw_region` VALUES ('2385', '441224', '怀集县', '241', '0', '0', 'Huaiji Xian', 'HJX');
INSERT INTO `yw_region` VALUES ('2386', '441225', '封开县', '241', '0', '0', 'Fengkai Xian', 'FKX');
INSERT INTO `yw_region` VALUES ('2387', '441226', '德庆县', '241', '0', '0', 'Deqing Xian', 'DQY');
INSERT INTO `yw_region` VALUES ('2388', '441283', '高要市', '241', '0', '0', 'Gaoyao Xian', 'GYY');
INSERT INTO `yw_region` VALUES ('2389', '441284', '四会市', '241', '0', '0', 'Sihui Shi', 'SHI');
INSERT INTO `yw_region` VALUES ('2390', '441301', '市辖区', '242', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2391', '441302', '惠城区', '242', '0', '0', 'Huicheng Qu', 'HCQ');
INSERT INTO `yw_region` VALUES ('2392', '441303', '惠阳区', '242', '0', '0', 'Huiyang Shi', 'HUY');
INSERT INTO `yw_region` VALUES ('2393', '441322', '博罗县', '242', '0', '0', 'Boluo Xian', 'BOL');
INSERT INTO `yw_region` VALUES ('2394', '441323', '惠东县', '242', '0', '0', 'Huidong Xian', 'HID');
INSERT INTO `yw_region` VALUES ('2395', '441324', '龙门县', '242', '0', '0', 'Longmen Xian', 'LMN');
INSERT INTO `yw_region` VALUES ('2396', '441401', '市辖区', '243', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2397', '441402', '梅江区', '243', '0', '0', 'Meijiang Qu', 'MJQ');
INSERT INTO `yw_region` VALUES ('2398', '441421', '梅县', '243', '0', '0', 'Mei Xian', 'MEX');
INSERT INTO `yw_region` VALUES ('2399', '441422', '大埔县', '243', '0', '0', 'Dabu Xian', 'DBX');
INSERT INTO `yw_region` VALUES ('2400', '441423', '丰顺县', '243', '0', '0', 'Fengshun Xian', 'FES');
INSERT INTO `yw_region` VALUES ('2401', '441424', '五华县', '243', '0', '0', 'Wuhua Xian', 'WHY');
INSERT INTO `yw_region` VALUES ('2402', '441426', '平远县', '243', '0', '0', 'Pingyuan Xian', 'PYY');
INSERT INTO `yw_region` VALUES ('2403', '441427', '蕉岭县', '243', '0', '0', 'Jiaoling Xian', 'JOL');
INSERT INTO `yw_region` VALUES ('2404', '441481', '兴宁市', '243', '0', '0', 'Xingning Shi', 'XNG');
INSERT INTO `yw_region` VALUES ('2405', '441501', '市辖区', '244', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2406', '441502', '城区', '244', '0', '0', 'Chengqu', 'CQS');
INSERT INTO `yw_region` VALUES ('2407', '441521', '海丰县', '244', '0', '0', 'Haifeng Xian', 'HIF');
INSERT INTO `yw_region` VALUES ('2408', '441523', '陆河县', '244', '0', '0', 'Luhe Xian', 'LHY');
INSERT INTO `yw_region` VALUES ('2409', '441581', '陆丰市', '244', '0', '0', 'Lufeng Shi', 'LUF');
INSERT INTO `yw_region` VALUES ('2410', '441601', '市辖区', '245', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2411', '441602', '源城区', '245', '0', '0', 'Yuancheng Qu', 'YCQ');
INSERT INTO `yw_region` VALUES ('2412', '441621', '紫金县', '245', '0', '0', 'Zijin Xian', 'ZJY');
INSERT INTO `yw_region` VALUES ('2413', '441622', '龙川县', '245', '0', '0', 'Longchuan Xian', 'LCY');
INSERT INTO `yw_region` VALUES ('2414', '441623', '连平县', '245', '0', '0', 'Lianping Xian', 'LNP');
INSERT INTO `yw_region` VALUES ('2415', '441624', '和平县', '245', '0', '0', 'Heping Xian', 'HPY');
INSERT INTO `yw_region` VALUES ('2416', '441625', '东源县', '245', '0', '0', 'Dongyuan Xian', 'DYN');
INSERT INTO `yw_region` VALUES ('2417', '441701', '市辖区', '246', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2418', '441702', '江城区', '246', '0', '0', 'Jiangcheng Qu', 'JCQ');
INSERT INTO `yw_region` VALUES ('2419', '441721', '阳西县', '246', '0', '0', 'Yangxi Xian', 'YXY');
INSERT INTO `yw_region` VALUES ('2420', '441723', '阳东县', '246', '0', '0', 'Yangdong Xian', 'YGD');
INSERT INTO `yw_region` VALUES ('2421', '441781', '阳春市', '246', '0', '0', 'Yangchun Shi', 'YCU');
INSERT INTO `yw_region` VALUES ('2422', '441801', '市辖区', '247', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2423', '441802', '清城区', '247', '0', '0', 'Qingcheng Qu', 'QCQ');
INSERT INTO `yw_region` VALUES ('2424', '441821', '佛冈县', '247', '0', '0', 'Fogang Xian', 'FGY');
INSERT INTO `yw_region` VALUES ('2425', '441823', '阳山县', '247', '0', '0', 'Yangshan Xian', 'YSN');
INSERT INTO `yw_region` VALUES ('2426', '441825', '连山壮族瑶族自治县', '247', '0', '0', 'Lianshan Zhuangzu Yaozu Zizhixian', 'LSZ');
INSERT INTO `yw_region` VALUES ('2427', '441826', '连南瑶族自治县', '247', '0', '0', 'Liannanyaozuzizhi Qu', '2');
INSERT INTO `yw_region` VALUES ('2428', '441827', '清新县', '247', '0', '0', 'Qingxin Xian', 'QGX');
INSERT INTO `yw_region` VALUES ('2429', '441881', '英德市', '247', '0', '0', 'Yingde Shi', 'YDS');
INSERT INTO `yw_region` VALUES ('2430', '441882', '连州市', '247', '0', '0', 'Lianzhou Shi', 'LZO');
INSERT INTO `yw_region` VALUES ('2431', '445101', '市辖区', '250', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2432', '445102', '湘桥区', '250', '0', '0', 'Xiangqiao Qu', 'XQO');
INSERT INTO `yw_region` VALUES ('2433', '445121', '潮安县', '250', '0', '0', 'Chao,an Xian', 'CAY');
INSERT INTO `yw_region` VALUES ('2434', '445122', '饶平县', '250', '0', '0', 'Raoping Xian', 'RPG');
INSERT INTO `yw_region` VALUES ('2435', '445201', '市辖区', '251', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2436', '445202', '榕城区', '251', '0', '0', 'Rongcheng Qu', 'RCH');
INSERT INTO `yw_region` VALUES ('2437', '445221', '揭东县', '251', '0', '0', 'Jiedong Xian', 'JDX');
INSERT INTO `yw_region` VALUES ('2438', '445222', '揭西县', '251', '0', '0', 'Jiexi Xian', 'JEX');
INSERT INTO `yw_region` VALUES ('2439', '445224', '惠来县', '251', '0', '0', 'Huilai Xian', 'HLY');
INSERT INTO `yw_region` VALUES ('2440', '445281', '普宁市', '251', '0', '0', 'Puning Shi', 'PNG');
INSERT INTO `yw_region` VALUES ('2441', '445301', '市辖区', '252', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2442', '445302', '云城区', '252', '0', '0', 'Yuncheng Qu', 'YYF');
INSERT INTO `yw_region` VALUES ('2443', '445321', '新兴县', '252', '0', '0', 'Xinxing Xian', 'XNX');
INSERT INTO `yw_region` VALUES ('2444', '445322', '郁南县', '252', '0', '0', 'Yunan Xian', 'YNK');
INSERT INTO `yw_region` VALUES ('2445', '445323', '云安县', '252', '0', '0', 'Yun,an Xian', 'YUA');
INSERT INTO `yw_region` VALUES ('2446', '445381', '罗定市', '252', '0', '0', 'Luoding Shi', 'LUO');
INSERT INTO `yw_region` VALUES ('2447', '450101', '市辖区', '253', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2448', '450102', '兴宁区', '253', '0', '0', 'Xingning Qu', 'XNE');
INSERT INTO `yw_region` VALUES ('2449', '450103', '青秀区', '253', '0', '0', 'Qingxiu Qu', '2');
INSERT INTO `yw_region` VALUES ('2450', '450105', '江南区', '253', '0', '0', 'Jiangnan Qu', 'JNA');
INSERT INTO `yw_region` VALUES ('2451', '450107', '西乡塘区', '253', '0', '0', 'Xixiangtang Qu', '2');
INSERT INTO `yw_region` VALUES ('2452', '450108', '良庆区', '253', '0', '0', 'Liangqing Qu', '2');
INSERT INTO `yw_region` VALUES ('2453', '450109', '邕宁区', '253', '0', '0', 'Yongning Qu', '2');
INSERT INTO `yw_region` VALUES ('2454', '450122', '武鸣县', '253', '0', '0', 'Wuming Xian', 'WMG');
INSERT INTO `yw_region` VALUES ('2455', '450123', '隆安县', '253', '0', '0', 'Long,an Xian', '2');
INSERT INTO `yw_region` VALUES ('2456', '450124', '马山县', '253', '0', '0', 'Mashan Xian', '2');
INSERT INTO `yw_region` VALUES ('2457', '450125', '上林县', '253', '0', '0', 'Shanglin Xian', '2');
INSERT INTO `yw_region` VALUES ('2458', '450126', '宾阳县', '253', '0', '0', 'Binyang Xian', '2');
INSERT INTO `yw_region` VALUES ('2459', '450127', '横县', '253', '0', '0', 'Heng Xian', '2');
INSERT INTO `yw_region` VALUES ('2460', '450201', '市辖区', '254', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2461', '450202', '城中区', '254', '0', '0', 'Chengzhong Qu', 'CZG');
INSERT INTO `yw_region` VALUES ('2462', '450203', '鱼峰区', '254', '0', '0', 'Yufeng Qu', 'YFQ');
INSERT INTO `yw_region` VALUES ('2463', '450204', '柳南区', '254', '0', '0', 'Liunan Qu', 'LNU');
INSERT INTO `yw_region` VALUES ('2464', '450205', '柳北区', '254', '0', '0', 'Liubei Qu', 'LBE');
INSERT INTO `yw_region` VALUES ('2465', '450221', '柳江县', '254', '0', '0', 'Liujiang Xian', 'LUJ');
INSERT INTO `yw_region` VALUES ('2466', '450222', '柳城县', '254', '0', '0', 'Liucheng Xian', 'LCB');
INSERT INTO `yw_region` VALUES ('2467', '450223', '鹿寨县', '254', '0', '0', 'Luzhai Xian', '2');
INSERT INTO `yw_region` VALUES ('2468', '450224', '融安县', '254', '0', '0', 'Rong,an Xian', '2');
INSERT INTO `yw_region` VALUES ('2469', '450225', '融水苗族自治县', '254', '0', '0', 'Rongshui Miaozu Zizhixian', '2');
INSERT INTO `yw_region` VALUES ('2470', '450226', '三江侗族自治县', '254', '0', '0', 'Sanjiang Dongzu Zizhixian', '2');
INSERT INTO `yw_region` VALUES ('2471', '450301', '市辖区', '255', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2472', '450302', '秀峰区', '255', '0', '0', 'Xiufeng Qu', 'XUF');
INSERT INTO `yw_region` VALUES ('2473', '450303', '叠彩区', '255', '0', '0', 'Diecai Qu', 'DCA');
INSERT INTO `yw_region` VALUES ('2474', '450304', '象山区', '255', '0', '0', 'Xiangshan Qu', 'XSK');
INSERT INTO `yw_region` VALUES ('2475', '450305', '七星区', '255', '0', '0', 'Qixing Qu', 'QXG');
INSERT INTO `yw_region` VALUES ('2476', '450311', '雁山区', '255', '0', '0', 'Yanshan Qu', 'YSA');
INSERT INTO `yw_region` VALUES ('2477', '450321', '阳朔县', '255', '0', '0', 'Yangshuo Xian', 'YSO');
INSERT INTO `yw_region` VALUES ('2478', '450322', '临桂县', '255', '0', '0', 'Lingui Xian', 'LGI');
INSERT INTO `yw_region` VALUES ('2479', '450323', '灵川县', '255', '0', '0', 'Lingchuan Xian', 'LCU');
INSERT INTO `yw_region` VALUES ('2480', '450324', '全州县', '255', '0', '0', 'Quanzhou Xian', 'QZO');
INSERT INTO `yw_region` VALUES ('2481', '450325', '兴安县', '255', '0', '0', 'Xing,an Xian', 'XAG');
INSERT INTO `yw_region` VALUES ('2482', '450326', '永福县', '255', '0', '0', 'Yongfu Xian', 'YFU');
INSERT INTO `yw_region` VALUES ('2483', '450327', '灌阳县', '255', '0', '0', 'Guanyang Xian', 'GNY');
INSERT INTO `yw_region` VALUES ('2484', '450328', '龙胜各族自治县', '255', '0', '0', 'Longsheng Gezu Zizhixian', 'LSG');
INSERT INTO `yw_region` VALUES ('2485', '450329', '资源县', '255', '0', '0', 'Ziyuan Xian', 'ZYU');
INSERT INTO `yw_region` VALUES ('2486', '450330', '平乐县', '255', '0', '0', 'Pingle Xian', 'PLE');
INSERT INTO `yw_region` VALUES ('2487', '450331', '荔蒲县', '255', '0', '0', 'Lipu Xian', '2');
INSERT INTO `yw_region` VALUES ('2488', '450332', '恭城瑶族自治县', '255', '0', '0', 'Gongcheng Yaozu Zizhixian', 'GGC');
INSERT INTO `yw_region` VALUES ('2489', '450401', '市辖区', '256', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2490', '450403', '万秀区', '256', '0', '0', 'Wanxiu Qu', 'WXQ');
INSERT INTO `yw_region` VALUES ('2491', '450404', '蝶山区', '256', '0', '0', 'Dieshan Qu', 'DES');
INSERT INTO `yw_region` VALUES ('2492', '450405', '长洲区', '256', '0', '0', 'Changzhou Qu', '2');
INSERT INTO `yw_region` VALUES ('2493', '450421', '苍梧县', '256', '0', '0', 'Cangwu Xian', 'CAW');
INSERT INTO `yw_region` VALUES ('2494', '450422', '藤县', '256', '0', '0', 'Teng Xian', '2');
INSERT INTO `yw_region` VALUES ('2495', '450423', '蒙山县', '256', '0', '0', 'Mengshan Xian', 'MSA');
INSERT INTO `yw_region` VALUES ('2496', '450481', '岑溪市', '256', '0', '0', 'Cenxi Shi', 'CEX');
INSERT INTO `yw_region` VALUES ('2497', '450501', '市辖区', '257', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2498', '450502', '海城区', '257', '0', '0', 'Haicheng Qu', 'HCB');
INSERT INTO `yw_region` VALUES ('2499', '450503', '银海区', '257', '0', '0', 'Yinhai Qu', 'YHB');
INSERT INTO `yw_region` VALUES ('2500', '450512', '铁山港区', '257', '0', '0', 'Tieshangangqu ', 'TSG');
INSERT INTO `yw_region` VALUES ('2501', '450521', '合浦县', '257', '0', '0', 'Hepu Xian', 'HPX');
INSERT INTO `yw_region` VALUES ('2502', '450601', '市辖区', '258', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2503', '450602', '港口区', '258', '0', '0', 'Gangkou Qu', 'GKQ');
INSERT INTO `yw_region` VALUES ('2504', '450603', '防城区', '258', '0', '0', 'Fangcheng Qu', 'FCQ');
INSERT INTO `yw_region` VALUES ('2505', '450621', '上思县', '258', '0', '0', 'Shangsi Xian', 'SGS');
INSERT INTO `yw_region` VALUES ('2506', '450681', '东兴市', '258', '0', '0', 'Dongxing Shi', 'DOX');
INSERT INTO `yw_region` VALUES ('2507', '450701', '市辖区', '259', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2508', '450702', '钦南区', '259', '0', '0', 'Qinnan Qu', 'QNQ');
INSERT INTO `yw_region` VALUES ('2509', '450703', '钦北区', '259', '0', '0', 'Qinbei Qu', 'QBQ');
INSERT INTO `yw_region` VALUES ('2510', '450721', '灵山县', '259', '0', '0', 'Lingshan Xian', 'LSB');
INSERT INTO `yw_region` VALUES ('2511', '450722', '浦北县', '259', '0', '0', 'Pubei Xian', 'PBE');
INSERT INTO `yw_region` VALUES ('2512', '450801', '市辖区', '260', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2513', '450802', '港北区', '260', '0', '0', 'Gangbei Qu', 'GBE');
INSERT INTO `yw_region` VALUES ('2514', '450803', '港南区', '260', '0', '0', 'Gangnan Qu', 'GNQ');
INSERT INTO `yw_region` VALUES ('2515', '450804', '覃塘区', '260', '0', '0', 'Tantang Qu', '2');
INSERT INTO `yw_region` VALUES ('2516', '450821', '平南县', '260', '0', '0', 'Pingnan Xian', 'PNN');
INSERT INTO `yw_region` VALUES ('2517', '450881', '桂平市', '260', '0', '0', 'Guiping Shi', 'GPS');
INSERT INTO `yw_region` VALUES ('2518', '450901', '市辖区', '261', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2519', '450902', '玉州区', '261', '0', '0', 'Yuzhou Qu', 'YZO');
INSERT INTO `yw_region` VALUES ('2520', '450921', '容县', '261', '0', '0', 'Rong Xian', 'ROG');
INSERT INTO `yw_region` VALUES ('2521', '450922', '陆川县', '261', '0', '0', 'Luchuan Xian', 'LCJ');
INSERT INTO `yw_region` VALUES ('2522', '450923', '博白县', '261', '0', '0', 'Bobai Xian', 'BBA');
INSERT INTO `yw_region` VALUES ('2523', '450924', '兴业县', '261', '0', '0', 'Xingye Xian', 'XGY');
INSERT INTO `yw_region` VALUES ('2524', '450981', '北流市', '261', '0', '0', 'Beiliu Shi', 'BLS');
INSERT INTO `yw_region` VALUES ('2525', '451001', '市辖区', '262', '0', '0', '1', '2');
INSERT INTO `yw_region` VALUES ('2526', '451002', '右江区', '262', '0', '0', 'Youjiang Qu', '2');
INSERT INTO `yw_region` VALUES ('2527', '451021', '田阳县', '262', '0', '0', 'Tianyang Xian', '2');
INSERT INTO `yw_region` VALUES ('2528', '451022', '田东县', '262', '0', '0', 'Tiandong Xian', '2');
INSERT INTO `yw_region` VALUES ('2529', '451023', '平果县', '262', '0', '0', 'Pingguo Xian', '2');
INSERT INTO `yw_region` VALUES ('2530', '451024', '德保县', '262', '0', '0', 'Debao Xian', '2');
INSERT INTO `yw_region` VALUES ('2531', '451025', '靖西县', '262', '0', '0', 'Jingxi Xian', '2');
INSERT INTO `yw_region` VALUES ('2532', '451026', '那坡县', '262', '0', '0', 'Napo Xian', '2');
INSERT INTO `yw_region` VALUES ('2533', '451027', '凌云县', '262', '0', '0', 'Lingyun Xian', '2');
INSERT INTO `yw_region` VALUES ('2534', '451028', '乐业县', '262', '0', '0', 'Leye Xian', '2');
INSERT INTO `yw_region` VALUES ('2535', '451029', '田林县', '262', '0', '0', 'Tianlin Xian', '2');
INSERT INTO `yw_region` VALUES ('2536', '451030', '西林县', '262', '0', '0', 'Xilin Xian', '2');
INSERT INTO `yw_region` VALUES ('2537', '451031', '隆林各族自治县', '262', '0', '0', 'Longlin Gezu Zizhixian', '2');
INSERT INTO `yw_region` VALUES ('2538', '451101', '市辖区', '263', '0', '0', '1', '2');
INSERT INTO `yw_region` VALUES ('2539', '451102', '八步区', '263', '0', '0', 'Babu Qu', '2');
INSERT INTO `yw_region` VALUES ('2540', '451121', '昭平县', '263', '0', '0', 'Zhaoping Xian', '2');
INSERT INTO `yw_region` VALUES ('2541', '451122', '钟山县', '263', '0', '0', 'Zhongshan Xian', '2');
INSERT INTO `yw_region` VALUES ('2542', '451123', '富川瑶族自治县', '263', '0', '0', 'Fuchuan Yaozu Zizhixian', '2');
INSERT INTO `yw_region` VALUES ('2543', '451201', '市辖区', '264', '0', '0', '1', '2');
INSERT INTO `yw_region` VALUES ('2544', '451202', '金城江区', '264', '0', '0', 'Jinchengjiang Qu', '2');
INSERT INTO `yw_region` VALUES ('2545', '451221', '南丹县', '264', '0', '0', 'Nandan Xian', '2');
INSERT INTO `yw_region` VALUES ('2546', '451222', '天峨县', '264', '0', '0', 'Tian,e Xian', '2');
INSERT INTO `yw_region` VALUES ('2547', '451223', '凤山县', '264', '0', '0', 'Fengshan Xian', '2');
INSERT INTO `yw_region` VALUES ('2548', '451224', '东兰县', '264', '0', '0', 'Donglan Xian', '2');
INSERT INTO `yw_region` VALUES ('2549', '451225', '罗城仫佬族自治县', '264', '0', '0', 'Luocheng Mulaozu Zizhixian', '2');
INSERT INTO `yw_region` VALUES ('2550', '451226', '环江毛南族自治县', '264', '0', '0', 'Huanjiang Maonanzu Zizhixian', '2');
INSERT INTO `yw_region` VALUES ('2551', '451227', '巴马瑶族自治县', '264', '0', '0', 'Bama Yaozu Zizhixian', '2');
INSERT INTO `yw_region` VALUES ('2552', '451228', '都安瑶族自治县', '264', '0', '0', 'Du,an Yaozu Zizhixian', '2');
INSERT INTO `yw_region` VALUES ('2553', '451229', '大化瑶族自治县', '264', '0', '0', 'Dahua Yaozu Zizhixian', '2');
INSERT INTO `yw_region` VALUES ('2554', '451281', '宜州市', '264', '0', '0', 'Yizhou Shi', '2');
INSERT INTO `yw_region` VALUES ('2555', '451301', '市辖区', '265', '0', '0', '1', '2');
INSERT INTO `yw_region` VALUES ('2556', '451302', '兴宾区', '265', '0', '0', 'Xingbin Qu', '2');
INSERT INTO `yw_region` VALUES ('2557', '451321', '忻城县', '265', '0', '0', 'Xincheng Xian', '2');
INSERT INTO `yw_region` VALUES ('2558', '451322', '象州县', '265', '0', '0', 'Xiangzhou Xian', '2');
INSERT INTO `yw_region` VALUES ('2559', '451323', '武宣县', '265', '0', '0', 'Wuxuan Xian', '2');
INSERT INTO `yw_region` VALUES ('2560', '451324', '金秀瑶族自治县', '265', '0', '0', 'Jinxiu Yaozu Zizhixian', '2');
INSERT INTO `yw_region` VALUES ('2561', '451381', '合山市', '265', '0', '0', 'Heshan Shi', '2');
INSERT INTO `yw_region` VALUES ('2562', '451401', '市辖区', '266', '0', '0', '1', '2');
INSERT INTO `yw_region` VALUES ('2563', '451402', '江洲区', '266', '0', '0', 'Jiangzhou Qu', '2');
INSERT INTO `yw_region` VALUES ('2564', '451421', '扶绥县', '266', '0', '0', 'Fusui Xian', '2');
INSERT INTO `yw_region` VALUES ('2565', '451422', '宁明县', '266', '0', '0', 'Ningming Xian', '2');
INSERT INTO `yw_region` VALUES ('2566', '451423', '龙州县', '266', '0', '0', 'Longzhou Xian', '2');
INSERT INTO `yw_region` VALUES ('2567', '451424', '大新县', '266', '0', '0', 'Daxin Xian', '2');
INSERT INTO `yw_region` VALUES ('2568', '451425', '天等县', '266', '0', '0', 'Tiandeng Xian', '2');
INSERT INTO `yw_region` VALUES ('2569', '451481', '凭祥市', '266', '0', '0', 'Pingxiang Shi', '2');
INSERT INTO `yw_region` VALUES ('2570', '460101', '市辖区', '267', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2571', '460105', '秀英区', '267', '0', '0', 'Xiuying Qu', 'XYH');
INSERT INTO `yw_region` VALUES ('2572', '460106', '龙华区', '267', '0', '0', 'LongHua Qu', 'LH');
INSERT INTO `yw_region` VALUES ('2573', '460107', '琼山区', '267', '0', '0', 'QiongShan Qu', 'QS');
INSERT INTO `yw_region` VALUES ('2574', '460108', '美兰区', '267', '0', '0', 'MeiLan Qu', 'ML');
INSERT INTO `yw_region` VALUES ('2575', '460201', '市辖区', '268', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2576', '469001', '五指山市', '269', '0', '0', 'Wuzhishan Qu', '2');
INSERT INTO `yw_region` VALUES ('2577', '469002', '琼海市', '269', '0', '0', 'Qionghai Shi', '2');
INSERT INTO `yw_region` VALUES ('2578', '469003', '儋州市', '269', '0', '0', 'Danzhou Shi', '2');
INSERT INTO `yw_region` VALUES ('2579', '469005', '文昌市', '269', '0', '0', 'Wenchang Shi', '2');
INSERT INTO `yw_region` VALUES ('2580', '469006', '万宁市', '269', '0', '0', 'Wanning Shi', '2');
INSERT INTO `yw_region` VALUES ('2581', '469007', '东方市', '269', '0', '0', 'Dongfang Shi', '2');
INSERT INTO `yw_region` VALUES ('2582', '469021', '定安县', '269', '0', '0', 'Ding,an Xian', '2');
INSERT INTO `yw_region` VALUES ('2583', '469022', '屯昌县', '269', '0', '0', 'Tunchang Xian', '2');
INSERT INTO `yw_region` VALUES ('2584', '469023', '澄迈县', '269', '0', '0', 'Chengmai Xian', '2');
INSERT INTO `yw_region` VALUES ('2585', '469024', '临高县', '269', '0', '0', 'Lingao Xian', '2');
INSERT INTO `yw_region` VALUES ('2586', '469025', '白沙黎族自治县', '269', '0', '0', 'Baisha Lizu Zizhixian', '2');
INSERT INTO `yw_region` VALUES ('2587', '469026', '昌江黎族自治县', '269', '0', '0', 'Changjiang Lizu Zizhixian', '2');
INSERT INTO `yw_region` VALUES ('2588', '469027', '乐东黎族自治县', '269', '0', '0', 'Ledong Lizu Zizhixian', '2');
INSERT INTO `yw_region` VALUES ('2589', '469028', '陵水黎族自治县', '269', '0', '0', 'Lingshui Lizu Zizhixian', '2');
INSERT INTO `yw_region` VALUES ('2590', '469029', '保亭黎族苗族自治县', '269', '0', '0', 'Baoting Lizu Miaozu Zizhixian', '2');
INSERT INTO `yw_region` VALUES ('2591', '469030', '琼中黎族苗族自治县', '269', '0', '0', 'Qiongzhong Lizu Miaozu Zizhixian', '2');
INSERT INTO `yw_region` VALUES ('2592', '469031', '西沙群岛', '269', '0', '0', 'Xisha Qundao', '2');
INSERT INTO `yw_region` VALUES ('2593', '469032', '南沙群岛', '269', '0', '0', 'Nansha Qundao', '2');
INSERT INTO `yw_region` VALUES ('2594', '469033', '中沙群岛的岛礁及其海域', '269', '0', '0', 'Zhongsha Qundao de Daojiao Jiqi Haiyu', '2');
INSERT INTO `yw_region` VALUES ('2595', '500101', '万州区', '270', '0', '0', 'Wanzhou Qu', 'WZO ');
INSERT INTO `yw_region` VALUES ('2596', '500102', '涪陵区', '270', '0', '0', 'Fuling Qu', 'FLG');
INSERT INTO `yw_region` VALUES ('2597', '500103', '渝中区', '270', '0', '0', 'Yuzhong Qu', 'YZQ');
INSERT INTO `yw_region` VALUES ('2598', '500104', '大渡口区', '270', '0', '0', 'Dadukou Qu', 'DDK');
INSERT INTO `yw_region` VALUES ('2599', '500105', '江北区', '270', '0', '0', 'Jiangbei Qu', 'JBE');
INSERT INTO `yw_region` VALUES ('2600', '500106', '沙坪坝区', '270', '0', '0', 'Shapingba Qu', 'SPB');
INSERT INTO `yw_region` VALUES ('2601', '500107', '九龙坡区', '270', '0', '0', 'Jiulongpo Qu', 'JLP');
INSERT INTO `yw_region` VALUES ('2602', '500108', '南岸区', '270', '0', '0', 'Nan,an Qu', 'NAQ');
INSERT INTO `yw_region` VALUES ('2603', '500109', '北碚区', '270', '0', '0', 'Beibei Qu', 'BBE');
INSERT INTO `yw_region` VALUES ('2604', '500110', '万盛区', '270', '0', '0', 'Wansheng Qu', 'WSQ');
INSERT INTO `yw_region` VALUES ('2605', '500111', '双桥区', '270', '0', '0', 'Shuangqiao Qu', 'SQQ');
INSERT INTO `yw_region` VALUES ('2606', '500112', '渝北区', '270', '0', '0', 'Yubei Qu', 'YBE');
INSERT INTO `yw_region` VALUES ('2607', '500113', '巴南区', '270', '0', '0', 'Banan Qu', 'BNN');
INSERT INTO `yw_region` VALUES ('2608', '500114', '黔江区', '270', '0', '0', 'Qianjiang Qu', '2');
INSERT INTO `yw_region` VALUES ('2609', '500115', '长寿区', '270', '0', '0', 'Changshou Qu', '2');
INSERT INTO `yw_region` VALUES ('2610', '500222', '綦江县', '271', '0', '0', 'Qijiang Xian', 'QJG');
INSERT INTO `yw_region` VALUES ('2611', '500223', '潼南县', '271', '0', '0', 'Tongnan Xian', 'TNN');
INSERT INTO `yw_region` VALUES ('2612', '500224', '铜梁县', '271', '0', '0', 'Tongliang Xian', 'TGL');
INSERT INTO `yw_region` VALUES ('2613', '500225', '大足县', '271', '0', '0', 'Dazu Xian', 'DZX');
INSERT INTO `yw_region` VALUES ('2614', '500226', '荣昌县', '271', '0', '0', 'Rongchang Xian', 'RGC');
INSERT INTO `yw_region` VALUES ('2615', '500227', '璧山县', '271', '0', '0', 'Bishan Xian', 'BSY');
INSERT INTO `yw_region` VALUES ('2616', '500228', '梁平县', '271', '0', '0', 'Liangping Xian', 'LGP');
INSERT INTO `yw_region` VALUES ('2617', '500229', '城口县', '271', '0', '0', 'Chengkou Xian', 'CKO');
INSERT INTO `yw_region` VALUES ('2618', '500230', '丰都县', '271', '0', '0', 'Fengdu Xian', 'FDU');
INSERT INTO `yw_region` VALUES ('2619', '500231', '垫江县', '271', '0', '0', 'Dianjiang Xian', 'DJG');
INSERT INTO `yw_region` VALUES ('2620', '500232', '武隆县', '271', '0', '0', 'Wulong Xian', 'WLG');
INSERT INTO `yw_region` VALUES ('2621', '500233', '忠县', '271', '0', '0', 'Zhong Xian', 'ZHX');
INSERT INTO `yw_region` VALUES ('2622', '500234', '开县', '271', '0', '0', 'Kai Xian', 'KAI');
INSERT INTO `yw_region` VALUES ('2623', '500235', '云阳县', '271', '0', '0', 'Yunyang Xian', 'YNY');
INSERT INTO `yw_region` VALUES ('2624', '500236', '奉节县', '271', '0', '0', 'Fengjie Xian', 'FJE');
INSERT INTO `yw_region` VALUES ('2625', '500237', '巫山县', '271', '0', '0', 'Wushan Xian', 'WSN');
INSERT INTO `yw_region` VALUES ('2626', '500238', '巫溪县', '271', '0', '0', 'Wuxi Xian', 'WXX');
INSERT INTO `yw_region` VALUES ('2627', '500240', '石柱土家族自治县', '271', '0', '0', 'Shizhu Tujiazu Zizhixian', 'SZY');
INSERT INTO `yw_region` VALUES ('2628', '500241', '秀山土家族苗族自治县', '271', '0', '0', 'Xiushan Tujiazu Miaozu Zizhixian', 'XUS');
INSERT INTO `yw_region` VALUES ('2629', '500242', '酉阳土家族苗族自治县', '271', '0', '0', 'Youyang Tujiazu Miaozu Zizhixian', 'YUY');
INSERT INTO `yw_region` VALUES ('2630', '500243', '彭水苗族土家族自治县', '271', '0', '0', 'Pengshui Miaozu Tujiazu Zizhixian', 'PSU');
INSERT INTO `yw_region` VALUES ('2631', '500116', '江津区', '272', '0', '0', 'Jiangjin Shi', '2');
INSERT INTO `yw_region` VALUES ('2632', '500117', '合川区', '272', '0', '0', 'Hechuan Shi', '2');
INSERT INTO `yw_region` VALUES ('2633', '500118', '永川区', '272', '0', '0', 'Yongchuan Shi', '2');
INSERT INTO `yw_region` VALUES ('2634', '500119', '南川区', '272', '0', '0', 'Nanchuan Shi', '2');
INSERT INTO `yw_region` VALUES ('2635', '510101', '市辖区', '273', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2636', '510104', '锦江区', '273', '0', '0', 'Jinjiang Qu', 'JJQ');
INSERT INTO `yw_region` VALUES ('2637', '510105', '青羊区', '273', '0', '0', 'Qingyang Qu', 'QYQ');
INSERT INTO `yw_region` VALUES ('2638', '510106', '金牛区', '273', '0', '0', 'Jinniu Qu', 'JNU');
INSERT INTO `yw_region` VALUES ('2639', '510107', '武侯区', '273', '0', '0', 'Wuhou Qu', 'WHQ');
INSERT INTO `yw_region` VALUES ('2640', '510108', '成华区', '273', '0', '0', 'Chenghua Qu', 'CHQ');
INSERT INTO `yw_region` VALUES ('2641', '510112', '龙泉驿区', '273', '0', '0', 'Longquanyi Qu', 'LQY');
INSERT INTO `yw_region` VALUES ('2642', '510113', '青白江区', '273', '0', '0', 'Qingbaijiang Qu', 'QBJ');
INSERT INTO `yw_region` VALUES ('2643', '510114', '新都区', '273', '0', '0', 'Xindu Qu', '2');
INSERT INTO `yw_region` VALUES ('2644', '510115', '温江区', '273', '0', '0', 'Wenjiang Qu', '2');
INSERT INTO `yw_region` VALUES ('2645', '510121', '金堂县', '273', '0', '0', 'Jintang Xian', 'JNT');
INSERT INTO `yw_region` VALUES ('2646', '510122', '双流县', '273', '0', '0', 'Shuangliu Xian', 'SLU');
INSERT INTO `yw_region` VALUES ('2647', '510124', '郫县', '273', '0', '0', 'Pi Xian', 'PIX');
INSERT INTO `yw_region` VALUES ('2648', '510129', '大邑县', '273', '0', '0', 'Dayi Xian', 'DYI');
INSERT INTO `yw_region` VALUES ('2649', '510131', '蒲江县', '273', '0', '0', 'Pujiang Xian', 'PJX');
INSERT INTO `yw_region` VALUES ('2650', '510132', '新津县', '273', '0', '0', 'Xinjin Xian', 'XJC');
INSERT INTO `yw_region` VALUES ('2651', '510181', '都江堰市', '273', '0', '0', 'Dujiangyan Shi', 'DJY');
INSERT INTO `yw_region` VALUES ('2652', '510182', '彭州市', '273', '0', '0', 'Pengzhou Shi', 'PZS');
INSERT INTO `yw_region` VALUES ('2653', '510183', '邛崃市', '273', '0', '0', 'Qionglai Shi', 'QLA');
INSERT INTO `yw_region` VALUES ('2654', '510184', '崇州市', '273', '0', '0', 'Chongzhou Shi', 'CZO');
INSERT INTO `yw_region` VALUES ('2655', '510301', '市辖区', '274', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2656', '510302', '自流井区', '274', '0', '0', 'Ziliujing Qu', 'ZLJ');
INSERT INTO `yw_region` VALUES ('2657', '510303', '贡井区', '274', '0', '0', 'Gongjing Qu', '2');
INSERT INTO `yw_region` VALUES ('2658', '510304', '大安区', '274', '0', '0', 'Da,an Qu', 'DAQ');
INSERT INTO `yw_region` VALUES ('2659', '510311', '沿滩区', '274', '0', '0', 'Yantan Qu', 'YTN');
INSERT INTO `yw_region` VALUES ('2660', '510321', '荣县', '274', '0', '0', 'Rong Xian', 'RGX');
INSERT INTO `yw_region` VALUES ('2661', '510322', '富顺县', '274', '0', '0', 'Fushun Xian', 'FSH');
INSERT INTO `yw_region` VALUES ('2662', '510401', '市辖区', '275', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2663', '510402', '东区', '275', '0', '0', 'Dong Qu', 'DQP');
INSERT INTO `yw_region` VALUES ('2664', '510403', '西区', '275', '0', '0', 'Xi Qu', 'XIQ');
INSERT INTO `yw_region` VALUES ('2665', '510411', '仁和区', '275', '0', '0', 'Renhe Qu', 'RHQ');
INSERT INTO `yw_region` VALUES ('2666', '510421', '米易县', '275', '0', '0', 'Miyi Xian', 'MIY');
INSERT INTO `yw_region` VALUES ('2667', '510422', '盐边县', '275', '0', '0', 'Yanbian Xian', 'YBN');
INSERT INTO `yw_region` VALUES ('2668', '510501', '市辖区', '276', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2669', '510502', '江阳区', '276', '0', '0', 'Jiangyang Qu', 'JYB');
INSERT INTO `yw_region` VALUES ('2670', '510503', '纳溪区', '276', '0', '0', 'Naxi Qu', 'NXI');
INSERT INTO `yw_region` VALUES ('2671', '510504', '龙马潭区', '276', '0', '0', 'Longmatan Qu', 'LMT');
INSERT INTO `yw_region` VALUES ('2672', '510521', '泸县', '276', '0', '0', 'Lu Xian', 'LUX');
INSERT INTO `yw_region` VALUES ('2673', '510522', '合江县', '276', '0', '0', 'Hejiang Xian', 'HEJ');
INSERT INTO `yw_region` VALUES ('2674', '510524', '叙永县', '276', '0', '0', 'Xuyong Xian', 'XYO');
INSERT INTO `yw_region` VALUES ('2675', '510525', '古蔺县', '276', '0', '0', 'Gulin Xian', 'GUL');
INSERT INTO `yw_region` VALUES ('2676', '510601', '市辖区', '277', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2677', '510603', '旌阳区', '277', '0', '0', 'Jingyang Qu', 'JYF');
INSERT INTO `yw_region` VALUES ('2678', '510623', '中江县', '277', '0', '0', 'Zhongjiang Xian', 'ZGJ');
INSERT INTO `yw_region` VALUES ('2679', '510626', '罗江县', '277', '0', '0', 'Luojiang Xian', 'LOJ');
INSERT INTO `yw_region` VALUES ('2680', '510681', '广汉市', '277', '0', '0', 'Guanghan Shi', 'GHN');
INSERT INTO `yw_region` VALUES ('2681', '510682', '什邡市', '277', '0', '0', 'Shifang Shi', 'SFS');
INSERT INTO `yw_region` VALUES ('2682', '510683', '绵竹市', '277', '0', '0', 'Jinzhou Shi', 'MZU');
INSERT INTO `yw_region` VALUES ('2683', '510701', '市辖区', '278', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2684', '510703', '涪城区', '278', '0', '0', 'Fucheng Qu', 'FCM');
INSERT INTO `yw_region` VALUES ('2685', '510704', '游仙区', '278', '0', '0', 'Youxian Qu', 'YXM');
INSERT INTO `yw_region` VALUES ('2686', '510722', '三台县', '278', '0', '0', 'Santai Xian', 'SNT');
INSERT INTO `yw_region` VALUES ('2687', '510723', '盐亭县', '278', '0', '0', 'Yanting Xian', 'YTC');
INSERT INTO `yw_region` VALUES ('2688', '510724', '安县', '278', '0', '0', 'An Xian', 'AXN');
INSERT INTO `yw_region` VALUES ('2689', '510725', '梓潼县', '278', '0', '0', 'Zitong Xian', 'ZTG');
INSERT INTO `yw_region` VALUES ('2690', '510726', '北川羌族自治县', '278', '0', '0', 'Beichuanqiangzuzizhi Qu', '2');
INSERT INTO `yw_region` VALUES ('2691', '510727', '平武县', '278', '0', '0', 'Pingwu Xian', 'PWU');
INSERT INTO `yw_region` VALUES ('2692', '510781', '江油市', '278', '0', '0', 'Jiangyou Shi', 'JYO');
INSERT INTO `yw_region` VALUES ('2693', '510801', '市辖区', '279', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2694', '511002', '市中区', '279', '0', '0', 'Shizhong Qu', 'SZM');
INSERT INTO `yw_region` VALUES ('2695', '510811', '元坝区', '279', '0', '0', 'Yuanba Qu', 'YBQ');
INSERT INTO `yw_region` VALUES ('2696', '510812', '朝天区', '279', '0', '0', 'Chaotian Qu', 'CTN');
INSERT INTO `yw_region` VALUES ('2697', '510821', '旺苍县', '279', '0', '0', 'Wangcang Xian', 'WGC');
INSERT INTO `yw_region` VALUES ('2698', '510822', '青川县', '279', '0', '0', 'Qingchuan Xian', 'QCX');
INSERT INTO `yw_region` VALUES ('2699', '510823', '剑阁县', '279', '0', '0', 'Jiange Xian', 'JGE');
INSERT INTO `yw_region` VALUES ('2700', '510824', '苍溪县', '279', '0', '0', 'Cangxi Xian', 'CXC');
INSERT INTO `yw_region` VALUES ('2701', '510901', '市辖区', '280', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2702', '510903', '船山区', '280', '0', '0', 'Chuanshan Qu', '2');
INSERT INTO `yw_region` VALUES ('2703', '510904', '安居区', '280', '0', '0', 'Anju Qu', '2');
INSERT INTO `yw_region` VALUES ('2704', '510921', '蓬溪县', '280', '0', '0', 'Pengxi Xian', 'PXI');
INSERT INTO `yw_region` VALUES ('2705', '510922', '射洪县', '280', '0', '0', 'Shehong Xian', 'SHE');
INSERT INTO `yw_region` VALUES ('2706', '510923', '大英县', '280', '0', '0', 'Daying Xian', 'DAY');
INSERT INTO `yw_region` VALUES ('2707', '511001', '市辖区', '281', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2708', '511002', '市中区', '281', '0', '0', 'Shizhong Qu', 'SZM');
INSERT INTO `yw_region` VALUES ('2709', '511011', '东兴区', '281', '0', '0', 'Dongxing Qu', 'DXQ');
INSERT INTO `yw_region` VALUES ('2710', '511024', '威远县', '281', '0', '0', 'Weiyuan Xian', 'WYU');
INSERT INTO `yw_region` VALUES ('2711', '511025', '资中县', '281', '0', '0', 'Zizhong Xian', 'ZZC');
INSERT INTO `yw_region` VALUES ('2712', '511028', '隆昌县', '281', '0', '0', 'Longchang Xian', 'LCC');
INSERT INTO `yw_region` VALUES ('2713', '511101', '市辖区', '282', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2714', '511102', '市中区', '282', '0', '0', 'Shizhong Qu', 'SZP');
INSERT INTO `yw_region` VALUES ('2715', '511111', '沙湾区', '282', '0', '0', 'Shawan Qu', 'SWN');
INSERT INTO `yw_region` VALUES ('2716', '511112', '五通桥区', '282', '0', '0', 'Wutongqiao Qu', 'WTQ');
INSERT INTO `yw_region` VALUES ('2717', '511113', '金口河区', '282', '0', '0', 'Jinkouhe Qu', 'JKH');
INSERT INTO `yw_region` VALUES ('2718', '511123', '犍为县', '282', '0', '0', 'Qianwei Xian', 'QWE');
INSERT INTO `yw_region` VALUES ('2719', '511124', '井研县', '282', '0', '0', 'Jingyan Xian', 'JYA');
INSERT INTO `yw_region` VALUES ('2720', '511126', '夹江县', '282', '0', '0', 'Jiajiang Xian', 'JJC');
INSERT INTO `yw_region` VALUES ('2721', '511129', '沐川县', '282', '0', '0', 'Muchuan Xian', 'MCH');
INSERT INTO `yw_region` VALUES ('2722', '511132', '峨边彝族自治县', '282', '0', '0', 'Ebian Yizu Zizhixian', 'EBN');
INSERT INTO `yw_region` VALUES ('2723', '511133', '马边彝族自治县', '282', '0', '0', 'Mabian Yizu Zizhixian', 'MBN');
INSERT INTO `yw_region` VALUES ('2724', '511181', '峨眉山市', '282', '0', '0', 'Emeishan Shi', 'EMS');
INSERT INTO `yw_region` VALUES ('2725', '511301', '市辖区', '283', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2726', '511302', '顺庆区', '283', '0', '0', 'Shunqing Xian', 'SQG');
INSERT INTO `yw_region` VALUES ('2727', '511303', '高坪区', '283', '0', '0', 'Gaoping Qu', 'GPQ');
INSERT INTO `yw_region` VALUES ('2728', '511304', '嘉陵区', '283', '0', '0', 'Jialing Qu', 'JLG');
INSERT INTO `yw_region` VALUES ('2729', '511321', '南部县', '283', '0', '0', 'Nanbu Xian', 'NBU');
INSERT INTO `yw_region` VALUES ('2730', '511322', '营山县', '283', '0', '0', 'Yingshan Xian', 'YGS');
INSERT INTO `yw_region` VALUES ('2731', '511323', '蓬安县', '283', '0', '0', 'Peng,an Xian', 'PGA');
INSERT INTO `yw_region` VALUES ('2732', '511324', '仪陇县', '283', '0', '0', 'Yilong Xian', 'YLC');
INSERT INTO `yw_region` VALUES ('2733', '511325', '西充县', '283', '0', '0', 'Xichong Xian', 'XCO');
INSERT INTO `yw_region` VALUES ('2734', '511381', '阆中市', '283', '0', '0', 'Langzhong Shi', 'LZJ');
INSERT INTO `yw_region` VALUES ('2735', '511401', '市辖区', '284', '0', '0', '1', '2');
INSERT INTO `yw_region` VALUES ('2736', '511402', '东坡区', '284', '0', '0', 'Dongpo Qu', '2');
INSERT INTO `yw_region` VALUES ('2737', '511421', '仁寿县', '284', '0', '0', 'Renshou Xian', '2');
INSERT INTO `yw_region` VALUES ('2738', '511422', '彭山县', '284', '0', '0', 'Pengshan Xian', '2');
INSERT INTO `yw_region` VALUES ('2739', '511423', '洪雅县', '284', '0', '0', 'Hongya Xian', '2');
INSERT INTO `yw_region` VALUES ('2740', '511424', '丹棱县', '284', '0', '0', 'Danling Xian', '2');
INSERT INTO `yw_region` VALUES ('2741', '511425', '青神县', '284', '0', '0', 'Qingshen Xian', '2');
INSERT INTO `yw_region` VALUES ('2742', '511501', '市辖区', '285', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2743', '511502', '翠屏区', '285', '0', '0', 'Cuiping Qu', 'CPQ');
INSERT INTO `yw_region` VALUES ('2744', '511521', '宜宾县', '285', '0', '0', 'Yibin Xian', 'YBX');
INSERT INTO `yw_region` VALUES ('2745', '511522', '南溪县', '285', '0', '0', 'Nanxi Xian', 'NNX');
INSERT INTO `yw_region` VALUES ('2746', '511523', '江安县', '285', '0', '0', 'Jiang,an Xian', 'JAC');
INSERT INTO `yw_region` VALUES ('2747', '511524', '长宁县', '285', '0', '0', 'Changning Xian', 'CNX');
INSERT INTO `yw_region` VALUES ('2748', '511525', '高县', '285', '0', '0', 'Gao Xian', 'GAO');
INSERT INTO `yw_region` VALUES ('2749', '511526', '珙县', '285', '0', '0', 'Gong Xian', 'GOG');
INSERT INTO `yw_region` VALUES ('2750', '511527', '筠连县', '285', '0', '0', 'Junlian Xian', 'JNL');
INSERT INTO `yw_region` VALUES ('2751', '511528', '兴文县', '285', '0', '0', 'Xingwen Xian', 'XWC');
INSERT INTO `yw_region` VALUES ('2752', '511529', '屏山县', '285', '0', '0', 'Pingshan Xian', 'PSC');
INSERT INTO `yw_region` VALUES ('2753', '511601', '市辖区', '286', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2754', '511602', '广安区', '286', '0', '0', 'Guang,an Qu', 'GAQ');
INSERT INTO `yw_region` VALUES ('2755', '511621', '岳池县', '286', '0', '0', 'Yuechi Xian', 'YCC');
INSERT INTO `yw_region` VALUES ('2756', '511622', '武胜县', '286', '0', '0', 'Wusheng Xian', 'WSG');
INSERT INTO `yw_region` VALUES ('2757', '511623', '邻水县', '286', '0', '0', 'Linshui Xian', 'LSH');
INSERT INTO `yw_region` VALUES ('2759', '511701', '市辖区', '287', '0', '0', '1', '2');
INSERT INTO `yw_region` VALUES ('2760', '511702', '通川区', '287', '0', '0', 'Tongchuan Qu', '2');
INSERT INTO `yw_region` VALUES ('2761', '511721', '达县', '287', '0', '0', 'Da Xian', '2');
INSERT INTO `yw_region` VALUES ('2762', '511722', '宣汉县', '287', '0', '0', 'Xuanhan Xian', '2');
INSERT INTO `yw_region` VALUES ('2763', '511723', '开江县', '287', '0', '0', 'Kaijiang Xian', '2');
INSERT INTO `yw_region` VALUES ('2764', '511724', '大竹县', '287', '0', '0', 'Dazhu Xian', '2');
INSERT INTO `yw_region` VALUES ('2765', '511725', '渠县', '287', '0', '0', 'Qu Xian', '2');
INSERT INTO `yw_region` VALUES ('2766', '511781', '万源市', '287', '0', '0', 'Wanyuan Shi', '2');
INSERT INTO `yw_region` VALUES ('2767', '511801', '市辖区', '288', '0', '0', '1', '2');
INSERT INTO `yw_region` VALUES ('2768', '511802', '雨城区', '288', '0', '0', 'Yucheg Qu', '2');
INSERT INTO `yw_region` VALUES ('2769', '511821', '名山县', '288', '0', '0', 'Mingshan Xian', '2');
INSERT INTO `yw_region` VALUES ('2770', '511822', '荥经县', '288', '0', '0', 'Yingjing Xian', '2');
INSERT INTO `yw_region` VALUES ('2771', '511823', '汉源县', '288', '0', '0', 'Hanyuan Xian', '2');
INSERT INTO `yw_region` VALUES ('2772', '511824', '石棉县', '288', '0', '0', 'Shimian Xian', '2');
INSERT INTO `yw_region` VALUES ('2773', '511825', '天全县', '288', '0', '0', 'Tianquan Xian', '2');
INSERT INTO `yw_region` VALUES ('2774', '511826', '芦山县', '288', '0', '0', 'Lushan Xian', '2');
INSERT INTO `yw_region` VALUES ('2775', '511827', '宝兴县', '288', '0', '0', 'Baoxing Xian', '2');
INSERT INTO `yw_region` VALUES ('2776', '511901', '市辖区', '289', '0', '0', '1', '2');
INSERT INTO `yw_region` VALUES ('2777', '511902', '巴州区', '289', '0', '0', 'Bazhou Qu', '2');
INSERT INTO `yw_region` VALUES ('2778', '511921', '通江县', '289', '0', '0', 'Tongjiang Xian', '2');
INSERT INTO `yw_region` VALUES ('2779', '511922', '南江县', '289', '0', '0', 'Nanjiang Xian', '2');
INSERT INTO `yw_region` VALUES ('2780', '511923', '平昌县', '289', '0', '0', 'Pingchang Xian', '2');
INSERT INTO `yw_region` VALUES ('2781', '512001', '市辖区', '290', '0', '0', '1', '2');
INSERT INTO `yw_region` VALUES ('2782', '512002', '雁江区', '290', '0', '0', 'Yanjiang Qu', '2');
INSERT INTO `yw_region` VALUES ('2783', '512021', '安岳县', '290', '0', '0', 'Anyue Xian', '2');
INSERT INTO `yw_region` VALUES ('2784', '512022', '乐至县', '290', '0', '0', 'Lezhi Xian', '2');
INSERT INTO `yw_region` VALUES ('2785', '512081', '简阳市', '290', '0', '0', 'Jianyang Shi', '2');
INSERT INTO `yw_region` VALUES ('2786', '513221', '汶川县', '291', '0', '0', 'Wenchuan Xian', 'WNC');
INSERT INTO `yw_region` VALUES ('2787', '513222', '理县', '291', '0', '0', 'Li Xian', 'LXC');
INSERT INTO `yw_region` VALUES ('2788', '513223', '茂县', '291', '0', '0', 'Mao Xian', 'MAO');
INSERT INTO `yw_region` VALUES ('2789', '513224', '松潘县', '291', '0', '0', 'Songpan Xian', 'SOP');
INSERT INTO `yw_region` VALUES ('2790', '513225', '九寨沟县', '291', '0', '0', 'Jiuzhaigou Xian', 'JZG');
INSERT INTO `yw_region` VALUES ('2791', '513226', '金川县', '291', '0', '0', 'Jinchuan Xian', 'JCH');
INSERT INTO `yw_region` VALUES ('2792', '513227', '小金县', '291', '0', '0', 'Xiaojin Xian', 'XJX');
INSERT INTO `yw_region` VALUES ('2793', '513228', '黑水县', '291', '0', '0', 'Heishui Xian', 'HIS');
INSERT INTO `yw_region` VALUES ('2794', '513229', '马尔康县', '291', '0', '0', 'Barkam Xian', 'BAK');
INSERT INTO `yw_region` VALUES ('2795', '513230', '壤塘县', '291', '0', '0', 'Zamtang Xian', 'ZAM');
INSERT INTO `yw_region` VALUES ('2796', '513231', '阿坝县', '291', '0', '0', 'Aba(Ngawa) Xian', 'ABX');
INSERT INTO `yw_region` VALUES ('2797', '513232', '若尔盖县', '291', '0', '0', 'ZoigeXian', 'ZOI');
INSERT INTO `yw_region` VALUES ('2798', '513233', '红原县', '291', '0', '0', 'Hongyuan Xian', 'HOY');
INSERT INTO `yw_region` VALUES ('2799', '513321', '康定县', '292', '0', '0', 'Kangding(Dardo) Xian', 'KDX');
INSERT INTO `yw_region` VALUES ('2800', '513322', '泸定县', '292', '0', '0', 'Luding(Jagsamka) Xian', 'LUD');
INSERT INTO `yw_region` VALUES ('2801', '513323', '丹巴县', '292', '0', '0', 'Danba(Rongzhag) Xian', 'DBA');
INSERT INTO `yw_region` VALUES ('2802', '513324', '九龙县', '292', '0', '0', 'Jiulong(Gyaisi) Xian', 'JLC');
INSERT INTO `yw_region` VALUES ('2803', '513325', '雅江县', '292', '0', '0', 'Yajiang(Nyagquka) Xian', 'YAJ');
INSERT INTO `yw_region` VALUES ('2804', '513326', '道孚县', '292', '0', '0', 'Dawu Xian', 'DAW');
INSERT INTO `yw_region` VALUES ('2805', '513327', '炉霍县', '292', '0', '0', 'Luhuo(Zhaggo) Xian', 'LUH');
INSERT INTO `yw_region` VALUES ('2806', '513328', '甘孜县', '292', '0', '0', 'Garze Xian', 'GRZ');
INSERT INTO `yw_region` VALUES ('2807', '513329', '新龙县', '292', '0', '0', 'Xinlong(Nyagrong) Xian', 'XLG');
INSERT INTO `yw_region` VALUES ('2808', '513330', '德格县', '292', '0', '0', 'DegeXian', 'DEG');
INSERT INTO `yw_region` VALUES ('2809', '513331', '白玉县', '292', '0', '0', 'Baiyu Xian', 'BYC');
INSERT INTO `yw_region` VALUES ('2810', '513332', '石渠县', '292', '0', '0', 'Serxv Xian', 'SER');
INSERT INTO `yw_region` VALUES ('2811', '513333', '色达县', '292', '0', '0', 'Sertar Xian', 'STX');
INSERT INTO `yw_region` VALUES ('2812', '513334', '理塘县', '292', '0', '0', 'Litang Xian', 'LIT');
INSERT INTO `yw_region` VALUES ('2813', '513335', '巴塘县', '292', '0', '0', 'Batang Xian', 'BTC');
INSERT INTO `yw_region` VALUES ('2814', '513336', '乡城县', '292', '0', '0', 'Xiangcheng(Qagcheng) Xian', 'XCC');
INSERT INTO `yw_region` VALUES ('2815', '513337', '稻城县', '292', '0', '0', 'Daocheng(Dabba) Xian', 'DCX');
INSERT INTO `yw_region` VALUES ('2816', '513338', '得荣县', '292', '0', '0', 'Derong Xian', 'DER');
INSERT INTO `yw_region` VALUES ('2817', '513401', '西昌市', '293', '0', '0', 'Xichang Shi', 'XCA');
INSERT INTO `yw_region` VALUES ('2818', '513422', '木里藏族自治县', '293', '0', '0', 'Muli Zangzu Zizhixian', 'MLI');
INSERT INTO `yw_region` VALUES ('2819', '513423', '盐源县', '293', '0', '0', 'Yanyuan Xian', 'YYU');
INSERT INTO `yw_region` VALUES ('2820', '513424', '德昌县', '293', '0', '0', 'Dechang Xian', 'DEC');
INSERT INTO `yw_region` VALUES ('2821', '513425', '会理县', '293', '0', '0', 'Huili Xian', 'HLI');
INSERT INTO `yw_region` VALUES ('2822', '513426', '会东县', '293', '0', '0', 'Huidong Xian', 'HDG');
INSERT INTO `yw_region` VALUES ('2823', '513427', '宁南县', '293', '0', '0', 'Ningnan Xian', 'NIN');
INSERT INTO `yw_region` VALUES ('2824', '513428', '普格县', '293', '0', '0', 'Puge Xian', 'PGE');
INSERT INTO `yw_region` VALUES ('2825', '513429', '布拖县', '293', '0', '0', 'Butuo Xian', 'BTO');
INSERT INTO `yw_region` VALUES ('2826', '513430', '金阳县', '293', '0', '0', 'Jinyang Xian', 'JYW');
INSERT INTO `yw_region` VALUES ('2827', '513431', '昭觉县', '293', '0', '0', 'Zhaojue Xian', 'ZJE');
INSERT INTO `yw_region` VALUES ('2828', '513432', '喜德县', '293', '0', '0', 'Xide Xian', 'XDE');
INSERT INTO `yw_region` VALUES ('2829', '513433', '冕宁县', '293', '0', '0', 'Mianning Xian', 'MNG');
INSERT INTO `yw_region` VALUES ('2830', '513434', '越西县', '293', '0', '0', 'Yuexi Xian', 'YXC');
INSERT INTO `yw_region` VALUES ('2831', '513435', '甘洛县', '293', '0', '0', 'Ganluo Xian', 'GLO');
INSERT INTO `yw_region` VALUES ('2832', '513436', '美姑县', '293', '0', '0', 'Meigu Xian', 'MEG');
INSERT INTO `yw_region` VALUES ('2833', '513437', '雷波县', '293', '0', '0', 'Leibo Xian', 'LBX');
INSERT INTO `yw_region` VALUES ('2834', '520101', '市辖区', '294', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2835', '520102', '南明区', '294', '0', '0', 'Nanming Qu', 'NMQ');
INSERT INTO `yw_region` VALUES ('2836', '520103', '云岩区', '294', '0', '0', 'Yunyan Qu', 'YYQ');
INSERT INTO `yw_region` VALUES ('2837', '520111', '花溪区', '294', '0', '0', 'Huaxi Qu', 'HXI');
INSERT INTO `yw_region` VALUES ('2838', '520112', '乌当区', '294', '0', '0', 'Wudang Qu', 'WDQ');
INSERT INTO `yw_region` VALUES ('2839', '520113', '白云区', '294', '0', '0', 'Baiyun Qu', 'BYU');
INSERT INTO `yw_region` VALUES ('2840', '520114', '小河区', '294', '0', '0', 'Xiaohe Qu', '2');
INSERT INTO `yw_region` VALUES ('2841', '520121', '开阳县', '294', '0', '0', 'Kaiyang Xian', 'KYG');
INSERT INTO `yw_region` VALUES ('2842', '520122', '息烽县', '294', '0', '0', 'Xifeng Xian', 'XFX');
INSERT INTO `yw_region` VALUES ('2843', '520123', '修文县', '294', '0', '0', 'Xiuwen Xian', 'XWX');
INSERT INTO `yw_region` VALUES ('2844', '520181', '清镇市', '294', '0', '0', 'Qingzhen Shi', 'QZN');
INSERT INTO `yw_region` VALUES ('2845', '520201', '钟山区', '295', '0', '0', 'Zhongshan Qu', 'ZSQ');
INSERT INTO `yw_region` VALUES ('2846', '520203', '六枝特区', '295', '0', '0', 'Liuzhi Tequ', 'LZT');
INSERT INTO `yw_region` VALUES ('2847', '520221', '水城县', '295', '0', '0', 'Shuicheng Xian', 'SUC');
INSERT INTO `yw_region` VALUES ('2848', '520222', '盘县', '295', '0', '0', 'Pan Xian', '2');
INSERT INTO `yw_region` VALUES ('2849', '520301', '市辖区', '296', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2850', '520302', '红花岗区', '296', '0', '0', 'Honghuagang Qu', 'HHG');
INSERT INTO `yw_region` VALUES ('2851', '520303', '汇川区', '296', '0', '0', 'Huichuan Qu', '2');
INSERT INTO `yw_region` VALUES ('2852', '520321', '遵义县', '296', '0', '0', 'Zunyi Xian', 'ZYI');
INSERT INTO `yw_region` VALUES ('2853', '520322', '桐梓县', '296', '0', '0', 'Tongzi Xian', 'TZI');
INSERT INTO `yw_region` VALUES ('2854', '520323', '绥阳县', '296', '0', '0', 'Suiyang Xian', 'SUY');
INSERT INTO `yw_region` VALUES ('2855', '520324', '正安县', '296', '0', '0', 'Zhengan Xan', '2');
INSERT INTO `yw_region` VALUES ('2856', '520325', '道真仡佬族苗族自治县', '296', '0', '0', 'Daozhen Gelaozu Miaozu Zizhixian', 'DZN');
INSERT INTO `yw_region` VALUES ('2857', '520326', '务川仡佬族苗族自治县', '296', '0', '0', 'Wuchuan Gelaozu Miaozu Zizhixian', 'WCU');
INSERT INTO `yw_region` VALUES ('2858', '520327', '凤冈县', '296', '0', '0', 'Fenggang Xian', 'FGG');
INSERT INTO `yw_region` VALUES ('2859', '520328', '湄潭县', '296', '0', '0', 'Meitan Xian', 'MTN');
INSERT INTO `yw_region` VALUES ('2860', '520329', '余庆县', '296', '0', '0', 'Yuqing Xian', 'YUQ');
INSERT INTO `yw_region` VALUES ('2861', '520330', '习水县', '296', '0', '0', 'Xishui Xian', 'XSI');
INSERT INTO `yw_region` VALUES ('2862', '520381', '赤水市', '296', '0', '0', 'Chishui Shi', 'CSS');
INSERT INTO `yw_region` VALUES ('2863', '520382', '仁怀市', '296', '0', '0', 'Renhuai Shi', 'RHS');
INSERT INTO `yw_region` VALUES ('2864', '520401', '市辖区', '297', '0', '0', '1', '2');
INSERT INTO `yw_region` VALUES ('2865', '520402', '西秀区', '297', '0', '0', 'Xixiu Qu', '2');
INSERT INTO `yw_region` VALUES ('2866', '520421', '平坝县', '297', '0', '0', 'Pingba Xian', '2');
INSERT INTO `yw_region` VALUES ('2867', '520422', '普定县', '297', '0', '0', 'Puding Xian', '2');
INSERT INTO `yw_region` VALUES ('2868', '520423', '镇宁布依族苗族自治县', '297', '0', '0', 'Zhenning Buyeizu Miaozu Zizhixian', '2');
INSERT INTO `yw_region` VALUES ('2869', '520424', '关岭布依族苗族自治县', '297', '0', '0', 'Guanling Buyeizu Miaozu Zizhixian', '2');
INSERT INTO `yw_region` VALUES ('2870', '520425', '紫云苗族布依族自治县', '297', '0', '0', 'Ziyun Miaozu Buyeizu Zizhixian', '2');
INSERT INTO `yw_region` VALUES ('2871', '522201', '铜仁市', '298', '0', '0', 'Tongren Shi', 'TRS');
INSERT INTO `yw_region` VALUES ('2872', '522222', '江口县', '298', '0', '0', 'Jiangkou Xian', 'JGK');
INSERT INTO `yw_region` VALUES ('2873', '522223', '玉屏侗族自治县', '298', '0', '0', 'Yuping Dongzu Zizhixian', 'YPG');
INSERT INTO `yw_region` VALUES ('2874', '522224', '石阡县', '298', '0', '0', 'Shiqian Xian', 'SQI');
INSERT INTO `yw_region` VALUES ('2875', '522225', '思南县', '298', '0', '0', 'Sinan Xian', 'SNA');
INSERT INTO `yw_region` VALUES ('2876', '522226', '印江土家族苗族自治县', '298', '0', '0', 'Yinjiang Tujiazu Miaozu Zizhixian', 'YJY');
INSERT INTO `yw_region` VALUES ('2877', '522227', '德江县', '298', '0', '0', 'Dejiang Xian', 'DEJ');
INSERT INTO `yw_region` VALUES ('2878', '522228', '沿河土家族自治县', '298', '0', '0', 'Yanhe Tujiazu Zizhixian', 'YHE');
INSERT INTO `yw_region` VALUES ('2879', '522229', '松桃苗族自治县', '298', '0', '0', 'Songtao Miaozu Zizhixian', 'STM');
INSERT INTO `yw_region` VALUES ('2880', '522230', '万山特区', '298', '0', '0', 'Wanshan Tequ', 'WAS');
INSERT INTO `yw_region` VALUES ('2881', '522301', '兴义市', '299', '0', '0', 'Xingyi Shi', 'XYI');
INSERT INTO `yw_region` VALUES ('2882', '522322', '兴仁县', '299', '0', '0', 'Xingren Xian', 'XRN');
INSERT INTO `yw_region` VALUES ('2883', '522323', '普安县', '299', '0', '0', 'Pu,an Xian', 'PUA');
INSERT INTO `yw_region` VALUES ('2884', '522324', '晴隆县', '299', '0', '0', 'Qinglong Xian', 'QLG');
INSERT INTO `yw_region` VALUES ('2885', '522325', '贞丰县', '299', '0', '0', 'Zhenfeng Xian', 'ZFG');
INSERT INTO `yw_region` VALUES ('2886', '522326', '望谟县', '299', '0', '0', 'Wangmo Xian', 'WMO');
INSERT INTO `yw_region` VALUES ('2887', '522327', '册亨县', '299', '0', '0', 'Ceheng Xian', 'CEH');
INSERT INTO `yw_region` VALUES ('2888', '522328', '安龙县', '299', '0', '0', 'Anlong Xian', 'ALG');
INSERT INTO `yw_region` VALUES ('2889', '522401', '毕节市', '300', '0', '0', 'Bijie Shi', 'BJE');
INSERT INTO `yw_region` VALUES ('2890', '522422', '大方县', '300', '0', '0', 'Dafang Xian', 'DAF');
INSERT INTO `yw_region` VALUES ('2891', '522423', '黔西县', '300', '0', '0', 'Qianxi Xian', 'QNX');
INSERT INTO `yw_region` VALUES ('2892', '522424', '金沙县', '300', '0', '0', 'Jinsha Xian', 'JSX');
INSERT INTO `yw_region` VALUES ('2893', '522425', '织金县', '300', '0', '0', 'Zhijin Xian', 'ZJN');
INSERT INTO `yw_region` VALUES ('2894', '522426', '纳雍县', '300', '0', '0', 'Nayong Xian', 'NYG');
INSERT INTO `yw_region` VALUES ('2895', '522427', '威宁彝族回族苗族自治县', '300', '0', '0', 'Weining Yizu Huizu Miaozu Zizhixian', 'WNG');
INSERT INTO `yw_region` VALUES ('2896', '522428', '赫章县', '300', '0', '0', 'Hezhang Xian', 'HZA');
INSERT INTO `yw_region` VALUES ('2897', '522601', '凯里市', '301', '0', '0', 'Kaili Shi', 'KLS');
INSERT INTO `yw_region` VALUES ('2898', '522622', '黄平县', '301', '0', '0', 'Huangping Xian', 'HPN');
INSERT INTO `yw_region` VALUES ('2899', '522623', '施秉县', '301', '0', '0', 'Shibing Xian', 'SBG');
INSERT INTO `yw_region` VALUES ('2900', '522624', '三穗县', '301', '0', '0', 'Sansui Xian', 'SAS');
INSERT INTO `yw_region` VALUES ('2901', '522625', '镇远县', '301', '0', '0', 'Zhenyuan Xian', 'ZYX');
INSERT INTO `yw_region` VALUES ('2902', '522626', '岑巩县', '301', '0', '0', 'Cengong Xian', 'CGX');
INSERT INTO `yw_region` VALUES ('2903', '522627', '天柱县', '301', '0', '0', 'Tianzhu Xian', 'TZU');
INSERT INTO `yw_region` VALUES ('2904', '522628', '锦屏县', '301', '0', '0', 'Jinping Xian', 'JPX');
INSERT INTO `yw_region` VALUES ('2905', '522629', '剑河县', '301', '0', '0', 'Jianhe Xian', 'JHE');
INSERT INTO `yw_region` VALUES ('2906', '522630', '台江县', '301', '0', '0', 'Taijiang Xian', 'TJX');
INSERT INTO `yw_region` VALUES ('2907', '522631', '黎平县', '301', '0', '0', 'Liping Xian', 'LIP');
INSERT INTO `yw_region` VALUES ('2908', '522632', '榕江县', '301', '0', '0', 'Rongjiang Xian', 'RJG');
INSERT INTO `yw_region` VALUES ('2909', '522633', '从江县', '301', '0', '0', 'Congjiang Xian', 'COJ');
INSERT INTO `yw_region` VALUES ('2910', '522634', '雷山县', '301', '0', '0', 'Leishan Xian', 'LSA');
INSERT INTO `yw_region` VALUES ('2911', '522635', '麻江县', '301', '0', '0', 'Majiang Xian', 'MAJ');
INSERT INTO `yw_region` VALUES ('2912', '522636', '丹寨县', '301', '0', '0', 'Danzhai Xian', 'DZH');
INSERT INTO `yw_region` VALUES ('2913', '522701', '都匀市', '302', '0', '0', 'Duyun Shi', 'DUY');
INSERT INTO `yw_region` VALUES ('2914', '522702', '福泉市', '302', '0', '0', 'Fuquan Shi', 'FQN');
INSERT INTO `yw_region` VALUES ('2915', '522722', '荔波县', '302', '0', '0', 'Libo Xian', 'LBO');
INSERT INTO `yw_region` VALUES ('2916', '522723', '贵定县', '302', '0', '0', 'Guiding Xian', 'GDG');
INSERT INTO `yw_region` VALUES ('2917', '522725', '瓮安县', '302', '0', '0', 'Weng,an Xian', 'WGA');
INSERT INTO `yw_region` VALUES ('2918', '522726', '独山县', '302', '0', '0', 'Dushan Xian', 'DSX');
INSERT INTO `yw_region` VALUES ('2919', '522727', '平塘县', '302', '0', '0', 'Pingtang Xian', 'PTG');
INSERT INTO `yw_region` VALUES ('2920', '522728', '罗甸县', '302', '0', '0', 'Luodian Xian', 'LOD');
INSERT INTO `yw_region` VALUES ('2921', '522729', '长顺县', '302', '0', '0', 'Changshun Xian', 'CSU');
INSERT INTO `yw_region` VALUES ('2922', '522730', '龙里县', '302', '0', '0', 'Longli Xian', 'LLI');
INSERT INTO `yw_region` VALUES ('2923', '522731', '惠水县', '302', '0', '0', 'Huishui Xian', 'HUS');
INSERT INTO `yw_region` VALUES ('2924', '522732', '三都水族自治县', '302', '0', '0', 'Sandu Suizu Zizhixian', 'SDU');
INSERT INTO `yw_region` VALUES ('2925', '530101', '市辖区', '303', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2926', '530102', '五华区', '303', '0', '0', 'Wuhua Qu', 'WHA');
INSERT INTO `yw_region` VALUES ('2927', '530103', '盘龙区', '303', '0', '0', 'Panlong Qu', 'PLQ');
INSERT INTO `yw_region` VALUES ('2928', '530111', '官渡区', '303', '0', '0', 'Guandu Qu', 'GDU');
INSERT INTO `yw_region` VALUES ('2929', '530112', '西山区', '303', '0', '0', 'Xishan Qu', 'XSN');
INSERT INTO `yw_region` VALUES ('2930', '530113', '东川区', '303', '0', '0', 'Dongchuan Qu', 'DCU');
INSERT INTO `yw_region` VALUES ('2931', '530121', '呈贡县', '303', '0', '0', 'Chenggong Xian', 'CGD');
INSERT INTO `yw_region` VALUES ('2932', '530122', '晋宁县', '303', '0', '0', 'Jinning Xian', 'JND');
INSERT INTO `yw_region` VALUES ('2933', '530124', '富民县', '303', '0', '0', 'Fumin Xian', 'FMN');
INSERT INTO `yw_region` VALUES ('2934', '530125', '宜良县', '303', '0', '0', 'Yiliang Xian', 'YIL');
INSERT INTO `yw_region` VALUES ('2935', '530126', '石林彝族自治县', '303', '0', '0', 'Shilin Yizu Zizhixian', 'SLY');
INSERT INTO `yw_region` VALUES ('2936', '530127', '嵩明县', '303', '0', '0', 'Songming Xian', 'SMI');
INSERT INTO `yw_region` VALUES ('2937', '530128', '禄劝彝族苗族自治县', '303', '0', '0', 'Luchuan Yizu Miaozu Zizhixian', 'LUC');
INSERT INTO `yw_region` VALUES ('2938', '530129', '寻甸回族彝族自治县', '303', '0', '0', 'Xundian Huizu Yizu Zizhixian', 'XDN');
INSERT INTO `yw_region` VALUES ('2939', '530181', '安宁市', '303', '0', '0', 'Anning Shi', 'ANG');
INSERT INTO `yw_region` VALUES ('2940', '530301', '市辖区', '304', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2941', '530302', '麒麟区', '304', '0', '0', 'Qilin Xian', 'QLQ');
INSERT INTO `yw_region` VALUES ('2942', '530321', '马龙县', '304', '0', '0', 'Malong Xian', 'MLO');
INSERT INTO `yw_region` VALUES ('2943', '530322', '陆良县', '304', '0', '0', 'Luliang Xian', 'LLX');
INSERT INTO `yw_region` VALUES ('2944', '530323', '师宗县', '304', '0', '0', 'Shizong Xian', 'SZD');
INSERT INTO `yw_region` VALUES ('2945', '530324', '罗平县', '304', '0', '0', 'Luoping Xian', 'LPX');
INSERT INTO `yw_region` VALUES ('2946', '530325', '富源县', '304', '0', '0', 'Fuyuan Xian', 'FYD');
INSERT INTO `yw_region` VALUES ('2947', '530326', '会泽县', '304', '0', '0', 'Huize Xian', 'HUZ');
INSERT INTO `yw_region` VALUES ('2948', '530328', '沾益县', '304', '0', '0', 'Zhanyi Xian', 'ZYD');
INSERT INTO `yw_region` VALUES ('2949', '530381', '宣威市', '304', '0', '0', 'Xuanwei Shi', 'XWS');
INSERT INTO `yw_region` VALUES ('2950', '530401', '市辖区', '305', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('2951', '530402', '红塔区', '305', '0', '0', 'Hongta Qu', 'HTA');
INSERT INTO `yw_region` VALUES ('2952', '530421', '江川县', '305', '0', '0', 'Jiangchuan Xian', 'JGC');
INSERT INTO `yw_region` VALUES ('2953', '530422', '澄江县', '305', '0', '0', 'Chengjiang Xian', 'CGJ');
INSERT INTO `yw_region` VALUES ('2954', '530423', '通海县', '305', '0', '0', 'Tonghai Xian', 'THI');
INSERT INTO `yw_region` VALUES ('2955', '530424', '华宁县', '305', '0', '0', 'Huaning Xian', 'HND');
INSERT INTO `yw_region` VALUES ('2956', '530425', '易门县', '305', '0', '0', 'Yimen Xian', 'YMD');
INSERT INTO `yw_region` VALUES ('2957', '530426', '峨山彝族自治县', '305', '0', '0', 'Eshan Yizu Zizhixian', 'ESN');
INSERT INTO `yw_region` VALUES ('2958', '530427', '新平彝族傣族自治县', '305', '0', '0', 'Xinping Yizu Daizu Zizhixian', 'XNP');
INSERT INTO `yw_region` VALUES ('2959', '530428', '元江哈尼族彝族傣族自治县', '305', '0', '0', 'Yuanjiang Hanizu Yizu Daizu Zizhixian', 'YJA');
INSERT INTO `yw_region` VALUES ('2960', '530501', '市辖区', '306', '0', '0', '1', '2');
INSERT INTO `yw_region` VALUES ('2961', '530502', '隆阳区', '306', '0', '0', 'Longyang Qu', '2');
INSERT INTO `yw_region` VALUES ('2962', '530521', '施甸县', '306', '0', '0', 'Shidian Xian', '2');
INSERT INTO `yw_region` VALUES ('2963', '530522', '腾冲县', '306', '0', '0', 'Tengchong Xian', '2');
INSERT INTO `yw_region` VALUES ('2964', '530523', '龙陵县', '306', '0', '0', 'Longling Xian', '2');
INSERT INTO `yw_region` VALUES ('2965', '530524', '昌宁县', '306', '0', '0', 'Changning Xian', '2');
INSERT INTO `yw_region` VALUES ('2966', '530601', '市辖区', '307', '0', '0', '1', '2');
INSERT INTO `yw_region` VALUES ('2967', '530602', '昭阳区', '307', '0', '0', 'Zhaoyang Qu', '2');
INSERT INTO `yw_region` VALUES ('2968', '530621', '鲁甸县', '307', '0', '0', 'Ludian Xian', '2');
INSERT INTO `yw_region` VALUES ('2969', '530622', '巧家县', '307', '0', '0', 'Qiaojia Xian', '2');
INSERT INTO `yw_region` VALUES ('2970', '530623', '盐津县', '307', '0', '0', 'Yanjin Xian', '2');
INSERT INTO `yw_region` VALUES ('2971', '530624', '大关县', '307', '0', '0', 'Daguan Xian', '2');
INSERT INTO `yw_region` VALUES ('2972', '530625', '永善县', '307', '0', '0', 'Yongshan Xian', '2');
INSERT INTO `yw_region` VALUES ('2973', '530626', '绥江县', '307', '0', '0', 'Suijiang Xian', '2');
INSERT INTO `yw_region` VALUES ('2974', '530627', '镇雄县', '307', '0', '0', 'Zhenxiong Xian', '2');
INSERT INTO `yw_region` VALUES ('2975', '530628', '彝良县', '307', '0', '0', 'Yiliang Xian', '2');
INSERT INTO `yw_region` VALUES ('2976', '530629', '威信县', '307', '0', '0', 'Weixin Xian', '2');
INSERT INTO `yw_region` VALUES ('2977', '530630', '水富县', '307', '0', '0', 'Shuifu Xian ', '2');
INSERT INTO `yw_region` VALUES ('2978', '530701', '市辖区', '308', '0', '0', '1', '2');
INSERT INTO `yw_region` VALUES ('2979', '530702', '古城区', '308', '0', '0', 'Gucheng Qu', '2');
INSERT INTO `yw_region` VALUES ('2980', '530721', '玉龙纳西族自治县', '308', '0', '0', 'Yulongnaxizuzizhi Xian', '2');
INSERT INTO `yw_region` VALUES ('2981', '530722', '永胜县', '308', '0', '0', 'Yongsheng Xian', '2');
INSERT INTO `yw_region` VALUES ('2982', '530723', '华坪县', '308', '0', '0', 'Huaping Xian', '2');
INSERT INTO `yw_region` VALUES ('2983', '530724', '宁蒗彝族自治县', '308', '0', '0', 'Ninglang Yizu Zizhixian', '2');
INSERT INTO `yw_region` VALUES ('2984', '530801', '市辖区', '309', '0', '0', '1', '2');
INSERT INTO `yw_region` VALUES ('2985', '530802', '思茅区', '309', '0', '0', 'Simao Qu', '2');
INSERT INTO `yw_region` VALUES ('2986', '530821', '宁洱哈尼族彝族自治县', '309', '0', '0', 'Pu,er Hanizu Yizu Zizhixian', '2');
INSERT INTO `yw_region` VALUES ('2987', '530822', '墨江哈尼族自治县', '309', '0', '0', 'Mojiang Hanizu Zizhixian', '2');
INSERT INTO `yw_region` VALUES ('2988', '530823', '景东彝族自治县', '309', '0', '0', 'Jingdong Yizu Zizhixian', '2');
INSERT INTO `yw_region` VALUES ('2989', '530824', '景谷傣族彝族自治县', '309', '0', '0', 'Jinggu Daizu Yizu Zizhixian', '2');
INSERT INTO `yw_region` VALUES ('2990', '530825', '镇沅彝族哈尼族拉祜族自治县', '309', '0', '0', 'Zhenyuan Yizu Hanizu Lahuzu Zizhixian', '2');
INSERT INTO `yw_region` VALUES ('2991', '530826', '江城哈尼族彝族自治县', '309', '0', '0', 'Jiangcheng Hanizu Yizu Zizhixian', '2');
INSERT INTO `yw_region` VALUES ('2992', '530827', '孟连傣族拉祜族佤族自治县', '309', '0', '0', 'Menglian Daizu Lahuzu Vazu Zizixian', '2');
INSERT INTO `yw_region` VALUES ('2993', '530828', '澜沧拉祜族自治县', '309', '0', '0', 'Lancang Lahuzu Zizhixian', '2');
INSERT INTO `yw_region` VALUES ('2994', '530829', '西盟佤族自治县', '309', '0', '0', 'Ximeng Vazu Zizhixian', '2');
INSERT INTO `yw_region` VALUES ('2995', '530901', '市辖区', '310', '0', '0', '1', '2');
INSERT INTO `yw_region` VALUES ('2996', '530902', '临翔区', '310', '0', '0', 'Linxiang Qu', '2');
INSERT INTO `yw_region` VALUES ('2997', '530921', '凤庆县', '310', '0', '0', 'Fengqing Xian', '2');
INSERT INTO `yw_region` VALUES ('2998', '530922', '云县', '310', '0', '0', 'Yun Xian', '2');
INSERT INTO `yw_region` VALUES ('2999', '530923', '永德县', '310', '0', '0', 'Yongde Xian', '2');
INSERT INTO `yw_region` VALUES ('3000', '530924', '镇康县', '310', '0', '0', 'Zhenkang Xian', '2');
INSERT INTO `yw_region` VALUES ('3001', '530925', '双江拉祜族佤族布朗族傣族自治县', '310', '0', '0', 'Shuangjiang Lahuzu Vazu Bulangzu Daizu Zizhixian', '2');
INSERT INTO `yw_region` VALUES ('3002', '530926', '耿马傣族佤族自治县', '310', '0', '0', 'Gengma Daizu Vazu Zizhixian', '2');
INSERT INTO `yw_region` VALUES ('3003', '530927', '沧源佤族自治县', '310', '0', '0', 'Cangyuan Vazu Zizhixian', '2');
INSERT INTO `yw_region` VALUES ('3004', '532301', '楚雄市', '311', '0', '0', 'Chuxiong Shi', 'CXS');
INSERT INTO `yw_region` VALUES ('3005', '532322', '双柏县', '311', '0', '0', 'Shuangbai Xian', 'SBA');
INSERT INTO `yw_region` VALUES ('3006', '532323', '牟定县', '311', '0', '0', 'Mouding Xian', 'MDI');
INSERT INTO `yw_region` VALUES ('3007', '532324', '南华县', '311', '0', '0', 'Nanhua Xian', 'NHA');
INSERT INTO `yw_region` VALUES ('3008', '532325', '姚安县', '311', '0', '0', 'Yao,an Xian', 'YOA');
INSERT INTO `yw_region` VALUES ('3009', '532326', '大姚县', '311', '0', '0', 'Dayao Xian', 'DYO');
INSERT INTO `yw_region` VALUES ('3010', '532327', '永仁县', '311', '0', '0', 'Yongren Xian', 'YRN');
INSERT INTO `yw_region` VALUES ('3011', '532328', '元谋县', '311', '0', '0', 'Yuanmou Xian', 'YMO');
INSERT INTO `yw_region` VALUES ('3012', '532329', '武定县', '311', '0', '0', 'Wuding Xian', 'WDX');
INSERT INTO `yw_region` VALUES ('3013', '532331', '禄丰县', '311', '0', '0', 'Lufeng Xian', 'LFX');
INSERT INTO `yw_region` VALUES ('3014', '532501', '个旧市', '312', '0', '0', 'Gejiu Shi', 'GJU');
INSERT INTO `yw_region` VALUES ('3015', '532502', '开远市', '312', '0', '0', 'Kaiyuan Shi', 'KYD');
INSERT INTO `yw_region` VALUES ('3016', '532503', '蒙自市', '312', '0', '0', 'Mengzi Xian', '2');
INSERT INTO `yw_region` VALUES ('3017', '532523', '屏边苗族自治县', '312', '0', '0', 'Pingbian Miaozu Zizhixian', 'PBN');
INSERT INTO `yw_region` VALUES ('3018', '532524', '建水县', '312', '0', '0', 'Jianshui Xian', 'JSD');
INSERT INTO `yw_region` VALUES ('3019', '532525', '石屏县', '312', '0', '0', 'Shiping Xian', 'SPG');
INSERT INTO `yw_region` VALUES ('3020', '532526', '弥勒县', '312', '0', '0', 'Mile Xian', 'MIL');
INSERT INTO `yw_region` VALUES ('3021', '532527', '泸西县', '312', '0', '0', 'Luxi Xian', 'LXD');
INSERT INTO `yw_region` VALUES ('3022', '532528', '元阳县', '312', '0', '0', 'Yuanyang Xian', 'YYD');
INSERT INTO `yw_region` VALUES ('3023', '532529', '红河县', '312', '0', '0', 'Honghe Xian', 'HHX');
INSERT INTO `yw_region` VALUES ('3024', '532530', '金平苗族瑶族傣族自治县', '312', '0', '0', 'Jinping Miaozu Yaozu Daizu Zizhixian', 'JNP');
INSERT INTO `yw_region` VALUES ('3025', '532531', '绿春县', '312', '0', '0', 'Lvchun Xian', 'LCX');
INSERT INTO `yw_region` VALUES ('3026', '532532', '河口瑶族自治县', '312', '0', '0', 'Hekou Yaozu Zizhixian', 'HKM');
INSERT INTO `yw_region` VALUES ('3027', '532621', '文山县', '313', '0', '0', 'Wenshan Xian', 'WES');
INSERT INTO `yw_region` VALUES ('3028', '532622', '砚山县', '313', '0', '0', 'Yanshan Xian', 'YSD');
INSERT INTO `yw_region` VALUES ('3029', '532623', '西畴县', '313', '0', '0', 'Xichou Xian', 'XIC');
INSERT INTO `yw_region` VALUES ('3030', '532624', '麻栗坡县', '313', '0', '0', 'Malipo Xian', 'MLP');
INSERT INTO `yw_region` VALUES ('3031', '532625', '马关县', '313', '0', '0', 'Maguan Xian', 'MGN');
INSERT INTO `yw_region` VALUES ('3032', '532626', '丘北县', '313', '0', '0', 'Qiubei Xian', 'QBE');
INSERT INTO `yw_region` VALUES ('3033', '532627', '广南县', '313', '0', '0', 'Guangnan Xian', 'GGN');
INSERT INTO `yw_region` VALUES ('3034', '532628', '富宁县', '313', '0', '0', 'Funing Xian', 'FND');
INSERT INTO `yw_region` VALUES ('3035', '532801', '景洪市', '314', '0', '0', 'Jinghong Shi', 'JHG');
INSERT INTO `yw_region` VALUES ('3036', '532822', '勐海县', '314', '0', '0', 'Menghai Xian', 'MHI');
INSERT INTO `yw_region` VALUES ('3037', '532823', '勐腊县', '314', '0', '0', 'Mengla Xian', 'MLA');
INSERT INTO `yw_region` VALUES ('3038', '532901', '大理市', '315', '0', '0', 'Dali Shi', 'DLS');
INSERT INTO `yw_region` VALUES ('3039', '532922', '漾濞彝族自治县', '315', '0', '0', 'Yangbi Yizu Zizhixian', 'YGB');
INSERT INTO `yw_region` VALUES ('3040', '532923', '祥云县', '315', '0', '0', 'Xiangyun Xian', 'XYD');
INSERT INTO `yw_region` VALUES ('3041', '532924', '宾川县', '315', '0', '0', 'Binchuan Xian', 'BCD');
INSERT INTO `yw_region` VALUES ('3042', '532925', '弥渡县', '315', '0', '0', 'Midu Xian', 'MDU');
INSERT INTO `yw_region` VALUES ('3043', '532926', '南涧彝族自治县', '315', '0', '0', 'Nanjian Yizu Zizhixian', 'NNJ');
INSERT INTO `yw_region` VALUES ('3044', '532927', '巍山彝族回族自治县', '315', '0', '0', 'Weishan Yizu Huizu Zizhixian', 'WSY');
INSERT INTO `yw_region` VALUES ('3045', '532928', '永平县', '315', '0', '0', 'Yongping Xian', 'YPX');
INSERT INTO `yw_region` VALUES ('3046', '532929', '云龙县', '315', '0', '0', 'Yunlong Xian', 'YLO');
INSERT INTO `yw_region` VALUES ('3047', '532930', '洱源县', '315', '0', '0', 'Eryuan Xian', 'EYN');
INSERT INTO `yw_region` VALUES ('3048', '532931', '剑川县', '315', '0', '0', 'Jianchuan Xian', 'JIC');
INSERT INTO `yw_region` VALUES ('3049', '532932', '鹤庆县', '315', '0', '0', 'Heqing Xian', 'HQG');
INSERT INTO `yw_region` VALUES ('3050', '533102', '瑞丽市', '316', '0', '0', 'Ruili Shi', 'RUI');
INSERT INTO `yw_region` VALUES ('3051', '533103', '芒市', '316', '0', '0', 'Luxi Shi', '2');
INSERT INTO `yw_region` VALUES ('3052', '533122', '梁河县', '316', '0', '0', 'Lianghe Xian', 'LHD');
INSERT INTO `yw_region` VALUES ('3053', '533123', '盈江县', '316', '0', '0', 'Yingjiang Xian', 'YGJ');
INSERT INTO `yw_region` VALUES ('3054', '533124', '陇川县', '316', '0', '0', 'Longchuan Xian', 'LCN');
INSERT INTO `yw_region` VALUES ('3055', '533321', '泸水县', '317', '0', '0', 'Lushui Xian', 'LSX');
INSERT INTO `yw_region` VALUES ('3056', '533323', '福贡县', '317', '0', '0', 'Fugong Xian', 'FGO');
INSERT INTO `yw_region` VALUES ('3057', '533324', '贡山独龙族怒族自治县', '317', '0', '0', 'Gongshan Dulongzu Nuzu Zizhixian', 'GSN');
INSERT INTO `yw_region` VALUES ('3058', '533325', '兰坪白族普米族自治县', '317', '0', '0', 'Lanping Baizu Pumizu Zizhixian', 'LPG');
INSERT INTO `yw_region` VALUES ('3059', '533421', '香格里拉县', '318', '0', '0', 'Xianggelila Xian', '2');
INSERT INTO `yw_region` VALUES ('3060', '533422', '德钦县', '318', '0', '0', 'Deqen Xian', 'DQN');
INSERT INTO `yw_region` VALUES ('3061', '533423', '维西傈僳族自治县', '318', '0', '0', 'Weixi Lisuzu Zizhixian', 'WXI');
INSERT INTO `yw_region` VALUES ('3062', '540101', '市辖区', '319', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('3063', '540102', '城关区', '319', '0', '0', 'Chengguang Qu', 'CGN');
INSERT INTO `yw_region` VALUES ('3064', '540121', '林周县', '319', '0', '0', 'Lhvnzhub Xian', 'LZB');
INSERT INTO `yw_region` VALUES ('3065', '540122', '当雄县', '319', '0', '0', 'Damxung Xian', 'DAM');
INSERT INTO `yw_region` VALUES ('3066', '540123', '尼木县', '319', '0', '0', 'Nyemo Xian', 'NYE');
INSERT INTO `yw_region` VALUES ('3067', '540124', '曲水县', '319', '0', '0', 'Qvxv Xian', 'QUX');
INSERT INTO `yw_region` VALUES ('3068', '540125', '堆龙德庆县', '319', '0', '0', 'Doilungdeqen Xian', 'DOI');
INSERT INTO `yw_region` VALUES ('3069', '540126', '达孜县', '319', '0', '0', 'Dagze Xian', 'DAG');
INSERT INTO `yw_region` VALUES ('3070', '540127', '墨竹工卡县', '319', '0', '0', 'Maizhokunggar Xian', 'MAI');
INSERT INTO `yw_region` VALUES ('3071', '542121', '昌都县', '320', '0', '0', 'Qamdo Xian', 'QAX');
INSERT INTO `yw_region` VALUES ('3072', '542122', '江达县', '320', '0', '0', 'Jomda Xian', 'JOM');
INSERT INTO `yw_region` VALUES ('3073', '542123', '贡觉县', '320', '0', '0', 'Konjo Xian', 'KON');
INSERT INTO `yw_region` VALUES ('3074', '542124', '类乌齐县', '320', '0', '0', 'Riwoqe Xian', 'RIW');
INSERT INTO `yw_region` VALUES ('3075', '542125', '丁青县', '320', '0', '0', 'Dengqen Xian', 'DEN');
INSERT INTO `yw_region` VALUES ('3076', '542126', '察雅县', '320', '0', '0', 'Chagyab Xian', 'CHA');
INSERT INTO `yw_region` VALUES ('3077', '542127', '八宿县', '320', '0', '0', 'Baxoi Xian', 'BAX');
INSERT INTO `yw_region` VALUES ('3078', '542128', '左贡县', '320', '0', '0', 'Zogang Xian', 'ZOX');
INSERT INTO `yw_region` VALUES ('3079', '542129', '芒康县', '320', '0', '0', 'Mangkam Xian', 'MAN');
INSERT INTO `yw_region` VALUES ('3080', '542132', '洛隆县', '320', '0', '0', 'Lhorong Xian', 'LHO');
INSERT INTO `yw_region` VALUES ('3081', '542133', '边坝县', '320', '0', '0', 'Banbar Xian', 'BAN');
INSERT INTO `yw_region` VALUES ('3082', '542221', '乃东县', '321', '0', '0', 'Nedong Xian', 'NED');
INSERT INTO `yw_region` VALUES ('3083', '542222', '扎囊县', '321', '0', '0', 'Chanang(Chatang) Xian', 'CNG');
INSERT INTO `yw_region` VALUES ('3084', '542223', '贡嘎县', '321', '0', '0', 'Gonggar Xian', 'GON');
INSERT INTO `yw_region` VALUES ('3085', '542224', '桑日县', '321', '0', '0', 'Sangri Xian', 'SRI');
INSERT INTO `yw_region` VALUES ('3086', '542225', '琼结县', '321', '0', '0', 'Qonggyai Xian', 'QON');
INSERT INTO `yw_region` VALUES ('3087', '542226', '曲松县', '321', '0', '0', 'Qusum Xian', 'QUS');
INSERT INTO `yw_region` VALUES ('3088', '542227', '措美县', '321', '0', '0', 'Comai Xian', 'COM');
INSERT INTO `yw_region` VALUES ('3089', '542228', '洛扎县', '321', '0', '0', 'Lhozhag Xian', 'LHX');
INSERT INTO `yw_region` VALUES ('3090', '542229', '加查县', '321', '0', '0', 'Gyaca Xian', 'GYA');
INSERT INTO `yw_region` VALUES ('3091', '542231', '隆子县', '321', '0', '0', 'Lhvnze Xian', 'LHZ');
INSERT INTO `yw_region` VALUES ('3092', '542232', '错那县', '321', '0', '0', 'Cona Xian', 'CON');
INSERT INTO `yw_region` VALUES ('3093', '542233', '浪卡子县', '321', '0', '0', 'Nagarze Xian', 'NAX');
INSERT INTO `yw_region` VALUES ('3094', '542301', '日喀则市', '322', '0', '0', 'Xigaze Shi', 'XIG');
INSERT INTO `yw_region` VALUES ('3095', '542322', '南木林县', '322', '0', '0', 'Namling Xian', 'NAM');
INSERT INTO `yw_region` VALUES ('3096', '542323', '江孜县', '322', '0', '0', 'Gyangze Xian', 'GYZ');
INSERT INTO `yw_region` VALUES ('3097', '542324', '定日县', '322', '0', '0', 'Tingri Xian', 'TIN');
INSERT INTO `yw_region` VALUES ('3098', '542325', '萨迦县', '322', '0', '0', 'Sa,gya Xian', 'SGX');
INSERT INTO `yw_region` VALUES ('3099', '542326', '拉孜县', '322', '0', '0', 'Lhaze Xian', 'LAZ');
INSERT INTO `yw_region` VALUES ('3100', '542327', '昂仁县', '322', '0', '0', 'Ngamring Xian', 'NGA');
INSERT INTO `yw_region` VALUES ('3101', '542328', '谢通门县', '322', '0', '0', 'Xaitongmoin Xian', 'XTM');
INSERT INTO `yw_region` VALUES ('3102', '542329', '白朗县', '322', '0', '0', 'Bainang Xian', 'BAI');
INSERT INTO `yw_region` VALUES ('3103', '542330', '仁布县', '322', '0', '0', 'Rinbung Xian', 'RIN');
INSERT INTO `yw_region` VALUES ('3104', '542331', '康马县', '322', '0', '0', 'Kangmar Xian', 'KAN');
INSERT INTO `yw_region` VALUES ('3105', '542332', '定结县', '322', '0', '0', 'Dinggye Xian', 'DIN');
INSERT INTO `yw_region` VALUES ('3106', '542333', '仲巴县', '322', '0', '0', 'Zhongba Xian', 'ZHB');
INSERT INTO `yw_region` VALUES ('3107', '542334', '亚东县', '322', '0', '0', 'Yadong(Chomo) Xian', 'YDZ');
INSERT INTO `yw_region` VALUES ('3108', '542335', '吉隆县', '322', '0', '0', 'Gyirong Xian', 'GIR');
INSERT INTO `yw_region` VALUES ('3109', '542336', '聂拉木县', '322', '0', '0', 'Nyalam Xian', 'NYA');
INSERT INTO `yw_region` VALUES ('3110', '542337', '萨嘎县', '322', '0', '0', 'Saga Xian', 'SAG');
INSERT INTO `yw_region` VALUES ('3111', '542338', '岗巴县', '322', '0', '0', 'Gamba Xian', 'GAM');
INSERT INTO `yw_region` VALUES ('3112', '542421', '那曲县', '323', '0', '0', 'Nagqu Xian', 'NAG');
INSERT INTO `yw_region` VALUES ('3113', '542422', '嘉黎县', '323', '0', '0', 'Lhari Xian', 'LHR');
INSERT INTO `yw_region` VALUES ('3114', '542423', '比如县', '323', '0', '0', 'Biru Xian', 'BRU');
INSERT INTO `yw_region` VALUES ('3115', '542424', '聂荣县', '323', '0', '0', 'Nyainrong Xian', 'NRO');
INSERT INTO `yw_region` VALUES ('3116', '542425', '安多县', '323', '0', '0', 'Amdo Xian', 'AMD');
INSERT INTO `yw_region` VALUES ('3117', '542426', '申扎县', '323', '0', '0', 'Xainza Xian', 'XZX');
INSERT INTO `yw_region` VALUES ('3118', '542427', '索县', '323', '0', '0', 'Sog Xian', 'SOG');
INSERT INTO `yw_region` VALUES ('3119', '542428', '班戈县', '323', '0', '0', 'Bangoin Xian', 'BGX');
INSERT INTO `yw_region` VALUES ('3120', '542429', '巴青县', '323', '0', '0', 'Baqen Xian', 'BQE');
INSERT INTO `yw_region` VALUES ('3121', '542430', '尼玛县', '323', '0', '0', 'Nyima Xian', 'NYX');
INSERT INTO `yw_region` VALUES ('3122', '542521', '普兰县', '324', '0', '0', 'Burang Xian', 'BUR');
INSERT INTO `yw_region` VALUES ('3123', '542522', '札达县', '324', '0', '0', 'Zanda Xian', 'ZAN');
INSERT INTO `yw_region` VALUES ('3124', '542523', '噶尔县', '324', '0', '0', 'Gar Xian', 'GAR');
INSERT INTO `yw_region` VALUES ('3125', '542524', '日土县', '324', '0', '0', 'Rutog Xian', 'RUT');
INSERT INTO `yw_region` VALUES ('3126', '542525', '革吉县', '324', '0', '0', 'Ge,gyai Xian', 'GEG');
INSERT INTO `yw_region` VALUES ('3127', '542526', '改则县', '324', '0', '0', 'Gerze Xian', 'GER');
INSERT INTO `yw_region` VALUES ('3128', '542527', '措勤县', '324', '0', '0', 'Coqen Xian', 'COQ');
INSERT INTO `yw_region` VALUES ('3129', '542621', '林芝县', '325', '0', '0', 'Nyingchi Xian', 'NYI');
INSERT INTO `yw_region` VALUES ('3130', '542622', '工布江达县', '325', '0', '0', 'Gongbo,gyamda Xian', 'GOX');
INSERT INTO `yw_region` VALUES ('3131', '542623', '米林县', '325', '0', '0', 'Mainling Xian', 'MAX');
INSERT INTO `yw_region` VALUES ('3132', '542624', '墨脱县', '325', '0', '0', 'Metog Xian', 'MET');
INSERT INTO `yw_region` VALUES ('3133', '542625', '波密县', '325', '0', '0', 'Bomi(Bowo) Xian', 'BMI');
INSERT INTO `yw_region` VALUES ('3134', '542626', '察隅县', '325', '0', '0', 'Zayv Xian', 'ZAY');
INSERT INTO `yw_region` VALUES ('3135', '542627', '朗县', '325', '0', '0', 'Nang Xian', 'NGX');
INSERT INTO `yw_region` VALUES ('3136', '610101', '市辖区', '326', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('3137', '610102', '新城区', '326', '0', '0', 'Xincheng Qu', 'XCK');
INSERT INTO `yw_region` VALUES ('3138', '610103', '碑林区', '326', '0', '0', 'Beilin Qu', 'BLQ');
INSERT INTO `yw_region` VALUES ('3139', '610104', '莲湖区', '326', '0', '0', 'Lianhu Qu', 'LHU');
INSERT INTO `yw_region` VALUES ('3140', '610111', '灞桥区', '326', '0', '0', 'Baqiao Qu', 'BQQ');
INSERT INTO `yw_region` VALUES ('3141', '610112', '未央区', '326', '0', '0', 'Weiyang Qu', '2');
INSERT INTO `yw_region` VALUES ('3142', '610113', '雁塔区', '326', '0', '0', 'Yanta Qu', 'YTA');
INSERT INTO `yw_region` VALUES ('3143', '610114', '阎良区', '326', '0', '0', 'Yanliang Qu', 'YLQ');
INSERT INTO `yw_region` VALUES ('3144', '610115', '临潼区', '326', '0', '0', 'Lintong Qu', 'LTG');
INSERT INTO `yw_region` VALUES ('3145', '610116', '长安区', '326', '0', '0', 'Changan Qu', '2');
INSERT INTO `yw_region` VALUES ('3146', '610122', '蓝田县', '326', '0', '0', 'Lantian Xian', 'LNT');
INSERT INTO `yw_region` VALUES ('3147', '610124', '周至县', '326', '0', '0', 'Zhouzhi Xian', 'ZOZ');
INSERT INTO `yw_region` VALUES ('3148', '610125', '户县', '326', '0', '0', 'Hu Xian', 'HUX');
INSERT INTO `yw_region` VALUES ('3149', '610126', '高陵县', '326', '0', '0', 'Gaoling Xian', 'GLS');
INSERT INTO `yw_region` VALUES ('3150', '610201', '市辖区', '327', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('3151', '610202', '王益区', '327', '0', '0', 'Wangyi Qu', '2');
INSERT INTO `yw_region` VALUES ('3152', '610203', '印台区', '327', '0', '0', 'Yintai Qu', '2');
INSERT INTO `yw_region` VALUES ('3153', '610204', '耀州区', '327', '0', '0', 'Yaozhou Qu', '2');
INSERT INTO `yw_region` VALUES ('3154', '610222', '宜君县', '327', '0', '0', 'Yijun Xian', 'YJU');
INSERT INTO `yw_region` VALUES ('3155', '610301', '市辖区', '328', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('3156', '610302', '渭滨区', '328', '0', '0', 'Weibin Qu', 'WBQ');
INSERT INTO `yw_region` VALUES ('3157', '610303', '金台区', '328', '0', '0', 'Jintai Qu', 'JTQ');
INSERT INTO `yw_region` VALUES ('3158', '610304', '陈仓区', '328', '0', '0', 'Chencang Qu', '2');
INSERT INTO `yw_region` VALUES ('3159', '610322', '凤翔县', '328', '0', '0', 'Fengxiang Xian', 'FXG');
INSERT INTO `yw_region` VALUES ('3160', '610323', '岐山县', '328', '0', '0', 'Qishan Xian', 'QIS');
INSERT INTO `yw_region` VALUES ('3161', '610324', '扶风县', '328', '0', '0', 'Fufeng Xian', 'FFG');
INSERT INTO `yw_region` VALUES ('3162', '610326', '眉县', '328', '0', '0', 'Mei Xian', 'MEI');
INSERT INTO `yw_region` VALUES ('3163', '610327', '陇县', '328', '0', '0', 'Long Xian', 'LON');
INSERT INTO `yw_region` VALUES ('3164', '610328', '千阳县', '328', '0', '0', 'Qianyang Xian', 'QNY');
INSERT INTO `yw_region` VALUES ('3165', '610329', '麟游县', '328', '0', '0', 'Linyou Xian', 'LYP');
INSERT INTO `yw_region` VALUES ('3166', '610330', '凤县', '328', '0', '0', 'Feng Xian', 'FEG');
INSERT INTO `yw_region` VALUES ('3167', '610331', '太白县', '328', '0', '0', 'Taibai Xian', 'TBA');
INSERT INTO `yw_region` VALUES ('3168', '610401', '市辖区', '329', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('3169', '610402', '秦都区', '329', '0', '0', 'Qindu Qu', 'QDU');
INSERT INTO `yw_region` VALUES ('3170', '610403', '杨陵区', '329', '0', '0', 'Yangling Qu', 'YGL');
INSERT INTO `yw_region` VALUES ('3171', '610404', '渭城区', '329', '0', '0', 'Weicheng Qu', 'WIC');
INSERT INTO `yw_region` VALUES ('3172', '610422', '三原县', '329', '0', '0', 'Sanyuan Xian', 'SYN');
INSERT INTO `yw_region` VALUES ('3173', '610423', '泾阳县', '329', '0', '0', 'Jingyang Xian', 'JGY');
INSERT INTO `yw_region` VALUES ('3174', '610424', '乾县', '329', '0', '0', 'Qian Xian', 'QIA');
INSERT INTO `yw_region` VALUES ('3175', '610425', '礼泉县', '329', '0', '0', 'Liquan Xian', 'LIQ');
INSERT INTO `yw_region` VALUES ('3176', '610426', '永寿县', '329', '0', '0', 'Yongshou Xian', 'YSH');
INSERT INTO `yw_region` VALUES ('3177', '610427', '彬县', '329', '0', '0', 'Bin Xian', 'BIX');
INSERT INTO `yw_region` VALUES ('3178', '610428', '长武县', '329', '0', '0', 'Changwu Xian', 'CWU');
INSERT INTO `yw_region` VALUES ('3179', '610429', '旬邑县', '329', '0', '0', 'Xunyi Xian', 'XNY');
INSERT INTO `yw_region` VALUES ('3180', '610430', '淳化县', '329', '0', '0', 'Chunhua Xian', 'CHU');
INSERT INTO `yw_region` VALUES ('3181', '610431', '武功县', '329', '0', '0', 'Wugong Xian', 'WGG');
INSERT INTO `yw_region` VALUES ('3182', '610481', '兴平市', '329', '0', '0', 'Xingping Shi', 'XPG');
INSERT INTO `yw_region` VALUES ('3183', '610501', '市辖区', '330', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('3184', '610502', '临渭区', '330', '0', '0', 'Linwei Qu', 'LWE');
INSERT INTO `yw_region` VALUES ('3185', '610521', '华县', '330', '0', '0', 'Hua Xian', 'HXN');
INSERT INTO `yw_region` VALUES ('3186', '610522', '潼关县', '330', '0', '0', 'Tongguan Xian', 'TGN');
INSERT INTO `yw_region` VALUES ('3187', '610523', '大荔县', '330', '0', '0', 'Dali Xian', 'DAL');
INSERT INTO `yw_region` VALUES ('3188', '610524', '合阳县', '330', '0', '0', 'Heyang Xian', 'HYK');
INSERT INTO `yw_region` VALUES ('3189', '610525', '澄城县', '330', '0', '0', 'Chengcheng Xian', 'CCG');
INSERT INTO `yw_region` VALUES ('3190', '610526', '蒲城县', '330', '0', '0', 'Pucheng Xian', 'PUC');
INSERT INTO `yw_region` VALUES ('3191', '610527', '白水县', '330', '0', '0', 'Baishui Xian', 'BSU');
INSERT INTO `yw_region` VALUES ('3192', '610528', '富平县', '330', '0', '0', 'Fuping Xian', 'FPX');
INSERT INTO `yw_region` VALUES ('3193', '610581', '韩城市', '330', '0', '0', 'Hancheng Shi', 'HCE');
INSERT INTO `yw_region` VALUES ('3194', '610582', '华阴市', '330', '0', '0', 'Huayin Shi', 'HYI');
INSERT INTO `yw_region` VALUES ('3195', '610601', '市辖区', '331', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('3196', '610602', '宝塔区', '331', '0', '0', 'Baota Qu', 'BTA');
INSERT INTO `yw_region` VALUES ('3197', '610621', '延长县', '331', '0', '0', 'Yanchang Xian', 'YCA');
INSERT INTO `yw_region` VALUES ('3198', '610622', '延川县', '331', '0', '0', 'Yanchuan Xian', 'YCT');
INSERT INTO `yw_region` VALUES ('3199', '610623', '子长县', '331', '0', '0', 'Zichang Xian', 'ZCA');
INSERT INTO `yw_region` VALUES ('3200', '610624', '安塞县', '331', '0', '0', 'Ansai Xian', 'ANS');
INSERT INTO `yw_region` VALUES ('3201', '610625', '志丹县', '331', '0', '0', 'Zhidan Xian', 'ZDN');
INSERT INTO `yw_region` VALUES ('3202', '610626', '吴起县', '331', '0', '0', 'Wuqi Xian', '2');
INSERT INTO `yw_region` VALUES ('3203', '610627', '甘泉县', '331', '0', '0', 'Ganquan Xian', 'GQN');
INSERT INTO `yw_region` VALUES ('3204', '610628', '富县', '331', '0', '0', 'Fu Xian', 'FUX');
INSERT INTO `yw_region` VALUES ('3205', '610629', '洛川县', '331', '0', '0', 'Luochuan Xian', 'LCW');
INSERT INTO `yw_region` VALUES ('3206', '610630', '宜川县', '331', '0', '0', 'Yichuan Xian', 'YIC');
INSERT INTO `yw_region` VALUES ('3207', '610631', '黄龙县', '331', '0', '0', 'Huanglong Xian', 'HGL');
INSERT INTO `yw_region` VALUES ('3208', '610632', '黄陵县', '331', '0', '0', 'Huangling Xian', 'HLG');
INSERT INTO `yw_region` VALUES ('3209', '610701', '市辖区', '332', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('3210', '610702', '汉台区', '332', '0', '0', 'Hantai Qu', 'HTQ');
INSERT INTO `yw_region` VALUES ('3211', '610721', '南郑县', '332', '0', '0', 'Nanzheng Xian', 'NZG');
INSERT INTO `yw_region` VALUES ('3212', '610722', '城固县', '332', '0', '0', 'Chenggu Xian', 'CGU');
INSERT INTO `yw_region` VALUES ('3213', '610723', '洋县', '332', '0', '0', 'Yang Xian', 'YGX');
INSERT INTO `yw_region` VALUES ('3214', '610724', '西乡县', '332', '0', '0', 'Xixiang Xian', 'XXA');
INSERT INTO `yw_region` VALUES ('3215', '610725', '勉县', '332', '0', '0', 'Mian Xian', 'MIA');
INSERT INTO `yw_region` VALUES ('3216', '610726', '宁强县', '332', '0', '0', 'Ningqiang Xian', 'NQG');
INSERT INTO `yw_region` VALUES ('3217', '610727', '略阳县', '332', '0', '0', 'Lueyang Xian', 'LYC');
INSERT INTO `yw_region` VALUES ('3218', '610728', '镇巴县', '332', '0', '0', 'Zhenba Xian', 'ZBA');
INSERT INTO `yw_region` VALUES ('3219', '610729', '留坝县', '332', '0', '0', 'Liuba Xian', 'LBA');
INSERT INTO `yw_region` VALUES ('3220', '610730', '佛坪县', '332', '0', '0', 'Foping Xian', 'FPG');
INSERT INTO `yw_region` VALUES ('3221', '610801', '市辖区', '333', '0', '0', '1', '2');
INSERT INTO `yw_region` VALUES ('3222', '610802', '榆阳区', '333', '0', '0', 'Yuyang Qu', '2');
INSERT INTO `yw_region` VALUES ('3223', '610821', '神木县', '333', '0', '0', 'Shenmu Xian', '2');
INSERT INTO `yw_region` VALUES ('3224', '610822', '府谷县', '333', '0', '0', 'Fugu Xian', '2');
INSERT INTO `yw_region` VALUES ('3225', '610823', '横山县', '333', '0', '0', 'Hengshan Xian', '2');
INSERT INTO `yw_region` VALUES ('3226', '610824', '靖边县', '333', '0', '0', 'Jingbian Xian', '2');
INSERT INTO `yw_region` VALUES ('3227', '610825', '定边县', '333', '0', '0', 'Dingbian Xian', '2');
INSERT INTO `yw_region` VALUES ('3228', '610826', '绥德县', '333', '0', '0', 'Suide Xian', '2');
INSERT INTO `yw_region` VALUES ('3229', '610827', '米脂县', '333', '0', '0', 'Mizhi Xian', '2');
INSERT INTO `yw_region` VALUES ('3230', '610828', '佳县', '333', '0', '0', 'Jia Xian', '2');
INSERT INTO `yw_region` VALUES ('3231', '610829', '吴堡县', '333', '0', '0', 'Wubu Xian', '2');
INSERT INTO `yw_region` VALUES ('3232', '610830', '清涧县', '333', '0', '0', 'Qingjian Xian', '2');
INSERT INTO `yw_region` VALUES ('3233', '610831', '子洲县', '333', '0', '0', 'Zizhou Xian', '2');
INSERT INTO `yw_region` VALUES ('3234', '610901', '市辖区', '334', '0', '0', '1', '2');
INSERT INTO `yw_region` VALUES ('3235', '610902', '汉滨区', '334', '0', '0', 'Hanbin Qu', '2');
INSERT INTO `yw_region` VALUES ('3236', '610921', '汉阴县', '334', '0', '0', 'Hanyin Xian', '2');
INSERT INTO `yw_region` VALUES ('3237', '610922', '石泉县', '334', '0', '0', 'Shiquan Xian', '2');
INSERT INTO `yw_region` VALUES ('3238', '610923', '宁陕县', '334', '0', '0', 'Ningshan Xian', '2');
INSERT INTO `yw_region` VALUES ('3239', '610924', '紫阳县', '334', '0', '0', 'Ziyang Xian', '2');
INSERT INTO `yw_region` VALUES ('3240', '610925', '岚皋县', '334', '0', '0', 'Langao Xian', '2');
INSERT INTO `yw_region` VALUES ('3241', '610926', '平利县', '334', '0', '0', 'Pingli Xian', '2');
INSERT INTO `yw_region` VALUES ('3242', '610927', '镇坪县', '334', '0', '0', 'Zhenping Xian', '2');
INSERT INTO `yw_region` VALUES ('3243', '610928', '旬阳县', '334', '0', '0', 'Xunyang Xian', '2');
INSERT INTO `yw_region` VALUES ('3244', '610929', '白河县', '334', '0', '0', 'Baihe Xian', '2');
INSERT INTO `yw_region` VALUES ('3245', '611001', '市辖区', '335', '0', '0', '1', '2');
INSERT INTO `yw_region` VALUES ('3246', '611002', '商州区', '335', '0', '0', 'Shangzhou Qu', '2');
INSERT INTO `yw_region` VALUES ('3247', '611021', '洛南县', '335', '0', '0', 'Luonan Xian', '2');
INSERT INTO `yw_region` VALUES ('3248', '611022', '丹凤县', '335', '0', '0', 'Danfeng Xian', '2');
INSERT INTO `yw_region` VALUES ('3249', '611023', '商南县', '335', '0', '0', 'Shangnan Xian', '2');
INSERT INTO `yw_region` VALUES ('3250', '611024', '山阳县', '335', '0', '0', 'Shanyang Xian', '2');
INSERT INTO `yw_region` VALUES ('3251', '611025', '镇安县', '335', '0', '0', 'Zhen,an Xian', '2');
INSERT INTO `yw_region` VALUES ('3252', '611026', '柞水县', '335', '0', '0', 'Zhashui Xian', '2');
INSERT INTO `yw_region` VALUES ('3253', '620101', '市辖区', '336', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('3254', '620102', '城关区', '336', '0', '0', 'Chengguan Qu', 'CLZ');
INSERT INTO `yw_region` VALUES ('3255', '620103', '七里河区', '336', '0', '0', 'Qilihe Qu', 'QLH');
INSERT INTO `yw_region` VALUES ('3256', '620104', '西固区', '336', '0', '0', 'Xigu Qu', 'XGU');
INSERT INTO `yw_region` VALUES ('3257', '620105', '安宁区', '336', '0', '0', 'Anning Qu', 'ANQ');
INSERT INTO `yw_region` VALUES ('3258', '620111', '红古区', '336', '0', '0', 'Honggu Qu', 'HOG');
INSERT INTO `yw_region` VALUES ('3259', '620121', '永登县', '336', '0', '0', 'Yongdeng Xian', 'YDG');
INSERT INTO `yw_region` VALUES ('3260', '620122', '皋兰县', '336', '0', '0', 'Gaolan Xian', 'GAL');
INSERT INTO `yw_region` VALUES ('3261', '620123', '榆中县', '336', '0', '0', 'Yuzhong Xian', 'YZX');
INSERT INTO `yw_region` VALUES ('3262', '620201', '市辖区', '337', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('3263', '620301', '市辖区', '338', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('3264', '620302', '金川区', '338', '0', '0', 'Jinchuan Qu', 'JCU');
INSERT INTO `yw_region` VALUES ('3265', '620321', '永昌县', '338', '0', '0', 'Yongchang Xian', 'YCF');
INSERT INTO `yw_region` VALUES ('3266', '620401', '市辖区', '339', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('3267', '620402', '白银区', '339', '0', '0', 'Baiyin Qu', 'BYB');
INSERT INTO `yw_region` VALUES ('3268', '620403', '平川区', '339', '0', '0', 'Pingchuan Qu', 'PCQ');
INSERT INTO `yw_region` VALUES ('3269', '620421', '靖远县', '339', '0', '0', 'Jingyuan Xian', 'JYH');
INSERT INTO `yw_region` VALUES ('3270', '620422', '会宁县', '339', '0', '0', 'Huining xian', 'HNI');
INSERT INTO `yw_region` VALUES ('3271', '620423', '景泰县', '339', '0', '0', 'Jingtai Xian', 'JGT');
INSERT INTO `yw_region` VALUES ('3272', '620501', '市辖区', '340', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('3274', '620502', '秦州区', '340', '0', '0', 'Beidao Qu', '2');
INSERT INTO `yw_region` VALUES ('3275', '620521', '清水县', '340', '0', '0', 'Qingshui Xian', 'QSG');
INSERT INTO `yw_region` VALUES ('3276', '620522', '秦安县', '340', '0', '0', 'Qin,an Xian', 'QNA');
INSERT INTO `yw_region` VALUES ('3277', '620523', '甘谷县', '340', '0', '0', 'Gangu Xian', 'GGU');
INSERT INTO `yw_region` VALUES ('3278', '620524', '武山县', '340', '0', '0', 'Wushan Xian', 'WSX');
INSERT INTO `yw_region` VALUES ('3279', '620525', '张家川回族自治县', '340', '0', '0', 'Zhangjiachuan Huizu Zizhixian', 'ZJC');
INSERT INTO `yw_region` VALUES ('3280', '620601', '市辖区', '341', '0', '0', '1', '2');
INSERT INTO `yw_region` VALUES ('3281', '620602', '凉州区', '341', '0', '0', 'Liangzhou Qu', '2');
INSERT INTO `yw_region` VALUES ('3282', '620621', '民勤县', '341', '0', '0', 'Minqin Xian', '2');
INSERT INTO `yw_region` VALUES ('3283', '620622', '古浪县', '341', '0', '0', 'Gulang Xian', '2');
INSERT INTO `yw_region` VALUES ('3284', '620623', '天祝藏族自治县', '341', '0', '0', 'Tianzhu Zangzu Zizhixian', '2');
INSERT INTO `yw_region` VALUES ('3285', '620701', '市辖区', '342', '0', '0', '1', '2');
INSERT INTO `yw_region` VALUES ('3286', '620702', '甘州区', '342', '0', '0', 'Ganzhou Qu', '2');
INSERT INTO `yw_region` VALUES ('3287', '620721', '肃南裕固族自治县', '342', '0', '0', 'Sunan Yugurzu Zizhixian', '2');
INSERT INTO `yw_region` VALUES ('3288', '620722', '民乐县', '342', '0', '0', 'Minle Xian', '2');
INSERT INTO `yw_region` VALUES ('3289', '620723', '临泽县', '342', '0', '0', 'Linze Xian', '2');
INSERT INTO `yw_region` VALUES ('3290', '620724', '高台县', '342', '0', '0', 'Gaotai Xian', '2');
INSERT INTO `yw_region` VALUES ('3291', '620725', '山丹县', '342', '0', '0', 'Shandan Xian', '2');
INSERT INTO `yw_region` VALUES ('3292', '620801', '市辖区', '343', '0', '0', '1', '2');
INSERT INTO `yw_region` VALUES ('3293', '620802', '崆峒区', '343', '0', '0', 'Kongdong Qu', '2');
INSERT INTO `yw_region` VALUES ('3294', '620821', '泾川县', '343', '0', '0', 'Jingchuan Xian', '2');
INSERT INTO `yw_region` VALUES ('3295', '620822', '灵台县', '343', '0', '0', 'Lingtai Xian', '2');
INSERT INTO `yw_region` VALUES ('3296', '620823', '崇信县', '343', '0', '0', 'Chongxin Xian', '2');
INSERT INTO `yw_region` VALUES ('3297', '620824', '华亭县', '343', '0', '0', 'Huating Xian', '2');
INSERT INTO `yw_region` VALUES ('3298', '620825', '庄浪县', '343', '0', '0', 'Zhuanglang Xian', '2');
INSERT INTO `yw_region` VALUES ('3299', '620826', '静宁县', '343', '0', '0', 'Jingning Xian', '2');
INSERT INTO `yw_region` VALUES ('3300', '620901', '市辖区', '344', '0', '0', '1', '2');
INSERT INTO `yw_region` VALUES ('3301', '620902', '肃州区', '344', '0', '0', 'Suzhou Qu', '2');
INSERT INTO `yw_region` VALUES ('3302', '620921', '金塔县', '344', '0', '0', 'Jinta Xian', '2');
INSERT INTO `yw_region` VALUES ('3304', '620923', '肃北蒙古族自治县', '344', '0', '0', 'Subei Monguzu Zizhixian', '2');
INSERT INTO `yw_region` VALUES ('3305', '620924', '阿克塞哈萨克族自治县', '344', '0', '0', 'Aksay Kazakzu Zizhixian', '2');
INSERT INTO `yw_region` VALUES ('3306', '620981', '玉门市', '344', '0', '0', 'Yumen Shi', '2');
INSERT INTO `yw_region` VALUES ('3307', '620982', '敦煌市', '344', '0', '0', 'Dunhuang Shi', '2');
INSERT INTO `yw_region` VALUES ('3308', '621001', '市辖区', '345', '0', '0', '1', '2');
INSERT INTO `yw_region` VALUES ('3309', '621002', '西峰区', '345', '0', '0', 'Xifeng Qu', '2');
INSERT INTO `yw_region` VALUES ('3310', '621021', '庆城县', '345', '0', '0', 'Qingcheng Xian', '2');
INSERT INTO `yw_region` VALUES ('3311', '621022', '环县', '345', '0', '0', 'Huan Xian', '2');
INSERT INTO `yw_region` VALUES ('3312', '621023', '华池县', '345', '0', '0', 'Huachi Xian', '2');
INSERT INTO `yw_region` VALUES ('3313', '621024', '合水县', '345', '0', '0', 'Heshui Xian', '2');
INSERT INTO `yw_region` VALUES ('3314', '621025', '正宁县', '345', '0', '0', 'Zhengning Xian', '2');
INSERT INTO `yw_region` VALUES ('3315', '621026', '宁县', '345', '0', '0', 'Ning Xian', '2');
INSERT INTO `yw_region` VALUES ('3316', '621027', '镇原县', '345', '0', '0', 'Zhenyuan Xian', '2');
INSERT INTO `yw_region` VALUES ('3317', '621101', '市辖区', '346', '0', '0', '1', '2');
INSERT INTO `yw_region` VALUES ('3318', '621102', '安定区', '346', '0', '0', 'Anding Qu', '2');
INSERT INTO `yw_region` VALUES ('3319', '621121', '通渭县', '346', '0', '0', 'Tongwei Xian', '2');
INSERT INTO `yw_region` VALUES ('3320', '621122', '陇西县', '346', '0', '0', 'Longxi Xian', '2');
INSERT INTO `yw_region` VALUES ('3321', '621123', '渭源县', '346', '0', '0', 'Weiyuan Xian', '2');
INSERT INTO `yw_region` VALUES ('3322', '621124', '临洮县', '346', '0', '0', 'Lintao Xian', '2');
INSERT INTO `yw_region` VALUES ('3323', '621125', '漳县', '346', '0', '0', 'Zhang Xian', '2');
INSERT INTO `yw_region` VALUES ('3324', '621126', '岷县', '346', '0', '0', 'Min Xian', '2');
INSERT INTO `yw_region` VALUES ('3325', '621201', '市辖区', '347', '0', '0', '1', '2');
INSERT INTO `yw_region` VALUES ('3326', '621202', '武都区', '347', '0', '0', 'Wudu Qu', '2');
INSERT INTO `yw_region` VALUES ('3327', '621221', '成县', '347', '0', '0', 'Cheng Xian', '2');
INSERT INTO `yw_region` VALUES ('3328', '621222', '文县', '347', '0', '0', 'Wen Xian', '2');
INSERT INTO `yw_region` VALUES ('3329', '621223', '宕昌县', '347', '0', '0', 'Dangchang Xian', '2');
INSERT INTO `yw_region` VALUES ('3330', '621224', '康县', '347', '0', '0', 'Kang Xian', '2');
INSERT INTO `yw_region` VALUES ('3331', '621225', '西和县', '347', '0', '0', 'Xihe Xian', '2');
INSERT INTO `yw_region` VALUES ('3332', '621226', '礼县', '347', '0', '0', 'Li Xian', '2');
INSERT INTO `yw_region` VALUES ('3333', '621227', '徽县', '347', '0', '0', 'Hui Xian', '2');
INSERT INTO `yw_region` VALUES ('3334', '621228', '两当县', '347', '0', '0', 'Liangdang Xian', '2');
INSERT INTO `yw_region` VALUES ('3335', '622901', '临夏市', '348', '0', '0', 'Linxia Shi', 'LXR');
INSERT INTO `yw_region` VALUES ('3336', '622921', '临夏县', '348', '0', '0', 'Linxia Xian', 'LXF');
INSERT INTO `yw_region` VALUES ('3337', '622922', '康乐县', '348', '0', '0', 'Kangle Xian', 'KLE');
INSERT INTO `yw_region` VALUES ('3338', '622923', '永靖县', '348', '0', '0', 'Yongjing Xian', 'YJG');
INSERT INTO `yw_region` VALUES ('3339', '622924', '广河县', '348', '0', '0', 'Guanghe Xian', 'GHX');
INSERT INTO `yw_region` VALUES ('3340', '622925', '和政县', '348', '0', '0', 'Hezheng Xian', 'HZG');
INSERT INTO `yw_region` VALUES ('3341', '622926', '东乡族自治县', '348', '0', '0', 'Dongxiangzu Zizhixian', 'DXZ');
INSERT INTO `yw_region` VALUES ('3342', '622927', '积石山保安族东乡族撒拉族自治县', '348', '0', '0', 'Jishishan Bonanzu Dongxiangzu Salarzu Zizhixian', 'JSN');
INSERT INTO `yw_region` VALUES ('3343', '623001', '合作市', '349', '0', '0', 'Hezuo Shi', 'HEZ');
INSERT INTO `yw_region` VALUES ('3344', '623021', '临潭县', '349', '0', '0', 'Lintan Xian', 'LTN');
INSERT INTO `yw_region` VALUES ('3345', '623022', '卓尼县', '349', '0', '0', 'Jone', 'JON');
INSERT INTO `yw_region` VALUES ('3346', '623023', '舟曲县', '349', '0', '0', 'Zhugqu Xian', 'ZQU');
INSERT INTO `yw_region` VALUES ('3347', '623024', '迭部县', '349', '0', '0', 'Tewo Xian', 'TEW');
INSERT INTO `yw_region` VALUES ('3348', '623025', '玛曲县', '349', '0', '0', 'Maqu Xian', 'MQU');
INSERT INTO `yw_region` VALUES ('3349', '623026', '碌曲县', '349', '0', '0', 'Luqu Xian', 'LQU');
INSERT INTO `yw_region` VALUES ('3350', '623027', '夏河县', '349', '0', '0', 'Xiahe Xian', 'XHN');
INSERT INTO `yw_region` VALUES ('3351', '630101', '市辖区', '350', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('3352', '630102', '城东区', '350', '0', '0', 'Chengdong Qu', 'CDQ');
INSERT INTO `yw_region` VALUES ('3353', '630103', '城中区', '350', '0', '0', 'Chengzhong Qu', 'CZQ');
INSERT INTO `yw_region` VALUES ('3354', '630104', '城西区', '350', '0', '0', 'Chengxi Qu', 'CXQ');
INSERT INTO `yw_region` VALUES ('3355', '630105', '城北区', '350', '0', '0', 'Chengbei Qu', 'CBE');
INSERT INTO `yw_region` VALUES ('3356', '630121', '大通回族土族自治县', '350', '0', '0', 'Datong Huizu Tuzu Zizhixian', 'DAT');
INSERT INTO `yw_region` VALUES ('3357', '630122', '湟中县', '350', '0', '0', 'Huangzhong Xian', '2');
INSERT INTO `yw_region` VALUES ('3358', '630123', '湟源县', '350', '0', '0', 'Huangyuan Xian', '2');
INSERT INTO `yw_region` VALUES ('3359', '632121', '平安县', '351', '0', '0', 'Ping,an Xian', 'PAN');
INSERT INTO `yw_region` VALUES ('3360', '632122', '民和回族土族自治县', '351', '0', '0', 'Minhe Huizu Tuzu Zizhixian', 'MHE');
INSERT INTO `yw_region` VALUES ('3361', '632123', '乐都县', '351', '0', '0', 'Ledu Xian', 'LDU');
INSERT INTO `yw_region` VALUES ('3362', '632126', '互助土族自治县', '351', '0', '0', 'Huzhu Tuzu Zizhixian', 'HZT');
INSERT INTO `yw_region` VALUES ('3363', '632127', '化隆回族自治县', '351', '0', '0', 'Hualong Huizu Zizhixian', 'HLO');
INSERT INTO `yw_region` VALUES ('3364', '632128', '循化撒拉族自治县', '351', '0', '0', 'Xunhua Salazu Zizhixian', 'XUH');
INSERT INTO `yw_region` VALUES ('3365', '632221', '门源回族自治县', '352', '0', '0', 'Menyuan Huizu Zizhixian', 'MYU');
INSERT INTO `yw_region` VALUES ('3366', '632222', '祁连县', '352', '0', '0', 'Qilian Xian', 'QLN');
INSERT INTO `yw_region` VALUES ('3367', '632223', '海晏县', '352', '0', '0', 'Haiyan Xian', 'HIY');
INSERT INTO `yw_region` VALUES ('3368', '632224', '刚察县', '352', '0', '0', 'Gangca Xian', 'GAN');
INSERT INTO `yw_region` VALUES ('3369', '632321', '同仁县', '353', '0', '0', 'Tongren Xian', 'TRN');
INSERT INTO `yw_region` VALUES ('3370', '632322', '尖扎县', '353', '0', '0', 'Jainca Xian', 'JAI');
INSERT INTO `yw_region` VALUES ('3371', '632323', '泽库县', '353', '0', '0', 'Zekog Xian', 'ZEK');
INSERT INTO `yw_region` VALUES ('3372', '632324', '河南蒙古族自治县', '353', '0', '0', 'Henan Mongolzu Zizhixian', 'HNM');
INSERT INTO `yw_region` VALUES ('3373', '632521', '共和县', '354', '0', '0', 'Gonghe Xian', 'GHE');
INSERT INTO `yw_region` VALUES ('3374', '632522', '同德县', '354', '0', '0', 'Tongde Xian', 'TDX');
INSERT INTO `yw_region` VALUES ('3375', '632523', '贵德县', '354', '0', '0', 'Guide Xian', 'GID');
INSERT INTO `yw_region` VALUES ('3376', '632524', '兴海县', '354', '0', '0', 'Xinghai Xian', 'XHA');
INSERT INTO `yw_region` VALUES ('3377', '632525', '贵南县', '354', '0', '0', 'Guinan Xian', 'GNN');
INSERT INTO `yw_region` VALUES ('3378', '632621', '玛沁县', '355', '0', '0', 'Maqen Xian', 'MAQ');
INSERT INTO `yw_region` VALUES ('3379', '632622', '班玛县', '355', '0', '0', 'Baima Xian', 'BMX');
INSERT INTO `yw_region` VALUES ('3380', '632623', '甘德县', '355', '0', '0', 'Gade Xian', 'GAD');
INSERT INTO `yw_region` VALUES ('3381', '632624', '达日县', '355', '0', '0', 'Tarlag Xian', 'TAR');
INSERT INTO `yw_region` VALUES ('3382', '632625', '久治县', '355', '0', '0', 'Jigzhi Xian', 'JUZ');
INSERT INTO `yw_region` VALUES ('3383', '632626', '玛多县', '355', '0', '0', 'Madoi Xian', 'MAD');
INSERT INTO `yw_region` VALUES ('3384', '632721', '玉树县', '356', '0', '0', 'Yushu Xian', 'YSK');
INSERT INTO `yw_region` VALUES ('3385', '632722', '杂多县', '356', '0', '0', 'Zadoi Xian', 'ZAD');
INSERT INTO `yw_region` VALUES ('3386', '632723', '称多县', '356', '0', '0', 'Chindu Xian', 'CHI');
INSERT INTO `yw_region` VALUES ('3387', '632724', '治多县', '356', '0', '0', 'Zhidoi Xian', 'ZHI');
INSERT INTO `yw_region` VALUES ('3388', '632725', '囊谦县', '356', '0', '0', 'Nangqen Xian', 'NQN');
INSERT INTO `yw_region` VALUES ('3389', '632726', '曲麻莱县', '356', '0', '0', 'Qumarleb Xian', 'QUM');
INSERT INTO `yw_region` VALUES ('3390', '632801', '格尔木市', '357', '0', '0', 'Golmud Shi', 'GOS');
INSERT INTO `yw_region` VALUES ('3391', '632802', '德令哈市', '357', '0', '0', 'Delhi Shi', 'DEL');
INSERT INTO `yw_region` VALUES ('3392', '632821', '乌兰县', '357', '0', '0', 'Ulan Xian', 'ULA');
INSERT INTO `yw_region` VALUES ('3393', '632822', '都兰县', '357', '0', '0', 'Dulan Xian', 'DUL');
INSERT INTO `yw_region` VALUES ('3394', '632823', '天峻县', '357', '0', '0', 'Tianjun Xian', 'TJN');
INSERT INTO `yw_region` VALUES ('3395', '640101', '市辖区', '358', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('3396', '640104', '兴庆区', '358', '0', '0', 'Xingqing Qu', '2');
INSERT INTO `yw_region` VALUES ('3397', '640105', '西夏区', '358', '0', '0', 'Xixia Qu', '2');
INSERT INTO `yw_region` VALUES ('3398', '640106', '金凤区', '358', '0', '0', 'Jinfeng Qu', '2');
INSERT INTO `yw_region` VALUES ('3399', '640121', '永宁县', '358', '0', '0', 'Yongning Xian', 'YGN');
INSERT INTO `yw_region` VALUES ('3400', '640122', '贺兰县', '358', '0', '0', 'Helan Xian', 'HLN');
INSERT INTO `yw_region` VALUES ('3401', '640181', '灵武市', '358', '0', '0', 'Lingwu Shi', '2');
INSERT INTO `yw_region` VALUES ('3402', '640201', '市辖区', '359', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('3403', '640202', '大武口区', '359', '0', '0', 'Dawukou Qu', 'DWK');
INSERT INTO `yw_region` VALUES ('3404', '640205', '惠农区', '359', '0', '0', 'Huinong Qu', '2');
INSERT INTO `yw_region` VALUES ('3405', '640221', '平罗县', '359', '0', '0', 'Pingluo Xian', 'PLO');
INSERT INTO `yw_region` VALUES ('3406', '640301', '市辖区', '360', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('3407', '640302', '利通区', '360', '0', '0', 'Litong Qu', 'LTW');
INSERT INTO `yw_region` VALUES ('3408', '640323', '盐池县', '360', '0', '0', 'Yanchi Xian', 'YCY');
INSERT INTO `yw_region` VALUES ('3409', '640324', '同心县', '360', '0', '0', 'Tongxin Xian', 'TGX');
INSERT INTO `yw_region` VALUES ('3410', '640381', '青铜峡市', '360', '0', '0', 'Qingtongxia Xian', 'QTX');
INSERT INTO `yw_region` VALUES ('3411', '640401', '市辖区', '361', '0', '0', '1', '2');
INSERT INTO `yw_region` VALUES ('3412', '640402', '原州区', '361', '0', '0', 'Yuanzhou Qu', '2');
INSERT INTO `yw_region` VALUES ('3413', '640422', '西吉县', '361', '0', '0', 'Xiji Xian', '2');
INSERT INTO `yw_region` VALUES ('3414', '640423', '隆德县', '361', '0', '0', 'Longde Xian', '2');
INSERT INTO `yw_region` VALUES ('3415', '640424', '泾源县', '361', '0', '0', 'Jingyuan Xian', '2');
INSERT INTO `yw_region` VALUES ('3416', '640425', '彭阳县', '361', '0', '0', 'Pengyang Xian', '2');
INSERT INTO `yw_region` VALUES ('3417', '640501', '市辖区', '362', '0', '0', '1', '2');
INSERT INTO `yw_region` VALUES ('3418', '640502', '沙坡头区', '362', '0', '0', 'Shapotou Qu', '2');
INSERT INTO `yw_region` VALUES ('3419', '640521', '中宁县', '362', '0', '0', 'Zhongning Xian', '2');
INSERT INTO `yw_region` VALUES ('3420', '640522', '海原县', '362', '0', '0', 'Haiyuan Xian', '2');
INSERT INTO `yw_region` VALUES ('3421', '650101', '市辖区', '363', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('3422', '650102', '天山区', '363', '0', '0', 'Tianshan Qu', 'TSL');
INSERT INTO `yw_region` VALUES ('3423', '650103', '沙依巴克区', '363', '0', '0', 'Saybag Qu', 'SAY');
INSERT INTO `yw_region` VALUES ('3424', '650104', '新市区', '363', '0', '0', 'Xinshi Qu', 'XSU');
INSERT INTO `yw_region` VALUES ('3425', '650105', '水磨沟区', '363', '0', '0', 'Shuimogou Qu', 'SMG');
INSERT INTO `yw_region` VALUES ('3426', '650106', '头屯河区', '363', '0', '0', 'Toutunhe Qu', 'TTH');
INSERT INTO `yw_region` VALUES ('3427', '650107', '达坂城区', '363', '0', '0', 'Dabancheng Qu', '2');
INSERT INTO `yw_region` VALUES ('3428', '650109', '米东区', '363', '0', '0', 'Midong Qu', '2');
INSERT INTO `yw_region` VALUES ('3429', '650121', '乌鲁木齐县', '363', '0', '0', 'Urumqi Xian', 'URX');
INSERT INTO `yw_region` VALUES ('3430', '650201', '市辖区', '364', '0', '0', 'Shixiaqu', '2');
INSERT INTO `yw_region` VALUES ('3431', '650202', '独山子区', '364', '0', '0', 'Dushanzi Qu', 'DSZ');
INSERT INTO `yw_region` VALUES ('3432', '650203', '克拉玛依区', '364', '0', '0', 'Karamay Qu', 'KRQ');
INSERT INTO `yw_region` VALUES ('3433', '650204', '白碱滩区', '364', '0', '0', 'Baijiantan Qu', 'BJT');
INSERT INTO `yw_region` VALUES ('3434', '650205', '乌尔禾区', '364', '0', '0', 'Orku Qu', 'ORK');
INSERT INTO `yw_region` VALUES ('3435', '652101', '吐鲁番市', '365', '0', '0', 'Turpan Shi', 'TUR');
INSERT INTO `yw_region` VALUES ('3436', '652122', '鄯善县', '365', '0', '0', 'Shanshan(piqan) Xian', 'SSX');
INSERT INTO `yw_region` VALUES ('3437', '652123', '托克逊县', '365', '0', '0', 'Toksun Xian', 'TOK');
INSERT INTO `yw_region` VALUES ('3438', '652201', '哈密市', '366', '0', '0', 'Hami(kumul) Shi', 'HAM');
INSERT INTO `yw_region` VALUES ('3439', '652222', '巴里坤哈萨克自治县', '366', '0', '0', 'Barkol Kazak Zizhixian', 'BAR');
INSERT INTO `yw_region` VALUES ('3440', '652223', '伊吾县', '366', '0', '0', 'Yiwu(Araturuk) Xian', 'YWX');
INSERT INTO `yw_region` VALUES ('3441', '652301', '昌吉市', '367', '0', '0', 'Changji Shi', 'CJS');
INSERT INTO `yw_region` VALUES ('3442', '652302', '阜康市', '367', '0', '0', 'Fukang Shi', 'FKG');
INSERT INTO `yw_region` VALUES ('3444', '652323', '呼图壁县', '367', '0', '0', 'Hutubi Xian', 'HTB');
INSERT INTO `yw_region` VALUES ('3445', '652324', '玛纳斯县', '367', '0', '0', 'Manas Xian', 'MAS');
INSERT INTO `yw_region` VALUES ('3446', '652325', '奇台县', '367', '0', '0', 'Qitai Xian', 'QTA');
INSERT INTO `yw_region` VALUES ('3447', '652327', '吉木萨尔县', '367', '0', '0', 'Jimsar Xian', 'JIM');
INSERT INTO `yw_region` VALUES ('3448', '652328', '木垒哈萨克自治县', '367', '0', '0', 'Mori Kazak Zizhixian', 'MOR');
INSERT INTO `yw_region` VALUES ('3449', '652701', '博乐市', '368', '0', '0', 'Bole(Bortala) Shi', 'BLE');
INSERT INTO `yw_region` VALUES ('3450', '652722', '精河县', '368', '0', '0', 'Jinghe(Jing) Xian', 'JGH');
INSERT INTO `yw_region` VALUES ('3451', '652723', '温泉县', '368', '0', '0', 'Wenquan(Arixang) Xian', 'WNQ');
INSERT INTO `yw_region` VALUES ('3452', '652801', '库尔勒市', '369', '0', '0', 'Korla Shi', 'KOR');
INSERT INTO `yw_region` VALUES ('3453', '652822', '轮台县', '369', '0', '0', 'Luntai(Bugur) Xian', 'LTX');
INSERT INTO `yw_region` VALUES ('3454', '652823', '尉犁县', '369', '0', '0', 'Yuli(Lopnur) Xian', 'YLI');
INSERT INTO `yw_region` VALUES ('3455', '652824', '若羌县', '369', '0', '0', 'Ruoqiang(Qakilik) Xian', 'RQG');
INSERT INTO `yw_region` VALUES ('3456', '652825', '且末县', '369', '0', '0', 'Qiemo(Qarqan) Xian', 'QMO');
INSERT INTO `yw_region` VALUES ('3457', '652826', '焉耆回族自治县', '369', '0', '0', 'Yanqi Huizu Zizhixian', 'YQI');
INSERT INTO `yw_region` VALUES ('3458', '652827', '和静县', '369', '0', '0', 'Hejing Xian', 'HJG');
INSERT INTO `yw_region` VALUES ('3459', '652828', '和硕县', '369', '0', '0', 'Hoxud Xian', 'HOX');
INSERT INTO `yw_region` VALUES ('3460', '652829', '博湖县', '369', '0', '0', 'Bohu(Bagrax) Xian', 'BHU');
INSERT INTO `yw_region` VALUES ('3461', '652901', '阿克苏市', '370', '0', '0', 'Aksu Shi', 'AKS');
INSERT INTO `yw_region` VALUES ('3462', '652922', '温宿县', '370', '0', '0', 'Wensu Xian', 'WSU');
INSERT INTO `yw_region` VALUES ('3463', '652923', '库车县', '370', '0', '0', 'Kuqa Xian', 'KUQ');
INSERT INTO `yw_region` VALUES ('3464', '652924', '沙雅县', '370', '0', '0', 'Xayar Xian', 'XYR');
INSERT INTO `yw_region` VALUES ('3465', '652925', '新和县', '370', '0', '0', 'Xinhe(Toksu) Xian', 'XHT');
INSERT INTO `yw_region` VALUES ('3466', '652926', '拜城县', '370', '0', '0', 'Baicheng(Bay) Xian', 'BCG');
INSERT INTO `yw_region` VALUES ('3467', '652927', '乌什县', '370', '0', '0', 'Wushi(Uqturpan) Xian', 'WSH');
INSERT INTO `yw_region` VALUES ('3468', '652928', '阿瓦提县', '370', '0', '0', 'Awat Xian', 'AWA');
INSERT INTO `yw_region` VALUES ('3469', '652929', '柯坪县', '370', '0', '0', 'Kalpin Xian', 'KAL');
INSERT INTO `yw_region` VALUES ('3470', '653001', '阿图什市', '371', '0', '0', 'Artux Shi', 'ART');
INSERT INTO `yw_region` VALUES ('3471', '653022', '阿克陶县', '371', '0', '0', 'Akto Xian', 'AKT');
INSERT INTO `yw_region` VALUES ('3472', '653023', '阿合奇县', '371', '0', '0', 'Akqi Xian', 'AKQ');
INSERT INTO `yw_region` VALUES ('3473', '653024', '乌恰县', '371', '0', '0', 'Wuqia(Ulugqat) Xian', 'WQA');
INSERT INTO `yw_region` VALUES ('3474', '653101', '喀什市', '372', '0', '0', 'Kashi (Kaxgar) Shi', 'KHG');
INSERT INTO `yw_region` VALUES ('3475', '653121', '疏附县', '372', '0', '0', 'Shufu Xian', 'SFU');
INSERT INTO `yw_region` VALUES ('3476', '653122', '疏勒县', '372', '0', '0', 'Shule Xian', 'SHL');
INSERT INTO `yw_region` VALUES ('3477', '653123', '英吉沙县', '372', '0', '0', 'Yengisar Xian', 'YEN');
INSERT INTO `yw_region` VALUES ('3478', '653124', '泽普县', '372', '0', '0', 'Zepu(Poskam) Xian', 'ZEP');
INSERT INTO `yw_region` VALUES ('3479', '653125', '莎车县', '372', '0', '0', 'Shache(Yarkant) Xian', 'SHC');
INSERT INTO `yw_region` VALUES ('3480', '653126', '叶城县', '372', '0', '0', 'Yecheng(Kargilik) Xian', 'YEC');
INSERT INTO `yw_region` VALUES ('3481', '653127', '麦盖提县', '372', '0', '0', 'Markit Xian', 'MAR');
INSERT INTO `yw_region` VALUES ('3482', '653128', '岳普湖县', '372', '0', '0', 'Yopurga Xian', 'YOP');
INSERT INTO `yw_region` VALUES ('3483', '653129', '伽师县', '372', '0', '0', 'Jiashi(Payzawat) Xian', 'JSI');
INSERT INTO `yw_region` VALUES ('3484', '653130', '巴楚县', '372', '0', '0', 'Bachu(Maralbexi) Xian', 'BCX');
INSERT INTO `yw_region` VALUES ('3485', '653131', '塔什库尔干塔吉克自治县', '372', '0', '0', 'Taxkorgan Tajik Zizhixian', 'TXK');
INSERT INTO `yw_region` VALUES ('3486', '653201', '和田市', '373', '0', '0', 'Hotan Shi', 'HTS');
INSERT INTO `yw_region` VALUES ('3487', '653221', '和田县', '373', '0', '0', 'Hotan Xian', 'HOT');
INSERT INTO `yw_region` VALUES ('3488', '653222', '墨玉县', '373', '0', '0', 'Moyu(Karakax) Xian', 'MOY');
INSERT INTO `yw_region` VALUES ('3489', '653223', '皮山县', '373', '0', '0', 'Pishan(Guma) Xian', 'PSA');
INSERT INTO `yw_region` VALUES ('3490', '653224', '洛浦县', '373', '0', '0', 'Lop Xian', 'LOP');
INSERT INTO `yw_region` VALUES ('3491', '653225', '策勒县', '373', '0', '0', 'Qira Xian', 'QIR');
INSERT INTO `yw_region` VALUES ('3492', '653226', '于田县', '373', '0', '0', 'Yutian(Keriya) Xian', 'YUT');
INSERT INTO `yw_region` VALUES ('3493', '653227', '民丰县', '373', '0', '0', 'Minfeng(Niya) Xian', 'MFG');
INSERT INTO `yw_region` VALUES ('3494', '654002', '伊宁市', '374', '0', '0', 'Yining(Gulja) Shi', '2');
INSERT INTO `yw_region` VALUES ('3495', '654003', '奎屯市', '374', '0', '0', 'Kuytun Shi', '2');
INSERT INTO `yw_region` VALUES ('3496', '654021', '伊宁县', '374', '0', '0', 'Yining(Gulja) Xian', '2');
INSERT INTO `yw_region` VALUES ('3497', '654022', '察布查尔锡伯自治县', '374', '0', '0', 'Qapqal Xibe Zizhixian', '2');
INSERT INTO `yw_region` VALUES ('3498', '654023', '霍城县', '374', '0', '0', 'Huocheng Xin', '2');
INSERT INTO `yw_region` VALUES ('3499', '654024', '巩留县', '374', '0', '0', 'Gongliu(Tokkuztara) Xian', '2');
INSERT INTO `yw_region` VALUES ('3500', '654025', '新源县', '374', '0', '0', 'Xinyuan(Kunes) Xian', '2');
INSERT INTO `yw_region` VALUES ('3501', '654026', '昭苏县', '374', '0', '0', 'Zhaosu(Mongolkure) Xian', '2');
INSERT INTO `yw_region` VALUES ('3502', '654027', '特克斯县', '374', '0', '0', 'Tekes Xian', '2');
INSERT INTO `yw_region` VALUES ('3503', '654028', '尼勒克县', '374', '0', '0', 'Nilka Xian', '2');
INSERT INTO `yw_region` VALUES ('3504', '654201', '塔城市', '375', '0', '0', 'Tacheng(Qoqek) Shi', 'TCS');
INSERT INTO `yw_region` VALUES ('3505', '654202', '乌苏市', '375', '0', '0', 'Usu Shi', 'USU');
INSERT INTO `yw_region` VALUES ('3506', '654221', '额敏县', '375', '0', '0', 'Emin(Dorbiljin) Xian', 'EMN');
INSERT INTO `yw_region` VALUES ('3507', '654223', '沙湾县', '375', '0', '0', 'Shawan Xian', 'SWX');
INSERT INTO `yw_region` VALUES ('3508', '654224', '托里县', '375', '0', '0', 'Toli Xian', 'TLI');
INSERT INTO `yw_region` VALUES ('3509', '654225', '裕民县', '375', '0', '0', 'Yumin(Qagantokay) Xian', 'YMN');
INSERT INTO `yw_region` VALUES ('3510', '654226', '和布克赛尔蒙古自治县', '375', '0', '0', 'Hebukesaiermengguzizhi Xian', '2');
INSERT INTO `yw_region` VALUES ('3511', '654301', '阿勒泰市', '376', '0', '0', 'Altay Shi', 'ALT');
INSERT INTO `yw_region` VALUES ('3512', '654321', '布尔津县', '376', '0', '0', 'Burqin Xian', 'BUX');
INSERT INTO `yw_region` VALUES ('3513', '654322', '富蕴县', '376', '0', '0', 'Fuyun(Koktokay) Xian', 'FYN');
INSERT INTO `yw_region` VALUES ('3514', '654323', '福海县', '376', '0', '0', 'Fuhai(Burultokay) Xian', 'FHI');
INSERT INTO `yw_region` VALUES ('3515', '654324', '哈巴河县', '376', '0', '0', 'Habahe(Kaba) Xian', 'HBH');
INSERT INTO `yw_region` VALUES ('3516', '654325', '青河县', '376', '0', '0', 'Qinghe(Qinggil) Xian', 'QHX');
INSERT INTO `yw_region` VALUES ('3517', '654326', '吉木乃县', '376', '0', '0', 'Jeminay Xian', 'JEM');
INSERT INTO `yw_region` VALUES ('3518', '659001', '石河子市', '377', '0', '0', 'Shihezi Shi', 'SHZ');
INSERT INTO `yw_region` VALUES ('3519', '659002', '阿拉尔市', '377', '0', '0', 'Alaer Shi', '2');
INSERT INTO `yw_region` VALUES ('3520', '659003', '图木舒克市', '377', '0', '0', 'Tumushuke Shi', '2');
INSERT INTO `yw_region` VALUES ('3521', '659004', '五家渠市', '377', '0', '0', 'Wujiaqu Shi', '2');
INSERT INTO `yw_region` VALUES ('4000', '620503', '麦积区', '340', '0', '0', 'Maiji Qu', '2');
INSERT INTO `yw_region` VALUES ('4001', '500116', '江津区', '270', '0', '0', 'Jiangjin Qu', '2');
INSERT INTO `yw_region` VALUES ('4002', '500117', '合川区', '270', '0', '0', 'Hechuan Qu', '2');
INSERT INTO `yw_region` VALUES ('4003', '500118', '永川区', '270', '0', '0', 'Yongchuan Qu', '2');
INSERT INTO `yw_region` VALUES ('4004', '500119', '南川区', '270', '0', '0', 'Nanchuan Qu', '2');
INSERT INTO `yw_region` VALUES ('4006', '340221', '芜湖县', '1412', '0', '0', 'Wuhu Xian', 'WHX');
INSERT INTO `yw_region` VALUES ('4100', '232701', '加格达奇区', '106', '0', '0', 'Jiagedaqi Qu', '2');
INSERT INTO `yw_region` VALUES ('4101', '232702', '松岭区', '106', '0', '0', 'Songling Qu', '2');
INSERT INTO `yw_region` VALUES ('4102', '232703', '新林区', '106', '0', '0', 'Xinlin Qu', '2');
INSERT INTO `yw_region` VALUES ('4103', '232704', '呼中区', '106', '0', '0', 'Huzhong Qu', '2');
INSERT INTO `yw_region` VALUES ('4200', '330402', '南湖区', '125', '0', '0', 'Nanhu Qu', '2');
INSERT INTO `yw_region` VALUES ('4300', '360482', '共青城市', '162', '0', '0', 'Gongqingcheng Shi', '2');
INSERT INTO `yw_region` VALUES ('4400', '640303', '红寺堡区', '360', '0', '0', 'Hongsibao Qu', '2');
INSERT INTO `yw_region` VALUES ('4500', '620922', '瓜州县', '344', '0', '0', 'Guazhou Xian', '2');
INSERT INTO `yw_region` VALUES ('4600', '421321', '随县', '215', '0', '0', 'Sui Xian', '2');
INSERT INTO `yw_region` VALUES ('4700', '431102', '零陵区', '228', '0', '0', 'Lingling Qu', '2');
INSERT INTO `yw_region` VALUES ('4800', '451119', '平桂管理区', '263', '0', '0', 'Pingguiguanli Qu', '2');
INSERT INTO `yw_region` VALUES ('4900', '510802', '利州区', '279', '0', '0', 'Lizhou Qu', '2');
INSERT INTO `yw_region` VALUES ('5000', '511681', '华蓥市', '286', '0', '0', 'Huaying Shi', 'HYC');

-- ----------------------------
-- Table structure for yw_settings
-- ----------------------------
DROP TABLE IF EXISTS `yw_settings`;
CREATE TABLE `yw_settings` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `key` varchar(60) DEFAULT NULL COMMENT '配置KEY',
  `value` text COMMENT '值',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yw_settings
-- ----------------------------
INSERT INTO `yw_settings` VALUES ('1', 'site_name', '123');
INSERT INTO `yw_settings` VALUES ('2', 'domain_name', 'www');
INSERT INTO `yw_settings` VALUES ('3', 'site_keywords', 'seo');
INSERT INTO `yw_settings` VALUES ('4', 'site_description', 'www');
INSERT INTO `yw_settings` VALUES ('5', 'site_icp', '123456');
INSERT INTO `yw_settings` VALUES ('6', 'site_status', 'option2');
INSERT INTO `yw_settings` VALUES ('7', 'service_charge', '');
INSERT INTO `yw_settings` VALUES ('8', 'referral_bonuses', '10');
INSERT INTO `yw_settings` VALUES ('9', 'signin', 'array (\n  1 => \n  array (\n    \'day\' => \'1\',\n    \'aw\' => \'10\',\n  ),\n  2 => \n  array (\n    \'day\' => \'4\',\n    \'aw\' => \'20\',\n  ),\n  3 => \n  array (\n    \'day\' => \'6\',\n    \'aw\' => \'30\',\n  ),\n  4 => \n  array (\n    \'day\' => \'8\',\n    \'aw\' => \'40\',\n  ),\n)');
INSERT INTO `yw_settings` VALUES ('10', 'recharge', 'array (\n  0 => \n  array (\n    \'money\' => \'10\',\n    \'exchange\' => \'100\',\n  ),\n  1 => \n  array (\n    \'money\' => \'30\',\n    \'exchange\' => \'315\',\n  ),\n  2 => \n  array (\n    \'money\' => \'50\',\n    \'exchange\' => \'530\',\n  ),\n  3 => \n  array (\n    \'money\' => \'100\',\n    \'exchange\' => \'1100\',\n  ),\n)');

-- ----------------------------
-- Table structure for yw_sign
-- ----------------------------
DROP TABLE IF EXISTS `yw_sign`;
CREATE TABLE `yw_sign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `check_time` datetime DEFAULT NULL COMMENT '上次签到时间',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yw_sign
-- ----------------------------
INSERT INTO `yw_sign` VALUES ('1', '2016-07-13 13:52:26', '1');
INSERT INTO `yw_sign` VALUES ('63', '2016-08-18 00:00:00', '1');
INSERT INTO `yw_sign` VALUES ('3', '2016-08-05 00:00:00', '1');
INSERT INTO `yw_sign` VALUES ('4', '2016-08-06 00:00:00', '1');
INSERT INTO `yw_sign` VALUES ('5', '2016-08-07 00:00:00', '1');
INSERT INTO `yw_sign` VALUES ('6', '2016-08-08 00:00:00', '1');
INSERT INTO `yw_sign` VALUES ('7', '2016-08-10 00:00:00', '1');
INSERT INTO `yw_sign` VALUES ('8', '2016-08-11 00:00:00', '1');
INSERT INTO `yw_sign` VALUES ('9', '2016-08-12 00:00:00', '1');
INSERT INTO `yw_sign` VALUES ('10', '2015-08-09 00:00:00', '1');
INSERT INTO `yw_sign` VALUES ('11', '2015-08-10 00:00:00', '1');
INSERT INTO `yw_sign` VALUES ('12', '2015-08-11 00:00:00', '1');
INSERT INTO `yw_sign` VALUES ('13', '2015-08-12 00:00:00', '1');
INSERT INTO `yw_sign` VALUES ('14', '2015-08-13 00:00:00', '1');
INSERT INTO `yw_sign` VALUES ('69', '2016-08-30 00:00:00', '5');
INSERT INTO `yw_sign` VALUES ('68', '2016-08-30 00:00:00', '5');
INSERT INTO `yw_sign` VALUES ('70', '2016-08-30 00:00:00', '1');
INSERT INTO `yw_sign` VALUES ('71', '2016-08-31 00:00:00', '1');
INSERT INTO `yw_sign` VALUES ('65', '2016-08-21 00:00:00', '1');
INSERT INTO `yw_sign` VALUES ('64', '2016-08-19 00:00:00', '1');
INSERT INTO `yw_sign` VALUES ('72', '2016-08-30 00:00:00', '77');
INSERT INTO `yw_sign` VALUES ('73', '2016-08-30 00:00:00', '67');
INSERT INTO `yw_sign` VALUES ('78', '2016-09-06 00:00:00', '1');
INSERT INTO `yw_sign` VALUES ('77', '2016-09-06 00:00:00', '147');
INSERT INTO `yw_sign` VALUES ('76', '2016-09-01 00:00:00', '1');
INSERT INTO `yw_sign` VALUES ('75', '2016-08-30 00:00:00', '83');
INSERT INTO `yw_sign` VALUES ('74', '2016-08-30 00:00:00', '54');
INSERT INTO `yw_sign` VALUES ('79', '2016-09-07 00:00:00', '1');
INSERT INTO `yw_sign` VALUES ('80', '2016-09-10 00:00:00', '5');
INSERT INTO `yw_sign` VALUES ('81', '2016-09-10 00:00:00', '67');
INSERT INTO `yw_sign` VALUES ('82', '2016-09-12 00:00:00', '67');
INSERT INTO `yw_sign` VALUES ('83', '2016-09-13 00:00:00', '1');
INSERT INTO `yw_sign` VALUES ('84', '2016-09-18 00:00:00', '1');
INSERT INTO `yw_sign` VALUES ('85', '2016-10-13 00:00:00', '79');

-- ----------------------------
-- Table structure for yw_slider
-- ----------------------------
DROP TABLE IF EXISTS `yw_slider`;
CREATE TABLE `yw_slider` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `img_num` tinyint(3) DEFAULT NULL,
  `images` text,
  `type` enum('home','myspace','community','ad','act','game') DEFAULT NULL,
  `fk` int(10) DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  `content` text COMMENT '内容',
  `unknown` enum('game','text','official') DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `netbar_id` int(11) DEFAULT NULL,
  `game_id` int(11) DEFAULT NULL,
  `war_id` int(11) DEFAULT NULL COMMENT '游戏战场ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yw_slider
-- ----------------------------
INSERT INTO `yw_slider` VALUES ('8', 'zxcv', '4', 'YTo0OntpOjE7YTozOntzOjU6InRpdGxlIjtzOjQ6ImRhd2QiO3M6MzoiaW1nIjtzOjUwOiJodHRwOi8vb2FxeDJlM3lyLmJrdC5jbG91ZGRuLmNvbS81N2M1Mzc4OGE4ZTMwLmpwZyI7czoxMToiZGVzY3JpcHRpb24iO3M6MDoiIjt9aToyO2E6Mzp7czo1OiJ0aXRsZSI7czozOiJkYXciO3M6MzoiaW1nIjtzOjUwOiJodHRwOi8vb2FxeDJlM3lyLmJrdC5jbG91ZGRuLmNvbS81N2M1Mzc5YmE4ZjlkLmpwZyI7czoxMToiZGVzY3JpcHRpb24iO3M6MDoiIjt9aTozO2E6Mzp7czo1OiJ0aXRsZSI7czo0OiJzZGF3IjtzOjM6ImltZyI7czo1MDoiaHR0cDovL29hcXgyZTN5ci5ia3QuY2xvdWRkbi5jb20vNTdjNTM3YTc5OWM1ZS5qcGciO3M6MTE6ImRlc2NyaXB0aW9uIjtzOjA6IiI7fWk6NDthOjM6e3M6NToidGl0bGUiO3M6MzoiZGF3IjtzOjM6ImltZyI7czo1MDoiaHR0cDovL29hcXgyZTN5ci5ia3QuY2xvdWRkbi5jb20vNTdjNTM3YmVhY2Y0Ni5qcGciO3M6MTE6ImRlc2NyaXB0aW9uIjtzOjA6IiI7fX0=', 'home', '73', '2016-07-28 17:30:51', null, null, null, '0', '0', null);
INSERT INTO `yw_slider` VALUES ('10', '广告1', '1', 'YToxOntpOjE7YTo0OntzOjU6InRpdGxlIjtzOjQ6IuWbvjEiO3M6MzoidXJsIjtzOjA6IiI7czozOiJpbWciO3M6NTA6Imh0dHA6Ly9vYXF4MmUzeXIuYmt0LmNsb3VkZG4uY29tLzU3YzUzN2ViMzMxN2QuanBnIjtzOjk6Imxpc3RvcmRlciI7czoxOiIxIjt9fQ==', 'home', '73', '2016-08-28 15:50:52', null, null, null, null, null, null);
INSERT INTO `yw_slider` VALUES ('11', '图文广告', '1', 'YToxOntpOjA7czoxODoiaHR0cDovL3Fpbml1LzEuanBnIjt9', 'ad', '0', '2016-09-12 21:42:03', '广告内容', 'text', '1,1,20160910,10,gameCount', null, null, null);
INSERT INTO `yw_slider` VALUES ('14', '图文广告', '1', 'YToxOntpOjA7czoxODoiaHR0cDovL3Fpbml1LzEuanBnIjt9', 'ad', '73', '2016-09-12 21:46:19', '广告内容', 'text', '1,1,20160910,10,gameCount', null, null, null);
INSERT INTO `yw_slider` VALUES ('15', '图文广告', '1', 'YToxOntpOjA7czoxODoiaHR0cDovL3Fpbml1LzEuanBnIjt9', 'ad', '0', '2016-09-12 21:46:34', '广告内容', 'text', '1,1,20160910,10,gameCount', null, null, null);
INSERT INTO `yw_slider` VALUES ('17', '图文广告', '1', 'YToxOntpOjA7czoxODoiaHR0cDovL3Fpbml1LzEuanBnIjt9', 'ad', '0', '2016-09-14 17:15:07', '广告内容', 'text', '1,1,20160910,10,gameCount', null, null, null);
INSERT INTO `yw_slider` VALUES ('19', '1111', '4', 'YTo0OntpOjE7YTozOntzOjU6InRpdGxlIjtzOjQ6ImRhd2QiO3M6MzoiaW1nIjtzOjUwOiJodHRwOi8vb2FxeDJlM3lyLmJrdC5jbG91ZGRuLmNvbS81N2M1Mzc4OGE4ZTMwLmpwZyI7czoxMToiZGVzY3JpcHRpb24iO3M6MDoiIjt9aToyO2E6Mzp7czo1OiJ0aXRsZSI7czozOiJkYXciO3M6MzoiaW1nIjtzOjUwOiJodHRwOi8vb2FxeDJlM3lyLmJrdC5jbG91ZGRuLmNvbS81N2M1Mzc5YmE4ZjlkLmpwZyI7czoxMToiZGVzY3JpcHRpb24iO3M6MDoiIjt9aTozO2E6Mzp7czo1OiJ0aXRsZSI7czo0OiJzZGF3IjtzOjM6ImltZyI7czo1MDoiaHR0cDovL29hcXgyZTN5ci5ia3QuY2xvdWRkbi5jb20vNTdjNTM3YTc5OWM1ZS5qcGciO3M6MTE6ImRlc2NyaXB0aW9uIjtzOjA6IiI7fWk6NDthOjM6e3M6NToidGl0bGUiO3M6MzoiZGF3IjtzOjM6ImltZyI7czo1MDoiaHR0cDovL29hcXgyZTN5ci5ia3QuY2xvdWRkbi5jb20vNTdjNTM3YmVhY2Y0Ni5qcGciO3M6MTE6ImRlc2NyaXB0aW9uIjtzOjA6IiI7fX0=', 'home', null, '2016-10-11 20:48:07', null, null, null, '3', '6', '0');
INSERT INTO `yw_slider` VALUES ('20', '11', '1', 'YToxOntpOjE7YTozOntzOjU6InRpdGxlIjtzOjM6IjIyMiI7czozOiJpbWciO3M6MDoiIjtzOjExOiJkZXNjcmlwdGlvbiI7czo1OiIyMzIzMiI7fX0=', 'act', null, '2016-10-11 20:50:36', null, null, null, '3', '9', null);
INSERT INTO `yw_slider` VALUES ('75', '官方广告测试', '1', 'YToxOntpOjE7YTozOntzOjU6InRpdGxlIjtzOjM6IuWViiI7czozOiJpbWciO3M6MDoiIjtzOjk6Imxpc3RvcmRlciI7czoxOiIxIjt9fQ==', 'home', null, '2016-10-24 17:11:12', null, null, null, '3', '5', '75');

-- ----------------------------
-- Table structure for yw_sms_code
-- ----------------------------
DROP TABLE IF EXISTS `yw_sms_code`;
CREATE TABLE `yw_sms_code` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tel` varchar(20) DEFAULT NULL COMMENT '电话号码',
  `code` varchar(12) DEFAULT NULL COMMENT '验证码',
  `expire` datetime DEFAULT NULL COMMENT '过期时间',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态：0表示已失效，1表示正常',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yw_sms_code
-- ----------------------------

-- ----------------------------
-- Table structure for yw_user
-- ----------------------------
DROP TABLE IF EXISTS `yw_user`;
CREATE TABLE `yw_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL COMMENT '用户名',
  `pwd` varchar(60) DEFAULT NULL COMMENT '密码',
  `tel` varchar(11) DEFAULT NULL COMMENT '电话',
  `identity` varchar(32) DEFAULT NULL COMMENT '身份证号码',
  `bank` varchar(60) DEFAULT NULL COMMENT '银行名',
  `bank_card` varchar(32) DEFAULT NULL COMMENT '银行卡号',
  `real_name` varchar(32) DEFAULT NULL COMMENT '真实姓名',
  `address` varchar(255) DEFAULT NULL COMMENT '用户地址',
  `region_id` int(10) DEFAULT NULL COMMENT '地区id',
  `alipay` varchar(60) DEFAULT NULL COMMENT '支付宝',
  `user_type` enum('netbar','player') DEFAULT NULL COMMENT '用户类型：player表示玩家，netbar表示网吧',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态：0表示已失效，1表示正常',
  `add_time` datetime DEFAULT NULL COMMENT '注册时间',
  `nickname` varchar(255) DEFAULT NULL,
  `profile` varchar(255) DEFAULT NULL,
  `longitude` varchar(60) DEFAULT NULL,
  `latitude` varchar(60) DEFAULT NULL,
  `last_time` datetime DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `sex` tinyint(4) DEFAULT NULL COMMENT '1代表男',
  `check_last_time` datetime DEFAULT NULL COMMENT '上次签到时间',
  `check_log` int(11) DEFAULT '0',
  `license` varchar(255) DEFAULT NULL COMMENT '网吧营业执照',
  `auth` varchar(300) DEFAULT NULL COMMENT '用户授权',
  `province_id` int(5) DEFAULT NULL COMMENT '省份ID',
  `city_id` int(5) DEFAULT NULL COMMENT '城市ID',
  `distract_id` int(5) DEFAULT NULL COMMENT '区ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=157 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yw_user
-- ----------------------------
INSERT INTO `yw_user` VALUES ('1', '15088888888', '670b14728ad9902aecba32e22fa4f6bd', '15088888888', '410724199403280040', '中国银行', '6200000987654', 'vcdjjnn', '北京市北京市东城区', null, '15038699883', 'player', '1', '2016-07-22 10:25:46', 'CD-ROM', 'bh', '34.6672', '112.368', '2016-08-30 19:09:07', 'http://oaqx2e3yr.bkt.clouddn.com/head1472707122', '0', '2016-09-18 00:00:00', '1', null, null, null, null, null);
INSERT INTO `yw_user` VALUES ('3', '13838895000', 'e10adc3949ba59abbe56e057f20f883e', '13838895000', '410326199509146587', '国1', '620000001445555', '网管', '中国河南省洛阳市涧西区郑州路街道青滇路11号', '189', '150356457551', 'netbar', '1', '2016-08-09 18:05:52', '123', '11', '34.67', '112.4', '2016-08-30 20:26:52', 'http://121.42.172.61/public/images/defaultAvatar.png', '0', '2016-08-27 00:00:00', '1', '213456', null, '17', '189', '1910');
INSERT INTO `yw_user` VALUES ('5', '13838895007', '670b14728ad9902aecba32e22fa4f6bd', '13838895007', null, null, null, null, '中国河南省洛阳市涧西区郑州路街道青滇路11号', null, null, 'player', '1', '2016-07-27 14:08:58', '大黄峰', '你好', '34.6672', '112.368', '2016-08-28 17:03:14', 'http://121.42.172.61/public/images/defaultAvatar.png', '0', '2016-09-10 00:00:00', '1', null, null, null, null, null);
INSERT INTO `yw_user` VALUES ('67', '15538854525', '670b14728ad9902aecba32e22fa4f6bd', '15538854525', '', '', '', '', '中国河南省洛阳市涧西区郑州路街道青滇路11号', null, null, 'player', '1', '2016-08-13 21:25:39', '霸天虎', '', '34.6672', '112.368', '2016-08-29 19:01:53', 'http://121.42.172.61/public/images/defaultAvatar.png', null, '2016-09-12 00:00:00', '1', null, null, null, null, null);
INSERT INTO `yw_user` VALUES ('77', '13015580263', '670b14728ad9902aecba32e22fa4f6bd', '13015580263', '', '', '', '', '中国河南省洛阳市涧西区郑州路街道青滇路11号', null, null, 'player', '1', '2016-08-17 10:28:31', '测试nick', '', '34.667', '112.368', '2016-08-30 20:01:34', 'http://121.42.172.61/public/images/defaultAvatar.png', null, '2016-08-30 00:00:00', '1', null, null, null, null, null);
INSERT INTO `yw_user` VALUES ('46', '13592058536', '670b14728ad9902aecba32e22fa4f6bd', '13592058536', '', '', '', '454545', '中国河南省洛阳市涧西区郑州路街道青滇路11号', null, null, 'player', '1', '2016-08-12 18:05:36', '123', '', '34.6672', '112.368', '2016-08-25 17:08:40', 'http://121.42.172.61/public/images/defaultAvatar.png', null, null, '0', null, null, null, null, null);
INSERT INTO `yw_user` VALUES ('47', '13592058557', '670b14728ad9902aecba32e22fa4f6bd', '13592058557', '', '', '', '', '中国河南省洛阳市涧西区郑州路街道青滇路32号', null, null, 'player', '1', '2016-08-12 18:07:04', '擎天柱', '', '34.6672', '112.368', '2016-08-25 17:13:32', 'http://121.42.172.61/public/images/defaultAvatar.png', null, null, '0', null, null, null, null, null);
INSERT INTO `yw_user` VALUES ('54', '13838891256', '670b14728ad9902aecba32e22fa4f6bd', '13838891256', '', '', '', '', '中国河南省洛阳市涧西区郑州路街道青滇路30号', null, null, 'player', '1', '2016-08-13 16:55:52', 'ssssss', '', '34.6672', '112.367', '2016-08-22 20:07:44', 'http://121.42.172.61/public/images/defaultAvatar.png', null, '2016-08-30 00:00:00', '1', null, null, null, null, null);
INSERT INTO `yw_user` VALUES ('79', '13939904970', 'e10adc3949ba59abbe56e057f20f883e', '13939904970', '410369654578961', null, null, '很久了', '中国河南省洛阳市涧西区郑州路街道青滇路32号', null, null, 'player', '1', '2016-08-17 17:02:04', '(ᵒ̤̑₀̑ᵒ̤̑)哦', '', '34.6672', '112.368', '2016-08-17 18:32:38', 'http://121.42.172.61/public/images/defaultAvatar.png', '0', '2016-10-13 00:00:00', '1', null, null, null, null, null);
INSERT INTO `yw_user` VALUES ('154', '13603098692', 'cef62992b9457bf8d34787b42273fe86', '13603098692', null, null, null, null, null, null, null, 'player', '1', '2016-10-05 23:40:11', null, null, null, null, null, 'http://121.42.172.61/public/images/defaultAvatar.png', null, null, '0', null, 'B1B4BFBC6DE2DADC6B4BA29B91F7B293', null, null, null);
INSERT INTO `yw_user` VALUES ('84', '13007575132', '670b14728ad9902aecba32e22fa4f6bd', '13007575132', '412728199306161223', '', '', 'DK', '中国河南省洛阳市涧西区郑州路街道青滇路30号', null, null, 'player', '1', '2016-08-22 10:44:45', 'DK', 'fhj', '34.6674', '112.368', '2016-08-30 17:18:48', 'http://oaqx2e3yr.bkt.clouddn.com/head1472455719', '0', null, '0', null, null, null, null, null);
INSERT INTO `yw_user` VALUES ('153', '15690640310', '2e445b47ab0836c7a83c0bf8f9bcf5af', '15690640310', null, null, null, null, null, null, null, 'player', '1', '2016-09-27 19:20:23', null, null, null, null, null, 'http://121.42.172.61/public/images/defaultAvatar.png', null, null, '0', null, 'k4DevC3BaSg_1bMUNMzMg7dbOUL-TqMYsxpyi0iCg_hpr55uVIMzGfnivgUZ7wrCkGK0Tu-zcDDabtuk4od5xiUOzisFofcdfTtfxdc2Ya8', null, null, null);
INSERT INTO `yw_user` VALUES ('152', '15874275350', 'e10adc3949ba59abbe56e057f20f883e', '15874275350', '430381198910130412', '', '', '肖前欣', '河南省洛阳市涧西区', null, null, 'player', '1', '2016-09-18 10:15:14', '小额1', 'null', '', '', null, 'http://121.42.172.61/public/images/defaultAvatar.png', '0', null, '0', null, null, null, null, null);
INSERT INTO `yw_user` VALUES ('155', '18512123483', '96e79218965eb72c92a549dd5a330112', '18512123483', '410224198906115416', null, null, 'z', '香港特別行政區香港特別行政區中西區', null, null, 'player', '1', '2016-10-13 14:12:50', 'sss', 'zww', null, null, null, 'http://121.42.172.61/public/images/defaultAvatar.png', '0', null, '0', null, '', null, null, null);
INSERT INTO `yw_user` VALUES ('147', '15896510663', '90bbc2cf92681711073c0f6861b85180', '15896510663', '410306166613488854', null, null, '北极熊', '北京市北京市东城区', null, null, 'player', '1', '2016-09-02 14:51:34', '南极熊', '嗯！', null, null, null, 'http://121.42.172.61/public/images/defaultAvatar.png', '0', '2016-09-06 00:00:00', '1', null, '', null, null, null);
INSERT INTO `yw_user` VALUES ('156', '15090395140', '670b14728ad9902aecba32e22fa4f6bd', '15090395140', null, null, null, null, null, null, null, 'player', '1', '2016-10-18 20:09:17', null, null, null, null, null, 'http://121.42.172.61/public/images/defaultAvatar.png', null, null, '0', null, null, null, null, null);

-- ----------------------------
-- Table structure for yw_user_netbar
-- ----------------------------
DROP TABLE IF EXISTS `yw_user_netbar`;
CREATE TABLE `yw_user_netbar` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL COMMENT '用户id',
  `title` varchar(60) DEFAULT NULL COMMENT '网吧名称',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态：0表示已失效，1表示正常',
  `add_time` datetime DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL COMMENT '网吧图片',
  `balance` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yw_user_netbar
-- ----------------------------
INSERT INTO `yw_user_netbar` VALUES ('1', '3', '黑豹网咖1', '1', '2016-08-09 18:05:48', null, '0.00');
INSERT INTO `yw_user_netbar` VALUES ('3', null, null, '1', null, null, null);
INSERT INTO `yw_user_netbar` VALUES ('4', null, null, '1', null, null, null);
INSERT INTO `yw_user_netbar` VALUES ('5', null, null, '1', null, null, null);
INSERT INTO `yw_user_netbar` VALUES ('6', null, null, '1', null, null, null);
INSERT INTO `yw_user_netbar` VALUES ('7', null, null, '1', null, null, null);
INSERT INTO `yw_user_netbar` VALUES ('8', null, null, '1', null, null, null);
INSERT INTO `yw_user_netbar` VALUES ('9', null, null, '1', null, null, null);

-- ----------------------------
-- Table structure for yw_user_player
-- ----------------------------
DROP TABLE IF EXISTS `yw_user_player`;
CREATE TABLE `yw_user_player` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL COMMENT '用户ID',
  `balance` decimal(10,2) DEFAULT NULL COMMENT '余额',
  `age` tinyint(2) DEFAULT NULL COMMENT '年龄',
  `game_age` tinyint(2) DEFAULT NULL COMMENT '玩龄',
  `qq` varchar(60) DEFAULT NULL COMMENT 'QQ号',
  `wx` varchar(60) DEFAULT NULL COMMENT '微信号',
  `likes` varchar(60) DEFAULT NULL COMMENT '常玩的游戏格式：1，2，3，与game表关联',
  `times` int(10) DEFAULT NULL COMMENT '总参展次数',
  `win_times` int(10) DEFAULT NULL COMMENT '胜利次数',
  `lose_times` int(10) DEFAULT NULL,
  `fail_times` int(10) DEFAULT NULL COMMENT '违约次数',
  `score` int(255) DEFAULT '0' COMMENT '积分',
  `parent_id` int(11) DEFAULT NULL COMMENT '推荐人id',
  `pk_score` int(11) DEFAULT '0' COMMENT '比赛积分',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=149 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yw_user_player
-- ----------------------------
INSERT INTO `yw_user_player` VALUES ('1', '1', '110.00', '22', '1', '591000', '59100wx', '', null, '10', '5', '0', '0', null, '100');
INSERT INTO `yw_user_player` VALUES ('3', '5', '30.00', '0', '0', null, null, '5,6,7,8,9,10', '0', '0', '0', '0', '0', null, '200');
INSERT INTO `yw_user_player` VALUES ('65', '67', '30.00', '0', '0', null, null, '5,6,7,8,9,10', '0', '0', '0', '0', '0', null, '100');
INSERT INTO `yw_user_player` VALUES ('75', '77', '10.00', '0', '0', null, null, '5,6,7,8,9,10', '0', '0', '0', '0', '0', null, '2');
INSERT INTO `yw_user_player` VALUES ('44', '46', '0.00', '0', '0', null, null, '5,6,7,8,9,10', '0', '0', '0', '0', '0', null, '50');
INSERT INTO `yw_user_player` VALUES ('45', '47', '0.00', '0', '0', null, null, '5,6,7,8,9,10', '0', '0', '0', '0', '0', null, '30');
INSERT INTO `yw_user_player` VALUES ('52', '54', '10.00', '0', '0', null, null, '5,6,7,8,9,10', '0', '0', '0', '0', '0', null, '20');
INSERT INTO `yw_user_player` VALUES ('146', '154', '0.00', '0', '0', null, null, null, '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `yw_user_player` VALUES ('77', '79', '410.00', '20', '6', null, null, '5,6,7,8,9,10', '0', '0', '0', '0', '0', null, '23044');
INSERT INTO `yw_user_player` VALUES ('81', '84', '0.00', '23', '1', null, null, '5,6,7,8,9,10', '0', '0', '0', '0', '0', null, '822');
INSERT INTO `yw_user_player` VALUES ('145', '153', '0.00', '0', '0', null, null, null, '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `yw_user_player` VALUES ('139', '147', '10.00', '127', '4', null, null, '13', '0', '0', '0', '0', '0', '2147483647', '0');
INSERT INTO `yw_user_player` VALUES ('144', '152', '0.00', '0', '1', null, null, '7,13,11,8,12,5,9,10', '0', '0', '0', '0', '0', '2147483647', '0');
INSERT INTO `yw_user_player` VALUES ('147', '155', '0.00', '27', '1', null, null, '', '0', '0', '0', '0', '0', '2147483647', '0');
INSERT INTO `yw_user_player` VALUES ('148', '156', '0.00', '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0');

-- ----------------------------
-- Table structure for yw_war
-- ----------------------------
DROP TABLE IF EXISTS `yw_war`;
CREATE TABLE `yw_war` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '游戏战场名称标识',
  `user_id` int(10) DEFAULT NULL COMMENT '发起人ID',
  `game_id` int(10) DEFAULT NULL COMMENT '游戏ID',
  `begin_time` datetime DEFAULT NULL COMMENT '开战时间',
  `netbar_id` int(10) DEFAULT NULL COMMENT '网吧ID',
  `team` int(10) DEFAULT NULL COMMENT '组队人数',
  `prize` decimal(10,2) DEFAULT NULL COMMENT '奖金',
  `times` tinyint(3) DEFAULT NULL COMMENT '场数',
  `remain` tinyint(3) DEFAULT NULL COMMENT '剩下场数',
  `rule` text COMMENT '游戏规则',
  `status` enum('draft','done','doing','close','pedding') DEFAULT 'draft' COMMENT '状态：pedding表示应战中doing进行中done已结束draft草稿待完善close关闭',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  `type` tinyint(4) DEFAULT NULL COMMENT '官方战场为1',
  `money` varchar(255) DEFAULT NULL COMMENT '官方奖励',
  `win` varchar(6) DEFAULT NULL COMMENT '赢方标识',
  `room_id` varchar(32) DEFAULT NULL COMMENT '聊天室id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yw_war
-- ----------------------------
INSERT INTO `yw_war` VALUES ('64', '官方对战-测试12', '77', '5', '2016-08-26 12:47:00', '0', '2', '310.00', '1', null, '请填写游戏规则', 'done', '2016-08-26 12:47:19', null, null, null, '1472186837702');
INSERT INTO `yw_war` VALUES ('65', '官方对战-测试11', '77', '6', '2016-08-26 14:45:00', '0', '2', '310.00', '1', null, '请填写游戏规则', 'done', '2016-08-26 12:47:57', null, null, null, '1472186875542');
INSERT INTO `yw_war` VALUES ('66', '官方对战-测试10', '77', '5', '2016-08-26 12:54:00', '3', '2', '310.00', '1', null, '请填写游戏规则', 'pedding', '2016-08-26 12:55:11', '1', '1|300,2|200,3|100', null, '1472187301148');
INSERT INTO `yw_war` VALUES ('67', '官方对战-测试9', '77', '5', '2016-08-26 12:54:00', '0', '2', '310.00', '1', null, '请填写游戏规则', 'pedding', '2016-08-26 12:56:15', null, null, null, '1472187373784');
INSERT INTO `yw_war` VALUES ('68', '官方对战-测试8', '77', '5', '2016-08-29 13:00:00', '0', '2', '310.00', '1', null, '请填写游戏规则', 'pedding', '2016-08-26 13:03:15', null, null, null, '1472187777512');
INSERT INTO `yw_war` VALUES ('69', '官方对战-测试7', '77', '5', '2016-08-26 14:51:00', '0', '2', '310.00', '1', null, '请填写游戏规则', 'doing', '2016-08-26 14:52:09', null, null, 'A', '1472194321712');
INSERT INTO `yw_war` VALUES ('70', '官方对战-测试6', '77', '5', '2016-08-26 15:39:00', '0', '2', '340.00', '1', null, '请填写游戏规则', 'doing', '2016-08-26 15:39:19', null, null, 'A', '1472197153418');
INSERT INTO `yw_war` VALUES ('71', '官方对战-测试5', '77', '8', '2016-09-03 16:15:00', '0', '4', '110.00', '9', null, '请填写游戏规则', 'pedding', '2016-08-26 16:19:14', null, null, null, '1472199548096');
INSERT INTO `yw_war` VALUES ('72', '官方对战-测试4', '1', '9', '2016-08-26 16:31:00', '0', '12', '500.00', '12', null, '倾尽亲加油下吧', 'doing', '2016-08-26 16:31:59', null, null, 'A', '1472200318922');
INSERT INTO `yw_war` VALUES ('73', '官方对战-测试3', '77', '10', '2016-08-28 11:30:00', '3', '8', '230.00', '3', null, '请填写游戏规则', 'doing', '2016-08-28 11:31:02', null, null, 'A', '1472355062655');
INSERT INTO `yw_war` VALUES ('74', '官方对战-测试2', '1', '1', '2016-09-10 00:00:00', '1', '10', '0.00', '1', null, '', 'pedding', '2016-09-12 21:46:19', null, null, null, '');
INSERT INTO `yw_war` VALUES ('75', '官方对战-测试', null, '5', '2016-10-21 14:50:07', '3', '20', null, '2', '2', '', 'doing', '2016-10-21 14:53:20', '1', '100', null, null);

-- ----------------------------
-- Table structure for yw_war_team
-- ----------------------------
DROP TABLE IF EXISTS `yw_war_team`;
CREATE TABLE `yw_war_team` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `war_id` int(10) DEFAULT NULL COMMENT '比赛ID',
  `player_id` int(10) DEFAULT NULL COMMENT '战友ID',
  `role` enum('B','A') DEFAULT 'B' COMMENT '挑战角色A表示应战方B表示挑战方',
  `invite` varchar(255) DEFAULT NULL COMMENT '邀约内容',
  `status` enum('reject','done','pedding') DEFAULT 'pedding' COMMENT '状态：pedding表示受约等待中done接受邀约reject拒绝邀约',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  `net_id` int(11) DEFAULT NULL COMMENT '所在网吧id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=342 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yw_war_team
-- ----------------------------
INSERT INTO `yw_war_team` VALUES ('69', '72', '0', 'A', null, 'pedding', '2016-08-26 16:32:00', null);
INSERT INTO `yw_war_team` VALUES ('70', '72', '0', 'A', null, 'pedding', '2016-08-26 16:32:00', null);
INSERT INTO `yw_war_team` VALUES ('71', '72', '0', 'A', null, 'pedding', '2016-08-26 16:32:00', null);
INSERT INTO `yw_war_team` VALUES ('284', '73', '1', 'A', null, 'done', '2016-08-29 15:22:53', null);
INSERT INTO `yw_war_team` VALUES ('286', '72', '1', 'A', null, 'done', '2016-08-29 15:24:15', null);
INSERT INTO `yw_war_team` VALUES ('300', '68', '77', 'A', null, 'done', '2016-08-30 11:23:14', null);
INSERT INTO `yw_war_team` VALUES ('302', '68', '1', 'A', null, 'done', '2016-08-30 11:48:44', null);
INSERT INTO `yw_war_team` VALUES ('244', '69', '1', 'A', null, 'done', '2016-08-28 19:36:57', null);
INSERT INTO `yw_war_team` VALUES ('305', '71', '1', 'A', null, 'done', '2016-08-31 17:29:10', null);
INSERT INTO `yw_war_team` VALUES ('266', '70', '1', 'A', null, 'done', '2016-08-28 20:18:06', null);
INSERT INTO `yw_war_team` VALUES ('306', '71', '147', 'A', null, 'done', '2016-09-02 15:02:55', null);
INSERT INTO `yw_war_team` VALUES ('337', '74', '152', 'B', null, 'done', '2016-09-19 15:33:04', null);
INSERT INTO `yw_war_team` VALUES ('308', '71', '152', 'A', null, 'done', '2016-09-18 19:25:11', null);
INSERT INTO `yw_war_team` VALUES ('339', '67', '152', 'B', null, 'done', '2016-09-19 15:37:41', null);
INSERT INTO `yw_war_team` VALUES ('341', '68', '79', 'A', null, 'done', '2016-10-13 21:09:45', null);
SET FOREIGN_KEY_CHECKS=1;
