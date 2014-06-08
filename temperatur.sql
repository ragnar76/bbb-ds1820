SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE TABLE IF NOT EXISTS `werte` (
  `datum` varchar(255) NOT NULL,
  `uhrzeit` varchar(255) NOT NULL,
  `temp_innen` varchar(255) NOT NULL,
  `temp_aussen` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `werte` (`datum`, `uhrzeit`, `temp_innen`, `temp_aussen`) VALUES
('2014-06-08', '06:25:02', '20.75', '24.937'),
('2014-06-08', '06:26:18', '20.75', '25'),
('2014-06-08', '06:33:36', '20.812', '25');
