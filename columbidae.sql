-- MySQL dump 10.13  Distrib 5.7.31, for Win64 (x86_64)
--
-- Host: localhost    Database: columbidae
-- ------------------------------------------------------
-- Server version	5.7.31

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
-- Table structure for table `auditory_signal`
--

DROP TABLE IF EXISTS `auditory_signal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditory_signal` (
  `Name` varchar(50) NOT NULL,
  `Audio` varchar(100) DEFAULT NULL,
  `Description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditory_signal`
--

LOCK TABLES `auditory_signal` WRITE;
/*!40000 ALTER TABLE `auditory_signal` DISABLE KEYS */;
INSERT INTO `auditory_signal` VALUES ('Affection','https://www.youtube.com/watch?v=3Km-jtXueTw','Bird will coo softly for about five to ten mintues.'),('Fear','https://www.youtube.com/watch?v=VIyfqlMNhRM','Bird will make a sound similar to the oinking of a pig.'),('Mating Ritual','https://www.youtube.com/watch?v=CjFZM6_cny8','Bird struts around whilst expanding their crop, widening their tail feathers, and cooing vigoursly');
/*!40000 ALTER TABLE `auditory_signal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `behavior`
--

DROP TABLE IF EXISTS `behavior`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `behavior` (
  `Name` varchar(50) NOT NULL,
  `Video` varchar(100) DEFAULT NULL,
  `Description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `behavior`
--

LOCK TABLES `behavior` WRITE;
/*!40000 ALTER TABLE `behavior` DISABLE KEYS */;
/*!40000 ALTER TABLE `behavior` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `common_names`
--

DROP TABLE IF EXISTS `common_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_names` (
  `SLatinName` varchar(50) NOT NULL,
  `VernacularName` varchar(50) DEFAULT NULL,
  KEY `COMMON_NAMES_ibfk_1` (`SLatinName`),
  CONSTRAINT `COMMON_NAMES_ibfk_1` FOREIGN KEY (`SLatinName`) REFERENCES `species` (`LatinName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `common_names`
--

LOCK TABLES `common_names` WRITE;
/*!40000 ALTER TABLE `common_names` DISABLE KEYS */;
INSERT INTO `common_names` VALUES ('Geopelia Striata','Zebra Dove'),('Columba Livia','Rock Dove'),('Columba Palumbus','Common Woodpigeon'),('Geopelia Cuneata','Zebra Dove'),('Columba Livia','Feral Pigeon'),('Homo Sapiens','Humans'),('Treron Calvus','African Green Pigeon'),('Goura Victoria','Victorian Crowned Pigeon'),('Columbina Squammata','Scaled Dove'),('Columbina Cyanopis','Blue-eyed Ground-dove'),('Reinwardtoena Browni','Pied Cuckoo-dove');
/*!40000 ALTER TABLE `common_names` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conservation`
--

DROP TABLE IF EXISTS `conservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conservation` (
  `SLatinName` varchar(50) NOT NULL,
  `Category` char(2) DEFAULT NULL,
  `PrevCategory` char(2) DEFAULT NULL,
  `PopTrend` varchar(50) DEFAULT NULL,
  `LastAssesed` date DEFAULT NULL,
  PRIMARY KEY (`SLatinName`),
  CONSTRAINT `CONSERVATION_ibfk_1` FOREIGN KEY (`SLatinName`) REFERENCES `species` (`LatinName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conservation`
--

LOCK TABLES `conservation` WRITE;
/*!40000 ALTER TABLE `conservation` DISABLE KEYS */;
INSERT INTO `conservation` VALUES ('Columba Livia','LC','LC','Decreasing','2016-10-01'),('Columba Palumbus','LC','LC','Increasing','2018-08-09'),('Columbina Cyanopis','CR','CR','Decreasing','2019-02-26'),('Columbina Squammata','LC','LC','Stable','2016-10-01'),('Ectopistes Migratorius','EX','EX','Unspecified','2019-06-11'),('Geopelia Cuneata','LC','LC','Stable','2016-10-01'),('Geopelia Striata','LC','LC','Stable','2016-10-01'),('Goura Victoria','NT','VU','Decreasing','2016-10-01'),('Reinwardtoena Browni','NT','NT','Decreasing','2019-08-09'),('Treron Calvus','LC','LC','Decreasing','2016-10-01');
/*!40000 ALTER TABLE `conservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exhibits_auditory_signal`
--

DROP TABLE IF EXISTS `exhibits_auditory_signal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exhibits_auditory_signal` (
  `Name` varchar(50) NOT NULL,
  `SLatinName` varchar(50) NOT NULL,
  KEY `Name` (`Name`),
  KEY `SLatinName` (`SLatinName`),
  CONSTRAINT `EXHIBITS_AUDITORY_SIGNAL_ibfk_1` FOREIGN KEY (`Name`) REFERENCES `auditory_signal` (`Name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `EXHIBITS_AUDITORY_SIGNAL_ibfk_2` FOREIGN KEY (`SLatinName`) REFERENCES `species` (`LatinName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exhibits_auditory_signal`
--

LOCK TABLES `exhibits_auditory_signal` WRITE;
/*!40000 ALTER TABLE `exhibits_auditory_signal` DISABLE KEYS */;
INSERT INTO `exhibits_auditory_signal` VALUES ('Mating Ritual','Columba Livia'),('Mating Ritual','Columba Palumbus'),('Mating Ritual','Geopelia Cuneata'),('Mating Ritual','Geopelia Striata'),('Affection','Columba Livia'),('Affection','Columba Palumbus');
/*!40000 ALTER TABLE `exhibits_auditory_signal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exhibits_behavior`
--

DROP TABLE IF EXISTS `exhibits_behavior`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exhibits_behavior` (
  `Name` varchar(50) NOT NULL,
  `SLatinName` varchar(50) NOT NULL,
  KEY `Name` (`Name`),
  KEY `SLatinName` (`SLatinName`),
  CONSTRAINT `EXHIBITS_BEHAVIOR_ibfk_1` FOREIGN KEY (`Name`) REFERENCES `behavior` (`Name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `EXHIBITS_BEHAVIOR_ibfk_2` FOREIGN KEY (`SLatinName`) REFERENCES `species` (`LatinName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exhibits_behavior`
--

LOCK TABLES `exhibits_behavior` WRITE;
/*!40000 ALTER TABLE `exhibits_behavior` DISABLE KEYS */;
/*!40000 ALTER TABLE `exhibits_behavior` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `family`
--

DROP TABLE IF EXISTS `family`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `family` (
  `FamilyName` varchar(50) NOT NULL,
  `Description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`FamilyName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `family`
--

LOCK TABLES `family` WRITE;
/*!40000 ALTER TABLE `family` DISABLE KEYS */;
INSERT INTO `family` VALUES ('Accipitridae','Many well-known birds, such as hawks, eagles, kites, harriers and Old World vultures are included in this group.'),('Columbidae','Doves & Pigeons'),('Falconidae','The falcons and caracaras are around 60 species of diurnal birds of prey that make up the order Falconidae. The family is divided into two subfamilies, Polyborinae, which includes the caracaras and forest falcons, and Falconinae, the falcons, kestrels and falconets (Microhierax and Spiziapteryx). '),('Filidae','Felidae is a family of mammals in the order Carnivora, colloquially referred to as cats, and constitutes a clade. A member of this family is also called a felid.  The term \"cat\" refers both to felids in general and specifically to the domestic cat (Felis catus).'),('Hominidae','The Hominidae, whose members are known as great apes or hominids, are a taxonomic family of primates that includes eight extant species in four genera: Pongo, the Bornean, Sumatran and Tapanuli orangutan; Gorilla, the eastern and western gorilla; Pan, the common chimpanzee and the bonobo; and Homo, of which only modern humans remain.');
/*!40000 ALTER TABLE `family` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genus`
--

DROP TABLE IF EXISTS `genus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genus` (
  `GenusName` varchar(50) NOT NULL,
  `SubFamilyName` varchar(50) DEFAULT NULL,
  `Description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`GenusName`),
  KEY `GENUS_ibfk_1` (`SubFamilyName`),
  CONSTRAINT `GENUS_ibfk_1` FOREIGN KEY (`SubFamilyName`) REFERENCES `subfamily` (`SubFamilyName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genus`
--

LOCK TABLES `genus` WRITE;
/*!40000 ALTER TABLE `genus` DISABLE KEYS */;
INSERT INTO `genus` VALUES ('Accipiter','Accipitrinae','Bird hawks'),('Buteo','Accipitrinae','Buteonine hawks and buzzards'),('Columba','Columbinae','Pigeons'),('Columbina','Columbinae','Ground-doves'),('Ectopistes','Columbinae','Ectopistes translates as \"moving about\" or \"wandering\", this genus is applied to birds that have longer wings and the characteristics of the wedge shape of the tail'),('Falco','Falconinae','Falcons and kestrels'),('Felis','Filinae','Felis is a genus of small and medium-sized cat Felinae species native to most of Africa and south of 60° latitude in Europe and Asia to Indochina. The genus includes the domestic cat. The smallest Felis species is the black-footed cat with a head and body length from 38 to 42 cm (15 to 17 in). The largest is the jungle cat with a head and body length from 62 to 76 cm (24 to 30 in)'),('Geopelia','Columbinae','Zebra Doves'),('Goura','Gourinae','Crowned Pigeons'),('Homo','Homininae','Homo is the genus that emerged in the otherwise extinct genus Australopithecus that encompasses the extant species Homo sapiens (modern humans), plus several extinct species classified as either ancestral to or closely related to modern humans (depending on the species), most notably Homo erectus and Homo neanderthalensis. The genus emerged with the appearance of Homo habilis, just over 2 million years ago.[2] Homo, together with the genus Paranthropus, is probably sister to Australopithecus africanus, which itself had previously split from the lineage of Pan, the chimpanzees.'),('Parabuteo','Accipitrinae','Harris\'s Hawks'),('Reinwardtoena','Columbinae','Reinwardtoena is a small genus of doves in the family Columbidae. They are found on parts of Indonesia, Papua New Guinea and the Solomon Islands.'),('Treron','Treroninae','Treron is a genus of bird in the pigeon family Columbidae. Its members are commonly called green pigeons. The genus is distributed across Asia and Africa. This genus contains 29 species, remarkable for their green coloration, hence the common name, which comes from a carotenoid pigment in their diet. Green pigeons have diets of various fruits, nuts, and/or seeds. They dwell in trees and occupy a variety of wooded habitats. Members of this genus can be further grouped into species with long tails, medium-length tails, and wedge-shaped tails. Most species of green pigeon display sexual dimorphism, where males and females can be readily distinguished by different colored plumage. ');
/*!40000 ALTER TABLE `genus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habitat`
--

DROP TABLE IF EXISTS `habitat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `habitat` (
  `SLatinName` varchar(50) NOT NULL,
  `System` varchar(50) DEFAULT NULL,
  `Biomes` varchar(100) DEFAULT NULL,
  `Countries` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`SLatinName`),
  CONSTRAINT `HABITAT_ibfk_1` FOREIGN KEY (`SLatinName`) REFERENCES `species` (`LatinName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habitat`
--

LOCK TABLES `habitat` WRITE;
/*!40000 ALTER TABLE `habitat` DISABLE KEYS */;
INSERT INTO `habitat` VALUES ('Columba Livia','Terrestrial','Artificial; Caves; Mountains; Cliffs;','Afghanistan; Algeria; Andorra; Austria; Azerbaijan; Belarus; Belgium; Bulgaria; Cabo Verde; Chad; Croatia; Cyprus; Egypt; Estonia; Faroe Islands; Finland; France; Greece; Iceland; Iran, Islamic Republic of; Iraq; Ireland; Italy; Jordan; Latvia; Lebanon; Libya; Luxembourg; Mali; Malta; Mauritania; Moldova; Monaco; Morocco; North Macedonia; Oman; Palestine, State of; Portugal; Qatar; Russian Federation; Russian Federation (Central Asian Russia); San Marino; Saudi Arabia; Slovenia; Spain; Sudan; Sweden; Syrian Arab Republic; Tunisia; Turkey; Ukraine; United Arab Emirates; United Kingdom; Yemen'),('Columba Palumbus','Terrestrial','Artificial; Shrubland; Forest','Algeria; Andorra; Azerbaijan; Belgium; Bosnia and Herzegovina; Bulgaria; Croatia; Cyprus; Czechia; Denmark; Estonia; Finland; France; Germany; Greece; India; Iran, Islamic Republic of; Iraq; Ireland; Israel; Italy; Latvia; Lebanon; Lithuania; Luxembourg; Moldova; Morocco; Nepal; Netherlands; North Macedonia; Oman; Poland; Portugal; Romania; Russian Federation (European Russia); Slovakia; Slovenia; Spain; Sweden; Switzerland; Syrian Arab Republic; Tunisia; Turkey; Ukraine; United Kingdom; Western Sahara'),('Columbina Cyanopis','Terrestrial','Savanna; Grassland','Brazil'),('Columbina Squammata','Terrestrial','Artificial; Grassland; Shrubland; Savanna','Argentina; Bolivia, Plurinational States of; Brazil; Colombia; French Guiana; Paraguay; Trinidad and Tobago; Venezuela'),('Ectopistes Migratorius','Terrestrial','Forest','Canada; United States'),('Geopelia Cuneata','Terrestrial; Freshwater','Desert; Wetlands','Australia'),('Geopelia Striata','Terrestrial','Artificial; Shrubland','French Polynesia; Madagascar; Qatar; Réunion; Saint Helena, Ascension and Tristan da Cunha; Seychelles; United States'),('Goura Victoria','Terrestrial','Forest','Indonesia; Papua New Guinea'),('Treron Calvus','Terrestrial; Freshwater','Artificial; Shrubland; Savanna; Forest','Angola; Benin; Botswana; Burkina Faso; Burundi; Cameroon; Central African Republic; Chad; Congo; Congo, The Democratic Republic of the; Côte d\'Ivoire; Equatorial Guinea; Ethiopia; Gabon; Gambia; Ghana; Guinea; Guinea-Bissau; Kenya; Liberia; Malawi; Mali; Mozambique; Namibia; Niger; Nigeria; Rwanda; Sao Tome and Principe; Senegal; Sierra Leone; South Sudan; Sudan; Tanzania, United Republic of; Togo; Uganda; Zambia; Zimbabwe');
/*!40000 ALTER TABLE `habitat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nat_predator`
--

DROP TABLE IF EXISTS `nat_predator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nat_predator` (
  `SLatinName` varchar(50) NOT NULL,
  `VernacularName` varchar(50) DEFAULT NULL,
  KEY `SLatinName` (`SLatinName`),
  CONSTRAINT `NAT_PREDATOR_ibfk_1` FOREIGN KEY (`SLatinName`) REFERENCES `species` (`LatinName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nat_predator`
--

LOCK TABLES `nat_predator` WRITE;
/*!40000 ALTER TABLE `nat_predator` DISABLE KEYS */;
INSERT INTO `nat_predator` VALUES ('Homo Sapiens','Humans'),('Felis Catus','Cat'),('Buteo Jamaicensis','Red-tailed Hawk'),('Falco Peregrinus','Peregrine Falcon'),('Parabuteo Unicinctus','Harris\' Hawk'),('Accipiter Nisus','Eurasian Sparrowhawk');
/*!40000 ALTER TABLE `nat_predator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offspring`
--

DROP TABLE IF EXISTS `offspring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offspring` (
  `SerialNumber` varchar(20) NOT NULL,
  `OffspringSN` varchar(20) NOT NULL,
  UNIQUE KEY `OffspringSN` (`OffspringSN`),
  KEY `SerialNumber` (`SerialNumber`),
  CONSTRAINT `OFFSPRING_ibfk_1` FOREIGN KEY (`SerialNumber`) REFERENCES `pigeons` (`SerialNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offspring`
--

LOCK TABLES `offspring` WRITE;
/*!40000 ALTER TABLE `offspring` DISABLE KEYS */;
INSERT INTO `offspring` VALUES ('271XEM38PT','612LIXOOPT'),('271XEM38PT','RTM91PNA0'),('271XEM38PT','RXM91PNB9'),('AIOXAN21I9','90AUIWM2T'),('AIOXAN21I9','AINEXBZZ31'),('AIOXAN21I9','ZY224LQH7K'),('ASDIZ123AE','271XEM38PT'),('RER981222','IEMXAIAT1C'),('RER981222','KAIUE231XA'),('RER981222','LXT98AE421'),('RER981222','OIXAE329KK');
/*!40000 ALTER TABLE `offspring` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pigeons`
--

DROP TABLE IF EXISTS `pigeons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pigeons` (
  `SerialNumber` varchar(20) NOT NULL,
  `EyeColor` varchar(20) DEFAULT NULL,
  `Weight` int(11) DEFAULT NULL,
  `Breed` varchar(50) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  PRIMARY KEY (`SerialNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pigeons`
--

LOCK TABLES `pigeons` WRITE;
/*!40000 ALTER TABLE `pigeons` DISABLE KEYS */;
INSERT INTO `pigeons` VALUES ('1230AEEEE9','Yellow',334,'Jacobin','2005-01-29'),('271XEM38PT','Orange',382,'French Mondain','2015-03-02'),('31231IIXN28','White',399,'King Pigeon','2014-07-21'),('612LIXOOPT','Orange',391,'French Mondain','2016-09-06'),('90AUIWM2T','Orange ',361,'French Mondain','2017-03-07'),('999YUIAXEE','Orange',341,'French Mondain','2014-12-21'),('AINEXBZZ31','Orange',265,'French Mondain','2017-03-09'),('AIOXAN21I9','Orange',322,'French Mondain','2015-06-01'),('AIZ900IA53T','Brown',340,'French Mondain','2015-05-21'),('ASDIZ123AE','Orange',317,'French Mondain','2015-02-21'),('AZI918AXKA','Orange',370,'Opal French Mondain','2017-03-14'),('E4421UXEEM','Yellow',344,'Jacobin','2005-01-27'),('IEMXAIAT1C','Orange',309,'French Mondain','2015-10-21'),('KAIUE231XA','Orange',315,'French Mondain','2015-09-27'),('KENNIIL31S','Orange',333,'French Mondain','2015-04-04'),('KJ99341ADH','Orange',320,'French Mondain','2010-12-29'),('LXT98AE421','Orange',311,'French Mondain','2015-10-02'),('OIXAE329KK','Orange',401,'French Mondain','2017-11-11'),('RER981222','Orange',353,'French Mondain','2015-02-27'),('RTM91PNA0','Orange',390,'French Mondain','2017-01-03'),('RXM91PNB9','Orange',402,'French Mondain','2017-01-01'),('ZY224LQH7K','Orange',353,'French Mondain','2016-09-04');
/*!40000 ALTER TABLE `pigeons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `species`
--

DROP TABLE IF EXISTS `species`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `species` (
  `LatinName` varchar(50) NOT NULL,
  `GenusName` varchar(50) DEFAULT NULL,
  `Diet` varchar(100) DEFAULT NULL,
  `Description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`LatinName`),
  KEY `SPECIES_ibfk_1` (`GenusName`),
  CONSTRAINT `SPECIES_ibfk_1` FOREIGN KEY (`GenusName`) REFERENCES `genus` (`GenusName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `species`
--

LOCK TABLES `species` WRITE;
/*!40000 ALTER TABLE `species` DISABLE KEYS */;
INSERT INTO `species` VALUES ('Accipiter Nisus','Accipiter','Carnivore','The Eurasian sparrowhawk (Accipiter nisus), also known as the northern sparrowhawk or simply the sparrowhawk, is a small bird of prey in the family Accipitridae. Adult male Eurasian sparrowhawks have bluish grey upperparts and orange-barred underparts; females and juveniles are brown above with brown barring below. The female is up to 25% larger than the male – one of the greatest size differences between the sexes in any bird species. Though it is a predator which specialises in catching woodland birds, the Eurasian sparrowhawk can be found in any habitat and often hunts garden birds in towns and cities. Males tend to take smaller birds, including tits, finches, and sparrows; females catch primarily thrushes and starlings, but are capable of killing birds weighing 500 g (18 oz) or more. '),('Buteo Jamaicensis','Buteo','Carnivore','The red-tailed hawk (Buteo jamaicensis) is a bird of prey that breeds throughout most of North America, from the interior of Alaska and northern Canada to as far south as Panama and the West Indies. It is one of the most common members within the genus of Buteo in North America or worldwide. The red-tailed hawk is one of three species colloquially known in the United States as the \"chickenhawk\", though it rarely preys on standard-sized chickens.  The bird is sometimes also referred to as the red-tail for short, when the meaning is clear in context. Red-tailed hawks can acclimate to all the biomes within their range, occurring on the edges of non-ideal habitats such as dense forests and sandy deserts. The red-tailed hawk occupies a wide range of habitats and altitudes including deserts, grasslands, coniferous and deciduous forests, agricultural fields and urban areas. Its latitudinal limits fall around the tree line in the Arctic and the species is absent from the high Arctic. '),('Columba Livia','Columba','Seeds','Also known as the common pigeon, this bird lives primarily in the cities due to the similarity of their natural habitat situated on the cliff sides of the Mediterranean sea. '),('Columba Palumbus','Columba','Vegtables','The three Western European Columba pigeons, common wood pigeon, stock dove, and rock pigeon, though superficially alike, have very distinctive characteristics; the common wood pigeon may be identified at once by its larger size at 38–44.5 cm (15.0–17.5 in) and weight 300–615 g (10.6–21.7 oz), and the white on its neck and wing.[6] It is otherwise a basically grey bird, with a pinkish breast. The wingspan can range from 68 to 80 cm (27 to 31 in) and the wing chord measures 24 to 25.4 cm (9.4 to 10.0 in). The tail measures 13.8 to 15 cm (5.4 to 5.9 in), the bill is 1.9 to 2.2 cm (0.75 to 0.87 in) and the tarsus is 2.5 to 2.8 cm (0.98 to 1.10 in).[7] Adult birds bear a series of green and white patches on their necks, and a pink patch on their chest.'),('Columbina Cyanopis','Columbina','Seeds','The blue-eyed ground dove (Columbina cyanopis) is a species of bird in the family Columbidae. It is endemic to the Cerrado region of Brazil. Its natural habitat is subtropical or tropical dry lowland grassland. It is threatened by habitat loss. '),('Columbina Squammata','Columbina','Seeds','The scaled dove (Columbina squammata), also known as scaly dove, Ridgway\'s dove, mottled dove, and South American zebra dove, is found in Argentina, Bolivia, Brazil, Colombia, French Guiana, Paraguay, Trinidad and Tobago, and Venezuela. Its natural habitats are subtropical or tropical dry shrubland, subtropical or tropical moist shrubland, subtropical or tropical seasonally wet or flooded lowland grassland, and heavily degraded former forest. '),('Ectopistes Migratorius','Ectopistes','Nuts','The passenger pigeon or wild pigeon (Ectopistes migratorius) is an extinct species of pigeon that was endemic to North America. Its common name is derived from the French word passager, meaning \"passing by\", due to the migratory habits of the species. The scientific name also refers to its migratory characteristics. The morphologically similar mourning dove (Zenaida macroura) was long thought to be its closest relative, and the two were at times confused, but genetic analysis has shown that the genus Patagioenas is more closely related to it than the Zenaida doves. '),('Falco Peregrinus','Falco','Carnivore','The peregrine falcon (Falco peregrinus), also known as the peregrine,[2] and historically as the duck hawk in North America,[3] is a widespread bird of prey (raptor) in the family Falconidae. A large, crow-sized falcon, it has a blue-grey back, barred white underparts, and a black head. The Peregrine is renowned for its speed, reaching over 320 km/h (200 mph) during its characteristic hunting stoop (high-speed dive),[4] making it the fastest bird in the world, as well as the fastest member of the animal kingdom.[5][6][7] According to a National Geographic TV program, the highest measured speed of a peregrine falcon is 389 km/h (242 mph).[8][9] As is typical for bird-eating raptors, peregrine falcons are sexually dimorphic, with females being considerably larger than males.'),('Felis Catus','Felis','Carnivore','The cat (Felis catus) is a domestic species of small carnivorous mammal.[1][2] It is the only domesticated species in the family Felidae and is often referred to as the domestic cat to distinguish it from the wild members of the family.[4] A cat can either be a house cat, a farm cat or a feral cat; the latter ranges freely and avoids human contact.[5] Domestic cats are valued by humans for companionship and their ability to hunt pests such as rodents. About 60 cat breeds are recognized by various cat registries.'),('Geopelia Cuneata','Geopelia','Seeds','Diamond doves are a diurnal species and are usually seen in small groups or pairs, foraging on the ground. They eat the seeds of herbs and grasses, staying close to water. When feeding, they walk sedately but can run quickly, tail raised, when disturbed. Their calls are a mournful, slow \"coo\"; repeated twice at times, followed sometimes by a long-short-long coo. They emit a few short loud coos when alarmed. When they fly, their wings sometimes make a whistling \"frrr\" noise.'),('Geopelia Striata','Geopelia','Seeds','The zebra dove (Geopelia striata) also known as barred ground dove, is a bird of the dove family, Columbidae, native to Southeast Asia. They are small birds with a long tail. They are predominantly brownish-grey in colour with black-and-white barring. They are known for their pleasant soft, staccato cooing calls.'),('Goura Victoria','Goura','Fruit','The Victoria crowned pigeon (Goura victoria) is a large, bluish-grey pigeon with elegant blue lace-like crests, maroon breast and red irises. It is part of a genus (Goura) of four unique, very large, ground-dwelling pigeons native to the New Guinea region. The bird may be easily recognized by the unique white tips on its crests and by its deep \'whooping\' sounds made while calling.[2] Its name commemorates the British monarch Queen Victoria. '),('Homo Sapiens','Homo','Omnivore','Humans (Homo sapiens) are the only extant members of the subtribe Hominina. Together with chimpanzees, gorillas, and orangutans, they are part of the family Hominidae (the great apes, or hominids). Terrestrial animals, humans are characterized by their erect posture and bipedal locomotion; high manual dexterity and heavy tool use compared to other animals; open-ended and complex language use compared to other animal communications; larger, more complex brains than other animals; and highly advanced and organized societies.'),('Parabuteo Unicinctus','Parabuteo','Carnivore','Harris\'s hawk (Parabuteo unicinctus), formerly known as the bay-winged hawk or dusky hawk, and known in Latin America as peuco, is a medium-large bird of prey that breeds from the southwestern United States south to Chile, central Argentina, and Brazil. Birds are sometimes reported at large in Western Europe, especially Britain, but it is a popular species in falconry and these records almost certainly all refer to escapes from captivity. '),('Reinwardtoena Browni','Reinwardtoena','Fruit','The pied cuckoo-dove (Reinwardtoena browni) is a bird species in the family Columbidae. It is endemic to the Bismarck Archipelago.'),('Treron Calvus','Treron','Fruit','The African green pigeon (Treron calvus) is a species of bird in the family Columbidae, and one of 5 green pigeon species in the Afrotropics. The species has a wide range in Sub-Saharan Africa with around 17 accepted races');
/*!40000 ALTER TABLE `species` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subfamily`
--

DROP TABLE IF EXISTS `subfamily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subfamily` (
  `SubFamilyName` varchar(50) NOT NULL,
  `FamilyName` varchar(50) NOT NULL,
  `Description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`SubFamilyName`),
  KEY `SUBFAMILY_ibfk_1` (`FamilyName`),
  CONSTRAINT `SUBFAMILY_ibfk_1` FOREIGN KEY (`FamilyName`) REFERENCES `family` (`FamilyName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subfamily`
--

LOCK TABLES `subfamily` WRITE;
/*!40000 ALTER TABLE `subfamily` DISABLE KEYS */;
INSERT INTO `subfamily` VALUES ('Accipitrinae','Accipitridae','Hawks, eagles, buzzards, vultures, and relatives'),('Columbinae','Columbidae','Typical Doves & Pigeons'),('Falconinae','Falconidae','Falcons'),('Filinae','Filidae','The Felinae are a subfamily of the family Felidae. This subfamily comprises the small cats having a bony hyoid, because of which they are able to purr but not roar.'),('Gourinae','Columbidae','Crowned Pigeons'),('Homininae','Hominidae','Homininae, also called \\\"African hominids\\\" or \\\"African apes\\\", is a subfamily of Hominidae. It includes two tribes, with their extant as well as extinct species: 1) the Hominini tribe (with the genus Homo including modern humans and numerous extinct species; '),('Treroninae','Columbidae','Fruit doves, Imperial Pigeons, and Relatives');
/*!40000 ALTER TABLE `subfamily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'columbidae'
--
/*!50003 DROP PROCEDURE IF EXISTS `usp_Get_All_Species` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`columbidae`@`localhost` PROCEDURE `usp_Get_All_Species`()
BEGIN SELECT * FROM SPECIES; END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_insert_AddNewFamily` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`columbidae`@`localhost` PROCEDURE `usp_insert_AddNewFamily`(IN `FamilyName` VARCHAR(50), IN `Description` VARCHAR(1000))
BEGIN

INSERT INTO `FAMILY` VALUES(FamilyName, Description);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_insert_AddNewGenus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`columbidae`@`localhost` PROCEDURE `usp_insert_AddNewGenus`(IN `GenusName` VARCHAR(50), IN `SubFamilyName` VARCHAR(50), IN `Description` VARCHAR(1000))
BEGIN

INSERT INTO `GENUS` VALUES(GenusName, SubFamilyName, Description);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_insert_AddNewSpecies` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`columbidae`@`localhost` PROCEDURE `usp_insert_AddNewSpecies`(IN `LatinName` VARCHAR(50), IN `GenusName` VARCHAR(50), IN `Diet` VARCHAR(100), IN `Description` VARCHAR(1000))
BEGIN INSERT INTO `SPECIES` VALUES(LatinName, GenusName, Diet, Description); END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_insert_AddNewSubfamily` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`columbidae`@`localhost` PROCEDURE `usp_insert_AddNewSubfamily`(IN `SubFamilyName` VARCHAR(50), IN `FamilyName` VARCHAR(50), IN `Description` VARCHAR(1000))
BEGIN

INSERT INTO `SUBFAMILY` VALUES(SubFamilyName, FamilyName, Description);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_Insert_AuditorySignal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`columbidae`@`localhost` PROCEDURE `usp_Insert_AuditorySignal`(IN `Name` VARCHAR(50), IN `AUDIO` VARCHAR(100), IN `Description` VARCHAR(1000))
BEGIN

INSERT INTO `AUDITORY_SIGNAL` VALUES(Name, Audio, Description);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_insert_pigeon` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`columbidae`@`localhost` PROCEDURE `usp_insert_pigeon`(IN `SerialNumber` VARCHAR(20), IN `EyeColor` VARCHAR(20), IN `Weight` INT, IN `Breed` VARCHAR(50), IN `DOB` DATE)
BEGIN

	INSERT INTO `PIGEONS` VALUES(SerialNumber, EyeColor, Weight, Breed, DOB);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_query_Conservation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`columbidae`@`localhost` PROCEDURE `usp_query_Conservation`(IN `LatinName` VARCHAR(50))
BEGIN

IF ( LatinName IN (SELECT `FamilyName` FROM `FAMILY`) ) THEN



	SELECT * FROM `CONSERVATION` WHERE `CONSERVATION`.`SLatinName` IN (

		SELECT `SPECIES`.`LatinName` FROM SPECIES WHERE `SPECIES`.`GenusName` IN 

			(SELECT `GENUS`.`GenusName` FROM `GENUS` WHERE `GENUS`.`SubFamilyName` IN 

				(SELECT `SubFamilyName` FROM `SUBFAMILY` WHERE `SUBFAMILY`.`FamilyName` IN (LatinName))));



ELSEIF (LatinName IN (SELECT `SubFamilyName` FROM `SUBFAMILY`) ) THEN



	SELECT * FROM `CONSERVATION` WHERE `CONSERVATION`.`SLatinName` IN (

		SELECT `SPECIES`.`LatinName` FROM SPECIES WHERE `SPECIES`.`GenusName` IN 

			(SELECT `GENUS`.`GenusName` FROM `GENUS` WHERE `GENUS`.`SubFamilyName` IN (LatinName)));

            

ELSEIF (LatinName IN (SELECT `GenusName` FROM `GENUS`) ) THEN



	SELECT * FROM `CONSERVATION` WHERE `CONSERVATION`.`SLatinName` IN (

		SELECT `SPECIES`.`LatinName` FROM SPECIES WHERE `SPECIES`.`GenusName` IN (LatinName));

        

ELSEIF (LatinName IN (SELECT `LatinName` FROM `SPECIES`) ) THEN



	SELECT * FROM `CONSERVATION` WHERE `CONSERVATION`.`SLatinName` IN (LatinName);

    

END IF;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_query_FetchAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`columbidae`@`localhost` PROCEDURE `usp_query_FetchAll`(IN `TableName` VARCHAR(20))
BEGIN

	SELECT * FROM `columbidae`.TableName;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usp_query_GetShortestCommonAncestor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`columbidae`@`localhost` PROCEDURE `usp_query_GetShortestCommonAncestor`(IN `SLatinName1` VARCHAR(50), IN `SLatinName2` VARCHAR(50))
BEGIN



IF ( (SELECT `GenusName` FROM SPECIES WHERE `LatinName` = SLatinName1) = (SELECT `GenusName` FROM SPECIES WHERE `LatinName` = SLatinName2) ) THEN 

SELECT `GenusName` FROM SPECIES WHERE `LatinName` = SLatinName1;



ELSEIF (  (SELECT `SubFamilyName` FROM `GENUS` WHERE `GenusName` = (SELECT `GenusName` FROM SPECIES WHERE `LatinName` = SLatinName1)) = (SELECT `SubFamilyName` FROM `GENUS` WHERE `GenusName` = (SELECT `GenusName` FROM SPECIES WHERE `LatinName` = SLatinName2)) ) THEN

SELECT `SubFamilyName` FROM `GENUS` WHERE `GenusName` = (SELECT `GenusName` FROM SPECIES WHERE `LatinName` = SLatinName1);



ELSEIF ( (SELECT `FamilyName` FROM SUBFAMILY WHERE `SubFamilyName` = (SELECT `SubFamilyName` FROM GENUS WHERE `GenusName` = (SELECT `GenusName` FROM SPECIES WHERE `LatinName` = SLatinName1))) = (SELECT `FamilyName` FROM SUBFAMILY WHERE `SubFamilyName` = (SELECT `SubFamilyName` FROM GENUS WHERE `GenusName` = (SELECT `GenusName` FROM SPECIES WHERE `LatinName` = SLatinName2))) ) THEN

SELECT `FamilyName` FROM SUBFAMILY WHERE `SubFamilyName` = (SELECT `SubFamilyName` FROM GENUS WHERE `GenusName` = (SELECT `GenusName` FROM SPECIES WHERE `LatinName` = SLatinName1));



ELSE

SELECT FALSE;



END IF;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-10 18:30:04
