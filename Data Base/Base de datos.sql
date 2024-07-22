CREATE TABLE lectores(
	id serial,
	nombre varchar(100),
	apellido varchar(100),
	email varchar(100),
	nacimiento date,
	PRIMARY KEY (id)
);

SELECT * FROM lectores;

INSERT INTO lectores (nombre, apellido, email, nacimiento) values 
  ('Juan Alberto', 'Cortéz', 'juancortez@gmail.com', '20/06/1983');

INSERT INTO lectores (nombre, apellido, email, nacimiento) values 
  ('Antonia', 'de los Ríos', 'antoniarios_23@yahoo.com', '24/11/1978');

INSERT INTO lectores (nombre, apellido, email, nacimiento) values 
  ('Nicolás', 'Martin', 'nico_martin23@gmail.com', '11/07/1986');

INSERT INTO lectores (nombre, apellido, email, nacimiento) values 
  ('Néstor', 'Casco', 'nestor_casco2331@hotmail.com', '11/02/1981');

INSERT INTO lectores (nombre, apellido, email, nacimiento) values 
  ('Lisa', 'Pérez', 'lisperez@hotmail.com', '11/08/1994');

INSERT INTO lectores (nombre, apellido, email, nacimiento) values 
  ('Ana Rosa', 'Estagnolli', 'anros@abcdatos.com', '15/10/1974');

INSERT INTO lectores (nombre, apellido, email, nacimiento) values 
  ('Milagros', 'Pastoruti', 'mili_2231@gmail.com', '22/01/2001');

INSERT INTO lectores (nombre, apellido, email, nacimiento) values 
  ('Pedro', 'Alonso', 'alonso.pedro@impermebilizantesrosario.com', '05/09/1983');

INSERT INTO lectores (nombre, apellido, email, nacimiento) values 
  ('Arturo Ezequiel', 'Ramírez', 'artu.rama@outlook.com', '29/03/1998');

INSERT INTO lectores (nombre, apellido, email, nacimiento) values 
  ('Juan Ignacio', 'Altarez', 'juanaltarez.223@yahoo.com', '24/08/1975');

CREATE TABLE libros(
	id serial,
	nombre varchar(100),
	editorial varchar(100),
	autor varchar(100),
	isbn int,
	PRIMARY KEY (id)
);

SELECT * FROM libros;

INSERT INTO libros (nombre, editorial, autor, isbn) values
  ('Cementerio de animales', 'Ediciones de Mente', 'Stephen King', '4568874');

INSERT INTO libros (nombre, editorial, autor, isbn) values
  ('En el nombre de la rosa', 'Editorial España', 'Umberto Eco', '44558877');

INSERT INTO libros (nombre, editorial, autor, isbn) values
  ('Cien años de soledad', 'Sudamericana', 'Gabriel García Márquez', '7788845');

INSERT INTO libros (nombre, editorial, autor, isbn) values
  ('El diario de Ellen Rimbauer', 'Editorial Maine', 'Stephen King', '45699874');

INSERT INTO libros (nombre, editorial, autor, isbn) values
  ('La hojarasca', 'Sudamericana', 'Gabriel García Márquez', '7787898');

INSERT INTO libros (nombre, editorial, autor, isbn) values
  ('El amor en los tiempos del cólera', 'Sudamericana', 'Gabriel García Márquez', '2564111');

INSERT INTO libros (nombre, editorial, autor, isbn) values
  ('La casa de los espíritus', 'Ediciones Chile', 'Isabel Allende', '5544781');

INSERT INTO libros (nombre, editorial, autor, isbn) values
  ('Paula', 'Ediciones Chile', 'Isabel Allende', '22545447');

INSERT INTO libros (nombre, editorial, autor, isbn) values
  ('La tregua', 'Alfa', 'Mario Benedetti', '2225412');

INSERT INTO libros (nombre, editorial, autor, isbn) values
  ('Gracias por el fuego', 'Alfa', 'Mario Benedetti', '88541254');

SELECT * FROM lectores;
SELECT * FROM libros;

CREATE TABLE lectoresLibros(
	id_lectores int,
	id_libros int,
    CONSTRAINT lectoresLibros_idLectores FOREIGN KEY(id_lectores) REFERENCES lectores(id),
    CONSTRAINT lectoresLibros_idLibros FOREIGN KEY(id_libros) REFERENCES libros(id),
		
	PRIMARY KEY(id_lectores, id_libros)
);
	
SELECT * FROM lectoresLibros;

/*1*/
INSERT INTO lectoresLibros (id_lectores, id_libros) values (1, 1);
INSERT INTO lectoresLibros (id_lectores, id_libros) values (1, 2);
INSERT INTO lectoresLibros (id_lectores, id_libros) values (1, 3);
INSERT INTO lectoresLibros (id_lectores, id_libros) values (1, 4);
INSERT INTO lectoresLibros (id_lectores, id_libros) values (1, 5);

/*2*/
INSERT INTO lectoresLibros (id_lectores, id_libros) values (2, 5);
INSERT INTO lectoresLibros (id_lectores, id_libros) values (2, 6);
INSERT INTO lectoresLibros (id_lectores, id_libros) values (2, 7);
INSERT INTO lectoresLibros (id_lectores, id_libros) values (2, 8);
INSERT INTO lectoresLibros (id_lectores, id_libros) values (2, 9);

/*3*/
INSERT INTO lectoresLibros (id_lectores, id_libros) values (3, 2);
INSERT INTO lectoresLibros (id_lectores, id_libros) values (3, 4);
INSERT INTO lectoresLibros (id_lectores, id_libros) values (3, 6);
INSERT INTO lectoresLibros (id_lectores, id_libros) values (3, 8);
INSERT INTO lectoresLibros (id_lectores, id_libros) values (3, 1);

/*4*/
INSERT INTO lectoresLibros (id_lectores, id_libros) values (4, 1);
INSERT INTO lectoresLibros (id_lectores, id_libros) values (4, 3);
INSERT INTO lectoresLibros (id_lectores, id_libros) values (4, 5);
INSERT INTO lectoresLibros (id_lectores, id_libros) values (4, 7);
INSERT INTO lectoresLibros (id_lectores, id_libros) values (4, 9);

SELECT * FROM lectoresLibros;

/*5*/
INSERT INTO lectoresLibros (id_lectores, id_libros) values (5, 1);
INSERT INTO lectoresLibros (id_lectores, id_libros) values (5, 2);
INSERT INTO lectoresLibros (id_lectores, id_libros) values (5, 3);

/*6*/
INSERT INTO lectoresLibros (id_lectores, id_libros) values (6, 4);
INSERT INTO lectoresLibros (id_lectores, id_libros) values (6, 5);
INSERT INTO lectoresLibros (id_lectores, id_libros) values (6, 6);

/*7*/
INSERT INTO lectoresLibros (id_lectores, id_libros) values (7, 7);
INSERT INTO lectoresLibros (id_lectores, id_libros) values (7, 8);
INSERT INTO lectoresLibros (id_lectores, id_libros) values (7, 9);

SELECT * FROM lectoresLibros;

/*8*/
INSERT INTO lectoresLibros (id_lectores, id_libros) values (8, 2);

/*9*/
INSERT INTO lectoresLibros (id_lectores, id_libros) values (9, 7);

SELECT * FROM lectoresLibros;

/*Cuando se presta cada libro*/
SELECT id_libros, COUNT(id_libros) AS cantidad FROM lectoresLibros GROUP BY 
id_libros ORDER BY cantidad DESC;

SELECT COUNT(id_libros) AS cantidad FROM lectoresLibros WHERE id_libros = 5;

/*Cuantas veces tiene en prestamo cada lector*/
-- Lector 1
SELECT COUNT(id_lectores) FROM lectoresLibros WHERE id_lectores = 1;
-- Lector 2
SELECT COUNT(id_lectores) FROM lectoresLibros WHERE id_lectores = 2;
-- Lector 3
SELECT COUNT(id_lectores) FROM lectoresLibros WHERE id_lectores = 3;
-- Lector 9
SELECT COUNT(id_lectores) FROM lectoresLibros WHERE id_lectores = 9;

-- Devolucion de uno de los cinco libros prestados
DELETE FROM lectoresLibros WHERE id_lectores = 1 AND id_libros = 2;

SELECT * FROM lectoresLibros;

-- Promedio de edad
SELECT AVG (date_part('YEAR', AGE(nacimiento))) AS promedioEdad FROM lectores;

SELECT MAX (date_part('YEAR', AGE(nacimiento))) AS mayorEdad FROM lectores;

SELECT MIN (date_part('YEAR', AGE(nacimiento))) AS mayorEdad FROM lectores;

-- API 3 PUNTO 7

CREATE OR REPLACE VIEW libros_prestados
	AS 
SELECT lectores.apellido, lectores.nombre, libros.nombre AS nombreLibro, Libros.editorial, libros.isbn
FROM lectores
INNER JOIN lectoresLibros ON lectoresLibros.id_lectores = lectores.id
INNER JOIN libros ON lectoresLibros.id_libros = libros.id

SELECT * FROM libros_prestados WHERE nombre = 'Pedro' AND apellido = 'Alonso'

-- API 4 PUNTO 1 
CREATE OR REPLACE FUNCTION devolverLibro(idLector int, idLibro int)
RETURNS void AS $$ 
BEGIN 
     DELETE FROM lectoresLibros
     WHERE lectoresLibros.id_lectores = idLector AND lectoresLibros.id_libros = idLibro;
END;
$$ LANGUAGE plpgsql	

SELECT * FROM devolverLibro(8, 2);
SELECT * FROM lectoresLibros;

-- PUNTO 2
CREATE TABLE devolucion_log(
	id_lectores integer NOT NULL,
	id_libros integer NOT NULL,
	fecha timestamp
);

-- TRIGGER
CREATE OR REPLACE FUNCTION  funcion_tr_delete() RETURNS TRIGGER
AS $$
BEGIN 

	INSERT INTO devolucion_log(id_lectores, id_libros, fecha) VALUES
	(old.id_lectores, old.id_libros, now());

    RETURN OLD;
END
$$
LANGUAGE plpgsql;

--

CREATE TRIGGER trigger_delete BEFORE DELETE ON lectoresLibros
	FOR EACH ROW 
	EXECUTE PROCEDURE funcion_tr_delete();

--

SELECT * FROM lectoresLibros;
SELECT * FROM devolverLibro(1, 5);

SELECT * FROM devolucion_log;

-- PUNTO 3
CREATE OR REPLACE FUNCTION retornar_cantidad_prestados(integer) RETURNS bigint AS 

'SELECT COUNT(id_libros) AS cantidad FROM lectoresLibros WHERE id_libros = $1;'

LANGUAGE SQL;

SELECT retornar_cantidad_prestados(2);

