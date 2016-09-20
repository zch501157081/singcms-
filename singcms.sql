/*
Navicat MySQL Data Transfer

Source Server         : tt
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : singcms

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2016-09-20 15:00:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cms_admin
-- ----------------------------
DROP TABLE IF EXISTS `cms_admin`;
CREATE TABLE `cms_admin` (
  `admin_id` mediumint(6) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `lastloginip` varchar(15) DEFAULT '0' COMMENT '登陆IP',
  `lastlogintime` int(10) unsigned DEFAULT '0' COMMENT '登陆时间',
  `email` varchar(40) DEFAULT '',
  `realname` varchar(50) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`admin_id`),
  KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_admin
-- ----------------------------
INSERT INTO `cms_admin` VALUES ('1', 'admin', 'd099d126030d3207ba102efa8e60630a', '0', '1474205250', 'tracywxh0830@126.com', 'singwa', '1');
INSERT INTO `cms_admin` VALUES ('9', 'zhengchenhui', '5e9156b6c6d3b997ae58e23e6b18e276', '0', '1474108288', 'zheng501157081@qq.com', 'zch', '1');

-- ----------------------------
-- Table structure for cms_menu
-- ----------------------------
DROP TABLE IF EXISTS `cms_menu`;
CREATE TABLE `cms_menu` (
  `menu_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL DEFAULT '',
  `parentid` smallint(6) NOT NULL DEFAULT '0' COMMENT '父级菜单',
  `m` varchar(20) NOT NULL DEFAULT '' COMMENT '模块',
  `c` varchar(20) NOT NULL DEFAULT '' COMMENT '控制器',
  `f` varchar(20) NOT NULL DEFAULT '' COMMENT '方法',
  `data` varchar(100) NOT NULL DEFAULT '',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '类型 属于前段还是后台',
  PRIMARY KEY (`menu_id`),
  KEY `listorder` (`listorder`),
  KEY `parentid` (`parentid`),
  KEY `module` (`m`,`c`,`f`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_menu
-- ----------------------------
INSERT INTO `cms_menu` VALUES ('1', '菜单管理', '0', 'admin', 'menu', 'index', '', '10', '1', '1');
INSERT INTO `cms_menu` VALUES ('3', '体育', '0', 'home', 'cat', 'index', '', '5', '1', '0');
INSERT INTO `cms_menu` VALUES ('6', '文章管理', '0', 'admin', 'content', 'index', '', '9', '1', '1');
INSERT INTO `cms_menu` VALUES ('8', '科技', '0', 'home', 'cat', 'index', '', '0', '1', '0');
INSERT INTO `cms_menu` VALUES ('9', '推荐位管理', '0', 'admin', 'position', 'index', '', '4', '1', '1');
INSERT INTO `cms_menu` VALUES ('10', '推荐位内容管理', '0', 'admin', 'positioncontent', 'index', '', '1', '1', '1');
INSERT INTO `cms_menu` VALUES ('11', '基本管理', '0', 'admin', 'basic', 'index', '', '0', '1', '1');
INSERT INTO `cms_menu` VALUES ('12', '新闻', '0', 'home', 'cat', 'index', '', '0', '1', '0');
INSERT INTO `cms_menu` VALUES ('13', '用户管理', '0', 'admin', 'admin', 'index', '', '0', '1', '1');

-- ----------------------------
-- Table structure for cms_news
-- ----------------------------
DROP TABLE IF EXISTS `cms_news`;
CREATE TABLE `cms_news` (
  `news_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '栏目',
  `title` varchar(80) NOT NULL DEFAULT '',
  `small_title` varchar(30) NOT NULL DEFAULT '' COMMENT '副标题',
  `title_font_color` varchar(250) DEFAULT NULL COMMENT '标题颜色',
  `thumb` varchar(100) NOT NULL DEFAULT '' COMMENT '缩图',
  `keywords` char(40) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(250) NOT NULL COMMENT '文章描述',
  `posids` varchar(250) NOT NULL DEFAULT '',
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `copyfrom` varchar(250) DEFAULT NULL COMMENT '来源',
  `username` char(20) NOT NULL,
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`news_id`),
  KEY `status` (`status`,`listorder`,`news_id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`news_id`),
  KEY `catid` (`catid`,`status`,`news_id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_news
-- ----------------------------
INSERT INTO `cms_news` VALUES ('25', '12', '陕西周至现“冥界之花”：小说中有起死回生之效', '陕西周至现“冥界之花”：小说中有起死回生之效', '#5674ed', '/upload/2016/09/17/57dd48136a1b6.jpg', '陕西周至现“冥界之花”：小说中有起死回生之效', '陕西周至现“冥界之花”：小说中有起死回生之效', '', '0', '1', '1', 'admin', '1474119912', '0', '3');
INSERT INTO `cms_news` VALUES ('21', '3', '习近平今日下午出席解放军代表团全体会议', '习近平出席解放军代表团全体会议', '', '/upload/2016/03/13/56e519a185c93.png', '中共中央总书记 国家主席 中央军委主席 习近平', '中共中央总书记', '', '2', '-1', '1', 'admin', '1457854896', '0', '61');
INSERT INTO `cms_news` VALUES ('22', '12', '李克强让部长们当第一新闻发言人', '李克强让部长们当第一新闻发言人', '', '/upload/2016/03/13/56e51b6ac8ce2.jpg', '李克强  新闻发言人', '部长直接面对媒体回应关切，还能直接读到民情民生民意，而不是看别人的舆情汇报。', '', '0', '-1', '0', 'admin', '1457855362', '0', '34');
INSERT INTO `cms_news` VALUES ('23', '3', '重庆美女球迷争芳斗艳', '重庆美女球迷争芳斗艳', '', '/upload/2016/03/13/56e51cbd34470.png', '重庆美女 球迷 争芳斗艳', '重庆美女球迷争芳斗艳', '', '10', '-1', '0', 'admin', '1457855680', '0', '22');
INSERT INTO `cms_news` VALUES ('24', '3', '中超-汪嵩世界波制胜 富力客场1-0力擒泰达', '中超-汪嵩世界波制胜 富力客场1-0力擒泰达', '', '/upload/2016/03/13/56e51fc82b13a.png', '中超 汪嵩世界波  富力客场 1-0力擒泰达', '中超-汪嵩世界波制胜 富力客场1-0力擒泰达', '', '1', '-1', '0', 'admin', '1457856460', '0', '30');
INSERT INTO `cms_news` VALUES ('26', '3', '中国26金18银26铜奖牌榜第三  9战奥运金牌数第五', '中国26金18银26铜奖牌榜第三 ', '#5674ed', '/upload/2016/09/17/57dd4c94d9ac4.jpg', '中国26金18银26铜奖牌榜第三', '中国26金18银26铜奖牌榜第三 ', '', '0', '1', '1', 'admin', '1474120966', '0', '1');
INSERT INTO `cms_news` VALUES ('27', '3', '那些年孙杨流过的泪', '那些年孙杨流过的泪', '#ed568b', '/upload/2016/09/17/57dd4e0104bd7.jpg', '那些年孙杨流过的泪', '那些年孙杨流过的泪', '', '0', '1', '3', 'admin', '1474121477', '0', '3');
INSERT INTO `cms_news` VALUES ('28', '8', 'iPhone 7首发评测：苹果想说的 远不止是两个黑色手机', 'iPhone 7首发评测：苹果想说的 远不止是两个黑色手机', '#5674ed', '/upload/2016/09/17/57dd502add758.jpg', 'iPhone 7首发评测：苹果想说的 远不止是两个黑色手机', 'iPhone 7首发评测：苹果想说的 远不止是两个黑色手机', '', '0', '1', '1', 'admin', '1474121987', '0', '8');

-- ----------------------------
-- Table structure for cms_news_content
-- ----------------------------
DROP TABLE IF EXISTS `cms_news_content`;
CREATE TABLE `cms_news_content` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `news_id` mediumint(8) unsigned NOT NULL,
  `content` mediumtext NOT NULL COMMENT '文章内容',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `news_id` (`news_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_news_content
-- ----------------------------
INSERT INTO `cms_news_content` VALUES ('7', '17', '&lt;p&gt;\r\n	gsdggsgsgsgsg\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	sgsg\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	gsdgsg \r\n&lt;/p&gt;\r\n&lt;p style=&quot;text-align:center;&quot;&gt;\r\n	       ggg\r\n&lt;/p&gt;', '1455756856', '0');
INSERT INTO `cms_news_content` VALUES ('8', '18', '&lt;p&gt;\r\n	你好\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	我很好dsggfg\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;br /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	gsgfgdfgd\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;br /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;br /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;br /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	gggg\r\n&lt;/p&gt;', '1455756999', '0');
INSERT INTO `cms_news_content` VALUES ('9', '19', '111', '1456673467', '0');
INSERT INTO `cms_news_content` VALUES ('10', '20', '111', '1456674909', '0');
INSERT INTO `cms_news_content` VALUES ('11', '21', '&lt;p&gt;\r\n	&lt;span style=&quot;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;font-size:16px;line-height:32px;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; 3月13日下午，中共中央总书记、国家主席、中央军委主席习近平出席十二届全国人大四次会议解放军代表团全体会议，并发表重要讲话。&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;font-size:16px;line-height:32px;&quot;&gt;&lt;img src=&quot;/upload/2016/03/13/56e519acb12ee.png&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;\r\n&lt;/span&gt;\r\n&lt;/p&gt;', '1457854896', '0');
INSERT INTO `cms_news_content` VALUES ('12', '22', '&lt;p style=&quot;font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;&quot;&gt;\r\n	&amp;nbsp; &amp;nbsp; “部长通道”是今年两会一大亮点，成为两会开放透明和善待媒体的一个象征。在这个通道上，以往记者拉着喊着部长接受采访的场景不见了，变为部长主动站出来回应关切，甚至变成部长排队10多分钟等着接受采访。媒体报道称，两会前李克强总理接连两次“发话”，要求各部委主要负责人“要积极回应舆论关切”。部长主动放料，使这个通道上传出了很多新闻，如交通部长对拥堵费传闻的回应，人社部部长称网传延迟退休时间表属误读等。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;&quot;&gt;\r\n	&amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp;&lt;img src=&quot;/upload/2016/03/13/56e51b7fcd445.jpg&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p style=&quot;font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;&quot;&gt;\r\n	&amp;nbsp; &amp;nbsp; &amp;nbsp; 记者之所以喜欢跑两会，原因之一是两会上高官云集，能“堵”到、“逮”到、“抢”到很多大新闻——现在不需要堵、逮和抢，部长们主动曝料，打通了各种阻隔，树立了开明开放的政府形象。期待“部长通道”不只在两会期间存在，最好能成为一种官媒交流、官民沟通的常态化新闻通道。\r\n&lt;/p&gt;\r\n&lt;p style=&quot;font-size:16px;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;&quot;&gt;\r\n	&lt;span style=&quot;font-family:\'Microsoft YaHei\', u5FAEu8F6Fu96C5u9ED1, Arial, SimSun, u5B8Bu4F53;font-size:16px;line-height:32px;&quot;&gt;部长们多面对媒体多发言，不仅能提高自身的媒介素养，也带动部门新闻发言人，更加重视与媒体沟通。部长直接面对媒体回应关切，还能直接读到民情民生民意，而不是看别人的舆情汇报。&lt;/span&gt;\r\n&lt;/p&gt;', '1457855362', '0');
INSERT INTO `cms_news_content` VALUES ('13', '23', '&lt;p&gt;\r\n	&lt;span style=&quot;color:#666666;font-family:\'Microsoft Yahei\', 微软雅黑, SimSun, 宋体, \'Arial Narrow\', serif;font-size:14px;line-height:28px;background-color:#FFFFFF;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; 2016年3月13日，2016年中超联赛第2轮：重庆力帆vs河南建业，主场美女球迷争芳斗艳。&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;color:#666666;font-family:\'Microsoft Yahei\', 微软雅黑, SimSun, 宋体, \'Arial Narrow\', serif;font-size:14px;line-height:28px;background-color:#FFFFFF;&quot;&gt;&lt;img src=&quot;/upload/2016/03/13/56e51cb17542e.png&quot; alt=&quot;&quot; /&gt;&lt;img src=&quot;/upload/2016/03/13/56e51cb180f8a.png&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;\r\n&lt;/span&gt;\r\n&lt;/p&gt;', '1457855680', '0');
INSERT INTO `cms_news_content` VALUES ('14', '24', '<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	新浪体育讯　　北京时间2016年3月12日晚7点35分，2016年中超联赛第2轮的一场比赛在天津水滴体育场进行。由天津泰达主场对阵广州富力。上半场双方机会都不多，<strong>下半场第57分钟，常飞亚左路护住皮球回做，汪嵩迎球直接远射世界波破门。随后天津泰达尽管全力进攻，但伊万诺维奇和迪亚涅都浪费了近在咫尺的机会</strong>，最终不得不0-1主场告负。\r\n</p>\r\n<p>\r\n	<img src=\"/upload/2016/03/13/56e51f63a5742.png\" alt=\"\" width=\"474\" height=\"301\" title=\"\" align=\"\" /> \r\n</p>\r\n<p>\r\n	由于首轮中超对阵北京国安的比赛延期举行，因此本场比赛实际上是天津泰达本赛季的首次亮相。新援蒙特罗领衔锋线，两名外援中后卫均首发出场。另一方面，在首轮主场不敌中超新贵河北华夏之后，本赛季球员流失较多的广州富力也许不得不早早开始他们的保级谋划。本场陈志钊红牌停赛，澳大利亚外援吉安努顶替了上轮首发的肖智。\r\n</p>\r\n<p>\r\n	广州富力显然更快地适应了比赛节奏。第3分钟，吉安努前插领球大步杀入禁区形成单刀，回防的赞纳迪内果断放铲化解险情。第8分钟，雷纳尔迪尼奥左路踩单车过人后低平球传中，约万诺维奇伸出大长腿将球挡出底线。第14分钟，富力队左路传中到远点，聂涛头球解围险些失误，送出本场比赛第一个角球。\r\n</p>\r\n<p>\r\n	天津队中场的配合逐渐找到一些感觉。第23分钟，天津队通过一连串小配合打到左路，周海滨下底传中被挡出底线。角球被富力队顶出后天津队二次将球传到禁区前沿，蒙特罗转身后射门但软弱无力被程月磊得到。第27分钟，约万诺维奇断球后直塞蒙特罗，蒙特罗转身晃开后卫在禁区外大力轰门打高。第29分钟，瓦格纳任意球吊入禁区，程月磊出击失误没有击到球，天津队后点将球再次传中，姜至鹏在对方夹击下奋力将球顶出底线。\r\n</p>\r\n<p>\r\n	双方都没有太好的打开僵局的办法，开始陷入苦战。第33分钟，常飞亚左路晃开空档突然起脚，皮球擦着近门柱稍稍偏出底线。第43分钟，白岳峰被雷纳尔迪尼奥断球得手，后者利用速度甩开约万诺维奇，低平球传中又躲过了赞纳迪内的滑铲，但吉安努门前近在咫尺的推射被杨启鹏神奇地单腿挡出！双方半场只得0-0互交白卷。\r\n</p>\r\n<p>\r\n	中场休息双方都没有换人。第47分钟，蒙特罗前场扣过多名对方队员后将球交给周海滨，但周海滨传中时禁区内的胡人天越位在先。第51分钟，王嘉楠右路晃开聂涛下底，但传中球又高又远。第54分钟，雷纳尔迪尼奥中场拿球挑过李本舰，后者无奈将其放倒吃到黄牌。第57分钟，常飞亚左路护住皮球回做，汪嵩迎球直接远射，杨启鹏鞭长莫及，皮球呼啸着直挂远角！世界波！富力队客场1-0取得领先。\r\n</p>\r\n<p>\r\n	第62分钟，瓦格纳任意球吊到禁区，程月磊再次拿球脱手，幸亏张耀坤将球踢出了边线。天津队率先做出调整，迪亚涅和周通两名前锋登场换下郭皓和瓦格纳。第64分钟，天津队右路传中，周通禁区内甩头攻门，程月磊侧扑将球得到。富力队并未保守。第66分钟，常飞亚左路连续盘带杀入禁区，小角度射门打偏。不过一分钟，雷纳尔迪尼奥禁区右角远射，皮球在门前反弹后稍稍偏出。\r\n</p>\r\n<p>\r\n	第71分钟，吉安努禁区角上回做，常飞亚跟进远射，杨启鹏单掌将球托出。天津队马上打出反击，蒙特罗禁区内转身将球分到右路，胡人天的传中找到后排插上的周海滨，但后者的大力头球顶得太正被程月磊侯个正着。富力队肖智换下卢琳。第74分钟，迪亚涅依靠强壮的身体杀入禁区直塞，蒙特罗停球后射门被密集防守的后卫挡出。\r\n</p>\r\n<p>\r\n	于洋换下雷纳尔迪尼奥，富力队加强防守。第81分钟，天津队角球开出，迪亚涅甩头攻门顶偏。天津队连续得到角球机会。第85分钟，天津队角球二次进攻，周通传中，蒙特罗后点头球回做，约万诺维奇离门不到两米处转身扫射竟然将球踢飞！\r\n</p>\r\n<div id=\"ad_33\" class=\"otherContent_01\" style=\"margin:10px 20px 10px 0px;padding:4px;\">\r\n	<iframe width=\"300px\" height=\"250px\" frameborder=\"0\" src=\"http://img.adbox.sina.com.cn/ad/28543.html\">\r\n	</iframe>\r\n</div>\r\n<p>\r\n	天津队范柏群换下李本舰。富力队用宁安换下常飞亚。第88分钟，胡人天战术犯规吃到黄牌。天津队久攻不下，第90分钟，赞纳迪内40米开外远射打偏。第93分钟，蒙特罗左路传中，迪亚涅头球争顶下来之后顺势扫射，皮球贴着横梁高出。广州富力最终将优势保持到了终场取得三分。\r\n</p>\r\n<p>\r\n	进球信息：\r\n</p>\r\n<p>\r\n	天津泰达：无。\r\n</p>\r\n<p>\r\n	广州富力：第58分钟，卢琳左路回做，汪嵩跟上远射破网。\r\n</p>\r\n<p>\r\n	黄牌信息：\r\n</p>\r\n<p>\r\n	天津泰达：第54分钟，李本舰。第88分钟，胡人天。\r\n</p>\r\n<p>\r\n	广州富力：无。\r\n</p>\r\n<p>\r\n	红牌信息：\r\n</p>\r\n<p>\r\n	无。\r\n</p>\r\n<p>\r\n	双方出场阵容：\r\n</p>\r\n<p>\r\n	天津泰达（4-5-1）：29-杨启鹏，23-聂涛、3-赞纳迪内、5-约万诺维奇、19-白岳峰，6-周海滨、7-李本舰（86分钟，28-范柏群）、8-胡人天、11-瓦格纳（63分钟，9-迪亚涅）、22-郭皓（63分钟，33-周通），10-蒙特罗；\r\n</p>\r\n<p>\r\n	广州富力（4-5-1）：1-程月磊，11-姜至鹏、5-张耀坤、22-张贤秀、28-王嘉楠，7-斯文森、21-常飞亚（88分钟，15-宁安）、23-卢琳（73分钟，29-肖智）、31-雷纳尔迪尼奥（77分钟，3-于洋）、33-汪嵩，9-吉安努。\r\n</p>\r\n<p>\r\n	（卢小挠）\r\n</p>\r\n<div>\r\n</div>\r\n<div style=\"font-size:0px;\">\r\n</div>\r\n<p>\r\n	<br />\r\n</p>', '1457856460', '0');
INSERT INTO `cms_news_content` VALUES ('15', '25', '&lt;p&gt;\r\n	&lt;span style=&quot;color:#333333;font-family:&amp;quot;font-size:16px;line-height:30px;&quot;&gt;&amp;nbsp;&amp;nbsp;&lt;img src=&quot;/upload/2016/09/17/57dd48d7ba3dc.jpg&quot; alt=&quot;&quot; /&gt;&lt;/span&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;color:#333333;font-family:&amp;quot;font-size:16px;line-height:30px;&quot;&gt;&amp;nbsp; 最近，周至殿镇田峪景区发现了一种独特的植物，株高十多厘米，一簇一簇地生长，浑身晶莹剔透，非常罕见！它就是水晶兰，也有着“幽灵草”“梦兰花”等名。在武侠小说里，它常常被神化成具有起死回生功效的仙草，或被视为具有灵异力量可杀人于无形的邪恶化身，甚至于它的幽香也能让人闻之色变。在传说中它也是冥界的花，是邪恶和神秘的象征，因此也得名“死亡之花”。&lt;/span&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;color:#333333;font-family:&amp;quot;font-size:16px;line-height:30px;&quot;&gt;&lt;img src=&quot;/upload/2016/09/17/57dd485e56a54.jpg&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;\r\n&lt;/span&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;color:#333333;font-family:&amp;quot;font-size:16px;line-height:30px;&quot;&gt;&lt;br /&gt;\r\n&lt;/span&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;color:#333333;font-family:&amp;quot;font-size:16px;line-height:30px;&quot;&gt;&lt;span style=&quot;color:#333333;font-family:&amp;quot;font-size:16px;line-height:30px;&quot;&gt;&amp;nbsp; 水晶兰并非兰花，它属于鹿蹄草科多年生的腐生植物。通常生长在山坡海拔800米~3200米阴冷潮湿的针叶林或针阔混交林之中。在自然界中，水晶兰多为数株聚生，少数独出，全株高约10厘米~15厘米。在千万年的进化中，水晶兰的叶子进化成白色半透明鳞片，如一层薄如蝉翼的纱包裹在洁白的茎上。晶莹剔透的多重花瓣像一朵盛开的玫瑰。每年6月~9月是这些花儿脑袋低垂的时候，也是它们刚刚出土不久之时。等到蜜蜂前来拜访时，它们才会逐渐昂起头来，最后长出野生动物喜爱的浆果。完成传播种子的任务后，它们将变成一根根灰黑的“火柴头”。&lt;/span&gt;&lt;/span&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;color:#333333;font-family:&amp;quot;font-size:16px;line-height:30px;&quot;&gt;&lt;span style=&quot;color:#333333;font-family:&amp;quot;font-size:16px;line-height:30px;&quot;&gt;&lt;img src=&quot;/upload/2016/09/17/57dd48ca15416.jpg&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;\r\n&lt;/span&gt;&lt;/span&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;color:#333333;font-family:&amp;quot;font-size:16px;line-height:30px;&quot;&gt;&lt;br /&gt;\r\n&lt;/span&gt; \r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;color:#333333;font-family:&amp;quot;font-size:16px;line-height:30px;&quot;&gt;&lt;br /&gt;\r\n&lt;/span&gt; \r\n&lt;/p&gt;', '1474119912', '0');
INSERT INTO `cms_news_content` VALUES ('16', '26', '&lt;p&gt;\r\n	&lt;img src=&quot;/upload/2016/09/17/57dd4cc4dd077.jpg&quot; alt=&quot;&quot; /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;br /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;p style=&quot;color:#333333;font-family:&amp;quot;font-size:16px;&quot;&gt;\r\n		&amp;nbsp; 随着美国男篮大胜塞尔维亚取得三连冠，本届里约奥运会的所有比赛全部收官。中国代表团最终以26枚金牌、18枚银牌、26枚铜牌，位居奖牌榜第3，这是中国代表团征战里约奥运会的最终成绩单。与2000年悉尼奥运会基本持平，那届奥运会中国军团共获得28枚金牌、16枚银牌、15枚铜牌，总战绩基本持平。\r\n	&lt;/p&gt;\r\n	&lt;p style=&quot;color:#333333;font-family:&amp;quot;font-size:16px;&quot;&gt;\r\n		&amp;nbsp; 巧合的是，悉尼奥运会是中国奥运史上一次标志性战役，那届盛会中国军团首次压倒劲旅德国，跻身奖牌榜前三。此后几届奥运会，中国军团一直保持在世界前三：2004年雅典奥运会获得32枚金牌、63枚奖牌，列奖牌榜第2；2008年北京奥运会获51枚金牌、100枚奖牌，列奖牌榜第1；2012年伦敦奥运会获38枚金牌、88枚奖牌，列奖牌榜第2。\r\n	&lt;/p&gt;\r\n	&lt;p style=&quot;color:#333333;font-family:&amp;quot;font-size:16px;&quot;&gt;\r\n		&amp;nbsp; 近三届奥运会，中国代表团金牌数、奖牌数不断减少，排名从当时的第1跌到第3。笔者认为，这是受多种因素影响出现的结果：一是，北京奥运会后，国内奥运热有所减弱，加上不再具有天时地利人和的因素，成绩有所下滑在所难免，历届奥运会东道主都出现过这一现象；二是、国内一些传统强队出现青黄不接。借北京奥运会之东风，中国体育实力明显上升，那届奥运会绝大多数项目金牌数明显上升，伦敦奥运会时尚可吃一些老本，如今当年的主力仍具备夺金实力的已经不多；三是，心理素质有待提高。里约奥运会，一些主客观原因让中国运动员丢失了一些金牌。其实，无论这些压力来自于外界还是内部，关键因素还是自身心理不够强大。这方面，中国女排、龙清泉、傅海峰/张楠等国手以及外国一些运动员表现出的强大综合实力值得学习。\r\n	&lt;/p&gt;\r\n	&lt;p style=&quot;color:#333333;font-family:&amp;quot;font-size:16px;&quot;&gt;\r\n		&amp;nbsp; 26枚金牌、70枚奖牌，在一定程度上反映了中国代表团的基本实力，证明中国仍是公认的奥运强国之一。当然，竞技体育风云瞬息万变，4年后的东京奥运会，中国代表团能否继续保持在奖牌榜前三，悬念多多。众所周知，下届的东道主日本已是虎视眈眈，因田径、举重等项目被禁赛影响到总成绩的俄罗斯急于证明自己，德国军团已经出现回暖迹象。种种迹象表明，中国体育要保持奥运会奖牌榜第一方阵的地位，还需要做好各方面的工作，包括经费投入、选材、训练、科研、情报、备战等。一句话：打铁还需自身硬。\r\n	&lt;/p&gt;\r\n	&lt;p style=&quot;color:#333333;font-family:&amp;quot;font-size:16px;&quot;&gt;\r\n		&lt;br /&gt;\r\n	&lt;/p&gt;\r\n	&lt;p style=&quot;color:#333333;font-family:&amp;quot;font-size:16px;&quot;&gt;\r\n		&lt;strong&gt;以下为中国历届奥运会金牌数：&lt;/strong&gt;\r\n	&lt;/p&gt;\r\n	&lt;p style=&quot;color:#333333;font-family:&amp;quot;font-size:16px;&quot;&gt;\r\n		1984年洛杉矶奥运会 15金\r\n	&lt;/p&gt;\r\n	&lt;p style=&quot;color:#333333;font-family:&amp;quot;font-size:16px;&quot;&gt;\r\n		1988年汉城奥运会 5金\r\n	&lt;/p&gt;\r\n	&lt;p style=&quot;color:#333333;font-family:&amp;quot;font-size:16px;&quot;&gt;\r\n		1992年巴塞罗那奥运会 16金\r\n	&lt;/p&gt;\r\n	&lt;p style=&quot;color:#333333;font-family:&amp;quot;font-size:16px;&quot;&gt;\r\n		1996年亚特兰大奥运会 16金\r\n	&lt;/p&gt;\r\n	&lt;p style=&quot;color:#333333;font-family:&amp;quot;font-size:16px;&quot;&gt;\r\n		2000年悉尼奥运会 28金\r\n	&lt;/p&gt;\r\n	&lt;p style=&quot;color:#333333;font-family:&amp;quot;font-size:16px;&quot;&gt;\r\n		2004年雅典奥运会 32金\r\n	&lt;/p&gt;\r\n	&lt;p style=&quot;color:#333333;font-family:&amp;quot;font-size:16px;&quot;&gt;\r\n		2008年北京奥运会 51金\r\n	&lt;/p&gt;\r\n	&lt;p style=&quot;color:#333333;font-family:&amp;quot;font-size:16px;&quot;&gt;\r\n		2012年伦敦奥运会 38金\r\n	&lt;/p&gt;\r\n	&lt;p style=&quot;color:#333333;font-family:&amp;quot;font-size:16px;&quot;&gt;\r\n		2016年里约奥运会 26金\r\n	&lt;/p&gt;\r\n&lt;/p&gt;', '1474120966', '0');
INSERT INTO `cms_news_content` VALUES ('17', '27', '&lt;h2&gt;\r\n	&lt;span style=&quot;color:#666666;font-family:&amp;quot;font-size:14px;line-height:28px;background-color:#FFFFFF;&quot;&gt;&amp;nbsp; 北京时间8月7日，孙杨在400米自由游泳的决赛中遗憾的与金牌失之交臂，赛后他忍不住抱着熟识的记者痛哭。我们一起来盘点那些年他流过的泪，不止为奖牌，更为这些年的艰辛付出。孙杨加油！&lt;/span&gt; \r\n&lt;/h2&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;color:#666666;font-family:&amp;quot;font-size:14px;line-height:28px;background-color:#FFFFFF;&quot;&gt; &lt;/span&gt; \r\n&lt;/p&gt;\r\n&lt;h3 style=&quot;text-align:center;font-size:21px;color:#2C2C2C;font-weight:normal;font-family:&amp;quot;background-color:#FFFFFF;&quot;&gt;\r\n	2012伦敦奥运1500米自破纪录夺冠\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;/upload/2016/09/17/57dd4e85176e2.jpg&quot; alt=&quot;&quot; /&gt; \r\n&lt;/p&gt;\r\n&lt;br /&gt;\r\n&lt;p&gt;\r\n	&lt;br /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;span style=&quot;color:#666666;font-family:&amp;quot;font-size:14px;line-height:28px;background-color:#FFFFFF;&quot;&gt; &lt;/span&gt; \r\n&lt;/p&gt;\r\n&lt;h3 style=&quot;text-align:center;font-size:21px;color:#2C2C2C;font-weight:normal;font-family:&amp;quot;background-color:#FFFFFF;&quot;&gt;\r\n	里约400自摘银后的痛哭\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;img src=&quot;/upload/2016/09/17/57dd4f1d4c17c.jpg&quot; alt=&quot;&quot; /&gt; \r\n&lt;/p&gt;\r\n&lt;br /&gt;\r\n&lt;p&gt;\r\n	&lt;br /&gt;\r\n&lt;/p&gt;\r\n&lt;h3 style=&quot;font-size:21px;color:#2C2C2C;font-weight:normal;font-family:&amp;quot;background-color:#FFFFFF;&quot;&gt;\r\n	&lt;br /&gt;\r\n&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;br /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;br /&gt;\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;br /&gt;\r\n&lt;/p&gt;', '1474121477', '0');
INSERT INTO `cms_news_content` VALUES ('18', '28', '&lt;img src=&quot;/upload/2016/09/17/57dd539f7887b.jpg&quot; alt=&quot;&quot; /&gt; \r\n&lt;p&gt;\r\n	&lt;p style=&quot;font-size:18px;font-family:&amp;quot;&quot;&gt;\r\n		&amp;nbsp; 无论你是否承认，iPhone终究是款“不太寻常的手机”。这几年人们对iPhone关注空前密切：它的风吹草动都逃不开人们关注，分析师以此作为评估苹果股价的依据之一；媒体则将曝光信息作为素材，在产品发布前炮制出“iPhone XXX评测”。\r\n	&lt;/p&gt;\r\n	&lt;p style=&quot;font-size:18px;font-family:&amp;quot;&quot;&gt;\r\n		&amp;nbsp; 2016年秋季的iPhone 7/7 Plus（&lt;a href=&quot;http://slide.tech.sina.com.cn/mobile/slide_5_22298_71378.html&quot; target=&quot;_blank&quot;&gt;实拍图集&lt;/a&gt;）也是如此，在发布前的几个月，取消耳机口、防水、双镜头等特点陆续被曝光，发布会又一次变成了验证过程。\r\n	&lt;/p&gt;\r\n	&lt;p style=&quot;font-size:18px;font-family:&amp;quot;&quot;&gt;\r\n		但人们依然想知道，第十代iPhone相比上一代，又有何不同。\r\n	&lt;/p&gt;\r\n	&lt;p style=&quot;font-size:18px;font-family:&amp;quot;&quot;&gt;\r\n		&lt;br /&gt;\r\n	&lt;/p&gt;\r\n	&lt;p style=&quot;font-size:18px;font-family:&amp;quot;&quot;&gt;\r\n		&lt;p style=&quot;font-size:18px;font-family:&amp;quot;&quot;&gt;\r\n			&lt;strong&gt;新的流行色&lt;/strong&gt;\r\n		&lt;/p&gt;\r\n		&lt;p style=&quot;font-size:18px;font-family:&amp;quot;&quot;&gt;\r\n			&amp;nbsp; 在电子产品行业，苹果具备制造流行色的能力。\r\n		&lt;/p&gt;\r\n		&lt;p style=&quot;font-size:18px;font-family:&amp;quot;&quot;&gt;\r\n			&amp;nbsp; iPhone 5s试探性地尝试“土豪金“获得空前的成功；两年后，玫瑰金色的6s又成了人们选择这款手机重要理由。\r\n		&lt;/p&gt;\r\n		&lt;p style=&quot;font-size:18px;font-family:&amp;quot;&quot;&gt;\r\n			&amp;nbsp; 今年iPhone 7的广告色是黑色。苹果给了用户两种选择，亮黑色与黑（为了区别，我们在本文称之为磨砂黑）。亮黑色的盒子也与其他颜色不同，苹果上一次使用这种全黑色包装盒，是iPhone 5黑色版的时候。\r\n		&lt;/p&gt;\r\n	&lt;/p&gt;\r\n&lt;/p&gt;\r\n&lt;img src=&quot;/upload/2016/09/17/57dd539fa0155.jpg&quot; alt=&quot;&quot; /&gt;\r\n&lt;p&gt;\r\n	&lt;p style=&quot;font-size:18px;font-family:&amp;quot;&quot;&gt;\r\n		&amp;nbsp; 在发布会现场，我问一位苹果高管为什么这次深空灰没有了，他直接了当回答“因为我们更喜欢黑色”。对苹果来说，黑色是个情结问题，自iPhone一代开始直到4s，iPhone一直只有黑白两色可选。iPhone 5采用了更漂亮的金属后背，掉漆问题让苹果把黑色雪藏了3年，直到今天，才再次重新拿出来。\r\n	&lt;/p&gt;\r\n	&lt;p style=&quot;font-size:18px;font-family:&amp;quot;&quot;&gt;\r\n		在亮黑与磨砂黑中，毫无疑问，前者更吸引人。\r\n	&lt;/p&gt;\r\n&lt;/p&gt;\r\n&lt;img src=&quot;/upload/2016/09/17/57dd539fd9b42.jpg&quot; alt=&quot;&quot; /&gt;\r\n&lt;p&gt;\r\n	&lt;p style=&quot;font-size:18px;font-family:&amp;quot;&quot;&gt;\r\n		&lt;strong&gt;不能按的home键&lt;/strong&gt;\r\n	&lt;/p&gt;\r\n	&lt;p style=&quot;font-size:18px;font-family:&amp;quot;&quot;&gt;\r\n		&amp;nbsp; 从iPhone一代到五代，这系列手机经常出现的故障是home键损耗，连击或失灵让很多人习惯打开辅助功能里的“小白点”。\r\n	&lt;/p&gt;\r\n	&lt;p style=&quot;font-size:18px;font-family:&amp;quot;&quot;&gt;\r\n		&amp;nbsp; 这个问题在iPhone诞生9年之后终于得到了解决，在iPhone 7上，苹果换掉了机械式home键，给这颗按键加了最新的Taptic Engine振动器。\r\n	&lt;/p&gt;\r\n&lt;/p&gt;\r\n&lt;img src=&quot;/upload/2016/09/17/57dd53a009742.jpg&quot; alt=&quot;&quot; /&gt;\r\n&lt;p&gt;\r\n	&lt;p style=&quot;font-size:18px;font-family:&amp;quot;&quot;&gt;\r\n		&amp;nbsp; 在iPhone 7上，虽然home键不能按下去了，但关于它的所有操作都和以前的机械按键一样：按一下返回；双击调出多任务管理；长按调用Siri；轻拍两下半屏模式，等等。\r\n	&lt;/p&gt;\r\n	&lt;p style=&quot;font-size:18px;font-family:&amp;quot;&quot;&gt;\r\n		&amp;nbsp; 模拟出机械按键的段落感与真实按键不同，不过所有操作和逻辑完全一样。为了这种模拟更像，苹果给了新home键三种力度选择，相当于以前单一的机械式home键力度变成了可调整，对多数人来说，第二档力度就够了。\r\n	&lt;/p&gt;\r\n&lt;/p&gt;\r\n&lt;img src=&quot;/upload/2016/09/17/57dd53a01fea8.PNG&quot; alt=&quot;&quot; /&gt;\r\n&lt;p&gt;\r\n	&lt;p style=&quot;font-size:18px;font-family:&amp;quot;&quot;&gt;\r\n		&lt;strong&gt;镜头改进&lt;/strong&gt;\r\n	&lt;/p&gt;\r\n	&lt;p style=&quot;font-size:18px;font-family:&amp;quot;&quot;&gt;\r\n		&amp;nbsp; iPhone 7的摄像头原件进行了升级。光学模组变成了6片玻璃，光圈从?/2.2增大到?/1.8，增加50%进光量，闪光灯由2颗变4颗，一大一小两个手机都支持光学防抖；前置镜头从500万升级到700万像素；背部True Tone从双LED变成四LED，亮度增加一倍，并且依旧可根据环境色温调整，让暗光下的肤色更自然。\r\n	&lt;/p&gt;\r\n&lt;/p&gt;\r\n&lt;img src=&quot;/upload/2016/09/17/57dd53a051f7b.jpg&quot; alt=&quot;&quot; /&gt;', '1474121987', '0');

-- ----------------------------
-- Table structure for cms_position
-- ----------------------------
DROP TABLE IF EXISTS `cms_position`;
CREATE TABLE `cms_position` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(30) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `description` char(100) DEFAULT NULL,
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_position
-- ----------------------------
INSERT INTO `cms_position` VALUES ('2', '首页大图', '1', '展示首页大图的', '1455634715', '0');
INSERT INTO `cms_position` VALUES ('3', '小图推荐', '1', '小图推荐位', '1456665873', '0');
INSERT INTO `cms_position` VALUES ('5', '右侧广告位', '1', '右侧广告位', '1457873143', '0');

-- ----------------------------
-- Table structure for cms_position_content
-- ----------------------------
DROP TABLE IF EXISTS `cms_position_content`;
CREATE TABLE `cms_position_content` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `position_id` int(5) unsigned NOT NULL,
  `title` varchar(30) NOT NULL DEFAULT '',
  `thumb` varchar(100) NOT NULL DEFAULT '' COMMENT '缩图',
  `url` varchar(100) DEFAULT NULL,
  `news_id` mediumint(8) unsigned NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_position_content
-- ----------------------------
INSERT INTO `cms_position_content` VALUES ('38', '3', '中国26金18银26铜奖牌榜第三 9战奥运金牌数第五', '/upload/2016/09/17/57dd4c94d9ac4.jpg', '', '26', '0', '1', '1474123448', '0');
INSERT INTO `cms_position_content` VALUES ('37', '3', '那些年孙杨流过的泪', '/upload/2016/09/17/57dd4e0104bd7.jpg', '', '27', '0', '1', '1474123415', '0');
INSERT INTO `cms_position_content` VALUES ('36', '2', 'iPhone 7首发评测：苹果想说的 远不止是两个黑色手机', '/upload/2016/09/17/57dd502add758.jpg', '', '28', '0', '1', '1474123338', '0');
INSERT INTO `cms_position_content` VALUES ('30', '3', '重庆美女球迷争芳斗艳', '/upload/2016/03/13/56e51cbd34470.png', null, '23', '0', '1', '1457855680', '0');
INSERT INTO `cms_position_content` VALUES ('39', '3', '陕西周至现“冥界之花”：小说中有起死回生之效', '/upload/2016/09/17/57dd48136a1b6.jpg', '', '25', '0', '1', '1474123519', '0');
INSERT INTO `cms_position_content` VALUES ('40', '5', '为API开发而生', '/upload/2016/09/18/57de2ed33d370.png', 'http://www.thinkphp.cn/', '0', '0', '1', '1474178798', '0');
INSERT INTO `cms_position_content` VALUES ('41', '5', 'w3cshool', '/upload/2016/09/18/57de303b3f80f.png', 'http://www.w3school.com.cn/', '0', '0', '1', '1474179161', '0');
