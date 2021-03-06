unit uCondicao;

interface
  uses uPai, uParcela, uColecaoParcelas;

  type Condicao = class(Pai)

  private

  protected
     nome : string[40];

  public
     listaParcelas: ColecaoParcela;
    constructor crieobj;
    destructor destrua_se;
    procedure setNome (pNome  : string);
    function getNome  : string;

    function getListaParcelas: ColecaoParcela;
    procedure setListaParcelas(pLista: ColecaoParcela);


end;

implementation

{ Condicao }

constructor Condicao.crieobj;
begin
    self.nome := '';
    Self.listaParcelas := ColecaoParcela.CrieObjeto;
    inherited;
end;

destructor Condicao.destrua_se;
begin
    self.listaParcelas.destrua_se;
    inherited;
end;

function Condicao.getListaParcelas: ColecaoParcela;
begin
    Result := self.listaParcelas;
end;

function Condicao.getNome: string;
begin
  Result := self.nome;
end;

procedure Condicao.setListaParcelas(pLista: ColecaoParcela);
begin
    self.listaParcelas := pLista;
end;

procedure Condicao.setNome(pNome: string);
begin
   self.nome := pNome;
end;

end.
