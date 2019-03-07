# ************************************************************
# Sequel Pro SQL dump
# Version 1
#
# https://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 8.0.13)
# Database: base
# Generation Time: 2019-01-29 02:59:43 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


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
	(2,1);

/*!40000 ALTER TABLE `y_admin_group_access` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table y_admin_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `y_admin_groups`;

CREATE TABLE `y_admin_groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '角色名称',
  `description` varchar(200) DEFAULT '' COMMENT '角色描述',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '默认为1启用，2冻结',
  `rules` varchar(2000) NOT NULL DEFAULT '' COMMENT '权限id集合',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色表';

LOCK TABLES `y_admin_groups` WRITE;
/*!40000 ALTER TABLE `y_admin_groups` DISABLE KEYS */;

INSERT INTO `y_admin_groups` (`id`, `name`, `description`, `status`, `rules`)
VALUES
	(1,'管理员','管理员角色',1,'1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,26,27,28,29,30,31,32,33,34,21,22,23,25,24,35,36,44,37,38,39,40,41,43,42,45,46,47,48,49,50,51,52,53,54');

/*!40000 ALTER TABLE `y_admin_groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table y_admin_log_datas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `y_admin_log_datas`;

CREATE TABLE `y_admin_log_datas` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `log_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '日志id',
  `data` longtext NOT NULL COMMENT '日志内容',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态，保留字段',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  `delete_time` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='后台用户操作日志数据表';

LOCK TABLES `y_admin_log_datas` WRITE;
/*!40000 ALTER TABLE `y_admin_log_datas` DISABLE KEYS */;

INSERT INTO `y_admin_log_datas` (`id`, `log_id`, `data`, `status`, `create_time`, `update_time`, `delete_time`)
VALUES
	(1,1,'e77b120azqfpNtbYDKiqxuESfe9P3rnqEeg+0ZIRHnm+R/Ua8GujXjG2EgmKTi8p1EZldmSvRoU841ngmZ5zcFniyrhlLIPJcl3500ystuaURGOOZUQZnqZjCqzU7zkWRg8Z+KdEyo8fyfFrhzIJq1rYR6qpSKkBgmi46VaeLE7Dja63ESwpiA4C/jMIqyLgRuujVT35VY6kpaR4P8A1eNrvoYa7UN5ldRYTGWC3ZvZKwdvCMafUHMuUeF3sQUdoWP1M8tmYKt7F+cT9+Sakwo1fwHhG2KGgcw3s8zREwdLvq/cP1FAmjRFyKvu13LAebnztx5lfrA06YYlDpw5Uq960ahIfWH4BKK0B1ag6ry60jBisgHKtadXS7WZoHRVB+W09QTT8zyAYRwYu71O9kUcMo67Mb8xG8aro2COlpOV22eA6xUc6Zcm1GHhyYcCFtouoeRxYuPWL',1,1547108503,1547108503,NULL),
	(2,2,'46e663f8N67gqgaKg+scv1Y1RJ3WesR2NY9CUrk8w5lKaWuDzKmPpHzA/z5AjpEStKV5BzKxHs9lqWp5hQ3NFFa8/2mvFZFeKX2KLrfUisn3fcpU2+umb3HasdGXv833/CxvSJqj9g3sUomazUJoymdHqAD53+e/3yh6Ia7+J1Pi8fwZCET8i9aH7HZ7uccMF20hTJyX7w8q3KCMPJhLX/bY+5An4fUMINzLyYaaesIs1tQXFNatzOvFJ9uJUB20gjzedVPs8kbhSxcc8i83MuAyYJemPl/NdxtbNL14QB5zd+0yLcad83yIgFdkmBoR0m0trIKC7ODf8gTP0V5+5Hb8g6xfU1JwP2AnlEuDjFKGnknEzBPWEc6/xUltybGOcdTpJfb0jDhE',1,1547109433,1547109433,NULL),
	(3,3,'cee8383fW/p1KhEEy06KyHFDSAHHW6EwCC40FIhdzd9dDr8N0gwGXHuwwn4PXN0lBxE4N6Vds6xmCrOawZOwsblvpr4p1ZmHkCQQ7QK7AVJ19cw1hFVugPQGaDpaviKUqfmNnjRHK8y0qeydNL68TR2pM9dOSHzk8PNCRCf3mrttHf8AEaZDM6q6x9UpTO506sL7nI3C08Z3jV/lQsc8kMxLgjYfEFIjCgOeXq7mc5ZvGXaftbN0Ly1KYorxciHki5QqA8IKpzfJBmPMAGkbzEz41n1Ua/f/hBeqPD7uu870XKk3KPoXyyP/vCwtNyUvYlXF+9qsSSYVY7VhFOhIuai6zIqUme9CE9qUxxulU3CgfirhOrknlfu8Xh2/NNdlcXo2yv8dRw',1,1547109441,1547109441,NULL),
	(4,4,'e995556a2rpF1S2dPVTmzUYUUZdPzqtYwmZZbmek2lq4sx4/LOw7b1Ycp0f195tpEi2u5RidziSeUS3YpfYEPnRMt52v/LDqoZEL4M9ZFV+Rai2W17I6gWLAyCX2sf4OJi4VrY2w9V90BPFtqcFNZlmSnQG1BEPltPr0fnH8Lc3csXeBIJtDFd5QIJW+c9TsioSAKlIcxZqL1zjQVn8HephrNxfVyMoL/YK31J/ENzSIrYYJHnph+Ry1mWEAIa6Ei6e0uFDMmSYnTm23ZO/3OqRyPmrCYeAZtuPp5Qh8DyQwH/wbfIMHIO4Rxq8GtZzMytBnhQY39o43d1+gcnjbz6TH/cw+edZLNBmGixtN3sxRe08RVpqCKj7QLpk1z8e7nvgxlQUkjw',1,1547109449,1547109449,NULL),
	(5,5,'8c7e4c44W05ORzrFZqFbaPOTRtfMI+PS8W1HyjtoRvGvouE8XiC+4mt9THM+6/j/LQmQnQnrkq/V0EYsf+fSppkCtzpuunYOfeIVh550NGDAt+hQKJyqteCfT6fMIsJ0zHREY21HoW+K8QmNH6YZrwjFwP/0xxbgOMD+MaUHRIJC8g5Yr1T8f2/G3Jxg3UbD7lr9jFE3ZWt/9GT2lsOLBSMK5TNCYHb6TtBiY8c4e0rxL1CWj0xZaadVQKmXsqqQ+MZuUX3dES8kr/2LRPp4gKxm4o+DIlXcQvFiNaCXmFb3SgHw1kKned3LfgSKV0q0+MIw6mkXojzdIBWkkBOMTzBz8ZLmL3c4sEp6sw1NI8yOYzMu5oT2tDcTN2IoCMEyQR6pvmO6STT7K/ye10NrJOTwneBXPYuMpMN3ksGmjnjIXn6ATOC68rn3hEYZA3vB89lqtmbjx0JD',1,1548647539,1548647539,NULL),
	(6,6,'a9090085IhXylJ+M1bC6G7dreZKhNHe1S5+kVu94gEI98e0H/oHD7wuHCMYQ9n56qYnlxK5aWbK0clIxuKtUlvWMaXL+JEC7muo7vdjoGhBfV+CcHfYHJVfpCp3FdMJhCCGs5Gqw3g1gTUG5ejHwov4PF6wmu3/GI0suu1AeeOd5Fou12/w0GSzk25PQJzQ+ed7dkzVwwqXCrEpuOWqr+W98FvIgK/j3gsvVhoFKIvorV86xYigaAuRSNTD78ZiimU5W4m/a3tdzhU7M9ZF9GdPy77ehMhICkH2tGYzsmM+oZhCr5Z/cRMCp3jTtqTZ33syl8o8peZRRprlU7MDmDXikpML/dSL3yxUV4kb97G7VKxtCja7qWRa0YrMahdc',1,1548647583,1548647583,NULL),
	(7,7,'193ebbb8lwyIC6M9XvtxoU3h2e/buWnGXZON3tq1wFNDEEOZsVYyWu8SEKzO/pLjRw+O/WNai3o4AFCfRI66bpZQNd2kgd1Pq27Kou1NYWgE5yz00Cl4n+jTeaQb7jWvM1OhIRlTISU1+/ds0TyAliqy52ewdeZsqn3NeskCx1mKlECNO843WFnj8xlYZBo7XJNezE3lbaMJ2lC0/6c8/5bWIlsfTgjUh0NeA6fD8EWfNhRcMsPS06esIVrrFa7Mg0mIFEG4ABpTajuqHjfgY6nRJmHuh+5KWgsukZZ1mVe0E2kJA6CZZDJQVER/qE8p97+Z+NosSWTmVeLio9jfl2JzJlVCvtUb/V7IIgQqgEUfc97y8G7eKvSOTSMjvlOQGIGLwwFyVwPjzS6yPuM7Z2u5XnH9',1,1548647641,1548647641,NULL);

/*!40000 ALTER TABLE `y_admin_log_datas` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table y_admin_logs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `y_admin_logs`;

CREATE TABLE `y_admin_logs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL COMMENT '用户id',
  `resource_id` int(11) NOT NULL DEFAULT '0' COMMENT '资源id，如果是0证明是添加？，此字段不设置为无符号',
  `title` varchar(255) NOT NULL COMMENT '日志标题',
  `log_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1get，2post，3put，4deldet',
  `log_url` varchar(255) NOT NULL COMMENT '访问url',
  `log_ip` bigint(15) NOT NULL COMMENT '操作ip',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态，保留字段',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='后台用户操作日志表';

LOCK TABLES `y_admin_logs` WRITE;
/*!40000 ALTER TABLE `y_admin_logs` DISABLE KEYS */;

INSERT INTO `y_admin_logs` (`id`, `user_id`, `resource_id`, `title`, `log_type`, `log_url`, `log_ip`, `status`, `create_time`)
VALUES
	(1,1,0,'登录',2,'admin/auth/login.html',2886926337,1,1547108503),
	(2,1,1,'修改设置',2,'admin/sysconfig/edit.html',2886926337,1,1547109433),
	(3,1,1,'修改设置',2,'admin/sysconfig/edit.html',2886926337,1,1547109441),
	(4,1,1,'修改设置',2,'admin/sysconfig/edit.html',2886926337,1,1547109449),
	(5,1,0,'登录',2,'admin/auth/login.html',2886926337,1,1548647539),
	(6,1,-1,'添加菜单',2,'admin/admin_menu/add.html',2886926337,1,1548647583),
	(7,1,44,'修改菜单',2,'admin/admin_menu/edit.html',2886926337,1,1548647641);

/*!40000 ALTER TABLE `y_admin_logs` ENABLE KEYS */;
UNLOCK TABLES;


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
	(1,0,'后台首页','admin/index/index','fa-home','',1,99,0,1,1),
	(2,0,'系统管理','admin/sys','fa-desktop','',1,1099,0,1,1),
	(3,2,'用户管理','admin/admin_user/index','fa-user','',1,1000,0,1,1),
	(4,3,'添加用户','admin/admin_user/add','fa-plus','',0,1000,2,1,1),
	(5,3,'修改用户','admin/admin_user/edit','fa-edit','',0,1000,2,1,1),
	(6,3,'删除用户','admin/admin_user/del','fa-close','',0,1000,2,1,1),
	(7,2,'角色管理','admin/admin_group/index','fa-group','',1,1000,0,1,1),
	(8,7,'添加角色','admin/admin_group/add','fa-plus','',0,1000,2,1,1),
	(9,7,'修改角色','admin/admin_group/edit','fa-edit','',0,1000,2,1,1),
	(10,7,'删除角色','admin/admin_group/del','fa-close','',0,1000,2,1,1),
	(11,7,'角色授权','admin/admin_group/access','fa-key','',0,1000,2,1,1),
	(12,2,'菜单管理','admin/admin_menu/index','fa-align-justify','',1,1000,0,1,1),
	(13,12,'添加菜单','admin/admin_menu/add','fa-plus','',0,1000,2,1,1),
	(14,12,'修改菜单','admin/admin_menu/edit','fa-edit','',0,1000,2,1,1),
	(15,12,'删除菜单','admin/admin_menu/del','fa-close','',0,1000,2,1,1),
	(16,2,'系统设置','admin/sysconfig/manage','fa-cog','',1,1000,0,1,1),
	(17,16,'添加设置','admin/sysconfig/add','fa-plus','',0,1000,2,1,1),
	(18,16,'修改设置','admin/sysconfig/edit','fa-edit','',0,1000,2,1,1),
	(19,16,'删除设置','admin/sysconfig/del','fa-close','',0,1000,2,1,1),
	(20,2,'文件管理','admin/admin_file/manager','fa-file-text','',1,1000,0,1,1),
	(21,20,'文件列表','admin/admin_file/index','fa-list','',1,1000,0,1,1),
	(22,21,'上传文件','admin/admin_file/upload','fa-upload','',0,1000,2,1,1),
	(23,21,'下载文件','admin/admin_file/download','fa-download','',0,1000,1,1,1),
	(24,21,'修改文件','admin/admin_file/edit','fa-edit','',0,1000,2,1,1),
	(25,21,'删除文件','admin/admin_file/del','fa-crash','',0,1000,2,1,1),
	(26,20,'回收站文件','admin/admin_file/recycle','fa-recycle','',1,1000,0,1,1),
	(27,26,'还原文件','admin/admin_file/reduction','fa-reply','',0,1000,2,1,1),
	(28,26,'永久删除文件','admin/admin_file/delete','fa-trash','',0,1000,2,1,1),
	(29,2,'日志管理','admin/admin_log','fa-info-circle','',1,1000,0,1,1),
	(30,29,'操作日志','admin/admin_log/index','fa-keyboard-o','',1,1000,0,1,1),
	(31,30,'查看操作日志详情','admin/admin_log/view','fa-search-plus','',0,1000,0,1,1),
	(32,29,'系统日志','admin/syslog/index','fa-exclamation-circle','',1,1000,0,1,1),
	(33,32,'查看系统日志Trace','admin/syslog/view','fa-info-circle','',0,1000,0,1,1),
	(34,2,'数据维护','admin/data','fa-database','',1,1000,0,1,1),
	(35,34,'数据库备份','admin/databack/index','fa-database','',1,1000,0,1,1),
	(36,35,'添加备份','admin/databack/add','fa-plus','',0,1000,2,1,1),
	(37,35,'删除备份','admin/databack/del','fa-trash','',0,1000,2,1,1),
	(38,35,'还原备份','admin/databack/reduction','fa-circle-o','',0,1000,2,1,1),
	(39,35,'下载备份','admin/databack/download','fa-download','',0,1000,1,1,1),
	(40,34,'数据表管理','admin/database/index','fa-list','',1,1000,0,1,1),
	(41,40,'优化表','admin/database/optimize','fa-refresh','',0,1000,2,1,1),
	(42,40,'修复表','admin/database/repair','fa-circle-o-notch','',0,1000,2,1,1),
	(43,40,'查看表详情','admin/database/view','fa-info-circle','',0,1000,2,1,1),
	(44,2,'个人资料','admin/admin_user/profile','fa-smile-o','',1,2000,2,1,1),
	(45,0,'用户管理','admin/user/manage','fa-user','',1,1000,0,1,1),
	(46,45,'用户列表','admin/user/index','fa-list','',1,1000,0,1,1),
	(47,46,'添加用户','admin/user/add','fa-plus','',0,1000,2,1,1),
	(48,46,'修改用户','admin/user/edit','fa-pencil','',0,1000,2,1,1),
	(49,46,'删除用户','admin/user/del','fa-trash','',0,1000,2,1,1),
	(50,46,'禁用/启用 用户','admin/user/disable','fa-ban','',0,1000,2,1,1),
	(51,45,'用户等级','admin/user_level/index','fa-list','',1,1000,0,1,1),
	(52,51,'添加用户等级','admin/user_level/add','fa-plus','',0,1000,2,1,1),
	(53,51,'修改用户等级','admin/user_level/edit','fa-pencil','',0,1000,2,1,1),
	(54,51,'删除用户等级','admin/user_level/del','fa-trash','',0,1000,2,1,1),
	(55,16,'后台设置','admin/sysconfig/index','fa-list','',1,1000,0,1,1),
	(56,2,'定时任务','admin/crontab/index','fa-calendar','',1,1000,0,1,1);

/*!40000 ALTER TABLE `y_admin_menus` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table y_admin_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `y_admin_users`;

CREATE TABLE `y_admin_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `name` varchar(50) NOT NULL COMMENT '用户名（登录帐号）',
  `password` char(32) NOT NULL COMMENT '密码',
  `nickname` varchar(30) DEFAULT NULL COMMENT '用户昵称或中文用户名',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `mobile` char(11) DEFAULT NULL COMMENT '手机号',
  `avatar` varchar(255) DEFAULT '/static/admin/images/avatar.png' COMMENT '用户头像',
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
	(1,'admin','21232f297a57a5a743894a0e4a801fc3','超级管理员','','18888888888','/static/admin/images/avatar.png',NULL,1488189586,1526916735,NULL,1),
	(2,'demo','fe01ce2a7fbac8fafaed7c982a04e229','Demo','','','/static/admin/images/avatar.png',NULL,1539572074,1539572110,NULL,1);

/*!40000 ALTER TABLE `y_admin_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table y_attachments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `y_attachments`;

CREATE TABLE `y_attachments` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='附件表';

LOCK TABLES `y_attachments` WRITE;
/*!40000 ALTER TABLE `y_attachments` DISABLE KEYS */;

INSERT INTO `y_attachments` (`id`, `user_id`, `original_name`, `save_name`, `save_path`, `extension`, `mime`, `size`, `md5`, `sha1`, `url`, `is_open`, `create_time`, `update_time`, `delete_time`)
VALUES
	(1,0,'fx.png','dd9be964dc8cec705ef2626be6a94648.png','D:/php/website/BearAdmin/public/uploads/attachment/20180808/dd9be964dc8cec705ef2626be6a94648.png','png','image/png',3228,'82d5b8eb764adb141250a8613b0f883a','be9492d8fa95873377e3e8008b15b1d41368925b','/uploads/attachment/20180808/dd9be964dc8cec705ef2626be6a94648.png',0,1533695403,1533695403,NULL),
	(2,0,'r3.png','7e2a8ed1e5e301608e8851e8df8d0bbe.png','D:/php/website/BearAdmin/public/uploads/attachment/20180808/7e2a8ed1e5e301608e8851e8df8d0bbe.png','png','image/png',1933,'b7a14b939643579b40273a10a29da008','b9db5f2d43c2b988ea65612a414403e8f9f78c63','/uploads/attachment/20180808/7e2a8ed1e5e301608e8851e8df8d0bbe.png',0,1533695438,1533695438,NULL),
	(3,0,'r3_1.png','1c6bcdb692cc11df6b393e90d30af5e2.png','D:/php/website/BearAdmin/public/uploads/attachment/20180808/1c6bcdb692cc11df6b393e90d30af5e2.png','png','image/png',1836,'9f870914e24115562c869538daa4820d','e83af3fcc03e7b9db52ad485f6b4e142eaadda7c','/uploads/attachment/20180808/1c6bcdb692cc11df6b393e90d30af5e2.png',0,1533695461,1533695461,NULL);

/*!40000 ALTER TABLE `y_attachments` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table y_crontab
# ------------------------------------------------------------

DROP TABLE IF EXISTS `y_crontab`;

CREATE TABLE `y_crontab` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `type` varchar(10) NOT NULL DEFAULT '' COMMENT '事件类型',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '事件标题',
  `content` text NOT NULL COMMENT '事件内容',
  `schedule` varchar(100) NOT NULL DEFAULT '' COMMENT 'Crontab格式',
  `sleep` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '延迟秒数执行',
  `maximums` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最大执行次数 0为不限',
  `executes` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '已经执行的次数',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `begintime` int(10) NOT NULL DEFAULT '0' COMMENT '开始时间',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `executetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后执行时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` enum('completed','expired','hidden','normal') NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务表';

LOCK TABLES `y_crontab` WRITE;
/*!40000 ALTER TABLE `y_crontab` DISABLE KEYS */;

INSERT INTO `y_crontab` (`id`, `type`, `title`, `content`, `schedule`, `sleep`, `maximums`, `executes`, `createtime`, `updatetime`, `begintime`, `endtime`, `executetime`, `weigh`, `status`)
VALUES
	(1,'url','测试','http://www.baidu.com','*/1 * * * *',0,0,4,1548655272,1548730225,0,0,1548730225,0,'normal');

/*!40000 ALTER TABLE `y_crontab` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table y_crontab_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `y_crontab_log`;

CREATE TABLE `y_crontab_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `create_time` int(10) unsigned NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `crontab_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `y_excel_examples` WRITE;
/*!40000 ALTER TABLE `y_excel_examples` DISABLE KEYS */;

INSERT INTO `y_excel_examples` (`id`, `name`, `age`, `sex`, `city`)
VALUES
	(1,'a',25,'男','济南'),
	(2,'b',23,'女','济南'),
	(3,'c',1,'男','济南');

/*!40000 ALTER TABLE `y_excel_examples` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table y_sysconfigs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `y_sysconfigs`;

CREATE TABLE `y_sysconfigs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '分组默认1，系统设置',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `code` varchar(255) NOT NULL COMMENT '代码',
  `content` varchar(255) NOT NULL COMMENT '内容',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否启用，1启用，0禁用',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  `delete_time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统参数表';

LOCK TABLES `y_sysconfigs` WRITE;
/*!40000 ALTER TABLE `y_sysconfigs` DISABLE KEYS */;

INSERT INTO `y_sysconfigs` (`id`, `group_id`, `name`, `code`, `content`, `description`, `status`, `create_time`, `update_time`, `delete_time`)
VALUES
	(1,1,'后台名称','backend_name','YAdmin','网站后台名称，title和登录界面显示',1,1502187289,0,NULL);

/*!40000 ALTER TABLE `y_sysconfigs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table y_syslog_trace
# ------------------------------------------------------------

DROP TABLE IF EXISTS `y_syslog_trace`;

CREATE TABLE `y_syslog_trace` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `log_id` int(11) unsigned NOT NULL COMMENT '日志id',
  `trace` longtext COMMENT '日志trace',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统日志trace表';

LOCK TABLES `y_syslog_trace` WRITE;
/*!40000 ALTER TABLE `y_syslog_trace` DISABLE KEYS */;

INSERT INTO `y_syslog_trace` (`id`, `log_id`, `trace`)
VALUES
	(1,1,'#0 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, NULL)\n#1 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#2 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#3 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#4 {main}'),
	(2,2,'#0 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, NULL)\n#1 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#2 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#3 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#4 {main}'),
	(3,3,'#0 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, NULL)\n#1 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#2 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#3 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#4 {main}'),
	(4,4,'#0 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, NULL)\n#1 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#2 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#3 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#4 {main}'),
	(5,5,'#0 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, NULL)\n#1 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#2 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#3 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#4 {main}'),
	(6,6,'#0 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, NULL)\n#1 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#2 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#3 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#4 {main}'),
	(7,7,'#0 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, NULL)\n#1 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#2 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#3 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#4 {main}'),
	(8,8,'#0 /var/www/html/base/thinkphp/library/think/db/Query.php(269): think\\db\\Connection->execute(\'INSERT INTO `y_...\', Array, Object(think\\db\\Query))\n#1 /var/www/html/base/thinkphp/library/think/db/Query.php(2275): think\\db\\Query->execute(\'INSERT INTO `y_...\', Array, Object(think\\db\\Query))\n#2 /var/www/html/base/thinkphp/library/think/Model.php(1182): think\\db\\Query->insert(Array, false, false, NULL)\n#3 /var/www/html/base/thinkphp/library/think/Model.php(1663): think\\Model->save(Array, Array)\n#4 /var/www/html/base/application/admin/controller/Crontab.php(39): think\\Model::create(Array)\n#5 [internal function]: app\\admin\\controller\\Crontab->add()\n#6 /var/www/html/base/thinkphp/library/think/App.php(343): ReflectionMethod->invokeArgs(Object(app\\admin\\controller\\Crontab), Array)\n#7 /var/www/html/base/thinkphp/library/think/App.php(611): think\\App::invokeMethod(Array, Array)\n#8 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, true)\n#9 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#10 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#11 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#12 {main}'),
	(9,9,'#0 /var/www/html/base/thinkphp/library/think/db/Query.php(269): think\\db\\Connection->execute(\'INSERT INTO `y_...\', Array, Object(think\\db\\Query))\n#1 /var/www/html/base/thinkphp/library/think/db/Query.php(2275): think\\db\\Query->execute(\'INSERT INTO `y_...\', Array, Object(think\\db\\Query))\n#2 /var/www/html/base/thinkphp/library/think/Model.php(1182): think\\db\\Query->insert(Array, false, false, NULL)\n#3 /var/www/html/base/thinkphp/library/think/Model.php(1663): think\\Model->save(Array, Array)\n#4 /var/www/html/base/application/admin/controller/Crontab.php(39): think\\Model::create(Array)\n#5 [internal function]: app\\admin\\controller\\Crontab->add()\n#6 /var/www/html/base/thinkphp/library/think/App.php(343): ReflectionMethod->invokeArgs(Object(app\\admin\\controller\\Crontab), Array)\n#7 /var/www/html/base/thinkphp/library/think/App.php(611): think\\App::invokeMethod(Array, Array)\n#8 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, true)\n#9 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#10 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#11 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#12 {main}'),
	(10,10,'#0 /var/www/html/base/thinkphp/library/think/db/Query.php(269): think\\db\\Connection->execute(\'INSERT INTO `y_...\', Array, Object(think\\db\\Query))\n#1 /var/www/html/base/thinkphp/library/think/db/Query.php(2275): think\\db\\Query->execute(\'INSERT INTO `y_...\', Array, Object(think\\db\\Query))\n#2 /var/www/html/base/thinkphp/library/think/Model.php(1182): think\\db\\Query->insert(Array, false, false, NULL)\n#3 /var/www/html/base/thinkphp/library/think/Model.php(1663): think\\Model->save(Array, Array)\n#4 /var/www/html/base/application/admin/controller/Crontab.php(39): think\\Model::create(Array)\n#5 [internal function]: app\\admin\\controller\\Crontab->add()\n#6 /var/www/html/base/thinkphp/library/think/App.php(343): ReflectionMethod->invokeArgs(Object(app\\admin\\controller\\Crontab), Array)\n#7 /var/www/html/base/thinkphp/library/think/App.php(611): think\\App::invokeMethod(Array, Array)\n#8 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, true)\n#9 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#10 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#11 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#12 {main}'),
	(11,11,'#0 /var/www/html/base/thinkphp/library/think/db/Query.php(269): think\\db\\Connection->execute(\'INSERT INTO `y_...\', Array, Object(think\\db\\Query))\n#1 /var/www/html/base/thinkphp/library/think/db/Query.php(2275): think\\db\\Query->execute(\'INSERT INTO `y_...\', Array, Object(think\\db\\Query))\n#2 /var/www/html/base/thinkphp/library/think/Model.php(1182): think\\db\\Query->insert(Array, false, false, NULL)\n#3 /var/www/html/base/thinkphp/library/think/Model.php(1663): think\\Model->save(Array, Array)\n#4 /var/www/html/base/application/admin/controller/Crontab.php(39): think\\Model::create(Array)\n#5 [internal function]: app\\admin\\controller\\Crontab->add()\n#6 /var/www/html/base/thinkphp/library/think/App.php(343): ReflectionMethod->invokeArgs(Object(app\\admin\\controller\\Crontab), Array)\n#7 /var/www/html/base/thinkphp/library/think/App.php(611): think\\App::invokeMethod(Array, Array)\n#8 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, true)\n#9 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#10 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#11 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#12 {main}');

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
	(1,0,'module not exists:favicon.ico','/var/www/html/base/thinkphp/library/think/App.php',535,1547357452),
	(2,0,'module not exists:favicon.ico','/var/www/html/base/thinkphp/library/think/App.php',535,1547447215),
	(3,0,'module not exists:favicon.ico','/var/www/html/base/thinkphp/library/think/App.php',535,1548386263),
	(4,0,'module not exists:favicon.ico','/var/www/html/base/thinkphp/library/think/App.php',535,1548647533),
	(5,0,'module not exists:favicon-32x32.png','/var/www/html/base/thinkphp/library/think/App.php',535,1548647540),
	(6,0,'module not exists:favicon-16x16.png','/var/www/html/base/thinkphp/library/think/App.php',535,1548647540),
	(7,0,'module not exists:favicon-96x96.png','/var/www/html/base/thinkphp/library/think/App.php',535,1548647540),
	(8,0,'SQLSTATE[HY000]: General error: 1364 Field \'id\' doesn\'t have a default value','/var/www/html/base/thinkphp/library/think/db/Connection.php',453,1548655001),
	(9,0,'SQLSTATE[HY000]: General error: 1364 Field \'id\' doesn\'t have a default value','/var/www/html/base/thinkphp/library/think/db/Connection.php',453,1548655017),
	(10,0,'SQLSTATE[HY000]: General error: 1364 Field \'id\' doesn\'t have a default value','/var/www/html/base/thinkphp/library/think/db/Connection.php',453,1548655039),
	(11,0,'SQLSTATE[HY000]: General error: 1364 Field \'id\' doesn\'t have a default value','/var/www/html/base/thinkphp/library/think/db/Connection.php',453,1548655209);

/*!40000 ALTER TABLE `y_syslogs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table y_user_levels
# ------------------------------------------------------------

DROP TABLE IF EXISTS `y_user_levels`;

CREATE TABLE `y_user_levels` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '等级名称',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  `delete_time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='前台用户等级表';

LOCK TABLES `y_user_levels` WRITE;
/*!40000 ALTER TABLE `y_user_levels` DISABLE KEYS */;

INSERT INTO `y_user_levels` (`id`, `name`, `create_time`, `update_time`, `delete_time`)
VALUES
	(1,'普通会员',1533695231,1533695231,NULL),
	(2,'中级会员',1533695240,1533695240,NULL),
	(3,'高级会员',1533695246,1533695246,NULL);

/*!40000 ALTER TABLE `y_user_levels` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table y_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `y_users`;

CREATE TABLE `y_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `level_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户等级id',
  `name` varchar(50) NOT NULL COMMENT '用户账号',
  `password` char(32) NOT NULL COMMENT '密码',
  `nickname` varchar(50) NOT NULL COMMENT '昵称',
  `headimg` varchar(255) NOT NULL COMMENT '头像',
  `mobile` char(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `email` varchar(255) NOT NULL COMMENT '邮箱',
  `money` decimal(11,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '余额',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态，1启用，2禁用',
  `reg_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  `delete_time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='前台用户表';

LOCK TABLES `y_users` WRITE;
/*!40000 ALTER TABLE `y_users` DISABLE KEYS */;

INSERT INTO `y_users` (`id`, `level_id`, `name`, `password`, `nickname`, `headimg`, `mobile`, `email`, `money`, `status`, `reg_time`, `last_login_time`, `create_time`, `update_time`, `delete_time`)
VALUES
	(1,1,'test001','14e1b600b1fd579f47433b88e8d85291','test001','/uploads/attachment/20180808/dd9be964dc8cec705ef2626be6a94648.png','13000000001','',0.00,1,0,0,1533695403,1533695403,NULL),
	(2,2,'test002','14e1b600b1fd579f47433b88e8d85291','test002','/uploads/attachment/20180808/7e2a8ed1e5e301608e8851e8df8d0bbe.png','13000000002','',0.00,1,0,0,1533695438,1533695438,NULL),
	(3,3,'test003','14e1b600b1fd579f47433b88e8d85291','test003','/uploads/attachment/20180808/1c6bcdb692cc11df6b393e90d30af5e2.png','13000000003','',0.00,1,0,0,1533695461,1533695461,NULL);

/*!40000 ALTER TABLE `y_users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
