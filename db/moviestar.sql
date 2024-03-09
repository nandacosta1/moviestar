/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 10.4.32-MariaDB : Database - moviestar
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`moviestar` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `moviestar`;

/*Table structure for table `movies` */

DROP TABLE IF EXISTS `movies`;

CREATE TABLE `movies` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `trailer` varchar(150) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `length` varchar(50) DEFAULT NULL,
  `users_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_id` (`users_id`),
  CONSTRAINT `movies_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `movies` */

insert  into `movies`(`id`,`title`,`description`,`image`,`trailer`,`category`,`length`,`users_id`) values 
(5,'Hercules 2',' Filme perfeito!','b52c78be3f5e2d257b8d138ba452d5eb8df22edbc09b023f573ffdf15c27be31881dce1c39285d37e80d7d0b762336cf13f889677a1c3b57ec1a8f6f.jpg','https://www.youtube.com/embed/1l4hrj0Dp_w?si=R7RJGdOcYEaoi9SO','Ação','1hr',13),
(6,'Grown Up','Filme perfeito, muito engraçado!','2b26241ca73d144d3874e09295b0e068566b08d901aeebf05d2bd92f8fe09d2459601642ab57a2fe46f45d33e18877bdd65e29efbe502561d0ef8b40.jpg','https://www.youtube.com/watch?v=e01NVCveGkg','Comédia','1hr',13),
(7,'Hercules 2','Filme muito bom!','4c81f807e59c869e83895c6064520436ce11587e5a740cf2374a6dc22b2dbe01bee8a27f074b2a3cda8bbd25f186e4315c1b28992afa95e9fb82b623.jpg','https://www.youtube.com/watch?v=Py5_SVwSe8w','Ação','2hr 20min',13),
(8,'Black Box','muito legal','f2667fa855a4268c68539ced5fa48f1e0f78c1a3f907eaac84c040454b75a3bf424e8667c300183fa7630e33e01829bd2516e8f279c032cbd56c059f.jpg','https://www.youtube.com/watch?v=Qrc8wQqnl0g','Ação','1hr 30min',13),
(10,'Game of Thrones','A melhor serie de todos os tempos!','cb02f09ae40658f7b58650c92a32d2ef1232989cc85ccef606524b6edc15cbfedd0439bffd6bdd6caf1aa9eeb1650218c5774bbc07022012fdb7dcfe.jpg','https://www.youtube.com/watch?v=KPLWWIOCOOQ','Ação','2hr 30min',13),
(11,'Filme Was','muito bom!','005ebe301bfe698de7948f4dfd43b4b3531cc9bc8dd9f2e098bce4cedf02b7eeb64e6c88b8565ffd319cd172855f3bb5f961aad38dc2d9d14025c2df.jpg','','Ação','3hr',15),
(12,'Meu filme','testando.','8ea75785da5fb49f96795bcbeb323e6b4b82a0be4a3fd75b8139c6e4f63872220f38362619cf06495e8196f918d08398b7f2ad624b9d2c3cfb7e5934.jpg','','Ação','1hr',16);

/*Table structure for table `reviews` */

DROP TABLE IF EXISTS `reviews`;

CREATE TABLE `reviews` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `rating` int(11) DEFAULT NULL,
  `review` text DEFAULT NULL,
  `users_id` int(11) unsigned DEFAULT NULL,
  `movies_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_id` (`users_id`),
  KEY `movies_id` (`movies_id`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`movies_id`) REFERENCES `movies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `reviews` */

insert  into `reviews`(`id`,`rating`,`review`,`users_id`,`movies_id`) values 
(3,10,'bom',16,10),
(4,2,'ruim....',16,7);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `token` varchar(200) DEFAULT NULL,
  `bio` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`lastname`,`email`,`password`,`image`,`token`,`bio`) values 
(12,'fernanda','Costa','teste@gmail.com','$2y$10$AWByoQMYUUoqdisvIRKaYeOmsoEDOqRl5j4ZY01ladZMpwEaWwTK.',NULL,'2bb111adef1eac80f062fc64563d35d9debcc3aa65e65634748be421c01755967c26797bd6a3f29b842467961e8f8c47df11',NULL),
(13,'Pitica','tia','teste23@gmail.com','$2y$10$c2D7LUYKjFG2LXQW5y3tKup9fEARmysT5kwQR.GgvzSzBb1MmONRy',NULL,'abf14b1f8cd57e7ac5c42d83ccb1462bdce5ad3647c63bfbbe66edf44801e98752368260deaf339359e94c6f569d1732038e',NULL),
(14,'Fernanda','Costa','Fer@teste.com','$2y$10$ALXVu/MyxY96Wlwe8i4X8.mEeWpThqzHqQfXO4mrSy66AW/lsTKta','79d32c6e456865958448b590cdf8496f26899a81f9a4c12a57f962326df49263ea8b9810fb9da11c26a8d31acbcb0dc57e82d498617d0eae113387c1.jpg','78ba854bc01ed5656bce41d9b67aa8a9d4d9d40f30d5f33f83e6a7196e79a89e8166c9cd6447f56d5124ceb0e15dd5fd8003','Sou programador.'),
(15,'was','mendes','was@teste.com','$2y$10$Nwc2hTn.7vJ/VVueMAwLGOAWB12MDLFoH0P45oOMucDZIBGml.Ebq',NULL,'e71388a1511b2d4ff5675937e9bf64d81c3cffb2931fe62dc0d0c553c4f69073419e1cf46d54336d51c639ad0b0b9833ade6',NULL),
(16,'joao','grilo','joao@teste.com','$2y$10$IqbTuPN4uRPnNYLCWjHAPe03vDirJ.y7B91FjFs/nRJgaCRdB0TAq',NULL,'8ed0dc8889855054a80a039c558d5f667a9844d9da6be79dbba31e1b6dcdd1e3c4910f41690a39b41eeba4482493e1007210',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
