unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.Menus;

type
  TfPrincipal = class(TForm)
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    MainMenu1: TMainMenu;
    Sistema1: TMenuItem;
    Sair1: TMenuItem;
    Sair2: TMenuItem;
    Abastecimento1: TMenuItem;
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPrincipal: TfPrincipal;

implementation

{$R *.dfm}

uses uUtilits;

procedure TfPrincipal.FormShow(Sender: TObject);
begin
   fPrincipal.Caption := 'POSTO ABC - SISTEMA DE CONTROLE DE ABASTECIMENTO ::: Vers�o do sistema: ' + VersaoInfo;
end;

procedure TfPrincipal.Sair1Click(Sender: TObject);
begin
  If  MessageDlg('Voc� tem certeza que deseja sair do sistema?',mtConfirmation,[mbyes,mbno],0)=mryes then
     Application.Terminate;
end;

procedure TfPrincipal.Timer1Timer(Sender: TObject);
begin
   StatusBar1.Panels[0].Text := 'Hora atual: ' + TimeToStr(time);
   StatusBar1.Panels[1].Text := 'Data atual: ' + DateToStr(date);
end;

end.
