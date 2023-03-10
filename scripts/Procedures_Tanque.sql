-- INSERIR
CREATE OR ALTER PROCEDURE SP_TANQUE_INSERT (
    P_COD_COMBUSTIVEL INTEGER,
    P_DESCRICAO VARCHAR(100) 
)
AS
  DECLARE VARIABLE V_COUNT INTEGER;
   
BEGIN
	
	SELECT COALESCE(COUNT(*), 0)
	   FROM TANQUE
	   WHERE DESCRICAO = :P_DESCRICAO
	  INTO :V_COUNT;
	 
	  IF (V_COUNT = 0) THEN  
	      INSERT INTO TANQUE (
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

-- DELETE 
CREATE OR ALTER PROCEDURE SP_TANQUE_DELETE (
    P_ID INTEGER 
)
AS
  DECLARE VARIABLE V_COUNT INTEGER;
BEGIN

  SELECT COALESCE(COUNT(*), 0)
	   FROM TANQUE
	   WHERE CODIGO = :P_ID
	  INTO :V_COUNT;
	 
	  IF (V_COUNT > 0) THEN  
	      DELETE FROM TANQUE
	         WHERE CODIGO = :P_ID;	 
 	  ELSE
 	     EXCEPTION EXC_REGISTRO_INEXISTENTE;
 	     
END
--  UPDATE
CREATE OR ALTER PROCEDURE SP_TANQUE_UPDATE(
    P_ID INTEGER,
    P_DESCRICAO VARCHAR(100),
    P_COD_COMBUSTIVEL INTEGER )


AS
   DECLARE VARIABLE V_COUNT INTEGER; 
BEGIN
  	SELECT COALESCE(COUNT(*), 0)
	   FROM TANQUE
	   WHERE CODIGO = :P_ID
	  INTO :V_COUNT;  
	 
	  IF (V_COUNT > 0) THEN  
	      UPDATE
	           TANQUE
	        SET 
	           DESCRICAO       =:P_DESCRICAO,
               COD_COMBUSTIVEL =:P_COD_COMBUSTIVEL
	        WHERE CODIGO       =:P_ID;	 
 	  ELSE
 	     EXCEPTION EXC_REGISTRO_INEXISTENTE;	  
	  
END

-- SELECT 

CREATE OR ALTER PROCEDURE SP_TANQUE_SELECT (
    P_CODIGO INTEGER 
)
RETURNS (
    R_COD_TANQUE INTEGER,
    R_DESC_TANQUE VARCHAR(100),
    R_COD_COMBUST INTEGER,
    R_DESC_COMBUSTIVEL VARCHAR(100),
    R_IMPOSTO FLOAT,
    R_VALOR_INI FLOAT 
)
AS
DECLARE VARIABLE V_COUNT INTEGER;
   
BEGIN
	
	SELECT COALESCE(COUNT(*), 0)
	   FROM TANQUE
	   WHERE CODIGO = :P_CODIGO
	  INTO :V_COUNT;
	 
	  IF (V_COUNT > 0) THEN  
         SELECT 
            t.CODIGO, 
   		    t.DESCRICAO, 
            c.CODIGO, 
            c.DESCRICAO, 
            c.IMPOSTO, 
            c.VALOR_INI  
           FROM TANQUE t, COMBUSTIVEL c
           WHERE t.COD_COMBUSTIVEL = c.CODIGO 
           AND t.CODIGO = :P_CODIGO
         INTO :R_COD_TANQUE, :R_DESC_TANQUE, :R_COD_COMBUST, :R_DESC_COMBUSTIVEL, :R_IMPOSTO, :R_VALOR_INI;
 	  ELSE
 	     EXCEPTION EXC_REGISTRO_INEXISTENTE;
 	     
END

-- REALIZAR TESTES
EXECUTE PROCEDURE SP_TANQUE_INSERT(2,'TANQUE 02')
EXECUTE PROCEDURE SP_TANQUE_UPDATE(1,'TANQUE 01',1)
EXECUTE PROCEDURE SP_TANQUE_DELETE(3)
EXECUTE PROCEDURE SP_TANQUE_SELECT(1)

SELECT * FROM TANQUE t 	