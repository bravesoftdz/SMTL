unit uControllerForma;

interface
  uses uDaoForma, DB, sysutils, DBAccess, MyAccess, MemDS, uForma;
  type controllerForma = class

  private

  protected
    umDao : DaoForma;

  public
      constructor CrieObj;
      destructor destrua_se;

// ------------- M�TODOS DE FORMA DE PGTO ------------------
    function getDsForma : TMyDataSource;
    procedure carregaForma(pForma : Forma);
    function salvaForma(pForma : Forma) : string;
    function excluiForma(pForma : Forma) : string;
    function pesquisaForma(chave : string) : string;
    function pesquisaDependencia(chave : integer) : string;
    function pesquisaSalvar(chave : string) : string;
    procedure alteraSaldo(cod: integer; valor: real; tipo: integer);    
end;

implementation

{ controllerForma }

constructor controllerForma.CrieObj;
begin
  umDao := DaoForma.CrieObjeto;
end;

destructor controllerForma.destrua_se;
begin
  umDao.destrua_se;
end;

procedure controllerForma.carregaForma(pForma: Forma);
begin
  umDao.carregaForma(pForma);
end;

function controllerForma.excluiForma(pForma: Forma): string;
begin
  Result := umDao.ExcluiForma(pForma);
end;

function controllerForma.getDsForma: TMyDataSource;
begin
   Result:= umDao.getDSForma;
end;

function controllerForma.pesquisaForma(chave: string): string;
var mSQL : string;
aux : integer;
begin
  if chave = '' then
    mSQL := 'select * from forma order by forma_nome'
  else
    begin
        mSQL := 'select * from forma where forma_nome like ' + quotedstr('%' + chave + '%') + ' order by forma_nome';
    end;
      aux := umDao.sqlForma(mSQL);
      if aux = 0 then
        begin
          Result := 'NADA';
        end;
end;

function controllerForma.salvaForma(pForma: Forma): string;
begin
   Result := umDao.SalvarForma(pForma);
end;

function controllerForma.pesquisaDependencia(chave: integer): string;
var mSQL, id : string;
aux : integer;
label Encerra;
begin
  id := IntToStr(chave);

  // pesquisa na tabela parcelas - tipo 1 de pesquisa
      mSQL := 'select * from parcelas where parc_forma like ' + id;
        aux := umDao.sqlDependencia(mSQL,1);
        if aux = 0 then
            Result := 'OK'
        else
          begin
            Result := 'PARCELA';
            goto Encerra;
          end;

  Encerra:
end;

function controllerForma.pesquisaSalvar(chave: string): string;
var mSQL : string;
aux : integer;
begin
  // pesquisa na tabela formas de pagamento se h� o nome j� cadastrado
      mSQL := 'select * from forma where forma_nome = ' + quotedstr(chave);
        aux := umDao.sqlSalvar(mSQL,1);
        if aux = 0 then
            Result := 'OK'
        else
          begin
            Result := 'EXISTE';
           end;  
end;

procedure controllerForma.alteraSaldo(cod: integer; valor: real;
  tipo: integer);
begin
    umdao.alteraSaldo(cod,valor,tipo);
end;

end.
