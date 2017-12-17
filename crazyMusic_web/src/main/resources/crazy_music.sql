/*
Navicat MySQL Data Transfer

Source Server         : crazy_music
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : crazy_music

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-12-04 23:15:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `id` varchar(50) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL COMMENT 'banner图片',
  `url` varchar(255) DEFAULT NULL COMMENT '跳转地址',
  `skip_type` tinyint(4) DEFAULT NULL COMMENT '跳转方式 1 app内部跳转  2 app外部跳转',
  `inside_type` tinyint(4) DEFAULT NULL COMMENT '内部跳转类别  1 获取优惠券页面跳转',
  `outside_type` tinyint(4) DEFAULT NULL COMMENT '外部跳转类别 1 网页跳转  2 外链APP跳转',
  `create_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `effective_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '生效时间',
  `lose_effective_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '失效时间',
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES ('4C56031ED49A44E8AE13030F1CB5B521', 'http://crazymusic-bucket.oss-cn-shenzhen.aliyuncs.com/f10533902.png', 'www.baidu.com1', '2', '-1', '1', '2017-12-04 23:14:02', '2017-12-04 00:00:00', '2017-12-04 22:09:50', 'ceshi');

-- ----------------------------
-- Table structure for card
-- ----------------------------
DROP TABLE IF EXISTS `card`;
CREATE TABLE `card` (
  `id` varchar(50) DEFAULT NULL,
  `product_id` varchar(50) DEFAULT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `number` int(11) DEFAULT '1',
  `product_attr_ids` varchar(50) DEFAULT NULL,
  `state` int(11) DEFAULT '1' COMMENT '1 未过期  0 过期',
  `create_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `product_img` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `payment` decimal(10,0) DEFAULT NULL COMMENT '购物车金额'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of card
-- ----------------------------

-- ----------------------------
-- Table structure for community
-- ----------------------------
DROP TABLE IF EXISTS `community`;
CREATE TABLE `community` (
  `id` varchar(50) NOT NULL,
  `content` varchar(2000) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `community_status` tinyint(4) DEFAULT '0' COMMENT '0 待审核 1 审核通过 -1 审核失败',
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `perfect_count` int(10) DEFAULT '0' COMMENT '赞',
  `update_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `evaluate_count` int(10) DEFAULT '0' COMMENT '评论条数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of community
-- ----------------------------
INSERT INTO `community` VALUES ('4AD7B5F754BE3F0FEE0B', '123', '1', '2017-11-25 21:50:49', '1', 'asddas', '1', '2017-11-25 21:50:49', '23');
INSERT INTO `community` VALUES ('4E819E833AE216922E5E', '1231', '1', '2017-11-26 16:51:34', '0', 'asddas', '0', '2017-11-26 16:51:34', '12');

-- ----------------------------
-- Table structure for community_evaluate
-- ----------------------------
DROP TABLE IF EXISTS `community_evaluate`;
CREATE TABLE `community_evaluate` (
  `id` varchar(50) DEFAULT NULL,
  `user_id` varchar(50) DEFAULT NULL COMMENT '用户ID',
  `community_id` varchar(50) DEFAULT NULL COMMENT 't帖子ID',
  `content` varchar(2000) DEFAULT NULL COMMENT '评论内容',
  `parent_id` varchar(50) DEFAULT NULL COMMENT '上级评论ID',
  `create_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of community_evaluate
-- ----------------------------
INSERT INTO `community_evaluate` VALUES ('4BD6A0B5D890656016DE', '1', '4E819E833AE216922E5E', 'pinglun2', '', '2017-11-26 10:25:54');
INSERT INTO `community_evaluate` VALUES ('42BD9DC042A9307FCA11', '1', '4E819E833AE216922E5E', 'pinglun3', '', '2017-11-26 10:28:08');
INSERT INTO `community_evaluate` VALUES ('4437A5EF8C7934A4F838', '1', '4E819E833AE216922E5E', 'pinglun4', '', '2017-11-26 10:26:03');
INSERT INTO `community_evaluate` VALUES ('4CBBB0993E46CF79091F', '1', '4E819E833AE216922E5E', 'pinglun5', '', '2017-11-26 10:26:06');
INSERT INTO `community_evaluate` VALUES ('473CB3B2A6193AFD32AC', '1', '4E819E833AE216922E5E', 'pinglun6', '', '2017-11-26 10:26:10');
INSERT INTO `community_evaluate` VALUES ('4A258EC89A59BCDD2AA0', '1', '4E819E833AE216922E5E', 'pinglun2-1', '4BD6A0B5D890656016DE', '2017-11-26 10:27:51');
INSERT INTO `community_evaluate` VALUES ('48B1B5907A1A6643F614', '1', '4E819E833AE216922E5E', 'pinglun2-2', '4BD6A0B5D890656016DE', '2017-11-26 10:27:57');
INSERT INTO `community_evaluate` VALUES ('4ABEBF2F18E8651E5169', '1', '4E819E833AE216922E5E', 'pinglun3-1', '42BD9DC042A9307FCA11', '2017-11-26 10:28:20');
INSERT INTO `community_evaluate` VALUES ('4DB8BD946BB8127C2D82', '1', '4E819E833AE216922E5E', 'pinglun4-1', '4437A5EF8C7934A4F838', '2017-11-26 10:28:31');
INSERT INTO `community_evaluate` VALUES ('4534BF801AB5E73DE3DE', '1', '4E819E833AE216922E5E', 'pinglun2-1-1', '4A258EC89A59BCDD2AA0', '2017-11-26 10:28:41');
INSERT INTO `community_evaluate` VALUES ('428089F84BD8B0AE26B5', '1', '4E819E833AE216922E5E', 'pinglun2-1-2', '4A258EC89A59BCDD2AA0', '2017-11-26 10:28:49');
INSERT INTO `community_evaluate` VALUES ('479D8B8D374A1209FEB4', '1', '4E819E833AE216922E5E', 'pinglun2-1-1-1', '4534BF801AB5E73DE3DE', '2017-11-26 10:29:02');

-- ----------------------------
-- Table structure for community_file
-- ----------------------------
DROP TABLE IF EXISTS `community_file`;
CREATE TABLE `community_file` (
  `id` varchar(50) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `sort` int(10) DEFAULT NULL COMMENT '排序',
  `create_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `community_id` varchar(50) DEFAULT NULL COMMENT '帖子ID',
  `file_type` int(1) DEFAULT '1' COMMENT '1 图片',
  `evaluate_id` varchar(50) DEFAULT NULL COMMENT '评论ID',
  `resource_type` tinyint(1) DEFAULT '1' COMMENT '1 为帖子图片 2为评论图片'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of community_file
-- ----------------------------
INSERT INTO `community_file` VALUES ('49159549E7E2EC89198D', 'http://crazymusic-bucket.oss-cn-shenzhen.aliyuncs.com/cb82d5761.png', '1', '2017-11-26 16:11:15', '4E819E833AE216922E5E', '1', null, '1');
INSERT INTO `community_file` VALUES ('4CD99327E2FDA6012F3C', 'http://crazymusic-bucket.oss-cn-shenzhen.aliyuncs.com/cb82d5761.png', '2', '2017-11-26 16:11:15', '4E819E833AE216922E5E', '1', null, '1');
INSERT INTO `community_file` VALUES ('4676A6985BB4B8EA7FA5', 'http://crazymusic-bucket.oss-cn-shenzhen.aliyuncs.com/cb82d5761.png', '3', '2017-11-26 16:11:15', '4E819E833AE216922E5E', '1', null, '1');
INSERT INTO `community_file` VALUES ('4EF684567BEA4617C638', 'http://crazymusic-bucket.oss-cn-shenzhen.aliyuncs.com/cb82d5761.png', '4', '2017-11-26 16:11:15', '4E819E833AE216922E5E', '1', null, '1');
INSERT INTO `community_file` VALUES ('44F79A172AD4A6ACACB5', 'http://crazymusic-bucket.oss-cn-shenzhen.aliyuncs.com/cb82d5761.png', '5', '2017-11-26 16:11:15', '4E819E833AE216922E5E', '1', null, '1');

-- ----------------------------
-- Table structure for community_perfect
-- ----------------------------
DROP TABLE IF EXISTS `community_perfect`;
CREATE TABLE `community_perfect` (
  `id` varchar(50) DEFAULT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `community_id` varchar(50) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of community_perfect
-- ----------------------------

-- ----------------------------
-- Table structure for coupon
-- ----------------------------
DROP TABLE IF EXISTS `coupon`;
CREATE TABLE `coupon` (
  `id` varchar(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `payment` decimal(10,0) DEFAULT NULL COMMENT '优惠券金额',
  `create_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `belong_to` tinyint(4) DEFAULT '1' COMMENT '用户群体 1 为所有用户',
  `expire_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '过期时间',
  `state` tinyint(4) DEFAULT '1' COMMENT '是否有效 1有效 0 无效'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of coupon
-- ----------------------------
INSERT INTO `coupon` VALUES ('F9523A029C4D4E4AA33420B73228BEDE', '按时', '12', '2017-12-03 20:35:48', '1', '2017-12-03 03:04:04', '1');
INSERT INTO `coupon` VALUES ('349B4A782AE5421FBD64FBE21F8478E0', '按时', '12', '2017-12-03 20:36:51', '1', '2017-12-03 03:04:04', '1');

-- ----------------------------
-- Table structure for examine
-- ----------------------------
DROP TABLE IF EXISTS `examine`;
CREATE TABLE `examine` (
  `id` varchar(50) DEFAULT NULL,
  `user_id` varchar(50) DEFAULT NULL COMMENT '用户id',
  `examine_state` varchar(50) DEFAULT NULL COMMENT '审核状态  0 审核中 1 审核通过 -1 审核失败',
  `create_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `examine_user_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of examine
-- ----------------------------

-- ----------------------------
-- Table structure for order_item
-- ----------------------------
DROP TABLE IF EXISTS `order_item`;
CREATE TABLE `order_item` (
  `id` varchar(50) DEFAULT NULL,
  `product_id` varchar(50) DEFAULT NULL,
  `order_id` varchar(50) DEFAULT NULL,
  `num` int(11) DEFAULT NULL COMMENT '购买数量',
  `product_title` varchar(255) DEFAULT NULL COMMENT '商品标题',
  `product_price` decimal(10,2) DEFAULT NULL COMMENT '商品单价',
  `product_total_price` decimal(10,2) DEFAULT NULL COMMENT '商品总价',
  `product_img` varchar(255) DEFAULT NULL COMMENT '商品图片地址  ',
  `product_attrs` varchar(255) DEFAULT NULL COMMENT '商品attrs集合'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_item
-- ----------------------------
INSERT INTO `order_item` VALUES ('4F2EA7762D59677223AA', 'E1267D273B3D4BE58EEB24AD7CFE51AE', '4C59AD83F268E320B083', '1', '小提琴', '500.00', '1001.00', 'http://crazymusic-bucket.oss-cn-shenzhen.aliyuncs.com/cb82d5761.png', 'A2DDDE4A100B4761B4921DE9066F980C,CAB38D7AE366489BA635894677CD8FD3');
INSERT INTO `order_item` VALUES ('4153BF413CEE1DC3C341', 'E1267D273B3D4BE58EEB24AD7CFE51AE', '43DFB52E71A27D5C4BBB', '1', '小提琴', '500.00', '1001.00', 'http://crazymusic-bucket.oss-cn-shenzhen.aliyuncs.com/cb82d5761.png', 'A2DDDE4A100B4761B4921DE9066F980C,CAB38D7AE366489BA635894677CD8FD3');

-- ----------------------------
-- Table structure for order_shipping
-- ----------------------------
DROP TABLE IF EXISTS `order_shipping`;
CREATE TABLE `order_shipping` (
  `id` varchar(50) NOT NULL,
  `receiver_name` varchar(255) DEFAULT NULL,
  `receiver_phone` varchar(20) DEFAULT NULL,
  `receiver_province` varchar(50) DEFAULT NULL,
  `receiver_city` varchar(50) DEFAULT NULL COMMENT '市区',
  `receiver_district` varchar(50) DEFAULT NULL COMMENT '区县',
  `receiver_address` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `receiver_code` varchar(10) DEFAULT NULL COMMENT '邮政编码',
  `create_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `shipping_name` varchar(255) DEFAULT NULL COMMENT '物流名',
  `shipping_code` varchar(255) DEFAULT NULL COMMENT '单号',
  `order_id` varchar(50) DEFAULT NULL COMMENT '订单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_shipping
-- ----------------------------
INSERT INTO `order_shipping` VALUES ('455B82AE47E2734A1969', 'xiaoming', '15523232323', 'sichuansheng', 'chengdushi', 'wuhouqu', 'number_8', '123456', '2017-11-20 21:47:06', '2017-11-20 21:47:06', '顺丰快递', '123123', '43DFB52E71A27D5C4BBB');
INSERT INTO `order_shipping` VALUES ('459D982185FD75515B08', 'xiaoming', '15523232323', 'sichuansheng', 'chengdushi', 'wuhouqu', 'number_8', '123456', '2017-11-16 23:04:15', null, null, null, '4C59AD83F268E320B083');

-- ----------------------------
-- Table structure for pay_seria
-- ----------------------------
DROP TABLE IF EXISTS `pay_seria`;
CREATE TABLE `pay_seria` (
  `id` varchar(50) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `money` decimal(10,0) DEFAULT NULL COMMENT '涉及金额',
  `create_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `pay_type` int(11) DEFAULT NULL COMMENT ' 1 余额支付 2 微信支付 3 支付宝支付',
  `use_type` varchar(255) DEFAULT NULL COMMENT '支付用途 1 余额充值  2 商品购买 3 视频购买'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pay_seria
-- ----------------------------

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` varchar(255) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL COMMENT '商品全名称',
  `simple_name` varchar(20) DEFAULT NULL COMMENT '商品简名称',
  `type_id` varchar(50) DEFAULT NULL COMMENT '商品类别id',
  `now_price` decimal(10,2) DEFAULT NULL COMMENT '现价',
  `market_price` decimal(10,2) DEFAULT NULL COMMENT '市场价',
  `product_tag_id` varchar(50) DEFAULT NULL COMMENT '商品标签id',
  `cost_price` decimal(10,2) DEFAULT NULL COMMENT '原价',
  `simple_desc` varchar(100) DEFAULT NULL COMMENT '商品简单描述',
  `del_flag` tinyint(1) NOT NULL DEFAULT '1',
  `html` varchar(20000) DEFAULT NULL,
  `publish_state` tinyint(1) DEFAULT '0' COMMENT '发布状态  默认不发布 0   发布 1',
  `post_fee` decimal(10,0) DEFAULT NULL COMMENT '邮费'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('0EEF90C40E8848BE86C3D86B74308AE8', 'asdasdasd', 'asdasdasd', 'DC9FBD31779B4348A396F1DBE0837103', '1.00', '2.00', '1', '3.00', 'asdasd', '1', '<html xmlns=\"http://www.w3.org/1999/xhtml\"><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" /></head><body><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"/><p>asdasdasdasd<img src=\"http://crazymusic-bucket.oss-cn-shenzhen.aliyuncs.com/ueditor/upload/image/20171102/1509634036309009348.png\" title=\"1509634036309009348.png\" alt=\"2.png\"/></p><p><img src=\"http://crazymusic-bucket.oss-cn-shenzhen.aliyuncs.com/ueditor/upload/image/20171102/1509634043055073371.png\" title=\"1509634043055073371.png\" alt=\"首页1-恢复的.png\"/></p></body></html>', '1', null);
INSERT INTO `product` VALUES ('E1267D273B3D4BE58EEB24AD7CFE51AE', '小提琴', '33333333', 'AFBB673FF55842CDB5BA32631F551097', '500.00', '2.00', '1', '3.00', 'asdasd', '1', '<html xmlns=\"http://www.w3.org/1999/xhtml\"><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" /></head><body><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"/><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"/><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"/><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"/><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"/><p>asdasdasdasd</p><p>aasdasda123123123</p></body></html>', '1', null);
INSERT INTO `product` VALUES ('F61EC4B360E94CEEA300231AF01C3B42', '测试', 'sdsd', 'AA54DAF6FBE1466FA7C1A667089AAD17', '12.00', '22.00', '1', '32.00', '3211', '1', '<html xmlns=\"http://www.w3.org/1999/xhtml\"><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" /></head><body><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"/><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"/><p>123123<img src=\"http://crazymusic-bucket.oss-cn-shenzhen.aliyuncs.com/ueditor/upload/image/20171203/1512311392455053984.jpg\" title=\"1512311392455053984.jpg\" alt=\"fileUpload.jpg\"/></p></body></html>', '1', '13');

-- ----------------------------
-- Table structure for product_attr
-- ----------------------------
DROP TABLE IF EXISTS `product_attr`;
CREATE TABLE `product_attr` (
  `id` varchar(50) DEFAULT NULL,
  `type` tinyint(2) DEFAULT NULL COMMENT '类型  颜色属性 1  尺码属性 2',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `value` varchar(50) DEFAULT NULL COMMENT '值',
  `del_flag` tinyint(4) DEFAULT '1' COMMENT '删除标志 1 未删除 0 删除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_attr
-- ----------------------------
INSERT INTO `product_attr` VALUES ('1', '1', '颜色', '橘黄', '1');
INSERT INTO `product_attr` VALUES ('2', '1', '颜色', '哈哈色', '1');
INSERT INTO `product_attr` VALUES ('3', '2', '尺码', '26', '1');
INSERT INTO `product_attr` VALUES ('4', '2', '尺码', '27', '1');
INSERT INTO `product_attr` VALUES ('F2DA6C3F8B5C48CA8315692A3AB69A5D', '1', '颜色', '黑色', '1');
INSERT INTO `product_attr` VALUES ('ACB7B79D18AE48A99108F7D0784BFC17', '1', '颜色', '白色', '1');

-- ----------------------------
-- Table structure for product_attr_val
-- ----------------------------
DROP TABLE IF EXISTS `product_attr_val`;
CREATE TABLE `product_attr_val` (
  `id` varchar(50) DEFAULT NULL,
  `product_id` varchar(50) DEFAULT NULL COMMENT '商品id',
  `product_attr_id` varchar(50) DEFAULT NULL COMMENT '商品属性ids集合 用,分割',
  `increase_price` decimal(10,0) DEFAULT NULL COMMENT '在商品基础价上加价',
  `benable` tinyint(1) DEFAULT '1',
  `create_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `number` int(11) DEFAULT NULL COMMENT '库存'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_attr_val
-- ----------------------------
INSERT INTO `product_attr_val` VALUES ('9C79D85E908C4A25AF2FC2FE9B0D9F45', '0EEF90C40E8848BE86C3D86B74308AE8', '1', '12', '1', '2017-11-04 09:14:53', '20');
INSERT INTO `product_attr_val` VALUES ('72EDDCA08EE54D1AAE6B8A45AE624954', 'E1267D273B3D4BE58EEB24AD7CFE51AE', '1', '50', '1', '2017-12-03 16:05:07', '5');
INSERT INTO `product_attr_val` VALUES ('F27E4A2F2B354F8D8574E3CDCE09F85B', 'E1267D273B3D4BE58EEB24AD7CFE51AE', '2', '-10', '1', '2017-12-03 16:05:07', '13');
INSERT INTO `product_attr_val` VALUES ('8A7E342A83A343CF93EB4ACC0B807FBB', 'F61EC4B360E94CEEA300231AF01C3B42', '1', '12', '1', '2017-12-03 22:30:27', '12');

-- ----------------------------
-- Table structure for product_collect
-- ----------------------------
DROP TABLE IF EXISTS `product_collect`;
CREATE TABLE `product_collect` (
  `id` varchar(50) DEFAULT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `product_id` varchar(50) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_collect
-- ----------------------------
INSERT INTO `product_collect` VALUES ('4473842CCD7E1B142347', '1', 'E1267D273B3D4BE58EEB24AD7CFE51AE', '2017-12-03 15:08:57');

-- ----------------------------
-- Table structure for product_evaluate
-- ----------------------------
DROP TABLE IF EXISTS `product_evaluate`;
CREATE TABLE `product_evaluate` (
  `id` varchar(50) DEFAULT NULL,
  `product_id` varchar(50) DEFAULT NULL,
  `order_id` varchar(50) DEFAULT NULL COMMENT '订单ID',
  `evaluate_imgs` varchar(2000) DEFAULT NULL COMMENT '评价图片URL 用,分割',
  `desc_star` int(2) DEFAULT NULL COMMENT '描述相符星级',
  `content` varchar(2000) DEFAULT NULL COMMENT '评价内容',
  `logistical_star` int(2) DEFAULT NULL COMMENT '物流星级',
  `user_id` varchar(50) DEFAULT NULL COMMENT '用户ID',
  `create_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `service_star` int(2) DEFAULT NULL COMMENT '服务星级'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_evaluate
-- ----------------------------
INSERT INTO `product_evaluate` VALUES ('4A6BB5B18B01453422C2', 'E1267D273B3D4BE58EEB24AD7CFE51AE', '4C59AD83F268E320B083', 'http://crazymusic-bucket.oss-cn-shenzhen.aliyuncs.com/cb82d5761.png,http://crazymusic-bucket.oss-cn-shenzhen.aliyuncs.com/cb82d5761.png', '5', '吉他不错', '4', '1', '2017-11-20 22:27:35', '3');
INSERT INTO `product_evaluate` VALUES ('4A6BB5B18B01453422C3', 'E1267D273B3D4BE58EEB24AD7CFE51AE', '4C59AD83F268E320B083', 'http://crazymusic-bucket.oss-cn-shenzhen.aliyuncs.com/cb82d5761.png,http://crazymusic-bucket.oss-cn-shenzhen.aliyuncs.com/cb82d5761.png', '5', '第二条评价', '4', '1', '2017-11-21 22:27:35', '3');
INSERT INTO `product_evaluate` VALUES ('4A6BB5B18B01453422C4', 'E1267D273B3D4BE58EEB24AD7CFE51AE', '4C59AD83F268E320B083', 'http://crazymusic-bucket.oss-cn-shenzhen.aliyuncs.com/cb82d5761.png,http://crazymusic-bucket.oss-cn-shenzhen.aliyuncs.com/cb82d5761.png', '5', '第三条评价', '4', '1', '2017-11-23 22:27:35', '3');

-- ----------------------------
-- Table structure for product_img
-- ----------------------------
DROP TABLE IF EXISTS `product_img`;
CREATE TABLE `product_img` (
  `id` varchar(50) DEFAULT NULL,
  `product_id` varchar(50) DEFAULT NULL,
  `product_img` varchar(255) DEFAULT NULL,
  `del_flag` tinyint(4) DEFAULT '1',
  `type` tinyint(4) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_img
-- ----------------------------
INSERT INTO `product_img` VALUES ('C609D58298F8480B9692C9023753E3D1', '0EEF90C40E8848BE86C3D86B74308AE8', 'http://crazymusic-bucket.oss-cn-shenzhen.aliyuncs.com/cb82d5761.png', '1', '1', '1');
INSERT INTO `product_img` VALUES ('F3664802F0604E2A896BAB0A27C8D410', 'E1267D273B3D4BE58EEB24AD7CFE51AE', 'http://crazymusic-bucket.oss-cn-shenzhen.aliyuncs.com/39491f28fileUpload.jpg', '1', '1', '1');
INSERT INTO `product_img` VALUES ('7888BB5A6F84475A8FDF83DD9453E842', 'F61EC4B360E94CEEA300231AF01C3B42', 'http://crazymusic-bucket.oss-cn-shenzhen.aliyuncs.com/7533ed33fileUpload.jpg', '1', '1', '1');

-- ----------------------------
-- Table structure for product_recommend
-- ----------------------------
DROP TABLE IF EXISTS `product_recommend`;
CREATE TABLE `product_recommend` (
  `id` varchar(50) DEFAULT NULL,
  `product_id` varchar(50) DEFAULT NULL COMMENT '商品id',
  `recommend_star` varchar(50) DEFAULT NULL COMMENT '推荐星级',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `benable` int(1) DEFAULT NULL COMMENT '是否推荐 1推荐  0 不推荐',
  `del_flag` tinyint(1) DEFAULT '1' COMMENT '删除标志',
  `product_img` varchar(255) DEFAULT NULL COMMENT '推荐商品图片',
  `recommend_desc` varchar(50) DEFAULT NULL COMMENT '星级推荐描述'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_recommend
-- ----------------------------
INSERT INTO `product_recommend` VALUES ('0BDF7EFB12684817A7EBD43B781BF04E', 'E1267D273B3D4BE58EEB24AD7CFE51AE', '4', '2', '2017-11-04 20:06:41', '1', '1', 'http://crazymusic-bucket.oss-cn-shenzhen.aliyuncs.com/ce0f47fb3.png', '严重推荐12312312333');

-- ----------------------------
-- Table structure for product_tag
-- ----------------------------
DROP TABLE IF EXISTS `product_tag`;
CREATE TABLE `product_tag` (
  `id` varchar(50) DEFAULT NULL,
  `tag_name` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `del_flag` tinyint(4) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_tag
-- ----------------------------
INSERT INTO `product_tag` VALUES ('1', '特别推荐', '2017-10-23 21:55:19', '1');
INSERT INTO `product_tag` VALUES ('2', '全球购2', '2017-10-30 20:26:48', '1');

-- ----------------------------
-- Table structure for product_type
-- ----------------------------
DROP TABLE IF EXISTS `product_type`;
CREATE TABLE `product_type` (
  `id` varchar(50) DEFAULT NULL,
  `type_name` varchar(20) DEFAULT NULL,
  `parent_id` varchar(50) DEFAULT NULL,
  `type_pic` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `del_flag` int(1) DEFAULT '1',
  `sort` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_type
-- ----------------------------
INSERT INTO `product_type` VALUES ('1', '民谣吉他', '6', null, '2017-10-30 23:42:37', '1', '1');
INSERT INTO `product_type` VALUES ('2', '古典吉他', '6', null, '2017-10-30 23:42:40', '1', '2');
INSERT INTO `product_type` VALUES ('3', '电吉他', '6', null, '2017-10-30 23:42:43', '1', '3');
INSERT INTO `product_type` VALUES ('4', '尤克里里', '0', null, '2017-11-22 21:36:44', '1', '4');
INSERT INTO `product_type` VALUES ('5', '吉他配件', '0', null, '2017-11-22 21:36:44', '1', '5');
INSERT INTO `product_type` VALUES ('6', '吉他', '0', null, '2017-11-22 21:36:45', '1', '6');
INSERT INTO `product_type` VALUES ('AA54DAF6FBE1466FA7C1A667089AAD17', '测试类型2', '4', 'http://crazymusic-bucket.oss-cn-shenzhen.aliyuncs.com/5c730183点击直播.png', '2017-11-04 08:24:37', '1', '1');
INSERT INTO `product_type` VALUES ('AFBB673FF55842CDB5BA32631F551097', '测试类型2', '请选择', 'http://crazymusic-bucket.oss-cn-shenzhen.aliyuncs.com/80098b812.png', null, '1', '8');
INSERT INTO `product_type` VALUES ('2C1E39DAD47341C094B8F8BAF807F52A', '请问1', '0', null, '2017-11-22 21:36:47', '1', '12');
INSERT INTO `product_type` VALUES ('DC9FBD31779B4348A396F1DBE0837103', '请问3', '4', 'http://crazymusic-bucket.oss-cn-shenzhen.aliyuncs.com/ae462f49线下约.jpg', '2017-10-31 22:44:49', '1', '15');
INSERT INTO `product_type` VALUES ('CC5A02B1DA974F5FBEEEB4D6EE0A943D', '测试', null, null, '2017-12-04 22:08:02', '1', null);

-- ----------------------------
-- Table structure for product_type_attr
-- ----------------------------
DROP TABLE IF EXISTS `product_type_attr`;
CREATE TABLE `product_type_attr` (
  `id` varchar(50) DEFAULT NULL,
  `product_type_id` varchar(50) DEFAULT NULL,
  `product_attr_type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_type_attr
-- ----------------------------
INSERT INTO `product_type_attr` VALUES ('BE5493AA02AE4E89885B0FF083D75875', 'AA54DAF6FBE1466FA7C1A667089AAD17', '1');
INSERT INTO `product_type_attr` VALUES ('479802A081694BD5B1E68F941800AE36', 'AFBB673FF55842CDB5BA32631F551097', '1,2');
INSERT INTO `product_type_attr` VALUES ('D507115A43F14195967640B7C36AC349', '2C1E39DAD47341C094B8F8BAF807F52A', '1,2');
INSERT INTO `product_type_attr` VALUES ('57D2A95C8FC649C098A7F196CD842BD6', 'DC9FBD31779B4348A396F1DBE0837103', '1');
INSERT INTO `product_type_attr` VALUES ('A5CE5F1EB109407FB33E1B8ADF5FE94F', 'CC5A02B1DA974F5FBEEEB4D6EE0A943D', null);

-- ----------------------------
-- Table structure for region
-- ----------------------------
DROP TABLE IF EXISTS `region`;
CREATE TABLE `region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(40) NOT NULL,
  `province` varchar(40) NOT NULL,
  `city` varchar(40) NOT NULL,
  `district` varchar(40) NOT NULL,
  `parent` varchar(40) NOT NULL,
  `type` int(11) DEFAULT NULL COMMENT '0 中国 1 省  2 市  3 区县',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3924 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of region
-- ----------------------------
INSERT INTO `region` VALUES ('1', '000000', '中华人民共和国', '', '', '0', '2');
INSERT INTO `region` VALUES ('2', '110000', '北京市', '北京市', '', '1', '2');
INSERT INTO `region` VALUES ('3', '110101', '', '', '东城区', '2', '3');
INSERT INTO `region` VALUES ('4', '110102', '', '', '西城区', '2', '3');
INSERT INTO `region` VALUES ('5', '110105', '', '', '朝阳区', '2', '3');
INSERT INTO `region` VALUES ('6', '110106', '', '', '丰台区', '2', '3');
INSERT INTO `region` VALUES ('7', '110107', '', '', '石景山区', '2', '3');
INSERT INTO `region` VALUES ('8', '110108', '', '', '海淀区', '2', '3');
INSERT INTO `region` VALUES ('9', '110109', '', '', '门头沟区', '2', '3');
INSERT INTO `region` VALUES ('10', '110111', '', '', '房山区', '2', '3');
INSERT INTO `region` VALUES ('11', '110112', '', '', '通州区', '2', '3');
INSERT INTO `region` VALUES ('12', '110113', '', '', '顺义区', '2', '3');
INSERT INTO `region` VALUES ('13', '110114', '', '', '昌平区', '2', '3');
INSERT INTO `region` VALUES ('14', '110115', '', '', '大兴区', '2', '3');
INSERT INTO `region` VALUES ('15', '110116', '', '', '怀柔区', '2', '3');
INSERT INTO `region` VALUES ('16', '110117', '', '', '平谷区', '2', '3');
INSERT INTO `region` VALUES ('17', '110228', '', '', '密云县', '2', '3');
INSERT INTO `region` VALUES ('18', '110229', '', '', '延庆县', '2', '3');
INSERT INTO `region` VALUES ('19', '120000', '天津市', '天津市', '', '1', '2');
INSERT INTO `region` VALUES ('20', '120101', '', '', '和平区', '19', '3');
INSERT INTO `region` VALUES ('21', '120102', '', '', '河东区', '19', '3');
INSERT INTO `region` VALUES ('22', '120103', '', '', '河西区', '19', '3');
INSERT INTO `region` VALUES ('23', '120104', '', '', '南开区', '19', '3');
INSERT INTO `region` VALUES ('24', '120105', '', '', '河北区', '19', '3');
INSERT INTO `region` VALUES ('25', '120106', '', '', '红桥区', '19', '3');
INSERT INTO `region` VALUES ('26', '120110', '', '', '东丽区', '19', '3');
INSERT INTO `region` VALUES ('27', '120111', '', '', '西青区', '19', '3');
INSERT INTO `region` VALUES ('28', '120112', '', '', '津南区', '19', '3');
INSERT INTO `region` VALUES ('29', '120113', '', '', '北辰区', '19', '3');
INSERT INTO `region` VALUES ('30', '120114', '', '', '武清区', '19', '3');
INSERT INTO `region` VALUES ('31', '120115', '', '', '宝坻区', '19', '3');
INSERT INTO `region` VALUES ('32', '120116', '', '', '滨海新区', '19', '3');
INSERT INTO `region` VALUES ('33', '120221', '', '', '宁河县', '19', '3');
INSERT INTO `region` VALUES ('34', '120223', '', '', '静海县', '19', '3');
INSERT INTO `region` VALUES ('35', '120225', '', '', '蓟县', '19', '3');
INSERT INTO `region` VALUES ('36', '130000', '河北省', '', '', '1', '2');
INSERT INTO `region` VALUES ('37', '130100', '', '石家庄市', '', '36', '2');
INSERT INTO `region` VALUES ('38', '130101', '', '', '市辖区', '37', '3');
INSERT INTO `region` VALUES ('39', '130102', '', '', '长安区', '37', '3');
INSERT INTO `region` VALUES ('40', '130104', '', '', '桥西区', '37', '3');
INSERT INTO `region` VALUES ('41', '130105', '', '', '新华区', '37', '3');
INSERT INTO `region` VALUES ('42', '130107', '', '', '井陉矿区', '37', '3');
INSERT INTO `region` VALUES ('43', '130108', '', '', '裕华区', '37', '3');
INSERT INTO `region` VALUES ('44', '130109', '', '', '藁城区', '37', '3');
INSERT INTO `region` VALUES ('45', '130110', '', '', '鹿泉区', '37', '3');
INSERT INTO `region` VALUES ('46', '130111', '', '', '栾城区', '37', '3');
INSERT INTO `region` VALUES ('47', '130121', '', '', '井陉县', '37', '3');
INSERT INTO `region` VALUES ('48', '130123', '', '', '正定县', '37', '3');
INSERT INTO `region` VALUES ('49', '130125', '', '', '行唐县', '37', '3');
INSERT INTO `region` VALUES ('50', '130126', '', '', '灵寿县', '37', '3');
INSERT INTO `region` VALUES ('51', '130127', '', '', '高邑县', '37', '3');
INSERT INTO `region` VALUES ('52', '130128', '', '', '深泽县', '37', '3');
INSERT INTO `region` VALUES ('53', '130129', '', '', '赞皇县', '37', '3');
INSERT INTO `region` VALUES ('54', '130130', '', '', '无极县', '37', '3');
INSERT INTO `region` VALUES ('55', '130131', '', '', '平山县', '37', '3');
INSERT INTO `region` VALUES ('56', '130132', '', '', '元氏县', '37', '3');
INSERT INTO `region` VALUES ('57', '130133', '', '', '赵县', '37', '3');
INSERT INTO `region` VALUES ('58', '130181', '', '', '辛集市', '37', '3');
INSERT INTO `region` VALUES ('59', '130183', '', '', '晋州市', '37', '3');
INSERT INTO `region` VALUES ('60', '130184', '', '', '新乐市', '37', '3');
INSERT INTO `region` VALUES ('61', '130200', '', '唐山市', '', '36', '2');
INSERT INTO `region` VALUES ('62', '130201', '', '', '市辖区', '61', '3');
INSERT INTO `region` VALUES ('63', '130202', '', '', '路南区', '61', '3');
INSERT INTO `region` VALUES ('64', '130203', '', '', '路北区', '61', '3');
INSERT INTO `region` VALUES ('65', '130204', '', '', '古冶区', '61', '3');
INSERT INTO `region` VALUES ('66', '130205', '', '', '开平区', '61', '3');
INSERT INTO `region` VALUES ('67', '130207', '', '', '丰南区', '61', '3');
INSERT INTO `region` VALUES ('68', '130208', '', '', '丰润区', '61', '3');
INSERT INTO `region` VALUES ('69', '130209', '', '', '曹妃甸区', '61', '3');
INSERT INTO `region` VALUES ('70', '130223', '', '', '滦县', '61', '3');
INSERT INTO `region` VALUES ('71', '130224', '', '', '滦南县', '61', '3');
INSERT INTO `region` VALUES ('72', '130225', '', '', '乐亭县', '61', '3');
INSERT INTO `region` VALUES ('73', '130227', '', '', '迁西县', '61', '3');
INSERT INTO `region` VALUES ('74', '130229', '', '', '玉田县', '61', '3');
INSERT INTO `region` VALUES ('75', '130281', '', '', '遵化市', '61', '3');
INSERT INTO `region` VALUES ('76', '130283', '', '', '迁安市', '61', '3');
INSERT INTO `region` VALUES ('77', '130300', '', '秦皇岛市', '', '36', '2');
INSERT INTO `region` VALUES ('78', '130301', '', '', '市辖区', '77', '3');
INSERT INTO `region` VALUES ('79', '130302', '', '', '海港区', '77', '3');
INSERT INTO `region` VALUES ('80', '130303', '', '', '山海关区', '77', '3');
INSERT INTO `region` VALUES ('81', '130304', '', '', '北戴河区', '77', '3');
INSERT INTO `region` VALUES ('82', '130321', '', '', '青龙满族自治县', '77', '3');
INSERT INTO `region` VALUES ('83', '130322', '', '', '昌黎县', '77', '3');
INSERT INTO `region` VALUES ('84', '130323', '', '', '抚宁县', '77', '3');
INSERT INTO `region` VALUES ('85', '130324', '', '', '卢龙县', '77', '3');
INSERT INTO `region` VALUES ('86', '130400', '', '邯郸市', '', '36', '2');
INSERT INTO `region` VALUES ('87', '130401', '', '', '市辖区', '86', '3');
INSERT INTO `region` VALUES ('88', '130402', '', '', '邯山区', '86', '3');
INSERT INTO `region` VALUES ('89', '130403', '', '', '丛台区', '86', '3');
INSERT INTO `region` VALUES ('90', '130404', '', '', '复兴区', '86', '3');
INSERT INTO `region` VALUES ('91', '130406', '', '', '峰峰矿区', '86', '3');
INSERT INTO `region` VALUES ('92', '130421', '', '', '邯郸县', '86', '3');
INSERT INTO `region` VALUES ('93', '130423', '', '', '临漳县', '86', '3');
INSERT INTO `region` VALUES ('94', '130424', '', '', '成安县', '86', '3');
INSERT INTO `region` VALUES ('95', '130425', '', '', '大名县', '86', '3');
INSERT INTO `region` VALUES ('96', '130426', '', '', '涉县', '86', '3');
INSERT INTO `region` VALUES ('97', '130427', '', '', '磁县', '86', '3');
INSERT INTO `region` VALUES ('98', '130428', '', '', '肥乡县', '86', '3');
INSERT INTO `region` VALUES ('99', '130429', '', '', '永年县', '86', '3');
INSERT INTO `region` VALUES ('100', '130430', '', '', '邱县', '86', '3');
INSERT INTO `region` VALUES ('101', '130431', '', '', '鸡泽县', '86', '3');
INSERT INTO `region` VALUES ('102', '130432', '', '', '广平县', '86', '3');
INSERT INTO `region` VALUES ('103', '130433', '', '', '馆陶县', '86', '3');
INSERT INTO `region` VALUES ('104', '130434', '', '', '魏县', '86', '3');
INSERT INTO `region` VALUES ('105', '130435', '', '', '曲周县', '86', '3');
INSERT INTO `region` VALUES ('106', '130481', '', '', '武安市', '86', '3');
INSERT INTO `region` VALUES ('107', '130500', '', '邢台市', '', '36', '2');
INSERT INTO `region` VALUES ('108', '130501', '', '', '市辖区', '107', '3');
INSERT INTO `region` VALUES ('109', '130502', '', '', '桥东区', '107', '3');
INSERT INTO `region` VALUES ('110', '130503', '', '', '桥西区', '107', '3');
INSERT INTO `region` VALUES ('111', '130521', '', '', '邢台县', '107', '3');
INSERT INTO `region` VALUES ('112', '130522', '', '', '临城县', '107', '3');
INSERT INTO `region` VALUES ('113', '130523', '', '', '内丘县', '107', '3');
INSERT INTO `region` VALUES ('114', '130524', '', '', '柏乡县', '107', '3');
INSERT INTO `region` VALUES ('115', '130525', '', '', '隆尧县', '107', '3');
INSERT INTO `region` VALUES ('116', '130526', '', '', '任县', '107', '3');
INSERT INTO `region` VALUES ('117', '130527', '', '', '南和县', '107', '3');
INSERT INTO `region` VALUES ('118', '130528', '', '', '宁晋县', '107', '3');
INSERT INTO `region` VALUES ('119', '130529', '', '', '巨鹿县', '107', '3');
INSERT INTO `region` VALUES ('120', '130530', '', '', '新河县', '107', '3');
INSERT INTO `region` VALUES ('121', '130531', '', '', '广宗县', '107', '3');
INSERT INTO `region` VALUES ('122', '130532', '', '', '平乡县', '107', '3');
INSERT INTO `region` VALUES ('123', '130533', '', '', '威县', '107', '3');
INSERT INTO `region` VALUES ('124', '130534', '', '', '清河县', '107', '3');
INSERT INTO `region` VALUES ('125', '130535', '', '', '临西县', '107', '3');
INSERT INTO `region` VALUES ('126', '130581', '', '', '南宫市', '107', '3');
INSERT INTO `region` VALUES ('127', '130582', '', '', '沙河市', '107', '3');
INSERT INTO `region` VALUES ('128', '130600', '', '保定市', '', '36', '2');
INSERT INTO `region` VALUES ('129', '130601', '', '', '市辖区', '128', '3');
INSERT INTO `region` VALUES ('130', '130602', '', '', '新市区', '128', '3');
INSERT INTO `region` VALUES ('131', '130603', '', '', '北市区', '128', '3');
INSERT INTO `region` VALUES ('132', '130604', '', '', '南市区', '128', '3');
INSERT INTO `region` VALUES ('133', '130621', '', '', '满城县', '128', '3');
INSERT INTO `region` VALUES ('134', '130622', '', '', '清苑县', '128', '3');
INSERT INTO `region` VALUES ('135', '130623', '', '', '涞水县', '128', '3');
INSERT INTO `region` VALUES ('136', '130624', '', '', '阜平县', '128', '3');
INSERT INTO `region` VALUES ('137', '130625', '', '', '徐水县', '128', '3');
INSERT INTO `region` VALUES ('138', '130626', '', '', '定兴县', '128', '3');
INSERT INTO `region` VALUES ('139', '130627', '', '', '唐县', '128', '3');
INSERT INTO `region` VALUES ('140', '130628', '', '', '高阳县', '128', '3');
INSERT INTO `region` VALUES ('141', '130629', '', '', '容城县', '128', '3');
INSERT INTO `region` VALUES ('142', '130630', '', '', '涞源县', '128', '3');
INSERT INTO `region` VALUES ('143', '130631', '', '', '望都县', '128', '3');
INSERT INTO `region` VALUES ('144', '130632', '', '', '安新县', '128', '3');
INSERT INTO `region` VALUES ('145', '130633', '', '', '易县', '128', '3');
INSERT INTO `region` VALUES ('146', '130634', '', '', '曲阳县', '128', '3');
INSERT INTO `region` VALUES ('147', '130635', '', '', '蠡县', '128', '3');
INSERT INTO `region` VALUES ('148', '130636', '', '', '顺平县', '128', '3');
INSERT INTO `region` VALUES ('149', '130637', '', '', '博野县', '128', '3');
INSERT INTO `region` VALUES ('150', '130638', '', '', '雄县', '128', '3');
INSERT INTO `region` VALUES ('151', '130681', '', '', '涿州市', '128', '3');
INSERT INTO `region` VALUES ('152', '130682', '', '', '定州市', '128', '3');
INSERT INTO `region` VALUES ('153', '130683', '', '', '安国市', '128', '3');
INSERT INTO `region` VALUES ('154', '130684', '', '', '高碑店市', '128', '3');
INSERT INTO `region` VALUES ('155', '130700', '', '张家口市', '', '36', '2');
INSERT INTO `region` VALUES ('156', '130701', '', '', '市辖区', '155', '3');
INSERT INTO `region` VALUES ('157', '130702', '', '', '桥东区', '155', '3');
INSERT INTO `region` VALUES ('158', '130703', '', '', '桥西区', '155', '3');
INSERT INTO `region` VALUES ('159', '130705', '', '', '宣化区', '155', '3');
INSERT INTO `region` VALUES ('160', '130706', '', '', '下花园区', '155', '3');
INSERT INTO `region` VALUES ('161', '130721', '', '', '宣化县', '155', '3');
INSERT INTO `region` VALUES ('162', '130722', '', '', '张北县', '155', '3');
INSERT INTO `region` VALUES ('163', '130723', '', '', '康保县', '155', '3');
INSERT INTO `region` VALUES ('164', '130724', '', '', '沽源县', '155', '3');
INSERT INTO `region` VALUES ('165', '130725', '', '', '尚义县', '155', '3');
INSERT INTO `region` VALUES ('166', '130726', '', '', '蔚县', '155', '3');
INSERT INTO `region` VALUES ('167', '130727', '', '', '阳原县', '155', '3');
INSERT INTO `region` VALUES ('168', '130728', '', '', '怀安县', '155', '3');
INSERT INTO `region` VALUES ('169', '130729', '', '', '万全县', '155', '3');
INSERT INTO `region` VALUES ('170', '130730', '', '', '怀来县', '155', '3');
INSERT INTO `region` VALUES ('171', '130731', '', '', '涿鹿县', '155', '3');
INSERT INTO `region` VALUES ('172', '130732', '', '', '赤城县', '155', '3');
INSERT INTO `region` VALUES ('173', '130733', '', '', '崇礼县', '155', '3');
INSERT INTO `region` VALUES ('174', '130800', '', '承德市', '', '36', '2');
INSERT INTO `region` VALUES ('175', '130801', '', '', '市辖区', '174', '3');
INSERT INTO `region` VALUES ('176', '130802', '', '', '双桥区', '174', '3');
INSERT INTO `region` VALUES ('177', '130803', '', '', '双滦区', '174', '3');
INSERT INTO `region` VALUES ('178', '130804', '', '', '鹰手营子矿区', '174', '3');
INSERT INTO `region` VALUES ('179', '130821', '', '', '承德县', '174', '3');
INSERT INTO `region` VALUES ('180', '130822', '', '', '兴隆县', '174', '3');
INSERT INTO `region` VALUES ('181', '130823', '', '', '平泉县', '174', '3');
INSERT INTO `region` VALUES ('182', '130824', '', '', '滦平县', '174', '3');
INSERT INTO `region` VALUES ('183', '130825', '', '', '隆化县', '174', '3');
INSERT INTO `region` VALUES ('184', '130826', '', '', '丰宁满族自治县', '174', '3');
INSERT INTO `region` VALUES ('185', '130827', '', '', '宽城满族自治县', '174', '3');
INSERT INTO `region` VALUES ('186', '130828', '', '', '围场满族蒙古族自治县', '174', '3');
INSERT INTO `region` VALUES ('187', '130900', '', '沧州市', '', '36', '2');
INSERT INTO `region` VALUES ('188', '130901', '', '', '市辖区', '187', '3');
INSERT INTO `region` VALUES ('189', '130902', '', '', '新华区', '187', '3');
INSERT INTO `region` VALUES ('190', '130903', '', '', '运河区', '187', '3');
INSERT INTO `region` VALUES ('191', '130921', '', '', '沧县', '187', '3');
INSERT INTO `region` VALUES ('192', '130922', '', '', '青县', '187', '3');
INSERT INTO `region` VALUES ('193', '130923', '', '', '东光县', '187', '3');
INSERT INTO `region` VALUES ('194', '130924', '', '', '海兴县', '187', '3');
INSERT INTO `region` VALUES ('195', '130925', '', '', '盐山县', '187', '3');
INSERT INTO `region` VALUES ('196', '130926', '', '', '肃宁县', '187', '3');
INSERT INTO `region` VALUES ('197', '130927', '', '', '南皮县', '187', '3');
INSERT INTO `region` VALUES ('198', '130928', '', '', '吴桥县', '187', '3');
INSERT INTO `region` VALUES ('199', '130929', '', '', '献县', '187', '3');
INSERT INTO `region` VALUES ('200', '130930', '', '', '孟村回族自治县', '187', '3');
INSERT INTO `region` VALUES ('201', '130981', '', '', '泊头市', '187', '3');
INSERT INTO `region` VALUES ('202', '130982', '', '', '任丘市', '187', '3');
INSERT INTO `region` VALUES ('203', '130983', '', '', '黄骅市', '187', '3');
INSERT INTO `region` VALUES ('204', '130984', '', '', '河间市', '187', '3');
INSERT INTO `region` VALUES ('205', '131000', '', '廊坊市', '', '36', '2');
INSERT INTO `region` VALUES ('206', '131001', '', '', '市辖区', '205', '3');
INSERT INTO `region` VALUES ('207', '131002', '', '', '安次区', '205', '3');
INSERT INTO `region` VALUES ('208', '131003', '', '', '广阳区', '205', '3');
INSERT INTO `region` VALUES ('209', '131022', '', '', '固安县', '205', '3');
INSERT INTO `region` VALUES ('210', '131023', '', '', '永清县', '205', '3');
INSERT INTO `region` VALUES ('211', '131024', '', '', '香河县', '205', '3');
INSERT INTO `region` VALUES ('212', '131025', '', '', '大城县', '205', '3');
INSERT INTO `region` VALUES ('213', '131026', '', '', '文安县', '205', '3');
INSERT INTO `region` VALUES ('214', '131028', '', '', '大厂回族自治县', '205', '3');
INSERT INTO `region` VALUES ('215', '131081', '', '', '霸州市', '205', '3');
INSERT INTO `region` VALUES ('216', '131082', '', '', '三河市', '205', '3');
INSERT INTO `region` VALUES ('217', '131100', '', '衡水市', '', '36', '2');
INSERT INTO `region` VALUES ('218', '131101', '', '', '市辖区', '217', '3');
INSERT INTO `region` VALUES ('219', '131102', '', '', '桃城区', '217', '3');
INSERT INTO `region` VALUES ('220', '131121', '', '', '枣强县', '217', '3');
INSERT INTO `region` VALUES ('221', '131122', '', '', '武邑县', '217', '3');
INSERT INTO `region` VALUES ('222', '131123', '', '', '武强县', '217', '3');
INSERT INTO `region` VALUES ('223', '131124', '', '', '饶阳县', '217', '3');
INSERT INTO `region` VALUES ('224', '131125', '', '', '安平县', '217', '3');
INSERT INTO `region` VALUES ('225', '131126', '', '', '故城县', '217', '3');
INSERT INTO `region` VALUES ('226', '131127', '', '', '景县', '217', '3');
INSERT INTO `region` VALUES ('227', '131128', '', '', '阜城县', '217', '3');
INSERT INTO `region` VALUES ('228', '131181', '', '', '冀州市', '217', '3');
INSERT INTO `region` VALUES ('229', '131182', '', '', '深州市', '217', '3');
INSERT INTO `region` VALUES ('230', '140000', '山西省', '', '', '1', '2');
INSERT INTO `region` VALUES ('231', '140100', '', '太原市', '', '230', '2');
INSERT INTO `region` VALUES ('232', '140101', '', '', '市辖区', '231', '3');
INSERT INTO `region` VALUES ('233', '140105', '', '', '小店区', '231', '3');
INSERT INTO `region` VALUES ('234', '140106', '', '', '迎泽区', '231', '3');
INSERT INTO `region` VALUES ('235', '140107', '', '', '杏花岭区', '231', '3');
INSERT INTO `region` VALUES ('236', '140108', '', '', '尖草坪区', '231', '3');
INSERT INTO `region` VALUES ('237', '140109', '', '', '万柏林区', '231', '3');
INSERT INTO `region` VALUES ('238', '140110', '', '', '晋源区', '231', '3');
INSERT INTO `region` VALUES ('239', '140121', '', '', '清徐县', '231', '3');
INSERT INTO `region` VALUES ('240', '140122', '', '', '阳曲县', '231', '3');
INSERT INTO `region` VALUES ('241', '140123', '', '', '娄烦县', '231', '3');
INSERT INTO `region` VALUES ('242', '140181', '', '', '古交市', '231', '3');
INSERT INTO `region` VALUES ('243', '140200', '', '大同市', '', '230', '2');
INSERT INTO `region` VALUES ('244', '140201', '', '', '市辖区', '243', '3');
INSERT INTO `region` VALUES ('245', '140202', '', '', '城区', '243', '3');
INSERT INTO `region` VALUES ('246', '140203', '', '', '矿区', '243', '3');
INSERT INTO `region` VALUES ('247', '140211', '', '', '南郊区', '243', '3');
INSERT INTO `region` VALUES ('248', '140212', '', '', '新荣区', '243', '3');
INSERT INTO `region` VALUES ('249', '140221', '', '', '阳高县', '243', '3');
INSERT INTO `region` VALUES ('250', '140222', '', '', '天镇县', '243', '3');
INSERT INTO `region` VALUES ('251', '140223', '', '', '广灵县', '243', '3');
INSERT INTO `region` VALUES ('252', '140224', '', '', '灵丘县', '243', '3');
INSERT INTO `region` VALUES ('253', '140225', '', '', '浑源县', '243', '3');
INSERT INTO `region` VALUES ('254', '140226', '', '', '左云县', '243', '3');
INSERT INTO `region` VALUES ('255', '140227', '', '', '大同县', '243', '3');
INSERT INTO `region` VALUES ('256', '140300', '', '阳泉市', '', '230', '2');
INSERT INTO `region` VALUES ('257', '140301', '', '', '市辖区', '256', '3');
INSERT INTO `region` VALUES ('258', '140302', '', '', '城区', '256', '3');
INSERT INTO `region` VALUES ('259', '140303', '', '', '矿区', '256', '3');
INSERT INTO `region` VALUES ('260', '140311', '', '', '郊区', '256', '3');
INSERT INTO `region` VALUES ('261', '140321', '', '', '平定县', '256', '3');
INSERT INTO `region` VALUES ('262', '140322', '', '', '盂县', '256', '3');
INSERT INTO `region` VALUES ('263', '140400', '', '长治市', '', '230', '2');
INSERT INTO `region` VALUES ('264', '140401', '', '', '市辖区', '263', '3');
INSERT INTO `region` VALUES ('265', '140402', '', '', '城区', '263', '3');
INSERT INTO `region` VALUES ('266', '140411', '', '', '郊区', '263', '3');
INSERT INTO `region` VALUES ('267', '140421', '', '', '长治县', '263', '3');
INSERT INTO `region` VALUES ('268', '140423', '', '', '襄垣县', '263', '3');
INSERT INTO `region` VALUES ('269', '140424', '', '', '屯留县', '263', '3');
INSERT INTO `region` VALUES ('270', '140425', '', '', '平顺县', '263', '3');
INSERT INTO `region` VALUES ('271', '140426', '', '', '黎城县', '263', '3');
INSERT INTO `region` VALUES ('272', '140427', '', '', '壶关县', '263', '3');
INSERT INTO `region` VALUES ('273', '140428', '', '', '长子县', '263', '3');
INSERT INTO `region` VALUES ('274', '140429', '', '', '武乡县', '263', '3');
INSERT INTO `region` VALUES ('275', '140430', '', '', '沁县', '263', '3');
INSERT INTO `region` VALUES ('276', '140431', '', '', '沁源县', '263', '3');
INSERT INTO `region` VALUES ('277', '140481', '', '', '潞城市', '263', '3');
INSERT INTO `region` VALUES ('278', '140500', '', '晋城市', '', '230', '2');
INSERT INTO `region` VALUES ('279', '140501', '', '', '市辖区', '278', '3');
INSERT INTO `region` VALUES ('280', '140502', '', '', '城区', '278', '3');
INSERT INTO `region` VALUES ('281', '140521', '', '', '沁水县', '278', '3');
INSERT INTO `region` VALUES ('282', '140522', '', '', '阳城县', '278', '3');
INSERT INTO `region` VALUES ('283', '140524', '', '', '陵川县', '278', '3');
INSERT INTO `region` VALUES ('284', '140525', '', '', '泽州县', '278', '3');
INSERT INTO `region` VALUES ('285', '140581', '', '', '高平市', '278', '3');
INSERT INTO `region` VALUES ('286', '140600', '', '朔州市', '', '230', '2');
INSERT INTO `region` VALUES ('287', '140601', '', '', '市辖区', '286', '3');
INSERT INTO `region` VALUES ('288', '140602', '', '', '朔城区', '286', '3');
INSERT INTO `region` VALUES ('289', '140603', '', '', '平鲁区', '286', '3');
INSERT INTO `region` VALUES ('290', '140621', '', '', '山阴县', '286', '3');
INSERT INTO `region` VALUES ('291', '140622', '', '', '应县', '286', '3');
INSERT INTO `region` VALUES ('292', '140623', '', '', '右玉县', '286', '3');
INSERT INTO `region` VALUES ('293', '140624', '', '', '怀仁县', '286', '3');
INSERT INTO `region` VALUES ('294', '140700', '', '晋中市', '', '230', '2');
INSERT INTO `region` VALUES ('295', '140701', '', '', '市辖区', '294', '3');
INSERT INTO `region` VALUES ('296', '140702', '', '', '榆次区', '294', '3');
INSERT INTO `region` VALUES ('297', '140721', '', '', '榆社县', '294', '3');
INSERT INTO `region` VALUES ('298', '140722', '', '', '左权县', '294', '3');
INSERT INTO `region` VALUES ('299', '140723', '', '', '和顺县', '294', '3');
INSERT INTO `region` VALUES ('300', '140724', '', '', '昔阳县', '294', '3');
INSERT INTO `region` VALUES ('301', '140725', '', '', '寿阳县', '294', '3');
INSERT INTO `region` VALUES ('302', '140726', '', '', '太谷县', '294', '3');
INSERT INTO `region` VALUES ('303', '140727', '', '', '祁县', '294', '3');
INSERT INTO `region` VALUES ('304', '140728', '', '', '平遥县', '294', '3');
INSERT INTO `region` VALUES ('305', '140729', '', '', '灵石县', '294', '3');
INSERT INTO `region` VALUES ('306', '140781', '', '', '介休市', '294', '3');
INSERT INTO `region` VALUES ('307', '140800', '', '运城市', '', '230', '2');
INSERT INTO `region` VALUES ('308', '140801', '', '', '市辖区', '307', '3');
INSERT INTO `region` VALUES ('309', '140802', '', '', '盐湖区', '307', '3');
INSERT INTO `region` VALUES ('310', '140821', '', '', '临猗县', '307', '3');
INSERT INTO `region` VALUES ('311', '140822', '', '', '万荣县', '307', '3');
INSERT INTO `region` VALUES ('312', '140823', '', '', '闻喜县', '307', '3');
INSERT INTO `region` VALUES ('313', '140824', '', '', '稷山县', '307', '3');
INSERT INTO `region` VALUES ('314', '140825', '', '', '新绛县', '307', '3');
INSERT INTO `region` VALUES ('315', '140826', '', '', '绛县', '307', '3');
INSERT INTO `region` VALUES ('316', '140827', '', '', '垣曲县', '307', '3');
INSERT INTO `region` VALUES ('317', '140828', '', '', '夏县', '307', '3');
INSERT INTO `region` VALUES ('318', '140829', '', '', '平陆县', '307', '3');
INSERT INTO `region` VALUES ('319', '140830', '', '', '芮城县', '307', '3');
INSERT INTO `region` VALUES ('320', '140881', '', '', '永济市', '307', '3');
INSERT INTO `region` VALUES ('321', '140882', '', '', '河津市', '307', '3');
INSERT INTO `region` VALUES ('322', '140900', '', '忻州市', '', '230', '2');
INSERT INTO `region` VALUES ('323', '140901', '', '', '市辖区', '322', '3');
INSERT INTO `region` VALUES ('324', '140902', '', '', '忻府区', '322', '3');
INSERT INTO `region` VALUES ('325', '140921', '', '', '定襄县', '322', '3');
INSERT INTO `region` VALUES ('326', '140922', '', '', '五台县', '322', '3');
INSERT INTO `region` VALUES ('327', '140923', '', '', '代县', '322', '3');
INSERT INTO `region` VALUES ('328', '140924', '', '', '繁峙县', '322', '3');
INSERT INTO `region` VALUES ('329', '140925', '', '', '宁武县', '322', '3');
INSERT INTO `region` VALUES ('330', '140926', '', '', '静乐县', '322', '3');
INSERT INTO `region` VALUES ('331', '140927', '', '', '神池县', '322', '3');
INSERT INTO `region` VALUES ('332', '140928', '', '', '五寨县', '322', '3');
INSERT INTO `region` VALUES ('333', '140929', '', '', '岢岚县', '322', '3');
INSERT INTO `region` VALUES ('334', '140930', '', '', '河曲县', '322', '3');
INSERT INTO `region` VALUES ('335', '140931', '', '', '保德县', '322', '3');
INSERT INTO `region` VALUES ('336', '140932', '', '', '偏关县', '322', '3');
INSERT INTO `region` VALUES ('337', '140981', '', '', '原平市', '322', '3');
INSERT INTO `region` VALUES ('338', '141000', '', '临汾市', '', '230', '2');
INSERT INTO `region` VALUES ('339', '141001', '', '', '市辖区', '338', '3');
INSERT INTO `region` VALUES ('340', '141002', '', '', '尧都区', '338', '3');
INSERT INTO `region` VALUES ('341', '141021', '', '', '曲沃县', '338', '3');
INSERT INTO `region` VALUES ('342', '141022', '', '', '翼城县', '338', '3');
INSERT INTO `region` VALUES ('343', '141023', '', '', '襄汾县', '338', '3');
INSERT INTO `region` VALUES ('344', '141024', '', '', '洪洞县', '338', '3');
INSERT INTO `region` VALUES ('345', '141025', '', '', '古县', '338', '3');
INSERT INTO `region` VALUES ('346', '141026', '', '', '安泽县', '338', '3');
INSERT INTO `region` VALUES ('347', '141027', '', '', '浮山县', '338', '3');
INSERT INTO `region` VALUES ('348', '141028', '', '', '吉县', '338', '3');
INSERT INTO `region` VALUES ('349', '141029', '', '', '乡宁县', '338', '3');
INSERT INTO `region` VALUES ('350', '141030', '', '', '大宁县', '338', '3');
INSERT INTO `region` VALUES ('351', '141031', '', '', '隰县', '338', '3');
INSERT INTO `region` VALUES ('352', '141032', '', '', '永和县', '338', '3');
INSERT INTO `region` VALUES ('353', '141033', '', '', '蒲县', '338', '3');
INSERT INTO `region` VALUES ('354', '141034', '', '', '汾西县', '338', '3');
INSERT INTO `region` VALUES ('355', '141081', '', '', '侯马市', '338', '3');
INSERT INTO `region` VALUES ('356', '141082', '', '', '霍州市', '338', '3');
INSERT INTO `region` VALUES ('357', '141100', '', '吕梁市', '', '230', '2');
INSERT INTO `region` VALUES ('358', '141101', '', '', '市辖区', '357', '3');
INSERT INTO `region` VALUES ('359', '141102', '', '', '离石区', '357', '3');
INSERT INTO `region` VALUES ('360', '141121', '', '', '文水县', '357', '3');
INSERT INTO `region` VALUES ('361', '141122', '', '', '交城县', '357', '3');
INSERT INTO `region` VALUES ('362', '141123', '', '', '兴县', '357', '3');
INSERT INTO `region` VALUES ('363', '141124', '', '', '临县', '357', '3');
INSERT INTO `region` VALUES ('364', '141125', '', '', '柳林县', '357', '3');
INSERT INTO `region` VALUES ('365', '141126', '', '', '石楼县', '357', '3');
INSERT INTO `region` VALUES ('366', '141127', '', '', '岚县', '357', '3');
INSERT INTO `region` VALUES ('367', '141128', '', '', '方山县', '357', '3');
INSERT INTO `region` VALUES ('368', '141129', '', '', '中阳县', '357', '3');
INSERT INTO `region` VALUES ('369', '141130', '', '', '交口县', '357', '3');
INSERT INTO `region` VALUES ('370', '141181', '', '', '孝义市', '357', '3');
INSERT INTO `region` VALUES ('371', '141182', '', '', '汾阳市', '357', '3');
INSERT INTO `region` VALUES ('372', '150000', '内蒙古自治区', '', '', '1', '2');
INSERT INTO `region` VALUES ('373', '150100', '', '呼和浩特市', '', '372', '2');
INSERT INTO `region` VALUES ('374', '150101', '', '', '市辖区', '373', '3');
INSERT INTO `region` VALUES ('375', '150102', '', '', '新城区', '373', '3');
INSERT INTO `region` VALUES ('376', '150103', '', '', '回民区', '373', '3');
INSERT INTO `region` VALUES ('377', '150104', '', '', '玉泉区', '373', '3');
INSERT INTO `region` VALUES ('378', '150105', '', '', '赛罕区', '373', '3');
INSERT INTO `region` VALUES ('379', '150121', '', '', '土默特左旗', '373', '3');
INSERT INTO `region` VALUES ('380', '150122', '', '', '托克托县', '373', '3');
INSERT INTO `region` VALUES ('381', '150123', '', '', '和林格尔县', '373', '3');
INSERT INTO `region` VALUES ('382', '150124', '', '', '清水河县', '373', '3');
INSERT INTO `region` VALUES ('383', '150125', '', '', '武川县', '373', '3');
INSERT INTO `region` VALUES ('384', '150200', '', '包头市', '', '372', '2');
INSERT INTO `region` VALUES ('385', '150201', '', '', '市辖区', '384', '3');
INSERT INTO `region` VALUES ('386', '150202', '', '', '东河区', '384', '3');
INSERT INTO `region` VALUES ('387', '150203', '', '', '昆都仑区', '384', '3');
INSERT INTO `region` VALUES ('388', '150204', '', '', '青山区', '384', '3');
INSERT INTO `region` VALUES ('389', '150205', '', '', '石拐区', '384', '3');
INSERT INTO `region` VALUES ('390', '150206', '', '', '白云鄂博矿区', '384', '3');
INSERT INTO `region` VALUES ('391', '150207', '', '', '九原区', '384', '3');
INSERT INTO `region` VALUES ('392', '150221', '', '', '土默特右旗', '384', '3');
INSERT INTO `region` VALUES ('393', '150222', '', '', '固阳县', '384', '3');
INSERT INTO `region` VALUES ('394', '150223', '', '', '达尔罕茂明安联合旗', '384', '3');
INSERT INTO `region` VALUES ('395', '150300', '', '乌海市', '', '372', '2');
INSERT INTO `region` VALUES ('396', '150301', '', '', '市辖区', '395', '3');
INSERT INTO `region` VALUES ('397', '150302', '', '', '海勃湾区', '395', '3');
INSERT INTO `region` VALUES ('398', '150303', '', '', '海南区', '395', '3');
INSERT INTO `region` VALUES ('399', '150304', '', '', '乌达区', '395', '3');
INSERT INTO `region` VALUES ('400', '150400', '', '赤峰市', '', '372', '2');
INSERT INTO `region` VALUES ('401', '150401', '', '', '市辖区', '400', '3');
INSERT INTO `region` VALUES ('402', '150402', '', '', '红山区', '400', '3');
INSERT INTO `region` VALUES ('403', '150403', '', '', '元宝山区', '400', '3');
INSERT INTO `region` VALUES ('404', '150404', '', '', '松山区', '400', '3');
INSERT INTO `region` VALUES ('405', '150421', '', '', '阿鲁科尔沁旗', '400', '3');
INSERT INTO `region` VALUES ('406', '150422', '', '', '巴林左旗', '400', '3');
INSERT INTO `region` VALUES ('407', '150423', '', '', '巴林右旗', '400', '3');
INSERT INTO `region` VALUES ('408', '150424', '', '', '林西县', '400', '3');
INSERT INTO `region` VALUES ('409', '150425', '', '', '克什克腾旗', '400', '3');
INSERT INTO `region` VALUES ('410', '150426', '', '', '翁牛特旗', '400', '3');
INSERT INTO `region` VALUES ('411', '150428', '', '', '喀喇沁旗', '400', '3');
INSERT INTO `region` VALUES ('412', '150429', '', '', '宁城县', '400', '3');
INSERT INTO `region` VALUES ('413', '150430', '', '', '敖汉旗', '400', '3');
INSERT INTO `region` VALUES ('414', '150500', '', '通辽市', '', '372', '2');
INSERT INTO `region` VALUES ('415', '150501', '', '', '市辖区', '414', '3');
INSERT INTO `region` VALUES ('416', '150502', '', '', '科尔沁区', '414', '3');
INSERT INTO `region` VALUES ('417', '150521', '', '', '科尔沁左翼中旗', '414', '3');
INSERT INTO `region` VALUES ('418', '150522', '', '', '科尔沁左翼后旗', '414', '3');
INSERT INTO `region` VALUES ('419', '150523', '', '', '开鲁县', '414', '3');
INSERT INTO `region` VALUES ('420', '150524', '', '', '库伦旗', '414', '3');
INSERT INTO `region` VALUES ('421', '150525', '', '', '奈曼旗', '414', '3');
INSERT INTO `region` VALUES ('422', '150526', '', '', '扎鲁特旗', '414', '3');
INSERT INTO `region` VALUES ('423', '150581', '', '', '霍林郭勒市', '414', '3');
INSERT INTO `region` VALUES ('424', '150600', '', '鄂尔多斯市', '', '372', '2');
INSERT INTO `region` VALUES ('425', '150601', '', '', '市辖区', '424', '3');
INSERT INTO `region` VALUES ('426', '150602', '', '', '东胜区', '424', '3');
INSERT INTO `region` VALUES ('427', '150621', '', '', '达拉特旗', '424', '3');
INSERT INTO `region` VALUES ('428', '150622', '', '', '准格尔旗', '424', '3');
INSERT INTO `region` VALUES ('429', '150623', '', '', '鄂托克前旗', '424', '3');
INSERT INTO `region` VALUES ('430', '150624', '', '', '鄂托克旗', '424', '3');
INSERT INTO `region` VALUES ('431', '150625', '', '', '杭锦旗', '424', '3');
INSERT INTO `region` VALUES ('432', '150626', '', '', '乌审旗', '424', '3');
INSERT INTO `region` VALUES ('433', '150627', '', '', '伊金霍洛旗', '424', '3');
INSERT INTO `region` VALUES ('434', '150700', '', '呼伦贝尔市', '', '372', '2');
INSERT INTO `region` VALUES ('435', '150701', '', '', '市辖区', '434', '3');
INSERT INTO `region` VALUES ('436', '150702', '', '', '海拉尔区', '434', '3');
INSERT INTO `region` VALUES ('437', '150703', '', '', '扎赉诺尔区', '434', '3');
INSERT INTO `region` VALUES ('438', '150721', '', '', '阿荣旗', '434', '3');
INSERT INTO `region` VALUES ('439', '150722', '', '', '莫力达瓦达斡尔族自治旗', '434', '3');
INSERT INTO `region` VALUES ('440', '150723', '', '', '鄂伦春自治旗', '434', '3');
INSERT INTO `region` VALUES ('441', '150724', '', '', '鄂温克族自治旗', '434', '3');
INSERT INTO `region` VALUES ('442', '150725', '', '', '陈巴尔虎旗', '434', '3');
INSERT INTO `region` VALUES ('443', '150726', '', '', '新巴尔虎左旗', '434', '3');
INSERT INTO `region` VALUES ('444', '150727', '', '', '新巴尔虎右旗', '434', '3');
INSERT INTO `region` VALUES ('445', '150781', '', '', '满洲里市', '434', '3');
INSERT INTO `region` VALUES ('446', '150782', '', '', '牙克石市', '434', '3');
INSERT INTO `region` VALUES ('447', '150783', '', '', '扎兰屯市', '434', '3');
INSERT INTO `region` VALUES ('448', '150784', '', '', '额尔古纳市', '434', '3');
INSERT INTO `region` VALUES ('449', '150785', '', '', '根河市', '434', '3');
INSERT INTO `region` VALUES ('450', '150800', '', '巴彦淖尔市', '', '372', '2');
INSERT INTO `region` VALUES ('451', '150801', '', '', '市辖区', '450', '3');
INSERT INTO `region` VALUES ('452', '150802', '', '', '临河区', '450', '3');
INSERT INTO `region` VALUES ('453', '150821', '', '', '五原县', '450', '3');
INSERT INTO `region` VALUES ('454', '150822', '', '', '磴口县', '450', '3');
INSERT INTO `region` VALUES ('455', '150823', '', '', '乌拉特前旗', '450', '3');
INSERT INTO `region` VALUES ('456', '150824', '', '', '乌拉特中旗', '450', '3');
INSERT INTO `region` VALUES ('457', '150825', '', '', '乌拉特后旗', '450', '3');
INSERT INTO `region` VALUES ('458', '150826', '', '', '杭锦后旗', '450', '3');
INSERT INTO `region` VALUES ('459', '150900', '', '乌兰察布市', '', '372', '2');
INSERT INTO `region` VALUES ('460', '150901', '', '', '市辖区', '459', '3');
INSERT INTO `region` VALUES ('461', '150902', '', '', '集宁区', '459', '3');
INSERT INTO `region` VALUES ('462', '150921', '', '', '卓资县', '459', '3');
INSERT INTO `region` VALUES ('463', '150922', '', '', '化德县', '459', '3');
INSERT INTO `region` VALUES ('464', '150923', '', '', '商都县', '459', '3');
INSERT INTO `region` VALUES ('465', '150924', '', '', '兴和县', '459', '3');
INSERT INTO `region` VALUES ('466', '150925', '', '', '凉城县', '459', '3');
INSERT INTO `region` VALUES ('467', '150926', '', '', '察哈尔右翼前旗', '459', '3');
INSERT INTO `region` VALUES ('468', '150927', '', '', '察哈尔右翼中旗', '459', '3');
INSERT INTO `region` VALUES ('469', '150928', '', '', '察哈尔右翼后旗', '459', '3');
INSERT INTO `region` VALUES ('470', '150929', '', '', '四子王旗', '459', '3');
INSERT INTO `region` VALUES ('471', '150981', '', '', '丰镇市', '459', '3');
INSERT INTO `region` VALUES ('472', '152200', '', '兴安盟', '', '372', '2');
INSERT INTO `region` VALUES ('473', '152201', '', '', '乌兰浩特市', '472', '3');
INSERT INTO `region` VALUES ('474', '152202', '', '', '阿尔山市', '472', '3');
INSERT INTO `region` VALUES ('475', '152221', '', '', '科尔沁右翼前旗', '472', '3');
INSERT INTO `region` VALUES ('476', '152222', '', '', '科尔沁右翼中旗', '472', '3');
INSERT INTO `region` VALUES ('477', '152223', '', '', '扎赉特旗', '472', '3');
INSERT INTO `region` VALUES ('478', '152224', '', '', '突泉县', '472', '3');
INSERT INTO `region` VALUES ('479', '152500', '', '锡林郭勒盟', '', '372', '2');
INSERT INTO `region` VALUES ('480', '152501', '', '', '二连浩特市', '479', '3');
INSERT INTO `region` VALUES ('481', '152502', '', '', '锡林浩特市', '479', '3');
INSERT INTO `region` VALUES ('482', '152522', '', '', '阿巴嘎旗', '479', '3');
INSERT INTO `region` VALUES ('483', '152523', '', '', '苏尼特左旗', '479', '3');
INSERT INTO `region` VALUES ('484', '152524', '', '', '苏尼特右旗', '479', '3');
INSERT INTO `region` VALUES ('485', '152525', '', '', '东乌珠穆沁旗', '479', '3');
INSERT INTO `region` VALUES ('486', '152526', '', '', '西乌珠穆沁旗', '479', '3');
INSERT INTO `region` VALUES ('487', '152527', '', '', '太仆寺旗', '479', '3');
INSERT INTO `region` VALUES ('488', '152528', '', '', '镶黄旗', '479', '3');
INSERT INTO `region` VALUES ('489', '152529', '', '', '正镶白旗', '479', '3');
INSERT INTO `region` VALUES ('490', '152530', '', '', '正蓝旗', '479', '3');
INSERT INTO `region` VALUES ('491', '152531', '', '', '多伦县', '479', '3');
INSERT INTO `region` VALUES ('492', '152900', '', '阿拉善盟', '', '372', '2');
INSERT INTO `region` VALUES ('493', '152921', '', '', '阿拉善左旗', '492', '3');
INSERT INTO `region` VALUES ('494', '152922', '', '', '阿拉善右旗', '492', '3');
INSERT INTO `region` VALUES ('495', '152923', '', '', '额济纳旗', '492', '3');
INSERT INTO `region` VALUES ('496', '210000', '辽宁省', '', '', '1', '2');
INSERT INTO `region` VALUES ('497', '210100', '', '沈阳市', '', '496', '2');
INSERT INTO `region` VALUES ('498', '210101', '', '', '市辖区', '497', '3');
INSERT INTO `region` VALUES ('499', '210102', '', '', '和平区', '497', '3');
INSERT INTO `region` VALUES ('500', '210103', '', '', '沈河区', '497', '3');
INSERT INTO `region` VALUES ('501', '210104', '', '', '大东区', '497', '3');
INSERT INTO `region` VALUES ('502', '210105', '', '', '皇姑区', '497', '3');
INSERT INTO `region` VALUES ('503', '210106', '', '', '铁西区', '497', '3');
INSERT INTO `region` VALUES ('504', '210111', '', '', '苏家屯区', '497', '3');
INSERT INTO `region` VALUES ('505', '210112', '', '', '浑南区', '497', '3');
INSERT INTO `region` VALUES ('506', '210113', '', '', '沈北新区', '497', '3');
INSERT INTO `region` VALUES ('507', '210114', '', '', '于洪区', '497', '3');
INSERT INTO `region` VALUES ('508', '210122', '', '', '辽中县', '497', '3');
INSERT INTO `region` VALUES ('509', '210123', '', '', '康平县', '497', '3');
INSERT INTO `region` VALUES ('510', '210124', '', '', '法库县', '497', '3');
INSERT INTO `region` VALUES ('511', '210181', '', '', '新民市', '497', '3');
INSERT INTO `region` VALUES ('512', '210200', '', '大连市', '', '496', '2');
INSERT INTO `region` VALUES ('513', '210201', '', '', '市辖区', '512', '3');
INSERT INTO `region` VALUES ('514', '210202', '', '', '中山区', '512', '3');
INSERT INTO `region` VALUES ('515', '210203', '', '', '西岗区', '512', '3');
INSERT INTO `region` VALUES ('516', '210204', '', '', '沙河口区', '512', '3');
INSERT INTO `region` VALUES ('517', '210211', '', '', '甘井子区', '512', '3');
INSERT INTO `region` VALUES ('518', '210212', '', '', '旅顺口区', '512', '3');
INSERT INTO `region` VALUES ('519', '210213', '', '', '金州区', '512', '3');
INSERT INTO `region` VALUES ('520', '210224', '', '', '长海县', '512', '3');
INSERT INTO `region` VALUES ('521', '210281', '', '', '瓦房店市', '512', '3');
INSERT INTO `region` VALUES ('522', '210282', '', '', '普兰店市', '512', '3');
INSERT INTO `region` VALUES ('523', '210283', '', '', '庄河市', '512', '3');
INSERT INTO `region` VALUES ('524', '210300', '', '鞍山市', '', '496', '2');
INSERT INTO `region` VALUES ('525', '210301', '', '', '市辖区', '524', '3');
INSERT INTO `region` VALUES ('526', '210302', '', '', '铁东区', '524', '3');
INSERT INTO `region` VALUES ('527', '210303', '', '', '铁西区', '524', '3');
INSERT INTO `region` VALUES ('528', '210304', '', '', '立山区', '524', '3');
INSERT INTO `region` VALUES ('529', '210311', '', '', '千山区', '524', '3');
INSERT INTO `region` VALUES ('530', '210321', '', '', '台安县', '524', '3');
INSERT INTO `region` VALUES ('531', '210323', '', '', '岫岩满族自治县', '524', '3');
INSERT INTO `region` VALUES ('532', '210381', '', '', '海城市', '524', '3');
INSERT INTO `region` VALUES ('533', '210400', '', '抚顺市', '', '496', '2');
INSERT INTO `region` VALUES ('534', '210401', '', '', '市辖区', '533', '3');
INSERT INTO `region` VALUES ('535', '210402', '', '', '新抚区', '533', '3');
INSERT INTO `region` VALUES ('536', '210403', '', '', '东洲区', '533', '3');
INSERT INTO `region` VALUES ('537', '210404', '', '', '望花区', '533', '3');
INSERT INTO `region` VALUES ('538', '210411', '', '', '顺城区', '533', '3');
INSERT INTO `region` VALUES ('539', '210421', '', '', '抚顺县', '533', '3');
INSERT INTO `region` VALUES ('540', '210422', '', '', '新宾满族自治县', '533', '3');
INSERT INTO `region` VALUES ('541', '210423', '', '', '清原满族自治县', '533', '3');
INSERT INTO `region` VALUES ('542', '210500', '', '本溪市', '', '496', '2');
INSERT INTO `region` VALUES ('543', '210501', '', '', '市辖区', '542', '3');
INSERT INTO `region` VALUES ('544', '210502', '', '', '平山区', '542', '3');
INSERT INTO `region` VALUES ('545', '210503', '', '', '溪湖区', '542', '3');
INSERT INTO `region` VALUES ('546', '210504', '', '', '明山区', '542', '3');
INSERT INTO `region` VALUES ('547', '210505', '', '', '南芬区', '542', '3');
INSERT INTO `region` VALUES ('548', '210521', '', '', '本溪满族自治县', '542', '3');
INSERT INTO `region` VALUES ('549', '210522', '', '', '桓仁满族自治县', '542', '3');
INSERT INTO `region` VALUES ('550', '210600', '', '丹东市', '', '496', '2');
INSERT INTO `region` VALUES ('551', '210601', '', '', '市辖区', '550', '3');
INSERT INTO `region` VALUES ('552', '210602', '', '', '元宝区', '550', '3');
INSERT INTO `region` VALUES ('553', '210603', '', '', '振兴区', '550', '3');
INSERT INTO `region` VALUES ('554', '210604', '', '', '振安区', '550', '3');
INSERT INTO `region` VALUES ('555', '210624', '', '', '宽甸满族自治县', '550', '3');
INSERT INTO `region` VALUES ('556', '210681', '', '', '东港市', '550', '3');
INSERT INTO `region` VALUES ('557', '210682', '', '', '凤城市', '550', '3');
INSERT INTO `region` VALUES ('558', '210700', '', '锦州市', '', '496', '2');
INSERT INTO `region` VALUES ('559', '210701', '', '', '市辖区', '558', '3');
INSERT INTO `region` VALUES ('560', '210702', '', '', '古塔区', '558', '3');
INSERT INTO `region` VALUES ('561', '210703', '', '', '凌河区', '558', '3');
INSERT INTO `region` VALUES ('562', '210711', '', '', '太和区', '558', '3');
INSERT INTO `region` VALUES ('563', '210726', '', '', '黑山县', '558', '3');
INSERT INTO `region` VALUES ('564', '210727', '', '', '义县', '558', '3');
INSERT INTO `region` VALUES ('565', '210781', '', '', '凌海市', '558', '3');
INSERT INTO `region` VALUES ('566', '210782', '', '', '北镇市', '558', '3');
INSERT INTO `region` VALUES ('567', '210800', '', '营口市', '', '496', '2');
INSERT INTO `region` VALUES ('568', '210801', '', '', '市辖区', '567', '3');
INSERT INTO `region` VALUES ('569', '210802', '', '', '站前区', '567', '3');
INSERT INTO `region` VALUES ('570', '210803', '', '', '西市区', '567', '3');
INSERT INTO `region` VALUES ('571', '210804', '', '', '鲅鱼圈区', '567', '3');
INSERT INTO `region` VALUES ('572', '210811', '', '', '老边区', '567', '3');
INSERT INTO `region` VALUES ('573', '210881', '', '', '盖州市', '567', '3');
INSERT INTO `region` VALUES ('574', '210882', '', '', '大石桥市', '567', '3');
INSERT INTO `region` VALUES ('575', '210900', '', '阜新市', '', '496', '2');
INSERT INTO `region` VALUES ('576', '210901', '', '', '市辖区', '575', '3');
INSERT INTO `region` VALUES ('577', '210902', '', '', '海州区', '575', '3');
INSERT INTO `region` VALUES ('578', '210903', '', '', '新邱区', '575', '3');
INSERT INTO `region` VALUES ('579', '210904', '', '', '太平区', '575', '3');
INSERT INTO `region` VALUES ('580', '210905', '', '', '清河门区', '575', '3');
INSERT INTO `region` VALUES ('581', '210911', '', '', '细河区', '575', '3');
INSERT INTO `region` VALUES ('582', '210921', '', '', '阜新蒙古族自治县', '575', '3');
INSERT INTO `region` VALUES ('583', '210922', '', '', '彰武县', '575', '3');
INSERT INTO `region` VALUES ('584', '211000', '', '辽阳市', '', '496', '2');
INSERT INTO `region` VALUES ('585', '211001', '', '', '市辖区', '584', '3');
INSERT INTO `region` VALUES ('586', '211002', '', '', '白塔区', '584', '3');
INSERT INTO `region` VALUES ('587', '211003', '', '', '文圣区', '584', '3');
INSERT INTO `region` VALUES ('588', '211004', '', '', '宏伟区', '584', '3');
INSERT INTO `region` VALUES ('589', '211005', '', '', '弓长岭区', '584', '3');
INSERT INTO `region` VALUES ('590', '211011', '', '', '太子河区', '584', '3');
INSERT INTO `region` VALUES ('591', '211021', '', '', '辽阳县', '584', '3');
INSERT INTO `region` VALUES ('592', '211081', '', '', '灯塔市', '584', '3');
INSERT INTO `region` VALUES ('593', '211100', '', '盘锦市', '', '496', '2');
INSERT INTO `region` VALUES ('594', '211101', '', '', '市辖区', '593', '3');
INSERT INTO `region` VALUES ('595', '211102', '', '', '双台子区', '593', '3');
INSERT INTO `region` VALUES ('596', '211103', '', '', '兴隆台区', '593', '3');
INSERT INTO `region` VALUES ('597', '211121', '', '', '大洼县', '593', '3');
INSERT INTO `region` VALUES ('598', '211122', '', '', '盘山县', '593', '3');
INSERT INTO `region` VALUES ('599', '211200', '', '铁岭市', '', '496', '2');
INSERT INTO `region` VALUES ('600', '211201', '', '', '市辖区', '599', '3');
INSERT INTO `region` VALUES ('601', '211202', '', '', '银州区', '599', '3');
INSERT INTO `region` VALUES ('602', '211204', '', '', '清河区', '599', '3');
INSERT INTO `region` VALUES ('603', '211221', '', '', '铁岭县', '599', '3');
INSERT INTO `region` VALUES ('604', '211223', '', '', '西丰县', '599', '3');
INSERT INTO `region` VALUES ('605', '211224', '', '', '昌图县', '599', '3');
INSERT INTO `region` VALUES ('606', '211281', '', '', '调兵山市', '599', '3');
INSERT INTO `region` VALUES ('607', '211282', '', '', '开原市', '599', '3');
INSERT INTO `region` VALUES ('608', '211300', '', '朝阳市', '', '496', '2');
INSERT INTO `region` VALUES ('609', '211301', '', '', '市辖区', '608', '3');
INSERT INTO `region` VALUES ('610', '211302', '', '', '双塔区', '608', '3');
INSERT INTO `region` VALUES ('611', '211303', '', '', '龙城区', '608', '3');
INSERT INTO `region` VALUES ('612', '211321', '', '', '朝阳县', '608', '3');
INSERT INTO `region` VALUES ('613', '211322', '', '', '建平县', '608', '3');
INSERT INTO `region` VALUES ('614', '211324', '', '', '喀喇沁左翼蒙古族自治县', '608', '3');
INSERT INTO `region` VALUES ('615', '211381', '', '', '北票市', '608', '3');
INSERT INTO `region` VALUES ('616', '211382', '', '', '凌源市', '608', '3');
INSERT INTO `region` VALUES ('617', '211400', '', '葫芦岛市', '', '496', '2');
INSERT INTO `region` VALUES ('618', '211401', '', '', '市辖区', '617', '3');
INSERT INTO `region` VALUES ('619', '211402', '', '', '连山区', '617', '3');
INSERT INTO `region` VALUES ('620', '211403', '', '', '龙港区', '617', '3');
INSERT INTO `region` VALUES ('621', '211404', '', '', '南票区', '617', '3');
INSERT INTO `region` VALUES ('622', '211421', '', '', '绥中县', '617', '3');
INSERT INTO `region` VALUES ('623', '211422', '', '', '建昌县', '617', '3');
INSERT INTO `region` VALUES ('624', '211481', '', '', '兴城市', '617', '3');
INSERT INTO `region` VALUES ('625', '220000', '吉林省', '', '', '1', '2');
INSERT INTO `region` VALUES ('626', '220100', '', '长春市', '', '625', '2');
INSERT INTO `region` VALUES ('627', '220101', '', '', '市辖区', '626', '3');
INSERT INTO `region` VALUES ('628', '220102', '', '', '南关区', '626', '3');
INSERT INTO `region` VALUES ('629', '220103', '', '', '宽城区', '626', '3');
INSERT INTO `region` VALUES ('630', '220104', '', '', '朝阳区', '626', '3');
INSERT INTO `region` VALUES ('631', '220105', '', '', '二道区', '626', '3');
INSERT INTO `region` VALUES ('632', '220106', '', '', '绿园区', '626', '3');
INSERT INTO `region` VALUES ('633', '220112', '', '', '双阳区', '626', '3');
INSERT INTO `region` VALUES ('634', '220113', '', '', '九台区', '626', '3');
INSERT INTO `region` VALUES ('635', '220122', '', '', '农安县', '626', '3');
INSERT INTO `region` VALUES ('636', '220182', '', '', '榆树市', '626', '3');
INSERT INTO `region` VALUES ('637', '220183', '', '', '德惠市', '626', '3');
INSERT INTO `region` VALUES ('638', '220200', '', '吉林市', '', '625', '2');
INSERT INTO `region` VALUES ('639', '220201', '', '', '市辖区', '638', '3');
INSERT INTO `region` VALUES ('640', '220202', '', '', '昌邑区', '638', '3');
INSERT INTO `region` VALUES ('641', '220203', '', '', '龙潭区', '638', '3');
INSERT INTO `region` VALUES ('642', '220204', '', '', '船营区', '638', '3');
INSERT INTO `region` VALUES ('643', '220211', '', '', '丰满区', '638', '3');
INSERT INTO `region` VALUES ('644', '220221', '', '', '永吉县', '638', '3');
INSERT INTO `region` VALUES ('645', '220281', '', '', '蛟河市', '638', '3');
INSERT INTO `region` VALUES ('646', '220282', '', '', '桦甸市', '638', '3');
INSERT INTO `region` VALUES ('647', '220283', '', '', '舒兰市', '638', '3');
INSERT INTO `region` VALUES ('648', '220284', '', '', '磐石市', '638', '3');
INSERT INTO `region` VALUES ('649', '220300', '', '四平市', '', '625', '2');
INSERT INTO `region` VALUES ('650', '220301', '', '', '市辖区', '649', '3');
INSERT INTO `region` VALUES ('651', '220302', '', '', '铁西区', '649', '3');
INSERT INTO `region` VALUES ('652', '220303', '', '', '铁东区', '649', '3');
INSERT INTO `region` VALUES ('653', '220322', '', '', '梨树县', '649', '3');
INSERT INTO `region` VALUES ('654', '220323', '', '', '伊通满族自治县', '649', '3');
INSERT INTO `region` VALUES ('655', '220381', '', '', '公主岭市', '649', '3');
INSERT INTO `region` VALUES ('656', '220382', '', '', '双辽市', '649', '3');
INSERT INTO `region` VALUES ('657', '220400', '', '辽源市', '', '625', '2');
INSERT INTO `region` VALUES ('658', '220401', '', '', '市辖区', '657', '3');
INSERT INTO `region` VALUES ('659', '220402', '', '', '龙山区', '657', '3');
INSERT INTO `region` VALUES ('660', '220403', '', '', '西安区', '657', '3');
INSERT INTO `region` VALUES ('661', '220421', '', '', '东丰县', '657', '3');
INSERT INTO `region` VALUES ('662', '220422', '', '', '东辽县', '657', '3');
INSERT INTO `region` VALUES ('663', '220500', '', '通化市', '', '625', '2');
INSERT INTO `region` VALUES ('664', '220501', '', '', '市辖区', '663', '3');
INSERT INTO `region` VALUES ('665', '220502', '', '', '东昌区', '663', '3');
INSERT INTO `region` VALUES ('666', '220503', '', '', '二道江区', '663', '3');
INSERT INTO `region` VALUES ('667', '220521', '', '', '通化县', '663', '3');
INSERT INTO `region` VALUES ('668', '220523', '', '', '辉南县', '663', '3');
INSERT INTO `region` VALUES ('669', '220524', '', '', '柳河县', '663', '3');
INSERT INTO `region` VALUES ('670', '220581', '', '', '梅河口市', '663', '3');
INSERT INTO `region` VALUES ('671', '220582', '', '', '集安市', '663', '3');
INSERT INTO `region` VALUES ('672', '220600', '', '白山市', '', '625', '2');
INSERT INTO `region` VALUES ('673', '220601', '', '', '市辖区', '672', '3');
INSERT INTO `region` VALUES ('674', '220602', '', '', '浑江区', '672', '3');
INSERT INTO `region` VALUES ('675', '220605', '', '', '江源区', '672', '3');
INSERT INTO `region` VALUES ('676', '220621', '', '', '抚松县', '672', '3');
INSERT INTO `region` VALUES ('677', '220622', '', '', '靖宇县', '672', '3');
INSERT INTO `region` VALUES ('678', '220623', '', '', '长白朝鲜族自治县', '672', '3');
INSERT INTO `region` VALUES ('679', '220681', '', '', '临江市', '672', '3');
INSERT INTO `region` VALUES ('680', '220700', '', '松原市', '', '625', '2');
INSERT INTO `region` VALUES ('681', '220701', '', '', '市辖区', '680', '3');
INSERT INTO `region` VALUES ('682', '220702', '', '', '宁江区', '680', '3');
INSERT INTO `region` VALUES ('683', '220721', '', '', '前郭尔罗斯蒙古族自治县', '680', '3');
INSERT INTO `region` VALUES ('684', '220722', '', '', '长岭县', '680', '3');
INSERT INTO `region` VALUES ('685', '220723', '', '', '乾安县', '680', '3');
INSERT INTO `region` VALUES ('686', '220781', '', '', '扶余市', '680', '3');
INSERT INTO `region` VALUES ('687', '220800', '', '白城市', '', '625', '2');
INSERT INTO `region` VALUES ('688', '220801', '', '', '市辖区', '687', '3');
INSERT INTO `region` VALUES ('689', '220802', '', '', '洮北区', '687', '3');
INSERT INTO `region` VALUES ('690', '220821', '', '', '镇赉县', '687', '3');
INSERT INTO `region` VALUES ('691', '220822', '', '', '通榆县', '687', '3');
INSERT INTO `region` VALUES ('692', '220881', '', '', '洮南市', '687', '3');
INSERT INTO `region` VALUES ('693', '220882', '', '', '大安市', '687', '3');
INSERT INTO `region` VALUES ('694', '222400', '', '延边朝鲜族自治州', '', '625', '2');
INSERT INTO `region` VALUES ('695', '222401', '', '', '延吉市', '694', '3');
INSERT INTO `region` VALUES ('696', '222402', '', '', '图们市', '694', '3');
INSERT INTO `region` VALUES ('697', '222403', '', '', '敦化市', '694', '3');
INSERT INTO `region` VALUES ('698', '222404', '', '', '珲春市', '694', '3');
INSERT INTO `region` VALUES ('699', '222405', '', '', '龙井市', '694', '3');
INSERT INTO `region` VALUES ('700', '222406', '', '', '和龙市', '694', '3');
INSERT INTO `region` VALUES ('701', '222424', '', '', '汪清县', '694', '3');
INSERT INTO `region` VALUES ('702', '222426', '', '', '安图县', '694', '3');
INSERT INTO `region` VALUES ('703', '230000', '黑龙江省', '', '', '1', '2');
INSERT INTO `region` VALUES ('704', '230100', '', '哈尔滨市', '', '703', '2');
INSERT INTO `region` VALUES ('705', '230101', '', '', '市辖区', '704', '3');
INSERT INTO `region` VALUES ('706', '230102', '', '', '道里区', '704', '3');
INSERT INTO `region` VALUES ('707', '230103', '', '', '南岗区', '704', '3');
INSERT INTO `region` VALUES ('708', '230104', '', '', '道外区', '704', '3');
INSERT INTO `region` VALUES ('709', '230108', '', '', '平房区', '704', '3');
INSERT INTO `region` VALUES ('710', '230109', '', '', '松北区', '704', '3');
INSERT INTO `region` VALUES ('711', '230110', '', '', '香坊区', '704', '3');
INSERT INTO `region` VALUES ('712', '230111', '', '', '呼兰区', '704', '3');
INSERT INTO `region` VALUES ('713', '230112', '', '', '阿城区', '704', '3');
INSERT INTO `region` VALUES ('714', '230113', '', '', '双城区', '704', '3');
INSERT INTO `region` VALUES ('715', '230123', '', '', '依兰县', '704', '3');
INSERT INTO `region` VALUES ('716', '230124', '', '', '方正县', '704', '3');
INSERT INTO `region` VALUES ('717', '230125', '', '', '宾县', '704', '3');
INSERT INTO `region` VALUES ('718', '230126', '', '', '巴彦县', '704', '3');
INSERT INTO `region` VALUES ('719', '230127', '', '', '木兰县', '704', '3');
INSERT INTO `region` VALUES ('720', '230128', '', '', '通河县', '704', '3');
INSERT INTO `region` VALUES ('721', '230129', '', '', '延寿县', '704', '3');
INSERT INTO `region` VALUES ('722', '230183', '', '', '尚志市', '704', '3');
INSERT INTO `region` VALUES ('723', '230184', '', '', '五常市', '704', '3');
INSERT INTO `region` VALUES ('724', '230200', '', '齐齐哈尔市', '', '703', '2');
INSERT INTO `region` VALUES ('725', '230201', '', '', '市辖区', '724', '3');
INSERT INTO `region` VALUES ('726', '230202', '', '', '龙沙区', '724', '3');
INSERT INTO `region` VALUES ('727', '230203', '', '', '建华区', '724', '3');
INSERT INTO `region` VALUES ('728', '230204', '', '', '铁锋区', '724', '3');
INSERT INTO `region` VALUES ('729', '230205', '', '', '昂昂溪区', '724', '3');
INSERT INTO `region` VALUES ('730', '230206', '', '', '富拉尔基区', '724', '3');
INSERT INTO `region` VALUES ('731', '230207', '', '', '碾子山区', '724', '3');
INSERT INTO `region` VALUES ('732', '230208', '', '', '梅里斯达斡尔族区', '724', '3');
INSERT INTO `region` VALUES ('733', '230221', '', '', '龙江县', '724', '3');
INSERT INTO `region` VALUES ('734', '230223', '', '', '依安县', '724', '3');
INSERT INTO `region` VALUES ('735', '230224', '', '', '泰来县', '724', '3');
INSERT INTO `region` VALUES ('736', '230225', '', '', '甘南县', '724', '3');
INSERT INTO `region` VALUES ('737', '230227', '', '', '富裕县', '724', '3');
INSERT INTO `region` VALUES ('738', '230229', '', '', '克山县', '724', '3');
INSERT INTO `region` VALUES ('739', '230230', '', '', '克东县', '724', '3');
INSERT INTO `region` VALUES ('740', '230231', '', '', '拜泉县', '724', '3');
INSERT INTO `region` VALUES ('741', '230281', '', '', '讷河市', '724', '3');
INSERT INTO `region` VALUES ('742', '230300', '', '鸡西市', '', '703', '2');
INSERT INTO `region` VALUES ('743', '230301', '', '', '市辖区', '742', '3');
INSERT INTO `region` VALUES ('744', '230302', '', '', '鸡冠区', '742', '3');
INSERT INTO `region` VALUES ('745', '230303', '', '', '恒山区', '742', '3');
INSERT INTO `region` VALUES ('746', '230304', '', '', '滴道区', '742', '3');
INSERT INTO `region` VALUES ('747', '230305', '', '', '梨树区', '742', '3');
INSERT INTO `region` VALUES ('748', '230306', '', '', '城子河区', '742', '3');
INSERT INTO `region` VALUES ('749', '230307', '', '', '麻山区', '742', '3');
INSERT INTO `region` VALUES ('750', '230321', '', '', '鸡东县', '742', '3');
INSERT INTO `region` VALUES ('751', '230381', '', '', '虎林市', '742', '3');
INSERT INTO `region` VALUES ('752', '230382', '', '', '密山市', '742', '3');
INSERT INTO `region` VALUES ('753', '230400', '', '鹤岗市', '', '703', '2');
INSERT INTO `region` VALUES ('754', '230401', '', '', '市辖区', '753', '3');
INSERT INTO `region` VALUES ('755', '230402', '', '', '向阳区', '753', '3');
INSERT INTO `region` VALUES ('756', '230403', '', '', '工农区', '753', '3');
INSERT INTO `region` VALUES ('757', '230404', '', '', '南山区', '753', '3');
INSERT INTO `region` VALUES ('758', '230405', '', '', '兴安区', '753', '3');
INSERT INTO `region` VALUES ('759', '230406', '', '', '东山区', '753', '3');
INSERT INTO `region` VALUES ('760', '230407', '', '', '兴山区', '753', '3');
INSERT INTO `region` VALUES ('761', '230421', '', '', '萝北县', '753', '3');
INSERT INTO `region` VALUES ('762', '230422', '', '', '绥滨县', '753', '3');
INSERT INTO `region` VALUES ('763', '230500', '', '双鸭山市', '', '703', '2');
INSERT INTO `region` VALUES ('764', '230501', '', '', '市辖区', '763', '3');
INSERT INTO `region` VALUES ('765', '230502', '', '', '尖山区', '763', '3');
INSERT INTO `region` VALUES ('766', '230503', '', '', '岭东区', '763', '3');
INSERT INTO `region` VALUES ('767', '230505', '', '', '四方台区', '763', '3');
INSERT INTO `region` VALUES ('768', '230506', '', '', '宝山区', '763', '3');
INSERT INTO `region` VALUES ('769', '230521', '', '', '集贤县', '763', '3');
INSERT INTO `region` VALUES ('770', '230522', '', '', '友谊县', '763', '3');
INSERT INTO `region` VALUES ('771', '230523', '', '', '宝清县', '763', '3');
INSERT INTO `region` VALUES ('772', '230524', '', '', '饶河县', '763', '3');
INSERT INTO `region` VALUES ('773', '230600', '', '大庆市', '', '703', '2');
INSERT INTO `region` VALUES ('774', '230601', '', '', '市辖区', '773', '3');
INSERT INTO `region` VALUES ('775', '230602', '', '', '萨尔图区', '773', '3');
INSERT INTO `region` VALUES ('776', '230603', '', '', '龙凤区', '773', '3');
INSERT INTO `region` VALUES ('777', '230604', '', '', '让胡路区', '773', '3');
INSERT INTO `region` VALUES ('778', '230605', '', '', '红岗区', '773', '3');
INSERT INTO `region` VALUES ('779', '230606', '', '', '大同区', '773', '3');
INSERT INTO `region` VALUES ('780', '230621', '', '', '肇州县', '773', '3');
INSERT INTO `region` VALUES ('781', '230622', '', '', '肇源县', '773', '3');
INSERT INTO `region` VALUES ('782', '230623', '', '', '林甸县', '773', '3');
INSERT INTO `region` VALUES ('783', '230624', '', '', '杜尔伯特蒙古族自治县', '773', '3');
INSERT INTO `region` VALUES ('784', '230700', '', '伊春市', '', '703', '2');
INSERT INTO `region` VALUES ('785', '230701', '', '', '市辖区', '784', '3');
INSERT INTO `region` VALUES ('786', '230702', '', '', '伊春区', '784', '3');
INSERT INTO `region` VALUES ('787', '230703', '', '', '南岔区', '784', '3');
INSERT INTO `region` VALUES ('788', '230704', '', '', '友好区', '784', '3');
INSERT INTO `region` VALUES ('789', '230705', '', '', '西林区', '784', '3');
INSERT INTO `region` VALUES ('790', '230706', '', '', '翠峦区', '784', '3');
INSERT INTO `region` VALUES ('791', '230707', '', '', '新青区', '784', '3');
INSERT INTO `region` VALUES ('792', '230708', '', '', '美溪区', '784', '3');
INSERT INTO `region` VALUES ('793', '230709', '', '', '金山屯区', '784', '3');
INSERT INTO `region` VALUES ('794', '230710', '', '', '五营区', '784', '3');
INSERT INTO `region` VALUES ('795', '230711', '', '', '乌马河区', '784', '3');
INSERT INTO `region` VALUES ('796', '230712', '', '', '汤旺河区', '784', '3');
INSERT INTO `region` VALUES ('797', '230713', '', '', '带岭区', '784', '3');
INSERT INTO `region` VALUES ('798', '230714', '', '', '乌伊岭区', '784', '3');
INSERT INTO `region` VALUES ('799', '230715', '', '', '红星区', '784', '3');
INSERT INTO `region` VALUES ('800', '230716', '', '', '上甘岭区', '784', '3');
INSERT INTO `region` VALUES ('801', '230722', '', '', '嘉荫县', '784', '3');
INSERT INTO `region` VALUES ('802', '230781', '', '', '铁力市', '784', '3');
INSERT INTO `region` VALUES ('803', '230800', '', '佳木斯市', '', '703', '2');
INSERT INTO `region` VALUES ('804', '230801', '', '', '市辖区', '803', '3');
INSERT INTO `region` VALUES ('805', '230803', '', '', '向阳区', '803', '3');
INSERT INTO `region` VALUES ('806', '230804', '', '', '前进区', '803', '3');
INSERT INTO `region` VALUES ('807', '230805', '', '', '东风区', '803', '3');
INSERT INTO `region` VALUES ('808', '230811', '', '', '郊区', '803', '3');
INSERT INTO `region` VALUES ('809', '230822', '', '', '桦南县', '803', '3');
INSERT INTO `region` VALUES ('810', '230826', '', '', '桦川县', '803', '3');
INSERT INTO `region` VALUES ('811', '230828', '', '', '汤原县', '803', '3');
INSERT INTO `region` VALUES ('812', '230833', '', '', '抚远县', '803', '3');
INSERT INTO `region` VALUES ('813', '230881', '', '', '同江市', '803', '3');
INSERT INTO `region` VALUES ('814', '230882', '', '', '富锦市', '803', '3');
INSERT INTO `region` VALUES ('815', '230900', '', '七台河市', '', '703', '2');
INSERT INTO `region` VALUES ('816', '230901', '', '', '市辖区', '815', '3');
INSERT INTO `region` VALUES ('817', '230902', '', '', '新兴区', '815', '3');
INSERT INTO `region` VALUES ('818', '230903', '', '', '桃山区', '815', '3');
INSERT INTO `region` VALUES ('819', '230904', '', '', '茄子河区', '815', '3');
INSERT INTO `region` VALUES ('820', '230921', '', '', '勃利县', '815', '3');
INSERT INTO `region` VALUES ('821', '231000', '', '牡丹江市', '', '703', '2');
INSERT INTO `region` VALUES ('822', '231001', '', '', '市辖区', '821', '3');
INSERT INTO `region` VALUES ('823', '231002', '', '', '东安区', '821', '3');
INSERT INTO `region` VALUES ('824', '231003', '', '', '阳明区', '821', '3');
INSERT INTO `region` VALUES ('825', '231004', '', '', '爱民区', '821', '3');
INSERT INTO `region` VALUES ('826', '231005', '', '', '西安区', '821', '3');
INSERT INTO `region` VALUES ('827', '231024', '', '', '东宁县', '821', '3');
INSERT INTO `region` VALUES ('828', '231025', '', '', '林口县', '821', '3');
INSERT INTO `region` VALUES ('829', '231081', '', '', '绥芬河市', '821', '3');
INSERT INTO `region` VALUES ('830', '231083', '', '', '海林市', '821', '3');
INSERT INTO `region` VALUES ('831', '231084', '', '', '宁安市', '821', '3');
INSERT INTO `region` VALUES ('832', '231085', '', '', '穆棱市', '821', '3');
INSERT INTO `region` VALUES ('833', '231100', '', '黑河市', '', '703', '2');
INSERT INTO `region` VALUES ('834', '231101', '', '', '市辖区', '833', '3');
INSERT INTO `region` VALUES ('835', '231102', '', '', '爱辉区', '833', '3');
INSERT INTO `region` VALUES ('836', '231121', '', '', '嫩江县', '833', '3');
INSERT INTO `region` VALUES ('837', '231123', '', '', '逊克县', '833', '3');
INSERT INTO `region` VALUES ('838', '231124', '', '', '孙吴县', '833', '3');
INSERT INTO `region` VALUES ('839', '231181', '', '', '北安市', '833', '3');
INSERT INTO `region` VALUES ('840', '231182', '', '', '五大连池市', '833', '3');
INSERT INTO `region` VALUES ('841', '231200', '', '绥化市', '', '703', '2');
INSERT INTO `region` VALUES ('842', '231201', '', '', '市辖区', '841', '3');
INSERT INTO `region` VALUES ('843', '231202', '', '', '北林区', '841', '3');
INSERT INTO `region` VALUES ('844', '231221', '', '', '望奎县', '841', '3');
INSERT INTO `region` VALUES ('845', '231222', '', '', '兰西县', '841', '3');
INSERT INTO `region` VALUES ('846', '231223', '', '', '青冈县', '841', '3');
INSERT INTO `region` VALUES ('847', '231224', '', '', '庆安县', '841', '3');
INSERT INTO `region` VALUES ('848', '231225', '', '', '明水县', '841', '3');
INSERT INTO `region` VALUES ('849', '231226', '', '', '绥棱县', '841', '3');
INSERT INTO `region` VALUES ('850', '231281', '', '', '安达市', '841', '3');
INSERT INTO `region` VALUES ('851', '231282', '', '', '肇东市', '841', '3');
INSERT INTO `region` VALUES ('852', '231283', '', '', '海伦市', '841', '3');
INSERT INTO `region` VALUES ('853', '232700', '', '大兴安岭地区', '', '703', '2');
INSERT INTO `region` VALUES ('854', '232721', '', '', '呼玛县', '853', '3');
INSERT INTO `region` VALUES ('855', '232722', '', '', '塔河县', '853', '3');
INSERT INTO `region` VALUES ('856', '232723', '', '', '漠河县', '853', '3');
INSERT INTO `region` VALUES ('857', '310000', '上海市', '上海市', '', '1', '2');
INSERT INTO `region` VALUES ('858', '310101', '', '', '黄浦区', '857', '3');
INSERT INTO `region` VALUES ('859', '310104', '', '', '徐汇区', '857', '3');
INSERT INTO `region` VALUES ('860', '310105', '', '', '长宁区', '857', '3');
INSERT INTO `region` VALUES ('861', '310106', '', '', '静安区', '857', '3');
INSERT INTO `region` VALUES ('862', '310107', '', '', '普陀区', '857', '3');
INSERT INTO `region` VALUES ('863', '310108', '', '', '闸北区', '857', '3');
INSERT INTO `region` VALUES ('864', '310109', '', '', '虹口区', '857', '3');
INSERT INTO `region` VALUES ('865', '310110', '', '', '杨浦区', '857', '3');
INSERT INTO `region` VALUES ('866', '310112', '', '', '闵行区', '857', '3');
INSERT INTO `region` VALUES ('867', '310113', '', '', '宝山区', '857', '3');
INSERT INTO `region` VALUES ('868', '310114', '', '', '嘉定区', '857', '3');
INSERT INTO `region` VALUES ('869', '310115', '', '', '浦东新区', '857', '3');
INSERT INTO `region` VALUES ('870', '310116', '', '', '金山区', '857', '3');
INSERT INTO `region` VALUES ('871', '310117', '', '', '松江区', '857', '3');
INSERT INTO `region` VALUES ('872', '310118', '', '', '青浦区', '857', '3');
INSERT INTO `region` VALUES ('873', '310120', '', '', '奉贤区', '857', '3');
INSERT INTO `region` VALUES ('874', '310230', '', '', '崇明县', '857', '3');
INSERT INTO `region` VALUES ('875', '320000', '江苏省', '', '', '1', '2');
INSERT INTO `region` VALUES ('876', '320100', '', '南京市', '', '875', '2');
INSERT INTO `region` VALUES ('877', '320101', '', '', '市辖区', '876', '3');
INSERT INTO `region` VALUES ('878', '320102', '', '', '玄武区', '876', '3');
INSERT INTO `region` VALUES ('879', '320104', '', '', '秦淮区', '876', '3');
INSERT INTO `region` VALUES ('880', '320105', '', '', '建邺区', '876', '3');
INSERT INTO `region` VALUES ('881', '320106', '', '', '鼓楼区', '876', '3');
INSERT INTO `region` VALUES ('882', '320111', '', '', '浦口区', '876', '3');
INSERT INTO `region` VALUES ('883', '320113', '', '', '栖霞区', '876', '3');
INSERT INTO `region` VALUES ('884', '320114', '', '', '雨花台区', '876', '3');
INSERT INTO `region` VALUES ('885', '320115', '', '', '江宁区', '876', '3');
INSERT INTO `region` VALUES ('886', '320116', '', '', '六合区', '876', '3');
INSERT INTO `region` VALUES ('887', '320117', '', '', '溧水区', '876', '3');
INSERT INTO `region` VALUES ('888', '320118', '', '', '高淳区', '876', '3');
INSERT INTO `region` VALUES ('889', '320200', '', '无锡市', '', '875', '2');
INSERT INTO `region` VALUES ('890', '320201', '', '', '市辖区', '889', '3');
INSERT INTO `region` VALUES ('891', '320202', '', '', '崇安区', '889', '3');
INSERT INTO `region` VALUES ('892', '320203', '', '', '南长区', '889', '3');
INSERT INTO `region` VALUES ('893', '320204', '', '', '北塘区', '889', '3');
INSERT INTO `region` VALUES ('894', '320205', '', '', '锡山区', '889', '3');
INSERT INTO `region` VALUES ('895', '320206', '', '', '惠山区', '889', '3');
INSERT INTO `region` VALUES ('896', '320211', '', '', '滨湖区', '889', '3');
INSERT INTO `region` VALUES ('897', '320281', '', '', '江阴市', '889', '3');
INSERT INTO `region` VALUES ('898', '320282', '', '', '宜兴市', '889', '3');
INSERT INTO `region` VALUES ('899', '320300', '', '徐州市', '', '875', '2');
INSERT INTO `region` VALUES ('900', '320301', '', '', '市辖区', '899', '3');
INSERT INTO `region` VALUES ('901', '320302', '', '', '鼓楼区', '899', '3');
INSERT INTO `region` VALUES ('902', '320303', '', '', '云龙区', '899', '3');
INSERT INTO `region` VALUES ('903', '320305', '', '', '贾汪区', '899', '3');
INSERT INTO `region` VALUES ('904', '320311', '', '', '泉山区', '899', '3');
INSERT INTO `region` VALUES ('905', '320312', '', '', '铜山区', '899', '3');
INSERT INTO `region` VALUES ('906', '320321', '', '', '丰县', '899', '3');
INSERT INTO `region` VALUES ('907', '320322', '', '', '沛县', '899', '3');
INSERT INTO `region` VALUES ('908', '320324', '', '', '睢宁县', '899', '3');
INSERT INTO `region` VALUES ('909', '320381', '', '', '新沂市', '899', '3');
INSERT INTO `region` VALUES ('910', '320382', '', '', '邳州市', '899', '3');
INSERT INTO `region` VALUES ('911', '320400', '', '常州市', '', '875', '2');
INSERT INTO `region` VALUES ('912', '320401', '', '', '市辖区', '911', '3');
INSERT INTO `region` VALUES ('913', '320402', '', '', '天宁区', '911', '3');
INSERT INTO `region` VALUES ('914', '320404', '', '', '钟楼区', '911', '3');
INSERT INTO `region` VALUES ('915', '320405', '', '', '戚墅堰区', '911', '3');
INSERT INTO `region` VALUES ('916', '320411', '', '', '新北区', '911', '3');
INSERT INTO `region` VALUES ('917', '320412', '', '', '武进区', '911', '3');
INSERT INTO `region` VALUES ('918', '320481', '', '', '溧阳市', '911', '3');
INSERT INTO `region` VALUES ('919', '320482', '', '', '金坛市', '911', '3');
INSERT INTO `region` VALUES ('920', '320500', '', '苏州市', '', '875', '2');
INSERT INTO `region` VALUES ('921', '320501', '', '', '市辖区', '920', '3');
INSERT INTO `region` VALUES ('922', '320505', '', '', '虎丘区', '920', '3');
INSERT INTO `region` VALUES ('923', '320506', '', '', '吴中区', '920', '3');
INSERT INTO `region` VALUES ('924', '320507', '', '', '相城区', '920', '3');
INSERT INTO `region` VALUES ('925', '320508', '', '', '姑苏区', '920', '3');
INSERT INTO `region` VALUES ('926', '320509', '', '', '吴江区', '920', '3');
INSERT INTO `region` VALUES ('927', '320581', '', '', '常熟市', '920', '3');
INSERT INTO `region` VALUES ('928', '320582', '', '', '张家港市', '920', '3');
INSERT INTO `region` VALUES ('929', '320583', '', '', '昆山市', '920', '3');
INSERT INTO `region` VALUES ('930', '320585', '', '', '太仓市', '920', '3');
INSERT INTO `region` VALUES ('931', '320600', '', '南通市', '', '875', '2');
INSERT INTO `region` VALUES ('932', '320601', '', '', '市辖区', '931', '3');
INSERT INTO `region` VALUES ('933', '320602', '', '', '崇川区', '931', '3');
INSERT INTO `region` VALUES ('934', '320611', '', '', '港闸区', '931', '3');
INSERT INTO `region` VALUES ('935', '320612', '', '', '通州区', '931', '3');
INSERT INTO `region` VALUES ('936', '320621', '', '', '海安县', '931', '3');
INSERT INTO `region` VALUES ('937', '320623', '', '', '如东县', '931', '3');
INSERT INTO `region` VALUES ('938', '320681', '', '', '启东市', '931', '3');
INSERT INTO `region` VALUES ('939', '320682', '', '', '如皋市', '931', '3');
INSERT INTO `region` VALUES ('940', '320684', '', '', '海门市', '931', '3');
INSERT INTO `region` VALUES ('941', '320700', '', '连云港市', '', '875', '2');
INSERT INTO `region` VALUES ('942', '320701', '', '', '市辖区', '941', '3');
INSERT INTO `region` VALUES ('943', '320703', '', '', '连云区', '941', '3');
INSERT INTO `region` VALUES ('944', '320706', '', '', '海州区', '941', '3');
INSERT INTO `region` VALUES ('945', '320707', '', '', '赣榆区', '941', '3');
INSERT INTO `region` VALUES ('946', '320722', '', '', '东海县', '941', '3');
INSERT INTO `region` VALUES ('947', '320723', '', '', '灌云县', '941', '3');
INSERT INTO `region` VALUES ('948', '320724', '', '', '灌南县', '941', '3');
INSERT INTO `region` VALUES ('949', '320800', '', '淮安市', '', '875', '2');
INSERT INTO `region` VALUES ('950', '320801', '', '', '市辖区', '949', '3');
INSERT INTO `region` VALUES ('951', '320802', '', '', '清河区', '949', '3');
INSERT INTO `region` VALUES ('952', '320803', '', '', '淮安区', '949', '3');
INSERT INTO `region` VALUES ('953', '320804', '', '', '淮阴区', '949', '3');
INSERT INTO `region` VALUES ('954', '320811', '', '', '清浦区', '949', '3');
INSERT INTO `region` VALUES ('955', '320826', '', '', '涟水县', '949', '3');
INSERT INTO `region` VALUES ('956', '320829', '', '', '洪泽县', '949', '3');
INSERT INTO `region` VALUES ('957', '320830', '', '', '盱眙县', '949', '3');
INSERT INTO `region` VALUES ('958', '320831', '', '', '金湖县', '949', '3');
INSERT INTO `region` VALUES ('959', '320900', '', '盐城市', '', '875', '2');
INSERT INTO `region` VALUES ('960', '320901', '', '', '市辖区', '959', '3');
INSERT INTO `region` VALUES ('961', '320902', '', '', '亭湖区', '959', '3');
INSERT INTO `region` VALUES ('962', '320903', '', '', '盐都区', '959', '3');
INSERT INTO `region` VALUES ('963', '320921', '', '', '响水县', '959', '3');
INSERT INTO `region` VALUES ('964', '320922', '', '', '滨海县', '959', '3');
INSERT INTO `region` VALUES ('965', '320923', '', '', '阜宁县', '959', '3');
INSERT INTO `region` VALUES ('966', '320924', '', '', '射阳县', '959', '3');
INSERT INTO `region` VALUES ('967', '320925', '', '', '建湖县', '959', '3');
INSERT INTO `region` VALUES ('968', '320981', '', '', '东台市', '959', '3');
INSERT INTO `region` VALUES ('969', '320982', '', '', '大丰市', '959', '3');
INSERT INTO `region` VALUES ('970', '321000', '', '扬州市', '', '875', '2');
INSERT INTO `region` VALUES ('971', '321001', '', '', '市辖区', '970', '3');
INSERT INTO `region` VALUES ('972', '321002', '', '', '广陵区', '970', '3');
INSERT INTO `region` VALUES ('973', '321003', '', '', '邗江区', '970', '3');
INSERT INTO `region` VALUES ('974', '321012', '', '', '江都区', '970', '3');
INSERT INTO `region` VALUES ('975', '321023', '', '', '宝应县', '970', '3');
INSERT INTO `region` VALUES ('976', '321081', '', '', '仪征市', '970', '3');
INSERT INTO `region` VALUES ('977', '321084', '', '', '高邮市', '970', '3');
INSERT INTO `region` VALUES ('978', '321100', '', '镇江市', '', '875', '2');
INSERT INTO `region` VALUES ('979', '321101', '', '', '市辖区', '978', '3');
INSERT INTO `region` VALUES ('980', '321102', '', '', '京口区', '978', '3');
INSERT INTO `region` VALUES ('981', '321111', '', '', '润州区', '978', '3');
INSERT INTO `region` VALUES ('982', '321112', '', '', '丹徒区', '978', '3');
INSERT INTO `region` VALUES ('983', '321181', '', '', '丹阳市', '978', '3');
INSERT INTO `region` VALUES ('984', '321182', '', '', '扬中市', '978', '3');
INSERT INTO `region` VALUES ('985', '321183', '', '', '句容市', '978', '3');
INSERT INTO `region` VALUES ('986', '321200', '', '泰州市', '', '875', '2');
INSERT INTO `region` VALUES ('987', '321201', '', '', '市辖区', '986', '3');
INSERT INTO `region` VALUES ('988', '321202', '', '', '海陵区', '986', '3');
INSERT INTO `region` VALUES ('989', '321203', '', '', '高港区', '986', '3');
INSERT INTO `region` VALUES ('990', '321204', '', '', '姜堰区', '986', '3');
INSERT INTO `region` VALUES ('991', '321281', '', '', '兴化市', '986', '3');
INSERT INTO `region` VALUES ('992', '321282', '', '', '靖江市', '986', '3');
INSERT INTO `region` VALUES ('993', '321283', '', '', '泰兴市', '986', '3');
INSERT INTO `region` VALUES ('994', '321300', '', '宿迁市', '', '875', '2');
INSERT INTO `region` VALUES ('995', '321301', '', '', '市辖区', '994', '3');
INSERT INTO `region` VALUES ('996', '321302', '', '', '宿城区', '994', '3');
INSERT INTO `region` VALUES ('997', '321311', '', '', '宿豫区', '994', '3');
INSERT INTO `region` VALUES ('998', '321322', '', '', '沭阳县', '994', '3');
INSERT INTO `region` VALUES ('999', '321323', '', '', '泗阳县', '994', '3');
INSERT INTO `region` VALUES ('1000', '321324', '', '', '泗洪县', '994', '3');
INSERT INTO `region` VALUES ('1001', '330000', '浙江省', '', '', '1', '2');
INSERT INTO `region` VALUES ('1002', '330100', '', '杭州市', '', '1001', '2');
INSERT INTO `region` VALUES ('1003', '330101', '', '', '市辖区', '1002', '3');
INSERT INTO `region` VALUES ('1004', '330102', '', '', '上城区', '1002', '3');
INSERT INTO `region` VALUES ('1005', '330103', '', '', '下城区', '1002', '3');
INSERT INTO `region` VALUES ('1006', '330104', '', '', '江干区', '1002', '3');
INSERT INTO `region` VALUES ('1007', '330105', '', '', '拱墅区', '1002', '3');
INSERT INTO `region` VALUES ('1008', '330106', '', '', '西湖区', '1002', '3');
INSERT INTO `region` VALUES ('1009', '330108', '', '', '滨江区', '1002', '3');
INSERT INTO `region` VALUES ('1010', '330109', '', '', '萧山区', '1002', '3');
INSERT INTO `region` VALUES ('1011', '330110', '', '', '余杭区', '1002', '3');
INSERT INTO `region` VALUES ('1012', '330111', '', '', '富阳区', '1002', '3');
INSERT INTO `region` VALUES ('1013', '330122', '', '', '桐庐县', '1002', '3');
INSERT INTO `region` VALUES ('1014', '330127', '', '', '淳安县', '1002', '3');
INSERT INTO `region` VALUES ('1015', '330182', '', '', '建德市', '1002', '3');
INSERT INTO `region` VALUES ('1016', '330185', '', '', '临安市', '1002', '3');
INSERT INTO `region` VALUES ('1017', '330200', '', '宁波市', '', '1001', '2');
INSERT INTO `region` VALUES ('1018', '330201', '', '', '市辖区', '1017', '3');
INSERT INTO `region` VALUES ('1019', '330203', '', '', '海曙区', '1017', '3');
INSERT INTO `region` VALUES ('1020', '330204', '', '', '江东区', '1017', '3');
INSERT INTO `region` VALUES ('1021', '330205', '', '', '江北区', '1017', '3');
INSERT INTO `region` VALUES ('1022', '330206', '', '', '北仑区', '1017', '3');
INSERT INTO `region` VALUES ('1023', '330211', '', '', '镇海区', '1017', '3');
INSERT INTO `region` VALUES ('1024', '330212', '', '', '鄞州区', '1017', '3');
INSERT INTO `region` VALUES ('1025', '330225', '', '', '象山县', '1017', '3');
INSERT INTO `region` VALUES ('1026', '330226', '', '', '宁海县', '1017', '3');
INSERT INTO `region` VALUES ('1027', '330281', '', '', '余姚市', '1017', '3');
INSERT INTO `region` VALUES ('1028', '330282', '', '', '慈溪市', '1017', '3');
INSERT INTO `region` VALUES ('1029', '330283', '', '', '奉化市', '1017', '3');
INSERT INTO `region` VALUES ('1030', '330300', '', '温州市', '', '1001', '2');
INSERT INTO `region` VALUES ('1031', '330301', '', '', '市辖区', '1030', '3');
INSERT INTO `region` VALUES ('1032', '330302', '', '', '鹿城区', '1030', '3');
INSERT INTO `region` VALUES ('1033', '330303', '', '', '龙湾区', '1030', '3');
INSERT INTO `region` VALUES ('1034', '330304', '', '', '瓯海区', '1030', '3');
INSERT INTO `region` VALUES ('1035', '330322', '', '', '洞头县', '1030', '3');
INSERT INTO `region` VALUES ('1036', '330324', '', '', '永嘉县', '1030', '3');
INSERT INTO `region` VALUES ('1037', '330326', '', '', '平阳县', '1030', '3');
INSERT INTO `region` VALUES ('1038', '330327', '', '', '苍南县', '1030', '3');
INSERT INTO `region` VALUES ('1039', '330328', '', '', '文成县', '1030', '3');
INSERT INTO `region` VALUES ('1040', '330329', '', '', '泰顺县', '1030', '3');
INSERT INTO `region` VALUES ('1041', '330381', '', '', '瑞安市', '1030', '3');
INSERT INTO `region` VALUES ('1042', '330382', '', '', '乐清市', '1030', '3');
INSERT INTO `region` VALUES ('1043', '330400', '', '嘉兴市', '', '1001', '2');
INSERT INTO `region` VALUES ('1044', '330401', '', '', '市辖区', '1043', '3');
INSERT INTO `region` VALUES ('1045', '330402', '', '', '南湖区', '1043', '3');
INSERT INTO `region` VALUES ('1046', '330411', '', '', '秀洲区', '1043', '3');
INSERT INTO `region` VALUES ('1047', '330421', '', '', '嘉善县', '1043', '3');
INSERT INTO `region` VALUES ('1048', '330424', '', '', '海盐县', '1043', '3');
INSERT INTO `region` VALUES ('1049', '330481', '', '', '海宁市', '1043', '3');
INSERT INTO `region` VALUES ('1050', '330482', '', '', '平湖市', '1043', '3');
INSERT INTO `region` VALUES ('1051', '330483', '', '', '桐乡市', '1043', '3');
INSERT INTO `region` VALUES ('1052', '330500', '', '湖州市', '', '1001', '2');
INSERT INTO `region` VALUES ('1053', '330501', '', '', '市辖区', '1052', '3');
INSERT INTO `region` VALUES ('1054', '330502', '', '', '吴兴区', '1052', '3');
INSERT INTO `region` VALUES ('1055', '330503', '', '', '南浔区', '1052', '3');
INSERT INTO `region` VALUES ('1056', '330521', '', '', '德清县', '1052', '3');
INSERT INTO `region` VALUES ('1057', '330522', '', '', '长兴县', '1052', '3');
INSERT INTO `region` VALUES ('1058', '330523', '', '', '安吉县', '1052', '3');
INSERT INTO `region` VALUES ('1059', '330600', '', '绍兴市', '', '1001', '2');
INSERT INTO `region` VALUES ('1060', '330601', '', '', '市辖区', '1059', '3');
INSERT INTO `region` VALUES ('1061', '330602', '', '', '越城区', '1059', '3');
INSERT INTO `region` VALUES ('1062', '330603', '', '', '柯桥区', '1059', '3');
INSERT INTO `region` VALUES ('1063', '330604', '', '', '上虞区', '1059', '3');
INSERT INTO `region` VALUES ('1064', '330624', '', '', '新昌县', '1059', '3');
INSERT INTO `region` VALUES ('1065', '330681', '', '', '诸暨市', '1059', '3');
INSERT INTO `region` VALUES ('1066', '330683', '', '', '嵊州市', '1059', '3');
INSERT INTO `region` VALUES ('1067', '330700', '', '金华市', '', '1001', '2');
INSERT INTO `region` VALUES ('1068', '330701', '', '', '市辖区', '1067', '3');
INSERT INTO `region` VALUES ('1069', '330702', '', '', '婺城区', '1067', '3');
INSERT INTO `region` VALUES ('1070', '330703', '', '', '金东区', '1067', '3');
INSERT INTO `region` VALUES ('1071', '330723', '', '', '武义县', '1067', '3');
INSERT INTO `region` VALUES ('1072', '330726', '', '', '浦江县', '1067', '3');
INSERT INTO `region` VALUES ('1073', '330727', '', '', '磐安县', '1067', '3');
INSERT INTO `region` VALUES ('1074', '330781', '', '', '兰溪市', '1067', '3');
INSERT INTO `region` VALUES ('1075', '330782', '', '', '义乌市', '1067', '3');
INSERT INTO `region` VALUES ('1076', '330783', '', '', '东阳市', '1067', '3');
INSERT INTO `region` VALUES ('1077', '330784', '', '', '永康市', '1067', '3');
INSERT INTO `region` VALUES ('1078', '330800', '', '衢州市', '', '1001', '2');
INSERT INTO `region` VALUES ('1079', '330801', '', '', '市辖区', '1078', '3');
INSERT INTO `region` VALUES ('1080', '330802', '', '', '柯城区', '1078', '3');
INSERT INTO `region` VALUES ('1081', '330803', '', '', '衢江区', '1078', '3');
INSERT INTO `region` VALUES ('1082', '330822', '', '', '常山县', '1078', '3');
INSERT INTO `region` VALUES ('1083', '330824', '', '', '开化县', '1078', '3');
INSERT INTO `region` VALUES ('1084', '330825', '', '', '龙游县', '1078', '3');
INSERT INTO `region` VALUES ('1085', '330881', '', '', '江山市', '1078', '3');
INSERT INTO `region` VALUES ('1086', '330900', '', '舟山市', '', '1001', '2');
INSERT INTO `region` VALUES ('1087', '330901', '', '', '市辖区', '1086', '3');
INSERT INTO `region` VALUES ('1088', '330902', '', '', '定海区', '1086', '3');
INSERT INTO `region` VALUES ('1089', '330903', '', '', '普陀区', '1086', '3');
INSERT INTO `region` VALUES ('1090', '330921', '', '', '岱山县', '1086', '3');
INSERT INTO `region` VALUES ('1091', '330922', '', '', '嵊泗县', '1086', '3');
INSERT INTO `region` VALUES ('1092', '331000', '', '台州市', '', '1001', '2');
INSERT INTO `region` VALUES ('1093', '331001', '', '', '市辖区', '1092', '3');
INSERT INTO `region` VALUES ('1094', '331002', '', '', '椒江区', '1092', '3');
INSERT INTO `region` VALUES ('1095', '331003', '', '', '黄岩区', '1092', '3');
INSERT INTO `region` VALUES ('1096', '331004', '', '', '路桥区', '1092', '3');
INSERT INTO `region` VALUES ('1097', '331021', '', '', '玉环县', '1092', '3');
INSERT INTO `region` VALUES ('1098', '331022', '', '', '三门县', '1092', '3');
INSERT INTO `region` VALUES ('1099', '331023', '', '', '天台县', '1092', '3');
INSERT INTO `region` VALUES ('1100', '331024', '', '', '仙居县', '1092', '3');
INSERT INTO `region` VALUES ('1101', '331081', '', '', '温岭市', '1092', '3');
INSERT INTO `region` VALUES ('1102', '331082', '', '', '临海市', '1092', '3');
INSERT INTO `region` VALUES ('1103', '331100', '', '丽水市', '', '1001', '2');
INSERT INTO `region` VALUES ('1104', '331101', '', '', '市辖区', '1103', '3');
INSERT INTO `region` VALUES ('1105', '331102', '', '', '莲都区', '1103', '3');
INSERT INTO `region` VALUES ('1106', '331121', '', '', '青田县', '1103', '3');
INSERT INTO `region` VALUES ('1107', '331122', '', '', '缙云县', '1103', '3');
INSERT INTO `region` VALUES ('1108', '331123', '', '', '遂昌县', '1103', '3');
INSERT INTO `region` VALUES ('1109', '331124', '', '', '松阳县', '1103', '3');
INSERT INTO `region` VALUES ('1110', '331125', '', '', '云和县', '1103', '3');
INSERT INTO `region` VALUES ('1111', '331126', '', '', '庆元县', '1103', '3');
INSERT INTO `region` VALUES ('1112', '331127', '', '', '景宁畲族自治县', '1103', '3');
INSERT INTO `region` VALUES ('1113', '331181', '', '', '龙泉市', '1103', '3');
INSERT INTO `region` VALUES ('1114', '340000', '安徽省', '', '', '1', '2');
INSERT INTO `region` VALUES ('1115', '340100', '', '合肥市', '', '1114', '2');
INSERT INTO `region` VALUES ('1116', '340101', '', '', '市辖区', '1115', '3');
INSERT INTO `region` VALUES ('1117', '340102', '', '', '瑶海区', '1115', '3');
INSERT INTO `region` VALUES ('1118', '340103', '', '', '庐阳区', '1115', '3');
INSERT INTO `region` VALUES ('1119', '340104', '', '', '蜀山区', '1115', '3');
INSERT INTO `region` VALUES ('1120', '340111', '', '', '包河区', '1115', '3');
INSERT INTO `region` VALUES ('1121', '340121', '', '', '长丰县', '1115', '3');
INSERT INTO `region` VALUES ('1122', '340122', '', '', '肥东县', '1115', '3');
INSERT INTO `region` VALUES ('1123', '340123', '', '', '肥西县', '1115', '3');
INSERT INTO `region` VALUES ('1124', '340124', '', '', '庐江县', '1115', '3');
INSERT INTO `region` VALUES ('1125', '340181', '', '', '巢湖市', '1115', '3');
INSERT INTO `region` VALUES ('1126', '340200', '', '芜湖市', '', '1114', '2');
INSERT INTO `region` VALUES ('1127', '340201', '', '', '市辖区', '1126', '3');
INSERT INTO `region` VALUES ('1128', '340202', '', '', '镜湖区', '1126', '3');
INSERT INTO `region` VALUES ('1129', '340203', '', '', '弋江区', '1126', '3');
INSERT INTO `region` VALUES ('1130', '340207', '', '', '鸠江区', '1126', '3');
INSERT INTO `region` VALUES ('1131', '340208', '', '', '三山区', '1126', '3');
INSERT INTO `region` VALUES ('1132', '340221', '', '', '芜湖县', '1126', '3');
INSERT INTO `region` VALUES ('1133', '340222', '', '', '繁昌县', '1126', '3');
INSERT INTO `region` VALUES ('1134', '340223', '', '', '南陵县', '1126', '3');
INSERT INTO `region` VALUES ('1135', '340225', '', '', '无为县', '1126', '3');
INSERT INTO `region` VALUES ('1136', '340300', '', '蚌埠市', '', '1114', '2');
INSERT INTO `region` VALUES ('1137', '340301', '', '', '市辖区', '1136', '3');
INSERT INTO `region` VALUES ('1138', '340302', '', '', '龙子湖区', '1136', '3');
INSERT INTO `region` VALUES ('1139', '340303', '', '', '蚌山区', '1136', '3');
INSERT INTO `region` VALUES ('1140', '340304', '', '', '禹会区', '1136', '3');
INSERT INTO `region` VALUES ('1141', '340311', '', '', '淮上区', '1136', '3');
INSERT INTO `region` VALUES ('1142', '340321', '', '', '怀远县', '1136', '3');
INSERT INTO `region` VALUES ('1143', '340322', '', '', '五河县', '1136', '3');
INSERT INTO `region` VALUES ('1144', '340323', '', '', '固镇县', '1136', '3');
INSERT INTO `region` VALUES ('1145', '340400', '', '淮南市', '', '1114', '2');
INSERT INTO `region` VALUES ('1146', '340401', '', '', '市辖区', '1145', '3');
INSERT INTO `region` VALUES ('1147', '340402', '', '', '大通区', '1145', '3');
INSERT INTO `region` VALUES ('1148', '340403', '', '', '田家庵区', '1145', '3');
INSERT INTO `region` VALUES ('1149', '340404', '', '', '谢家集区', '1145', '3');
INSERT INTO `region` VALUES ('1150', '340405', '', '', '八公山区', '1145', '3');
INSERT INTO `region` VALUES ('1151', '340406', '', '', '潘集区', '1145', '3');
INSERT INTO `region` VALUES ('1152', '340421', '', '', '凤台县', '1145', '3');
INSERT INTO `region` VALUES ('1153', '340500', '', '马鞍山市', '', '1114', '2');
INSERT INTO `region` VALUES ('1154', '340501', '', '', '市辖区', '1153', '3');
INSERT INTO `region` VALUES ('1155', '340503', '', '', '花山区', '1153', '3');
INSERT INTO `region` VALUES ('1156', '340504', '', '', '雨山区', '1153', '3');
INSERT INTO `region` VALUES ('1157', '340506', '', '', '博望区', '1153', '3');
INSERT INTO `region` VALUES ('1158', '340521', '', '', '当涂县', '1153', '3');
INSERT INTO `region` VALUES ('1159', '340522', '', '', '含山县', '1153', '3');
INSERT INTO `region` VALUES ('1160', '340523', '', '', '和县', '1153', '3');
INSERT INTO `region` VALUES ('1161', '340600', '', '淮北市', '', '1114', '2');
INSERT INTO `region` VALUES ('1162', '340601', '', '', '市辖区', '1161', '3');
INSERT INTO `region` VALUES ('1163', '340602', '', '', '杜集区', '1161', '3');
INSERT INTO `region` VALUES ('1164', '340603', '', '', '相山区', '1161', '3');
INSERT INTO `region` VALUES ('1165', '340604', '', '', '烈山区', '1161', '3');
INSERT INTO `region` VALUES ('1166', '340621', '', '', '濉溪县', '1161', '3');
INSERT INTO `region` VALUES ('1167', '340700', '', '铜陵市', '', '1114', '2');
INSERT INTO `region` VALUES ('1168', '340701', '', '', '市辖区', '1167', '3');
INSERT INTO `region` VALUES ('1169', '340702', '', '', '铜官山区', '1167', '3');
INSERT INTO `region` VALUES ('1170', '340703', '', '', '狮子山区', '1167', '3');
INSERT INTO `region` VALUES ('1171', '340711', '', '', '郊区', '1167', '3');
INSERT INTO `region` VALUES ('1172', '340721', '', '', '铜陵县', '1167', '3');
INSERT INTO `region` VALUES ('1173', '340800', '', '安庆市', '', '1114', '2');
INSERT INTO `region` VALUES ('1174', '340801', '', '', '市辖区', '1173', '3');
INSERT INTO `region` VALUES ('1175', '340802', '', '', '迎江区', '1173', '3');
INSERT INTO `region` VALUES ('1176', '340803', '', '', '大观区', '1173', '3');
INSERT INTO `region` VALUES ('1177', '340811', '', '', '宜秀区', '1173', '3');
INSERT INTO `region` VALUES ('1178', '340822', '', '', '怀宁县', '1173', '3');
INSERT INTO `region` VALUES ('1179', '340823', '', '', '枞阳县', '1173', '3');
INSERT INTO `region` VALUES ('1180', '340824', '', '', '潜山县', '1173', '3');
INSERT INTO `region` VALUES ('1181', '340825', '', '', '太湖县', '1173', '3');
INSERT INTO `region` VALUES ('1182', '340826', '', '', '宿松县', '1173', '3');
INSERT INTO `region` VALUES ('1183', '340827', '', '', '望江县', '1173', '3');
INSERT INTO `region` VALUES ('1184', '340828', '', '', '岳西县', '1173', '3');
INSERT INTO `region` VALUES ('1185', '340881', '', '', '桐城市', '1173', '3');
INSERT INTO `region` VALUES ('1186', '341000', '', '黄山市', '', '1114', '2');
INSERT INTO `region` VALUES ('1187', '341001', '', '', '市辖区', '1186', '3');
INSERT INTO `region` VALUES ('1188', '341002', '', '', '屯溪区', '1186', '3');
INSERT INTO `region` VALUES ('1189', '341003', '', '', '黄山区', '1186', '3');
INSERT INTO `region` VALUES ('1190', '341004', '', '', '徽州区', '1186', '3');
INSERT INTO `region` VALUES ('1191', '341021', '', '', '歙县', '1186', '3');
INSERT INTO `region` VALUES ('1192', '341022', '', '', '休宁县', '1186', '3');
INSERT INTO `region` VALUES ('1193', '341023', '', '', '黟县', '1186', '3');
INSERT INTO `region` VALUES ('1194', '341024', '', '', '祁门县', '1186', '3');
INSERT INTO `region` VALUES ('1195', '341100', '', '滁州市', '', '1114', '2');
INSERT INTO `region` VALUES ('1196', '341101', '', '', '市辖区', '1195', '3');
INSERT INTO `region` VALUES ('1197', '341102', '', '', '琅琊区', '1195', '3');
INSERT INTO `region` VALUES ('1198', '341103', '', '', '南谯区', '1195', '3');
INSERT INTO `region` VALUES ('1199', '341122', '', '', '来安县', '1195', '3');
INSERT INTO `region` VALUES ('1200', '341124', '', '', '全椒县', '1195', '3');
INSERT INTO `region` VALUES ('1201', '341125', '', '', '定远县', '1195', '3');
INSERT INTO `region` VALUES ('1202', '341126', '', '', '凤阳县', '1195', '3');
INSERT INTO `region` VALUES ('1203', '341181', '', '', '天长市', '1195', '3');
INSERT INTO `region` VALUES ('1204', '341182', '', '', '明光市', '1195', '3');
INSERT INTO `region` VALUES ('1205', '341200', '', '阜阳市', '', '1114', '2');
INSERT INTO `region` VALUES ('1206', '341201', '', '', '市辖区', '1205', '3');
INSERT INTO `region` VALUES ('1207', '341202', '', '', '颍州区', '1205', '3');
INSERT INTO `region` VALUES ('1208', '341203', '', '', '颍东区', '1205', '3');
INSERT INTO `region` VALUES ('1209', '341204', '', '', '颍泉区', '1205', '3');
INSERT INTO `region` VALUES ('1210', '341221', '', '', '临泉县', '1205', '3');
INSERT INTO `region` VALUES ('1211', '341222', '', '', '太和县', '1205', '3');
INSERT INTO `region` VALUES ('1212', '341225', '', '', '阜南县', '1205', '3');
INSERT INTO `region` VALUES ('1213', '341226', '', '', '颍上县', '1205', '3');
INSERT INTO `region` VALUES ('1214', '341282', '', '', '界首市', '1205', '3');
INSERT INTO `region` VALUES ('1215', '341300', '', '宿州市', '', '1114', '2');
INSERT INTO `region` VALUES ('1216', '341301', '', '', '市辖区', '1215', '3');
INSERT INTO `region` VALUES ('1217', '341302', '', '', '埇桥区', '1215', '3');
INSERT INTO `region` VALUES ('1218', '341321', '', '', '砀山县', '1215', '3');
INSERT INTO `region` VALUES ('1219', '341322', '', '', '萧县', '1215', '3');
INSERT INTO `region` VALUES ('1220', '341323', '', '', '灵璧县', '1215', '3');
INSERT INTO `region` VALUES ('1221', '341324', '', '', '泗县', '1215', '3');
INSERT INTO `region` VALUES ('1222', '341500', '', '六安市', '', '1114', '2');
INSERT INTO `region` VALUES ('1223', '341501', '', '', '市辖区', '1222', '3');
INSERT INTO `region` VALUES ('1224', '341502', '', '', '金安区', '1222', '3');
INSERT INTO `region` VALUES ('1225', '341503', '', '', '裕安区', '1222', '3');
INSERT INTO `region` VALUES ('1226', '341521', '', '', '寿县', '1222', '3');
INSERT INTO `region` VALUES ('1227', '341522', '', '', '霍邱县', '1222', '3');
INSERT INTO `region` VALUES ('1228', '341523', '', '', '舒城县', '1222', '3');
INSERT INTO `region` VALUES ('1229', '341524', '', '', '金寨县', '1222', '3');
INSERT INTO `region` VALUES ('1230', '341525', '', '', '霍山县', '1222', '3');
INSERT INTO `region` VALUES ('1231', '341600', '', '亳州市', '', '1114', '2');
INSERT INTO `region` VALUES ('1232', '341601', '', '', '市辖区', '1231', '3');
INSERT INTO `region` VALUES ('1233', '341602', '', '', '谯城区', '1231', '3');
INSERT INTO `region` VALUES ('1234', '341621', '', '', '涡阳县', '1231', '3');
INSERT INTO `region` VALUES ('1235', '341622', '', '', '蒙城县', '1231', '3');
INSERT INTO `region` VALUES ('1236', '341623', '', '', '利辛县', '1231', '3');
INSERT INTO `region` VALUES ('1237', '341700', '', '池州市', '', '1114', '2');
INSERT INTO `region` VALUES ('1238', '341701', '', '', '市辖区', '1237', '3');
INSERT INTO `region` VALUES ('1239', '341702', '', '', '贵池区', '1237', '3');
INSERT INTO `region` VALUES ('1240', '341721', '', '', '东至县', '1237', '3');
INSERT INTO `region` VALUES ('1241', '341722', '', '', '石台县', '1237', '3');
INSERT INTO `region` VALUES ('1242', '341723', '', '', '青阳县', '1237', '3');
INSERT INTO `region` VALUES ('1243', '341800', '', '宣城市', '', '1114', '2');
INSERT INTO `region` VALUES ('1244', '341801', '', '', '市辖区', '1243', '3');
INSERT INTO `region` VALUES ('1245', '341802', '', '', '宣州区', '1243', '3');
INSERT INTO `region` VALUES ('1246', '341821', '', '', '郎溪县', '1243', '3');
INSERT INTO `region` VALUES ('1247', '341822', '', '', '广德县', '1243', '3');
INSERT INTO `region` VALUES ('1248', '341823', '', '', '泾县', '1243', '3');
INSERT INTO `region` VALUES ('1249', '341824', '', '', '绩溪县', '1243', '3');
INSERT INTO `region` VALUES ('1250', '341825', '', '', '旌德县', '1243', '3');
INSERT INTO `region` VALUES ('1251', '341881', '', '', '宁国市', '1243', '3');
INSERT INTO `region` VALUES ('1252', '350000', '福建省', '', '', '1', '2');
INSERT INTO `region` VALUES ('1253', '350100', '', '福州市', '', '1252', '2');
INSERT INTO `region` VALUES ('1254', '350101', '', '', '市辖区', '1253', '3');
INSERT INTO `region` VALUES ('1255', '350102', '', '', '鼓楼区', '1253', '3');
INSERT INTO `region` VALUES ('1256', '350103', '', '', '台江区', '1253', '3');
INSERT INTO `region` VALUES ('1257', '350104', '', '', '仓山区', '1253', '3');
INSERT INTO `region` VALUES ('1258', '350105', '', '', '马尾区', '1253', '3');
INSERT INTO `region` VALUES ('1259', '350111', '', '', '晋安区', '1253', '3');
INSERT INTO `region` VALUES ('1260', '350121', '', '', '闽侯县', '1253', '3');
INSERT INTO `region` VALUES ('1261', '350122', '', '', '连江县', '1253', '3');
INSERT INTO `region` VALUES ('1262', '350123', '', '', '罗源县', '1253', '3');
INSERT INTO `region` VALUES ('1263', '350124', '', '', '闽清县', '1253', '3');
INSERT INTO `region` VALUES ('1264', '350125', '', '', '永泰县', '1253', '3');
INSERT INTO `region` VALUES ('1265', '350128', '', '', '平潭县', '1253', '3');
INSERT INTO `region` VALUES ('1266', '350181', '', '', '福清市', '1253', '3');
INSERT INTO `region` VALUES ('1267', '350182', '', '', '长乐市', '1253', '3');
INSERT INTO `region` VALUES ('1268', '350200', '', '厦门市', '', '1252', '2');
INSERT INTO `region` VALUES ('1269', '350201', '', '', '市辖区', '1268', '3');
INSERT INTO `region` VALUES ('1270', '350203', '', '', '思明区', '1268', '3');
INSERT INTO `region` VALUES ('1271', '350205', '', '', '海沧区', '1268', '3');
INSERT INTO `region` VALUES ('1272', '350206', '', '', '湖里区', '1268', '3');
INSERT INTO `region` VALUES ('1273', '350211', '', '', '集美区', '1268', '3');
INSERT INTO `region` VALUES ('1274', '350212', '', '', '同安区', '1268', '3');
INSERT INTO `region` VALUES ('1275', '350213', '', '', '翔安区', '1268', '3');
INSERT INTO `region` VALUES ('1276', '350300', '', '莆田市', '', '1252', '2');
INSERT INTO `region` VALUES ('1277', '350301', '', '', '市辖区', '1276', '3');
INSERT INTO `region` VALUES ('1278', '350302', '', '', '城厢区', '1276', '3');
INSERT INTO `region` VALUES ('1279', '350303', '', '', '涵江区', '1276', '3');
INSERT INTO `region` VALUES ('1280', '350304', '', '', '荔城区', '1276', '3');
INSERT INTO `region` VALUES ('1281', '350305', '', '', '秀屿区', '1276', '3');
INSERT INTO `region` VALUES ('1282', '350322', '', '', '仙游县', '1276', '3');
INSERT INTO `region` VALUES ('1283', '350400', '', '三明市', '', '1252', '2');
INSERT INTO `region` VALUES ('1284', '350401', '', '', '市辖区', '1283', '3');
INSERT INTO `region` VALUES ('1285', '350402', '', '', '梅列区', '1283', '3');
INSERT INTO `region` VALUES ('1286', '350403', '', '', '三元区', '1283', '3');
INSERT INTO `region` VALUES ('1287', '350421', '', '', '明溪县', '1283', '3');
INSERT INTO `region` VALUES ('1288', '350423', '', '', '清流县', '1283', '3');
INSERT INTO `region` VALUES ('1289', '350424', '', '', '宁化县', '1283', '3');
INSERT INTO `region` VALUES ('1290', '350425', '', '', '大田县', '1283', '3');
INSERT INTO `region` VALUES ('1291', '350426', '', '', '尤溪县', '1283', '3');
INSERT INTO `region` VALUES ('1292', '350427', '', '', '沙县', '1283', '3');
INSERT INTO `region` VALUES ('1293', '350428', '', '', '将乐县', '1283', '3');
INSERT INTO `region` VALUES ('1294', '350429', '', '', '泰宁县', '1283', '3');
INSERT INTO `region` VALUES ('1295', '350430', '', '', '建宁县', '1283', '3');
INSERT INTO `region` VALUES ('1296', '350481', '', '', '永安市', '1283', '3');
INSERT INTO `region` VALUES ('1297', '350500', '', '泉州市', '', '1252', '2');
INSERT INTO `region` VALUES ('1298', '350501', '', '', '市辖区', '1297', '3');
INSERT INTO `region` VALUES ('1299', '350502', '', '', '鲤城区', '1297', '3');
INSERT INTO `region` VALUES ('1300', '350503', '', '', '丰泽区', '1297', '3');
INSERT INTO `region` VALUES ('1301', '350504', '', '', '洛江区', '1297', '3');
INSERT INTO `region` VALUES ('1302', '350505', '', '', '泉港区', '1297', '3');
INSERT INTO `region` VALUES ('1303', '350521', '', '', '惠安县', '1297', '3');
INSERT INTO `region` VALUES ('1304', '350524', '', '', '安溪县', '1297', '3');
INSERT INTO `region` VALUES ('1305', '350525', '', '', '永春县', '1297', '3');
INSERT INTO `region` VALUES ('1306', '350526', '', '', '德化县', '1297', '3');
INSERT INTO `region` VALUES ('1307', '350527', '', '', '金门县', '1297', '3');
INSERT INTO `region` VALUES ('1308', '350581', '', '', '石狮市', '1297', '3');
INSERT INTO `region` VALUES ('1309', '350582', '', '', '晋江市', '1297', '3');
INSERT INTO `region` VALUES ('1310', '350583', '', '', '南安市', '1297', '3');
INSERT INTO `region` VALUES ('1311', '350600', '', '漳州市', '', '1252', '2');
INSERT INTO `region` VALUES ('1312', '350601', '', '', '市辖区', '1311', '3');
INSERT INTO `region` VALUES ('1313', '350602', '', '', '芗城区', '1311', '3');
INSERT INTO `region` VALUES ('1314', '350603', '', '', '龙文区', '1311', '3');
INSERT INTO `region` VALUES ('1315', '350622', '', '', '云霄县', '1311', '3');
INSERT INTO `region` VALUES ('1316', '350623', '', '', '漳浦县', '1311', '3');
INSERT INTO `region` VALUES ('1317', '350624', '', '', '诏安县', '1311', '3');
INSERT INTO `region` VALUES ('1318', '350625', '', '', '长泰县', '1311', '3');
INSERT INTO `region` VALUES ('1319', '350626', '', '', '东山县', '1311', '3');
INSERT INTO `region` VALUES ('1320', '350627', '', '', '南靖县', '1311', '3');
INSERT INTO `region` VALUES ('1321', '350628', '', '', '平和县', '1311', '3');
INSERT INTO `region` VALUES ('1322', '350629', '', '', '华安县', '1311', '3');
INSERT INTO `region` VALUES ('1323', '350681', '', '', '龙海市', '1311', '3');
INSERT INTO `region` VALUES ('1324', '350700', '', '南平市', '', '1252', '2');
INSERT INTO `region` VALUES ('1325', '350701', '', '', '市辖区', '1324', '3');
INSERT INTO `region` VALUES ('1326', '350702', '', '', '延平区', '1324', '3');
INSERT INTO `region` VALUES ('1327', '350703', '', '', '建阳区', '1324', '3');
INSERT INTO `region` VALUES ('1328', '350721', '', '', '顺昌县', '1324', '3');
INSERT INTO `region` VALUES ('1329', '350722', '', '', '浦城县', '1324', '3');
INSERT INTO `region` VALUES ('1330', '350723', '', '', '光泽县', '1324', '3');
INSERT INTO `region` VALUES ('1331', '350724', '', '', '松溪县', '1324', '3');
INSERT INTO `region` VALUES ('1332', '350725', '', '', '政和县', '1324', '3');
INSERT INTO `region` VALUES ('1333', '350781', '', '', '邵武市', '1324', '3');
INSERT INTO `region` VALUES ('1334', '350782', '', '', '武夷山市', '1324', '3');
INSERT INTO `region` VALUES ('1335', '350783', '', '', '建瓯市', '1324', '3');
INSERT INTO `region` VALUES ('1336', '350800', '', '龙岩市', '', '1252', '2');
INSERT INTO `region` VALUES ('1337', '350801', '', '', '市辖区', '1336', '3');
INSERT INTO `region` VALUES ('1338', '350802', '', '', '新罗区', '1336', '3');
INSERT INTO `region` VALUES ('1339', '350803', '', '', '永定区', '1336', '3');
INSERT INTO `region` VALUES ('1340', '350821', '', '', '长汀县', '1336', '3');
INSERT INTO `region` VALUES ('1341', '350823', '', '', '上杭县', '1336', '3');
INSERT INTO `region` VALUES ('1342', '350824', '', '', '武平县', '1336', '3');
INSERT INTO `region` VALUES ('1343', '350825', '', '', '连城县', '1336', '3');
INSERT INTO `region` VALUES ('1344', '350881', '', '', '漳平市', '1336', '3');
INSERT INTO `region` VALUES ('1345', '350900', '', '宁德市', '', '1252', '2');
INSERT INTO `region` VALUES ('1346', '350901', '', '', '市辖区', '1345', '3');
INSERT INTO `region` VALUES ('1347', '350902', '', '', '蕉城区', '1345', '3');
INSERT INTO `region` VALUES ('1348', '350921', '', '', '霞浦县', '1345', '3');
INSERT INTO `region` VALUES ('1349', '350922', '', '', '古田县', '1345', '3');
INSERT INTO `region` VALUES ('1350', '350923', '', '', '屏南县', '1345', '3');
INSERT INTO `region` VALUES ('1351', '350924', '', '', '寿宁县', '1345', '3');
INSERT INTO `region` VALUES ('1352', '350925', '', '', '周宁县', '1345', '3');
INSERT INTO `region` VALUES ('1353', '350926', '', '', '柘荣县', '1345', '3');
INSERT INTO `region` VALUES ('1354', '350981', '', '', '福安市', '1345', '3');
INSERT INTO `region` VALUES ('1355', '350982', '', '', '福鼎市', '1345', '3');
INSERT INTO `region` VALUES ('1356', '360000', '江西省', '', '', '1', '2');
INSERT INTO `region` VALUES ('1357', '360100', '', '南昌市', '', '1356', '2');
INSERT INTO `region` VALUES ('1358', '360101', '', '', '市辖区', '1357', '3');
INSERT INTO `region` VALUES ('1359', '360102', '', '', '东湖区', '1357', '3');
INSERT INTO `region` VALUES ('1360', '360103', '', '', '西湖区', '1357', '3');
INSERT INTO `region` VALUES ('1361', '360104', '', '', '青云谱区', '1357', '3');
INSERT INTO `region` VALUES ('1362', '360105', '', '', '湾里区', '1357', '3');
INSERT INTO `region` VALUES ('1363', '360111', '', '', '青山湖区', '1357', '3');
INSERT INTO `region` VALUES ('1364', '360121', '', '', '南昌县', '1357', '3');
INSERT INTO `region` VALUES ('1365', '360122', '', '', '新建县', '1357', '3');
INSERT INTO `region` VALUES ('1366', '360123', '', '', '安义县', '1357', '3');
INSERT INTO `region` VALUES ('1367', '360124', '', '', '进贤县', '1357', '3');
INSERT INTO `region` VALUES ('1368', '360200', '', '景德镇市', '', '1356', '2');
INSERT INTO `region` VALUES ('1369', '360201', '', '', '市辖区', '1368', '3');
INSERT INTO `region` VALUES ('1370', '360202', '', '', '昌江区', '1368', '3');
INSERT INTO `region` VALUES ('1371', '360203', '', '', '珠山区', '1368', '3');
INSERT INTO `region` VALUES ('1372', '360222', '', '', '浮梁县', '1368', '3');
INSERT INTO `region` VALUES ('1373', '360281', '', '', '乐平市', '1368', '3');
INSERT INTO `region` VALUES ('1374', '360300', '', '萍乡市', '', '1356', '2');
INSERT INTO `region` VALUES ('1375', '360301', '', '', '市辖区', '1374', '3');
INSERT INTO `region` VALUES ('1376', '360302', '', '', '安源区', '1374', '3');
INSERT INTO `region` VALUES ('1377', '360313', '', '', '湘东区', '1374', '3');
INSERT INTO `region` VALUES ('1378', '360321', '', '', '莲花县', '1374', '3');
INSERT INTO `region` VALUES ('1379', '360322', '', '', '上栗县', '1374', '3');
INSERT INTO `region` VALUES ('1380', '360323', '', '', '芦溪县', '1374', '3');
INSERT INTO `region` VALUES ('1381', '360400', '', '九江市', '', '1356', '2');
INSERT INTO `region` VALUES ('1382', '360401', '', '', '市辖区', '1381', '3');
INSERT INTO `region` VALUES ('1383', '360402', '', '', '庐山区', '1381', '3');
INSERT INTO `region` VALUES ('1384', '360403', '', '', '浔阳区', '1381', '3');
INSERT INTO `region` VALUES ('1385', '360421', '', '', '九江县', '1381', '3');
INSERT INTO `region` VALUES ('1386', '360423', '', '', '武宁县', '1381', '3');
INSERT INTO `region` VALUES ('1387', '360424', '', '', '修水县', '1381', '3');
INSERT INTO `region` VALUES ('1388', '360425', '', '', '永修县', '1381', '3');
INSERT INTO `region` VALUES ('1389', '360426', '', '', '德安县', '1381', '3');
INSERT INTO `region` VALUES ('1390', '360427', '', '', '星子县', '1381', '3');
INSERT INTO `region` VALUES ('1391', '360428', '', '', '都昌县', '1381', '3');
INSERT INTO `region` VALUES ('1392', '360429', '', '', '湖口县', '1381', '3');
INSERT INTO `region` VALUES ('1393', '360430', '', '', '彭泽县', '1381', '3');
INSERT INTO `region` VALUES ('1394', '360481', '', '', '瑞昌市', '1381', '3');
INSERT INTO `region` VALUES ('1395', '360482', '', '', '共青城市', '1381', '3');
INSERT INTO `region` VALUES ('1396', '360500', '', '新余市', '', '1356', '2');
INSERT INTO `region` VALUES ('1397', '360501', '', '', '市辖区', '1396', '3');
INSERT INTO `region` VALUES ('1398', '360502', '', '', '渝水区', '1396', '3');
INSERT INTO `region` VALUES ('1399', '360521', '', '', '分宜县', '1396', '3');
INSERT INTO `region` VALUES ('1400', '360600', '', '鹰潭市', '', '1356', '2');
INSERT INTO `region` VALUES ('1401', '360601', '', '', '市辖区', '1400', '3');
INSERT INTO `region` VALUES ('1402', '360602', '', '', '月湖区', '1400', '3');
INSERT INTO `region` VALUES ('1403', '360622', '', '', '余江县', '1400', '3');
INSERT INTO `region` VALUES ('1404', '360681', '', '', '贵溪市', '1400', '3');
INSERT INTO `region` VALUES ('1405', '360700', '', '赣州市', '', '1356', '2');
INSERT INTO `region` VALUES ('1406', '360701', '', '', '市辖区', '1405', '3');
INSERT INTO `region` VALUES ('1407', '360702', '', '', '章贡区', '1405', '3');
INSERT INTO `region` VALUES ('1408', '360703', '', '', '南康区', '1405', '3');
INSERT INTO `region` VALUES ('1409', '360721', '', '', '赣县', '1405', '3');
INSERT INTO `region` VALUES ('1410', '360722', '', '', '信丰县', '1405', '3');
INSERT INTO `region` VALUES ('1411', '360723', '', '', '大余县', '1405', '3');
INSERT INTO `region` VALUES ('1412', '360724', '', '', '上犹县', '1405', '3');
INSERT INTO `region` VALUES ('1413', '360725', '', '', '崇义县', '1405', '3');
INSERT INTO `region` VALUES ('1414', '360726', '', '', '安远县', '1405', '3');
INSERT INTO `region` VALUES ('1415', '360727', '', '', '龙南县', '1405', '3');
INSERT INTO `region` VALUES ('1416', '360728', '', '', '定南县', '1405', '3');
INSERT INTO `region` VALUES ('1417', '360729', '', '', '全南县', '1405', '3');
INSERT INTO `region` VALUES ('1418', '360730', '', '', '宁都县', '1405', '3');
INSERT INTO `region` VALUES ('1419', '360731', '', '', '于都县', '1405', '3');
INSERT INTO `region` VALUES ('1420', '360732', '', '', '兴国县', '1405', '3');
INSERT INTO `region` VALUES ('1421', '360733', '', '', '会昌县', '1405', '3');
INSERT INTO `region` VALUES ('1422', '360734', '', '', '寻乌县', '1405', '3');
INSERT INTO `region` VALUES ('1423', '360735', '', '', '石城县', '1405', '3');
INSERT INTO `region` VALUES ('1424', '360781', '', '', '瑞金市', '1405', '3');
INSERT INTO `region` VALUES ('1425', '360800', '', '吉安市', '', '1356', '2');
INSERT INTO `region` VALUES ('1426', '360801', '', '', '市辖区', '1425', '3');
INSERT INTO `region` VALUES ('1427', '360802', '', '', '吉州区', '1425', '3');
INSERT INTO `region` VALUES ('1428', '360803', '', '', '青原区', '1425', '3');
INSERT INTO `region` VALUES ('1429', '360821', '', '', '吉安县', '1425', '3');
INSERT INTO `region` VALUES ('1430', '360822', '', '', '吉水县', '1425', '3');
INSERT INTO `region` VALUES ('1431', '360823', '', '', '峡江县', '1425', '3');
INSERT INTO `region` VALUES ('1432', '360824', '', '', '新干县', '1425', '3');
INSERT INTO `region` VALUES ('1433', '360825', '', '', '永丰县', '1425', '3');
INSERT INTO `region` VALUES ('1434', '360826', '', '', '泰和县', '1425', '3');
INSERT INTO `region` VALUES ('1435', '360827', '', '', '遂川县', '1425', '3');
INSERT INTO `region` VALUES ('1436', '360828', '', '', '万安县', '1425', '3');
INSERT INTO `region` VALUES ('1437', '360829', '', '', '安福县', '1425', '3');
INSERT INTO `region` VALUES ('1438', '360830', '', '', '永新县', '1425', '3');
INSERT INTO `region` VALUES ('1439', '360881', '', '', '井冈山市', '1425', '3');
INSERT INTO `region` VALUES ('1440', '360900', '', '宜春市', '', '1356', '2');
INSERT INTO `region` VALUES ('1441', '360901', '', '', '市辖区', '1440', '3');
INSERT INTO `region` VALUES ('1442', '360902', '', '', '袁州区', '1440', '3');
INSERT INTO `region` VALUES ('1443', '360921', '', '', '奉新县', '1440', '3');
INSERT INTO `region` VALUES ('1444', '360922', '', '', '万载县', '1440', '3');
INSERT INTO `region` VALUES ('1445', '360923', '', '', '上高县', '1440', '3');
INSERT INTO `region` VALUES ('1446', '360924', '', '', '宜丰县', '1440', '3');
INSERT INTO `region` VALUES ('1447', '360925', '', '', '靖安县', '1440', '3');
INSERT INTO `region` VALUES ('1448', '360926', '', '', '铜鼓县', '1440', '3');
INSERT INTO `region` VALUES ('1449', '360981', '', '', '丰城市', '1440', '3');
INSERT INTO `region` VALUES ('1450', '360982', '', '', '樟树市', '1440', '3');
INSERT INTO `region` VALUES ('1451', '360983', '', '', '高安市', '1440', '3');
INSERT INTO `region` VALUES ('1452', '361000', '', '抚州市', '', '1356', '2');
INSERT INTO `region` VALUES ('1453', '361001', '', '', '市辖区', '1452', '3');
INSERT INTO `region` VALUES ('1454', '361002', '', '', '临川区', '1452', '3');
INSERT INTO `region` VALUES ('1455', '361021', '', '', '南城县', '1452', '3');
INSERT INTO `region` VALUES ('1456', '361022', '', '', '黎川县', '1452', '3');
INSERT INTO `region` VALUES ('1457', '361023', '', '', '南丰县', '1452', '3');
INSERT INTO `region` VALUES ('1458', '361024', '', '', '崇仁县', '1452', '3');
INSERT INTO `region` VALUES ('1459', '361025', '', '', '乐安县', '1452', '3');
INSERT INTO `region` VALUES ('1460', '361026', '', '', '宜黄县', '1452', '3');
INSERT INTO `region` VALUES ('1461', '361027', '', '', '金溪县', '1452', '3');
INSERT INTO `region` VALUES ('1462', '361028', '', '', '资溪县', '1452', '3');
INSERT INTO `region` VALUES ('1463', '361029', '', '', '东乡县', '1452', '3');
INSERT INTO `region` VALUES ('1464', '361030', '', '', '广昌县', '1452', '3');
INSERT INTO `region` VALUES ('1465', '361100', '', '上饶市', '', '1356', '2');
INSERT INTO `region` VALUES ('1466', '361101', '', '', '市辖区', '1465', '3');
INSERT INTO `region` VALUES ('1467', '361102', '', '', '信州区', '1465', '3');
INSERT INTO `region` VALUES ('1468', '361121', '', '', '上饶县', '1465', '3');
INSERT INTO `region` VALUES ('1469', '361122', '', '', '广丰县', '1465', '3');
INSERT INTO `region` VALUES ('1470', '361123', '', '', '玉山县', '1465', '3');
INSERT INTO `region` VALUES ('1471', '361124', '', '', '铅山县', '1465', '3');
INSERT INTO `region` VALUES ('1472', '361125', '', '', '横峰县', '1465', '3');
INSERT INTO `region` VALUES ('1473', '361126', '', '', '弋阳县', '1465', '3');
INSERT INTO `region` VALUES ('1474', '361127', '', '', '余干县', '1465', '3');
INSERT INTO `region` VALUES ('1475', '361128', '', '', '鄱阳县', '1465', '3');
INSERT INTO `region` VALUES ('1476', '361129', '', '', '万年县', '1465', '3');
INSERT INTO `region` VALUES ('1477', '361130', '', '', '婺源县', '1465', '3');
INSERT INTO `region` VALUES ('1478', '361181', '', '', '德兴市', '1465', '3');
INSERT INTO `region` VALUES ('1479', '370000', '山东省', '', '', '1', '2');
INSERT INTO `region` VALUES ('1480', '370100', '', '济南市', '', '1479', '2');
INSERT INTO `region` VALUES ('1481', '370101', '', '', '市辖区', '1480', '3');
INSERT INTO `region` VALUES ('1482', '370102', '', '', '历下区', '1480', '3');
INSERT INTO `region` VALUES ('1483', '370103', '', '', '市中区', '1480', '3');
INSERT INTO `region` VALUES ('1484', '370104', '', '', '槐荫区', '1480', '3');
INSERT INTO `region` VALUES ('1485', '370105', '', '', '天桥区', '1480', '3');
INSERT INTO `region` VALUES ('1486', '370112', '', '', '历城区', '1480', '3');
INSERT INTO `region` VALUES ('1487', '370113', '', '', '长清区', '1480', '3');
INSERT INTO `region` VALUES ('1488', '370124', '', '', '平阴县', '1480', '3');
INSERT INTO `region` VALUES ('1489', '370125', '', '', '济阳县', '1480', '3');
INSERT INTO `region` VALUES ('1490', '370126', '', '', '商河县', '1480', '3');
INSERT INTO `region` VALUES ('1491', '370181', '', '', '章丘市', '1480', '3');
INSERT INTO `region` VALUES ('1492', '370200', '', '青岛市', '', '1479', '2');
INSERT INTO `region` VALUES ('1493', '370201', '', '', '市辖区', '1492', '3');
INSERT INTO `region` VALUES ('1494', '370202', '', '', '市南区', '1492', '3');
INSERT INTO `region` VALUES ('1495', '370203', '', '', '市北区', '1492', '3');
INSERT INTO `region` VALUES ('1496', '370211', '', '', '黄岛区', '1492', '3');
INSERT INTO `region` VALUES ('1497', '370212', '', '', '崂山区', '1492', '3');
INSERT INTO `region` VALUES ('1498', '370213', '', '', '李沧区', '1492', '3');
INSERT INTO `region` VALUES ('1499', '370214', '', '', '城阳区', '1492', '3');
INSERT INTO `region` VALUES ('1500', '370281', '', '', '胶州市', '1492', '3');
INSERT INTO `region` VALUES ('1501', '370282', '', '', '即墨市', '1492', '3');
INSERT INTO `region` VALUES ('1502', '370283', '', '', '平度市', '1492', '3');
INSERT INTO `region` VALUES ('1503', '370285', '', '', '莱西市', '1492', '3');
INSERT INTO `region` VALUES ('1504', '370300', '', '淄博市', '', '1479', '2');
INSERT INTO `region` VALUES ('1505', '370301', '', '', '市辖区', '1504', '3');
INSERT INTO `region` VALUES ('1506', '370302', '', '', '淄川区', '1504', '3');
INSERT INTO `region` VALUES ('1507', '370303', '', '', '张店区', '1504', '3');
INSERT INTO `region` VALUES ('1508', '370304', '', '', '博山区', '1504', '3');
INSERT INTO `region` VALUES ('1509', '370305', '', '', '临淄区', '1504', '3');
INSERT INTO `region` VALUES ('1510', '370306', '', '', '周村区', '1504', '3');
INSERT INTO `region` VALUES ('1511', '370321', '', '', '桓台县', '1504', '3');
INSERT INTO `region` VALUES ('1512', '370322', '', '', '高青县', '1504', '3');
INSERT INTO `region` VALUES ('1513', '370323', '', '', '沂源县', '1504', '3');
INSERT INTO `region` VALUES ('1514', '370400', '', '枣庄市', '', '1479', '2');
INSERT INTO `region` VALUES ('1515', '370401', '', '', '市辖区', '1514', '3');
INSERT INTO `region` VALUES ('1516', '370402', '', '', '市中区', '1514', '3');
INSERT INTO `region` VALUES ('1517', '370403', '', '', '薛城区', '1514', '3');
INSERT INTO `region` VALUES ('1518', '370404', '', '', '峄城区', '1514', '3');
INSERT INTO `region` VALUES ('1519', '370405', '', '', '台儿庄区', '1514', '3');
INSERT INTO `region` VALUES ('1520', '370406', '', '', '山亭区', '1514', '3');
INSERT INTO `region` VALUES ('1521', '370481', '', '', '滕州市', '1514', '3');
INSERT INTO `region` VALUES ('1522', '370500', '', '东营市', '', '1479', '2');
INSERT INTO `region` VALUES ('1523', '370501', '', '', '市辖区', '1522', '3');
INSERT INTO `region` VALUES ('1524', '370502', '', '', '东营区', '1522', '3');
INSERT INTO `region` VALUES ('1525', '370503', '', '', '河口区', '1522', '3');
INSERT INTO `region` VALUES ('1526', '370521', '', '', '垦利县', '1522', '3');
INSERT INTO `region` VALUES ('1527', '370522', '', '', '利津县', '1522', '3');
INSERT INTO `region` VALUES ('1528', '370523', '', '', '广饶县', '1522', '3');
INSERT INTO `region` VALUES ('1529', '370600', '', '烟台市', '', '1479', '2');
INSERT INTO `region` VALUES ('1530', '370601', '', '', '市辖区', '1529', '3');
INSERT INTO `region` VALUES ('1531', '370602', '', '', '芝罘区', '1529', '3');
INSERT INTO `region` VALUES ('1532', '370611', '', '', '福山区', '1529', '3');
INSERT INTO `region` VALUES ('1533', '370612', '', '', '牟平区', '1529', '3');
INSERT INTO `region` VALUES ('1534', '370613', '', '', '莱山区', '1529', '3');
INSERT INTO `region` VALUES ('1535', '370634', '', '', '长岛县', '1529', '3');
INSERT INTO `region` VALUES ('1536', '370681', '', '', '龙口市', '1529', '3');
INSERT INTO `region` VALUES ('1537', '370682', '', '', '莱阳市', '1529', '3');
INSERT INTO `region` VALUES ('1538', '370683', '', '', '莱州市', '1529', '3');
INSERT INTO `region` VALUES ('1539', '370684', '', '', '蓬莱市', '1529', '3');
INSERT INTO `region` VALUES ('1540', '370685', '', '', '招远市', '1529', '3');
INSERT INTO `region` VALUES ('1541', '370686', '', '', '栖霞市', '1529', '3');
INSERT INTO `region` VALUES ('1542', '370687', '', '', '海阳市', '1529', '3');
INSERT INTO `region` VALUES ('1543', '370700', '', '潍坊市', '', '1479', '2');
INSERT INTO `region` VALUES ('1544', '370701', '', '', '市辖区', '1543', '3');
INSERT INTO `region` VALUES ('1545', '370702', '', '', '潍城区', '1543', '3');
INSERT INTO `region` VALUES ('1546', '370703', '', '', '寒亭区', '1543', '3');
INSERT INTO `region` VALUES ('1547', '370704', '', '', '坊子区', '1543', '3');
INSERT INTO `region` VALUES ('1548', '370705', '', '', '奎文区', '1543', '3');
INSERT INTO `region` VALUES ('1549', '370724', '', '', '临朐县', '1543', '3');
INSERT INTO `region` VALUES ('1550', '370725', '', '', '昌乐县', '1543', '3');
INSERT INTO `region` VALUES ('1551', '370781', '', '', '青州市', '1543', '3');
INSERT INTO `region` VALUES ('1552', '370782', '', '', '诸城市', '1543', '3');
INSERT INTO `region` VALUES ('1553', '370783', '', '', '寿光市', '1543', '3');
INSERT INTO `region` VALUES ('1554', '370784', '', '', '安丘市', '1543', '3');
INSERT INTO `region` VALUES ('1555', '370785', '', '', '高密市', '1543', '3');
INSERT INTO `region` VALUES ('1556', '370786', '', '', '昌邑市', '1543', '3');
INSERT INTO `region` VALUES ('1557', '370800', '', '济宁市', '', '1479', '2');
INSERT INTO `region` VALUES ('1558', '370801', '', '', '市辖区', '1557', '3');
INSERT INTO `region` VALUES ('1559', '370811', '', '', '任城区', '1557', '3');
INSERT INTO `region` VALUES ('1560', '370812', '', '', '兖州区', '1557', '3');
INSERT INTO `region` VALUES ('1561', '370826', '', '', '微山县', '1557', '3');
INSERT INTO `region` VALUES ('1562', '370827', '', '', '鱼台县', '1557', '3');
INSERT INTO `region` VALUES ('1563', '370828', '', '', '金乡县', '1557', '3');
INSERT INTO `region` VALUES ('1564', '370829', '', '', '嘉祥县', '1557', '3');
INSERT INTO `region` VALUES ('1565', '370830', '', '', '汶上县', '1557', '3');
INSERT INTO `region` VALUES ('1566', '370831', '', '', '泗水县', '1557', '3');
INSERT INTO `region` VALUES ('1567', '370832', '', '', '梁山县', '1557', '3');
INSERT INTO `region` VALUES ('1568', '370881', '', '', '曲阜市', '1557', '3');
INSERT INTO `region` VALUES ('1569', '370883', '', '', '邹城市', '1557', '3');
INSERT INTO `region` VALUES ('1570', '370900', '', '泰安市', '', '1479', '2');
INSERT INTO `region` VALUES ('1571', '370901', '', '', '市辖区', '1570', '3');
INSERT INTO `region` VALUES ('1572', '370902', '', '', '泰山区', '1570', '3');
INSERT INTO `region` VALUES ('1573', '370911', '', '', '岱岳区', '1570', '3');
INSERT INTO `region` VALUES ('1574', '370921', '', '', '宁阳县', '1570', '3');
INSERT INTO `region` VALUES ('1575', '370923', '', '', '东平县', '1570', '3');
INSERT INTO `region` VALUES ('1576', '370982', '', '', '新泰市', '1570', '3');
INSERT INTO `region` VALUES ('1577', '370983', '', '', '肥城市', '1570', '3');
INSERT INTO `region` VALUES ('1578', '371000', '', '威海市', '', '1479', '2');
INSERT INTO `region` VALUES ('1579', '371001', '', '', '市辖区', '1578', '3');
INSERT INTO `region` VALUES ('1580', '371002', '', '', '环翠区', '1578', '3');
INSERT INTO `region` VALUES ('1581', '371081', '', '', '文登市', '1578', '3');
INSERT INTO `region` VALUES ('1582', '371082', '', '', '荣成市', '1578', '3');
INSERT INTO `region` VALUES ('1583', '371083', '', '', '乳山市', '1578', '3');
INSERT INTO `region` VALUES ('1584', '371100', '', '日照市', '', '1479', '2');
INSERT INTO `region` VALUES ('1585', '371101', '', '', '市辖区', '1584', '3');
INSERT INTO `region` VALUES ('1586', '371102', '', '', '东港区', '1584', '3');
INSERT INTO `region` VALUES ('1587', '371103', '', '', '岚山区', '1584', '3');
INSERT INTO `region` VALUES ('1588', '371121', '', '', '五莲县', '1584', '3');
INSERT INTO `region` VALUES ('1589', '371122', '', '', '莒县', '1584', '3');
INSERT INTO `region` VALUES ('1590', '371200', '', '莱芜市', '', '1479', '2');
INSERT INTO `region` VALUES ('1591', '371201', '', '', '市辖区', '1590', '3');
INSERT INTO `region` VALUES ('1592', '371202', '', '', '莱城区', '1590', '3');
INSERT INTO `region` VALUES ('1593', '371203', '', '', '钢城区', '1590', '3');
INSERT INTO `region` VALUES ('1594', '371300', '', '临沂市', '', '1479', '2');
INSERT INTO `region` VALUES ('1595', '371301', '', '', '市辖区', '1594', '3');
INSERT INTO `region` VALUES ('1596', '371302', '', '', '兰山区', '1594', '3');
INSERT INTO `region` VALUES ('1597', '371311', '', '', '罗庄区', '1594', '3');
INSERT INTO `region` VALUES ('1598', '371312', '', '', '河东区', '1594', '3');
INSERT INTO `region` VALUES ('1599', '371321', '', '', '沂南县', '1594', '3');
INSERT INTO `region` VALUES ('1600', '371322', '', '', '郯城县', '1594', '3');
INSERT INTO `region` VALUES ('1601', '371323', '', '', '沂水县', '1594', '3');
INSERT INTO `region` VALUES ('1602', '371324', '', '', '兰陵县', '1594', '3');
INSERT INTO `region` VALUES ('1603', '371325', '', '', '费县', '1594', '3');
INSERT INTO `region` VALUES ('1604', '371326', '', '', '平邑县', '1594', '3');
INSERT INTO `region` VALUES ('1605', '371327', '', '', '莒南县', '1594', '3');
INSERT INTO `region` VALUES ('1606', '371328', '', '', '蒙阴县', '1594', '3');
INSERT INTO `region` VALUES ('1607', '371329', '', '', '临沭县', '1594', '3');
INSERT INTO `region` VALUES ('1608', '371400', '', '德州市', '', '1479', '2');
INSERT INTO `region` VALUES ('1609', '371401', '', '', '市辖区', '1608', '3');
INSERT INTO `region` VALUES ('1610', '371402', '', '', '德城区', '1608', '3');
INSERT INTO `region` VALUES ('1611', '371403', '', '', '陵城区', '1608', '3');
INSERT INTO `region` VALUES ('1612', '371422', '', '', '宁津县', '1608', '3');
INSERT INTO `region` VALUES ('1613', '371423', '', '', '庆云县', '1608', '3');
INSERT INTO `region` VALUES ('1614', '371424', '', '', '临邑县', '1608', '3');
INSERT INTO `region` VALUES ('1615', '371425', '', '', '齐河县', '1608', '3');
INSERT INTO `region` VALUES ('1616', '371426', '', '', '平原县', '1608', '3');
INSERT INTO `region` VALUES ('1617', '371427', '', '', '夏津县', '1608', '3');
INSERT INTO `region` VALUES ('1618', '371428', '', '', '武城县', '1608', '3');
INSERT INTO `region` VALUES ('1619', '371481', '', '', '乐陵市', '1608', '3');
INSERT INTO `region` VALUES ('1620', '371482', '', '', '禹城市', '1608', '3');
INSERT INTO `region` VALUES ('1621', '371500', '', '聊城市', '', '1479', '2');
INSERT INTO `region` VALUES ('1622', '371501', '', '', '市辖区', '1621', '3');
INSERT INTO `region` VALUES ('1623', '371502', '', '', '东昌府区', '1621', '3');
INSERT INTO `region` VALUES ('1624', '371521', '', '', '阳谷县', '1621', '3');
INSERT INTO `region` VALUES ('1625', '371522', '', '', '莘县', '1621', '3');
INSERT INTO `region` VALUES ('1626', '371523', '', '', '茌平县', '1621', '3');
INSERT INTO `region` VALUES ('1627', '371524', '', '', '东阿县', '1621', '3');
INSERT INTO `region` VALUES ('1628', '371525', '', '', '冠县', '1621', '3');
INSERT INTO `region` VALUES ('1629', '371526', '', '', '高唐县', '1621', '3');
INSERT INTO `region` VALUES ('1630', '371581', '', '', '临清市', '1621', '3');
INSERT INTO `region` VALUES ('1631', '371600', '', '滨州市', '', '1479', '2');
INSERT INTO `region` VALUES ('1632', '371601', '', '', '市辖区', '1631', '3');
INSERT INTO `region` VALUES ('1633', '371602', '', '', '滨城区', '1631', '3');
INSERT INTO `region` VALUES ('1634', '371603', '', '', '沾化区', '1631', '3');
INSERT INTO `region` VALUES ('1635', '371621', '', '', '惠民县', '1631', '3');
INSERT INTO `region` VALUES ('1636', '371622', '', '', '阳信县', '1631', '3');
INSERT INTO `region` VALUES ('1637', '371623', '', '', '无棣县', '1631', '3');
INSERT INTO `region` VALUES ('1638', '371625', '', '', '博兴县', '1631', '3');
INSERT INTO `region` VALUES ('1639', '371626', '', '', '邹平县', '1631', '3');
INSERT INTO `region` VALUES ('1640', '371700', '', '菏泽市', '', '1479', '2');
INSERT INTO `region` VALUES ('1641', '371701', '', '', '市辖区', '1640', '3');
INSERT INTO `region` VALUES ('1642', '371702', '', '', '牡丹区', '1640', '3');
INSERT INTO `region` VALUES ('1643', '371721', '', '', '曹县', '1640', '3');
INSERT INTO `region` VALUES ('1644', '371722', '', '', '单县', '1640', '3');
INSERT INTO `region` VALUES ('1645', '371723', '', '', '成武县', '1640', '3');
INSERT INTO `region` VALUES ('1646', '371724', '', '', '巨野县', '1640', '3');
INSERT INTO `region` VALUES ('1647', '371725', '', '', '郓城县', '1640', '3');
INSERT INTO `region` VALUES ('1648', '371726', '', '', '鄄城县', '1640', '3');
INSERT INTO `region` VALUES ('1649', '371727', '', '', '定陶县', '1640', '3');
INSERT INTO `region` VALUES ('1650', '371728', '', '', '东明县', '1640', '3');
INSERT INTO `region` VALUES ('1651', '410000', '河南省', '', '', '1', '2');
INSERT INTO `region` VALUES ('1652', '410100', '', '郑州市', '', '1651', '2');
INSERT INTO `region` VALUES ('1653', '410101', '', '', '市辖区', '1652', '3');
INSERT INTO `region` VALUES ('1654', '410102', '', '', '中原区', '1652', '3');
INSERT INTO `region` VALUES ('1655', '410103', '', '', '二七区', '1652', '3');
INSERT INTO `region` VALUES ('1656', '410104', '', '', '管城回族区', '1652', '3');
INSERT INTO `region` VALUES ('1657', '410105', '', '', '金水区', '1652', '3');
INSERT INTO `region` VALUES ('1658', '410106', '', '', '上街区', '1652', '3');
INSERT INTO `region` VALUES ('1659', '410108', '', '', '惠济区', '1652', '3');
INSERT INTO `region` VALUES ('1660', '410122', '', '', '中牟县', '1652', '3');
INSERT INTO `region` VALUES ('1661', '410181', '', '', '巩义市', '1652', '3');
INSERT INTO `region` VALUES ('1662', '410182', '', '', '荥阳市', '1652', '3');
INSERT INTO `region` VALUES ('1663', '410183', '', '', '新密市', '1652', '3');
INSERT INTO `region` VALUES ('1664', '410184', '', '', '新郑市', '1652', '3');
INSERT INTO `region` VALUES ('1665', '410185', '', '', '登封市', '1652', '3');
INSERT INTO `region` VALUES ('1666', '410200', '', '开封市', '', '1651', '2');
INSERT INTO `region` VALUES ('1667', '410201', '', '', '市辖区', '1666', '3');
INSERT INTO `region` VALUES ('1668', '410202', '', '', '龙亭区', '1666', '3');
INSERT INTO `region` VALUES ('1669', '410203', '', '', '顺河回族区', '1666', '3');
INSERT INTO `region` VALUES ('1670', '410204', '', '', '鼓楼区', '1666', '3');
INSERT INTO `region` VALUES ('1671', '410205', '', '', '禹王台区', '1666', '3');
INSERT INTO `region` VALUES ('1672', '410212', '', '', '祥符区', '1666', '3');
INSERT INTO `region` VALUES ('1673', '410221', '', '', '杞县', '1666', '3');
INSERT INTO `region` VALUES ('1674', '410222', '', '', '通许县', '1666', '3');
INSERT INTO `region` VALUES ('1675', '410223', '', '', '尉氏县', '1666', '3');
INSERT INTO `region` VALUES ('1676', '410225', '', '', '兰考县', '1666', '3');
INSERT INTO `region` VALUES ('1677', '410300', '', '洛阳市', '', '1651', '2');
INSERT INTO `region` VALUES ('1678', '410301', '', '', '市辖区', '1677', '3');
INSERT INTO `region` VALUES ('1679', '410302', '', '', '老城区', '1677', '3');
INSERT INTO `region` VALUES ('1680', '410303', '', '', '西工区', '1677', '3');
INSERT INTO `region` VALUES ('1681', '410304', '', '', '瀍河回族区', '1677', '3');
INSERT INTO `region` VALUES ('1682', '410305', '', '', '涧西区', '1677', '3');
INSERT INTO `region` VALUES ('1683', '410306', '', '', '吉利区', '1677', '3');
INSERT INTO `region` VALUES ('1684', '410311', '', '', '洛龙区', '1677', '3');
INSERT INTO `region` VALUES ('1685', '410322', '', '', '孟津县', '1677', '3');
INSERT INTO `region` VALUES ('1686', '410323', '', '', '新安县', '1677', '3');
INSERT INTO `region` VALUES ('1687', '410324', '', '', '栾川县', '1677', '3');
INSERT INTO `region` VALUES ('1688', '410325', '', '', '嵩县', '1677', '3');
INSERT INTO `region` VALUES ('1689', '410326', '', '', '汝阳县', '1677', '3');
INSERT INTO `region` VALUES ('1690', '410327', '', '', '宜阳县', '1677', '3');
INSERT INTO `region` VALUES ('1691', '410328', '', '', '洛宁县', '1677', '3');
INSERT INTO `region` VALUES ('1692', '410329', '', '', '伊川县', '1677', '3');
INSERT INTO `region` VALUES ('1693', '410381', '', '', '偃师市', '1677', '3');
INSERT INTO `region` VALUES ('1694', '410400', '', '平顶山市', '', '1651', '2');
INSERT INTO `region` VALUES ('1695', '410401', '', '', '市辖区', '1694', '3');
INSERT INTO `region` VALUES ('1696', '410402', '', '', '新华区', '1694', '3');
INSERT INTO `region` VALUES ('1697', '410403', '', '', '卫东区', '1694', '3');
INSERT INTO `region` VALUES ('1698', '410404', '', '', '石龙区', '1694', '3');
INSERT INTO `region` VALUES ('1699', '410411', '', '', '湛河区', '1694', '3');
INSERT INTO `region` VALUES ('1700', '410421', '', '', '宝丰县', '1694', '3');
INSERT INTO `region` VALUES ('1701', '410422', '', '', '叶县', '1694', '3');
INSERT INTO `region` VALUES ('1702', '410423', '', '', '鲁山县', '1694', '3');
INSERT INTO `region` VALUES ('1703', '410425', '', '', '郏县', '1694', '3');
INSERT INTO `region` VALUES ('1704', '410481', '', '', '舞钢市', '1694', '3');
INSERT INTO `region` VALUES ('1705', '410482', '', '', '汝州市', '1694', '3');
INSERT INTO `region` VALUES ('1706', '410500', '', '安阳市', '', '1651', '2');
INSERT INTO `region` VALUES ('1707', '410501', '', '', '市辖区', '1706', '3');
INSERT INTO `region` VALUES ('1708', '410502', '', '', '文峰区', '1706', '3');
INSERT INTO `region` VALUES ('1709', '410503', '', '', '北关区', '1706', '3');
INSERT INTO `region` VALUES ('1710', '410505', '', '', '殷都区', '1706', '3');
INSERT INTO `region` VALUES ('1711', '410506', '', '', '龙安区', '1706', '3');
INSERT INTO `region` VALUES ('1712', '410522', '', '', '安阳县', '1706', '3');
INSERT INTO `region` VALUES ('1713', '410523', '', '', '汤阴县', '1706', '3');
INSERT INTO `region` VALUES ('1714', '410526', '', '', '滑县', '1706', '3');
INSERT INTO `region` VALUES ('1715', '410527', '', '', '内黄县', '1706', '3');
INSERT INTO `region` VALUES ('1716', '410581', '', '', '林州市', '1706', '3');
INSERT INTO `region` VALUES ('1717', '410600', '', '鹤壁市', '', '1651', '2');
INSERT INTO `region` VALUES ('1718', '410601', '', '', '市辖区', '1717', '3');
INSERT INTO `region` VALUES ('1719', '410602', '', '', '鹤山区', '1717', '3');
INSERT INTO `region` VALUES ('1720', '410603', '', '', '山城区', '1717', '3');
INSERT INTO `region` VALUES ('1721', '410611', '', '', '淇滨区', '1717', '3');
INSERT INTO `region` VALUES ('1722', '410621', '', '', '浚县', '1717', '3');
INSERT INTO `region` VALUES ('1723', '410622', '', '', '淇县', '1717', '3');
INSERT INTO `region` VALUES ('1724', '410700', '', '新乡市', '', '1651', '2');
INSERT INTO `region` VALUES ('1725', '410701', '', '', '市辖区', '1724', '3');
INSERT INTO `region` VALUES ('1726', '410702', '', '', '红旗区', '1724', '3');
INSERT INTO `region` VALUES ('1727', '410703', '', '', '卫滨区', '1724', '3');
INSERT INTO `region` VALUES ('1728', '410704', '', '', '凤泉区', '1724', '3');
INSERT INTO `region` VALUES ('1729', '410711', '', '', '牧野区', '1724', '3');
INSERT INTO `region` VALUES ('1730', '410721', '', '', '新乡县', '1724', '3');
INSERT INTO `region` VALUES ('1731', '410724', '', '', '获嘉县', '1724', '3');
INSERT INTO `region` VALUES ('1732', '410725', '', '', '原阳县', '1724', '3');
INSERT INTO `region` VALUES ('1733', '410726', '', '', '延津县', '1724', '3');
INSERT INTO `region` VALUES ('1734', '410727', '', '', '封丘县', '1724', '3');
INSERT INTO `region` VALUES ('1735', '410728', '', '', '长垣县', '1724', '3');
INSERT INTO `region` VALUES ('1736', '410781', '', '', '卫辉市', '1724', '3');
INSERT INTO `region` VALUES ('1737', '410782', '', '', '辉县市', '1724', '3');
INSERT INTO `region` VALUES ('1738', '410800', '', '焦作市', '', '1651', '2');
INSERT INTO `region` VALUES ('1739', '410801', '', '', '市辖区', '1738', '3');
INSERT INTO `region` VALUES ('1740', '410802', '', '', '解放区', '1738', '3');
INSERT INTO `region` VALUES ('1741', '410803', '', '', '中站区', '1738', '3');
INSERT INTO `region` VALUES ('1742', '410804', '', '', '马村区', '1738', '3');
INSERT INTO `region` VALUES ('1743', '410811', '', '', '山阳区', '1738', '3');
INSERT INTO `region` VALUES ('1744', '410821', '', '', '修武县', '1738', '3');
INSERT INTO `region` VALUES ('1745', '410822', '', '', '博爱县', '1738', '3');
INSERT INTO `region` VALUES ('1746', '410823', '', '', '武陟县', '1738', '3');
INSERT INTO `region` VALUES ('1747', '410825', '', '', '温县', '1738', '3');
INSERT INTO `region` VALUES ('1748', '410882', '', '', '沁阳市', '1738', '3');
INSERT INTO `region` VALUES ('1749', '410883', '', '', '孟州市', '1738', '3');
INSERT INTO `region` VALUES ('1750', '410900', '', '濮阳市', '', '1651', '2');
INSERT INTO `region` VALUES ('1751', '410901', '', '', '市辖区', '1750', '3');
INSERT INTO `region` VALUES ('1752', '410902', '', '', '华龙区', '1750', '3');
INSERT INTO `region` VALUES ('1753', '410922', '', '', '清丰县', '1750', '3');
INSERT INTO `region` VALUES ('1754', '410923', '', '', '南乐县', '1750', '3');
INSERT INTO `region` VALUES ('1755', '410926', '', '', '范县', '1750', '3');
INSERT INTO `region` VALUES ('1756', '410927', '', '', '台前县', '1750', '3');
INSERT INTO `region` VALUES ('1757', '410928', '', '', '濮阳县', '1750', '3');
INSERT INTO `region` VALUES ('1758', '411000', '', '许昌市', '', '1651', '2');
INSERT INTO `region` VALUES ('1759', '411001', '', '', '市辖区', '1758', '3');
INSERT INTO `region` VALUES ('1760', '411002', '', '', '魏都区', '1758', '3');
INSERT INTO `region` VALUES ('1761', '411023', '', '', '许昌县', '1758', '3');
INSERT INTO `region` VALUES ('1762', '411024', '', '', '鄢陵县', '1758', '3');
INSERT INTO `region` VALUES ('1763', '411025', '', '', '襄城县', '1758', '3');
INSERT INTO `region` VALUES ('1764', '411081', '', '', '禹州市', '1758', '3');
INSERT INTO `region` VALUES ('1765', '411082', '', '', '长葛市', '1758', '3');
INSERT INTO `region` VALUES ('1766', '411100', '', '漯河市', '', '1651', '2');
INSERT INTO `region` VALUES ('1767', '411101', '', '', '市辖区', '1766', '3');
INSERT INTO `region` VALUES ('1768', '411102', '', '', '源汇区', '1766', '3');
INSERT INTO `region` VALUES ('1769', '411103', '', '', '郾城区', '1766', '3');
INSERT INTO `region` VALUES ('1770', '411104', '', '', '召陵区', '1766', '3');
INSERT INTO `region` VALUES ('1771', '411121', '', '', '舞阳县', '1766', '3');
INSERT INTO `region` VALUES ('1772', '411122', '', '', '临颍县', '1766', '3');
INSERT INTO `region` VALUES ('1773', '411200', '', '三门峡市', '', '1651', '2');
INSERT INTO `region` VALUES ('1774', '411201', '', '', '市辖区', '1773', '3');
INSERT INTO `region` VALUES ('1775', '411202', '', '', '湖滨区', '1773', '3');
INSERT INTO `region` VALUES ('1776', '411221', '', '', '渑池县', '1773', '3');
INSERT INTO `region` VALUES ('1777', '411222', '', '', '陕县', '1773', '3');
INSERT INTO `region` VALUES ('1778', '411224', '', '', '卢氏县', '1773', '3');
INSERT INTO `region` VALUES ('1779', '411281', '', '', '义马市', '1773', '3');
INSERT INTO `region` VALUES ('1780', '411282', '', '', '灵宝市', '1773', '3');
INSERT INTO `region` VALUES ('1781', '411300', '', '南阳市', '', '1651', '2');
INSERT INTO `region` VALUES ('1782', '411301', '', '', '市辖区', '1781', '3');
INSERT INTO `region` VALUES ('1783', '411302', '', '', '宛城区', '1781', '3');
INSERT INTO `region` VALUES ('1784', '411303', '', '', '卧龙区', '1781', '3');
INSERT INTO `region` VALUES ('1785', '411321', '', '', '南召县', '1781', '3');
INSERT INTO `region` VALUES ('1786', '411322', '', '', '方城县', '1781', '3');
INSERT INTO `region` VALUES ('1787', '411323', '', '', '西峡县', '1781', '3');
INSERT INTO `region` VALUES ('1788', '411324', '', '', '镇平县', '1781', '3');
INSERT INTO `region` VALUES ('1789', '411325', '', '', '内乡县', '1781', '3');
INSERT INTO `region` VALUES ('1790', '411326', '', '', '淅川县', '1781', '3');
INSERT INTO `region` VALUES ('1791', '411327', '', '', '社旗县', '1781', '3');
INSERT INTO `region` VALUES ('1792', '411328', '', '', '唐河县', '1781', '3');
INSERT INTO `region` VALUES ('1793', '411329', '', '', '新野县', '1781', '3');
INSERT INTO `region` VALUES ('1794', '411330', '', '', '桐柏县', '1781', '3');
INSERT INTO `region` VALUES ('1795', '411381', '', '', '邓州市', '1781', '3');
INSERT INTO `region` VALUES ('1796', '411400', '', '商丘市', '', '1651', '2');
INSERT INTO `region` VALUES ('1797', '411401', '', '', '市辖区', '1796', '3');
INSERT INTO `region` VALUES ('1798', '411402', '', '', '梁园区', '1796', '3');
INSERT INTO `region` VALUES ('1799', '411403', '', '', '睢阳区', '1796', '3');
INSERT INTO `region` VALUES ('1800', '411421', '', '', '民权县', '1796', '3');
INSERT INTO `region` VALUES ('1801', '411422', '', '', '睢县', '1796', '3');
INSERT INTO `region` VALUES ('1802', '411423', '', '', '宁陵县', '1796', '3');
INSERT INTO `region` VALUES ('1803', '411424', '', '', '柘城县', '1796', '3');
INSERT INTO `region` VALUES ('1804', '411425', '', '', '虞城县', '1796', '3');
INSERT INTO `region` VALUES ('1805', '411426', '', '', '夏邑县', '1796', '3');
INSERT INTO `region` VALUES ('1806', '411481', '', '', '永城市', '1796', '3');
INSERT INTO `region` VALUES ('1807', '411500', '', '信阳市', '', '1651', '2');
INSERT INTO `region` VALUES ('1808', '411501', '', '', '市辖区', '1807', '3');
INSERT INTO `region` VALUES ('1809', '411502', '', '', '浉河区', '1807', '3');
INSERT INTO `region` VALUES ('1810', '411503', '', '', '平桥区', '1807', '3');
INSERT INTO `region` VALUES ('1811', '411521', '', '', '罗山县', '1807', '3');
INSERT INTO `region` VALUES ('1812', '411522', '', '', '光山县', '1807', '3');
INSERT INTO `region` VALUES ('1813', '411523', '', '', '新县', '1807', '3');
INSERT INTO `region` VALUES ('1814', '411524', '', '', '商城县', '1807', '3');
INSERT INTO `region` VALUES ('1815', '411525', '', '', '固始县', '1807', '3');
INSERT INTO `region` VALUES ('1816', '411526', '', '', '潢川县', '1807', '3');
INSERT INTO `region` VALUES ('1817', '411527', '', '', '淮滨县', '1807', '3');
INSERT INTO `region` VALUES ('1818', '411528', '', '', '息县', '1807', '3');
INSERT INTO `region` VALUES ('1819', '411600', '', '周口市', '', '1651', '2');
INSERT INTO `region` VALUES ('1820', '411601', '', '', '市辖区', '1819', '3');
INSERT INTO `region` VALUES ('1821', '411602', '', '', '川汇区', '1819', '3');
INSERT INTO `region` VALUES ('1822', '411621', '', '', '扶沟县', '1819', '3');
INSERT INTO `region` VALUES ('1823', '411622', '', '', '西华县', '1819', '3');
INSERT INTO `region` VALUES ('1824', '411623', '', '', '商水县', '1819', '3');
INSERT INTO `region` VALUES ('1825', '411624', '', '', '沈丘县', '1819', '3');
INSERT INTO `region` VALUES ('1826', '411625', '', '', '郸城县', '1819', '3');
INSERT INTO `region` VALUES ('1827', '411626', '', '', '淮阳县', '1819', '3');
INSERT INTO `region` VALUES ('1828', '411627', '', '', '太康县', '1819', '3');
INSERT INTO `region` VALUES ('1829', '411628', '', '', '鹿邑县', '1819', '3');
INSERT INTO `region` VALUES ('1830', '411681', '', '', '项城市', '1819', '3');
INSERT INTO `region` VALUES ('1831', '411700', '', '驻马店市', '', '1651', '2');
INSERT INTO `region` VALUES ('1832', '411701', '', '', '市辖区', '1831', '3');
INSERT INTO `region` VALUES ('1833', '411702', '', '', '驿城区', '1831', '3');
INSERT INTO `region` VALUES ('1834', '411721', '', '', '西平县', '1831', '3');
INSERT INTO `region` VALUES ('1835', '411722', '', '', '上蔡县', '1831', '3');
INSERT INTO `region` VALUES ('1836', '411723', '', '', '平舆县', '1831', '3');
INSERT INTO `region` VALUES ('1837', '411724', '', '', '正阳县', '1831', '3');
INSERT INTO `region` VALUES ('1838', '411725', '', '', '确山县', '1831', '3');
INSERT INTO `region` VALUES ('1839', '411726', '', '', '泌阳县', '1831', '3');
INSERT INTO `region` VALUES ('1840', '411727', '', '', '汝南县', '1831', '3');
INSERT INTO `region` VALUES ('1841', '411728', '', '', '遂平县', '1831', '3');
INSERT INTO `region` VALUES ('1842', '411729', '', '', '新蔡县', '1831', '3');
INSERT INTO `region` VALUES ('1843', '419000', '', '省直辖县级行政区划', '', '1651', '2');
INSERT INTO `region` VALUES ('1844', '419001', '', '', '济源市', '1843', '3');
INSERT INTO `region` VALUES ('1845', '420000', '湖北省', '', '', '1', '2');
INSERT INTO `region` VALUES ('1846', '420100', '', '武汉市', '', '1845', '2');
INSERT INTO `region` VALUES ('1847', '420101', '', '', '市辖区', '1846', '3');
INSERT INTO `region` VALUES ('1848', '420102', '', '', '江岸区', '1846', '3');
INSERT INTO `region` VALUES ('1849', '420103', '', '', '江汉区', '1846', '3');
INSERT INTO `region` VALUES ('1850', '420104', '', '', '硚口区', '1846', '3');
INSERT INTO `region` VALUES ('1851', '420105', '', '', '汉阳区', '1846', '3');
INSERT INTO `region` VALUES ('1852', '420106', '', '', '武昌区', '1846', '3');
INSERT INTO `region` VALUES ('1853', '420107', '', '', '青山区', '1846', '3');
INSERT INTO `region` VALUES ('1854', '420111', '', '', '洪山区', '1846', '3');
INSERT INTO `region` VALUES ('1855', '420112', '', '', '东西湖区', '1846', '3');
INSERT INTO `region` VALUES ('1856', '420113', '', '', '汉南区', '1846', '3');
INSERT INTO `region` VALUES ('1857', '420114', '', '', '蔡甸区', '1846', '3');
INSERT INTO `region` VALUES ('1858', '420115', '', '', '江夏区', '1846', '3');
INSERT INTO `region` VALUES ('1859', '420116', '', '', '黄陂区', '1846', '3');
INSERT INTO `region` VALUES ('1860', '420117', '', '', '新洲区', '1846', '3');
INSERT INTO `region` VALUES ('1861', '420200', '', '黄石市', '', '1845', '2');
INSERT INTO `region` VALUES ('1862', '420201', '', '', '市辖区', '1861', '3');
INSERT INTO `region` VALUES ('1863', '420202', '', '', '黄石港区', '1861', '3');
INSERT INTO `region` VALUES ('1864', '420203', '', '', '西塞山区', '1861', '3');
INSERT INTO `region` VALUES ('1865', '420204', '', '', '下陆区', '1861', '3');
INSERT INTO `region` VALUES ('1866', '420205', '', '', '铁山区', '1861', '3');
INSERT INTO `region` VALUES ('1867', '420222', '', '', '阳新县', '1861', '3');
INSERT INTO `region` VALUES ('1868', '420281', '', '', '大冶市', '1861', '3');
INSERT INTO `region` VALUES ('1869', '420300', '', '十堰市', '', '1845', '2');
INSERT INTO `region` VALUES ('1870', '420301', '', '', '市辖区', '1869', '3');
INSERT INTO `region` VALUES ('1871', '420302', '', '', '茅箭区', '1869', '3');
INSERT INTO `region` VALUES ('1872', '420303', '', '', '张湾区', '1869', '3');
INSERT INTO `region` VALUES ('1873', '420304', '', '', '郧阳区', '1869', '3');
INSERT INTO `region` VALUES ('1874', '420322', '', '', '郧西县', '1869', '3');
INSERT INTO `region` VALUES ('1875', '420323', '', '', '竹山县', '1869', '3');
INSERT INTO `region` VALUES ('1876', '420324', '', '', '竹溪县', '1869', '3');
INSERT INTO `region` VALUES ('1877', '420325', '', '', '房县', '1869', '3');
INSERT INTO `region` VALUES ('1878', '420381', '', '', '丹江口市', '1869', '3');
INSERT INTO `region` VALUES ('1879', '420500', '', '宜昌市', '', '1845', '2');
INSERT INTO `region` VALUES ('1880', '420501', '', '', '市辖区', '1879', '3');
INSERT INTO `region` VALUES ('1881', '420502', '', '', '西陵区', '1879', '3');
INSERT INTO `region` VALUES ('1882', '420503', '', '', '伍家岗区', '1879', '3');
INSERT INTO `region` VALUES ('1883', '420504', '', '', '点军区', '1879', '3');
INSERT INTO `region` VALUES ('1884', '420505', '', '', '猇亭区', '1879', '3');
INSERT INTO `region` VALUES ('1885', '420506', '', '', '夷陵区', '1879', '3');
INSERT INTO `region` VALUES ('1886', '420525', '', '', '远安县', '1879', '3');
INSERT INTO `region` VALUES ('1887', '420526', '', '', '兴山县', '1879', '3');
INSERT INTO `region` VALUES ('1888', '420527', '', '', '秭归县', '1879', '3');
INSERT INTO `region` VALUES ('1889', '420528', '', '', '长阳土家族自治县', '1879', '3');
INSERT INTO `region` VALUES ('1890', '420529', '', '', '五峰土家族自治县', '1879', '3');
INSERT INTO `region` VALUES ('1891', '420581', '', '', '宜都市', '1879', '3');
INSERT INTO `region` VALUES ('1892', '420582', '', '', '当阳市', '1879', '3');
INSERT INTO `region` VALUES ('1893', '420583', '', '', '枝江市', '1879', '3');
INSERT INTO `region` VALUES ('1894', '420600', '', '襄阳市', '', '1845', '2');
INSERT INTO `region` VALUES ('1895', '420601', '', '', '市辖区', '1894', '3');
INSERT INTO `region` VALUES ('1896', '420602', '', '', '襄城区', '1894', '3');
INSERT INTO `region` VALUES ('1897', '420606', '', '', '樊城区', '1894', '3');
INSERT INTO `region` VALUES ('1898', '420607', '', '', '襄州区', '1894', '3');
INSERT INTO `region` VALUES ('1899', '420624', '', '', '南漳县', '1894', '3');
INSERT INTO `region` VALUES ('1900', '420625', '', '', '谷城县', '1894', '3');
INSERT INTO `region` VALUES ('1901', '420626', '', '', '保康县', '1894', '3');
INSERT INTO `region` VALUES ('1902', '420682', '', '', '老河口市', '1894', '3');
INSERT INTO `region` VALUES ('1903', '420683', '', '', '枣阳市', '1894', '3');
INSERT INTO `region` VALUES ('1904', '420684', '', '', '宜城市', '1894', '3');
INSERT INTO `region` VALUES ('1905', '420700', '', '鄂州市', '', '1845', '2');
INSERT INTO `region` VALUES ('1906', '420701', '', '', '市辖区', '1905', '3');
INSERT INTO `region` VALUES ('1907', '420702', '', '', '梁子湖区', '1905', '3');
INSERT INTO `region` VALUES ('1908', '420703', '', '', '华容区', '1905', '3');
INSERT INTO `region` VALUES ('1909', '420704', '', '', '鄂城区', '1905', '3');
INSERT INTO `region` VALUES ('1910', '420800', '', '荆门市', '', '1845', '2');
INSERT INTO `region` VALUES ('1911', '420801', '', '', '市辖区', '1910', '3');
INSERT INTO `region` VALUES ('1912', '420802', '', '', '东宝区', '1910', '3');
INSERT INTO `region` VALUES ('1913', '420804', '', '', '掇刀区', '1910', '3');
INSERT INTO `region` VALUES ('1914', '420821', '', '', '京山县', '1910', '3');
INSERT INTO `region` VALUES ('1915', '420822', '', '', '沙洋县', '1910', '3');
INSERT INTO `region` VALUES ('1916', '420881', '', '', '钟祥市', '1910', '3');
INSERT INTO `region` VALUES ('1917', '420900', '', '孝感市', '', '1845', '2');
INSERT INTO `region` VALUES ('1918', '420901', '', '', '市辖区', '1917', '3');
INSERT INTO `region` VALUES ('1919', '420902', '', '', '孝南区', '1917', '3');
INSERT INTO `region` VALUES ('1920', '420921', '', '', '孝昌县', '1917', '3');
INSERT INTO `region` VALUES ('1921', '420922', '', '', '大悟县', '1917', '3');
INSERT INTO `region` VALUES ('1922', '420923', '', '', '云梦县', '1917', '3');
INSERT INTO `region` VALUES ('1923', '420981', '', '', '应城市', '1917', '3');
INSERT INTO `region` VALUES ('1924', '420982', '', '', '安陆市', '1917', '3');
INSERT INTO `region` VALUES ('1925', '420984', '', '', '汉川市', '1917', '3');
INSERT INTO `region` VALUES ('1926', '421000', '', '荆州市', '', '1845', '2');
INSERT INTO `region` VALUES ('1927', '421001', '', '', '市辖区', '1926', '3');
INSERT INTO `region` VALUES ('1928', '421002', '', '', '沙市区', '1926', '3');
INSERT INTO `region` VALUES ('1929', '421003', '', '', '荆州区', '1926', '3');
INSERT INTO `region` VALUES ('1930', '421022', '', '', '公安县', '1926', '3');
INSERT INTO `region` VALUES ('1931', '421023', '', '', '监利县', '1926', '3');
INSERT INTO `region` VALUES ('1932', '421024', '', '', '江陵县', '1926', '3');
INSERT INTO `region` VALUES ('1933', '421081', '', '', '石首市', '1926', '3');
INSERT INTO `region` VALUES ('1934', '421083', '', '', '洪湖市', '1926', '3');
INSERT INTO `region` VALUES ('1935', '421087', '', '', '松滋市', '1926', '3');
INSERT INTO `region` VALUES ('1936', '421100', '', '黄冈市', '', '1845', '2');
INSERT INTO `region` VALUES ('1937', '421101', '', '', '市辖区', '1936', '3');
INSERT INTO `region` VALUES ('1938', '421102', '', '', '黄州区', '1936', '3');
INSERT INTO `region` VALUES ('1939', '421121', '', '', '团风县', '1936', '3');
INSERT INTO `region` VALUES ('1940', '421122', '', '', '红安县', '1936', '3');
INSERT INTO `region` VALUES ('1941', '421123', '', '', '罗田县', '1936', '3');
INSERT INTO `region` VALUES ('1942', '421124', '', '', '英山县', '1936', '3');
INSERT INTO `region` VALUES ('1943', '421125', '', '', '浠水县', '1936', '3');
INSERT INTO `region` VALUES ('1944', '421126', '', '', '蕲春县', '1936', '3');
INSERT INTO `region` VALUES ('1945', '421127', '', '', '黄梅县', '1936', '3');
INSERT INTO `region` VALUES ('1946', '421181', '', '', '麻城市', '1936', '3');
INSERT INTO `region` VALUES ('1947', '421182', '', '', '武穴市', '1936', '3');
INSERT INTO `region` VALUES ('1948', '421200', '', '咸宁市', '', '1845', '2');
INSERT INTO `region` VALUES ('1949', '421201', '', '', '市辖区', '1948', '3');
INSERT INTO `region` VALUES ('1950', '421202', '', '', '咸安区', '1948', '3');
INSERT INTO `region` VALUES ('1951', '421221', '', '', '嘉鱼县', '1948', '3');
INSERT INTO `region` VALUES ('1952', '421222', '', '', '通城县', '1948', '3');
INSERT INTO `region` VALUES ('1953', '421223', '', '', '崇阳县', '1948', '3');
INSERT INTO `region` VALUES ('1954', '421224', '', '', '通山县', '1948', '3');
INSERT INTO `region` VALUES ('1955', '421281', '', '', '赤壁市', '1948', '3');
INSERT INTO `region` VALUES ('1956', '421300', '', '随州市', '', '1845', '2');
INSERT INTO `region` VALUES ('1957', '421301', '', '', '市辖区', '1956', '3');
INSERT INTO `region` VALUES ('1958', '421303', '', '', '曾都区', '1956', '3');
INSERT INTO `region` VALUES ('1959', '421321', '', '', '随县', '1956', '3');
INSERT INTO `region` VALUES ('1960', '421381', '', '', '广水市', '1956', '3');
INSERT INTO `region` VALUES ('1961', '422800', '', '恩施土家族苗族自治州', '', '1845', '2');
INSERT INTO `region` VALUES ('1962', '422801', '', '', '恩施市', '1961', '3');
INSERT INTO `region` VALUES ('1963', '422802', '', '', '利川市', '1961', '3');
INSERT INTO `region` VALUES ('1964', '422822', '', '', '建始县', '1961', '3');
INSERT INTO `region` VALUES ('1965', '422823', '', '', '巴东县', '1961', '3');
INSERT INTO `region` VALUES ('1966', '422825', '', '', '宣恩县', '1961', '3');
INSERT INTO `region` VALUES ('1967', '422826', '', '', '咸丰县', '1961', '3');
INSERT INTO `region` VALUES ('1968', '422827', '', '', '来凤县', '1961', '3');
INSERT INTO `region` VALUES ('1969', '422828', '', '', '鹤峰县', '1961', '3');
INSERT INTO `region` VALUES ('1970', '429000', '', '省直辖县级行政区划', '', '1845', '2');
INSERT INTO `region` VALUES ('1971', '429004', '', '', '仙桃市', '1970', '3');
INSERT INTO `region` VALUES ('1972', '429005', '', '', '潜江市', '1970', '3');
INSERT INTO `region` VALUES ('1973', '429006', '', '', '天门市', '1970', '3');
INSERT INTO `region` VALUES ('1974', '429021', '', '', '神农架林区', '1970', '3');
INSERT INTO `region` VALUES ('1975', '430000', '湖南省', '', '', '1', '2');
INSERT INTO `region` VALUES ('1976', '430100', '', '长沙市', '', '1975', '2');
INSERT INTO `region` VALUES ('1977', '430101', '', '', '市辖区', '1976', '3');
INSERT INTO `region` VALUES ('1978', '430102', '', '', '芙蓉区', '1976', '3');
INSERT INTO `region` VALUES ('1979', '430103', '', '', '天心区', '1976', '3');
INSERT INTO `region` VALUES ('1980', '430104', '', '', '岳麓区', '1976', '3');
INSERT INTO `region` VALUES ('1981', '430105', '', '', '开福区', '1976', '3');
INSERT INTO `region` VALUES ('1982', '430111', '', '', '雨花区', '1976', '3');
INSERT INTO `region` VALUES ('1983', '430112', '', '', '望城区', '1976', '3');
INSERT INTO `region` VALUES ('1984', '430121', '', '', '长沙县', '1976', '3');
INSERT INTO `region` VALUES ('1985', '430124', '', '', '宁乡县', '1976', '3');
INSERT INTO `region` VALUES ('1986', '430181', '', '', '浏阳市', '1976', '3');
INSERT INTO `region` VALUES ('1987', '430200', '', '株洲市', '', '1975', '2');
INSERT INTO `region` VALUES ('1988', '430201', '', '', '市辖区', '1987', '3');
INSERT INTO `region` VALUES ('1989', '430202', '', '', '荷塘区', '1987', '3');
INSERT INTO `region` VALUES ('1990', '430203', '', '', '芦淞区', '1987', '3');
INSERT INTO `region` VALUES ('1991', '430204', '', '', '石峰区', '1987', '3');
INSERT INTO `region` VALUES ('1992', '430211', '', '', '天元区', '1987', '3');
INSERT INTO `region` VALUES ('1993', '430221', '', '', '株洲县', '1987', '3');
INSERT INTO `region` VALUES ('1994', '430223', '', '', '攸县', '1987', '3');
INSERT INTO `region` VALUES ('1995', '430224', '', '', '茶陵县', '1987', '3');
INSERT INTO `region` VALUES ('1996', '430225', '', '', '炎陵县', '1987', '3');
INSERT INTO `region` VALUES ('1997', '430281', '', '', '醴陵市', '1987', '3');
INSERT INTO `region` VALUES ('1998', '430300', '', '湘潭市', '', '1975', '2');
INSERT INTO `region` VALUES ('1999', '430301', '', '', '市辖区', '1998', '3');
INSERT INTO `region` VALUES ('2000', '430302', '', '', '雨湖区', '1998', '3');
INSERT INTO `region` VALUES ('2001', '430304', '', '', '岳塘区', '1998', '3');
INSERT INTO `region` VALUES ('2002', '430321', '', '', '湘潭县', '1998', '3');
INSERT INTO `region` VALUES ('2003', '430381', '', '', '湘乡市', '1998', '3');
INSERT INTO `region` VALUES ('2004', '430382', '', '', '韶山市', '1998', '3');
INSERT INTO `region` VALUES ('2005', '430400', '', '衡阳市', '', '1975', '2');
INSERT INTO `region` VALUES ('2006', '430401', '', '', '市辖区', '2005', '3');
INSERT INTO `region` VALUES ('2007', '430405', '', '', '珠晖区', '2005', '3');
INSERT INTO `region` VALUES ('2008', '430406', '', '', '雁峰区', '2005', '3');
INSERT INTO `region` VALUES ('2009', '430407', '', '', '石鼓区', '2005', '3');
INSERT INTO `region` VALUES ('2010', '430408', '', '', '蒸湘区', '2005', '3');
INSERT INTO `region` VALUES ('2011', '430412', '', '', '南岳区', '2005', '3');
INSERT INTO `region` VALUES ('2012', '430421', '', '', '衡阳县', '2005', '3');
INSERT INTO `region` VALUES ('2013', '430422', '', '', '衡南县', '2005', '3');
INSERT INTO `region` VALUES ('2014', '430423', '', '', '衡山县', '2005', '3');
INSERT INTO `region` VALUES ('2015', '430424', '', '', '衡东县', '2005', '3');
INSERT INTO `region` VALUES ('2016', '430426', '', '', '祁东县', '2005', '3');
INSERT INTO `region` VALUES ('2017', '430481', '', '', '耒阳市', '2005', '3');
INSERT INTO `region` VALUES ('2018', '430482', '', '', '常宁市', '2005', '3');
INSERT INTO `region` VALUES ('2019', '430500', '', '邵阳市', '', '1975', '2');
INSERT INTO `region` VALUES ('2020', '430501', '', '', '市辖区', '2019', '3');
INSERT INTO `region` VALUES ('2021', '430502', '', '', '双清区', '2019', '3');
INSERT INTO `region` VALUES ('2022', '430503', '', '', '大祥区', '2019', '3');
INSERT INTO `region` VALUES ('2023', '430511', '', '', '北塔区', '2019', '3');
INSERT INTO `region` VALUES ('2024', '430521', '', '', '邵东县', '2019', '3');
INSERT INTO `region` VALUES ('2025', '430522', '', '', '新邵县', '2019', '3');
INSERT INTO `region` VALUES ('2026', '430523', '', '', '邵阳县', '2019', '3');
INSERT INTO `region` VALUES ('2027', '430524', '', '', '隆回县', '2019', '3');
INSERT INTO `region` VALUES ('2028', '430525', '', '', '洞口县', '2019', '3');
INSERT INTO `region` VALUES ('2029', '430527', '', '', '绥宁县', '2019', '3');
INSERT INTO `region` VALUES ('2030', '430528', '', '', '新宁县', '2019', '3');
INSERT INTO `region` VALUES ('2031', '430529', '', '', '城步苗族自治县', '2019', '3');
INSERT INTO `region` VALUES ('2032', '430581', '', '', '武冈市', '2019', '3');
INSERT INTO `region` VALUES ('2033', '430600', '', '岳阳市', '', '1975', '2');
INSERT INTO `region` VALUES ('2034', '430601', '', '', '市辖区', '2033', '3');
INSERT INTO `region` VALUES ('2035', '430602', '', '', '岳阳楼区', '2033', '3');
INSERT INTO `region` VALUES ('2036', '430603', '', '', '云溪区', '2033', '3');
INSERT INTO `region` VALUES ('2037', '430611', '', '', '君山区', '2033', '3');
INSERT INTO `region` VALUES ('2038', '430621', '', '', '岳阳县', '2033', '3');
INSERT INTO `region` VALUES ('2039', '430623', '', '', '华容县', '2033', '3');
INSERT INTO `region` VALUES ('2040', '430624', '', '', '湘阴县', '2033', '3');
INSERT INTO `region` VALUES ('2041', '430626', '', '', '平江县', '2033', '3');
INSERT INTO `region` VALUES ('2042', '430681', '', '', '汨罗市', '2033', '3');
INSERT INTO `region` VALUES ('2043', '430682', '', '', '临湘市', '2033', '3');
INSERT INTO `region` VALUES ('2044', '430700', '', '常德市', '', '1975', '2');
INSERT INTO `region` VALUES ('2045', '430701', '', '', '市辖区', '2044', '3');
INSERT INTO `region` VALUES ('2046', '430702', '', '', '武陵区', '2044', '3');
INSERT INTO `region` VALUES ('2047', '430703', '', '', '鼎城区', '2044', '3');
INSERT INTO `region` VALUES ('2048', '430721', '', '', '安乡县', '2044', '3');
INSERT INTO `region` VALUES ('2049', '430722', '', '', '汉寿县', '2044', '3');
INSERT INTO `region` VALUES ('2050', '430723', '', '', '澧县', '2044', '3');
INSERT INTO `region` VALUES ('2051', '430724', '', '', '临澧县', '2044', '3');
INSERT INTO `region` VALUES ('2052', '430725', '', '', '桃源县', '2044', '3');
INSERT INTO `region` VALUES ('2053', '430726', '', '', '石门县', '2044', '3');
INSERT INTO `region` VALUES ('2054', '430781', '', '', '津市市', '2044', '3');
INSERT INTO `region` VALUES ('2055', '430800', '', '张家界市', '', '1975', '2');
INSERT INTO `region` VALUES ('2056', '430801', '', '', '市辖区', '2055', '3');
INSERT INTO `region` VALUES ('2057', '430802', '', '', '永定区', '2055', '3');
INSERT INTO `region` VALUES ('2058', '430811', '', '', '武陵源区', '2055', '3');
INSERT INTO `region` VALUES ('2059', '430821', '', '', '慈利县', '2055', '3');
INSERT INTO `region` VALUES ('2060', '430822', '', '', '桑植县', '2055', '3');
INSERT INTO `region` VALUES ('2061', '430900', '', '益阳市', '', '1975', '2');
INSERT INTO `region` VALUES ('2062', '430901', '', '', '市辖区', '2061', '3');
INSERT INTO `region` VALUES ('2063', '430902', '', '', '资阳区', '2061', '3');
INSERT INTO `region` VALUES ('2064', '430903', '', '', '赫山区', '2061', '3');
INSERT INTO `region` VALUES ('2065', '430921', '', '', '南县', '2061', '3');
INSERT INTO `region` VALUES ('2066', '430922', '', '', '桃江县', '2061', '3');
INSERT INTO `region` VALUES ('2067', '430923', '', '', '安化县', '2061', '3');
INSERT INTO `region` VALUES ('2068', '430981', '', '', '沅江市', '2061', '3');
INSERT INTO `region` VALUES ('2069', '431000', '', '郴州市', '', '1975', '2');
INSERT INTO `region` VALUES ('2070', '431001', '', '', '市辖区', '2069', '3');
INSERT INTO `region` VALUES ('2071', '431002', '', '', '北湖区', '2069', '3');
INSERT INTO `region` VALUES ('2072', '431003', '', '', '苏仙区', '2069', '3');
INSERT INTO `region` VALUES ('2073', '431021', '', '', '桂阳县', '2069', '3');
INSERT INTO `region` VALUES ('2074', '431022', '', '', '宜章县', '2069', '3');
INSERT INTO `region` VALUES ('2075', '431023', '', '', '永兴县', '2069', '3');
INSERT INTO `region` VALUES ('2076', '431024', '', '', '嘉禾县', '2069', '3');
INSERT INTO `region` VALUES ('2077', '431025', '', '', '临武县', '2069', '3');
INSERT INTO `region` VALUES ('2078', '431026', '', '', '汝城县', '2069', '3');
INSERT INTO `region` VALUES ('2079', '431027', '', '', '桂东县', '2069', '3');
INSERT INTO `region` VALUES ('2080', '431028', '', '', '安仁县', '2069', '3');
INSERT INTO `region` VALUES ('2081', '431081', '', '', '资兴市', '2069', '3');
INSERT INTO `region` VALUES ('2082', '431100', '', '永州市', '', '1975', '2');
INSERT INTO `region` VALUES ('2083', '431101', '', '', '市辖区', '2082', '3');
INSERT INTO `region` VALUES ('2084', '431102', '', '', '零陵区', '2082', '3');
INSERT INTO `region` VALUES ('2085', '431103', '', '', '冷水滩区', '2082', '3');
INSERT INTO `region` VALUES ('2086', '431121', '', '', '祁阳县', '2082', '3');
INSERT INTO `region` VALUES ('2087', '431122', '', '', '东安县', '2082', '3');
INSERT INTO `region` VALUES ('2088', '431123', '', '', '双牌县', '2082', '3');
INSERT INTO `region` VALUES ('2089', '431124', '', '', '道县', '2082', '3');
INSERT INTO `region` VALUES ('2090', '431125', '', '', '江永县', '2082', '3');
INSERT INTO `region` VALUES ('2091', '431126', '', '', '宁远县', '2082', '3');
INSERT INTO `region` VALUES ('2092', '431127', '', '', '蓝山县', '2082', '3');
INSERT INTO `region` VALUES ('2093', '431128', '', '', '新田县', '2082', '3');
INSERT INTO `region` VALUES ('2094', '431129', '', '', '江华瑶族自治县', '2082', '3');
INSERT INTO `region` VALUES ('2095', '431200', '', '怀化市', '', '1975', '2');
INSERT INTO `region` VALUES ('2096', '431201', '', '', '市辖区', '2095', '3');
INSERT INTO `region` VALUES ('2097', '431202', '', '', '鹤城区', '2095', '3');
INSERT INTO `region` VALUES ('2098', '431221', '', '', '中方县', '2095', '3');
INSERT INTO `region` VALUES ('2099', '431222', '', '', '沅陵县', '2095', '3');
INSERT INTO `region` VALUES ('2100', '431223', '', '', '辰溪县', '2095', '3');
INSERT INTO `region` VALUES ('2101', '431224', '', '', '溆浦县', '2095', '3');
INSERT INTO `region` VALUES ('2102', '431225', '', '', '会同县', '2095', '3');
INSERT INTO `region` VALUES ('2103', '431226', '', '', '麻阳苗族自治县', '2095', '3');
INSERT INTO `region` VALUES ('2104', '431227', '', '', '新晃侗族自治县', '2095', '3');
INSERT INTO `region` VALUES ('2105', '431228', '', '', '芷江侗族自治县', '2095', '3');
INSERT INTO `region` VALUES ('2106', '431229', '', '', '靖州苗族侗族自治县', '2095', '3');
INSERT INTO `region` VALUES ('2107', '431230', '', '', '通道侗族自治县', '2095', '3');
INSERT INTO `region` VALUES ('2108', '431281', '', '', '洪江市', '2095', '3');
INSERT INTO `region` VALUES ('2109', '431300', '', '娄底市', '', '1975', '2');
INSERT INTO `region` VALUES ('2110', '431301', '', '', '市辖区', '2109', '3');
INSERT INTO `region` VALUES ('2111', '431302', '', '', '娄星区', '2109', '3');
INSERT INTO `region` VALUES ('2112', '431321', '', '', '双峰县', '2109', '3');
INSERT INTO `region` VALUES ('2113', '431322', '', '', '新化县', '2109', '3');
INSERT INTO `region` VALUES ('2114', '431381', '', '', '冷水江市', '2109', '3');
INSERT INTO `region` VALUES ('2115', '431382', '', '', '涟源市', '2109', '3');
INSERT INTO `region` VALUES ('2116', '433100', '', '湘西土家族苗族自治州', '', '1975', '2');
INSERT INTO `region` VALUES ('2117', '433101', '', '', '吉首市', '2116', '3');
INSERT INTO `region` VALUES ('2118', '433122', '', '', '泸溪县', '2116', '3');
INSERT INTO `region` VALUES ('2119', '433123', '', '', '凤凰县', '2116', '3');
INSERT INTO `region` VALUES ('2120', '433124', '', '', '花垣县', '2116', '3');
INSERT INTO `region` VALUES ('2121', '433125', '', '', '保靖县', '2116', '3');
INSERT INTO `region` VALUES ('2122', '433126', '', '', '古丈县', '2116', '3');
INSERT INTO `region` VALUES ('2123', '433127', '', '', '永顺县', '2116', '3');
INSERT INTO `region` VALUES ('2124', '433130', '', '', '龙山县', '2116', '3');
INSERT INTO `region` VALUES ('2125', '440000', '广东省', '', '', '1', '2');
INSERT INTO `region` VALUES ('2126', '440100', '', '广州市', '', '2125', '2');
INSERT INTO `region` VALUES ('2127', '440101', '', '', '市辖区', '2126', '3');
INSERT INTO `region` VALUES ('2128', '440103', '', '', '荔湾区', '2126', '3');
INSERT INTO `region` VALUES ('2129', '440104', '', '', '越秀区', '2126', '3');
INSERT INTO `region` VALUES ('2130', '440105', '', '', '海珠区', '2126', '3');
INSERT INTO `region` VALUES ('2131', '440106', '', '', '天河区', '2126', '3');
INSERT INTO `region` VALUES ('2132', '440111', '', '', '白云区', '2126', '3');
INSERT INTO `region` VALUES ('2133', '440112', '', '', '黄埔区', '2126', '3');
INSERT INTO `region` VALUES ('2134', '440113', '', '', '番禺区', '2126', '3');
INSERT INTO `region` VALUES ('2135', '440114', '', '', '花都区', '2126', '3');
INSERT INTO `region` VALUES ('2136', '440115', '', '', '南沙区', '2126', '3');
INSERT INTO `region` VALUES ('2137', '440117', '', '', '从化区', '2126', '3');
INSERT INTO `region` VALUES ('2138', '440118', '', '', '增城区', '2126', '3');
INSERT INTO `region` VALUES ('2139', '440200', '', '韶关市', '', '2125', '2');
INSERT INTO `region` VALUES ('2140', '440201', '', '', '市辖区', '2139', '3');
INSERT INTO `region` VALUES ('2141', '440203', '', '', '武江区', '2139', '3');
INSERT INTO `region` VALUES ('2142', '440204', '', '', '浈江区', '2139', '3');
INSERT INTO `region` VALUES ('2143', '440205', '', '', '曲江区', '2139', '3');
INSERT INTO `region` VALUES ('2144', '440222', '', '', '始兴县', '2139', '3');
INSERT INTO `region` VALUES ('2145', '440224', '', '', '仁化县', '2139', '3');
INSERT INTO `region` VALUES ('2146', '440229', '', '', '翁源县', '2139', '3');
INSERT INTO `region` VALUES ('2147', '440232', '', '', '乳源瑶族自治县', '2139', '3');
INSERT INTO `region` VALUES ('2148', '440233', '', '', '新丰县', '2139', '3');
INSERT INTO `region` VALUES ('2149', '440281', '', '', '乐昌市', '2139', '3');
INSERT INTO `region` VALUES ('2150', '440282', '', '', '南雄市', '2139', '3');
INSERT INTO `region` VALUES ('2151', '440300', '', '深圳市', '', '2125', '2');
INSERT INTO `region` VALUES ('2152', '440301', '', '', '市辖区', '2151', '3');
INSERT INTO `region` VALUES ('2153', '440303', '', '', '罗湖区', '2151', '3');
INSERT INTO `region` VALUES ('2154', '440304', '', '', '福田区', '2151', '3');
INSERT INTO `region` VALUES ('2155', '440305', '', '', '南山区', '2151', '3');
INSERT INTO `region` VALUES ('2156', '440306', '', '', '宝安区', '2151', '3');
INSERT INTO `region` VALUES ('2157', '440307', '', '', '龙岗区', '2151', '3');
INSERT INTO `region` VALUES ('2158', '440308', '', '', '盐田区', '2151', '3');
INSERT INTO `region` VALUES ('2159', '440400', '', '珠海市', '', '2125', '2');
INSERT INTO `region` VALUES ('2160', '440401', '', '', '市辖区', '2159', '3');
INSERT INTO `region` VALUES ('2161', '440402', '', '', '香洲区', '2159', '3');
INSERT INTO `region` VALUES ('2162', '440403', '', '', '斗门区', '2159', '3');
INSERT INTO `region` VALUES ('2163', '440404', '', '', '金湾区', '2159', '3');
INSERT INTO `region` VALUES ('2164', '440500', '', '汕头市', '', '2125', '2');
INSERT INTO `region` VALUES ('2165', '440501', '', '', '市辖区', '2164', '3');
INSERT INTO `region` VALUES ('2166', '440507', '', '', '龙湖区', '2164', '3');
INSERT INTO `region` VALUES ('2167', '440511', '', '', '金平区', '2164', '3');
INSERT INTO `region` VALUES ('2168', '440512', '', '', '濠江区', '2164', '3');
INSERT INTO `region` VALUES ('2169', '440513', '', '', '潮阳区', '2164', '3');
INSERT INTO `region` VALUES ('2170', '440514', '', '', '潮南区', '2164', '3');
INSERT INTO `region` VALUES ('2171', '440515', '', '', '澄海区', '2164', '3');
INSERT INTO `region` VALUES ('2172', '440523', '', '', '南澳县', '2164', '3');
INSERT INTO `region` VALUES ('2173', '440600', '', '佛山市', '', '2125', '2');
INSERT INTO `region` VALUES ('2174', '440601', '', '', '市辖区', '2173', '3');
INSERT INTO `region` VALUES ('2175', '440604', '', '', '禅城区', '2173', '3');
INSERT INTO `region` VALUES ('2176', '440605', '', '', '南海区', '2173', '3');
INSERT INTO `region` VALUES ('2177', '440606', '', '', '顺德区', '2173', '3');
INSERT INTO `region` VALUES ('2178', '440607', '', '', '三水区', '2173', '3');
INSERT INTO `region` VALUES ('2179', '440608', '', '', '高明区', '2173', '3');
INSERT INTO `region` VALUES ('2180', '440700', '', '江门市', '', '2125', '2');
INSERT INTO `region` VALUES ('2181', '440701', '', '', '市辖区', '2180', '3');
INSERT INTO `region` VALUES ('2182', '440703', '', '', '蓬江区', '2180', '3');
INSERT INTO `region` VALUES ('2183', '440704', '', '', '江海区', '2180', '3');
INSERT INTO `region` VALUES ('2184', '440705', '', '', '新会区', '2180', '3');
INSERT INTO `region` VALUES ('2185', '440781', '', '', '台山市', '2180', '3');
INSERT INTO `region` VALUES ('2186', '440783', '', '', '开平市', '2180', '3');
INSERT INTO `region` VALUES ('2187', '440784', '', '', '鹤山市', '2180', '3');
INSERT INTO `region` VALUES ('2188', '440785', '', '', '恩平市', '2180', '3');
INSERT INTO `region` VALUES ('2189', '440800', '', '湛江市', '', '2125', '2');
INSERT INTO `region` VALUES ('2190', '440801', '', '', '市辖区', '2189', '3');
INSERT INTO `region` VALUES ('2191', '440802', '', '', '赤坎区', '2189', '3');
INSERT INTO `region` VALUES ('2192', '440803', '', '', '霞山区', '2189', '3');
INSERT INTO `region` VALUES ('2193', '440804', '', '', '坡头区', '2189', '3');
INSERT INTO `region` VALUES ('2194', '440811', '', '', '麻章区', '2189', '3');
INSERT INTO `region` VALUES ('2195', '440823', '', '', '遂溪县', '2189', '3');
INSERT INTO `region` VALUES ('2196', '440825', '', '', '徐闻县', '2189', '3');
INSERT INTO `region` VALUES ('2197', '440881', '', '', '廉江市', '2189', '3');
INSERT INTO `region` VALUES ('2198', '440882', '', '', '雷州市', '2189', '3');
INSERT INTO `region` VALUES ('2199', '440883', '', '', '吴川市', '2189', '3');
INSERT INTO `region` VALUES ('2200', '440900', '', '茂名市', '', '2125', '2');
INSERT INTO `region` VALUES ('2201', '440901', '', '', '市辖区', '2200', '3');
INSERT INTO `region` VALUES ('2202', '440902', '', '', '茂南区', '2200', '3');
INSERT INTO `region` VALUES ('2203', '440904', '', '', '电白区', '2200', '3');
INSERT INTO `region` VALUES ('2204', '440981', '', '', '高州市', '2200', '3');
INSERT INTO `region` VALUES ('2205', '440982', '', '', '化州市', '2200', '3');
INSERT INTO `region` VALUES ('2206', '440983', '', '', '信宜市', '2200', '3');
INSERT INTO `region` VALUES ('2207', '441200', '', '肇庆市', '', '2125', '2');
INSERT INTO `region` VALUES ('2208', '441201', '', '', '市辖区', '2207', '3');
INSERT INTO `region` VALUES ('2209', '441202', '', '', '端州区', '2207', '3');
INSERT INTO `region` VALUES ('2210', '441203', '', '', '鼎湖区', '2207', '3');
INSERT INTO `region` VALUES ('2211', '441223', '', '', '广宁县', '2207', '3');
INSERT INTO `region` VALUES ('2212', '441224', '', '', '怀集县', '2207', '3');
INSERT INTO `region` VALUES ('2213', '441225', '', '', '封开县', '2207', '3');
INSERT INTO `region` VALUES ('2214', '441226', '', '', '德庆县', '2207', '3');
INSERT INTO `region` VALUES ('2215', '441283', '', '', '高要市', '2207', '3');
INSERT INTO `region` VALUES ('2216', '441284', '', '', '四会市', '2207', '3');
INSERT INTO `region` VALUES ('2217', '441300', '', '惠州市', '', '2125', '2');
INSERT INTO `region` VALUES ('2218', '441301', '', '', '市辖区', '2217', '3');
INSERT INTO `region` VALUES ('2219', '441302', '', '', '惠城区', '2217', '3');
INSERT INTO `region` VALUES ('2220', '441303', '', '', '惠阳区', '2217', '3');
INSERT INTO `region` VALUES ('2221', '441322', '', '', '博罗县', '2217', '3');
INSERT INTO `region` VALUES ('2222', '441323', '', '', '惠东县', '2217', '3');
INSERT INTO `region` VALUES ('2223', '441324', '', '', '龙门县', '2217', '3');
INSERT INTO `region` VALUES ('2224', '441400', '', '梅州市', '', '2125', '2');
INSERT INTO `region` VALUES ('2225', '441401', '', '', '市辖区', '2224', '3');
INSERT INTO `region` VALUES ('2226', '441402', '', '', '梅江区', '2224', '3');
INSERT INTO `region` VALUES ('2227', '441403', '', '', '梅县区', '2224', '3');
INSERT INTO `region` VALUES ('2228', '441422', '', '', '大埔县', '2224', '3');
INSERT INTO `region` VALUES ('2229', '441423', '', '', '丰顺县', '2224', '3');
INSERT INTO `region` VALUES ('2230', '441424', '', '', '五华县', '2224', '3');
INSERT INTO `region` VALUES ('2231', '441426', '', '', '平远县', '2224', '3');
INSERT INTO `region` VALUES ('2232', '441427', '', '', '蕉岭县', '2224', '3');
INSERT INTO `region` VALUES ('2233', '441481', '', '', '兴宁市', '2224', '3');
INSERT INTO `region` VALUES ('2234', '441500', '', '汕尾市', '', '2125', '2');
INSERT INTO `region` VALUES ('2235', '441501', '', '', '市辖区', '2234', '3');
INSERT INTO `region` VALUES ('2236', '441502', '', '', '城区', '2234', '3');
INSERT INTO `region` VALUES ('2237', '441521', '', '', '海丰县', '2234', '3');
INSERT INTO `region` VALUES ('2238', '441523', '', '', '陆河县', '2234', '3');
INSERT INTO `region` VALUES ('2239', '441581', '', '', '陆丰市', '2234', '3');
INSERT INTO `region` VALUES ('2240', '441600', '', '河源市', '', '2125', '2');
INSERT INTO `region` VALUES ('2241', '441601', '', '', '市辖区', '2240', '3');
INSERT INTO `region` VALUES ('2242', '441602', '', '', '源城区', '2240', '3');
INSERT INTO `region` VALUES ('2243', '441621', '', '', '紫金县', '2240', '3');
INSERT INTO `region` VALUES ('2244', '441622', '', '', '龙川县', '2240', '3');
INSERT INTO `region` VALUES ('2245', '441623', '', '', '连平县', '2240', '3');
INSERT INTO `region` VALUES ('2246', '441624', '', '', '和平县', '2240', '3');
INSERT INTO `region` VALUES ('2247', '441625', '', '', '东源县', '2240', '3');
INSERT INTO `region` VALUES ('2248', '441700', '', '阳江市', '', '2125', '2');
INSERT INTO `region` VALUES ('2249', '441701', '', '', '市辖区', '2248', '3');
INSERT INTO `region` VALUES ('2250', '441702', '', '', '江城区', '2248', '3');
INSERT INTO `region` VALUES ('2251', '441704', '', '', '阳东区', '2248', '3');
INSERT INTO `region` VALUES ('2252', '441721', '', '', '阳西县', '2248', '3');
INSERT INTO `region` VALUES ('2253', '441781', '', '', '阳春市', '2248', '3');
INSERT INTO `region` VALUES ('2254', '441800', '', '清远市', '', '2125', '2');
INSERT INTO `region` VALUES ('2255', '441801', '', '', '市辖区', '2254', '3');
INSERT INTO `region` VALUES ('2256', '441802', '', '', '清城区', '2254', '3');
INSERT INTO `region` VALUES ('2257', '441803', '', '', '清新区', '2254', '3');
INSERT INTO `region` VALUES ('2258', '441821', '', '', '佛冈县', '2254', '3');
INSERT INTO `region` VALUES ('2259', '441823', '', '', '阳山县', '2254', '3');
INSERT INTO `region` VALUES ('2260', '441825', '', '', '连山壮族瑶族自治县', '2254', '3');
INSERT INTO `region` VALUES ('2261', '441826', '', '', '连南瑶族自治县', '2254', '3');
INSERT INTO `region` VALUES ('2262', '441881', '', '', '英德市', '2254', '3');
INSERT INTO `region` VALUES ('2263', '441882', '', '', '连州市', '2254', '3');
INSERT INTO `region` VALUES ('2264', '441900', '', '东莞市', '', '2125', '2');
INSERT INTO `region` VALUES ('2265', '442000', '', '中山市', '', '2125', '2');
INSERT INTO `region` VALUES ('2266', '445100', '', '潮州市', '', '2125', '2');
INSERT INTO `region` VALUES ('2267', '445101', '', '', '市辖区', '2266', '3');
INSERT INTO `region` VALUES ('2268', '445102', '', '', '湘桥区', '2266', '3');
INSERT INTO `region` VALUES ('2269', '445103', '', '', '潮安区', '2266', '3');
INSERT INTO `region` VALUES ('2270', '445122', '', '', '饶平县', '2266', '3');
INSERT INTO `region` VALUES ('2271', '445200', '', '揭阳市', '', '2125', '2');
INSERT INTO `region` VALUES ('2272', '445201', '', '', '市辖区', '2271', '3');
INSERT INTO `region` VALUES ('2273', '445202', '', '', '榕城区', '2271', '3');
INSERT INTO `region` VALUES ('2274', '445203', '', '', '揭东区', '2271', '3');
INSERT INTO `region` VALUES ('2275', '445222', '', '', '揭西县', '2271', '3');
INSERT INTO `region` VALUES ('2276', '445224', '', '', '惠来县', '2271', '3');
INSERT INTO `region` VALUES ('2277', '445281', '', '', '普宁市', '2271', '3');
INSERT INTO `region` VALUES ('2278', '445300', '', '云浮市', '', '2125', '2');
INSERT INTO `region` VALUES ('2279', '445301', '', '', '市辖区', '2278', '3');
INSERT INTO `region` VALUES ('2280', '445302', '', '', '云城区', '2278', '3');
INSERT INTO `region` VALUES ('2281', '445303', '', '', '云安区', '2278', '3');
INSERT INTO `region` VALUES ('2282', '445321', '', '', '新兴县', '2278', '3');
INSERT INTO `region` VALUES ('2283', '445322', '', '', '郁南县', '2278', '3');
INSERT INTO `region` VALUES ('2284', '445381', '', '', '罗定市', '2278', '3');
INSERT INTO `region` VALUES ('2285', '450000', '广西壮族自治区', '', '', '1', '2');
INSERT INTO `region` VALUES ('2286', '450100', '', '南宁市', '', '2285', '2');
INSERT INTO `region` VALUES ('2287', '450101', '', '', '市辖区', '2286', '3');
INSERT INTO `region` VALUES ('2288', '450102', '', '', '兴宁区', '2286', '3');
INSERT INTO `region` VALUES ('2289', '450103', '', '', '青秀区', '2286', '3');
INSERT INTO `region` VALUES ('2290', '450105', '', '', '江南区', '2286', '3');
INSERT INTO `region` VALUES ('2291', '450107', '', '', '西乡塘区', '2286', '3');
INSERT INTO `region` VALUES ('2292', '450108', '', '', '良庆区', '2286', '3');
INSERT INTO `region` VALUES ('2293', '450109', '', '', '邕宁区', '2286', '3');
INSERT INTO `region` VALUES ('2294', '450122', '', '', '武鸣县', '2286', '3');
INSERT INTO `region` VALUES ('2295', '450123', '', '', '隆安县', '2286', '3');
INSERT INTO `region` VALUES ('2296', '450124', '', '', '马山县', '2286', '3');
INSERT INTO `region` VALUES ('2297', '450125', '', '', '上林县', '2286', '3');
INSERT INTO `region` VALUES ('2298', '450126', '', '', '宾阳县', '2286', '3');
INSERT INTO `region` VALUES ('2299', '450127', '', '', '横县', '2286', '3');
INSERT INTO `region` VALUES ('2300', '450200', '', '柳州市', '', '2285', '2');
INSERT INTO `region` VALUES ('2301', '450201', '', '', '市辖区', '2300', '3');
INSERT INTO `region` VALUES ('2302', '450202', '', '', '城中区', '2300', '3');
INSERT INTO `region` VALUES ('2303', '450203', '', '', '鱼峰区', '2300', '3');
INSERT INTO `region` VALUES ('2304', '450204', '', '', '柳南区', '2300', '3');
INSERT INTO `region` VALUES ('2305', '450205', '', '', '柳北区', '2300', '3');
INSERT INTO `region` VALUES ('2306', '450221', '', '', '柳江县', '2300', '3');
INSERT INTO `region` VALUES ('2307', '450222', '', '', '柳城县', '2300', '3');
INSERT INTO `region` VALUES ('2308', '450223', '', '', '鹿寨县', '2300', '3');
INSERT INTO `region` VALUES ('2309', '450224', '', '', '融安县', '2300', '3');
INSERT INTO `region` VALUES ('2310', '450225', '', '', '融水苗族自治县', '2300', '3');
INSERT INTO `region` VALUES ('2311', '450226', '', '', '三江侗族自治县', '2300', '3');
INSERT INTO `region` VALUES ('2312', '450300', '', '桂林市', '', '2285', '2');
INSERT INTO `region` VALUES ('2313', '450301', '', '', '市辖区', '2312', '3');
INSERT INTO `region` VALUES ('2314', '450302', '', '', '秀峰区', '2312', '3');
INSERT INTO `region` VALUES ('2315', '450303', '', '', '叠彩区', '2312', '3');
INSERT INTO `region` VALUES ('2316', '450304', '', '', '象山区', '2312', '3');
INSERT INTO `region` VALUES ('2317', '450305', '', '', '七星区', '2312', '3');
INSERT INTO `region` VALUES ('2318', '450311', '', '', '雁山区', '2312', '3');
INSERT INTO `region` VALUES ('2319', '450312', '', '', '临桂区', '2312', '3');
INSERT INTO `region` VALUES ('2320', '450321', '', '', '阳朔县', '2312', '3');
INSERT INTO `region` VALUES ('2321', '450323', '', '', '灵川县', '2312', '3');
INSERT INTO `region` VALUES ('2322', '450324', '', '', '全州县', '2312', '3');
INSERT INTO `region` VALUES ('2323', '450325', '', '', '兴安县', '2312', '3');
INSERT INTO `region` VALUES ('2324', '450326', '', '', '永福县', '2312', '3');
INSERT INTO `region` VALUES ('2325', '450327', '', '', '灌阳县', '2312', '3');
INSERT INTO `region` VALUES ('2326', '450328', '', '', '龙胜各族自治县', '2312', '3');
INSERT INTO `region` VALUES ('2327', '450329', '', '', '资源县', '2312', '3');
INSERT INTO `region` VALUES ('2328', '450330', '', '', '平乐县', '2312', '3');
INSERT INTO `region` VALUES ('2329', '450331', '', '', '荔浦县', '2312', '3');
INSERT INTO `region` VALUES ('2330', '450332', '', '', '恭城瑶族自治县', '2312', '3');
INSERT INTO `region` VALUES ('2331', '450400', '', '梧州市', '', '2285', '2');
INSERT INTO `region` VALUES ('2332', '450401', '', '', '市辖区', '2331', '3');
INSERT INTO `region` VALUES ('2333', '450403', '', '', '万秀区', '2331', '3');
INSERT INTO `region` VALUES ('2334', '450405', '', '', '长洲区', '2331', '3');
INSERT INTO `region` VALUES ('2335', '450406', '', '', '龙圩区', '2331', '3');
INSERT INTO `region` VALUES ('2336', '450421', '', '', '苍梧县', '2331', '3');
INSERT INTO `region` VALUES ('2337', '450422', '', '', '藤县', '2331', '3');
INSERT INTO `region` VALUES ('2338', '450423', '', '', '蒙山县', '2331', '3');
INSERT INTO `region` VALUES ('2339', '450481', '', '', '岑溪市', '2331', '3');
INSERT INTO `region` VALUES ('2340', '450500', '', '北海市', '', '2285', '2');
INSERT INTO `region` VALUES ('2341', '450501', '', '', '市辖区', '2340', '3');
INSERT INTO `region` VALUES ('2342', '450502', '', '', '海城区', '2340', '3');
INSERT INTO `region` VALUES ('2343', '450503', '', '', '银海区', '2340', '3');
INSERT INTO `region` VALUES ('2344', '450512', '', '', '铁山港区', '2340', '3');
INSERT INTO `region` VALUES ('2345', '450521', '', '', '合浦县', '2340', '3');
INSERT INTO `region` VALUES ('2346', '450600', '', '防城港市', '', '2285', '2');
INSERT INTO `region` VALUES ('2347', '450601', '', '', '市辖区', '2346', '3');
INSERT INTO `region` VALUES ('2348', '450602', '', '', '港口区', '2346', '3');
INSERT INTO `region` VALUES ('2349', '450603', '', '', '防城区', '2346', '3');
INSERT INTO `region` VALUES ('2350', '450621', '', '', '上思县', '2346', '3');
INSERT INTO `region` VALUES ('2351', '450681', '', '', '东兴市', '2346', '3');
INSERT INTO `region` VALUES ('2352', '450700', '', '钦州市', '', '2285', '2');
INSERT INTO `region` VALUES ('2353', '450701', '', '', '市辖区', '2352', '3');
INSERT INTO `region` VALUES ('2354', '450702', '', '', '钦南区', '2352', '3');
INSERT INTO `region` VALUES ('2355', '450703', '', '', '钦北区', '2352', '3');
INSERT INTO `region` VALUES ('2356', '450721', '', '', '灵山县', '2352', '3');
INSERT INTO `region` VALUES ('2357', '450722', '', '', '浦北县', '2352', '3');
INSERT INTO `region` VALUES ('2358', '450800', '', '贵港市', '', '2285', '2');
INSERT INTO `region` VALUES ('2359', '450801', '', '', '市辖区', '2358', '3');
INSERT INTO `region` VALUES ('2360', '450802', '', '', '港北区', '2358', '3');
INSERT INTO `region` VALUES ('2361', '450803', '', '', '港南区', '2358', '3');
INSERT INTO `region` VALUES ('2362', '450804', '', '', '覃塘区', '2358', '3');
INSERT INTO `region` VALUES ('2363', '450821', '', '', '平南县', '2358', '3');
INSERT INTO `region` VALUES ('2364', '450881', '', '', '桂平市', '2358', '3');
INSERT INTO `region` VALUES ('2365', '450900', '', '玉林市', '', '2285', '2');
INSERT INTO `region` VALUES ('2366', '450901', '', '', '市辖区', '2365', '3');
INSERT INTO `region` VALUES ('2367', '450902', '', '', '玉州区', '2365', '3');
INSERT INTO `region` VALUES ('2368', '450903', '', '', '福绵区', '2365', '3');
INSERT INTO `region` VALUES ('2369', '450921', '', '', '容县', '2365', '3');
INSERT INTO `region` VALUES ('2370', '450922', '', '', '陆川县', '2365', '3');
INSERT INTO `region` VALUES ('2371', '450923', '', '', '博白县', '2365', '3');
INSERT INTO `region` VALUES ('2372', '450924', '', '', '兴业县', '2365', '3');
INSERT INTO `region` VALUES ('2373', '450981', '', '', '北流市', '2365', '3');
INSERT INTO `region` VALUES ('2374', '451000', '', '百色市', '', '2285', '2');
INSERT INTO `region` VALUES ('2375', '451001', '', '', '市辖区', '2374', '3');
INSERT INTO `region` VALUES ('2376', '451002', '', '', '右江区', '2374', '3');
INSERT INTO `region` VALUES ('2377', '451021', '', '', '田阳县', '2374', '3');
INSERT INTO `region` VALUES ('2378', '451022', '', '', '田东县', '2374', '3');
INSERT INTO `region` VALUES ('2379', '451023', '', '', '平果县', '2374', '3');
INSERT INTO `region` VALUES ('2380', '451024', '', '', '德保县', '2374', '3');
INSERT INTO `region` VALUES ('2381', '451025', '', '', '靖西县', '2374', '3');
INSERT INTO `region` VALUES ('2382', '451026', '', '', '那坡县', '2374', '3');
INSERT INTO `region` VALUES ('2383', '451027', '', '', '凌云县', '2374', '3');
INSERT INTO `region` VALUES ('2384', '451028', '', '', '乐业县', '2374', '3');
INSERT INTO `region` VALUES ('2385', '451029', '', '', '田林县', '2374', '3');
INSERT INTO `region` VALUES ('2386', '451030', '', '', '西林县', '2374', '3');
INSERT INTO `region` VALUES ('2387', '451031', '', '', '隆林各族自治县', '2374', '3');
INSERT INTO `region` VALUES ('2388', '451100', '', '贺州市', '', '2285', '2');
INSERT INTO `region` VALUES ('2389', '451101', '', '', '市辖区', '2388', '3');
INSERT INTO `region` VALUES ('2390', '451102', '', '', '八步区', '2388', '3');
INSERT INTO `region` VALUES ('2391', '451119', '', '', '平桂管理区', '2388', '3');
INSERT INTO `region` VALUES ('2392', '451121', '', '', '昭平县', '2388', '3');
INSERT INTO `region` VALUES ('2393', '451122', '', '', '钟山县', '2388', '3');
INSERT INTO `region` VALUES ('2394', '451123', '', '', '富川瑶族自治县', '2388', '3');
INSERT INTO `region` VALUES ('2395', '451200', '', '河池市', '', '2285', '2');
INSERT INTO `region` VALUES ('2396', '451201', '', '', '市辖区', '2395', '3');
INSERT INTO `region` VALUES ('2397', '451202', '', '', '金城江区', '2395', '3');
INSERT INTO `region` VALUES ('2398', '451221', '', '', '南丹县', '2395', '3');
INSERT INTO `region` VALUES ('2399', '451222', '', '', '天峨县', '2395', '3');
INSERT INTO `region` VALUES ('2400', '451223', '', '', '凤山县', '2395', '3');
INSERT INTO `region` VALUES ('2401', '451224', '', '', '东兰县', '2395', '3');
INSERT INTO `region` VALUES ('2402', '451225', '', '', '罗城仫佬族自治县', '2395', '3');
INSERT INTO `region` VALUES ('2403', '451226', '', '', '环江毛南族自治县', '2395', '3');
INSERT INTO `region` VALUES ('2404', '451227', '', '', '巴马瑶族自治县', '2395', '3');
INSERT INTO `region` VALUES ('2405', '451228', '', '', '都安瑶族自治县', '2395', '3');
INSERT INTO `region` VALUES ('2406', '451229', '', '', '大化瑶族自治县', '2395', '3');
INSERT INTO `region` VALUES ('2407', '451281', '', '', '宜州市', '2395', '3');
INSERT INTO `region` VALUES ('2408', '451300', '', '来宾市', '', '2285', '2');
INSERT INTO `region` VALUES ('2409', '451301', '', '', '市辖区', '2408', '3');
INSERT INTO `region` VALUES ('2410', '451302', '', '', '兴宾区', '2408', '3');
INSERT INTO `region` VALUES ('2411', '451321', '', '', '忻城县', '2408', '3');
INSERT INTO `region` VALUES ('2412', '451322', '', '', '象州县', '2408', '3');
INSERT INTO `region` VALUES ('2413', '451323', '', '', '武宣县', '2408', '3');
INSERT INTO `region` VALUES ('2414', '451324', '', '', '金秀瑶族自治县', '2408', '3');
INSERT INTO `region` VALUES ('2415', '451381', '', '', '合山市', '2408', '3');
INSERT INTO `region` VALUES ('2416', '451400', '', '崇左市', '', '2285', '2');
INSERT INTO `region` VALUES ('2417', '451401', '', '', '市辖区', '2416', '3');
INSERT INTO `region` VALUES ('2418', '451402', '', '', '江州区', '2416', '3');
INSERT INTO `region` VALUES ('2419', '451421', '', '', '扶绥县', '2416', '3');
INSERT INTO `region` VALUES ('2420', '451422', '', '', '宁明县', '2416', '3');
INSERT INTO `region` VALUES ('2421', '451423', '', '', '龙州县', '2416', '3');
INSERT INTO `region` VALUES ('2422', '451424', '', '', '大新县', '2416', '3');
INSERT INTO `region` VALUES ('2423', '451425', '', '', '天等县', '2416', '3');
INSERT INTO `region` VALUES ('2424', '451481', '', '', '凭祥市', '2416', '3');
INSERT INTO `region` VALUES ('2425', '460000', '海南省', '', '', '1', '2');
INSERT INTO `region` VALUES ('2426', '460100', '', '海口市', '', '2425', '2');
INSERT INTO `region` VALUES ('2427', '460101', '', '', '市辖区', '2426', '3');
INSERT INTO `region` VALUES ('2428', '460105', '', '', '秀英区', '2426', '3');
INSERT INTO `region` VALUES ('2429', '460106', '', '', '龙华区', '2426', '3');
INSERT INTO `region` VALUES ('2430', '460107', '', '', '琼山区', '2426', '3');
INSERT INTO `region` VALUES ('2431', '460108', '', '', '美兰区', '2426', '3');
INSERT INTO `region` VALUES ('2432', '460200', '', '三亚市', '', '2425', '2');
INSERT INTO `region` VALUES ('2433', '460201', '', '', '市辖区', '2432', '3');
INSERT INTO `region` VALUES ('2434', '460202', '', '', '海棠区', '2432', '3');
INSERT INTO `region` VALUES ('2435', '460203', '', '', '吉阳区', '2432', '3');
INSERT INTO `region` VALUES ('2436', '460204', '', '', '天涯区', '2432', '3');
INSERT INTO `region` VALUES ('2437', '460205', '', '', '崖州区', '2432', '3');
INSERT INTO `region` VALUES ('2438', '460300', '', '三沙市', '', '2425', '2');
INSERT INTO `region` VALUES ('2439', '460321', '', '', '西沙群岛', '2438', '3');
INSERT INTO `region` VALUES ('2440', '460322', '', '', '南沙群岛', '2438', '3');
INSERT INTO `region` VALUES ('2441', '460323', '', '', '中沙群岛的岛礁及其海域', '2438', '3');
INSERT INTO `region` VALUES ('2442', '469000', '', '省直辖县级行政区划', '', '2425', '2');
INSERT INTO `region` VALUES ('2443', '469001', '', '', '五指山市', '2442', '3');
INSERT INTO `region` VALUES ('2444', '469002', '', '', '琼海市', '2442', '3');
INSERT INTO `region` VALUES ('2445', '469003', '', '', '儋州市', '2442', '3');
INSERT INTO `region` VALUES ('2446', '469005', '', '', '文昌市', '2442', '3');
INSERT INTO `region` VALUES ('2447', '469006', '', '', '万宁市', '2442', '3');
INSERT INTO `region` VALUES ('2448', '469007', '', '', '东方市', '2442', '3');
INSERT INTO `region` VALUES ('2449', '469021', '', '', '定安县', '2442', '3');
INSERT INTO `region` VALUES ('2450', '469022', '', '', '屯昌县', '2442', '3');
INSERT INTO `region` VALUES ('2451', '469023', '', '', '澄迈县', '2442', '3');
INSERT INTO `region` VALUES ('2452', '469024', '', '', '临高县', '2442', '3');
INSERT INTO `region` VALUES ('2453', '469025', '', '', '白沙黎族自治县', '2442', '3');
INSERT INTO `region` VALUES ('2454', '469026', '', '', '昌江黎族自治县', '2442', '3');
INSERT INTO `region` VALUES ('2455', '469027', '', '', '乐东黎族自治县', '2442', '3');
INSERT INTO `region` VALUES ('2456', '469028', '', '', '陵水黎族自治县', '2442', '3');
INSERT INTO `region` VALUES ('2457', '469029', '', '', '保亭黎族苗族自治县', '2442', '3');
INSERT INTO `region` VALUES ('2458', '469030', '', '', '琼中黎族苗族自治县', '2442', '3');
INSERT INTO `region` VALUES ('2459', '500000', '重庆市', '重庆市', '', '1', '2');
INSERT INTO `region` VALUES ('2460', '500101', '', '', '万州区', '2459', '3');
INSERT INTO `region` VALUES ('2461', '500102', '', '', '涪陵区', '2459', '3');
INSERT INTO `region` VALUES ('2462', '500103', '', '', '渝中区', '2459', '3');
INSERT INTO `region` VALUES ('2463', '500104', '', '', '大渡口区', '2459', '3');
INSERT INTO `region` VALUES ('2464', '500105', '', '', '江北区', '2459', '3');
INSERT INTO `region` VALUES ('2465', '500106', '', '', '沙坪坝区', '2459', '3');
INSERT INTO `region` VALUES ('2466', '500107', '', '', '九龙坡区', '2459', '3');
INSERT INTO `region` VALUES ('2467', '500108', '', '', '南岸区', '2459', '3');
INSERT INTO `region` VALUES ('2468', '500109', '', '', '北碚区', '2459', '3');
INSERT INTO `region` VALUES ('2469', '500110', '', '', '綦江区', '2459', '3');
INSERT INTO `region` VALUES ('2470', '500111', '', '', '大足区', '2459', '3');
INSERT INTO `region` VALUES ('2471', '500112', '', '', '渝北区', '2459', '3');
INSERT INTO `region` VALUES ('2472', '500113', '', '', '巴南区', '2459', '3');
INSERT INTO `region` VALUES ('2473', '500114', '', '', '黔江区', '2459', '3');
INSERT INTO `region` VALUES ('2474', '500115', '', '', '长寿区', '2459', '3');
INSERT INTO `region` VALUES ('2475', '500116', '', '', '江津区', '2459', '3');
INSERT INTO `region` VALUES ('2476', '500117', '', '', '合川区', '2459', '3');
INSERT INTO `region` VALUES ('2477', '500118', '', '', '永川区', '2459', '3');
INSERT INTO `region` VALUES ('2478', '500119', '', '', '南川区', '2459', '3');
INSERT INTO `region` VALUES ('2479', '500120', '', '', '璧山区', '2459', '3');
INSERT INTO `region` VALUES ('2480', '500151', '', '', '铜梁区', '2459', '3');
INSERT INTO `region` VALUES ('2481', '500223', '', '', '潼南县', '2459', '3');
INSERT INTO `region` VALUES ('2482', '500226', '', '', '荣昌县', '2459', '3');
INSERT INTO `region` VALUES ('2483', '500228', '', '', '梁平县', '2459', '3');
INSERT INTO `region` VALUES ('2484', '500229', '', '', '城口县', '2459', '3');
INSERT INTO `region` VALUES ('2485', '500230', '', '', '丰都县', '2459', '3');
INSERT INTO `region` VALUES ('2486', '500231', '', '', '垫江县', '2459', '3');
INSERT INTO `region` VALUES ('2487', '500232', '', '', '武隆县', '2459', '3');
INSERT INTO `region` VALUES ('2488', '500233', '', '', '忠县', '2459', '3');
INSERT INTO `region` VALUES ('2489', '500234', '', '', '开县', '2459', '3');
INSERT INTO `region` VALUES ('2490', '500235', '', '', '云阳县', '2459', '3');
INSERT INTO `region` VALUES ('2491', '500236', '', '', '奉节县', '2459', '3');
INSERT INTO `region` VALUES ('2492', '500237', '', '', '巫山县', '2459', '3');
INSERT INTO `region` VALUES ('2493', '500238', '', '', '巫溪县', '2459', '3');
INSERT INTO `region` VALUES ('2494', '500240', '', '', '石柱土家族自治县', '2459', '3');
INSERT INTO `region` VALUES ('2495', '500241', '', '', '秀山土家族苗族自治县', '2459', '3');
INSERT INTO `region` VALUES ('2496', '500242', '', '', '酉阳土家族苗族自治县', '2459', '3');
INSERT INTO `region` VALUES ('2497', '500243', '', '', '彭水苗族土家族自治县', '2459', '3');
INSERT INTO `region` VALUES ('2498', '510000', '四川省', '', '', '1', '2');
INSERT INTO `region` VALUES ('2499', '510100', '', '成都市', '', '2498', '2');
INSERT INTO `region` VALUES ('2500', '510101', '', '', '市辖区', '2499', '3');
INSERT INTO `region` VALUES ('2501', '510104', '', '', '锦江区', '2499', '3');
INSERT INTO `region` VALUES ('2502', '510105', '', '', '青羊区', '2499', '3');
INSERT INTO `region` VALUES ('2503', '510106', '', '', '金牛区', '2499', '3');
INSERT INTO `region` VALUES ('2504', '510107', '', '', '武侯区', '2499', '3');
INSERT INTO `region` VALUES ('2505', '510108', '', '', '成华区', '2499', '3');
INSERT INTO `region` VALUES ('2506', '510112', '', '', '龙泉驿区', '2499', '3');
INSERT INTO `region` VALUES ('2507', '510113', '', '', '青白江区', '2499', '3');
INSERT INTO `region` VALUES ('2508', '510114', '', '', '新都区', '2499', '3');
INSERT INTO `region` VALUES ('2509', '510115', '', '', '温江区', '2499', '3');
INSERT INTO `region` VALUES ('2510', '510121', '', '', '金堂县', '2499', '3');
INSERT INTO `region` VALUES ('2511', '510122', '', '', '双流县', '2499', '3');
INSERT INTO `region` VALUES ('2512', '510124', '', '', '郫县', '2499', '3');
INSERT INTO `region` VALUES ('2513', '510129', '', '', '大邑县', '2499', '3');
INSERT INTO `region` VALUES ('2514', '510131', '', '', '蒲江县', '2499', '3');
INSERT INTO `region` VALUES ('2515', '510132', '', '', '新津县', '2499', '3');
INSERT INTO `region` VALUES ('2516', '510181', '', '', '都江堰市', '2499', '3');
INSERT INTO `region` VALUES ('2517', '510182', '', '', '彭州市', '2499', '3');
INSERT INTO `region` VALUES ('2518', '510183', '', '', '邛崃市', '2499', '3');
INSERT INTO `region` VALUES ('2519', '510184', '', '', '崇州市', '2499', '3');
INSERT INTO `region` VALUES ('2520', '510300', '', '自贡市', '', '2498', '2');
INSERT INTO `region` VALUES ('2521', '510301', '', '', '市辖区', '2520', '3');
INSERT INTO `region` VALUES ('2522', '510302', '', '', '自流井区', '2520', '3');
INSERT INTO `region` VALUES ('2523', '510303', '', '', '贡井区', '2520', '3');
INSERT INTO `region` VALUES ('2524', '510304', '', '', '大安区', '2520', '3');
INSERT INTO `region` VALUES ('2525', '510311', '', '', '沿滩区', '2520', '3');
INSERT INTO `region` VALUES ('2526', '510321', '', '', '荣县', '2520', '3');
INSERT INTO `region` VALUES ('2527', '510322', '', '', '富顺县', '2520', '3');
INSERT INTO `region` VALUES ('2528', '510400', '', '攀枝花市', '', '2498', '2');
INSERT INTO `region` VALUES ('2529', '510401', '', '', '市辖区', '2528', '3');
INSERT INTO `region` VALUES ('2530', '510402', '', '', '东区', '2528', '3');
INSERT INTO `region` VALUES ('2531', '510403', '', '', '西区', '2528', '3');
INSERT INTO `region` VALUES ('2532', '510411', '', '', '仁和区', '2528', '3');
INSERT INTO `region` VALUES ('2533', '510421', '', '', '米易县', '2528', '3');
INSERT INTO `region` VALUES ('2534', '510422', '', '', '盐边县', '2528', '3');
INSERT INTO `region` VALUES ('2535', '510500', '', '泸州市', '', '2498', '2');
INSERT INTO `region` VALUES ('2536', '510501', '', '', '市辖区', '2535', '3');
INSERT INTO `region` VALUES ('2537', '510502', '', '', '江阳区', '2535', '3');
INSERT INTO `region` VALUES ('2538', '510503', '', '', '纳溪区', '2535', '3');
INSERT INTO `region` VALUES ('2539', '510504', '', '', '龙马潭区', '2535', '3');
INSERT INTO `region` VALUES ('2540', '510521', '', '', '泸县', '2535', '3');
INSERT INTO `region` VALUES ('2541', '510522', '', '', '合江县', '2535', '3');
INSERT INTO `region` VALUES ('2542', '510524', '', '', '叙永县', '2535', '3');
INSERT INTO `region` VALUES ('2543', '510525', '', '', '古蔺县', '2535', '3');
INSERT INTO `region` VALUES ('2544', '510600', '', '德阳市', '', '2498', '2');
INSERT INTO `region` VALUES ('2545', '510601', '', '', '市辖区', '2544', '3');
INSERT INTO `region` VALUES ('2546', '510603', '', '', '旌阳区', '2544', '3');
INSERT INTO `region` VALUES ('2547', '510623', '', '', '中江县', '2544', '3');
INSERT INTO `region` VALUES ('2548', '510626', '', '', '罗江县', '2544', '3');
INSERT INTO `region` VALUES ('2549', '510681', '', '', '广汉市', '2544', '3');
INSERT INTO `region` VALUES ('2550', '510682', '', '', '什邡市', '2544', '3');
INSERT INTO `region` VALUES ('2551', '510683', '', '', '绵竹市', '2544', '3');
INSERT INTO `region` VALUES ('2552', '510700', '', '绵阳市', '', '2498', '2');
INSERT INTO `region` VALUES ('2553', '510701', '', '', '市辖区', '2552', '3');
INSERT INTO `region` VALUES ('2554', '510703', '', '', '涪城区', '2552', '3');
INSERT INTO `region` VALUES ('2555', '510704', '', '', '游仙区', '2552', '3');
INSERT INTO `region` VALUES ('2556', '510722', '', '', '三台县', '2552', '3');
INSERT INTO `region` VALUES ('2557', '510723', '', '', '盐亭县', '2552', '3');
INSERT INTO `region` VALUES ('2558', '510724', '', '', '安县', '2552', '3');
INSERT INTO `region` VALUES ('2559', '510725', '', '', '梓潼县', '2552', '3');
INSERT INTO `region` VALUES ('2560', '510726', '', '', '北川羌族自治县', '2552', '3');
INSERT INTO `region` VALUES ('2561', '510727', '', '', '平武县', '2552', '3');
INSERT INTO `region` VALUES ('2562', '510781', '', '', '江油市', '2552', '3');
INSERT INTO `region` VALUES ('2563', '510800', '', '广元市', '', '2498', '2');
INSERT INTO `region` VALUES ('2564', '510801', '', '', '市辖区', '2563', '3');
INSERT INTO `region` VALUES ('2565', '510802', '', '', '利州区', '2563', '3');
INSERT INTO `region` VALUES ('2566', '510811', '', '', '昭化区', '2563', '3');
INSERT INTO `region` VALUES ('2567', '510812', '', '', '朝天区', '2563', '3');
INSERT INTO `region` VALUES ('2568', '510821', '', '', '旺苍县', '2563', '3');
INSERT INTO `region` VALUES ('2569', '510822', '', '', '青川县', '2563', '3');
INSERT INTO `region` VALUES ('2570', '510823', '', '', '剑阁县', '2563', '3');
INSERT INTO `region` VALUES ('2571', '510824', '', '', '苍溪县', '2563', '3');
INSERT INTO `region` VALUES ('2572', '510900', '', '遂宁市', '', '2498', '2');
INSERT INTO `region` VALUES ('2573', '510901', '', '', '市辖区', '2572', '3');
INSERT INTO `region` VALUES ('2574', '510903', '', '', '船山区', '2572', '3');
INSERT INTO `region` VALUES ('2575', '510904', '', '', '安居区', '2572', '3');
INSERT INTO `region` VALUES ('2576', '510921', '', '', '蓬溪县', '2572', '3');
INSERT INTO `region` VALUES ('2577', '510922', '', '', '射洪县', '2572', '3');
INSERT INTO `region` VALUES ('2578', '510923', '', '', '大英县', '2572', '3');
INSERT INTO `region` VALUES ('2579', '511000', '', '内江市', '', '2498', '2');
INSERT INTO `region` VALUES ('2580', '511001', '', '', '市辖区', '2579', '3');
INSERT INTO `region` VALUES ('2581', '511002', '', '', '市中区', '2579', '3');
INSERT INTO `region` VALUES ('2582', '511011', '', '', '东兴区', '2579', '3');
INSERT INTO `region` VALUES ('2583', '511024', '', '', '威远县', '2579', '3');
INSERT INTO `region` VALUES ('2584', '511025', '', '', '资中县', '2579', '3');
INSERT INTO `region` VALUES ('2585', '511028', '', '', '隆昌县', '2579', '3');
INSERT INTO `region` VALUES ('2586', '511100', '', '乐山市', '', '2498', '2');
INSERT INTO `region` VALUES ('2587', '511101', '', '', '市辖区', '2586', '3');
INSERT INTO `region` VALUES ('2588', '511102', '', '', '市中区', '2586', '3');
INSERT INTO `region` VALUES ('2589', '511111', '', '', '沙湾区', '2586', '3');
INSERT INTO `region` VALUES ('2590', '511112', '', '', '五通桥区', '2586', '3');
INSERT INTO `region` VALUES ('2591', '511113', '', '', '金口河区', '2586', '3');
INSERT INTO `region` VALUES ('2592', '511123', '', '', '犍为县', '2586', '3');
INSERT INTO `region` VALUES ('2593', '511124', '', '', '井研县', '2586', '3');
INSERT INTO `region` VALUES ('2594', '511126', '', '', '夹江县', '2586', '3');
INSERT INTO `region` VALUES ('2595', '511129', '', '', '沐川县', '2586', '3');
INSERT INTO `region` VALUES ('2596', '511132', '', '', '峨边彝族自治县', '2586', '3');
INSERT INTO `region` VALUES ('2597', '511133', '', '', '马边彝族自治县', '2586', '3');
INSERT INTO `region` VALUES ('2598', '511181', '', '', '峨眉山市', '2586', '3');
INSERT INTO `region` VALUES ('2599', '511300', '', '南充市', '', '2498', '2');
INSERT INTO `region` VALUES ('2600', '511301', '', '', '市辖区', '2599', '3');
INSERT INTO `region` VALUES ('2601', '511302', '', '', '顺庆区', '2599', '3');
INSERT INTO `region` VALUES ('2602', '511303', '', '', '高坪区', '2599', '3');
INSERT INTO `region` VALUES ('2603', '511304', '', '', '嘉陵区', '2599', '3');
INSERT INTO `region` VALUES ('2604', '511321', '', '', '南部县', '2599', '3');
INSERT INTO `region` VALUES ('2605', '511322', '', '', '营山县', '2599', '3');
INSERT INTO `region` VALUES ('2606', '511323', '', '', '蓬安县', '2599', '3');
INSERT INTO `region` VALUES ('2607', '511324', '', '', '仪陇县', '2599', '3');
INSERT INTO `region` VALUES ('2608', '511325', '', '', '西充县', '2599', '3');
INSERT INTO `region` VALUES ('2609', '511381', '', '', '阆中市', '2599', '3');
INSERT INTO `region` VALUES ('2610', '511400', '', '眉山市', '', '2498', '2');
INSERT INTO `region` VALUES ('2611', '511401', '', '', '市辖区', '2610', '3');
INSERT INTO `region` VALUES ('2612', '511402', '', '', '东坡区', '2610', '3');
INSERT INTO `region` VALUES ('2613', '511403', '', '', '彭山区', '2610', '3');
INSERT INTO `region` VALUES ('2614', '511421', '', '', '仁寿县', '2610', '3');
INSERT INTO `region` VALUES ('2615', '511423', '', '', '洪雅县', '2610', '3');
INSERT INTO `region` VALUES ('2616', '511424', '', '', '丹棱县', '2610', '3');
INSERT INTO `region` VALUES ('2617', '511425', '', '', '青神县', '2610', '3');
INSERT INTO `region` VALUES ('2618', '511500', '', '宜宾市', '', '2498', '2');
INSERT INTO `region` VALUES ('2619', '511501', '', '', '市辖区', '2618', '3');
INSERT INTO `region` VALUES ('2620', '511502', '', '', '翠屏区', '2618', '3');
INSERT INTO `region` VALUES ('2621', '511503', '', '', '南溪区', '2618', '3');
INSERT INTO `region` VALUES ('2622', '511521', '', '', '宜宾县', '2618', '3');
INSERT INTO `region` VALUES ('2623', '511523', '', '', '江安县', '2618', '3');
INSERT INTO `region` VALUES ('2624', '511524', '', '', '长宁县', '2618', '3');
INSERT INTO `region` VALUES ('2625', '511525', '', '', '高县', '2618', '3');
INSERT INTO `region` VALUES ('2626', '511526', '', '', '珙县', '2618', '3');
INSERT INTO `region` VALUES ('2627', '511527', '', '', '筠连县', '2618', '3');
INSERT INTO `region` VALUES ('2628', '511528', '', '', '兴文县', '2618', '3');
INSERT INTO `region` VALUES ('2629', '511529', '', '', '屏山县', '2618', '3');
INSERT INTO `region` VALUES ('2630', '511600', '', '广安市', '', '2498', '2');
INSERT INTO `region` VALUES ('2631', '511601', '', '', '市辖区', '2630', '3');
INSERT INTO `region` VALUES ('2632', '511602', '', '', '广安区', '2630', '3');
INSERT INTO `region` VALUES ('2633', '511603', '', '', '前锋区', '2630', '3');
INSERT INTO `region` VALUES ('2634', '511621', '', '', '岳池县', '2630', '3');
INSERT INTO `region` VALUES ('2635', '511622', '', '', '武胜县', '2630', '3');
INSERT INTO `region` VALUES ('2636', '511623', '', '', '邻水县', '2630', '3');
INSERT INTO `region` VALUES ('2637', '511681', '', '', '华蓥市', '2630', '3');
INSERT INTO `region` VALUES ('2638', '511700', '', '达州市', '', '2498', '2');
INSERT INTO `region` VALUES ('2639', '511701', '', '', '市辖区', '2638', '3');
INSERT INTO `region` VALUES ('2640', '511702', '', '', '通川区', '2638', '3');
INSERT INTO `region` VALUES ('2641', '511703', '', '', '达川区', '2638', '3');
INSERT INTO `region` VALUES ('2642', '511722', '', '', '宣汉县', '2638', '3');
INSERT INTO `region` VALUES ('2643', '511723', '', '', '开江县', '2638', '3');
INSERT INTO `region` VALUES ('2644', '511724', '', '', '大竹县', '2638', '3');
INSERT INTO `region` VALUES ('2645', '511725', '', '', '渠县', '2638', '3');
INSERT INTO `region` VALUES ('2646', '511781', '', '', '万源市', '2638', '3');
INSERT INTO `region` VALUES ('2647', '511800', '', '雅安市', '', '2498', '2');
INSERT INTO `region` VALUES ('2648', '511801', '', '', '市辖区', '2647', '3');
INSERT INTO `region` VALUES ('2649', '511802', '', '', '雨城区', '2647', '3');
INSERT INTO `region` VALUES ('2650', '511803', '', '', '名山区', '2647', '3');
INSERT INTO `region` VALUES ('2651', '511822', '', '', '荥经县', '2647', '3');
INSERT INTO `region` VALUES ('2652', '511823', '', '', '汉源县', '2647', '3');
INSERT INTO `region` VALUES ('2653', '511824', '', '', '石棉县', '2647', '3');
INSERT INTO `region` VALUES ('2654', '511825', '', '', '天全县', '2647', '3');
INSERT INTO `region` VALUES ('2655', '511826', '', '', '芦山县', '2647', '3');
INSERT INTO `region` VALUES ('2656', '511827', '', '', '宝兴县', '2647', '3');
INSERT INTO `region` VALUES ('2657', '511900', '', '巴中市', '', '2498', '2');
INSERT INTO `region` VALUES ('2658', '511901', '', '', '市辖区', '2657', '3');
INSERT INTO `region` VALUES ('2659', '511902', '', '', '巴州区', '2657', '3');
INSERT INTO `region` VALUES ('2660', '511903', '', '', '恩阳区', '2657', '3');
INSERT INTO `region` VALUES ('2661', '511921', '', '', '通江县', '2657', '3');
INSERT INTO `region` VALUES ('2662', '511922', '', '', '南江县', '2657', '3');
INSERT INTO `region` VALUES ('2663', '511923', '', '', '平昌县', '2657', '3');
INSERT INTO `region` VALUES ('2664', '512000', '', '资阳市', '', '2498', '2');
INSERT INTO `region` VALUES ('2665', '512001', '', '', '市辖区', '2664', '3');
INSERT INTO `region` VALUES ('2666', '512002', '', '', '雁江区', '2664', '3');
INSERT INTO `region` VALUES ('2667', '512021', '', '', '安岳县', '2664', '3');
INSERT INTO `region` VALUES ('2668', '512022', '', '', '乐至县', '2664', '3');
INSERT INTO `region` VALUES ('2669', '512081', '', '', '简阳市', '2664', '3');
INSERT INTO `region` VALUES ('2670', '513200', '', '阿坝藏族羌族自治州', '', '2498', '2');
INSERT INTO `region` VALUES ('2671', '513221', '', '', '汶川县', '2670', '3');
INSERT INTO `region` VALUES ('2672', '513222', '', '', '理县', '2670', '3');
INSERT INTO `region` VALUES ('2673', '513223', '', '', '茂县', '2670', '3');
INSERT INTO `region` VALUES ('2674', '513224', '', '', '松潘县', '2670', '3');
INSERT INTO `region` VALUES ('2675', '513225', '', '', '九寨沟县', '2670', '3');
INSERT INTO `region` VALUES ('2676', '513226', '', '', '金川县', '2670', '3');
INSERT INTO `region` VALUES ('2677', '513227', '', '', '小金县', '2670', '3');
INSERT INTO `region` VALUES ('2678', '513228', '', '', '黑水县', '2670', '3');
INSERT INTO `region` VALUES ('2679', '513229', '', '', '马尔康县', '2670', '3');
INSERT INTO `region` VALUES ('2680', '513230', '', '', '壤塘县', '2670', '3');
INSERT INTO `region` VALUES ('2681', '513231', '', '', '阿坝县', '2670', '3');
INSERT INTO `region` VALUES ('2682', '513232', '', '', '若尔盖县', '2670', '3');
INSERT INTO `region` VALUES ('2683', '513233', '', '', '红原县', '2670', '3');
INSERT INTO `region` VALUES ('2684', '513300', '', '甘孜藏族自治州', '', '2498', '2');
INSERT INTO `region` VALUES ('2685', '513321', '', '', '康定县', '2684', '3');
INSERT INTO `region` VALUES ('2686', '513322', '', '', '泸定县', '2684', '3');
INSERT INTO `region` VALUES ('2687', '513323', '', '', '丹巴县', '2684', '3');
INSERT INTO `region` VALUES ('2688', '513324', '', '', '九龙县', '2684', '3');
INSERT INTO `region` VALUES ('2689', '513325', '', '', '雅江县', '2684', '3');
INSERT INTO `region` VALUES ('2690', '513326', '', '', '道孚县', '2684', '3');
INSERT INTO `region` VALUES ('2691', '513327', '', '', '炉霍县', '2684', '3');
INSERT INTO `region` VALUES ('2692', '513328', '', '', '甘孜县', '2684', '3');
INSERT INTO `region` VALUES ('2693', '513329', '', '', '新龙县', '2684', '3');
INSERT INTO `region` VALUES ('2694', '513330', '', '', '德格县', '2684', '3');
INSERT INTO `region` VALUES ('2695', '513331', '', '', '白玉县', '2684', '3');
INSERT INTO `region` VALUES ('2696', '513332', '', '', '石渠县', '2684', '3');
INSERT INTO `region` VALUES ('2697', '513333', '', '', '色达县', '2684', '3');
INSERT INTO `region` VALUES ('2698', '513334', '', '', '理塘县', '2684', '3');
INSERT INTO `region` VALUES ('2699', '513335', '', '', '巴塘县', '2684', '3');
INSERT INTO `region` VALUES ('2700', '513336', '', '', '乡城县', '2684', '3');
INSERT INTO `region` VALUES ('2701', '513337', '', '', '稻城县', '2684', '3');
INSERT INTO `region` VALUES ('2702', '513338', '', '', '得荣县', '2684', '3');
INSERT INTO `region` VALUES ('2703', '513400', '', '凉山彝族自治州', '', '2498', '2');
INSERT INTO `region` VALUES ('2704', '513401', '', '', '西昌市', '2703', '3');
INSERT INTO `region` VALUES ('2705', '513422', '', '', '木里藏族自治县', '2703', '3');
INSERT INTO `region` VALUES ('2706', '513423', '', '', '盐源县', '2703', '3');
INSERT INTO `region` VALUES ('2707', '513424', '', '', '德昌县', '2703', '3');
INSERT INTO `region` VALUES ('2708', '513425', '', '', '会理县', '2703', '3');
INSERT INTO `region` VALUES ('2709', '513426', '', '', '会东县', '2703', '3');
INSERT INTO `region` VALUES ('2710', '513427', '', '', '宁南县', '2703', '3');
INSERT INTO `region` VALUES ('2711', '513428', '', '', '普格县', '2703', '3');
INSERT INTO `region` VALUES ('2712', '513429', '', '', '布拖县', '2703', '3');
INSERT INTO `region` VALUES ('2713', '513430', '', '', '金阳县', '2703', '3');
INSERT INTO `region` VALUES ('2714', '513431', '', '', '昭觉县', '2703', '3');
INSERT INTO `region` VALUES ('2715', '513432', '', '', '喜德县', '2703', '3');
INSERT INTO `region` VALUES ('2716', '513433', '', '', '冕宁县', '2703', '3');
INSERT INTO `region` VALUES ('2717', '513434', '', '', '越西县', '2703', '3');
INSERT INTO `region` VALUES ('2718', '513435', '', '', '甘洛县', '2703', '3');
INSERT INTO `region` VALUES ('2719', '513436', '', '', '美姑县', '2703', '3');
INSERT INTO `region` VALUES ('2720', '513437', '', '', '雷波县', '2703', '3');
INSERT INTO `region` VALUES ('2721', '520000', '贵州省', '', '', '1', '2');
INSERT INTO `region` VALUES ('2722', '520100', '', '贵阳市', '', '2721', '2');
INSERT INTO `region` VALUES ('2723', '520101', '', '', '市辖区', '2722', '3');
INSERT INTO `region` VALUES ('2724', '520102', '', '', '南明区', '2722', '3');
INSERT INTO `region` VALUES ('2725', '520103', '', '', '云岩区', '2722', '3');
INSERT INTO `region` VALUES ('2726', '520111', '', '', '花溪区', '2722', '3');
INSERT INTO `region` VALUES ('2727', '520112', '', '', '乌当区', '2722', '3');
INSERT INTO `region` VALUES ('2728', '520113', '', '', '白云区', '2722', '3');
INSERT INTO `region` VALUES ('2729', '520115', '', '', '观山湖区', '2722', '3');
INSERT INTO `region` VALUES ('2730', '520121', '', '', '开阳县', '2722', '3');
INSERT INTO `region` VALUES ('2731', '520122', '', '', '息烽县', '2722', '3');
INSERT INTO `region` VALUES ('2732', '520123', '', '', '修文县', '2722', '3');
INSERT INTO `region` VALUES ('2733', '520181', '', '', '清镇市', '2722', '3');
INSERT INTO `region` VALUES ('2734', '520200', '', '六盘水市', '', '2721', '2');
INSERT INTO `region` VALUES ('2735', '520201', '', '', '钟山区', '2734', '3');
INSERT INTO `region` VALUES ('2736', '520203', '', '', '六枝特区', '2734', '3');
INSERT INTO `region` VALUES ('2737', '520221', '', '', '水城县', '2734', '3');
INSERT INTO `region` VALUES ('2738', '520222', '', '', '盘县', '2734', '3');
INSERT INTO `region` VALUES ('2739', '520300', '', '遵义市', '', '2721', '2');
INSERT INTO `region` VALUES ('2740', '520301', '', '', '市辖区', '2739', '3');
INSERT INTO `region` VALUES ('2741', '520302', '', '', '红花岗区', '2739', '3');
INSERT INTO `region` VALUES ('2742', '520303', '', '', '汇川区', '2739', '3');
INSERT INTO `region` VALUES ('2743', '520321', '', '', '遵义县', '2739', '3');
INSERT INTO `region` VALUES ('2744', '520322', '', '', '桐梓县', '2739', '3');
INSERT INTO `region` VALUES ('2745', '520323', '', '', '绥阳县', '2739', '3');
INSERT INTO `region` VALUES ('2746', '520324', '', '', '正安县', '2739', '3');
INSERT INTO `region` VALUES ('2747', '520325', '', '', '道真仡佬族苗族自治县', '2739', '3');
INSERT INTO `region` VALUES ('2748', '520326', '', '', '务川仡佬族苗族自治县', '2739', '3');
INSERT INTO `region` VALUES ('2749', '520327', '', '', '凤冈县', '2739', '3');
INSERT INTO `region` VALUES ('2750', '520328', '', '', '湄潭县', '2739', '3');
INSERT INTO `region` VALUES ('2751', '520329', '', '', '余庆县', '2739', '3');
INSERT INTO `region` VALUES ('2752', '520330', '', '', '习水县', '2739', '3');
INSERT INTO `region` VALUES ('2753', '520381', '', '', '赤水市', '2739', '3');
INSERT INTO `region` VALUES ('2754', '520382', '', '', '仁怀市', '2739', '3');
INSERT INTO `region` VALUES ('2755', '520400', '', '安顺市', '', '2721', '2');
INSERT INTO `region` VALUES ('2756', '520401', '', '', '市辖区', '2755', '3');
INSERT INTO `region` VALUES ('2757', '520402', '', '', '西秀区', '2755', '3');
INSERT INTO `region` VALUES ('2758', '520403', '', '', '平坝区', '2755', '3');
INSERT INTO `region` VALUES ('2759', '520422', '', '', '普定县', '2755', '3');
INSERT INTO `region` VALUES ('2760', '520423', '', '', '镇宁布依族苗族自治县', '2755', '3');
INSERT INTO `region` VALUES ('2761', '520424', '', '', '关岭布依族苗族自治县', '2755', '3');
INSERT INTO `region` VALUES ('2762', '520425', '', '', '紫云苗族布依族自治县', '2755', '3');
INSERT INTO `region` VALUES ('2763', '520500', '', '毕节市', '', '2721', '2');
INSERT INTO `region` VALUES ('2764', '520501', '', '', '市辖区', '2763', '3');
INSERT INTO `region` VALUES ('2765', '520502', '', '', '七星关区', '2763', '3');
INSERT INTO `region` VALUES ('2766', '520521', '', '', '大方县', '2763', '3');
INSERT INTO `region` VALUES ('2767', '520522', '', '', '黔西县', '2763', '3');
INSERT INTO `region` VALUES ('2768', '520523', '', '', '金沙县', '2763', '3');
INSERT INTO `region` VALUES ('2769', '520524', '', '', '织金县', '2763', '3');
INSERT INTO `region` VALUES ('2770', '520525', '', '', '纳雍县', '2763', '3');
INSERT INTO `region` VALUES ('2771', '520526', '', '', '威宁彝族回族苗族自治县', '2763', '3');
INSERT INTO `region` VALUES ('2772', '520527', '', '', '赫章县', '2763', '3');
INSERT INTO `region` VALUES ('2773', '520600', '', '铜仁市', '', '2721', '2');
INSERT INTO `region` VALUES ('2774', '520601', '', '', '市辖区', '2773', '3');
INSERT INTO `region` VALUES ('2775', '520602', '', '', '碧江区', '2773', '3');
INSERT INTO `region` VALUES ('2776', '520603', '', '', '万山区', '2773', '3');
INSERT INTO `region` VALUES ('2777', '520621', '', '', '江口县', '2773', '3');
INSERT INTO `region` VALUES ('2778', '520622', '', '', '玉屏侗族自治县', '2773', '3');
INSERT INTO `region` VALUES ('2779', '520623', '', '', '石阡县', '2773', '3');
INSERT INTO `region` VALUES ('2780', '520624', '', '', '思南县', '2773', '3');
INSERT INTO `region` VALUES ('2781', '520625', '', '', '印江土家族苗族自治县', '2773', '3');
INSERT INTO `region` VALUES ('2782', '520626', '', '', '德江县', '2773', '3');
INSERT INTO `region` VALUES ('2783', '520627', '', '', '沿河土家族自治县', '2773', '3');
INSERT INTO `region` VALUES ('2784', '520628', '', '', '松桃苗族自治县', '2773', '3');
INSERT INTO `region` VALUES ('2785', '522300', '', '黔西南布依族苗族自治州', '', '2721', '2');
INSERT INTO `region` VALUES ('2786', '522301', '', '', '兴义市', '2785', '3');
INSERT INTO `region` VALUES ('2787', '522322', '', '', '兴仁县', '2785', '3');
INSERT INTO `region` VALUES ('2788', '522323', '', '', '普安县', '2785', '3');
INSERT INTO `region` VALUES ('2789', '522324', '', '', '晴隆县', '2785', '3');
INSERT INTO `region` VALUES ('2790', '522325', '', '', '贞丰县', '2785', '3');
INSERT INTO `region` VALUES ('2791', '522326', '', '', '望谟县', '2785', '3');
INSERT INTO `region` VALUES ('2792', '522327', '', '', '册亨县', '2785', '3');
INSERT INTO `region` VALUES ('2793', '522328', '', '', '安龙县', '2785', '3');
INSERT INTO `region` VALUES ('2794', '522600', '', '黔东南苗族侗族自治州', '', '2721', '2');
INSERT INTO `region` VALUES ('2795', '522601', '', '', '凯里市', '2794', '3');
INSERT INTO `region` VALUES ('2796', '522622', '', '', '黄平县', '2794', '3');
INSERT INTO `region` VALUES ('2797', '522623', '', '', '施秉县', '2794', '3');
INSERT INTO `region` VALUES ('2798', '522624', '', '', '三穗县', '2794', '3');
INSERT INTO `region` VALUES ('2799', '522625', '', '', '镇远县', '2794', '3');
INSERT INTO `region` VALUES ('2800', '522626', '', '', '岑巩县', '2794', '3');
INSERT INTO `region` VALUES ('2801', '522627', '', '', '天柱县', '2794', '3');
INSERT INTO `region` VALUES ('2802', '522628', '', '', '锦屏县', '2794', '3');
INSERT INTO `region` VALUES ('2803', '522629', '', '', '剑河县', '2794', '3');
INSERT INTO `region` VALUES ('2804', '522630', '', '', '台江县', '2794', '3');
INSERT INTO `region` VALUES ('2805', '522631', '', '', '黎平县', '2794', '3');
INSERT INTO `region` VALUES ('2806', '522632', '', '', '榕江县', '2794', '3');
INSERT INTO `region` VALUES ('2807', '522633', '', '', '从江县', '2794', '3');
INSERT INTO `region` VALUES ('2808', '522634', '', '', '雷山县', '2794', '3');
INSERT INTO `region` VALUES ('2809', '522635', '', '', '麻江县', '2794', '3');
INSERT INTO `region` VALUES ('2810', '522636', '', '', '丹寨县', '2794', '3');
INSERT INTO `region` VALUES ('2811', '522700', '', '黔南布依族苗族自治州', '', '2721', '2');
INSERT INTO `region` VALUES ('2812', '522701', '', '', '都匀市', '2811', '3');
INSERT INTO `region` VALUES ('2813', '522702', '', '', '福泉市', '2811', '3');
INSERT INTO `region` VALUES ('2814', '522722', '', '', '荔波县', '2811', '3');
INSERT INTO `region` VALUES ('2815', '522723', '', '', '贵定县', '2811', '3');
INSERT INTO `region` VALUES ('2816', '522725', '', '', '瓮安县', '2811', '3');
INSERT INTO `region` VALUES ('2817', '522726', '', '', '独山县', '2811', '3');
INSERT INTO `region` VALUES ('2818', '522727', '', '', '平塘县', '2811', '3');
INSERT INTO `region` VALUES ('2819', '522728', '', '', '罗甸县', '2811', '3');
INSERT INTO `region` VALUES ('2820', '522729', '', '', '长顺县', '2811', '3');
INSERT INTO `region` VALUES ('2821', '522730', '', '', '龙里县', '2811', '3');
INSERT INTO `region` VALUES ('2822', '522731', '', '', '惠水县', '2811', '3');
INSERT INTO `region` VALUES ('2823', '522732', '', '', '三都水族自治县', '2811', '3');
INSERT INTO `region` VALUES ('2824', '530000', '云南省', '', '', '1', '2');
INSERT INTO `region` VALUES ('2825', '530100', '', '昆明市', '', '2824', '2');
INSERT INTO `region` VALUES ('2826', '530101', '', '', '市辖区', '2825', '3');
INSERT INTO `region` VALUES ('2827', '530102', '', '', '五华区', '2825', '3');
INSERT INTO `region` VALUES ('2828', '530103', '', '', '盘龙区', '2825', '3');
INSERT INTO `region` VALUES ('2829', '530111', '', '', '官渡区', '2825', '3');
INSERT INTO `region` VALUES ('2830', '530112', '', '', '西山区', '2825', '3');
INSERT INTO `region` VALUES ('2831', '530113', '', '', '东川区', '2825', '3');
INSERT INTO `region` VALUES ('2832', '530114', '', '', '呈贡区', '2825', '3');
INSERT INTO `region` VALUES ('2833', '530122', '', '', '晋宁县', '2825', '3');
INSERT INTO `region` VALUES ('2834', '530124', '', '', '富民县', '2825', '3');
INSERT INTO `region` VALUES ('2835', '530125', '', '', '宜良县', '2825', '3');
INSERT INTO `region` VALUES ('2836', '530126', '', '', '石林彝族自治县', '2825', '3');
INSERT INTO `region` VALUES ('2837', '530127', '', '', '嵩明县', '2825', '3');
INSERT INTO `region` VALUES ('2838', '530128', '', '', '禄劝彝族苗族自治县', '2825', '3');
INSERT INTO `region` VALUES ('2839', '530129', '', '', '寻甸回族彝族自治县', '2825', '3');
INSERT INTO `region` VALUES ('2840', '530181', '', '', '安宁市', '2825', '3');
INSERT INTO `region` VALUES ('2841', '530300', '', '曲靖市', '', '2824', '2');
INSERT INTO `region` VALUES ('2842', '530301', '', '', '市辖区', '2841', '3');
INSERT INTO `region` VALUES ('2843', '530302', '', '', '麒麟区', '2841', '3');
INSERT INTO `region` VALUES ('2844', '530321', '', '', '马龙县', '2841', '3');
INSERT INTO `region` VALUES ('2845', '530322', '', '', '陆良县', '2841', '3');
INSERT INTO `region` VALUES ('2846', '530323', '', '', '师宗县', '2841', '3');
INSERT INTO `region` VALUES ('2847', '530324', '', '', '罗平县', '2841', '3');
INSERT INTO `region` VALUES ('2848', '530325', '', '', '富源县', '2841', '3');
INSERT INTO `region` VALUES ('2849', '530326', '', '', '会泽县', '2841', '3');
INSERT INTO `region` VALUES ('2850', '530328', '', '', '沾益县', '2841', '3');
INSERT INTO `region` VALUES ('2851', '530381', '', '', '宣威市', '2841', '3');
INSERT INTO `region` VALUES ('2852', '530400', '', '玉溪市', '', '2824', '2');
INSERT INTO `region` VALUES ('2853', '530401', '', '', '市辖区', '2852', '3');
INSERT INTO `region` VALUES ('2854', '530402', '', '', '红塔区', '2852', '3');
INSERT INTO `region` VALUES ('2855', '530421', '', '', '江川县', '2852', '3');
INSERT INTO `region` VALUES ('2856', '530422', '', '', '澄江县', '2852', '3');
INSERT INTO `region` VALUES ('2857', '530423', '', '', '通海县', '2852', '3');
INSERT INTO `region` VALUES ('2858', '530424', '', '', '华宁县', '2852', '3');
INSERT INTO `region` VALUES ('2859', '530425', '', '', '易门县', '2852', '3');
INSERT INTO `region` VALUES ('2860', '530426', '', '', '峨山彝族自治县', '2852', '3');
INSERT INTO `region` VALUES ('2861', '530427', '', '', '新平彝族傣族自治县', '2852', '3');
INSERT INTO `region` VALUES ('2862', '530428', '', '', '元江哈尼族彝族傣族自治县', '2852', '3');
INSERT INTO `region` VALUES ('2863', '530500', '', '保山市', '', '2824', '2');
INSERT INTO `region` VALUES ('2864', '530501', '', '', '市辖区', '2863', '3');
INSERT INTO `region` VALUES ('2865', '530502', '', '', '隆阳区', '2863', '3');
INSERT INTO `region` VALUES ('2866', '530521', '', '', '施甸县', '2863', '3');
INSERT INTO `region` VALUES ('2867', '530522', '', '', '腾冲县', '2863', '3');
INSERT INTO `region` VALUES ('2868', '530523', '', '', '龙陵县', '2863', '3');
INSERT INTO `region` VALUES ('2869', '530524', '', '', '昌宁县', '2863', '3');
INSERT INTO `region` VALUES ('2870', '530600', '', '昭通市', '', '2824', '2');
INSERT INTO `region` VALUES ('2871', '530601', '', '', '市辖区', '2870', '3');
INSERT INTO `region` VALUES ('2872', '530602', '', '', '昭阳区', '2870', '3');
INSERT INTO `region` VALUES ('2873', '530621', '', '', '鲁甸县', '2870', '3');
INSERT INTO `region` VALUES ('2874', '530622', '', '', '巧家县', '2870', '3');
INSERT INTO `region` VALUES ('2875', '530623', '', '', '盐津县', '2870', '3');
INSERT INTO `region` VALUES ('2876', '530624', '', '', '大关县', '2870', '3');
INSERT INTO `region` VALUES ('2877', '530625', '', '', '永善县', '2870', '3');
INSERT INTO `region` VALUES ('2878', '530626', '', '', '绥江县', '2870', '3');
INSERT INTO `region` VALUES ('2879', '530627', '', '', '镇雄县', '2870', '3');
INSERT INTO `region` VALUES ('2880', '530628', '', '', '彝良县', '2870', '3');
INSERT INTO `region` VALUES ('2881', '530629', '', '', '威信县', '2870', '3');
INSERT INTO `region` VALUES ('2882', '530630', '', '', '水富县', '2870', '3');
INSERT INTO `region` VALUES ('2883', '530700', '', '丽江市', '', '2824', '2');
INSERT INTO `region` VALUES ('2884', '530701', '', '', '市辖区', '2883', '3');
INSERT INTO `region` VALUES ('2885', '530702', '', '', '古城区', '2883', '3');
INSERT INTO `region` VALUES ('2886', '530721', '', '', '玉龙纳西族自治县', '2883', '3');
INSERT INTO `region` VALUES ('2887', '530722', '', '', '永胜县', '2883', '3');
INSERT INTO `region` VALUES ('2888', '530723', '', '', '华坪县', '2883', '3');
INSERT INTO `region` VALUES ('2889', '530724', '', '', '宁蒗彝族自治县', '2883', '3');
INSERT INTO `region` VALUES ('2890', '530800', '', '普洱市', '', '2824', '2');
INSERT INTO `region` VALUES ('2891', '530801', '', '', '市辖区', '2890', '3');
INSERT INTO `region` VALUES ('2892', '530802', '', '', '思茅区', '2890', '3');
INSERT INTO `region` VALUES ('2893', '530821', '', '', '宁洱哈尼族彝族自治县', '2890', '3');
INSERT INTO `region` VALUES ('2894', '530822', '', '', '墨江哈尼族自治县', '2890', '3');
INSERT INTO `region` VALUES ('2895', '530823', '', '', '景东彝族自治县', '2890', '3');
INSERT INTO `region` VALUES ('2896', '530824', '', '', '景谷傣族彝族自治县', '2890', '3');
INSERT INTO `region` VALUES ('2897', '530825', '', '', '镇沅彝族哈尼族拉祜族自治县', '2890', '3');
INSERT INTO `region` VALUES ('2898', '530826', '', '', '江城哈尼族彝族自治县', '2890', '3');
INSERT INTO `region` VALUES ('2899', '530827', '', '', '孟连傣族拉祜族佤族自治县', '2890', '3');
INSERT INTO `region` VALUES ('2900', '530828', '', '', '澜沧拉祜族自治县', '2890', '3');
INSERT INTO `region` VALUES ('2901', '530829', '', '', '西盟佤族自治县', '2890', '3');
INSERT INTO `region` VALUES ('2902', '530900', '', '临沧市', '', '2824', '2');
INSERT INTO `region` VALUES ('2903', '530901', '', '', '市辖区', '2902', '3');
INSERT INTO `region` VALUES ('2904', '530902', '', '', '临翔区', '2902', '3');
INSERT INTO `region` VALUES ('2905', '530921', '', '', '凤庆县', '2902', '3');
INSERT INTO `region` VALUES ('2906', '530922', '', '', '云县', '2902', '3');
INSERT INTO `region` VALUES ('2907', '530923', '', '', '永德县', '2902', '3');
INSERT INTO `region` VALUES ('2908', '530924', '', '', '镇康县', '2902', '3');
INSERT INTO `region` VALUES ('2909', '530925', '', '', '双江拉祜族佤族布朗族傣族自治县', '2902', '3');
INSERT INTO `region` VALUES ('2910', '530926', '', '', '耿马傣族佤族自治县', '2902', '3');
INSERT INTO `region` VALUES ('2911', '530927', '', '', '沧源佤族自治县', '2902', '3');
INSERT INTO `region` VALUES ('2912', '532300', '', '楚雄彝族自治州', '', '2824', '2');
INSERT INTO `region` VALUES ('2913', '532301', '', '', '楚雄市', '2912', '3');
INSERT INTO `region` VALUES ('2914', '532322', '', '', '双柏县', '2912', '3');
INSERT INTO `region` VALUES ('2915', '532323', '', '', '牟定县', '2912', '3');
INSERT INTO `region` VALUES ('2916', '532324', '', '', '南华县', '2912', '3');
INSERT INTO `region` VALUES ('2917', '532325', '', '', '姚安县', '2912', '3');
INSERT INTO `region` VALUES ('2918', '532326', '', '', '大姚县', '2912', '3');
INSERT INTO `region` VALUES ('2919', '532327', '', '', '永仁县', '2912', '3');
INSERT INTO `region` VALUES ('2920', '532328', '', '', '元谋县', '2912', '3');
INSERT INTO `region` VALUES ('2921', '532329', '', '', '武定县', '2912', '3');
INSERT INTO `region` VALUES ('2922', '532331', '', '', '禄丰县', '2912', '3');
INSERT INTO `region` VALUES ('2923', '532500', '', '红河哈尼族彝族自治州', '', '2824', '2');
INSERT INTO `region` VALUES ('2924', '532501', '', '', '个旧市', '2923', '3');
INSERT INTO `region` VALUES ('2925', '532502', '', '', '开远市', '2923', '3');
INSERT INTO `region` VALUES ('2926', '532503', '', '', '蒙自市', '2923', '3');
INSERT INTO `region` VALUES ('2927', '532504', '', '', '弥勒市', '2923', '3');
INSERT INTO `region` VALUES ('2928', '532523', '', '', '屏边苗族自治县', '2923', '3');
INSERT INTO `region` VALUES ('2929', '532524', '', '', '建水县', '2923', '3');
INSERT INTO `region` VALUES ('2930', '532525', '', '', '石屏县', '2923', '3');
INSERT INTO `region` VALUES ('2931', '532527', '', '', '泸西县', '2923', '3');
INSERT INTO `region` VALUES ('2932', '532528', '', '', '元阳县', '2923', '3');
INSERT INTO `region` VALUES ('2933', '532529', '', '', '红河县', '2923', '3');
INSERT INTO `region` VALUES ('2934', '532530', '', '', '金平苗族瑶族傣族自治县', '2923', '3');
INSERT INTO `region` VALUES ('2935', '532531', '', '', '绿春县', '2923', '3');
INSERT INTO `region` VALUES ('2936', '532532', '', '', '河口瑶族自治县', '2923', '3');
INSERT INTO `region` VALUES ('2937', '532600', '', '文山壮族苗族自治州', '', '2824', '2');
INSERT INTO `region` VALUES ('2938', '532601', '', '', '文山市', '2937', '3');
INSERT INTO `region` VALUES ('2939', '532622', '', '', '砚山县', '2937', '3');
INSERT INTO `region` VALUES ('2940', '532623', '', '', '西畴县', '2937', '3');
INSERT INTO `region` VALUES ('2941', '532624', '', '', '麻栗坡县', '2937', '3');
INSERT INTO `region` VALUES ('2942', '532625', '', '', '马关县', '2937', '3');
INSERT INTO `region` VALUES ('2943', '532626', '', '', '丘北县', '2937', '3');
INSERT INTO `region` VALUES ('2944', '532627', '', '', '广南县', '2937', '3');
INSERT INTO `region` VALUES ('2945', '532628', '', '', '富宁县', '2937', '3');
INSERT INTO `region` VALUES ('2946', '532800', '', '西双版纳傣族自治州', '', '2824', '2');
INSERT INTO `region` VALUES ('2947', '532801', '', '', '景洪市', '2946', '3');
INSERT INTO `region` VALUES ('2948', '532822', '', '', '勐海县', '2946', '3');
INSERT INTO `region` VALUES ('2949', '532823', '', '', '勐腊县', '2946', '3');
INSERT INTO `region` VALUES ('2950', '532900', '', '大理白族自治州', '', '2824', '2');
INSERT INTO `region` VALUES ('2951', '532901', '', '', '大理市', '2950', '3');
INSERT INTO `region` VALUES ('2952', '532922', '', '', '漾濞彝族自治县', '2950', '3');
INSERT INTO `region` VALUES ('2953', '532923', '', '', '祥云县', '2950', '3');
INSERT INTO `region` VALUES ('2954', '532924', '', '', '宾川县', '2950', '3');
INSERT INTO `region` VALUES ('2955', '532925', '', '', '弥渡县', '2950', '3');
INSERT INTO `region` VALUES ('2956', '532926', '', '', '南涧彝族自治县', '2950', '3');
INSERT INTO `region` VALUES ('2957', '532927', '', '', '巍山彝族回族自治县', '2950', '3');
INSERT INTO `region` VALUES ('2958', '532928', '', '', '永平县', '2950', '3');
INSERT INTO `region` VALUES ('2959', '532929', '', '', '云龙县', '2950', '3');
INSERT INTO `region` VALUES ('2960', '532930', '', '', '洱源县', '2950', '3');
INSERT INTO `region` VALUES ('2961', '532931', '', '', '剑川县', '2950', '3');
INSERT INTO `region` VALUES ('2962', '532932', '', '', '鹤庆县', '2950', '3');
INSERT INTO `region` VALUES ('2963', '533100', '', '德宏傣族景颇族自治州', '', '2824', '2');
INSERT INTO `region` VALUES ('2964', '533102', '', '', '瑞丽市', '2963', '3');
INSERT INTO `region` VALUES ('2965', '533103', '', '', '芒市', '2963', '3');
INSERT INTO `region` VALUES ('2966', '533122', '', '', '梁河县', '2963', '3');
INSERT INTO `region` VALUES ('2967', '533123', '', '', '盈江县', '2963', '3');
INSERT INTO `region` VALUES ('2968', '533124', '', '', '陇川县', '2963', '3');
INSERT INTO `region` VALUES ('2969', '533300', '', '怒江傈僳族自治州', '', '2824', '2');
INSERT INTO `region` VALUES ('2970', '533321', '', '', '泸水县', '2969', '3');
INSERT INTO `region` VALUES ('2971', '533323', '', '', '福贡县', '2969', '3');
INSERT INTO `region` VALUES ('2972', '533324', '', '', '贡山独龙族怒族自治县', '2969', '3');
INSERT INTO `region` VALUES ('2973', '533325', '', '', '兰坪白族普米族自治县', '2969', '3');
INSERT INTO `region` VALUES ('2974', '533400', '', '迪庆藏族自治州', '', '2824', '2');
INSERT INTO `region` VALUES ('2975', '533401', '', '', '香格里拉市', '2974', '3');
INSERT INTO `region` VALUES ('2976', '533422', '', '', '德钦县', '2974', '3');
INSERT INTO `region` VALUES ('2977', '533423', '', '', '维西傈僳族自治县', '2974', '3');
INSERT INTO `region` VALUES ('2978', '540000', '西藏自治区', '', '', '1', '2');
INSERT INTO `region` VALUES ('2979', '540100', '', '拉萨市', '', '2978', '2');
INSERT INTO `region` VALUES ('2980', '540101', '', '', '市辖区', '2979', '3');
INSERT INTO `region` VALUES ('2981', '540102', '', '', '城关区', '2979', '3');
INSERT INTO `region` VALUES ('2982', '540121', '', '', '林周县', '2979', '3');
INSERT INTO `region` VALUES ('2983', '540122', '', '', '当雄县', '2979', '3');
INSERT INTO `region` VALUES ('2984', '540123', '', '', '尼木县', '2979', '3');
INSERT INTO `region` VALUES ('2985', '540124', '', '', '曲水县', '2979', '3');
INSERT INTO `region` VALUES ('2986', '540125', '', '', '堆龙德庆县', '2979', '3');
INSERT INTO `region` VALUES ('2987', '540126', '', '', '达孜县', '2979', '3');
INSERT INTO `region` VALUES ('2988', '540127', '', '', '墨竹工卡县', '2979', '3');
INSERT INTO `region` VALUES ('2989', '540200', '', '日喀则市', '', '2978', '2');
INSERT INTO `region` VALUES ('2990', '540201', '', '', '市辖区', '2989', '3');
INSERT INTO `region` VALUES ('2991', '540202', '', '', '桑珠孜区', '2989', '3');
INSERT INTO `region` VALUES ('2992', '540221', '', '', '南木林县', '2989', '3');
INSERT INTO `region` VALUES ('2993', '540222', '', '', '江孜县', '2989', '3');
INSERT INTO `region` VALUES ('2994', '540223', '', '', '定日县', '2989', '3');
INSERT INTO `region` VALUES ('2995', '540224', '', '', '萨迦县', '2989', '3');
INSERT INTO `region` VALUES ('2996', '540225', '', '', '拉孜县', '2989', '3');
INSERT INTO `region` VALUES ('2997', '540226', '', '', '昂仁县', '2989', '3');
INSERT INTO `region` VALUES ('2998', '540227', '', '', '谢通门县', '2989', '3');
INSERT INTO `region` VALUES ('2999', '540228', '', '', '白朗县', '2989', '3');
INSERT INTO `region` VALUES ('3000', '540229', '', '', '仁布县', '2989', '3');
INSERT INTO `region` VALUES ('3001', '540230', '', '', '康马县', '2989', '3');
INSERT INTO `region` VALUES ('3002', '540231', '', '', '定结县', '2989', '3');
INSERT INTO `region` VALUES ('3003', '540232', '', '', '仲巴县', '2989', '3');
INSERT INTO `region` VALUES ('3004', '540233', '', '', '亚东县', '2989', '3');
INSERT INTO `region` VALUES ('3005', '540234', '', '', '吉隆县', '2989', '3');
INSERT INTO `region` VALUES ('3006', '540235', '', '', '聂拉木县', '2989', '3');
INSERT INTO `region` VALUES ('3007', '540236', '', '', '萨嘎县', '2989', '3');
INSERT INTO `region` VALUES ('3008', '540237', '', '', '岗巴县', '2989', '3');
INSERT INTO `region` VALUES ('3009', '540300', '', '昌都市', '', '2978', '2');
INSERT INTO `region` VALUES ('3010', '540301', '', '', '市辖区', '3009', '3');
INSERT INTO `region` VALUES ('3011', '540302', '', '', '卡若区', '3009', '3');
INSERT INTO `region` VALUES ('3012', '540321', '', '', '江达县', '3009', '3');
INSERT INTO `region` VALUES ('3013', '540322', '', '', '贡觉县', '3009', '3');
INSERT INTO `region` VALUES ('3014', '540323', '', '', '类乌齐县', '3009', '3');
INSERT INTO `region` VALUES ('3015', '540324', '', '', '丁青县', '3009', '3');
INSERT INTO `region` VALUES ('3016', '540325', '', '', '察雅县', '3009', '3');
INSERT INTO `region` VALUES ('3017', '540326', '', '', '八宿县', '3009', '3');
INSERT INTO `region` VALUES ('3018', '540327', '', '', '左贡县', '3009', '3');
INSERT INTO `region` VALUES ('3019', '540328', '', '', '芒康县', '3009', '3');
INSERT INTO `region` VALUES ('3020', '540329', '', '', '洛隆县', '3009', '3');
INSERT INTO `region` VALUES ('3021', '540330', '', '', '边坝县', '3009', '3');
INSERT INTO `region` VALUES ('3022', '542200', '', '山南地区', '', '2978', '2');
INSERT INTO `region` VALUES ('3023', '542221', '', '', '乃东县', '3022', '3');
INSERT INTO `region` VALUES ('3024', '542222', '', '', '扎囊县', '3022', '3');
INSERT INTO `region` VALUES ('3025', '542223', '', '', '贡嘎县', '3022', '3');
INSERT INTO `region` VALUES ('3026', '542224', '', '', '桑日县', '3022', '3');
INSERT INTO `region` VALUES ('3027', '542225', '', '', '琼结县', '3022', '3');
INSERT INTO `region` VALUES ('3028', '542226', '', '', '曲松县', '3022', '3');
INSERT INTO `region` VALUES ('3029', '542227', '', '', '措美县', '3022', '3');
INSERT INTO `region` VALUES ('3030', '542228', '', '', '洛扎县', '3022', '3');
INSERT INTO `region` VALUES ('3031', '542229', '', '', '加查县', '3022', '3');
INSERT INTO `region` VALUES ('3032', '542231', '', '', '隆子县', '3022', '3');
INSERT INTO `region` VALUES ('3033', '542232', '', '', '错那县', '3022', '3');
INSERT INTO `region` VALUES ('3034', '542233', '', '', '浪卡子县', '3022', '3');
INSERT INTO `region` VALUES ('3035', '542400', '', '那曲地区', '', '2978', '2');
INSERT INTO `region` VALUES ('3036', '542421', '', '', '那曲县', '3035', '3');
INSERT INTO `region` VALUES ('3037', '542422', '', '', '嘉黎县', '3035', '3');
INSERT INTO `region` VALUES ('3038', '542423', '', '', '比如县', '3035', '3');
INSERT INTO `region` VALUES ('3039', '542424', '', '', '聂荣县', '3035', '3');
INSERT INTO `region` VALUES ('3040', '542425', '', '', '安多县', '3035', '3');
INSERT INTO `region` VALUES ('3041', '542426', '', '', '申扎县', '3035', '3');
INSERT INTO `region` VALUES ('3042', '542427', '', '', '索县', '3035', '3');
INSERT INTO `region` VALUES ('3043', '542428', '', '', '班戈县', '3035', '3');
INSERT INTO `region` VALUES ('3044', '542429', '', '', '巴青县', '3035', '3');
INSERT INTO `region` VALUES ('3045', '542430', '', '', '尼玛县', '3035', '3');
INSERT INTO `region` VALUES ('3046', '542431', '', '', '双湖县', '3035', '3');
INSERT INTO `region` VALUES ('3047', '542500', '', '阿里地区', '', '2978', '2');
INSERT INTO `region` VALUES ('3048', '542521', '', '', '普兰县', '3047', '3');
INSERT INTO `region` VALUES ('3049', '542522', '', '', '札达县', '3047', '3');
INSERT INTO `region` VALUES ('3050', '542523', '', '', '噶尔县', '3047', '3');
INSERT INTO `region` VALUES ('3051', '542524', '', '', '日土县', '3047', '3');
INSERT INTO `region` VALUES ('3052', '542525', '', '', '革吉县', '3047', '3');
INSERT INTO `region` VALUES ('3053', '542526', '', '', '改则县', '3047', '3');
INSERT INTO `region` VALUES ('3054', '542527', '', '', '措勤县', '3047', '3');
INSERT INTO `region` VALUES ('3055', '542600', '', '林芝地区', '', '2978', '2');
INSERT INTO `region` VALUES ('3056', '542621', '', '', '林芝县', '3055', '3');
INSERT INTO `region` VALUES ('3057', '542622', '', '', '工布江达县', '3055', '3');
INSERT INTO `region` VALUES ('3058', '542623', '', '', '米林县', '3055', '3');
INSERT INTO `region` VALUES ('3059', '542624', '', '', '墨脱县', '3055', '3');
INSERT INTO `region` VALUES ('3060', '542625', '', '', '波密县', '3055', '3');
INSERT INTO `region` VALUES ('3061', '542626', '', '', '察隅县', '3055', '3');
INSERT INTO `region` VALUES ('3062', '542627', '', '', '朗县', '3055', '3');
INSERT INTO `region` VALUES ('3063', '610000', '陕西省', '', '', '1', '2');
INSERT INTO `region` VALUES ('3064', '610100', '', '西安市', '', '3063', '2');
INSERT INTO `region` VALUES ('3065', '610101', '', '', '市辖区', '3064', '3');
INSERT INTO `region` VALUES ('3066', '610102', '', '', '新城区', '3064', '3');
INSERT INTO `region` VALUES ('3067', '610103', '', '', '碑林区', '3064', '3');
INSERT INTO `region` VALUES ('3068', '610104', '', '', '莲湖区', '3064', '3');
INSERT INTO `region` VALUES ('3069', '610111', '', '', '灞桥区', '3064', '3');
INSERT INTO `region` VALUES ('3070', '610112', '', '', '未央区', '3064', '3');
INSERT INTO `region` VALUES ('3071', '610113', '', '', '雁塔区', '3064', '3');
INSERT INTO `region` VALUES ('3072', '610114', '', '', '阎良区', '3064', '3');
INSERT INTO `region` VALUES ('3073', '610115', '', '', '临潼区', '3064', '3');
INSERT INTO `region` VALUES ('3074', '610116', '', '', '长安区', '3064', '3');
INSERT INTO `region` VALUES ('3075', '610117', '', '', '高陵区', '3064', '3');
INSERT INTO `region` VALUES ('3076', '610122', '', '', '蓝田县', '3064', '3');
INSERT INTO `region` VALUES ('3077', '610124', '', '', '周至县', '3064', '3');
INSERT INTO `region` VALUES ('3078', '610125', '', '', '户县', '3064', '3');
INSERT INTO `region` VALUES ('3079', '610200', '', '铜川市', '', '3063', '2');
INSERT INTO `region` VALUES ('3080', '610201', '', '', '市辖区', '3079', '3');
INSERT INTO `region` VALUES ('3081', '610202', '', '', '王益区', '3079', '3');
INSERT INTO `region` VALUES ('3082', '610203', '', '', '印台区', '3079', '3');
INSERT INTO `region` VALUES ('3083', '610204', '', '', '耀州区', '3079', '3');
INSERT INTO `region` VALUES ('3084', '610222', '', '', '宜君县', '3079', '3');
INSERT INTO `region` VALUES ('3085', '610300', '', '宝鸡市', '', '3063', '2');
INSERT INTO `region` VALUES ('3086', '610301', '', '', '市辖区', '3085', '3');
INSERT INTO `region` VALUES ('3087', '610302', '', '', '渭滨区', '3085', '3');
INSERT INTO `region` VALUES ('3088', '610303', '', '', '金台区', '3085', '3');
INSERT INTO `region` VALUES ('3089', '610304', '', '', '陈仓区', '3085', '3');
INSERT INTO `region` VALUES ('3090', '610322', '', '', '凤翔县', '3085', '3');
INSERT INTO `region` VALUES ('3091', '610323', '', '', '岐山县', '3085', '3');
INSERT INTO `region` VALUES ('3092', '610324', '', '', '扶风县', '3085', '3');
INSERT INTO `region` VALUES ('3093', '610326', '', '', '眉县', '3085', '3');
INSERT INTO `region` VALUES ('3094', '610327', '', '', '陇县', '3085', '3');
INSERT INTO `region` VALUES ('3095', '610328', '', '', '千阳县', '3085', '3');
INSERT INTO `region` VALUES ('3096', '610329', '', '', '麟游县', '3085', '3');
INSERT INTO `region` VALUES ('3097', '610330', '', '', '凤县', '3085', '3');
INSERT INTO `region` VALUES ('3098', '610331', '', '', '太白县', '3085', '3');
INSERT INTO `region` VALUES ('3099', '610400', '', '咸阳市', '', '3063', '2');
INSERT INTO `region` VALUES ('3100', '610401', '', '', '市辖区', '3099', '3');
INSERT INTO `region` VALUES ('3101', '610402', '', '', '秦都区', '3099', '3');
INSERT INTO `region` VALUES ('3102', '610403', '', '', '杨陵区', '3099', '3');
INSERT INTO `region` VALUES ('3103', '610404', '', '', '渭城区', '3099', '3');
INSERT INTO `region` VALUES ('3104', '610422', '', '', '三原县', '3099', '3');
INSERT INTO `region` VALUES ('3105', '610423', '', '', '泾阳县', '3099', '3');
INSERT INTO `region` VALUES ('3106', '610424', '', '', '乾县', '3099', '3');
INSERT INTO `region` VALUES ('3107', '610425', '', '', '礼泉县', '3099', '3');
INSERT INTO `region` VALUES ('3108', '610426', '', '', '永寿县', '3099', '3');
INSERT INTO `region` VALUES ('3109', '610427', '', '', '彬县', '3099', '3');
INSERT INTO `region` VALUES ('3110', '610428', '', '', '长武县', '3099', '3');
INSERT INTO `region` VALUES ('3111', '610429', '', '', '旬邑县', '3099', '3');
INSERT INTO `region` VALUES ('3112', '610430', '', '', '淳化县', '3099', '3');
INSERT INTO `region` VALUES ('3113', '610431', '', '', '武功县', '3099', '3');
INSERT INTO `region` VALUES ('3114', '610481', '', '', '兴平市', '3099', '3');
INSERT INTO `region` VALUES ('3115', '610500', '', '渭南市', '', '3063', '2');
INSERT INTO `region` VALUES ('3116', '610501', '', '', '市辖区', '3115', '3');
INSERT INTO `region` VALUES ('3117', '610502', '', '', '临渭区', '3115', '3');
INSERT INTO `region` VALUES ('3118', '610521', '', '', '华县', '3115', '3');
INSERT INTO `region` VALUES ('3119', '610522', '', '', '潼关县', '3115', '3');
INSERT INTO `region` VALUES ('3120', '610523', '', '', '大荔县', '3115', '3');
INSERT INTO `region` VALUES ('3121', '610524', '', '', '合阳县', '3115', '3');
INSERT INTO `region` VALUES ('3122', '610525', '', '', '澄城县', '3115', '3');
INSERT INTO `region` VALUES ('3123', '610526', '', '', '蒲城县', '3115', '3');
INSERT INTO `region` VALUES ('3124', '610527', '', '', '白水县', '3115', '3');
INSERT INTO `region` VALUES ('3125', '610528', '', '', '富平县', '3115', '3');
INSERT INTO `region` VALUES ('3126', '610581', '', '', '韩城市', '3115', '3');
INSERT INTO `region` VALUES ('3127', '610582', '', '', '华阴市', '3115', '3');
INSERT INTO `region` VALUES ('3128', '610600', '', '延安市', '', '3063', '2');
INSERT INTO `region` VALUES ('3129', '610601', '', '', '市辖区', '3128', '3');
INSERT INTO `region` VALUES ('3130', '610602', '', '', '宝塔区', '3128', '3');
INSERT INTO `region` VALUES ('3131', '610621', '', '', '延长县', '3128', '3');
INSERT INTO `region` VALUES ('3132', '610622', '', '', '延川县', '3128', '3');
INSERT INTO `region` VALUES ('3133', '610623', '', '', '子长县', '3128', '3');
INSERT INTO `region` VALUES ('3134', '610624', '', '', '安塞县', '3128', '3');
INSERT INTO `region` VALUES ('3135', '610625', '', '', '志丹县', '3128', '3');
INSERT INTO `region` VALUES ('3136', '610626', '', '', '吴起县', '3128', '3');
INSERT INTO `region` VALUES ('3137', '610627', '', '', '甘泉县', '3128', '3');
INSERT INTO `region` VALUES ('3138', '610628', '', '', '富县', '3128', '3');
INSERT INTO `region` VALUES ('3139', '610629', '', '', '洛川县', '3128', '3');
INSERT INTO `region` VALUES ('3140', '610630', '', '', '宜川县', '3128', '3');
INSERT INTO `region` VALUES ('3141', '610631', '', '', '黄龙县', '3128', '3');
INSERT INTO `region` VALUES ('3142', '610632', '', '', '黄陵县', '3128', '3');
INSERT INTO `region` VALUES ('3143', '610700', '', '汉中市', '', '3063', '2');
INSERT INTO `region` VALUES ('3144', '610701', '', '', '市辖区', '3143', '3');
INSERT INTO `region` VALUES ('3145', '610702', '', '', '汉台区', '3143', '3');
INSERT INTO `region` VALUES ('3146', '610721', '', '', '南郑县', '3143', '3');
INSERT INTO `region` VALUES ('3147', '610722', '', '', '城固县', '3143', '3');
INSERT INTO `region` VALUES ('3148', '610723', '', '', '洋县', '3143', '3');
INSERT INTO `region` VALUES ('3149', '610724', '', '', '西乡县', '3143', '3');
INSERT INTO `region` VALUES ('3150', '610725', '', '', '勉县', '3143', '3');
INSERT INTO `region` VALUES ('3151', '610726', '', '', '宁强县', '3143', '3');
INSERT INTO `region` VALUES ('3152', '610727', '', '', '略阳县', '3143', '3');
INSERT INTO `region` VALUES ('3153', '610728', '', '', '镇巴县', '3143', '3');
INSERT INTO `region` VALUES ('3154', '610729', '', '', '留坝县', '3143', '3');
INSERT INTO `region` VALUES ('3155', '610730', '', '', '佛坪县', '3143', '3');
INSERT INTO `region` VALUES ('3156', '610800', '', '榆林市', '', '3063', '2');
INSERT INTO `region` VALUES ('3157', '610801', '', '', '市辖区', '3156', '3');
INSERT INTO `region` VALUES ('3158', '610802', '', '', '榆阳区', '3156', '3');
INSERT INTO `region` VALUES ('3159', '610821', '', '', '神木县', '3156', '3');
INSERT INTO `region` VALUES ('3160', '610822', '', '', '府谷县', '3156', '3');
INSERT INTO `region` VALUES ('3161', '610823', '', '', '横山县', '3156', '3');
INSERT INTO `region` VALUES ('3162', '610824', '', '', '靖边县', '3156', '3');
INSERT INTO `region` VALUES ('3163', '610825', '', '', '定边县', '3156', '3');
INSERT INTO `region` VALUES ('3164', '610826', '', '', '绥德县', '3156', '3');
INSERT INTO `region` VALUES ('3165', '610827', '', '', '米脂县', '3156', '3');
INSERT INTO `region` VALUES ('3166', '610828', '', '', '佳县', '3156', '3');
INSERT INTO `region` VALUES ('3167', '610829', '', '', '吴堡县', '3156', '3');
INSERT INTO `region` VALUES ('3168', '610830', '', '', '清涧县', '3156', '3');
INSERT INTO `region` VALUES ('3169', '610831', '', '', '子洲县', '3156', '3');
INSERT INTO `region` VALUES ('3170', '610900', '', '安康市', '', '3063', '2');
INSERT INTO `region` VALUES ('3171', '610901', '', '', '市辖区', '3170', '3');
INSERT INTO `region` VALUES ('3173', '610921', '', '', '汉阴县', '3170', '3');
INSERT INTO `region` VALUES ('3174', '610922', '', '', '石泉县', '3170', '3');
INSERT INTO `region` VALUES ('3175', '610923', '', '', '宁陕县', '3170', '3');
INSERT INTO `region` VALUES ('3176', '610924', '', '', '紫阳县', '3170', '3');
INSERT INTO `region` VALUES ('3177', '610925', '', '', '岚皋县', '3170', '3');
INSERT INTO `region` VALUES ('3178', '610926', '', '', '平利县', '3170', '3');
INSERT INTO `region` VALUES ('3179', '610927', '', '', '镇坪县', '3170', '3');
INSERT INTO `region` VALUES ('3180', '610928', '', '', '旬阳县', '3170', '3');
INSERT INTO `region` VALUES ('3181', '610929', '', '', '白河县', '3170', '3');
INSERT INTO `region` VALUES ('3182', '611000', '', '商洛市', '', '3063', '2');
INSERT INTO `region` VALUES ('3183', '611001', '', '', '市辖区', '3182', '3');
INSERT INTO `region` VALUES ('3184', '611002', '', '', '商州区', '3182', '3');
INSERT INTO `region` VALUES ('3185', '611021', '', '', '洛南县', '3182', '3');
INSERT INTO `region` VALUES ('3186', '611022', '', '', '丹凤县', '3182', '3');
INSERT INTO `region` VALUES ('3187', '611023', '', '', '商南县', '3182', '3');
INSERT INTO `region` VALUES ('3188', '611024', '', '', '山阳县', '3182', '3');
INSERT INTO `region` VALUES ('3189', '611025', '', '', '镇安县', '3182', '3');
INSERT INTO `region` VALUES ('3190', '611026', '', '', '柞水县', '3182', '3');
INSERT INTO `region` VALUES ('3191', '620000', '甘肃省', '', '', '1', '2');
INSERT INTO `region` VALUES ('3192', '620100', '', '兰州市', '', '3191', '2');
INSERT INTO `region` VALUES ('3193', '620101', '', '', '市辖区', '3192', '3');
INSERT INTO `region` VALUES ('3194', '620102', '', '', '城关区', '3192', '3');
INSERT INTO `region` VALUES ('3195', '620103', '', '', '七里河区', '3192', '3');
INSERT INTO `region` VALUES ('3196', '620104', '', '', '西固区', '3192', '3');
INSERT INTO `region` VALUES ('3197', '620105', '', '', '安宁区', '3192', '3');
INSERT INTO `region` VALUES ('3198', '620111', '', '', '红古区', '3192', '3');
INSERT INTO `region` VALUES ('3199', '620121', '', '', '永登县', '3192', '3');
INSERT INTO `region` VALUES ('3200', '620122', '', '', '皋兰县', '3192', '3');
INSERT INTO `region` VALUES ('3201', '620123', '', '', '榆中县', '3192', '3');
INSERT INTO `region` VALUES ('3202', '620200', '', '嘉峪关市', '', '3191', '2');
INSERT INTO `region` VALUES ('3203', '620201', '', '', '市辖区', '3202', '3');
INSERT INTO `region` VALUES ('3204', '620300', '', '金昌市', '', '3191', '2');
INSERT INTO `region` VALUES ('3205', '620301', '', '', '市辖区', '3204', '3');
INSERT INTO `region` VALUES ('3206', '620302', '', '', '金川区', '3204', '3');
INSERT INTO `region` VALUES ('3207', '620321', '', '', '永昌县', '3204', '3');
INSERT INTO `region` VALUES ('3208', '620400', '', '白银市', '', '3191', '2');
INSERT INTO `region` VALUES ('3209', '620401', '', '', '市辖区', '3208', '3');
INSERT INTO `region` VALUES ('3210', '620402', '', '', '白银区', '3208', '3');
INSERT INTO `region` VALUES ('3211', '620403', '', '', '平川区', '3208', '3');
INSERT INTO `region` VALUES ('3212', '620421', '', '', '靖远县', '3208', '3');
INSERT INTO `region` VALUES ('3213', '620422', '', '', '会宁县', '3208', '3');
INSERT INTO `region` VALUES ('3214', '620423', '', '', '景泰县', '3208', '3');
INSERT INTO `region` VALUES ('3215', '620500', '', '天水市', '', '3191', '2');
INSERT INTO `region` VALUES ('3216', '620501', '', '', '市辖区', '3215', '3');
INSERT INTO `region` VALUES ('3217', '620502', '', '', '秦州区', '3215', '3');
INSERT INTO `region` VALUES ('3218', '620503', '', '', '麦积区', '3215', '3');
INSERT INTO `region` VALUES ('3219', '620521', '', '', '清水县', '3215', '3');
INSERT INTO `region` VALUES ('3220', '620522', '', '', '秦安县', '3215', '3');
INSERT INTO `region` VALUES ('3221', '620523', '', '', '甘谷县', '3215', '3');
INSERT INTO `region` VALUES ('3222', '620524', '', '', '武山县', '3215', '3');
INSERT INTO `region` VALUES ('3223', '620525', '', '', '张家川回族自治县', '3215', '3');
INSERT INTO `region` VALUES ('3224', '620600', '', '武威市', '', '3191', '2');
INSERT INTO `region` VALUES ('3225', '620601', '', '', '市辖区', '3224', '3');
INSERT INTO `region` VALUES ('3226', '620602', '', '', '凉州区', '3224', '3');
INSERT INTO `region` VALUES ('3227', '620621', '', '', '民勤县', '3224', '3');
INSERT INTO `region` VALUES ('3228', '620622', '', '', '古浪县', '3224', '3');
INSERT INTO `region` VALUES ('3229', '620623', '', '', '天祝藏族自治县', '3224', '3');
INSERT INTO `region` VALUES ('3230', '620700', '', '张掖市', '', '3191', '2');
INSERT INTO `region` VALUES ('3231', '620701', '', '', '市辖区', '3230', '3');
INSERT INTO `region` VALUES ('3232', '620702', '', '', '甘州区', '3230', '3');
INSERT INTO `region` VALUES ('3233', '620721', '', '', '肃南裕固族自治县', '3230', '3');
INSERT INTO `region` VALUES ('3234', '620722', '', '', '民乐县', '3230', '3');
INSERT INTO `region` VALUES ('3235', '620723', '', '', '临泽县', '3230', '3');
INSERT INTO `region` VALUES ('3236', '620724', '', '', '高台县', '3230', '3');
INSERT INTO `region` VALUES ('3237', '620725', '', '', '山丹县', '3230', '3');
INSERT INTO `region` VALUES ('3238', '620800', '', '平凉市', '', '3191', '2');
INSERT INTO `region` VALUES ('3239', '620801', '', '', '市辖区', '3238', '3');
INSERT INTO `region` VALUES ('3240', '620802', '', '', '崆峒区', '3238', '3');
INSERT INTO `region` VALUES ('3241', '620821', '', '', '泾川县', '3238', '3');
INSERT INTO `region` VALUES ('3242', '620822', '', '', '灵台县', '3238', '3');
INSERT INTO `region` VALUES ('3243', '620823', '', '', '崇信县', '3238', '3');
INSERT INTO `region` VALUES ('3244', '620824', '', '', '华亭县', '3238', '3');
INSERT INTO `region` VALUES ('3245', '620825', '', '', '庄浪县', '3238', '3');
INSERT INTO `region` VALUES ('3246', '620826', '', '', '静宁县', '3238', '3');
INSERT INTO `region` VALUES ('3247', '620900', '', '酒泉市', '', '3191', '2');
INSERT INTO `region` VALUES ('3248', '620901', '', '', '市辖区', '3247', '3');
INSERT INTO `region` VALUES ('3249', '620902', '', '', '肃州区', '3247', '3');
INSERT INTO `region` VALUES ('3250', '620921', '', '', '金塔县', '3247', '3');
INSERT INTO `region` VALUES ('3251', '620922', '', '', '瓜州县', '3247', '3');
INSERT INTO `region` VALUES ('3252', '620923', '', '', '肃北蒙古族自治县', '3247', '3');
INSERT INTO `region` VALUES ('3253', '620924', '', '', '阿克塞哈萨克族自治县', '3247', '3');
INSERT INTO `region` VALUES ('3254', '620981', '', '', '玉门市', '3247', '3');
INSERT INTO `region` VALUES ('3255', '620982', '', '', '敦煌市', '3247', '3');
INSERT INTO `region` VALUES ('3256', '621000', '', '庆阳市', '', '3191', '2');
INSERT INTO `region` VALUES ('3257', '621001', '', '', '市辖区', '3256', '3');
INSERT INTO `region` VALUES ('3258', '621002', '', '', '西峰区', '3256', '3');
INSERT INTO `region` VALUES ('3259', '621021', '', '', '庆城县', '3256', '3');
INSERT INTO `region` VALUES ('3260', '621022', '', '', '环县', '3256', '3');
INSERT INTO `region` VALUES ('3261', '621023', '', '', '华池县', '3256', '3');
INSERT INTO `region` VALUES ('3262', '621024', '', '', '合水县', '3256', '3');
INSERT INTO `region` VALUES ('3263', '621025', '', '', '正宁县', '3256', '3');
INSERT INTO `region` VALUES ('3264', '621026', '', '', '宁县', '3256', '3');
INSERT INTO `region` VALUES ('3265', '621027', '', '', '镇原县', '3256', '3');
INSERT INTO `region` VALUES ('3266', '621100', '', '定西市', '', '3191', '2');
INSERT INTO `region` VALUES ('3267', '621101', '', '', '市辖区', '3266', '3');
INSERT INTO `region` VALUES ('3268', '621102', '', '', '安定区', '3266', '3');
INSERT INTO `region` VALUES ('3269', '621121', '', '', '通渭县', '3266', '3');
INSERT INTO `region` VALUES ('3270', '621122', '', '', '陇西县', '3266', '3');
INSERT INTO `region` VALUES ('3271', '621123', '', '', '渭源县', '3266', '3');
INSERT INTO `region` VALUES ('3272', '621124', '', '', '临洮县', '3266', '3');
INSERT INTO `region` VALUES ('3273', '621125', '', '', '漳县', '3266', '3');
INSERT INTO `region` VALUES ('3274', '621126', '', '', '岷县', '3266', '3');
INSERT INTO `region` VALUES ('3275', '621200', '', '陇南市', '', '3191', '2');
INSERT INTO `region` VALUES ('3276', '621201', '', '', '市辖区', '3275', '3');
INSERT INTO `region` VALUES ('3277', '621202', '', '', '武都区', '3275', '3');
INSERT INTO `region` VALUES ('3278', '621221', '', '', '成县', '3275', '3');
INSERT INTO `region` VALUES ('3279', '621222', '', '', '文县', '3275', '3');
INSERT INTO `region` VALUES ('3280', '621223', '', '', '宕昌县', '3275', '3');
INSERT INTO `region` VALUES ('3281', '621224', '', '', '康县', '3275', '3');
INSERT INTO `region` VALUES ('3282', '621225', '', '', '西和县', '3275', '3');
INSERT INTO `region` VALUES ('3283', '621226', '', '', '礼县', '3275', '3');
INSERT INTO `region` VALUES ('3284', '621227', '', '', '徽县', '3275', '3');
INSERT INTO `region` VALUES ('3285', '621228', '', '', '两当县', '3275', '3');
INSERT INTO `region` VALUES ('3286', '622900', '', '临夏回族自治州', '', '3191', '2');
INSERT INTO `region` VALUES ('3287', '622901', '', '', '临夏市', '3286', '3');
INSERT INTO `region` VALUES ('3288', '622921', '', '', '临夏县', '3286', '3');
INSERT INTO `region` VALUES ('3289', '622922', '', '', '康乐县', '3286', '3');
INSERT INTO `region` VALUES ('3290', '622923', '', '', '永靖县', '3286', '3');
INSERT INTO `region` VALUES ('3291', '622924', '', '', '广河县', '3286', '3');
INSERT INTO `region` VALUES ('3292', '622925', '', '', '和政县', '3286', '3');
INSERT INTO `region` VALUES ('3293', '622926', '', '', '东乡族自治县', '3286', '3');
INSERT INTO `region` VALUES ('3294', '622927', '', '', '积石山保安族东乡族撒拉族自治县', '3286', '3');
INSERT INTO `region` VALUES ('3295', '623000', '', '甘南藏族自治州', '', '3191', '2');
INSERT INTO `region` VALUES ('3296', '623001', '', '', '合作市', '3295', '3');
INSERT INTO `region` VALUES ('3297', '623021', '', '', '临潭县', '3295', '3');
INSERT INTO `region` VALUES ('3298', '623022', '', '', '卓尼县', '3295', '3');
INSERT INTO `region` VALUES ('3299', '623023', '', '', '舟曲县', '3295', '3');
INSERT INTO `region` VALUES ('3300', '623024', '', '', '迭部县', '3295', '3');
INSERT INTO `region` VALUES ('3301', '623025', '', '', '玛曲县', '3295', '3');
INSERT INTO `region` VALUES ('3302', '623026', '', '', '碌曲县', '3295', '3');
INSERT INTO `region` VALUES ('3303', '623027', '', '', '夏河县', '3295', '3');
INSERT INTO `region` VALUES ('3304', '630000', '青海省', '', '', '1', '2');
INSERT INTO `region` VALUES ('3305', '630100', '', '西宁市', '', '3304', '2');
INSERT INTO `region` VALUES ('3306', '630101', '', '', '市辖区', '3305', '3');
INSERT INTO `region` VALUES ('3307', '630102', '', '', '城东区', '3305', '3');
INSERT INTO `region` VALUES ('3308', '630103', '', '', '城中区', '3305', '3');
INSERT INTO `region` VALUES ('3309', '630104', '', '', '城西区', '3305', '3');
INSERT INTO `region` VALUES ('3310', '630105', '', '', '城北区', '3305', '3');
INSERT INTO `region` VALUES ('3311', '630121', '', '', '大通回族土族自治县', '3305', '3');
INSERT INTO `region` VALUES ('3312', '630122', '', '', '湟中县', '3305', '3');
INSERT INTO `region` VALUES ('3313', '630123', '', '', '湟源县', '3305', '3');
INSERT INTO `region` VALUES ('3314', '630200', '', '海东市', '', '3304', '2');
INSERT INTO `region` VALUES ('3315', '630201', '', '', '市辖区', '3314', '3');
INSERT INTO `region` VALUES ('3316', '630202', '', '', '乐都区', '3314', '3');
INSERT INTO `region` VALUES ('3317', '630221', '', '', '平安县', '3314', '3');
INSERT INTO `region` VALUES ('3318', '630222', '', '', '民和回族土族自治县', '3314', '3');
INSERT INTO `region` VALUES ('3319', '630223', '', '', '互助土族自治县', '3314', '3');
INSERT INTO `region` VALUES ('3320', '630224', '', '', '化隆回族自治县', '3314', '3');
INSERT INTO `region` VALUES ('3321', '630225', '', '', '循化撒拉族自治县', '3314', '3');
INSERT INTO `region` VALUES ('3322', '632200', '', '海北藏族自治州', '', '3304', '2');
INSERT INTO `region` VALUES ('3323', '632221', '', '', '门源回族自治县', '3322', '3');
INSERT INTO `region` VALUES ('3324', '632222', '', '', '祁连县', '3322', '3');
INSERT INTO `region` VALUES ('3325', '632223', '', '', '海晏县', '3322', '3');
INSERT INTO `region` VALUES ('3326', '632224', '', '', '刚察县', '3322', '3');
INSERT INTO `region` VALUES ('3327', '632300', '', '黄南藏族自治州', '', '3304', '2');
INSERT INTO `region` VALUES ('3328', '632321', '', '', '同仁县', '3327', '3');
INSERT INTO `region` VALUES ('3329', '632322', '', '', '尖扎县', '3327', '3');
INSERT INTO `region` VALUES ('3330', '632323', '', '', '泽库县', '3327', '3');
INSERT INTO `region` VALUES ('3331', '632324', '', '', '河南蒙古族自治县', '3327', '3');
INSERT INTO `region` VALUES ('3332', '632500', '', '海南藏族自治州', '', '3304', '2');
INSERT INTO `region` VALUES ('3333', '632521', '', '', '共和县', '3332', '3');
INSERT INTO `region` VALUES ('3334', '632522', '', '', '同德县', '3332', '3');
INSERT INTO `region` VALUES ('3335', '632523', '', '', '贵德县', '3332', '3');
INSERT INTO `region` VALUES ('3336', '632524', '', '', '兴海县', '3332', '3');
INSERT INTO `region` VALUES ('3337', '632525', '', '', '贵南县', '3332', '3');
INSERT INTO `region` VALUES ('3338', '632600', '', '果洛藏族自治州', '', '3304', '2');
INSERT INTO `region` VALUES ('3339', '632621', '', '', '玛沁县', '3338', '3');
INSERT INTO `region` VALUES ('3340', '632622', '', '', '班玛县', '3338', '3');
INSERT INTO `region` VALUES ('3341', '632623', '', '', '甘德县', '3338', '3');
INSERT INTO `region` VALUES ('3342', '632624', '', '', '达日县', '3338', '3');
INSERT INTO `region` VALUES ('3343', '632625', '', '', '久治县', '3338', '3');
INSERT INTO `region` VALUES ('3344', '632626', '', '', '玛多县', '3338', '3');
INSERT INTO `region` VALUES ('3345', '632700', '', '玉树藏族自治州', '', '3304', '2');
INSERT INTO `region` VALUES ('3346', '632701', '', '', '玉树市', '3345', '3');
INSERT INTO `region` VALUES ('3347', '632722', '', '', '杂多县', '3345', '3');
INSERT INTO `region` VALUES ('3348', '632723', '', '', '称多县', '3345', '3');
INSERT INTO `region` VALUES ('3349', '632724', '', '', '治多县', '3345', '3');
INSERT INTO `region` VALUES ('3350', '632725', '', '', '囊谦县', '3345', '3');
INSERT INTO `region` VALUES ('3351', '632726', '', '', '曲麻莱县', '3345', '3');
INSERT INTO `region` VALUES ('3352', '632800', '', '海西蒙古族藏族自治州', '', '3304', '2');
INSERT INTO `region` VALUES ('3353', '632801', '', '', '格尔木市', '3352', '3');
INSERT INTO `region` VALUES ('3354', '632802', '', '', '德令哈市', '3352', '3');
INSERT INTO `region` VALUES ('3355', '632821', '', '', '乌兰县', '3352', '3');
INSERT INTO `region` VALUES ('3356', '632822', '', '', '都兰县', '3352', '3');
INSERT INTO `region` VALUES ('3357', '632823', '', '', '天峻县', '3352', '3');
INSERT INTO `region` VALUES ('3358', '640000', '宁夏回族自治区', '', '', '1', '2');
INSERT INTO `region` VALUES ('3359', '640100', '', '银川市', '', '3358', '2');
INSERT INTO `region` VALUES ('3360', '640101', '', '', '市辖区', '3359', '3');
INSERT INTO `region` VALUES ('3361', '640104', '', '', '兴庆区', '3359', '3');
INSERT INTO `region` VALUES ('3362', '640105', '', '', '西夏区', '3359', '3');
INSERT INTO `region` VALUES ('3363', '640106', '', '', '金凤区', '3359', '3');
INSERT INTO `region` VALUES ('3364', '640121', '', '', '永宁县', '3359', '3');
INSERT INTO `region` VALUES ('3365', '640122', '', '', '贺兰县', '3359', '3');
INSERT INTO `region` VALUES ('3366', '640181', '', '', '灵武市', '3359', '3');
INSERT INTO `region` VALUES ('3367', '640200', '', '石嘴山市', '', '3358', '2');
INSERT INTO `region` VALUES ('3368', '640201', '', '', '市辖区', '3367', '3');
INSERT INTO `region` VALUES ('3369', '640202', '', '', '大武口区', '3367', '3');
INSERT INTO `region` VALUES ('3370', '640205', '', '', '惠农区', '3367', '3');
INSERT INTO `region` VALUES ('3371', '640221', '', '', '平罗县', '3367', '3');
INSERT INTO `region` VALUES ('3372', '640300', '', '吴忠市', '', '3358', '2');
INSERT INTO `region` VALUES ('3373', '640301', '', '', '市辖区', '3372', '3');
INSERT INTO `region` VALUES ('3374', '640302', '', '', '利通区', '3372', '3');
INSERT INTO `region` VALUES ('3375', '640303', '', '', '红寺堡区', '3372', '3');
INSERT INTO `region` VALUES ('3376', '640323', '', '', '盐池县', '3372', '3');
INSERT INTO `region` VALUES ('3377', '640324', '', '', '同心县', '3372', '3');
INSERT INTO `region` VALUES ('3378', '640381', '', '', '青铜峡市', '3372', '3');
INSERT INTO `region` VALUES ('3379', '640400', '', '固原市', '', '3358', '2');
INSERT INTO `region` VALUES ('3380', '640401', '', '', '市辖区', '3379', '3');
INSERT INTO `region` VALUES ('3381', '640402', '', '', '原州区', '3379', '3');
INSERT INTO `region` VALUES ('3382', '640422', '', '', '西吉县', '3379', '3');
INSERT INTO `region` VALUES ('3383', '640423', '', '', '隆德县', '3379', '3');
INSERT INTO `region` VALUES ('3384', '640424', '', '', '泾源县', '3379', '3');
INSERT INTO `region` VALUES ('3385', '640425', '', '', '彭阳县', '3379', '3');
INSERT INTO `region` VALUES ('3386', '640500', '', '中卫市', '', '3358', '2');
INSERT INTO `region` VALUES ('3387', '640501', '', '', '市辖区', '3386', '3');
INSERT INTO `region` VALUES ('3388', '640502', '', '', '沙坡头区', '3386', '3');
INSERT INTO `region` VALUES ('3389', '640521', '', '', '中宁县', '3386', '3');
INSERT INTO `region` VALUES ('3390', '640522', '', '', '海原县', '3386', '3');
INSERT INTO `region` VALUES ('3391', '650000', '新疆维吾尔自治区', '', '', '1', '2');
INSERT INTO `region` VALUES ('3392', '650100', '', '乌鲁木齐市', '', '3391', '2');
INSERT INTO `region` VALUES ('3393', '650101', '', '', '市辖区', '3392', '3');
INSERT INTO `region` VALUES ('3394', '650102', '', '', '天山区', '3392', '3');
INSERT INTO `region` VALUES ('3395', '650103', '', '', '沙依巴克区', '3392', '3');
INSERT INTO `region` VALUES ('3396', '650104', '', '', '新市区', '3392', '3');
INSERT INTO `region` VALUES ('3397', '650105', '', '', '水磨沟区', '3392', '3');
INSERT INTO `region` VALUES ('3398', '650106', '', '', '头屯河区', '3392', '3');
INSERT INTO `region` VALUES ('3399', '650107', '', '', '达坂城区', '3392', '3');
INSERT INTO `region` VALUES ('3400', '650109', '', '', '米东区', '3392', '3');
INSERT INTO `region` VALUES ('3401', '650121', '', '', '乌鲁木齐县', '3392', '3');
INSERT INTO `region` VALUES ('3402', '650200', '', '克拉玛依市', '', '3391', '2');
INSERT INTO `region` VALUES ('3403', '650201', '', '', '市辖区', '3402', '3');
INSERT INTO `region` VALUES ('3404', '650202', '', '', '独山子区', '3402', '3');
INSERT INTO `region` VALUES ('3405', '650203', '', '', '克拉玛依区', '3402', '3');
INSERT INTO `region` VALUES ('3406', '650204', '', '', '白碱滩区', '3402', '3');
INSERT INTO `region` VALUES ('3407', '650205', '', '', '乌尔禾区', '3402', '3');
INSERT INTO `region` VALUES ('3408', '652100', '', '吐鲁番地区', '', '3391', '2');
INSERT INTO `region` VALUES ('3409', '652101', '', '', '吐鲁番市', '3408', '3');
INSERT INTO `region` VALUES ('3410', '652122', '', '', '鄯善县', '3408', '3');
INSERT INTO `region` VALUES ('3411', '652123', '', '', '托克逊县', '3408', '3');
INSERT INTO `region` VALUES ('3412', '652200', '', '哈密地区', '', '3391', '2');
INSERT INTO `region` VALUES ('3413', '652201', '', '', '哈密市', '3412', '3');
INSERT INTO `region` VALUES ('3414', '652222', '', '', '巴里坤哈萨克自治县', '3412', '3');
INSERT INTO `region` VALUES ('3415', '652223', '', '', '伊吾县', '3412', '3');
INSERT INTO `region` VALUES ('3416', '652300', '', '昌吉回族自治州', '', '3391', '2');
INSERT INTO `region` VALUES ('3417', '652301', '', '', '昌吉市', '3416', '3');
INSERT INTO `region` VALUES ('3418', '652302', '', '', '阜康市', '3416', '3');
INSERT INTO `region` VALUES ('3419', '652323', '', '', '呼图壁县', '3416', '3');
INSERT INTO `region` VALUES ('3420', '652324', '', '', '玛纳斯县', '3416', '3');
INSERT INTO `region` VALUES ('3421', '652325', '', '', '奇台县', '3416', '3');
INSERT INTO `region` VALUES ('3422', '652327', '', '', '吉木萨尔县', '3416', '3');
INSERT INTO `region` VALUES ('3423', '652328', '', '', '木垒哈萨克自治县', '3416', '3');
INSERT INTO `region` VALUES ('3424', '652700', '', '博尔塔拉蒙古自治州', '', '3391', '2');
INSERT INTO `region` VALUES ('3425', '652701', '', '', '博乐市', '3424', '3');
INSERT INTO `region` VALUES ('3426', '652702', '', '', '阿拉山口市', '3424', '3');
INSERT INTO `region` VALUES ('3427', '652722', '', '', '精河县', '3424', '3');
INSERT INTO `region` VALUES ('3428', '652723', '', '', '温泉县', '3424', '3');
INSERT INTO `region` VALUES ('3429', '652800', '', '巴音郭楞蒙古自治州', '', '3391', '2');
INSERT INTO `region` VALUES ('3430', '652801', '', '', '库尔勒市', '3429', '3');
INSERT INTO `region` VALUES ('3431', '652822', '', '', '轮台县', '3429', '3');
INSERT INTO `region` VALUES ('3432', '652823', '', '', '尉犁县', '3429', '3');
INSERT INTO `region` VALUES ('3433', '652824', '', '', '若羌县', '3429', '3');
INSERT INTO `region` VALUES ('3434', '652825', '', '', '且末县', '3429', '3');
INSERT INTO `region` VALUES ('3435', '652826', '', '', '焉耆回族自治县', '3429', '3');
INSERT INTO `region` VALUES ('3436', '652827', '', '', '和静县', '3429', '3');
INSERT INTO `region` VALUES ('3437', '652828', '', '', '和硕县', '3429', '3');
INSERT INTO `region` VALUES ('3438', '652829', '', '', '博湖县', '3429', '3');
INSERT INTO `region` VALUES ('3439', '652900', '', '阿克苏地区', '', '3391', '2');
INSERT INTO `region` VALUES ('3440', '652901', '', '', '阿克苏市', '3439', '3');
INSERT INTO `region` VALUES ('3441', '652922', '', '', '温宿县', '3439', '3');
INSERT INTO `region` VALUES ('3442', '652923', '', '', '库车县', '3439', '3');
INSERT INTO `region` VALUES ('3443', '652924', '', '', '沙雅县', '3439', '3');
INSERT INTO `region` VALUES ('3444', '652925', '', '', '新和县', '3439', '3');
INSERT INTO `region` VALUES ('3445', '652926', '', '', '拜城县', '3439', '3');
INSERT INTO `region` VALUES ('3446', '652927', '', '', '乌什县', '3439', '3');
INSERT INTO `region` VALUES ('3447', '652928', '', '', '阿瓦提县', '3439', '3');
INSERT INTO `region` VALUES ('3448', '652929', '', '', '柯坪县', '3439', '3');
INSERT INTO `region` VALUES ('3449', '653000', '', '克孜勒苏柯尔克孜自治州', '', '3391', '2');
INSERT INTO `region` VALUES ('3450', '653001', '', '', '阿图什市', '3449', '3');
INSERT INTO `region` VALUES ('3451', '653022', '', '', '阿克陶县', '3449', '3');
INSERT INTO `region` VALUES ('3452', '653023', '', '', '阿合奇县', '3449', '3');
INSERT INTO `region` VALUES ('3453', '653024', '', '', '乌恰县', '3449', '3');
INSERT INTO `region` VALUES ('3454', '653100', '', '喀什地区', '', '3391', '2');
INSERT INTO `region` VALUES ('3455', '653101', '', '', '喀什市', '3454', '3');
INSERT INTO `region` VALUES ('3456', '653121', '', '', '疏附县', '3454', '3');
INSERT INTO `region` VALUES ('3457', '653122', '', '', '疏勒县', '3454', '3');
INSERT INTO `region` VALUES ('3458', '653123', '', '', '英吉沙县', '3454', '3');
INSERT INTO `region` VALUES ('3459', '653124', '', '', '泽普县', '3454', '3');
INSERT INTO `region` VALUES ('3460', '653125', '', '', '莎车县', '3454', '3');
INSERT INTO `region` VALUES ('3461', '653126', '', '', '叶城县', '3454', '3');
INSERT INTO `region` VALUES ('3462', '653127', '', '', '麦盖提县', '3454', '3');
INSERT INTO `region` VALUES ('3463', '653128', '', '', '岳普湖县', '3454', '3');
INSERT INTO `region` VALUES ('3464', '653129', '', '', '伽师县', '3454', '3');
INSERT INTO `region` VALUES ('3465', '653130', '', '', '巴楚县', '3454', '3');
INSERT INTO `region` VALUES ('3466', '653131', '', '', '塔什库尔干塔吉克自治县', '3454', '3');
INSERT INTO `region` VALUES ('3467', '653200', '', '和田地区', '', '3391', '2');
INSERT INTO `region` VALUES ('3468', '653201', '', '', '和田市', '3467', '3');
INSERT INTO `region` VALUES ('3469', '653221', '', '', '和田县', '3467', '3');
INSERT INTO `region` VALUES ('3470', '653222', '', '', '墨玉县', '3467', '3');
INSERT INTO `region` VALUES ('3471', '653223', '', '', '皮山县', '3467', '3');
INSERT INTO `region` VALUES ('3472', '653224', '', '', '洛浦县', '3467', '3');
INSERT INTO `region` VALUES ('3473', '653225', '', '', '策勒县', '3467', '3');
INSERT INTO `region` VALUES ('3474', '653226', '', '', '于田县', '3467', '3');
INSERT INTO `region` VALUES ('3475', '653227', '', '', '民丰县', '3467', '3');
INSERT INTO `region` VALUES ('3476', '654000', '', '伊犁哈萨克自治州', '', '3391', '2');
INSERT INTO `region` VALUES ('3477', '654002', '', '', '伊宁市', '3476', '3');
INSERT INTO `region` VALUES ('3478', '654003', '', '', '奎屯市', '3476', '3');
INSERT INTO `region` VALUES ('3479', '654004', '', '', '霍尔果斯市', '3476', '3');
INSERT INTO `region` VALUES ('3480', '654021', '', '', '伊宁县', '3476', '3');
INSERT INTO `region` VALUES ('3481', '654022', '', '', '察布查尔锡伯自治县', '3476', '3');
INSERT INTO `region` VALUES ('3482', '654023', '', '', '霍城县', '3476', '3');
INSERT INTO `region` VALUES ('3483', '654024', '', '', '巩留县', '3476', '3');
INSERT INTO `region` VALUES ('3484', '654025', '', '', '新源县', '3476', '3');
INSERT INTO `region` VALUES ('3485', '654026', '', '', '昭苏县', '3476', '3');
INSERT INTO `region` VALUES ('3486', '654027', '', '', '特克斯县', '3476', '3');
INSERT INTO `region` VALUES ('3487', '654028', '', '', '尼勒克县', '3476', '3');
INSERT INTO `region` VALUES ('3488', '654200', '', '', '塔城地区', '3476', '3');
INSERT INTO `region` VALUES ('3489', '654201', '', '', '塔城市', '3476', '3');
INSERT INTO `region` VALUES ('3490', '654202', '', '', '乌苏市', '3476', '3');
INSERT INTO `region` VALUES ('3491', '654221', '', '', '额敏县', '3476', '3');
INSERT INTO `region` VALUES ('3492', '654223', '', '', '沙湾县', '3476', '3');
INSERT INTO `region` VALUES ('3493', '654224', '', '', '托里县', '3476', '3');
INSERT INTO `region` VALUES ('3494', '654225', '', '', '裕民县', '3476', '3');
INSERT INTO `region` VALUES ('3495', '654226', '', '', '和布克赛尔蒙古自治县', '3476', '3');
INSERT INTO `region` VALUES ('3496', '654300', '', '', '阿勒泰地区', '3476', '3');
INSERT INTO `region` VALUES ('3497', '654301', '', '', '阿勒泰市', '3476', '3');
INSERT INTO `region` VALUES ('3498', '654321', '', '', '布尔津县', '3476', '3');
INSERT INTO `region` VALUES ('3499', '654322', '', '', '富蕴县', '3476', '3');
INSERT INTO `region` VALUES ('3500', '654323', '', '', '福海县', '3476', '3');
INSERT INTO `region` VALUES ('3501', '654324', '', '', '哈巴河县', '3476', '3');
INSERT INTO `region` VALUES ('3502', '654325', '', '', '青河县', '3476', '3');
INSERT INTO `region` VALUES ('3503', '654326', '', '', '吉木乃县', '3476', '3');
INSERT INTO `region` VALUES ('3504', '659000', '', '自治区直辖县级行政区划', '', '3391', '2');
INSERT INTO `region` VALUES ('3505', '659001', '', '', '石河子市', '3504', '3');
INSERT INTO `region` VALUES ('3506', '659002', '', '', '阿拉尔市', '3504', '3');
INSERT INTO `region` VALUES ('3507', '659003', '', '', '图木舒克市', '3504', '3');
INSERT INTO `region` VALUES ('3508', '659004', '', '', '五家渠市', '3504', '3');
INSERT INTO `region` VALUES ('3509', '659005', '', '', '北屯市', '3504', '3');
INSERT INTO `region` VALUES ('3510', '659006', '', '', '铁门关市', '3504', '3');
INSERT INTO `region` VALUES ('3511', '659007', '', '', '双河市', '3504', '3');
INSERT INTO `region` VALUES ('3512', '710000', '台湾省', '', '', '1', '2');
INSERT INTO `region` VALUES ('3513', '710100', '', '台北市', '', '3512', '2');
INSERT INTO `region` VALUES ('3514', '710101', '', '', '松山区', '3513', '3');
INSERT INTO `region` VALUES ('3515', '710102', '', '', '信义区', '3513', '3');
INSERT INTO `region` VALUES ('3516', '710103', '', '', '大安区', '3513', '3');
INSERT INTO `region` VALUES ('3517', '710104', '', '', '中山区', '3513', '3');
INSERT INTO `region` VALUES ('3518', '710105', '', '', '中正区', '3513', '3');
INSERT INTO `region` VALUES ('3519', '710106', '', '', '大同区', '3513', '3');
INSERT INTO `region` VALUES ('3520', '710107', '', '', '万华区', '3513', '3');
INSERT INTO `region` VALUES ('3521', '710108', '', '', '文山区', '3513', '3');
INSERT INTO `region` VALUES ('3522', '710109', '', '', '南港区', '3513', '3');
INSERT INTO `region` VALUES ('3523', '710110', '', '', '内湖区', '3513', '3');
INSERT INTO `region` VALUES ('3524', '710111', '', '', '士林区', '3513', '3');
INSERT INTO `region` VALUES ('3525', '710112', '', '', '北投区', '3513', '3');
INSERT INTO `region` VALUES ('3526', '710200', '', '高雄市', '', '3512', '2');
INSERT INTO `region` VALUES ('3527', '710201', '', '', '盐埕区', '3526', '3');
INSERT INTO `region` VALUES ('3528', '710202', '', '', '鼓山区', '3526', '3');
INSERT INTO `region` VALUES ('3529', '710203', '', '', '左营区', '3526', '3');
INSERT INTO `region` VALUES ('3530', '710204', '', '', '楠梓区', '3526', '3');
INSERT INTO `region` VALUES ('3531', '710205', '', '', '三民区', '3526', '3');
INSERT INTO `region` VALUES ('3532', '710206', '', '', '新兴区', '3526', '3');
INSERT INTO `region` VALUES ('3533', '710207', '', '', '前金区', '3526', '3');
INSERT INTO `region` VALUES ('3534', '710208', '', '', '苓雅区', '3526', '3');
INSERT INTO `region` VALUES ('3535', '710209', '', '', '前镇区', '3526', '3');
INSERT INTO `region` VALUES ('3536', '710210', '', '', '旗津区', '3526', '3');
INSERT INTO `region` VALUES ('3537', '710211', '', '', '小港区', '3526', '3');
INSERT INTO `region` VALUES ('3538', '710212', '', '', '凤山区', '3526', '3');
INSERT INTO `region` VALUES ('3539', '710213', '', '', '林园区', '3526', '3');
INSERT INTO `region` VALUES ('3540', '710214', '', '', '大寮区', '3526', '3');
INSERT INTO `region` VALUES ('3541', '710215', '', '', '大树区', '3526', '3');
INSERT INTO `region` VALUES ('3542', '710216', '', '', '大社区', '3526', '3');
INSERT INTO `region` VALUES ('3543', '710217', '', '', '仁武区', '3526', '3');
INSERT INTO `region` VALUES ('3544', '710218', '', '', '鸟松区', '3526', '3');
INSERT INTO `region` VALUES ('3545', '710219', '', '', '冈山区', '3526', '3');
INSERT INTO `region` VALUES ('3546', '710220', '', '', '桥头区', '3526', '3');
INSERT INTO `region` VALUES ('3547', '710221', '', '', '燕巢区', '3526', '3');
INSERT INTO `region` VALUES ('3548', '710222', '', '', '田寮区', '3526', '3');
INSERT INTO `region` VALUES ('3549', '710223', '', '', '阿莲区', '3526', '3');
INSERT INTO `region` VALUES ('3550', '710224', '', '', '路竹区', '3526', '3');
INSERT INTO `region` VALUES ('3551', '710225', '', '', '湖内区', '3526', '3');
INSERT INTO `region` VALUES ('3552', '710226', '', '', '茄萣区', '3526', '3');
INSERT INTO `region` VALUES ('3553', '710227', '', '', '永安区', '3526', '3');
INSERT INTO `region` VALUES ('3554', '710228', '', '', '弥陀区', '3526', '3');
INSERT INTO `region` VALUES ('3555', '710229', '', '', '梓官区', '3526', '3');
INSERT INTO `region` VALUES ('3556', '710230', '', '', '旗山区', '3526', '3');
INSERT INTO `region` VALUES ('3557', '710231', '', '', '美浓区', '3526', '3');
INSERT INTO `region` VALUES ('3558', '710232', '', '', '六龟区', '3526', '3');
INSERT INTO `region` VALUES ('3559', '710233', '', '', '甲仙区', '3526', '3');
INSERT INTO `region` VALUES ('3560', '710234', '', '', '杉林区', '3526', '3');
INSERT INTO `region` VALUES ('3561', '710235', '', '', '内门区', '3526', '3');
INSERT INTO `region` VALUES ('3562', '710236', '', '', '茂林区', '3526', '3');
INSERT INTO `region` VALUES ('3563', '710237', '', '', '桃源区', '3526', '3');
INSERT INTO `region` VALUES ('3564', '710238', '', '', '那玛夏区', '3526', '3');
INSERT INTO `region` VALUES ('3565', '710300', '', '基隆市', '', '3512', '2');
INSERT INTO `region` VALUES ('3566', '710301', '', '', '中正区', '3565', '3');
INSERT INTO `region` VALUES ('3567', '710302', '', '', '七堵区', '3565', '3');
INSERT INTO `region` VALUES ('3568', '710303', '', '', '暖暖区', '3565', '3');
INSERT INTO `region` VALUES ('3569', '710304', '', '', '仁爱区', '3565', '3');
INSERT INTO `region` VALUES ('3570', '710305', '', '', '中山区', '3565', '3');
INSERT INTO `region` VALUES ('3571', '710306', '', '', '安乐区', '3565', '3');
INSERT INTO `region` VALUES ('3572', '710307', '', '', '信义区', '3565', '3');
INSERT INTO `region` VALUES ('3573', '710400', '', '台中市', '', '3512', '2');
INSERT INTO `region` VALUES ('3574', '710401', '', '', '中区', '3573', '3');
INSERT INTO `region` VALUES ('3575', '710402', '', '', '东区', '3573', '3');
INSERT INTO `region` VALUES ('3576', '710403', '', '', '南区', '3573', '3');
INSERT INTO `region` VALUES ('3577', '710404', '', '', '西区', '3573', '3');
INSERT INTO `region` VALUES ('3578', '710405', '', '', '北区', '3573', '3');
INSERT INTO `region` VALUES ('3579', '710406', '', '', '西屯区', '3573', '3');
INSERT INTO `region` VALUES ('3580', '710407', '', '', '南屯区', '3573', '3');
INSERT INTO `region` VALUES ('3581', '710408', '', '', '北屯区', '3573', '3');
INSERT INTO `region` VALUES ('3582', '710409', '', '', '丰原区', '3573', '3');
INSERT INTO `region` VALUES ('3583', '710410', '', '', '东势区', '3573', '3');
INSERT INTO `region` VALUES ('3584', '710411', '', '', '大甲区', '3573', '3');
INSERT INTO `region` VALUES ('3585', '710412', '', '', '清水区', '3573', '3');
INSERT INTO `region` VALUES ('3586', '710413', '', '', '沙鹿区', '3573', '3');
INSERT INTO `region` VALUES ('3587', '710414', '', '', '梧栖区', '3573', '3');
INSERT INTO `region` VALUES ('3588', '710415', '', '', '后里区', '3573', '3');
INSERT INTO `region` VALUES ('3589', '710416', '', '', '神冈区', '3573', '3');
INSERT INTO `region` VALUES ('3590', '710417', '', '', '潭子区', '3573', '3');
INSERT INTO `region` VALUES ('3591', '710418', '', '', '大雅区', '3573', '3');
INSERT INTO `region` VALUES ('3592', '710419', '', '', '新社区', '3573', '3');
INSERT INTO `region` VALUES ('3593', '710420', '', '', '石冈区', '3573', '3');
INSERT INTO `region` VALUES ('3594', '710421', '', '', '外埔区', '3573', '3');
INSERT INTO `region` VALUES ('3595', '710422', '', '', '大安区', '3573', '3');
INSERT INTO `region` VALUES ('3596', '710423', '', '', '乌日区', '3573', '3');
INSERT INTO `region` VALUES ('3597', '710424', '', '', '大肚区', '3573', '3');
INSERT INTO `region` VALUES ('3598', '710425', '', '', '龙井区', '3573', '3');
INSERT INTO `region` VALUES ('3599', '710426', '', '', '雾峰区', '3573', '3');
INSERT INTO `region` VALUES ('3600', '710427', '', '', '太平区', '3573', '3');
INSERT INTO `region` VALUES ('3601', '710428', '', '', '大里区', '3573', '3');
INSERT INTO `region` VALUES ('3602', '710429', '', '', '和平区', '3573', '3');
INSERT INTO `region` VALUES ('3603', '710500', '', '台南市', '', '3512', '2');
INSERT INTO `region` VALUES ('3604', '710501', '', '', '东区', '3603', '3');
INSERT INTO `region` VALUES ('3605', '710502', '', '', '南区', '3603', '3');
INSERT INTO `region` VALUES ('3606', '710504', '', '', '北区', '3603', '3');
INSERT INTO `region` VALUES ('3607', '710506', '', '', '安南区', '3603', '3');
INSERT INTO `region` VALUES ('3608', '710507', '', '', '安平区', '3603', '3');
INSERT INTO `region` VALUES ('3609', '710508', '', '', '中西区', '3603', '3');
INSERT INTO `region` VALUES ('3610', '710509', '', '', '新营区', '3603', '3');
INSERT INTO `region` VALUES ('3611', '710510', '', '', '盐水区', '3603', '3');
INSERT INTO `region` VALUES ('3612', '710511', '', '', '白河区', '3603', '3');
INSERT INTO `region` VALUES ('3613', '710512', '', '', '柳营区', '3603', '3');
INSERT INTO `region` VALUES ('3614', '710513', '', '', '后壁区', '3603', '3');
INSERT INTO `region` VALUES ('3615', '710514', '', '', '东山区', '3603', '3');
INSERT INTO `region` VALUES ('3616', '710515', '', '', '麻豆区', '3603', '3');
INSERT INTO `region` VALUES ('3617', '710516', '', '', '下营区', '3603', '3');
INSERT INTO `region` VALUES ('3618', '710517', '', '', '六甲区', '3603', '3');
INSERT INTO `region` VALUES ('3619', '710518', '', '', '官田区', '3603', '3');
INSERT INTO `region` VALUES ('3620', '710519', '', '', '大内区', '3603', '3');
INSERT INTO `region` VALUES ('3621', '710520', '', '', '佳里区', '3603', '3');
INSERT INTO `region` VALUES ('3622', '710521', '', '', '学甲区', '3603', '3');
INSERT INTO `region` VALUES ('3623', '710522', '', '', '西港区', '3603', '3');
INSERT INTO `region` VALUES ('3624', '710523', '', '', '七股区', '3603', '3');
INSERT INTO `region` VALUES ('3625', '710524', '', '', '将军区', '3603', '3');
INSERT INTO `region` VALUES ('3626', '710525', '', '', '北门区', '3603', '3');
INSERT INTO `region` VALUES ('3627', '710526', '', '', '新化区', '3603', '3');
INSERT INTO `region` VALUES ('3628', '710527', '', '', '善化区', '3603', '3');
INSERT INTO `region` VALUES ('3629', '710528', '', '', '新市区', '3603', '3');
INSERT INTO `region` VALUES ('3630', '710529', '', '', '安定区', '3603', '3');
INSERT INTO `region` VALUES ('3631', '710530', '', '', '山上区', '3603', '3');
INSERT INTO `region` VALUES ('3632', '710531', '', '', '玉井区', '3603', '3');
INSERT INTO `region` VALUES ('3633', '710532', '', '', '楠西区', '3603', '3');
INSERT INTO `region` VALUES ('3634', '710533', '', '', '南化区', '3603', '3');
INSERT INTO `region` VALUES ('3635', '710534', '', '', '左镇区', '3603', '3');
INSERT INTO `region` VALUES ('3636', '710535', '', '', '仁德区', '3603', '3');
INSERT INTO `region` VALUES ('3637', '710536', '', '', '归仁区', '3603', '3');
INSERT INTO `region` VALUES ('3638', '710537', '', '', '关庙区', '3603', '3');
INSERT INTO `region` VALUES ('3639', '710538', '', '', '龙崎区', '3603', '3');
INSERT INTO `region` VALUES ('3640', '710539', '', '', '永康区', '3603', '3');
INSERT INTO `region` VALUES ('3641', '710600', '', '新竹市', '', '3512', '2');
INSERT INTO `region` VALUES ('3642', '710601', '', '', '东区', '3641', '3');
INSERT INTO `region` VALUES ('3643', '710602', '', '', '北区', '3641', '3');
INSERT INTO `region` VALUES ('3644', '710603', '', '', '香山区', '3641', '3');
INSERT INTO `region` VALUES ('3645', '710700', '', '嘉义市', '', '3512', '2');
INSERT INTO `region` VALUES ('3646', '710701', '', '', '东区', '3645', '3');
INSERT INTO `region` VALUES ('3647', '710702', '', '', '西区', '3645', '3');
INSERT INTO `region` VALUES ('3648', '710800', '', '新北市', '', '3512', '2');
INSERT INTO `region` VALUES ('3649', '710801', '', '', '板桥区', '3648', '3');
INSERT INTO `region` VALUES ('3650', '710802', '', '', '三重区', '3648', '3');
INSERT INTO `region` VALUES ('3651', '710803', '', '', '中和区', '3648', '3');
INSERT INTO `region` VALUES ('3652', '710804', '', '', '永和区', '3648', '3');
INSERT INTO `region` VALUES ('3653', '710805', '', '', '新庄区', '3648', '3');
INSERT INTO `region` VALUES ('3654', '710806', '', '', '新店区', '3648', '3');
INSERT INTO `region` VALUES ('3655', '710807', '', '', '树林区', '3648', '3');
INSERT INTO `region` VALUES ('3656', '710808', '', '', '莺歌区', '3648', '3');
INSERT INTO `region` VALUES ('3657', '710809', '', '', '三峡区', '3648', '3');
INSERT INTO `region` VALUES ('3658', '710810', '', '', '淡水区', '3648', '3');
INSERT INTO `region` VALUES ('3659', '710811', '', '', '汐止区', '3648', '3');
INSERT INTO `region` VALUES ('3660', '710812', '', '', '瑞芳区', '3648', '3');
INSERT INTO `region` VALUES ('3661', '710813', '', '', '土城区', '3648', '3');
INSERT INTO `region` VALUES ('3662', '710814', '', '', '芦洲区', '3648', '3');
INSERT INTO `region` VALUES ('3663', '710815', '', '', '五股区', '3648', '3');
INSERT INTO `region` VALUES ('3664', '710816', '', '', '泰山区', '3648', '3');
INSERT INTO `region` VALUES ('3665', '710817', '', '', '林口区', '3648', '3');
INSERT INTO `region` VALUES ('3666', '710818', '', '', '深坑区', '3648', '3');
INSERT INTO `region` VALUES ('3667', '710819', '', '', '石碇区', '3648', '3');
INSERT INTO `region` VALUES ('3668', '710820', '', '', '坪林区', '3648', '3');
INSERT INTO `region` VALUES ('3669', '710821', '', '', '三芝区', '3648', '3');
INSERT INTO `region` VALUES ('3670', '710822', '', '', '石门区', '3648', '3');
INSERT INTO `region` VALUES ('3671', '710823', '', '', '八里区', '3648', '3');
INSERT INTO `region` VALUES ('3672', '710824', '', '', '平溪区', '3648', '3');
INSERT INTO `region` VALUES ('3673', '710825', '', '', '双溪区', '3648', '3');
INSERT INTO `region` VALUES ('3674', '710826', '', '', '贡寮区', '3648', '3');
INSERT INTO `region` VALUES ('3675', '710827', '', '', '金山区', '3648', '3');
INSERT INTO `region` VALUES ('3676', '710828', '', '', '万里区', '3648', '3');
INSERT INTO `region` VALUES ('3677', '710829', '', '', '乌来区', '3648', '3');
INSERT INTO `region` VALUES ('3678', '712200', '', '宜兰县', '', '3512', '2');
INSERT INTO `region` VALUES ('3679', '712201', '', '', '宜兰市', '3678', '3');
INSERT INTO `region` VALUES ('3680', '712221', '', '', '罗东镇', '3678', '3');
INSERT INTO `region` VALUES ('3681', '712222', '', '', '苏澳镇', '3678', '3');
INSERT INTO `region` VALUES ('3682', '712223', '', '', '头城镇', '3678', '3');
INSERT INTO `region` VALUES ('3683', '712224', '', '', '礁溪乡', '3678', '3');
INSERT INTO `region` VALUES ('3684', '712225', '', '', '壮围乡', '3678', '3');
INSERT INTO `region` VALUES ('3685', '712226', '', '', '员山乡', '3678', '3');
INSERT INTO `region` VALUES ('3686', '712227', '', '', '冬山乡', '3678', '3');
INSERT INTO `region` VALUES ('3687', '712228', '', '', '五结乡', '3678', '3');
INSERT INTO `region` VALUES ('3688', '712229', '', '', '三星乡', '3678', '3');
INSERT INTO `region` VALUES ('3689', '712230', '', '', '大同乡', '3678', '3');
INSERT INTO `region` VALUES ('3690', '712231', '', '', '南澳乡', '3678', '3');
INSERT INTO `region` VALUES ('3691', '712300', '', '桃园县', '', '3512', '2');
INSERT INTO `region` VALUES ('3692', '712301', '', '', '桃园市', '3691', '3');
INSERT INTO `region` VALUES ('3693', '712302', '', '', '中坜市', '3691', '3');
INSERT INTO `region` VALUES ('3694', '712303', '', '', '平镇市', '3691', '3');
INSERT INTO `region` VALUES ('3695', '712304', '', '', '八德市', '3691', '3');
INSERT INTO `region` VALUES ('3696', '712305', '', '', '杨梅市', '3691', '3');
INSERT INTO `region` VALUES ('3697', '712321', '', '', '大溪镇', '3691', '3');
INSERT INTO `region` VALUES ('3698', '712323', '', '', '芦竹乡', '3691', '3');
INSERT INTO `region` VALUES ('3699', '712324', '', '', '大园乡', '3691', '3');
INSERT INTO `region` VALUES ('3700', '712325', '', '', '龟山乡', '3691', '3');
INSERT INTO `region` VALUES ('3701', '712327', '', '', '龙潭乡', '3691', '3');
INSERT INTO `region` VALUES ('3702', '712329', '', '', '新屋乡', '3691', '3');
INSERT INTO `region` VALUES ('3703', '712330', '', '', '观音乡', '3691', '3');
INSERT INTO `region` VALUES ('3704', '712331', '', '', '复兴乡', '3691', '3');
INSERT INTO `region` VALUES ('3705', '712400', '', '新竹县', '', '3512', '2');
INSERT INTO `region` VALUES ('3706', '712401', '', '', '竹北市', '3705', '3');
INSERT INTO `region` VALUES ('3707', '712421', '', '', '竹东镇', '3705', '3');
INSERT INTO `region` VALUES ('3708', '712422', '', '', '新埔镇', '3705', '3');
INSERT INTO `region` VALUES ('3709', '712423', '', '', '关西镇', '3705', '3');
INSERT INTO `region` VALUES ('3710', '712424', '', '', '湖口乡', '3705', '3');
INSERT INTO `region` VALUES ('3711', '712425', '', '', '新丰乡', '3705', '3');
INSERT INTO `region` VALUES ('3712', '712426', '', '', '芎林乡', '3705', '3');
INSERT INTO `region` VALUES ('3713', '712427', '', '', '橫山乡', '3705', '3');
INSERT INTO `region` VALUES ('3714', '712428', '', '', '北埔乡', '3705', '3');
INSERT INTO `region` VALUES ('3715', '712429', '', '', '宝山乡', '3705', '3');
INSERT INTO `region` VALUES ('3716', '712430', '', '', '峨眉乡', '3705', '3');
INSERT INTO `region` VALUES ('3717', '712431', '', '', '尖石乡', '3705', '3');
INSERT INTO `region` VALUES ('3718', '712432', '', '', '五峰乡', '3705', '3');
INSERT INTO `region` VALUES ('3719', '712500', '', '苗栗县', '', '3512', '2');
INSERT INTO `region` VALUES ('3720', '712501', '', '', '苗栗市', '3719', '3');
INSERT INTO `region` VALUES ('3721', '712521', '', '', '苑里镇', '3719', '3');
INSERT INTO `region` VALUES ('3722', '712522', '', '', '通霄镇', '3719', '3');
INSERT INTO `region` VALUES ('3723', '712523', '', '', '竹南镇', '3719', '3');
INSERT INTO `region` VALUES ('3724', '712524', '', '', '头份镇', '3719', '3');
INSERT INTO `region` VALUES ('3725', '712525', '', '', '后龙镇', '3719', '3');
INSERT INTO `region` VALUES ('3726', '712526', '', '', '卓兰镇', '3719', '3');
INSERT INTO `region` VALUES ('3727', '712527', '', '', '大湖乡', '3719', '3');
INSERT INTO `region` VALUES ('3728', '712528', '', '', '公馆乡', '3719', '3');
INSERT INTO `region` VALUES ('3729', '712529', '', '', '铜锣乡', '3719', '3');
INSERT INTO `region` VALUES ('3730', '712530', '', '', '南庄乡', '3719', '3');
INSERT INTO `region` VALUES ('3731', '712531', '', '', '头屋乡', '3719', '3');
INSERT INTO `region` VALUES ('3732', '712532', '', '', '三义乡', '3719', '3');
INSERT INTO `region` VALUES ('3733', '712533', '', '', '西湖乡', '3719', '3');
INSERT INTO `region` VALUES ('3734', '712534', '', '', '造桥乡', '3719', '3');
INSERT INTO `region` VALUES ('3735', '712535', '', '', '三湾乡', '3719', '3');
INSERT INTO `region` VALUES ('3736', '712536', '', '', '狮潭乡', '3719', '3');
INSERT INTO `region` VALUES ('3737', '712537', '', '', '泰安乡', '3719', '3');
INSERT INTO `region` VALUES ('3738', '712700', '', '彰化县', '', '3512', '2');
INSERT INTO `region` VALUES ('3739', '712701', '', '', '彰化市', '3738', '3');
INSERT INTO `region` VALUES ('3740', '712721', '', '', '鹿港镇', '3738', '3');
INSERT INTO `region` VALUES ('3741', '712722', '', '', '和美镇', '3738', '3');
INSERT INTO `region` VALUES ('3742', '712723', '', '', '线西乡', '3738', '3');
INSERT INTO `region` VALUES ('3743', '712724', '', '', '伸港乡', '3738', '3');
INSERT INTO `region` VALUES ('3744', '712725', '', '', '福兴乡', '3738', '3');
INSERT INTO `region` VALUES ('3745', '712726', '', '', '秀水乡', '3738', '3');
INSERT INTO `region` VALUES ('3746', '712727', '', '', '花坛乡', '3738', '3');
INSERT INTO `region` VALUES ('3747', '712728', '', '', '芬园乡', '3738', '3');
INSERT INTO `region` VALUES ('3748', '712729', '', '', '员林镇', '3738', '3');
INSERT INTO `region` VALUES ('3749', '712730', '', '', '溪湖镇', '3738', '3');
INSERT INTO `region` VALUES ('3750', '712731', '', '', '田中镇', '3738', '3');
INSERT INTO `region` VALUES ('3751', '712732', '', '', '大村乡', '3738', '3');
INSERT INTO `region` VALUES ('3752', '712733', '', '', '埔盐乡', '3738', '3');
INSERT INTO `region` VALUES ('3753', '712734', '', '', '埔心乡', '3738', '3');
INSERT INTO `region` VALUES ('3754', '712735', '', '', '永靖乡', '3738', '3');
INSERT INTO `region` VALUES ('3755', '712736', '', '', '社头乡', '3738', '3');
INSERT INTO `region` VALUES ('3756', '712737', '', '', '二水乡', '3738', '3');
INSERT INTO `region` VALUES ('3757', '712738', '', '', '北斗镇', '3738', '3');
INSERT INTO `region` VALUES ('3758', '712739', '', '', '二林镇', '3738', '3');
INSERT INTO `region` VALUES ('3759', '712740', '', '', '田尾乡', '3738', '3');
INSERT INTO `region` VALUES ('3760', '712741', '', '', '埤头乡', '3738', '3');
INSERT INTO `region` VALUES ('3761', '712742', '', '', '芳苑乡', '3738', '3');
INSERT INTO `region` VALUES ('3762', '712743', '', '', '大城乡', '3738', '3');
INSERT INTO `region` VALUES ('3763', '712744', '', '', '竹塘乡', '3738', '3');
INSERT INTO `region` VALUES ('3764', '712745', '', '', '溪州乡', '3738', '3');
INSERT INTO `region` VALUES ('3765', '712800', '', '南投县', '', '3512', '2');
INSERT INTO `region` VALUES ('3766', '712801', '', '', '南投市', '3765', '3');
INSERT INTO `region` VALUES ('3767', '712821', '', '', '埔里镇', '3765', '3');
INSERT INTO `region` VALUES ('3768', '712822', '', '', '草屯镇', '3765', '3');
INSERT INTO `region` VALUES ('3769', '712823', '', '', '竹山镇', '3765', '3');
INSERT INTO `region` VALUES ('3770', '712824', '', '', '集集镇', '3765', '3');
INSERT INTO `region` VALUES ('3771', '712825', '', '', '名间乡', '3765', '3');
INSERT INTO `region` VALUES ('3772', '712826', '', '', '鹿谷乡', '3765', '3');
INSERT INTO `region` VALUES ('3773', '712827', '', '', '中寮乡', '3765', '3');
INSERT INTO `region` VALUES ('3774', '712828', '', '', '鱼池乡', '3765', '3');
INSERT INTO `region` VALUES ('3775', '712829', '', '', '国姓乡', '3765', '3');
INSERT INTO `region` VALUES ('3776', '712830', '', '', '水里乡', '3765', '3');
INSERT INTO `region` VALUES ('3777', '712831', '', '', '信义乡', '3765', '3');
INSERT INTO `region` VALUES ('3778', '712832', '', '', '仁爱乡', '3765', '3');
INSERT INTO `region` VALUES ('3779', '712900', '', '云林县', '', '3512', '2');
INSERT INTO `region` VALUES ('3780', '712901', '', '', '斗六市', '3779', '3');
INSERT INTO `region` VALUES ('3781', '712921', '', '', '斗南镇', '3779', '3');
INSERT INTO `region` VALUES ('3782', '712922', '', '', '虎尾镇', '3779', '3');
INSERT INTO `region` VALUES ('3783', '712923', '', '', '西螺镇', '3779', '3');
INSERT INTO `region` VALUES ('3784', '712924', '', '', '土库镇', '3779', '3');
INSERT INTO `region` VALUES ('3785', '712925', '', '', '北港镇', '3779', '3');
INSERT INTO `region` VALUES ('3786', '712926', '', '', '古坑乡', '3779', '3');
INSERT INTO `region` VALUES ('3787', '712927', '', '', '大埤乡', '3779', '3');
INSERT INTO `region` VALUES ('3788', '712928', '', '', '莿桐乡', '3779', '3');
INSERT INTO `region` VALUES ('3789', '712929', '', '', '林内乡', '3779', '3');
INSERT INTO `region` VALUES ('3790', '712930', '', '', '二仑乡', '3779', '3');
INSERT INTO `region` VALUES ('3791', '712931', '', '', '仑背乡', '3779', '3');
INSERT INTO `region` VALUES ('3792', '712932', '', '', '麦寮乡', '3779', '3');
INSERT INTO `region` VALUES ('3793', '712933', '', '', '东势乡', '3779', '3');
INSERT INTO `region` VALUES ('3794', '712934', '', '', '褒忠乡', '3779', '3');
INSERT INTO `region` VALUES ('3795', '712935', '', '', '台西乡', '3779', '3');
INSERT INTO `region` VALUES ('3796', '712936', '', '', '元长乡', '3779', '3');
INSERT INTO `region` VALUES ('3797', '712937', '', '', '四湖乡', '3779', '3');
INSERT INTO `region` VALUES ('3798', '712938', '', '', '口湖乡', '3779', '3');
INSERT INTO `region` VALUES ('3799', '712939', '', '', '水林乡', '3779', '3');
INSERT INTO `region` VALUES ('3800', '713000', '', '嘉义县', '', '3512', '2');
INSERT INTO `region` VALUES ('3801', '713001', '', '', '太保市', '3800', '3');
INSERT INTO `region` VALUES ('3802', '713002', '', '', '朴子市', '3800', '3');
INSERT INTO `region` VALUES ('3803', '713023', '', '', '布袋镇', '3800', '3');
INSERT INTO `region` VALUES ('3804', '713024', '', '', '大林镇', '3800', '3');
INSERT INTO `region` VALUES ('3805', '713025', '', '', '民雄乡', '3800', '3');
INSERT INTO `region` VALUES ('3806', '713026', '', '', '溪口乡', '3800', '3');
INSERT INTO `region` VALUES ('3807', '713027', '', '', '新港乡', '3800', '3');
INSERT INTO `region` VALUES ('3808', '713028', '', '', '六脚乡', '3800', '3');
INSERT INTO `region` VALUES ('3809', '713029', '', '', '东石乡', '3800', '3');
INSERT INTO `region` VALUES ('3810', '713030', '', '', '义竹乡', '3800', '3');
INSERT INTO `region` VALUES ('3811', '713031', '', '', '鹿草乡', '3800', '3');
INSERT INTO `region` VALUES ('3812', '713032', '', '', '水上乡', '3800', '3');
INSERT INTO `region` VALUES ('3813', '713033', '', '', '中埔乡', '3800', '3');
INSERT INTO `region` VALUES ('3814', '713034', '', '', '竹崎乡', '3800', '3');
INSERT INTO `region` VALUES ('3815', '713035', '', '', '梅山乡', '3800', '3');
INSERT INTO `region` VALUES ('3816', '713036', '', '', '番路乡', '3800', '3');
INSERT INTO `region` VALUES ('3817', '713037', '', '', '大埔乡', '3800', '3');
INSERT INTO `region` VALUES ('3818', '713038', '', '', '阿里山乡', '3800', '3');
INSERT INTO `region` VALUES ('3819', '713300', '', '屏东县', '', '3512', '2');
INSERT INTO `region` VALUES ('3820', '713301', '', '', '屏东市', '3819', '3');
INSERT INTO `region` VALUES ('3821', '713321', '', '', '潮州镇', '3819', '3');
INSERT INTO `region` VALUES ('3822', '713322', '', '', '东港镇', '3819', '3');
INSERT INTO `region` VALUES ('3823', '713323', '', '', '恒春镇', '3819', '3');
INSERT INTO `region` VALUES ('3824', '713324', '', '', '万丹乡', '3819', '3');
INSERT INTO `region` VALUES ('3825', '713325', '', '', '长治乡', '3819', '3');
INSERT INTO `region` VALUES ('3826', '713326', '', '', '麟洛乡', '3819', '3');
INSERT INTO `region` VALUES ('3827', '713327', '', '', '九如乡', '3819', '3');
INSERT INTO `region` VALUES ('3828', '713328', '', '', '里港乡', '3819', '3');
INSERT INTO `region` VALUES ('3829', '713329', '', '', '盐埔乡', '3819', '3');
INSERT INTO `region` VALUES ('3830', '713330', '', '', '高树乡', '3819', '3');
INSERT INTO `region` VALUES ('3831', '713331', '', '', '万峦乡', '3819', '3');
INSERT INTO `region` VALUES ('3832', '713332', '', '', '内埔乡', '3819', '3');
INSERT INTO `region` VALUES ('3833', '713333', '', '', '竹田乡', '3819', '3');
INSERT INTO `region` VALUES ('3834', '713334', '', '', '新埤乡', '3819', '3');
INSERT INTO `region` VALUES ('3835', '713335', '', '', '枋寮乡', '3819', '3');
INSERT INTO `region` VALUES ('3836', '713336', '', '', '新园乡', '3819', '3');
INSERT INTO `region` VALUES ('3837', '713337', '', '', '崁顶乡', '3819', '3');
INSERT INTO `region` VALUES ('3838', '713338', '', '', '林边乡', '3819', '3');
INSERT INTO `region` VALUES ('3839', '713339', '', '', '南州乡', '3819', '3');
INSERT INTO `region` VALUES ('3840', '713340', '', '', '佳冬乡', '3819', '3');
INSERT INTO `region` VALUES ('3841', '713341', '', '', '琉球乡', '3819', '3');
INSERT INTO `region` VALUES ('3842', '713342', '', '', '车城乡', '3819', '3');
INSERT INTO `region` VALUES ('3843', '713343', '', '', '满州乡', '3819', '3');
INSERT INTO `region` VALUES ('3844', '713344', '', '', '枋山乡', '3819', '3');
INSERT INTO `region` VALUES ('3845', '713345', '', '', '三地门乡', '3819', '3');
INSERT INTO `region` VALUES ('3846', '713346', '', '', '雾台乡', '3819', '3');
INSERT INTO `region` VALUES ('3847', '713347', '', '', '玛家乡', '3819', '3');
INSERT INTO `region` VALUES ('3848', '713348', '', '', '泰武乡', '3819', '3');
INSERT INTO `region` VALUES ('3849', '713349', '', '', '来义乡', '3819', '3');
INSERT INTO `region` VALUES ('3850', '713350', '', '', '春日乡', '3819', '3');
INSERT INTO `region` VALUES ('3851', '713351', '', '', '狮子乡', '3819', '3');
INSERT INTO `region` VALUES ('3852', '713352', '', '', '牡丹乡', '3819', '3');
INSERT INTO `region` VALUES ('3853', '713400', '', '台东县', '', '3512', '2');
INSERT INTO `region` VALUES ('3854', '713401', '', '', '台东市', '3853', '3');
INSERT INTO `region` VALUES ('3855', '713421', '', '', '成功镇', '3853', '3');
INSERT INTO `region` VALUES ('3856', '713422', '', '', '关山镇', '3853', '3');
INSERT INTO `region` VALUES ('3857', '713423', '', '', '卑南乡', '3853', '3');
INSERT INTO `region` VALUES ('3858', '713424', '', '', '鹿野乡', '3853', '3');
INSERT INTO `region` VALUES ('3859', '713425', '', '', '池上乡', '3853', '3');
INSERT INTO `region` VALUES ('3860', '713426', '', '', '东河乡', '3853', '3');
INSERT INTO `region` VALUES ('3861', '713427', '', '', '长滨乡', '3853', '3');
INSERT INTO `region` VALUES ('3862', '713428', '', '', '太麻里乡', '3853', '3');
INSERT INTO `region` VALUES ('3863', '713429', '', '', '大武乡', '3853', '3');
INSERT INTO `region` VALUES ('3864', '713430', '', '', '绿岛乡', '3853', '3');
INSERT INTO `region` VALUES ('3865', '713431', '', '', '海端乡', '3853', '3');
INSERT INTO `region` VALUES ('3866', '713432', '', '', '延平乡', '3853', '3');
INSERT INTO `region` VALUES ('3867', '713433', '', '', '金峰乡', '3853', '3');
INSERT INTO `region` VALUES ('3868', '713434', '', '', '达仁乡', '3853', '3');
INSERT INTO `region` VALUES ('3869', '713435', '', '', '兰屿乡', '3853', '3');
INSERT INTO `region` VALUES ('3870', '713500', '', '花莲县', '', '3512', '2');
INSERT INTO `region` VALUES ('3871', '713501', '', '', '花莲市', '3870', '3');
INSERT INTO `region` VALUES ('3872', '713521', '', '', '凤林镇', '3870', '3');
INSERT INTO `region` VALUES ('3873', '713522', '', '', '玉里镇', '3870', '3');
INSERT INTO `region` VALUES ('3874', '713523', '', '', '新城乡', '3870', '3');
INSERT INTO `region` VALUES ('3875', '713524', '', '', '吉安乡', '3870', '3');
INSERT INTO `region` VALUES ('3876', '713525', '', '', '寿丰乡', '3870', '3');
INSERT INTO `region` VALUES ('3877', '713526', '', '', '光复乡', '3870', '3');
INSERT INTO `region` VALUES ('3878', '713527', '', '', '丰滨乡', '3870', '3');
INSERT INTO `region` VALUES ('3879', '713528', '', '', '瑞穗乡', '3870', '3');
INSERT INTO `region` VALUES ('3880', '713529', '', '', '富里乡', '3870', '3');
INSERT INTO `region` VALUES ('3881', '713530', '', '', '秀林乡', '3870', '3');
INSERT INTO `region` VALUES ('3882', '713531', '', '', '万荣乡', '3870', '3');
INSERT INTO `region` VALUES ('3883', '713532', '', '', '卓溪乡', '3870', '3');
INSERT INTO `region` VALUES ('3884', '713600', '', '澎湖县', '', '3512', '2');
INSERT INTO `region` VALUES ('3885', '713601', '', '', '马公市', '3884', '3');
INSERT INTO `region` VALUES ('3886', '713621', '', '', '湖西乡', '3884', '3');
INSERT INTO `region` VALUES ('3887', '713622', '', '', '白沙乡', '3884', '3');
INSERT INTO `region` VALUES ('3888', '713623', '', '', '西屿乡', '3884', '3');
INSERT INTO `region` VALUES ('3889', '713624', '', '', '望安乡', '3884', '3');
INSERT INTO `region` VALUES ('3890', '713625', '', '', '七美乡', '3884', '3');
INSERT INTO `region` VALUES ('3891', '810000', '香港特别行政区', '', '', '1', '2');
INSERT INTO `region` VALUES ('3892', '810100', '', '香港岛', '', '3891', '2');
INSERT INTO `region` VALUES ('3893', '810101', '', '', '中西区', '3892', '3');
INSERT INTO `region` VALUES ('3894', '810102', '', '', '湾仔区', '3892', '3');
INSERT INTO `region` VALUES ('3895', '810103', '', '', '东区', '3892', '3');
INSERT INTO `region` VALUES ('3896', '810104', '', '', '南区', '3892', '3');
INSERT INTO `region` VALUES ('3897', '810200', '', '九龙', '', '3891', '2');
INSERT INTO `region` VALUES ('3898', '810201', '', '', '油尖旺区', '3897', '3');
INSERT INTO `region` VALUES ('3899', '810202', '', '', '深水埗区', '3897', '3');
INSERT INTO `region` VALUES ('3900', '810203', '', '', '九龙城区', '3897', '3');
INSERT INTO `region` VALUES ('3901', '810204', '', '', '黄大仙区', '3897', '3');
INSERT INTO `region` VALUES ('3902', '810205', '', '', '观塘区', '3897', '3');
INSERT INTO `region` VALUES ('3903', '810300', '', '新界', '', '3891', '2');
INSERT INTO `region` VALUES ('3904', '810301', '', '', '荃湾区', '3903', '3');
INSERT INTO `region` VALUES ('3905', '810302', '', '', '屯门区', '3903', '3');
INSERT INTO `region` VALUES ('3906', '810303', '', '', '元朗区', '3903', '3');
INSERT INTO `region` VALUES ('3907', '810304', '', '', '北区', '3903', '3');
INSERT INTO `region` VALUES ('3908', '810305', '', '', '大埔区', '3903', '3');
INSERT INTO `region` VALUES ('3909', '810306', '', '', '西贡区', '3903', '3');
INSERT INTO `region` VALUES ('3910', '810307', '', '', '沙田区', '3903', '3');
INSERT INTO `region` VALUES ('3911', '810308', '', '', '葵青区', '3903', '3');
INSERT INTO `region` VALUES ('3912', '810309', '', '', '离岛区', '3903', '3');
INSERT INTO `region` VALUES ('3913', '820000', '澳门特别行政区', '', '', '1', '2');
INSERT INTO `region` VALUES ('3914', '820100', '', '澳门半岛', '', '3913', '2');
INSERT INTO `region` VALUES ('3915', '820101', '', '', '花地玛堂区', '3914', '3');
INSERT INTO `region` VALUES ('3916', '820102', '', '', '圣安多尼堂区', '3914', '3');
INSERT INTO `region` VALUES ('3917', '820103', '', '', '大堂区', '3914', '3');
INSERT INTO `region` VALUES ('3918', '820104', '', '', '望德堂区', '3914', '3');
INSERT INTO `region` VALUES ('3919', '820105', '', '', '风顺堂区', '3914', '3');
INSERT INTO `region` VALUES ('3920', '820200', '', '氹仔岛', '', '3913', '2');
INSERT INTO `region` VALUES ('3921', '820201', '', '', '嘉模堂区', '3920', '3');
INSERT INTO `region` VALUES ('3922', '820300', '', '路环岛', '', '3913', '2');
INSERT INTO `region` VALUES ('3923', '820301', '', '', '圣方济各堂区', '3922', '3');

-- ----------------------------
-- Table structure for skilled
-- ----------------------------
DROP TABLE IF EXISTS `skilled`;
CREATE TABLE `skilled` (
  `id` varchar(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT '擅长 名称',
  `create_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `enable` int(11) DEFAULT '1' COMMENT '1 可用 0 不可用'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of skilled
-- ----------------------------
INSERT INTO `skilled` VALUES ('1', '吉他', '2017-11-27 21:57:14', '1');
INSERT INTO `skilled` VALUES ('2', '钢琴', '2017-11-27 21:57:25', '1');
INSERT INTO `skilled` VALUES ('3', '小提琴', '2017-11-27 21:57:33', '1');
INSERT INTO `skilled` VALUES ('4', '电子乐', '2017-11-27 21:58:43', '1');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` varchar(50) DEFAULT NULL,
  `payment` decimal(10,0) DEFAULT NULL COMMENT '支付金额  精确小数点后两位',
  `payment_type` int(11) DEFAULT NULL COMMENT '支付类型 1 余额支付 2 微信支付 3 支付宝支付',
  `post_fee` decimal(10,0) DEFAULT NULL COMMENT '邮费',
  `status` int(11) DEFAULT NULL COMMENT '状态 1 未付款 2 已付款 3 未发货 4 已发货 5 交易关闭 6交易完成 7 退款中 8 退款完成 9 拒绝退款',
  `create_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '订单创建时间',
  `update_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '订单更新时间',
  `payment_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '付款时间',
  `consign_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '发货时间',
  `end_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '交易完成时间',
  `close_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '交易关闭时间',
  `user_id` varchar(50) DEFAULT NULL,
  `buyer_message` varchar(255) DEFAULT NULL COMMENT '买家留言',
  `buyer_nick` varchar(255) DEFAULT NULL COMMENT '买家昵称',
  `buyer_rate` int(11) DEFAULT '1' COMMENT '买家是否评价 1 未评价 0 评价'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES ('4C59AD83F268E320B083', '1001', null, '15', '7', '2017-11-21 22:24:50', '2017-11-21 22:24:50', '2017-11-21 22:24:50', '2017-11-21 22:24:50', '2017-11-21 22:24:50', '2017-11-21 22:24:50', '1', '尽快发货', '尽快 ', '0');
INSERT INTO `t_order` VALUES ('43DFB52E71A27D5C4BBB', '1001', null, '15', '1', '2017-11-16 23:06:56', null, null, null, null, null, '1', '尽快发货', '尽快 ', '0');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `status` int(1) DEFAULT '1' COMMENT '1 可用 0 限制用户',
  `regist_ip` varchar(50) DEFAULT NULL,
  `regist_date` datetime DEFAULT NULL,
  `login_ip` varchar(50) DEFAULT NULL,
  `login_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `login_count` int(10) DEFAULT '0',
  `role_state` int(2) DEFAULT NULL COMMENT '0 普通用户 1 审核中用户 2 普通老师 5 平台自动生成用户 6平台自动老师',
  `regist_way` int(2) DEFAULT NULL COMMENT '0 微信注册  1手机注册  5 平台注册',
  `head_img` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `sign` varchar(1000) DEFAULT NULL COMMENT '个性签名',
  `nick_name` varchar(255) DEFAULT NULL COMMENT '昵称',
  `del_flag` int(1) DEFAULT '1' COMMENT '1 未删除  0 删除',
  `sex` tinyint(4) DEFAULT '1' COMMENT '性别 1男 0女'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'hashiqi2', '123456', '15528396284', '1', '127.0.0.1', '2017-11-05 00:00:00', '127.0.0.01', '2017-12-03 16:07:34', '1', '5', '5', 'http://crazymusic-bucket.oss-cn-shenzhen.aliyuncs.com/a71454a42.png', '123123', '我是老王', '0', '1');
INSERT INTO `user` VALUES ('9059EC344BC440948483617EBC708CE4', 'hashiqi1', '123123', '1231231231', '1', null, '2017-11-05 19:38:05', null, '2017-12-03 16:07:34', null, '5', '5', 'http://crazymusic-bucket.oss-cn-shenzhen.aliyuncs.com/2cfe26cb3.png', '1231231', '123123', '1', '1');
INSERT INTO `user` VALUES ('4194AC3D94918B942655', null, null, '15884770917', '1', '127.0.0.1', '2017-11-30 20:32:15', null, null, '0', '0', '1', '', '这个人很懒，什么都没留下。', '帅哥_1512045135491', '1', '1');
INSERT INTO `user` VALUES ('49369D91F4EAA050E0C3', null, '123456', '15528396283', '1', '127.0.0.1', '2017-12-03 10:09:28', null, '2017-12-03 10:10:15', '2', '0', '1', '', '这个人很懒，什么都没留下。', '帅哥_15122669', '1', '1');

-- ----------------------------
-- Table structure for user_confirm_addr
-- ----------------------------
DROP TABLE IF EXISTS `user_confirm_addr`;
CREATE TABLE `user_confirm_addr` (
  `id` varchar(50) DEFAULT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `province` varchar(100) DEFAULT NULL,
  `province_code` varchar(10) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `city_code` varchar(10) DEFAULT NULL,
  `district` varchar(100) DEFAULT NULL,
  `district_code` varchar(10) DEFAULT NULL,
  `is_default` tinyint(4) DEFAULT NULL COMMENT '1 表示默认  0 表示非默认',
  `create_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(100) DEFAULT NULL COMMENT '收货人姓名',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_confirm_addr
-- ----------------------------

-- ----------------------------
-- Table structure for user_coupon
-- ----------------------------
DROP TABLE IF EXISTS `user_coupon`;
CREATE TABLE `user_coupon` (
  `id` varchar(50) DEFAULT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `coupon_id` varchar(50) DEFAULT NULL COMMENT '优惠券id',
  `create_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `state` tinyint(4) DEFAULT '1' COMMENT '使用状态 1 未使用 0 已使用'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_coupon
-- ----------------------------

-- ----------------------------
-- Table structure for user_region
-- ----------------------------
DROP TABLE IF EXISTS `user_region`;
CREATE TABLE `user_region` (
  `id` varchar(50) DEFAULT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `province_code` varchar(10) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `city_code` varchar(10) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `district_code` varchar(10) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_region
-- ----------------------------
INSERT INTO `user_region` VALUES ('414197340A385E906A4F', '1', 'sc', '123456', 'cd', '123', 'whq', '1234', '2017-12-03 10:13:38');

-- ----------------------------
-- Table structure for user_skilled
-- ----------------------------
DROP TABLE IF EXISTS `user_skilled`;
CREATE TABLE `user_skilled` (
  `id` varchar(50) DEFAULT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `skilled_id` varchar(50) DEFAULT NULL COMMENT '技能id',
  `create_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_skilled
-- ----------------------------

-- ----------------------------
-- Function structure for getChildList
-- ----------------------------
DROP FUNCTION IF EXISTS `getChildList`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getChildList`(rootId varchar(100)) RETURNS varchar(2000) CHARSET utf8
BEGIN   
DECLARE str varchar(2000);  
DECLARE cid varchar(100);   
SET str = '$';   
SET cid = rootId;   
WHILE cid is not null DO   
    SET str = concat(str, ',', cid);   
    SELECT group_concat(id) INTO cid FROM community_evaluate where FIND_IN_SET(parent_id, cid) > 0;   
END WHILE;   
RETURN str;   
END
;;
DELIMITER ;
