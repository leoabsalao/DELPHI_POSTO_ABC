unit UBomba;

interface

uses Classes, SysUtils, UIModel;

type

  TBomba = class(TInterfacedObject, IBomba)
  private
     FCodigo: integer;
     FCod_Tanque: integer;
     FDescricao: string;

     procedure SetCodigo(const value: integer);
     procedure SetCod_Tanque(const value: integer);
     procedure SetDescricao(const value: string);

     function GetCodigo: integer;
     function GetCod_Tanque: integer;
     function GetDescricao: string;

  public
     property Codigo: integer read GetCodigo write SetCodigo;
     property Cod_Tanque: integer read GetCod_Tanque write SetCod_Tanque;
     property Descricao: string read GetDescricao write SetDescricao;

  end;

implementation

{ TBomba }

function TBomba.GetCodigo: integer;
begin
    Result := FCodigo;
end;

function TBomba.GetCod_Tanque: integer;
begin
    Result := FCod_Tanque;
end;

function TBomba.GetDescricao: string;
begin
    Result := FDescricao;
end;

procedure TBomba.SetCodigo(const value: integer);
begin
    FCodigo := value;
end;

procedure TBomba.SetCod_Tanque(const value: integer);
begin
    FCod_Tanque := value;
end;

procedure TBomba.SetDescricao(const value: string);
begin
    FDescricao := value;
end;

end.
