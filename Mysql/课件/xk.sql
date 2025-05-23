-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 2020-11-27 04:53:41
-- 服务器版本： 5.7.17-log
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `xk`
--

-- --------------------------------------------------------

--
-- 表的结构 `class`
--

CREATE TABLE `class` (
  `ClassNo` char(8) NOT NULL,
  `DepartNo` char(2) NOT NULL,
  `ClassName` char(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `class`
--

INSERT INTO `class` (`ClassNo`, `DepartNo`, `ClassName`) VALUES
('20000001', '01', '00电子商务'),
('20000002', '01', '00多媒体'),
('20000003', '01', '00数据库'),
('20000004', '02', '00建筑管理'),
('20000005', '02', '00建筑电气'),
('20000006', '03', '00旅游管理'),
('20010001', '01', '01电子商务'),
('20010002', '01', '01多媒体'),
('20010003', '01', '01数据库'),
('20010004', '02', '01建筑管理'),
('20010005', '02', '01建筑电气'),
('20010006', '03', '01旅游管理'),
('20020001', '01', '02电子商务'),
('20020002', '01', '02多媒体'),
('20020003', '01', '02数据库'),
('20020004', '02', '02建筑管理'),
('20020005', '02', '02建筑电气'),
('20020006', '03', '02旅游管理');

-- --------------------------------------------------------

--
-- 表的结构 `course`
--

CREATE TABLE `course` (
  `CouNo` char(3) NOT NULL,
  `CouName` char(30) NOT NULL,
  `Kind` char(8) NOT NULL,
  `Credit` decimal(5,0) NOT NULL,
  `Teacher` char(20) NOT NULL,
  `DepartNo` char(2) NOT NULL,
  `SchoolTime` char(10) NOT NULL,
  `LimitNum` decimal(5,0) NOT NULL,
  `WillNum` decimal(5,0) NOT NULL,
  `ChooseNum` decimal(5,0) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `course`
--

INSERT INTO `course` (`CouNo`, `CouName`, `Kind`, `Credit`, `Teacher`, `DepartNo`, `SchoolTime`, `LimitNum`, `WillNum`, `ChooseNum`) VALUES
('001', 'SQL SERVER技术与应用', '信息技术', '3', '徐人凤', '01', '周二5-6节', '25', '43', '0'),
('002', 'JAVA技术的开发应用', '信息技术', '2', '程伟彬', '01', '周二5-6节', '10', '35', '0'),
('003', '网络信息检索原理与技术', '信息技术', '2', '李涛', '01', '周二晚', '10', '29', '0'),
('004', 'Linux操作系统', '信息技术', '2', '郑星', '01', '周二5-6节', '10', '33', '0'),
('005', 'Premiere6.0影视制作', '信息技术', '2', '李韵婷', '01', '周二5-6节', '20', '27', '0'),
('006', 'Director动画电影设计与制作', '信息技术', '2', '陈子仪', '01', '周二5-6节', '10', '27', '0'),
('007', 'Delphi初级程序员', '信息技术', '2', '李兰', '01', '周二5-6节', '20', '27', '0'),
('008', 'ASP.NET应用', '信息技术', '3', '曾建华', '01', '周二5-6节', '10', '45', '0'),
('009', '水资源利用管理与保护', '工程技术', '2', '叶艳茵', '02', '周二晚', '10', '31', '0'),
('010', '中级电工理论', '工程技术', '3', '范敬丽', '02', '周二5-6节', '5', '24', '0'),
('011', '中外建筑欣赏', '人文', '2', '林泉', '02', '周二5-6节', '20', '27', '0'),
('012', '智能建筑', '工程技术', '2', '王娜', '02', '周二5-6节', '10', '21', '0'),
('013', '房地产漫谈', '人文', '2', '黄强', '02', '周二5-6节', '10', '36', '0'),
('014', '科技与探索', '人文', '2', '顾苑玲', '02', '周二5-6节', '10', '24', '0'),
('015', '民俗风情旅游', '管理', '2', '杨国润', '03', '周二5-6节', '20', '33', '0'),
('016', '旅行社经营管理', '管理', '2', '黄文昌', '03', '周二5-6节', '20', '36', '0'),
('017', '世界旅游', '人文', '2', '盛德文', '03', '周二5-6节', '10', '27', '0'),
('018', '中餐菜肴制作', '人文', '2', '卢萍', '03', '周二5-6节', '5', '66', '0'),
('019', '电子出版概论', '工程技术', '2', '李力', '03', '周二5-6节', '10', '0', '0');

-- --------------------------------------------------------

--
-- 表的结构 `department`
--

CREATE TABLE `department` (
  `DepartNo` char(2) NOT NULL,
  `DepartName` char(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `department`
--

INSERT INTO `department` (`DepartNo`, `DepartName`) VALUES
('01', '计算机应用工程系'),
('02', '建筑工程系'),
('03', '旅游系'),
('00', '网站管理');

-- --------------------------------------------------------

--
-- 表的结构 `stucou`
--

CREATE TABLE `stucou` (
  `StuNo` char(8) NOT NULL,
  `CouNo` char(3) NOT NULL,
  `WillOrder` smallint(6) NOT NULL,
  `State` char(2) NOT NULL,
  `RandomNum` char(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `stucou`
--

INSERT INTO `stucou` (`StuNo`, `CouNo`, `WillOrder`, `State`, `RandomNum`) VALUES
('00000001', '009', 2, '报名', NULL),
('00000001', '002', 1, '报名', NULL),
('00000003', '002', 2, '报名', ''),
('00000003', '003', 3, '报名', ''),
('00000003', '009', 1, '报名', ''),
('00000004', '005', 2, '报名', ''),
('00000004', '013', 3, '报名', ''),
('00000004', '018', 1, '报名', ''),
('00000005', '004', 2, '报名', ''),
('00000005', '017', 3, '报名', ''),
('00000005', '018', 1, '报名', ''),
('00000006', '001', 1, '报名', ''),
('00000006', '006', 2, '报名', ''),
('00000006', '012', 4, '报名', ''),
('00000006', '016', 3, '报名', ''),
('00000007', '002', 2, '报名', ''),
('00000007', '003', 1, '报名', ''),
('00000007', '004', 3, '报名', ''),
('00000008', '005', 2, '报名', ''),
('00000008', '018', 1, '报名', ''),
('00000009', '003', 1, '报名', ''),
('00000009', '006', 2, '报名', ''),
('00000009', '018', 1, '报名', ''),
('00000010', '004', 2, '报名', ''),
('00000010', '015', 3, '报名', ''),
('00000010', '018', 1, '报名', ''),
('00000011', '001', 1, '报名', ''),
('00000011', '002', 4, '报名', ''),
('00000011', '016', 2, '报名', ''),
('00000011', '017', 3, '报名', ''),
('00000012', '002', 1, '报名', ''),
('00000012', '010', 2, '报名', ''),
('00000012', '014', 3, '报名', ''),
('00000013', '006', 4, '报名', ''),
('00000013', '007', 1, '报名', ''),
('00000013', '012', 2, '报名', ''),
('00000013', '013', 5, '报名', ''),
('00000013', '015', 3, '报名', ''),
('00000014', '002', 3, '报名', ''),
('00000014', '004', 2, '报名', ''),
('00000014', '018', 1, '报名', ''),
('00000015', '001', 3, '报名', ''),
('00000015', '003', 1, '报名', ''),
('00000015', '008', 2, '报名', ''),
('00000015', '009', 4, '报名', ''),
('00000016', '010', 3, '报名', ''),
('00000016', '012', 1, '报名', ''),
('00000016', '017', 2, '报名', ''),
('00000017', '004', 1, '报名', ''),
('00000017', '006', 3, '报名', ''),
('00000017', '016', 2, '报名', ''),
('00000018', '003', 5, '报名', ''),
('00000018', '007', 4, '报名', ''),
('00000018', '013', 3, '报名', ''),
('00000018', '015', 2, '报名', ''),
('00000018', '018', 1, '报名', ''),
('00000019', '002', 1, '报名', ''),
('00000019', '008', 2, '报名', ''),
('00000019', '014', 3, '报名', ''),
('00000020', '004', 3, '报名', ''),
('00000020', '012', 2, '报名', ''),
('00000020', '018', 1, '报名', ''),
('00000021', '003', 1, '报名', ''),
('00000021', '013', 2, '报名', ''),
('00000021', '014', 4, '报名', ''),
('00000021', '015', 5, '报名', ''),
('00000021', '016', 3, '报名', ''),
('00000022', '003', 1, '报名', ''),
('00000023', '002', 3, '报名', ''),
('00000023', '004', 1, '报名', ''),
('00000023', '008', 2, '报名', ''),
('00000024', '006', 2, '报名', ''),
('00000024', '017', 3, '报名', ''),
('00000024', '018', 1, '报名', ''),
('00000026', '003', 2, '报名', ''),
('00000026', '004', 1, '报名', ''),
('00000027', '001', 1, '报名', ''),
('00000027', '012', 3, '报名', ''),
('00000027', '014', 2, '报名', ''),
('00000027', '016', 4, '报名', ''),
('00000028', '002', 2, '报名', ''),
('00000028', '008', 3, '报名', ''),
('00000028', '010', 1, '报名', ''),
('00000029', '006', 5, '报名', ''),
('00000029', '013', 1, '报名', ''),
('00000029', '014', 4, '报名', ''),
('00000029', '015', 2, '报名', ''),
('00000029', '017', 3, '报名', ''),
('00000030', '004', 3, '报名', ''),
('00000030', '007', 4, '报名', ''),
('00000030', '012', 2, '报名', ''),
('00000030', '018', 1, '报名', ''),
('00000031', '002', 2, '报名', ''),
('00000031', '005', 3, '报名', ''),
('00000031', '010', 1, '报名', ''),
('00000032', '009', 1, '报名', ''),
('00000032', '016', 2, '报名', ''),
('00000033', '001', 1, '报名', ''),
('00000033', '008', 2, '报名', ''),
('00000033', '014', 3, '报名', ''),
('00000033', '015', 5, '报名', ''),
('00000033', '017', 4, '报名', ''),
('00000034', '002', 2, '报名', ''),
('00000034', '008', 4, '报名', ''),
('00000034', '013', 3, '报名', ''),
('00000034', '018', 1, '报名', ''),
('00000035', '006', 1, '报名', ''),
('00000035', '008', 2, '报名', ''),
('00000035', '016', 3, '报名', ''),
('00000036', '007', 1, '报名', ''),
('00000036', '010', 2, '报名', ''),
('00000036', '013', 3, '报名', ''),
('00000037', '002', 1, '报名', ''),
('00000037', '009', 4, '报名', ''),
('00000037', '014', 3, '报名', ''),
('00000037', '017', 5, '报名', ''),
('00000037', '018', 2, '报名', ''),
('00000038', '001', 2, '报名', ''),
('00000038', '008', 1, '报名', ''),
('00000038', '011', 3, '报名', ''),
('00000038', '015', 4, '报名', ''),
('00000039', '018', 1, '报名', ''),
('00000040', '016', 1, '报名', ''),
('00000041', '005', 3, '报名', ''),
('00000041', '008', 4, '报名', ''),
('00000041', '010', 5, '报名', ''),
('00000041', '011', 2, '报名', ''),
('00000041', '018', 1, '报名', ''),
('00000042', '008', 2, '报名', ''),
('00000042', '013', 1, '报名', ''),
('00000042', '015', 3, '报名', ''),
('00000043', '005', 1, '报名', ''),
('00000043', '011', 3, '报名', ''),
('00000043', '016', 2, '报名', ''),
('00000044', '005', 3, '报名', ''),
('00000044', '007', 1, '报名', ''),
('00000044', '009', 2, '报名', ''),
('00000045', '001', 2, '报名', ''),
('00000045', '010', 3, '报名', ''),
('00000045', '018', 1, '报名', ''),
('00000046', '008', 4, '报名', ''),
('00000046', '011', 1, '报名', ''),
('00000046', '013', 5, '报名', ''),
('00000046', '015', 2, '报名', ''),
('00000046', '017', 3, '报名', ''),
('00000047', '005', 3, '报名', ''),
('00000047', '008', 1, '报名', ''),
('00000047', '018', 2, '报名', ''),
('00000048', '009', 2, '报名', ''),
('00000048', '011', 1, '报名', ''),
('00000048', '013', 3, '报名', ''),
('00000049', '007', 3, '报名', ''),
('00000049', '015', 2, '报名', ''),
('00000049', '016', 1, '报名', ''),
('00000050', '005', 5, '报名', ''),
('00000050', '008', 3, '报名', ''),
('00000050', '011', 2, '报名', ''),
('00000050', '016', 4, '报名', ''),
('00000050', '018', 1, '报名', ''),
('00000051', '001', 1, '报名', ''),
('00000051', '008', 4, '报名', ''),
('00000051', '009', 3, '报名', ''),
('00000051', '013', 5, '报名', ''),
('00000051', '018', 2, '报名', ''),
('00000052', '001', 1, '报名', ''),
('00000052', '007', 3, '报名', ''),
('00000052', '011', 2, '报名', ''),
('00000054', '005', 2, '报名', ''),
('00000054', '006', 3, '报名', ''),
('00000054', '009', 1, '报名', ''),
('00000055', '001', 1, '报名', ''),
('00000055', '009', 2, '报名', ''),
('00000056', '001', 3, '报名', ''),
('00000056', '007', 5, '报名', ''),
('00000056', '011', 4, '报名', ''),
('00000056', '016', 2, '报名', ''),
('00000056', '018', 1, '报名', ''),
('00000057', '001', 1, '报名', ''),
('00000057', '015', 2, '报名', ''),
('00000058', '007', 2, '报名', ''),
('00000058', '009', 3, '报名', ''),
('00000058', '014', 1, '报名', ''),
('00000059', '001', 1, '报名', ''),
('00000059', '004', 4, '报名', ''),
('00000059', '006', 5, '报名', ''),
('00000059', '011', 3, '报名', ''),
('00000059', '013', 2, '报名', ''),
('00000060', '010', 3, '报名', ''),
('00000060', '012', 2, '报名', ''),
('00000060', '018', 1, '报名', ''),
('01000001', '001', 1, '报名', ''),
('01000001', '002', 4, '报名', ''),
('01000001', '003', 3, '报名', ''),
('01000001', '017', 5, '报名', ''),
('01000001', '018', 2, '报名', ''),
('01000002', '001', 1, '报名', ''),
('01000002', '004', 4, '报名', ''),
('01000002', '008', 3, '报名', ''),
('01000002', '018', 2, '报名', ''),
('01000003', '002', 2, '报名', ''),
('01000003', '003', 3, '报名', ''),
('01000003', '009', 1, '报名', ''),
('01000004', '005', 2, '报名', ''),
('01000004', '013', 3, '报名', ''),
('01000004', '018', 1, '报名', ''),
('01000005', '004', 2, '报名', ''),
('01000005', '017', 3, '报名', ''),
('01000005', '018', 1, '报名', ''),
('01000006', '001', 1, '报名', ''),
('01000006', '006', 2, '报名', ''),
('01000006', '012', 4, '报名', ''),
('01000006', '016', 3, '报名', ''),
('01000007', '002', 2, '报名', ''),
('01000007', '003', 1, '报名', ''),
('01000007', '004', 3, '报名', ''),
('01000008', '005', 2, '报名', ''),
('01000008', '018', 1, '报名', ''),
('01000009', '003', 1, '报名', ''),
('01000009', '006', 2, '报名', ''),
('01000009', '018', 1, '报名', ''),
('01000010', '004', 2, '报名', ''),
('01000010', '015', 3, '报名', ''),
('01000010', '018', 1, '报名', ''),
('01000011', '001', 1, '报名', ''),
('01000011', '003', 4, '报名', ''),
('01000011', '016', 2, '报名', ''),
('01000011', '017', 3, '报名', ''),
('01000012', '002', 1, '报名', ''),
('01000012', '010', 2, '报名', ''),
('01000012', '014', 3, '报名', ''),
('01000013', '006', 4, '报名', ''),
('01000013', '007', 1, '报名', ''),
('01000013', '012', 2, '报名', ''),
('01000013', '013', 5, '报名', ''),
('01000013', '015', 3, '报名', ''),
('01000014', '002', 3, '报名', ''),
('01000014', '004', 2, '报名', ''),
('01000014', '018', 1, '报名', ''),
('01000015', '001', 3, '报名', ''),
('01000015', '003', 1, '报名', ''),
('01000015', '008', 2, '报名', ''),
('01000015', '009', 4, '报名', ''),
('01000016', '010', 3, '报名', ''),
('01000016', '012', 1, '报名', ''),
('01000016', '017', 2, '报名', ''),
('01000017', '004', 1, '报名', ''),
('01000017', '006', 3, '报名', ''),
('01000017', '016', 2, '报名', ''),
('01000018', '003', 5, '报名', ''),
('01000018', '007', 4, '报名', ''),
('01000018', '013', 3, '报名', ''),
('01000018', '015', 2, '报名', ''),
('01000018', '018', 1, '报名', ''),
('01000019', '002', 1, '报名', ''),
('01000019', '008', 2, '报名', ''),
('01000019', '014', 3, '报名', ''),
('01000020', '004', 3, '报名', ''),
('01000020', '012', 2, '报名', ''),
('01000020', '018', 1, '报名', ''),
('01000021', '003', 1, '报名', ''),
('01000021', '013', 2, '报名', ''),
('01000021', '014', 4, '报名', ''),
('01000021', '015', 5, '报名', ''),
('01000021', '016', 3, '报名', ''),
('01000022', '003', 1, '报名', ''),
('01000023', '002', 3, '报名', ''),
('01000023', '004', 1, '报名', ''),
('01000023', '008', 2, '报名', ''),
('01000024', '006', 2, '报名', ''),
('01000024', '017', 3, '报名', ''),
('01000024', '018', 1, '报名', ''),
('01000026', '003', 2, '报名', ''),
('01000026', '004', 1, '报名', ''),
('01000027', '001', 1, '报名', ''),
('01000027', '012', 3, '报名', ''),
('01000027', '014', 2, '报名', ''),
('01000027', '016', 4, '报名', ''),
('01000028', '002', 2, '报名', ''),
('01000028', '008', 3, '报名', ''),
('01000028', '010', 1, '报名', ''),
('01000029', '006', 5, '报名', ''),
('01000029', '013', 1, '报名', ''),
('01000029', '014', 4, '报名', ''),
('01000029', '015', 2, '报名', ''),
('01000029', '017', 3, '报名', ''),
('01000030', '004', 3, '报名', ''),
('01000030', '007', 4, '报名', ''),
('01000030', '012', 2, '报名', ''),
('01000030', '018', 1, '报名', ''),
('01000031', '002', 2, '报名', ''),
('01000031', '005', 3, '报名', ''),
('01000031', '010', 1, '报名', ''),
('01000032', '009', 1, '报名', ''),
('01000032', '016', 2, '报名', ''),
('01000033', '001', 1, '报名', ''),
('01000033', '008', 2, '报名', ''),
('01000033', '014', 3, '报名', ''),
('01000033', '015', 5, '报名', ''),
('01000033', '017', 4, '报名', ''),
('01000034', '002', 2, '报名', ''),
('01000034', '008', 4, '报名', ''),
('01000034', '013', 3, '报名', ''),
('01000034', '018', 1, '报名', ''),
('01000035', '006', 1, '报名', ''),
('01000035', '008', 2, '报名', ''),
('01000035', '016', 3, '报名', ''),
('01000036', '007', 1, '报名', ''),
('01000036', '010', 2, '报名', ''),
('01000036', '013', 3, '报名', ''),
('01000037', '002', 1, '报名', ''),
('01000037', '009', 4, '报名', ''),
('01000037', '014', 3, '报名', ''),
('01000037', '017', 5, '报名', ''),
('01000037', '018', 2, '报名', ''),
('01000038', '001', 2, '报名', ''),
('01000038', '008', 1, '报名', ''),
('01000038', '011', 3, '报名', ''),
('01000038', '015', 4, '报名', ''),
('01000039', '018', 1, '报名', ''),
('01000040', '016', 1, '报名', ''),
('01000041', '005', 3, '报名', ''),
('01000041', '008', 4, '报名', ''),
('01000041', '010', 5, '报名', ''),
('01000041', '011', 2, '报名', ''),
('01000041', '018', 1, '报名', ''),
('01000042', '008', 2, '报名', ''),
('01000042', '013', 1, '报名', ''),
('01000042', '015', 3, '报名', ''),
('01000043', '005', 1, '报名', ''),
('01000043', '011', 3, '报名', ''),
('01000043', '016', 2, '报名', ''),
('01000044', '005', 3, '报名', ''),
('01000044', '007', 1, '报名', ''),
('01000044', '009', 2, '报名', ''),
('01000045', '001', 2, '报名', ''),
('01000045', '010', 3, '报名', ''),
('01000045', '018', 1, '报名', ''),
('01000046', '008', 4, '报名', ''),
('01000046', '011', 1, '报名', ''),
('01000046', '013', 5, '报名', ''),
('01000046', '015', 2, '报名', ''),
('01000046', '017', 3, '报名', ''),
('01000047', '005', 3, '报名', ''),
('01000047', '008', 1, '报名', ''),
('01000047', '018', 2, '报名', ''),
('01000048', '009', 2, '报名', ''),
('01000048', '011', 1, '报名', ''),
('01000048', '013', 3, '报名', ''),
('01000049', '007', 3, '报名', ''),
('01000049', '015', 2, '报名', ''),
('01000049', '016', 1, '报名', ''),
('01000050', '005', 5, '报名', ''),
('01000050', '008', 3, '报名', ''),
('01000050', '011', 2, '报名', ''),
('01000050', '016', 4, '报名', ''),
('01000050', '018', 1, '报名', ''),
('01000051', '001', 1, '报名', ''),
('01000051', '008', 4, '报名', ''),
('01000051', '009', 3, '报名', ''),
('01000051', '013', 5, '报名', ''),
('01000051', '018', 2, '报名', ''),
('01000052', '001', 1, '报名', ''),
('01000052', '007', 3, '报名', ''),
('01000052', '011', 2, '报名', ''),
('01000054', '005', 2, '报名', ''),
('01000054', '006', 3, '报名', ''),
('01000054', '009', 1, '报名', ''),
('01000055', '001', 1, '报名', ''),
('01000055', '009', 2, '报名', ''),
('01000056', '007', 3, '报名', ''),
('01000056', '009', 5, '报名', ''),
('01000056', '011', 4, '报名', ''),
('01000056', '016', 2, '报名', ''),
('01000056', '018', 1, '报名', ''),
('01000057', '001', 1, '报名', ''),
('01000057', '015', 2, '报名', ''),
('01000058', '007', 2, '报名', ''),
('01000058', '009', 3, '报名', ''),
('01000058', '014', 1, '报名', ''),
('01000059', '001', 1, '报名', ''),
('01000059', '004', 4, '报名', ''),
('01000059', '006', 5, '报名', ''),
('01000059', '011', 3, '报名', ''),
('01000059', '013', 2, '报名', ''),
('01000060', '010', 3, '报名', ''),
('01000060', '012', 2, '报名', ''),
('01000060', '018', 1, '报名', ''),
('02000001', '001', 1, '报名', ''),
('02000001', '002', 4, '报名', ''),
('02000001', '003', 3, '报名', ''),
('02000001', '017', 5, '报名', ''),
('02000001', '018', 2, '报名', ''),
('02000002', '001', 1, '报名', ''),
('02000002', '004', 4, '报名', ''),
('02000002', '008', 3, '报名', ''),
('02000002', '018', 2, '报名', ''),
('02000003', '002', 2, '报名', ''),
('02000003', '003', 3, '报名', ''),
('02000003', '009', 1, '报名', ''),
('02000004', '005', 2, '报名', ''),
('02000004', '013', 3, '报名', ''),
('02000004', '018', 1, '报名', ''),
('02000005', '004', 2, '报名', ''),
('02000005', '017', 3, '报名', ''),
('02000005', '018', 1, '报名', ''),
('02000006', '001', 1, '报名', ''),
('02000006', '006', 2, '报名', ''),
('02000006', '012', 4, '报名', ''),
('02000006', '016', 3, '报名', ''),
('02000007', '002', 2, '报名', ''),
('02000007', '003', 1, '报名', ''),
('02000007', '004', 3, '报名', ''),
('02000008', '005', 2, '报名', ''),
('02000008', '018', 1, '报名', ''),
('02000009', '003', 1, '报名', ''),
('02000009', '006', 2, '报名', ''),
('02000009', '018', 1, '报名', ''),
('02000010', '004', 2, '报名', ''),
('02000010', '015', 3, '报名', ''),
('02000010', '018', 1, '报名', ''),
('02000011', '001', 1, '报名', ''),
('02000011', '003', 4, '报名', ''),
('02000011', '016', 2, '报名', ''),
('02000011', '017', 3, '报名', ''),
('02000012', '002', 1, '报名', ''),
('02000012', '010', 2, '报名', ''),
('02000012', '014', 3, '报名', ''),
('02000013', '006', 4, '报名', ''),
('02000013', '007', 1, '报名', ''),
('02000013', '012', 2, '报名', ''),
('02000013', '013', 5, '报名', ''),
('02000013', '015', 3, '报名', ''),
('02000014', '002', 3, '报名', ''),
('02000014', '004', 2, '报名', ''),
('02000014', '018', 1, '报名', ''),
('02000015', '001', 3, '报名', ''),
('02000015', '003', 1, '报名', ''),
('02000015', '008', 2, '报名', ''),
('02000015', '009', 4, '报名', ''),
('02000016', '010', 3, '报名', ''),
('02000016', '012', 1, '报名', ''),
('02000016', '017', 2, '报名', ''),
('02000017', '004', 1, '报名', ''),
('02000017', '006', 3, '报名', ''),
('02000017', '016', 2, '报名', ''),
('02000018', '003', 5, '报名', ''),
('02000018', '007', 4, '报名', ''),
('02000018', '013', 3, '报名', ''),
('02000018', '015', 2, '报名', ''),
('02000018', '018', 1, '报名', ''),
('02000019', '002', 1, '报名', ''),
('02000019', '008', 2, '报名', ''),
('02000019', '014', 3, '报名', ''),
('02000020', '004', 3, '报名', ''),
('02000020', '012', 2, '报名', ''),
('02000020', '018', 1, '报名', ''),
('02000021', '003', 1, '报名', ''),
('02000021', '013', 2, '报名', ''),
('02000021', '014', 4, '报名', ''),
('02000021', '015', 5, '报名', ''),
('02000021', '016', 3, '报名', ''),
('02000022', '003', 1, '报名', ''),
('02000023', '002', 3, '报名', ''),
('02000023', '004', 1, '报名', ''),
('02000023', '008', 2, '报名', ''),
('02000024', '006', 2, '报名', ''),
('02000024', '017', 3, '报名', ''),
('02000024', '018', 1, '报名', ''),
('02000026', '003', 2, '报名', ''),
('02000026', '004', 1, '报名', ''),
('02000027', '001', 1, '报名', ''),
('02000027', '012', 3, '报名', ''),
('02000027', '014', 2, '报名', ''),
('02000027', '016', 4, '报名', ''),
('02000028', '002', 2, '报名', ''),
('02000028', '008', 3, '报名', ''),
('02000028', '010', 1, '报名', ''),
('02000029', '006', 5, '报名', ''),
('02000029', '013', 1, '报名', ''),
('02000029', '014', 4, '报名', ''),
('02000029', '015', 2, '报名', ''),
('02000029', '017', 3, '报名', ''),
('02000030', '004', 3, '报名', ''),
('02000030', '007', 4, '报名', ''),
('02000030', '012', 2, '报名', ''),
('02000030', '018', 1, '报名', ''),
('02000031', '002', 2, '报名', ''),
('02000031', '005', 3, '报名', ''),
('02000031', '010', 1, '报名', ''),
('02000032', '009', 1, '报名', ''),
('02000032', '016', 2, '报名', ''),
('02000033', '001', 1, '报名', ''),
('02000033', '008', 2, '报名', ''),
('02000033', '014', 3, '报名', ''),
('02000033', '015', 5, '报名', ''),
('02000033', '017', 4, '报名', ''),
('02000034', '002', 2, '报名', ''),
('02000034', '008', 4, '报名', ''),
('02000034', '013', 3, '报名', ''),
('02000034', '018', 1, '报名', ''),
('02000035', '006', 1, '报名', ''),
('02000035', '008', 2, '报名', ''),
('02000035', '016', 3, '报名', ''),
('02000036', '007', 1, '报名', ''),
('02000036', '010', 2, '报名', ''),
('02000036', '013', 3, '报名', ''),
('02000037', '002', 1, '报名', ''),
('02000037', '009', 4, '报名', ''),
('02000037', '014', 3, '报名', ''),
('02000037', '017', 5, '报名', ''),
('02000037', '018', 2, '报名', ''),
('02000038', '001', 2, '报名', ''),
('02000038', '008', 1, '报名', ''),
('02000038', '011', 3, '报名', ''),
('02000038', '015', 4, '报名', ''),
('02000039', '018', 1, '报名', ''),
('02000040', '016', 1, '报名', ''),
('02000041', '005', 3, '报名', ''),
('02000041', '008', 4, '报名', ''),
('02000041', '010', 5, '报名', ''),
('02000041', '011', 2, '报名', ''),
('02000041', '018', 1, '报名', ''),
('02000042', '008', 2, '报名', ''),
('02000042', '013', 1, '报名', ''),
('02000042', '015', 3, '报名', ''),
('02000043', '005', 1, '报名', ''),
('02000043', '011', 3, '报名', ''),
('02000043', '016', 2, '报名', ''),
('02000044', '005', 3, '报名', ''),
('02000044', '007', 1, '报名', ''),
('02000044', '009', 2, '报名', ''),
('02000045', '001', 2, '报名', ''),
('02000045', '010', 3, '报名', ''),
('02000045', '018', 1, '报名', ''),
('02000046', '008', 4, '报名', ''),
('02000046', '011', 1, '报名', ''),
('02000046', '013', 5, '报名', ''),
('02000046', '015', 2, '报名', ''),
('02000046', '017', 3, '报名', ''),
('02000047', '005', 3, '报名', ''),
('02000047', '008', 1, '报名', ''),
('02000047', '018', 2, '报名', ''),
('02000048', '009', 2, '报名', ''),
('02000048', '011', 1, '报名', ''),
('02000048', '013', 3, '报名', ''),
('02000049', '007', 3, '报名', ''),
('02000049', '015', 2, '报名', ''),
('02000049', '016', 1, '报名', ''),
('02000050', '005', 5, '报名', ''),
('02000050', '008', 3, '报名', ''),
('02000050', '011', 2, '报名', ''),
('02000050', '016', 4, '报名', ''),
('02000050', '018', 1, '报名', ''),
('02000051', '001', 1, '报名', ''),
('02000051', '008', 4, '报名', ''),
('02000051', '009', 3, '报名', ''),
('02000051', '013', 5, '报名', ''),
('02000051', '018', 2, '报名', ''),
('02000052', '001', 1, '报名', ''),
('02000052', '007', 3, '报名', ''),
('02000052', '011', 2, '报名', ''),
('02000054', '005', 2, '报名', ''),
('02000054', '006', 3, '报名', ''),
('02000054', '009', 1, '报名', ''),
('02000055', '001', 1, '报名', ''),
('02000055', '009', 2, '报名', ''),
('02000056', '002', 3, '报名', ''),
('02000056', '007', 5, '报名', ''),
('02000056', '011', 4, '报名', ''),
('02000056', '016', 2, '报名', ''),
('02000056', '018', 1, '报名', ''),
('02000057', '001', 1, '报名', ''),
('02000057', '015', 2, '报名', ''),
('02000058', '007', 2, '报名', ''),
('02000058', '009', 3, '报名', ''),
('02000058', '014', 1, '报名', ''),
('02000059', '001', 1, '报名', ''),
('02000059', '004', 4, '报名', ''),
('02000059', '006', 5, '报名', ''),
('02000059', '011', 3, '报名', ''),
('02000059', '013', 2, '报名', ''),
('02000060', '010', 3, '报名', ''),
('02000060', '012', 2, '报名', ''),
('02000060', '018', 1, '报名', '');

-- --------------------------------------------------------

--
-- 表的结构 `student`
--

CREATE TABLE `student` (
  `StuNo` char(8) NOT NULL,
  `ClassNo` char(8) NOT NULL,
  `StuName` char(10) NOT NULL,
  `Pwd` char(8) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `student`
--

INSERT INTO `student` (`StuNo`, `ClassNo`, `StuName`, `Pwd`) VALUES
('00000001', '20000001', 'test', '00000001'),
('00000002', '20000001', '彭少帆', '00000002'),
('00000003', '20000001', '曾敏馨', '777B2DE7'),
('00000004', '20000001', '张晶晶', 'EDE4293B'),
('00000005', '20000001', '曹业成', 'A08E56C4'),
('00000006', '20000001', '甘蕾', '3178C441'),
('00000007', '20000001', '凌晓文', 'B7E6F4BE'),
('00000008', '20000001', '梁亮', 'BFDEB84F'),
('00000009', '20000001', '陈燕珊', 'A4A0BDFF'),
('00000010', '20000001', '韩霞', '4033A878'),
('00000011', '20000002', '朱川', '19C5653D'),
('00000012', '20000002', '杜晓静', '117A709E'),
('00000013', '20000002', '黄元科', 'C6C1E2B7'),
('00000014', '20000002', '罗飞', '6808A559'),
('00000015', '20000002', '李林', 'E65AF58A'),
('00000016', '20000002', '赖梅', '767591C7'),
('00000017', '20000002', '麦嘉', 'B7E43E7C'),
('00000018', '20000002', '李月', '3B6EC650'),
('00000019', '20000002', '陈艳婷', '22018D60'),
('00000020', '20000002', '庄雯', 'C72BFBA3'),
('00000021', '20000003', '赖家嘉', '34A7E284'),
('00000022', '20000003', '黄磊', '2A0BF98F'),
('00000023', '20000003', '熊华', 'AC79E811'),
('00000024', '20000003', '李红', '1339DD8E'),
('00000025', '20000003', '廖杰', '659E5EDC'),
('00000026', '20000003', '赵玉平', 'E9FEF281'),
('00000027', '20000003', '朱丽', '7AC30191'),
('00000028', '20000003', '何丽仪', '78E651FD'),
('00000029', '20000003', '梁燕燕', '5E749F6B'),
('00000030', '20000003', '黄惜', '18716F45'),
('00000031', '20000004', '陈金菊', 'F14A4F4E'),
('00000032', '20000004', '杨华', '36AC2AEE'),
('00000033', '20000004', '侯刚', 'C6FB73CC'),
('00000034', '20000004', '李辉', 'B037B994'),
('00000035', '20000004', '张梅', 'F5679BD7'),
('00000036', '20000004', '赵育华', '6FF965B9'),
('00000037', '20000004', '徐敬大', '0A1D0844'),
('00000038', '20000004', '孙量', '5111D018'),
('00000039', '20000004', '马嘉达', 'E6C13CC0'),
('00000040', '20000004', '叶素华', 'E8DDE378'),
('00000041', '20000005', '卓峰', '9E24D1FD'),
('00000042', '20000005', '陈滔', 'ADACC023'),
('00000043', '20000005', '韩文', '601AFE7F'),
('00000044', '20000005', '李向兵', '6D33D2F8'),
('00000045', '20000005', '杨斌', '06081845'),
('00000046', '20000005', '张峰', 'A420DB16'),
('00000047', '20000005', '张素琴', '027A9133'),
('00000048', '20000005', '谭旭东', '02D3BFDB'),
('00000049', '20000005', '马振烽', '7AB54DD0'),
('00000050', '20000005', '吴珊', 'FB40F89F'),
('00000051', '20000006', '刘长征', '6CA4EE50'),
('00000052', '20000006', '周金华', '9ADB786A'),
('00000053', '20000006', '李开豫', '6E2CC253'),
('00000054', '20000006', '李丽平', 'AA57BCE2'),
('00000055', '20000006', '艾锋', '2CA8FE76'),
('00000056', '20000006', '吴文杰', 'D7C83477'),
('00000057', '20000006', '吴黎斌', 'FF047C42'),
('00000058', '20000006', '王明安', '14A7C8AB'),
('00000059', '20000006', '罗远新', '1052CCF8'),
('00000060', '20000006', '黄月英', '3ACE2670'),
('01000001', '20010001', '周英', 'F126361D'),
('01000002', '20010001', '郑强', 'C07B5DDA'),
('01000003', '20010001', '唐德兴', 'A2814D09'),
('01000004', '20010001', '高胜', '595A934A'),
('01000005', '20010001', '文荣', 'EC0E5976'),
('01000006', '20010001', '方胜', '10A81E26'),
('01000007', '20010001', '司华全', 'F421A286'),
('01000008', '20010001', '张浩', '28B52E14'),
('01000009', '20010001', '王碧丽', '94C6EA54'),
('01000010', '20010001', '利旭龙', 'E9481979'),
('01000011', '20010002', '单玲', '9D49DAFD'),
('01000012', '20010002', '叶杰', 'FB0617F4'),
('01000013', '20010002', '胡殿贵', '79B290BD'),
('01000014', '20010002', '黄莹', '0EC16D5B'),
('01000015', '20010002', '胡旺', 'EE528507'),
('01000016', '20010002', '纪颖茵', 'B483DC91'),
('01000017', '20010002', '黄菲', '4ACF34EA'),
('01000018', '20010002', '何文', '3C854411'),
('01000019', '20010002', '谢军', 'CE87F718'),
('01000020', '20010002', '马雄', '7DF426DD'),
('01000021', '20010003', '林辉', '838DBE92'),
('01000022', '20010003', '陈婷', 'D05F743D'),
('01000023', '20010003', '李攀', '766F7208'),
('01000024', '20010003', '陈威', '208EF601'),
('01000025', '20010003', '张峰', 'C60321EB'),
('01000026', '20010003', '周芬', '0D3CE5AC'),
('01000027', '20010003', '冼柳如', 'BE2AD025'),
('01000028', '20010003', '尚昌荣', '58386326'),
('01000029', '20010003', '李宝儿', 'CB9A489E'),
('01000030', '20010003', '江婉婵', 'CE3EDA81'),
('01000031', '20010004', '黄丹', '9CB2EBCA'),
('01000032', '20010004', '谢华', 'C3F5D7C6'),
('01000033', '20010004', '郭丽婷', '22765143'),
('01000034', '20010004', '柳萍', '39595413'),
('01000035', '20010004', '叶宁', 'CDEF40F4'),
('01000036', '20010004', '李碧珍', '3ED26A25'),
('01000037', '20010004', '杨建新', 'C1AFBFDE'),
('01000038', '20010004', '李花', '0F20286B'),
('01000039', '20010004', '李云', '47FBC010'),
('01000040', '20010004', '张笑兴', '383094C1'),
('01000041', '20010005', '刘志伟', '5225C9BA'),
('01000042', '20010005', '刘丽文', '618232F2'),
('01000043', '20010005', '王亮', 'A071A5B8'),
('01000044', '20010005', '罗瑶娜', '9E0488EC'),
('01000045', '20010005', '张宇', 'D053E238'),
('01000046', '20010005', '林晓华', '73C4D560'),
('01000047', '20010005', '刘雯', '8C5E49F4'),
('01000048', '20010005', '郑宁', '84318E36'),
('01000049', '20010005', '罗龙', '03AD9CA2'),
('01000050', '20010005', '朱玲', '1DAC44B9'),
('01000051', '20010006', '邹群', '31A8CE69'),
('01000052', '20010006', '王紫枫', 'C0F93456'),
('01000053', '20010006', '陈益达', 'E691B7AA'),
('01000054', '20010006', '彭祥', '51339DB0'),
('01000055', '20010006', '邱星', '90CF3018'),
('01000056', '20010006', '蒋芸', 'C61CFFFE'),
('01000057', '20010006', '颜瑭璐', '511161DD'),
('01000058', '20010006', '薛尧', 'B314A58B'),
('01000059', '20010006', '陈溪', '1BA73A0B'),
('01000060', '20010006', '罗锦辉', '7580F9C7'),
('02000001', '20020001', '叶兆荣', '130F3226'),
('02000002', '20020001', '杨敏茹', '523FC944'),
('02000003', '20020001', '曾敬香', 'C9B6C7F3'),
('02000004', '20020001', '祝海斌', 'B2BDE1E3'),
('02000005', '20020001', '陈霞', '435677C0'),
('02000006', '20020001', '王青', '51BA8C4E'),
('02000007', '20020001', '郑贤', 'E89094ED'),
('02000008', '20020001', '韩燕', 'A31D6C73'),
('02000009', '20020001', '何娟', '81E96113'),
('02000010', '20020001', '顾珍', '7FE993A0'),
('02000011', '20020002', '张飞翔', 'B1330A01'),
('02000012', '20020002', '黄思宇', 'CE9A9E92'),
('02000013', '20020002', '周健鹏', 'C5F048B3'),
('02000014', '20020002', '廖丽娟', '09BAF9FD'),
('02000015', '20020002', '林豫', '18E054EE'),
('02000016', '20020002', '赖霞', '875B13B0'),
('02000017', '20020002', '郑萍', '72459143'),
('02000018', '20020002', '刘海峰', 'CDF3B2DD'),
('02000019', '20020002', '叶虹', 'A49C1F7F'),
('02000020', '20020002', '郑文', '76E700B3'),
('02000021', '20020003', '关霞', '614F9DC1'),
('02000022', '20020003', '莫飞娥', 'E62FD252'),
('02000023', '20020003', '李卉', '3D4D4F7C'),
('02000024', '20020003', '陈慧霞', 'EFAD0BC7'),
('02000025', '20020003', '吴妍', 'AB817022'),
('02000026', '20020003', '于梅', '7B7309C6'),
('02000027', '20020003', '刘燕', '9FC227D7'),
('02000028', '20020003', '洪华', 'B30D51B6'),
('02000029', '20020003', '陈晓旋', '069ECE57'),
('02000030', '20020003', '郭玉芳', '406D601A'),
('02000031', '20020004', '熊秋', '64C52750'),
('02000032', '20020004', '王黔可', '22FD98E5'),
('02000033', '20020004', '林海文', 'AEDEF411'),
('02000034', '20020004', '梁瑞明', '5380E683'),
('02000035', '20020004', '叶小瑶', '3299E519'),
('02000036', '20020004', '苏建龙', '967E08C1'),
('02000037', '20020004', '黎海珊', 'AE51E60E'),
('02000038', '20020004', '丛永杰', '7D25F150'),
('02000039', '20020004', '胡剑星', 'BF69E690'),
('02000040', '20020004', '刁雪娴', 'E1064051'),
('02000041', '20020005', '刘敏彬', 'F3A9C4E3'),
('02000042', '20020005', '盛君', '4035F5D5'),
('02000043', '20020005', '马顺枢', '8D9E71AD'),
('02000044', '20020005', '陈军', '8B0195A0'),
('02000045', '20020005', '王满枝', 'A5D2ABE7'),
('02000046', '20020005', '李翠东', '2F4EF051'),
('02000047', '20020005', '林桂励', 'DB6432BA'),
('02000048', '20020005', '陈国海', 'B1E2C1A6'),
('02000049', '20020005', '许刚', '181AFB6F'),
('02000050', '20020005', '曾丽彬', '6CD25A67'),
('02000051', '20020006', '陈敏霞', '55B38E37'),
('02000052', '20020006', '贺丽好', 'DC40C851'),
('02000053', '20020006', '岳丽琼', 'B44D5232'),
('02000054', '20020006', '刘志伟', 'B029CF12'),
('02000055', '20020006', '丁玉明', '83463460'),
('02000056', '20020006', '郭瑜琳', '427FD9A6'),
('02000057', '20020006', '陈雯', '17E47B68'),
('02000058', '20020006', '苏晓华', 'B97EEBAF'),
('02000059', '20020006', '简小艳', 'C4DE4AE4'),
('02000060', '20020006', '欧春妮', '9F729870');

-- --------------------------------------------------------

--
-- 表的结构 `teacher`
--

CREATE TABLE `teacher` (
  `TeaNo` char(8) NOT NULL,
  `DepartNo` char(2) NOT NULL,
  `TeaName` char(10) NOT NULL,
  `Pwd` char(8) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `teacher`
--

INSERT INTO `teacher` (`TeaNo`, `DepartNo`, `TeaName`, `Pwd`) VALUES
('00000001', '01', '张健', 'ken7411'),
('00000002', '02', '王振坤', 'wzk'),
('00000003', '03', '陈维', 'cw'),
('00000000', '00', 'admin', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`ClassNo`),
  ADD KEY `DepartNo` (`DepartNo`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`CouNo`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`DepartNo`);

--
-- Indexes for table `stucou`
--
ALTER TABLE `stucou`
  ADD PRIMARY KEY (`StuNo`,`CouNo`),
  ADD KEY `CouNo` (`CouNo`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`StuNo`),
  ADD KEY `ClassNo` (`ClassNo`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`TeaNo`),
  ADD KEY `DepartNo` (`DepartNo`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
