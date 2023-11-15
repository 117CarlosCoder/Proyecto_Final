    DROP DATABASE IF EXISTS empleo_database;

    CREATE DATABASE empleo_database;
    USE empleo_database;

    CREATE TABLE categoria (
        codigo INT NOT NULL AUTO_INCREMENT,
        nombre VARCHAR(40) NOT NULL,
        descripcion VARCHAR(40) NOT NULL,
        PRIMARY KEY(codigo)
    );
    

    CREATE TABLE usuarios (
        codigo INT NOT NULL AUTO_INCREMENT,
        nombre VARCHAR(40) NOT NULL,
        direccion VARCHAR(40) NOT NULL,
        username VARCHAR(50) NOT NULL UNIQUE,
        password VARCHAR(40) NOT NULL,
        email VARCHAR(40) NOT NULL UNIQUE,
        CUI VARCHAR(20) NOT NULL,
        fechaFundacion DATE,
        fechaNacimiento DATE,
        curriculum VARCHAR(255),
        rol VARCHAR(50),
        mision VARCHAR(40),
        vision VARCHAR(40),
        PRIMARY KEY(codigo)
    );

    CREATE TABLE ofertas (
        codigo INT NOT NULL AUTO_INCREMENT,
        nombre VARCHAR(40) NOT NULL,
        descripcion VARCHAR(255) NOT NULL,
        empresa INT NOT NULL,
        categoria INT NOT NULL,
        estado VARCHAR(40) NOT NULL,
        fechaPublicacion DATE NOT NULL,
        fechaLimite DATE NOT NULL,
        salario DECIMAL NOT NULL,     
        modalidad VARCHAR(40) NOT NULL,
        ubicacion VARCHAR(255) NOT NULL,
        detalles VARCHAR(255) NOT NULL, 
        usuarioElegido INT,
        FOREIGN KEY (empresa) REFERENCES usuarios(codigo),
        FOREIGN KEY (categoria) REFERENCES categoria(codigo),
        PRIMARY KEY(codigo)
    );

    CREATE TABLE tarjeta (
        codigo INT NOT NULL AUTO_INCREMENT,
        codigoUsuario INT NOT NULL,
        Titular VARCHAR(40) NOT NULL,
        numero BIGINT NOT NULL,
        codigoSeguridad INT NOT NULL,
        fechaExpiracion DATE NOT NULL,
        cantidad INT ,
        FOREIGN KEY (codigoUsuario) REFERENCES usuarios(codigo),
        PRIMARY KEY(codigo)
    );

    CREATE TABLE telefonos (
        codigo INT NOT NULL AUTO_INCREMENT,
        codigoUsuario INT NOT NULL,
        numero INT NOT NULL,
        FOREIGN KEY (codigoUsuario) REFERENCES usuarios(codigo),
        PRIMARY KEY(codigo)
    );

    

    CREATE TABLE categoriaUsuario(
        codigo INT NOT NULL AUTO_INCREMENT,
        codigoUsuario INT NOT NULL,
        codigoCategoria INT NOT NULL,
        FOREIGN KEY (codigoCategoria) REFERENCES categoria(codigo),
        FOREIGN KEY (codigoUsuario) REFERENCES usuarios(codigo),
        PRIMARY KEY(codigo)
    );


    CREATE TABLE solicitudes (
        codigo INT NOT NULL AUTO_INCREMENT,
        codigoOferta INT NOT NULL,
        usuario INT NOT NULL,
        mensaje VARCHAR(255) NOT NULL,
        FOREIGN KEY (codigoOferta) REFERENCES ofertas(codigo),
        FOREIGN KEY (usuario) REFERENCES usuarios(codigo),
        PRIMARY KEY(codigo)
    );


    CREATE TABLE entrevistas (
        codigo INT NOT NULL AUTO_INCREMENT,
        codigoOferta INT NOT NULL,
        usuario INT NOT NULL,
        fecha DATE NOT NULL,
        hora TIME NOT NULL,
        ubicacion VARCHAR(255) NOT NULL,
        estado VARCHAR(40) NOT NULL, 
        notas VARCHAR(255) NOT NULL,
        FOREIGN KEY (usuario) REFERENCES usuarios(codigo),
        PRIMARY KEY(codigo)
    );

    CREATE TABLE comision (
        codigo INT NOT NULL AUTO_INCREMENT,
        cantidad DECIMAL NOT NULL,
        PRIMARY KEY(codigo)
    );

    CREATE TABLE cobros (
        codigo INT NOT NULL AUTO_INCREMENT,
        usuario INT NOT NULL,
        cantidad DECIMAL NOT NULL,
        fecha DATE NOT NULL,
        codigoOferta INT NOT NULL,
        oferta VARCHAR(40) NOT NULL,
        categoria INT NOT NULL,
        FOREIGN KEY (usuario) REFERENCES usuarios(codigo),
        FOREIGN KEY (codigoOferta) REFERENCES ofertas(codigo),
        FOREIGN KEY (categoria) REFERENCES ofertas(categoria),
        PRIMARY KEY(codigo)
    );

    CREATE TABLE invitado (
        codigo INT NOT NULL ,
        vista INT NOT NULL,AUTO_INCREMENT
        PRIMARY KEY(codigo)
    );

    
    CREATE TABLE historialComision(
        codigo INT NOT NULL AUTO_INCREMENT,
        comision DECIMAL NOT NULL,
        fecha DATE NOT NULL,
        PRIMARY KEY(codigo)
    );

    CREATE TABLE postulacionRetirada (
        codigo INT NOT NULL AUTO_INCREMENT,
        usuario INT NOT NULL,
        oferta VARCHAR(40) NOT NULL,
        fecha DATE NOT NULL,
        PRIMARY KEY(codigo)
    );
