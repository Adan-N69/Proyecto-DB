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



