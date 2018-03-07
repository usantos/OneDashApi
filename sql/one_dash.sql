-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 07-Mar-2018 às 22:41
-- Versão do servidor: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `one_dash`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `acesso`
--

CREATE TABLE `acesso` (
  `id` int(11) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `usuario` varchar(64) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `data_ultimo_login` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `perfil` enum('ADMIN','FREE','VIP','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `acesso`
--

INSERT INTO `acesso` (`id`, `nome`, `usuario`, `senha`, `ativo`, `data_ultimo_login`, `perfil`) VALUES
(1, 'Ubiracy Miranda dos Santos', 'admin', '123', 1, '2018-03-07 14:34:35', 'ADMIN');

-- --------------------------------------------------------

--
-- Estrutura da tabela `acesso_plano`
--

CREATE TABLE `acesso_plano` (
  `id` int(11) NOT NULL,
  `id_acesso` int(11) NOT NULL,
  `id_plano` int(11) NOT NULL,
  `quantidade_aprovacao` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `planos`
--

CREATE TABLE `planos` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `valor` double DEFAULT NULL,
  `observação` text,
  `periodo` int(11) DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `planos`
--

INSERT INTO `planos` (`id`, `nome`, `valor`, `observação`, `periodo`, `ativo`) VALUES
(1, 'Bronze', 99.99, ' Testadores de Logins\r\n Sem Limites de Teste\r\n Ativação imediata', 15, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acesso`
--
ALTER TABLE `acesso`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `acesso_plano`
--
ALTER TABLE `acesso_plano`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_acesso` (`id_acesso`),
  ADD KEY `fk_plano` (`id_plano`);

--
-- Indexes for table `planos`
--
ALTER TABLE `planos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `acesso`
--
ALTER TABLE `acesso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `acesso_plano`
--
ALTER TABLE `acesso_plano`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `planos`
--
ALTER TABLE `planos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `acesso_plano`
--
ALTER TABLE `acesso_plano`
  ADD CONSTRAINT `fk_acesso` FOREIGN KEY (`id_acesso`) REFERENCES `acesso` (`id`),
  ADD CONSTRAINT `fk_plano` FOREIGN KEY (`id_plano`) REFERENCES `planos` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
