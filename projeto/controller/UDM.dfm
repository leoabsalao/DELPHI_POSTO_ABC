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
  object cdsRelatorio: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    Left = 385
    Top = 314
    object cdsRelatorioCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object cdsRelatorioDATA: TDateField
      FieldName = 'DATA'
    end
    object cdsRelatorioTANQUE: TStringField
      FieldName = 'TANQUE'
      Size = 50
    end
    object cdsRelatorioBOMBA: TStringField
      FieldName = 'BOMBA'
      Size = 50
    end
    object cdsRelatorioVALOR_TOTAL: TFloatField
      FieldName = 'VALOR_TOTAL'
    end
  end
  object dsRelatorio: TDataSource
    DataSet = cdsRelatorio
    Left = 489
    Top = 306
  end
end
