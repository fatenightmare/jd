-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2015-10-28 09:47:01
-- 服务器版本： 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `php39`
--

-- --------------------------------------------------------

--
-- 表的结构 `p39_admin`
--

CREATE TABLE IF NOT EXISTS `p39_admin` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `username` varchar(30) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='管理员' AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `p39_admin`
--

INSERT INTO `p39_admin` (`id`, `username`, `password`) VALUES
(1, 'root', '21232f297a57a5a743894a0e4a801fc3'),
(3, 'goods', '59da8bd04473ac6711d74cd91dbe903d'),
(4, 'rbac', 'eae22f4f89a3e1a049b3992d107229d1');

-- --------------------------------------------------------

--
-- 表的结构 `p39_admin_role`
--

CREATE TABLE IF NOT EXISTS `p39_admin_role` (
  `admin_id` mediumint(8) unsigned NOT NULL COMMENT '管理员id',
  `role_id` mediumint(8) unsigned NOT NULL COMMENT '角色id',
  KEY `admin_id` (`admin_id`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员角色';

--
-- 转存表中的数据 `p39_admin_role`
--

INSERT INTO `p39_admin_role` (`admin_id`, `role_id`) VALUES
(3, 1),
(4, 2);

-- --------------------------------------------------------

--
-- 表的结构 `p39_attribute`
--

CREATE TABLE IF NOT EXISTS `p39_attribute` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `attr_name` varchar(30) NOT NULL COMMENT '属性名称',
  `attr_type` enum('唯一','可选') NOT NULL COMMENT '属性类型',
  `attr_option_values` varchar(300) NOT NULL DEFAULT '' COMMENT '属性可选值',
  `type_id` mediumint(8) unsigned NOT NULL COMMENT '所属类型Id',
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='属性表' AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `p39_attribute`
--

INSERT INTO `p39_attribute` (`id`, `attr_name`, `attr_type`, `attr_option_values`, `type_id`) VALUES
(1, '颜色', '可选', '白色,黑色,绿色,紫色,蓝色,金色,银色,粉色,富士白', 1),
(3, '出版社', '唯一', '人民大学出版社,清华大学出版社,工业大学出版社', 3),
(4, '出厂日期', '唯一', '', 1),
(5, '操作系统', '可选', 'ios,android,windows', 1),
(6, '页数', '唯一', '', 3),
(7, '作者', '唯一', '', 3),
(8, '材质', '唯一', '', 2),
(9, '尺码', '可选', 'M,XL,XXL,XXXL,XXXXL', 2),
(10, '屏幕尺寸', '唯一', '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `p39_brand`
--

CREATE TABLE IF NOT EXISTS `p39_brand` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `brand_name` varchar(30) NOT NULL COMMENT '品牌名称',
  `site_url` varchar(150) NOT NULL DEFAULT '' COMMENT '官方网址',
  `logo` varchar(150) NOT NULL DEFAULT '' COMMENT '品牌Logo图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='品牌' AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `p39_brand`
--

INSERT INTO `p39_brand` (`id`, `brand_name`, `site_url`, `logo`) VALUES
(2, '苹果', '', 'Brand/2015-10-13/561cc92ba6c33.jpg'),
(3, '小米', '', 'Brand/2015-10-21/562742b307bf5.gif'),
(4, '三星', '', ''),
(5, '华为', '', ''),
(6, '酷派', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `p39_cart`
--

CREATE TABLE IF NOT EXISTS `p39_cart` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `goods_id` mediumint(8) unsigned NOT NULL COMMENT '商品Id',
  `goods_attr_id` varchar(150) NOT NULL DEFAULT '' COMMENT '商品属性Id',
  `goods_number` mediumint(8) unsigned NOT NULL COMMENT '购买的数量',
  `member_id` mediumint(8) unsigned NOT NULL COMMENT '会员Id',
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='购物车' AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `p39_cart`
--

INSERT INTO `p39_cart` (`id`, `goods_id`, `goods_attr_id`, `goods_number`, `member_id`) VALUES
(14, 7, '2,6', 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `p39_category`
--

CREATE TABLE IF NOT EXISTS `p39_category` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `cat_name` varchar(30) NOT NULL COMMENT '分类名称',
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类的Id,0:顶级分类',
  `is_floor` enum('是','否') NOT NULL DEFAULT '否' COMMENT '是否推荐楼层',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='分类' AUTO_INCREMENT=27 ;

--
-- 转存表中的数据 `p39_category`
--

INSERT INTO `p39_category` (`id`, `cat_name`, `parent_id`, `is_floor`) VALUES
(1, '家用电器', 0, '是'),
(2, '手机、数码、京东通信', 0, '是'),
(3, '电脑、办公', 0, '否'),
(4, '家居、家具、家装、厨具', 0, '否'),
(5, '男装、女装、内衣、珠宝', 0, '否'),
(6, '个护化妆', 0, '否'),
(8, '运动户外', 0, '否'),
(9, '汽车、汽车用品', 0, '否'),
(10, '母婴、玩具乐器', 0, '否'),
(11, '食品、酒类、生鲜、特产', 0, '否'),
(12, '营养保健', 0, '是'),
(13, '图书、音像、电子书', 0, '否'),
(14, '彩票、旅行、充值、票务', 0, '否'),
(16, '大家电', 1, '是'),
(17, '生活电器', 1, '否'),
(18, '厨房电器', 1, '否'),
(19, '个护健康', 1, '是'),
(20, '五金家装', 1, '是'),
(21, 'iphone', 2, '否'),
(22, '冰箱123', 16, '否'),
(23, '冰-1', 22, '否'),
(24, '冰02', 23, '否'),
(25, '手机配件', 2, '是'),
(26, '摄影摄像', 2, '是');

-- --------------------------------------------------------

--
-- 表的结构 `p39_comment`
--

CREATE TABLE IF NOT EXISTS `p39_comment` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `goods_id` mediumint(8) unsigned NOT NULL COMMENT '商品Id',
  `member_id` mediumint(8) unsigned NOT NULL COMMENT '会员Id',
  `content` varchar(200) NOT NULL COMMENT '内容',
  `addtime` datetime NOT NULL COMMENT '发表时间',
  `star` tinyint(3) unsigned NOT NULL COMMENT '分值',
  `click_count` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '有用的数字',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='评论' AUTO_INCREMENT=56 ;

--
-- 转存表中的数据 `p39_comment`
--

INSERT INTO `p39_comment` (`id`, `goods_id`, `member_id`, `content`, `addtime`, `star`, `click_count`) VALUES
(1, 4, 1, '测试', '2015-10-28 09:40:55', 5, 0),
(2, 4, 1, '测试', '2015-10-28 09:41:25', 4, 0),
(3, 4, 1, '测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试v', '2015-10-28 09:41:53', 4, 0),
(4, 4, 1, 'formformformformformform', '2015-10-28 09:43:26', 4, 0),
(5, 4, 1, 'fdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasf', '2015-10-28 09:43:40', 3, 0),
(6, 4, 1, '1233212', '2015-10-28 09:43:57', 5, 0),
(7, 4, 1, '测试一下！！', '2015-10-28 09:54:28', 4, 0),
(8, 4, 1, '再测试一下！！', '2015-10-28 09:55:22', 1, 0),
(9, 4, 1, '再评论五！！', '2015-10-28 09:56:25', 2, 0),
(10, 4, 1, '123', '2015-10-28 09:56:30', 4, 0),
(11, 4, 1, '53645', '2015-10-28 09:56:34', 3, 0),
(12, 4, 1, '6576', '2015-10-28 09:56:39', 1, 0),
(13, 4, 1, '45645', '2015-10-28 09:56:42', 3, 0),
(14, 4, 1, '65576565', '2015-10-28 09:56:45', 2, 0),
(15, 4, 1, '最新的评论！！@3', '2015-10-28 09:56:55', 4, 0),
(16, 4, 1, '最新的评论！@#1', '2015-10-28 09:57:07', 4, 0),
(17, 4, 1, '滚动起来！@#', '2015-10-28 09:59:18', 4, 0),
(18, 4, 1, '234432', '2015-10-28 09:59:24', 4, 0),
(19, 4, 1, '435554', '2015-10-28 09:59:27', 5, 0),
(20, 4, 1, '454545', '2015-10-28 09:59:31', 1, 0),
(21, 4, 1, '7687', '2015-10-28 09:59:35', 5, 0),
(22, 4, 1, '454565', '2015-10-28 09:59:41', 3, 0),
(23, 4, 1, '76687687', '2015-10-28 09:59:45', 2, 0),
(24, 4, 1, '滚动吧！', '2015-10-28 09:59:54', 5, 0),
(25, 4, 1, '！@#QEWQEWfdsa', '2015-10-28 10:00:08', 1, 0),
(26, 4, 1, '厅', '2015-10-28 10:00:46', 5, 0),
(27, 4, 1, '1231213', '2015-10-28 10:03:24', 5, 0),
(28, 4, 1, '342432', '2015-10-28 10:03:29', 5, 0),
(29, 4, 1, '4345', '2015-10-28 10:03:35', 5, 0),
(30, 4, 1, '56545', '2015-10-28 10:03:40', 5, 0),
(31, 4, 1, '砌墙左', '2015-10-28 10:03:49', 5, 0),
(32, 4, 1, '43我用脾', '2015-10-28 10:04:01', 3, 0),
(33, 4, 1, 'sfdsafdas', '2015-10-28 10:04:10', 3, 0),
(34, 4, 1, 'fdfdadf', '2015-10-28 10:04:32', 4, 0),
(35, 4, 1, 'fdafdas', '2015-10-28 10:04:50', 5, 0),
(36, 4, 1, '4434343', '2015-10-28 10:04:54', 2, 0),
(37, 4, 1, '454545', '2015-10-28 10:05:00', 1, 0),
(38, 4, 1, '434343', '2015-10-28 10:05:40', 5, 0),
(39, 4, 1, '454545', '2015-10-28 10:05:44', 3, 0),
(40, 4, 1, '&lt;script&gt;alert(123132);&lt;/script&gt;', '2015-10-28 10:05:59', 5, 0),
(41, 4, 1, '&lt;script&gt;alert(123132);&lt;/script&gt;', '2015-10-28 10:06:30', 5, 0),
(42, 4, 1, '&lt;script&gt;alert(123132);&lt;/script&gt;', '2015-10-28 10:06:38', 3, 0),
(43, 4, 1, 'fdsfdsaafds', '2015-10-28 10:53:14', 5, 0),
(44, 4, 1, 'fafdadfs', '2015-10-28 10:53:38', 5, 0),
(45, 4, 1, 'fdsfdsa', '2015-10-28 10:53:58', 5, 0),
(46, 4, 1, 'fdasfd', '2015-10-28 11:04:41', 5, 0),
(47, 4, 1, '2132321', '2015-10-28 11:17:07', 5, 0),
(48, 4, 1, '印象数据的测试！！！', '2015-10-28 15:00:44', 3, 0),
(49, 4, 1, '再测试！！1·', '2015-10-28 15:02:17', 5, 0),
(50, 4, 1, '测试一下！！', '2015-10-28 15:10:55', 2, 0),
(51, 4, 1, '测试', '2015-10-28 15:11:19', 5, 0),
(52, 4, 1, '大棒 324324', '2015-10-28 15:12:49', 5, 0),
(53, 4, 1, 'dfsaafds', '2015-10-28 15:38:19', 5, 0),
(54, 4, 1, 'fdsafdsadsa', '2015-10-28 15:38:51', 5, 0),
(55, 4, 1, 'fdfdsa', '2015-10-28 15:44:26', 5, 0);

-- --------------------------------------------------------

--
-- 表的结构 `p39_comment_reply`
--

CREATE TABLE IF NOT EXISTS `p39_comment_reply` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `comment_id` mediumint(8) unsigned NOT NULL COMMENT '评论Id',
  `member_id` mediumint(8) unsigned NOT NULL COMMENT '会员Id',
  `content` varchar(200) NOT NULL COMMENT '内容',
  `addtime` datetime NOT NULL COMMENT '发表时间',
  PRIMARY KEY (`id`),
  KEY `comment_id` (`comment_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='评论回复' AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `p39_comment_reply`
--

INSERT INTO `p39_comment_reply` (`id`, `comment_id`, `member_id`, `content`, `addtime`) VALUES
(1, 54, 1, '回复！！', '2015-10-28 16:19:54'),
(2, 54, 1, '回复！！！', '2015-10-28 16:22:37'),
(3, 54, 1, '回复一下1！！', '2015-10-28 16:33:59'),
(4, 54, 1, '再回复现代战争！！！', '2015-10-28 16:34:09'),
(5, 54, 1, '苷械  苷械  苷械  苷械  苷械  苷械', '2015-10-28 16:34:16'),
(6, 54, 1, '口口口口口口口口中', '2015-10-28 16:34:44'),
(7, 52, 1, '发表个回复试试', '2015-10-28 16:43:23'),
(8, 53, 1, 'yuyuyuyuyu', '2015-10-28 16:43:58'),
(9, 51, 1, 'ohjgfsdf', '2015-10-28 16:44:16');

-- --------------------------------------------------------

--
-- 表的结构 `p39_goods`
--

CREATE TABLE IF NOT EXISTS `p39_goods` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `goods_name` varchar(150) NOT NULL COMMENT '商品名称',
  `market_price` decimal(10,2) NOT NULL COMMENT '市场价格',
  `shop_price` decimal(10,2) NOT NULL COMMENT '本店价格',
  `goods_desc` longtext COMMENT '商品描述',
  `is_on_sale` enum('是','否') NOT NULL DEFAULT '是' COMMENT '是否上架',
  `is_delete` enum('是','否') NOT NULL DEFAULT '否' COMMENT '是否放到回收站',
  `addtime` datetime NOT NULL COMMENT '添加时间',
  `logo` varchar(150) NOT NULL DEFAULT '' COMMENT '原图',
  `sm_logo` varchar(150) NOT NULL DEFAULT '' COMMENT '小图',
  `mid_logo` varchar(150) NOT NULL DEFAULT '' COMMENT '中图',
  `big_logo` varchar(150) NOT NULL DEFAULT '' COMMENT '大图',
  `mbig_logo` varchar(150) NOT NULL DEFAULT '' COMMENT '更大图',
  `brand_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '品牌id',
  `cat_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '主分类Id',
  `type_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '类型Id',
  `promote_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '促销价格',
  `promote_start_date` datetime NOT NULL COMMENT '促销开始时间',
  `promote_end_date` datetime NOT NULL COMMENT '促销结束时间',
  `is_new` enum('是','否') NOT NULL DEFAULT '否' COMMENT '是否新品',
  `is_hot` enum('是','否') NOT NULL DEFAULT '否' COMMENT '是否热卖',
  `is_best` enum('是','否') NOT NULL DEFAULT '否' COMMENT '是否精品',
  `sort_num` tinyint(3) unsigned NOT NULL DEFAULT '100' COMMENT '排序的数字',
  `is_floor` enum('是','否') NOT NULL DEFAULT '否' COMMENT '是否推荐楼层',
  PRIMARY KEY (`id`),
  KEY `shop_price` (`shop_price`),
  KEY `addtime` (`addtime`),
  KEY `brand_id` (`brand_id`),
  KEY `is_on_sale` (`is_on_sale`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='商品' AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `p39_goods`
--

INSERT INTO `p39_goods` (`id`, `goods_name`, `market_price`, `shop_price`, `goods_desc`, `is_on_sale`, `is_delete`, `addtime`, `logo`, `sm_logo`, `mid_logo`, `big_logo`, `mbig_logo`, `brand_id`, `cat_id`, `type_id`, `promote_price`, `promote_start_date`, `promote_end_date`, `is_new`, `is_hot`, `is_best`, `sort_num`, `is_floor`) VALUES
(2, '新的联想商品', '123.00', '5.00', '', '是', '否', '2015-10-15 14:48:03', 'Goods/2015-10-16/56204695240b5.jpg', 'Goods/2015-10-16/thumb_3_56204695240b5.jpg', 'Goods/2015-10-16/thumb_2_56204695240b5.jpg', 'Goods/2015-10-16/thumb_1_56204695240b5.jpg', 'Goods/2015-10-16/thumb_0_56204695240b5.jpg', 5, 21, 0, '0.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '否', '否', '否', 100, '否'),
(3, '测试相册', '111.00', '1.00', '', '是', '否', '2015-10-15 16:05:05', 'Goods/2015-10-16/5620462741c29.jpg', 'Goods/2015-10-16/thumb_3_5620462741c29.jpg', 'Goods/2015-10-16/thumb_2_5620462741c29.jpg', 'Goods/2015-10-16/thumb_1_5620462741c29.jpg', 'Goods/2015-10-16/thumb_0_5620462741c29.jpg', 2, 24, 0, '0.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '否', '否', '是', 100, '是'),
(4, '新的联想商品', '444.00', '333.00', '', '是', '否', '2015-10-16 11:02:08', 'Goods/2015-10-16/562068ae6c614.jpg', 'Goods/2015-10-16/thumb_3_562068ae6c614.jpg', 'Goods/2015-10-16/thumb_2_562068ae6c614.jpg', 'Goods/2015-10-16/thumb_1_562068ae6c614.jpg', 'Goods/2015-10-16/thumb_0_562068ae6c614.jpg', 3, 16, 0, '0.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '是', '是', '是', 105, '是'),
(6, '555555555555555555', '0.00', '50.00', '', '是', '否', '2015-10-16 14:56:41', 'Goods/2015-10-19/56243bf2e5d0a.jpg', 'Goods/2015-10-19/thumb_3_56243bf2e5d0a.jpg', 'Goods/2015-10-19/thumb_2_56243bf2e5d0a.jpg', 'Goods/2015-10-19/thumb_1_56243bf2e5d0a.jpg', 'Goods/2015-10-19/thumb_0_56243bf2e5d0a.jpg', 0, 16, 1, '0.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '否', '否', '是', 120, '否'),
(7, '商品属性测试', '113.00', '111.00', '<p><br /></p><p><span style="color:#ff0000;">红色</span>的字段</p><p>狮子：</p><p><img src="http://www.39.com/Public/umeditor1_2_2-utf8-php/php/upload/20151022/14454776042247.jpg" alt="14454776042247.jpg" /></p><p>蜘蛛侠：</p><p><img src="http://www.39.com/Public/umeditor1_2_2-utf8-php/php/upload/20151022/14454776198581.gif" alt="14454776198581.gif" /></p>', '是', '否', '2015-10-18 14:48:28', 'Goods/2015-10-19/56243bebac574.jpg', 'Goods/2015-10-19/thumb_3_56243bebac574.jpg', 'Goods/2015-10-19/thumb_2_56243bebac574.jpg', 'Goods/2015-10-19/thumb_1_56243bebac574.jpg', 'Goods/2015-10-19/thumb_0_56243bebac574.jpg', 0, 16, 1, '101.00', '2015-10-21 00:01:00', '2015-10-23 00:00:00', '否', '否', '是', 110, '是'),
(8, '新的联想商品', '0.00', '1200.00', '', '是', '否', '2015-10-27 10:09:45', '', '', '', '', '', 0, 22, 0, '0.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '否', '否', '否', 100, '否'),
(9, '新的联想商品', '0.00', '2200.00', '', '是', '否', '2015-10-27 10:10:08', '', '', '', '', '', 0, 22, 0, '0.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '否', '否', '否', 100, '否'),
(10, '321321=-213321321213', '0.00', '3343.00', '', '是', '否', '2015-10-27 10:12:48', '', '', '', '', '', 5, 16, 1, '0.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '否', '否', '否', 100, '否'),
(11, '新的联想商品', '0.00', '6.00', '', '是', '否', '2015-10-27 10:13:08', '', '', '', '', '', 0, 23, 1, '0.00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '否', '否', '否', 100, '否');

-- --------------------------------------------------------

--
-- 表的结构 `p39_goods_attr`
--

CREATE TABLE IF NOT EXISTS `p39_goods_attr` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `attr_value` varchar(150) NOT NULL DEFAULT '' COMMENT '属性值',
  `attr_id` mediumint(8) unsigned NOT NULL COMMENT '属性Id',
  `goods_id` mediumint(8) unsigned NOT NULL COMMENT '商品Id',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`),
  KEY `attr_id` (`attr_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='商品属性' AUTO_INCREMENT=22 ;

--
-- 转存表中的数据 `p39_goods_attr`
--

INSERT INTO `p39_goods_attr` (`id`, `attr_value`, `attr_id`, `goods_id`) VALUES
(1, '白色', 1, 7),
(2, '黑色', 1, 7),
(3, '绿色', 1, 7),
(4, '2015-10-01', 4, 7),
(5, 'ios', 5, 7),
(6, 'android', 5, 7),
(7, '14寸', 10, 7),
(8, '黑色', 1, 10),
(9, '', 4, 10),
(10, 'android', 5, 10),
(11, '', 10, 10),
(12, '银色', 1, 6),
(13, '粉色', 1, 6),
(14, '2014-10-1', 4, 6),
(15, 'ios', 5, 6),
(16, 'android', 5, 6),
(17, '6.6寸', 10, 6),
(18, '白色', 1, 11),
(19, '2014-10-1', 4, 11),
(20, 'ios', 5, 11),
(21, '12寸', 10, 11);

-- --------------------------------------------------------

--
-- 表的结构 `p39_goods_cat`
--

CREATE TABLE IF NOT EXISTS `p39_goods_cat` (
  `cat_id` mediumint(8) unsigned NOT NULL COMMENT '分类id',
  `goods_id` mediumint(8) unsigned NOT NULL COMMENT '商品Id',
  KEY `goods_id` (`goods_id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品扩展分类';

--
-- 转存表中的数据 `p39_goods_cat`
--

INSERT INTO `p39_goods_cat` (`cat_id`, `goods_id`) VALUES
(16, 4),
(17, 4),
(20, 4),
(25, 3),
(4, 6),
(19, 6),
(6, 6);

-- --------------------------------------------------------

--
-- 表的结构 `p39_goods_number`
--

CREATE TABLE IF NOT EXISTS `p39_goods_number` (
  `goods_id` mediumint(8) unsigned NOT NULL COMMENT '商品Id',
  `goods_number` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '库存量',
  `goods_attr_id` varchar(150) NOT NULL COMMENT '商品属性表的ID,如果有多个，就用程序拼成字符串存到这个字段中',
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='库存量';

--
-- 转存表中的数据 `p39_goods_number`
--

INSERT INTO `p39_goods_number` (`goods_id`, `goods_number`, `goods_attr_id`) VALUES
(7, 0, '1,5'),
(7, 3109, '2,5'),
(7, 439, '3,5'),
(7, 665, '1,6'),
(7, 415, '2,6'),
(7, 119, '3,6'),
(3, 95, ''),
(4, 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `p39_goods_pic`
--

CREATE TABLE IF NOT EXISTS `p39_goods_pic` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `pic` varchar(150) NOT NULL COMMENT '原图',
  `sm_pic` varchar(150) NOT NULL COMMENT '小图',
  `mid_pic` varchar(150) NOT NULL COMMENT '中图',
  `big_pic` varchar(150) NOT NULL COMMENT '大图',
  `goods_id` mediumint(8) unsigned NOT NULL COMMENT '商品Id',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='商品相册' AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `p39_goods_pic`
--

INSERT INTO `p39_goods_pic` (`id`, `pic`, `sm_pic`, `mid_pic`, `big_pic`, `goods_id`) VALUES
(2, 'Goods/2015-10-15/561f5e4374c7d.jpg', 'Goods/2015-10-15/thumb_2_561f5e4374c7d.jpg', 'Goods/2015-10-15/thumb_1_561f5e4374c7d.jpg', 'Goods/2015-10-15/thumb_0_561f5e4374c7d.jpg', 3),
(4, 'Goods/2015-10-15/561f6f5e19948.jpg', 'Goods/2015-10-15/thumb_2_561f6f5e19948.jpg', 'Goods/2015-10-15/thumb_1_561f6f5e19948.jpg', 'Goods/2015-10-15/thumb_0_561f6f5e19948.jpg', 3),
(5, 'Goods/2015-10-15/561f6f6018a1a.jpg', 'Goods/2015-10-15/thumb_2_561f6f6018a1a.jpg', 'Goods/2015-10-15/thumb_1_561f6f6018a1a.jpg', 'Goods/2015-10-15/thumb_0_561f6f6018a1a.jpg', 3),
(6, 'Goods/2015-10-15/561f6f612ab67.jpg', 'Goods/2015-10-15/thumb_2_561f6f612ab67.jpg', 'Goods/2015-10-15/thumb_1_561f6f612ab67.jpg', 'Goods/2015-10-15/thumb_0_561f6f612ab67.jpg', 3),
(7, 'Goods/2015-10-15/561f6f7151c1c.gif', 'Goods/2015-10-15/thumb_2_561f6f7151c1c.gif', 'Goods/2015-10-15/thumb_1_561f6f7151c1c.gif', 'Goods/2015-10-15/thumb_0_561f6f7151c1c.gif', 3),
(8, 'Goods/2015-10-16/562045b377902.jpg', 'Goods/2015-10-16/thumb_2_562045b377902.jpg', 'Goods/2015-10-16/thumb_1_562045b377902.jpg', 'Goods/2015-10-16/thumb_0_562045b377902.jpg', 3),
(9, 'Goods/2015-10-16/56204632606ed.jpg', 'Goods/2015-10-16/thumb_2_56204632606ed.jpg', 'Goods/2015-10-16/thumb_1_56204632606ed.jpg', 'Goods/2015-10-16/thumb_0_56204632606ed.jpg', 3),
(10, 'Goods/2015-10-16/56204632b13f8.jpg', 'Goods/2015-10-16/thumb_2_56204632b13f8.jpg', 'Goods/2015-10-16/thumb_1_56204632b13f8.jpg', 'Goods/2015-10-16/thumb_0_56204632b13f8.jpg', 3),
(11, 'Goods/2015-10-19/56245be9ae66d.jpg', 'Goods/2015-10-19/thumb_2_56245be9ae66d.jpg', 'Goods/2015-10-19/thumb_1_56245be9ae66d.jpg', 'Goods/2015-10-19/thumb_0_56245be9ae66d.jpg', 7),
(12, 'Goods/2015-10-19/56245bea13dda.jpg', 'Goods/2015-10-19/thumb_2_56245bea13dda.jpg', 'Goods/2015-10-19/thumb_1_56245bea13dda.jpg', 'Goods/2015-10-19/thumb_0_56245bea13dda.jpg', 7),
(13, 'Goods/2015-10-19/56245bea6ac8f.jpg', 'Goods/2015-10-19/thumb_2_56245bea6ac8f.jpg', 'Goods/2015-10-19/thumb_1_56245bea6ac8f.jpg', 'Goods/2015-10-19/thumb_0_56245bea6ac8f.jpg', 7),
(14, 'Goods/2015-10-19/56245beab2910.jpg', 'Goods/2015-10-19/thumb_2_56245beab2910.jpg', 'Goods/2015-10-19/thumb_1_56245beab2910.jpg', 'Goods/2015-10-19/thumb_0_56245beab2910.jpg', 7);

-- --------------------------------------------------------

--
-- 表的结构 `p39_member`
--

CREATE TABLE IF NOT EXISTS `p39_member` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `username` varchar(30) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `face` varchar(150) NOT NULL DEFAULT '' COMMENT '头像',
  `jifen` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '积分',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='会员' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `p39_member`
--

INSERT INTO `p39_member` (`id`, `username`, `password`, `face`, `jifen`) VALUES
(1, 'php39', '9724f7a7f7887b4388c15d2ff86fb784', '', 15000);

-- --------------------------------------------------------

--
-- 表的结构 `p39_member_level`
--

CREATE TABLE IF NOT EXISTS `p39_member_level` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `level_name` varchar(30) NOT NULL COMMENT '级别名称',
  `jifen_bottom` mediumint(8) unsigned NOT NULL COMMENT '积分下限',
  `jifen_top` mediumint(8) unsigned NOT NULL COMMENT '积分上限',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='会员级别' AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `p39_member_level`
--

INSERT INTO `p39_member_level` (`id`, `level_name`, `jifen_bottom`, `jifen_top`) VALUES
(1, '注册会员', 0, 5000),
(2, '初级会员', 5001, 10000),
(3, '高级会员', 10001, 20000),
(4, 'VIP', 20001, 16777215);

-- --------------------------------------------------------

--
-- 表的结构 `p39_member_price`
--

CREATE TABLE IF NOT EXISTS `p39_member_price` (
  `price` decimal(10,2) NOT NULL COMMENT '会员价格',
  `level_id` mediumint(8) unsigned NOT NULL COMMENT '级别Id',
  `goods_id` mediumint(8) unsigned NOT NULL COMMENT '商品Id',
  KEY `level_id` (`level_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员价格';

--
-- 转存表中的数据 `p39_member_price`
--

INSERT INTO `p39_member_price` (`price`, `level_id`, `goods_id`) VALUES
('105.00', 2, 7),
('95.00', 3, 7),
('90.00', 4, 7),
('333.00', 2, 2),
('444.00', 4, 2);

-- --------------------------------------------------------

--
-- 表的结构 `p39_order`
--

CREATE TABLE IF NOT EXISTS `p39_order` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `member_id` mediumint(8) unsigned NOT NULL COMMENT '会员Id',
  `addtime` int(10) unsigned NOT NULL COMMENT '下单时间',
  `pay_status` enum('是','否') NOT NULL DEFAULT '否' COMMENT '支付状态',
  `pay_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '支付时间',
  `total_price` decimal(10,2) NOT NULL COMMENT '定单总价',
  `shr_name` varchar(30) NOT NULL COMMENT '收货人姓名',
  `shr_tel` varchar(30) NOT NULL COMMENT '收货人电话',
  `shr_province` varchar(30) NOT NULL COMMENT '收货人省',
  `shr_city` varchar(30) NOT NULL COMMENT '收货人城市',
  `shr_area` varchar(30) NOT NULL COMMENT '收货人地区',
  `shr_address` varchar(30) NOT NULL COMMENT '收货人详细地址',
  `post_status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发货状态,0:未发货,1:已发货2:已收到货',
  `post_number` varchar(30) NOT NULL DEFAULT '' COMMENT '快递号',
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`),
  KEY `addtime` (`addtime`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='定单基本信息' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `p39_order`
--

INSERT INTO `p39_order` (`id`, `member_id`, `addtime`, `pay_status`, `pay_time`, `total_price`, `shr_name`, `shr_tel`, `shr_province`, `shr_city`, `shr_area`, `shr_address`, `post_status`, `post_number`) VALUES
(2, 1, 1445655657, '是', 0, '3359.00', '吴英雷', '13344441111', '上海', '东城区', '西三旗', '西三旗', 0, ''),
(3, 1, 1445655771, '是', 0, '333.00', '吴英雷', '13344441111', '北京', '东城区', '三环以内', '西三旗', 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `p39_order_goods`
--

CREATE TABLE IF NOT EXISTS `p39_order_goods` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `order_id` mediumint(8) unsigned NOT NULL COMMENT '定单Id',
  `goods_id` mediumint(8) unsigned NOT NULL COMMENT '商品Id',
  `goods_attr_id` varchar(150) NOT NULL DEFAULT '' COMMENT '商品属性id',
  `goods_number` mediumint(8) unsigned NOT NULL COMMENT '购买的数量',
  `price` decimal(10,2) NOT NULL COMMENT '购买的价格',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='定单商品表' AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `p39_order_goods`
--

INSERT INTO `p39_order_goods` (`id`, `order_id`, `goods_id`, `goods_attr_id`, `goods_number`, `price`) VALUES
(2, 2, 7, '2,6', 7, '95.00'),
(3, 2, 7, '3,5', 4, '95.00'),
(4, 2, 7, '1,5', 4, '95.00'),
(5, 2, 7, '3,6', 4, '95.00'),
(6, 2, 3, '', 4, '222.00'),
(7, 2, 4, '', 2, '333.00'),
(8, 3, 4, '', 1, '333.00');

-- --------------------------------------------------------

--
-- 表的结构 `p39_privilege`
--

CREATE TABLE IF NOT EXISTS `p39_privilege` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `pri_name` varchar(30) NOT NULL COMMENT '权限名称',
  `module_name` varchar(30) NOT NULL DEFAULT '' COMMENT '模块名称',
  `controller_name` varchar(30) NOT NULL DEFAULT '' COMMENT '控制器名称',
  `action_name` varchar(30) NOT NULL DEFAULT '' COMMENT '方法名称',
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '上级权限Id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='权限' AUTO_INCREMENT=39 ;

--
-- 转存表中的数据 `p39_privilege`
--

INSERT INTO `p39_privilege` (`id`, `pri_name`, `module_name`, `controller_name`, `action_name`, `parent_id`) VALUES
(1, '商品模块', '', '', '', 0),
(2, '商品列表', 'Admin', 'Goods', 'lst', 1),
(3, '添加商品', 'Admin', 'Goods', 'add', 2),
(4, '修改商品', 'Admin', 'Goods', 'edit', 2),
(5, '删除商品', 'Admin', 'Goods', 'delete', 2),
(6, '分类列表', 'Admin', 'Category', 'lst', 1),
(7, '添加分类', 'Admin', 'Category', 'add', 6),
(8, '修改分类', 'Admin', 'Category', 'edit', 6),
(9, '删除分类', 'Admin', 'Category', 'delete', 6),
(10, 'RBAC', '', '', '', 0),
(11, '权限列表', 'Admin', 'Privilege', 'lst', 10),
(12, '添加权限', 'Privilege', 'Admin', 'add', 11),
(13, '修改权限', 'Admin', 'Privilege', 'edit', 11),
(14, '删除权限', 'Admin', 'Privilege', 'delete', 11),
(15, '角色列表', 'Admin', 'Role', 'lst', 10),
(16, '添加角色', 'Admin', 'Role', 'add', 15),
(17, '修改角色', 'Admin', 'Role', 'edit', 15),
(18, '删除角色', 'Admin', 'Role', 'delete', 15),
(19, '管理员列表', 'Admin', 'Admin', 'lst', 10),
(20, '添加管理员', 'Admin', 'Admin', 'add', 19),
(21, '修改管理员', 'Admin', 'Admin', 'edit', 19),
(22, '删除管理员', 'Admin', 'Admin', 'delete', 19),
(23, '类型列表', 'Admin', 'Type', 'lst', 1),
(24, '添加类型', 'Admin', 'Type', 'add', 23),
(25, '修改类型', 'Admin', 'Type', 'edit', 23),
(26, '删除类型', 'Admin', 'Type', 'delete', 23),
(27, '属性列表', 'Admin', 'Attribute', 'lst', 23),
(28, '添加属性', 'Admin', 'Attribute', 'add', 27),
(29, '修改属性', 'Admin', 'Attribute', 'edit', 27),
(30, '删除属性', 'Admin', 'Attribute', 'delete', 27),
(31, 'ajax删除商品属性', 'Admin', 'Goods', 'ajaxDelGoodsAttr', 4),
(32, 'ajax删除商品相册图片', 'Admin', 'Goods', 'ajaxDelImage', 4),
(33, '会员管理', '', '', '', 0),
(34, '会员级别列表', 'Admin', 'MemberLevel', 'lst', 33),
(35, '添加会员级别', 'Admin', 'MemberLevel', 'add', 34),
(36, '修改会员级别', 'Admin', 'MemberLevel', 'edit', 34),
(37, '删除会员级别', 'Admin', 'MemberLevel', 'delete', 34),
(38, '品牌列表', 'Admin', 'Brand', 'lst', 1);

-- --------------------------------------------------------

--
-- 表的结构 `p39_role`
--

CREATE TABLE IF NOT EXISTS `p39_role` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='角色' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `p39_role`
--

INSERT INTO `p39_role` (`id`, `role_name`) VALUES
(1, '商品模块管理员'),
(2, 'RBAC管理员');

-- --------------------------------------------------------

--
-- 表的结构 `p39_role_pri`
--

CREATE TABLE IF NOT EXISTS `p39_role_pri` (
  `pri_id` mediumint(8) unsigned NOT NULL COMMENT '权限id',
  `role_id` mediumint(8) unsigned NOT NULL COMMENT '角色id',
  KEY `pri_id` (`pri_id`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色权限';

--
-- 转存表中的数据 `p39_role_pri`
--

INSERT INTO `p39_role_pri` (`pri_id`, `role_id`) VALUES
(10, 2),
(11, 2),
(12, 2),
(13, 2),
(14, 2),
(15, 2),
(16, 2),
(17, 2),
(18, 2),
(19, 2),
(20, 2),
(21, 2),
(22, 2),
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(31, 1),
(32, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(38, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1);

-- --------------------------------------------------------

--
-- 表的结构 `p39_type`
--

CREATE TABLE IF NOT EXISTS `p39_type` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `type_name` varchar(30) NOT NULL COMMENT '类型名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='类型' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `p39_type`
--

INSERT INTO `p39_type` (`id`, `type_name`) VALUES
(1, '手机'),
(2, '服装'),
(3, '书');

-- --------------------------------------------------------

--
-- 表的结构 `p39_yinxiang`
--

CREATE TABLE IF NOT EXISTS `p39_yinxiang` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `goods_id` mediumint(8) unsigned NOT NULL COMMENT '商品Id',
  `yx_name` varchar(30) NOT NULL COMMENT '印象名称',
  `yx_count` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '印象的次数',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='印象' AUTO_INCREMENT=30 ;

--
-- 转存表中的数据 `p39_yinxiang`
--

INSERT INTO `p39_yinxiang` (`id`, `goods_id`, `yx_name`, `yx_count`) VALUES
(1, 4, '屏幕大', 1),
(2, 4, '性能好', 4),
(3, 4, '外观漂亮', 1),
(4, 4, '便宜', 3),
(5, 4, '颜色正宗', 1),
(6, 4, '大棒1', 1),
(7, 4, '大棒2', 1),
(8, 4, '大棒3', 1),
(9, 4, '大棒4', 1),
(10, 4, '大棒5', 1),
(11, 4, '大棒6', 1),
(12, 4, '大棒76', 1),
(13, 4, '8', 1),
(14, 4, '9', 1),
(15, 4, '43', 4),
(16, 4, '4', 1),
(17, 4, '3', 2),
(18, 4, '32', 1),
(19, 4, '5', 1),
(20, 4, '6', 1),
(21, 4, '7', 1),
(22, 4, '76', 1),
(23, 4, '一', 1),
(24, 4, '于', 1),
(25, 4, '城', 1),
(26, 4, 're', 5),
(27, 4, 'er', 1),
(28, 4, 're43', 1),
(29, 4, '45', 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
