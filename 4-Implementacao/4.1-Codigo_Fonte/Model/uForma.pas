unit uForma;

interface
uses uPai;
  type Forma = class(pai)

  private

  protected
    Nome  : string[80];

  public
    constructor crieobj;
    destructor destrua_se;
  
    procedure setNome(pNome : string);
    function getNome  : string;

end;

implementation

{ Forma }

constructor Forma.crieobj;
begin
    self.Nome := '';
    inherited;
end;

destructor Forma.destrua_se;
begin
    inherited;
end;

function Forma.getNome: string;
begin
    Result := self.Nome;
end;

procedure Forma.setNome(pNome: string);
begin
   self.Nome := pNome;
end;

end.
