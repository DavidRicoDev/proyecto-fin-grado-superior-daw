DROP DATABASE IF EXISTS sportproject;

CREATE DATABASE sportproject;

USE sportproject;

-- CREAR TABLAS --

CREATE TABLE TIPO_USUARIO (
    nombre VARCHAR(100) NOT NULL PRIMARY KEY
);

CREATE TABLE MARCAS (
	id_marca INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
	email VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE CATEGORIAS (
	id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE PRODUCTOS (
	id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    marca INT NOT NULL,
    categoria INT NOT NULL,
    imagen VARCHAR(255),
    precio FLOAT NOT NULL,
    stock INT NOT NULL,
    CONSTRAINT productos_marcas_fk FOREIGN KEY (marca)
		REFERENCES MARCAS (id_marca),
	 CONSTRAINT productos_categorias_fk FOREIGN KEY (categoria)
	REFERENCES CATEGORIAS (id_categoria)
);

CREATE TABLE USUARIOS (
	id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    tipo_usuario VARCHAR(100) NOT NULL,
	email VARCHAR(255) NOT NULL UNIQUE,
    dni VARCHAR(9) NOT NULL UNIQUE,
    genero TINYINT(1) NOT NULL,
    nombre VARCHAR(250) NOT NULL,
    apellido VARCHAR(250) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    telefono INT(9) NOT NULL UNIQUE,
	provincia VARCHAR(50) NOT NULL,
    municipio VARCHAR(50) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    codigo_postal INT(5) NOT NULL,
    contrasena VARCHAR(255) NOT NULL,
    CONSTRAINT usuarios_tipo_usuario_fk FOREIGN KEY (tipo_usuario)
		REFERENCES TIPO_USUARIO (nombre)
);

CREATE TABLE VENTAS (
	id_venta INT AUTO_INCREMENT PRIMARY KEY,
	id_usuario INT NOT NULL,
    total_productos INT(3) NOT NULL,
    precio_total FLOAT NOT NULL,
    fecha TIMESTAMP NOT NULL,
	CONSTRAINT ventas_usuarios_fk FOREIGN KEY (id_usuario)
		REFERENCES USUARIOS (id_usuario)
);

CREATE TABLE VENTAS_PRODUCTOS (
	id_venta INT NOT NULL,
	id_producto INT NOT NULL,
	PRIMARY KEY (id_venta, id_producto),
    CONSTRAINT ventas_prodcutos_ventas_fk FOREIGN KEY (id_venta)
        REFERENCES VENTAS (id_venta),
	CONSTRAINT ventas_productos_productos_fk FOREIGN KEY (id_producto)
        REFERENCES PRODUCTOS (id_producto)
);

-- INSERTAR DATOS TABLA TIPO_USUARIOS --

INSERT INTO TIPO_USUARIO (nombre) VALUES ('Administrador');
INSERT INTO TIPO_USUARIO (nombre) VALUES ('Cliente');

-- INSERTAR DATOS TABLA MARCAS --

INSERT INTO marcas (nombre, email) VALUES ('Adidas', 'info@adidas.com');
INSERT INTO marcas (nombre, email) VALUES ('Nike', 'info@nike.com');
INSERT INTO marcas (nombre, email) VALUES ('Puma', 'info@puma.com');
INSERT INTO marcas (nombre, email) VALUES ('Reebok', 'info@reebok.com');
INSERT INTO marcas (nombre, email) VALUES ('Asics', 'info@asics.com');

-- INSERTAR DATOS TABLA CATEGORIAS --

INSERT INTO categorias (nombre) VALUES ('Chandals');
INSERT INTO categorias (nombre) VALUES ('Zapatos');
INSERT INTO categorias (nombre) VALUES ('Camisetas');
INSERT INTO categorias (nombre) VALUES ('Sudaderas');
INSERT INTO categorias (nombre) VALUES ('Gorras');

-- INSERTAR DATOS TABLA USUARIOS --

INSERT INTO usuarios (dni, tipo_usuario, email, genero, nombre, apellido, fecha_nacimiento, telefono, provincia, municipio, direccion, codigo_postal, contrasena) VALUES ('49845678R', 'Administrador', 'david@gmail.com', 1 ,'David', 'Riva', '1986-08-24', 677710883, 'Huelva', 'Huelva', 'Isla chica', 21004, '1234');
INSERT INTO usuarios (dni, tipo_usuario, email, genero, nombre, apellido, fecha_nacimiento, telefono, provincia, municipio, direccion, codigo_postal, contrasena) VALUES ('77889944A', 'Cliente', 'manuel@gmail.com', 1 ,'Manuel', 'Pérez', '1990-05-12', 644551188, 'Madrid', 'Madrid','Gran Vía', 28001, '1234');
INSERT INTO usuarios (dni, tipo_usuario, email, genero, nombre, apellido, fecha_nacimiento, telefono, provincia, municipio, direccion, codigo_postal, contrasena) VALUES ('88994455W', 'Cliente', 'chani@gmail.com', 0 ,'Chani', 'Merino', '1989-09-21', 600114477, 'Huelva', 'Huelva', 'Jose Fariñas', 21006, '1234');
INSERT INTO usuarios (dni, tipo_usuario, email, genero, nombre, apellido, fecha_nacimiento, telefono, provincia, municipio, direccion, codigo_postal, contrasena) VALUES ('99445566E', 'Cliente', 'miguel@gmail.com', 1 ,'Miguel', 'Vázquez', '1985-02-29', 699887744, 'Barcelona', 'Barcelona', 'La Rambla', 08001, '1234');
INSERT INTO usuarios (dni, tipo_usuario, email, genero, nombre, apellido, fecha_nacimiento, telefono, provincia, municipio, direccion, codigo_postal, contrasena) VALUES ('55661122D', 'Cliente', 'antonio@gmail.com', 1 ,'Antonio', 'Grosso', '1959-06-09', 633663366, 'Sevilla', 'Sevilla', 'Calle Sierpes', 11221, '1234');
INSERT INTO usuarios (dni, tipo_usuario, email, genero, nombre, apellido, fecha_nacimiento, telefono, provincia, municipio, direccion, codigo_postal, contrasena) VALUES ('11224455B', 'Cliente', 'lulu@gmail.com', 0 ,'Lulu', 'Montan', '1987-05-02', 6478951230, 'Cadiz', 'Cadiz', 'La Tacita', 38801, '1234');
INSERT INTO usuarios (dni, tipo_usuario, email, genero, nombre, apellido, fecha_nacimiento, telefono, provincia, municipio, direccion, codigo_postal, contrasena) VALUES ('55117799F', 'Cliente', 'michelle@gmail.com', 0 ,'Michelle', 'Kane', '1997-11-11', 622255577, 'Bilbao', 'Bilbao', 'De la Cruz', 48001, '1234');
INSERT INTO usuarios (dni, tipo_usuario, email, genero, nombre, apellido, fecha_nacimiento, telefono, provincia, municipio, direccion, codigo_postal, contrasena) VALUES ('66885500Z', 'Cliente', 'antonella@gmail.com', 0 ,'Antonella', 'Bassi', '1956-01-22', 601478529, 'Madrid', 'Madrid', 'Avenida Cibeles', 27889, '1234');
INSERT INTO usuarios (dni, tipo_usuario, email, genero, nombre, apellido, fecha_nacimiento, telefono, provincia, municipio, direccion, codigo_postal, contrasena) VALUES ('99556611L', 'Cliente', 'joan@gmail.com', 1 ,'Joan', 'Hernández', '1992-12-14', 655554123, 'Huelva', 'El cerro de Andevalo', 'Calle el barrio', 82221, '1234');
INSERT INTO usuarios (dni, tipo_usuario, email, genero, nombre, apellido, fecha_nacimiento, telefono, provincia, municipio, direccion, codigo_postal, contrasena) VALUES ('44885599R', 'Cliente', 'marcos@gmail.com', 1 ,'Marcos', 'Escobar', '1995-07-15', 659648755, 'Valencia',  'Valencia', 'Avenida Las Fallas', 42001, '1234');
INSERT INTO usuarios (dni, tipo_usuario, email, genero, nombre, apellido, fecha_nacimiento, telefono, provincia, municipio, direccion, codigo_postal, contrasena) VALUES ('33449922K', 'Cliente', 'gorka@gmail.com', 1 ,'Gorka', 'Guerrero', '2000-03-10', 677771146, 'Huelva', 'Punta Umbria', 'Calle Fragata', 20301, '1234');

-- INSERTAR DATOS TABLA PRODUCTOS --

INSERT INTO productos (nombre, categoria, marca, precio, stock, imagen) VALUES ('Performance', 1, 1, 60.00, 2, 'chandal_adidas_performance');
INSERT INTO productos (nombre, categoria, marca, precio, stock, imagen) VALUES ('Classic', 1, 1, 189.90, 10, 'chandal_adidas_classic');
INSERT INTO productos (nombre, categoria, marca, precio, stock, imagen) VALUES ('Kings', 1, 3, 49.95, 46, 'chandal_puma_kings');
INSERT INTO productos (nombre, categoria, marca, precio, stock, imagen) VALUES ('Stellar', 1, 4, 34.30, 66, 'chandal_reebok_stellar');
INSERT INTO productos (nombre, categoria, marca, precio, stock, imagen) VALUES ('Force', 1, 2, 145.90, 100, 'chandal_nike_force');
INSERT INTO productos (nombre, categoria, marca, precio, stock, imagen) VALUES ('Runer', 2, 5, 120.00, 10, 'zapatos_ascis_runer');
INSERT INTO productos (nombre, categoria, marca, precio, stock, imagen) VALUES ('Climax', 2, 1, 20.95, 0, 'zapatos_adidas_climax');
INSERT INTO productos (nombre, categoria, marca, precio, stock, imagen) VALUES ('Forest', 2, 3, 22.20, 0, 'zapatos_puma_forest');
INSERT INTO productos (nombre, categoria, marca, precio, stock, imagen) VALUES ('Night', 2, 4, 27.25, 34, 'zapatos_reebok_night');
INSERT INTO productos (nombre, categoria, marca, precio, stock, imagen) VALUES ('Oranges', 3, 1, 38.90, 69, 'camiseta_adidas_oranges');
INSERT INTO productos (nombre, categoria, marca, precio, stock, imagen) VALUES ('Pink', 3, 3, 19.50,98, 'camiseta_puma_pink');
INSERT INTO productos (nombre, categoria, marca, precio, stock, imagen) VALUES ('Black', 3, 2, 35.00, 20, 'camiseta_nike_black');
INSERT INTO productos (nombre, categoria, marca, precio, stock, imagen) VALUES ('Tresio', 4, 4, 78.60, 25, 'sudadera_reebok_tresio');
INSERT INTO productos (nombre, categoria, marca, precio, stock, imagen) VALUES ('Esentials', 4, 1, 47.65, 98, 'sudadera_adidas_esentials');
INSERT INTO productos (nombre, categoria, marca, precio, stock, imagen) VALUES ('Yankee', 5, 2, 23.40, 8, 'gorra_mike_yankee');

-- CREAR VENTAS --

INSERT INTO ventas (id_usuario, total_productos, precio_total, fecha) VALUES (1, 1, 120.00, CURRENT_TIMESTAMP);
INSERT INTO ventas (id_usuario, total_productos, precio_total, fecha) VALUES (4, 2, 70.90, CURRENT_TIMESTAMP);
INSERT INTO ventas (id_usuario, total_productos, precio_total, fecha) VALUES (10, 4, 270.10, CURRENT_TIMESTAMP);
INSERT INTO ventas (id_usuario, total_productos, precio_total, fecha) VALUES (3, 5, 250.40, CURRENT_TIMESTAMP);
INSERT INTO ventas (id_usuario, total_productos, precio_total, fecha) VALUES (7, 2, 46.75, CURRENT_TIMESTAMP);
INSERT INTO ventas (id_usuario, total_productos, precio_total, fecha) VALUES (9, 1, 60, CURRENT_TIMESTAMP);
INSERT INTO ventas (id_usuario, total_productos, precio_total, fecha) VALUES (2, 3, 227.65, CURRENT_TIMESTAMP);
INSERT INTO ventas (id_usuario, total_productos, precio_total, fecha) VALUES (6, 5, 292.20, CURRENT_TIMESTAMP);
INSERT INTO ventas (id_usuario, total_productos, precio_total, fecha) VALUES (5, 2, 81.95, CURRENT_TIMESTAMP);
INSERT INTO ventas (id_usuario, total_productos, precio_total, fecha) VALUES (4, 1, 35.00, CURRENT_TIMESTAMP);


-- INSERTAR DATOS TABLA VENTAS_PRODUCTOS --

INSERT INTO ventas_productos (id_venta, id_producto) VALUES (1, 6);

INSERT INTO ventas_productos (id_venta, id_producto) VALUES (2, 7);
INSERT INTO ventas_productos (id_venta, id_producto) VALUES (2, 3);

INSERT INTO ventas_productos (id_venta, id_producto) VALUES (3, 5);
INSERT INTO ventas_productos (id_venta, id_producto) VALUES (3, 8);
INSERT INTO ventas_productos (id_venta, id_producto) VALUES (3, 13);
INSERT INTO ventas_productos (id_venta, id_producto) VALUES (3, 15);

INSERT INTO ventas_productos (id_venta, id_producto) VALUES (4, 4);
INSERT INTO ventas_productos (id_venta, id_producto) VALUES (4, 6);
INSERT INTO ventas_productos (id_venta, id_producto) VALUES (4, 8);
INSERT INTO ventas_productos (id_venta, id_producto) VALUES (4, 10);
INSERT INTO ventas_productos (id_venta, id_producto) VALUES (4, 12);

INSERT INTO ventas_productos (id_venta, id_producto) VALUES (5, 9);
INSERT INTO ventas_productos (id_venta, id_producto) VALUES (5, 11);

INSERT INTO ventas_productos (id_venta, id_producto) VALUES (6, 1);

INSERT INTO ventas_productos (id_venta, id_producto) VALUES (7, 1);
INSERT INTO ventas_productos (id_venta, id_producto) VALUES (7, 14);
INSERT INTO ventas_productos (id_venta, id_producto) VALUES (7, 6);

INSERT INTO ventas_productos (id_venta, id_producto) VALUES (8, 5);
INSERT INTO ventas_productos (id_venta, id_producto) VALUES (8, 7);
INSERT INTO ventas_productos (id_venta, id_producto) VALUES (8, 9);
INSERT INTO ventas_productos (id_venta, id_producto) VALUES (8, 11);
INSERT INTO ventas_productos (id_venta, id_producto) VALUES (8, 13);

INSERT INTO ventas_productos (id_venta, id_producto) VALUES (9, 4);
INSERT INTO ventas_productos (id_venta, id_producto) VALUES (9, 14);

INSERT INTO ventas_productos (id_venta, id_producto) VALUES (10, 12);