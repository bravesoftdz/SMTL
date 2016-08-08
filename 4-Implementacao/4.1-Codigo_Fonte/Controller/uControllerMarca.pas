unit uControllerMarca;

interface
  uses uDaoMarca, DB, sysutils, DBAccess, MyAccess, MemDS, uMarca;
  type controllerMarca = class

  private

  protected
    umDao : DaoMarca;

  public
    constructor CrieObj;
    destructor destrua_se;

// ------------- M�TODOS DE MARCA ------------------
    function getDsMarca : TMyDataSource;
    procedure carregaMarca(pMarca : Marca);
    function salvaMarca(pMarca : Marca) : string;
    procedure excluiMarca(pMarca : Marca);
    function pesquisaMarca(chave : string) : string;
    function pesquisaDependencia(chave : integer) : string;  

end;    

implementation

{ controllerMarca }

constructor controllerMarca.CrieObj;
begin
    umDao := DaoMarca.CrieObjeto;
end;

destructor controllerMarca.destrua_se;
begin
    umDao.destrua_se;
end;

procedure controllerMarca.carregaMarca(pMarca: Marca);
begin
   umDao.carregaMarca(pMarca);
end;

procedure controllerMarca.excluiMarca(pMarca: Marca);
begin
   umDao.ExcluiMarca(pMarca);
end;

function controllerMarca.getDsMarca: TMyDataSource;
begin
  Result := umDao.getDSMarca;
end;

function controllerMarca.pesquisaMarca(chave: string): string;
var mSQL : string;
aux : integer;
begin
  if (chave = 'ORDENAR CODIGO CONTRARIO') then
    begin
      mSQL := 'select * from marcas order by marca_id desc'
    end
  else if (chave = 'ORDENAR CODIGO') then
    begin
      mSQL := 'select * from marcas order by marca_id'
    end
  else if (chave = 'ORDENAR NOME CONTRARIO') then
    begin
      mSQL := 'select * from marcas order by marca_nome desc'
    end
  else if chave = '' then
    mSQL := 'select * from marcas order by marca_nome'
  else
    begin
        mSQL := 'select * from marcas where marca_nome like ' + quotedstr('%' + chave + '%') + ' order by marca_nome';
    end;
      aux := umDao.sqlMarca(mSQL);
      if aux = 0 then
        begin
          Result := 'NADA';
        end;
end;

function controllerMarca.salvaMarca(pMarca: Marca): string;
begin
   Result := umDao.SalvarMarca(pMarca);
end;

function controllerMarca.pesquisaDependencia(chave: integer): string;
var mSQL, id : string;
aux : integer;
begin
  id := IntToStr(chave);
  mSQL := 'select * from produtos where pro_marca like ' + id;
    aux := umDao.sqlDependencia(mSQL);
    if aux = 0 then
        Result := 'OK'
    else
        Result := 'NO';
end;

end.
