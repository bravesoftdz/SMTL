unit uParcela;

interface
uses uPai, uForma;

  type Parcela = class(Pai)

  private

  protected
     condicao: Integer;
     num: Integer;
     dias: Integer;
     percentual: Real;
     formaPgto: Forma;
     code: string;

  public
    constructor crieobj;
    destructor destrua_se;

    procedure setCode(pCode: string);
    function getCode: string;

    procedure setCondicao(pcondicao: Integer);
    function getCondicao: Integer;

    procedure setNumero(pNumero: Integer);
    function getNumero: Integer;

    procedure setDias(pDias: Integer);
    function getDias: Integer;

    procedure setPercentual(pPerc: Real);
    function getPercentual : Real;

    procedure setForma (pForma: Forma);
    function getForma: Forma;
                             
end;
implementation

{ Parcela }

constructor Parcela.crieobj;
begin
    formaPgto := Forma.crieobj;
    inherited;
end;

destructor Parcela.destrua_se;
begin
   formaPgto.destrua_se;
   inherited;
end;

function Parcela.getCode: string;
begin
    Result:= self.code;
end;

function Parcela.getCondicao: Integer;
begin
   Result := self.condicao;
end;

function Parcela.getDias: Integer;
begin
   Result := self.dias;
end;

function Parcela.getForma: Forma;
begin
   Result := self.formaPgto;
end;

function Parcela.getNumero: Integer;
begin
  Result := self.num;
end;

function Parcela.getPercentual: Real;
begin
   Result := self.percentual;
end;

procedure Parcela.setCode(pCode: string);
begin
    self.code := pCode;
end;

procedure Parcela.setCondicao(pcondicao: Integer);
begin
   self.condicao := pcondicao;
end;

procedure Parcela.setDias(pDias: Integer);
begin
   self.dias := pDias;
end;

procedure Parcela.setForma(pForma: Forma);
begin
   self.formaPgto := pForma;
end;

procedure Parcela.setNumero(pNumero: Integer);
begin
   self.num := pNumero;
end;

procedure Parcela.setPercentual(pPerc: Real);
begin
   self.percentual := pPerc;
end;

end.
 