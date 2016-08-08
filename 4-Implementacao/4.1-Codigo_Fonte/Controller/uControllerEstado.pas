unit uControllerEstado;

interface
  uses uDaoEstado, DB, sysutils, DBAccess, MyAccess, MemDS, uEstado;
  type controllerEstado = class

  private

  protected
    umDao : DaoEstado;

  public
      constructor CrieObj;
      destructor destrua_se;

// ------------- M�TODOS DE ESTADO ------------------
    function getDsEstado : TMyDataSource;
    procedure carregaEstado (pEstado : Estado);
    function salvaEstado (pEstado : Estado) : string;
    function excluiEstado(pEstado : Estado) : string;
    function pesquisaEstado(chave: string): string;
    function pesquisaDependencia(chave : integer) : string;
end;

implementation

{ controllerEstado }

constructor controllerEstado.CrieObj;
begin
    umDao := DaoEstado.CrieObjeto;
end;

destructor controllerEstado.destrua_se;
begin
   umDao.destrua_se;
end;

procedure controllerEstado.carregaEstado(pEstado: Estado);
begin
  umDao.carregaEstado (pEstado);
end;


function controllerEstado.excluiEstado(pEstado: Estado): string;
begin
   result := umDao.ExcluiEstado(pEstado);
end;

function controllerEstado.getDsEstado: TMyDataSource;
begin
   Result := umDao.getDSEstado;
end;

function controllerEstado.pesquisaEstado(chave: string): string;
var mSQL : string;
aux : integer;
begin
  if chave = '' then
    mSQL := 'select * from estados order by est_nome'
  else
    begin
        mSQL := 'select * from estados where est_nome like ' + quotedstr('%' + chave + '%') + ' order by est_nome';
    end;
      aux := umDao.sqlEstado(mSQL);

      if aux = 0 then
        begin
          Result := 'NADA';
        end;
end;

function controllerEstado.salvaEstado(pEstado: Estado): string;
begin
   Result := umDao.SalvarEstado(pEstado);
end;

function controllerEstado.pesquisaDependencia(chave: integer): string;
var mSQL, id : string;
aux : integer;
begin
  id := IntToStr(chave);
  mSQL := 'select * from cidades where cid_estado like ' + id;
    aux := umDao.sqlDependencia(mSQL);
    if aux = 0 then
        Result := 'OK'
    else
        Result := 'NO';
end;

end.
