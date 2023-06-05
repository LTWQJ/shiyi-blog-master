/*
 Navicat Premium Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 50736
 Source Host           : 42.192.150.44:3306
 Source Schema         : shiyi-blog

 Target Server Type    : MySQL
 Target Server Version : 50736
 File Encoding         : 65001

 Date: 15/04/2022 08:34:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for b_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `b_admin_log`;
CREATE TABLE `b_admin_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作用户',
  `request_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求接口',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求方式',
  `operation_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作名称',
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ip',
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ip来源',
  `spend_time` bigint(20) NULL DEFAULT NULL COMMENT '请求接口耗时',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `params_json` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '请求参数',
  `class_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类地址',
  `method_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '方法名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1019 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_article
-- ----------------------------
DROP TABLE IF EXISTS `b_article`;
CREATE TABLE `b_article`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `category_id` bigint(20) NULL DEFAULT NULL COMMENT '分类id',
  `title` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文章标题',
  `avatar` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章封面地址',
  `summary` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文章简介',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '文章内容 （最多两百字）',
  `content_md` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '文章内容md版',
  `is_secret` int(2) NULL DEFAULT 0 COMMENT '是否是私密文章 0 否 1是',
  `is_stick` int(2) NULL DEFAULT 0 COMMENT '是否置顶 0否 1是',
  `is_publish` int(10) NULL DEFAULT 0 COMMENT '是否发布 0：下架 1：发布',
  `is_original` int(10) NULL DEFAULT NULL COMMENT '是否原创  0：转载 1:原创',
  `original_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '转载地址',
  `quantity` bigint(6) NULL DEFAULT 0 COMMENT '文章阅读量',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '说明',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'seo关键词',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 113 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '博客文章表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of b_article
-- ----------------------------
INSERT INTO `b_article` VALUES (14, 7, 12, '关于博客', '\r\nhttp://img.shiyit.com/1642655697136.jpg', '关于博客的一些介绍。', '<blockquote>\n<p>本文主要介绍博客用到的技术和一些功能详情</p>\n</blockquote>\n<h4><a id=\"1_1\"></a>1、博客使用到的技术</h4>\n<ol>\n<li>后端：springboot，mysql，es搜索引擎，以及redis</li>\n<li>前端：vue</li>\n</ol>\n<h4><a id=\"2_5\"></a>2、首页登录</h4>\n<p>本博客支持<a href=\"https://connect.qq.com/index.html\" target=\"_blank\">QQ</a>、<a href=\"https://gitee.com/api/v5/oauth_doc#/\" target=\"_blank\">gitee</a>、<a href=\"https://open.weibo.com/?bottomnav=1&amp;wvr=6\" target=\"_blank\">微博</a>、邮箱登录</p>\n<h4><a id=\"3_7\"></a>3、图片的存储</h4>\n<p>项目中图片存储采用的是<a href=\"https://www.qiniu.com/products/kodo\" target=\"_blank\">七牛云</a>平台的对象存储，因为只有七牛云每个月会有免费的一个额度，其他的都是需要收费的。</p>\n<h4><a id=\"4_9\"></a>4、首页的搜索</h4>\n<p>首页的搜索采用的是es的搜索，eslinux启动的话会占用比较高的一个内存，所以博主介意如需要使用es搜索的购买服务器时资金允许的情况下尽可能购买内存比较多的服务器。然后项目搜索的话主要是围绕文章的标题和内容进行的分词搜索。</p>\n<blockquote>\n<p>上面的话都是一些首页的介绍，原作者只是提供了一个模板，并没有提供后台管理的一个功能，所以我就自己写了一个后台管理，主要借用的是比较火的一个<a href=\"https://gitee.com/panjiachen/vue-admin-template\" target=\"_blank\">vue-admin-template</a>项目模板来进行的二次开发，由于时间有限，所以后台管理开发的功能并不是很多，但是也能进行一个简单的博客管理了。</p>\n</blockquote>\n<h3><a id=\"_14\"></a>后台管理</h3>\n<blockquote>\n<p><a href=\"http://www.shiyit.com/admin\" target=\"_blank\">后台地址</a><br />\n演示账号：test,密码：test</p>\n</blockquote>\n<h4><a id=\"1_17\"></a>1、登录界面</h4>\n<p><img src=\"http://img.shiyit.com/1639989154384.jpg\" alt=\"login.jpg\" /></p>\n<h4><a id=\"2_19\"></a>2、后台首页</h4>\n<p><img src=\"http://img.shiyit.com/1639989162006.png\" alt=\"adminhome1.png\" /><br />\n<img src=\"http://img.shiyit.com/1639989170907.png\" alt=\"adminhome2.png\" /></p>\n<h4><a id=\"3_22\"></a>3、文章管理</h4>\n<ol>\n<li>列表页<br />\n<img src=\"http://img.shiyit.com/1639989186471.png\" alt=\"文章列表.png\" /></li>\n<li>文章添加<br />\n<img src=\"http://img.shiyit.com/1639989202706.png\" alt=\"文章添加.png\" /><br />\n编辑器使用的是mavon-editor编辑器，如不会使用的可以点击下面的链接查看<br />\n<a href=\"https://blog.csdn.net/qq_43681948/article/details/101531303\" target=\"_blank\">Vue markdown编辑器</a></li>\n</ol>\n<h4><a id=\"4_29\"></a>4、标签管理</h4>\n<p><img src=\"http://img.shiyit.com/1639989247680.png\" alt=\"标签列表.png\" /></p>\n<h4><a id=\"5_31\"></a>5、日志管理</h4>\n<ol>\n<li>针对用户访问以及管理员操作和异常信息都做了一个日志的记录</li>\n</ol>\n<p><img src=\"http://img.shiyit.com/1639989291127.png\" alt=\"日志管理.png\" /></p>\n<h4><a id=\"6_35\"></a>6、系统管理</h4>\n<p><img src=\"http://img.shiyit.com/1639989383160.png\" alt=\"系统配置.png\" /></p>\n<h4><a id=\"7_37\"></a>7、监控中心</h4>\n<ol>\n<li>监控中心主要有服务器的监控和定时任务，定时任务支持自动添加修改删除功能，改了时间无需修改代码<br />\n<img src=\"http://img.shiyit.com/1639989456867.png\" alt=\"定时任务.png\" /></li>\n</ol>\n<h4><a id=\"_40\"></a>结尾</h4>\n<p>上述只是项目的一些基础的功能图片，小伙伴们可以自行登录去查看，后台管理所看到的菜单功能都已实现，还在着手后续的一些功能开发。后台管理全由我自己根据模板改造而来，毕竟我只会业余的前端技术，所以有所缺陷也属正常。如有比较有意思的功能欢迎各位小伙伴给我留言，作者觉得有意思的话就会着手开发。如本项目小伙伴觉得可以，希望能够码云star一下，万分感谢！！</p>\n<blockquote>\n<p>码云地址：<a href=\"https://gitee.com/quequnlong/vue-admin-blog\" target=\"_blank\">点我进入</a></p>\n</blockquote>\n<h1><a id=\"bye_43\"></a>bye</h1>\n', '> 本文主要介绍博客用到的技术和一些功能详情\n#### 1、博客使用到的技术\n1. 后端：springboot，mysql，es搜索引擎，以及redis\n2. 前端：vue\n\n#### 2、首页登录\n本博客支持[QQ](https://connect.qq.com/index.html)、[gitee](https://gitee.com/api/v5/oauth_doc#/)、[微博](https://open.weibo.com/?bottomnav=1&wvr=6)、邮箱登录\n#### 3、图片的存储\n项目中图片存储采用的是[七牛云](https://www.qiniu.com/products/kodo)平台的对象存储，因为只有七牛云每个月会有免费的一个额度，其他的都是需要收费的。\n#### 4、首页的搜索\n首页的搜索采用的是es的搜索，eslinux启动的话会占用比较高的一个内存，所以博主介意如需要使用es搜索的购买服务器时资金允许的情况下尽可能购买内存比较多的服务器。然后项目搜索的话主要是围绕文章的标题和内容进行的分词搜索。\n\n> 上面的话都是一些首页的介绍，原作者只是提供了一个模板，并没有提供后台管理的一个功能，所以我就自己写了一个后台管理，主要借用的是比较火的一个[vue-admin-template](https://gitee.com/panjiachen/vue-admin-template)项目模板来进行的二次开发，由于时间有限，所以后台管理开发的功能并不是很多，但是也能进行一个简单的博客管理了。\n\n###  后台管理\n> [后台地址](http://www.shiyit.com/admin)\n演示账号：test,密码：test\n#### 1、登录界面\n![login.jpg](http://img.shiyit.com/1639989154384.jpg)\n#### 2、后台首页\n![adminhome1.png](http://img.shiyit.com/1639989162006.png)\n![adminhome2.png](http://img.shiyit.com/1639989170907.png)\n#### 3、文章管理\n1. 列表页\n![文章列表.png](http://img.shiyit.com/1639989186471.png)\n2. 文章添加\n![文章添加.png](http://img.shiyit.com/1639989202706.png)\n编辑器使用的是mavon-editor编辑器，如不会使用的可以点击下面的链接查看\n[Vue markdown编辑器](https://blog.csdn.net/qq_43681948/article/details/101531303)\n#### 4、标签管理\n![标签列表.png](http://img.shiyit.com/1639989247680.png)\n#### 5、日志管理\n1. 针对用户访问以及管理员操作和异常信息都做了一个日志的记录\n\n![日志管理.png](http://img.shiyit.com/1639989291127.png)\n#### 6、系统管理\n![系统配置.png](http://img.shiyit.com/1639989383160.png)\n#### 7、监控中心\n1. 监控中心主要有服务器的监控和定时任务，定时任务支持自动添加修改删除功能，改了时间无需修改代码\n![定时任务.png](http://img.shiyit.com/1639989456867.png)\n#### 结尾\n上述只是项目的一些基础的功能图片，小伙伴们可以自行登录去查看，后台管理所看到的菜单功能都已实现，还在着手后续的一些功能开发。后台管理全由我自己根据模板改造而来，毕竟我只会业余的前端技术，所以有所缺陷也属正常。如有比较有意思的功能欢迎各位小伙伴给我留言，作者觉得有意思的话就会着手开发。如本项目小伙伴觉得可以，希望能够码云star一下，万分感谢！！\n> 码云地址：[点我进入](https://gitee.com/quequnlong/vue-admin-blog)\n# bye\n\n', 0, 1, 1, 1, NULL, 18, '', '2021-10-15 09:57:22', 'blog,拾壹博客,博客', '2022-04-15 04:00:00');

-- ----------------------------
-- Table structure for b_article_tag
-- ----------------------------
DROP TABLE IF EXISTS `b_article_tag`;
CREATE TABLE `b_article_tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL COMMENT '文章id',
  `tag_id` int(11) NOT NULL COMMENT '标签id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `fk_article_tag_1`(`article_id`, `tag_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 661 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of b_article_tag
-- ----------------------------
INSERT INTO `b_article_tag` VALUES (1, 14, 1);
INSERT INTO `b_article_tag` VALUES (2, 14, 10);

-- ----------------------------
-- Table structure for b_category
-- ----------------------------
DROP TABLE IF EXISTS `b_category`;
CREATE TABLE `b_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `click_volume` int(10) NULL DEFAULT 0,
  `sort` int(11) NOT NULL COMMENT '排序',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `category_name`(`name`) USING BTREE COMMENT '博客分类名称'
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '博客分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of b_category
-- ----------------------------
INSERT INTO `b_category` VALUES (12, '项目介绍', 0, 8, '2021-12-29 10:21:40', '2022-01-20 17:50:32');
INSERT INTO `b_category` VALUES (13, '生活随笔', 0, 4, '2021-12-29 10:22:09', '2021-12-29 10:23:40');
INSERT INTO `b_category` VALUES (16, '转载', 0, 3, '2021-12-29 10:41:45', NULL);
INSERT INTO `b_category` VALUES (17, '后端框架', 0, 9, '2021-12-29 14:00:49', '2022-01-21 10:23:18');
INSERT INTO `b_category` VALUES (18, '搜索框架', 0, 5, '2021-12-29 14:01:09', NULL);
INSERT INTO `b_category` VALUES (19, '爬虫', 0, 1, '2022-01-07 17:08:57', '2022-01-21 10:23:01');
INSERT INTO `b_category` VALUES (20, '小工具', 0, 7, '2022-01-14 15:05:58', '2022-01-20 17:46:18');
INSERT INTO `b_category` VALUES (28, '数据库', 0, 0, '2022-02-18 16:01:07', '2022-02-18 08:01:06');

-- ----------------------------
-- Table structure for b_comment
-- ----------------------------
DROP TABLE IF EXISTS `b_comment`;
CREATE TABLE `b_comment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` bigint(20) NOT NULL COMMENT '评论人ID',
  `article_id` bigint(20) NOT NULL COMMENT '文章id',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '内容',
  `reply_user_id` bigint(20) NULL DEFAULT NULL COMMENT '回复人id',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '父id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '评论时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_dict
-- ----------------------------
DROP TABLE IF EXISTS `b_dict`;
CREATE TABLE `b_dict`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典名称',
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典类型',
  `is_publish` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '是否发布(1:是，0:否)',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `sort` int(11) NULL DEFAULT 0 COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of b_dict
-- ----------------------------
INSERT INTO `b_dict` VALUES (1, '用户性别', 'sys_user_sex', '1', '用户性别', '2021-11-19 09:24:23', '2021-11-27 22:03:54', 0);
INSERT INTO `b_dict` VALUES (2, '发布状态', 'sys_publish_status', '1', '发布状态列表', '2021-11-19 17:12:51', '2021-11-19 17:12:51', 0);
INSERT INTO `b_dict` VALUES (3, '搜索模式', 'sys_search_model', '1', '搜索模式：SQL搜索、全文检索', '2021-11-26 08:57:47', '2021-11-26 08:57:47', 2);
INSERT INTO `b_dict` VALUES (4, '系统是否', 'sys_yes_no', '1', '系统是否列表', '2021-11-26 14:03:12', '2021-11-26 14:03:12', 2);
INSERT INTO `b_dict` VALUES (5, '系统开关', 'sys_normal_disable', '1', '系统开关列表', '2021-11-26 15:16:43', '2021-11-26 15:16:43', 3);
INSERT INTO `b_dict` VALUES (6, '博客登录方式', 'sys_login_method', '1', '博客登录方式 账号密码、QQ、微博', '2021-11-27 13:52:38', '2021-11-27 13:52:38', 0);
INSERT INTO `b_dict` VALUES (7, '定时任务分组', 'sys_job_group', '1', '定时任务分组列表', '2021-12-10 08:53:30', '2021-12-10 08:53:30', 2);
INSERT INTO `b_dict` VALUES (8, '任务状态', 'sys_job_status', '1', '任务状态列表', '2021-12-10 09:01:10', '2021-12-10 09:01:10', 2);
INSERT INTO `b_dict` VALUES (9, '任务执行策略', 'sys_job_misfire', '1', '任务执行策略列表', '2021-12-10 11:11:48', '2021-12-10 11:12:04', 2);

-- ----------------------------
-- Table structure for b_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `b_dict_data`;
CREATE TABLE `b_dict_data`  (
  `id` bigint(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dict_id` bigint(10) NOT NULL COMMENT '字典类型id',
  `label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典标签',
  `value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典键值',
  `style` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '回显样式',
  `is_default` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否默认（1是 0否）',
  `sort` int(10) NULL DEFAULT NULL COMMENT '排序',
  `is_publish` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否发布(1:是，0:否)',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of b_dict_data
-- ----------------------------
INSERT INTO `b_dict_data` VALUES (1, 2, '发布', '1', 'success', '1', 1, '1', NULL);
INSERT INTO `b_dict_data` VALUES (2, 2, '下架', '0', 'danger', '0', 0, '1', NULL);
INSERT INTO `b_dict_data` VALUES (3, 4, '是', '1', 'success', '1', 1, '1', '系统是否 是');
INSERT INTO `b_dict_data` VALUES (4, 4, '否', '0', 'warning', '0', 0, '1', '系统是否 否');
INSERT INTO `b_dict_data` VALUES (5, 5, '开启', '1', 'success', '1', 1, '1', '系统开关 开启');
INSERT INTO `b_dict_data` VALUES (6, 5, '关闭', '0', 'warning', '0', 2, '1', '系统开关 关闭');
INSERT INTO `b_dict_data` VALUES (7, 3, 'ES搜素', '1', 'success', '0', 1, '1', '搜索模式：开启ElasticSearch全文检索');
INSERT INTO `b_dict_data` VALUES (8, 3, 'SQL搜索', '0', 'warning', '1', 2, '1', '搜索模式：SQL搜索');
INSERT INTO `b_dict_data` VALUES (9, 6, '邮箱', '1', 'primary', '0', 1, '1', '邮箱账号密码登录');
INSERT INTO `b_dict_data` VALUES (10, 6, 'QQ', '2', 'success', '1', 2, '1', 'QQ登录');
INSERT INTO `b_dict_data` VALUES (11, 6, '微博', '3', 'danger', '0', 3, '1', '微博登录');
INSERT INTO `b_dict_data` VALUES (12, 1, '男', '1', '', '1', 1, '1', '性别 男');
INSERT INTO `b_dict_data` VALUES (13, 1, '女', '0', '', '1', 0, '1', '性别 女');
INSERT INTO `b_dict_data` VALUES (14, 7, '默认', 'DEFAULT', 'primary', '1', 1, '1', '默认分组');
INSERT INTO `b_dict_data` VALUES (15, 7, '系统', 'SYSTEM', 'warning', '0', 2, '1', '系统分组');
INSERT INTO `b_dict_data` VALUES (16, 8, '正常', '0', 'primary', '0', 1, '1', '正常状态');
INSERT INTO `b_dict_data` VALUES (17, 8, '暂停', '1', 'danger', '1', 2, '1', '暂停状态');
INSERT INTO `b_dict_data` VALUES (18, 9, '默认策略', '0', '', '1', 1, '1', '默认策略');
INSERT INTO `b_dict_data` VALUES (19, 9, '立即执行', '1', '', '0', 2, '1', '立即执行');
INSERT INTO `b_dict_data` VALUES (20, 9, '执行一次', '2', '', '0', 3, '1', '执行一次');
INSERT INTO `b_dict_data` VALUES (21, 9, '放弃执行', '3', '', '0', 4, '1', '放弃执行');
INSERT INTO `b_dict_data` VALUES (22, 6, '码云', '4', 'danger', '0', 4, '1', 'gitee登录');

-- ----------------------------
-- Table structure for b_exception_log
-- ----------------------------
DROP TABLE IF EXISTS `b_exception_log`;
CREATE TABLE `b_exception_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'IP',
  `ip_source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ip来源',
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求方法',
  `operation` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '描述',
  `params` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '参数',
  `exception_json` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '异常对象json格式',
  `exception_message` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '异常简单信息,等同于e.getMessage',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发生时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 70 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_feed_back
-- ----------------------------
DROP TABLE IF EXISTS `b_feed_back`;
CREATE TABLE `b_feed_back`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '邮箱',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细内容',
  `img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片地址',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '添加时间',
  `type` int(1) NOT NULL COMMENT '反馈类型 1:需求 2：缺陷',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_friend_link
-- ----------------------------
DROP TABLE IF EXISTS `b_friend_link`;
CREATE TABLE `b_friend_link`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '网站名称',
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '网站地址',
  `avatar` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '网站头像地址',
  `info` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '网站描述',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '邮箱',
  `reason` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL COMMENT '下架原因',
  `sort` int(11) NULL DEFAULT 0 COMMENT '排序',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT 'ENUM-状态:\"0-待审核\",\"1-通过\"',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '友情链接表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of b_friend_link
-- ----------------------------
INSERT INTO `b_friend_link` VALUES (1, '拾壹博客', 'https://www.shiyit.com', 'http://img.shiyit.com/FjzfvfWYZVED7eXMS4EL8KNR949K', '机会向来都是自己争取的。','', '', 6, 2, '2021-08-27 11:53:31', '2021-12-20 17:28:16');

-- ----------------------------
-- Table structure for b_job
-- ----------------------------
DROP TABLE IF EXISTS `b_job`;
CREATE TABLE `b_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of b_job
-- ----------------------------
INSERT INTO `b_job` VALUES (1, '自动更新文章阅读数', 'DEFAULT', 'blogQuartz.updateReadQuantity', '0 0 4 * * ?', '3', '1', '0', '拾壹', '2021-12-08 17:16:40', '', NULL, '');
INSERT INTO `b_job` VALUES (2, '系统默认（无参）', 'DEFAULT', 'blogQuartz.ryNoParams', '0/10 * * * * ?', '3', '1', '1', '拾壹', '2021-12-09 09:09:21', '', NULL, '');
INSERT INTO `b_job` VALUES (3, '系统默认（有参）', 'DEFAULT', 'blogQuartz.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', '拾壹', '2021-12-09 09:09:21', '', NULL, '');
INSERT INTO `b_job` VALUES (6, '定时修改标签的点击量', 'DEFAULT', 'blogQuartz.autoTagsClickVolume', '0 0 3 * * ?', '0', '1', '0', '拾壹', '2021-12-17 15:37:20', '', NULL, '1');
INSERT INTO `b_job` VALUES (7, '定时删除当天验证通过的ip', 'DEFAULT', 'blogQuartz.removeCode', '0 30 23 * * ?', '0', '1', '0', '拾壹', '2022-01-11 16:39:42', '', NULL, '1');

-- ----------------------------
-- Table structure for b_job_log
-- ----------------------------
DROP TABLE IF EXISTS `b_job_log`;
CREATE TABLE `b_job_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_id` bigint(20) NOT NULL COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
  `stop_time` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 514 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_menu
-- ----------------------------
DROP TABLE IF EXISTS `b_menu`;
CREATE TABLE `b_menu`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `parent_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上级资源ID',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'url',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源编码',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源名称',
  `level` int(11) NULL DEFAULT NULL COMMENT '资源级别',
  `sort_no` int(11) NULL DEFAULT NULL COMMENT '排序',
  `icon` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源图标',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型 menu、button',
  `remarks` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `redirect` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '重定向地址',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '跳转地址',
  `hidden` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否隐藏',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 271 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统管理-权限资源表 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of b_menu
-- ----------------------------
INSERT INTO `b_menu` VALUES (1, '0', '/system', 'Layout', '系统管理', 0, 5, 'el-icon-setting', 'menu', '', '2019-03-28 18:51:08', '2021-12-17 15:26:06', '/system/menu', 'system', '1');
INSERT INTO `b_menu` VALUES (2, '1', '/role', '/system/role', '角色管理', 1, 2, 'el-icon-user-solid', 'menu', '', '2019-03-30 14:00:03', '2021-11-16 15:40:42', '', 'role', '1');
INSERT INTO `b_menu` VALUES (3, '2', '/system/role/list', NULL, '列表', 2, NULL, NULL, 'btn', NULL, NULL, NULL, '', NULL, '0');
INSERT INTO `b_menu` VALUES (4, '2', '/system/role/queryUserRole', NULL, '获取当前登录用户所拥有的权限', 2, NULL, NULL, 'btn', NULL, NULL, '2021-11-27 12:46:57', '', NULL, '0');
INSERT INTO `b_menu` VALUES (5, '2', '/system/role/update', '/system/role/update', '修改', 2, NULL, NULL, 'btn', '', '2021-09-24 15:57:33', '2021-11-11 18:09:44', '', NULL, '0');
INSERT INTO `b_menu` VALUES (6, '2', '/system/role/remove', '/system/role/update', '删除', 2, NULL, NULL, 'btn', '', '2021-09-27 11:33:32', '2021-11-11 18:09:36', '', NULL, '0');
INSERT INTO `b_menu` VALUES (7, '2', '/system/role/create', NULL, '添加', 2, 1, NULL, 'btn', NULL, '2021-11-13 21:14:07', NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (8, '1', '/menu', '/system/menu', '菜单管理', 1, 5, 'el-icon-menu', 'menu', NULL, NULL, '2021-11-18 11:26:00', '', 'menu', '1');
INSERT INTO `b_menu` VALUES (9, '8', '/system/menu/getMenuTree', NULL, '列表', 2, NULL, NULL, 'btn', NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (10, '8', '/system/menu/create', NULL, '添加', 2, NULL, NULL, 'btn', NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (11, '8', '/system/menu/update', '/system/menu/update', '修改', 2, 2, NULL, 'btn', NULL, '2021-11-11 16:56:34', '2021-11-11 18:10:09', NULL, '/system/menu/update', '0');
INSERT INTO `b_menu` VALUES (12, '8', '/system/menu/getMenuList', NULL, '获取所有的url', 2, 6, NULL, 'btn', NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (13, '8', '/system/menu/remove', '/system/menu/remove', '删除', 2, NULL, NULL, 'btn', '', '2021-09-27 11:45:33', '2021-11-11 18:10:03', NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (14, '1', '/user', '/system/user', '用户管理', 1, 1, 'el-icon-user', 'menu', NULL, NULL, '2021-11-16 12:01:51', NULL, 'user', '1');
INSERT INTO `b_menu` VALUES (15, '14', '/system/user/list', '', '列表', 2, NULL, NULL, 'btn', '', '2021-09-27 15:33:19', '2021-11-11 18:10:22', NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (16, '14', '/system/user/remove', '', '删除', 2, NULL, NULL, 'btn', '', '2021-09-27 16:36:42', '2021-11-11 18:10:27', NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (17, '14', '/system/user/create', '', '添加', 2, NULL, NULL, 'btn', NULL, '2021-09-27 16:36:54', '2021-11-11 18:10:30', NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (18, '14', '/system/user/update', '', '修改', 2, NULL, NULL, 'btn', '', '2021-09-27 16:59:38', '2021-11-11 18:10:34', NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (19, '14', '/system/user/info', '', '详情', 2, NULL, NULL, 'btn', NULL, '2021-09-27 16:59:50', '2021-11-11 18:10:37', NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (20, '14', '/system/user/getUserMenu', '', '获取用户权限', 2, NULL, NULL, 'btn', NULL, NULL, '2021-11-11 18:10:40', NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (21, '14', '/system/user/updatePassword', '', '修改密码', 2, NULL, NULL, 'btn', NULL, '2021-11-09 17:23:58', '2021-11-11 18:10:51', NULL, '/system/user/update_password', '0');
INSERT INTO `b_menu` VALUES (22, '14', '/generateCode', NULL, '生成用户邀请码', 2, 5, NULL, 'btn', NULL, '2021-08-13 09:20:25', NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (23, '14', '/system/user/logout', '', '退出登录', 2, NULL, NULL, 'btn', '', '2021-09-26 10:21:27', '2021-11-11 18:10:46', NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (24, '1', '/api', '/system/api', '接口管理', 1, 4, 'el-icon-edit', 'menu', NULL, '2021-11-12 09:26:01', '2021-11-20 13:58:15', NULL, 'api', '1');
INSERT INTO `b_menu` VALUES (25, '24', '/system/menu/getMenuApi', '', '列表', 2, 1, '1', 'btn', NULL, '2021-11-12 10:55:11', NULL, NULL, '', '0');
INSERT INTO `b_menu` VALUES (26, '0', '/articles', 'Layout', '文章管理', 0, 1, 'el-icon-document-copy', 'menu', NULL, NULL, '2021-11-16 15:45:14', '/articles/index', '', '1');
INSERT INTO `b_menu` VALUES (27, '26', 'index', '/articles/index', '文章管理', 1, 1, 'el-icon-notebook-2', 'menu', NULL, NULL, '2021-11-16 15:41:57', '/articles/index', 'Articles', '1');
INSERT INTO `b_menu` VALUES (28, '27', '/system/article/list', '', '列表', 2, NULL, NULL, 'btn', NULL, NULL, '2021-11-11 18:11:17', NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (29, '27', '/system/article/delete', '', '删除', 2, NULL, NULL, 'btn', NULL, NULL, '2021-11-11 18:11:21', NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (30, '27', '/system/article/update', '', '修改', 2, NULL, NULL, 'btn', NULL, NULL, '2021-11-11 18:11:25', NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (31, '27', '/system/article/add', '', '添加', 2, NULL, NULL, 'btn', NULL, NULL, '2021-11-11 18:11:32', NULL, '2', '0');
INSERT INTO `b_menu` VALUES (32, '27', '/system/article/info', '', '详情', 2, NULL, NULL, 'btn', NULL, NULL, '2021-11-11 18:11:35', NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (33, '27', '/system/article/baiduSeo', '', 'SEO', 2, NULL, NULL, 'btn', '', '2021-10-15 10:38:19', '2021-11-11 18:11:41', NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (35, '26', 'tags', '/articles/tags', '标签管理', 1, 2, 'el-icon-collection-tag', 'menu', NULL, NULL, '2021-11-18 11:25:18', NULL, 'Tags', '1');
INSERT INTO `b_menu` VALUES (36, '35', '/system/tags/list', NULL, '列表', 2, NULL, NULL, 'btn', NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (37, '35', '/system/tags/add', '', '新增', 2, NULL, NULL, 'btn', NULL, NULL, '2021-11-11 18:11:54', NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (38, '35', '/system/tags/info', '', '详情', 2, NULL, NULL, 'btn', NULL, NULL, '2021-11-11 18:11:58', NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (39, '35', '/system/tags/update', '', '修改', 2, NULL, NULL, 'btn', NULL, NULL, '2021-11-11 18:12:08', NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (40, '35', '/system/tags/remove', '/sys/tags/remove', '删除', 2, NULL, NULL, 'btn', NULL, '2021-11-10 17:34:38', '2021-11-11 18:12:01', NULL, '/sys/tags/remove', '0');
INSERT INTO `b_menu` VALUES (41, '0', '/site', 'Layout', '网站管理', 0, 2, 'el-icon-guide', 'menu', NULL, NULL, '2021-11-16 15:48:41', '/friendLink/index', '', '1');
INSERT INTO `b_menu` VALUES (47, '245', '/messages', '/news/message', '留言管理', 1, 2, 'el-icon-message', 'menu', NULL, NULL, '2021-11-16 15:43:46', '/message/index', '/message', '1');
INSERT INTO `b_menu` VALUES (48, '47', '/system/message/list', '', '列表', 2, NULL, NULL, 'btn', NULL, '2021-09-26 11:50:33', '2021-11-11 18:12:56', NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (49, '47', '/system/message/remove', NULL, '删除', 2, 1, NULL, NULL, NULL, NULL, '2021-11-15 15:36:28', NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (50, '47', 'test', NULL, '回复', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (51, '41', 'friendLink', '/site/friendLink/index', '友情链接', 1, 3, 'el-icon-link', 'menu', NULL, NULL, '2021-11-16 15:43:55', NULL, 'friendLink', '1');
INSERT INTO `b_menu` VALUES (52, '51', '/system/friend/list', NULL, '列表', 2, NULL, NULL, 'btn', NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (53, '51', '/system/friend/create', NULL, '添加', 2, 1, NULL, 'btn', NULL, '2021-11-12 16:52:26', NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (54, '51', '/system/friend/update', NULL, '修改', 2, 1, NULL, 'btn', NULL, '2021-11-12 16:52:08', NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (55, '51', '/system/friend/remove', NULL, '删除', 2, 1, NULL, 'btn', NULL, '2021-11-14 12:18:00', NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (56, '0', '/logs', 'Layout', '日志管理', 0, 4, 'el-icon-document', 'menu', NULL, NULL, '2021-12-31 14:46:11', NULL, NULL, '1');
INSERT INTO `b_menu` VALUES (57, '56', 'userLog', '/logs/userLog', '用户日志', 1, 1, 'el-icon-coordinate', 'menu', NULL, NULL, '2021-11-17 10:02:31', NULL, 'userLogs', '1');
INSERT INTO `b_menu` VALUES (58, '57', '/system/userLog/list', '', '列表', 2, NULL, '', 'btn', NULL, NULL, '2021-11-11 18:13:47', NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (59, '56', 'adminLog', '/logs/adminLog', '操作日志', 1, 2, 'el-icon-magic-stick', 'menu', NULL, '2021-11-10 17:49:02', '2021-11-17 10:02:41', NULL, 'adminLog', '1');
INSERT INTO `b_menu` VALUES (60, '59', '/system/adminLog/list', '/sys/adminLog/query_log', '列表', 2, NULL, NULL, 'btn', NULL, '2021-11-10 17:49:27', '2021-11-11 18:13:54', NULL, '/zwblog/adminLog', '0');
INSERT INTO `b_menu` VALUES (61, '56', 'exceptionLog', '/logs/exceptionLog', '异常日志', 1, 3, 'el-icon-cpu', 'menu', NULL, '2021-11-11 10:57:42', '2021-11-17 10:02:47', NULL, 'exceptionLog', '1');
INSERT INTO `b_menu` VALUES (62, '61', '/system/exceptionLog/list', '/sys/exceptionLog/query_log', '列表', 2, NULL, NULL, 'btn', NULL, '2021-11-11 11:05:47', '2021-11-11 18:13:59', NULL, '/sys/exceptionLog/query_log', '0');
INSERT INTO `b_menu` VALUES (63, '0', '/other', 'Layout', '其他', 0, 1, 'el-icon-more-outline', 'menu', NULL, '2021-11-12 09:29:15', NULL, NULL, 'other', '0');
INSERT INTO `b_menu` VALUES (64, '63', '/image', '/image', '图片管理', 1, 1, 'el-icon-picture-outline', 'menu', NULL, '2021-11-12 09:31:24', '2021-11-16 15:47:05', NULL, '/image', '0');
INSERT INTO `b_menu` VALUES (65, '64', '/file/delBatchFile', '', '删除', 2, NULL, NULL, 'btn', '', '2021-09-27 11:53:16', '2021-11-11 18:10:55', NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (66, '63', '/home', '', '首页', 1, NULL, 'el-icon-s-home', 'menu', '', '2021-10-16 15:46:06', '2021-11-12 09:30:39', NULL, 'home', '0');
INSERT INTO `b_menu` VALUES (67, '66', '/system/home/lineCount', '', '顶部统计信息', 2, NULL, NULL, 'btn', NULL, '2021-10-16 15:46:56', '2021-11-27 11:51:56', NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (164, '0', '/listener', 'Layout', '监控中心', 0, 6, 'el-icon-monitor', 'menu', NULL, '2021-11-16 11:48:04', NULL, NULL, 'listener', '1');
INSERT INTO `b_menu` VALUES (165, '164', '/server', '/listener/server', '服务监控', 1, 1, 'el-icon-light-rain', 'menu', NULL, '2021-11-16 11:49:16', '2021-12-10 08:47:17', NULL, 'server', '1');
INSERT INTO `b_menu` VALUES (166, '165', '/system/home/systemInfo', NULL, '查看', 2, 1, NULL, 'btn', NULL, '2021-11-16 11:50:03', NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (169, '41', '/dict', '/site/dict/index', '字典管理', 1, 1, 'el-icon-heavy-rain', 'menu', NULL, '2021-11-25 17:37:43', '2021-12-10 15:28:52', NULL, 'dict', '1');
INSERT INTO `b_menu` VALUES (170, '169', '/system/dict/list', NULL, '列表', 2, 1, NULL, 'btn', NULL, '2021-11-25 17:38:04', NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (171, '41', '/dictData', '/site/dict/data', '字典数据', 1, 2, 'el-icon-sunset', 'menu', NULL, '2021-11-25 17:53:25', '2021-12-11 20:11:50', NULL, 'dictData', '0');
INSERT INTO `b_menu` VALUES (172, '171', '/system/dictData/list', NULL, '列表', 2, 1, NULL, 'btn', NULL, '2021-11-25 17:53:52', NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (173, '169', '/system/dict/add', NULL, '添加', 2, 1, NULL, 'btn', NULL, '2021-11-26 08:57:12', NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (174, '169', '/system/dict/update', NULL, '修改', 2, 2, NULL, 'btn', NULL, '2021-11-26 08:57:29', NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (175, '171', '/system/dictData/getDataByDictType', NULL, '类型集合字典数据', 2, 2, NULL, 'btn', NULL, '2021-11-26 09:55:27', NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (176, '169', '/system/dict/delete', NULL, '删除', 2, 3, NULL, 'btn', NULL, '2021-11-26 11:22:21', NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (177, '169', '/system/dict/deleteBatch', NULL, '批量删除', 2, NULL, '4', 'btn', NULL, '2021-11-26 11:22:37', NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (178, '171', '/system/dictData/add', NULL, '添加', 2, 1, NULL, 'btn', NULL, '2021-11-26 14:06:04', NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (179, '171', '/system/dictData/update', NULL, '修改', 2, 2, NULL, 'btn', NULL, '2021-11-26 14:06:18', NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (180, '171', '/system/dictData/delete', NULL, '删除', 2, 3, NULL, 'btn', NULL, '2021-11-26 14:06:31', NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (181, '171', '/system/dictData/deleteBatch', NULL, '批量删除', 2, 4, NULL, 'btn', NULL, '2021-11-26 14:06:46', NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (182, '1', 'systemconfig', '/system/config', '系统配置', 1, 2, 'el-icon-setting', 'menu', NULL, '2021-11-26 15:06:11', '2021-11-27 12:53:08', NULL, 'systemconfig', '1');
INSERT INTO `b_menu` VALUES (183, '182', '/system/config/getConfig', NULL, '查询', 2, 1, NULL, 'btn', NULL, '2021-11-26 15:06:39', '2021-11-26 15:45:36', NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (184, '182', '/system/config/update', NULL, '修改', 2, 2, NULL, 'btn', NULL, '2021-11-26 15:55:47', NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (185, '2', '/system/role/queryRoleId', NULL, '获取该角色所拥有的权限', 2, 1, NULL, 'btn', NULL, '2021-11-27 12:47:27', NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (186, '41', 'webConfig', '/site/webConfig/index', '网站配置', 1, 3, 'el-icon-setting', 'menu', NULL, '2021-11-27 13:48:02', NULL, NULL, 'webConfig', '1');
INSERT INTO `b_menu` VALUES (187, '186', '/system/webConfig/list', NULL, '查询', 2, 1, NULL, 'btn', NULL, '2021-11-27 13:48:33', NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (188, '186', '/system/webConfig/update', NULL, '修改', 2, 1, NULL, 'btn', NULL, '2021-11-27 14:12:42', NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (189, '35', '/system/tags/deleteBatch', '', '批量删除', 2, 1, NULL, 'btn', '', '2021-11-28 12:44:48', NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (191, '164', '/quartz', '/listener/quartz', '定时任务', 1, 2, 'el-icon-coordinate', 'menu', '', '2021-12-10 08:46:08', NULL, NULL, 'quartz', '1');
INSERT INTO `b_menu` VALUES (192, '191', '/system/job/list', '', '列表', 2, 1, NULL, 'btn', '', '2021-12-10 08:47:52', NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (193, '191', '/system/job/add', '', '添加', 2, 2, NULL, 'btn', '', '2021-12-10 08:48:13', NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (194, '191', '/system/job/update', '', '修改', 2, 3, NULL, 'btn', '', '2021-12-10 08:48:27', NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (195, '191', '/system/job/delete', '', '删除', 2, 4, NULL, 'btn', '', '2021-12-10 08:48:45', NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (196, '191', '/system/job/run', '', '立即执行', 2, 5, NULL, 'btn', '', '2021-12-10 08:52:15', NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (197, '191', '/system/job/change', '', '修改状态', 2, 6, NULL, 'btn', '', '2021-12-10 08:52:42', NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (198, '191', '/system/job/info', '', '详情', 2, 7, NULL, 'btn', '', '2021-12-10 10:09:27', NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (199, '164', '/jobLog', '/listener/quartz/log', '任务日志', 1, 3, 'el-icon-help', 'menu', '', '2021-12-10 11:45:00', NULL, NULL, 'log', '0');
INSERT INTO `b_menu` VALUES (200, '199', '/system/jobLog/list', '', '列表', 2, 1, NULL, 'btn', '', '2021-12-10 11:45:23', NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (201, '199', '/system/jobLog/deleteBatch', '', '批量删除', 2, 2, NULL, 'btn', '', '2021-12-10 13:50:17', NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (202, '199', '/system/jobLog/clean', '', '清空', 2, 3, NULL, 'btn', '', '2021-12-10 13:50:28', NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (203, '191', '/system/job/deleteBatch', '', '批量删除', 2, 8, NULL, 'btn', '', '2021-12-10 14:23:21', NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (215, '27', '/system/article/reptile', '', '爬虫', 2, 6, NULL, 'btn', '', '2021-12-24 09:00:15', NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (216, '35', '/system/tags/top', '', '标签置顶', 2, 5, NULL, 'btn', '', '2021-12-24 09:00:36', NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (217, '41', '/pages', '/site/page', '页面管理', 1, 3, 'el-icon-document-remove', 'menu', '', '2021-12-27 11:47:36', NULL, NULL, '/pages', '1');
INSERT INTO `b_menu` VALUES (218, '217', '/system/page/list', '', '列表', 2, 1, NULL, 'btn', '', '2021-12-27 11:48:06', NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (219, '217', '/system/page/add', '', '新增', 2, 2, NULL, 'btn', '', '2021-12-27 11:48:30', NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (220, '217', '/system/page/update', '', '修改', 2, 3, NULL, 'btn', '', '2021-12-27 11:48:47', NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (221, '217', '/system/page/delete', '', '删除', 2, 4, NULL, 'btn', '', '2021-12-27 11:49:01', NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (223, '26', 'category', '/articles/category', '分类管理', 1, 3, 'el-icon-files', 'menu', '', '2021-12-29 10:05:12', '2021-12-29 10:08:05', NULL, '/category', '1');
INSERT INTO `b_menu` VALUES (224, '223', '/system/category/list', '', '列表', 2, 1, NULL, 'btn', '', '2021-12-29 10:05:38', NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (225, '223', '/system/category/info', '', '详情', 2, 2, NULL, 'btn', '', '2021-12-29 10:05:58', NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (226, '223', '/system/category/add', '', '新增', 2, 3, NULL, 'btn', '', '2021-12-29 10:06:18', NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (227, '223', '/system/category/update', '', '修改', 2, 4, NULL, 'btn', '', '2021-12-29 10:06:33', NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (228, '223', '/system/category/deleteBatch', '', '批量删除', 2, 5, NULL, 'btn', '', '2021-12-29 10:06:47', NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (229, '223', '/system/category/top', '', '置顶', 2, 6, NULL, 'btn', '', '2021-12-29 10:07:06', NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (230, '223', '/system/category/delete', '', '删除', 2, 7, NULL, 'btn', '', '2021-12-29 10:27:55', NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (231, '249', '/albums', '/site/album/album', '相册列表', 1, 1, 'el-icon-camera', 'menu', '', '2021-12-30 16:29:09', '2022-01-06 15:00:26', NULL, '/album', '1');
INSERT INTO `b_menu` VALUES (232, '231', '/system/album/list', '', '列表', 2, 1, NULL, 'btn', '', '2021-12-30 16:31:50', NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (233, '231', '/system/album/info', '', '详情', 2, 2, NULL, 'btn', '', '2021-12-30 16:32:15', NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (234, '231', '/system/album/add', '', '新增', 2, 3, NULL, 'btn', '', '2021-12-30 16:32:33', NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (235, '231', '/system/album/update', '', '修改', 2, 4, NULL, 'btn', '', '2021-12-30 16:42:49', NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (236, '231', '/system/album/delete', '', '删除', 2, 5, NULL, 'btn', '', '2021-12-30 16:43:13', NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (237, '249', '/photos', '/site/album/photo', '照片管理', 1, 2, 'el-icon-camera', 'menu', '', '2021-12-31 08:49:19', NULL, NULL, '/photo', '0');
INSERT INTO `b_menu` VALUES (238, '237', '/system/photo/list', '', '列表', 2, 1, NULL, 'btn', '', '2021-12-31 08:49:42', NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (239, '237', '/system/photo/info', '', '详情', 2, 2, NULL, 'btn', '', '2021-12-31 08:50:10', NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (241, '237', '/system/photo/add', '', '新增', 2, 3, NULL, 'btn', '', '2021-12-31 08:50:38', NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (242, '237', '/system/photo/update', '', '修改', 2, 4, NULL, 'btn', '', '2021-12-31 08:50:52', NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (243, '237', '/system/photo/deleteBatch', '', '批量删除', 2, 5, NULL, 'btn', '', '2021-12-31 08:51:08', NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (244, '237', '/system/photo/movePhoto', '', '移动照片', 2, 5, NULL, 'btn', '', '2021-12-31 08:51:08', NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (245, '0', '/news', 'Layout', '消息管理', 0, 3, 'el-icon-bell', 'menu', '', '2021-12-31 14:21:26', NULL, NULL, '/new', '1');
INSERT INTO `b_menu` VALUES (246, '47', '/system/message/passBatch', '', '批量通过', 2, 3, NULL, 'btn', '', '2021-12-31 14:35:29', NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (247, '47', '/system/message/deleteBatch', '', '批量删除', 2, 4, NULL, 'btn', '', '2021-12-31 14:35:47', NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (248, '66', '/web/comment/addComment', '', '发表评论', 2, 5, NULL, 'btn', '', '2022-01-06 09:27:46', NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (249, '0', '/album', 'Layout', '相册管理', 0, 3, 'el-icon-picture-outline', 'menu', '', '2021-12-31 14:21:26', '2022-01-06 15:00:44', NULL, '/album', '1');
INSERT INTO `b_menu` VALUES (250, '57', '/system/userLog/delete', '', '删除', 2, 2, NULL, 'btn', '', '2022-01-06 15:41:01', NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (251, '59', '/system/adminLog/delete', '', '删除', 2, 2, NULL, 'btn', '', '2022-01-06 15:41:27', NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (252, '61', '/system/exceptionLog/delete', '', '删除', 2, 2, NULL, 'btn', '', '2022-01-06 15:41:49', NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (253, '27', '/system/article/deleteBatch', '', '批量删除', 2, 6, NULL, 'btn', '', '2022-01-06 18:00:24', NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (254, '51', '/system/friend/top', '', '置顶', 2, 4, NULL, 'btn', '', NULL, NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (256, '245', '/feedbacks', '/news/feedback', '反馈管理', 1, 2, 'el-icon-warning-outline', 'menu', '', NULL, NULL, NULL, '/feedback', '1');
INSERT INTO `b_menu` VALUES (257, '256', '/system/feedback/list', '', '列表', 2, 1, NULL, 'btn', '', NULL, NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (258, '256', '/system/feedback/deleteBatch', '', '批量删除', 2, 2, NULL, 'btn', '批量删除反馈', NULL, NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (260, '64', '/file/upload', '', '上传图片', 2, 1, NULL, 'btn', '', NULL, NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (261, '66', '/system/home/init', '', '首页各种统计信息', 2, 3, NULL, 'btn', '', NULL, NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (262, '27', '/system/article/pubOrShelf', '', '发布或下架文章', 2, 4, NULL, 'btn', '', NULL, NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (263, '164', 'onlineUser', '/listener/user/index', '在线用户', 1, 3, 'el-icon-user', 'menu', '', NULL, NULL, NULL, 'online', '1');
INSERT INTO `b_menu` VALUES (264, '263', '/system/user/kick', '', '踢人下线', 2, 1, NULL, 'btn', '', NULL, NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (265, '164', 'druids', '/listener/druid/index', 'druid监控', 1, 4, 'el-icon-help', 'menu', '', NULL, NULL, NULL, 'druid', '1');
INSERT INTO `b_menu` VALUES (266, '245', 'comment', '/news/comment', '评论管理', 1, 1, 'el-icon-chat-dot-round', 'menu', '', NULL, NULL, NULL, 'comments', '1');
INSERT INTO `b_menu` VALUES (267, '266', '/system/comment/list', '', '评论列表', 2, 1, NULL, 'btn', '', NULL, NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (268, '266', '/system/comment/deleteBatch', '', '批量删除评论', 2, 2, NULL, 'btn', '', NULL, NULL, NULL, NULL, '0');
INSERT INTO `b_menu` VALUES (269, '164', 'cache', '/listener/cache', '缓存监控', 1, 5, 'el-icon-hot-water', 'menu', '', NULL, NULL, NULL, 'caches', '1');
INSERT INTO `b_menu` VALUES (270, '269', '/system/home/cache', '', '获取缓存监控', 2, 1, NULL, 'btn', '', NULL, NULL, NULL, NULL, '0');

-- ----------------------------
-- Table structure for b_message
-- ----------------------------
DROP TABLE IF EXISTS `b_message`;
CREATE TABLE `b_message`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '内容',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ip_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ip_source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `time` tinyint(10) NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT NULL COMMENT '状态 0:审核  1：正常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_page
-- ----------------------------
DROP TABLE IF EXISTS `b_page`;
CREATE TABLE `b_page`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `page_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `page_label` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `page_cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of b_page
-- ----------------------------
INSERT INTO `b_page` VALUES (1, '首页', 'home', 'http://img.shiyit.com/1642481190129.jpg', '2021-08-07 10:32:36', '2022-01-18 12:46:32');
INSERT INTO `b_page` VALUES (2, '归档', 'archive', 'http://img.shiyit.com/1642481212604.jpg', '2021-08-07 10:32:36', '2022-01-18 12:46:59');
INSERT INTO `b_page` VALUES (3, '分类', 'category', 'http://img.shiyit.com/1642481235438.jpg', '2021-08-07 10:32:36', '2022-01-18 12:47:17');
INSERT INTO `b_page` VALUES (4, '标签', 'tag', 'http://img.shiyit.com/1642481247590.png', '2021-08-07 10:32:36', '2022-01-18 12:47:29');
INSERT INTO `b_page` VALUES (5, '相册', 'album', 'http://img.shiyit.com/1642481260439.png', '2021-08-07 10:32:36', '2022-01-18 12:47:42');
INSERT INTO `b_page` VALUES (6, '友链', 'link', 'http://img.shiyit.com/1642481271507.jpg', '2021-08-07 10:32:36', '2022-01-18 12:47:53');
INSERT INTO `b_page` VALUES (7, '关于', 'about', 'http://img.shiyit.com/1642481282043.jpg', '2021-08-07 10:32:36', '2022-01-18 12:48:04');
INSERT INTO `b_page` VALUES (8, '留言', 'message', 'http://img.shiyit.com/1642481294001.png', '2021-08-07 10:32:36', '2022-01-18 12:48:15');
INSERT INTO `b_page` VALUES (9, '个人中心', 'user', 'http://img.shiyit.com/1642481301788.jpeg', '2021-08-07 10:32:36', '2022-01-18 12:48:23');
INSERT INTO `b_page` VALUES (10, '文章列表', 'articleList', 'http://img.shiyit.com/1642481333013.jpg', '2021-08-10 15:36:19', '2022-01-18 12:48:54');

-- ----------------------------
-- Table structure for b_photo
-- ----------------------------
DROP TABLE IF EXISTS `b_photo`;
CREATE TABLE `b_photo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `album_id` int(11) NOT NULL COMMENT '相册id',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '照片名',
  `info` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '照片描述',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '照片地址',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '照片' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_photo_album
-- ----------------------------
DROP TABLE IF EXISTS `b_photo_album`;
CREATE TABLE `b_photo_album`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '相册名',
  `info` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '相册描述',
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '相册封面',
  `status` int(1) NOT NULL DEFAULT 0 COMMENT '状态值 0公开 1私密',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '相册' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_role
-- ----------------------------
DROP TABLE IF EXISTS `b_role`;
CREATE TABLE `b_role`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色编码',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `remarks` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色描述',
  `created_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统管理-角色表 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of b_role
-- ----------------------------
INSERT INTO `b_role` VALUES (1, 'admin', '管理员', '系统管理员', '2019-03-28 15:51:56', '2022-01-06 18:03:34');
INSERT INTO `b_role` VALUES (2, 'user', '用户', '用户', '2021-12-27 07:01:39', '2021-12-27 07:01:39');
INSERT INTO `b_role` VALUES (5, 'test', '演示', '演示账号', '2021-11-14 12:23:25', '2022-01-06 18:03:43');

-- ----------------------------
-- Table structure for b_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `b_role_menu`;
CREATE TABLE `b_role_menu`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` int(10) NULL DEFAULT NULL COMMENT '角色ID',
  `menu_id` int(10) NULL DEFAULT NULL COMMENT '菜单ID',
  `created_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `role_id`(`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11663 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统管理 - 角色-权限资源关联表 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of b_role_menu
-- ----------------------------
INSERT INTO `b_role_menu` VALUES (11364, 1, 1, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11365, 1, 2, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11366, 1, 3, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11367, 1, 4, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11368, 1, 5, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11369, 1, 6, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11370, 1, 7, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11371, 1, 185, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11372, 1, 8, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11373, 1, 9, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11374, 1, 10, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11375, 1, 11, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11376, 1, 12, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11377, 1, 13, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11378, 1, 14, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11379, 1, 15, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11380, 1, 16, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11381, 1, 17, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11382, 1, 18, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11383, 1, 19, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11384, 1, 20, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11385, 1, 21, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11386, 1, 22, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11387, 1, 23, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11388, 1, 24, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11389, 1, 25, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11390, 1, 182, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11391, 1, 183, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11392, 1, 184, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11393, 1, 26, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11394, 1, 27, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11395, 1, 28, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11396, 1, 29, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11397, 1, 30, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11398, 1, 31, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11399, 1, 32, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11400, 1, 33, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11401, 1, 215, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11402, 1, 253, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11403, 1, 262, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11404, 1, 35, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11405, 1, 36, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11406, 1, 37, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11407, 1, 38, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11408, 1, 39, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11409, 1, 40, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11410, 1, 189, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11411, 1, 216, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11412, 1, 223, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11413, 1, 224, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11414, 1, 225, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11415, 1, 226, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11416, 1, 227, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11417, 1, 228, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11418, 1, 229, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11419, 1, 230, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11420, 1, 41, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11421, 1, 51, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11422, 1, 52, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11423, 1, 53, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11424, 1, 54, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11425, 1, 55, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11426, 1, 254, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11427, 1, 169, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11428, 1, 170, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11429, 1, 173, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11430, 1, 174, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11431, 1, 176, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11432, 1, 177, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11433, 1, 171, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11434, 1, 172, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11435, 1, 175, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11436, 1, 178, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11437, 1, 179, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11438, 1, 180, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11439, 1, 181, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11440, 1, 186, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11441, 1, 187, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11442, 1, 188, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11443, 1, 217, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11444, 1, 218, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11445, 1, 219, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11446, 1, 220, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11447, 1, 221, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11448, 1, 56, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11449, 1, 57, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11450, 1, 58, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11451, 1, 250, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11452, 1, 59, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11453, 1, 60, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11454, 1, 251, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11455, 1, 61, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11456, 1, 62, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11457, 1, 252, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11458, 1, 63, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11459, 1, 64, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11460, 1, 65, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11461, 1, 260, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11462, 1, 66, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11463, 1, 67, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11464, 1, 248, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11465, 1, 261, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11466, 1, 164, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11467, 1, 165, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11468, 1, 166, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11469, 1, 191, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11470, 1, 192, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11471, 1, 193, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11472, 1, 194, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11473, 1, 195, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11474, 1, 196, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11475, 1, 197, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11476, 1, 198, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11477, 1, 203, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11478, 1, 199, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11479, 1, 200, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11480, 1, 201, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11481, 1, 202, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11482, 1, 263, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11483, 1, 264, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11484, 1, 265, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11485, 1, 269, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11486, 1, 270, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11487, 1, 245, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11488, 1, 47, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11489, 1, 48, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11490, 1, 49, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11491, 1, 50, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11492, 1, 246, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11493, 1, 247, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11494, 1, 256, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11495, 1, 257, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11496, 1, 258, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11497, 1, 266, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11498, 1, 267, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11499, 1, 268, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11500, 1, 249, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11501, 1, 231, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11502, 1, 232, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11503, 1, 233, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11504, 1, 234, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11505, 1, 235, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11506, 1, 236, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11507, 1, 237, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11508, 1, 238, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11509, 1, 239, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11510, 1, 241, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11511, 1, 242, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11512, 1, 243, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11513, 1, 244, '2022-04-14 15:35:06', '2022-04-14 15:35:06');
INSERT INTO `b_role_menu` VALUES (11514, 5, 1, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11515, 5, 2, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11516, 5, 3, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11517, 5, 4, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11518, 5, 5, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11519, 5, 6, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11520, 5, 7, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11521, 5, 185, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11522, 5, 8, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11523, 5, 9, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11524, 5, 10, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11525, 5, 11, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11526, 5, 12, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11527, 5, 13, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11528, 5, 14, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11529, 5, 15, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11530, 5, 16, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11531, 5, 17, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11532, 5, 18, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11533, 5, 19, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11534, 5, 20, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11535, 5, 21, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11536, 5, 22, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11537, 5, 23, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11538, 5, 24, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11539, 5, 25, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11540, 5, 182, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11541, 5, 183, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11542, 5, 184, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11543, 5, 26, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11544, 5, 27, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11545, 5, 28, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11546, 5, 29, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11547, 5, 30, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11548, 5, 31, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11549, 5, 32, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11550, 5, 33, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11551, 5, 215, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11552, 5, 253, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11553, 5, 262, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11554, 5, 35, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11555, 5, 36, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11556, 5, 37, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11557, 5, 38, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11558, 5, 39, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11559, 5, 40, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11560, 5, 189, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11561, 5, 216, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11562, 5, 223, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11563, 5, 224, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11564, 5, 225, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11565, 5, 226, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11566, 5, 227, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11567, 5, 228, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11568, 5, 229, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11569, 5, 230, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11570, 5, 41, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11571, 5, 51, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11572, 5, 52, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11573, 5, 53, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11574, 5, 54, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11575, 5, 55, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11576, 5, 254, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11577, 5, 169, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11578, 5, 170, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11579, 5, 173, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11580, 5, 174, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11581, 5, 176, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11582, 5, 177, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11583, 5, 171, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11584, 5, 172, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11585, 5, 175, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11586, 5, 178, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11587, 5, 179, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11588, 5, 180, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11589, 5, 181, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11590, 5, 186, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11591, 5, 187, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11592, 5, 188, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11593, 5, 217, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11594, 5, 218, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11595, 5, 219, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11596, 5, 220, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11597, 5, 221, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11598, 5, 56, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11599, 5, 57, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11600, 5, 58, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11601, 5, 250, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11602, 5, 59, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11603, 5, 60, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11604, 5, 251, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11605, 5, 61, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11606, 5, 62, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11607, 5, 252, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11608, 5, 65, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11609, 5, 66, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11610, 5, 67, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11611, 5, 248, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11612, 5, 261, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11613, 5, 164, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11614, 5, 165, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11615, 5, 166, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11616, 5, 191, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11617, 5, 192, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11618, 5, 193, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11619, 5, 194, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11620, 5, 195, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11621, 5, 196, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11622, 5, 197, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11623, 5, 198, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11624, 5, 203, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11625, 5, 199, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11626, 5, 200, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11627, 5, 201, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11628, 5, 202, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11629, 5, 263, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11630, 5, 264, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11631, 5, 265, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11632, 5, 269, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11633, 5, 270, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11634, 5, 245, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11635, 5, 47, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11636, 5, 48, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11637, 5, 49, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11638, 5, 50, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11639, 5, 246, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11640, 5, 247, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11641, 5, 256, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11642, 5, 257, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11643, 5, 258, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11644, 5, 266, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11645, 5, 267, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11646, 5, 268, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11647, 5, 249, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11648, 5, 231, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11649, 5, 232, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11650, 5, 233, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11651, 5, 234, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11652, 5, 235, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11653, 5, 236, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11654, 5, 237, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11655, 5, 238, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11656, 5, 239, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11657, 5, 241, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11658, 5, 242, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11659, 5, 243, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11660, 5, 244, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11661, 5, 63, '2022-04-14 15:35:34', '2022-04-14 15:35:34');
INSERT INTO `b_role_menu` VALUES (11662, 5, 64, '2022-04-14 15:35:34', '2022-04-14 15:35:34');

-- ----------------------------
-- Table structure for b_system_config
-- ----------------------------
DROP TABLE IF EXISTS `b_system_config`;
CREATE TABLE `b_system_config`  (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `qi_niu_access_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '七牛云公钥',
  `qi_niu_secret_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '七牛云私钥',
  `qi_niu_area` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '七牛云存储区域 华东（z0），华北(z1)，华南(z2)，北美(na0)，东南亚(as0)',
  `qi_niu_bucket` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '七牛云上传空间',
  `qi_niu_picture_base_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '七牛云域名前缀：http://images.moguit.cn',
  `upload_qi_niu` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件上传七牛云(0:否， 1:是)',
  `open_email_activate` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否开启注册用户邮件激活(0:否， 1:是)',
  `start_email_notification` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否开启邮件通知(0:否， 1:是)',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `open_dashboard_notification` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否开启仪表盘通知(0:否， 1:是)',
  `dashboard_notification_md` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '仪表盘通知【用于首次登录弹框】MD',
  `dashboard_notification` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '仪表盘通知【用于首次登录弹框】',
  `search_model` int(1) NOT NULL DEFAULT 0 COMMENT '搜索模式【0:SQL搜索 、1：全文检索】',
  `email_host` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱地址',
  `email_username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱发件人',
  `email_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱授权码',
  `email_port` int(10) NULL DEFAULT NULL COMMENT '邮箱发送端口',
  `open_email` int(1) NULL DEFAULT NULL COMMENT '启用邮箱发送',
  `local_file_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '本地文件地址',
  `file_upload_way` int(1) NULL DEFAULT NULL COMMENT '文件上传方式 1:本地 2：七牛云',
  `ali_yun_access_key` varchar(100) DEFAULT NULL COMMENT '阿里云ak',
  `ali_yun_secret_key` varchar(100) DEFAULT NULL COMMENT '阿里云sk',
  `ali_yun_bucket` varchar(100) DEFAULT NULL COMMENT '阿里云存储桶名',
  `ali_yun_endpoint` varchar(100) DEFAULT NULL COMMENT '阿里云Endpoint',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of b_system_config
-- ----------------------------
INSERT INTO `b_system_config` VALUES (1, '', '', 'z0', '', 'http://img.shiyit.com/', '1', '1', '1', '2021-11-26 15:41:36', '2021-11-26 15:41:36', '1', '欢迎来到拾壹博客项目，开源项目离不开大家的支持，希望小伙伴能随手点赞一下，你的点赞就是我维护的动力~\n\n博主使用笔记本开发的项目，所以页面中表格的列在大屏显示器中会显示宽度的不均衡，如需要可以自行调整。\n\n项目源码：[点我传送](https://gitee.com/quequnlong/shiyi-blog)，项目官网：[点我传送](http://www.shiyit.com)\n\n项目还在开发阶段，如有不善的地方欢迎各位小伙伴多多反馈\n\n最低配置：1核2G \n\n推荐配置：2核4G [【狂欢特惠】](https://cloud.tencent.com/act/new?channel=sp&fromSource=gwzcw.5433948.5433948.5433948&utm_medium=cpc&utm_id=gwzcw.5433948.5433948.5433948&bd_vid=6261311440599794431)\n\n服务器和域名等服务的购买和续费都会产生一定的费用，为了维持项目的正常运作，如果觉得本项目对您有帮助的话\n\n欢迎朋友能够给予一些支持，非常感谢~（ps.. 小伙伴赞赏的时候可以备注一下下~）\n|支付宝|微信|\n|-|-|-|\n|![支付宝](http://img.shiyit.com/1639990067114.png)|![微信](http://img.shiyit.com/1639990061772.png)|\na', '<p>欢迎来到拾壹博客项目，开源项目离不开大家的支持，希望小伙伴能随手点赞一下，你的点赞就是我维护的动力~</p>\n<p>博主使用笔记本开发的项目，所以页面中表格的列在大屏显示器中会显示宽度的不均衡，如需要可以自行调整。</p>\n<p>项目源码：<a href=\"https://gitee.com/quequnlong/shiyi-blog\" target=\"_blank\">点我传送</a>，项目官网：<a href=\"http://www.shiyit.com\" target=\"_blank\">点我传送</a></p>\n<p>项目还在开发阶段，如有不善的地方欢迎各位小伙伴多多反馈</p>\n<p>最低配置：1核2G</p>\n<p>推荐配置：2核4G <a href=\"https://cloud.tencent.com/act/new?channel=sp&amp;fromSource=gwzcw.5433948.5433948.5433948&amp;utm_medium=cpc&amp;utm_id=gwzcw.5433948.5433948.5433948&amp;bd_vid=6261311440599794431\" target=\"_blank\">【狂欢特惠】</a></p>\n<p>服务器和域名等服务的购买和续费都会产生一定的费用，为了维持项目的正常运作，如果觉得本项目对您有帮助的话</p>\n<p>欢迎朋友能够给予一些支持，非常感谢~（ps… 小伙伴赞赏的时候可以备注一下下~）</p>\n<table>\n<thead>\n<tr>\n<th>支付宝</th>\n<th>微信</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td><img src=\"http://img.shiyit.com/1639990067114.png\" alt=\"支付宝\" /></td>\n<td><img src=\"http://img.shiyit.com/1639990061772.png\" alt=\"微信\" /></td>\n</tr>\n</tbody>\n</table>\n', 1, 'smtp.qq.com', 'xxx@qq.com', '', 587, 1, '', 1,NULL,NULL,NULL,NULL);
INSERT INTO `b_system_config` VALUES (2, '', '', 'z0', '', 'http://img.shiyit.com/', '1', '1', '1', '2021-11-26 15:41:36', '2021-11-26 15:41:36', '1', '欢迎来到拾壹博客项目，开源项目离不开大家的支持，希望小伙伴能随手点赞一下，你的点赞就是我维护的动力~\n\n博主使用笔记本开发的项目，所以页面中表格的列在大屏显示器中会显示宽度的不均衡，如需要可以自行调整。\n\n项目源码：[点我传送](https://gitee.com/quequnlong/shiyi-blog)，项目官网：[点我传送](http://www.shiyit.com)\n\n项目还在开发阶段，如有不善的地方欢迎各位小伙伴多多反馈\n\n最低配置：1核2G \n\n推荐配置：2核4G [【狂欢特惠】](https://cloud.tencent.com/act/new?channel=sp&fromSource=gwzcw.5433948.5433948.5433948&utm_medium=cpc&utm_id=gwzcw.5433948.5433948.5433948&bd_vid=6261311440599794431)\n\n服务器和域名等服务的购买和续费都会产生一定的费用，为了维持项目的正常运作，如果觉得本项目对您有帮助的话\n\n欢迎朋友能够给予一些支持，非常感谢~（ps.. 小伙伴赞赏的时候可以备注一下下~）\n|支付宝|微信|\n|-|-|-|\n|![支付宝](http://img.shiyit.com/1639990067114.png)|![微信](http://img.shiyit.com/1639990061772.png)|\na', '<p>欢迎来到拾壹博客项目，开源项目离不开大家的支持，希望小伙伴能随手点赞一下，你的点赞就是我维护的动力~</p>\n<p>博主使用笔记本开发的项目，所以页面中表格的列在大屏显示器中会显示宽度的不均衡，如需要可以自行调整。</p>\n<p>项目源码：<a href=\"https://gitee.com/quequnlong/shiyi-blog\" target=\"_blank\">点我传送</a>，项目官网：<a href=\"http://www.shiyit.com\" target=\"_blank\">点我传送</a></p>\n<p>项目还在开发阶段，如有不善的地方欢迎各位小伙伴多多反馈</p>\n<p>最低配置：1核2G</p>\n<p>推荐配置：2核4G <a href=\"https://cloud.tencent.com/act/new?channel=sp&amp;fromSource=gwzcw.5433948.5433948.5433948&amp;utm_medium=cpc&amp;utm_id=gwzcw.5433948.5433948.5433948&amp;bd_vid=6261311440599794431\" target=\"_blank\">【狂欢特惠】</a></p>\n<p>服务器和域名等服务的购买和续费都会产生一定的费用，为了维持项目的正常运作，如果觉得本项目对您有帮助的话</p>\n<p>欢迎朋友能够给予一些支持，非常感谢~（ps… 小伙伴赞赏的时候可以备注一下下~）</p>\n<table>\n<thead>\n<tr>\n<th>支付宝</th>\n<th>微信</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td><img src=\"http://img.shiyit.com/1639990067114.png\" alt=\"支付宝\" /></td>\n<td><img src=\"http://img.shiyit.com/1639990061772.png\" alt=\"微信\" /></td>\n</tr>\n</tbody>\n</table>\n', 1, 'smtp.qq.com', 'xxx@qq.com', NULL, 587, 1, NULL, 1,NULL,NULL,NULL,NULL);

-- ----------------------------
-- Table structure for b_tags
-- ----------------------------
DROP TABLE IF EXISTS `b_tags`;
CREATE TABLE `b_tags`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标签名称',
  `click_volume` int(10) NULL DEFAULT 0,
  `sort` int(11) NOT NULL COMMENT '排序',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tag_name`(`name`) USING BTREE COMMENT '博客标签名称'
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '博客标签表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of b_tags
-- ----------------------------
INSERT INTO `b_tags` VALUES (1, 'springboot', 6, 0, '2021-11-12 14:43:27', '2022-04-15 03:00:00');
INSERT INTO `b_tags` VALUES (2, 'elasticsearch', 6, 0, '2021-11-12 14:43:27', '2022-04-15 03:00:00');
INSERT INTO `b_tags` VALUES (10, 'blog', 12, 0, '2021-11-12 14:43:27', '2022-04-15 03:00:00');
INSERT INTO `b_tags` VALUES (12, 'vue', 0, 1, '2021-12-29 14:01:50', '2021-12-29 14:01:50');
INSERT INTO `b_tags` VALUES (13, 'springcloud', 4, 0, '2021-12-29 14:02:32', '2022-04-15 03:00:00');
INSERT INTO `b_tags` VALUES (14, 'webmagic', 0, 2, '2022-01-07 17:09:12', '2022-01-07 17:09:12');
INSERT INTO `b_tags` VALUES (15, 'markdown', 0, 0, '2022-01-14 06:04:17', '2022-01-14 06:04:17');
INSERT INTO `b_tags` VALUES (17, 'redis', 2, 0, '2022-01-25 14:09:03', '2022-04-15 03:00:00');
INSERT INTO `b_tags` VALUES (18, 'linux', 4, 0, '2022-01-25 14:09:17', '2022-04-15 03:00:00');
INSERT INTO `b_tags` VALUES (29, 'IDEA', 0, 0, '2022-02-15 15:12:49', '2022-02-15 07:12:48');
INSERT INTO `b_tags` VALUES (31, 'mysql', 9, 0, '2022-02-18 16:01:07', '2022-04-15 03:00:00');
INSERT INTO `b_tags` VALUES (32, 'nginx', 0, 0, '2022-04-13 17:48:08', '2022-04-13 09:48:08');
INSERT INTO `b_tags` VALUES (39, 'cs1', 0, 1, '2022-04-14 09:10:54', '2022-04-14 09:10:53');

-- ----------------------------
-- Table structure for b_user
-- ----------------------------
DROP TABLE IF EXISTS `b_user`;
CREATE TABLE `b_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录密码',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `status` int(10) NULL DEFAULT 1 COMMENT '状态 0:禁用 1:正常',
  `login_type` int(10) NULL DEFAULT NULL COMMENT '登录方式',
  `user_auth_id` bigint(10) NULL DEFAULT NULL COMMENT '用户详情id',
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色id',
  `ip_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ip地址',
  `ip_source` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ip来源',
  `os` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录系统',
  `last_login_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后登录时间',
  `browser` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '浏览器',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统管理-用户基础信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of b_user
-- ----------------------------
INSERT INTO `b_user` VALUES (7, 'admin', 'NLJ3Gidivf3vouOjYLIvuA==', '2021-09-27 15:43:45', '2022-03-10 17:59:40', 1, 1, 1, 1, '58.20.50.139', '中国-湖南省-长沙市', 'Windows 10', '2022-04-15 08:21:24', 'Chrome 10');
INSERT INTO `b_user` VALUES (15, 'test', 'NLJ3Gidivf3vouOjYLIvuA==', '2021-11-14 12:35:03', '2022-03-10 14:11:02', 1, 1, 2, 5, '183.94.151.29', '中国-湖北省-武汉市', 'Linux', '2022-04-15 01:20:39', 'Chrome 10');

-- ----------------------------
-- Table structure for b_user_auth
-- ----------------------------
DROP TABLE IF EXISTS `b_user_auth`;
CREATE TABLE `b_user_auth`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱号',
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `avatar` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户头像',
  `intro` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户简介',
  `web_site` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个人网站',
  `is_disable` int(1) NOT NULL DEFAULT 1 COMMENT '是否禁用',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of b_user_auth
-- ----------------------------
INSERT INTO `b_user_auth` VALUES (1, 'admin', '管理员', 'http://img.shiyit.com/FjzfvfWYZVED7eXMS4EL8KNR949K', NULL, NULL, 1, NULL, NULL);
INSERT INTO `b_user_auth` VALUES (2, 'test', '演示账号', 'http://img.shiyit.com/1645512111007.png', NULL, NULL, 1, NULL, NULL);

-- ----------------------------
-- Table structure for b_user_log
-- ----------------------------
DROP TABLE IF EXISTS `b_user_log`;
CREATE TABLE `b_user_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '操作用户ID',
  `ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ip地址',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作地址',
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作类型',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作日志',
  `model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作模块',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  `result` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作结果',
  `access_os` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作系统',
  `browser` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '浏览器',
  `client_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户端类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8935 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for b_user_role
-- ----------------------------
DROP TABLE IF EXISTS `b_user_role`;
CREATE TABLE `b_user_role`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` int(10) NULL DEFAULT NULL COMMENT '角色ID',
  `user_id` int(10) NULL DEFAULT NULL COMMENT '用户ID',
  `created_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统管理 - 用户角色关联表 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of b_user_role
-- ----------------------------
INSERT INTO `b_user_role` VALUES (12, 1, 7, '2019-08-21 10:49:41', '2019-08-21 10:49:41');
INSERT INTO `b_user_role` VALUES (34, 5, 15, '2021-11-14 12:35:03', '2021-11-14 12:35:03');

-- ----------------------------
-- Table structure for b_web_config
-- ----------------------------
DROP TABLE IF EXISTS `b_web_config`;
CREATE TABLE `b_web_config`  (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'logo(文件UID)',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '网站名称',
  `summary` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '介绍',
  `keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '关键字',
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作者',
  `record_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '备案号',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `web_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网站地址',
  `ali_pay` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝收款码FileId',
  `weixin_pay` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信收款码FileId',
  `github` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'github地址',
  `gitee` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'gitee地址',
  `qq_number` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'QQ号',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `show_list` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示的列表（用于控制邮箱、QQ、QQ群、Github、Gitee、微信是否显示在前端）',
  `login_type_list` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录方式列表（用于控制前端登录方式，如账号密码,码云,Github,QQ,微信）',
  `open_comment` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否开启评论(0:否 1:是)',
  `open_admiration` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否开启赞赏(0:否， 1:是)',
  `tourist_avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '游客头像',
  `bulletin` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公告',
  `author_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者简介',
  `author_avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者头像',
  `about_me` varchar(350) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关于我',
  `is_music_player` int(10) NULL DEFAULT 0 COMMENT '是否开启音乐播放器',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '网站配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of b_web_config
-- ----------------------------
INSERT INTO `b_web_config` VALUES (1, 'http://img.shiyit.com/FjzfvfWYZVED7eXMS4EL8KNR949K', '拾壹博客', '机会向来都是自己争取的。', '拾壹,拾壹博客', '拾壹', '湘ICP备2022002110号-1', '2021-11-27 13:43:16', '2022-01-20 13:30:44', 'http://www.shiyit.com', '', '', 'https://github.com/quequnlong', 'https://gitee.com/quequnlong', '1248954763', '1248954763@qq.com', '1,2,3,4', '1,4,3,2', '1', 1, 'http://img.shiyit.com/touristAvatar.png', '如入你眼，请上码云给仓库点上您的小星星', '永远都是一个学者。', 'http://img.shiyit.com/FjzfvfWYZVED7eXMS4EL8KNR949K', '> 特别鸣谢博客作者：[gitee仓库](https://gitee.com/feng_meiyu/blog)\n#### 前端用的vue，后端用的springboot\n\n[![buzhiming/拾壹博客](https://gitee.com/quequnlong/shiyi-blog/widgets/widget_card.svg?colors=4183c4,ffffff,ffffff,e3e9ed,666666,9b9b9b)](https://gitee.com/quequnlong/shiyi-blog)\n\n', 1);

SET FOREIGN_KEY_CHECKS = 1;
