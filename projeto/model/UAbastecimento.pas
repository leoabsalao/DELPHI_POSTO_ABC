unit UAbastecimento;

interface

uses Classes, SysUtils, UIModel;

type

  TAbastecimento = class(TInterfacedObject, IAbastecimento)
  private
     FCodigo: integer;
     FCod_Bomba: integer;
     FDataReg: TDateTime;
     FQuantLitros: real;
     FValor: real;

     procedure SetCodigo(const value: integer);
     procedure SetCod_Bomba(const value: integer);
     procedure SetDataReg(const value: TDateTime);
     procedure SetQuantLitros(const value: real);
     procedure SetValor(const value: real);

     function GetCodigo: integer;
     function GetCod_Bomba: integer;
     function GetDataReg: TDateTime;
     function GetQuantLitros: real;
     function GetValor: real;

  public
     property Codigo: integer read GetCodigo write SetCodigo;
     property Cod_Bomba: integer read GetCod_Bomba write SetCod_Bomba;
     property DataReg: TDateTime read GetDataReg write SetDataReg;
     property QuantLitros: real read GetQuantLitros write SetQuantLitros;
     property Valor: real read GetValor write SetValor;

  end;

implementation

{ TAbastecimento }

function TAbastecimento.GetCodigo: integer;
begin
    Result := FCodigo;
end;

function TAbastecimento.GetCod_Bomba: integer;
begin
    Result := FCod_Bomba;
end;

function TAbastecimento.GetDataReg: TDateTime;
begin
    Result := FDataReg;
end;

function TAbastecimento.GetQuantLitros: real;
begin
    Result := FQuantLitros;
end;

function TAbastecimento.GetValor: real;
begin
    Result := FValor;
end;

procedure TAbastecimento.SetCodigo(const value: integer);
begin
   FCodigo := value;
end;

procedure TAbastecimento.SetCod_Bomba(const value: integer);
begin
    FCod_Bomba := value;
end;

procedure TAbastecimento.SetDataReg(const value: TDateTime);
begin
    FDataReg :=  value;
end;

procedure TAbastecimento.SetQuantLitros(const value: real);
begin
    FQuantLitros := value;
end;

procedure TAbastecimento.SetValor(const value: real);
begin
    FValor := value;
end;

end.