unit UTelaAbastecimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Buttons;

type
  TfTelaAbastecimento = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    Timer1: TTimer;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label2: TLabel;
    edtNumeroBomba: TEdit;
    edtDesc: TLabeledEdit;
    edtCombutivel: TLabeledEdit;
    edtImposto: TLabeledEdit;
    edtValorIni: TLabeledEdit;
    edtQuantLitros: TLabeledEdit;
    edtValorTotal: TLabeledEdit;
    Panel3: TPanel;
    TabSheet2: TTabSheet;
    lblData: TLabel;
    lblHora: TLabel;
    btnRegistrar: TSpeedButton;
    btnCancelar: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure edtNumeroBombaExit(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    procedure apagarDadosAbastecimento;
  public
    { Public declarations }
    procedure consultaBomba(codigoBomba: integer);
  end;

var
  fTelaAbastecimento: TfTelaAbastecimento;

implementation

{$R *.dfm}

uses UAbastecimento, UDM, UIModel, uUtilits;

procedure TfTelaAbastecimento.apagarDadosAbastecimento;
begin
    edtNumeroBomba.Text := '0';
    edtNumeroBomba.SetFocus;
    edtDesc.Clear;
    edtCombutivel.Clear;
    edtImposto.Text := '0,00';
    edtValorIni.Text := '0,00';
    edtValorTotal.Text := '0,00';
end;

procedure TfTelaAbastecimento.btnCancelarClick(Sender: TObject);
begin
  apagarDadosAbastecimento;
end;

procedure TfTelaAbastecimento.consultaBomba(codigoBomba: integer);
var
   clAbastecimento : IAbastecimento;
begin
  clAbastecimento := TAbastecimento.Create;
  with  DMConex.FDQuery do begin
     close;
     SQL.Text := 'SELECT b.DESCRICAO as BOMBA, c.DESCRICAO as COMBUSTIVEL,c.IMPOSTO,c.VALOR_INI '+
                 'FROM BOMBA b, TANQUE t, COMBUSTIVEL c '+
                 'WHERE b.COD_TANQUE  = t.CODIGO AND t.COD_COMBUSTIVEL = c.CODIGO '+
                 'AND b.CODIGO = '+IntToStr(codigoBomba)+'  ';
     Open;
     if RecordCount = 1 then
     begin
        edtDesc.Text := FieldByName('BOMBA').AsString;
        edtCombutivel.Text := FieldByName('COMBUSTIVEL').AsString;
        edtImposto.Text := FloatToStr(FieldByName('IMPOSTO').AsVariant);
        edtValorIni.Text := FloatToStr(FieldByName('VALOR_INI').AsVariant);
     end else begin
       ShowMessage('Nenhuma Bomba encontrada');
     end;
  end;
end;

procedure TfTelaAbastecimento.edtNumeroBombaExit(Sender: TObject);
var
   cod : integer;
begin
  cod :=  strtoint(edtNumeroBomba.Text);
  consultaBomba(cod);
end;

procedure TfTelaAbastecimento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action := cafree;
 fTelaAbastecimento := nil;
end;

procedure TfTelaAbastecimento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    Case Key Of
    //  13:  edtQuantLitros.SetFocus; // ENTER
      27:  close;// ESCAPE
    //112: //F1
    //113: //F2
    //114: //F3
    //115: //F4
    //116: //F5
    //117: //F6
    //118: //F7
    //119: //F8
    //120: //F9
    //121: //F10
    //122: //F11
    //  123: //F12
    end;
end;

procedure TfTelaAbastecimento.FormShow(Sender: TObject);
begin
  apagarDadosAbastecimento;
end;

procedure TfTelaAbastecimento.Timer1Timer(Sender: TObject);
begin
   lblHora.Caption := TimeToStr(time);
   lblData.Caption := FormatDateTime('dddddd', Date);
end;

end.
