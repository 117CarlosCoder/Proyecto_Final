        DROP DATABASE IF EXISTS empleo_database;

        CREATE DATABASE empleo_database;
        USE empleo_database;

        CREATE TABLE categoria (
            codigo INT NOT NULL AUTO_INCREMENT,
            nombre VARCHAR(40) NOT NULL UNIQUE,
            descripcion VARCHAR(100) NOT NULL,
            PRIMARY KEY(codigo)
        );
        

        CREATE TABLE usuarios (
            codigo INT NOT NULL AUTO_INCREMENT,
            nombre VARCHAR(40) NOT NULL,
            direccion VARCHAR(40) NOT NULL,
            username VARCHAR(50) NOT NULL UNIQUE,
            password VARCHAR(100) NOT NULL,
            sal VARCHAR(40) NOT NULL,
            email VARCHAR(40) NOT NULL UNIQUE,
            CUI VARCHAR(20) NOT NULL,
            fechaFundacion DATE,
            fechaNacimiento DATE,
            curriculum VARCHAR(255),
            rol VARCHAR(50),
            mision VARCHAR(40),
            vision VARCHAR(40),
            suspension boolean,
            PRIMARY KEY(codigo)
        );

        CREATE TABLE curriculum (
          codigo INT NOT NULL AUTO_INCREMENT,
          codigoUsuario INT NOT NULL UNIQUE,
          pdf MEDIUMBLOB ,
          PRIMARY KEY(codigo)
        );

        CREATE TABLE suspension (
            codigo INT NOT NULL AUTO_INCREMENT,
            username VARCHAR(40) NOT NULL,
            estado boolean ,
            PRIMARY KEY(codigo)
        );

        CREATE TABLE notificaciones (
            codigo INT NOT NULL AUTO_INCREMENT,
            codigoEmpresa INT NOT NULL,
            codigoUsuario INT NOT NULL,
            mensaje VARCHAR(255) NOT NULL ,
            FOREIGN KEY (codigoUsuario) REFERENCES usuarios(codigo),
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
            salario DECIMAL(10,2)NOT NULL,     
            modalidad VARCHAR(40) NOT NULL,
            ubicacion VARCHAR(255) NOT NULL,
            detalles VARCHAR(255) NOT NULL, 
            usuarioElegido INT,
            FOREIGN KEY (empresa) REFERENCES usuarios(codigo),
            PRIMARY KEY(codigo)
        );

        CREATE TABLE tarjeta (
            codigo INT NOT NULL AUTO_INCREMENT,
            codigoUsuario INT NOT NULL,
            Titular VARCHAR(40) NOT NULL,
            numero BIGINT NOT NULL,
            codigoSeguridad INT NOT NULL,
            fechaExpiracion DATE NOT NULL,
            cantidad DECIMAL(10,2),
            FOREIGN KEY (codigoUsuario) REFERENCES usuarios(codigo),
            PRIMARY KEY(codigo)
        );

        CREATE TABLE telefonos (
            codigo INT NOT NULL AUTO_INCREMENT,
            codigoUsuario INT NOT NULL,
            numero INT ,
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
            FOREIGN KEY (codigoOferta) REFERENCES ofertas(codigo),
            FOREIGN KEY (usuario) REFERENCES usuarios(codigo),
            PRIMARY KEY(codigo)
        );

        CREATE TABLE comision (
            codigo INT NOT NULL AUTO_INCREMENT,
            cantidad DECIMAL(10,2) NOT NULL,
            fechaInicial DATE NOT NULL,
            PRIMARY KEY(codigo)
        );


        CREATE TABLE invitado (
            codigo INT NOT NULL AUTO_INCREMENT,
            vista INT NOT NULL ,
            PRIMARY KEY(codigo)
        );

        
        CREATE TABLE historialComision(
            codigo INT NOT NULL AUTO_INCREMENT,
            comision DECIMAL(10,2) NOT NULL,
            fechaInicial DATE NOT NULL,
            fechaFinal DATE NOT NULL,
            PRIMARY KEY(codigo)
        );

        CREATE TABLE cobroComision(
            codigo INT NOT NULL AUTO_INCREMENT,
            codigoOferta INT NOT NULL,
            oferta VARCHAR(40) NOT NULL,
            usuario INT NOT NULL,
            empresa INT NOT NULL,
            cobro DECIMAL(10,2) NOT NULL,
            cantidadTarjeta DECIMAL(10,2) NOT NULL,
            total DECIMAL (10,2) NOT NULL,
            fecha DATE NOT NULL,
            categoria INT NOT NULL,
            FOREIGN KEY (codigoOferta) REFERENCES ofertas(codigo),
            FOREIGN KEY (empresa) REFERENCES ofertas(empresa),
            PRIMARY KEY(codigo)
        );

        CREATE TABLE postulacionRetirada (
            codigo INT NOT NULL AUTO_INCREMENT,
            usuario INT NOT NULL,
            oferta VARCHAR(40) NOT NULL,
            fecha DATE NOT NULL,
            PRIMARY KEY(codigo)
        );

