unit uPai;
// classe pai, que � a inicial, contendo j� os setters & getters do c�digo

interface
  type Pai = class

  private

  protected
    codigo : integer;

  public
    constructor crieobj;
    destructor destrua_se;
    procedure setCodigo (pCodigo : integer);
    function getCodigo : integer;

end;

implementation

{ pai }

constructor Pai.crieobj;
begin
  codigo := 0;
end;

destructor Pai.destrua_se;
begin
end;

function Pai.getCodigo: integer;
begin
  Result := codigo;
end;

procedure Pai.setCodigo(pCodigo: integer);
begin
  codigo := pCodigo;
end;

end.

