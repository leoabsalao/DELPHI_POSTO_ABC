object DMConex: TDMConex
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 451
  Width = 657
  object FDConex: TFDConnection
    Params.Strings = (
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=FB')
    LoginPrompt = False
    Left = 392
    Top = 40
  end
  object FDQuery: TFDQuery
    Connection = FDConex
    Left = 392
    Top = 104
  end
  object Ds: TDataSource
    DataSet = FDQuery
    Left = 392
    Top = 168
  end
  object FDTrans: TFDTransaction
    Connection = FDConex
    Left = 392
    Top = 240
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 480
    Top = 40
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 488
    Top = 112
  end
  object FDConsultaOperacoes: TFDQuery
    Connection = FDConex
    Left = 489
    Top = 178
  end
  object DsConsulta: TDataSource
    DataSet = FDConsultaRelatorio
    Left = 400
    Top = 328
  end
  object FDConsultaRelatorio: TFDQuery
    Connection = FDConex
    SQL.Strings = (
      '')
    Left = 504
    Top = 328
    object FDConsultaRelatorioDATA: TDateField
      FieldName = 'DATA'
    end
    object FDConsultaRelatorioCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object FDConsultaRelatorioTANQUE: TStringField
      FieldName = 'TANQUE'
      Size = 50
    end
    object FDConsultaRelatorioBOMBA: TStringField
      FieldName = 'BOMBA'
      Size = 50
    end
    object FDConsultaRelatorioVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Size = 10
    end
    object FDConsultaRelatorioVALOR_TOTAL: TFloatField
      FieldName = 'VALOR_TOTAL'
    end
  end
end
