unit uControllerProduto;

interface
  uses uDaoProduto, DB, sysutils, DBAccess, MyAccess, MemDS, uProduto, uColecaoImagens, uImagem;
  type controllerProduto = class

  private

  protected
    umDao : DaoProduto;

  public
      constructor CrieObj;
      destructor destrua_se;

// ------------- M�TODOS DE PRODUTO ----------------
    function getDsProduto : TMyDataSource;
    procedure carregaProduto (pProduto : Produto);
    procedure carregaImagens (pProduto : Produto; pImagens: ColecaoImagens);
    function salvaProduto (pProduto : Produto; pImagens: ColecaoImagens) : string;
    procedure salvaImagens (pImagens: ColecaoImagens; pProduto : Produto);
    function excluiProduto(pProduto : Produto) : string;
    procedure excluirImagem(pImagem: imagem);
    function pesquisaProduto(chave: string): string;
end;

implementation

{ controllerProduto }

constructor controllerProduto.CrieObj;
begin
   umDao := DaoProduto.CrieObjeto;
end;

destructor controllerProduto.destrua_se;
begin
   umDao.destrua_se;
end;

procedure controllerProduto.carregaProduto(pProduto: Produto);
begin
    umDao.carregaProduto(pProduto);
end;

function controllerProduto.excluiProduto(pProduto: Produto): string;
begin
    Result := umDao.ExcluiProduto(pProduto);
end;

function controllerProduto.getDsProduto: TMyDataSource;
begin
    Result := umDao.getDSProduto;
end;

function controllerProduto.pesquisaProduto(chave: string): string;
var mSQL : string;
aux : integer;
begin
  if (chave = 'ORDENAR CODIGO CONTRARIO') then
    begin
      mSQL := 'select * from produtos order by pro_id desc'
    end
  else if (chave = 'ORDENAR CODIGO') then
    begin
      mSQL := 'select * from produtos order by pro_id'
    end
  else if (chave = 'ORDENAR VALOR') then
    begin
      mSQL := 'select * from produtos order by pro_preco desc'
    end
  else if (chave = 'ORDENAR VALOR CONTRARIO') then
    begin
      mSQL := 'select * from produtos order by pro_preco'
    end
  else if (chave = 'ORDENAR NOME CONTRARIO') then
    begin
      mSQL := 'select * from produtos order by pro_nome desc'
    end
  else if chave = '' then
    mSQL := 'select * from produtos order by pro_nome'
  else
    begin
        mSQL := 'select * from produtos where pro_nome like '
        + quotedstr('%' + chave + '%') +
        'or pro_NomeGrupo like ' + quotedstr('%' + chave + '%') +
        'or pro_referencia like ' + quotedstr('%' + chave + '%') +
        'or pro_preco like ' + quotedstr('%' + chave + '%')
        + ' order by pro_nome';
    end;
      aux := umDao.sqlProduto(mSQL);

      if chave = 'PESQUISAR TODOS OS PRODUTOS' then
        begin
          mSQL := 'select * from produtos order by pro_nome';
          umDao.sqlProduto(mSQL);
        end;

      if (chave <> 'PESQUISAR TODOS OS PRODUTOS') and (aux = 0) then
        begin
          Result := 'NADA';
        end;
end;

function controllerProduto.salvaProduto(pProduto: Produto; pImagens: ColecaoImagens): string;
begin
   Result := umDao.SalvarProduto(pProduto,pImagens);
end;

procedure controllerProduto.salvaImagens(pImagens: ColecaoImagens; pProduto : Produto);
begin
   umDao.salvaImagens(pImagens,pProduto);
end;

procedure controllerProduto.carregaImagens(pProduto: Produto;
  pImagens: ColecaoImagens);
begin
   umDao.CarregaImagens(pProduto,pImagens);
end;

procedure controllerProduto.excluirImagem(pImagem: imagem);
begin
    umDao.ExcluiImagem(pimagem);
end;

end.
