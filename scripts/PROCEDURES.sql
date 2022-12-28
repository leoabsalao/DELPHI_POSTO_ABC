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


--CREATE EXCEPTION EXC_REGISTRO_EXISTENTE 'REGISTRO JÁ CADASTRADO';


-- EXEC SP_INSERE_COMBUSTIVEL('GASOLINA', 4.0, 2.7, 5.0)

 