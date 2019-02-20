-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- 主机： mysql:3306
-- 生成日期： 2019-02-20 01:48:00
-- 服务器版本： 8.0.13
-- PHP 版本： 7.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `base`
--

-- --------------------------------------------------------

--
-- 表的结构 `y_admin_groups`
--

CREATE TABLE `y_admin_groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '角色名称',
  `description` varchar(200) DEFAULT '' COMMENT '角色描述',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '默认为1启用，2冻结',
  `rules` varchar(2000) NOT NULL DEFAULT '' COMMENT '权限id集合'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色表';

--
-- 转存表中的数据 `y_admin_groups`
--

INSERT INTO `y_admin_groups` (`id`, `name`, `description`, `status`, `rules`) VALUES
(1, '管理员', '管理员角色', 1, '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,26,27,28,29,30,31,32,33,34,21,22,23,25,24,35,36,44,37,38,39,40,41,43,42,45,46,47,48,49,50,51,52,53,54');

-- --------------------------------------------------------

--
-- 表的结构 `y_admin_group_access`
--

CREATE TABLE `y_admin_group_access` (
  `uid` mediumint(8) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色用户关联表';

--
-- 转存表中的数据 `y_admin_group_access`
--

INSERT INTO `y_admin_group_access` (`uid`, `group_id`) VALUES
(1, 1),
(2, 1);

-- --------------------------------------------------------

--
-- 表的结构 `y_admin_logs`
--

CREATE TABLE `y_admin_logs` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL COMMENT '用户id',
  `resource_id` int(11) NOT NULL DEFAULT '0' COMMENT '资源id，如果是0证明是添加？，此字段不设置为无符号',
  `title` varchar(255) NOT NULL COMMENT '日志标题',
  `log_type` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '1get，2post，3put，4deldet',
  `log_url` varchar(255) NOT NULL COMMENT '访问url',
  `log_ip` bigint(15) NOT NULL COMMENT '操作ip',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '状态，保留字段',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '操作时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='后台用户操作日志表';

--
-- 转存表中的数据 `y_admin_logs`
--

INSERT INTO `y_admin_logs` (`id`, `user_id`, `resource_id`, `title`, `log_type`, `log_url`, `log_ip`, `status`, `create_time`) VALUES
(1, 1, 0, '登录', 2, 'admin/auth/login.html', 2886926337, 1, 1547108503),
(2, 1, 1, '修改设置', 2, 'admin/sysconfig/edit.html', 2886926337, 1, 1547109433),
(3, 1, 1, '修改设置', 2, 'admin/sysconfig/edit.html', 2886926337, 1, 1547109441),
(4, 1, 1, '修改设置', 2, 'admin/sysconfig/edit.html', 2886926337, 1, 1547109449),
(5, 1, 0, '登录', 2, 'admin/auth/login.html', 2886926337, 1, 1548647539),
(6, 1, -1, '添加菜单', 2, 'admin/admin_menu/add.html', 2886926337, 1, 1548647583),
(7, 1, 44, '修改菜单', 2, 'admin/admin_menu/edit.html', 2886926337, 1, 1548647641),
(8, 1, 0, '登录', 2, 'admin/auth/login.html', 3232243969, 1, 1550544655),
(9, 1, -1, '添加菜单', 2, 'admin/admin_menu/add', 3232243969, 1, 1550556849),
(10, 1, -1, '添加菜单', 2, 'admin/admin_menu/add', 3232243969, 1, 1550556974),
(11, 1, -1, '添加菜单', 2, 'admin/admin_menu/add', 3232243969, 1, 1550557044),
(12, 1, 57, '修改菜单', 2, 'admin/admin_menu/edit', 3232243969, 1, 1550558174),
(13, 1, -1, '添加菜单', 2, 'admin/admin_menu/add', 3232243969, 1, 1550560717),
(14, 1, -1, '添加菜单', 2, 'admin/admin_menu/add', 3232243969, 1, 1550562176),
(15, 1, -1, '添加菜单', 2, 'admin/admin_menu/add', 3232243969, 1, 1550562209),
(16, 1, 61, '修改菜单', 2, 'admin/admin_menu/edit', 3232243969, 1, 1550562229),
(17, 1, 60, '修改菜单', 2, 'admin/admin_menu/edit', 3232243969, 1, 1550562241),
(18, 1, -1, '添加菜单', 2, 'admin/admin_menu/add', 3232243969, 1, 1550562292),
(19, 1, 62, '修改菜单', 2, 'admin/admin_menu/edit', 3232243969, 1, 1550562307),
(20, 1, -1, '添加菜单', 2, 'admin/admin_menu/add', 3232243969, 1, 1550564589),
(21, 1, 0, '登录', 2, 'admin/auth/login.html', 3232243969, 1, 1550626674),
(22, 1, -1, '新增资源', 2, 'admin/weresponse/add', 3232243969, 1, 1550626999),
(23, 1, -1, '新增资源', 2, 'admin/weresponse/add', 3232243969, 1, 1550626999),
(24, 1, -1, '新增资源', 2, 'admin/weresponse/add', 3232243969, 1, 1550627065),
(25, 1, -1, '新增资源', 2, 'admin/weresponse/add', 3232243969, 1, 1550627065);

-- --------------------------------------------------------

--
-- 表的结构 `y_admin_log_datas`
--

CREATE TABLE `y_admin_log_datas` (
  `id` int(11) UNSIGNED NOT NULL,
  `log_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '日志id',
  `data` longtext NOT NULL COMMENT '日志内容',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '状态，保留字段',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `delete_time` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='后台用户操作日志数据表';

--
-- 转存表中的数据 `y_admin_log_datas`
--

INSERT INTO `y_admin_log_datas` (`id`, `log_id`, `data`, `status`, `create_time`, `update_time`, `delete_time`) VALUES
(1, 1, 'e77b120azqfpNtbYDKiqxuESfe9P3rnqEeg+0ZIRHnm+R/Ua8GujXjG2EgmKTi8p1EZldmSvRoU841ngmZ5zcFniyrhlLIPJcl3500ystuaURGOOZUQZnqZjCqzU7zkWRg8Z+KdEyo8fyfFrhzIJq1rYR6qpSKkBgmi46VaeLE7Dja63ESwpiA4C/jMIqyLgRuujVT35VY6kpaR4P8A1eNrvoYa7UN5ldRYTGWC3ZvZKwdvCMafUHMuUeF3sQUdoWP1M8tmYKt7F+cT9+Sakwo1fwHhG2KGgcw3s8zREwdLvq/cP1FAmjRFyKvu13LAebnztx5lfrA06YYlDpw5Uq960ahIfWH4BKK0B1ag6ry60jBisgHKtadXS7WZoHRVB+W09QTT8zyAYRwYu71O9kUcMo67Mb8xG8aro2COlpOV22eA6xUc6Zcm1GHhyYcCFtouoeRxYuPWL', 1, 1547108503, 1547108503, NULL),
(2, 2, '46e663f8N67gqgaKg+scv1Y1RJ3WesR2NY9CUrk8w5lKaWuDzKmPpHzA/z5AjpEStKV5BzKxHs9lqWp5hQ3NFFa8/2mvFZFeKX2KLrfUisn3fcpU2+umb3HasdGXv833/CxvSJqj9g3sUomazUJoymdHqAD53+e/3yh6Ia7+J1Pi8fwZCET8i9aH7HZ7uccMF20hTJyX7w8q3KCMPJhLX/bY+5An4fUMINzLyYaaesIs1tQXFNatzOvFJ9uJUB20gjzedVPs8kbhSxcc8i83MuAyYJemPl/NdxtbNL14QB5zd+0yLcad83yIgFdkmBoR0m0trIKC7ODf8gTP0V5+5Hb8g6xfU1JwP2AnlEuDjFKGnknEzBPWEc6/xUltybGOcdTpJfb0jDhE', 1, 1547109433, 1547109433, NULL),
(3, 3, 'cee8383fW/p1KhEEy06KyHFDSAHHW6EwCC40FIhdzd9dDr8N0gwGXHuwwn4PXN0lBxE4N6Vds6xmCrOawZOwsblvpr4p1ZmHkCQQ7QK7AVJ19cw1hFVugPQGaDpaviKUqfmNnjRHK8y0qeydNL68TR2pM9dOSHzk8PNCRCf3mrttHf8AEaZDM6q6x9UpTO506sL7nI3C08Z3jV/lQsc8kMxLgjYfEFIjCgOeXq7mc5ZvGXaftbN0Ly1KYorxciHki5QqA8IKpzfJBmPMAGkbzEz41n1Ua/f/hBeqPD7uu870XKk3KPoXyyP/vCwtNyUvYlXF+9qsSSYVY7VhFOhIuai6zIqUme9CE9qUxxulU3CgfirhOrknlfu8Xh2/NNdlcXo2yv8dRw', 1, 1547109441, 1547109441, NULL),
(4, 4, 'e995556a2rpF1S2dPVTmzUYUUZdPzqtYwmZZbmek2lq4sx4/LOw7b1Ycp0f195tpEi2u5RidziSeUS3YpfYEPnRMt52v/LDqoZEL4M9ZFV+Rai2W17I6gWLAyCX2sf4OJi4VrY2w9V90BPFtqcFNZlmSnQG1BEPltPr0fnH8Lc3csXeBIJtDFd5QIJW+c9TsioSAKlIcxZqL1zjQVn8HephrNxfVyMoL/YK31J/ENzSIrYYJHnph+Ry1mWEAIa6Ei6e0uFDMmSYnTm23ZO/3OqRyPmrCYeAZtuPp5Qh8DyQwH/wbfIMHIO4Rxq8GtZzMytBnhQY39o43d1+gcnjbz6TH/cw+edZLNBmGixtN3sxRe08RVpqCKj7QLpk1z8e7nvgxlQUkjw', 1, 1547109449, 1547109449, NULL),
(5, 5, '8c7e4c44W05ORzrFZqFbaPOTRtfMI+PS8W1HyjtoRvGvouE8XiC+4mt9THM+6/j/LQmQnQnrkq/V0EYsf+fSppkCtzpuunYOfeIVh550NGDAt+hQKJyqteCfT6fMIsJ0zHREY21HoW+K8QmNH6YZrwjFwP/0xxbgOMD+MaUHRIJC8g5Yr1T8f2/G3Jxg3UbD7lr9jFE3ZWt/9GT2lsOLBSMK5TNCYHb6TtBiY8c4e0rxL1CWj0xZaadVQKmXsqqQ+MZuUX3dES8kr/2LRPp4gKxm4o+DIlXcQvFiNaCXmFb3SgHw1kKned3LfgSKV0q0+MIw6mkXojzdIBWkkBOMTzBz8ZLmL3c4sEp6sw1NI8yOYzMu5oT2tDcTN2IoCMEyQR6pvmO6STT7K/ye10NrJOTwneBXPYuMpMN3ksGmjnjIXn6ATOC68rn3hEYZA3vB89lqtmbjx0JD', 1, 1548647539, 1548647539, NULL),
(6, 6, 'a9090085IhXylJ+M1bC6G7dreZKhNHe1S5+kVu94gEI98e0H/oHD7wuHCMYQ9n56qYnlxK5aWbK0clIxuKtUlvWMaXL+JEC7muo7vdjoGhBfV+CcHfYHJVfpCp3FdMJhCCGs5Gqw3g1gTUG5ejHwov4PF6wmu3/GI0suu1AeeOd5Fou12/w0GSzk25PQJzQ+ed7dkzVwwqXCrEpuOWqr+W98FvIgK/j3gsvVhoFKIvorV86xYigaAuRSNTD78ZiimU5W4m/a3tdzhU7M9ZF9GdPy77ehMhICkH2tGYzsmM+oZhCr5Z/cRMCp3jTtqTZ33syl8o8peZRRprlU7MDmDXikpML/dSL3yxUV4kb97G7VKxtCja7qWRa0YrMahdc', 1, 1548647583, 1548647583, NULL),
(7, 7, '193ebbb8lwyIC6M9XvtxoU3h2e/buWnGXZON3tq1wFNDEEOZsVYyWu8SEKzO/pLjRw+O/WNai3o4AFCfRI66bpZQNd2kgd1Pq27Kou1NYWgE5yz00Cl4n+jTeaQb7jWvM1OhIRlTISU1+/ds0TyAliqy52ewdeZsqn3NeskCx1mKlECNO843WFnj8xlYZBo7XJNezE3lbaMJ2lC0/6c8/5bWIlsfTgjUh0NeA6fD8EWfNhRcMsPS06esIVrrFa7Mg0mIFEG4ABpTajuqHjfgY6nRJmHuh+5KWgsukZZ1mVe0E2kJA6CZZDJQVER/qE8p97+Z+NosSWTmVeLio9jfl2JzJlVCvtUb/V7IIgQqgEUfc97y8G7eKvSOTSMjvlOQGIGLwwFyVwPjzS6yPuM7Z2u5XnH9', 1, 1548647641, 1548647641, NULL),
(8, 8, '6e0a941bz/AdzzYsCFWtfHgkeW6xtpv8t8kZO3tuv1J89mcciIo1EXgrYIuRrR/oiB2rj6NTYTq1RSP2lnasJoc9T16cnJWTWgbTe4MPA7o8ei2oBiQm2oTxEje8wVz0qnz5vBRno9FBXfgkKfqwC95Ak/nu9pDKM46yUrg+9LEHd/Df2ALY476tI47Oq9bmFVeXpQv+r0nnsFp7BPxbvsF7QNboJFIIS2DRCpi/ImpQUaG7j3+ULsW2/uabk9/N/YA2iEsLN7geR99fv3675bDx2WOv71nBjtv9ml2APKErYqiVSmTXHHtogLhLZlx6XXnVUaJXjoEyOHqnplmtf4M4326Ab1sf3YPFFDY6+oIWJNGoTtaqmGL7rbKHgdGgNj1Z50LLm4/CII6Pn6IOmvSa/Fi2QiLIWqrD63der83/OPiHdT1iY4eMcadM0mBJfUCG0CZ0va4w', 1, 1550544655, 1550544655, NULL),
(9, 9, '54589cabablUyjaJ9RmrUcAe9LepSYx93t4LBNZYhHSj2bgOLXHTBewhWjhw19CVM/6u2jUNREfyO5G/FVdOxoAGbDGls0fg+g2DKHSw1C9P64Z2MJ7C3zLS0vgHkfbK03qS9lXS1F0I8QGXOk6NmBUpGJ49lfY40UkSewTWMPEaKU8o2KyOstaoJQb7kR67KF1X8WAW4Uu9RoC3lw15APQPdEZo49gsBUL/wJU1vAdlStP0tN6HJSmqOa9z1o48OBkDcPfVR7cjLqDgyf4HnJ7rAGnFln4vDkosbz0A5H7I16PBJq83iVrH1v+WaZ8JMtWctvqwrz7hwMwBMHqx3jyEnv/bSnH2bXWaSWi29sfQ99BmgElQO1AIEFGTppk7XWiq+pVZeqd7M5snUIE', 1, 1550556849, 1550556849, NULL),
(10, 10, '0afe568dV4kF39yrrTdKH4Ys/bY3ASSrHxWMW/7RUifo8SZQ7mp1R9A8MYXJencnSNpJ1G6LwqO3fjgPgS+KL8aLFw2oEdkK9+l5NRcztOFJKJkz3F/mdm2GQtbsLrezcMnD/qVT5NoGQSjtKOE7NItIcmcQXOAYazlCSuv9AqpDxA+lYcI5eMrKoSevD6SGz2oTHuLf0TH2NKTDCVBo1PJFcH4mKTzyjdUN0o4Sw+AMxymDmJQEsaH8MY3gyk4n50SWWyDx6nZmTf51ch+slwYtgDziEOuEL4/HqWtvqhEn8zctgab5cPRGXtxld5DzES8iTvQcohvLnr1BATguxjvWIc3t/CWGaRILoozCkkO6+k0M8c8j0XahRz5AWiVdNUievX9bDmDhCF2L4aIYOrbxk+AQYN3DHuYTMn2PP4AJQJ3lKtE', 1, 1550556974, 1550556974, NULL),
(11, 11, '9347ca5bJBl8sUwa/BojaosJRRaHXqUYBsX2nM50Lu0Zv0BaT+VjqE3aoxGcRsOy+iBbfrOQ/KFqVLW3IWu4Yj0Ao9BUWolqIPeFFf0TS4aWOJAskiDPdpxwJ/uzoEc1Ezh+Uhq9xeLzP6nHfVUVlLv9u63SZIllFNOFRPPyZuW4D2puTf1q0dCcJXmqH35QA9/xoy93PI45fkTh4jZ2RVWxgWDqvLI5vvzAqrLTLH9v1MKijPv1MoRicDHfCZ/M0vThueLcq98RR12Zhoso5YT6cXgbsNBd/hgG1rIz72guvhrhpUNQe0NaqLCqv2IfIOVGWNWL0ZqgqAtLsncVqAO9bT468/kZIgVhXgauZZybndlSi8X3P8KGVGvW4HBxE1FZuI5tW7aEAPaPCU3dBOwSZNffECVJ3KDQc8SdOwAlrAlRtycb', 1, 1550557044, 1550557044, NULL),
(12, 12, '9051a83eXeRMaT9gNkV2MNj4T0vTkYd6+zWcRxfquPyXEDIgTpr4PyByZ9Oa85MF6YEZTLDPVc90S1fZccZbApvF5VJnsY541zIyfcUDBESXrWte5M57iNscl5I+HZ4V7g6R1/RAmukrNZ0VqbxoKZYd/ru63nzyyNh/UhIcnj2WzZamvByJQrEFQp7/L66j2lGAruNajKmRHgM+mXqwUpJt1t3gde8Xav2fRyPkLg1RyPWzLJ3uzsfxh97+oZKl4aVvOPccqY2llXpuP1W/dhc3Zt4bq9J+KBxthol0hKhG4h6fb4Lx8F55whHbjgavTTPp46xJIDk3H9dPCZBIfGloFkCCvy/lDiJvuzP47/SB75RbLhjp+ap/7p3mN5beQbBs0qZwU+1QZChJvBi9uabeUTG6wxWQNWAU6i5XQu5INQ2JKwI8rJghMKnFkVtFsuQn', 1, 1550558174, 1550558174, NULL),
(13, 13, '830c4760XGzkc4jIsH9NQ55y7y8QpYRjsicNcvS2a/bSjRJ+bquVBrkYB46KZ6+KqSDo+KIUFZOm+enCaOBYp3qhR2Q1NhBFuROW44by0X3n/W4rbS1RrxS3wzttNMWFy4MWLXV/GQkmftrrJ7vuud0PC41uSDuKw+RU8GS+JGgHHTGRUttS5IMUjMHZK0OmhOAK1ifvmzi4HpWX48ZnpmRmd3RQRzqbsPFlI6T6EO2jMMO815ZJPum5MjGE768+su+ULZHA/AfVWiGdd2hWgFLhKc9nML6o8iOdg+PYsGgUjl5I27OXhH/B0fnHVlgaaY8bzX+WJ3k0C4V+Zzfgf/HbKInegAAaxA/MyRO0i/ot5K9AEyq6fetLoqZ3Pwbzi9UP25v7kNnUxegVPKSxEFuvOiJG01AnU8bV7XLKnTVgLPq7b3Q', 1, 1550560717, 1550560717, NULL),
(14, 14, 'd9c3a6d0EpKbh9Fj2Ymqw0QejHPuf8eJuahpUvFFRQR/H39hFvCzS/qmITWCJjRDjUKam5Xv+6robqTgIgSMIkYwAkDW84h9Urfkpm3H3vX/dmnfxjDyi9kcqRUvyrXFyjlX0+kVQ2IThVsSQo4Gt+V59zYCMksZgJ81WGSibksRcOuycIkCNZOHOCmCM9ZIEG4nzwpY6Rcd9BdvPyATYx6Pbs6748P3PfJR5w1/nJOdLVg6+CiukQf4AH36Dd9ZLFFiFO9/CmTpMcnp0SxHXhmE0YyTiMxiI2F0TqQkyUUHhfbbasg4YksxdjgZzyDDAAnRJXzw9Oxln5wPPCiutaorT/i1Wpcyp79ySEfR2F9mtLfYxI5MQ4ZkY5enA2Cjo9t9rQBw6BMhj+zMnprYFEkpeQI60aHMq1QXIi5HC/xA5A2+', 1, 1550562176, 1550562176, NULL),
(15, 15, 'c2510c6bekW6MOblKo5D2365GW0c3dNlNo5x3UG49Rvcvyta/PR6apI2qp5RuRqKqpJqN9P5vjik/V6nwL3HDGG/T4ubkAHj0KsSIFuAWMDRcr074je6Mc3PeRajlG4XkUoV6NAktCcCXwI71tQ+6IaOjBgvgTdFfCVqcUV1yFNy8E+C1uL82oB77dTlCe6u+isqB7utkhyXw2gllnZvK4bK1EqLgeskqy/fZ6PweKSOc11G0tUqX6w5P4vk+LrKAR10rxsHwK6JILPHs8n1/D8uOsyF84yRh+Kw7xkcVqH6+fc+JUHqHRiNhJv3rNsoh/ma6ogvE1nV+R969tBmEeS9gHTLmAkDcktmarMqg6FYN1dOYJLdQp0C7HmXItkW4zeCi7Ku274mqHRO0AyT+Helvwu9klxEJQHrz7dNUBotI0xexA', 1, 1550562209, 1550562209, NULL),
(16, 16, '127b6a036ik6fyVZP+B2AlqRHckm8Ax0XEEGkgtmdigOnAaOgMIETa3tMoF3IdqZqPwz33REjo2DsYd9mnSnTcexe6/8dowYA7WrP76KK75TqN9iafGUFuCLiV2LWhAhKVQBI68nIFdqgweRokeyTMTOr+0arMAxX6bS9n6mv0K0LSQxTnAH8IdQMi24Gbn2LoRHJczql50sEuSiPoNOhPbs3Agky8OjRrY37420tawt+76S9vj7T3jBuVR1P8w5pZEoSRy8nK8RB6rEe/gPFC4Q9f1NetUachYsYX2fULIwClV5RT8fmN5qoDa8SKaqJU+iyDejKK/A6zPguiCEWohuCRwvyliX0daUO4ANtNlAar9pbfUzxsIhiN0VLdoWkd8d0c7SMmeF9cjk/A1djpy6l6jstqBgMm6KJUn+QPDOVhv8vtdTDtv0mxZJ61X2SgBcA3kl91g', 1, 1550562229, 1550562229, NULL),
(17, 17, '7638cb45jFoUxwGbdx6uM42OudsfT9bqQoJRRuVRD97+p6Us+dNAW0Unu+xbWsgLyFXM/CMXGU8Ar0M3jUd7rgtanLICc/asStueP1VhkPuz6smm2E6eOm0mjhBMF5GplPo+QLuIFT8uIbPEMkOEB7hM2spLAsHfaOUVzNEkvBRtCjiYb2W2spaR5Ph2kWW8jOIoAdhXjHS1cWfKevOC2KHB8FuqTc3p5fQD2llLwMqijAhuy7zr9W7FgvGNfZsaFvV99E54nGLYCc+4hThvqdeEiCQ8qJ+2EY9GEHlLS2kaEyDQ/Z63KN5I1xffW2geBBSuOWeWtgpoVAC8GxjO2jrGMHXXmfWn/Y/AJMFTFJkb6TOWQxsN279WIIIL9nXq7I0UKdGJoYZABPwAc1Zpv9t52j7w8MSzVIluHeY81PahCt2Gu65ELSid+d9YkZlYPcj3IyYqUg', 1, 1550562241, 1550562241, NULL),
(18, 18, 'faa4542b0vBDgYYLGUjLneX6V08Of+f0thX/rnR1BjUyE6O8rAWT1mxjsC7WYLd8c2Hb5+JrZR6Dmgpk+msnrM9zvOH07DtCS0+PuwpQ/9rnRC8d2TdM5ffZ6JoGTTfJeMaAoD6rto6vIJ9mQ3vt8O7kdRhBtEsHtFO/YSSUrLHUzmUV/YmXzrt4KGkfAra5ygzl/keg+6L7ToXvg5Ns348r2n5e6YLVb0kN/stN60vA9sDp4Vi7y/25i5JMfloihcTwTbXe0bbVuTiUeR901jyLMBrIM89yeFZ5xpVWPCesQUQnJHrnYvYYHjqIyzDDa1eC08dJtDIePCG73+rk6t1UUZ8+gctsc8Llr/e7k7fBtRI5EMF/U0AKIEWFoSWvU+WncOL0HbtVf4qKCN+alUqFA7S3XSqQn3dKXEyZKziSWJcm1DMT', 1, 1550562292, 1550562292, NULL),
(19, 19, '00d8d267KPn8mK+1/4JavMxdOa7P0KMaK61UMoz0s5ExrIFF0pQrV+Mmbvdo4Xmd7af0RGg8rdDnkkWlDMUegwsBOs8bXLnSK0vBkSy44edYAWuQjicHmPY5L/Ri8T78Ow3FDPILd2fFPRJ/Y8Yyvz8xAt02ddLZ7T9yZCQZuOPiBDHJkXFi/e9N/qT3OXJRuDtsmd7OwxJSird+B9Us+CVm6xzFbebi4nLOKdotq3zed3aQCl3/P/GnjO38DQAOOvLiIHCVkO4f2N6wNZ0XxT7M4HcZaYov+3oMAhJbShZuGCzb3DJLoqg3H1iE7O/Adc8qlN+kNJ5q9zp5aki2syxnym0j07T/guZ5g7YFrfDh13ISKobqYhKOMIpHFvnyX62frFAfOSZ944dUl0V8YFaOZjDV57s8Vt6crYsSWsmNQA8T2MR6ik7IA1G66dlikXvEoPM0cA', 1, 1550562308, 1550562308, NULL),
(20, 20, '292ebfe6QqQ4XGYZldI9Vwfwu/aAJJJ6HVUrauplP2mfjKA3lHMdEugu4e0Lc1GYy2zH0xzKrW9kfuS5UQmKW0UYbdF37t3oC73ziku4YF4FnryWKfpolOr/91QKAVFFFh7/HS8q8kQlVkvMBkIozzNhHwOJ+qLmBmrwdsEm/mj10BF3Vkunhe7k8RtGGUVNLL/ulr+1hIv8ZrPDyFFv9sU/dNf78ACPyyaqC/YRdaE8j9qZBPfi8Uz9muGoU2BaWQAbQvRVMMrcyDQ//dz17D0DF9k4hVSQy9ryARvaJVnMmq/K/SSWRAqx4xqeaa4LgAqmMnBnHYtOerRJ0ZBJc7sJ7jamkgqPE+suTYIUgrbfkOpeYyhwu58Fq0t9+UGiLKJcGhxXrfcnox1/xuxlvnceuyG7mu1d6xk74NuhhCValg', 1, 1550564589, 1550564589, NULL),
(21, 21, '8202678aUiHfxpfkaKYJeD4RTo652n/VSH24TeppcW18FKgTJorWi/dZb3IYMuDo+kNS7GC89m5c6K7oXJYgojjgbyxxUDYQAtcwphNlboCSloAJ1hWCyousmnIQOe1lUpnfqP86WuDVa3tL61IALABcpfTp0uiUVL+YtB7BFyXpgx+3G5KczJ+166/Jt8eAAHfkUV9YWOwOKgdpYKiNpZNRGSwRmw3xfk0dyL9TkTJ0aBVD+P4pm6f4w/onoGGG5rAfOGOD0ccKtIHBTnFYP5mwL4oEF7BMNmJouG18SYNKjUFnedFaxi8O4453XFo8mh+YUhn1Y3ZH/4M0sGc1+MLaAmp3ysQ6BKU3AYXLX670xiZdDNqSo3NJfHOhC5E3+1LC7KmFXmALl+j6Tm5BvX11IRYqPHjW2EnhY8QtsMFirvcW/1fbiTTmHrWrR6X56Lpf5+SzAXdc', 1, 1550626674, 1550626674, NULL),
(22, 22, '95fe8c7afJ4DcEtZw40yFvJvZu9/ujZUl7NAY/Soy0qRqiVT6vdmzdZDqqJyke1FZrwoGjG/L4lHQxew2SqiJux4c3+gAtxH1igLcRURLRPuADMNEa06iXyEuPWQFYPn7zOvzCSwIfdZgOODFlrccecGhcQSSLona2dRHW9vX2HCswrydEArRDvyWvDlQrMNuDJrUDTlBnb4ZU/TOQytQ+Ob4TkT31pHD4VhN70hLGPL5B6L1Yqhy1d8ATr1KrZwJ0prtR2b7nYkJZRZYVLyzWFYVBGzYUdl2s7GrCowGnpo3yB5rBAHYf+MuRstCtz6Z5YBqasmWaX+tWFZQ/s', 1, 1550626999, 1550626999, NULL),
(23, 23, '16e67570JPfudt84SO8OPdJ8Yhr9pJE0bANxrvT8gTnJSk9KqPJ4C947VbTgSp4j2+HJJF28sZuGyWf/YLLgDOy+cp8ddNmzjc0bAcr0volwz1rzMAheAG/TVB7wpPtqAnYrJGpo2ti1SXKkVcEaHLUCHug+MuU+1yMcp/papa1IA6dYLUx2i+I4ApUftxGtKwOHhmYlOErDJV/cy7dgOg7XkNaaqKmENl73vkMXNCHraEW3FareCVCityijAebLL6Ke5fl9Y0RhN0X78lkzDYOLVHh1FZR+asN40uTWX+qe7G/WqYjOjyhhIJXl4tYplfZXUZ3dBp4YB90Xz1w', 1, 1550626999, 1550626999, NULL),
(24, 24, 'b6d332f8ZVpgRpIaE89NGJSNLWzb8H7+WZF7TuOVF537nXWlVJzGFIGPHKfOMoEI3l3mfGlh0iW9FQ5ITFzPcd1yeUa5enDz0Wd1I7XG6bgqlwLZe+s1C+8SgPFekykiFKweUeXqA2xkhtl/mQUoR9qQ3mqQVuT0Qc3fOazzjsf3e8rV7NSiFNFL7vuiGIWRE+/iXAMNuzK+/IpAoAtBY2JXpYJ6ljs57VVdRDRmohazejoImxJX/SzXW76av/bMMi04p4NEq92Eu6v1+mvHvuXfhmsSbpSIyvkMuWvPApsC/zcZPWPaYjn4n55k4GLdahLRf7m/kKQ6sXc7XY9xlIIX6mpQbXcrXUzqjNKanr7d', 1, 1550627065, 1550627065, NULL),
(25, 25, '031d7f40YICGeAkitgV0r3f+ez8y2Lh3+RgK+Wiqz0QbA5ehp9K0nVAFYuz6jigLh7V2i424NFhTH1L1xmnArBSKo7DC54Qg81rESQqQ2m7lDo2Qmfh72FymbPFbkEKJaL7NuFDr8yMTK0Jp5lxQYqjUecpqOI5WFz3WelKlVHQYL3l/y5F7jGfabAeqq9HYX60eUFrnCjwhVDd1djClQA/1kFfut5x6Ivuw3jcSWAkxskoJ9tIxwUM977HUkehv83U2HIBekOOpoME8pjVmFm/a+wXISS6jzbW+2JAvq3Ar5HV0Bc/KctcTbG4NiJVa5QijSqfOzUjfAL7ojbG7rjJ6bayC3taIaQt4YJZ8duhZ', 1, 1550627065, 1550627065, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `y_admin_menus`
--

CREATE TABLE `y_admin_menus` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '菜单id',
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '父级id',
  `title` varchar(50) NOT NULL COMMENT '菜单名称',
  `url` varchar(100) NOT NULL COMMENT '模块/控制器/方法',
  `icon` varchar(50) NOT NULL DEFAULT 'fa-circle-o' COMMENT '菜单图标',
  `condition` varchar(255) DEFAULT '',
  `is_show` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '是否显示',
  `sort_id` smallint(5) UNSIGNED NOT NULL DEFAULT '1000' COMMENT '排序id',
  `log_type` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '0不记录日志，1get，2post，3put，4delete，先这些啦',
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '认证方式，1为实时认证，2为登录认证',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '状态：1默认正常，2禁用'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='后台菜单表';

--
-- 转存表中的数据 `y_admin_menus`
--

INSERT INTO `y_admin_menus` (`id`, `parent_id`, `title`, `url`, `icon`, `condition`, `is_show`, `sort_id`, `log_type`, `type`, `status`) VALUES
(1, 0, '后台首页', 'admin/index/index', 'fa-home', '', 1, 99, 0, 1, 1),
(2, 0, '系统管理', 'admin/sys', 'fa-desktop', '', 1, 1099, 0, 1, 1),
(3, 2, '用户管理', 'admin/admin_user/index', 'fa-user', '', 1, 1000, 0, 1, 1),
(4, 3, '添加用户', 'admin/admin_user/add', 'fa-plus', '', 0, 1000, 2, 1, 1),
(5, 3, '修改用户', 'admin/admin_user/edit', 'fa-edit', '', 0, 1000, 2, 1, 1),
(6, 3, '删除用户', 'admin/admin_user/del', 'fa-close', '', 0, 1000, 2, 1, 1),
(7, 2, '角色管理', 'admin/admin_group/index', 'fa-group', '', 1, 1000, 0, 1, 1),
(8, 7, '添加角色', 'admin/admin_group/add', 'fa-plus', '', 0, 1000, 2, 1, 1),
(9, 7, '修改角色', 'admin/admin_group/edit', 'fa-edit', '', 0, 1000, 2, 1, 1),
(10, 7, '删除角色', 'admin/admin_group/del', 'fa-close', '', 0, 1000, 2, 1, 1),
(11, 7, '角色授权', 'admin/admin_group/access', 'fa-key', '', 0, 1000, 2, 1, 1),
(12, 2, '菜单管理', 'admin/admin_menu/index', 'fa-align-justify', '', 1, 1000, 0, 1, 1),
(13, 12, '添加菜单', 'admin/admin_menu/add', 'fa-plus', '', 0, 1000, 2, 1, 1),
(14, 12, '修改菜单', 'admin/admin_menu/edit', 'fa-edit', '', 0, 1000, 2, 1, 1),
(15, 12, '删除菜单', 'admin/admin_menu/del', 'fa-close', '', 0, 1000, 2, 1, 1),
(16, 2, '系统设置', 'admin/sysconfig/manage', 'fa-cog', '', 1, 1000, 0, 1, 1),
(17, 16, '添加设置', 'admin/sysconfig/add', 'fa-plus', '', 0, 1000, 2, 1, 1),
(18, 16, '修改设置', 'admin/sysconfig/edit', 'fa-edit', '', 0, 1000, 2, 1, 1),
(19, 16, '删除设置', 'admin/sysconfig/del', 'fa-close', '', 0, 1000, 2, 1, 1),
(20, 2, '文件管理', 'admin/admin_file/manager', 'fa-file-text', '', 1, 1000, 0, 1, 1),
(21, 20, '文件列表', 'admin/admin_file/index', 'fa-list', '', 1, 1000, 0, 1, 1),
(22, 21, '上传文件', 'admin/admin_file/upload', 'fa-upload', '', 0, 1000, 2, 1, 1),
(23, 21, '下载文件', 'admin/admin_file/download', 'fa-download', '', 0, 1000, 1, 1, 1),
(24, 21, '修改文件', 'admin/admin_file/edit', 'fa-edit', '', 0, 1000, 2, 1, 1),
(25, 21, '删除文件', 'admin/admin_file/del', 'fa-crash', '', 0, 1000, 2, 1, 1),
(26, 20, '回收站文件', 'admin/admin_file/recycle', 'fa-recycle', '', 1, 1000, 0, 1, 1),
(27, 26, '还原文件', 'admin/admin_file/reduction', 'fa-reply', '', 0, 1000, 2, 1, 1),
(28, 26, '永久删除文件', 'admin/admin_file/delete', 'fa-trash', '', 0, 1000, 2, 1, 1),
(29, 2, '日志管理', 'admin/admin_log', 'fa-info-circle', '', 1, 1000, 0, 1, 1),
(30, 29, '操作日志', 'admin/admin_log/index', 'fa-keyboard-o', '', 1, 1000, 0, 1, 1),
(31, 30, '查看操作日志详情', 'admin/admin_log/view', 'fa-search-plus', '', 0, 1000, 0, 1, 1),
(32, 29, '系统日志', 'admin/syslog/index', 'fa-exclamation-circle', '', 1, 1000, 0, 1, 1),
(33, 32, '查看系统日志Trace', 'admin/syslog/view', 'fa-info-circle', '', 0, 1000, 0, 1, 1),
(34, 2, '数据维护', 'admin/data', 'fa-database', '', 1, 1000, 0, 1, 1),
(35, 34, '数据库备份', 'admin/databack/index', 'fa-database', '', 1, 1000, 0, 1, 1),
(36, 35, '添加备份', 'admin/databack/add', 'fa-plus', '', 0, 1000, 2, 1, 1),
(37, 35, '删除备份', 'admin/databack/del', 'fa-trash', '', 0, 1000, 2, 1, 1),
(38, 35, '还原备份', 'admin/databack/reduction', 'fa-circle-o', '', 0, 1000, 2, 1, 1),
(39, 35, '下载备份', 'admin/databack/download', 'fa-download', '', 0, 1000, 1, 1, 1),
(40, 34, '数据表管理', 'admin/database/index', 'fa-list', '', 1, 1000, 0, 1, 1),
(41, 40, '优化表', 'admin/database/optimize', 'fa-refresh', '', 0, 1000, 2, 1, 1),
(42, 40, '修复表', 'admin/database/repair', 'fa-circle-o-notch', '', 0, 1000, 2, 1, 1),
(43, 40, '查看表详情', 'admin/database/view', 'fa-info-circle', '', 0, 1000, 2, 1, 1),
(44, 2, '个人资料', 'admin/admin_user/profile', 'fa-smile-o', '', 1, 2000, 2, 1, 1),
(45, 0, '用户管理', 'admin/user/manage', 'fa-user', '', 1, 1000, 0, 1, 1),
(46, 45, '用户列表', 'admin/user/index', 'fa-list', '', 1, 1000, 0, 1, 1),
(47, 46, '添加用户', 'admin/user/add', 'fa-plus', '', 0, 1000, 2, 1, 1),
(48, 46, '修改用户', 'admin/user/edit', 'fa-pencil', '', 0, 1000, 2, 1, 1),
(49, 46, '删除用户', 'admin/user/del', 'fa-trash', '', 0, 1000, 2, 1, 1),
(50, 46, '禁用/启用 用户', 'admin/user/disable', 'fa-ban', '', 0, 1000, 2, 1, 1),
(51, 45, '用户等级', 'admin/user_level/index', 'fa-list', '', 1, 1000, 0, 1, 1),
(52, 51, '添加用户等级', 'admin/user_level/add', 'fa-plus', '', 0, 1000, 2, 1, 1),
(53, 51, '修改用户等级', 'admin/user_level/edit', 'fa-pencil', '', 0, 1000, 2, 1, 1),
(54, 51, '删除用户等级', 'admin/user_level/del', 'fa-trash', '', 0, 1000, 2, 1, 1),
(55, 16, '后台设置', 'admin/sysconfig/index', 'fa-list', '', 1, 1000, 0, 1, 1),
(56, 2, '定时任务', 'admin/crontab/index', 'fa-calendar', '', 1, 1000, 0, 1, 1),
(57, 2, '微信管理', 'admin/weautoreply', 'fa-list', '', 1, 1000, 0, 1, 1),
(58, 57, '自动回复', 'admin/weautoreply/index', 'fa-list', '', 1, 1000, 0, 1, 1),
(59, 57, '资源管理', 'admin/weresponse/index', 'fa-list', '', 1, 1000, 0, 1, 1),
(60, 59, '新增资源', 'admin/weresponse/add', 'fa-list', '', 0, 1000, 2, 1, 1),
(61, 59, '修改资源', 'admin/weresponse/edit', 'fa-list', '', 0, 1000, 2, 1, 1),
(62, 59, '删除资源', 'admin/weresponse/del', 'fa-list', '', 0, 1000, 2, 1, 1),
(63, 57, '菜单管理', 'admin/wemenu/index', 'fa-list', '', 1, 1000, 0, 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `y_admin_users`
--

CREATE TABLE `y_admin_users` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '用户id',
  `name` varchar(50) NOT NULL COMMENT '用户名（登录帐号）',
  `password` char(32) NOT NULL COMMENT '密码',
  `nickname` varchar(30) DEFAULT NULL COMMENT '用户昵称或中文用户名',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `mobile` char(11) DEFAULT NULL COMMENT '手机号',
  `avatar` varchar(255) DEFAULT '/static/admin/images/avatar.png' COMMENT '用户头像',
  `qq_openid` varchar(64) DEFAULT NULL,
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `delete_time` int(10) UNSIGNED DEFAULT NULL COMMENT '删除时间',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '用户状态1正常，0冻结'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='后台用户表';

--
-- 转存表中的数据 `y_admin_users`
--

INSERT INTO `y_admin_users` (`id`, `name`, `password`, `nickname`, `email`, `mobile`, `avatar`, `qq_openid`, `create_time`, `update_time`, `delete_time`, `status`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '超级管理员', '', '18888888888', '/static/admin/images/avatar.png', NULL, 1488189586, 1526916735, NULL, 1),
(2, 'demo', 'fe01ce2a7fbac8fafaed7c982a04e229', 'Demo', '', '', '/static/admin/images/avatar.png', NULL, 1539572074, 1539572110, NULL, 1);

-- --------------------------------------------------------

--
-- 表的结构 `y_attachments`
--

CREATE TABLE `y_attachments` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '上传用户id',
  `original_name` varchar(255) NOT NULL,
  `save_name` varchar(255) NOT NULL,
  `save_path` varchar(255) NOT NULL,
  `extension` varchar(255) NOT NULL,
  `mime` varchar(255) NOT NULL,
  `size` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `md5` char(32) NOT NULL,
  `sha1` char(40) NOT NULL,
  `url` varchar(255) NOT NULL,
  `is_open` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否公开，默认为0不公开只能自己看，1为公开',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `update_time` int(11) UNSIGNED NOT NULL,
  `delete_time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='附件表';

--
-- 转存表中的数据 `y_attachments`
--

INSERT INTO `y_attachments` (`id`, `user_id`, `original_name`, `save_name`, `save_path`, `extension`, `mime`, `size`, `md5`, `sha1`, `url`, `is_open`, `create_time`, `update_time`, `delete_time`) VALUES
(1, 0, 'fx.png', 'dd9be964dc8cec705ef2626be6a94648.png', 'D:/php/website/BearAdmin/public/uploads/attachment/20180808/dd9be964dc8cec705ef2626be6a94648.png', 'png', 'image/png', 3228, '82d5b8eb764adb141250a8613b0f883a', 'be9492d8fa95873377e3e8008b15b1d41368925b', '/uploads/attachment/20180808/dd9be964dc8cec705ef2626be6a94648.png', 0, 1533695403, 1533695403, NULL),
(2, 0, 'r3.png', '7e2a8ed1e5e301608e8851e8df8d0bbe.png', 'D:/php/website/BearAdmin/public/uploads/attachment/20180808/7e2a8ed1e5e301608e8851e8df8d0bbe.png', 'png', 'image/png', 1933, 'b7a14b939643579b40273a10a29da008', 'b9db5f2d43c2b988ea65612a414403e8f9f78c63', '/uploads/attachment/20180808/7e2a8ed1e5e301608e8851e8df8d0bbe.png', 0, 1533695438, 1533695438, NULL),
(3, 0, 'r3_1.png', '1c6bcdb692cc11df6b393e90d30af5e2.png', 'D:/php/website/BearAdmin/public/uploads/attachment/20180808/1c6bcdb692cc11df6b393e90d30af5e2.png', 'png', 'image/png', 1836, '9f870914e24115562c869538daa4820d', 'e83af3fcc03e7b9db52ad485f6b4e142eaadda7c', '/uploads/attachment/20180808/1c6bcdb692cc11df6b393e90d30af5e2.png', 0, 1533695461, 1533695461, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `y_crontab`
--

CREATE TABLE `y_crontab` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'ID',
  `type` varchar(10) NOT NULL DEFAULT '' COMMENT '事件类型',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '事件标题',
  `content` text NOT NULL COMMENT '事件内容',
  `schedule` varchar(100) NOT NULL DEFAULT '' COMMENT 'Crontab格式',
  `sleep` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '延迟秒数执行',
  `maximums` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '最大执行次数 0为不限',
  `executes` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '已经执行的次数',
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `begintime` int(10) NOT NULL DEFAULT '0' COMMENT '开始时间',
  `endtime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '结束时间',
  `executetime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '最后执行时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` enum('completed','expired','hidden','normal') NOT NULL DEFAULT 'normal' COMMENT '状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务表';

--
-- 转存表中的数据 `y_crontab`
--

INSERT INTO `y_crontab` (`id`, `type`, `title`, `content`, `schedule`, `sleep`, `maximums`, `executes`, `createtime`, `updatetime`, `begintime`, `endtime`, `executetime`, `weigh`, `status`) VALUES
(1, 'url', '测试', 'http://www.baidu.com', '*/1 * * * *', 0, 0, 4, 1548655272, 1548730225, 0, 0, 1548730225, 0, 'normal');

-- --------------------------------------------------------

--
-- 表的结构 `y_crontab_log`
--

CREATE TABLE `y_crontab_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `create_time` int(10) UNSIGNED NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `crontab_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `y_excel_examples`
--

CREATE TABLE `y_excel_examples` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `age` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `sex` varchar(8) NOT NULL,
  `city` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- 转存表中的数据 `y_excel_examples`
--

INSERT INTO `y_excel_examples` (`id`, `name`, `age`, `sex`, `city`) VALUES
(1, 'a', 25, '男', '济南'),
(2, 'b', 23, '女', '济南'),
(3, 'c', 1, '男', '济南');

-- --------------------------------------------------------

--
-- 表的结构 `y_sysconfigs`
--

CREATE TABLE `y_sysconfigs` (
  `id` int(11) UNSIGNED NOT NULL,
  `group_id` int(11) UNSIGNED NOT NULL DEFAULT '1' COMMENT '分组默认1，系统设置',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `code` varchar(255) NOT NULL COMMENT '代码',
  `content` varchar(255) NOT NULL COMMENT '内容',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '是否启用，1启用，0禁用',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `delete_time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统参数表';

--
-- 转存表中的数据 `y_sysconfigs`
--

INSERT INTO `y_sysconfigs` (`id`, `group_id`, `name`, `code`, `content`, `description`, `status`, `create_time`, `update_time`, `delete_time`) VALUES
(1, 1, '后台名称', 'backend_name', 'YAdmin', '网站后台名称，title和登录界面显示', 1, 1502187289, 0, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `y_syslogs`
--

CREATE TABLE `y_syslogs` (
  `id` int(11) UNSIGNED NOT NULL,
  `level` int(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT '错误等级',
  `message` varchar(255) NOT NULL COMMENT '错误信息',
  `file` varchar(255) NOT NULL COMMENT '文件',
  `line` int(10) UNSIGNED NOT NULL COMMENT '所在行数',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统错误日志表';

--
-- 转存表中的数据 `y_syslogs`
--

INSERT INTO `y_syslogs` (`id`, `level`, `message`, `file`, `line`, `create_time`) VALUES
(1, 0, 'module not exists:favicon.ico', '/var/www/html/base/thinkphp/library/think/App.php', 535, 1547357452),
(2, 0, 'module not exists:favicon.ico', '/var/www/html/base/thinkphp/library/think/App.php', 535, 1547447215),
(3, 0, 'module not exists:favicon.ico', '/var/www/html/base/thinkphp/library/think/App.php', 535, 1548386263),
(4, 0, 'module not exists:favicon.ico', '/var/www/html/base/thinkphp/library/think/App.php', 535, 1548647533),
(5, 0, 'module not exists:favicon-32x32.png', '/var/www/html/base/thinkphp/library/think/App.php', 535, 1548647540),
(6, 0, 'module not exists:favicon-16x16.png', '/var/www/html/base/thinkphp/library/think/App.php', 535, 1548647540),
(7, 0, 'module not exists:favicon-96x96.png', '/var/www/html/base/thinkphp/library/think/App.php', 535, 1548647540),
(8, 0, 'SQLSTATE[HY000]: General error: 1364 Field \'id\' doesn\'t have a default value', '/var/www/html/base/thinkphp/library/think/db/Connection.php', 453, 1548655001),
(9, 0, 'SQLSTATE[HY000]: General error: 1364 Field \'id\' doesn\'t have a default value', '/var/www/html/base/thinkphp/library/think/db/Connection.php', 453, 1548655017),
(10, 0, 'SQLSTATE[HY000]: General error: 1364 Field \'id\' doesn\'t have a default value', '/var/www/html/base/thinkphp/library/think/db/Connection.php', 453, 1548655039),
(11, 0, 'SQLSTATE[HY000]: General error: 1364 Field \'id\' doesn\'t have a default value', '/var/www/html/base/thinkphp/library/think/db/Connection.php', 453, 1548655209),
(12, 0, 'module not exists:favicon.ico', '/var/www/html/base/thinkphp/library/think/App.php', 535, 1550544647),
(13, 0, 'module not exists:favicon-32x32.png', '/var/www/html/base/thinkphp/library/think/App.php', 535, 1550544656),
(14, 0, 'module not exists:favicon-16x16.png', '/var/www/html/base/thinkphp/library/think/App.php', 535, 1550544656),
(15, 0, 'module not exists:favicon-96x96.png', '/var/www/html/base/thinkphp/library/think/App.php', 535, 1550544657),
(16, 0, 'controller not exists:app\\common\\model\\WechatAutoreply', '/var/www/html/base/thinkphp/library/think/App.php', 583, 1550547011),
(17, 0, 'Fatal error: Call to a member function get() on null', '/var/www/html/base/application/admin/controller/Weautoreply.php', 34, 1550547132),
(18, 0, 'controller not exists:app\\common\\model\\WechatAutoreply', '/var/www/html/base/thinkphp/library/think/App.php', 583, 1550547179),
(19, 0, 'controller not exists:app\\common\\model\\WechatAutoreply', '/var/www/html/base/thinkphp/library/think/App.php', 583, 1550547354),
(20, 0, 'Fatal error: Call to undefined function app\\admin\\controller\\__()', '/var/www/html/base/application/admin/controller/Weautoreply.php', 34, 1550547452),
(21, 0, 'Fatal error: Class \'app\\admin\\controller\\WechatResponse\' not found', '/var/www/html/base/application/admin/controller/Weautoreply.php', 43, 1550547475),
(22, 0, 'template not exists:/var/www/html/base/public/../application/admin/view/weautoreply/edit.html', '/var/www/html/base/thinkphp/library/think/view/driver/Think.php', 82, 1550547504),
(23, 0, 'template not exists:/var/www/html/base/public/../application/admin/view/weautoreply/edit.html', '/var/www/html/base/thinkphp/library/think/view/driver/Think.php', 82, 1550547540),
(24, 0, 'template not exists:/var/www/html/base/public/../application/admin/view/weautoreply/edit.html', '/var/www/html/base/thinkphp/library/think/view/driver/Think.php', 82, 1550547548),
(25, 0, 'Undefined variable: webData', '/var/www/html/base/runtime/temp/d7f2f2c624753d7e115eb768b5d93fdd.php', 63, 1550547630),
(26, 0, 'Undefined variable: webData', '/var/www/html/base/runtime/temp/d7f2f2c624753d7e115eb768b5d93fdd.php', 63, 1550547999),
(27, 0, 'Undefined variable: webData', '/var/www/html/base/runtime/temp/d7f2f2c624753d7e115eb768b5d93fdd.php', 63, 1550555994),
(28, 0, 'Class \'app\\admin\\controller\\wechat\\Base\' not found', '/var/www/html/base/application/admin/controller/Wxresponse.php', 13, 1550556263),
(29, 0, 'template not exists:/var/www/html/base/public/../application/admin/view/wxresponse/index.html', '/var/www/html/base/thinkphp/library/think/view/driver/Think.php', 82, 1550556489),
(30, 0, 'Fatal error: Call to undefined function build_heading()', '/var/www/html/base/runtime/temp/7d4cc61b15cd4ca133e74e085b67c142.php', 145, 1550556546),
(31, 0, 'Undefined variable: auth', '/var/www/html/base/runtime/temp/7d4cc61b15cd4ca133e74e085b67c142.php', 155, 1550556584),
(32, 0, 'Fatal error: Call to undefined function build_heading()', '/var/www/html/base/runtime/temp/6503312d327c4800a5de4a74dd56a81a.php', 145, 1550557113),
(33, 0, 'Undefined variable: auth', '/var/www/html/base/runtime/temp/6503312d327c4800a5de4a74dd56a81a.php', 153, 1550557167),
(34, 0, 'Undefined variable: auth', '/var/www/html/base/runtime/temp/6503312d327c4800a5de4a74dd56a81a.php', 152, 1550557308),
(35, 0, 'Undefined variable: auth', '/var/www/html/base/runtime/temp/6503312d327c4800a5de4a74dd56a81a.php', 152, 1550557349),
(36, 0, 'Undefined variable: auth', '/var/www/html/base/runtime/temp/6503312d327c4800a5de4a74dd56a81a.php', 152, 1550557399),
(37, 0, 'Undefined variable: list', '/var/www/html/base/runtime/temp/6503312d327c4800a5de4a74dd56a81a.php', 214, 1550557557),
(38, 0, 'method not exist:think\\db\\Query->adminGroup', '/var/www/html/base/thinkphp/library/think/db/Query.php', 103, 1550557767),
(39, 0, 'property not exists:app\\common\\model\\WechatAutoreply->avatar', '/var/www/html/base/thinkphp/library/think/Model.php', 626, 1550557797),
(40, 0, 'Undefined variable: ids', '/var/www/html/base/application/admin/controller/Weautoreply.php', 52, 1550558300),
(41, 0, 'Undefined variable: site', '/var/www/html/base/runtime/temp/a076629c4ea46d52358b00f3f3002c56.php', 144, 1550558469),
(42, 0, 'Undefined variable: site', '/var/www/html/base/runtime/temp/a076629c4ea46d52358b00f3f3002c56.php', 144, 1550558521),
(43, 0, 'Fatal error: Call to undefined function __()', '/var/www/html/base/runtime/temp/a076629c4ea46d52358b00f3f3002c56.php', 189, 1550558862),
(44, 0, 'Undefined variable: auth', '/var/www/html/base/runtime/temp/7d4cc61b15cd4ca133e74e085b67c142.php', 155, 1550560721),
(45, 0, 'property not exists:app\\common\\model\\WechatResponse->text', '/var/www/html/base/thinkphp/library/think/Model.php', 626, 1550560948),
(46, 0, 'Fatal error: Class \'addons\\wechat\\library\\Wechat\' not found', '/var/www/html/base/application/admin/controller/Weresponse.php', 71, 1550561278),
(47, 0, 'Fatal error: Class \'addons\\wechat\\library\\Wechat\' not found', '/var/www/html/base/application/admin/controller/Weresponse.php', 71, 1550562052),
(48, 0, 'Undefined variable: webData', '/var/www/html/base/runtime/temp/f11276d9e22219470792bb4643dd3aaa.php', 63, 1550562093),
(49, 0, 'Undefined variable: webData', '/var/www/html/base/runtime/temp/f11276d9e22219470792bb4643dd3aaa.php', 63, 1550562324),
(50, 0, 'Undefined variable: showFormFooter', '/var/www/html/base/runtime/temp/f11276d9e22219470792bb4643dd3aaa.php', 96, 1550562753),
(51, 0, 'Undefined variable: showFormFooter', '/var/www/html/base/runtime/temp/f11276d9e22219470792bb4643dd3aaa.php', 93, 1550562821),
(52, 0, 'Class \'app\\common\\controller\\Backend\' not found', '/var/www/html/base/application/admin/controller/Wemenu.php', 15, 1550564593),
(53, 0, 'Undefined variable: webData', '/var/www/html/base/runtime/temp/e204b2241c6499318ec5d3375576b101.php', 63, 1550564621),
(54, 0, 'Undefined variable: showFormFooter', '/var/www/html/base/runtime/temp/f11276d9e22219470792bb4643dd3aaa.php', 93, 1550565528),
(55, 0, 'Undefined variable: showFormFooter', '/var/www/html/base/runtime/temp/f11276d9e22219470792bb4643dd3aaa.php', 93, 1550565644),
(56, 0, 'Undefined variable: showFormFooterSubmitButton', '/var/www/html/base/runtime/temp/f11276d9e22219470792bb4643dd3aaa.php', 99, 1550565680),
(57, 0, 'Undefined variable: showFormFooterResetButton', '/var/www/html/base/runtime/temp/f11276d9e22219470792bb4643dd3aaa.php', 105, 1550565705),
(58, 0, 'module not exists:favicon.ico', '/var/www/html/base/thinkphp/library/think/App.php', 535, 1550626662),
(59, 0, 'module not exists:favicon-32x32.png', '/var/www/html/base/thinkphp/library/think/App.php', 535, 1550626675),
(60, 0, 'module not exists:favicon-16x16.png', '/var/www/html/base/thinkphp/library/think/App.php', 535, 1550626675),
(61, 0, 'module not exists:favicon-96x96.png', '/var/www/html/base/thinkphp/library/think/App.php', 535, 1550626675);

-- --------------------------------------------------------

--
-- 表的结构 `y_syslog_trace`
--

CREATE TABLE `y_syslog_trace` (
  `id` int(11) UNSIGNED NOT NULL,
  `log_id` int(11) UNSIGNED NOT NULL COMMENT '日志id',
  `trace` longtext COMMENT '日志trace'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统日志trace表';

--
-- 转存表中的数据 `y_syslog_trace`
--

INSERT INTO `y_syslog_trace` (`id`, `log_id`, `trace`) VALUES
(1, 1, '#0 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, NULL)\n#1 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#2 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#3 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#4 {main}'),
(2, 2, '#0 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, NULL)\n#1 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#2 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#3 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#4 {main}'),
(3, 3, '#0 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, NULL)\n#1 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#2 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#3 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#4 {main}'),
(4, 4, '#0 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, NULL)\n#1 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#2 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#3 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#4 {main}'),
(5, 5, '#0 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, NULL)\n#1 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#2 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#3 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#4 {main}'),
(6, 6, '#0 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, NULL)\n#1 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#2 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#3 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#4 {main}'),
(7, 7, '#0 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, NULL)\n#1 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#2 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#3 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#4 {main}'),
(8, 8, '#0 /var/www/html/base/thinkphp/library/think/db/Query.php(269): think\\db\\Connection->execute(\'INSERT INTO `y_...\', Array, Object(think\\db\\Query))\n#1 /var/www/html/base/thinkphp/library/think/db/Query.php(2275): think\\db\\Query->execute(\'INSERT INTO `y_...\', Array, Object(think\\db\\Query))\n#2 /var/www/html/base/thinkphp/library/think/Model.php(1182): think\\db\\Query->insert(Array, false, false, NULL)\n#3 /var/www/html/base/thinkphp/library/think/Model.php(1663): think\\Model->save(Array, Array)\n#4 /var/www/html/base/application/admin/controller/Crontab.php(39): think\\Model::create(Array)\n#5 [internal function]: app\\admin\\controller\\Crontab->add()\n#6 /var/www/html/base/thinkphp/library/think/App.php(343): ReflectionMethod->invokeArgs(Object(app\\admin\\controller\\Crontab), Array)\n#7 /var/www/html/base/thinkphp/library/think/App.php(611): think\\App::invokeMethod(Array, Array)\n#8 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, true)\n#9 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#10 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#11 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#12 {main}'),
(9, 9, '#0 /var/www/html/base/thinkphp/library/think/db/Query.php(269): think\\db\\Connection->execute(\'INSERT INTO `y_...\', Array, Object(think\\db\\Query))\n#1 /var/www/html/base/thinkphp/library/think/db/Query.php(2275): think\\db\\Query->execute(\'INSERT INTO `y_...\', Array, Object(think\\db\\Query))\n#2 /var/www/html/base/thinkphp/library/think/Model.php(1182): think\\db\\Query->insert(Array, false, false, NULL)\n#3 /var/www/html/base/thinkphp/library/think/Model.php(1663): think\\Model->save(Array, Array)\n#4 /var/www/html/base/application/admin/controller/Crontab.php(39): think\\Model::create(Array)\n#5 [internal function]: app\\admin\\controller\\Crontab->add()\n#6 /var/www/html/base/thinkphp/library/think/App.php(343): ReflectionMethod->invokeArgs(Object(app\\admin\\controller\\Crontab), Array)\n#7 /var/www/html/base/thinkphp/library/think/App.php(611): think\\App::invokeMethod(Array, Array)\n#8 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, true)\n#9 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#10 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#11 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#12 {main}'),
(10, 10, '#0 /var/www/html/base/thinkphp/library/think/db/Query.php(269): think\\db\\Connection->execute(\'INSERT INTO `y_...\', Array, Object(think\\db\\Query))\n#1 /var/www/html/base/thinkphp/library/think/db/Query.php(2275): think\\db\\Query->execute(\'INSERT INTO `y_...\', Array, Object(think\\db\\Query))\n#2 /var/www/html/base/thinkphp/library/think/Model.php(1182): think\\db\\Query->insert(Array, false, false, NULL)\n#3 /var/www/html/base/thinkphp/library/think/Model.php(1663): think\\Model->save(Array, Array)\n#4 /var/www/html/base/application/admin/controller/Crontab.php(39): think\\Model::create(Array)\n#5 [internal function]: app\\admin\\controller\\Crontab->add()\n#6 /var/www/html/base/thinkphp/library/think/App.php(343): ReflectionMethod->invokeArgs(Object(app\\admin\\controller\\Crontab), Array)\n#7 /var/www/html/base/thinkphp/library/think/App.php(611): think\\App::invokeMethod(Array, Array)\n#8 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, true)\n#9 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#10 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#11 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#12 {main}'),
(11, 11, '#0 /var/www/html/base/thinkphp/library/think/db/Query.php(269): think\\db\\Connection->execute(\'INSERT INTO `y_...\', Array, Object(think\\db\\Query))\n#1 /var/www/html/base/thinkphp/library/think/db/Query.php(2275): think\\db\\Query->execute(\'INSERT INTO `y_...\', Array, Object(think\\db\\Query))\n#2 /var/www/html/base/thinkphp/library/think/Model.php(1182): think\\db\\Query->insert(Array, false, false, NULL)\n#3 /var/www/html/base/thinkphp/library/think/Model.php(1663): think\\Model->save(Array, Array)\n#4 /var/www/html/base/application/admin/controller/Crontab.php(39): think\\Model::create(Array)\n#5 [internal function]: app\\admin\\controller\\Crontab->add()\n#6 /var/www/html/base/thinkphp/library/think/App.php(343): ReflectionMethod->invokeArgs(Object(app\\admin\\controller\\Crontab), Array)\n#7 /var/www/html/base/thinkphp/library/think/App.php(611): think\\App::invokeMethod(Array, Array)\n#8 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, true)\n#9 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#10 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#11 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#12 {main}'),
(12, 12, '#0 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, NULL)\n#1 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#2 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#3 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#4 {main}'),
(13, 13, '#0 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, NULL)\n#1 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#2 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#3 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#4 {main}'),
(14, 14, '#0 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, NULL)\n#1 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#2 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#3 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#4 {main}'),
(15, 15, '#0 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, NULL)\n#1 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#2 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#3 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#4 {main}'),
(16, 16, '#0 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, true)\n#1 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#2 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#3 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#4 {main}'),
(17, 17, '#0 [internal function]: app\\admin\\controller\\WeAutoreply->edit(NULL)\n#1 /var/www/html/base/thinkphp/library/think/App.php(343): ReflectionMethod->invokeArgs(Object(app\\admin\\controller\\WeAutoreply), Array)\n#2 /var/www/html/base/thinkphp/library/think/App.php(611): think\\App::invokeMethod(Array, Array)\n#3 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, true)\n#4 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#5 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#6 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#7 {main}'),
(18, 18, '#0 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, true)\n#1 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#2 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#3 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#4 {main}'),
(19, 19, '#0 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, true)\n#1 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#2 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#3 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#4 {main}'),
(20, 20, '#0 [internal function]: app\\admin\\controller\\WeAutoreply->edit(NULL)\n#1 /var/www/html/base/thinkphp/library/think/App.php(343): ReflectionMethod->invokeArgs(Object(app\\admin\\controller\\WeAutoreply), Array)\n#2 /var/www/html/base/thinkphp/library/think/App.php(611): think\\App::invokeMethod(Array, Array)\n#3 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, true)\n#4 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#5 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#6 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#7 {main}'),
(21, 21, '#0 [internal function]: app\\admin\\controller\\WeAutoreply->edit(\'1\')\n#1 /var/www/html/base/thinkphp/library/think/App.php(343): ReflectionMethod->invokeArgs(Object(app\\admin\\controller\\WeAutoreply), Array)\n#2 /var/www/html/base/thinkphp/library/think/App.php(611): think\\App::invokeMethod(Array, Array)\n#3 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, true)\n#4 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#5 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#6 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#7 {main}'),
(22, 22, '#0 /var/www/html/base/thinkphp/library/think/View.php(163): think\\view\\driver\\Think->fetch(\'/var/www/html/b...\', Array, Array)\n#1 /var/www/html/base/application/admin/controller/Weautoreply.php(46): think\\View->fetch()\n#2 [internal function]: app\\admin\\controller\\WeAutoreply->edit(\'1\')\n#3 /var/www/html/base/thinkphp/library/think/App.php(343): ReflectionMethod->invokeArgs(Object(app\\admin\\controller\\WeAutoreply), Array)\n#4 /var/www/html/base/thinkphp/library/think/App.php(611): think\\App::invokeMethod(Array, Array)\n#5 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, true)\n#6 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#7 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#8 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#9 {main}'),
(23, 23, '#0 /var/www/html/base/thinkphp/library/think/View.php(163): think\\view\\driver\\Think->fetch(\'/var/www/html/b...\', Array, Array)\n#1 /var/www/html/base/application/admin/controller/Weautoreply.php(46): think\\View->fetch()\n#2 [internal function]: app\\admin\\controller\\WeAutoreply->edit(\'1\')\n#3 /var/www/html/base/thinkphp/library/think/App.php(343): ReflectionMethod->invokeArgs(Object(app\\admin\\controller\\WeAutoreply), Array)\n#4 /var/www/html/base/thinkphp/library/think/App.php(611): think\\App::invokeMethod(Array, Array)\n#5 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, true)\n#6 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#7 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#8 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#9 {main}'),
(24, 24, '#0 /var/www/html/base/thinkphp/library/think/View.php(163): think\\view\\driver\\Think->fetch(\'/var/www/html/b...\', Array, Array)\n#1 /var/www/html/base/application/admin/controller/Weautoreply.php(46): think\\View->fetch()\n#2 [internal function]: app\\admin\\controller\\WeAutoreply->edit(\'1\')\n#3 /var/www/html/base/thinkphp/library/think/App.php(343): ReflectionMethod->invokeArgs(Object(app\\admin\\controller\\WeAutoreply), Array)\n#4 /var/www/html/base/thinkphp/library/think/App.php(611): think\\App::invokeMethod(Array, Array)\n#5 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, true)\n#6 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#7 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#8 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#9 {main}'),
(25, 25, '#0 /var/www/html/base/runtime/temp/d7f2f2c624753d7e115eb768b5d93fdd.php(63): think\\Error::appError(8, \'Undefined varia...\', \'/var/www/html/b...\', 63, Array)\n#1 /var/www/html/base/thinkphp/library/think/template/driver/File.php(53): include(\'/var/www/html/b...\')\n#2 /var/www/html/base/thinkphp/library/think/Template.php(188): think\\template\\driver\\File->read(\'/var/www/html/b...\', Array)\n#3 /var/www/html/base/thinkphp/library/think/view/driver/Think.php(86): think\\Template->fetch(\'/var/www/html/b...\', Array, Array)\n#4 /var/www/html/base/thinkphp/library/think/View.php(163): think\\view\\driver\\Think->fetch(\'/var/www/html/b...\', Array, Array)\n#5 /var/www/html/base/application/admin/controller/Weautoreply.php(46): think\\View->fetch()\n#6 [internal function]: app\\admin\\controller\\WeAutoreply->edit(\'1\')\n#7 /var/www/html/base/thinkphp/library/think/App.php(343): ReflectionMethod->invokeArgs(Object(app\\admin\\controller\\WeAutoreply), Array)\n#8 /var/www/html/base/thinkphp/library/think/App.php(611): think\\App::invokeMethod(Array, Array)\n#9 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, true)\n#10 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#11 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#12 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#13 {main}'),
(26, 26, '#0 /var/www/html/base/runtime/temp/d7f2f2c624753d7e115eb768b5d93fdd.php(63): think\\Error::appError(8, \'Undefined varia...\', \'/var/www/html/b...\', 63, Array)\n#1 /var/www/html/base/thinkphp/library/think/template/driver/File.php(53): include(\'/var/www/html/b...\')\n#2 /var/www/html/base/thinkphp/library/think/Template.php(188): think\\template\\driver\\File->read(\'/var/www/html/b...\', Array)\n#3 /var/www/html/base/thinkphp/library/think/view/driver/Think.php(86): think\\Template->fetch(\'/var/www/html/b...\', Array, Array)\n#4 /var/www/html/base/thinkphp/library/think/View.php(163): think\\view\\driver\\Think->fetch(\'/var/www/html/b...\', Array, Array)\n#5 /var/www/html/base/application/admin/controller/Weautoreply.php(46): think\\View->fetch()\n#6 [internal function]: app\\admin\\controller\\WeAutoreply->edit(\'1\')\n#7 /var/www/html/base/thinkphp/library/think/App.php(343): ReflectionMethod->invokeArgs(Object(app\\admin\\controller\\WeAutoreply), Array)\n#8 /var/www/html/base/thinkphp/library/think/App.php(611): think\\App::invokeMethod(Array, Array)\n#9 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, true)\n#10 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#11 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#12 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#13 {main}'),
(27, 27, '#0 /var/www/html/base/runtime/temp/d7f2f2c624753d7e115eb768b5d93fdd.php(63): think\\Error::appError(8, \'Undefined varia...\', \'/var/www/html/b...\', 63, Array)\n#1 /var/www/html/base/thinkphp/library/think/template/driver/File.php(53): include(\'/var/www/html/b...\')\n#2 /var/www/html/base/thinkphp/library/think/Template.php(188): think\\template\\driver\\File->read(\'/var/www/html/b...\', Array)\n#3 /var/www/html/base/thinkphp/library/think/view/driver/Think.php(86): think\\Template->fetch(\'/var/www/html/b...\', Array, Array)\n#4 /var/www/html/base/thinkphp/library/think/View.php(163): think\\view\\driver\\Think->fetch(\'/var/www/html/b...\', Array, Array)\n#5 /var/www/html/base/application/admin/controller/Weautoreply.php(46): think\\View->fetch()\n#6 [internal function]: app\\admin\\controller\\WeAutoreply->edit(\'1\')\n#7 /var/www/html/base/thinkphp/library/think/App.php(343): ReflectionMethod->invokeArgs(Object(app\\admin\\controller\\WeAutoreply), Array)\n#8 /var/www/html/base/thinkphp/library/think/App.php(611): think\\App::invokeMethod(Array, Array)\n#9 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, true)\n#10 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#11 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#12 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#13 {main}'),
(28, 28, '#0 [internal function]: think\\Error::appShutdown()\n#1 {main}'),
(29, 29, '#0 /var/www/html/base/thinkphp/library/think/View.php(163): think\\view\\driver\\Think->fetch(\'/var/www/html/b...\', Array, Array)\n#1 /var/www/html/base/thinkphp/library/think/Controller.php(120): think\\View->fetch(\'\', Array, Array, Array)\n#2 /var/www/html/base/application/admin/controller/Base.php(345): think\\Controller->fetch(\'\', Array, Array, Array)\n#3 /var/www/html/base/application/admin/controller/Wxresponse.php(26): app\\admin\\controller\\Base->fetch()\n#4 [internal function]: app\\admin\\controller\\WxResponse->index()\n#5 /var/www/html/base/thinkphp/library/think/App.php(343): ReflectionMethod->invokeArgs(Object(app\\admin\\controller\\WxResponse), Array)\n#6 /var/www/html/base/thinkphp/library/think/App.php(611): think\\App::invokeMethod(Array, Array)\n#7 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, true)\n#8 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#9 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#10 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#11 {main}'),
(30, 30, '#0 /var/www/html/base/thinkphp/library/think/template/driver/File.php(53): include()\n#1 /var/www/html/base/thinkphp/library/think/Template.php(188): think\\template\\driver\\File->read(\'/var/www/html/b...\', Array)\n#2 /var/www/html/base/thinkphp/library/think/view/driver/Think.php(86): think\\Template->fetch(\'/var/www/html/b...\', Array, Array)\n#3 /var/www/html/base/thinkphp/library/think/View.php(163): think\\view\\driver\\Think->fetch(\'/var/www/html/b...\', Array, Array)\n#4 /var/www/html/base/thinkphp/library/think/Controller.php(120): think\\View->fetch(\'\', Array, Array, Array)\n#5 /var/www/html/base/application/admin/controller/Base.php(345): think\\Controller->fetch(\'\', Array, Array, Array)\n#6 /var/www/html/base/application/admin/controller/Weresponse.php(26): app\\admin\\controller\\Base->fetch()\n#7 [internal function]: app\\admin\\controller\\WeResponse->index()\n#8 /var/www/html/base/thinkphp/library/think/App.php(343): ReflectionMethod->invokeArgs(Object(app\\admin\\controller\\WeResponse), Array)\n#9 /var/www/html/base/thinkphp/library/think/App.php(611): think\\App::invokeMethod(Array, Array)\n#10 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, true)\n#11 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#12 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#13 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#14 {main}'),
(31, 31, '#0 /var/www/html/base/runtime/temp/7d4cc61b15cd4ca133e74e085b67c142.php(155): think\\Error::appError(8, \'Undefined varia...\', \'/var/www/html/b...\', 155, Array)\n#1 /var/www/html/base/thinkphp/library/think/template/driver/File.php(53): include(\'/var/www/html/b...\')\n#2 /var/www/html/base/thinkphp/library/think/Template.php(188): think\\template\\driver\\File->read(\'/var/www/html/b...\', Array)\n#3 /var/www/html/base/thinkphp/library/think/view/driver/Think.php(86): think\\Template->fetch(\'/var/www/html/b...\', Array, Array)\n#4 /var/www/html/base/thinkphp/library/think/View.php(163): think\\view\\driver\\Think->fetch(\'/var/www/html/b...\', Array, Array)\n#5 /var/www/html/base/thinkphp/library/think/Controller.php(120): think\\View->fetch(\'\', Array, Array, Array)\n#6 /var/www/html/base/application/admin/controller/Base.php(345): think\\Controller->fetch(\'\', Array, Array, Array)\n#7 /var/www/html/base/application/admin/controller/Weresponse.php(26): app\\admin\\controller\\Base->fetch()\n#8 [internal function]: app\\admin\\controller\\WeResponse->index()\n#9 /var/www/html/base/thinkphp/library/think/App.php(343): ReflectionMethod->invokeArgs(Object(app\\admin\\controller\\WeResponse), Array)\n#10 /var/www/html/base/thinkphp/library/think/App.php(611): think\\App::invokeMethod(Array, Array)\n#11 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, true)\n#12 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#13 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#14 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#15 {main}'),
(32, 32, '#0 /var/www/html/base/thinkphp/library/think/template/driver/File.php(53): include()\n#1 /var/www/html/base/thinkphp/library/think/Template.php(188): think\\template\\driver\\File->read(\'/var/www/html/b...\', Array)\n#2 /var/www/html/base/thinkphp/library/think/view/driver/Think.php(86): think\\Template->fetch(\'/var/www/html/b...\', Array, Array)\n#3 /var/www/html/base/thinkphp/library/think/View.php(163): think\\view\\driver\\Think->fetch(\'/var/www/html/b...\', Array, Array)\n#4 /var/www/html/base/thinkphp/library/think/Controller.php(120): think\\View->fetch(\'\', Array, Array, Array)\n#5 /var/www/html/base/application/admin/controller/Base.php(345): think\\Controller->fetch(\'\', Array, Array, Array)\n#6 /var/www/html/base/application/admin/controller/Weautoreply.php(26): app\\admin\\controller\\Base->fetch()\n#7 [internal function]: app\\admin\\controller\\WeAutoreply->index()\n#8 /var/www/html/base/thinkphp/library/think/App.php(343): ReflectionMethod->invokeArgs(Object(app\\admin\\controller\\WeAutoreply), Array)\n#9 /var/www/html/base/thinkphp/library/think/App.php(611): think\\App::invokeMethod(Array, Array)\n#10 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, true)\n#11 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#12 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#13 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#14 {main}'),
(33, 33, '#0 /var/www/html/base/runtime/temp/6503312d327c4800a5de4a74dd56a81a.php(153): think\\Error::appError(8, \'Undefined varia...\', \'/var/www/html/b...\', 153, Array)\n#1 /var/www/html/base/thinkphp/library/think/template/driver/File.php(53): include(\'/var/www/html/b...\')\n#2 /var/www/html/base/thinkphp/library/think/Template.php(188): think\\template\\driver\\File->read(\'/var/www/html/b...\', Array)\n#3 /var/www/html/base/thinkphp/library/think/view/driver/Think.php(86): think\\Template->fetch(\'/var/www/html/b...\', Array, Array)\n#4 /var/www/html/base/thinkphp/library/think/View.php(163): think\\view\\driver\\Think->fetch(\'/var/www/html/b...\', Array, Array)\n#5 /var/www/html/base/thinkphp/library/think/Controller.php(120): think\\View->fetch(\'\', Array, Array, Array)\n#6 /var/www/html/base/application/admin/controller/Base.php(345): think\\Controller->fetch(\'\', Array, Array, Array)\n#7 /var/www/html/base/application/admin/controller/Weautoreply.php(26): app\\admin\\controller\\Base->fetch()\n#8 [internal function]: app\\admin\\controller\\WeAutoreply->index()\n#9 /var/www/html/base/thinkphp/library/think/App.php(343): ReflectionMethod->invokeArgs(Object(app\\admin\\controller\\WeAutoreply), Array)\n#10 /var/www/html/base/thinkphp/library/think/App.php(611): think\\App::invokeMethod(Array, Array)\n#11 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, true)\n#12 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#13 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#14 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#15 {main}'),
(34, 34, '#0 /var/www/html/base/runtime/temp/6503312d327c4800a5de4a74dd56a81a.php(152): think\\Error::appError(8, \'Undefined varia...\', \'/var/www/html/b...\', 152, Array)\n#1 /var/www/html/base/thinkphp/library/think/template/driver/File.php(53): include(\'/var/www/html/b...\')\n#2 /var/www/html/base/thinkphp/library/think/Template.php(188): think\\template\\driver\\File->read(\'/var/www/html/b...\', Array)\n#3 /var/www/html/base/thinkphp/library/think/view/driver/Think.php(86): think\\Template->fetch(\'/var/www/html/b...\', Array, Array)\n#4 /var/www/html/base/thinkphp/library/think/View.php(163): think\\view\\driver\\Think->fetch(\'/var/www/html/b...\', Array, Array)\n#5 /var/www/html/base/thinkphp/library/think/Controller.php(120): think\\View->fetch(\'\', Array, Array, Array)\n#6 /var/www/html/base/application/admin/controller/Base.php(345): think\\Controller->fetch(\'\', Array, Array, Array)\n#7 /var/www/html/base/application/admin/controller/Weautoreply.php(26): app\\admin\\controller\\Base->fetch()\n#8 [internal function]: app\\admin\\controller\\WeAutoreply->index()\n#9 /var/www/html/base/thinkphp/library/think/App.php(343): ReflectionMethod->invokeArgs(Object(app\\admin\\controller\\WeAutoreply), Array)\n#10 /var/www/html/base/thinkphp/library/think/App.php(611): think\\App::invokeMethod(Array, Array)\n#11 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, true)\n#12 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#13 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#14 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#15 {main}'),
(35, 35, '#0 /var/www/html/base/runtime/temp/6503312d327c4800a5de4a74dd56a81a.php(152): think\\Error::appError(8, \'Undefined varia...\', \'/var/www/html/b...\', 152, Array)\n#1 /var/www/html/base/thinkphp/library/think/template/driver/File.php(53): include(\'/var/www/html/b...\')\n#2 /var/www/html/base/thinkphp/library/think/Template.php(188): think\\template\\driver\\File->read(\'/var/www/html/b...\', Array)\n#3 /var/www/html/base/thinkphp/library/think/view/driver/Think.php(86): think\\Template->fetch(\'/var/www/html/b...\', Array, Array)\n#4 /var/www/html/base/thinkphp/library/think/View.php(163): think\\view\\driver\\Think->fetch(\'/var/www/html/b...\', Array, Array)\n#5 /var/www/html/base/thinkphp/library/think/Controller.php(120): think\\View->fetch(\'\', Array, Array, Array)\n#6 /var/www/html/base/application/admin/controller/Base.php(345): think\\Controller->fetch(\'\', Array, Array, Array)\n#7 /var/www/html/base/application/admin/controller/Weautoreply.php(26): app\\admin\\controller\\Base->fetch()\n#8 [internal function]: app\\admin\\controller\\WeAutoreply->index()\n#9 /var/www/html/base/thinkphp/library/think/App.php(343): ReflectionMethod->invokeArgs(Object(app\\admin\\controller\\WeAutoreply), Array)\n#10 /var/www/html/base/thinkphp/library/think/App.php(611): think\\App::invokeMethod(Array, Array)\n#11 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, true)\n#12 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#13 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#14 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#15 {main}'),
(36, 36, '#0 /var/www/html/base/runtime/temp/6503312d327c4800a5de4a74dd56a81a.php(152): think\\Error::appError(8, \'Undefined varia...\', \'/var/www/html/b...\', 152, Array)\n#1 /var/www/html/base/thinkphp/library/think/template/driver/File.php(53): include(\'/var/www/html/b...\')\n#2 /var/www/html/base/thinkphp/library/think/Template.php(188): think\\template\\driver\\File->read(\'/var/www/html/b...\', Array)\n#3 /var/www/html/base/thinkphp/library/think/view/driver/Think.php(86): think\\Template->fetch(\'/var/www/html/b...\', Array, Array)\n#4 /var/www/html/base/thinkphp/library/think/View.php(163): think\\view\\driver\\Think->fetch(\'/var/www/html/b...\', Array, Array)\n#5 /var/www/html/base/thinkphp/library/think/Controller.php(120): think\\View->fetch(\'\', Array, Array, Array)\n#6 /var/www/html/base/application/admin/controller/Base.php(345): think\\Controller->fetch(\'\', Array, Array, Array)\n#7 /var/www/html/base/application/admin/controller/Weautoreply.php(26): app\\admin\\controller\\Base->fetch()\n#8 [internal function]: app\\admin\\controller\\WeAutoreply->index()\n#9 /var/www/html/base/thinkphp/library/think/App.php(343): ReflectionMethod->invokeArgs(Object(app\\admin\\controller\\WeAutoreply), Array)\n#10 /var/www/html/base/thinkphp/library/think/App.php(611): think\\App::invokeMethod(Array, Array)\n#11 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, true)\n#12 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#13 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#14 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#15 {main}'),
(37, 37, '#0 /var/www/html/base/runtime/temp/6503312d327c4800a5de4a74dd56a81a.php(214): think\\Error::appError(8, \'Undefined varia...\', \'/var/www/html/b...\', 214, Array)\n#1 /var/www/html/base/thinkphp/library/think/template/driver/File.php(53): include(\'/var/www/html/b...\')\n#2 /var/www/html/base/thinkphp/library/think/Template.php(188): think\\template\\driver\\File->read(\'/var/www/html/b...\', Array)\n#3 /var/www/html/base/thinkphp/library/think/view/driver/Think.php(86): think\\Template->fetch(\'/var/www/html/b...\', Array, Array)\n#4 /var/www/html/base/thinkphp/library/think/View.php(163): think\\view\\driver\\Think->fetch(\'/var/www/html/b...\', Array, Array)\n#5 /var/www/html/base/thinkphp/library/think/Controller.php(120): think\\View->fetch(\'\', Array, Array, Array)\n#6 /var/www/html/base/application/admin/controller/Base.php(345): think\\Controller->fetch(\'\', Array, Array, Array)\n#7 /var/www/html/base/application/admin/controller/Weautoreply.php(26): app\\admin\\controller\\Base->fetch()\n#8 [internal function]: app\\admin\\controller\\WeAutoreply->index()\n#9 /var/www/html/base/thinkphp/library/think/App.php(343): ReflectionMethod->invokeArgs(Object(app\\admin\\controller\\WeAutoreply), Array)\n#10 /var/www/html/base/thinkphp/library/think/App.php(611): think\\App::invokeMethod(Array, Array)\n#11 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, true)\n#12 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#13 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#14 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#15 {main}'),
(38, 38, '#0 [internal function]: think\\db\\Query->__call(\'adminGroup\', Array)\n#1 /var/www/html/base/thinkphp/library/think/Model.php(2190): call_user_func_array(Array, Array)\n#2 /var/www/html/base/thinkphp/library/think/Model.php(1900): think\\Model->__call(\'adminGroup\', Array)\n#3 /var/www/html/base/thinkphp/library/think/db/Query.php(2548): think\\Model->relationQuery(Array)\n#4 /var/www/html/base/thinkphp/library/think/db/Query.php(1485): think\\db\\Query->select()\n#5 /var/www/html/base/application/admin/controller/Weautoreply.php(38): think\\db\\Query->paginate(10, false, Array)\n#6 [internal function]: app\\admin\\controller\\WeAutoreply->index()\n#7 /var/www/html/base/thinkphp/library/think/App.php(343): ReflectionMethod->invokeArgs(Object(app\\admin\\controller\\WeAutoreply), Array)\n#8 /var/www/html/base/thinkphp/library/think/App.php(611): think\\App::invokeMethod(Array, Array)\n#9 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, true)\n#10 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#11 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#12 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#13 {main}'),
(39, 39, '#0 /var/www/html/base/thinkphp/library/think/Model.php(2294): think\\Model->getAttr(\'avatar\')\n#1 /var/www/html/base/runtime/temp/6503312d327c4800a5de4a74dd56a81a.php(222): think\\Model->offsetGet(\'avatar\')\n#2 /var/www/html/base/thinkphp/library/think/template/driver/File.php(53): include(\'/var/www/html/b...\')\n#3 /var/www/html/base/thinkphp/library/think/Template.php(188): think\\template\\driver\\File->read(\'/var/www/html/b...\', Array)\n#4 /var/www/html/base/thinkphp/library/think/view/driver/Think.php(86): think\\Template->fetch(\'/var/www/html/b...\', Array, Array)\n#5 /var/www/html/base/thinkphp/library/think/View.php(163): think\\view\\driver\\Think->fetch(\'/var/www/html/b...\', Array, Array)\n#6 /var/www/html/base/thinkphp/library/think/Controller.php(120): think\\View->fetch(\'\', Array, Array, Array)\n#7 /var/www/html/base/application/admin/controller/Base.php(345): think\\Controller->fetch(\'\', Array, Array, Array)\n#8 /var/www/html/base/application/admin/controller/Weautoreply.php(43): app\\admin\\controller\\Base->fetch()\n#9 [internal function]: app\\admin\\controller\\WeAutoreply->index()\n#10 /var/www/html/base/thinkphp/library/think/App.php(343): ReflectionMethod->invokeArgs(Object(app\\admin\\controller\\WeAutoreply), Array)\n#11 /var/www/html/base/thinkphp/library/think/App.php(611): think\\App::invokeMethod(Array, Array)\n#12 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, true)\n#13 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#14 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#15 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#16 {main}'),
(40, 40, '#0 /var/www/html/base/application/admin/controller/Weautoreply.php(52): think\\Error::appError(8, \'Undefined varia...\', \'/var/www/html/b...\', 52, Array)\n#1 [internal function]: app\\admin\\controller\\WeAutoreply->edit(\'2\')\n#2 /var/www/html/base/thinkphp/library/think/App.php(343): ReflectionMethod->invokeArgs(Object(app\\admin\\controller\\WeAutoreply), Array)\n#3 /var/www/html/base/thinkphp/library/think/App.php(611): think\\App::invokeMethod(Array, Array)\n#4 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, true)\n#5 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#6 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#7 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#8 {main}'),
(41, 41, '#0 /var/www/html/base/runtime/temp/a076629c4ea46d52358b00f3f3002c56.php(144): think\\Error::appError(8, \'Undefined varia...\', \'/var/www/html/b...\', 144, Array)\n#1 /var/www/html/base/thinkphp/library/think/template/driver/File.php(53): include(\'/var/www/html/b...\')\n#2 /var/www/html/base/thinkphp/library/think/Template.php(188): think\\template\\driver\\File->read(\'/var/www/html/b...\', Array)\n#3 /var/www/html/base/thinkphp/library/think/view/driver/Think.php(86): think\\Template->fetch(\'/var/www/html/b...\', Array, Array)\n#4 /var/www/html/base/thinkphp/library/think/View.php(163): think\\view\\driver\\Think->fetch(\'/var/www/html/b...\', Array, Array)\n#5 /var/www/html/base/thinkphp/library/think/Controller.php(120): think\\View->fetch(\'\', Array, Array, Array)\n#6 /var/www/html/base/application/admin/controller/Base.php(345): think\\Controller->fetch(\'\', Array, Array, Array)\n#7 /var/www/html/base/application/admin/controller/Weautoreply.php(55): app\\admin\\controller\\Base->fetch()\n#8 [internal function]: app\\admin\\controller\\WeAutoreply->add()\n#9 /var/www/html/base/thinkphp/library/think/App.php(343): ReflectionMethod->invokeArgs(Object(app\\admin\\controller\\WeAutoreply), Array)\n#10 /var/www/html/base/thinkphp/library/think/App.php(611): think\\App::invokeMethod(Array, Array)\n#11 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, true)\n#12 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#13 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#14 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#15 {main}'),
(42, 42, '#0 /var/www/html/base/runtime/temp/a076629c4ea46d52358b00f3f3002c56.php(144): think\\Error::appError(8, \'Undefined varia...\', \'/var/www/html/b...\', 144, Array)\n#1 /var/www/html/base/thinkphp/library/think/template/driver/File.php(53): include(\'/var/www/html/b...\')\n#2 /var/www/html/base/thinkphp/library/think/Template.php(188): think\\template\\driver\\File->read(\'/var/www/html/b...\', Array)\n#3 /var/www/html/base/thinkphp/library/think/view/driver/Think.php(86): think\\Template->fetch(\'/var/www/html/b...\', Array, Array)\n#4 /var/www/html/base/thinkphp/library/think/View.php(163): think\\view\\driver\\Think->fetch(\'/var/www/html/b...\', Array, Array)\n#5 /var/www/html/base/thinkphp/library/think/Controller.php(120): think\\View->fetch(\'\', Array, Array, Array)\n#6 /var/www/html/base/application/admin/controller/Base.php(345): think\\Controller->fetch(\'\', Array, Array, Array)\n#7 /var/www/html/base/application/admin/controller/Weautoreply.php(55): app\\admin\\controller\\Base->fetch()\n#8 [internal function]: app\\admin\\controller\\WeAutoreply->add()\n#9 /var/www/html/base/thinkphp/library/think/App.php(343): ReflectionMethod->invokeArgs(Object(app\\admin\\controller\\WeAutoreply), Array)\n#10 /var/www/html/base/thinkphp/library/think/App.php(611): think\\App::invokeMethod(Array, Array)\n#11 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, true)\n#12 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#13 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#14 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#15 {main}'),
(43, 43, '#0 /var/www/html/base/thinkphp/library/think/template/driver/File.php(53): include()\n#1 /var/www/html/base/thinkphp/library/think/Template.php(188): think\\template\\driver\\File->read(\'/var/www/html/b...\', Array)\n#2 /var/www/html/base/thinkphp/library/think/view/driver/Think.php(86): think\\Template->fetch(\'/var/www/html/b...\', Array, Array)\n#3 /var/www/html/base/thinkphp/library/think/View.php(163): think\\view\\driver\\Think->fetch(\'/var/www/html/b...\', Array, Array)\n#4 /var/www/html/base/thinkphp/library/think/Controller.php(120): think\\View->fetch(\'\', Array, Array, Array)\n#5 /var/www/html/base/application/admin/controller/Base.php(345): think\\Controller->fetch(\'\', Array, Array, Array)\n#6 /var/www/html/base/application/admin/controller/Weautoreply.php(55): app\\admin\\controller\\Base->fetch()\n#7 [internal function]: app\\admin\\controller\\WeAutoreply->add()\n#8 /var/www/html/base/thinkphp/library/think/App.php(343): ReflectionMethod->invokeArgs(Object(app\\admin\\controller\\WeAutoreply), Array)\n#9 /var/www/html/base/thinkphp/library/think/App.php(611): think\\App::invokeMethod(Array, Array)\n#10 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, true)\n#11 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#12 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#13 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#14 {main}'),
(44, 44, '#0 /var/www/html/base/runtime/temp/7d4cc61b15cd4ca133e74e085b67c142.php(155): think\\Error::appError(8, \'Undefined varia...\', \'/var/www/html/b...\', 155, Array)\n#1 /var/www/html/base/thinkphp/library/think/template/driver/File.php(53): include(\'/var/www/html/b...\')\n#2 /var/www/html/base/thinkphp/library/think/Template.php(188): think\\template\\driver\\File->read(\'/var/www/html/b...\', Array)\n#3 /var/www/html/base/thinkphp/library/think/view/driver/Think.php(86): think\\Template->fetch(\'/var/www/html/b...\', Array, Array)\n#4 /var/www/html/base/thinkphp/library/think/View.php(163): think\\view\\driver\\Think->fetch(\'/var/www/html/b...\', Array, Array)\n#5 /var/www/html/base/thinkphp/library/think/Controller.php(120): think\\View->fetch(\'\', Array, Array, Array)\n#6 /var/www/html/base/application/admin/controller/Base.php(345): think\\Controller->fetch(\'\', Array, Array, Array)\n#7 /var/www/html/base/application/admin/controller/Weresponse.php(26): app\\admin\\controller\\Base->fetch()\n#8 [internal function]: app\\admin\\controller\\WeResponse->index()\n#9 /var/www/html/base/thinkphp/library/think/App.php(343): ReflectionMethod->invokeArgs(Object(app\\admin\\controller\\WeResponse), Array)\n#10 /var/www/html/base/thinkphp/library/think/App.php(611): think\\App::invokeMethod(Array, Array)\n#11 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, true)\n#12 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#13 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#14 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#15 {main}'),
(45, 45, '#0 /var/www/html/base/thinkphp/library/think/Model.php(2294): think\\Model->getAttr(\'text\')\n#1 /var/www/html/base/runtime/temp/7d4cc61b15cd4ca133e74e085b67c142.php(223): think\\Model->offsetGet(\'text\')\n#2 /var/www/html/base/thinkphp/library/think/template/driver/File.php(53): include(\'/var/www/html/b...\')\n#3 /var/www/html/base/thinkphp/library/think/Template.php(188): think\\template\\driver\\File->read(\'/var/www/html/b...\', Array)\n#4 /var/www/html/base/thinkphp/library/think/view/driver/Think.php(86): think\\Template->fetch(\'/var/www/html/b...\', Array, Array)\n#5 /var/www/html/base/thinkphp/library/think/View.php(163): think\\view\\driver\\Think->fetch(\'/var/www/html/b...\', Array, Array)\n#6 /var/www/html/base/thinkphp/library/think/Controller.php(120): think\\View->fetch(\'\', Array, Array, Array)\n#7 /var/www/html/base/application/admin/controller/Base.php(345): think\\Controller->fetch(\'\', Array, Array, Array)\n#8 /var/www/html/base/application/admin/controller/Weresponse.php(43): app\\admin\\controller\\Base->fetch()\n#9 [internal function]: app\\admin\\controller\\WeResponse->index()\n#10 /var/www/html/base/thinkphp/library/think/App.php(343): ReflectionMethod->invokeArgs(Object(app\\admin\\controller\\WeResponse), Array)\n#11 /var/www/html/base/thinkphp/library/think/App.php(611): think\\App::invokeMethod(Array, Array)\n#12 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, true)\n#13 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#14 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#15 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#16 {main}'),
(46, 46, '#0 [internal function]: app\\admin\\controller\\WeResponse->add()\n#1 /var/www/html/base/thinkphp/library/think/App.php(343): ReflectionMethod->invokeArgs(Object(app\\admin\\controller\\WeResponse), Array)\n#2 /var/www/html/base/thinkphp/library/think/App.php(611): think\\App::invokeMethod(Array, Array)\n#3 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, true)\n#4 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#5 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#6 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#7 {main}'),
(47, 47, '#0 [internal function]: app\\admin\\controller\\WeResponse->add()\n#1 /var/www/html/base/thinkphp/library/think/App.php(343): ReflectionMethod->invokeArgs(Object(app\\admin\\controller\\WeResponse), Array)\n#2 /var/www/html/base/thinkphp/library/think/App.php(611): think\\App::invokeMethod(Array, Array)\n#3 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, true)\n#4 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#5 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#6 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#7 {main}'),
(48, 48, '#0 /var/www/html/base/runtime/temp/f11276d9e22219470792bb4643dd3aaa.php(63): think\\Error::appError(8, \'Undefined varia...\', \'/var/www/html/b...\', 63, Array)\n#1 /var/www/html/base/thinkphp/library/think/template/driver/File.php(53): include(\'/var/www/html/b...\')\n#2 /var/www/html/base/thinkphp/library/think/Template.php(188): think\\template\\driver\\File->read(\'/var/www/html/b...\', Array)\n#3 /var/www/html/base/thinkphp/library/think/view/driver/Think.php(86): think\\Template->fetch(\'/var/www/html/b...\', Array, Array)\n#4 /var/www/html/base/thinkphp/library/think/View.php(163): think\\view\\driver\\Think->fetch(\'/var/www/html/b...\', Array, Array)\n#5 /var/www/html/base/application/admin/controller/Weresponse.php(73): think\\View->fetch()\n#6 [internal function]: app\\admin\\controller\\WeResponse->add()\n#7 /var/www/html/base/thinkphp/library/think/App.php(343): ReflectionMethod->invokeArgs(Object(app\\admin\\controller\\WeResponse), Array)\n#8 /var/www/html/base/thinkphp/library/think/App.php(611): think\\App::invokeMethod(Array, Array)\n#9 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, true)\n#10 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#11 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#12 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#13 {main}'),
(49, 49, '#0 /var/www/html/base/runtime/temp/f11276d9e22219470792bb4643dd3aaa.php(63): think\\Error::appError(8, \'Undefined varia...\', \'/var/www/html/b...\', 63, Array)\n#1 /var/www/html/base/thinkphp/library/think/template/driver/File.php(53): include(\'/var/www/html/b...\')\n#2 /var/www/html/base/thinkphp/library/think/Template.php(188): think\\template\\driver\\File->read(\'/var/www/html/b...\', Array)\n#3 /var/www/html/base/thinkphp/library/think/view/driver/Think.php(86): think\\Template->fetch(\'/var/www/html/b...\', Array, Array)\n#4 /var/www/html/base/thinkphp/library/think/View.php(163): think\\view\\driver\\Think->fetch(\'/var/www/html/b...\', Array, Array)\n#5 /var/www/html/base/application/admin/controller/Weresponse.php(73): think\\View->fetch()\n#6 [internal function]: app\\admin\\controller\\WeResponse->add()\n#7 /var/www/html/base/thinkphp/library/think/App.php(343): ReflectionMethod->invokeArgs(Object(app\\admin\\controller\\WeResponse), Array)\n#8 /var/www/html/base/thinkphp/library/think/App.php(611): think\\App::invokeMethod(Array, Array)\n#9 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, true)\n#10 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#11 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#12 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#13 {main}');
INSERT INTO `y_syslog_trace` (`id`, `log_id`, `trace`) VALUES
(50, 50, '#0 /var/www/html/base/runtime/temp/f11276d9e22219470792bb4643dd3aaa.php(96): think\\Error::appError(8, \'Undefined varia...\', \'/var/www/html/b...\', 96, Array)\n#1 /var/www/html/base/thinkphp/library/think/template/driver/File.php(53): include(\'/var/www/html/b...\')\n#2 /var/www/html/base/thinkphp/library/think/Template.php(188): think\\template\\driver\\File->read(\'/var/www/html/b...\', Array)\n#3 /var/www/html/base/thinkphp/library/think/view/driver/Think.php(86): think\\Template->fetch(\'/var/www/html/b...\', Array, Array)\n#4 /var/www/html/base/thinkphp/library/think/View.php(163): think\\view\\driver\\Think->fetch(\'/var/www/html/b...\', Array, Array)\n#5 /var/www/html/base/application/admin/controller/Weresponse.php(73): think\\View->fetch()\n#6 [internal function]: app\\admin\\controller\\WeResponse->add()\n#7 /var/www/html/base/thinkphp/library/think/App.php(343): ReflectionMethod->invokeArgs(Object(app\\admin\\controller\\WeResponse), Array)\n#8 /var/www/html/base/thinkphp/library/think/App.php(611): think\\App::invokeMethod(Array, Array)\n#9 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, true)\n#10 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#11 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#12 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#13 {main}'),
(51, 51, '#0 /var/www/html/base/runtime/temp/f11276d9e22219470792bb4643dd3aaa.php(93): think\\Error::appError(8, \'Undefined varia...\', \'/var/www/html/b...\', 93, Array)\n#1 /var/www/html/base/thinkphp/library/think/template/driver/File.php(53): include(\'/var/www/html/b...\')\n#2 /var/www/html/base/thinkphp/library/think/Template.php(188): think\\template\\driver\\File->read(\'/var/www/html/b...\', Array)\n#3 /var/www/html/base/thinkphp/library/think/view/driver/Think.php(86): think\\Template->fetch(\'/var/www/html/b...\', Array, Array)\n#4 /var/www/html/base/thinkphp/library/think/View.php(163): think\\view\\driver\\Think->fetch(\'/var/www/html/b...\', Array, Array)\n#5 /var/www/html/base/application/admin/controller/Weresponse.php(73): think\\View->fetch()\n#6 [internal function]: app\\admin\\controller\\WeResponse->add()\n#7 /var/www/html/base/thinkphp/library/think/App.php(343): ReflectionMethod->invokeArgs(Object(app\\admin\\controller\\WeResponse), Array)\n#8 /var/www/html/base/thinkphp/library/think/App.php(611): think\\App::invokeMethod(Array, Array)\n#9 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, true)\n#10 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#11 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#12 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#13 {main}'),
(52, 52, '#0 [internal function]: think\\Error::appShutdown()\n#1 {main}'),
(53, 53, '#0 /var/www/html/base/runtime/temp/e204b2241c6499318ec5d3375576b101.php(63): think\\Error::appError(8, \'Undefined varia...\', \'/var/www/html/b...\', 63, Array)\n#1 /var/www/html/base/thinkphp/library/think/template/driver/File.php(53): include(\'/var/www/html/b...\')\n#2 /var/www/html/base/thinkphp/library/think/Template.php(188): think\\template\\driver\\File->read(\'/var/www/html/b...\', Array)\n#3 /var/www/html/base/thinkphp/library/think/view/driver/Think.php(86): think\\Template->fetch(\'/var/www/html/b...\', Array, Array)\n#4 /var/www/html/base/thinkphp/library/think/View.php(163): think\\view\\driver\\Think->fetch(\'/var/www/html/b...\', Array, Array)\n#5 /var/www/html/base/application/admin/controller/Wemenu.php(38): think\\View->fetch()\n#6 [internal function]: app\\admin\\controller\\WeMenu->index()\n#7 /var/www/html/base/thinkphp/library/think/App.php(343): ReflectionMethod->invokeArgs(Object(app\\admin\\controller\\WeMenu), Array)\n#8 /var/www/html/base/thinkphp/library/think/App.php(611): think\\App::invokeMethod(Array, Array)\n#9 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, true)\n#10 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#11 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#12 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#13 {main}'),
(54, 54, '#0 /var/www/html/base/runtime/temp/f11276d9e22219470792bb4643dd3aaa.php(93): think\\Error::appError(8, \'Undefined varia...\', \'/var/www/html/b...\', 93, Array)\n#1 /var/www/html/base/thinkphp/library/think/template/driver/File.php(53): include(\'/var/www/html/b...\')\n#2 /var/www/html/base/thinkphp/library/think/Template.php(188): think\\template\\driver\\File->read(\'/var/www/html/b...\', Array)\n#3 /var/www/html/base/thinkphp/library/think/view/driver/Think.php(86): think\\Template->fetch(\'/var/www/html/b...\', Array, Array)\n#4 /var/www/html/base/thinkphp/library/think/View.php(163): think\\view\\driver\\Think->fetch(\'/var/www/html/b...\', Array, Array)\n#5 /var/www/html/base/application/admin/controller/Weresponse.php(74): think\\View->fetch()\n#6 [internal function]: app\\admin\\controller\\WeResponse->add()\n#7 /var/www/html/base/thinkphp/library/think/App.php(343): ReflectionMethod->invokeArgs(Object(app\\admin\\controller\\WeResponse), Array)\n#8 /var/www/html/base/thinkphp/library/think/App.php(611): think\\App::invokeMethod(Array, Array)\n#9 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, true)\n#10 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#11 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#12 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#13 {main}'),
(55, 55, '#0 /var/www/html/base/runtime/temp/f11276d9e22219470792bb4643dd3aaa.php(93): think\\Error::appError(8, \'Undefined varia...\', \'/var/www/html/b...\', 93, Array)\n#1 /var/www/html/base/thinkphp/library/think/template/driver/File.php(53): include(\'/var/www/html/b...\')\n#2 /var/www/html/base/thinkphp/library/think/Template.php(188): think\\template\\driver\\File->read(\'/var/www/html/b...\', Array)\n#3 /var/www/html/base/thinkphp/library/think/view/driver/Think.php(86): think\\Template->fetch(\'/var/www/html/b...\', Array, Array)\n#4 /var/www/html/base/thinkphp/library/think/View.php(163): think\\view\\driver\\Think->fetch(\'/var/www/html/b...\', Array, Array)\n#5 /var/www/html/base/application/admin/controller/Weresponse.php(74): think\\View->fetch()\n#6 [internal function]: app\\admin\\controller\\WeResponse->add()\n#7 /var/www/html/base/thinkphp/library/think/App.php(343): ReflectionMethod->invokeArgs(Object(app\\admin\\controller\\WeResponse), Array)\n#8 /var/www/html/base/thinkphp/library/think/App.php(611): think\\App::invokeMethod(Array, Array)\n#9 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, true)\n#10 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#11 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#12 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#13 {main}'),
(56, 56, '#0 /var/www/html/base/runtime/temp/f11276d9e22219470792bb4643dd3aaa.php(99): think\\Error::appError(8, \'Undefined varia...\', \'/var/www/html/b...\', 99, Array)\n#1 /var/www/html/base/thinkphp/library/think/template/driver/File.php(53): include(\'/var/www/html/b...\')\n#2 /var/www/html/base/thinkphp/library/think/Template.php(188): think\\template\\driver\\File->read(\'/var/www/html/b...\', Array)\n#3 /var/www/html/base/thinkphp/library/think/view/driver/Think.php(86): think\\Template->fetch(\'/var/www/html/b...\', Array, Array)\n#4 /var/www/html/base/thinkphp/library/think/View.php(163): think\\view\\driver\\Think->fetch(\'/var/www/html/b...\', Array, Array)\n#5 /var/www/html/base/application/admin/controller/Weresponse.php(75): think\\View->fetch()\n#6 [internal function]: app\\admin\\controller\\WeResponse->add()\n#7 /var/www/html/base/thinkphp/library/think/App.php(343): ReflectionMethod->invokeArgs(Object(app\\admin\\controller\\WeResponse), Array)\n#8 /var/www/html/base/thinkphp/library/think/App.php(611): think\\App::invokeMethod(Array, Array)\n#9 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, true)\n#10 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#11 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#12 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#13 {main}'),
(57, 57, '#0 /var/www/html/base/runtime/temp/f11276d9e22219470792bb4643dd3aaa.php(105): think\\Error::appError(8, \'Undefined varia...\', \'/var/www/html/b...\', 105, Array)\n#1 /var/www/html/base/thinkphp/library/think/template/driver/File.php(53): include(\'/var/www/html/b...\')\n#2 /var/www/html/base/thinkphp/library/think/Template.php(188): think\\template\\driver\\File->read(\'/var/www/html/b...\', Array)\n#3 /var/www/html/base/thinkphp/library/think/view/driver/Think.php(86): think\\Template->fetch(\'/var/www/html/b...\', Array, Array)\n#4 /var/www/html/base/thinkphp/library/think/View.php(163): think\\view\\driver\\Think->fetch(\'/var/www/html/b...\', Array, Array)\n#5 /var/www/html/base/application/admin/controller/Weresponse.php(76): think\\View->fetch()\n#6 [internal function]: app\\admin\\controller\\WeResponse->add()\n#7 /var/www/html/base/thinkphp/library/think/App.php(343): ReflectionMethod->invokeArgs(Object(app\\admin\\controller\\WeResponse), Array)\n#8 /var/www/html/base/thinkphp/library/think/App.php(611): think\\App::invokeMethod(Array, Array)\n#9 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, true)\n#10 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#11 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#12 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#13 {main}'),
(58, 58, '#0 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, NULL)\n#1 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#2 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#3 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#4 {main}'),
(59, 59, '#0 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, NULL)\n#1 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#2 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#3 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#4 {main}'),
(60, 60, '#0 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, NULL)\n#1 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#2 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#3 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#4 {main}'),
(61, 61, '#0 /var/www/html/base/thinkphp/library/think/App.php(456): think\\App::module(Array, Array, NULL)\n#1 /var/www/html/base/thinkphp/library/think/App.php(139): think\\App::exec(Array, Array)\n#2 /var/www/html/base/thinkphp/start.php(19): think\\App::run()\n#3 /var/www/html/base/public/index.php(17): require(\'/var/www/html/b...\')\n#4 {main}');

-- --------------------------------------------------------

--
-- 表的结构 `y_users`
--

CREATE TABLE `y_users` (
  `id` int(11) UNSIGNED NOT NULL,
  `level_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '用户等级id',
  `name` varchar(50) NOT NULL COMMENT '用户账号',
  `password` char(32) NOT NULL COMMENT '密码',
  `nickname` varchar(50) NOT NULL COMMENT '昵称',
  `headimg` varchar(255) NOT NULL COMMENT '头像',
  `mobile` char(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `email` varchar(255) NOT NULL COMMENT '邮箱',
  `money` decimal(11,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '余额',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '状态，1启用，2禁用',
  `reg_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `delete_time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='前台用户表';

--
-- 转存表中的数据 `y_users`
--

INSERT INTO `y_users` (`id`, `level_id`, `name`, `password`, `nickname`, `headimg`, `mobile`, `email`, `money`, `status`, `reg_time`, `last_login_time`, `create_time`, `update_time`, `delete_time`) VALUES
(1, 1, 'test001', '14e1b600b1fd579f47433b88e8d85291', 'test001', '/uploads/attachment/20180808/dd9be964dc8cec705ef2626be6a94648.png', '13000000001', '', '0.00', 1, 0, 0, 1533695403, 1533695403, NULL),
(2, 2, 'test002', '14e1b600b1fd579f47433b88e8d85291', 'test002', '/uploads/attachment/20180808/7e2a8ed1e5e301608e8851e8df8d0bbe.png', '13000000002', '', '0.00', 1, 0, 0, 1533695438, 1533695438, NULL),
(3, 3, 'test003', '14e1b600b1fd579f47433b88e8d85291', 'test003', '/uploads/attachment/20180808/1c6bcdb692cc11df6b393e90d30af5e2.png', '13000000003', '', '0.00', 1, 0, 0, 1533695461, 1533695461, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `y_user_levels`
--

CREATE TABLE `y_user_levels` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '等级名称',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `delete_time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='前台用户等级表';

--
-- 转存表中的数据 `y_user_levels`
--

INSERT INTO `y_user_levels` (`id`, `name`, `create_time`, `update_time`, `delete_time`) VALUES
(1, '普通会员', 1533695231, 1533695231, NULL),
(2, '中级会员', 1533695240, 1533695240, NULL),
(3, '高级会员', 1533695246, 1533695246, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `y_wechat_autoreply`
--

CREATE TABLE `y_wechat_autoreply` (
  `id` int(10) NOT NULL,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `text` varchar(100) NOT NULL DEFAULT '' COMMENT '触发文本',
  `eventkey` varchar(50) NOT NULL DEFAULT '' COMMENT '响应事件',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '添加时间',
  `updatetime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信自动回复表' ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `y_wechat_autoreply`
--

INSERT INTO `y_wechat_autoreply` (`id`, `title`, `text`, `eventkey`, `remark`, `createtime`, `updatetime`, `status`) VALUES
(1, '输入hello', 'hello', '58c7d908c4570', '123', 1493366855, 1493366855, 'normal'),
(2, '输入你好', '你好', '58fdfaa9e1965', 'sad', 1493704976, 1493704976, 'normal');

-- --------------------------------------------------------

--
-- 表的结构 `y_wechat_config`
--

CREATE TABLE `y_wechat_config` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '配置名称',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置标题',
  `value` text NOT NULL COMMENT '配置值',
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信配置表' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `y_wechat_config`
--

INSERT INTO `y_wechat_config` (`id`, `name`, `title`, `value`, `createtime`, `updatetime`) VALUES
(1, 'menu', '微信菜单', '[{\"name\":\"FastAdmin\",\"sub_button\":[{\"name\":\"官网\",\"type\":\"view\",\"url\":\"http:\\/\\/www.fastadmin.net\"},{\"name\":\"在线演示\",\"type\":\"click\",\"key\":\"\"},{\"name\":\"文档\",\"type\":\"view\",\"url\":\"http:\\/\\/doc.fastadmin.net\"}]},{\"name\":\"在线客服\",\"type\":\"click\",\"key\":\"58cb852984970\"},{\"name\":\"关于我们\",\"type\":\"click\",\"key\":\"58bf944aa0777\"}]', 1497398820, 1500538185),
(2, 'service', '客服配置', '{\"onlinetime\":\"09:00-18:00\",\"offlinemsg\":\"请在工作时间联系客服！\",\"nosessionmsg\":\"当前没有客服在线！请稍后重试！\",\"waitformsg\":\"请问有什么可以帮到您？\"}', 1497429674, 1497429674),
(3, 'signin', '连续登录配置', '{\"s1\":\"100\",\"s2\":\"200\",\"s3\":\"300\",\"sn\":\"500\"}', 1497429711, 1497429711);

-- --------------------------------------------------------

--
-- 表的结构 `y_wechat_context`
--

CREATE TABLE `y_wechat_context` (
  `id` int(10) NOT NULL,
  `openid` varchar(64) NOT NULL DEFAULT '',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '类型',
  `eventkey` varchar(64) NOT NULL DEFAULT '',
  `command` varchar(64) NOT NULL DEFAULT '',
  `message` varchar(255) NOT NULL DEFAULT '' COMMENT '内容',
  `refreshtime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '最后刷新时间',
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信上下文表' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `y_wechat_response`
--

CREATE TABLE `y_wechat_response` (
  `id` int(10) NOT NULL,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '资源名',
  `eventkey` varchar(128) NOT NULL DEFAULT '' COMMENT '事件',
  `type` enum('text','image','news','voice','video','music','link','app') NOT NULL DEFAULT 'text' COMMENT '类型',
  `content` text NOT NULL COMMENT '内容',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信资源表' ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `y_wechat_response`
--

INSERT INTO `y_wechat_response` (`id`, `title`, `eventkey`, `type`, `content`, `remark`, `createtime`, `updatetime`, `status`) VALUES
(1, '签到送积分', '58adaf7876aab', 'app', '{\"app\":\"signin\"}', '', 1487777656, 1487777656, 'normal'),
(2, '关于我们', '58bf944aa0777', 'app', '{\"app\":\"page\",\"id\":\"1\"}', '', 1488950346, 1488950346, 'normal'),
(3, '自动回复1', '58c7d908c4570', 'text', '{\"content\":\"world\"}', '', 1489492232, 1489492232, 'normal'),
(4, '联系客服', '58cb852984970', 'app', '{\"app\":\"service\"}', '', 1489732905, 1489732905, 'normal'),
(5, '自动回复2', '58fdfaa9e1965', 'text', '{\"content\":\"我是FastAdmin!\"}', '', 1493039785, 1493039785, 'normal');

--
-- 转储表的索引
--

--
-- 表的索引 `y_admin_groups`
--
ALTER TABLE `y_admin_groups`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `y_admin_group_access`
--
ALTER TABLE `y_admin_group_access`
  ADD UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `group_id` (`group_id`);

--
-- 表的索引 `y_admin_logs`
--
ALTER TABLE `y_admin_logs`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `y_admin_log_datas`
--
ALTER TABLE `y_admin_log_datas`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `y_admin_menus`
--
ALTER TABLE `y_admin_menus`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `y_admin_users`
--
ALTER TABLE `y_admin_users`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `y_attachments`
--
ALTER TABLE `y_attachments`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `y_crontab`
--
ALTER TABLE `y_crontab`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `y_crontab_log`
--
ALTER TABLE `y_crontab_log`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `y_excel_examples`
--
ALTER TABLE `y_excel_examples`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `y_sysconfigs`
--
ALTER TABLE `y_sysconfigs`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `y_syslogs`
--
ALTER TABLE `y_syslogs`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `y_syslog_trace`
--
ALTER TABLE `y_syslog_trace`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `y_users`
--
ALTER TABLE `y_users`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `y_user_levels`
--
ALTER TABLE `y_user_levels`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `y_wechat_autoreply`
--
ALTER TABLE `y_wechat_autoreply`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `y_wechat_config`
--
ALTER TABLE `y_wechat_config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`) USING BTREE;

--
-- 表的索引 `y_wechat_context`
--
ALTER TABLE `y_wechat_context`
  ADD PRIMARY KEY (`id`),
  ADD KEY `openid` (`openid`) USING BTREE;

--
-- 表的索引 `y_wechat_response`
--
ALTER TABLE `y_wechat_response`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `event` (`eventkey`) USING BTREE;

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `y_admin_groups`
--
ALTER TABLE `y_admin_groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `y_admin_logs`
--
ALTER TABLE `y_admin_logs`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- 使用表AUTO_INCREMENT `y_admin_log_datas`
--
ALTER TABLE `y_admin_log_datas`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- 使用表AUTO_INCREMENT `y_admin_menus`
--
ALTER TABLE `y_admin_menus`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '菜单id', AUTO_INCREMENT=64;

--
-- 使用表AUTO_INCREMENT `y_admin_users`
--
ALTER TABLE `y_admin_users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户id', AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `y_attachments`
--
ALTER TABLE `y_attachments`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `y_crontab`
--
ALTER TABLE `y_crontab`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `y_crontab_log`
--
ALTER TABLE `y_crontab_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `y_excel_examples`
--
ALTER TABLE `y_excel_examples`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `y_sysconfigs`
--
ALTER TABLE `y_sysconfigs`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `y_syslogs`
--
ALTER TABLE `y_syslogs`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- 使用表AUTO_INCREMENT `y_syslog_trace`
--
ALTER TABLE `y_syslog_trace`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- 使用表AUTO_INCREMENT `y_users`
--
ALTER TABLE `y_users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `y_user_levels`
--
ALTER TABLE `y_user_levels`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `y_wechat_autoreply`
--
ALTER TABLE `y_wechat_autoreply`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `y_wechat_config`
--
ALTER TABLE `y_wechat_config`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `y_wechat_context`
--
ALTER TABLE `y_wechat_context`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `y_wechat_response`
--
ALTER TABLE `y_wechat_response`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
