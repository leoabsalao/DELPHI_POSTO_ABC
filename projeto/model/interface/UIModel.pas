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

   end;

   IBomba = interface
   ['{EEF2FC71-CC34-47CC-A509-CC3A4754E19B}']

   end;

   IAbastecimento = interface
   ['{9537FD63-9874-4C46-A220-8ECE0813A39C}']

   end;

implementation

end.