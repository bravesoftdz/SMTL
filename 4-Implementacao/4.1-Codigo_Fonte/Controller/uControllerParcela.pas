unit uControllerParcela;

interface
  uses uDaoParcela, DB, sysutils, DBAccess, MyAccess, MemDS, uParcela;
  type controllerParcela = class

  private

  protected
    umDao : DaoParcela;

  public
    constructor CrieObj;
    destructor destrua_se;

// ------------- M�TODOS DE PARCELA ------------------
    function getDsParcela : TMyDataSource;
    procedure carregaParcela(pParcela : Parcela);
    function salvaParcela(pParcela : Parcela) : string;
    function excluiParcela(pParcela : Parcela): string;
    function pesquisaParcela(chave : string) : integer;
  
end;

implementation

{ controllerParcela }

procedure controllerParcela.carregaParcela(pParcela: Parcela);
begin
   umDao.carregaParcela(pParcela);
end;

constructor controllerParcela.CrieObj;
begin
    umDao := DaoParcela.CrieObjeto;
end;

destructor controllerParcela.destrua_se;
begin
   umDao.destrua_se;
end;

function controllerParcela.excluiParcela(pParcela: Parcela): string;
begin
  Result := umDao.ExcluiParcela(pParcela);
end;

function controllerParcela.getDsParcela: TMyDataSource;
begin
   Result := umDao.getDSParcela;
end;


function controllerParcela.pesquisaParcela(chave: string): integer;
var mSQL : string;
aux : integer;
begin
  if chave = '' then
    mSQL := 'select * from parcelas order by parc_numero'
  else
    begin
        mSQL := 'select * from parcelas where parc_condicao = ' + chave + ' order by parc_codigo';
    end;
      aux := umDao.sqlParcela(mSQL);
      if aux = 0 then
        begin
          Result := 0;
        end
      else
          Result := aux;
end;

function controllerParcela.salvaParcela(pParcela: Parcela): string;
begin
  Result := umDao.SalvarParcela(pParcela);
end;

end.
 