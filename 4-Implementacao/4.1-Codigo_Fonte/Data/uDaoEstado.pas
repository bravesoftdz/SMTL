unit uDaoEstado;

interface
  uses Windows, Messages, SysUtils, DB, uDm, uDao, uEstado, DBAccess, MyAccess, MemDS;
  
  type DaoEstado = class(Dao)

  private
  protected
  public
    constructor CrieObjeto;
    destructor destrua_se;

// ------------- M�TODOS DE ESTADO ------------------    
    function getDSEstado :  TMyDataSource;
    procedure carregaEstado (pEstado : Estado);
    function SalvarEstado (pEstado : Estado) : string;
    function ExcluiEstado(pEstado : Estado) : string;
    function sqlEstado(pSQL: string) : Integer;
    function sqlDependencia(pSQL: string) : Integer;
end;    
implementation

{ DaoEstado }

constructor DaoEstado.CrieObjeto;
begin
  inherited;
end;

destructor DaoEstado.destrua_se;
begin
  inherited;
end;

// ------------- M�TODOS DE ESTADO ------------------
function DaoEstado.SalvarEstado(pEstado: Estado): string;
begin
  if not umDM.con_banco.Connected then
    begin
      umDM.con_banco.Connected := True;
    end;

     if not umDM.SQL_estado.Active then
        begin
          umDM.SQL_estado.Open;
        end;

      if pEstado.getCodigo = 0 then
        umDM.SQL_estado.Insert
      else
         umDM.SQL_estado.Edit;

      umDM.strngfldSQL_estadoest_nome.Value := pEstado.getNomeEstado;
      umDM.strngfldSQL_estadoest_uf.value := pEStado.getUF;
      umDM.intgrfldSQL_estadoest_pais.Value := pEstado.getumPais.getCodigo;
      umDM.SQL_estado.Post;

      Result := 'OK';
end;

function DaoEstado.sqlEstado(pSQL: string): Integer;
begin
   umDM.SQL_estado.Active := False;
   umDM.SQL_estado.SQL.Text := pSQL;
    if not umDM.SQL_estado.Active then
      umDM.SQL_estado.Open;

  if umDM.SQL_estado.RecordCount = 0 then
    result :=  0
  else
    result := 1;
end;

function DaoEstado.getDSEstado: TMyDataSource;
begin
  Result := umDM.ds_estados;
end;

function DaoEstado.ExcluiEstado(pEstado: Estado): string;
begin
   if not umDM.con_banco.Connected then
    begin
      umDM.con_banco.Connected := True;
    end;

      if not umDM.SQL_estado.Active then
        begin
          umDM.SQL_estado.Open;
        end;

      umDM.SQL_estado.Edit;
      umDM.intgrfldSQL_estadoest_id.Value := pEstado.getCodigo;
          Try
              umDM.SQL_estado.Delete;
              Result := 'OK';
          except
              Result := 'NO';
          end;
end;

procedure DaoEstado.carregaEstado(pEstado: Estado);
var inteiro: string;
begin
    if not umDM.SQL_estado.Active then
        umDM.SQL_estado.Open;
    pEstado.setCodigo(umDM.intgrfldSQL_estadoest_id.Value);
    pEstado.setNomeEstado(umDM.strngfldSQL_estadoest_nome.Value);
    pEstado.setUF(umDM.strngfldSQL_estadoest_uf.Value);
    pEstado.getumPais.setCodigo(umDM.intgrfldSQL_estadoest_pais.Value);
    inteiro :=  InttoStr(umDM.intgrfldSQL_estadoest_pais.Value);

    umDM.SQL_pais.Active := False;
    umDM.SQL_pais.SQL.Text := 'select * from paises where pais_id = ' + inteiro ;
    if not umDM.SQL_pais.Active then
      umDM.SQL_pais.Open;

    pEstado.getumPais.setPais(umDM.strngfldSQL_paispais_nome.Value);

    umDM.SQL_pais.Active := False;
    umDM.SQL_pais.SQL.Text := 'select * from paises';
    if not umDM.SQL_pais.Active then
      umDM.SQL_pais.Open;
end;


function DaoEstado.sqlDependencia(pSQL: string): Integer;
begin
  umDM.SQL_cidade.Active := False;
  umDM.SQL_cidade.SQL.Text := pSQL;
    if not umDM.SQL_cidade.Active then
      umDM.SQL_cidade.Open;

  if umDM.SQL_cidade.RecordCount = 0 then
    result :=  0
  else
    result := 1;
end;

end.
