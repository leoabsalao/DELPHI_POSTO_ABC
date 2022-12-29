-- insert em combustivel
CREATE OR ALTER PROCEDURE SP_INSERE_COMBUSTIVEL(
   P_DESCRICAO VARCHAR(100),
   P_IMPOSTO FLOAT,
   P_VALORINI FLOAT,
   P_VALORFINAL FLOAT
) AS 

   DECLARE VARIABLE V_COUNT INTEGER;
   
BEGIN
	
	SELECT COALESCE(COUNT(*), 0)
	   FROM COMBUSTIVEL
	   WHERE DESCRICAO = :P_DESCRICAO
	  INTO :V_COUNT;
	 
	  IF (V_COUNT = 0) THEN  
	      INSERT INTO COMBUSTIVEL (
	                           DESCRICAO,
	                           IMPOSTO,
	                           VALOR_INI,
	                           VALOR_FINAL
	                           )
	                           VALUES
	                           (
	                            :P_DESCRICAO,
	                            :P_IMPOSTO,
	                            :P_VALORINI,
	                            0
	                           );
	 
 	  ELSE
 	     EXCEPTION EXC_REGISTRO_EXISTENTE;
 	     
END;

-- EXEC SP_INSERE_COMBUSTIVEL('GASOLINA', 4.0, 2.7, 5.0)

-- Delete em combustivel
CREATE OR ALTER PROCEDURE SP_DELETE_COMBUSTIVEL (P_ID INTEGER)
AS
DECLARE VARIABLE V_COUNT INTEGER;
   
BEGIN
	
	SELECT COALESCE(COUNT(*), 0)
	   FROM COMBUSTIVEL
	   WHERE CODIGO = :P_ID
	  INTO :V_COUNT;
	 
	  IF (V_COUNT > 0) THEN  
	      DELETE FROM COMBUSTIVEL 
	         WHERE CODIGO = :P_ID;	 
 	  ELSE
 	     EXCEPTION EXC_REGISTRO_INEXISTENTE;
 	     
END

-- Update em Combustivel
CREATE OR ALTER PROCEDURE SP_UPDATE_COMBUSTIVEL(
   P_ID INTEGER,
   P_DESCRICAO VARCHAR(100),
   P_IMPOSTO FLOAT,
   P_VALORINI FLOAT
  
) AS 

   DECLARE VARIABLE V_COUNT INTEGER;
   
BEGIN
	
	SELECT COALESCE(COUNT(*), 0)
	   FROM COMBUSTIVEL
	   WHERE CODIGO = :P_ID
	  INTO :V_COUNT;
	 
	  IF (V_COUNT > 0) THEN  
	      UPDATE
	         COMBUSTIVEL
	        SET 
	           DESCRICAO =:P_DESCRICAO,
	           IMPOSTO   =:P_IMPOSTO,
	           VALOR_INI =:P_VALORINI	            	          
	        WHERE CODIGO =:P_ID;	 
 	  ELSE
 	     EXCEPTION EXC_REGISTRO_INEXISTENTE;
 	     
END;

-- Consulta combustivel

CREATE OR ALTER PROCEDURE SP_SELECT_COMBUSTIVEL(
    P_CODIGO INTEGER
)
RETURNS (
    R_DESC VARCHAR(100),
    R_IMPOSTO FLOAT,
    R_VALOR_INI FLOAT
)
AS 
   DECLARE VARIABLE V_COUNT INTEGER;
   
BEGIN
	
	SELECT COALESCE(COUNT(*), 0)
	   FROM COMBUSTIVEL
	   WHERE CODIGO = :P_CODIGO
	  INTO :V_COUNT;
	 
	  IF (V_COUNT > 0) THEN  
	     SELECT 
	         C.DESCRICAO, C.IMPOSTO, C.VALOR_INI 
	       FROM COMBUSTIVEL C
           WHERE C.CODIGO = :P_CODIGO
         INTO :R_DESC, :R_IMPOSTO, :R_VALOR_INI;
 	  ELSE
 	     EXCEPTION EXC_REGISTRO_INEXISTENTE;
 	     
END

-- REALIZANDO OS TESTES
EXECUTE PROCEDURE SP_COMBUSTIVEL_INSERT('OLEO', 13, 1.5)
EXECUTE PROCEDURE SP_COMBUSTIVEL_UPDATE(1,'GASOLINA',13,2.5)
EXECUTE PROCEDURE SP_COMBUSTIVEL_DELETE(3)
EXECUTE PROCEDURE SP_COMBUSTIVEL_SELECT(1)

SELECT * FROM COMBUSTIVEL c	





 