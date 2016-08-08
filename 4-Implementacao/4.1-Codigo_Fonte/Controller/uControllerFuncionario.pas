unit uControllerFuncionario;

interface
  uses uDaoFuncionario, DB, sysutils, DBAccess, MyAccess, MemDS, uFuncionario;
  type controllerFuncionario = class

  private

  protected
    umDao : DaoFuncionario;

  public
      constructor CrieObj;
      destructor destrua_se;

// ------------- M�TODOS DE FUNCIONARIO ------------------
    function getDsFuncionario : TMyDataSource;
    procedure carregaFuncionario (pFuncionario : Funcionario);
    function salvaFuncionario (pFuncionario : Funcionario) : string;
    function excluiFuncionario(pFuncionario : Funcionario) : string;
    function pesquisaFuncionario(chave: string): string;
    function pesquisaDependencia(chave : integer) : string;     
end;

implementation

{ controllerFuncionario }

procedure controllerFuncionario.carregaFuncionario(
  pFuncionario: Funcionario);
begin
  umDao.carregaFuncionario(pFuncionario);
end;

constructor controllerFuncionario.CrieObj;
begin
  umDao := DaoFuncionario.CrieObjeto;
end;

destructor controllerFuncionario.destrua_se;
begin
  umDao.destrua_se;
end;

function controllerFuncionario.excluiFuncionario(
  pFuncionario: Funcionario): string;
begin
    Result := umDao.ExcluiFuncionario(pFuncionario);
end;

function controllerFuncionario.getDsFuncionario: TMyDataSource;
begin
   Result := umDao.getDSFuncionario;
end;

function controllerFuncionario.pesquisaDependencia(chave: integer): string;
var mSQL, id : string;
aux : integer;
begin
  id := IntToStr(chave);
  mSQL := 'select * from usuarios where user_funcionario like ' + id;
    aux := umDao.sqlDependencia(mSQL);
    if aux = 0 then
        Result := 'OK'
    else
        Result := 'NO';
end;

function controllerFuncionario.pesquisaFuncionario(chave: string): string;
var mSQL : string;
aux : integer;
begin
  if chave = '' then
    mSQL := 'select * from funcionarios order by func_nome'
  else
    begin
        mSQL := 'select * from funcionarios where func_nome like ' +
        quotedstr('%' + chave + '%') +
        ' or func_cpf like ' + quotedstr('%' + chave + '%') +
        ' or func_celular like ' + quotedstr('%' + chave + '%') +
        ' or func_cargo like ' + quotedstr('%' + chave + '%')
        + ' order by func_nome';
    end;
      aux := umDao.sqlFuncionario(mSQL);
      if aux = 0 then
        begin
          Result := 'NADA';
        end;
end;

function controllerFuncionario.salvaFuncionario(
  pFuncionario: Funcionario): string;
begin
   Result := umDao.SalvarFuncionario(pFuncionario);
end;

end.
