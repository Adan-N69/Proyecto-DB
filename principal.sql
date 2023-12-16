USE [master]
GO
/****** Object:  Database [ProyectoBD]    Script Date: 07/12/2023 02:38:11 p. m. ******/
CREATE DATABASE [ProyectoBD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProyectoBD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ProyectoBD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProyectoBD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ProyectoBD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ProyectoBD] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProyectoBD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProyectoBD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProyectoBD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProyectoBD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProyectoBD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProyectoBD] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProyectoBD] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ProyectoBD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProyectoBD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProyectoBD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProyectoBD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProyectoBD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProyectoBD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProyectoBD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProyectoBD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProyectoBD] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProyectoBD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProyectoBD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProyectoBD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProyectoBD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProyectoBD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProyectoBD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProyectoBD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProyectoBD] SET RECOVERY FULL 
GO
ALTER DATABASE [ProyectoBD] SET  MULTI_USER 
GO
ALTER DATABASE [ProyectoBD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProyectoBD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProyectoBD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProyectoBD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProyectoBD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProyectoBD] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ProyectoBD', N'ON'
GO
ALTER DATABASE [ProyectoBD] SET QUERY_STORE = ON
GO
ALTER DATABASE [ProyectoBD] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ProyectoBD]
GO
/****** Object:  Table [dbo].[Curso]    Script Date: 07/12/2023 02:38:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Curso](
	[ID_Curso] [int] IDENTITY(1,1) NOT NULL,
	[Grupo] [varchar](7) NOT NULL,
	[ID_Profesor] [int] NULL,
	[Clave_Materia] [varchar](4) NOT NULL,
 CONSTRAINT [PK_CURSO] PRIMARY KEY CLUSTERED 
(
	[ID_Curso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Curso_Horario]    Script Date: 07/12/2023 02:38:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Curso_Horario](
	[ID_Curso] [int] NOT NULL,
	[Clave_Horario] [int] NOT NULL,
 CONSTRAINT [PK_HORARIO_CURSO] PRIMARY KEY CLUSTERED 
(
	[ID_Curso] ASC,
	[Clave_Horario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estudiante]    Script Date: 07/12/2023 02:38:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estudiante](
	[Boleta] [int] NOT NULL,
	[E_Nombre] [varchar](30) NOT NULL,
	[E_Apellido_P] [varchar](30) NOT NULL,
	[E_Apellido_M] [varchar](30) NULL,
	[Semestre_Actual] [int] NOT NULL,
	[Estatus] [bit] NULL,
 CONSTRAINT [PK_BOLETA] PRIMARY KEY CLUSTERED 
(
	[Boleta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Horario]    Script Date: 07/12/2023 02:38:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Horario](
	[Clave_Horario] [int] IDENTITY(1,1) NOT NULL,
	[Hora] [varchar](11) NOT NULL,
	[Dia] [varchar](10) NOT NULL,
 CONSTRAINT [PK_HORARIO] PRIMARY KEY CLUSTERED 
(
	[Clave_Horario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Horario_Sugerido]    Script Date: 07/12/2023 02:38:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Horario_Sugerido](
	[Kardex_HS] [int] NOT NULL,
	[ID_Curso] [int] NOT NULL,
	[ID_Tipo_Horario] [int] NOT NULL,
 CONSTRAINT [PK_HS] PRIMARY KEY CLUSTERED 
(
	[Kardex_HS] ASC,
	[ID_Curso] ASC,
	[ID_Tipo_Horario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kardex]    Script Date: 07/12/2023 02:38:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kardex](
	[Numero_Kardex] [int] IDENTITY(100,1) NOT NULL,
	[Boleta_Estudiante] [int] NOT NULL,
 CONSTRAINT [PK_KARDEX] PRIMARY KEY CLUSTERED 
(
	[Numero_Kardex] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materia]    Script Date: 07/12/2023 02:38:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materia](
	[Clave] [varchar](4) NOT NULL,
	[Nombre_Materia] [varchar](80) NOT NULL,
	[Tipo_Asignatura] [varchar](15) NOT NULL,
	[Nivel] [int] NOT NULL,
	[Semestre] [int] NOT NULL,
	[Creditos] [float] NOT NULL,
 CONSTRAINT [PK_MATERIA] PRIMARY KEY CLUSTERED 
(
	[Clave] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materias_Cursadas]    Script Date: 07/12/2023 02:38:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materias_Cursadas](
	[ID_Kardex] [int] NOT NULL,
	[Clave_Materia] [varchar](4) NOT NULL,
 CONSTRAINT [PK_MATERIAS_CUR] PRIMARY KEY CLUSTERED 
(
	[ID_Kardex] ASC,
	[Clave_Materia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profesor]    Script Date: 07/12/2023 02:38:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profesor](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[P_Nombre] [varchar](30) NOT NULL,
	[P_Apellido_P] [varchar](30) NOT NULL,
	[P_Apellido_M] [varchar](30) NULL,
 CONSTRAINT [PK_ID_PROF] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Secuencias]    Script Date: 07/12/2023 02:38:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Secuencias](
	[Materia_Base] [varchar](4) NOT NULL,
	[Materia_Necesaria] [varchar](4) NOT NULL,
 CONSTRAINT [PK_MateriaBase] PRIMARY KEY CLUSTERED 
(
	[Materia_Base] ASC,
	[Materia_Necesaria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo_Horario]    Script Date: 07/12/2023 02:38:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_Horario](
	[Tipo] [int] NOT NULL,
	[Descripcion] [varchar](10) NOT NULL,
 CONSTRAINT [PK_TIPO] PRIMARY KEY CLUSTERED 
(
	[Tipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Curso]  WITH CHECK ADD  CONSTRAINT [FK_MATERIA] FOREIGN KEY([Clave_Materia])
REFERENCES [dbo].[Materia] ([Clave])
GO
ALTER TABLE [dbo].[Curso] CHECK CONSTRAINT [FK_MATERIA]
GO
ALTER TABLE [dbo].[Curso]  WITH CHECK ADD  CONSTRAINT [FK_PROFESOR] FOREIGN KEY([ID_Profesor])
REFERENCES [dbo].[Profesor] ([ID])
GO
ALTER TABLE [dbo].[Curso] CHECK CONSTRAINT [FK_PROFESOR]
GO
ALTER TABLE [dbo].[Curso_Horario]  WITH CHECK ADD  CONSTRAINT [FK_HORARIO] FOREIGN KEY([Clave_Horario])
REFERENCES [dbo].[Horario] ([Clave_Horario])
GO
ALTER TABLE [dbo].[Curso_Horario] CHECK CONSTRAINT [FK_HORARIO]
GO
ALTER TABLE [dbo].[Curso_Horario]  WITH CHECK ADD  CONSTRAINT [FK_HORARIO_CURSO] FOREIGN KEY([ID_Curso])
REFERENCES [dbo].[Curso] ([ID_Curso])
GO
ALTER TABLE [dbo].[Curso_Horario] CHECK CONSTRAINT [FK_HORARIO_CURSO]
GO
ALTER TABLE [dbo].[Horario_Sugerido]  WITH CHECK ADD  CONSTRAINT [FK_CURSO_HS] FOREIGN KEY([ID_Curso])
REFERENCES [dbo].[Curso] ([ID_Curso])
GO
ALTER TABLE [dbo].[Horario_Sugerido] CHECK CONSTRAINT [FK_CURSO_HS]
GO
ALTER TABLE [dbo].[Horario_Sugerido]  WITH CHECK ADD  CONSTRAINT [FK_KARDEX_HS] FOREIGN KEY([Kardex_HS])
REFERENCES [dbo].[Kardex] ([Numero_Kardex])
GO
ALTER TABLE [dbo].[Horario_Sugerido] CHECK CONSTRAINT [FK_KARDEX_HS]
GO
ALTER TABLE [dbo].[Horario_Sugerido]  WITH CHECK ADD  CONSTRAINT [FK_TIPO_HORARIO] FOREIGN KEY([ID_Tipo_Horario])
REFERENCES [dbo].[Tipo_Horario] ([Tipo])
GO
ALTER TABLE [dbo].[Horario_Sugerido] CHECK CONSTRAINT [FK_TIPO_HORARIO]
GO
ALTER TABLE [dbo].[Kardex]  WITH CHECK ADD  CONSTRAINT [FK_BOLETA] FOREIGN KEY([Boleta_Estudiante])
REFERENCES [dbo].[Estudiante] ([Boleta])
GO
ALTER TABLE [dbo].[Kardex] CHECK CONSTRAINT [FK_BOLETA]
GO
ALTER TABLE [dbo].[Materias_Cursadas]  WITH CHECK ADD  CONSTRAINT [FK_KARDEX] FOREIGN KEY([ID_Kardex])
REFERENCES [dbo].[Kardex] ([Numero_Kardex])
GO
ALTER TABLE [dbo].[Materias_Cursadas] CHECK CONSTRAINT [FK_KARDEX]
GO
ALTER TABLE [dbo].[Materias_Cursadas]  WITH CHECK ADD  CONSTRAINT [FK_MATERIA_CUR] FOREIGN KEY([Clave_Materia])
REFERENCES [dbo].[Materia] ([Clave])
GO
ALTER TABLE [dbo].[Materias_Cursadas] CHECK CONSTRAINT [FK_MATERIA_CUR]
GO
/****** Object:  StoredProcedure [dbo].[Actualizar_Estatus]    Script Date: 07/12/2023 02:38:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--SP PARA ESTATUS UNICAMENTE--------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[Actualizar_Estatus]
  @Boleta INT,
  @Estatus BIT
AS
BEGIN
  -- Declarar e inicializar una variable escalar
  DECLARE @NuevoEstatus BIT;
  SET @NuevoEstatus = @Estatus;

  -- Actualizar un dato en la tabla utilizando la variable escalar
  UPDATE Estudiante
  SET Estatus = @NuevoEstatus
  WHERE Boleta = @Boleta;
END;
GO
/****** Object:  StoredProcedure [dbo].[Actualizar_Estudiante]    Script Date: 07/12/2023 02:38:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- SP DE ACTUALIZAR ESTUDIANTE-------------------------
CREATE PROCEDURE [dbo].[Actualizar_Estudiante]
	@BoletaOriginal int,
	@Boleta int ,
	@E_Nombre varchar(30) ,
	@E_Apellido_P varchar(30) ,
	@E_Apellido_M varchar(30),
	@Semestre_Actual int ,
	@Estatus bit 

AS
BEGIN 
	
	--DECLARE @BNueva bit;

	IF @Boleta IS NOT NULL AND @BoletaOriginal IS NOT NULL
	BEGIN 
	PRINT 'ENTRO A IF BOLETA';
		DECLARE @NuevoBoleta int;
		SET @NuevoBoleta = @Boleta;
		UPDATE Estudiante 
		SET Boleta = @NuevoBoleta
		WHERE Boleta = @BoletaOriginal;

		set @BoletaOriginal = @Boleta;
	END
	
	IF @E_Nombre IS NOT NULL AND @BoletaOriginal IS NOT NULL --ACTUALIZA NOMBRE
	BEGIN
	PRINT 'ENTRO A IF NOMBRE';
		DECLARE @NuevoNombre varchar(30);
		SET @NuevoNombre = @E_Nombre;
		UPDATE Estudiante
		SET E_Nombre = @NuevoNombre
		WHERE Boleta = @BoletaOriginal;
	END
	IF @E_Apellido_P IS NOT NULL AND @BoletaOriginal IS NOT NULL--ACTUALIZA APELLIDO P
	BEGIN
		DECLARE @NuevoApellidoP varchar(30);
		SET @NuevoApellidoP = @E_Apellido_P;
		UPDATE Estudiante
		SET E_Apellido_P = @NuevoApellidoP
		WHERE Boleta = @BoletaOriginal;
	END
	IF @E_Apellido_M IS NOT NULL  AND @BoletaOriginal IS NOT NULL--ACTUALIZA APELLIDO MATERNO
	BEGIN
		DECLARE @NuevoApellidoM varchar(30);
		SET @NuevoApellidoM = @E_Apellido_M;
		UPDATE Estudiante
		SET E_Apellido_M = @NuevoApellidoM
		WHERE Boleta = @BoletaOriginal;
	END
	IF @Semestre_Actual IS NOT NULL AND @BoletaOriginal IS NOT NULL--ACTUALIZA SEMESTRE A/.
	BEGIN
		DECLARE @NuevoSemestreAct int;
		SET @NuevoSemestreAct = @Semestre_Actual;
		UPDATE Estudiante
		SET Semestre_Actual = @NuevoSemestreAct
		WHERE Boleta = @BoletaOriginal;
	END
	IF @Estatus IS NOT NULL AND @BoletaOriginal IS NOT NULL -- ACTUALIZA ESTATUS TAMBIEN
	BEGIN
		DECLARE @NuevoEstatus bit;
		SET @NuevoEstatus = @Estatus;
		UPDATE Estudiante
		SET Estatus = @NuevoEstatus
		WHERE Boleta = @BoletaOriginal;
	END
END;

GO
/****** Object:  StoredProcedure [dbo].[Actualizar_Profesor]    Script Date: 07/12/2023 02:38:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- SP DE ACTUALIZAR  P R O F E S O R -------------------------
CREATE PROCEDURE [dbo].[Actualizar_Profesor]
@IDOriginal int,
--@IDP int,
@P_Nombre varchar (30) ,
@P_Apellido_P varchar (30) ,
@P_Apellido_M varchar (30)

AS
BEGIN
/**
    IF @IDP IS NOT NULL AND @IDOriginal IS NOT NULL
    BEGIN 
    --PRINT 'ENTRO A IF ID';
        DECLARE @NuevoID int;
        SET @NuevoID = @IDP;
        UPDATE Profesor
        SET ID = @NuevoID
        WHERE ID = @IDOriginal;

        set @IDOriginal = @IDP;
		--SE ACTUALIZA AUTOMATICAMENTE EN EL CURSO DONDE ESTA IMPARTIENDO EL PROFESOR-----------

		UPDATE Curso
		SET ID_Profesor = @NuevoID
		WHERE ID_Profesor = @IDOriginal;

    END
    */
    
    IF @P_Nombre IS NOT NULL AND @IDOriginal IS NOT NULL --ACTUALIZA NOMBRE
    BEGIN
    PRINT 'ENTRO A IF NOMBRE';
        DECLARE @NuevoNombre varchar(30);
        SET @NuevoNombre = @P_Nombre;
        UPDATE Profesor
        SET P_Nombre = @NuevoNombre
        WHERE ID = @IDOriginal;
    END
    IF @P_Apellido_P IS NOT NULL AND @IDOriginal IS NOT NULL--ACTUALIZA APELLIDO P
    BEGIN
        DECLARE @NuevoApellidoP varchar(30);
        SET @NuevoApellidoP = @P_Apellido_P;
        UPDATE Profesor
        SET P_Apellido_P = @NuevoApellidoP
        WHERE ID = @IDOriginal;
    END
    IF @P_Apellido_M IS NOT NULL  AND @IDOriginal IS NOT NULL--ACTUALIZA APELLIDO MATERNO
    BEGIN
        DECLARE @NuevoApellidoM varchar(30);
        SET @NuevoApellidoM = @P_Apellido_M;
        UPDATE Profesor
        SET P_Apellido_M = @NuevoApellidoM
        WHERE ID = @IDOriginal;
    END
END;

GO
/****** Object:  StoredProcedure [dbo].[Agregar_Curso]    Script Date: 07/12/2023 02:38:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Agregar_Curso]
@Grupo varchar(4),
@ID_Profesor int,
@Clave_Materia varchar(4)
AS
BEGIN
	INSERT INTO Curso(Grupo, ID_Profesor,Clave_Materia)
	VALUES (@Grupo, @ID_Profesor, @Clave_Materia)
END;
GO
/****** Object:  StoredProcedure [dbo].[Agregar_Curso_Horario]    Script Date: 07/12/2023 02:38:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Agregar_Curso_Horario]
@ID_Curso int,
@Clave_Horario int
AS
BEGIN	
	INSERT INTO Curso_Horario(ID_Curso, Clave_Horario)
	VALUES (@ID_Curso, @Clave_Horario)
END;
GO
/****** Object:  StoredProcedure [dbo].[Agregar_Estudiante]    Script Date: 07/12/2023 02:38:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Agregar_Estudiante]
@Boleta int,
@E_Nombre varchar (30),
@E_Apellido_P varchar (30),
@E_Apellido_M varchar (30),
@Semestre_Actual int,
@Estatus bit

AS 
BEGIN
	INSERT INTO Estudiante(Boleta, E_Nombre , E_Apellido_P, E_Apellido_M, Semestre_Actual, Estatus)
	VALUES (@Boleta, @E_Nombre, @E_Apellido_P, @E_Apellido_M, @Semestre_Actual, @Estatus);
END;
--FIN DE AGREGAR ESTUDIANTE
GO
/****** Object:  StoredProcedure [dbo].[Agregar_Horario]    Script Date: 07/12/2023 02:38:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Agregar_Horario]
@Tipo int,
@Descripcion varchar(10)

AS
BEGIN
	INSERT INTO Tipo_Horario(Tipo, Descripcion) 
	VALUES (@Tipo, @Descripcion)
END;
GO
/****** Object:  StoredProcedure [dbo].[Agregar_Kardex]    Script Date: 07/12/2023 02:38:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Agregar_Kardex]
@Boleta_Estudiante int
AS
BEGIN
	INSERT INTO Kardex(Boleta_Estudiante)
	VALUES (@Boleta_Estudiante)
END;

GO
/****** Object:  StoredProcedure [dbo].[Agregar_Materia]    Script Date: 07/12/2023 02:38:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Agregar_Materia]
@Clave varchar (10),
@Nombre_Materia varchar (80),
@Tipo_Asignatura varchar(15),
@Nivel int,
@Semestre int,
@Creditos int

AS
BEGIN 
	INSERT INTO Materia(Clave, Nombre_Materia,Tipo_Asignatura, Nivel,Semestre, Creditos)
	VALUES (@Clave, @Nombre_Materia, @Tipo_Asignatura, @Nivel, @Semestre, @Creditos)
END;
GO
/****** Object:  StoredProcedure [dbo].[Agregar_Materias_Cursadas]    Script Date: 07/12/2023 02:38:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Agregar_Materias_Cursadas]
@ID_Kardex int,
@Clave_Materia varchar(4)
AS
BEGIN
	INSERT INTO Materias_Cursadas(ID_Kardex, Clave_Materia)
	VALUES (@ID_Kardex , @Clave_Materia)
END;

GO
/****** Object:  StoredProcedure [dbo].[Agregar_Profesor]    Script Date: 07/12/2023 02:38:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Agregar_Profesor]
@P_Nombre varchar (30),
@P_Apellido_P varchar (30),
@P_Apellido_M varchar (30)

AS 
BEGIN 
	INSERT INTO Profesor(P_Nombre, P_Apellido_P, P_Apellido_M)
	VALUES (@P_Nombre, @P_Apellido_P, @P_Apellido_M)
END;

GO
/****** Object:  StoredProcedure [dbo].[Agregar_Secuencia]    Script Date: 07/12/2023 02:38:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Agregar_Secuencia]
@Materia_Base varchar(4), 
@Materia_Necesaria varchar(4)

AS
BEGIN
	INSERT INTO Secuencias(Materia_Base, Materia_Necesaria)
	VALUES (@Materia_Base, @Materia_Necesaria)
END;
GO
/****** Object:  StoredProcedure [dbo].[Buscar_Curso_Por_Profesor]    Script Date: 07/12/2023 02:38:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Buscar_Curso_Por_Profesor]
    @ProfesorCurso VARCHAR(30)
AS
BEGIN
    SELECT Grupo, ID_Profesor,Clave_Materia
    FROM Curso
    WHERE ID_Profesor = @ProfesorCurso;
END;
GO
/****** Object:  StoredProcedure [dbo].[Buscar_Curso_Por_Semetre_y_Nivel]    Script Date: 07/12/2023 02:38:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Buscar_Curso_Por_Semetre_y_Nivel]
    @Semestre int,
    @Nivel int
AS
BEGIN
	SELECT Clave, Nombre_Materia,Tipo_Asignatura, Nivel, Semestre, Creditos
    FROM Materia
    WHERE Semestre = @Semestre AND Nivel = @Nivel;
END;
GO
/****** Object:  StoredProcedure [dbo].[Buscar_Horarios_Por_Dia]    Script Date: 07/12/2023 02:38:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Consultar una materia por dia--
CREATE PROCEDURE [dbo].[Buscar_Horarios_Por_Dia]
    @DiaSemana VARCHAR(11)
AS
BEGIN
    SELECT Clave_Horario, Hora, Dia
    FROM Horario
    WHERE Dia = @DiaSemana;
END;
GO
/****** Object:  StoredProcedure [dbo].[Buscar_Materia_Por_Clave]    Script Date: 07/12/2023 02:38:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Buscar_Materia_Por_Clave]
    @Clave VARCHAR(4)
AS
BEGIN
    SELECT Clave, Nombre_Materia,Tipo_Asignatura, Nivel, Semestre, Creditos
    FROM Materia
    WHERE Clave = @Clave;
END;
GO
/****** Object:  StoredProcedure [dbo].[Buscar_Materia_Por_Nivel]    Script Date: 07/12/2023 02:38:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Buscar_Materia_Por_Nivel]
    @Nivel int
AS
BEGIN
    SELECT Clave, Nombre_Materia,Tipo_Asignatura, Nivel, Semestre, Creditos
    FROM Materia
    WHERE Nivel = @Nivel;
END;
GO
/****** Object:  StoredProcedure [dbo].[Buscar_Materia_Por_Nombre]    Script Date: 07/12/2023 02:38:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Buscar_Materia_Por_Nombre]
    @NombreMateria VARCHAR(80)
AS
BEGIN
    SELECT Clave, Nombre_Materia,Tipo_Asignatura, Nivel, Semestre, Creditos
    FROM Materia
    WHERE Nombre_Materia = @NombreMateria;
END;
GO
/****** Object:  StoredProcedure [dbo].[Buscar_Materia_Por_Semestre]    Script Date: 07/12/2023 02:38:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Buscar_Materia_Por_Semestre]
    @Semestre int
AS
BEGIN
    SELECT Clave, Nombre_Materia,Tipo_Asignatura, Nivel, Semestre, Creditos
    FROM Materia
    WHERE Semestre = @Semestre;
END;
GO
/****** Object:  StoredProcedure [dbo].[Buscar_Materia_Por_Tipo_Asignatura]    Script Date: 07/12/2023 02:38:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Buscar_Materia_Por_Tipo_Asignatura]
    @Tipo_Asignatura varchar (15)
AS
BEGIN
    SELECT Clave, Nombre_Materia,Tipo_Asignatura, Nivel, Semestre, Creditos
    FROM Materia
    WHERE Tipo_Asignatura  = @Tipo_Asignatura;
END;
GO
/****** Object:  StoredProcedure [dbo].[Buscar_Profesor_Por_Nombre]    Script Date: 07/12/2023 02:38:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Buscar_Profesor_Por_Nombre]
    @Nombre varchar(30)
AS
BEGIN
    SELECT P_Nombre, P_Apellido_P,P_Apellido_M
    FROM Profesor
    WHERE P_Nombre  = @NOmbre;
END;
GO
/****** Object:  StoredProcedure [dbo].[Eliminar_Curso]    Script Date: 07/12/2023 02:38:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[Eliminar_Curso](
@ID_Curso INT 
)
AS 
BEGIN 
	DELETE HS FROM [Horario_Sugerido] HS
	WHERE [ID_Curso] = @ID_Curso

	DELETE CH FROM [Curso_Horario] CH
	WHERE [ID_curso] = @ID_Curso

	DELETE FROM [Curso] 
	WHERE [ID_Curso]= @ID_Curso
END;

GO
/****** Object:  StoredProcedure [dbo].[Eliminar_Curso_Horario]    Script Date: 07/12/2023 02:38:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Eliminar_Curso_Horario](
@ID_curso int,
@Clave_Horario int 
)
AS
BEGIN
 DELETE FROM [Curso_Horario]
 WHERE [ID_curso] = @ID_Curso AND [Clave_Horario] = @Clave_Horario
END

GO
/****** Object:  StoredProcedure [dbo].[Eliminar_Curso_Horario_Sugerido]    Script Date: 07/12/2023 02:38:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Eliminar_Curso_Horario_Sugerido](
@ID_Curso INT
)
AS
BEGIN
	DELETE FROM [Horario_Sugerido]
	WHERE [ID_Curso] = @ID_Curso
END;

GO
/****** Object:  StoredProcedure [dbo].[Eliminar_Materia]    Script Date: 07/12/2023 02:38:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Eliminar_Materia](
@Clave_Materia varchar(4)
)
AS 
BEGIN
	DELETE HS FROM [Horario_Sugerido] HS
	INNER JOIN [Curso] C ON HS.[ID_Curso] =C.[ID_Curso]
	WHERE [Clave_Materia] =@Clave_Materia

	DELETE CH FROM [Curso_Horario] CH
	INNER JOIN [Curso] C ON CH.[ID_curso] = C.[ID_Curso]
	WHERE [Clave_Materia]= @Clave_Materia

	DELETE FROM [Curso] 
	where [Clave_Materia] = @Clave_Materia

	DELETE FROM [Materia] 
	WHERE [Clave] = @Clave_Materia

END


GO
/****** Object:  StoredProcedure [dbo].[Eliminar_Materia_Cursada]    Script Date: 07/12/2023 02:38:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Eliminar_Materia_Cursada](
@ID_Materia varchar(4)
)
AS
BEGIN
	DELETE FROM [Materias_Cursadas]
	WHERE [Clave_Materia] = @ID_Materia
END;

GO
USE [master]
GO
ALTER DATABASE [ProyectoBD] SET  READ_WRITE 
GO
