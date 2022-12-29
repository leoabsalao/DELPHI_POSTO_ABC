unit UDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Dialogs,
  FireDAC.Phys.FBDef, FireDAC.Phys.IBBase, FireDAC.Phys.FB, FireDAC.Comp.UI;

type
  TDMConex = class(TDataModule)
    FDConex: TFDConnection;
    FDQuery: TFDQuery;
    Ds: TDataSource;
    FDTrans: TFDTransaction;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
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
  { try
       with FDConex do
       begin
          close;
          with Params do
          begin
             Clear;
             Values['DriverID']  := 'FB';
             Values['Server']    := LerIni('FIREBIRD', 'Server');
             Values['Database']  := LerIni('FIREBIRD', 'Database');
             Values['User_name'] := LerIni('FIREBIRD', 'User');
             Values['Password']  := LerIni('FIREBIRD', 'Password');
          end;
          Connected := true;
       end;
   except
      ShowMessage('Ocorreu uma Falha na configuração no Banco Firebird!');
   end;   }
end;

end.
