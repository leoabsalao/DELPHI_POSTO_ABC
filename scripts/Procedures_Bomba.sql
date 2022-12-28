-- Insert na tabela de Bomba
CREATE OR ALTER PROCEDURE SP_INSERT_BOMBA (
    P_COD_COMBUSTIVEL INTEGER,
    P_DESCRICAO VARCHAR(100) )


AS
DECLARE VARIABLE V_COUNT INTEGER;
   
BEGIN
	
	SELECT COALESCE(COUNT(*), 0)
	   FROM COMBUSTIVEL
	   WHERE DESCRICAO = :P_DESCRICAO
	  INTO :V_COUNT;
	 
	  IF (V_COUNT = 0) THEN  
	      INSERT INTO BOMBA (
	       					 COD_COMBUSTIVEL,		
	                         DESCRICAO	                           
	                        )
	                        VALUES
	                        (
	                         :P_COD_COMBUSTIVEL,
	                         :P_DESCRICAO
	                        );
	 
 	  ELSE
 	     EXCEPTION EXC_REGISTRO_EXISTENTE;
 	     
END