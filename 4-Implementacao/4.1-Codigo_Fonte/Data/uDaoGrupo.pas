unit uDaoGrupo;

interface
  uses Windows, Messages, SysUtils, DB, uDm, uDao, uGrupo, DBAccess, MyAccess, MemDS;
  
  type DaoGrupo = class(Dao)

  private
  protected
  public
    constructor CrieObjeto;
    destructor destrua_se;

// ------------- M�TODOS DE GRUPOS ------------------
    function getDSGrupo : TMyDataSource;
    procedure carregaGrupo(pGrupo : Grupo);
    function SalvarGrupo(pGrupo : Grupo) : string;
    function ExcluiGrupo(pGrupo : Grupo) : string;
    function sqlGrupo(pSQL: string) : Integer;
    function trazSQLGrupo : TMyQuery;
    function getDmGrupo : TDataModule1;
    function sqlDependencia(pSQL: string) : Integer;     
end;

implementation

{ DaoGrupo }

procedure DaoGrupo.carregaGrupo(pGrupo: Grupo);
begin
  if not umDM.SQL_grupo.Active then
    begin
      umDM.SQL_grupo.Open;
    end;
  pGrupo.setCodigo(umDM.intgrfldSQL_grupogrupo_id.Value);
  pGrupo.setNome(umDM.strngfldSQL_grupogrupo_nome.Value);
end;

constructor DaoGrupo.CrieObjeto;
begin
   inherited;
end;

destructor DaoGrupo.destrua_se;
begin
  inherited;
end;

function DaoGrupo.ExcluiGrupo(pGrupo: Grupo): string;
begin
  if not umDM.con_banco.Connected then
    begin
      umDM.con_banco.Connected := True;
    end;

      if not umDM.SQL_grupo.Active then
        begin
          umDM.SQL_grupo.Open;
        end;

      umDM.SQL_grupo.Edit;
      umDM.intgrfldSQL_grupogrupo_id.Value := pGrupo.getCodigo;
        try
            umDM.SQL_grupo.Delete;
            Result := 'OK';
        except
            Result := 'NO';
        end;
end;

function DaoGrupo.getDmGrupo: TDataModule1;
begin
    Result := self.umDM;
end;

function DaoGrupo.getDSGrupo: TMyDataSource;
begin
   Result := umDM.ds_grupos;
end;

function DaoGrupo.SalvarGrupo(pGrupo: Grupo): string;
begin
  if not umDM.con_banco.Connected then
    begin
      umDM.con_banco.Connected := True;
    end;

      if not umDM.SQL_grupo.Active then
        begin
          umDM.SQL_grupo.Open;
        end;

      if pGrupo.getCodigo = 0 then
        umDM.SQL_grupo.Insert
      else
         umDM.SQL_grupo.Edit;

      umDM.strngfldSQL_grupogrupo_nome.Value := pGrupo.getNome;
      umDM.SQL_grupo.Post;

      Result := 'OK';
end;

function DaoGrupo.sqlDependencia(pSQL: string): Integer;
begin
  umDM.SQL_produto.Active := False;
  umDM.SQL_produto.SQL.Text := pSQL;
    if not umDM.SQL_produto.Active then
      umDM.SQL_produto.Open;

  if umDM.SQL_produto.RecordCount = 0 then
    result :=  0
  else
    result := 1;
end;

function DaoGrupo.sqlGrupo(pSQL: string): Integer;
begin
  umDM.SQL_grupo.Active := False;
  umDM.SQL_grupo.SQL.Text := pSQL;
    if not umDM.SQL_grupo.Active then
      umDM.SQL_grupo.Open;

  if umDM.SQL_grupo.RecordCount = 0 then
    result :=  0
  else
    result := 1;
end;

function DaoGrupo.trazSQLGrupo: TMyQuery;
begin
  Result := umDM.SQL_grupo;
end;

end.
