program POSTOABC;

uses
  Vcl.Forms,
  UPrincipal in 'view\UPrincipal.pas' {fPrincipal},
  uUtilits in 'view\uUtilits.pas',
  UDM in 'controller\UDM.pas' {DMConex: TDataModule},
  UCombustivel in 'model\UCombustivel.pas',
  UTanque in 'model\UTanque.pas',
  UBomba in 'model\UBomba.pas',
  UAbastecimento in 'model\UAbastecimento.pas',
  UIModel in 'model\interface\UIModel.pas',
  UTelaAbastecimento in 'view\UTelaAbastecimento.pas' {fTelaAbastecimento},
  URelOperacoes in 'relatorios\URelOperacoes.pas' {fRelatorioOperacoes};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Posto ABC';
  Application.CreateForm(TDMConex, DMConex);
  Application.CreateForm(TfPrincipal, fPrincipal);
  Application.CreateForm(TfRelatorioOperacoes, fRelatorioOperacoes);
  Application.Run;
end.
