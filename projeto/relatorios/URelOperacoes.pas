unit URelOperacoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport;

type
  TfRelatorioOperacoes = class(TForm)
    rlr_abastecimentos: TRLReport;
    rlb_cabecalho: TRLBand;
    rlb_titulo: TRLBand;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    rlr_group: TRLGroup;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLDBText2: TRLDBText;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBResult1: TRLDBResult;
    RLDBText3: TRLDBText;
    RLLabel5: TRLLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelatorioOperacoes: TfRelatorioOperacoes;

implementation

{$R *.dfm}

uses UDM, UTelaAbastecimento, UAbastecimento, UIModel;

end.
