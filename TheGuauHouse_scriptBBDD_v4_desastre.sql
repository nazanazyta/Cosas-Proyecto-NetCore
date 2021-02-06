CREATE DATABASE TheGuauHouse;

USE TheGuauHouse;

--DROP TABLE IF EXISTS RESERVAS;
--DROP TABLE IF EXISTS PERROS;
DROP TABLE IF EXISTS USUARIOS;
--DROP TABLE IF EXISTS ROLES;

--CREATE TABLE ROLES(
--  ID INT PRIMARY KEY
--  ,ROL NVARCHAR(10)
--);
select * from usuarios

CREATE TABLE USUARIOS(
  ID INT PRIMARY KEY
  ,USUARIO NVARCHAR(18) UNIQUE
  ,PASS VARBINARY(MAX)
  ,SALT NVARCHAR(50)
  ,NOMBRE NVARCHAR(50)
  --,APELLIDOS NVARCHAR(50)
  --,DNI NVARCHAR(9)
  --,EMAIL NVARCHAR(50)
  --,TELEFONO NVARCHAR(9)
  --,ROL INT --FOREIGN KEY REFERENCES ROLES(ID)
  --,FECHA_ALTA DATETIME DEFAULT CURRENT_TIMESTAMP
);

--CREATE TABLE PERROS(
--  ID INT PRIMARY KEY
--  ,IDUSU INT --FOREIGN KEY REFERENCES USUARIOS(ID)
--  ,NOMBRE NVARCHAR(50)
--  ,FECHA_ALTA DATETIME DEFAULT CURRENT_TIMESTAMP
--);

--CREATE TABLE RESERVAS(
--  ID INT PRIMARY KEY
--  ,IDUSU INT --FOREIGN KEY REFERENCES USUARIOS(ID)
--  ,IDPER INT --FOREIGN KEY REFERENCES PERROS(ID)
--  ,FECHA DATETIME
--  ,TURNO NVARCHAR(6)
--  ,FECHA_ALTA DATETIME DEFAULT CURRENT_TIMESTAMP
--);

--INSERT INTO ROLES VALUES (1, 'admin');
--INSERT INTO ROLES VALUES (2, 'usuario');
--INSERT INTO ROLES VALUES (3, 'empleado');

--INSERT INTO USUARIOS (ID, USUARIO, PASS, NOMBRE, APELLIDOS, DNI, EMAIL, TELEFONO, ROL)
--	VALUES (1, 'naza', 'nazapass', 'Nazaret', 'de la Calle Mij�n', '50620047Z', 'naza@gmail.com', '622865204', 1);
--INSERT INTO USUARIOS (ID, USUARIO, PASS, NOMBRE, APELLIDOS, DNI, EMAIL, TELEFONO, ROL)
--	VALUES (2, 'rober', 'roberpass', 'Roberto', 'G�mez Ortiz', '50228012Z', 'rober@gmail.com', '600092487', 2);
--INSERT INTO USUARIOS (ID, USUARIO, PASS, NOMBRE, APELLIDOS, DNI, EMAIL, TELEFONO, ROL)
--	VALUES (3, 'sergio', 'sergiopass', 'Sergio', 'Cano', '54714859R', 'sergio@gmail.com', '685585141', 2);
--INSERT INTO USUARIOS (ID, USUARIO, PASS, NOMBRE, APELLIDOS, DNI, EMAIL, TELEFONO, ROL)
--	VALUES (4, 'vio', 'viopass', 'Violeta', 'de la Calle Mij�n', '50620048S', 'vio@gmail.com', '611528490', 3);

--INSERT INTO PERROS (ID, IDUSU, NOMBRE) VALUES (1, 3, 'Sissel');
--INSERT INTO PERROS (ID, IDUSU, NOMBRE) VALUES (2, 2, 'Noa');
--INSERT INTO PERROS (ID, IDUSU, NOMBRE) VALUES (3, 3, 'Gala');

--INSERT INTO RESERVAS (ID, IDUSU, IDPER, FECHA, TURNO)
--	VALUES (1, 3, 1, CONVERT(DATETIME, '01/29/2021 09:00:00'), 'ma�ana');
--INSERT INTO RESERVAS (ID, IDUSU, IDPER, FECHA, TURNO)
--	VALUES (2, 2, 2, CONVERT(DATETIME, '01/29/2021 09:00:00'), 'ma�ana');
--INSERT INTO RESERVAS (ID, IDUSU, IDPER, FECHA, TURNO)
--	VALUES (3, 3, 1, CONVERT(DATETIME, '01/29/2021 15:00:00'), 'tarde');
--INSERT INTO RESERVAS (ID, IDUSU, IDPER, FECHA, TURNO)
--	VALUES (4, 3, 3, CONVERT(DATETIME, '01/31/2021 09:00:00'), 'ma�ana');
--INSERT INTO RESERVAS (ID, IDUSU, IDPER, FECHA, TURNO)
--	VALUES (5, 2, 2, CONVERT(DATETIME, '01/30/2021 15:00:00'), 'tarde');
--INSERT INTO RESERVAS (ID, IDUSU, IDPER, FECHA, TURNO)
--	VALUES (6, 3, 3, CONVERT(DATETIME, '01/31/2021 15:00:00'), 'tarde');

//////

--SELECT * FROM ROLES
--SELECT * FROM USUARIOS
--SELECT * FROM PERROS
--SELECT * FROM RESERVAS

--SELECT USUARIO, TELEFONO, ROL FROM USUARIOS
--	WHERE ROL = (SELECT ID FROM ROLES WHERE ROL = 'USUARIO')
--SELECT U.USUARIO, R.ROL FROM USUARIOS U INNER JOIN ROLES R ON U.ROL = R.ID
--SELECT U.USUARIO, U.TELEFONO, R.ROL FROM USUARIOS U INNER JOIN ROLES R ON U.ROL = R.ID
--	WHERE R.ROL = 'Usuario'
--SELECT U.USUARIO, U.TELEFONO, R.ROL FROM USUARIOS U INNER JOIN ROLES R ON U.ROL = R.ID
--	WHERE U.USUARIO = 'rober' AND U.TELEFONO = '600092487'
--SELECT U.USUARIO, P.NOMBRE FROM USUARIOS U INNER JOIN PERROS P ON P.IDUSU = U.ID
--	ORDER BY U.USUARIO, P.NOMBRE
--SELECT P.NOMBRE, R.FECHA FROM PERROS P INNER JOIN RESERVAS R ON P.ID = R.IDPER
--	WHERE R.FECHA >= CONVERT(DATETIME, '01/30/2021 09:00:00')
--	AND R.FECHA < CONVERT(DATETIME, '01/30/2021 15:00:00')
--SELECT P.NOMBRE, R.FECHA FROM PERROS P INNER JOIN RESERVAS R ON P.ID = R.IDPER
--	WHERE R.FECHA >= CONVERT(DATETIME, '01/30/2021 09:00:00')
--	AND R.TURNO = 'MA�ANA'

--create procedure cambiarnombreperro (@id int, @nombre nvarchar(50))
--as
--	update perros set nombre = @nombre where id = @id
--go

--execute cambiarnombreperro 1, 'Sisselllll'

--create vista insertarusuario