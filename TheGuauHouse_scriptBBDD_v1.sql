CREATE DATABASE TheGuauHouse;

USE TheGuauHouse;

DROP TABLE IF EXISTS RESERVAS;
DROP TABLE IF EXISTS USUARIOSPERROS;
DROP TABLE IF EXISTS PERROS;
DROP TABLE IF EXISTS USUARIOS;
DROP TABLE IF EXISTS ROLES;

CREATE TABLE ROLES(
  ID INT PRIMARY KEY
  ,ROL NVARCHAR(10)
);

CREATE TABLE USUARIOS(
  ID INT PRIMARY KEY
  ,USUARIO NVARCHAR(18)
  ,PASS NVARCHAR(18)
  ,NOMBRE NVARCHAR(50)
  ,APELLIDOS NVARCHAR(50)
  ,DNI NVARCHAR(9) UNIQUE
  ,EMAIL NVARCHAR(50)
  ,TELEFONO NVARCHAR(50)
  ,ROL INT FOREIGN KEY REFERENCES ROLES(ID)
  ,FECHA_ALTA DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE PERROS(
  ID INT PRIMARY KEY
  ,IDUSU NVARCHAR(50)
  ,NOMBRE NVARCHAR(50)
  ,FECHA_ALTA DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE USUARIOSPERROS(
  ID INT PRIMARY KEY
  ,IDUSU INT FOREIGN KEY REFERENCES USUARIOS(ID)
  ,IDPER INT FOREIGN KEY REFERENCES PERROS(ID)
);

CREATE TABLE RESERVAS(
  ID INT PRIMARY KEY
  ,IDUSU INT FOREIGN KEY REFERENCES USUARIOS(ID)
  ,IDPER INT FOREIGN KEY REFERENCES PERROS(ID)
  ,FECHA DATETIME
  ,FECHA_ALTA DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO ROLES VALUES (1, 'admin');
INSERT INTO ROLES VALUES (2, 'usuario');
INSERT INTO ROLES VALUES (3, 'empleado');

INSERT INTO USUARIOS (ID, USUARIO, PASS, NOMBRE, APELLIDOS, DNI, EMAIL, TELEFONO, ROL) VALUES (1, 'naza', 'nazapass', 'Nazaret', 'de la Calle Mij�n', '50620047Z', 'naza@gmail.com', '622865204', 1);
INSERT INTO USUARIOS (ID, USUARIO, PASS, NOMBRE, APELLIDOS, DNI, EMAIL, TELEFONO, ROL) VALUES (2, 'rober', 'roberpass', 'Roberto', 'G�mez Ortiz', '50228012Z', 'rober@gmail.com', '600092487', 2);
INSERT INTO USUARIOS (ID, USUARIO, PASS, NOMBRE, APELLIDOS, DNI, EMAIL, TELEFONO, ROL) VALUES (3, 'sergio', 'sergiopass', 'Sergio', 'Cano', '54714859R', 'sergio@gmail.com', '685585141', 2);
INSERT INTO USUARIOS (ID, USUARIO, PASS, NOMBRE, APELLIDOS, DNI, EMAIL, TELEFONO, ROL) VALUES (4, 'vio', 'viopass', 'Violeta', 'de la Calle Mij�n', '50620048S', 'naza@gmail.com', '622865204', 3);

INSERT INTO PERROS (ID, IDUSU, NOMBRE) VALUES (1, 3, 'Sissel');
INSERT INTO PERROS (ID, IDUSU, NOMBRE) VALUES (2, 2, 'Noa');
INSERT INTO PERROS (ID, IDUSU, NOMBRE) VALUES (3, 3, 'Gala');

INSERT INTO USUARIOSPERROS VALUES (1, 3, 1);
INSERT INTO USUARIOSPERROS VALUES (2, 2, 2)
INSERT INTO USUARIOSPERROS VALUES (3, 3, 3);

//////

SELECT * FROM ROLES
SELECT * FROM USUARIOS
SELECT * FROM USUARIOS WHERE ROL = (SELECT ID FROM ROLES WHERE ROL = 'USUARIO')
SELECT U.USUARIO, R.ROL FROM USUARIOS U INNER JOIN ROLES R ON U.ROL = R.ID
SELECT U.USUARIO, P.NOMBRE FROM USUARIOS U INNER JOIN PERROS P ON P.IDUSU = U.ID
	ORDER BY U.USUARIO, P.NOMBRE
SELECT * FROM USUARIOSPERROS
SELECT U.NOMBRE, P.NOMBRE FROM USUARIOS U INNER JOIN USUARIOSPERROS UP ON U.ID = UP.IDUSU
	INNER JOIN PERROS P ON P.ID = UP.ID ORDER BY U.USUARIO, P.NOMBRE