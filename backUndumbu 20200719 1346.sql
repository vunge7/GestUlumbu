-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.59-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema undumbudb
--

CREATE DATABASE IF NOT EXISTS undumbudb;
USE undumbudb;

--
-- Definition of table `componentesg`
--

DROP TABLE IF EXISTS `componentesg`;
CREATE TABLE `componentesg` (
  `pkComponentesG` int(11) NOT NULL AUTO_INCREMENT,
  `imagem` varchar(100) DEFAULT NULL,
  `descricao` varchar(500) DEFAULT NULL,
  `fkPatrimonio` int(11) NOT NULL,
  `dataCadastro` datetime DEFAULT NULL,
  `fkUsuario` int(11) NOT NULL,
  PRIMARY KEY (`pkComponentesG`),
  KEY `fk_componentesg_patrimonio1_idx` (`fkPatrimonio`),
  KEY `fk_componentesg_usuario1_idx` (`fkUsuario`),
  CONSTRAINT `fk_componentesg_patrimonio1` FOREIGN KEY (`fkPatrimonio`) REFERENCES `patrimonio` (`pkPatrimonio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_componentesg_usuario1` FOREIGN KEY (`fkUsuario`) REFERENCES `usuario` (`pkUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `componentesg`
--

/*!40000 ALTER TABLE `componentesg` DISABLE KEYS */;
/*!40000 ALTER TABLE `componentesg` ENABLE KEYS */;


--
-- Definition of table `evidenciag`
--

DROP TABLE IF EXISTS `evidenciag`;
CREATE TABLE `evidenciag` (
  `pkEvidenciaG` int(11) NOT NULL AUTO_INCREMENT,
  `imagem` varchar(100) DEFAULT NULL,
  `descricao` varchar(500) DEFAULT NULL,
  `fkPatrimonio` int(11) NOT NULL,
  `dataCadastro` datetime DEFAULT NULL,
  `fkUsuario` int(11) NOT NULL,
  PRIMARY KEY (`pkEvidenciaG`),
  KEY `fk_evidenciag_patrimonio1_idx` (`fkPatrimonio`),
  KEY `fk_evidenciag_usuario1_idx` (`fkUsuario`),
  CONSTRAINT `fk_evidenciag_patrimonio1` FOREIGN KEY (`fkPatrimonio`) REFERENCES `patrimonio` (`pkPatrimonio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_evidenciag_usuario1` FOREIGN KEY (`fkUsuario`) REFERENCES `usuario` (`pkUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `evidenciag`
--

/*!40000 ALTER TABLE `evidenciag` DISABLE KEYS */;
/*!40000 ALTER TABLE `evidenciag` ENABLE KEYS */;


--
-- Definition of table `patrimonio`
--

DROP TABLE IF EXISTS `patrimonio`;
CREATE TABLE `patrimonio` (
  `pkPatrimonio` int(11) NOT NULL AUTO_INCREMENT,
  `nomePatrimonio` varchar(100) DEFAULT NULL,
  `imagem` varchar(100) DEFAULT NULL,
  `descricao` varchar(500) DEFAULT NULL,
  `fkProvincia` int(11) NOT NULL,
  `dataFundacao` date DEFAULT NULL,
  `fkTipopatrimonio` int(11) NOT NULL,
  `dataCadastro` datetime DEFAULT NULL,
  `fkUsuario` int(11) NOT NULL,
  `latitude` mediumtext,
  `longitude` mediumtext,
  PRIMARY KEY (`pkPatrimonio`),
  KEY `FK_patrimonio_provincia` (`fkProvincia`),
  KEY `FK_patrimonio_TipoP` (`fkTipopatrimonio`),
  KEY `fk_patrimonio_usuario1_idx` (`fkUsuario`),
  CONSTRAINT `fk_patrimonio_usuario1` FOREIGN KEY (`fkUsuario`) REFERENCES `usuario` (`pkUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_patrimonio_provincia` FOREIGN KEY (`fkProvincia`) REFERENCES `provincia` (`pkProvincia`),
  CONSTRAINT `FK_patrimonio_TipoP` FOREIGN KEY (`fkTipopatrimonio`) REFERENCES `tipopatrimonio` (`pktipoPatrimonio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patrimonio`
--

/*!40000 ALTER TABLE `patrimonio` DISABLE KEYS */;
/*!40000 ALTER TABLE `patrimonio` ENABLE KEYS */;


--
-- Definition of table `pesquisa`
--

DROP TABLE IF EXISTS `pesquisa`;
CREATE TABLE `pesquisa` (
  `pkpesquisa` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(500) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `fkUsuario` int(11) NOT NULL,
  PRIMARY KEY (`pkpesquisa`),
  KEY `fk_pesquisa_usuario1_idx` (`fkUsuario`),
  CONSTRAINT `fk_pesquisa_usuario1` FOREIGN KEY (`fkUsuario`) REFERENCES `usuario` (`pkUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pesquisa`
--

/*!40000 ALTER TABLE `pesquisa` DISABLE KEYS */;
/*!40000 ALTER TABLE `pesquisa` ENABLE KEYS */;


--
-- Definition of table `pessoa`
--

DROP TABLE IF EXISTS `pessoa`;
CREATE TABLE `pessoa` (
  `pkPessoa` int(11) NOT NULL AUTO_INCREMENT,
  `nomeCompleto` varchar(100) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `Telefone` varchar(150) DEFAULT NULL,
  `endereco` varchar(200) DEFAULT NULL,
  `dataNascimento` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`pkPessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pessoa`
--

/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
/*!40000 ALTER TABLE `pessoa` ENABLE KEYS */;


--
-- Definition of table `provincia`
--

DROP TABLE IF EXISTS `provincia`;
CREATE TABLE `provincia` (
  `pkProvincia` int(11) NOT NULL AUTO_INCREMENT,
  `nomeProvincia` varchar(200) DEFAULT NULL,
  `clima` enum('Frio','Quente') DEFAULT NULL,
  PRIMARY KEY (`pkProvincia`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `provincia`
--

/*!40000 ALTER TABLE `provincia` DISABLE KEYS */;
INSERT INTO `provincia` (`pkProvincia`,`nomeProvincia`,`clima`) VALUES 
 (1,'Luanda',NULL);
/*!40000 ALTER TABLE `provincia` ENABLE KEYS */;


--
-- Definition of table `tipopatrimonio`
--

DROP TABLE IF EXISTS `tipopatrimonio`;
CREATE TABLE `tipopatrimonio` (
  `pktipoPatrimonio` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`pktipoPatrimonio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tipopatrimonio`
--

/*!40000 ALTER TABLE `tipopatrimonio` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipopatrimonio` ENABLE KEYS */;


--
-- Definition of table `tipousuario`
--

DROP TABLE IF EXISTS `tipousuario`;
CREATE TABLE `tipousuario` (
  `pkTipoUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`pkTipoUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tipousuario`
--

/*!40000 ALTER TABLE `tipousuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipousuario` ENABLE KEYS */;


--
-- Definition of table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `pkUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `senha` varchar(200) DEFAULT NULL,
  `fkTipousuario` int(11) NOT NULL,
  `fkPessoa` int(11) NOT NULL,
  PRIMARY KEY (`pkUsuario`),
  KEY `FK_Usuario_tipousuario` (`fkTipousuario`),
  KEY `FK_Usuario_pessoa` (`fkPessoa`),
  CONSTRAINT `FK_Usuario_pessoa` FOREIGN KEY (`fkPessoa`) REFERENCES `pessoa` (`pkPessoa`),
  CONSTRAINT `FK_Usuario_tipousuario` FOREIGN KEY (`fkTipousuario`) REFERENCES `tipousuario` (`pkTipoUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usuario`
--

/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
