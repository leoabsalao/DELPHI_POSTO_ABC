-- INSERIR
CREATE OR ALTER PROCEDURE SP_ABASTECIMENTO_INSERT (
    P_COD_BOMBA INTEGER,
    P_DATA_REG  DATE,
    P_QUANT_LITROS FLOAT,
    P_VALOR FLOAT
)
AS  
BEGIN
	
	      INSERT INTO ABASTECIMENTO (
	       					 COD_BOMBA,		
	                         DATA_REG,
	                         QUANT_LITRO,
	                         VALOR 
	                        )
	                        VALUES
	                        (
	                         :P_COD_BOMBA,
	                         :P_DATA_REG,
	                         :P_QUANT_LITROS,
	                         :P_VALOR
	                        );

END

-- DELETE 
CREATE OR ALTER PROCEDURE SP_ABASTECIMENTO_DELETE (
    P_ID INTEGER    
)
AS
  DECLARE VARIABLE V_COUNT INTEGER;
   
BEGIN
	
	  SELECT COALESCE(COUNT(*), 0)
	   FROM ABASTECIMENTO
	   WHERE CODIGO = :P_ID
	  INTO :V_COUNT;
	  
	  IF (V_COUNT > 0) THEN 
	     DELETE FROM ABASTECIMENTO 
	        WHERE CODIGO = :P_ID;
	  ELSE 
	       EXCEPTION EXC_REGISTRO_INEXISTENTE; 

END
