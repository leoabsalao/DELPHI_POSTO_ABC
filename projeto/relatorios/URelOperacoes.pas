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
    rlb_colunas: TRLBand;
    rlb_detalhe: TRLBand;
    rlb_rodape: TRLBand;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    procedure rlr_abastecimentosAfterPrint(Sender: TObject);
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

procedure TfRelatorioOperacoes.rlr_abastecimentosAfterPrint(
  Sender: TObject);
var
  clRelatorio: IAbastecimento;
begin
  clRelatorio := TAbastecimento.Create;
  clRelatorio.ConsultaOperacoesRelatorio;
end;

end.
