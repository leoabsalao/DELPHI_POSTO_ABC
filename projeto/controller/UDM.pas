unit UDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Dialogs,
  FireDAC.Phys.FBDef, FireDAC.Phys.IBBase, FireDAC.Phys.FB, FireDAC.Comp.UI,
  Datasnap.DBClient;

type
  TDMConex = class(TDataModule)
    FDConex: TFDConnection;
    FDQuery: TFDQuery;
    Ds: TDataSource;
    FDTrans: TFDTransaction;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    FDConsultaOperacoes: TFDQuery;
    DsConsulta: TDataSource;
    FDConsultaRelatorio: TFDQuery;
    FDConsultaRelatorioCODIGO: TIntegerField;
    FDConsultaRelatorioTANQUE: TStringField;
    FDConsultaRelatorioBOMBA: TStringField;
    FDConsultaRelatorioDATA: TDateField;
    FDConsultaRelatorioVALOR_TOTAL: TFloatField;
    FDConsultaRelatorioVALOR: TFMTBCDField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMConex: TDMConex;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uUtilits;

{$R *.dfm}

procedure TDMConex.DataModuleCreate(Sender: TObject);
begin
   try
       with FDPhysFBDriverLink1 do
       begin
         VendorLib := LerIni('FIREBIRD', 'ArquivoDLL');
       end;

       with FDConex do
       begin
          close;
          with Params do
          begin
             Values['DriverID']  := LerIni('FIREBIRD', 'Driver');
             Values['Server']    := LerIni('FIREBIRD', 'Server');
             Values['Database']  := LerIni('FIREBIRD', 'Database');
             Values['User_name'] := LerIni('FIREBIRD', 'User');
             Values['Password']  := LerIni('FIREBIRD', 'Password');
             Values['Port']      := LerIni('FIREBIRD', 'Porta');
          end;
          Connected := true;
       end;
   except
      ShowMessage('Ocorreu uma Falha na configuração no Banco Firebird!');
   end;
end;

end.
