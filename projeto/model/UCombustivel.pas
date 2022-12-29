unit UCombustivel;

interface

uses Classes, SysUtils, UIModel;

type

  TCombustivel = class(TInterfacedObject, ICombustivel)
  private
     FCodigo: integer;
     FDescricao: string;
     FImposto: real;
     FValor_Ini: real;

     procedure SetCodigo(const value: integer);
     procedure SetDescricao(const value: string);
     procedure SetImposto(const value: real);
     procedure SetValor_Ini(const value: real);

     function GetCodigo: integer;
     function GetDescricao: string;
     function GetImposto: real;
     function GetValor_Ini: real;

  public
     property Codigo: integer read GetCodigo write SetCodigo;
     property Descricao: string read GetDescricao write SetDescricao;
     property Imposto: real read GetImposto write SetImposto;
     property Valor_Ini: real read GetValor_Ini write SetValor_Ini;

  end;

implementation

{ TCombustivel }

function TCombustivel.GetCodigo: integer;
begin
   Result := FCodigo;
end;

function TCombustivel.GetDescricao: string;
begin
  Result := FDescricao;
end;

function TCombustivel.GetImposto: real;
begin
  Result := FImposto;
end;

function TCombustivel.GetValor_Ini: real;
begin
  Result := FValor_Ini
end;

procedure TCombustivel.SetCodigo(const value: integer);
begin
   FCodigo := value;
end;

procedure TCombustivel.SetDescricao(const value: string);
begin
   FDescricao := value;
end;

procedure TCombustivel.SetImposto(const value: real);
begin
   FImposto := value;
end;

procedure TCombustivel.SetValor_Ini(const value: real);
begin
  FValor_Ini := value;
end;

end.
