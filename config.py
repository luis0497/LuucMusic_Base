class Config:

    SECRET_KEY = "luucmusic2026"

    SQLALCHEMY_DATABASE_URI = "mysql+pymysql://root:1234@localhost/luucmusic"

    SQLALCHEMY_TRACK_MODIFICATIONS = False

    UPLOAD_FOLDER = "static/uploads"