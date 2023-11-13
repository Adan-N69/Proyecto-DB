-- DROP SCHEMA dbo;

CREATE SCHEMA dbo;
-- ProyectoBD.dbo.Estudiante definition

-- Drop table

-- DROP TABLE ProyectoBD.dbo.Estudiante;

CREATE TABLE ProyectoBD.dbo.Estudiante (
	Boleta int NOT NULL,
	E_Nombre varchar(30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	E_Apellido_P varchar(30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	E_Apellido_M varchar(30) COLLATE Modern_Spanish_CI_AS NULL,
	Semestre_Actual int NOT NULL,
	Estatus bit NULL,
	CONSTRAINT PK_BOLETA PRIMARY KEY (Boleta)
);


-- ProyectoBD.dbo.Horario definition

-- Drop table

-- DROP TABLE ProyectoBD.dbo.Horario;

CREATE TABLE ProyectoBD.dbo.Horario (
	Clave_Horario int IDENTITY(1,1) NOT NULL,
	Hora varchar(11) COLLATE Modern_Spanish_CI_AS NOT NULL,
	Dia varchar(10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	CONSTRAINT PK_HORARIO PRIMARY KEY (Clave_Horario)
);


-- ProyectoBD.dbo.Materia definition

-- Drop table

-- DROP TABLE ProyectoBD.dbo.Materia;

CREATE TABLE ProyectoBD.dbo.Materia (
	Clave varchar(4) COLLATE Modern_Spanish_CI_AS NOT NULL,
	Nombre_Materia varchar(80) COLLATE Modern_Spanish_CI_AS NOT NULL,
	Tipo_Asignatura varchar(15) COLLATE Modern_Spanish_CI_AS NOT NULL,
	Nivel int NOT NULL,
	Semestre int NOT NULL,
	Creditos float NOT NULL,
	CONSTRAINT PK_MATERIA PRIMARY KEY (Clave)
);


-- ProyectoBD.dbo.Profesor definition

-- Drop table

-- DROP TABLE ProyectoBD.dbo.Profesor;

CREATE TABLE ProyectoBD.dbo.Profesor (
	ID int IDENTITY(1,1) NOT NULL,
	P_Nombre varchar(30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	P_Apellido_P varchar(30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	P_Apellido_M varchar(30) COLLATE Modern_Spanish_CI_AS NULL,
	CONSTRAINT PK_ID_PROF PRIMARY KEY (ID)
);


-- ProyectoBD.dbo.Tipo_Horario definition

-- Drop table

-- DROP TABLE ProyectoBD.dbo.Tipo_Horario;

CREATE TABLE ProyectoBD.dbo.Tipo_Horario (
	Tipo int NOT NULL,
	Descripcion varchar(10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	CONSTRAINT PK_TIPO PRIMARY KEY (Tipo)
);


-- ProyectoBD.dbo.Curso definition

-- Drop table

-- DROP TABLE ProyectoBD.dbo.Curso;

CREATE TABLE ProyectoBD.dbo.Curso (
	ID_Curso int IDENTITY(1,1) NOT NULL,
	Grupo varchar(4) COLLATE Modern_Spanish_CI_AS NOT NULL,
	ID_Profesor int NULL,
	Clave_Materia varchar(4) COLLATE Modern_Spanish_CI_AS NOT NULL,
	CONSTRAINT PK_CURSO PRIMARY KEY (ID_Curso),
	CONSTRAINT FK_MATERIA FOREIGN KEY (Clave_Materia) REFERENCES ProyectoBD.dbo.Materia(Clave),
	CONSTRAINT FK_PROFESOR FOREIGN KEY (ID_Profesor) REFERENCES ProyectoBD.dbo.Profesor(ID)
);


-- ProyectoBD.dbo.Curso_Horario definition

-- Drop table

-- DROP TABLE ProyectoBD.dbo.Curso_Horario;

CREATE TABLE ProyectoBD.dbo.Curso_Horario (
	ID_Curso int NOT NULL,
	Clave_Horario int NOT NULL,
	CONSTRAINT PK_HORARIO_CURSO PRIMARY KEY (ID_Curso,Clave_Horario),
	CONSTRAINT FK_HORARIO FOREIGN KEY (Clave_Horario) REFERENCES ProyectoBD.dbo.Horario(Clave_Horario),
	CONSTRAINT FK_HORARIO_CURSO FOREIGN KEY (ID_Curso) REFERENCES ProyectoBD.dbo.Curso(ID_Curso)
);


-- ProyectoBD.dbo.Kardex definition

-- Drop table

-- DROP TABLE ProyectoBD.dbo.Kardex;

CREATE TABLE ProyectoBD.dbo.Kardex (
	Numero_Kardex int IDENTITY(100,1) NOT NULL,
	Boleta_Estudiante int NOT NULL,
	CONSTRAINT PK_KARDEX PRIMARY KEY (Numero_Kardex),
	CONSTRAINT FK_BOLETA FOREIGN KEY (Boleta_Estudiante) REFERENCES ProyectoBD.dbo.Estudiante(Boleta)
);


-- ProyectoBD.dbo.Materias_Cursadas definition

-- Drop table

-- DROP TABLE ProyectoBD.dbo.Materias_Cursadas;

CREATE TABLE ProyectoBD.dbo.Materias_Cursadas (
	ID_Kardex int NOT NULL,
	Clave_Materia varchar(4) COLLATE Modern_Spanish_CI_AS NOT NULL,
	CONSTRAINT PK_MATERIAS_CUR PRIMARY KEY (ID_Kardex,Clave_Materia),
	CONSTRAINT FK_KARDEX FOREIGN KEY (ID_Kardex) REFERENCES ProyectoBD.dbo.Kardex(Numero_Kardex),
	CONSTRAINT FK_MATERIA_CUR FOREIGN KEY (Clave_Materia) REFERENCES ProyectoBD.dbo.Materia(Clave)
);


-- ProyectoBD.dbo.Horario_Sugerido definition

-- Drop table

-- DROP TABLE ProyectoBD.dbo.Horario_Sugerido;

CREATE TABLE ProyectoBD.dbo.Horario_Sugerido (
	Kardex_HS int NOT NULL,
	ID_Curso int NOT NULL,
	ID_Tipo_Horario int NOT NULL,
	CONSTRAINT PK_HS PRIMARY KEY (Kardex_HS,ID_Curso,ID_Tipo_Horario),
	CONSTRAINT FK_CURSO_HS FOREIGN KEY (ID_Curso) REFERENCES ProyectoBD.dbo.Curso(ID_Curso),
	CONSTRAINT FK_KARDEX_HS FOREIGN KEY (Kardex_HS) REFERENCES ProyectoBD.dbo.Kardex(Numero_Kardex),
	CONSTRAINT FK_TIPO_HORARIO FOREIGN KEY (ID_Tipo_Horario) REFERENCES ProyectoBD.dbo.Tipo_Horario(Tipo)
);


