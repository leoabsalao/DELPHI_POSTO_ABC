object fTelaAbastecimento: TfTelaAbastecimento
  Left = 0
  Top = 0
  Caption = 'POSTO ABC ::: Abastecer Ve'#237'culos'
  ClientHeight = 519
  ClientWidth = 1450
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'MS Reference Sans Serif'
  Font.Style = [fsBold]
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1450
    Height = 89
    Align = alTop
    Color = clActiveCaption
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 697
    object Label1: TLabel
      Left = 1
      Top = 1
      Width = 1448
      Height = 87
      Align = alClient
      Alignment = taCenter
      Caption = 'ABASTECIMENTO'
      Color = clInfoBk
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -64
      Font.Name = 'Consolas'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
      ExplicitWidth = 455
      ExplicitHeight = 75
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 89
    Width = 1450
    Height = 430
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 1
    ExplicitWidth = 697
    ExplicitHeight = 431
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 1448
      Height = 428
      ActivePage = TabOperacao
      Align = alClient
      TabOrder = 0
      ExplicitHeight = 485
      object TabOperacao: TTabSheet
        Caption = 'Opera'#231#227'o'
        object Label2: TLabel
          Left = 61
          Top = 26
          Width = 95
          Height = 19
          Caption = 'N'#186' BOMBA:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Reference Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblData: TLabel
          Left = 266
          Top = 26
          Width = 5
          Height = 16
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'MS Reference Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblHora: TLabel
          Left = 266
          Top = 48
          Width = 5
          Height = 16
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'MS Reference Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblValorTotal: TLabel
          Left = 349
          Top = 272
          Width = 242
          Height = 41
          Caption = 'R$ 0,00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -29
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtNumeroBomba: TEdit
          Left = 61
          Top = 48
          Width = 121
          Height = 28
          Hint = 'Digite o N'#186' da Bomba para prosseguir com o abastecimento'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Reference Sans Serif'
          Font.Style = [fsBold]
          NumbersOnly = True
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Text = '0'
        end
        object edtDesc: TLabeledEdit
          Left = 61
          Top = 110
          Width = 532
          Height = 24
          Color = clSilver
          EditLabel.Width = 145
          EditLabel.Height = 16
          EditLabel.Caption = 'Descri'#231#227'o da Bomba'
          ReadOnly = True
          TabOrder = 2
        end
        object edtCombutivel: TLabeledEdit
          Left = 61
          Top = 165
          Width = 282
          Height = 24
          Color = clSilver
          EditLabel.Width = 88
          EditLabel.Height = 16
          EditLabel.Caption = 'Combustivel'
          ReadOnly = True
          TabOrder = 3
        end
        object edtImposto: TLabeledEdit
          Left = 349
          Top = 165
          Width = 244
          Height = 24
          Color = clSilver
          EditLabel.Width = 78
          EditLabel.Height = 16
          EditLabel.Caption = 'Imposto %'
          ReadOnly = True
          TabOrder = 4
        end
        object edtValorIni: TLabeledEdit
          Left = 349
          Top = 224
          Width = 244
          Height = 24
          Color = clSilver
          EditLabel.Width = 235
          EditLabel.Height = 16
          EditLabel.Caption = 'Valor por Litro/Combust'#237'vel R$/L'
          ReadOnly = True
          TabOrder = 5
          Text = '0,00'
        end
        object edtQuantLitros: TLabeledEdit
          Left = 64
          Top = 224
          Width = 279
          Height = 24
          EditLabel.Width = 108
          EditLabel.Height = 16
          EditLabel.Caption = 'Quant./Litro(s)'
          TabOrder = 1
          OnKeyDown = edtQuantLitrosKeyDown
          OnKeyPress = edtQuantLitrosKeyPress
        end
        object Panel3: TPanel
          Left = 68
          Top = 339
          Width = 525
          Height = 41
          BevelOuter = bvNone
          TabOrder = 6
          object btnRegistrar: TSpeedButton
            Left = 263
            Top = 1
            Width = 128
            Height = 37
            Caption = 'Registrar'
            Enabled = False
            OnClick = btnRegistrarClick
          end
          object btnCancelar: TSpeedButton
            Left = 395
            Top = 1
            Width = 128
            Height = 37
            Caption = 'Cancelar'
            OnClick = btnCancelarClick
          end
        end
        object PageControl2: TPageControl
          Left = 608
          Top = 26
          Width = 829
          Height = 351
          ActivePage = TabSheet1
          TabOrder = 7
          object TabSheet1: TTabSheet
            Caption = 'Opera'#231#245'es realizadas'
            object Label3: TLabel
              Left = 288
              Top = 12
              Width = 25
              Height = 16
              Caption = 'De:'
            end
            object Label4: TLabel
              Left = 483
              Top = 12
              Width = 30
              Height = 16
              Caption = 'At'#233':'
            end
            object DBGrid1: TDBGrid
              Left = 0
              Top = 34
              Width = 821
              Height = 286
              Align = alBottom
              DataSource = DsOperacoes
              TabOrder = 0
              TitleFont.Charset = ANSI_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -12
              TitleFont.Name = 'MS Reference Sans Serif'
              TitleFont.Style = [fsBold]
            end
            object DateTimePicker1: TDateTimePicker
              Left = 316
              Top = 4
              Width = 153
              Height = 24
              Date = 44925.000000000000000000
              Time = 0.445754305554146400
              TabOrder = 1
            end
            object DateTimePicker2: TDateTimePicker
              Left = 519
              Top = 4
              Width = 157
              Height = 24
              Date = 44925.000000000000000000
              Time = 0.446324710646877100
              TabOrder = 2
            end
            object btnPesquisar: TButton
              Left = 683
              Top = 2
              Width = 137
              Height = 27
              Caption = 'Pesquisar'
              TabOrder = 3
            end
          end
        end
      end
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 24
    Top = 25
  end
  object DsOperacoes: TDataSource
    DataSet = DMConex.FDConsultaOperacoes
    Left = 1177
    Top = 402
  end
end
