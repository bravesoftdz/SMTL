unit uDaoCaixa;

interface
  uses Windows, Messages, SysUtils, DB, uDm, uDao, DBAccess, MyAccess, MemDS;

  type DaoCaixa = class(Dao)

  private
  protected
  public
    constructor CrieObjeto;
    destructor destrua_se;

// ------------- M�TODOS DE CAIXA ------------------
    function getDSCaixa : TMyDataSource;
    function SalvarCaixa(pValor : real; tipo: integer) : string;
    function FecharCaixa : string;
    function carregarCaixa: real;
    function sqlCaixa(pSQL: string) : Integer;
    function sqlDependencia(pSQL: string; tipo: Integer) : Integer;
    function sqlSalvar(pSQL: string; tipo: Integer) : Integer;
    function pesquisaCaixaAberto: boolean;
    procedure movimentarCaixa(pValor: real; pTipo: integer);
end;

implementation

{ DaoCaixa }


{ DaoCaixa }

function DaoCaixa.carregarCaixa: real;
begin
    if not umDM.con_banco.Connected then
    begin
      umDM.con_banco.Connected := True;
    end;

       umdm.SQL_forma.Active := false;
       umdm.SQL_forma.SQL.Text := 'select * from forma where forma_id = 2';
       umdm.SQL_forma.Active := true;

    if umdm.SQL_forma.RecordCount > 0 then
        Result := umdm.SQL_formaforma_saldo.Value
    else
        result := 0;

end;

constructor DaoCaixa.CrieObjeto;
begin
   inherited;
end;

destructor DaoCaixa.destrua_se;
begin
   inherited;
end;

function DaoCaixa.FecharCaixa: string;
var pValor, pvalor2: real;
num: integer;
begin
   pvalor2 := 0;
    if not umDM.con_banco.Connected then
    begin
      umDM.con_banco.Connected := True;
    end;

      if not umDM.SQL_caixa.Active then
        begin
          umDM.SQL_caixa.Open;
        end;

       umdm.SQL_caixa.Active := false;
       umdm.SQL_caixa.sql.Text := 'select * from caixa where caixa_data >= CURDATE()';
       umdm.SQL_caixa.Active := true;
       umdm.SQL_caixa.Edit;


      umdm.SQL_forma.Active := false;
      umdm.SQL_forma.SQL.Text := 'select * from forma where forma_id = 2';
      umdm.SQL_forma.Active := true;

      pValor := umdm.SQL_formaforma_saldo.Value;

//somar com as sangrias
       umdm.SQL_fluxo.Active := false;
       umdm.SQL_fluxo.SQL.Text := 'select * from fluxo where fluxo_data >= CURDATE() and fluxo_tipo = ' + QuotedStr('SANGRIA');
       umdm.SQL_fluxo.Active := true;

       For num := 1 to umdm.SQL_fluxo.RecordCount do
         begin
             pValor := pValor + umdm.SQL_fluxofluxo_valor.Value;
              umdm.SQL_fluxo.Next;
         end;

       umdm.SQL_fluxo.Active := false;
       umdm.SQL_fluxo.SQL.Text := 'select * from fluxo ';
       umdm.SQL_fluxo.Active := true;

//-----------------------
//diminuir das entradas
       umdm.SQL_fluxo.Active := false;
       umdm.SQL_fluxo.SQL.Text := 'select * from fluxo where fluxo_data >= CURDATE() and (fluxo_tipo = ' + QuotedStr('ABERTURA') + ' or fluxo_tipo = ' + QuotedStr('SUPRIMENTO') + ')';
       umdm.SQL_fluxo.Active := true;

       For num := 1 to umdm.SQL_fluxo.RecordCount do
         begin
             pValor2 := pValor2 + umdm.SQL_fluxofluxo_valor.Value;
              umdm.SQL_fluxo.Next;
         end;

       umdm.SQL_fluxo.Active := false;
       umdm.SQL_fluxo.SQL.Text := 'select * from fluxo ';
       umdm.SQL_fluxo.Active := true;
//-----------------------

     
   //   pvalor2 := umdm.SQL_caixacaixa_valorInicial.Value;

      umdm.SQL_caixacaixa_valorFinal.Value := pValor;
      umdm.SQL_caixacaixa_saldo.Value := umdm.SQL_caixacaixa_valorFinal.Value - umdm.SQL_caixacaixa_valorInicial.Value;

      umdm.SQL_caixa.Post;


      umdm.SQL_forma.Active := false;
      umdm.SQL_forma.SQL.Text := 'select * from forma';
      umdm.SQL_forma.Active := true;

      Result := floattostr(pvalor);
end;

function DaoCaixa.getDSCaixa: TMyDataSource;
begin
  result := umdm.ds_caixa;
end;

procedure DaoCaixa.movimentarCaixa(pValor: real; pTipo: integer);
begin
    if not umDM.con_banco.Connected then
    begin
      umDM.con_banco.Connected := True;
    end;

      umdm.SQL_caixa.Active := false;
      umdm.SQL_caixa.sql.Text := 'select * from caixa where caixa_data >= CURDATE()';
      umdm.SQL_caixa.Active := true;
      umdm.SQL_caixa.Edit;

     if pTipo = 0 then //aumenta
         umdm.SQL_caixacaixa_valorFinal.Value := umdm.SQL_caixacaixa_valorFinal.Value + pValor
     else //diminui
         umdm.SQL_caixacaixa_valorFinal.Value := umdm.SQL_caixacaixa_valorFinal.Value - pValor;

     umdm.SQL_caixacaixa_saldo.Value := umdm.SQL_caixacaixa_valorFinal.Value - umdm.SQL_caixacaixa_valorInicial.Value;
     umdm.SQL_caixa.Post;
end;

function DaoCaixa.pesquisaCaixaAberto: boolean;
begin
   umdm.SQL_caixa.Active := false;
   umdm.SQL_caixa.sql.Text := 'select * from caixa where caixa_data >= CURDATE()';
            if not umDM.SQL_caixa.Active then
              umDM.SQL_caixa.Open;

  if umdm.SQL_caixa.RecordCount = 0 then
    result := false
  else
    result := true;

   umdm.SQL_caixa.Active := false;
   umdm.SQL_caixa.sql.Text := 'select * from caixa ';
            if not umDM.SQL_caixa.Active then
              umDM.SQL_caixa.Open;
end;

function DaoCaixa.SalvarCaixa(pValor: real; tipo: integer): string;
begin
    if not umDM.con_banco.Connected then
    begin
      umDM.con_banco.Connected := True;
    end;

      if not umDM.SQL_caixa.Active then
        begin
          umDM.SQL_caixa.Open;
        end;

      if tipo = 0 then
        begin
         umdm.SQL_caixa.Insert;
         umDm.SQL_caixacaixa_data.Value := Date;
         umdm.SQL_caixacaixa_valorInicial.Value := pValor;
        end
      else
         begin
             umdm.SQL_caixa.Active := false;
             umdm.SQL_caixa.sql.Text := 'select * from caixa where caixa_data >= CURDATE()';
             umdm.SQL_caixa.Active := true;
             umdm.SQL_caixa.Edit;
         end;


      umdm.SQL_caixacaixa_valorFinal.Value := pValor;
      umdm.SQL_caixacaixa_saldo.Value := umdm.SQL_caixacaixa_valorFinal.Value - umdm.SQL_caixacaixa_valorInicial.Value;

      umdm.SQL_caixa.Post;
      Result := 'OK';
end;

function DaoCaixa.sqlCaixa(pSQL: string): Integer;
begin

end;

function DaoCaixa.sqlDependencia(pSQL: string; tipo: Integer): Integer;
begin

end;

function DaoCaixa.sqlSalvar(pSQL: string; tipo: Integer): Integer;
begin

end;

end.
