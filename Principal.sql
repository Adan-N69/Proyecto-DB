CREATE OR ALTER PROCEDURE Validar_TipoMateria
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
				EXECUTE generar_horario @Clave_Materia, @Tipo_Horario, @KardexVT;
			END

		END

		ELSE IF EXISTS(SELECT Clave FROM [dbo].[Materia]  WHERE Tipo_Asignatura = 'OPTATIVA I' AND Clave = @Clave_Materia)
		BEGIN 
			
			DECLARE @Cont_Optativas1 int = (SELECT COUNT(*) FROM [dbo].[Materias_Cursadas] MC 
					INNER JOIN [dbo].[Materia] M ON Mc.Clave_Materia = M.Clave
					WHERE M.Tipo_Asignatura = 'OPTATIVA I' AND [ID_Kardex] = @KardexVT);

			IF(@Cont_Optativas1 < 1)
			BEGIN
				EXECUTE generar_horario @Clave_Materia, @Tipo_Horario, @KardexVT;
					
			END
		END

		ELSE IF EXISTS(SELECT Clave FROM [dbo].[Materia]  WHERE Tipo_Asignatura = 'OPTATIVA II' AND Clave = @Clave_Materia)
		BEGIN
			
			DECLARE @Cont_Optativas2 int= (SELECT count(*) FROM [dbo].[Materias_Cursadas] MC 
					inner join [dbo].[Materia] M ON Mc.Clave_Materia = M.Clave
					where M.Tipo_Asignatura = 'OPTATIVA II' AND [ID_Kardex] = @KardexVT);

			IF(@Cont_Optativas2 < 1)
			BEGIN
				EXECUTE generar_horario @Clave_Materia, @Tipo_Horario, @KardexVT;
			END
		END

		ELSE
		BEGIN
			EXECUTE generar_horario @Clave_Materia, @Tipo_Horario, @KardexVT;
		END
END;


CREATE OR ALTER PROCEDURE Verificar_Secuencia
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

		SELECT @Cont_Cursadas = COUNT(*)
		FROM [dbo].[Materias_Cursadas] M
		INNER JOIN [dbo].[Secuencias]  S ON  M.[Clave_Materia] = S.Materia_Necesaria
		WHERE Materia_Base = @ClaveMateria;

		IF(@Cont_Cursadas = @Total_Secuencia)
		BEGIN
			EXEC Validar_TipoMateria @ClaveMateria, @Tipo_Horario, @KardexVS;
		END
END;


CREATE OR ALTER PROCEDURE ValidarCursada
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



CREATE OR ALTER PROCEDURE Recorrido_Materia
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

CREATE OR ALTER PROCEDURE Generar_Horario
	@Kardex int,
	@Estatus_Alumno bit,
	@Tipo_Horario int
	AS
	BEGIN
		IF(@Estatus_Alumno = 1)
		BEGIN
				EXEC Recorrido_Materia @Kardex, @Tipo_Horario;
		END
END;





CREATE OR ALTER PROCEDURE Asignar_CursosHS
	@ClaveMateria varchar(4),
	@Tipo_Horario int,
	@Kardex int

	AS
	BEGIN 

		DECLARE @CountCursos int;
		DECLARE @CursosActuales int;
		DECLARE @CursoElegido int;
		DECLARE @MateriasHS int;
		
		IF(@Tipo_Horario = 1)
		BEGIN --VALIDA TIPO HORARIO

			SELECT @CountCursos = COUNT(*) FROM [dbo].[Curso] C 
			WHERE C.Clave_Materia = @ClaveMateria and [Grupo] LIKE '%M%';
			
			if(@CountCursos  > 0)
			begin
				
				CREATE TABLE #OpcionesM(ID_Curso int);

				INSERT INTO #OpcionesM(ID_Curso)
				SELECT ID_curso FROM [dbo].[Curso] C 
				WHERE C.Clave_Materia = @ClaveMateria and [Grupo] LIKE '%M%' ORDER BY NEWID();

				SET @CursosActuales = (SELECT COUNT(*) FROM Horario_Sugerido WHERE Kardex_HS = @Kardex);
		
				
				if(@CursosActuales = 0)
				begin
					SET @CursoElegido = (SELECT TOP(1) ID_Curso FROM #OpcionesM );

					INSERT INTO Horario_Sugerido(Kardex_HS, ID_Curso, ID_Tipo_Horario)
					VALUES(@Kardex,@CursoElegido,@Tipo_Horario);
	
				end--IF CURSOS ACTUALES
				
				else  --CASO HORARIO > 0
				begin
						 --RECORRIDO----------------------------------------------------------------------
					declare @table table( Id_Curso int);
					insert into @table(Id_Curso) select ID_Curso from #OpcionesM;

					declare @Count int = (select count(*) from @table);

					SET @MateriasHS =(SELECT COUNT(DISTINCT ID_Curso) FROM Horario_Sugerido);

				
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
	
			end --END IF CURSOS > 0
		
		END--END IF TH = 1
		
		IF(@Tipo_Horario = 2) -----VESPERTINO
		BEGIN --VALIDA TIPO HORARIO

			--DECLARE @CountCursos int;
			--DECLARE @CursosActuales int;
			--DECLARE @CursoElegido int;
			--DECLARE @MateriasHS int;
		

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

					INSERT INTO Horario_Sugerido(Kardex_HS, ID_Curso, ID_Tipo_Horario)
					VALUES(@Kardex,@CursoElegido,@Tipo_Horario);
	
				end--IF CURSOS ACTUALES
				
				else  --CASO HORARIO > 0
				begin
						 --RECORRIDO----------------------------------------------------------------------
					declare @tableV table( Id_Curso int);
					insert into @tableV(Id_Curso) select ID_Curso from #OpcionesV;

					declare @CountV int = (select count(*) from @tableV);

					SET @MateriasHS =(SELECT COUNT(DISTINCT ID_Curso) FROM Horario_Sugerido);

				
					While(@countV > 0 AND @MateriasHS < 7)
					begin

						declare @IdV int = (SELECT TOP(1) Id_Curso FROM @tableV);
					
						IF NOT EXISTS(SELECT Clave_Horario FROM [dbo].[Curso_Horario] WHERE ID_Curso = @idV INTERSECT
						SELECT CH.Clave_Horario FROM Horario_Sugerido HS INNER JOIN Curso_Horario CH 
						ON HS.ID_Curso = CH.ID_Curso WHERE HS.Kardex_HS = @Kardex)
						
						BEGIN	
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




EXEC Recorrido_Materia 6, 1;

select * from [dbo].[Materias_Cursadas] where  ID_Kardex = 6
select * from  [dbo].[Horario_Sugerido]  where [Kardex_HS] = 6
delete from [dbo].[Horario_Sugerido] where [Kardex_HS] = 6


SELECT  C.Grupo, M.Nombre_Materia, P.P_Apellido_P+' '+P.P_Apellido_M+' '+P.P_Nombre AS Profesor, H.Dia, H.Hora FROM Horario_Sugerido HS
INNER JOIN Curso_Horario CH ON CH.ID_Curso = HS.ID_Curso 
INNER JOIN Horario H ON H.Clave_Horario = CH.Clave_Horario
INNER JOIN Curso C ON HS.ID_Curso = C.ID_Curso
INNER JOIN Materia M ON M.Clave = C.Clave_Materia
INNER JOIN Profesor P ON C.ID_Profesor = P.ID
WHERE Kardex_HS = 6 ORDER BY H.Clave_Horario

DELETE FROM Horario_Sugerido














