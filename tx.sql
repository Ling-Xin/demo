-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        10.1.20-MariaDB - mariadb.org binary distribution
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 tx 的数据库结构
CREATE DATABASE IF NOT EXISTS `tx` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `tx`;

-- 导出  表 tx.tb_user 结构
CREATE TABLE IF NOT EXISTS `tb_user` (
  `user_id` int(8) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(10) NOT NULL DEFAULT '0',
  `user_password` varchar(32) NOT NULL DEFAULT '0',
  `user_age` int(4) NOT NULL DEFAULT '0',
  `user_sex` int(1) NOT NULL DEFAULT '0' COMMENT '0 男 1 女',
  `user_address` varchar(50) NOT NULL DEFAULT '0',
  `user_tel` varchar(11) NOT NULL DEFAULT '0',
  `user_flag` int(1) DEFAULT '0' COMMENT '0 用户 1 管理员',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1047 DEFAULT CHARSET=utf8;

-- 正在导出表  tx.tb_user 的数据：~36 rows (大约)
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` (`user_id`, `user_name`, `user_password`, `user_age`, `user_sex`, `user_address`, `user_tel`, `user_flag`) VALUES
	(1000, 'admin', '21232f297a57a5a743894a0e4a801fc3', 21, 0, '河南', '12345678911', 1),
	(1001, '张三', 'e10adc3949ba59abbe56e057f20f883e', 21, 0, '河南', '18236409980', 0),
	(1003, '李四', 'a3590023df66ac92ae35e3316026d17d', 20, 0, '123', '123', 0),
	(1004, '王五', '68053af2923e00204c3ca7c6a3150cf7', 20, 0, '郑州', '12354894611', 0),
	(1005, '陈七', '250cf8b51c773f3f8dc8b4be867a9a02', 20, 0, '123', '123', 0),
	(1006, '王八', '202cb962ac59075b964b07152d234b70', 12, 0, '123', '123', 0),
	(1046, 'mike', 'c20ad4d76fe97759aa27a0c99bff6710', 12, 0, '12', '12', 0);
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
