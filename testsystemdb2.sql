-- MySQL dump 10.13  Distrib 5.7.18, for Win64 (x86_64)
--
-- Host: localhost    Database: testsystemdb
-- ------------------------------------------------------
-- Server version	5.7.18-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin_account`
--

DROP TABLE IF EXISTS `admin_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_account` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_account`
--

LOCK TABLES `admin_account` WRITE;
/*!40000 ALTER TABLE `admin_account` DISABLE KEYS */;
INSERT INTO `admin_account` VALUES ('admin','admin');
/*!40000 ALTER TABLE `admin_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercise`
--

DROP TABLE IF EXISTS `exercise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exercise` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(100) NOT NULL,
  `is_choice_question` tinyint(4) unsigned NOT NULL,
  `is_single_choice_question` tinyint(4) unsigned NOT NULL,
  `option_A` varchar(100) DEFAULT NULL,
  `option_B` varchar(100) DEFAULT NULL,
  `option_C` varchar(100) DEFAULT NULL,
  `option_D` varchar(100) DEFAULT NULL,
  `answer` varchar(100) NOT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercise`
--

LOCK TABLES `exercise` WRITE;
/*!40000 ALTER TABLE `exercise` DISABLE KEYS */;
INSERT INTO `exercise` VALUES (1,'鸦片战争前中国封建社会的主要矛盾是（     ）',1,1,'地主阶级和农民阶级的矛盾','帝国主义和中华民族的矛盾','资产阶级和工人阶级的矛盾','封建主义和资本主义的矛盾','A'),(2,'中国封建社会产生过诸多“盛世”，出现在清代的是（     ）',1,1,'文景之治','贞观之治','开元之治','康乾盛世','D'),(3,'将中国领土台湾割让给日本的不平等条约是（     ）',1,1,'《南京条约》','《北京条约》','《马关条约》','《瑗珲条约》','C'),(4,'西方列强对中国的侵略，首先和主要的是（     ）',1,1,'政治控制','军事侵略','经济掠夺','文化渗透','B'),(5,'1839年组织编写成《四洲志》，向中国人介绍西方情况的是（     ）',1,1,'林则徐','魏源','马建忠','郑观应','A'),(6,'19世纪末，在帝国主义列强瓜分中国的狂潮中提出“门户开放”政策的国家是（     ）',1,1,'俄国','日本','美国','德国','C'),(7,'太平天国农民起义爆发的时间是（     ）',1,1,'1851年','1853年','1856年','1864年','A'),(8,'太平天国由盛而衰的转折点是（     ）',1,1,'永安建制','北伐失利','天京事变','洪秀全病逝','C'),(9,'最早对兴办洋务的指导思想作出完整表述的人是（     ）',1,1,'冯桂芬','马建忠','王韬','郑观应','A'),(10,'洋务运动时期最早创办的翻译学堂是（     ）',1,1,'同文馆','广方言馆','译书局','译书馆','A'),(11,'1898年发表《劝学篇》一文，对抗维新变法的洋务派官僚是（     ）',1,1,'李鸿章','左宗棠','张之洞','刘坤一','C'),(12,'戊戌维新时期，维新派在上海创办的影响较大的报刊是（     ）',1,1,'《时务报》','《国闻报》','《湘报》','《万国公报》','A'),(13,'中国第一个资产阶级革命政党是（     ）',1,1,'兴中会','中国同盟会','中华革命党','中国国民党','B'),(14,'武昌起义前夕，在保路运动中规模最大、斗争最激烈的省份是（     ）',1,1,'湖南','湖北','广东','四川','D'),(15,'中国历史上第一部具有资产阶级共和国宪法性质的法典是（     ）',1,1,'《中华民国宪法》','《钦定宪法大纲》','《中华民国约法》','《中华民国临时约法》','D'),(16,'为反对袁世凯刺杀宋教仁和“善后大借款”，孙中山在1913年领导革命党人发动了（     ）',1,1,'二次革命','护国战争','护法战争','北伐战争','A'),(17,'1930年成立的中国国民党临时行动委员会（又称第三党），其主要领导人是（     ）',1,1,'梁漱溟','黄炎培','张君劢','\"邓演达','\"'),(18,'1930年1月，毛泽东进一步从理论上阐述农村包围城市、武装夺取政权理论的文章是（     ）',1,1,'《中国的红色政权为什么能够存在?》','《星星之火，可以燎原》','《井冈山的斗争》','《中国革命战争的战略问题》','B'),(19,'1928年l2月，毛泽东主持制定的中国共产党历史上第一个土地法是（     ）',1,1,'《井冈山土地法》','《兴国土地法》','《关于清算、减租及土地问题的指示》','《中国土地法大纲》','A'),(20,'国民党四大家族官僚资本的性质是（     ）',1,1,'私人垄断资本主义','封建的买办的国家垄断资本主义','私人资本主义','国家资本主义','B'),(21,'936年10月，中国工农红军第一、二、四方面军胜利会师于（     ）',1,1,'陕北保安地区','陕北洛川地区','陕北瓦窑堡地区','甘肃会宁、静宁地区','D'),(22,'遵义会议后，中共中央政治局成立了新的三人团负责红军的军事行动，其成员是（     ）',1,1,'毛泽东、朱德、周恩来','毛泽东、朱德、王稼祥','毛泽东、周恩来、王稼祥','毛泽东、张闻天、周恩来','C'),(23,'中华民族进入全民族抗战是在（     ）',1,1,'九一八事变后','一二八事变后','华北事变后','卢沟桥事变后','D'),(24,'1935年12月，中国共产党确定抗日民族统一战线政策的会议是（     ）',1,1,'遵义会议','瓦窑堡会议','洛川会议','晋绥干部会议','B'),(25,'在抗日战争的战略防御阶段，国民党军队在正面战场上取得胜利的战役是（     ）',1,1,'台儿庄战役','桂南战役','枣宜战役','中条山战役','A'),(26,'毛泽东在《论持久战》中指出，中国抗日战争取得胜利最关键的阶段是（     ）',1,1,'战略防御阶段','战略相持阶段','战略反攻阶段','战略决战阶段','B'),(27,'1945年4月，出席联合国制宪会议中国代表团中的解放区代表是（     ）',1,1,'周恩来','刘少奇','董必武','王若飞','C'),(28,'抗日战争胜利后，国共双方通过重庆谈判签订《政府与中共代表会谈纪要》的时间是（     ）',1,1,'1945年8月','1945年9月','1945年10月','1945年11月','C'),(29,'1947年10月10日，《中国人民解放军宣言》提出的口号是（     ）',1,1,'和平、民主、团结','向北发展、向南防御','打倒蒋介石，解放全中国','将革命进行到底','C'),(30,'1949年6月，毛泽东发表的系统论述中国共产党建国主张的著作是（     ）',1,1,'《新民主主义论》','《目前形势和我们的任务》','《论联合政府》','《论人民民主专政》','D'),(31,'1915年兴起的新文化运动的主要内容是（       ）',1,0,'提倡民主和科学','提倡白话文','提倡新文学','宣传男女平等和个性解放','ABCD'),(32,'五四时期，研究和宣传马克思主义的社团有（       ）',1,0,'马克思主义研究会','马克思主义研究会','新民学会','工读互助团','ABCD'),(33,'1926年3月，蒋介石制造的旨在打击共产党和工农革命力量的事件是（       ）',1,0,'商团叛乱','暗杀廖仲恺','中山舰事件','整理党务案','CD'),(34,'毛泽东在《关于正确处理人民内部矛盾的问题》一文中提出，社会主义社会的基本矛盾是（       ）',1,0,'敌我矛盾','敌我矛盾','生产力和生产关系的矛盾','经济基础和上层建筑的矛盾','CD'),(35,'1961年，中共八届九中全会制定的关于国民经济的指导方针是（       ）',1,0,'调整','巩固','充实','提高','ABCD'),(36,'“文化大革命”期间，中国共产党粉碎林彪和“四人帮”两个反革命集团分别是在（       ）',1,0,'1971','1972','1975','1976','AD'),(37,'中共十一届三中全会的深远历史意义主要体现在（       ）',1,0,'结束了粉碎”四人帮”后党和国家的工作在徘徊中前进的局面','开始了党在思想、政治、组织等领域的全面拨乱反正','形成了以邓小平为核心的中共中央领导集体','揭开了社会主义改革开放的序幕','ABCD'),(38,'1987年召开的中共十三大提出了（       ）',1,0,'社会主义初级阶段的理论','党在社会主义初级阶段的基本路线','社会主义现代化建设”三步走”的发展战略','党在社会主义初级阶段的基本纲领','ABC'),(39,'1998年11月，中共中央决定在县级以上党政领导班子和干部中开展的”三讲”教育是（       ）',1,0,'讲学习','讲纪律','讲政治','讲正气','ACD'),(40,'1902年至1911年，在我国发生的爱国运动主要有（          ）',1,0,'拒俄运动','收回利权运动','保路运动','抵制美货运动','AD'),(41,'1947年7月至9月，中国共产党在河北省平山县召开全国土地会议，制定和通过了《中国土地法大纲》，明确规定平均地权。',0,0,'','','','','F'),(42,'孙中山是中国民主革命的先行者。',0,0,'','','','','T'),(43,'1840年鸦片战争后，中国两大政治任务是争取民族独立人民解放和实现国家富强人民富裕。',0,0,'','','','','F'),(44,'英法联军火烧圆明园。',0,0,'','','','','T'),(45,'对资本主义工商业的社会主义改造就是指的对生产资料所有制的改造。',0,0,'','','','','F'),(46,'第一次护法运动的失败，标志着旧民主主义革命的终结',0,0,'','','','','F'),(47,'八国联军侵华战争是19世纪末年列强瓜分中国狂潮的开端。',0,0,'','','','','F'),(48,'中国革命之所以能够得到坚持和发展，根本的原因在于中国共产党紧紧依靠工人阶级，开展武装斗争。',0,0,'','','','','F'),(49,'没收官僚资本主义具有双重性，既具有民主革命的性质，又具有社会主义革命的性质。',0,0,'','','','','T'),(50,'我国对资本主义工商业的社会主义改造采取的政策是和平赎买政策。',0,0,'','','','','T'),(51,'以李立三为代表的“ 左”倾冒险主义最大的恶果，就是使红军第五反“围剿”失败。',0,0,'','','','','F'),(52,'中国的抗日战争开辟了世界第一个大规模反法西斯战场，是世界反法西斯战争的东方主战场。',0,0,'','','','','T'),(53,'在新民主主义革命时期，只有民族资产阶级拥护革命时，才保护民族资本主义。',0,0,'','','','','F'),(54,'第三条道路的破产根本原因是蒋介石的专制统治造成的。',0,0,'','','','','F'),(55,'1895年《马关条约》签订后，日本开始了在台湾长达50年的殖民统治。',0,0,'','','','','T');
/*!40000 ALTER TABLE `exercise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `setting_mode` tinyint(4) NOT NULL AUTO_INCREMENT,
  `start_time` varchar(50) NOT NULL,
  `test_time` varchar(50) NOT NULL,
  PRIMARY KEY (`setting_mode`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'2017-06-01 19:00:00','1:00:00');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_account`
--

DROP TABLE IF EXISTS `student_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_account` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_account`
--

LOCK TABLES `student_account` WRITE;
/*!40000 ALTER TABLE `student_account` DISABLE KEYS */;
INSERT INTO `student_account` VALUES ('1','092214101'),('10','092214110'),('11','092214111'),('12','092214112'),('13','092214113'),('14','092214114'),('15','092214115'),('16','092214116'),('17','092214117'),('18','092214118'),('19','092214119'),('2','092214102'),('20','092214120'),('21','092214121'),('22','092214122'),('23','092214123'),('24','092214124'),('25','092214125'),('26','092214126'),('27','092214127'),('28','092214128'),('29','092214129'),('3','092214103'),('30','092214130'),('31','092214131'),('32','092214132'),('33','092214133'),('34','092214134'),('35','092214135'),('36','092214136'),('37','092214137'),('38','092214138'),('39','092214139'),('4','092214104'),('40','092214140'),('5','092214105'),('6','092214106'),('7','092214107'),('8','092214108'),('9','092214109');
/*!40000 ALTER TABLE `student_account` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-01 19:23:03
