object fRelatorioOperacoes: TfRelatorioOperacoes
  Left = 0
  Top = 0
  Caption = 'fRelatorioOperacoes'
  ClientHeight = 630
  ClientWidth = 793
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object rlr_abastecimentos: TRLReport
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    AfterPrint = rlr_abastecimentosAfterPrint
    object rlb_cabecalho: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 35
      BandType = btHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLSystemInfo1: TRLSystemInfo
        Left = 7
        Top = 11
        Width = 106
        Height = 16
        Text = ''
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 576
        Top = 13
        Width = 135
        Height = 16
        Alignment = taRightJustify
        Info = itHour
        Text = ''
      end
      object RLLabel1: TRLLabel
        Left = 306
        Top = 6
        Width = 110
        Height = 23
        Caption = 'POSTO ABC '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object rlb_titulo: TRLBand
      Left = 38
      Top = 73
      Width = 718
      Height = 52
      BandType = btTitle
      object RLLabel2: TRLLabel
        Left = 0
        Top = 0
        Width = 718
        Height = 52
        Align = faClient
        Alignment = taCenter
        Caption = 'RELAT'#211'RIO DE ABASTECIMENTOS DI'#193'RIOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -20
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object rlb_colunas: TRLBand
      Left = 38
      Top = 125
      Width = 718
      Height = 28
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLLabel3: TRLLabel
        Left = 7
        Top = 9
        Width = 87
        Height = 15
        Caption = 'Abastecimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel4: TRLLabel
        Left = 129
        Top = 9
        Width = 29
        Height = 15
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel5: TRLLabel
        Left = 218
        Top = 9
        Width = 44
        Height = 15
        Caption = 'Tanque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel6: TRLLabel
        Left = 338
        Top = 9
        Width = 42
        Height = 15
        Caption = 'Bomba'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel7: TRLLabel
        Left = 576
        Top = 9
        Width = 87
        Height = 15
        Caption = 'Valor total (R$)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object rlb_detalhe: TRLBand
      Left = 38
      Top = 153
      Width = 718
      Height = 24
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLDBText1: TRLDBText
        Left = 11
        Top = 4
        Width = 48
        Height = 15
        DataField = 'CODIGO'
        DataSource = DMConex.dsRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 129
        Top = 5
        Width = 33
        Height = 15
        DataField = 'DATA'
        DataSource = DMConex.dsRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText3: TRLDBText
        Left = 218
        Top = 4
        Width = 49
        Height = 15
        DataField = 'TANQUE'
        DataSource = DMConex.dsRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText4: TRLDBText
        Left = 340
        Top = 4
        Width = 45
        Height = 15
        DataField = 'BOMBA'
        DataSource = DMConex.dsRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText5: TRLDBText
        Left = 576
        Top = 5
        Width = 80
        Height = 15
        DataField = 'VALOR_TOTAL'
        DataSource = DMConex.dsRelatorio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
    end
    object rlb_rodape: TRLBand
      Left = 38
      Top = 177
      Width = 718
      Height = 48
      BandType = btColumnFooter
    end
  end
end