CREATE SCHEMA paseadoresS39795;
USE paseadores39795;

 CREATE TABLE tamaño_de_perro (
 tamaño_de_perro_id INT NOT NULL AUTO_INCREMENT,
 tamaño_de_perro VARCHAR(40) NOT NULL,
 PRIMARY KEY (tamaño_de_perro_id)
 );
 
 CREATE TABLE raza_de_perro (
 raza_de_perro_id INT NOT NULL AUTO_INCREMENT,
 raza_de_perro VARCHAR(45) NOT NULL,
 PRIMARY KEY (raza_de_perro_id)
 );
 
 CREATE TABLE perros (
 perro_id INT NOT NULL AUTO_INCREMENT,
 nombre VARCHAR(40) NOT NULL,
 tamaño_de_perro_id INT NOT NULL,
 raza_de_perro_id INT NOT NULL,
 PRIMARY KEY (perro_id),
 FOREIGN KEY (tamaño_de_perro_id) REFERENCES tamaño_de_perro(tamaño_de_perro_id),
 FOREIGN KEY (raza_de_perro_id) REFERENCES raza_de_perro(raza_de_perro_id)
 );
 
 CREATE TABLE ciudades (
 ciudad_id INT NOT NULL AUTO_INCREMENT,
 nombre_ciudad VARCHAR(40) NOT NULL,
 PRIMARY KEY (ciudad_id)
 );
  
CREATE TABLE clientes (
cliente_id INT NOT NULL AUTO_INCREMENT,
 nombre_cliente VARCHAR(45) NOT NULL,
 apellido_cliente VARCHAR(45) NOT NULL,
 telefono INT NOT NULL,
 ciudad_id INT NOT NULL,
 direccion VARCHAR(70),
 perros_id INT NOT NULL,
 correo VARCHAR(45) NOT NULL,
 PRIMARY KEY (cliente_id),
 FOREIGN KEY (ciudad_id) REFERENCES ciudades(ciudad_id),
 FOREIGN KEY (perros_id) REFERENCES perros(perro_id)
 );
 
 CREATE TABLE valoraciones (
 valoraciones_id INT NOT NULL AUTO_INCREMENT,
 estrellas INT NOT NULL DEFAULT 1 CHECK(estrellas >= 1 AND estrellas <= 5),
 comentario VARCHAR(255) NOT NULL,
 cliente_id INT NOT NULL,
 PRIMARY KEY (valoraciones_id),
 FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
 );
 
  CREATE TABLE paseador (
 paseador_id INT NOT NULL AUTO_INCREMENT,
 nombre VARCHAR(45) NOT NULL,
 apellido VARCHAR(45) NOT NULL,
 descripcion VARCHAR(255) NOT NULL,
 preferencias VARCHAR(40) NOT NULL,
 ciudad_id INT NOT NULL,
 direccion VARCHAR(40) NOT NULL,
 telefono INT NOT NULL, 
 correo VARCHAR(40) NOT NULL,
 PRIMARY KEY (paseador_id),
 FOREIGN KEY (ciudad_id) REFERENCES ciudades(ciudad_id)
 );
 
  CREATE TABLE valoraciones_paseador (
 valoraciones_id INT NOT NULL,
 paseador_id INT NOT NULL,
 FOREIGN KEY (valoraciones_id) REFERENCES valoraciones(valoraciones_id),
 FOREIGN KEY (paseador_id) REFERENCES paseador(paseador_id)
 );
 
 CREATE TABLE paseo (
 paseo_id INT NOT NULL AUTO_INCREMENT,
 direccion VARCHAR(40) NOT NULL,
 cliente_id INT NOT NULL,
 paseador_id INT NOT NULL,
 fecha DATE,
 hora_inicio TIME,
 hora_fin TIME,
 precio INT NOT NULL,
 perro_id INT NOT NULL,
 PRIMARY KEY (paseo_id),
 FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id),
 FOREIGN KEY (paseador_id) REFERENCES paseador(paseador_id),
 FOREIGN KEY (perro_id) REFERENCES perros(perro_id)
 );
 
