-- TABELA DE COMBUSTIVEL -------------------------------
CREATE TABLE COMBUSTIVEL (
  CODIGO INTEGER NOT NULL,
  DESCRICAO VARCHAR(100) NOT NULL,
  IMPOSTO FLOAT,
  VALOR_INI FLOAT,
  PRIMARY KEY(CODIGO)
)

CREATE GENERATOR GEN_COMBUSTIVEL;
SET GENERATOR GEN_COMBUSTIVEL TO 0;

CREATE TRIGGER TR_COMBUST FOR COMBUSTIVEL BEFORE INSERT
AS
BEGIN
    new.CODIGO = GEN_ID(GEN_COMBUSTIVEL, 1);
END

-- TABELA DE BOMBA -------------------------------
CREATE TABLE BOMBA (
  CODIGO INTEGER NOT NULL,
  COD_TANQUE INTEGER NOT NULL,
  DESCRICAO VARCHAR(100) NOT NULL,
  PRIMARY KEY(CODIGO)  
)

ALTER TABLE BOMBA ADD FOREIGN KEY(COD_TANQUE) REFERENCES TANQUE (CODIGO);

CREATE GENERATOR GEN_BOMBA;
SET GENERATOR GEN_BOMBA TO 0;

CREATE TRIGGER TR_BOMBA FOR BOMBA BEFORE INSERT
AS
BEGIN
    new.CODIGO = GEN_ID(GEN_BOMBA, 1);
END


-- TABELA DE TANQUE -------------------------------
CREATE TABLE TANQUE (
  CODIGO INTEGER NOT NULL,
  COD_COMBUSTIVEL INTEGER NOT NULL,
  DESCRICAO VARCHAR(100) NOT NULL,
  PRIMARY KEY(CODIGO)
)

ALTER TABLE TANQUE ADD FOREIGN KEY(COD_COMBUSTIVEL) REFERENCES COMBUSTIVEL (CODIGO);

CREATE GENERATOR GEN_TANQUE;
SET GENERATOR GEN_TANQUE TO 0;

CREATE TRIGGER TR_TANQUE FOR TANQUE BEFORE INSERT
AS
BEGIN
    new.CODIGO = GEN_ID(GEN_TANQUE, 1);
END

-- ABASTECIMENTO -------------------------------
CREATE TABLE ABASTECIMENTO (
  CODIGO INTEGER NOT NULL,
  COD_BOMBA INTEGER NOT NULL,
  DATA_REG DATE NOT NULL,
  QUANT_LITRO FLOAT,
  VALOR FLOAT,
  PRIMARY KEY(CODIGO)
)

ALTER TABLE ABASTECIMENTO ADD FOREIGN KEY(COD_BOMBA) REFERENCES BOMBA (CODIGO);

CREATE GENERATOR GEN_ABASTECIMENTO;
SET GENERATOR GEN_ABASTECIMENTO TO 0;

CREATE TRIGGER TR_ABASTECIMENTO FOR ABASTECIMENTO BEFORE INSERT
AS
BEGIN
    new.CODIGO = GEN_ID(GEN_ABASTECIMENTO, 1);
END




