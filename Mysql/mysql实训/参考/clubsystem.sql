-- phpMyAdmin SQL Dump
-- version 4.5.3.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2024-01-03 03:35:51
-- 服务器版本： 5.7.10-log
-- PHP Version: 5.6.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clubsystem`
--

-- --------------------------------------------------------

--
-- 表的结构 `activity`
--

CREATE TABLE `activity` (
  `actno` char(9) NOT NULL,
  `actname` varchar(10) DEFAULT NULL,
  `deptno` char(9) DEFAULT NULL,
  `content` varchar(10) DEFAULT NULL,
  `expend` varchar(10) DEFAULT NULL,
  `agree` varchar(10) DEFAULT '待审核'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `activity`
--

INSERT INTO `activity` (`actno`, `actname`, `deptno`, `content`, `expend`, `agree`) VALUES
('01', '垃圾分类', '01', '对各种垃圾进行分类', '50', '否'),
('02', '保护环境', '02', '捡垃圾', '30', '同意');

-- --------------------------------------------------------

--
-- 表的结构 `club`
--

CREATE TABLE `club` (
  `cno` int(11) NOT NULL,
  `cname` varchar(10) DEFAULT NULL,
  `settime` date DEFAULT NULL,
  `synopsis` varchar(10) DEFAULT NULL,
  `college` varchar(10) DEFAULT NULL,
  `leader` varchar(10) DEFAULT NULL,
  `teano` char(9) DEFAULT NULL,
  `clubagree` varchar(10) DEFAULT '待审核'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `club`
--

INSERT INTO `club` (`cno`, `cname`, `settime`, `synopsis`, `college`, `leader`, `teano`, `clubagree`) VALUES
(1, '击剑协会', '2005-03-01', '强身健体', '人工智能', '小明', '123456700', '同意'),
(2, '足球协会', '2005-06-01', '团队协作', '电信', '艾米', '123456701', '同意'),
(3, '游泳协会', '2006-04-01', '锻炼身体', '市营', '特鲁', '123456702', '同意'),
(4, '台球协会', '2008-02-01', '休闲娱乐', '医护', '小玉', '123456703', '同意'),
(6, '跆拳道协会', '2005-05-05', '强身健体', '人工智能', '刘棒', '123456705', '同意'),
(5, '蓝星人', '2005-05-01', '探索海底世界', '人工智能', '雨季', '123456704', '同意'),
(7, '烹饪协会', '2005-05-01', '制作美食', '人工智能', '夏洛克', '123456707', '同意');

-- --------------------------------------------------------

--
-- 表的结构 `dept`
--

CREATE TABLE `dept` (
  `deptno` char(9) NOT NULL,
  `deptname` varchar(10) DEFAULT NULL,
  `cno` int(11) DEFAULT NULL,
  `deptsynopsis` varchar(10) DEFAULT NULL,
  `minister` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dept`
--

INSERT INTO `dept` (`deptno`, `deptname`, `cno`, `deptsynopsis`, `minister`) VALUES
('01', '宣传部', 1, '发扬光大', '小明'),
('02', '技术部', 1, '发扬光大', '小张'),
('03', '活动部', 1, '发扬光大', '小红'),
('04', '秘书部', 2, '发扬光大', '小绿'),
('05', '策划部', 1, '发扬光大', '小郭');

-- --------------------------------------------------------

--
-- 表的结构 `joins`
--

CREATE TABLE `joins` (
  `stuno` char(9) NOT NULL DEFAULT '',
  `deptno` char(9) NOT NULL DEFAULT '',
  `position` varchar(10) DEFAULT NULL,
  `subsidy` varchar(10) DEFAULT NULL,
  `jointime` date DEFAULT NULL,
  `leavetime` date DEFAULT '0001-01-01',
  `state` varchar(10) DEFAULT 'null',
  `evaluate` varchar(40) DEFAULT 'null',
  `expression` varchar(10) DEFAULT 'null',
  `teaagree` varchar(10) DEFAULT '待审核',
  `stumanagree` varchar(10) DEFAULT '待审核'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `joins`
--

INSERT INTO `joins` (`stuno`, `deptno`, `position`, `subsidy`, `jointime`, `leavetime`, `state`, `evaluate`, `expression`, `teaagree`, `stumanagree`) VALUES
('20940006', '02', 'null', '0', '2012-05-05', '0001-01-01', 'null', 'null', 'null', '否', '待审核'),
('20940000', '01', '部长', '50', '2010-05-05', '0001-01-01', 'null', '很棒', '优秀', '同意', '已发放'),
('20940001', '02', '部长', '50', '2011-05-05', '0001-01-01', 'null', 'null', 'null', '同意', '已发放'),
('20940002', '03', '部长', '50', '2010-06-05', '0001-01-01', 'null', '很棒', '优秀', '同意', '待审核'),
('20940004', '01', 'null', '50', '2022-10-01', '2022-10-02', '离职', 'null', 'null', '待审核', '待审核'),
('20940003', '02', 'null', '0', '2012-05-05', '2022-10-02', '离职', 'null', 'null', '否', '待审核'),
('20940007', '04', 'null', '0', '2012-05-05', '2022-10-03', '离职', 'null', 'null', '待审核', '待审核'),
('20940008', '04', 'null', '50', '2022-10-01', '2022-10-02', '离职', 'null', 'null', '待审核', '待审核'),
('20940005', '04', '部长', '30', '2022-10-01', '0001-01-01', 'null', '表现不错', 'null', '同意', '已发放'),
('20940014', '05', '部长', '50', '2012-05-05', '0001-01-01', 'null', 'null', '优秀', '同意', '待审核'),
('20940052', '05', 'null', '0', '2022-10-01', '0001-01-01', 'null', 'null', 'null', '否', '待审核'),
('20940009', '01', 'null', '0', '2022-10-01', '0001-01-01', 'null', 'null', 'null', '同意', '待审核');

--
-- 触发器 `joins`
--
DELIMITER $$
CREATE TRIGGER `tr_joins_leave` BEFORE UPDATE ON `joins` FOR EACH ROW begin
if new.leavetime <> old.leavetime and new.leavetime < '2022.10.1'
then set new.state='离职';set new.leavetime='2022.10.2';
elseif new.leavetime <> old.leavetime
then set new.state='离职';
end if;
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- 表的结构 `student`
--

CREATE TABLE `student` (
  `stuno` char(9) NOT NULL,
  `stuname` varchar(10) DEFAULT NULL,
  `charact` varchar(10) DEFAULT NULL,
  `college` varchar(10) DEFAULT NULL,
  `phonenum` char(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `student`
--

INSERT INTO `student` (`stuno`, `stuname`, `charact`, `college`, `phonenum`) VALUES
('20940000', '小明', '跑步', '人工智能', '12345678911'),
('20940001', '小米', '唱歌', '电信', '12345678912'),
('20940002', '小红', '游泳', '医护', '12345678913'),
('20940003', '小张', '跑步', '人工智能', '12345678914'),
('20940004', '小蓝', '唱歌', '电信', '12345678915'),
('20940005', '小绿', '游泳', '医护', '12345678916'),
('20940006', '小白', '跑步', '人工智能', '12345678917'),
('20940007', '小黑', '唱歌', '电信', '12345678918'),
('20940008', '小黄', '游泳', '医护', '12345678919'),
('20940009', '夏洛克', '做饭', '医护', '12345678920'),
('20940010', '艾米', '打游戏', '医护', '12345678921'),
('20940011', '小玉', '跳高', '医护', '12345678922'),
('20940012', '特鲁', '睡觉', '医护', '12345678923'),
('20940052', '小郭', '吃', '人工智能', '12345678925'),
('20940014', '向宇', '跑步', '人工智能', '12345678926'),
('20940015', '刘棒', '唱歌', '电信', '12345678927'),
('20940016', '雨季', '游泳', '医护', '12345678928');

-- --------------------------------------------------------

--
-- 表的结构 `teacher`
--

CREATE TABLE `teacher` (
  `teano` char(9) NOT NULL,
  `teaname` varchar(10) DEFAULT NULL,
  `teacollege` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `teacher`
--

INSERT INTO `teacher` (`teano`, `teaname`, `teacollege`) VALUES
('123456700', '孙强', '人工智能'),
('123456701', '苏珊', '电信'),
('123456702', '杨立', '医护'),
('123456703', '李成', '市营'),
('123456704', '孙豪', '人工智能'),
('123456705', '大兵', '电信'),
('123456706', '大壮', '市营'),
('123456707', '黄升', '人工智能');

-- --------------------------------------------------------

--
-- 表的结构 `tkact`
--

CREATE TABLE `tkact` (
  `actno` char(9) NOT NULL DEFAULT '',
  `stuno` char(9) NOT NULL DEFAULT '',
  `state` varchar(11) DEFAULT NULL,
  `work` varchar(40) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tkact`
--

INSERT INTO `tkact` (`actno`, `stuno`, `state`, `work`) VALUES
('01', '20940001', '很好', '检查分类是否正确'),
('01', '20940002', '优', '检查分类是否正确'),
('01', '20940091', 'null', '管理现场秩序'),
('02', '20940001', '很棒', '宣传保护环境'),
('02', '20940002', '良', '捡起身边的垃圾'),
('02', '20940004', '良', '捡起身边的垃圾'),
('02', '20940006', 'null', '捡起身边的垃圾'),
('01', '20940000', '很棒', '检查分类是否正确');

-- --------------------------------------------------------

--
-- 表的结构 `work`
--

CREATE TABLE `work` (
  `stuno` char(9) DEFAULT NULL,
  `summary` varchar(10) DEFAULT NULL,
  `deptno` char(9) DEFAULT NULL,
  `evaluate` varchar(10) DEFAULT 'null'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `work`
--

INSERT INTO `work` (`stuno`, `summary`, `deptno`, `evaluate`) VALUES
('20940002', '运动快乐', '04', '很好'),
('20940004', '运动快乐', '04', 'null');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`actno`),
  ADD KEY `fk_activity_deptno` (`deptno`);

--
-- Indexes for table `club`
--
ALTER TABLE `club`
  ADD PRIMARY KEY (`cno`),
  ADD KEY `fk_club_teano` (`teano`);

--
-- Indexes for table `dept`
--
ALTER TABLE `dept`
  ADD PRIMARY KEY (`deptno`),
  ADD KEY `fk_dept_cno` (`cno`);

--
-- Indexes for table `joins`
--
ALTER TABLE `joins`
  ADD PRIMARY KEY (`stuno`,`deptno`),
  ADD KEY `fk_join_deptno` (`deptno`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`stuno`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`teano`);

--
-- Indexes for table `tkact`
--
ALTER TABLE `tkact`
  ADD PRIMARY KEY (`stuno`,`actno`),
  ADD KEY `fk_tkact_actno` (`actno`);

--
-- Indexes for table `work`
--
ALTER TABLE `work`
  ADD KEY `fk_work_stuno` (`stuno`),
  ADD KEY `fk_work_deptno` (`deptno`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `club`
--
ALTER TABLE `club`
  MODIFY `cno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
