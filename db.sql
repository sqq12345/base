# ************************************************************
# Sequel Pro SQL dump
# Version 1
#
# https://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 8.0.13)
# Database: base
# Generation Time: 2019-01-10 06:17:45 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table y_admin_files
# ------------------------------------------------------------

DROP TABLE IF EXISTS `y_admin_files`;

CREATE TABLE `y_admin_files` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上传用户id',
  `original_name` varchar(255) NOT NULL,
  `save_name` varchar(255) NOT NULL,
  `save_path` varchar(255) NOT NULL,
  `extension` varchar(255) NOT NULL,
  `mime` varchar(255) NOT NULL,
  `size` int(11) unsigned NOT NULL DEFAULT '0',
  `md5` char(32) NOT NULL,
  `sha1` char(40) NOT NULL,
  `url` varchar(255) NOT NULL,
  `is_open` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否公开，默认为0不公开只能自己看，1为公开',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL,
  `delete_time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='后台用户文件表';



# Dump of table y_admin_group_access
# ------------------------------------------------------------

DROP TABLE IF EXISTS `y_admin_group_access`;

CREATE TABLE `y_admin_group_access` (
  `uid` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色用户关联表';

LOCK TABLES `y_admin_group_access` WRITE;
/*!40000 ALTER TABLE `y_admin_group_access` DISABLE KEYS */;

INSERT INTO `y_admin_group_access` (`uid`, `group_id`)
VALUES
	(1,1),
	(2,2);

/*!40000 ALTER TABLE `y_admin_group_access` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table y_admin_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `y_admin_groups`;

CREATE TABLE `y_admin_groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(200) DEFAULT '' COMMENT '角色描述',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '默认为1启用，2冻结',
  `rules` varchar(350) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色表';

LOCK TABLES `y_admin_groups` WRITE;
/*!40000 ALTER TABLE `y_admin_groups` DISABLE KEYS */;

INSERT INTO `y_admin_groups` (`id`, `name`, `description`, `status`, `rules`)
VALUES
	(1,'管理员','管理员角色',1,'1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,26,27,28,29,30,31,32,33,34,21,22,23,25,24,35,36,44,37,38,39,40,41,43,42,45,46,47,48,49,50'),
	(2,'体验用户','系统体验用户',1,'1,2,3,4,8,13,17,18,19,20,26,27,31,34,21,22,23,24,35,36,37,38,39,40,41,43,42,45,49,50');

/*!40000 ALTER TABLE `y_admin_groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table y_admin_log_datas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `y_admin_log_datas`;

CREATE TABLE `y_admin_log_datas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `log_id` int(10) unsigned NOT NULL,
  `data` longtext NOT NULL,
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  `delete_time` int(10) unsigned DEFAULT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='后台用户操作日志数据表';

LOCK TABLES `y_admin_log_datas` WRITE;
/*!40000 ALTER TABLE `y_admin_log_datas` DISABLE KEYS */;

INSERT INTO `y_admin_log_datas` (`id`, `log_id`, `data`, `create_time`, `update_time`, `delete_time`, `status`)
VALUES
	(1,1,'ecc9e8f1qi9PgVSDYl2wPkZRr6ZA9k6OAQovfpilueJWgCJVT5Go54NQ2GpkDAliJ+8DdDQbv9B14IkWqBER8y1GlS8E+qS4wx9EmDkSUECGQzD1I7NHAfOO7Chbi3XvWppxLMGd8jQchG+0cEst9xKQ6GhUYHzxwhHKlCDNvCMryzaER+5brZvcLyZhGgMwfIK4kwyugtYhuhbnWldSEwe+4ZNFe/JrjHNyfiiSlZaZDslH129vEdxrI2+HDl9DnFbPZ9QERvwGL8WQkYveJHJodyg5coHPntsqSRN4ODUtE0WIC0X8vqJmvLnpVy/5xlAk/DT2nwkxDTK9y9qCQXcotWC85NVW2V8dJ24aUrIZmS6X75qiTfW0wh5xl26/bD/lqVfOcVV8UnFxeARLiWpwkXNnOyWOf3wHJTi6rsQi3uY6ollXz6ksLJpnj8xhG3+BNIBsN/cQK6DRUSJkk5Pnqx6TVu1EVYc+lszQ3a58Cz3/',1538104685,1538104685,NULL,1),
	(2,2,'0c8aad80hWESDtzpUZEjjbd1YzuLNI+dd0pLut8K841F+1UNuTIgVYG3By57qECrOGqs5AYzV7uVCE7W1iU',1538110842,1538110842,NULL,1),
	(3,3,'d75a1deftEzTkWc1zxbK6N/75HOaM1XwcJpE9Tw9tfmP1CrQURA',1538110884,1538110884,NULL,1),
	(4,4,'f78623fbKWorvvV6sa4J42QzM08db25JyHZGgdS6XUAEPz467IUvqqV5oBJJa9Cce6/W2XyxH85SReNyybByvpFcaX6K3cXxNtjd57dHCm/USjibxFDkQyvW/gXjesWb/N9jiXHp6O00JSt2324nkUVrHCDmqSizxKdd3Lxm/+tTqSzjQADYCSIysv2ADqVaU+gbCC/sc57rKMtfLPMc16AwdwWsu4vqvP5KJqpp9ovi4m3kaCk8jtaKRib056Q4a3lc8+SlrmUOvDN/VyGa+LK1cx8YtplKgnBQV7Q2SbXt0XElQN38c+evLQT4cKQGNlZ73OGEGwvp3MGOZm1gavQJRn3CwEH2P6Wu59EtFLRI/fqbABq/3aqJR695r4InQD3+ZNg',1538110950,1538110950,NULL,1),
	(5,5,'7cca1ff7BMnAugt5z7u04R6DzcRwnRBVuGgwOgmqgam5ZqH7Wck',1538111051,1538111051,NULL,1),
	(6,6,'c7085650ZXnmADUIUPU1ACu+8Vk2woZOSH944hchqKH3jhwLvKvzKD5M/MxT6yvracmQy7VM6rfsifiZx5MeaDtg601bzCxQNkaKDoL84+FC6mJ9OHtVXFvqqofcQjpUQ+JaFmgT0JrYniPwl+graD+s8TbxFD6ymI+cSkqumH67hhJ0lw88NBOhu55+Wc6haDj5fI2G89mnHAjZrxYUko8QY4QKvTVdXpDtZy+yJFbJbGB/3cMWKF6So+am3XeVuKB/mwHIFUlBvDqyOk/JcwuUhvOGzlP4jfT94XhMB9q2aCQ4OMnVwxNUnSC8DwNscm0XnkYJvLfvZGNyuh9Odw+UPvjkkSBhecd2o2rXzxCrTX3LyA8jTScFCsy99cX4yqpxIqtT7G0qmVflv6SWnLF4gD+6U9JyzLXwNjnpdSFeugwb7oT2b2PNBdt0lPx4V2FxCKmaQ9go',1547087817,1547087817,NULL,1);

/*!40000 ALTER TABLE `y_admin_log_datas` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table y_admin_logs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `y_admin_logs`;

CREATE TABLE `y_admin_logs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL COMMENT '用户id',
  `resource_id` int(10) NOT NULL DEFAULT '0' COMMENT '资源id，如果是0证明是添加？',
  `title` varchar(100) NOT NULL,
  `log_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1get，2post，3put，4deldet',
  `log_url` varchar(255) NOT NULL COMMENT '访问url',
  `log_ip` bigint(15) NOT NULL COMMENT '操作ip',
  `create_time` int(11) unsigned NOT NULL COMMENT '操作时间',
  `delete_time` int(10) unsigned DEFAULT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '默认状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='后台用户操作日志表';

LOCK TABLES `y_admin_logs` WRITE;
/*!40000 ALTER TABLE `y_admin_logs` DISABLE KEYS */;

INSERT INTO `y_admin_logs` (`id`, `user_id`, `resource_id`, `title`, `log_type`, `log_url`, `log_ip`, `create_time`, `delete_time`, `status`)
VALUES
	(1,1,0,'登录',2,'admin/auth/login.html',3232243969,1538104685,NULL,1),
	(2,1,-1,'二维码生成',2,'admin/extend/qrcode.html',3232243969,1538110842,NULL,1),
	(3,1,-1,'Excel导入导出',2,'admin/extend/excel.html',3232243969,1538110884,NULL,1),
	(4,1,1,'修改设置',2,'admin/sysconfig/edit.html',3232243969,1538110950,NULL,1),
	(5,1,-1,'Excel导入导出',2,'admin/extend/excel.html',3232243969,1538111051,NULL,1),
	(6,1,0,'登录',2,'admin/auth/login.html',2886926337,1547087817,NULL,1);

/*!40000 ALTER TABLE `y_admin_logs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table y_admin_mail_logs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `y_admin_mail_logs`;

CREATE TABLE `y_admin_mail_logs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL COMMENT '用户id',
  `address` varchar(255) NOT NULL DEFAULT '0' COMMENT '资源id，如果是0证明是添加？',
  `subject` varchar(255) NOT NULL,
  `content` text NOT NULL COMMENT '1get，2post，3put，4deldet',
  `attachment_name` varchar(255) NOT NULL DEFAULT '' COMMENT '附件名称',
  `attachment_path` varchar(255) NOT NULL DEFAULT '' COMMENT '附件地址',
  `attachment_url` varchar(255) NOT NULL DEFAULT '' COMMENT '附件url',
  `is_success` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否成功',
  `error_message` varchar(255) NOT NULL DEFAULT '',
  `create_time` int(11) unsigned NOT NULL COMMENT '操作时间',
  `delete_time` int(10) unsigned DEFAULT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '默认状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='邮件发送记录表';



# Dump of table y_admin_menus
# ------------------------------------------------------------

DROP TABLE IF EXISTS `y_admin_menus`;

CREATE TABLE `y_admin_menus` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '菜单id',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `title` varchar(50) NOT NULL COMMENT '菜单名称',
  `url` varchar(100) NOT NULL COMMENT '模块/控制器/方法',
  `icon` varchar(50) NOT NULL DEFAULT 'fa-circle-o' COMMENT '菜单图标',
  `condition` varchar(255) DEFAULT '',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `sort_id` smallint(5) unsigned NOT NULL DEFAULT '1000' COMMENT '排序id',
  `log_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0不记录日志，1get，2post，3put，4delete，先这些啦',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '认证方式，1为实时认证，2为登录认证',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态：1默认正常，2禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='后台菜单表';

LOCK TABLES `y_admin_menus` WRITE;
/*!40000 ALTER TABLE `y_admin_menus` DISABLE KEYS */;

INSERT INTO `y_admin_menus` (`id`, `parent_id`, `title`, `url`, `icon`, `condition`, `is_show`, `sort_id`, `log_type`, `type`, `status`)
VALUES
	(1,0,'后台首页','admin/index/index','fa-home','',1,1,0,1,1),
	(2,0,'系统管理','admin/sys','fa-desktop','',1,100,0,1,1),
	(3,2,'个人资料','admin/admin_user/profile','fa-edit','',0,2,0,1,1),
	(4,2,'用户管理','admin/admin_user/index','fa-user','',1,99,0,1,1),
	(5,4,'添加用户','admin/admin_user/add','fa-plus','',0,100,2,1,1),
	(6,4,'修改用户','admin/admin_user/edit','fa-edit','',0,100,2,1,1),
	(7,4,'删除用户','admin/admin_user/del','fa-close','',0,100,1,1,1),
	(8,2,'角色管理','admin/admin_group/index','fa-group','',1,100,0,1,1),
	(9,8,'添加角色','admin/admin_group/add','fa-plus','',0,100,2,1,1),
	(10,8,'修改角色','admin/admin_group/edit','fa-edit','',0,100,2,1,1),
	(11,8,'删除角色','admin/admin_group/del','fa-close','',0,100,1,1,1),
	(12,8,'授权管理','admin/admin_group/access','fa-key','',0,100,2,1,1),
	(13,2,'菜单管理','admin/admin_menu/index','fa-th-list','',1,100,0,1,1),
	(14,13,'添加菜单','admin/admin_menu/add','fa-plus','',0,100,2,1,1),
	(15,13,'修改菜单','admin/admin_menu/edit','fa-edit','',0,100,2,1,1),
	(16,13,'删除菜单','admin/admin_menu/del','fa-close','',0,100,1,1,1),
	(17,2,'日志管理','admin/admin_log','fa-info','',1,100,0,1,1),
	(18,17,'操作日志','admin/admin_log/index','fa-keyboard-o','',1,100,0,1,1),
	(19,18,'查看日志','admin/admin_log/view','fa-search-plus','',0,100,0,1,1),
	(20,17,'系统日志','admin/syslog/index','fa-info-circle','',1,100,0,1,1),
	(21,2,'文件管理','admin/admin_file/index','fa-file-archive-o','',1,101,0,1,1),
	(22,21,'上传文件','admin/admin_file/upload','fa-upload','',0,100,2,1,1),
	(23,21,'下载文件','admin/admin_file/download','fa-download','',0,100,1,1,1),
	(24,21,'修改文件','admin/admin_file/edit','fa-edit','',0,1000,2,1,1),
	(25,21,'删除文件','admin/admin_file/del','fa-crash','',0,100,1,1,1),
	(26,2,'数据维护','admin/data','fa-database','',1,100,0,1,1),
	(27,26,'数据库备份','admin/databack/index','fa-database','',1,100,0,1,1),
	(28,27,'添加备份','admin/databack/add','fa-plus','',0,100,0,1,1),
	(29,27,'删除备份','admin/databack/del','fa-close','',0,100,1,1,1),
	(30,27,'还原备份','admin/databack/reduction','fa-circle-o','',0,100,0,1,1),
	(31,26,'数据表管理','admin/database/index','fa-list','',1,100,0,1,1),
	(32,31,'优化表','admin/database/optimize','fa-refresh','',0,100,1,1,1),
	(33,31,'修复表','admin/database/repair','fa-circle-o-notch','',0,100,1,1,1),
	(34,31,'查看表详情','admin/database/view','fa-info-circle','',0,100,1,1,1),
	(35,2,'扩展功能','admin/extend/index','fa-plus-circle','',1,102,0,1,1),
	(36,35,'Ueditor','admin/extend/ueditor','fa-edit','',0,100,2,1,1),
	(37,35,'短信发送','admin/extend/sms','fa-comment','',0,100,2,1,1),
	(38,35,'发送邮件','admin/extend/email','fa-envelope','',0,100,2,1,1),
	(39,35,'阿里云oss','admin/extend/aliyunoss','fa-cloud-upload','',0,100,0,1,1),
	(40,35,'七牛云存储','admin/extend/qiniu','fa-cloud','',0,100,0,1,1),
	(41,35,'二维码生成','admin/extend/qrcode','fa-qrcode','',0,100,2,1,1),
	(42,35,'Excel导入导出','admin/extend/excel','fa-file-excel-o','',0,110,2,1,1),
	(43,35,'MarkDown编辑器','admin/extend/markdown','fa-file-text-o','',0,100,1,1,1),
	(44,36,'编辑器上传','admin/extend/ueserver','fa-server','',0,100,2,1,1),
	(45,2,'系统设置','admin/sysconfig/index','fa-cogs','',1,998,0,1,1),
	(46,45,'添加设置','admin/sysconfig/add','fa-plus','',0,100,2,1,1),
	(47,45,'修改设置','admin/sysconfig/edit','fa-edit','',0,100,2,1,1),
	(48,45,'删除设置','admin/sysconfig/del','fa-close','',0,100,1,1,1),
	(49,0,'统计管理','admin/statistics/default','fa-pie-chart','',1,1234,0,1,1),
	(50,49,'统计概览','admin/statistics/index','fa-bar-chart','',1,100,0,1,1);

/*!40000 ALTER TABLE `y_admin_menus` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table y_admin_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `y_admin_users`;

CREATE TABLE `y_admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `name` varchar(50) NOT NULL COMMENT '用户名（登录帐号）',
  `password` char(32) NOT NULL COMMENT '密码',
  `nickname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '用户昵称或中文用户名',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `mobile` char(11) DEFAULT NULL COMMENT '手机号',
  `avatar` varchar(255) DEFAULT 'avatar.png' COMMENT '用户头像',
  `qq_openid` varchar(64) DEFAULT NULL,
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `delete_time` int(10) unsigned DEFAULT NULL COMMENT '删除时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '用户状态1正常，0冻结',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='后台用户表';

LOCK TABLES `y_admin_users` WRITE;
/*!40000 ALTER TABLE `y_admin_users` DISABLE KEYS */;

INSERT INTO `y_admin_users` (`id`, `name`, `password`, `nickname`, `email`, `mobile`, `avatar`, `qq_openid`, `create_time`, `update_time`, `delete_time`, `status`)
VALUES
	(1,'admin','21232f297a57a5a743894a0e4a801fc3','超级管理员','','18855550000','1\\20171212\\dc6f12bb9a981882e3d559a5af1addd0.png',NULL,1488189586,1513148717,NULL,1),
	(2,'admin2','21232f297a57a5a743894a0e4a801fc3','管理员2','','','1\\20171212\\dc6f12bb9a981882e3d559a5af1addd0.png',NULL,1488189586,1513185374,NULL,1);

/*!40000 ALTER TABLE `y_admin_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table y_attachments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `y_attachments`;

CREATE TABLE `y_attachments` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '物理路径',
  `imagewidth` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '宽度',
  `imageheight` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '高度',
  `imagetype` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图片类型',
  `imageframes` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '图片帧数',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `mimetype` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'mime类型',
  `extparam` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '透传数据',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建日期',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `uploadtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  `storage` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `sha1` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT COMMENT='附件表';



# Dump of table y_excel_examples
# ------------------------------------------------------------

DROP TABLE IF EXISTS `y_excel_examples`;

CREATE TABLE `y_excel_examples` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `age` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `sex` varchar(8) NOT NULL,
  `city` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Excel示例表';

LOCK TABLES `y_excel_examples` WRITE;
/*!40000 ALTER TABLE `y_excel_examples` DISABLE KEYS */;

INSERT INTO `y_excel_examples` (`id`, `name`, `age`, `sex`, `city`)
VALUES
	(1,'测试1',25,'男','济南'),
	(2,'测试2',24,'女','济南'),
	(3,'测试3',24,'女','济南'),
	(4,'测试4',25,'男','济南');

/*!40000 ALTER TABLE `y_excel_examples` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table y_request_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `y_request_type`;

CREATE TABLE `y_request_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL COMMENT '请求代码',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '默认状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='请求类型表';

LOCK TABLES `y_request_type` WRITE;
/*!40000 ALTER TABLE `y_request_type` DISABLE KEYS */;

INSERT INTO `y_request_type` (`id`, `title`, `status`)
VALUES
	(1,'GET',1),
	(2,'POST',1),
	(3,'PUT',1),
	(4,'DELETE',1);

/*!40000 ALTER TABLE `y_request_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table y_sysconfig_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `y_sysconfig_groups`;

CREATE TABLE `y_sysconfig_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '分组名称',
  `sort_id` int(11) unsigned NOT NULL DEFAULT '1000' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统设置分组';

LOCK TABLES `y_sysconfig_groups` WRITE;
/*!40000 ALTER TABLE `y_sysconfig_groups` DISABLE KEYS */;

INSERT INTO `y_sysconfig_groups` (`id`, `name`, `sort_id`)
VALUES
	(1,'系统设置',1000),
	(2,'扩展参数设置',1000);

/*!40000 ALTER TABLE `y_sysconfig_groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table y_sysconfigs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `y_sysconfigs`;

CREATE TABLE `y_sysconfigs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '默认1，系统设置',
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否启用，1启用，0禁用',
  `description` varchar(255) NOT NULL,
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  `delete_time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统参数表';

LOCK TABLES `y_sysconfigs` WRITE;
/*!40000 ALTER TABLE `y_sysconfigs` DISABLE KEYS */;

INSERT INTO `y_sysconfigs` (`id`, `group_id`, `name`, `code`, `content`, `status`, `description`, `create_time`, `update_time`, `delete_time`)
VALUES
	(1,1,'mini 抖音','site_name','BearAdmin',1,'网站后台名称，title和登录界面显示',1502187289,0,NULL),
	(2,1,'测试','ceshi','昵称',1,'昵称说明',1506366998,0,NULL);

/*!40000 ALTER TABLE `y_sysconfigs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table y_syslog_trace
# ------------------------------------------------------------

DROP TABLE IF EXISTS `y_syslog_trace`;

CREATE TABLE `y_syslog_trace` (
  `trace_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `log_id` int(11) unsigned NOT NULL COMMENT 'log id',
  `trace` text,
  `id` int(11) DEFAULT NULL,
  PRIMARY KEY (`trace_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统日志trace表';

LOCK TABLES `y_syslog_trace` WRITE;
/*!40000 ALTER TABLE `y_syslog_trace` DISABLE KEYS */;

INSERT INTO `y_syslog_trace` (`trace_id`, `log_id`, `trace`, `id`)
VALUES
	(1,1,'#0 /vagrant/wwwroot/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, NULL)\n#1 /vagrant/wwwroot/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#2 /vagrant/wwwroot/base/thinkphp/start.php(19): think\\App::run()\n#3 /vagrant/wwwroot/base/public/index.php(17): require(\'/vagrant/wwwroo...\')\n#4 {main}',NULL),
	(2,2,'#0 /vagrant/wwwroot/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, NULL)\n#1 /vagrant/wwwroot/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#2 /vagrant/wwwroot/base/thinkphp/start.php(19): think\\App::run()\n#3 /vagrant/wwwroot/base/public/index.php(17): require(\'/vagrant/wwwroo...\')\n#4 {main}',NULL),
	(3,3,'#0 /vagrant/wwwroot/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, NULL)\n#1 /vagrant/wwwroot/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#2 /vagrant/wwwroot/base/thinkphp/start.php(19): think\\App::run()\n#3 /vagrant/wwwroot/base/public/index.php(17): require(\'/vagrant/wwwroo...\')\n#4 {main}',NULL),
	(4,4,'#0 /vagrant/wwwroot/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, NULL)\n#1 /vagrant/wwwroot/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#2 /vagrant/wwwroot/base/thinkphp/start.php(19): think\\App::run()\n#3 /vagrant/wwwroot/base/public/index.php(17): require(\'/vagrant/wwwroo...\')\n#4 {main}',NULL),
	(5,5,'#0 [internal function]: think\\Error::appError(2, \'strpos() expect...\', \'/vagrant/wwwroo...\', 41, Array)\n#1 /vagrant/wwwroot/base/thinkphp/library/traits/controller/Jump.php(41): strpos(Array, \'://\')\n#2 /vagrant/wwwroot/base/application/admin/controller/Base.php(175): think\\Controller->success(\'success\', Array, Array, 3, Array)\n#3 /vagrant/wwwroot/base/application/admin/controller/Extend.php(164): app\\admin\\controller\\Base->success(\'success\', Array, Array)\n#4 [internal function]: app\\admin\\controller\\Extend->qrcode()\n#5 /vagrant/wwwroot/base/thinkphp/library/think/App.php(343): ReflectionMethod->invokeArgs(Object(app\\admin\\controller\\Extend), Array)\n#6 /vagrant/wwwroot/base/thinkphp/library/think/App.php(606): think\\App::invokeMethod(Array, Array)\n#7 /vagrant/wwwroot/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, true)\n#8 /vagrant/wwwroot/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#9 /vagrant/wwwroot/base/thinkphp/start.php(19): think\\App::run()\n#10 /vagrant/wwwroot/base/public/index.php(17): require(\'/vagrant/wwwroo...\')\n#11 {main}',NULL),
	(6,6,'#0 /vagrant/wwwroot/base/thinkphp/library/think/db/Query.php(262): think\\db\\Connection->execute(\'INSERT INTO `y_...\', Array, Object(think\\db\\Query))\n#1 /vagrant/wwwroot/base/thinkphp/library/think/db/Query.php(2228): think\\db\\Query->execute(\'INSERT INTO `y_...\', Array, Object(think\\db\\Query))\n#2 /vagrant/wwwroot/base/thinkphp/library/think/Model.php(1168): think\\db\\Query->insert(Array, false, false, NULL)\n#3 /vagrant/wwwroot/base/thinkphp/library/think/Model.php(1649): think\\Model->save(Array, Array)\n#4 /vagrant/wwwroot/base/thinkphp/library/think/Model.php(1368): think\\Model::create(Array, Array)\n#5 /vagrant/wwwroot/base/application/admin/controller/Extend.php(291): think\\Model->saveAll(Array)\n#6 [internal function]: app\\admin\\controller\\Extend->excel()\n#7 /vagrant/wwwroot/base/thinkphp/library/think/App.php(343): ReflectionMethod->invokeArgs(Object(app\\admin\\controller\\Extend), Array)\n#8 /vagrant/wwwroot/base/thinkphp/library/think/App.php(606): think\\App::invokeMethod(Array, Array)\n#9 /vagrant/wwwroot/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, true)\n#10 /vagrant/wwwroot/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#11 /vagrant/wwwroot/base/thinkphp/start.php(19): think\\App::run()\n#12 /vagrant/wwwroot/base/public/index.php(17): require(\'/vagrant/wwwroo...\')\n#13 {main}',NULL),
	(7,7,'#0 /vagrant/wwwroot/base/extend/tools/AliOss.php(22): OSS\\OssClient->__construct(\'\', \'\', \'\')\n#1 /vagrant/wwwroot/base/application/admin/controller/Extend.php(225): tools\\AliOss::upload(Array)\n#2 [internal function]: app\\admin\\controller\\Extend->aliyunoss()\n#3 /vagrant/wwwroot/base/thinkphp/library/think/App.php(343): ReflectionMethod->invokeArgs(Object(app\\admin\\controller\\Extend), Array)\n#4 /vagrant/wwwroot/base/thinkphp/library/think/App.php(606): think\\App::invokeMethod(Array, Array)\n#5 /vagrant/wwwroot/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, true)\n#6 /vagrant/wwwroot/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#7 /vagrant/wwwroot/base/thinkphp/start.php(19): think\\App::run()\n#8 /vagrant/wwwroot/base/public/index.php(17): require(\'/vagrant/wwwroo...\')\n#9 {main}',NULL),
	(8,8,'#0 /var/www/html/base/thinkphp/library/think/Model.php(2278): think\\Model->getAttr(\'nickname\')\n#1 /var/www/html/base/runtime/temp/68de68ef072315b9c65f707a00015b68.php(64): think\\Model->offsetGet(\'nickname\')\n#2 /var/www/html/base/thinkphp/library/think/template/driver/File.php(53): include(\'/var/www/html/b...\')\n#3 /var/www/html/base/thinkphp/library/think/Template.php(188): think\\template\\driver\\File->read(\'/var/www/html/b...\', Array)\n#4 /var/www/html/base/thinkphp/library/think/view/driver/Think.php(86): think\\Template->fetch(\'/var/www/html/b...\', Array, Array)\n#5 /var/www/html/base/thinkphp/library/think/View.php(163): think\\view\\driver\\Think->fetch(\'/var/www/html/b...\', Array, Array)\n#6 /var/www/html/base/thinkphp/library/think/Controller.php(120): think\\View->fetch(\'\', Array, Array, Array)\n#7 /var/www/html/base/application/admin/controller/Base.php(338): think\\Controller->fetch(\'\', Array, Array, Array)\n#8 /var/www/html/base/application/admin/controller/Index.php(32): app\\admin\\controller\\Base->fetch()\n#9 [internal function]: app\\admin\\controller\\Index->index()\n#10 /var/www/html/base/thinkphp/library/think/App.php(343): ReflectionMethod->invokeArgs(Object(app\\admin\\controller\\Index), Array)\n#11 /var/www/html/base/thinkphp/library/think/App.php(606): think\\App::invokeMethod(Array, Array)\n#12 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, true)\n#13 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#14 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#15 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#16 {main}',NULL),
	(9,9,'#0 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, NULL)\n#1 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#2 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#3 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#4 {main}',NULL),
	(10,10,'#0 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, NULL)\n#1 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#2 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#3 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#4 {main}',NULL),
	(11,11,'#0 /var/www/html/base/thinkphp/library/think/db/Query.php(248): think\\db\\Connection->query(\'SELECT `id`,`lo...\', Array, false, false)\n#1 /var/www/html/base/thinkphp/library/think/db/Query.php(2476): think\\db\\Query->query(\'SELECT `id`,`lo...\', Array, false, false)\n#2 /var/www/html/base/thinkphp/library/think/model/relation/OneToOne.php(316): think\\db\\Query->select()\n#3 /var/www/html/base/thinkphp/library/think/model/relation/HasOne.php(143): think\\model\\relation\\OneToOne->eagerlyWhere(Object(think\\db\\Query), Array, \'log_id\', \'syslogTrace\', \'\', false)\n#4 /var/www/html/base/thinkphp/library/think/model/relation/OneToOne.php(134): think\\model\\relation\\HasOne->eagerlySet(Array, \'syslogTrace\', \'\', false)\n#5 /var/www/html/base/thinkphp/library/think/Model.php(1913): think\\model\\relation\\OneToOne->eagerlyResultSet(Array, \'syslogTrace\', \'\', false)\n#6 /var/www/html/base/thinkphp/library/think/db/Query.php(2511): think\\Model->eagerlyResultSet(Array, \'syslogTrace\')\n#7 /var/www/html/base/thinkphp/library/think/db/Query.php(1447): think\\db\\Query->select()\n#8 /var/www/html/base/application/admin/controller/Syslog.php(39): think\\db\\Query->paginate(10, false, Array)\n#9 [internal function]: app\\admin\\controller\\Syslog->index()\n#10 /var/www/html/base/thinkphp/library/think/App.php(343): ReflectionMethod->invokeArgs(Object(app\\admin\\controller\\Syslog), Array)\n#11 /var/www/html/base/thinkphp/library/think/App.php(606): think\\App::invokeMethod(Array, Array)\n#12 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, true)\n#13 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#14 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#15 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#16 {main}',NULL),
	(12,12,'#0 /var/www/html/base/thinkphp/library/think/db/connector/Mysql.php(65): think\\db\\Connection->query(\'SHOW COLUMNS FR...\', Array, false, true)\n#1 /var/www/html/base/thinkphp/library/think/db/Query.php(1883): think\\db\\connector\\Mysql->getFields(\'`y_attachments`\')\n#2 /var/www/html/base/thinkphp/library/think/db/Query.php(1931): think\\db\\Query->getTableInfo(\'y_attachments\', \'type\')\n#3 /var/www/html/base/thinkphp/library/think/db/Query.php(1937): think\\db\\Query->getFieldsType(\'y_attachments\')\n#4 /var/www/html/base/thinkphp/library/think/db/Builder.php(266): think\\db\\Query->getFieldsBind(\'y_attachments\')\n#5 /var/www/html/base/thinkphp/library/think/db/Builder.php(236): think\\db\\Builder->buildWhere(Array, Array)\n#6 /var/www/html/base/thinkphp/library/think/db/Builder.php(715): think\\db\\Builder->parseWhere(Array, Array)\n#7 /var/www/html/base/thinkphp/library/think/db/Query.php(2415): think\\db\\Builder->select(Array)\n#8 /var/www/html/base/thinkphp/library/think/db/Query.php(434): think\\db\\Query->getPdo()\n#9 /var/www/html/base/thinkphp/library/think/db/Query.php(540): think\\db\\Query->value(\'COUNT(*) AS tp_...\', 0, true)\n#10 /var/www/html/base/thinkphp/library/think/db/Query.php(1446): think\\db\\Query->count()\n#11 /var/www/html/base/application/admin/controller/AdminFile.php(51): think\\db\\Query->paginate(10, false, Array)\n#12 [internal function]: app\\admin\\controller\\AdminFile->index()\n#13 /var/www/html/base/thinkphp/library/think/App.php(343): ReflectionMethod->invokeArgs(Object(app\\admin\\controller\\AdminFile), Array)\n#14 /var/www/html/base/thinkphp/library/think/App.php(606): think\\App::invokeMethod(Array, Array)\n#15 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, true)\n#16 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#17 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#18 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#19 {main}',NULL),
	(13,13,'#0 /var/www/html/base/thinkphp/library/think/db/connector/Mysql.php(65): think\\db\\Connection->query(\'SHOW COLUMNS FR...\', Array, false, true)\n#1 /var/www/html/base/thinkphp/library/think/db/Query.php(1883): think\\db\\connector\\Mysql->getFields(\'`y_attachments`\')\n#2 /var/www/html/base/thinkphp/library/think/db/Query.php(1931): think\\db\\Query->getTableInfo(\'y_attachments\', \'type\')\n#3 /var/www/html/base/thinkphp/library/think/db/Query.php(1937): think\\db\\Query->getFieldsType(\'y_attachments\')\n#4 /var/www/html/base/thinkphp/library/think/db/Builder.php(266): think\\db\\Query->getFieldsBind(\'y_attachments\')\n#5 /var/www/html/base/thinkphp/library/think/db/Builder.php(236): think\\db\\Builder->buildWhere(Array, Array)\n#6 /var/www/html/base/thinkphp/library/think/db/Builder.php(715): think\\db\\Builder->parseWhere(Array, Array)\n#7 /var/www/html/base/thinkphp/library/think/db/Query.php(2415): think\\db\\Builder->select(Array)\n#8 /var/www/html/base/thinkphp/library/think/db/Query.php(434): think\\db\\Query->getPdo()\n#9 /var/www/html/base/thinkphp/library/think/db/Query.php(540): think\\db\\Query->value(\'COUNT(*) AS tp_...\', 0, true)\n#10 /var/www/html/base/thinkphp/library/think/db/Query.php(1446): think\\db\\Query->count()\n#11 /var/www/html/base/application/admin/controller/AdminFile.php(51): think\\db\\Query->paginate(10, false, Array)\n#12 [internal function]: app\\admin\\controller\\AdminFile->index()\n#13 /var/www/html/base/thinkphp/library/think/App.php(343): ReflectionMethod->invokeArgs(Object(app\\admin\\controller\\AdminFile), Array)\n#14 /var/www/html/base/thinkphp/library/think/App.php(606): think\\App::invokeMethod(Array, Array)\n#15 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, true)\n#16 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#17 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#18 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#19 {main}',NULL),
	(14,14,'#0 /var/www/html/base/thinkphp/library/think/db/connector/Mysql.php(65): think\\db\\Connection->query(\'SHOW COLUMNS FR...\', Array, false, true)\n#1 /var/www/html/base/thinkphp/library/think/db/Query.php(1883): think\\db\\connector\\Mysql->getFields(\'`y_attachments`\')\n#2 /var/www/html/base/thinkphp/library/think/db/Query.php(1931): think\\db\\Query->getTableInfo(\'y_attachments\', \'type\')\n#3 /var/www/html/base/thinkphp/library/think/db/Query.php(1937): think\\db\\Query->getFieldsType(\'y_attachments\')\n#4 /var/www/html/base/thinkphp/library/think/db/Builder.php(266): think\\db\\Query->getFieldsBind(\'y_attachments\')\n#5 /var/www/html/base/thinkphp/library/think/db/Builder.php(236): think\\db\\Builder->buildWhere(Array, Array)\n#6 /var/www/html/base/thinkphp/library/think/db/Builder.php(715): think\\db\\Builder->parseWhere(Array, Array)\n#7 /var/www/html/base/thinkphp/library/think/db/Query.php(2415): think\\db\\Builder->select(Array)\n#8 /var/www/html/base/thinkphp/library/think/db/Query.php(434): think\\db\\Query->getPdo()\n#9 /var/www/html/base/thinkphp/library/think/db/Query.php(540): think\\db\\Query->value(\'COUNT(*) AS tp_...\', 0, true)\n#10 /var/www/html/base/thinkphp/library/think/db/Query.php(1446): think\\db\\Query->count()\n#11 /var/www/html/base/application/admin/controller/AdminFile.php(51): think\\db\\Query->paginate(10, false, Array)\n#12 [internal function]: app\\admin\\controller\\AdminFile->index()\n#13 /var/www/html/base/thinkphp/library/think/App.php(343): ReflectionMethod->invokeArgs(Object(app\\admin\\controller\\AdminFile), Array)\n#14 /var/www/html/base/thinkphp/library/think/App.php(606): think\\App::invokeMethod(Array, Array)\n#15 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, true)\n#16 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#17 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#18 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#19 {main}',NULL),
	(15,15,'#0 /var/www/html/base/thinkphp/library/think/db/Query.php(248): think\\db\\Connection->query(\'SELECT `id`,`lo...\', Array, false, false)\n#1 /var/www/html/base/thinkphp/library/think/db/Query.php(2476): think\\db\\Query->query(\'SELECT `id`,`lo...\', Array, false, false)\n#2 /var/www/html/base/thinkphp/library/think/model/relation/OneToOne.php(316): think\\db\\Query->select()\n#3 /var/www/html/base/thinkphp/library/think/model/relation/HasOne.php(143): think\\model\\relation\\OneToOne->eagerlyWhere(Object(think\\db\\Query), Array, \'log_id\', \'syslogTrace\', \'\', false)\n#4 /var/www/html/base/thinkphp/library/think/model/relation/OneToOne.php(134): think\\model\\relation\\HasOne->eagerlySet(Array, \'syslogTrace\', \'\', false)\n#5 /var/www/html/base/thinkphp/library/think/Model.php(1913): think\\model\\relation\\OneToOne->eagerlyResultSet(Array, \'syslogTrace\', \'\', false)\n#6 /var/www/html/base/thinkphp/library/think/db/Query.php(2511): think\\Model->eagerlyResultSet(Array, \'syslogTrace\')\n#7 /var/www/html/base/thinkphp/library/think/db/Query.php(1447): think\\db\\Query->select()\n#8 /var/www/html/base/application/admin/controller/Syslog.php(39): think\\db\\Query->paginate(10, false, Array)\n#9 [internal function]: app\\admin\\controller\\Syslog->index()\n#10 /var/www/html/base/thinkphp/library/think/App.php(343): ReflectionMethod->invokeArgs(Object(app\\admin\\controller\\Syslog), Array)\n#11 /var/www/html/base/thinkphp/library/think/App.php(606): think\\App::invokeMethod(Array, Array)\n#12 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, true)\n#13 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#14 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#15 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#16 {main}',NULL),
	(16,16,'#0 /var/www/html/base/thinkphp/library/think/db/Query.php(248): think\\db\\Connection->query(\'SELECT `id`,`lo...\', Array, false, false)\n#1 /var/www/html/base/thinkphp/library/think/db/Query.php(2476): think\\db\\Query->query(\'SELECT `id`,`lo...\', Array, false, false)\n#2 /var/www/html/base/thinkphp/library/think/model/relation/OneToOne.php(316): think\\db\\Query->select()\n#3 /var/www/html/base/thinkphp/library/think/model/relation/HasOne.php(143): think\\model\\relation\\OneToOne->eagerlyWhere(Object(think\\db\\Query), Array, \'log_id\', \'syslogTrace\', \'\', false)\n#4 /var/www/html/base/thinkphp/library/think/model/relation/OneToOne.php(134): think\\model\\relation\\HasOne->eagerlySet(Array, \'syslogTrace\', \'\', false)\n#5 /var/www/html/base/thinkphp/library/think/Model.php(1913): think\\model\\relation\\OneToOne->eagerlyResultSet(Array, \'syslogTrace\', \'\', false)\n#6 /var/www/html/base/thinkphp/library/think/db/Query.php(2511): think\\Model->eagerlyResultSet(Array, \'syslogTrace\')\n#7 /var/www/html/base/thinkphp/library/think/db/Query.php(1447): think\\db\\Query->select()\n#8 /var/www/html/base/application/admin/controller/Syslog.php(39): think\\db\\Query->paginate(10, false, Array)\n#9 [internal function]: app\\admin\\controller\\Syslog->index()\n#10 /var/www/html/base/thinkphp/library/think/App.php(343): ReflectionMethod->invokeArgs(Object(app\\admin\\controller\\Syslog), Array)\n#11 /var/www/html/base/thinkphp/library/think/App.php(606): think\\App::invokeMethod(Array, Array)\n#12 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, true)\n#13 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#14 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#15 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#16 {main}',NULL),
	(17,17,'#0 /var/www/html/base/thinkphp/library/think/db/connector/Mysql.php(65): think\\db\\Connection->query(\'SHOW COLUMNS FR...\', Array, false, true)\n#1 /var/www/html/base/thinkphp/library/think/db/Query.php(1883): think\\db\\connector\\Mysql->getFields(\'`y_attachments`\')\n#2 /var/www/html/base/thinkphp/library/think/db/Query.php(1931): think\\db\\Query->getTableInfo(\'y_attachments\', \'type\')\n#3 /var/www/html/base/thinkphp/library/think/db/Query.php(1937): think\\db\\Query->getFieldsType(\'y_attachments\')\n#4 /var/www/html/base/thinkphp/library/think/db/Builder.php(266): think\\db\\Query->getFieldsBind(\'y_attachments\')\n#5 /var/www/html/base/thinkphp/library/think/db/Builder.php(236): think\\db\\Builder->buildWhere(Array, Array)\n#6 /var/www/html/base/thinkphp/library/think/db/Builder.php(715): think\\db\\Builder->parseWhere(Array, Array)\n#7 /var/www/html/base/thinkphp/library/think/db/Query.php(2415): think\\db\\Builder->select(Array)\n#8 /var/www/html/base/thinkphp/library/think/db/Query.php(434): think\\db\\Query->getPdo()\n#9 /var/www/html/base/thinkphp/library/think/db/Query.php(540): think\\db\\Query->value(\'COUNT(*) AS tp_...\', 0, true)\n#10 /var/www/html/base/thinkphp/library/think/db/Query.php(1446): think\\db\\Query->count()\n#11 /var/www/html/base/application/admin/controller/AdminFile.php(51): think\\db\\Query->paginate(10, false, Array)\n#12 [internal function]: app\\admin\\controller\\AdminFile->index()\n#13 /var/www/html/base/thinkphp/library/think/App.php(343): ReflectionMethod->invokeArgs(Object(app\\admin\\controller\\AdminFile), Array)\n#14 /var/www/html/base/thinkphp/library/think/App.php(606): think\\App::invokeMethod(Array, Array)\n#15 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, true)\n#16 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#17 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#18 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#19 {main}',NULL),
	(18,18,'#0 /var/www/html/base/thinkphp/library/think/db/Query.php(248): think\\db\\Connection->query(\'SELECT COUNT(*)...\', Array, false, true)\n#1 /var/www/html/base/thinkphp/library/think/db/Query.php(2423): think\\db\\Query->query(\'SELECT COUNT(*)...\', Array, false, true)\n#2 /var/www/html/base/thinkphp/library/think/db/Query.php(434): think\\db\\Query->getPdo()\n#3 /var/www/html/base/thinkphp/library/think/db/Query.php(540): think\\db\\Query->value(\'COUNT(*) AS tp_...\', 0, true)\n#4 /var/www/html/base/thinkphp/library/think/db/Query.php(1446): think\\db\\Query->count()\n#5 /var/www/html/base/application/admin/controller/AdminFile.php(51): think\\db\\Query->paginate(10, false, Array)\n#6 [internal function]: app\\admin\\controller\\AdminFile->index()\n#7 /var/www/html/base/thinkphp/library/think/App.php(343): ReflectionMethod->invokeArgs(Object(app\\admin\\controller\\AdminFile), Array)\n#8 /var/www/html/base/thinkphp/library/think/App.php(606): think\\App::invokeMethod(Array, Array)\n#9 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, true)\n#10 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#11 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#12 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#13 {main}',NULL),
	(19,19,'#0 /var/www/html/base/thinkphp/library/think/db/Query.php(248): think\\db\\Connection->query(\'SELECT `id`,`lo...\', Array, false, false)\n#1 /var/www/html/base/thinkphp/library/think/db/Query.php(2476): think\\db\\Query->query(\'SELECT `id`,`lo...\', Array, false, false)\n#2 /var/www/html/base/thinkphp/library/think/model/relation/OneToOne.php(316): think\\db\\Query->select()\n#3 /var/www/html/base/thinkphp/library/think/model/relation/HasOne.php(143): think\\model\\relation\\OneToOne->eagerlyWhere(Object(think\\db\\Query), Array, \'log_id\', \'syslogTrace\', \'\', false)\n#4 /var/www/html/base/thinkphp/library/think/model/relation/OneToOne.php(134): think\\model\\relation\\HasOne->eagerlySet(Array, \'syslogTrace\', \'\', false)\n#5 /var/www/html/base/thinkphp/library/think/Model.php(1913): think\\model\\relation\\OneToOne->eagerlyResultSet(Array, \'syslogTrace\', \'\', false)\n#6 /var/www/html/base/thinkphp/library/think/db/Query.php(2511): think\\Model->eagerlyResultSet(Array, \'syslogTrace\')\n#7 /var/www/html/base/thinkphp/library/think/db/Query.php(1447): think\\db\\Query->select()\n#8 /var/www/html/base/application/admin/controller/Syslog.php(39): think\\db\\Query->paginate(10, false, Array)\n#9 [internal function]: app\\admin\\controller\\Syslog->index()\n#10 /var/www/html/base/thinkphp/library/think/App.php(343): ReflectionMethod->invokeArgs(Object(app\\admin\\controller\\Syslog), Array)\n#11 /var/www/html/base/thinkphp/library/think/App.php(606): think\\App::invokeMethod(Array, Array)\n#12 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, true)\n#13 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#14 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#15 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#16 {main}',NULL),
	(20,20,'#0 /var/www/html/base/thinkphp/library/think/db/Query.php(248): think\\db\\Connection->query(\'SELECT `id`,`lo...\', Array, false, false)\n#1 /var/www/html/base/thinkphp/library/think/db/Query.php(2476): think\\db\\Query->query(\'SELECT `id`,`lo...\', Array, false, false)\n#2 /var/www/html/base/thinkphp/library/think/model/relation/OneToOne.php(316): think\\db\\Query->select()\n#3 /var/www/html/base/thinkphp/library/think/model/relation/HasOne.php(143): think\\model\\relation\\OneToOne->eagerlyWhere(Object(think\\db\\Query), Array, \'log_id\', \'syslogTrace\', \'\', false)\n#4 /var/www/html/base/thinkphp/library/think/model/relation/OneToOne.php(134): think\\model\\relation\\HasOne->eagerlySet(Array, \'syslogTrace\', \'\', false)\n#5 /var/www/html/base/thinkphp/library/think/Model.php(1913): think\\model\\relation\\OneToOne->eagerlyResultSet(Array, \'syslogTrace\', \'\', false)\n#6 /var/www/html/base/thinkphp/library/think/db/Query.php(2511): think\\Model->eagerlyResultSet(Array, \'syslogTrace\')\n#7 /var/www/html/base/thinkphp/library/think/db/Query.php(1447): think\\db\\Query->select()\n#8 /var/www/html/base/application/admin/controller/Syslog.php(39): think\\db\\Query->paginate(10, false, Array)\n#9 [internal function]: app\\admin\\controller\\Syslog->index()\n#10 /var/www/html/base/thinkphp/library/think/App.php(343): ReflectionMethod->invokeArgs(Object(app\\admin\\controller\\Syslog), Array)\n#11 /var/www/html/base/thinkphp/library/think/App.php(606): think\\App::invokeMethod(Array, Array)\n#12 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, true)\n#13 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#14 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#15 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#16 {main}',NULL);

/*!40000 ALTER TABLE `y_syslog_trace` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table y_syslogs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `y_syslogs`;

CREATE TABLE `y_syslogs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `level` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '错误等级',
  `message` varchar(255) NOT NULL COMMENT '错误信息',
  `file` varchar(255) NOT NULL COMMENT '文件',
  `line` int(10) unsigned NOT NULL COMMENT '所在行数',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统错误日志表';

LOCK TABLES `y_syslogs` WRITE;
/*!40000 ALTER TABLE `y_syslogs` DISABLE KEYS */;

INSERT INTO `y_syslogs` (`id`, `level`, `message`, `file`, `line`, `create_time`)
VALUES
	(1,0,'module not exists:favicon.ico','/vagrant/wwwroot/base/thinkphp/library/think/App.php',535,1538104680),
	(2,0,'module not exists:api','/vagrant/wwwroot/base/thinkphp/library/think/App.php',535,1538104939),
	(3,0,'module not exists:api','/vagrant/wwwroot/base/thinkphp/library/think/App.php',535,1538104942),
	(4,0,'module not exists:jump.pjp','/vagrant/wwwroot/base/thinkphp/library/think/App.php',535,1538106475),
	(5,0,'strpos() expects parameter 1 to be string, array given','/vagrant/wwwroot/base/thinkphp/library/traits/controller/Jump.php',41,1538110843),
	(6,0,'SQLSTATE[23000]: Integrity constraint violation: 1048 Column \'sex\' cannot be null','/vagrant/wwwroot/base/thinkphp/library/think/db/Connection.php',463,1538110885),
	(7,0,'access key id is empty','/vagrant/wwwroot/base/vendor/aliyuncs/oss-sdk-php/src/OSS/OssClient.php',90,1538110906),
	(8,0,'property not exists:app\\admin\\model\\AdminUsers->nickname','/var/www/html/base/thinkphp/library/think/Model.php',624,1547087817),
	(9,0,'module not exists:1','/var/www/html/base/thinkphp/library/think/App.php',535,1547087950),
	(10,0,'module not exists:1','/var/www/html/base/thinkphp/library/think/App.php',535,1547100803),
	(11,0,'SQLSTATE[42S22]: Column not found: 1054 Unknown column \'id\' in \'field list\'','/var/www/html/base/thinkphp/library/think/db/Connection.php',390,1547100810),
	(12,0,'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'base.y_attachments\' doesn\'t exist','/var/www/html/base/thinkphp/library/think/db/Connection.php',390,1547100817),
	(13,0,'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'base.y_attachments\' doesn\'t exist','/var/www/html/base/thinkphp/library/think/db/Connection.php',390,1547100821),
	(14,0,'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'base.y_attachments\' doesn\'t exist','/var/www/html/base/thinkphp/library/think/db/Connection.php',390,1547100830),
	(15,0,'SQLSTATE[42S22]: Column not found: 1054 Unknown column \'id\' in \'field list\'','/var/www/html/base/thinkphp/library/think/db/Connection.php',390,1547100896),
	(16,0,'SQLSTATE[42S22]: Column not found: 1054 Unknown column \'id\' in \'field list\'','/var/www/html/base/thinkphp/library/think/db/Connection.php',390,1547100924),
	(17,0,'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'base.y_attachments\' doesn\'t exist','/var/www/html/base/thinkphp/library/think/db/Connection.php',390,1547100931),
	(18,0,'SQLSTATE[42S22]: Column not found: 1054 Unknown column \'y_attachments.delete_time\' in \'where clause\'','/var/www/html/base/thinkphp/library/think/db/Connection.php',390,1547100962),
	(19,0,'SQLSTATE[42S22]: Column not found: 1054 Unknown column \'id\' in \'field list\'','/var/www/html/base/thinkphp/library/think/db/Connection.php',390,1547101004),
	(20,0,'SQLSTATE[42S22]: Column not found: 1054 Unknown column \'id\' in \'field list\'','/var/www/html/base/thinkphp/library/think/db/Connection.php',390,1547101009);

/*!40000 ALTER TABLE `y_syslogs` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
