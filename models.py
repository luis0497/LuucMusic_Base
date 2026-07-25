from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()
class Usuario(db.Model):

    __tablename__ = "usuarios"

    id = db.Column(db.Integer, primary_key=True)

    nombre = db.Column(db.String(100), nullable=False)

    correo = db.Column(db.String(120), unique=True, nullable=False)

    password = db.Column(db.String(255), nullable=False)

    rol = db.Column(db.String(20), default="Usuario")
    
class Artista(db.Model):

    __tablename__ = "artistas"

    id = db.Column(db.Integer, primary_key=True)

    nombre = db.Column(db.String(100), nullable=False)

    pais = db.Column(db.String(60))

    imagen = db.Column(db.String(255))

    biografia = db.Column(db.Text)
class Album(db.Model):

    __tablename__ = "albumes"

    id = db.Column(db.Integer, primary_key=True)

    titulo = db.Column(db.String(120), nullable=False)

    anio = db.Column(db.Integer)

    portada = db.Column(db.String(255))

    artista_id = db.Column(
        db.Integer,
        db.ForeignKey("artistas.id")
    )
class Cancion(db.Model):

    __tablename__ = "canciones"

    id = db.Column(db.Integer, primary_key=True)

    titulo = db.Column(db.String(150), nullable=False)

    genero = db.Column(db.String(60))

    duracion = db.Column(db.String(10))

    archivo = db.Column(db.String(255))

    portada = db.Column(db.String(255))

    album_id = db.Column(
        db.Integer,
        db.ForeignKey("albumes.id")
    )

    artista_id = db.Column(
        db.Integer,
        db.ForeignKey("artistas.id")
    )
class Playlist(db.Model):

    __tablename__ = "playlists"

    id = db.Column(db.Integer, primary_key=True)

    nombre = db.Column(db.String(100))

    fecha = db.Column(db.Date)

    usuario_id = db.Column(
        db.Integer,
        db.ForeignKey("usuarios.id")
    )
class PlaylistCancion(db.Model):

    __tablename__ = "playlist_canciones"

    playlist_id = db.Column(
        db.Integer,
        db.ForeignKey("playlists.id"),
        primary_key=True
    )

    cancion_id = db.Column(
        db.Integer,
        db.ForeignKey("canciones.id"),
        primary_key=True
    )
