unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, uUtilits, Vcl.Menus, Vcl.Buttons,
  System.Actions, Vcl.ActnList;

type
  TfPrincipal = class(TForm)
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    MainMenu1: TMainMenu;
    Sistema1: TMenuItem;
    Sair1: TMenuItem;
    Sair2: TMenuItem;
    Abastecimento1: TMenuItem;
    actEventosTela: TActionList;
    actAbrirTelaAbastecimento: TAction;
    Panel2: TPanel;
    btnTelaAbastecimento: TSpeedButton;
    actFinalizarAplicacao: TAction;
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actAbrirTelaAbastecimentoExecute(Sender: TObject);
    procedure actFinalizarAplicacaoExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPrincipal: TfPrincipal;

implementation

{$R *.dfm}

uses UTelaAbastecimento;

procedure TfPrincipal.actAbrirTelaAbastecimentoExecute(Sender: TObject);
begin
  abrirTelaMDI(fTelaAbastecimento, TfTelaAbastecimento);
end;

procedure TfPrincipal.actFinalizarAplicacaoExecute(Sender: TObject);
begin
  If  MessageDlg('Você tem certeza que deseja sair do sistema?',mtConfirmation,[mbyes,mbno],0)=mryes then
     Application.Terminate;
end;

procedure TfPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  actFinalizarAplicacao.Execute;
end;

procedure TfPrincipal.FormShow(Sender: TObject);
begin
   fPrincipal.Caption := 'POSTO ABC - SISTEMA DE CONTROLE DE ABASTECIMENTO ::: Versão do sistema: ' + VersaoInfo;
end;

procedure TfPrincipal.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels[0].Text := 'Hora atual: ' + TimeToStr(time);
  StatusBar1.Panels[1].Text:= 'Data atual: ' + FormatDateTime('dddddd', Date);
end;

end.
