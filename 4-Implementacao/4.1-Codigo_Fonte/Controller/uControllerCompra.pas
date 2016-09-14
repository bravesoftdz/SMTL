unit uControllerCompra;

interface
  uses uDaoCompra, DB, sysutils, DBAccess, MyAccess, MemDS, uCompra;
  type controllerCompra = class

  private

  protected
    umDao : DaoCompra;

  public
    constructor CrieObj;
    destructor destrua_se;


    function getDsCompra : TMyDataSource;
    procedure carregaCompra(pCompra : Compra);
    function salvaCompra(pCompra : Compra) : string;
    function excluiCompra(pCompra : Compra): string;
    function pesquisaCompra(chave : string) : string;
    function pesquisaDependencia(chave : integer) : string;


end;

implementation

{ controllerCompra }

procedure controllerCompra.carregaCompra(pCompra: Compra);
begin
    umdao.carregaCompra(pCompra);
end;

constructor controllerCompra.CrieObj;
begin
    umdao := daoCompra.CrieObjeto;
end;

destructor controllerCompra.destrua_se;
begin
    umdao.destrua_se;
end;

function controllerCompra.excluiCompra(pCompra: Compra): string;
begin
    result := umdao.ExcluiCompra(pcompra);
end;

function controllerCompra.getDsCompra: TMyDataSource;
begin
     result := umdao.getDSCompra;
end;

function controllerCompra.pesquisaCompra(chave: string): string;
var mSQL : string;
aux : integer;
begin
  if chave = '' then
    mSQL := 'select * from compras order by compra_codCompra'
  else
    begin
        mSQL := 'select * from compras where compra_numeroNota like ' + quotedstr('%' + chave + '%') + ' order by compra_codCompra';
    end;
      aux := umDao.sqlCompra(mSQL);
      if aux = 0 then
        begin
          Result := 'NADA';
        end;
end;

function controllerCompra.pesquisaDependencia(chave: integer): string;
begin

end;

function controllerCompra.salvaCompra(pCompra: Compra): string;
begin
   result := umdao.SalvarCompra(pcompra);
end;

end.
