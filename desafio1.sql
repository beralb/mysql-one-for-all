DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`planos` (
  `plano_id` INT NOT NULL AUTO_INCREMENT,
  `plano` VARCHAR(20) NOT NULL,
  `valor_plano` DOUBLE NOT NULL,
  PRIMARY KEY (`plano_id`),
  UNIQUE INDEX `plano_UNIQUE` (`plano` ASC))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`usuarios` (
  `usuario_id` INT NOT NULL AUTO_INCREMENT,
  `usuario` VARCHAR(45) NOT NULL,
  `idade` INT(3) NOT NULL,
  `data_assinatura` DATE NOT NULL,
  `planos_plano_id` INT NOT NULL,
  PRIMARY KEY (`usuario_id`),
  INDEX `fk_usuarios_planos1_idx` (`planos_plano_id` ASC),
  CONSTRAINT `fk_usuarios_planos1`
    FOREIGN KEY (`planos_plano_id`)
    REFERENCES `SpotifyClone`.`planos` (`plano_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`artistas` (
  `artista_id` INT NOT NULL AUTO_INCREMENT,
  `artista` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`artista_id`),
  UNIQUE INDEX `artista_UNIQUE` (`artista` ASC))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`albuns` (
  `album_id` INT NOT NULL AUTO_INCREMENT,
  `album` VARCHAR(45) NOT NULL,
  `ano_lancamento` VARCHAR(45) NOT NULL,
  `artistas_artista_id` INT NOT NULL,
  PRIMARY KEY (`album_id`),
  UNIQUE INDEX `album_UNIQUE` (`album` ASC),
  INDEX `fk_albuns_artistas1_idx` (`artistas_artista_id` ASC),
  CONSTRAINT `fk_albuns_artistas1`
    FOREIGN KEY (`artistas_artista_id`)
    REFERENCES `SpotifyClone`.`artistas` (`artista_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`cancoes` (
  `cancao_id` INT NOT NULL AUTO_INCREMENT,
  `cancao` VARCHAR(45) NOT NULL,
  `duracao_segundos` INT NOT NULL,
  `albuns_album_id` INT NOT NULL,
  PRIMARY KEY (`cancao_id`),
  INDEX `fk_cancoes_albuns1_idx` (`albuns_album_id` ASC),
  CONSTRAINT `fk_cancoes_albuns1`
    FOREIGN KEY (`albuns_album_id`)
    REFERENCES `SpotifyClone`.`albuns` (`album_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`seguindo_artistas` (
  `usuarios_usuario_id` INT NOT NULL,
  `artistas_artista_id` INT NOT NULL,
  INDEX `fk_usuarios_has_artistas_artistas1_idx` (`artistas_artista_id` ASC),
  INDEX `fk_usuarios_has_artistas_usuarios1_idx` (`usuarios_usuario_id` ASC),
  PRIMARY KEY (`usuarios_usuario_id`, `artistas_artista_id`),
  CONSTRAINT `fk_usuarios_has_artistas_usuarios1`
    FOREIGN KEY (`usuarios_usuario_id`)
    REFERENCES `SpotifyClone`.`usuarios` (`usuario_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_has_artistas_artistas1`
    FOREIGN KEY (`artistas_artista_id`)
    REFERENCES `SpotifyClone`.`artistas` (`artista_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`historico_de_reproducoes` (
  `data_reproducao` DATETIME NOT NULL,
  `cancoes_cancao_id` INT NOT NULL,
  `usuarios_usuario_id` INT NOT NULL,
  INDEX `fk_usuarios_has_cancoes_cancoes1_idx` (`cancoes_cancao_id` ASC),
  INDEX `fk_usuarios_has_cancoes_usuarios1_idx` (`usuarios_usuario_id` ASC),
  UNIQUE INDEX `cancao_user_unique` (`cancoes_cancao_id` ASC, `usuarios_usuario_id` ASC),
  PRIMARY KEY (`cancoes_cancao_id`, `usuarios_usuario_id`),
  CONSTRAINT `fk_usuarios_has_cancoes_usuarios1`
    FOREIGN KEY (`usuarios_usuario_id`)
    REFERENCES `SpotifyClone`.`usuarios` (`usuario_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_has_cancoes_cancoes1`
    FOREIGN KEY (`cancoes_cancao_id`)
    REFERENCES `SpotifyClone`.`cancoes` (`cancao_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;





INSERT INTO `SpotifyClone`.`artistas`
(`artista`)
VALUES
('Beyoncé'),
('Queen'),
('Elis Regina'),
('Baco Exu do Blues'),
('Blind Guardian'),
('Nina Simone');

INSERT INTO `SpotifyClone`.`albuns`
(`album`,
`ano_lancamento`,
`artistas_artista_id`)
VALUES
('Renaissance',	2022, 1),
('Jazz', 1978, 2),
('Hot Space', 1982, 2),
('Falso Brilhante', 1998, 3),
('Vento de Maio', 2001, 3),
('QVVJFA?', 2003, 4),
('Somewhere Far Beyond', 2007, 5),
('I Put A Spell On You', 2012, 6);

INSERT INTO `SpotifyClone`.`cancoes`
(`cancao`,
`duracao_segundos`,
`albuns_album_id`)
VALUES
('BREAK MY SOUL', 279, 1),
('VIRGO’S GROOVE', 369, 1),
('ALIEN SUPERSTAR', 116, 1),
('Don’t Stop Me Now', 203, 2),
('Under Pressure', 152, 3),
('Como Nossos Pais', 105, 4),
('O Medo de Amar é o Medo de Ser Livre', 207, 5),
('Samba em Paris', 267, 6),
('The Bard’s Song', 244, 7),
('Feeling Good', 100, 8);

INSERT INTO `SpotifyClone`.`planos`
(`plano`,
`valor_plano`)
VALUES
('gratuito', 0.00),
('familiar', 7.99),
('universitário', 5.99),
('pessoal', 6.99);

INSERT INTO `SpotifyClone`.`usuarios`
(`usuario`,
`idade`,
`data_assinatura`,
`planos_plano_id`)
VALUES
('Barbara Liskov', 82, '2019-10-20', 1),
('Robert Cecil Martin', 58, '2017-01-06', 1),
('Ada Lovelace', 37, '2017-12-30', 2),
('Martin Fowler', 46, '2017-01-17', 2),
('Sandi Metz', 58, '2018-04-29', 2),
('Paulo Freire', 19, '2018-02-14', 3),
('Bell Hooks', 26, '2018-01-05', 3),
('Christopher Alexander', 85, '2019-06-05', 4),
('Judith Butler', 45, '2020-05-13', 4),
('Jorge Amado', 58, '2017-02-17', 4);

INSERT INTO `SpotifyClone`.`historico_de_reproducoes`
(`data_reproducao`,
`cancoes_cancao_id`,
`usuarios_usuario_id`)
VALUES
('2022-02-28 10:45:55',	8, 1),
('2020-05-02 05:30:35', 2, 1),
('2020-03-06 11:22:33', 10, 1),
('2022-08-05 08:05:17', 10, 2),
('2020-01-02 07:40:33', 7, 2),
('2020-11-13 16:55:13', 10, 3),
('2020-12-05 18:38:30', 2, 3),
('2021-08-15 17:10:10', 8, 4),
('2022-01-09 01:44:33', 8, 5),
('2020-08-06 15:23:43', 5, 5),
('2017-01-24 00:31:17', 7, 6),
('2017-10-12 12:35:20', 1, 6),
('2011-12-15 22:30:49', 4, 7),
('2012-03-17 14:56:41', 4, 8),
('2022-02-24 21:14:22', 9, 9),
('2015-12-13 08:30:22', 3, 10);

INSERT INTO `SpotifyClone`.`seguindo_artistas`
(`usuarios_usuario_id`,
`artistas_artista_id`)
VALUES
(1,	1),
(1,	2),
(1,	3),
(2,	1),
(2,	3),
(3,	2),
(4,	4),
(5,	5),
(5,	6),
(6,	6),
(6,	1),
(7,	6),
(9,	3),
(10, 2);
