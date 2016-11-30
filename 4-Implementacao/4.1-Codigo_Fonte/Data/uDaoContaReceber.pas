unit uDaoContaReceber;

interface
  uses Windows, Messages, SysUtils, DB, uDm, uDao, uContaReceber, DBAccess, MyAccess, MemDS;

  type DaoContaReceber = class(Dao)

  private
  protected
  public
    constructor CrieObjeto;
    destructor destrua_se;

// ------------- M�TODOS DE CONTA A RECEBER  ------------------
    function getDSContaReceber : TMyDataSource;
    procedure carregaContaReceber(pContaReceber : ContaReceber);
    function SalvarContaReceber(pContaReceber : ContaReceber) : string;
    function ExcluiContaReceber(pContaReceber : ContaReceber) : string;
    function excluirByIdVenda(id: integer): string;
    function sqlContaReceber(pSQL: string) : Integer;
    function sqlDependencia(pSQL: string; tipo: Integer): Integer;
    function sqlSalvar(pSQL: string; tipo: Integer) : Integer; 
end;

implementation

{ DaoContaReceber }

constructor DaoContaReceber.CrieObjeto;
begin
   inherited;
end;

destructor DaoContaReceber.destrua_se;
begin
   inherited;
end;

procedure DaoContaReceber.carregaContaReceber(pContaReceber: ContaReceber);
var inteiro: string;
begin
    if not umDM.sql_contaReceber.Active then
        umDM.sql_contaReceber.Open;

    pContaReceber.setCodigo(umdm.SQL_contaRecebercontaR_id.Value);
    pContaReceber.setDataCadastro(umdm.SQL_contaRecebercontaR_dataCadastro.Value);
    pContaReceber.getumCliente.setCodigo(umdm.SQL_contaRecebercontaR_codCliente.Value);
    pContaReceber.setDocumento(umdm.SQL_contaRecebercontaR_documento.Value);
    pContaReceber.setDataVencimento(umdm.SQL_contaRecebercontaR_vencimento.Value);
    pcontareceber.setValor(umdm.SQL_contaRecebercontaR_valor.Value);
    pContaReceber.setNumeroParcela(umdm.SQL_contaRecebercontaR_numeroParcela.Value);
    pcontareceber.setJuros(umdm.SQL_contaRecebercontaR_juros.Value);
    pContaReceber.setObservacao(umdm.SQL_contaRecebercontaR_observacao.Value);
    pcontareceber.setStatus(umdm.SQL_contaRecebercontaR_status.Value);
    pcontareceber.setDataPagamento(umdm.SQL_contaRecebercontaR_dataPagamento.Value);
    pcontaReceber.getumaForma.setCodigo(umdm.SQL_contaRecebercontaR_formaPagamento.Value);
    pContaReceber.setCodVenda(umdm.SQL_contaRecebercontaR_codVenda.Value);

//resgatando nome cliente    
    inteiro := inttostr(umdm.SQL_contaRecebercontaR_codCliente.Value);
    umdm.SQL_cliente.Active := false;
    umdm.SQL_cliente.SQL.Text := 'select * from clientes where cli_id = ' + inteiro;
      if not umdm.SQL_cliente.Active then
         umdm.SQL_cliente.Open;

    pContaReceber.getumCliente.setNome(umdm.strngfldSQL_clientecli_nome.Value);

    umdm.SQL_cliente.Active := false;
    umdm.SQL_cliente.SQL.Text := 'select * from clientes';
      if not umdm.SQL_cliente.Active then
         umdm.SQL_cliente.Open;

//resgatando nome forma de pagamento
    inteiro := inttostr(umdm.sql_contaRecebercontaR_formaPagamento.Value);
    umdm.SQL_forma.Active := false;
    umdm.SQL_forma.SQL.Text := 'select * from forma where forma_id = ' + inteiro;
      if not umdm.SQL_forma.Active then
         umdm.SQL_forma.Open;

    pContaReceber.getumaForma.setNome(umdm.strngfldSQL_formaforma_nome.Value);

    umdm.SQL_forma.Active := false;
    umdm.SQL_forma.SQL.Text := 'select * from forma';
      if not umdm.SQL_forma.Active then
         umdm.SQL_forma.Open;
end;

function DaoContaReceber.ExcluiContaReceber(pContaReceber: ContaReceber): string;
begin
   if not umDM.con_banco.Connected then
    begin
      umDM.con_banco.Connected := True;
    end;

      if not umDM.sql_contaReceber.Active then
        begin
          umDM.sql_contaReceber.Open;
        end;

      umDM.sql_contaReceber.Edit;
      umdm.sql_contaRecebercontaR_id.Value := pContaReceber.getCodigo;
          Try
              umDM.sql_contaReceber.Delete;
              Result := 'OK';
          except
              Result := 'NO';
          end;
end;

function DaoContaReceber.getDSContaReceber: TMyDataSource;
begin
  result := umdm.ds_contasreceber;
end;

function DaoContaReceber.SalvarContaReceber(pContaReceber: ContaReceber): string;
begin
   if not umDM.con_banco.Connected then
    begin
      umDM.con_banco.Connected := True;
    end;

      if not umDM.sql_contaReceber.Active then
        begin
          umDM.sql_contaReceber.Open;
        end;

      if pContaReceber.getCodigo = 0 then
         umdm.sql_contaReceber.Insert
      else
        begin
           umdm.sql_contaReceber.Active := false;
           umdm.sql_contaReceber.sql.Text := 'select * from contasreceber where contaR_id = ' + inttostr(pContaReceber.getCodigo);
           umdm.sql_contaReceber.Active := true;
           umdm.sql_contaReceber.Edit;
        end;

       umdm.sql_contaRecebercontaR_dataCadastro.Value := pContaReceber.getDataCadastro;
       umdm.sql_contaRecebercontaR_codCliente.Value := pContaReceber.getumCliente.getCodigo;
       umdm.sql_contaRecebercontaR_documento.Value := pContaReceber.getDocumento;
       umdm.sql_contaRecebercontaR_vencimento.Value := pContaReceber.getDataVencimento;
       umdm.sql_contaRecebercontaR_valor.Value := pContaReceber.getValor;
       umdm.sql_contaRecebercontaR_numeroParcela.Value := pContaReceber.getNumeroParcela;
       umdm.sql_contaRecebercontaR_juros.Value := pContaReceber.getJuros;
       umdm.sql_contaRecebercontaR_observacao.Value := pContaReceber.getObservacao;
       umdm.sql_contaRecebercontaR_status.Value := pContaReceber.getStatus;
       umdm.sql_contaRecebercontaR_dataPagamento.Value := pContaReceber.getDataPagamento;
       umdm.sql_contaRecebercontaR_formaPagamento.Value := pContaReceber.getumaForma.getCodigo;
       umdm.sql_contaRecebercontaR_codVenda.Value := pContaReceber.getCodVenda;
       umdm.sql_contaReceber.Post;

      Result := 'OK';
end;

function DaoContaReceber.sqlContaReceber(pSQL: string): Integer;
begin
   umDM.sql_contaReceber.Active := False;
   umDM.sql_contaReceber.SQL.Text := pSQL;
    if not umDM.sql_contaReceber.Active then
      umDM.sql_contaReceber.Open;

  if umDM.sql_contaReceber.RecordCount = 0 then
    result :=  0
  else
    result := 1;
end;

function DaoContaReceber.sqlDependencia(pSQL: string;
  tipo: Integer): Integer;
begin

end;

function DaoContaReceber.sqlSalvar(pSQL: string; tipo: Integer): Integer;
begin
    //buscar nas contas, se h� uma conta igual (documento + vencimento) j� cadastrada
       begin
          umDM.sql_contaReceber.Active := False;
          umDM.sql_contaReceber.SQL.Text := pSQL;
            if not umDM.sql_contaReceber.Active then
              umDM.sql_contaReceber.Open;

          if umDM.sql_contaReceber.RecordCount = 0 then
            result :=  0
          else
            result := 1;

          umdm.sql_contaReceber.Active := false;
          umDM.sql_contaReceber.SQL.Text := 'select * from contasreceber';
            if not umDM.sql_contaReceber.Active then
              umDM.sql_contaReceber.Open;
       end;
end;

function DaoContaReceber.excluirByIdVenda(id: integer): string;
var k: integer;
begin
   if not umDM.con_banco.Connected then
    begin
      umDM.con_banco.Connected := True;
    end;

   umDM.sql_contaReceber.Active := false;
   umdm.sql_contaReceber.SQL.Text := 'select * from contasreceber where contaR_codVenda = ' + inttostr(id);
     if not umDM.sql_contaReceber.Active then
       umDM.sql_contaReceber.Open;

   umDM.sql_contaReceber.Edit;

   For k:=1 to umdm.sql_contaReceber.RecordCount do
     begin
        umDM.sql_contaReceber.Delete;
        umdm.sql_contaReceber.Next;
     end;

      {
          Try
              umDM.sql_contaReceber.Delete;
              Result := 'OK';
          except
              Result := 'NO';
          end;     }
end;

end.
