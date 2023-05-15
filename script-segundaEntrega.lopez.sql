# Creacion de la BD
CREATE SCHEMA the_walking_dog;
USE the_walking_dog;

#Creación de tablas
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
 
 CREATE TABLE genero(
 genero_id INT NOT NULL AUTO_INCREMENT,
 genero_nombre VARCHAR(20) NOT NULL,
 PRIMARY KEY (genero_id)
 );
  
 CREATE TABLE clientes (
cliente_id INT NOT NULL AUTO_INCREMENT,
 nombre_cliente VARCHAR(45) NOT NULL,
 apellido_cliente VARCHAR(45) NOT NULL,
 telefono BIGINT NOT NULL,
 ciudad_id INT NOT NULL,
 direccion VARCHAR(70),
 correo VARCHAR(45) NOT NULL,
 genero_id INT NOT NULL,
 PRIMARY KEY (cliente_id),
 FOREIGN KEY (ciudad_id) REFERENCES ciudades(ciudad_id),
 FOREIGN KEY (genero_id) REFERENCES genero(genero_id)
 );
 
 CREATE TABLE paseador (
 paseador_id INT NOT NULL AUTO_INCREMENT,
 nombre VARCHAR(45) NOT NULL,
 apellido VARCHAR(45) NOT NULL,
 descripcion VARCHAR(255) NOT NULL,
 preferencias VARCHAR(40) NOT NULL,
 ciudad_id INT NOT NULL,
 direccion VARCHAR(40) NOT NULL,
 telefono BIGINT NOT NULL, 
 correo VARCHAR(40) NOT NULL,
 genero_id INT NOT NULL,
 PRIMARY KEY (paseador_id),
 FOREIGN KEY (ciudad_id) REFERENCES ciudades(ciudad_id),
 FOREIGN KEY (genero_id) REFERENCES genero(genero_id)
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
 
 CREATE TABLE valoraciones (
 valoraciones_id INT NOT NULL AUTO_INCREMENT,
 estrellas INT NOT NULL DEFAULT 1 CHECK(estrellas >= 1 AND estrellas <= 5),
 comentario VARCHAR(255) NOT NULL,
 cliente_id INT NOT NULL,
 paseo_id INT NOT NULL,
 PRIMARY KEY (valoraciones_id),
 FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id),
 FOREIGN KEY (paseo_id) REFERENCES paseo(paseo_id)
 );
 
 CREATE TABLE cliente_perro(
 cliente_perro_id INT NOT NULL AUTO_INCREMENT,
 cliente_id INT NOT NULL,
 perro_id INT NOT NULL,
 PRIMARY KEY (cliente_perro_id),
 FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id),
 FOREIGN KEY (perro_id) REFERENCES perros(perro_id)
 );

 
 #Insercion de tablas
 # tamaño_de_perro
INSERT INTO `tamaño_de_perro` (`tamaño_de_perro_id`,`tamaño_de_perro`) VALUES (1,'pequeño');
INSERT INTO `tamaño_de_perro` (`tamaño_de_perro_id`,`tamaño_de_perro`) VALUES (2,'mediano');
INSERT INTO `tamaño_de_perro` (`tamaño_de_perro_id`,`tamaño_de_perro`) VALUES (3,'grande');

# raza_de_perro
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (2,'Golden Retriever');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (1,'Labrador Retriever');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (3,'Bulldog');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (4,'Chihuahua');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (5,'Poodle');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (6,'Pastor Alemán');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (7,'Dachshund');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (8,'Boxer');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (9,'Beagle');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (10,'Yorkshire Terrier');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (11,'Rottweiler');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (12,'Schnauzer');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (13,'Pomerania');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (14,'Doberman');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (15,'Shih Tzu');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (16,'Great Dane');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (17,'Boston Terrier');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (18,'Shetland Sheepdog');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (19,'Shar Pei');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (20,'Maltese');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (21,'English Cocker Spaniel');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (22,'Jack Russell Terrier');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (23,'Akita');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (24,'Bichon Frise');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (25,'Australian Shepherd');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (26,'Bernese Mountain Dog');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (27,'Staffordshire Bull Terrier');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (28,'Weimaraner');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (29,'Samoyed');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (30,'Husky');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (31,'Cavalier King Charles Spaniel');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (32,'English Springer Spaniel');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (33,'Border Collie');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (34,'Basset Hound');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (35,'Bloodhound');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (36,'Chow Chow');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (37,'West Highland White Terrier');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (38,'Cairn Terrier');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (39,'Bull Terrier');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (40,'Irish Wolfhound');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (41,'Lhasa Apso');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (42,'Old English Sheepdog');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (43,'Collie');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (44,'Newfoundland');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (45,'Miniature Schnauzer');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (46,'Dalmatian');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (47,'Whippet');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (48,'English Bulldog');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (49,'Alaskan Malamute');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (50,'Greyhound');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (51,'English Mastiff');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (52,'Scottish Terrier');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (53,'Tibetan Mastiff');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (54,'St. Bernard');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (55,'Rhodesian Ridgeback');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (56,'Miniature Pinscher');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (57,'Chinese Crested');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (58,'Japanese Chin');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (59,'Pointer');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (60,'Vizsla');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (61,'Cocker Spaniel');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (62,'Dogo Argentino');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (63,'German Shorthaired Pointer');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (64,'Miniature Bull Terrier');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (65,'Chesapeake Bay Retriever');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (66,'Siberian Husky');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (67,'Borzoi');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (68,'Great Pyrenees');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (69,'Bouvier des Flandres');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (70,'Italian Greyhound');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (71,'Irish Setter');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (72,'Bedlington Terrier');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (73,'Black Russian Terrier');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (74,'Brussels Griffon');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (75,'Cane Corso');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (76,'English Setter');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (77,'Saluki');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (78,'Schipperke');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (79,'Tibetan Terrier');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (80,'Toy Poodle');
INSERT INTO `raza_de_perro` (`raza_de_perro_id`,`raza_de_perro`) VALUES (81,'Toy Fox Terrier');

 # perros 
INSERT INTO `perros` (`perro_id`,`nombre`,`tamaño_de_perro_id`,`raza_de_perro_id`) VALUES (1,'Max',2,8);
INSERT INTO `perros` (`perro_id`,`nombre`,`tamaño_de_perro_id`,`raza_de_perro_id`) VALUES (2,'Buddy',1,28);
INSERT INTO `perros` (`perro_id`,`nombre`,`tamaño_de_perro_id`,`raza_de_perro_id`) VALUES (3,'Duke',3,24);
INSERT INTO `perros` (`perro_id`,`nombre`,`tamaño_de_perro_id`,`raza_de_perro_id`) VALUES (4,'Daisy',3,11);
INSERT INTO `perros` (`perro_id`,`nombre`,`tamaño_de_perro_id`,`raza_de_perro_id`) VALUES (5,'Luna',1,35);
INSERT INTO `perros` (`perro_id`,`nombre`,`tamaño_de_perro_id`,`raza_de_perro_id`) VALUES (6,'Sadie',2,75);
INSERT INTO `perros` (`perro_id`,`nombre`,`tamaño_de_perro_id`,`raza_de_perro_id`) VALUES (7,'Bailey',2,58);
INSERT INTO `perros` (`perro_id`,`nombre`,`tamaño_de_perro_id`,`raza_de_perro_id`) VALUES (8,'Lola',1,54);
INSERT INTO `perros` (`perro_id`,`nombre`,`tamaño_de_perro_id`,`raza_de_perro_id`) VALUES (9,'Jake',2,17);
INSERT INTO `perros` (`perro_id`,`nombre`,`tamaño_de_perro_id`,`raza_de_perro_id`) VALUES (10,'Rocky',1,20);
INSERT INTO `perros` (`perro_id`,`nombre`,`tamaño_de_perro_id`,`raza_de_perro_id`) VALUES (11,'Sophie',3,6);
INSERT INTO `perros` (`perro_id`,`nombre`,`tamaño_de_perro_id`,`raza_de_perro_id`) VALUES (12,'Charlie',2,69);
INSERT INTO `perros` (`perro_id`,`nombre`,`tamaño_de_perro_id`,`raza_de_perro_id`) VALUES (13,'Zeus',1,63);
INSERT INTO `perros` (`perro_id`,`nombre`,`tamaño_de_perro_id`,`raza_de_perro_id`) VALUES (14,'Cooper',3,12);
INSERT INTO `perros` (`perro_id`,`nombre`,`tamaño_de_perro_id`,`raza_de_perro_id`) VALUES (15,'Riley',2,32);
INSERT INTO `perros` (`perro_id`,`nombre`,`tamaño_de_perro_id`,`raza_de_perro_id`) VALUES (16,'Chloe',3,10);
INSERT INTO `perros` (`perro_id`,`nombre`,`tamaño_de_perro_id`,`raza_de_perro_id`) VALUES (17,'Oliver',3,5);
INSERT INTO `perros` (`perro_id`,`nombre`,`tamaño_de_perro_id`,`raza_de_perro_id`) VALUES (18,'Gracie',1,77);
INSERT INTO `perros` (`perro_id`,`nombre`,`tamaño_de_perro_id`,`raza_de_perro_id`) VALUES (19,'Abby',2,73);
INSERT INTO `perros` (`perro_id`,`nombre`,`tamaño_de_perro_id`,`raza_de_perro_id`) VALUES (20,'Maggie',1,46);
 
 # ciudades
INSERT INTO `ciudades` (`ciudad_id`,`nombre_ciudad`) VALUES (1,'Leticia');
INSERT INTO `ciudades` (`ciudad_id`,`nombre_ciudad`) VALUES (2,'Medellín');
INSERT INTO `ciudades` (`ciudad_id`,`nombre_ciudad`) VALUES (3,'Arauca');
INSERT INTO `ciudades` (`ciudad_id`,`nombre_ciudad`) VALUES (4,'Barranquilla');
INSERT INTO `ciudades` (`ciudad_id`,`nombre_ciudad`) VALUES (5,'Cartagena de Indias');
INSERT INTO `ciudades` (`ciudad_id`,`nombre_ciudad`) VALUES (6,'Tunja');
INSERT INTO `ciudades` (`ciudad_id`,`nombre_ciudad`) VALUES (7,'Manizales');
INSERT INTO `ciudades` (`ciudad_id`,`nombre_ciudad`) VALUES (8,'Florencia');
INSERT INTO `ciudades` (`ciudad_id`,`nombre_ciudad`) VALUES (9,'Yopal');
INSERT INTO `ciudades` (`ciudad_id`,`nombre_ciudad`) VALUES (10,'Popayán');
INSERT INTO `ciudades` (`ciudad_id`,`nombre_ciudad`) VALUES (11,'Valledupar');
INSERT INTO `ciudades` (`ciudad_id`,`nombre_ciudad`) VALUES (12,'Quibdó');
INSERT INTO `ciudades` (`ciudad_id`,`nombre_ciudad`) VALUES (13,'Montería');
INSERT INTO `ciudades` (`ciudad_id`,`nombre_ciudad`) VALUES (14,'Bogotá');
INSERT INTO `ciudades` (`ciudad_id`,`nombre_ciudad`) VALUES (15,'Inírida');
INSERT INTO `ciudades` (`ciudad_id`,`nombre_ciudad`) VALUES (16,'San José del Guaviare');
INSERT INTO `ciudades` (`ciudad_id`,`nombre_ciudad`) VALUES (17,'Neiva');
INSERT INTO `ciudades` (`ciudad_id`,`nombre_ciudad`) VALUES (18,'Riohacha');
INSERT INTO `ciudades` (`ciudad_id`,`nombre_ciudad`) VALUES (19,'Santa Marta');
INSERT INTO `ciudades` (`ciudad_id`,`nombre_ciudad`) VALUES (20,'Villavicencio');
INSERT INTO `ciudades` (`ciudad_id`,`nombre_ciudad`) VALUES (21,'Pasto');
INSERT INTO `ciudades` (`ciudad_id`,`nombre_ciudad`) VALUES (22,'Cúcuta');
INSERT INTO `ciudades` (`ciudad_id`,`nombre_ciudad`) VALUES (23,'Mocoa');
INSERT INTO `ciudades` (`ciudad_id`,`nombre_ciudad`) VALUES (24,'Armenia');
INSERT INTO `ciudades` (`ciudad_id`,`nombre_ciudad`) VALUES (25,'Pereira');
INSERT INTO `ciudades` (`ciudad_id`,`nombre_ciudad`) VALUES (26,'San Andrés');
INSERT INTO `ciudades` (`ciudad_id`,`nombre_ciudad`) VALUES (27,'Bucaramanga');
INSERT INTO `ciudades` (`ciudad_id`,`nombre_ciudad`) VALUES (28,'Santa Fe de Bogotá');
INSERT INTO `ciudades` (`ciudad_id`,`nombre_ciudad`) VALUES (29,'Mocoa');
INSERT INTO `ciudades` (`ciudad_id`,`nombre_ciudad`) VALUES (30,'Villavicencio');
INSERT INTO `ciudades` (`ciudad_id`,`nombre_ciudad`) VALUES (31,'Puerto Carreño');
INSERT INTO `ciudades` (`ciudad_id`,`nombre_ciudad`) VALUES (32,'Puerto Inírida');
INSERT INTO `ciudades` (`ciudad_id`,`nombre_ciudad`) VALUES (33,'San José del Guaviare');
INSERT INTO `ciudades` (`ciudad_id`,`nombre_ciudad`) VALUES (34,'Mitu');
INSERT INTO `ciudades` (`ciudad_id`,`nombre_ciudad`) VALUES (35,'Leticia');

# genero
INSERT INTO `genero` (`genero_id`,`genero_nombre`) VALUES (1,'Masculino');
INSERT INTO `genero` (`genero_id`,`genero_nombre`) VALUES (2,'Femenino');
INSERT INTO `genero` (`genero_id`,`genero_nombre`) VALUES (3,'Otro');

# clientes 
INSERT INTO `clientes` (`cliente_id`,`nombre_cliente`,`apellido_cliente`,`telefono`,`ciudad_id`,`direccion`,`correo`,`genero_id`) VALUES (1,'Carlos','González',3151234567,4,'Calle 40 #10-20','carlos.gonzalez@gmail.com',1);
INSERT INTO `clientes` (`cliente_id`,`nombre_cliente`,`apellido_cliente`,`telefono`,`ciudad_id`,`direccion`,`correo`,`genero_id`) VALUES (2,'María','Martínez',3219876543,25,'Carrera 32 #8-56','maria.martinez@hotmail.com',2);
INSERT INTO `clientes` (`cliente_id`,`nombre_cliente`,`apellido_cliente`,`telefono`,`ciudad_id`,`direccion`,`correo`,`genero_id`) VALUES (3,'Andrés','Pérez',3113456789,14,'Transversal 45 #23-12','andres.perez@gmail.com',1);
INSERT INTO `clientes` (`cliente_id`,`nombre_cliente`,`apellido_cliente`,`telefono`,`ciudad_id`,`direccion`,`correo`,`genero_id`) VALUES (4,'Sofía','Rodríguez',3178765432,6,'Calle 50 #12-34','sofia.rodriguez@yahoo.com',2);
INSERT INTO `clientes` (`cliente_id`,`nombre_cliente`,`apellido_cliente`,`telefono`,`ciudad_id`,`direccion`,`correo`,`genero_id`) VALUES (5,'Sebastián','García',3182345678,31,'Carrera 12 #45-67','sebastian.garcia@gmail.com',1);
INSERT INTO `clientes` (`cliente_id`,`nombre_cliente`,`apellido_cliente`,`telefono`,`ciudad_id`,`direccion`,`correo`,`genero_id`) VALUES (6,'Laura','Hernández',3137654321,16,'Calle 22 #34-56','laura.hernandez@hotmail.com',2);
INSERT INTO `clientes` (`cliente_id`,`nombre_cliente`,`apellido_cliente`,`telefono`,`ciudad_id`,`direccion`,`correo`,`genero_id`) VALUES (7,'Juan','Sánchez',3104321567,22,'Carrera 8 #45-21,Calle 3 #23-12','juan.sanchez@gmail.com',1);
INSERT INTO `clientes` (`cliente_id`,`nombre_cliente`,`apellido_cliente`,`telefono`,`ciudad_id`,`direccion`,`correo`,`genero_id`) VALUES (8,'Ana','Jiménez',3209876543,2,'Calle 12 #45-67','ana.jimenez@hotmail.com',2);
INSERT INTO `clientes` (`cliente_id`,`nombre_cliente`,`apellido_cliente`,`telefono`,`ciudad_id`,`direccion`,`correo`,`genero_id`) VALUES (9,'Daniel','Gutiérrez',3187654321,19,'Transversal 23 #56-34','daniel.gutierrez@gmail.com',1);
INSERT INTO `clientes` (`cliente_id`,`nombre_cliente`,`apellido_cliente`,`telefono`,`ciudad_id`,`direccion`,`correo`,`genero_id`) VALUES (10,'Mónica','Romero',3122345678,12,'Carrera 30 #12-34','monica.romero@gmail.com',2);
INSERT INTO `clientes` (`cliente_id`,`nombre_cliente`,`apellido_cliente`,`telefono`,`ciudad_id`,`direccion`,`correo`,`genero_id`) VALUES (11,'Diego','Pérez',3111234567,1,'Calle 45 #10-20','Diego.Pérez@gmail.com',1);
INSERT INTO `clientes` (`cliente_id`,`nombre_cliente`,`apellido_cliente`,`telefono`,`ciudad_id`,`direccion`,`correo`,`genero_id`) VALUES (12,'Natalia','Martínez',3217654321,8,'Carrera 56 #23-12','natalia.martinez@hotmail.com',2);
INSERT INTO `clientes` (`cliente_id`,`nombre_cliente`,`apellido_cliente`,`telefono`,`ciudad_id`,`direccion`,`correo`,`genero_id`) VALUES (13,'Felipe','Pérez',3172345678,10,'Calle 23 #45-67','felipe.perez@gmail.com',1);
INSERT INTO `clientes` (`cliente_id`,`nombre_cliente`,`apellido_cliente`,`telefono`,`ciudad_id`,`direccion`,`correo`,`genero_id`) VALUES (14,'Juliana','González',3189876543,18,'Carrera 10 #56-34','juliana.gonzalez@hotmail.com',2);
INSERT INTO `clientes` (`cliente_id`,`nombre_cliente`,`apellido_cliente`,`telefono`,`ciudad_id`,`direccion`,`correo`,`genero_id`) VALUES (15,'Camilo','Rodríguez',3114567890,27,'Calle 34 #12-34','camilo.rodriguez@gmail.com',1);
INSERT INTO `clientes` (`cliente_id`,`nombre_cliente`,`apellido_cliente`,`telefono`,`ciudad_id`,`direccion`,`correo`,`genero_id`) VALUES (16,'Valentina','García',3145678901,3,'Carrera 12 #23-12 Calle 4 #45-67','valentina.garcia@hotmail.com',2);
INSERT INTO `clientes` (`cliente_id`,`nombre_cliente`,`apellido_cliente`,`telefono`,`ciudad_id`,`direccion`,`correo`,`genero_id`) VALUES (17,'Oscar','Hernández',3178765432,7,'Transversal 45 #56-34 Calle 6 #23-12','oscar.hernandez@gmail.com',1);
INSERT INTO `clientes` (`cliente_id`,`nombre_cliente`,`apellido_cliente`,`telefono`,`ciudad_id`,`direccion`,`correo`,`genero_id`) VALUES (18,'Carolina','Sánchez',3201234567,30,'Carrera 8 #12-34','carolina.sanchez@hotmail.com',2);
INSERT INTO `clientes` (`cliente_id`,`nombre_cliente`,`apellido_cliente`,`telefono`,`ciudad_id`,`direccion`,`correo`,`genero_id`) VALUES (19,'Pedro','Jiménez',3107654321,11,'Calle 56 #23-12','pedro.jimenez@gmail.com',1);
INSERT INTO `clientes` (`cliente_id`,`nombre_cliente`,`apellido_cliente`,`telefono`,`ciudad_id`,`direccion`,`correo`,`genero_id`) VALUES (20,'Isabella','Gutiérrez',3183217654,24,'Transversal 23 #12-34','isabella.gutierrez',2);

# paseador
INSERT INTO `paseador` (`paseador_id`,`nombre`,`apellido`,`descripcion`,`preferencias`,`ciudad_id`,`direccion`,`telefono`,`correo`,`genero_id`) VALUES (1,'Andres','Perez','Me encanta pasear perros y hacer ejercicio','Razas pequeñas y medianas',12,'Carrera 10 # 20-30',3151234567,'andres.perez@gmail.com',1);
INSERT INTO `paseador` (`paseador_id`,`nombre`,`apellido`,`descripcion`,`preferencias`,`ciudad_id`,`direccion`,`telefono`,`correo`,`genero_id`) VALUES (2,'Julia','Gomez','Soy amante de los animales, en especial de los perros','Razas grandes y energéticas',25,'Calle 5 # 10-15',3179876543,'julia.gomez@hotmail.com',2);
INSERT INTO `paseador` (`paseador_id`,`nombre`,`apellido`,`descripcion`,`preferencias`,`ciudad_id`,`direccion`,`telefono`,`correo`,`genero_id`) VALUES (3,'Pedro','Martinez','Me gusta compartir tiempo con perros y ayudarlos a mantenerse saludables','Razas pequeñas',14,'Carrera 15 # 25-40',3104567890,'pedro.martinez@gmail.com',1);
INSERT INTO `paseador` (`paseador_id`,`nombre`,`apellido`,`descripcion`,`preferencias`,`ciudad_id`,`direccion`,`telefono`,`correo`,`genero_id`) VALUES (4,'Maria','Rodriguez','Tengo experiencia con perros de diferentes tamaños y personalidades','Razas pequeñas y medianas',9,'Calle 7 # 12-30',3007654321,'maria.rodriguez@gmail.com',2);
INSERT INTO `paseador` (`paseador_id`,`nombre`,`apellido`,`descripcion`,`preferencias`,`ciudad_id`,`direccion`,`telefono`,`correo`,`genero_id`) VALUES (5,'Jose','Lopez','Me gusta pasear perros por las mañanas temprano','Razas pequeñas',19,'Carrera 18 # 22-15',3112345678,'jose.lopez@hotmail.com',1);
INSERT INTO `paseador` (`paseador_id`,`nombre`,`apellido`,`descripcion`,`preferencias`,`ciudad_id`,`direccion`,`telefono`,`correo`,`genero_id`) VALUES (6,'Laura','Hernandez','Soy paciente y amorosa con los perros','Razas pequeñas y medianas',10,'Calle 12 # 18-25',3165432198,'laura.hernandez@gmail.com',2);
INSERT INTO `paseador` (`paseador_id`,`nombre`,`apellido`,`descripcion`,`preferencias`,`ciudad_id`,`direccion`,`telefono`,`correo`,`genero_id`) VALUES (7,'Carlos','Ramirez','Me encanta jugar con los perros y hacer que se diviertan','Razas grandes',22,'Carrera 20 # 30-25',3109876543,'carlos.ramirez@hotmail.com',1);
INSERT INTO `paseador` (`paseador_id`,`nombre`,`apellido`,`descripcion`,`preferencias`,`ciudad_id`,`direccion`,`telefono`,`correo`,`genero_id`) VALUES (8,'Alejandra','Garcia','Disfruto de caminar en parques y hacerlo en compañía de perros es lo mejor','Todas las razas',31,'Calle 15 # 16-20',3187654321,'alejandra.garcia@gmail.com',2);
INSERT INTO `paseador` (`paseador_id`,`nombre`,`apellido`,`descripcion`,`preferencias`,`ciudad_id`,`direccion`,`telefono`,`correo`,`genero_id`) VALUES (9,'Daniel','Jaramillo','Soy muy activo y me gusta salir a caminar y correr con perros','Razas grandes y energéticas',17,'Carrera 25 # 35-10',3123456789,'daniel.jaramillo@gmail.com',1);
INSERT INTO `paseador` (`paseador_id`,`nombre`,`apellido`,`descripcion`,`preferencias`,`ciudad_id`,`direccion`,`telefono`,`correo`,`genero_id`) VALUES (10,'Valentina','Castro','Me encanta enseñar trucos y jugar con perros','Razas medianas',28,'Calle 20 # 25-15',3206543210,'valentina.castro@hotmail.com',2);
INSERT INTO `paseador` (`paseador_id`,`nombre`,`apellido`,`descripcion`,`preferencias`,`ciudad_id`,`direccion`,`telefono`,`correo`,`genero_id`) VALUES (11,'Camilo','Valencia','Soy muy responsable y cuido de los perros como si fueran míos','Razas pequeñas',5,'Carrera 5 # 8-10',3149876543,'camilo.valencia@gmail.com',1);
INSERT INTO `paseador` (`paseador_id`,`nombre`,`apellido`,`descripcion`,`preferencias`,`ciudad_id`,`direccion`,`telefono`,`correo`,`genero_id`) VALUES (12,'Isabella','Moreno','Soy una persona tranquila y pacífica, ideal para pasear perros ansiosos o nerviosos','Razas pequeñas y medianas',11,'Calle 8 # 11-35',3176543210,'isabella.moreno@gmail.com',2);
INSERT INTO `paseador` (`paseador_id`,`nombre`,`apellido`,`descripcion`,`preferencias`,`ciudad_id`,`direccion`,`telefono`,`correo`,`genero_id`) VALUES (13,'Santiago','Ortiz','Me gusta conocer nuevos lugares y hacerlo en compañía de perros es genial','Todas las razas',26,'Carrera 30 # 40-20',3106543210,'santiago.ortiz@hotmail.com',1);

 # paseo
INSERT INTO `paseo` (`paseo_id`,`direccion`,`cliente_id`,`paseador_id`,`fecha`,`hora_inicio`,`hora_fin`,`precio`,`perro_id`) VALUES (1,'Carrera 25 #17-31',2,8,'2023-05-01','08:00:00','09:00:00',5000,1);
INSERT INTO `paseo` (`paseo_id`,`direccion`,`cliente_id`,`paseador_id`,`fecha`,`hora_inicio`,`hora_fin`,`precio`,`perro_id`) VALUES (2,'Calle 65 #12-24',14,6,'2023-05-02','14:00:00','15:30:00',8000,6);
INSERT INTO `paseo` (`paseo_id`,`direccion`,`cliente_id`,`paseador_id`,`fecha`,`hora_inicio`,`hora_fin`,`precio`,`perro_id`) VALUES (3,'Calle 75 #30-12',9,2,'2023-05-03','11:00:00','12:30:00',7000,12);
INSERT INTO `paseo` (`paseo_id`,`direccion`,`cliente_id`,`paseador_id`,`fecha`,`hora_inicio`,`hora_fin`,`precio`,`perro_id`) VALUES (4,'Carrera 5 #10-20',5,7,'2023-05-04','16:00:00','17:00:00',4000,5);
INSERT INTO `paseo` (`paseo_id`,`direccion`,`cliente_id`,`paseador_id`,`fecha`,`hora_inicio`,`hora_fin`,`precio`,`perro_id`) VALUES (5,'Carrera 40 #60-20',3,3,'2023-05-05','10:00:00','11:30:00',9000,8);
INSERT INTO `paseo` (`paseo_id`,`direccion`,`cliente_id`,`paseador_id`,`fecha`,`hora_inicio`,`hora_fin`,`precio`,`perro_id`) VALUES (6,'Calle 80 #15-29',17,1,'2023-05-06','15:00:00','16:30:00',10000,18);
INSERT INTO `paseo` (`paseo_id`,`direccion`,`cliente_id`,`paseador_id`,`fecha`,`hora_inicio`,`hora_fin`,`precio`,`perro_id`) VALUES (7,'Carrera 10 #8-35',10,4,'2023-05-07','08:00:00','09:00:00',5000,7);
INSERT INTO `paseo` (`paseo_id`,`direccion`,`cliente_id`,`paseador_id`,`fecha`,`hora_inicio`,`hora_fin`,`precio`,`perro_id`) VALUES (8,'Calle 95 #40-50',16,9,'2023-05-08','11:00:00','12:00:00',3000,15);
INSERT INTO `paseo` (`paseo_id`,`direccion`,`cliente_id`,`paseador_id`,`fecha`,`hora_inicio`,`hora_fin`,`precio`,`perro_id`) VALUES (9,'Carrera 50 #30-15',11,5,'2023-05-09','13:00:00','14:00:00',4000,9);
INSERT INTO `paseo` (`paseo_id`,`direccion`,`cliente_id`,`paseador_id`,`fecha`,`hora_inicio`,`hora_fin`,`precio`,`perro_id`) VALUES (10,'Calle 70 #22-17',19,11,'2023-05-10','16:00:00','17:30:00',7000,20);

# valoraciones
INSERT INTO `valoraciones` (`valoraciones_id`,`estrellas`,`comentario`,`cliente_id`,`paseo_id`) VALUES (1,4,'Muy buen servicio por parte del paseador. Mi perro volvió muy contento.',3,1);
INSERT INTO `valoraciones` (`valoraciones_id`,`estrellas`,`comentario`,`cliente_id`,`paseo_id`) VALUES (2,5,'Excelente trabajo del paseador, se nota que le gusta lo que hace.',6,2);
INSERT INTO `valoraciones` (`valoraciones_id`,`estrellas`,`comentario`,`cliente_id`,`paseo_id`) VALUES (3,3,'El paseador llegó un poco tarde pero en general el servicio fue bueno.',9,3);
INSERT INTO `valoraciones` (`valoraciones_id`,`estrellas`,`comentario`,`cliente_id`,`paseo_id`) VALUES (4,2,'No me gustó el trato que le dio el paseador a mi perro, no lo volveré a contratar.',12,4);
INSERT INTO `valoraciones` (`valoraciones_id`,`estrellas`,`comentario`,`cliente_id`,`paseo_id`) VALUES (5,5,'El paseador fue muy atento y cariñoso con mi perro, definitivamente lo recomiendo.',18,5);
INSERT INTO `valoraciones` (`valoraciones_id`,`estrellas`,`comentario`,`cliente_id`,`paseo_id`) VALUES (6,4,'Buen servicio en general, pero me hubiera gustado que el paseo fuera un poco más largo.',4,6);
INSERT INTO `valoraciones` (`valoraciones_id`,`estrellas`,`comentario`,`cliente_id`,`paseo_id`) VALUES (7,3,'El paseador no parecía tener mucha experiencia, mi perro se mostró un poco inquieto durante el paseo.',11,7);
INSERT INTO `valoraciones` (`valoraciones_id`,`estrellas`,`comentario`,`cliente_id`,`paseo_id`) VALUES (8,5,'El paseador llegó a tiempo y el servicio fue excelente, mi perro lo adoró.',7,8);
INSERT INTO `valoraciones` (`valoraciones_id`,`estrellas`,`comentario`,`cliente_id`,`paseo_id`) VALUES (9,1,'Muy mal servicio, el paseador no llegó y no pude contactarlo.',15,9);
INSERT INTO `valoraciones` (`valoraciones_id`,`estrellas`,`comentario`,`cliente_id`,`paseo_id`) VALUES (10,5,'El paseador fue muy profesional y atento, mi perro regresó feliz del paseo.',5,10);

 #cliente_perro
 INSERT INTO `cliente_perro` (`cliente_perro_id`,`cliente_id`,`perro_id`) VALUES (1,1,1);
INSERT INTO `cliente_perro` (`cliente_perro_id`,`cliente_id`,`perro_id`) VALUES (2,1,2);
INSERT INTO `cliente_perro` (`cliente_perro_id`,`cliente_id`,`perro_id`) VALUES (3,2,3);
INSERT INTO `cliente_perro` (`cliente_perro_id`,`cliente_id`,`perro_id`) VALUES (4,2,4);
INSERT INTO `cliente_perro` (`cliente_perro_id`,`cliente_id`,`perro_id`) VALUES (5,3,5);
INSERT INTO `cliente_perro` (`cliente_perro_id`,`cliente_id`,`perro_id`) VALUES (6,3,6);
INSERT INTO `cliente_perro` (`cliente_perro_id`,`cliente_id`,`perro_id`) VALUES (7,4,7);
INSERT INTO `cliente_perro` (`cliente_perro_id`,`cliente_id`,`perro_id`) VALUES (8,4,8);
INSERT INTO `cliente_perro` (`cliente_perro_id`,`cliente_id`,`perro_id`) VALUES (9,5,9);
INSERT INTO `cliente_perro` (`cliente_perro_id`,`cliente_id`,`perro_id`) VALUES (10,5,10);
INSERT INTO `cliente_perro` (`cliente_perro_id`,`cliente_id`,`perro_id`) VALUES (11,6,11);
INSERT INTO `cliente_perro` (`cliente_perro_id`,`cliente_id`,`perro_id`) VALUES (12,6,12);
INSERT INTO `cliente_perro` (`cliente_perro_id`,`cliente_id`,`perro_id`) VALUES (13,7,13);
INSERT INTO `cliente_perro` (`cliente_perro_id`,`cliente_id`,`perro_id`) VALUES (14,7,14);
INSERT INTO `cliente_perro` (`cliente_perro_id`,`cliente_id`,`perro_id`) VALUES (15,8,15);
INSERT INTO `cliente_perro` (`cliente_perro_id`,`cliente_id`,`perro_id`) VALUES (16,8,16);
INSERT INTO `cliente_perro` (`cliente_perro_id`,`cliente_id`,`perro_id`) VALUES (17,9,17);
INSERT INTO `cliente_perro` (`cliente_perro_id`,`cliente_id`,`perro_id`) VALUES (18,9,18);
INSERT INTO `cliente_perro` (`cliente_perro_id`,`cliente_id`,`perro_id`) VALUES (19,10,19);
INSERT INTO `cliente_perro` (`cliente_perro_id`,`cliente_id`,`perro_id`) VALUES (20,10,20);

# Vistas

select * from cliente_perro;

CREATE VIEW vista_clientes_con_perros AS
SELECT c.cliente_id, c.nombre_cliente, c.apellido_cliente, p.nombre nombre_perro
FROM clientes c
JOIN cliente_perro cp ON c.cliente_id = cp.cliente_id
JOIN perros p ON cp.perro_id = p.perro_id;


SELECT * FROM clientes;
SELECT * FROM perros;
SELECT * FROM vista_clientes_con_perros;

CREATE VIEW vista_paseos_por_cliente AS
SELECT c.nombre_cliente, c.apellido_cliente, p.fecha, p.hora_inicio, p.hora_fin, pr.nombre nombre_perro, pa.nombre nombre_paseador, pa.apellido apellido_paseador
FROM clientes c
JOIN paseo p ON c.cliente_id = p.cliente_id
JOIN perros pr ON p.perro_id = pr.perro_id
JOIN paseador pa ON p.paseador_id = pa.paseador_id;

SELECT * FROM vista_paseos_por_cliente;

CREATE VIEW vista_estadisticas_paseos AS
SELECT COUNT(*) AS cantidad_paseos, SUM(precio) AS total_precio_paseos
FROM paseo;

SELECT * FROM vista_estadisticas_paseos;

CREATE VIEW vista_promedio_estrellas_por_paseador AS
SELECT pa.nombre nombre_paseador, AVG(v.estrellas) AS promedio_estrellas
FROM paseo p
JOIN paseador pa ON p.paseador_id = pa.paseador_id
JOIN valoraciones v ON p.paseo_id = v.paseo_id
GROUP BY pa.nombre;

SELECT * FROM vista_promedio_estrellas_por_paseador;

CREATE VIEW vista_paseos_por_ciudad AS
SELECT ci.nombre_ciudad, COUNT(*) AS cantidad_paseos
FROM ciudades ci
JOIN clientes cl ON ci.ciudad_id = cl.ciudad_id
JOIN paseo pa ON pa.cliente_id = cl.cliente_id
GROUP BY ci.nombre_ciudad;

select * from vista_paseos_por_ciudad;

# Funcion para calcular precios en el paseo

DELIMITER $$
CREATE FUNCTION calcular_precio_paseo (dur_min INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE precio INT;
    IF dur_min <= 30 THEN
        SET precio = 10000;
    ELSEIF dur_min > 30 AND dur_min <= 60 THEN
        SET precio = 15000;
    ELSEIF dur_min > 60 THEN
        SET precio = 20000;
    END IF;
    RETURN precio;
END;
$$

SELECT calcular_precio_paseo(61);

# Funcion para calcular la edad del perro

DELIMITER $$
CREATE FUNCTION calcular_edad_perro (fecha_nacimiento DATE)
RETURNS INT
DETERMINISTIC

BEGIN
    DECLARE edad INT;
    SET edad = YEAR(CURRENT_DATE()) - YEAR(fecha_nacimiento);
    IF MONTH(CURRENT_DATE()) < MONTH(fecha_nacimiento) OR (MONTH(CURRENT_DATE()) = MONTH(fecha_nacimiento) AND DAY(CURRENT_DATE()) < DAY(fecha_nacimiento)) THEN
        SET edad = edad - 1;
    END IF;
    RETURN edad;
END;
$$

SELECT calcular_edad_perro("1994-12-07");


# Paseo por cliente
DELIMITER $$
CREATE FUNCTION buscar_paseos_por_cliente (id_cliente INT) 
RETURNS VARCHAR(255)
READS SQL DATA
BEGIN
    DECLARE resultado VARCHAR(255);
    SELECT GROUP_CONCAT(CONCAT_WS(',', p.paseo_id, p.direccion, p.paseador_id, p.fecha, p.hora_inicio, p.hora_fin, p.precio, cp.perro_id)) INTO resultado
        FROM paseo p
        JOIN cliente_perro cp ON p.perro_id = cp.perro_id
        JOIN clientes c ON cp.cliente_id = c.cliente_id
        WHERE c.cliente_id = id_cliente;
    RETURN resultado;
END;
$$

SELECT buscar_paseos_por_cliente(3);


## Store Procedures

# Ordenar tablas por un campo
DELIMITER $$
CREATE PROCEDURE ordenar_tabla(IN tabla VARCHAR(255), IN ordenar_por VARCHAR(255), IN direccion VARCHAR(10))
BEGIN
	# Seteamos la query con el nombre de la tabla, el campo y la direccion para ordenarla
    SET @query = CONCAT('SELECT * FROM ', tabla, ' ORDER BY ', ordenar_por, ' ', direccion);
    PREPARE runSQL FROM @query;
    EXECUTE runSQL;
    DEALLOCATE PREPARE runSQL;
END;
$$

CALL ordenar_tabla('clientes', 'nombre_cliente', 'DESC');

# Store procedur3 para insetar datos en la tabla clientes:
DELIMITER $$
CREATE PROCEDURE insertar_cliente (IN nombre_cliente VARCHAR(45), IN apellido_cliente VARCHAR(45), IN telefono BIGINT, IN ciudad_id INT, IN direccion VARCHAR(70), IN correo VARCHAR(45), IN genero_id INT)
BEGIN
	#Elegimos los campos a insertar
    INSERT INTO clientes (nombre_cliente, apellido_cliente, telefono, ciudad_id, direccion, correo, genero_id) 
    # Con los valores a insertar
    VALUES (nombre_cliente, apellido_cliente, telefono, ciudad_id, direccion, correo, genero_id);
END;
$$

CALL insertar_cliente('Roberth', 'Lopez', 3246128451, 5, 'Cra 70b# 22-26', 'alejandroberth@gmail.com', 1);
SELECT * FROM clientes;

## Creacion de triggers

#Este trigger devuelve un error si el correo que intentas utilizar ya existe en la tabla

# On Insert
DELIMITER $$
CREATE TRIGGER tr_before_insert_clientes
    BEFORE INSERT ON clientes
    FOR EACH ROW
BEGIN
    IF (SELECT COUNT(*) FROM clientes WHERE correo = NEW.correo) > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El correo electrónico ya existe';
    END IF;
END;
$$

# On Update
DELIMITER $$
CREATE TRIGGER tr_before_update_clientes
    BEFORE UPDATE ON clientes
    FOR EACH ROW
BEGIN
    IF (SELECT COUNT(*) FROM clientes WHERE correo = NEW.correo) > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El correo electrónico ya existe';
    END IF;
END;
$$

#Datos de prueba
INSERT INTO `clientes` (`nombre_cliente`,`apellido_cliente`,`telefono`,`ciudad_id`,`direccion`,`correo`,`genero_id`) VALUES ('Carlos','González',3151234567,4,'Calle 40 #10-20','carlos.gonzalez@gmail.com',1);
UPDATE `clientes` SET `correo` = 'carlos.gonzalez@gmail.com' WHERE `cliente_id` = 17;

# Creacion de tabla de Auditoria para la tabla paseo

CREATE TABLE _paseo_audit (
  paseo_audit_id INT NOT NULL AUTO_INCREMENT,
  paseo_id INT NOT NULL,
  accion VARCHAR(10) NOT NULL,
  fecha TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (paseo_audit_id)
);

# Trigger que guarda el registro en la tabla _paseo_audit cuando se hace un insert
CREATE TRIGGER tr_insert_paseo_audit
AFTER INSERT ON paseo
FOR EACH ROW
INSERT INTO _paseo_audit (paseo_id, accion)
VALUES (NEW.paseo_id, 'INSERT');

# Trigger que guarda el registro en la tabla _paseo_audit cuando se hace un update
CREATE TRIGGER tr_update_paseo_audit
AFTER UPDATE ON paseo
FOR EACH ROW
INSERT INTO _paseo_audit (paseo_id, accion)
VALUES (NEW.paseo_id, 'UPDATE');

# Trigger que guarda el registro en la tabla _paseo_audit cuando se hace un delete
CREATE TRIGGER tr_delete_paseo_audit
AFTER DELETE ON paseo
FOR EACH ROW
INSERT INTO _paseo_audit (paseo_id, accion)
VALUES (OLD.paseo_id, 'DELETE');

## Datos de prueba
INSERT INTO `paseo` (`paseo_id`,`direccion`,`cliente_id`,`paseador_id`,`fecha`,`hora_inicio`,`hora_fin`,`precio`,`perro_id`) VALUES (11,'Calle 70 #22-17',19,11,'2023-05-10','16:00:00','17:30:00',7000,20);

select * from _paseo_audit
