CREATE OR ALTER TRIGGER InsertarAlumnoKardex
ON [dbo].[Estudiante]
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
	DECLARE @Boleta varchar(10);
	DECLARE @Semestre INT;
    -- Insertar el nuevo elemento en TablaDestino
	SET @Boleta =(SELECT [Boleta] FROM inserted)
	Exec Agregar_Kardex @Boleta_Estudiante = @Boleta
	SET @Semestre = (SELECT [Semestre_Actual] FROM inserted)

	IF(@Semestre = 1)
	BEGIN
		DECLARE @Kardex INT;
		SET @Kardex = (SELECT [Numero_Kardex] FROM [dbo].[Kardex] 
		WHERE [Boleta_Estudiante] = @Boleta);
	  EXEC AsignarTurnoHorario @kardex = @Kardex
	END;
END;



EXEC Agregar_Estudiante
'2023654707',
'Jose Luis',
'Carrillo',
'Zuarez',
1,
1;


select* from Estudiante
select* from [dbo].[Kardex]
select * from [dbo].[Horario_Sugerido]
delete from [dbo].[Horario_Sugerido]
delete from [dbo].[Kardex]
delete from [dbo].[Estudiante]


select * from Horario_Sugerido HS 
INNER JOIN [dbo].[Curso_Horario] CH ON HS.ID_Curso = CH.ID_Curso
INNER JOIN [dbo].[Horario] H ON H.Clave_Horario = CH.Clave_Horario