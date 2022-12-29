-- INSERIR
CREATE OR ALTER PROCEDURE SP_ABASTECIMENTO_INSERT (
    P_COD_BOMBA INTEGER,    
    P_QUANT_LITROS FLOAT    
)
AS  
   DECLARE VARIABLE V_TOTAL FLOAT; 
   DECLARE VARIABLE V_DATA_REG TIMESTAMP; 
  
BEGIN
	      -- Através do código da bomba, busca os dados necessários p/ o cálculo final do abastecimento.	      
	      SELECT  	           
	             ((c.VALOR_INI + (c.VALOR_INI * (c.IMPOSTO/100))) * :P_QUANT_LITROS) AS VLR_FINAL
              FROM BOMBA b, TANQUE t, COMBUSTIVEL c  
            WHERE b.COD_TANQUE  = t.CODIGO AND c.CODIGO = t.COD_COMBUSTIVEL         
            AND b.CODIGO = :P_COD_BOMBA
	      INTO :V_TOTAL;  
	     
	     -- Selecionando a data atual.
	     SELECT current_timestamp as "DATA_REG"
           FROM  rdb$database
         INTO :V_DATA_REG;
	
	      INSERT INTO ABASTECIMENTO (
	       					 COD_BOMBA,		
	                         DATA_REG,
	                         QUANT_LITRO,
	                         VALOR 
	                        )
	                        VALUES
	                        (
	                         :P_COD_BOMBA,
	                         :V_DATA_REG,
	                         :P_QUANT_LITROS,
	                         :V_TOTAL
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

-- REALIZANDO TESTES
EXECUTE PROCEDURE SP_ABASTECIMENTO_INSERT(4,50)
EXECUTE PROCEDURE SP_ABASTECIMENTO_DELETE(2)

SELECT * FROM ABASTECIMENTO b    
