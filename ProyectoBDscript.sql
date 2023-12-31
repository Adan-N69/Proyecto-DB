USE [master]
GO
/****** Object:  Database [ProyectoBD]    Script Date: 19/12/2023 10:42:34 p. m. ******/
CREATE DATABASE [ProyectoBD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProyectoBD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ProyectoBD.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProyectoBD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ProyectoBD_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
/****** Object:  User [usersql]    Script Date: 19/12/2023 10:42:34 p. m. ******/
CREATE USER [usersql] FOR LOGIN [usersql] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Curso]    Script Date: 19/12/2023 10:42:34 p. m. ******/
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
/****** Object:  Table [dbo].[Curso_Horario]    Script Date: 19/12/2023 10:42:35 p. m. ******/
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
/****** Object:  Table [dbo].[Estudiante]    Script Date: 19/12/2023 10:42:35 p. m. ******/
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
/****** Object:  Table [dbo].[Horario]    Script Date: 19/12/2023 10:42:35 p. m. ******/
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
/****** Object:  Table [dbo].[Horario_Sugerido]    Script Date: 19/12/2023 10:42:35 p. m. ******/
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
/****** Object:  Table [dbo].[Kardex]    Script Date: 19/12/2023 10:42:35 p. m. ******/
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
/****** Object:  Table [dbo].[Materia]    Script Date: 19/12/2023 10:42:35 p. m. ******/
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
/****** Object:  Table [dbo].[Materias_Cursadas]    Script Date: 19/12/2023 10:42:35 p. m. ******/
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
/****** Object:  Table [dbo].[Profesor]    Script Date: 19/12/2023 10:42:35 p. m. ******/
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
/****** Object:  Table [dbo].[Secuencias]    Script Date: 19/12/2023 10:42:35 p. m. ******/
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
/****** Object:  Table [dbo].[Tipo_Horario]    Script Date: 19/12/2023 10:42:35 p. m. ******/
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
SET ANSI_PADDING ON
GO
/****** Object:  Index [I_Grupo]    Script Date: 19/12/2023 10:42:35 p. m. ******/
CREATE NONCLUSTERED INDEX [I_Grupo] ON [dbo].[Curso]
(
	[Grupo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_curso]    Script Date: 19/12/2023 10:42:35 p. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [idx_curso] ON [dbo].[Curso]
(
	[Grupo] ASC,
	[Clave_Materia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [I_Curso_Horario]    Script Date: 19/12/2023 10:42:35 p. m. ******/
CREATE NONCLUSTERED INDEX [I_Curso_Horario] ON [dbo].[Curso_Horario]
(
	[Clave_Horario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [I_Apellidos_E]    Script Date: 19/12/2023 10:42:35 p. m. ******/
CREATE NONCLUSTERED INDEX [I_Apellidos_E] ON [dbo].[Estudiante]
(
	[E_Apellido_P] ASC,
	[E_Apellido_M] ASC,
	[E_Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_Boleta]    Script Date: 19/12/2023 10:42:35 p. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [idx_Boleta] ON [dbo].[Kardex]
(
	[Boleta_Estudiante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [I_Nivel]    Script Date: 19/12/2023 10:42:35 p. m. ******/
CREATE NONCLUSTERED INDEX [I_Nivel] ON [dbo].[Materia]
(
	[Nivel] ASC,
	[Nombre_Materia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [I_Nombre_Materia]    Script Date: 19/12/2023 10:42:35 p. m. ******/
CREATE NONCLUSTERED INDEX [I_Nombre_Materia] ON [dbo].[Materia]
(
	[Nombre_Materia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [I_id_Kardex]    Script Date: 19/12/2023 10:42:35 p. m. ******/
CREATE NONCLUSTERED INDEX [I_id_Kardex] ON [dbo].[Materias_Cursadas]
(
	[ID_Kardex] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [I_Apellidos_P]    Script Date: 19/12/2023 10:42:35 p. m. ******/
CREATE NONCLUSTERED INDEX [I_Apellidos_P] ON [dbo].[Profesor]
(
	[P_Apellido_P] ASC,
	[P_Apellido_M] ASC,
	[P_Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_profesor]    Script Date: 19/12/2023 10:42:35 p. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [idx_profesor] ON [dbo].[Profesor]
(
	[P_Nombre] ASC,
	[P_Apellido_P] ASC,
	[P_Apellido_M] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_Desc]    Script Date: 19/12/2023 10:42:35 p. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [idx_Desc] ON [dbo].[Tipo_Horario]
(
	[Descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
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
ALTER TABLE [dbo].[Secuencias]  WITH CHECK ADD  CONSTRAINT [FK_Materia_Base] FOREIGN KEY([Materia_Base])
REFERENCES [dbo].[Materia] ([Clave])
GO
ALTER TABLE [dbo].[Secuencias] CHECK CONSTRAINT [FK_Materia_Base]
GO
ALTER TABLE [dbo].[Secuencias]  WITH CHECK ADD  CONSTRAINT [FK_Materia_Necesesaria] FOREIGN KEY([Materia_Necesaria])
REFERENCES [dbo].[Materia] ([Clave])
GO
ALTER TABLE [dbo].[Secuencias] CHECK CONSTRAINT [FK_Materia_Necesesaria]
GO
/****** Object:  StoredProcedure [dbo].[Actualizar_Estatus]    Script Date: 19/12/2023 10:42:35 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[Actualizar_Estudiante]    Script Date: 19/12/2023 10:42:35 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[Actualizar_Profesor]    Script Date: 19/12/2023 10:42:35 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[Agregar_Curso_Horario]    Script Date: 19/12/2023 10:42:35 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[Agregar_CursoHSP]    Script Date: 19/12/2023 10:42:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[Agregar_CursoHSP]
	@ID_Curso int,
	@Id_Kardex  int,
	@ValidacionAG bit OUTPUT
	AS
		BEGIN
---validar traslapes
--validar si la tabla horario sugerido ya tiee cursos
			DECLARE @CursosActuales int;
			SET @CursosActuales = (SELECT COUNT(*) FROM Horario_Sugerido WHERE Kardex_HS = @Id_Kardex);
		
			if(@CursosActuales = 0) ---si estaba vacia 
				begin
					INSERT INTO Horario_Sugerido(Kardex_HS, ID_Curso, ID_Tipo_Horario)
					VALUES(@Id_Kardex,@ID_Curso,3);
	
				end

				else  --- no esta la tabla vacia
				begin
					IF NOT EXISTS(SELECT Clave_Horario FROM [dbo].[Curso_Horario] WHERE ID_Curso = @ID_Curso INTERSECT
						SELECT CH.Clave_Horario FROM Horario_Sugerido HS INNER JOIN Curso_Horario CH 
						ON HS.ID_Curso = CH.ID_Curso WHERE HS.Kardex_HS = @Id_Kardex)	
					BEGIN	
						INSERT INTO Horario_Sugerido(Kardex_HS, ID_Curso, ID_Tipo_Horario)VALUES(@Id_Kardex,@ID_Curso,3);
						SET @ValidacionAG = 0;
						PRINT('COMPLETADO')
					END -- IF NOT

					ELSE --- hay translapes
					BEGIN
						SET @ValidacionAG = 1;
						PRINT('NO SE PUEDE REALIZAR LA ACCION DEBIDO A TRASLAPES')
						---mostrar msj en java que no se pudo por translapes
					END

				END
		END;
GO
/****** Object:  StoredProcedure [dbo].[Agregar_Estudiante]    Script Date: 19/12/2023 10:42:35 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[Agregar_Horario]    Script Date: 19/12/2023 10:42:35 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[Agregar_Kardex]    Script Date: 19/12/2023 10:42:35 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[Agregar_Materia]    Script Date: 19/12/2023 10:42:35 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[Agregar_Materias_Cursadas]    Script Date: 19/12/2023 10:42:35 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[Agregar_Profesor]    Script Date: 19/12/2023 10:42:35 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[Agregar_Secuencia]    Script Date: 19/12/2023 10:42:35 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[Asignar_CursosHS]    Script Date: 19/12/2023 10:42:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[Asignar_CursosHS]
	@ClaveMateria varchar(4),
	@Tipo_Horario int,
	@Kardex int

	AS
	BEGIN 

		DECLARE @CountCursos int = 0;
		DECLARE @CursosActuales int = 0;
		DECLARE @CursoElegido int = 0;
		DECLARE @MateriasHS int = 0;
		
		IF(@Tipo_Horario = 1)
		BEGIN --VALIDA TIPO HORARIO

			SELECT @CountCursos = COUNT(*) FROM [dbo].[Curso] C 
			WHERE C.Clave_Materia = @ClaveMateria and [Grupo] LIKE '%M%';
	
			
			if(@CountCursos  > 0)
			begin
				---Cursos disponibles de esa materia
				CREATE TABLE #OpcionesM(ID_Curso int);

				INSERT INTO #OpcionesM(ID_Curso)
				SELECT ID_curso FROM [dbo].[Curso] C 
				WHERE C.Clave_Materia = @ClaveMateria and [Grupo] LIKE '%M%' ORDER BY NEWID();

				--validar si la tabla horario sugerido ya tiee cursos
				SET @CursosActuales = (SELECT COUNT(ID_Curso) FROM Horario_Sugerido WHERE Kardex_HS = @Kardex);
				--SELECT* FROM Horario_Sugerido WHERE Kardex_HS = @Kardex
				
				if(@CursosActuales = 0) ---si estaba vacia 
				begin
					SET @CursoElegido = (SELECT TOP(1) ID_Curso FROM #OpcionesM );

					INSERT INTO Horario_Sugerido(Kardex_HS, ID_Curso, ID_Tipo_Horario)
					VALUES(@Kardex,@CursoElegido,@Tipo_Horario);
	
				end--IF CURSOS ACTUALES
				
				else  --CASO HORARIO > 0 no esta vacia
				begin

						 --RECORRIDO----------------------------------------------------------------------
					declare @table table( Id_Curso int);
					insert into @table(Id_Curso) select ID_Curso from #OpcionesM;

					declare @Count int = (select count(*) from @table);

					SET @MateriasHS =(SELECT COUNT(DISTINCT ID_Curso) FROM Horario_Sugerido WHERE [Kardex_HS] = @Kardex);

					print(@Count)
					print(@MateriasHS)
					
					---recorrer curso por cuso de los cursos diponibles y validar que se inserten 6 materias
					While(@count > 0 AND @MateriasHS < 6)
					begin
						declare @Id int = (SELECT TOP(1) Id_Curso FROM @table);
					
						IF NOT EXISTS(SELECT Clave_Horario FROM [dbo].[Curso_Horario] WHERE ID_Curso = @id INTERSECT
						SELECT CH.Clave_Horario FROM Horario_Sugerido HS INNER JOIN Curso_Horario CH 
						ON HS.ID_Curso = CH.ID_Curso WHERE HS.Kardex_HS = @Kardex)
						
						BEGIN	
							INSERT INTO Horario_Sugerido(Kardex_HS, ID_Curso, ID_Tipo_Horario)VALUES(@Kardex,@Id,@Tipo_Horario);			
							BREAK;				
						END -- IF NOT
					
						delete @table where Id_Curso = @Id;
						set @count = (select count(*) from @table);
				
					end --while

				end	--CURSOS ACTUALES > 0
	
			end --END IF CURSOS > 0 */
		
		END--END IF TH = 1
		
		IF(@Tipo_Horario = 2) -----VESPERTINO
		BEGIN --VALIDA TIPO HORARIO

		
			SELECT @CountCursos = COUNT(*) FROM [dbo].[Curso] C 
			WHERE C.Clave_Materia = @ClaveMateria and [Grupo] LIKE '%V%';
			
			if(@CountCursos  > 0)
			begin
				
				CREATE TABLE #OpcionesV(ID_Curso int);

				INSERT INTO #OpcionesV(ID_Curso)
				SELECT ID_curso FROM [dbo].[Curso] C 
				WHERE C.Clave_Materia = @ClaveMateria and [Grupo] LIKE '%V%' ORDER BY NEWID();

				SET @CursosActuales = (SELECT COUNT(*) FROM Horario_Sugerido WHERE Kardex_HS = @Kardex);
		
				
				if(@CursosActuales = 0)
				begin
				
					SET @CursoElegido = (SELECT TOP(1) ID_Curso FROM #OpcionesV );
					print(@ClaveMateria)
					INSERT INTO Horario_Sugerido(Kardex_HS, ID_Curso, ID_Tipo_Horario)
					VALUES(@Kardex,@CursoElegido,@Tipo_Horario);
	
				end--IF CURSOS ACTUALES
				
				else  --CASO HORARIO > 0
				begin
			
						 --RECORRIDO----------------------------------------------------------------------
					declare @tableV table( Id_Curso int);
					insert into @tableV(Id_Curso) select ID_Curso from #OpcionesV;

					declare @CountV int = (select count(*) from @tableV);

					SET @MateriasHS =(SELECT COUNT(DISTINCT ID_Curso) FROM Horario_Sugerido WHERE[Kardex_HS] = @Kardex);
				
					While(@countV > 0 AND @MateriasHS < 6)
					begin

						declare @IdV int = (SELECT TOP(1) Id_Curso FROM @tableV);

					

						IF NOT EXISTS(SELECT Clave_Horario FROM [dbo].[Curso_Horario] WHERE ID_Curso = @idV INTERSECT
						SELECT CH.Clave_Horario FROM Horario_Sugerido HS INNER JOIN Curso_Horario CH 
						ON HS.ID_Curso = CH.ID_Curso WHERE HS.Kardex_HS = @Kardex)
						
						BEGIN
						print(@ClaveMateria)
							INSERT INTO Horario_Sugerido(Kardex_HS, ID_Curso, ID_Tipo_Horario)VALUES(@Kardex,@IdV,@Tipo_Horario);			
							BREAK;				
						END -- IF NOT
					
						delete @tableV where Id_Curso = @IdV;
						set @countV = (select count(*) from @tableV);
				
					end --while

				end	--CURSOS ACTUALES > 0
	
			end --END IF CURSOS > 0
		
		END--END IF TH = 2

END; --END STORE PROCEDURE
GO
/****** Object:  StoredProcedure [dbo].[AsignarTurnoHorario]    Script Date: 19/12/2023 10:42:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[AsignarTurnoHorario]
	@Kardex int
	AS
	BEGIN
		DECLARE @THorario int 
		DECLARE @Grupo varchar(5)
		DECLARE @NoElementos int = 0
		DECLARE @Id_Curso INT -- La variable para almacenar 

		SET @THorario = (SELECT 1 + ABS(CHECKSUM(NEWID()) % 2));

		IF(@THorario = 1)
		BEGIN   
			DECLARE @Materia varchar(5);
			WHILE @NoElementos < 6
			BEGIN
				SET @Grupo = (SELECT TOP 1 Grupo FROM [dbo].[Curso] C
				INNER JOIN Materia M ON C.Clave_Materia = M.Clave
				WHERE M.Semestre = 1 AND [Grupo] LIKE '%M%' ORDER BY NEWID()); 

				SET @NoElementos =(SELECT COUNT(*) FROM [dbo].[Curso]
				WHERE Grupo = @Grupo)
			END;

			DECLARE @cursosM TABLE(Id_curso INT)
			INSERT INTO @cursosM(Id_curso) SELECT  [ID_Curso] FROM Curso WHERE Grupo = @Grupo

			DECLARE @CountM int = (SELECT COUNT(*) FROM @cursosM)
			WHILE(@countM > 0)
			BEGIN
				SET @Id_Curso = (SELECT TOP(1) * FROM @cursosM)
				INSERT INTO [dbo].[Horario_Sugerido] VALUES (@Kardex, @Id_Curso,@THorario)
				SET @Materia =( SELECT Clave_Materia FROM Curso WHERE ID_Curso =@Id_Curso)
				INSERT INTO [dbo].[Materias_Cursadas] VALUES (@Kardex,@Materia)
				DELETE @cursosM WHERE Id_curso = @Id_Curso
				SET @CountM  = (SELECT COUNT(*) FROM @cursosM)
			END;
		END;

		ELSE
		BEGIN
			WHILE @NoElementos < 6
			BEGIN
				SET @Grupo = (SELECT TOP 1 Grupo FROM [dbo].[Curso] C
				INNER JOIN Materia M ON C.Clave_Materia = M.Clave
				WHERE M.Semestre = 1 AND [Grupo] LIKE '%V%' ORDER BY NEWID()); 

				SET @NoElementos =(SELECT COUNT(*) FROM [dbo].[Curso]
				WHERE Grupo = @Grupo)
			END;

			DECLARE @cursosV TABLE(Id_curso INT)
			INSERT INTO @cursosV(Id_curso) SELECT [ID_Curso] FROM Curso WHERE Grupo = @Grupo
			
			DECLARE @CountV int = (SELECT COUNT(*) FROM @cursosV)
			WHILE(@countV > 0)
			BEGIN
				SET @Id_Curso = (SELECT TOP(1) * FROM @cursosV)
				INSERT INTO [dbo].[Horario_Sugerido] VALUES (@Kardex, @Id_Curso,@THorario)
				SET @Materia  =( SELECT Clave_Materia FROM Curso WHERE ID_Curso =@Id_Curso)
				INSERT INTO [dbo].[Materias_Cursadas] VALUES (@Kardex,@Materia)
				DELETE @cursosV WHERE Id_curso = @Id_Curso
				SET @CountV  = (SELECT COUNT(*) FROM @cursosV)
			END;
		END;

		SELECT  C.Grupo, M.Nombre_Materia, P.P_Apellido_P+' '+P.P_Apellido_M+' '+P.P_Nombre AS Profesor, H.Dia, H.Hora FROM Horario_Sugerido HS
				INNER JOIN Curso_Horario CH ON CH.ID_Curso = HS.ID_Curso 
				INNER JOIN Horario H ON H.Clave_Horario = CH.Clave_Horario
				INNER JOIN Curso C ON HS.ID_Curso = C.ID_Curso
				INNER JOIN Materia M ON M.Clave = C.Clave_Materia
				INNER JOIN Profesor P ON C.ID_Profesor = P.ID
				WHERE Kardex_HS = @Kardex ORDER BY H.Clave_Horario
END;

GO
/****** Object:  StoredProcedure [dbo].[BorrarCursoElegido]    Script Date: 19/12/2023 10:42:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[BorrarCursoElegido]
	@ID_curso int,
	@ID_kardex int
	AS
	BEGIN
		DELETE FROM [dbo].[Horario_Sugerido] WHERE ID_Curso = @ID_curso AND Kardex_HS =@ID_kardex;
	
	
	END;
GO
/****** Object:  StoredProcedure [dbo].[Buscar_Curso_Por_Profesor]    Script Date: 19/12/2023 10:42:35 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[Buscar_Curso_Por_Semetre_y_Nivel]    Script Date: 19/12/2023 10:42:35 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[Buscar_Horarios_Por_Dia]    Script Date: 19/12/2023 10:42:35 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[Buscar_Materia_Por_Clave]    Script Date: 19/12/2023 10:42:35 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[Buscar_Materia_Por_Nivel]    Script Date: 19/12/2023 10:42:35 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[Buscar_Materia_Por_Nombre]    Script Date: 19/12/2023 10:42:35 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[Buscar_Materia_Por_Semestre]    Script Date: 19/12/2023 10:42:35 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[Buscar_Materia_Por_Tipo_Asignatura]    Script Date: 19/12/2023 10:42:35 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[Buscar_Profesor_Por_Nombre]    Script Date: 19/12/2023 10:42:35 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[Eliminar_Curso]    Script Date: 19/12/2023 10:42:35 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[Eliminar_Curso_Horario]    Script Date: 19/12/2023 10:42:35 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[Eliminar_Materia]    Script Date: 19/12/2023 10:42:35 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[Eliminar_Materia_Cursada]    Script Date: 19/12/2023 10:42:35 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[Generar_Horario]    Script Date: 19/12/2023 10:42:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[Generar_Horario]
	@Kardex int,
	@Estatus_Alumno bit,
	@Tipo_Horario int
	AS
	BEGIN
		IF(@Estatus_Alumno = 1)
		BEGIN

			DELETE FROM Horario_Sugerido WHERE [Kardex_HS] = @Kardex;
			EXEC Recorrido_Materia @Kardex, @Tipo_Horario;
			---Consulta
			
			SELECT  C.Grupo, M.Nombre_Materia, P.P_Apellido_P+' '+P.P_Apellido_M+' '+P.P_Nombre AS Profesor, H.Dia, H.Hora FROM Horario_Sugerido HS
			INNER JOIN Curso_Horario CH ON CH.ID_Curso = HS.ID_Curso 
			INNER JOIN Horario H ON H.Clave_Horario = CH.Clave_Horario
			INNER JOIN Curso C ON HS.ID_Curso = C.ID_Curso
			INNER JOIN Materia M ON M.Clave = C.Clave_Materia
			INNER JOIN Profesor P ON C.ID_Profesor = P.ID
			WHERE Kardex_HS = @Kardex ORDER BY H.Clave_Horario
		END
END;
GO
/****** Object:  StoredProcedure [dbo].[Obtener_Cursos]    Script Date: 19/12/2023 10:42:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[Obtener_Cursos]
	@Kardex int
	AS
	BEGIN
		---tabla temporal para guardar los cursos
		CREATE TABLE #cursos(
		ID int,
		Grupo varchar(5),
		Materia varchar(80),
		Profesor varchar(70),
		Dia varchar(10),
		Hora varchar(11)
		);

		---recorrer tabla materia
		DECLARE micursor CURSOR FOR
		SELECT Nombre_Materia FROM [dbo].[Materia] ORDER BY Semestre;

		OPEN micursor;

		DECLARE @Materia varchar(80);
		DECLARE @ClaveMateria varchar(4);

		FETCH NEXT FROM miCursor INTO  @Materia;
		WHILE @@FETCH_STATUS = 0
		BEGIN
			SET @ClaveMateria =( SELECT Clave FROM Materia WHERE Nombre_Materia = @Materia);

			---Se verifica que esa materia no este registrada en kardex
			IF NOT EXISTS(SELECT 1 FROM [dbo].[Materias_Cursadas] WHERE Clave_Materia = @ClaveMateria and ID_Kardex = @Kardex)
			BEGIN 

				---Se verifica que la materia sea una elegible
				IF EXISTS(SELECT 1 FROM [dbo].[Materia]  WHERE Tipo_Asignatura = 'ELEGIBLE' AND Clave = @ClaveMateria)
				BEGIN
					---se cuenta cuantos cursos hay de ese tipo en kardex
					DECLARE @Cont_Elegibles INT = (SELECT COUNT(MC.Clave_Materia) FROM [dbo].[Materias_Cursadas] MC 
					INNER JOIN [dbo].[Materia] M ON Mc.Clave_Materia = M.Clave
					WHERE M.Tipo_Asignatura = 'ELEGIBLE' AND  [ID_Kardex]= @Kardex);

					IF(@Cont_Elegibles < 2)
					BEGIN
						INSERT INTO #cursos(ID,Grupo, Materia,Profesor, Dia , Hora)
						SELECT C.[ID_Curso], C.Grupo, M.Nombre_Materia, P.P_Apellido_P+' '+P.P_Apellido_M+' '+P.P_Nombre AS Profesor, H.Dia, H.Hora FROM Curso C
						INNER JOIN Curso_Horario CH ON CH.ID_Curso = C.ID_Curso
						INNER JOIN Horario H ON H.Clave_Horario = CH.Clave_Horario
						INNER JOIN Materia M ON M.Clave = C.Clave_Materia
						INNER JOIN Profesor P ON C.ID_Profesor = P.ID
						WHERE C.Clave_Materia = @ClaveMateria
					END
				END

				--- Se valida que sea una optativa
				ELSE IF EXISTS(SELECT Clave FROM [dbo].[Materia]  WHERE Tipo_Asignatura = 'OPTATIVA I' AND Clave = @ClaveMateria)
				BEGIN 

					DECLARE @Cont_Optativas1 INT = (SELECT COUNT(*) FROM [dbo].[Materias_Cursadas] MC 
					INNER JOIN [dbo].[Materia] M ON Mc.Clave_Materia = M.Clave
					WHERE M.Tipo_Asignatura = 'OPTATIVA I' AND [ID_Kardex] = @Kardex);

					IF(@Cont_Optativas1 < 1)
					BEGIN
						INSERT INTO #cursos(ID,Grupo, Materia,Profesor, Dia , Hora)
						SELECT C.[ID_Curso], C.Grupo, M.Nombre_Materia, P.P_Apellido_P+' '+P.P_Apellido_M+' '+P.P_Nombre AS Profesor, H.Dia, H.Hora FROM Curso C
						INNER JOIN Curso_Horario CH ON CH.ID_Curso = C.ID_Curso
						INNER JOIN Horario H ON H.Clave_Horario = CH.Clave_Horario
						INNER JOIN Materia M ON M.Clave = C.Clave_Materia
						INNER JOIN Profesor P ON C.ID_Profesor = P.ID
						WHERE C.Clave_Materia = @ClaveMateria
					END
				END
				
				ELSE IF EXISTS(SELECT Clave FROM [dbo].[Materia]  WHERE Tipo_Asignatura = 'OPTATIVA II' AND Clave = @ClaveMateria)
				BEGIN

					DECLARE @Cont_Optativas2 INT= (SELECT count(*) FROM [dbo].[Materias_Cursadas] MC 
					inner join [dbo].[Materia] M ON Mc.Clave_Materia = M.Clave
					where M.Tipo_Asignatura = 'OPTATIVA II' AND [ID_Kardex] = @Kardex);

					IF(@Cont_Optativas2 < 1)
					BEGIN
						INSERT INTO #cursos(ID,Grupo, Materia,Profesor, Dia , Hora)
						SELECT C.[ID_Curso], C.Grupo, M.Nombre_Materia, P.P_Apellido_P+' '+P.P_Apellido_M+' '+P.P_Nombre AS Profesor, H.Dia, H.Hora FROM Curso C
						INNER JOIN Curso_Horario CH ON CH.ID_Curso = C.ID_Curso
						INNER JOIN Horario H ON H.Clave_Horario = CH.Clave_Horario
						INNER JOIN Materia M ON M.Clave = C.Clave_Materia
						INNER JOIN Profesor P ON C.ID_Profesor = P.ID
						WHERE C.Clave_Materia = @ClaveMateria
					END
				END

				--si no es ninguna
				ELSE
				BEGIN
						INSERT INTO #cursos(ID,Grupo, Materia,Profesor, Dia , Hora)
						SELECT C.[ID_Curso], C.Grupo, M.Nombre_Materia, P.P_Apellido_P+' '+P.P_Apellido_M+' '+P.P_Nombre AS Profesor, H.Dia, H.Hora FROM Curso C
						INNER JOIN Curso_Horario CH ON CH.ID_Curso = C.ID_Curso
						INNER JOIN Horario H ON H.Clave_Horario = CH.Clave_Horario
						INNER JOIN Materia M ON M.Clave = C.Clave_Materia
						INNER JOIN Profesor P ON C.ID_Profesor = P.ID
						WHERE C.Clave_Materia = @ClaveMateria
				END
			END
			

			FETCH NEXT FROM miCursor INTO  @Materia;

		END; ---end while

		CLOSE miCursor;
		DEALLOCATE miCursor;

		SELECT * FROM #cursos
END;
GO
/****** Object:  StoredProcedure [dbo].[Recorrido_Materia]    Script Date: 19/12/2023 10:42:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[Recorrido_Materia]
	@Kardex int,
	@TipoHorario int
	AS
	BEGIN
	
		declare @table table( [Nombre_Materia] varchar(80), semestre int)
		insert into @table(Nombre_Materia, semestre) select [Nombre_Materia], [Semestre] from Materia 

		declare @Count int = (select count(*) from @table)

		while(@count > 0)
		begin

			declare @Nombre_Materia varchar(80) = (SELECT TOP(1) [Nombre_Materia] FROM @table order by Semestre ASC, NEWID() )
			declare @Semestre INT = (SELECT TOP(1) [Semestre] FROM @table order by Semestre ASC)
			EXEC ValidarCursada @Id_Kardex = @Kardex, @Materia= @Nombre_Materia, @Tipo_Horario =@TipoHorario
			delete @table where [Nombre_Materia] = @Nombre_Materia
			set @count = (select count(*) from @table)
		end
end;
GO
/****** Object:  StoredProcedure [dbo].[Validar_SecuenciaMixto]    Script Date: 19/12/2023 10:42:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[Validar_SecuenciaMixto]
	@ID_Curso int,
	@Id_Kardex  int,
	@Validacion bit OUTPUT

	AS
	BEGIN

		DECLARE @Total_Secuencia int;
		DECLARE @Cont_Cursadas int;
		DECLARE @Clave_Materia varchar(4) = (SELECT Clave_Materia FROM Curso WHERE ID_Curso = @ID_Curso);
	
		SELECT @Total_Secuencia = COUNT(*)
		FROM Secuencias
		WHERE Materia_Base = @Clave_Materia;

		SELECT @Cont_Cursadas = COUNT(*)
		FROM [dbo].[Materias_Cursadas] M
		INNER JOIN [dbo].[Secuencias]  S ON  M.[Clave_Materia] = S.Materia_Necesaria
		WHERE Materia_Base = @Clave_Materia AND M.ID_Kardex = @Id_Kardex;

		IF(@Cont_Cursadas = @Total_Secuencia) --- valida si tiene todas las secuencias
		BEGIN
			SET @Validacion = 0;
			PRINT('PUEDE AGREGARSE')
		END

		ELSE --- No tiene todas las validaciones
		BEGIN 
			 SET @Validacion = 1;
			 PRINT('NO TIENES TODAS LAS SECUENCIAS ¿QUIERES CONTINUAR?')
			--llamar en java mnesje
		--si respuesta es Si llamar a agregar Curso
	
		END
END;

GO
/****** Object:  StoredProcedure [dbo].[Validar_TipoMateria]    Script Date: 19/12/2023 10:42:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[Validar_TipoMateria]
	@Clave_Materia varchar(4),
	@Tipo_Horario int,
	@KardexVT int

	AS
	BEGIN

		IF EXISTS(SELECT Clave FROM [dbo].[Materia]  WHERE Tipo_Asignatura = 'ELEGIBLE' AND Clave = @Clave_Materia)
		BEGIN

			DECLARE @Cont_Elegibles int = (SELECT COUNT(MC.Clave_Materia) FROM [dbo].[Materias_Cursadas] MC 
					INNER JOIN [dbo].[Materia] M ON Mc.Clave_Materia = M.Clave
					WHERE M.Tipo_Asignatura = 'ELEGIBLE' AND  [ID_Kardex]= @KardexVT);

			IF(@Cont_Elegibles < 2)
			BEGIN
				EXECUTE Asignar_CursosHS @Clave_Materia, @Tipo_Horario, @KardexVT;
			END

		END

		ELSE IF EXISTS(SELECT Clave FROM [dbo].[Materia]  WHERE Tipo_Asignatura = 'OPTATIVA I' AND Clave = @Clave_Materia)
		BEGIN 
			
			DECLARE @Cont_Optativas1 int = (SELECT COUNT(*) FROM [dbo].[Materias_Cursadas] MC 
					INNER JOIN [dbo].[Materia] M ON Mc.Clave_Materia = M.Clave
					WHERE M.Tipo_Asignatura = 'OPTATIVA I' AND [ID_Kardex] = @KardexVT);

			IF(@Cont_Optativas1 < 1)
			BEGIN
				EXECUTE  Asignar_CursosHS @Clave_Materia, @Tipo_Horario, @KardexVT;
					
			END
		END

		ELSE IF EXISTS(SELECT Clave FROM [dbo].[Materia]  WHERE Tipo_Asignatura = 'OPTATIVA II' AND Clave = @Clave_Materia)
		BEGIN
			
			DECLARE @Cont_Optativas2 int= (SELECT count(*) FROM [dbo].[Materias_Cursadas] MC 
					inner join [dbo].[Materia] M ON Mc.Clave_Materia = M.Clave
					where M.Tipo_Asignatura = 'OPTATIVA II' AND [ID_Kardex] = @KardexVT);

			IF(@Cont_Optativas2 < 1)
			BEGIN
				EXECUTE Asignar_CursosHS @Clave_Materia, @Tipo_Horario, @KardexVT;
			END
		END

		ELSE
		BEGIN
			EXECUTE Asignar_CursosHS @Clave_Materia, @Tipo_Horario, @KardexVT;
		END
END;
GO
/****** Object:  StoredProcedure [dbo].[ValidarCursada]    Script Date: 19/12/2023 10:42:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ValidarCursada]
	@Id_Kardex int,
	@Materia varchar(80),
	@Tipo_Horario int
	AS 
	BEGIN

		DECLARE @ClaveMateria varchar(4);
		SET @ClaveMateria =( SELECT Clave FROM Materia WHERE Nombre_Materia = @Materia);

		IF NOT EXISTS(SELECT 1 FROM [dbo].[Materias_Cursadas] WHERE Clave_Materia = @ClaveMateria and ID_Kardex = @Id_Kardex)
		BEGIN 
			EXEC Verificar_Secuencia @ClaveMateria, @Tipo_Horario,@Id_Kardex;
		
		END
END;
GO
/****** Object:  StoredProcedure [dbo].[Verificar_Secuencia]    Script Date: 19/12/2023 10:42:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[Verificar_Secuencia]
	@ClaveMateria varchar(4),
	@Tipo_Horario int,
	@KardexVS int

	AS 
	BEGIN
		DECLARE @Total_Secuencia INT;
		DECLARE @Cont_Cursadas INT;

		SELECT @Total_Secuencia = COUNT(*)
		FROM Secuencias
		WHERE Materia_Base = @ClaveMateria;

		SELECT @Cont_Cursadas = COUNT(*) FROM [dbo].[Materias_Cursadas] M
		INNER JOIN [dbo].[Secuencias] S ON  M.[Clave_Materia] = S.Materia_Necesaria
		WHERE Materia_Base = @ClaveMateria and M.ID_Kardex = @KardexVS;

	
		IF(@Cont_Cursadas = @Total_Secuencia)
		BEGIN
			EXEC Validar_TipoMateria @ClaveMateria, @Tipo_Horario, @KardexVS;
			
		END
END;
GO
USE [master]
GO
ALTER DATABASE [ProyectoBD] SET  READ_WRITE 
GO
