object fPrincipal: TfPrincipal
  Left = 0
  Top = 0
  Align = alClient
  Caption = 'fPrincipal'
  ClientHeight = 761
  ClientWidth = 1184
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Reference Sans Serif'
  Font.Style = [fsBold]
  FormStyle = fsMDIForm
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object StatusBar1: TStatusBar
    Left = 0
    Top = 742
    Width = 1184
    Height = 19
    Panels = <
      item
        Text = 'Hora atual:'
        Width = 170
      end
      item
        Text = 'Data atual:'
        Width = 300
      end>
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 1072
    Top = 216
  end
  object MainMenu1: TMainMenu
    Left = 1072
    Top = 152
    object Sistema1: TMenuItem
      Caption = 'Sistema'
      object Sair1: TMenuItem
        Caption = 'Sair'
        OnClick = Sair1Click
      end
    end
    object Sair2: TMenuItem
      Caption = 'Movimenta'#231#227'o'
      object Abastecimento1: TMenuItem
        Caption = 'Abastecimento'
      end
    end
  end
end
