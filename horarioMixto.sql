CREATE OR ALTER PROCEDURE Obtener_Cursos
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




CREATE OR ALTER PROCEDURE Validar_SecuenciaMixto
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


CREATE OR ALTER PROCEDURE Agregar_CursoHSP
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


CREATE OR ALTER PROCEDURE BorrarCursoElegido
	@ID_curso int,
	@ID_kardex int
	AS
	BEGIN
		DELETE FROM [dbo].[Horario_Sugerido] WHERE ID_Curso = @ID_curso AND Kardex_HS =@ID_kardex;
	END;

	 


