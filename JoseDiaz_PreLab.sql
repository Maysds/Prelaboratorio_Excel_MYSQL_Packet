create database FIXO_Sociedad;
use FIXO_Sociedad;

/* se crean las diferentes tablas en base a lo requerido, como las 
creamos??, con el codigo "create table" luego ya solo declaramos los espacios, por
ejemplo en este caso, id direccion, Direccion, Ciudad y pais*/

create table direccion(
idDireccion int primary key,
Direccion varchar(45),
Ciudad varchar(45),
Pais varchar(45)
);

create table categoria(
idCategoria int primary key,
Nombre varchar(45)
);

create table cliente(
idCliente int primary key,
Nombre varchar(45),
Apellido varchar(45),
Edad int, 
Direccion_idDireccion int,
foreign key (Direccion_idDireccion) references Direccion(idDireccion)
);

create table peliculas(
idPeliculas int primary key,
Nombre varchar(45),
Direccion int,
Descripcion TEXT,
Año int,
Categoria_idCategoria int,
foreign key (Categoria_idCategoria) references Categoria(idCategoria)
);

create table renta(
idRenta int primary key,
Fecha_Renta DATE,
Fecha_Entrega DATE,
Inventario_idCopiasPeliculas int,
foreign key (Inventario_idCopiasPeliculas) references Inventario(idCopiasPeliculas),
Cliente_idCliente int,
foreign key (Cliente_idCliente) references Cliente(idCliente)

);

create table inventario(
idCopiasPeliculas int primary key,
Peliculas_idPeliculas int,
foreign key (Peliculas_idPeliculas ) references Peliculas(idPeliculas),
Disponible tinyint


);

create table Contacto(
Telefono int primary key,
Contacto_Cine int,
Contacto_Proveedor int

);

create table Pago_Pelicula(
id_Pago int primary key,
id_Proveedor int,
Nombre_Pelicula varchar(50),
No_Copias varchar(50)

);

/*	Creacion de los valores de las tablas*/

-- Dirección
INSERT INTO direccion(idDireccion,Direccion,Ciudad,Pais) 
VALUES
(1, 'Zona 2', 'Mixco', 'Guatemala'),
(2, 'Zona 10', 'Mixco', 'Guatemala'),
(3, 'Zona 10', 'Guatemala', 'Guatemala'),
(4, 'Zona 21', 'Guatemala', 'Guatemala'),
(5, 'Zona 12', 'Villa Nueva', 'Guatemala');

-- Cliente
INSERT INTO cliente VALUES
(1, 'Jose', 'Diaz', 25, 1),
(2, 'Diego', 'Saquil', 30, 2),
(3, 'Diego', 'Suarez', 22, 3),
(4, 'Gabriel', 'Pirir', 27, 4),
(5, 'Jensy', 'Ocoño', 28, 5);

-- Categoría
INSERT INTO categoria VALUES
(1, 'Acción'),
(2, 'Drama'),
(3, 'Comedia'),
(4, 'Documental'),
(5, 'Animación');

-- Películas
INSERT INTO peliculas VALUES
(1, 'POKEMON1', 90, 'Película de Pokémon', 2005, 5),
(2, 'Coraline', 140, 'Terror', 2019, 1),
(3, 'Diario de una pasion', 195, 'Romance', 1997, 2),
(4, 'Oppenheimer', 100, 'Animada', 2021, 5),
(5, 'Interstellar', 170, 'Pieza de epoca', 2014, 4);

-- Inventario
INSERT INTO inventario VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 0),
(4, 4, 1),
(5, 5, 1);

-- Renta
INSERT INTO renta VALUES
(1, '2025-01-10', '2025-01-12', 2, 1),
(2, '2025-02-01', '2025-02-05', 3, 2),
(3, '2025-03-05', '2025-03-10', 4, 3),
(4, '2025-03-15', '2025-03-18', 5, 4),
(5, '2025-04-01', '2025-04-04', 1, 5);

/* Lo que se nos pide en nuestro pre laboratorio*/
SELECT * FROM cliente WHERE Nombre = 'Jose';

DELETE FROM peliculas WHERE NomBre = 'POKEMON1';

SELECT * FROM FIXO_Sociedad.direccion;

SELECT * FROM categoria ORDER BY Nombre ASC;

SELECT * FROM peliculas ORDER BY Año DESC;

SELECT SUM(cliente.Edad) AS TotalEdad
FROM renta
JOIN cliente ON renta.Cliente_idCliente = cliente.idCliente;


