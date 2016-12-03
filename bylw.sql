/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50022
Source Host           : localhost:3306
Source Database       : bylw

Target Server Type    : MYSQL
Target Server Version : 50022
File Encoding         : 65001

Date: 2016-12-03 10:42:00
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `ktbg`
-- ----------------------------
DROP TABLE IF EXISTS `ktbg`;
CREATE TABLE `ktbg` (
  `lwname` char(20) NOT NULL default '',
  `sid` char(20) NOT NULL,
  `sname` char(10) NOT NULL,
  `sdepart` char(10) default NULL,
  `stel` char(15) NOT NULL,
  `lwxz` char(20) NOT NULL,
  `tg` char(4) default 'no',
  `btg` char(4) default 'no',
  `tname` char(10) default NULL,
  PRIMARY KEY  (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ktbg
-- ----------------------------

-- ----------------------------
-- Table structure for `lwxt`
-- ----------------------------
DROP TABLE IF EXISTS `lwxt`;
CREATE TABLE `lwxt` (
  `id` char(15) NOT NULL,
  `lwid` char(15) character set utf8 collate utf8_bin NOT NULL,
  `lwname` char(20) NOT NULL,
  `tname` char(15) NOT NULL,
  `tel` char(11) NOT NULL,
  `tdepart` char(20) NOT NULL,
  `tyx` char(20) default NULL,
  `sfxz` char(5) default '否',
  `lwxz` varchar(50) character set utf8 collate utf8_bin NOT NULL default '',
  `sid` char(10) default NULL,
  PRIMARY KEY  (`lwid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lwxt
-- ----------------------------
INSERT INTO `lwxt` VALUES ('10001', '10001', 'JAVA语言考试系统的设计与实现', '曾宪权', '13273852112', '信息工程', '1032455693@qq.com', '是', 'JAVA语言考试系统的设计与实现', '5001130001');
INSERT INTO `lwxt` VALUES ('10002', '10002', '电子邮件客户端软件 ', '曾宪权', '13273852112', '信息工程', '1032455693@qq.com', '是', '电子邮件客户端软件(C#) ', '5001130002');
INSERT INTO `lwxt` VALUES ('10003', '10003', '二手交易市场', '曾宪权', '13273852112', '信息工程', '1032455693@qq.com', '否', '二手交易市场', '');
INSERT INTO `lwxt` VALUES ('10004', '10004', '高校毕业论文系统', '李梅莲', '14798563421', '信息工程', '149658753@qq.com', '是', '高校毕业论文系统', '5001130003');
INSERT INTO `lwxt` VALUES ('10005', '10005', '高校社团管理系统', '李梅莲', '14798563421', '信息工程', '149658753@qq.com', '否', '高校社团管理系统', '');
INSERT INTO `lwxt` VALUES ('10006', '10006', '购物网站的设计与实现', '李梅莲', '14798563421', '信息工程', '149658753@qq.com', '否', '购物网站的设计与实现', '');
INSERT INTO `lwxt` VALUES ('10007', '10007', '基于ASPNET的班级风采网站的设计', '张一品', '18839965692', '信息工程', '963422639@qq.com', '否', '基于ASPNET的班级风采网站的设计', '');
INSERT INTO `lwxt` VALUES ('10008', '10008', '基于ASPNET在线点歌系统', '张一品', '18839965692', '信息工程', '963422639@qq.com', '否', '基于ASPNET在线点歌系统', '');
INSERT INTO `lwxt` VALUES ('10009', '10009', '基于ASP的计算机组成原理考试系统', '张一品', '18839965692', '信息工程', '963422639@qq.com', '否', '基于ASP的计算机组成原理考试系统', '');

-- ----------------------------
-- Table structure for `manager`
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `mid` varchar(10) NOT NULL default '',
  `mpass` varchar(20) default NULL,
  `mname` varchar(10) default NULL,
  `date` char(20) default NULL,
  PRIMARY KEY  (`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES ('1001130001', '1001130001', '老王', '2016-06-30');

-- ----------------------------
-- Table structure for `psls`
-- ----------------------------
DROP TABLE IF EXISTS `psls`;
CREATE TABLE `psls` (
  `psid` varchar(10) NOT NULL default '',
  `pspass` varchar(20) default NULL,
  PRIMARY KEY  (`psid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of psls
-- ----------------------------
INSERT INTO `psls` VALUES ('4001130001', '4001130001');

-- ----------------------------
-- Table structure for `pyls`
-- ----------------------------
DROP TABLE IF EXISTS `pyls`;
CREATE TABLE `pyls` (
  `pyid` varchar(10) NOT NULL default '',
  `pypass` varchar(20) default NULL,
  `pyname` char(10) default NULL,
  PRIMARY KEY  (`pyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pyls
-- ----------------------------
INSERT INTO `pyls` VALUES ('3001130001', '3001130001', '张三');
INSERT INTO `pyls` VALUES ('3001130002', '3001130002', '李四');
INSERT INTO `pyls` VALUES ('3001130003', '3001130003', '王二');

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `sid` char(20) NOT NULL,
  `sname` char(20) NOT NULL,
  `sgender` char(2) NOT NULL default '男',
  `spass` char(20) NOT NULL,
  `sdepart` char(20) NOT NULL,
  `stel` char(15) NOT NULL,
  `syx` char(20) NOT NULL,
  `info` char(100) default NULL,
  `id` char(20) NOT NULL,
  `qq` char(15) default NULL,
  `mz` char(5) default NULL,
  `birth` char(20) default NULL,
  `fen1` char(4) default NULL,
  `fen2` char(4) default NULL,
  `fen3` char(4) default NULL,
  `py1` char(100) default NULL,
  `py2` char(100) default NULL,
  `py3` char(100) default NULL,
  `zf` char(10) default NULL,
  PRIMARY KEY  (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('5001130001', '小霞', '女', '5001130001', '物联网', '13698745621', '1456981223@qq.com', '恭喜你的论文已经通过！！！', '5001130001', '', '', '', '90', '90', '66', 'oo', 'yb', '6', '93.0');
INSERT INTO `student` VALUES ('5001130002', '小红', '女', '5001130002', '数媒', '12396587456', '12369875621@qq.com', '恭喜你的论文已经通过！！！', '5001130002', '', '', '', '80', '90', '80', 'xx', 'll', 'zhazha', '133.0');
INSERT INTO `student` VALUES ('5001130003', '小强', '男', '5001130003', '网络工程', '15987963412', '46985347126@qq.com', '恭喜你的论文已经通过！！！', '5001130003', '', '', '', '88', '60', '80', 'yes', 'laji', 'yo', '173.0');
INSERT INTO `student` VALUES ('5001130004', '小史', '女', '5001130004', '动漫', '13698745632', '58963631@163.com', '', '5001130004', '', '', '', '', '', '', '', '', '', null);
INSERT INTO `student` VALUES ('5001130005', '诸葛建国', '女', '5001130005', '甲骨文', '13269874120', '103269842@qq.com', '', '5001130005', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `student` VALUES ('5001130012', '史亚平', '男', '5001130012', '计科', '15537866921', '1098788526@qq.com', '', '5001130013', '', '', '', null, null, null, null, null, null, null);
INSERT INTO `student` VALUES ('5001130015', '高景镇', '男', '5001130015', '计科', '13278956211', '1287320921@qq.com', '', '5001130015', '', '', '', '', '', '', '', '', '', null);
INSERT INTO `student` VALUES ('5001130016', '胡志刚', '男', '192014', '计科1', '13273852166', '963419660@qq.com', '', '5001130016', '963419660', '汉族', '1994-06-19', '', '', '', '', '', '', null);
INSERT INTO `student` VALUES ('5001130024', '梁振飞', '男', '5001130024', '计科', '15987963412', '1756183379@qq.com', '', '5001130024', '', '', '', '', '', '', '', '', '', null);
INSERT INTO `student` VALUES ('5001130026', '杨亚辉', '男', '5001130026', '计科', '13698756456', '1015994604@qq.com', '', '5001130026', '', '', '', '', '', '', '', '', '', null);
INSERT INTO `student` VALUES ('5001130028', '马阵辉', '男', '5001130028', '计科', '13147896325', '1918097810@qq.com', '', '5001130028', '', '', '', '', '', '', '', '', '', null);
INSERT INTO `student` VALUES ('5001130031', '崔传峰', '男', '5001130031', '计科', '13589637412', '1055342884@qq.com', '', '5001130031', '', '', '', '', '', '', '', '', '', null);

-- ----------------------------
-- Table structure for `teacher`
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `tid` char(15) NOT NULL,
  `tname` char(4) NOT NULL,
  `tgender` char(1) NOT NULL,
  `tpass` char(15) NOT NULL,
  `tdepart` char(10) NOT NULL,
  `tel` char(11) NOT NULL,
  `yx` char(20) NOT NULL,
  `id` char(15) NOT NULL,
  `xueli` char(20) default NULL,
  `xuewei` char(20) default NULL,
  `zhicheng` char(20) default NULL,
  `xkfx` char(20) default NULL,
  `jj` char(250) default NULL,
  PRIMARY KEY  (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('2001130001', '曾宪权', '男', '2001130001', '信息工程', '13273852112', '1032455693@qq.com', '2001130001', '博士', '工程博士', '教授', '计算机系统结构', '很强');
INSERT INTO `teacher` VALUES ('2001130002', '李梅莲', '女', '2001130002', '信息工程', '14798563421', '149658753@qq.com', '2001130002', '博士', '工程博士', '教授', '计算机软件与理论', '很厉害');
INSERT INTO `teacher` VALUES ('2001130003', '张一品', '男', '2001130003', '信息工程', '18839965692', '963422639@qq.com', '2001130003', '博士', '工程博士', '教授', '计算机应用', '6的很');
INSERT INTO `teacher` VALUES ('2001130004', '朱贵良', '男', '2001130004', '信息工程', '13278965225', '7896358751@163.com', '2001130004', '博士', '工程博士', '教授', '信息安全', '可xing');
INSERT INTO `teacher` VALUES ('2001130005', '徐尽', '男', '2001130005', '信息工程', '15890305687', '1579@163.com', '2001130005', '博士', '工程博士', '副教授', '数字媒体', '要上天');
INSERT INTO `teacher` VALUES ('2001130006', '马慧', '女', '2001130006', '信息工程', '13781120567', '12369874@qq.com', '2001130006', '博士', '工程博士', '讲师', '计算机网络', '王者水平');
INSERT INTO `teacher` VALUES ('2001130007', '王爽', '女', '2001130007', '信息工程', '15563987416', '1238975@163.com', '2001130007`', '博士', '工程博士', '讲师', '计算机软件与理论', '还有谁');
INSERT INTO `teacher` VALUES ('2001130008', '老王', '男', '2001130008', '信息工程', '18839965478', '1236986@163.com', '2001130008', '硕士', '黄金圣斗士', '混饭的', '信息安全', '碾压对方');
INSERT INTO `teacher` VALUES ('2001130009', '老朱', '女', '2001130009', '信息工程', '13698745632', '45698745663@qq.com', '2001130009', '硕士', '王者圣斗士', '躺赢的', '计算机系统结构', '一个打10个');
INSERT INTO `teacher` VALUES ('2001130010', '小徐', '男', '2001130010', '信息工程', '13569875223', '·546415@qq.com', '2001130010', '', '', '', '', '');

-- ----------------------------
-- Table structure for `xslw`
-- ----------------------------
DROP TABLE IF EXISTS `xslw`;
CREATE TABLE `xslw` (
  `lwname` char(20) NOT NULL default '',
  `sid` char(20) NOT NULL,
  `sname` char(10) NOT NULL,
  `sdepart` char(10) default NULL,
  `stel` char(15) NOT NULL,
  `lwxz` char(20) NOT NULL,
  `tg` char(4) default 'no',
  `btg` char(4) default 'no',
  `fen1` char(4) default NULL,
  `fen2` char(4) default NULL,
  `fen3` char(4) default NULL,
  `py1` char(100) default NULL,
  `py2` char(100) default NULL,
  `py3` char(100) default NULL,
  `zf` char(10) default NULL,
  `id` char(20) default NULL,
  `zztg` char(4) default NULL,
  `tname` char(4) default NULL,
  `pyname` char(4) default NULL,
  PRIMARY KEY  (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xslw
-- ----------------------------
INSERT INTO `xslw` VALUES ('JAVA语言考试系统的设计与实现', '5001130001', '小霞', '物联网', '13698745621', 'JAVA语言考试系统的设计与实现', 'yes', 'no', '90', '90', '66', 'oo', 'yb', '6', '93.0', '5001130001', 'yse', '曾宪权', '张三');
INSERT INTO `xslw` VALUES ('电子邮件客户端软件', '5001130002', '小红', '数媒', '12396587456', '电子邮件客户端软件(C#) ', 'yes', 'no', '80', '90', '80', 'aaaa', 'aaaa', 'aaaa', '82.5', '5001130002', 'yse', '曾宪权', '张三');
INSERT INTO `xslw` VALUES ('高校毕业论文系统', '5001130003', '小强', '网络工程', '15987963412', '高校毕业论文系统', 'yes', 'no', '88', '60', '80', 'aaaa', 'aaaa', 'aaaa', '77.0', '5001130003', 'yse', '李梅莲', '李四');
