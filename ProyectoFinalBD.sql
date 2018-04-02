CREATE DATABASE ProyectoFinalBD

USE ProyectoFinalBD

CREATE TABLE Padres
(ID_Padres INT PRIMARY KEY NOT NULL IDENTITY(1,1),
NomApe_Padre NVARCHAR(70),
NomApe_Madre NVARCHAR(70),
CedulaID_Padre NVARCHAR(10),
CedulaID_Madre NVARCHAR(10),
Telf_Residencial NVARCHAR(13),
Cel_Padre NVARCHAR(13),
Cel_Madre NVARCHAR(13),
Email_Padre NVARCHAR(50),
Email_Madre NVARCHAR(50))

CREATE TABLE Alumno
(Cod_Alumno INT PRIMARY KEY NOT NULL IDENTITY(1,1),
ID_Padres INT CONSTRAINT Fk_Padres FOREIGN KEY(ID_Padres)
REFERENCES Padres(ID_Padres),
Nom_Alumno VARCHAR(50),
Ape_Alumno VARCHAR(50),
Sexo_Alumno CHAR,
FechN_Alumno DATETIME,
Nacio_Alumno VARCHAR(30),
Grado_Alumno VARCHAR(4),
Cod_Padres INT)

CREATE TABLE Materias
(Cod_Materia INT PRIMARY KEY,
Cod_Alumno INT CONSTRAINT Fk_Alumno FOREIGN KEY(Cod_Alumno) REFERENCES Alumno(Cod_Alumno),
Materia NVARCHAR(50),
HORARIO DATETIME,
Aula NVARCHAR(5),
Docente NVARCHAR(50))

CREATE TABLE Matriculas
(Cod_Matricula INT PRIMARY KEY,
Cod_Alumno INT CONSTRAINT Fk_Estudiante FOREIGN KEY(Cod_Alumno) REFERENCES Alumno(Cod_Alumno),
Periodo_Escolar NVARCHAR(8),
Grado_Alumno NVARCHAR(3)
)

CREATE TABLE Empleados
(Cod_Empleado INT PRIMARY KEY NOT NULL IDENTITY(1,1),
Nom_Empleado VARCHAR(50),
Ape_Empleado VARCHAR(50),
CedulaID_Empleado VARCHAR(10),
TipoDeEmpleado VARCHAR(40),
Direccion VARCHAR(50) DEFAULT'Desconocida',
Puesto_Empleado VARCHAR(30))



CREATE TABLE Calificaciones
(ID_Calificaciones INT PRIMARY KEY NOT NULL IDENTITY(1,1),
Español CHAR(2),
Matematicas CHAR(2),
Biologia_Quimica CHAR(2),
Educ_Fisic CHAR(2),
Artistica CHAR(2),
Religion CHAR(2))

CREATE TABLE colegio_curso(
curso_codigo INT NOT NULL PRIMARY KEY IDENTITY(1,1),
curso_nivel VARCHAR(50) NOT NULL);

CREATE TABLE colegio_alumno(
alumno_matricula VARCHAR(10) NOT NULL PRIMARY KEY,
alumno_nombre VARCHAR(100) NOT NULL,
alumno_edad INT NOT NULL,
codigo_curso INT NOT NULL,
FOREIGN KEY(codigo_curso) REFERENCES colegio_curso(curso_codigo));


CREATE TABLE colegio_profesor(
profesor_matricula VARCHAR(10) NOT NULL PRIMARY KEY,
profesor_nombre VARCHAR(100) NOT NULL );


CREATE TABLE colegio_asignatura(
asignatura_codigo INT NOT NULL PRIMARY KEY IDENTITY(1,1),
asignatura_nombre VARCHAR(100) NOT NULL);

CREATE TABLE colegio_profesor_curso(
matricula_profesor VARCHAR(10) NOT NULL,
codigo_curso INT NOT NULL,
FOREIGN KEY(matricula_profesor) REFERENCES colegio_profesor(profesor_matricula),
FOREIGN KEY(codigo_curso) REFERENCES colegio_curso(curso_codigo));


CREATE TABLE colegio_alumno_asignatura(
matricula_alumno VARCHAR(10) NOT NULL,
codigo_asignatura INT NOT NULL,
FOREIGN KEY(matricula_alumno) REFERENCES colegio_alumno(alumno_matricula),
FOREIGN KEY(codigo_asignatura) REFERENCES colegio_asignatura(asignatura_codigo));

CREATE TABLE colegio_profesor_asignatura(
matricula_profesor VARCHAR(10) NOT NULL,
codigo_asignatura INT NOT NULL,
FOREIGN KEY(matricula_profesor) REFERENCES colegio_profesor(profesor_matricula),
FOREIGN KEY(codigo_asignatura) REFERENCES colegio_asignatura(asignatura_codigo)); 

CREATE TABLE Usuario
(Cod_Usuario INT PRIMARY KEY NOT NULL IDENTITY(1,1),
Nombre_Usuario VARCHAR(50),
UserName VARCHAR(50),
PassWord_Us VARCHAR(30),
TipoDeCuenta VARCHAR(50))

SELECT *FROM Padres
SELECT *FROM Alumno
SELECT *FROM Matriculas
SELECT *FROM Materias
SELECT *FROM Empleados
SELECT *FROM Calificaciones
SELECT *FROM colegio_curso
SELECT *FROM colegio_alumno
SELECT *FROM colegio_asignatura
SELECT *FROM colegio_alumno_asignatura
SELECT *FROM colegio_profesor
SELECT *FROM colegio_profesor_asignatura
SELECT *FROM colegio_profesor_curso