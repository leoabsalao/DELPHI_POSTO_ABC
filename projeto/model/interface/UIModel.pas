unit UIModel;

interface

type
   ICombustivel = interface
   ['{6673865A-93EA-45DD-93E6-C96FA9F1A721}']
     procedure SetCodigo(const value: integer);
     procedure SetDescricao(const value: string);
     procedure SetImposto(const value: real);
     procedure SetValor_Ini(const value: real);

     function GetCodigo: integer;
     function GetDescricao: string;
     function GetImposto: real;
     function GetValor_Ini: real;

     property Codigo: integer read GetCodigo write SetCodigo;
     property Descricao: string read GetDescricao write SetDescricao;
     property Imposto: real read GetImposto write SetImposto;
     property Valor_Ini: real read GetValor_Ini write SetValor_Ini;
   end;

   ITanque = interface
   ['{A3E824AA-2D04-41A5-A6E9-8B79EE6BF72E}']
     procedure SetCodigo(const value: integer);
     procedure SetCod_Combustivel(const value: integer);
     procedure SetDescricao(const value: string);

     function GetCodigo: integer;
     function GetCod_Combustivel: integer;
     function GetDescricao: string;

     property Codigo: integer read GetCodigo write SetCodigo;
     property Cod_Combustivel: integer read GetCod_Combustivel write SetCod_Combustivel;
     property Descricao: string read GetDescricao write SetDescricao;
   end;

   IBomba = interface
   ['{EEF2FC71-CC34-47CC-A509-CC3A4754E19B}']
     procedure SetCodigo(const value: integer);
     procedure SetCod_Tanque(const value: integer);
     procedure SetDescricao(const value: string);

     function GetCodigo: integer;
     function GetCod_Tanque: integer;
     function GetDescricao: string;

     property Codigo: integer read GetCodigo write SetCodigo;
     property Cod_Tanque: integer read GetCod_Tanque write SetCod_Tanque;
     property Descricao: string read GetDescricao write SetDescricao;
   end;

   IAbastecimento = interface
   ['{9537FD63-9874-4C46-A220-8ECE0813A39C}']
     procedure SetCodigo(const value: integer);
     procedure SetCod_Bomba(const value: integer);
     procedure SetDataReg(const value: TDateTime);
     procedure SetQuantLitros(const value: real);
     procedure SetValor(const value: real);
     procedure Salvar;

     function GetCodigo: integer;
     function GetCod_Bomba: integer;
     function GetDataReg: TDateTime;
     function GetQuantLitros: real;
     function GetValor: real;

     property Codigo: integer read GetCodigo write SetCodigo;
     property Cod_Bomba: integer read GetCod_Bomba write SetCod_Bomba;
     property DataReg: TDateTime read GetDataReg write SetDataReg;
     property QuantLitros: real read GetQuantLitros write SetQuantLitros;
     property Valor: real read GetValor write SetValor;
   end;

implementation

uses UDM;

end.
