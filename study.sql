/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.5.19 : Database - security
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`security` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `security`;

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `rid` int(6) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(32) NOT NULL,
  `nameZh` varchar(255) NOT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

/*Data for the table `role` */

insert  into `role`(`rid`,`rolename`,`nameZh`) values (1,'ROLE_admin','超级管理员'),(2,'ROLE_dba','系统管理员'),(3,'ROLE_user','普通用户');

/*Table structure for table `role_user` */

DROP TABLE IF EXISTS `role_user`;

CREATE TABLE `role_user` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `uid` int(6) NOT NULL COMMENT '用户表ID',
  `rid` int(6) NOT NULL COMMENT '角色表ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `role_user` */

insert  into `role_user`(`id`,`uid`,`rid`) values (1,1,1),(2,1,2),(3,2,2),(4,3,3),(5,4,3);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `uid` int(6) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL COMMENT '用户名',
  `password` varchar(255) NOT NULL,
  `sex` int(6) NOT NULL COMMENT '0代表男，1代表女',
  `age` int(6) NOT NULL,
  `email` varchar(50) NOT NULL,
  `enable` tinyint(1) NOT NULL COMMENT '0禁用，1启用',
  `locked` tinyint(1) NOT NULL COMMENT '0未锁定，1锁定',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`uid`,`username`,`password`,`sex`,`age`,`email`,`enable`,`locked`) values (1,'adblk','$2a$10$j6BjV3jEr6ufvRUnlD3xrOwGaj4Cma2BxWhnrfCm3YtcLVA2QMwji',0,19,'641464656@qq.com',1,1),(2,'a','$2a$10$j6BjV3jEr6ufvRUnlD3xrOwGaj4Cma2BxWhnrfCm3YtcLVA2QMwji',1,19,'84794516126@qq.com',1,1),(4,'33','$2a$10$j6BjV3jEr6ufvRUnlD3xrOwGaj4Cma2BxWhnrfCm3YtcLVA2QMwji',1,22,'11',1,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
