-- Creando la BD

CREATE DATABASE notas;
USE notas;


-- Creando las tablas

CREATE TABLE IF NOT EXISTS usuarios (
    `user_id`             INT PRIMARY KEY AUTO_INCREMENT NOT NULL UNIQUE,
    `nombre`              VARCHAR(100) NOT NULL,
    `email`               VARCHAR(50) NOT NULL UNIQUE
);

DESCRIBE usuarios;

CREATE TABLE IF NOT EXISTS notas (
    `notes_id`              INT PRIMARY KEY AUTO_INCREMENT NOT NULL UNIQUE,
    `tituloNota`            VARCHAR (100) NOT NULL,
    `contenidoNota`         VARCHAR(150),
    `bloqueoNota`           TINYINT NOT NULL,
    `creacionNota`          DATETIME NOT NULL,
    `modificacionNota`      DATETIME NOT NULL,
    `deleteNota`            DATETIME NOT NULL,
    `idUsuario`             INT NOT NULL,
    FOREIGN KEY (idUsuario) REFERENCES usuarios(user_id)
);

DESCRIBE notas;

CREATE TABLE IF NOT EXISTS categorias (
    `categories_id`         INT PRIMARY KEY AUTO_INCREMENT NOT NULL UNIQUE,
    `name`                  VARCHAR(50),
    `idNota`                INT NOT NULL,
    `idUsuario`             INT NOT NULL,
    FOREIGN KEY (idNota)    REFERENCES notas(notes_id),
    FOREIGN KEY (idUsuario) REFERENCES usuarios(user_id)
);

DESCRIBE categorias;


-- Creando los datos en usuarios

INSERT INTO usuarios (user_id, nombre, email)
VALUES (DEFAULT, 'Daniel Radcliffe', 'danielr@gmail.com'),
(DEFAULT, 'Emma Watson', 'emmawatson@gmail.com'),
(DEFAULT, 'Rupert Grint', 'rupertg@gmail.com'),
(DEFAULT, 'Edward Norton', 'edwn@gmail.com'),
(DEFAULT, 'Hermione Granger', 'hermionegranger@gmail.com'),
(DEFAULT, 'Ned Stark', 'neddy@gmail.com'),
(DEFAULT, 'Bart Simpson', 'bartsimpson@gmail.com'),
(DEFAULT, 'Art Vandelay', 'artyv@gmail.com'),
(DEFAULT, 'Frodo Bolson', 'frodobaggins@gmail.com'),
(DEFAULT, 'Ringo Star', 'ringos@gmail.com');

SELECT * FROM usuarios;


-- Creando los datos en notas

INSERT INTO notas (notes_id, idUsuario, tituloNota, contenidoNota, bloqueoNota, creacionNota, modificacionNota, deleteNota)
VALUES (DEFAULT, '1', 'Lista de libros', '1) Harry Potter 2) It 3) Mafalda 4) El perfume', '0', '2020-01-01 10:10:10', '2020-01-01 10:10:10', '0'),
(DEFAULT, '2', 'Lista de shopping', '1) Camisa blanca 2) Pantalon vestir 3) Saco 4) Zapatos', '1', '2020-01-01 10:10:10', '2020-01-01 10:10:10', '0'),
(DEFAULT, '3', 'Peliculas a ver', '1) Fight club 2) It 3) The Game 4) Back to the future', '1', '2020-01-01 10:10:10', '2020-01-01 10:10:10', '0'),
(DEFAULT, '4', 'Lugares a visitar', '1) Francia 2) Italia 3) Grecia 4) China', '0', '2020-01-01 10:10:10', '2020-01-01 10:10:10', '0'),
(DEFAULT, '5', 'Finales de facultad', '1) Matematica 2) Biologia 3) Quimica 4) Fisica', '1', '2020-01-01 10:10:10', '2020-01-01 10:10:10', '0'),
(DEFAULT, '6', 'Lista supermercado', '1) Queso cremoso 2) Dulce de leche 3) Fideos 4) Arroz', '1', '2020-01-01 10:10:10', '2020-01-01 10:10:10', '0'),
(DEFAULT, '7', 'Canciones a escuchar', '1) November Rain 2) Always 3) Black dog', '0', '2020-01-01 10:10:10', '2020-01-01 10:10:10', '0'),
(DEFAULT, '8', 'Lista cumpleaños', '1) Torta 2) Papas fritas 3) Palitos salados 4) Guirnaldas', '0', '2020-01-01 10:10:10', '2020-01-01 10:10:10', '0'),
(DEFAULT, '9', 'Juegos de mesa', '1) Carrera de mente 2) Teg 3) Cartas 4) Jenga', '0', '2020-01-01 10:10:10', '2020-01-01 10:10:10', '0'),
(DEFAULT, '10', 'Deportes de la semana', '1) Lunes - Yoga 2) Martes - Judo 3) Jueves - Natacion 4) Viernes - Futbol', '0', '2020-01-01 10:10:10', '2020-01-01 10:10:10', '0');

SELECT * FROM notas;


-- Creando los datos en categorias

INSERT INTO categorias (categories_id, idNota, idUsuario, name )
VALUES (DEFAULT, '1', '1','Libros a comprar'),
(DEFAULT, '2', '1','Shopping'),
(DEFAULT, '3', '2','Ocio'),
(DEFAULT, '4', '3','Paseo'),
(DEFAULT, '5', '5','Estudio'),
(DEFAULT, '6', '6','Super'),
(DEFAULT, '7', '7','Ocio'),
(DEFAULT, '8', '8','Compras'),
(DEFAULT, '9', '9','Ocio'),
(DEFAULT, '10', '10','Obligaciones');

SELECT * FROM categorias;