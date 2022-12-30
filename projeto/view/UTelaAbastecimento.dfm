object fTelaAbastecimento: TfTelaAbastecimento
  Left = 0
  Top = 0
  Caption = 'POSTO ABC ::: Abastecer Ve'#237'culos'
  ClientHeight = 520
  ClientWidth = 697
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
    Width = 697
    Height = 89
    Align = alTop
    Color = clActiveCaption
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 852
    object Label1: TLabel
      Left = 1
      Top = 1
      Width = 695
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
    Width = 697
    Height = 431
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 1
    ExplicitLeft = 1
    ExplicitTop = 94
    ExplicitWidth = 1422
    ExplicitHeight = 551
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 695
      Height = 429
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      ExplicitLeft = 8
      ExplicitTop = 6
      ExplicitWidth = 680
      ExplicitHeight = 419
      object TabSheet1: TTabSheet
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
          OnExit = edtNumeroBombaExit
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
          EditLabel.Width = 198
          EditLabel.Height = 16
          EditLabel.Caption = 'Valor por Litro/Combust'#237'vel'
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
        end
        object edtValorTotal: TLabeledEdit
          Left = 349
          Top = 286
          Width = 244
          Height = 24
          Color = clSilver
          EditLabel.Width = 163
          EditLabel.Height = 16
          EditLabel.Caption = 'Valor Total da Nota R$'
          ReadOnly = True
          TabOrder = 6
        end
        object Panel3: TPanel
          Left = 68
          Top = 320
          Width = 525
          Height = 41
          BevelOuter = bvNone
          TabOrder = 7
          object btnRegistrar: TSpeedButton
            Left = 268
            Top = 4
            Width = 128
            Height = 37
            Caption = 'Registrar'
          end
          object btnCancelar: TSpeedButton
            Left = 395
            Top = 4
            Width = 128
            Height = 37
            Caption = 'Cancelar'
            OnClick = btnCancelarClick
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Consulta'
        ImageIndex = 1
      end
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 24
    Top = 25
  end
end