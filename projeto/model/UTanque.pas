unit UTanque;

interface

uses Classes, SysUtils, UIModel;

type

  TTanque = class(TInterfacedObject, ITanque)
  private
     FCodigo: integer;
     FCod_Combustivel: integer;
     FDescricao: string;

     procedure SetCodigo(const value: integer);
     procedure SetCod_Combustivel(const value: integer);
     procedure SetDescricao(const value: string);

     function GetCodigo: integer;
     function GetCod_Combustivel: integer;
     function GetDescricao: string;

  public
     property Codigo: integer read GetCodigo write SetCodigo;
     property Cod_Combustivel: integer read GetCod_Combustivel write SetCod_Combustivel;
     property Descricao: string read GetDescricao write SetDescricao;

  end;

implementation

{ TTanque }

function TTanque.GetCodigo: integer;
begin
    Result := FCodigo;
end;

function TTanque.GetCod_Combustivel: integer;
begin
    Result := FCod_Combustivel;
end;

function TTanque.GetDescricao: string;
begin
    Result := FDescricao;
end;

procedure TTanque.SetCodigo(const value: integer);
begin
    FCodigo := value;
end;

procedure TTanque.SetCod_Combustivel(const value: integer);
begin
    FCod_Combustivel := value;
end;

procedure TTanque.SetDescricao(const value: string);
begin
    FDescricao := value;
end;

end.
