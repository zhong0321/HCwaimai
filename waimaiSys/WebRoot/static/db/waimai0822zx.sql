/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.7.20 : Database - waimai
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`waimai` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `waimai`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adminName` varchar(50) DEFAULT NULL,
  `adminPassword` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `admin` */

/*Table structure for table `audit` */

DROP TABLE IF EXISTS `audit`;

CREATE TABLE `audit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `storeId` int(11) DEFAULT NULL COMMENT '商家id',
  `auditState` int(11) DEFAULT NULL COMMENT '审核状态，0审核通过，1待审核，2审核未通过，3待二次审核',
  `auditTime` datetime DEFAULT NULL COMMENT '审核时间',
  `auditComment` varchar(300) DEFAULT NULL COMMENT '审核意见',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `audit` */

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `storeId` int(11) DEFAULT NULL,
  `orderId` int(11) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL COMMENT '评价',
  `commentTime` datetime DEFAULT NULL COMMENT '评价时间',
  `commentlv` int(3) DEFAULT NULL COMMENT '评价级别',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `comment` */

/*Table structure for table `deliveryman` */

DROP TABLE IF EXISTS `deliveryman`;

CREATE TABLE `deliveryman` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dmName` varchar(10) DEFAULT NULL COMMENT '姓名',
  `dmPhone` varchar(11) DEFAULT NULL COMMENT '手机号',
  `dmPassword` varchar(32) DEFAULT NULL COMMENT '密码',
  `commonlyAddress` varchar(100) DEFAULT NULL COMMENT '常用配送地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `deliveryman` */

insert  into `deliveryman`(`id`,`dmName`,`dmPhone`,`dmPassword`,`commonlyAddress`) values (1,'张三','18084842032','123456','北京市朝阳区所前镇大治桥南26号'),(2,'订单','13219505431','123456','北京市大兴区黄村镇兴丰大街140号');

/*Table structure for table `food` */

DROP TABLE IF EXISTS `food`;

CREATE TABLE `food` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `storeId` int(11) DEFAULT NULL COMMENT '商家ID',
  `foodTypeId` int(11) DEFAULT NULL COMMENT '菜品分类ID',
  `foodName` varchar(100) DEFAULT NULL COMMENT '菜品名称',
  `price` double DEFAULT NULL COMMENT '价格',
  `foodImage` varchar(500) DEFAULT NULL COMMENT '菜品图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8;

/*Data for the table `food` */

insert  into `food`(`id`,`storeId`,`foodTypeId`,`foodName`,`price`,`foodImage`) values (1,1,1,'醋溜木须',48,'1a90b08c4c2eb79b812cf69b0d9bf78f384584.jpg'),(2,1,1,'丸子烧白菜 ',38,'2e68d6fde87fa759e22fae1aa13d2f14320492.jpg'),(3,1,1,'青椒鸡蛋豆腐',29,'fb49343b987c4dc513e68e5dc7b3ce8f350692.jpg'),(4,1,1,'钵子淮山药',36,'d2b26b993c8c9dbe40d282ac03f4afdb372702.jpg'),(5,1,1,'小炒肉',36,'63bd88d6123314156efaacbcbcd64fa01095465.jpg'),(6,1,2,'川式钵钵鸡',42,'89844f0d58ee086574d1f4e5819f77cc736559.jpg'),(7,1,2,'蜜汁莲藕',32,'72d3f59703d4cf21ade04aa18a0a21f91259295.jpg'),(8,1,2,'不一般皮蛋豆腐',26,'ee330dcd7a315e104d44afa1686a2074849603.jpg'),(9,1,2,'鸭梨大拌菜',29,'1fb29e3aa0c39515bf292f7b53f1ee60219349.jpg'),(10,1,3,'酱油炒饭',26,'cb572a021c36b9feb2208efaf3e5ff38475590.jpg'),(11,1,3,'韭菜鸡蛋水饺',29,'8bfc6245a6827b231522f54a6f229953458752.jpg'),(12,2,1,'笋子烧牛肉',56,'3e88fa0ed13a8e2ea2982da36a78dc85503386.jpg'),(13,2,1,'东坡蹄花',49,'6f88458b6ca99127450b18dfea43fc1a408260.jpg'),(14,2,1,'泡椒牛蛙',78,'8740021894b71bf25aeb6ef1b204d79a562496.jpg'),(15,2,1,'香辣水煮牛肉',59,'d0f1c4ea0ed083fcd37424b73c985b557839357.png'),(16,2,1,'剁椒巴沙鱼柳',58,'eb2a9b5c7585ed77d0f873822437ef32157678.jpg'),(17,2,2,'川味卤猪蹄（半只）',26,'b9a1f3e8a5a5c962c9a9259a5908a48e687337.jpg'),(18,2,2,'夫妻肺片',49,'322407e431e368ae384fbdeb9ca041fe140456.jpg'),(19,2,2,'眉州东坡香肠',47,'3eeef6077adad4eac7ce1029642718716582056.png'),(20,2,3,'金银馒头',15,'f7a2e0dbf4fbd6c2000bf503c7ec31e9297892.jpg'),(21,2,3,'鸡丝凉面',33,'7813b26570d3d924c92cdad3de71c8d26449357.png'),(22,3,3,'安格斯肥牛饭',22,'e1b3c0de1d2ae96bc251454e1c980404282028.jpg'),(23,3,3,'老坛酸菜鱼饭 ',21,'82c6175b688ef6f77b142ade7b3e253f247436.jpg'),(24,3,3,'黄焖鸡米饭 ',21,'28e5335565af40b9f9a5de1890331394227205.jpg'),(25,3,4,'麻辣烤翅 ',9.9,'c9415841318b80cb1ca9a86ce414172b253930.jpg'),(26,3,4,'南城香电烤羊肉串',3.5,'e7f538af7bb94f54adadd3990432e2a2551259.jpg'),(27,3,4,'南城香电烤板筋',3,'26ab5b007f4dc408ad28a1cff42f9d5b329493.jpg'),(28,3,5,'红烧牛肉面 ',22,'65f4a01362db9108944e39f5d2fbdbfa278871.jpg'),(29,3,5,'南城香虾仁大馄饨  ',21,'f480c06b7984860d99232b3ec57d4bf7380285.jpg'),(30,3,5,'南城香全家福大馄饨   ',23,'f7b0c9b823267bef6286fea4c85255a7161633.jpg'),(31,3,5,'排骨煨汤',15,'1a26e42c65066a833f9487731b8d8151157007.jpg'),(32,4,4,'原油腰',8,'a0216b1e1b17769b34cc5f2631e777ce191912.jpg'),(33,4,4,'牛蹄筋',4,'1b1cf89bc525e7fe9e99e1e2212d6bc1213215.jpg'),(34,4,4,'多春鱼',5,'98c35918b95cf63478c811428b3bbd94211930.jpg'),(35,4,4,'花蛤',25,'b3161c49c1509479704970a2b15ea58a200413.jpg'),(36,4,4,'田螺',15,'03caf59020d7994781477c120af00100152720.jpg'),(37,4,2,'黄瓜拉皮',8,'692abd540ea8ad03c50f7f5c02be75d1168397.jpg'),(38,4,2,'皮蛋豆腐',8,'ad7bc139d05cde44fffceaf43b956b76140814 .jpg'),(39,4,4,'麻辣小龙虾',52,'0fe70849ebf6aefef9df18d21b1f27d5118704 .jpg'),(40,4,6,'冰红茶',12,'ea490efda6b4433e2072bd6c9abe87b589446 .jpg'),(41,4,6,'雪碧',12,'afbe63eab22ca630a8693ea10b4d8a2d80486 .jpg'),(42,4,6,'雪花勇闯天涯',7,'bbdf70ceb158ea583e3e4373df0b14ad204045 .jpg'),(43,5,7,'青稞红豆奶茶',14,'8c973e69b4559f12a83182ad956cafe943547.jpg'),(44,5,7,'血糯米芋香奶茶',15,'5cf2172fbbb24a5a7ac9de89e021393058469.jpg'),(45,5,7,'血糯米红豆奶茶',14,'d14020162f452c37f314231d368c649a72739.jpg'),(46,5,7,'红豆牛奶',16,'c9fd0681de0e8f8ab05a334966ac832a147404.jpg'),(47,5,7,'百香柠檬茶',12,'f0e43c4e921e46802d328a84d932c1df135257.jpg'),(48,5,7,'蓝灵王',16,'86633f84953fed21d5dd3f62862ce769111964.jpg'),(49,5,7,'红西柚果茶',18,'7baa9990ec4c81de99ddec44b3f7ad54151526.jpg'),(50,5,7,'蜂蜜柚子茶',14,'fdf8d83ca10c8cfbe6da97cdebea6f9c119651.jpg'),(51,5,7,'洛神百香',12,'27cc1410d875178ce4bc37936a621875149697.jpg'),(52,5,7,'熊猫奶盖茶',16,'62c06cd76d3c9653eaac97363ae6242a461284.jpg'),(53,6,4,'锡纸牛蛙',25,'9388b266a891d52c14e305b0e3f7396f70009.jpg'),(54,6,4,'锡纸生蚝',28,'28243c3aa56762a8f7c73ee506774035935488.jpg'),(55,6,4,'牛板筋',3,'f199a8e56d237565043afdf07caefdb2230774.jpg'),(56,6,4,'麻辣羊排',14,'7ad36aacc1fe7d16619c89839827993f249328.jpg'),(57,6,4,'羊小腿',18,'2951c375aa0b0bd75316cab2b36357f3203092.jpg'),(58,6,4,'羊腰',18,'323e227462b3811537ad236d2ca25ef4180444.jpg'),(59,6,4,'麻辣烤翅 ',16,'4febc36b65da01ef9823211ad0b23253149570.jpg'),(60,6,6,'燕京鲜啤',8,'113e48f81b0a62104f0187d74a24f8cd378880.jpg'),(61,6,6,'百威啤酒',10,'b0859c08b659f63c772983d5e8e23ce5389090.jpg'),(62,6,6,'江小白',20,'b6a0da64cd71b05ac7722a2cbd85f505298857.jpg'),(63,7,4,'蒜香小龙虾',88,'ada27a89db7843ab2f5f2bcc06543e21111654.jpg'),(64,7,4,'麻辣小龙虾',88,'c3f805a5d197fbd7ae602edb8fc02420135154.jpg'),(65,7,1,'剁椒蒸鸡块',38,'277dea5e49cd833158c3264836a5145a120397.jpg'),(66,7,1,'宫爆腰果虾球.',35,'d9165c7f650d6a57ae5af59ace291fbf169859.jpg'),(67,7,1,'菠萝咕咾肉',38,'f436c020d762b9f010a41963e5e6654a173614.jpg'),(68,7,1,'宫保鸡丁',32,'7913ae0f87531d7d07ed0e7dc201e5de134086.jpg'),(69,7,5,'酸辣乌鱼蛋汤.',28,'f7ed9c04eedbd34fd988f9f0e60ed6b3104992.jpg'),(70,7,5,'松茸菌鸡汤',33,'6125b92a4d38b7242ae0b7e434af615a63677.jpg'),(71,7,6,'百香果凤梨茶',18,'5643d63076d9c2478ffdbbd343a972db129526.jpg'),(72,7,6,'百岁山',88,'8a248492b99d92f27e70279c82e9c4b274286.jpg'),(73,8,4,'麻辣小龙虾',88,'36edd8e7ca3bff7db8e2ea14888e18ff164368.jpg'),(74,8,2,'花毛拼盘 ',18,'c15521a24df63738b26d3f34f28b6c59182961.jpg'),(75,8,2,'酱牛肉',38,'c6d7848db2fe05abeb8f2bd11f1cb653181316.jpg'),(76,8,4,'鸡脆骨',3,'97c5fe1236a10860954e245793b6c4d1145234.jpg'),(77,8,4,'烤千页豆腐',5,'a472881414987255a9a6f3aca88ac68e174630.jpg'),(78,8,4,'烤平菇',2,'cf27bbc69bebb322e77adfef8f4787c633231.jpg'),(79,8,4,'烤豆皮卷',88,'654cef978df258a6754b9d95e7f0c8da42869.jpg'),(80,8,4,'烤扇贝',10,'a1bb9554814a752eb2819026476504d3106386.jpg'),(81,8,6,'百威啤酒',10,'5aa97c3128140d5dc6cd641062f8be9f222025.jpg'),(82,8,6,'青岛纯生',12,'b71b9401f710bcc001e0d64eda38f541174484.jpg'),(83,9,3,'豆腐脑',8,'a662fa40ddb2255a24f4ad11be9e6125317821.jpg'),(84,9,3,'小米粥 ',7,'f6ea698129076c5b1994108c34b9e9c3325500.jpg'),(85,9,3,'阳阳酱肉包',38,'7cb12d7e73805562b41de7be5bd9d17612728.jpg'),(86,9,3,'麻辣凉面',15,'dd2e337a74824df182e7ae1ab5d5314521877.jpg'),(87,9,3,'阳阳肉酱面',20,'9e31d64a4b743eb93e18fd7f3a585fe6392747.jpg'),(88,9,3,'腊味炒饭',20,'11f7b898336b9262e1c6fa763f4aa62021130.jpg'),(89,9,3,'三鲜炒面',20,'29bb9455c1b2c612546d4c0955d50b5522642.jpg'),(90,9,3,'皮蛋瘦肉粥',8,'321a0701bdedda152011a3ccc458998a17987.jpg'),(91,9,3,'绿豆百合豆浆 ',6,'2b2edd3050ddfbd38f683c85f72cb3e0257894.jpg'),(92,9,6,'北冰洋 ',6,'719732205b6640845b32881f7551efa4283766.jpg'),(93,10,1,'干锅手撕杏鲍菇',28.8,'93c7aa9b8273b7f79dfc7d414f0231e9187563.jpg'),(94,10,1,'干锅仔鸡 ',38,'76f649fc1ad75c4c2d7f380cf359a49455861.jpg'),(95,10,1,'干锅鱿鱼须',40,'0963f4441a45c97a4ae1c194053e743d208176.jpg'),(96,10,1,'川味毛血旺',38,'8d8e8da92334b525fd2f396b1acf0871126915.jpg'),(97,10,3,'大份咯嗒汤',12,'185fa534323c5dc7eb11d2a16d4f8e41136188.jpg'),(98,10,3,'大份酸辣汤',16,'cfb3e6cb23ee0d5579c4593be3a0f863154456.jpg'),(99,10,3,'奶香小馒头',7.9,'e5d5b1755b93b854282b3c9c13c47e2a114822.jpg'),(100,10,3,'稻花香米饭',8,'c6b72c9457ea361edf7fc5db019299f397789.jpg'),(101,10,6,'雪碧 ',6,'9f1688421b3aca8cdf7afdbafbf10dd5123777.jpg'),(102,10,6,'北冰洋 ',6,'c5b2d64a337f4fc9c2046a61e1b7b3df76461.jpg'),(103,11,4,'猫爪烤翅麻香',9,'29eae1990659c6911722ae98ed5ad9de125236.jpg'),(104,11,4,'烤羔羊肉串 ',4,'0a1fd76296cb96dca4ee76e171ee062e88820.jpg'),(105,11,4,'望京小腰',3,'010ac9c7077723f20a2f240605d09465108990.jpg'),(106,11,4,'簋街馋嘴蛙',55,'5c10048a8ea962fdd07834e79d39c8d5257425.jpg'),(107,11,4,'簋街麻辣扇贝',45,'3a856f744f46361af47f3a0c9288e571105508.jpg'),(108,11,1,'精品毛血旺',32,'976e78043e1233d7b5fed8b9cd29a8e0144025.jpg'),(109,11,4,'香辣烤猪蹄',9,'2e43f37b06d626244b1628bcc66da873374314.jpg'),(110,11,7,'喵小姐',18,'c08992c2fc93841c0b6c0eeb661afd2673631.jpg'),(111,11,7,'喵先生 ',18,'3c9624a391c191ed9f3c8f3702ea385269837.jpg'),(112,10,6,'北冰洋 ',6,'c5b2d64a337f4fc9c2046a61e1b7b3df76461.jpg'),(113,12,13,'进口香蕉',6.8,'118e0ab0eef9f08a0dcce702ac6ea8c191948.jpg'),(114,12,13,'佳沛绿奇异果 ',6.5,'202bfb58e5a9f2902ecbf2c16fc1dbe3158352.jpg'),(115,12,13,'进口银火龙果',5.9,'8c94a5e17af70d0c1020e961669d540b114472.jpg'),(116,12,13,'樱桃中1份/100g',7.9,'619dc06d639ef59124adcfd5b36df06974020.jpg'),(117,12,13,'千禧圣女果',15.5,'c8ff50990eac40f35728c59ed8169163248422.jpg'),(118,12,13,'每日坚果',19.8,'b5b257859dc8225a25c2af69da624dd4252584.jpg'),(119,12,13,'泰国龙眼',9,'8021584ad425dea56d976bcb5ab0465d116611.jpg'),(120,12,13,'进口冰糖苹果',5.9,'e0dce65aa4ea1ccf5b3c68ee8952ba6a88215.jpg'),(121,12,13,'小台农芒果 ',7.9,'e8f288350eec71b65a2928fd19754e1686631.jpg'),(122,12,13,'青妮王榴莲 ',79,'d88d9b460fef822918983ba620798e87310490.jpg'),(123,13,4,'辣炒田螺',18,'f95ec27547afe7fdca686edb06bf50cb225691.jpg'),(124,13,4,'辣炒蛏子  ',38,'9dd87787cf57d4d6a81f66e338854123144727.jpg'),(125,13,4,'辣炒花蛤',32,'e2e7004f9c25a1fdb3f0152687d837ac191830.jpg'),(126,13,1,'地三鲜 ',22,'c3da2893aedf938920034ce742c8f82a146862.jpg'),(127,13,1,'鱼香肉丝 ',15.5,'9bfd00aefc99409dc5c255d276176099164682.jpg'),(128,13,1,'回锅肉',25,'3245d356ed957176cf7171c61023525a195217.jpg'),(129,13,4,'大腰子',18,'956e12880d913e17ecc6c1785085af65179900.jpg'),(130,13,2,'爽口笋丝',16,'8ad2fd3e4114797f92532cfabaaa5895145179.jpg'),(131,13,2,'酒鬼花生 ',16,'4a720e6d9776b33aae0355ec8b0f191d118627.jpg'),(132,13,2,'皮蛋豆腐 ',15,'3329b0c1d75ee48382c535b6665e7e90148059.jpg'),(133,13,6,'白牛二 ',20,'8e25223f8e46d1160716f36b5a19aa83140024.jpg'),(134,13,6,'大雪碧 ',12,'28d98398841e63ff2328f2a9b085a924125654.jpg'),(135,14,4,'鸡肉串',4,'4344378b98057f365d529f7c7ba2c116459967.jpg'),(136,14,4,'轰炸鱿鱼串',20,'780f3cdc79b02836fa3a69c78da324a32477151.jpg'),(137,14,4,'蜜汁小排',22,'53807eee1407be9904f4ba9a32893a201524081.jpg'),(138,14,4,'霸王鸡爪',18,'37795f4771d036484ef2a2376957fcba3062279.jpg'),(139,14,4,'焦烤五花肉',5,'5ae25a5e8db5806cef0ac0ac3e36d7451664095.jpg'),(140,14,2,'麻辣黑鸡爪',22,'a707769795627176574938a74dfdfeb61929466.jpg'),(141,14,2,'椒麻鸡',28,'314ed16a348911678ebcdd3a78ca68082883053.jpg'),(142,14,2,'田园大拌菜',25,'c4bfba3e7c77a823a70b1d274ee82d301123935.jpg'),(143,14,2,'姜汁皮蛋',15,'edd3d7f8531f11e24bf3101f3418bb131196225.jpg'),(144,14,1,'冒小郡肝',22,'d98aa06e83113f0682de29e44b725bb613457642.jpg'),(145,14,1,'冒脑花',25,'407a9ab59174e7acf46d5cf70413d62e381282.jpg'),(146,15,3,'辣白菜猪肉双拼饭',32,'437fd2b220e3851489634f443491abe466209.jpg'),(147,15,3,'吉味双拼饭',30,'90083d8bae792f9f3fd8ea1b3967f11c61166.jpg'),(148,15,3,'什锦蘑菇饭',29,'b43eb9fa3fe731c009df263dcbbf5c7181717.jpg'),(149,15,3,'招牌牛肉饭',32,'43fd9845d82013d98503c649c9f619f3392536.jpg'),(150,15,3,'照烧鸡排饭',30,'d7b00e3bd05e190b44e79bb4e0448f2080110.jpg'),(151,15,2,'摇滚沙拉',9,'79beaf045b2e53273eb48482ecd5931446096.jpg'),(152,15,5,'合茶碗蒸',8,'4aba502be62054467e6227cab1c994d581499.jpg'),(153,15,5,'海鲜蛋花汤',9,'4d7fb9e1f611ea9e9b5edd93928fa26855925.jpg'),(154,15,6,'橙汁缤纷',9,'78bf24e498c81ddd711cef0bbb8f493a31693.jpg'),(155,15,6,'蜂蜜柚子茶',9,'00da3a2ecb631cb21b303d45c8f7e5d270059.jpg'),(156,15,2,'牛皿 ',20,'fd3057efcf5fed7374917b89be5a930c56801.jpg'),(157,15,2,'鸡皿',20,'8ca1f870774a6a8414596e6cc3853f8453072.jpg'),(158,16,7,'薄荷奶绿',10,'579f360d1ef6cb9d503669d7dcb180d2253383.jpg'),(159,16,7,'波霸奶茶',11,'b69cbb89537d119d9678acccd6a12bfa308666.jpg'),(160,16,7,'优格爆爆珠奶茶',11,'98a0329e764b3b885a5c89a82368a95c719247.jpg'),(161,16,7,'四喜奶茶',14,'15c0178254200768911252224d7691a5303440.jpg'),(162,16,7,'烧仙草',14,'ad86155312fe025e37d16b1183cbec5c343747.jpg'),(163,16,8,'火龙果芝芝',20,'912c55c5c6105c26bb17ae441948e56e126321.jpg'),(164,16,8,'芒果芝芝',19,'e45f6bbc4303781c47bf0fa33c90a6c6949041.jpg'),(165,16,8,'茉莉绿茶玛奇朵',14,'e8c40331950c85436837213ddc974ced46572.jpg'),(166,16,8,'黄金乌龙玛奇朵',15,'f7e270df754d5a5484864727143ac364415726.jpg'),(167,16,8,'薄荷蛋蜜汁',10,'80359e4879a16ba0586b3f45a4a18aa758857.jpg'),(168,16,8,'满杯红柚',16,'9122c4286567d826b18e936eb40884ee540927.jpg'),(169,17,9,'柑橘提拉米苏',39,'bb90a2fdd34f423894298e31d3add9a2859727.jpg'),(170,17,9,'榴莲千层卷',38,'8bf089c3e1f381de5365cd5fc67bf289210425.jpg'),(171,17,9,'水果芋圆',28,'32ac9969fa647bf7dc95f73b0842d351291764.jpg'),(172,17,9,'脏脏蛋糕',32,'25cb784ccbd8fe145fd8868ed2af8f3e274706.jpg'),(173,17,9,'法式浮云卷',26,'d72ba29452fb919d5d00c033b62ac1ec318987.jpg'),(174,17,9,'椰汁芋圆',28,'04c8b9535cb1fffac19416b0e703c544377382.jpg'),(175,17,9,'咖啡奶酪',32,'2f7b163f23013752d48aced13832a28e878993.jpg'),(176,17,9,'荔荔花香',39,'72c9be10aaaa0ba6b7bf0a0098e05b6a786444.jpg'),(177,17,9,'日式芝麻豆乳卷',32,'013435a822ccfd5eaeecc21e6b1c184c917077.jpg'),(178,17,9,'雪花酥',30,'b7eae7f076ad1e5b53cd1630668c7db7800744.jpg'),(179,17,9,'抹茶千层',38,'140dce79fdce57ac94ac312dfc0fea9e155589.jpg'),(180,18,10,'豆乳芋泥盒子',28,'2321c0d1466cc63713842f6600688e1e1037122.jpg'),(181,18,10,'杨枝甘露冰淇淋雪媚娘',12,'1b122ee09a705ebd0804f75eb16a03c8252483.jpg'),(182,18,10,'芋泥雪丸子',10,'58271416831069653e7ee6a08e9dd649387229.jpg'),(183,18,10,'水果千层盒子',22,'e389aec4275505e21dea7d07fd66a4d6183146.jpg'),(184,18,10,'草莓芒果爆浆蛋糕',58,'3e0cfb705d1d21a70de292f3c3fe05ec272772.jpg'),(185,18,10,'网红小奶狗',38,'93a337265db703cac729919e4ddd3276115484.jpg'),(186,18,10,'杨枝甘露爆酱',58,'ce85c0453dabf2e4711ce97cabd345da615552.jpg'),(187,18,9,'椰奶仙草芒果捞',25,'36c4f3c634690ff714adcc371dc3f28e224296.jpg'),(188,18,9,'鲜芒小丸子',22,'c47de06a9aa73af8715298bde4fbb3a8194200.jpg'),(189,18,9,'九福芋圆',29,'a5c033731d18891350a08989d04cc15f310516.jpg'),(190,20,11,'招牌鱿鱼',32,'c5711fd4b609e83162dc5aeae55de410197602.jpg'),(191,20,11,'招牌鸭食管',26,'1158bdb2c6fd1ec280d3fc0e02ac5272322934.jpg'),(192,20,11,'招牌鸭舌',23,'38ab48a03c5c551f74ec3e94ae4f8b20343872.jpg'),(193,20,11,'招牌鸭头',6,'bc041dc630e6151208062b7783be45d0393951.jpg'),(194,20,11,'招牌鸭脖',18,'92920ffa69f9ca92c8f419d27293c13a226233.jpg'),(195,20,11,'招牌鸭锁骨',16,'c7ed99851b6ee06d17f71876c666ea87194337.jpg'),(196,20,11,'招牌鸭掌',18,'9be73e043433cb412b8c75d84a0ff292193729.jpg'),(197,20,11,'招牌鸭胗 ',22,'8be14b4153c2d1ac81b38476b32d52ad426441.jpg'),(198,20,11,'招牌腐竹',9.9,'78bf24e498c81ddd711cef0bbb8f493a31693.jpg'),(199,20,11,'千叶豆腐',12,'d12fe4fad8d592f0b021d36f2e5b16b9268548.jpg'),(200,19,9,'法式甜点 ',25,'b34199aea3eed9c3a34d7af5b798a13a263747.jpg'),(201,19,9,'雪媚娘 ',12,'0fabd555c51c5bcf976117c69d182fc4370902.jpg'),(202,19,10,'网红便当',38,'16d50e46da8671eb256dc4df12fbe058696748.jpg'),(203,19,9,'水果杯',28,'cdd0ef98f6d7e6cf65733c5a62c762be1049092.jpg'),(204,19,10,'天鹅泡芙',15,'922e3ae3980992e65aee11b9072c315c150272.jpg'),(205,19,10,'花语',158,'753b4bcabd7dcc3e5e1cd86bddebff45300562.jpg'),(206,19,10,'猪猪',20,'5c0cd4f2e799671924f24c950cd3ab16277849.jpg'),(207,19,9,'樱花杯',12,'3989879b3f5b29eb02db923272ab40f3127518.jpg'),(208,19,10,'巧克力高跟鞋',20,'82a8c3e2a382a6a12c9a3307063778aa141408.jpg'),(209,19,10,'Mini水果杯',10,'310b2dfb0e7dc95e984820949c0c7577244872.jpg'),(210,21,12,'菌菇螺蛳粉 ',25,'1.jpg'),(211,21,12,'老柳州螺蛳粉 ',24,'2.jpg'),(212,21,12,'柳州螺蛳粉',22,'3.jpg'),(213,21,12,'三鲜螺蛳粉',28,'4.jpg'),(214,21,12,'砂锅螺蛳粉 ',15,'5.jpg'),(215,21,12,'油果 ',2,'b06f3891ab373f2dc5cd83eeed0c7a10189824.jpg'),(216,21,11,'柳州鸭掌',4,'a7080782732f69467b96bf8502f38d7e294729.jpg'),(217,21,12,'三鲜',3.5,'46533a275629cbfb6062b49713d3973b116075.jpg'),(218,21,6,'百事可乐',3,'3a50fdcd382fe7b6d56ee3b93eff0144192594.jpg'),(219,21,6,'芬达',3,'a10dfe4c1052acd8c0f724961c071bec192512.jpg'),(220,22,13,'蓝莓1盒',12,'120236a4d40caf43f485aa5956d0ce9c137731.jpg'),(221,22,13,'进口金果1个',12.5,'a04cb0d703a1895f320cc93dacbb688571318.jpg'),(222,22,13,'牛油果-2粒',22,'409718eab986620a67f7d04edad9e595180643.jpg'),(223,22,13,'进口金菠萝半个',22,'59f221304c6846a6e89bc6fc73b00da9204550.png'),(224,22,13,'泰国山竹1个',8,'d92984a0258079e531906c11640e28df25123.jpg'),(225,22,13,'红肉菠萝蜜390-410g/盒',28,'e885187767bb2ca3a8b6e51013c5ddc519506.jpg'),(226,22,13,'冷冻榴莲肉380g/盒',85,'72720a02fe10d4f613d1663499e4ee74106009.jpg'),(227,22,13,'果缤纷礼盒（A）1盒',260,'3fb03da60fba08ab6b7127936f42bcac169271.jpg'),(228,22,13,'果缤纷礼盒（B）1盒',370,'6f2c0d14152a778bb4495a439c9b96bb177299.jpg'),(229,22,13,'果篮至尊版6.5-6.8kg/篮',420,'0f61d63305b6305f4970362a8377c2dd212204.jpg'),(230,23,1,'金汤豆花黑鱼',40,'80b04b18dd930bc1b8a8d8e0dac37cb2261437.jpg'),(231,23,1,'酸菜巴沙鱼',34,'1e11041616b31634b91c4a58d0937dbf537895.png'),(232,23,1,'金汤豆花巴沙鱼',36,'f238623e9811ff1d14e7de68004db1c5262826.jpg'),(233,23,1,'麻香鮰鱼',41,'ac426f3e5de8bcee2a001c94eadfff39382818.jpg'),(234,23,1,'番茄黑鱼',39,'34711e385bc0bfa9f9e4eef9481e0356201995.jpg'),(235,23,2,'花花的口水鸡',16,'4fa5603c9b9283d391cf33ade8915ae411981846.jpg'),(236,23,2,'小皮蛋豆腐',8,'d1d086f1fa881b2b098bad6ed8854feb148854.jpg'),(237,23,9,'小丸子冰粉',9,'f118fbd7a9c5b8fd1e920fd79687e27a219154.jpg'),(238,23,6,'鲜榨雪梨汁',10,'0d7a511882283b293b8c90f1041d428b555525.jpg'),(239,23,9,'焦糖豆花',8,'36e50d94a7fc8cde7f78a627870ed03a47861.jpg'),(240,23,6,'山楂乌梅饮',10,'734d58324cf1dfa432dd567d4f49c4e51155277.jpg'),(241,24,12,'秘制黑白凉皮',16,'831e7bdf20f5d2414085a8996d6c1cd1105778.jpg'),(242,24,12,'秘制凉皮',14,'ee37aaf825f08935ddf37ffbbf1a8c0f129583.jpg'),(243,24,12,'米皮',12,'eae4e2bc12aa6cb7f9d4aa4d9a92bd89140683.jpg'),(244,24,12,'面皮',12,'c572280231a7a6bd22a60a8e39f78fe5139861.jpg'),(245,24,12,'菠菜秘制凉皮',16,'79d2a5f2cab2347c620ae11a3ca1e2f9112514.jpg'),(246,24,2,'蒜蓉菜心',5,'ff3d941e8e000e067da0c71e08a165be428369.jpg'),(247,24,2,'香辣海带丝',5,'9328b728ef12990aa927b63bdc5ce8f295068.jpg'),(248,24,5,'七喜（机打）',5,'2836fd754a8ea59f7f034a5ba39b358a93410.jpg'),(249,24,6,'加多宝（听装）',6,'44d2b3ca6f793ed641a0cc70b4a921ef85444.jpg'),(250,24,6,'蜂蜜柚子茶（机打）',5,'83f04ceead8d606c3fd7d647fddbb90987831.jpg');

/*Table structure for table `food_types` */

DROP TABLE IF EXISTS `food_types`;

CREATE TABLE `food_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `foodType` varchar(100) DEFAULT NULL COMMENT '菜品分类',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `food_types` */

insert  into `food_types`(`id`,`foodType`) values (1,'精品热菜 '),(2,'畅销凉菜 '),(3,'特色主食 '),(4,'特色烧烤'),(5,'经典汤,面'),(6,'酒水饮料'),(7,'奶茶推荐'),(8,'冷泡系列'),(9,'招牌甜品'),(10,'网红系列'),(11,'绝味鸭货'),(12,'特色小吃'),(13,'热销鲜果');

/*Table structure for table `like` */

DROP TABLE IF EXISTS `like`;

CREATE TABLE `like` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `storeId` int(11) DEFAULT NULL COMMENT '商家ID',
  `userId` int(11) DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `like` */

/*Table structure for table `order` */

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL COMMENT '用户id',
  `storeId` int(11) DEFAULT NULL COMMENT '商家id',
  `orderNumber` varchar(100) DEFAULT NULL COMMENT '订单号',
  `orderTime` datetime DEFAULT NULL COMMENT '下单时间',
  `orderAddress` varchar(300) DEFAULT NULL COMMENT '配送地址',
  `totalMoney` double DEFAULT NULL COMMENT '总计',
  `orderState` int(11) DEFAULT '0' COMMENT '订单状态',
  `isComment` int(11) DEFAULT NULL COMMENT '是否评价0-未评价，1-已评价',
  `orderRemarks` varchar(100) DEFAULT NULL COMMENT '订单备注',
  `deliveryManId` int(11) DEFAULT NULL COMMENT '外卖员id',
  `disMoney` double DEFAULT NULL COMMENT '配送费',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `order` */

insert  into `order`(`id`,`userId`,`storeId`,`orderNumber`,`orderTime`,`orderAddress`,`totalMoney`,`orderState`,`isComment`,`orderRemarks`,`deliveryManId`,`disMoney`) values (1,1,9,'cb895865-fa5d-48b3-bb91-aaff721a480f1','2019-08-07 14:30:57','钟雪(女士)  13219505431  北京市大兴区京开路双河南里甲15幢4-5号15-5',21,0,NULL,'豆浆多加糖',NULL,NULL),(2,1,2,'b6970ac5-da01-44ec-aa3c-1704702431d41','2019-08-12 15:32:24','钟雪(女士)  13219505431  北京市大兴区京开路双河南里甲15幢4-5号15-5',183,3,NULL,'无',NULL,NULL),(3,1,1,'3aa78624-5496-4cb3-8061-77c237617dde1','2019-08-13 08:40:40','钟雪(女士)  13219505431  北京市大兴区京开路双河南里甲15幢4-5号15-5',115,4,NULL,'无',NULL,NULL),(4,1,1,'39214dc8-0d39-4886-ad3f-63b387cace7b1','2019-08-13 09:52:03','钟雪(女士)  13219505431  北京市大兴区京开路双河南里甲15幢4-5号15-5',158,4,NULL,'无',NULL,NULL),(5,1,2,'b567d60e-4670-4e00-b7f8-0f3e1f9c64ed1','2019-08-13 10:11:21','钟雪(女士)  13219505431  北京市大兴区京开路双河南里甲15幢4-5号15-5',163,NULL,NULL,'无',NULL,NULL),(6,1,1,'446fe269-3883-4a73-812d-59d262d230ce1','2019-08-13 11:17:49','钟雪(女士)  13219505431  北京市大兴区京开路双河南里甲15幢4-5号15-5',64,4,NULL,'无',NULL,NULL);

/*Table structure for table `order_detail` */

DROP TABLE IF EXISTS `order_detail`;

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) DEFAULT NULL COMMENT '订单id',
  `foodId` int(11) DEFAULT NULL COMMENT '菜品id',
  `count` int(11) DEFAULT NULL COMMENT '数量',
  `cost` double DEFAULT NULL COMMENT '小计',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `order_detail` */

insert  into `order_detail`(`id`,`orderId`,`foodId`,`count`,`cost`) values (1,1,83,1,8),(2,1,84,1,7),(3,1,91,1,6),(4,2,12,1,56),(5,2,13,1,49),(6,2,14,1,78),(7,3,1,1,48),(8,3,2,1,38),(9,3,3,1,29),(10,4,1,1,48),(11,4,4,1,36),(12,4,6,1,42),(13,4,7,1,32),(14,5,12,1,56),(15,5,13,1,49),(16,5,16,1,58),(17,6,2,1,38),(18,6,8,1,26);

/*Table structure for table `store` */

DROP TABLE IF EXISTS `store`;

CREATE TABLE `store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `distributionMoney` double DEFAULT NULL COMMENT '平均配送费',
  `startMoney` int(11) DEFAULT NULL COMMENT '起送费',
  `storeAddress` varchar(100) DEFAULT NULL COMMENT '商家地址',
  `storeName` varchar(100) DEFAULT NULL COMMENT '商家名称',
  `storePhone` varchar(11) DEFAULT NULL COMMENT '商家电话，手机号注册',
  `storePassword` varchar(100) DEFAULT NULL,
  `storeImg` varchar(300) DEFAULT NULL COMMENT '商家头像',
  `province` varchar(30) DEFAULT NULL COMMENT '省',
  `city` varchar(30) DEFAULT NULL COMMENT '市',
  `area` varchar(30) DEFAULT NULL COMMENT '区县',
  `coordinate` varchar(50) DEFAULT NULL COMMENT '坐标，经纬度',
  `registState` int(11) DEFAULT '0' COMMENT '审核是否通过，0为未通过，1为通过，默认为0',
  `foundtime` datetime DEFAULT NULL COMMENT '开店时间',
  `ordrenum` int(11) DEFAULT NULL COMMENT '订单数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

/*Data for the table `store` */

insert  into `store`(`id`,`distributionMoney`,`startMoney`,`storeAddress`,`storeName`,`storePhone`,`storePassword`,`storeImg`,`province`,`city`,`area`,`coordinate`,`registState`,`foundtime`,`ordrenum`) values (1,5,20,'北京市大兴区黄村镇双河南里6号','大鸭梨烤鸭','13562857731','00000000a','a02492e1d577c37aa1441b094a47fffc13200.jpg','北京市','北京市市辖区','大兴区','116.346611,39.735479',1,NULL,NULL),(2,9,20,'北京市大兴区黄村镇金星西路3号','眉州东坡','13547972242','123','812e34046da741d2478dde9f8087356511271.jpg','北京市','北京市市辖区','大兴区','116.334211,39.764244',1,NULL,NULL),(3,5,25,'北京市大兴区黄村西大街地铁D口','南城香','13547289767','123','3d2ff9e50fb14f8416ee8b9ecc74a62d206516.jpg','北京市','北京市市辖区','大兴区','116.332227,39.731026',1,NULL,NULL),(4,5,20,'北京市大兴区黄村镇双河南里甲15号楼一层','一只羊和董小姐','13523863343','123','c468200a0a2d8a7a23b59357feb4a34634816.jpg','北京市','北京市市辖区','大兴区','116.34687,39.732996',1,NULL,NULL),(5,8,20,'北京市大兴区黄村镇兴丰大街68号楼','贡茶','13523245365','123','f06688d2ae44d32f39135c3b792ac82338635.jpg','北京市','北京市市辖区','大兴区','116.339665,39.732136',1,NULL,NULL),(6,8,20,'北京市大兴区黄村镇兴丰大街49号','小段烧烤','13523243455','123','bb60dc5d45232745aa09dc2cfee0945e65211.jpg','北京市','北京市市辖区','大兴区','116.336746,39.755995',1,NULL,NULL),(7,9,20,'北京市大兴区黄村镇双河南巷3号楼','青年餐厅','13523245338','123','3c1a7ae09decd133c56cbb9962c0660529244.jpg','北京市','北京市市辖区','大兴区','116.346371,39.732864',1,NULL,NULL),(8,8,20,'北京市大兴区黄村镇兴丰大街三段75号','马子烧烤','13733245345','123','4fd3502603d24a27254806456add763a320655.jpg','北京市','北京市市辖区','大兴区','116.339223,39.738295',1,NULL,NULL),(9,4,20,'北京市大兴区黄村镇兴丰大街140号','阳阳中国饭','13523243845','123','3507939785b6f8c48fb58b26b501a0657725.jpg','北京市','北京市市辖区','大兴区','116.338114,39.748076',1,NULL,NULL),(10,9,20,'北京市大兴区黄村镇兴业市场1栋','正源川湘家常菜','13523245345','123','698d7e3c932fabcae8a87801a7022f49164721.jpg','北京市','北京市市辖区','大兴区','116.343985,39.730075',1,NULL,NULL),(11,3,20,'北京市大兴区黄村镇兴华南路','馋嘴猫串吧','13576296454','123','ffa54dfbd810ce4e0c4479b6c62a33db43801.jpg','北京市','北京市市辖区','大兴区','116.331564,39.72101',1,NULL,NULL),(12,10,30,'北京市丰台区丰桥路7号院','果多美','13723245345','123','5e2f0ffe44fab348da5ffeb34551657d14834.jpg','北京市','北京市市辖区','丰台区','116.3103,39.851905',1,NULL,NULL),(13,8,25,'北京市丰台区万年花城万芳元一区','百果园','13523645345','123','fa2a162c7aabd6117a667432b4e787bc10757.jpg','北京市','北京市市辖区','丰台区','116.318604,39.846327',1,NULL,NULL),(14,9,20,'北京市丰台区永善里2号楼','冰城串吧','13523255345','123','79775bd864446eb264079af41899724484073.png','北京市','北京市市辖区','丰台区','116.286139,39.848579',1,NULL,NULL),(15,8,16,'北京市大兴区黄村镇小营路北','吉野家','13523235345','123','d63fd28c4ca90a85a95a15dce8f46323304763.jpg','北京市','北京市市辖区','大兴区','116.333329,39.75364',1,NULL,NULL),(16,4,20,'北京市朝阳区所前镇大治桥南26号','徐小包的奶茶','13533245345','123','9fe02860ee166eafd82a279ed432c28e76716.jpg','北京市','北京市市辖区','朝阳区','116.49976,39.95478',1,NULL,NULL),(17,8,30,'北京市朝阳区南秀路1163号','米羔法式西点','13525245345','123','c0786cdd356f566367c99865110640aa10662.jpg','北京市','北京市市辖区','朝阳区','116.444579,39.939791',1,NULL,NULL),(18,8,35,'北京市朝阳区萧金路45号','阿园烘焙蛋糕坊','13523245349','123','5640fac7399c083ef687ef4383db0b62558706.jpg','北京市','北京市市辖区','朝阳区','116.505195,39.862466',1,NULL,NULL),(19,10,88,'北京市朝阳区闻兴路167号','上野树里','13523245340','123','b2d29599243e12749e205f3722efeb4e12127.jpg','北京市','北京市市辖区','朝阳区','116.474098,39.986522',1,NULL,NULL),(20,8,80,'北京市朝阳区水路36号','绝味鸭脖','13523845345','123','bb937d469c2cb7f44ca572797f295fbb35261.jpg','北京市','北京市市辖区','朝阳区','116.476991,39.885167',1,NULL,NULL),(21,9,20,'北京市朝阳区所前镇大治桥南23号','柳味螺蛳粉','13523245395','123','d79c0a1d7ba963826dcfc545f0d9777752686.jpg','北京市','北京市市辖区','朝阳区','116.490583,39.959076',1,NULL,NULL),(22,10,30,'北京市丰台区丰桥路5号院','果多美','13573245345','123','5e2f0ffe44fab348da5ffeb34551657d14834.jpg','北京市','北京市市辖区','丰台区','116.311633,39.850756',1,NULL,NULL),(23,9,28,'北京市大兴区金星西路3号院3号楼3层','渝是乎','13583742826','123','0592fd5251904fdb8fb1c3c6a597adb966176.jpg','北京市','北京市市辖区','大兴区','116.334179,39.76408',1,NULL,NULL),(24,3,15,'北京市大兴区新政街5号大兴一中对面','魏家凉皮','13523689033','123','3c53f1fdab901bdcdaaa4d841ef656d77717.jpeg','北京市','北京市市辖区','大兴区','116.344477,39.726088',1,NULL,NULL);

/*Table structure for table `store_foodtypes` */

DROP TABLE IF EXISTS `store_foodtypes`;

CREATE TABLE `store_foodtypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `storeId` int(11) DEFAULT NULL COMMENT '商家id',
  `foodTypeId` int(11) DEFAULT NULL COMMENT '菜品分类id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

/*Data for the table `store_foodtypes` */

insert  into `store_foodtypes`(`id`,`storeId`,`foodTypeId`) values (1,1,1),(2,1,2),(3,1,3),(4,2,1),(5,2,2),(6,2,3),(7,3,3),(8,3,4),(9,3,5),(10,4,2),(11,4,4),(12,4,6),(13,5,7),(14,6,4),(15,6,6),(16,7,1),(17,7,4),(18,7,5),(19,7,6),(20,8,2),(21,8,4),(22,8,6),(23,9,3),(24,9,6),(25,10,1),(26,10,3),(27,10,6),(28,11,1),(29,11,4),(30,11,7),(31,12,13),(32,13,1),(33,13,2),(34,13,4),(35,13,6),(36,14,1),(37,14,2),(38,14,4),(39,15,2),(40,15,3),(41,15,5),(42,15,6),(43,16,7),(44,16,8),(45,17,9),(46,18,9),(47,18,10),(48,19,9),(49,19,10),(50,20,11),(51,21,6),(52,21,11),(53,21,12),(54,22,13),(55,23,1),(56,23,2),(57,23,6),(58,23,9),(59,24,2),(60,24,5),(61,24,6),(62,24,12);

/*Table structure for table `store_storetypes` */

DROP TABLE IF EXISTS `store_storetypes`;

CREATE TABLE `store_storetypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `storeId` int(11) DEFAULT NULL COMMENT '商家id',
  `storeTypeId` int(11) DEFAULT NULL COMMENT '商家分类id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

/*Data for the table `store_storetypes` */

insert  into `store_storetypes`(`id`,`storeId`,`storeTypeId`) values (1,1,1),(2,2,1),(3,3,1),(4,4,3),(5,5,5),(6,6,3),(7,7,1),(8,8,3),(9,9,2),(10,10,1),(11,11,3),(12,12,4),(13,13,4),(14,14,3),(15,15,2),(16,16,5),(17,17,5),(18,18,5),(19,19,2),(20,20,3),(21,21,2),(22,22,4),(23,23,2),(24,24,1);

/*Table structure for table `store_types` */

DROP TABLE IF EXISTS `store_types`;

CREATE TABLE `store_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `storeType` varchar(100) DEFAULT NULL COMMENT '商家分类',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `store_types` */

insert  into `store_types`(`id`,`storeType`) values (1,'正餐优选'),(2,'快餐'),(3,'精选小吃'),(4,'鲜果购'),(5,'下午茶');

/*Table structure for table `storeaptitude` */

DROP TABLE IF EXISTS `storeaptitude`;

CREATE TABLE `storeaptitude` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `storeId` int(11) DEFAULT NULL COMMENT '商家id，资质信息对应唯一一个商家',
  `linkmanName` varchar(10) DEFAULT NULL COMMENT '联系人姓名',
  `linkmanPhone` varchar(11) DEFAULT NULL COMMENT '联系人电话',
  `legalRepresentative` varchar(10) DEFAULT NULL COMMENT '法定联系人',
  `IDCard` varchar(18) DEFAULT NULL COMMENT '法定代表人身份证号',
  `IDCardImg` varchar(100) DEFAULT NULL COMMENT '法人代表人手持身份证照片',
  `bankCard` varchar(50) DEFAULT NULL COMMENT '银行卡号',
  `shopCard` varchar(50) DEFAULT NULL COMMENT '营业执照号',
  `shopCardImg` varchar(100) DEFAULT NULL COMMENT '营业执照号照片',
  `foodLicenceImg` varchar(100) DEFAULT NULL COMMENT '餐饮服务许可证照片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `storeaptitude` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `userPassword` varchar(32) NOT NULL COMMENT '密码',
  `userName` varchar(32) DEFAULT NULL COMMENT '用户名称',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `image` varchar(100) DEFAULT NULL COMMENT '用户头像',
  `userPhone` varchar(11) DEFAULT NULL COMMENT '用户手机号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`userPassword`,`userName`,`birthday`,`image`,`userPhone`) values (1,'00000000a','张三',NULL,NULL,'13219505431');

/*Table structure for table `user_address` */

DROP TABLE IF EXISTS `user_address`;

CREATE TABLE `user_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL COMMENT '用户id',
  `contactAddress` varchar(500) NOT NULL COMMENT '地址',
  `isDefault` int(11) DEFAULT NULL COMMENT '是否默认',
  `contactName` varchar(100) DEFAULT NULL COMMENT '联系人姓名',
  `contactPhone` varchar(11) DEFAULT NULL COMMENT '联系人电话',
  `gender` int(11) DEFAULT NULL COMMENT '性别0：女，1：男',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `user_address` */

insert  into `user_address`(`id`,`userId`,`contactAddress`,`isDefault`,`contactName`,`contactPhone`,`gender`) values (1,1,'北京市大兴区京开路双河南里甲15幢4-5号15-5',NULL,'钟雪','13219505431',0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
