
CREATE OR ALTER PROCEDURE AsignarTurnoHorario
	@Kardex int
	AS
	BEGIN
		DECLARE @THorario int 
		DECLARE @Grupo varchar(5)
		DECLARE @NoElementos int = 0
		DECLARE @Id_Curso INT -- La variable para almacenar 

		SET @THorario = RAND()+1;

		IF(@THorario = 1)
		BEGIN   
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
				DELETE @cursosV WHERE Id_curso = @Id_Curso
				SET @CountV  = (SELECT COUNT(*) FROM @cursosV)
			END;
		END;
END;










