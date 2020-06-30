/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : localhost:3306
 Source Schema         : secondarmarket

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 30/06/2020 11:54:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(10) NOT NULL,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `telephone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `role` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', '123456', '17790792756', '管理员');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `cid` int(10) NOT NULL AUTO_INCREMENT,
  `cname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '闲置数码', 0);
INSERT INTO `category` VALUES (2, '校园代步', 1);
INSERT INTO `category` VALUES (3, '美妆衣物', 1);
INSERT INTO `category` VALUES (4, '图书教材', 1);
INSERT INTO `category` VALUES (5, '电器日用', 1);
INSERT INTO `category` VALUES (6, '运动棋牌', 1);
INSERT INTO `category` VALUES (7, '票券小物', 1);
INSERT INTO `category` VALUES (8, '童装玩具', 1);

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论主键',
  `user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户，外键',
  `pid` int(11) NULL DEFAULT NULL COMMENT '商品，外键',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论内容',
  `create_at` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `comments_product_fk`(`pid`) USING BTREE,
  INDEX `comments_user_fk`(`user_id`) USING BTREE,
  CONSTRAINT `comments_product_fk` FOREIGN KEY (`pid`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_user_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 145 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES (138, '13C5F5E668FE4974A1C6F9159E70C19A', 8, '79978465654', '2019-10-06 13:38:22');
INSERT INTO `comments` VALUES (139, '13C5F5E668FE4974A1C6F9159E70C19A', 8, '7997846565dsaasd4', '2019-10-06 13:40:18');
INSERT INTO `comments` VALUES (142, '13C5F5E668FE4974A1C6F9159E70C19A', 120, 'asddassaddas', '2019-10-19 20:55:37');
INSERT INTO `comments` VALUES (144, '13C5F5E668FE4974A1C6F9159E70C19A', 105, '奥术大师大所多撒', '2019-10-28 23:22:12');

-- ----------------------------
-- Table structure for concern
-- ----------------------------
DROP TABLE IF EXISTS `concern`;
CREATE TABLE `concern`  (
  `mid` int(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`mid`) USING BTREE,
  INDEX `concern_product_fk`(`pid`) USING BTREE,
  INDEX `concern_users_fk`(`user_id`) USING BTREE,
  CONSTRAINT `concern_product_fk` FOREIGN KEY (`pid`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `concern_users_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of concern
-- ----------------------------
INSERT INTO `concern` VALUES (60, '605EE4F481D046B187EDB9B7BDE66F1F', 16);
INSERT INTO `concern` VALUES (61, '605EE4F481D046B187EDB9B7BDE66F1F', 13);

-- ----------------------------
-- Table structure for deleteproduct
-- ----------------------------
DROP TABLE IF EXISTS `deleteproduct`;
CREATE TABLE `deleteproduct`  (
  `dpid` int(10) NOT NULL AUTO_INCREMENT,
  `pid` int(10) NULL DEFAULT NULL,
  `cid` int(10) NULL DEFAULT NULL,
  `user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `image` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` float(11, 2) NULL DEFAULT NULL,
  `start_time` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `describle` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`dpid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for needs
-- ----------------------------
DROP TABLE IF EXISTS `needs`;
CREATE TABLE `needs`  (
  `nid` int(20) NOT NULL AUTO_INCREMENT,
  `nmessage` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pubdate` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`nid`) USING BTREE,
  INDEX `needs_user_fk`(`uid`) USING BTREE,
  CONSTRAINT `needs_user_fk` FOREIGN KEY (`uid`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of needs
-- ----------------------------
INSERT INTO `needs` VALUES (1, '有没有好用的二手苹果手机呢', '13C5F5E668FE4974A1C6F9159E70C19A', '2019-10-07 10:07:50');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `oid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pprice` float(11, 2) NULL DEFAULT NULL,
  `pimage` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_price` float(20, 0) NULL DEFAULT NULL,
  `buy_uid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sell_uid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dealdate` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dealAddress` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_state` int(10) NOT NULL,
  PRIMARY KEY (`oid`) USING BTREE,
  INDEX `_product_user`(`pname`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('8C43B5A7B7D046A8849267F07ADAAECF', 'Thinkpad笔记本', 1600.00, 'nopic20.png', 1600, '605EE4F481D046B187EDB9B7BDE66F1F', '13C5F5E668FE4974A1C6F9159E70C19A', '2019年10月10号下午三点', '2019-11-27 18:21:32', '科技楼', 0);
INSERT INTO `orders` VALUES ('9AC93F4756BC4049B7E37A2C0E0D5FD8', '大学生用计算器。', 10.00, '599629aa-9440-435c-8185-42e34a862470.jpg', 10, '13C5F5E668FE4974A1C6F9159E70C19A', '1723C981AD1548C992C0F8FDFE365087', '2019年10月10号下午三点', '2019-11-16 08:49:14', '科技楼', 0);
INSERT INTO `orders` VALUES ('AC2D86A66F1F453B8D3E53CBAD6A3685', '168元出售全新自行车', 168.00, 'e62acc43-8122-421a-940b-a68e6aeadd30.jpg', 168, '13C5F5E668FE4974A1C6F9159E70C19A', 'E59512878FA0452C9B58D97277F8B8AF', '2019年10月10号下午三点', '2019-11-16 00:52:24', '科技楼', 2);
INSERT INTO `orders` VALUES ('DECA60A590F84D30A3425727E153E919', '耐克运动书包', 520.00, 'nopic16.png', 520, '605EE4F481D046B187EDB9B7BDE66F1F', '13C5F5E668FE4974A1C6F9159E70C19A', '2019年10月10号下午三点', '2019-11-16 09:20:16', '科技楼', 2);

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品主键',
  `caid` int(11) NULL DEFAULT NULL COMMENT '商品分类，外键',
  `user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户外键',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `image` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `price` float(11, 2) NULL DEFAULT NULL COMMENT '出售价格',
  `start_time` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发布时间',
  `describle` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细信息',
  `status` int(11) NULL DEFAULT 1 COMMENT '状态 上架1 下架0',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `catelog_id`(`caid`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `id`(`id`, `user_id`) USING BTREE,
  CONSTRAINT `fk_ca_product` FOREIGN KEY (`caid`) REFERENCES `category` (`cid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_user_product` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 122 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 6, '0F84E3048F5546A58C8EFE52263D2A83', '精美吉他', 'nopic1.png', 130.00, '2019-05-13', '自用二手吉他，9成新，低价出售，有意者联系。', 0);
INSERT INTO `products` VALUES (2, 2, '0F84E3048F5546A58C8EFE52263D2A83', '山地车', 'nopic2.png', 1520.00, '2019-05-13', '八成新山地车，无损坏，喜欢Call我。', 1);
INSERT INTO `products` VALUES (3, 5, '0F84E3048F5546A58C8EFE52263D2A83', '无线鼠标', 'nopic3.png', 23.00, '2019-05-13', '罗技无线鼠标，自用一个月，9成新，手感好，反应灵敏。', 1);
INSERT INTO `products` VALUES (5, 4, '13C5F5E668FE4974A1C6F9159E70C19A', '数码相机', 'nopic5.png', 690.00, '2019-05-14', '自用的数码相机，一年前购买，非常爱好，无磕碰。可议价。', 1);
INSERT INTO `products` VALUES (7, 5, '0F84E3048F5546A58C8EFE52263D2A83', '收纳盒', 'nopic7.png', 15.00, '2019-05-14', '3层塑料物品收纳盒，毕业了，低价出售。', 1);
INSERT INTO `products` VALUES (8, 5, 'E59512878FA0452C9B58D97277F8B8AF', '台灯', 'nopic8.png', 32.00, '2019-05-14', '考研时购买的台灯，可插USB接口。', 1);
INSERT INTO `products` VALUES (9, 3, '0F84E3048F5546A58C8EFE52263D2A83', '女鞋', 'nopic9.png', 35.00, '2019-05-14', '学生女鞋', 1);
INSERT INTO `products` VALUES (13, 3, '0F84E3048F5546A58C8EFE52263D2A83', '手提包', 'nopic13.png', 15.00, '2019-05-14', '自用手提包，8成新，便宜出。', 1);
INSERT INTO `products` VALUES (16, 3, '13C5F5E668FE4974A1C6F9159E70C19A', '耐克运动书包', 'nopic16.png', 520.00, '2019-05-14', '去年年底购买的耐克书包，8成新，无损坏，可以装电脑，很漂亮，有意者联系。', 0);
INSERT INTO `products` VALUES (17, 4, '13C5F5E668FE4974A1C6F9159E70C19A', '二手小说', 'nopic17.png', 10.00, '2019-05-14', '毕业季，一书架小说，便宜出售。', 1);
INSERT INTO `products` VALUES (18, 4, '13C5F5E668FE4974A1C6F9159E70C19A', '公务员考试资料', 'nopic18.png', 35.00, '2019-05-14', '刚刚考完公务员的复习资料。淘宝购买，低价出售。', 1);
INSERT INTO `products` VALUES (20, 1, '13C5F5E668FE4974A1C6F9159E70C19A', 'Thinkpad笔记本', 'nopic20.png', 1600.00, '2019-05-14', '京东购买的Thinkpad笔记本电脑，九成新。', 0);
INSERT INTO `products` VALUES (78, 2, '1723C981AD1548C992C0F8FDFE365087', '大学生用计算器。', '599629aa-9440-435c-8185-42e34a862470.jpg', 10.00, '2019-04-14', '用一两次过，但没怎么用过。基本全新的', 0);
INSERT INTO `products` VALUES (79, 1, '88B5C8B63D6D4C8EAC6417E44119FDBB', '出HTC M9ET 3+32G', '266abea1-a202-47f2-b5c4-095e96c10473.jpg', 1500.00, '2019-04-14', '自用，自认为九成新，除了边角磕碰，其他都好，无暗病', 1);
INSERT INTO `products` VALUES (80, 1, '88B5C8B63D6D4C8EAC6417E44119FDBB', '二手苹果iphone6 6s', '4d472617-d430-4540-a510-f7606861dde0.jpg', 2488.00, '2019-04-14', '无锁 支持三网4G 成色9-99新 优先下单优先挑选靓成色发货 主板无限 无暗病 功能全部正常 诚信经营 以上均64G 需其他机型可私聊', 1);
INSERT INTO `products` VALUES (81, 2, 'E59512878FA0452C9B58D97277F8B8AF', '168元出售全新自行车', 'e62acc43-8122-421a-940b-a68e6aeadd30.jpg', 168.00, '2019-04-14', '要毕业了，低价出手吧 要得给我打电话', 1);
INSERT INTO `products` VALUES (82, 2, 'E59512878FA0452C9B58D97277F8B8AF', '二手 电动车', '67a5f2ee-a09a-488d-9e7a-87ac6d8ab9c4.jpg', 1700.00, '2019-04-14', '羽铃电动车，购于2017年9月，个人原因想出，原价2850，现在二手出1700可刀，证牌齐全自用车，左后方车轮防护板断裂(如图)，车前头购买的时候就有划痕因为不影响使用就没叫老板换新的，一切破损不影响', 1);
INSERT INTO `products` VALUES (83, 2, '88B5C8B63D6D4C8EAC6417E44119FDBB', '全新山地车', '110456d4-cc20-4fe2-b0a6-217b023d7dd6.jpg', 398.00, '2019-04-14', '自身原因起不了。全新山地车特价：现价380元，原价498元，21速碟刹加厚铝合金轮子', 1);
INSERT INTO `products` VALUES (84, 5, '61396C30AC1A4A62A778654F4089F993', '空调', '499afa59-53bc-4d23-99ef-5d0f9d60de69.jpg', 800.00, '2019-04-14', '13年购入的长虹空调，加了2米铜管，1匹冷暖型', 1);
INSERT INTO `products` VALUES (85, 5, '88B5C8B63D6D4C8EAC6417E44119FDBB', '头发剪了，出手吹风机', '23f242e3-6dbf-4d46-a1b2-a620918908d9.jpg', 15.00, '2019-04-14', '头发剪短了，现在不需要了，低价出售', 1);
INSERT INTO `products` VALUES (86, 7, '6C44D389DB3B47CE851218D74532EDF6', '单板吉他', 'ae1097a5-736d-4850-9552-b5901ad6d84b.jpg', 688.00, '2019-04-14', '单板原价1200，买了两年了，弹过一个多月就搁置，毕业季出了。赠书三月通（30），赠一套弦（30）.', 1);
INSERT INTO `products` VALUES (87, 7, '61396C30AC1A4A62A778654F4089F993', '水溶性彩色铅笔', '95daa308-8011-4e0c-b5bd-8cd151830c32.jpg', 20.00, '2019-04-14', '德国进口彩铅辉柏嘉，48色淘宝在60左右，我的买过来画了几张画就闲置了，彩票效果相当好，黑色用得比较快还剩一半多了', 1);
INSERT INTO `products` VALUES (88, 6, '6C44D389DB3B47CE851218D74532EDF6', '九成新仰卧板 便宜出售', '5c212d57-d8a4-4cc0-8853-dba957fba3d5.jpg', 50.00, '2019-04-14', '没用多少次 带不走便宜卖了', 1);
INSERT INTO `products` VALUES (89, 4, '61396C30AC1A4A62A778654F4089F993', '艺乐杨幂刊', 'ec5369f6-7c87-43db-98aa-112efa91c8c6.JPG', 20.00, '2019-04-14', '艺乐杂志 杨幂专刊 走进偶像 了解偶像背后的故事', 1);
INSERT INTO `products` VALUES (90, 4, '6C44D389DB3B47CE851218D74532EDF6', '傲慢与偏见', 'fd680315-9ac8-4268-803e-7da7b492e8b0.JPG', 28.00, '2018-04-14', '傲慢与偏见 百词斩阅读计划，全英文小说，词汇量2401-3200 正版全新 用百词斩软件扫描书内二维码可获取书籍配套全英文音频以及书籍配套词汇', 1);
INSERT INTO `products` VALUES (91, 4, '6C44D389DB3B47CE851218D74532EDF6', '刘语熙《我遇见我》', '455e9ee5-92a7-4c7c-aa94-55f4373a16ee.JPG', 25.00, '2018-04-14', '“乌贼刘”刘语熙自传我遇见我 讲述追梦历程', 1);
INSERT INTO `products` VALUES (92, 3, '6C44D389DB3B47CE851218D74532EDF6', '灰色短袖', '33434fa2-8bf3-4fbc-b1d9-d1e67202e2f2.jpg', 12.00, '2018-04-14', '刚买的，全新 全新 全新', 1);
INSERT INTO `products` VALUES (93, 3, '6C44D389DB3B47CE851218D74532EDF6', '帽子', 'dc4f9591-bd1a-4eac-b1ea-be6412296fb6.png', 10.00, '2018-04-14', '买戴过', 1);
INSERT INTO `products` VALUES (94, 5, '1723C981AD1548C992C0F8FDFE365087', '烧水壶', '7eb89aaa-56c0-4283-893f-bd5718301d80.jpg', 22.00, '2018-04-14', '烧水壶功能一切都好，请放心使用', 0);
INSERT INTO `products` VALUES (95, 3, '1723C981AD1548C992C0F8FDFE365087', '桌面吸尘器', '6664b320-87d4-4d37-b14f-fc5dba41f529.PNG', 28.00, '2018-04-14', '桌面吸尘器，可以清洁键盘、吸纸屑、头发、灰尘，有蓝色和白色两款', 1);
INSERT INTO `products` VALUES (96, 7, 'E59512878FA0452C9B58D97277F8B8AF', '纯手工绘画', '451c3aa2-529d-449d-b69f-b8771af1d806.jpg', 108.00, '2018-04-14', '纯手工绘画，来图定制，提供绘画过程，实木相框装裱，A4大小与12寸，64801606', 0);
INSERT INTO `products` VALUES (103, 7, 'E59512878FA0452C9B58D97277F8B8AF', '排球', 'b0933eb3-1ccb-43e1-80a4-1d50902916db.jpg', 110.00, '2018-04-22', '9成新', 1);
INSERT INTO `products` VALUES (105, 4, 'E59512878FA0452C9B58D97277F8B8AF', '七七', '504d47df-32b0-4195-b63c-10d1562896cc.jpg', 1.00, '2018-04-22', '没脑没胸', 1);
INSERT INTO `products` VALUES (106, 3, '61396C30AC1A4A62A778654F4089F993', '资生堂金瓶防晒霜', 'a634ca2b-70cc-404d-95cb-fc4166fe6706.jpg', 50.00, '2018-05-07', '夏天必不可少的一款防晒霜，真的晒不黑哦。', 1);
INSERT INTO `products` VALUES (107, 3, '61396C30AC1A4A62A778654F4089F993', '露得清防晒喷雾', '1ba8f318-fbf3-42f6-b8d9-0baa7e678cec.jpg', 40.00, '2018-05-07', '很方便的防晒喷雾，可以随身携带，随时喷一喷。而且这款喷雾很清爽，一点也不油腻。', 1);
INSERT INTO `products` VALUES (108, 5, '61396C30AC1A4A62A778654F4089F993', '太阳镜', 'afd57674-338c-414f-98ae-78e0d25b12f8.jpg', 10.00, '2018-05-07', '可以用来遮阳的', 1);
INSERT INTO `products` VALUES (109, 5, 'E59512878FA0452C9B58D97277F8B8AF', '傲滴 隐形眼镜护理液', '330a9a46-6434-4d04-a72b-a91a14035229.jpg', 30.00, '2018-05-07', '一款超级舒服的隐形眼镜护理液。', 1);
INSERT INTO `products` VALUES (110, 4, 'E59512878FA0452C9B58D97277F8B8AF', '《我们仨》杨绛', '0583cb1e-6acd-46da-bebc-4a9f1d6c3ac7.jpg', 10.00, '2018-05-07', '杨先生对他们家三人的记录。', 1);
INSERT INTO `products` VALUES (112, 6, 'E59512878FA0452C9B58D97277F8B8AF', '梅卡萨排球', '854dff80-d049-4381-ae40-d1d23cd0e88b.jpg', 200.00, '2018-05-07', '国际专业排球比赛指定用球', 0);
INSERT INTO `products` VALUES (116, 7, 'E59512878FA0452C9B58D97277F8B8AF', '自习神器', 'f0983943-2dea-4a19-a96f-989d6ee70780.png', 216.00, '2019-03-21', '国际专业排球比赛指定用球', 0);
INSERT INTO `products` VALUES (120, 5, '61396C30AC1A4A62A778654F4089F993', 'ThinkPAD', 'CDBD0D7D2E534A398DE9C1FC80D92450.jpg', 1110.00, '2019-09-15 21:16:27', '国际专业排球比赛指定用球', 1);
INSERT INTO `products` VALUES (121, 1, '13C5F5E668FE4974A1C6F9159E70C19A', 'oppo reno z', 'AAF86B671E2C47B19A843D2C990F846C.jpg', 690.00, '2019-11-16 07:57:17', '新买的，还没用几天', 1);

-- ----------------------------
-- Table structure for purse
-- ----------------------------
DROP TABLE IF EXISTS `purse`;
CREATE TABLE `purse`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '钱包id',
  `user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
  `balance` float(11, 0) UNSIGNED ZEROFILL NULL DEFAULT 00000000000 COMMENT '总钱数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_user_purse`(`user_id`) USING BTREE,
  CONSTRAINT `fk_user_purse` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of purse
-- ----------------------------
INSERT INTO `purse` VALUES (1, '0F84E3048F5546A58C8EFE52263D2A83', 00000000390);
INSERT INTO `purse` VALUES (2, '13C5F5E668FE4974A1C6F9159E70C19A', 00000001387);
INSERT INTO `purse` VALUES (3, '1723C981AD1548C992C0F8FDFE365087', 00000000132);
INSERT INTO `purse` VALUES (4, '61396C30AC1A4A62A778654F4089F993', 00000000000);
INSERT INTO `purse` VALUES (5, '6C44D389DB3B47CE851218D74532EDF6', 00000000050);
INSERT INTO `purse` VALUES (6, '88B5C8B63D6D4C8EAC6417E44119FDBB', 00000000000);
INSERT INTO `purse` VALUES (7, 'E59512878FA0452C9B58D97277F8B8AF', 00000004592);
INSERT INTO `purse` VALUES (8, 'FB56B14828CF408C835B3409792B7169', 00000000000);
INSERT INTO `purse` VALUES (10, '36E597F5E38E4435994B1CF1BFB6E30F', 00000000000);
INSERT INTO `purse` VALUES (11, '9F0ED82D37C74293820DC1CEB0CE3754', 00000000000);
INSERT INTO `purse` VALUES (12, '605EE4F481D046B187EDB9B7BDE66F1F', 00000007880);
INSERT INTO `purse` VALUES (13, 'C9BB18B422284E09AC0750A718B52528', 00000000000);
INSERT INTO `purse` VALUES (14, '6D06270841044293BECBF19E51832396', 00000000000);
INSERT INTO `purse` VALUES (15, 'DD0691990A6C4FF6872801FA1B2D3170', 00000000000);
INSERT INTO `purse` VALUES (16, 'CCEDDD18D4434C9A98A48D3B91F8EC2E', 00000000000);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `telephone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `studentid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `yid` int(10) NOT NULL,
  `createdate` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` int(5) NOT NULL DEFAULT 0,
  `conditions` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('0F84E3048F5546A58C8EFE52263D2A83', '王薪哲', '15245874587', '111111', '1049388229@qq.com', '456456', 2, '2019-09-10 14:07:51', 1, '禁用');
INSERT INTO `user` VALUES ('13C5F5E668FE4974A1C6F9159E70C19A', '小李', '17790792856', '123456', '1049388229@qq.com', '201702153587', 2, '2019-09-09 11:22:35', 1, '正常');
INSERT INTO `user` VALUES ('1723C981AD1548C992C0F8FDFE365087', '王东', '13404840431', '111111', 'jwr1049388229@126.com', '201803458910', 3, '2019-09-10 13:38:52', 1, '正常');
INSERT INTO `user` VALUES ('36E597F5E38E4435994B1CF1BFB6E30F', '李冰', '15024512451', '111111', '1049388229@qq.com', '201810253578', 5, '2019-10-19 19:10:37', 1, '正常');
INSERT INTO `user` VALUES ('605EE4F481D046B187EDB9B7BDE66F1F', '王薪哲', '17790792756', '111111', 'jwr1049388229@126.com', '201578596231', 8, '2019-11-16 09:17:44', 1, '正常');
INSERT INTO `user` VALUES ('61396C30AC1A4A62A778654F4089F993', '李鹏飞', '13404840432', '111111', 'jwr1049388229@126.com', '201608103009', 4, '2019-09-10 19:42:46', 1, '正常');
INSERT INTO `user` VALUES ('6C44D389DB3B47CE851218D74532EDF6', '王薪哲', '17898765432', '111111', 'jwr1049388229@126.com', '201508103007', 5, '2019-09-10 14:19:33', 1, '正常');
INSERT INTO `user` VALUES ('6D06270841044293BECBF19E51832396', '王薪哲', '17790792758', '111111', '1049388229@qq.com', '20158564855', 5, '2019-11-27 18:20:16', 1, '正常');
INSERT INTO `user` VALUES ('88B5C8B63D6D4C8EAC6417E44119FDBB', '小胖子', '15248132105', '111111', 'jwr1049388229@126.com', '201608103075', 6, '2019-09-11 14:34:46', 1, '正常');
INSERT INTO `user` VALUES ('9F0ED82D37C74293820DC1CEB0CE3754', '王薪哲', '15242315698', '111111', 'jwr1049388229@126.com', '201585648569', 8, '2019-11-16 08:32:39', 1, '正常');
INSERT INTO `user` VALUES ('C9BB18B422284E09AC0750A718B52528', 'qweqw', '15248131048', '111111', '1049388229@qq.com', '45645645645', 2, '2019-11-18 21:47:52', 0, '正常');
INSERT INTO `user` VALUES ('CCEDDD18D4434C9A98A48D3B91F8EC2E', 'aaa', '17095621256', '111111', '1049388229@qq.com', '201608103007', 9, '2020-01-09 10:57:09', 0, '正常');
INSERT INTO `user` VALUES ('DD0691990A6C4FF6872801FA1B2D3170', 'jkjjjkk', '17790725645', '111111', '1049388229@qq.com', '201608103006', 3, '2020-01-09 10:53:32', 0, '正常');
INSERT INTO `user` VALUES ('E59512878FA0452C9B58D97277F8B8AF', '计文瑞', '17790792609', '111111', 'jwr1049388229@126.com', '201408452103', 8, '2019-09-11 14:07:04', 1, '正常');
INSERT INTO `user` VALUES ('FB56B14828CF408C835B3409792B7169', '叹世界', '15678547854', '111111', 'jwr1049388229@126.com', '201810483972', 4, '2019-10-05 17:27:39', 1, '正常');

-- ----------------------------
-- Table structure for yuanxi
-- ----------------------------
DROP TABLE IF EXISTS `yuanxi`;
CREATE TABLE `yuanxi`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `yname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yuanxi
-- ----------------------------
INSERT INTO `yuanxi` VALUES (1, '经管学院');
INSERT INTO `yuanxi` VALUES (2, '物电学院');
INSERT INTO `yuanxi` VALUES (3, '传媒学院');
INSERT INTO `yuanxi` VALUES (4, '计算机学院');
INSERT INTO `yuanxi` VALUES (5, '矿业学院');
INSERT INTO `yuanxi` VALUES (6, '文学院');
INSERT INTO `yuanxi` VALUES (7, '建工学院');
INSERT INTO `yuanxi` VALUES (8, '生环学院');
INSERT INTO `yuanxi` VALUES (9, '旅地学院');
INSERT INTO `yuanxi` VALUES (10, '体育学院');
INSERT INTO `yuanxi` VALUES (11, '美术学院');
INSERT INTO `yuanxi` VALUES (12, '音乐学院');

SET FOREIGN_KEY_CHECKS = 1;
