unit uEstado;
//classe estado

interface
uses uPai,uPais;
  type Estado = class(pai)

  private

  protected
    NomeEstado : string[50];
    UF     : string[2];
    umPais : Pais;
  public
    constructor crieobj;
    destructor destrua_se;
    procedure setNomeEstado(pEstado : string);
    procedure setUF    (pUF     : string);
    procedure setumPais(pPais   : pais);
    function getNomeEstado : string;
    function getUF     : string;
    function getumPais : pais;
    function fornecaClone : estado;
end;

implementation

{ estado }

constructor Estado.crieobj;
begin
  NomeEstado := '';
  UF := '';
  umPais := Pais.crieobj;
  inherited;
end;

destructor Estado.destrua_se;
begin
  umPais.destrua_se;
  inherited;
end;

function Estado.fornecaClone: estado;
begin
  Result := Estado.crieobj;
  Result.codigo := codigo;
  Result.NomeEstado := NomeEstado;
  Result.UF := UF;
  Result.umPais := umPais;
end;

function Estado.getNomeEstado: string;
begin
  Result := NomeEstado;
end;

function Estado.getUF: string;
begin
  Result := UF;
end;

function Estado.getumPais: pais;
begin
  Result := umPais;
end;

procedure Estado.setNomeEstado(pEstado: string);
begin
  NomeEstado := pEstado;
end;

procedure Estado.setUF(pUF: string);
begin
  UF := pUF;
end;

procedure Estado.setumPais(pPais: pais);
begin
  umPais := pPais;
end;

end.


