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
    VendorLib = 'C:\WINDOWS\System\fbclient.dll'
    Left = 488
    Top = 112
  end
end
