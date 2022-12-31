unit UTelaAbastecimento;

interface

uses
  Data.DB,

  System.Classes,
  System.SysUtils,
  System.Variants,

  Vcl.Buttons,
  Vcl.ComCtrls,
  Vcl.Controls,
  Vcl.DBGrids,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.Forms,
  Vcl.Graphics,
  Vcl.Grids,
  Vcl.StdCtrls,

  Winapi.Messages,
  Winapi.Windows, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Datasnap.DBClient;

type
  TfTelaAbastecimento = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    Timer1: TTimer;
    PageControl1: TPageControl;
    TabOperacao: TTabSheet;
    Label2: TLabel;
    edtNumeroBomba: TEdit;
    edtDesc: TLabeledEdit;
    edtCombutivel: TLabeledEdit;
    edtImposto: TLabeledEdit;
    edtValorIni: TLabeledEdit;
    edtQuantLitros: TLabeledEdit;
    Panel3: TPanel;
    lblData: TLabel;
    lblHora: TLabel;
    btnRegistrar: TSpeedButton;
    btnCancelar: TSpeedButton;
    lblValorTotal: TLabel;
    PageControl2: TPageControl;
    TabSheet1: TTabSheet;
    DBGrid1: TDBGrid;
    DsOperacoes: TDataSource;
    btnRelatorio: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtQuantLitrosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnRegistrarClick(Sender: TObject);
    procedure edtQuantLitrosKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnRelatorioClick(Sender: TObject);
  private
    { Private declarations }
    procedure apagarDadosAbastecimento;
  public
    { Public declarations }
    procedure consultaBomba(codigoBomba: string);
    procedure salvarAbastecimento;
    procedure habilitaBotaoRegistrar(flag : boolean);
    procedure consultaOperacoesTelaAbastecimento;
    function calculoTotalAbastece(vPrecoCombustivel:string; vImposto: string; vQuantLitros:string):string;
  end;

var
  fTelaAbastecimento: TfTelaAbastecimento;

implementation

{$R *.dfm}

uses UAbastecimento, UDM, UIModel, uUtilits, URelOperacoes;

procedure TfTelaAbastecimento.apagarDadosAbastecimento;
begin
    edtNumeroBomba.Text := '0';
    edtNumeroBomba.SetFocus;
    edtDesc.Clear;
    edtCombutivel.Clear;
    edtImposto.Text := '0,00';
    edtValorIni.Text := '0,00';
    edtQuantLitros.Text := '0';
    lblValorTotal.Caption := 'R$ 0,00';
    habilitaBotaoRegistrar(false);
end;

procedure TfTelaAbastecimento.btnCancelarClick(Sender: TObject);
begin
  apagarDadosAbastecimento;
end;

procedure TfTelaAbastecimento.btnRegistrarClick(Sender: TObject);
begin
   SalvarAbastecimento;
end;

procedure TfTelaAbastecimento.btnRelatorioClick(Sender: TObject);
begin
  fRelatorioOperacoes := TfRelatorioOperacoes.Create(self);
  fRelatorioOperacoes.rlr_abastecimentos.Preview();
end;

function TfTelaAbastecimento.calculoTotalAbastece(vPrecoCombustivel,
  vImposto, vQuantLitros: string): string;
var
   PrecoCombustivel, QuantLitros, Imposto, ValorTotal : real;
begin
   PrecoCombustivel := StrToFloat(vPrecoCombustivel);
   QuantLitros := StrToFloat(vQuantLitros);
   Imposto := StrToFloat(vImposto);

   ValorTotal := (( PrecoCombustivel + (PrecoCombustivel * (Imposto/100))) * QuantLitros);
   result := formatfloat('R$ ###,##0.00', ValorTotal);

   habilitaBotaoRegistrar(true);
end;

procedure TfTelaAbastecimento.consultaBomba(codigoBomba: string);
begin
  if (codigoBomba = '') or (codigoBomba = '0') then
  begin
    ShowMessage('Digite um c�digo v�lido!');
    exit;
  end;

  with  DMConex.FDQuery do
  begin
     close;
     SQL.Text := 'SELECT b.DESCRICAO as BOMBA, c.DESCRICAO as COMBUSTIVEL,c.IMPOSTO,c.VALOR_INI '+
                 '   FROM BOMBA b, TANQUE t, COMBUSTIVEL c                                      '+
                 ' WHERE b.COD_TANQUE  = t.CODIGO AND t.COD_COMBUSTIVEL = c.CODIGO              '+
                 ' AND b.CODIGO = '+codigoBomba+'                                               ';
     Open;
     if RecordCount = 1 then
     begin
        edtDesc.Text := FieldByName('BOMBA').AsString;
        edtCombutivel.Text := FieldByName('COMBUSTIVEL').AsString;
        edtImposto.Text := FloatToStr(FieldByName('IMPOSTO').AsVariant);
        edtValorIni.Text := formatfloat('###,##0.00', FieldByName('VALOR_INI').AsVariant);
        edtQuantLitros.SetFocus;
     end else begin
       ShowMessage('Nenhuma Bomba encontrada');
       apagarDadosAbastecimento;
     end;
  end;
end;

procedure TfTelaAbastecimento.consultaOperacoesTelaAbastecimento;
var
  clOperacoes: IAbastecimento;
begin
  clOperacoes := TAbastecimento.Create;
  clOperacoes.ConsultaOperacoes;
end;

procedure TfTelaAbastecimento.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if not odd(DMConex.FDConsultaOperacoes.RecNo) then
      if not (gdSelected in State) then
      begin
          DBGrid1.Canvas.Brush.Color := clGradientInactiveCaption;
          DBGrid1.Canvas.FillRect(Rect);
          DBGrid1.DefaultDrawDataCell(rect,Column.Field,state);
      end;
end;

procedure TfTelaAbastecimento.edtQuantLitrosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  Case Key Of
    13:  lblValorTotal.Caption := calculoTotalAbastece(edtValorIni.Text, edtImposto.Text, edtQuantLitros.Text);
  end;
end;

procedure TfTelaAbastecimento.edtQuantLitrosKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not (key in ['0'..'9',',',#8]) then
    key := #0;
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
    13:  consultaBomba(edtNumeroBomba.Text); // ENTER
    27:  close;// ESCAPE
  end;
end;

procedure TfTelaAbastecimento.FormShow(Sender: TObject);
begin
  apagarDadosAbastecimento;
  consultaOperacoesTelaAbastecimento;
end;

procedure TfTelaAbastecimento.habilitaBotaoRegistrar(flag: boolean);
begin
   btnRegistrar.Enabled := flag;
end;

procedure TfTelaAbastecimento.salvarAbastecimento;
var
  clAbastecimento: IAbastecimento;
begin
  clAbastecimento := TAbastecimento.Create;

  if (edtNumeroBomba.Text <> '') and (edtDesc.Text <> '') and (edtCombutivel.Text <> '') and
     (edtImposto.Text <> '') and (edtQuantLitros.Text <> '') and (edtValorIni.Text <> '') and
     (edtQuantLitros.Text <> '0') and (edtNumeroBomba.Text <> '0') then
  begin
    clAbastecimento.Cod_Bomba := StrToInt(edtNumeroBomba.Text);
    clAbastecimento.QuantLitros := StrToFloat(edtQuantLitros.Text);
    clAbastecimento.Salvar;
    apagarDadosAbastecimento;
  end else
  begin
    ShowMessage('Todos os campos precisam estar preenchidos!');
  end;
end;

procedure TfTelaAbastecimento.Timer1Timer(Sender: TObject);
begin
   lblHora.Caption := TimeToStr(time);
   lblData.Caption := FormatDateTime('dddddd', Date);
end;

end.
