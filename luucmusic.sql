DROP DATABASE IF EXISTS luucmusic;
CREATE DATABASE luucmusic;
USE luucmusic;

-- ============================
-- TABLA USUARIOS
-- ============================

CREATE TABLE usuarios(

    id INT AUTO_INCREMENT PRIMARY KEY,

    nombre VARCHAR(100) NOT NULL,

    correo VARCHAR(100) NOT NULL UNIQUE,

    password VARCHAR(255) NOT NULL,

    rol ENUM('Administrador','Usuario')
    DEFAULT 'Usuario'

);

-- ============================
-- TABLA ARTISTAS
-- ============================

CREATE TABLE artistas(

    id INT AUTO_INCREMENT PRIMARY KEY,

    nombre VARCHAR(100) NOT NULL,

    pais VARCHAR(60),

    biografia TEXT,

    imagen VARCHAR(255)

);

-- ============================
-- TABLA ÁLBUMES
-- ============================

CREATE TABLE albumes(

    id INT AUTO_INCREMENT PRIMARY KEY,

    titulo VARCHAR(100) NOT NULL,

    anio YEAR,

    portada VARCHAR(255),

    artista_id INT NOT NULL,

    FOREIGN KEY(artista_id)
        REFERENCES artistas(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE

);

-- ============================
-- TABLA CANCIONES
-- ============================

CREATE TABLE canciones(

    id INT AUTO_INCREMENT PRIMARY KEY,

    titulo VARCHAR(150) NOT NULL,

    genero VARCHAR(50),

    duracion TIME,

    archivo VARCHAR(255),

    portada VARCHAR(255),

    artista_id INT NOT NULL,

    album_id INT NOT NULL,

    FOREIGN KEY(artista_id)
        REFERENCES artistas(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    FOREIGN KEY(album_id)
        REFERENCES albumes(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE

);

-- ============================
-- TABLA PLAYLISTS
-- ============================

CREATE TABLE playlists(

    id INT AUTO_INCREMENT PRIMARY KEY,

    nombre VARCHAR(100) NOT NULL,

    fecha_creacion DATE NOT NULL,

    usuario_id INT NOT NULL,

    FOREIGN KEY(usuario_id)
        REFERENCES usuarios(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE

);

-- ============================
-- TABLA PLAYLIST_CANCIONES
-- ============================

CREATE TABLE playlist_canciones(

    playlist_id INT,

    cancion_id INT,

    PRIMARY KEY(playlist_id,cancion_id),

    FOREIGN KEY(playlist_id)
        REFERENCES playlists(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    FOREIGN KEY(cancion_id)
        REFERENCES canciones(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE

);

-- ============================
-- USUARIO ADMINISTRADOR
-- ============================

INSERT INTO usuarios(nombre,correo,password,rol)
VALUES
(
'Administrador',
'admin@luucmusic.com',
'admin123',
'Administrador'
);

-- ============================
-- ARTISTA
-- ============================

INSERT INTO artistas(nombre,pais,biografia)
VALUES
(
'Imagine Dragons',
'Estados Unidos',
'Banda de rock alternativo.'
);

-- ============================
-- ÁLBUM
-- ============================

INSERT INTO albumes(titulo,anio,artista_id)
VALUES
(
'Evolve',
2017,
1
);

-- ============================
-- CANCIÓN
-- ============================

INSERT INTO canciones(
titulo,
genero,
duracion,
artista_id,
album_id
)
VALUES
(
'Believer',
'Rock',
'00:03:24',
1,
1
);

-- ============================
-- PLAYLIST
-- ============================

INSERT INTO playlists(
nombre,
fecha_creacion,
usuario_id
)
VALUES
(
'Favoritas',
CURDATE(),
1
);

INSERT INTO playlist_canciones
VALUES
(
1,
1
);