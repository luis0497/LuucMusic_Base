class Config:

    # Clave secreta de Flask
    SECRET_KEY = "luucmusic2026"

    # Conexión a MySQL (Laragon)
    SQLALCHEMY_DATABASE_URI = "mysql+pymysql://root:@localhost/luucmusic"

    # Desactiva el seguimiento de modificaciones
    SQLALCHEMY_TRACK_MODIFICATIONS = False

    # Carpeta para archivos subidos
    UPLOAD_FOLDER = "static/uploads"