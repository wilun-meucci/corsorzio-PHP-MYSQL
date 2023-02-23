-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Feb 23, 2023 alle 23:02
-- Versione del server: 10.4.27-MariaDB
-- Versione PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `consorzio`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `attività`
--

CREATE TABLE `attività` (
  `codice` int(8) NOT NULL,
  `data` date DEFAULT NULL,
  `lattelavorato` int(8) DEFAULT NULL,
  `latteimpiegato` int(8) DEFAULT NULL,
  `scelta` tinyint(1) DEFAULT NULL,
  `formeprodotte` int(4) DEFAULT NULL,
  `formevendute` int(4) DEFAULT NULL,
  `codcaseificio` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `caseifici`
--

CREATE TABLE `caseifici` (
  `codice` int(4) NOT NULL,
  `nome` varchar(40) DEFAULT NULL,
  `titolare` varchar(30) DEFAULT NULL,
  `indirizzo` varchar(30) DEFAULT NULL,
  `località` varchar(30) DEFAULT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `mail` varchar(30) DEFAULT NULL,
  `latitudine` double DEFAULT NULL,
  `longitudine` double DEFAULT NULL,
  `codprovincia` int(2) DEFAULT NULL,
  `psw` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `caseifici`
--

INSERT INTO `caseifici` (`codice`, `nome`, `titolare`, `indirizzo`, `località`, `telefono`, `mail`, `latitudine`, `longitudine`, `codprovincia`, `psw`) VALUES
(1, 'Fiordilatte', 'Pirla', 'Via Mac Mahon', 'Milano', '0223165561', 'Fiordilatte@gmail.com', 45.4902238, 9.1612469, NULL, 'yes'),
(2, 'oud de pied', 'Pirla', 'Via Mac Mahon', 'Milano', '0223165561', 'ouddepied@gmail.com', 45.4902238, 9.1612469, NULL, 'yes'),
(3, 'altro nome', 'Pirla', 'Via Mac Mahon', 'Milano', '0223165561', 'altronome@gmail.com', 45.4902238, 9.1612469, NULL, 'yes'),
(4, 'si', 'Pirla', 'Via Mac Mahon', 'Milano', '0223165561', 'si@gmail.com', 45.4902238, 9.1612469, NULL, 'yes'),
(5, 'meuccheese', 'allesandro giorni', 'Via del Filarete', 'firenze', '055 7070111', 'meuccheese@itismeucci.com', 43.76873, 11.2569, 1, 'yes'),
(6, 'formaggio a tutto tondo', 'mario rossi', 'formacity', 'firenze', '23434647', 'formaggio@tuttotondo', 235, 5325, 1, 'yes');

-- --------------------------------------------------------

--
-- Struttura della tabella `clienti`
--

CREATE TABLE `clienti` (
  `codice` int(6) NOT NULL,
  `nome` varchar(40) DEFAULT NULL,
  `tipo` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `forme`
--

CREATE TABLE `forme` (
  `codice` int(8) NOT NULL,
  `stagionatura` int(2) DEFAULT NULL,
  `scelta` int(1) DEFAULT NULL,
  `progressivo` int(8) DEFAULT NULL,
  `anno` int(4) DEFAULT NULL,
  `mese` int(2) DEFAULT NULL,
  `codcaseificio` int(4) DEFAULT NULL,
  `codcliente` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `immagini`
--

CREATE TABLE `immagini` (
  `codice` int(8) NOT NULL,
  `pathname` varchar(50) DEFAULT NULL,
  `codcaseificio` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `province`
--

CREATE TABLE `province` (
  `codice` int(11) NOT NULL,
  `sigla` varchar(2) DEFAULT NULL,
  `nome` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `province`
--

INSERT INTO `province` (`codice`, `sigla`, `nome`) VALUES
(1, 'FI', 'Firenze'),
(2, 'MI', 'Milano'),
(3, 'NA', 'Napoli');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `attività`
--
ALTER TABLE `attività`
  ADD PRIMARY KEY (`codice`),
  ADD KEY `codcaseificio` (`codcaseificio`);

--
-- Indici per le tabelle `caseifici`
--
ALTER TABLE `caseifici`
  ADD PRIMARY KEY (`codice`),
  ADD UNIQUE KEY `u_caseifici` (`mail`,`nome`),
  ADD KEY `codprovincia` (`codprovincia`);

--
-- Indici per le tabelle `clienti`
--
ALTER TABLE `clienti`
  ADD PRIMARY KEY (`codice`);

--
-- Indici per le tabelle `forme`
--
ALTER TABLE `forme`
  ADD PRIMARY KEY (`codice`),
  ADD KEY `codcaseificio` (`codcaseificio`),
  ADD KEY `codcliente` (`codcliente`);

--
-- Indici per le tabelle `immagini`
--
ALTER TABLE `immagini`
  ADD PRIMARY KEY (`codice`),
  ADD KEY `codcaseificio` (`codcaseificio`);

--
-- Indici per le tabelle `province`
--
ALTER TABLE `province`
  ADD PRIMARY KEY (`codice`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `attività`
--
ALTER TABLE `attività`
  MODIFY `codice` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `caseifici`
--
ALTER TABLE `caseifici`
  MODIFY `codice` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT per la tabella `clienti`
--
ALTER TABLE `clienti`
  MODIFY `codice` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `forme`
--
ALTER TABLE `forme`
  MODIFY `codice` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `immagini`
--
ALTER TABLE `immagini`
  MODIFY `codice` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `province`
--
ALTER TABLE `province`
  MODIFY `codice` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `attività`
--
ALTER TABLE `attività`
  ADD CONSTRAINT `attività_ibfk_1` FOREIGN KEY (`codcaseificio`) REFERENCES `caseifici` (`codice`);

--
-- Limiti per la tabella `caseifici`
--
ALTER TABLE `caseifici`
  ADD CONSTRAINT `caseifici_ibfk_1` FOREIGN KEY (`codprovincia`) REFERENCES `province` (`codice`);

--
-- Limiti per la tabella `forme`
--
ALTER TABLE `forme`
  ADD CONSTRAINT `forme_ibfk_1` FOREIGN KEY (`codcaseificio`) REFERENCES `caseifici` (`codice`),
  ADD CONSTRAINT `forme_ibfk_2` FOREIGN KEY (`codcliente`) REFERENCES `clienti` (`codice`);

--
-- Limiti per la tabella `immagini`
--
ALTER TABLE `immagini`
  ADD CONSTRAINT `immagini_ibfk_1` FOREIGN KEY (`codcaseificio`) REFERENCES `caseifici` (`codice`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
