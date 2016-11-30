unit uDm;
// Possui as conex�es com o Database
interface

uses
  SysUtils, Classes, DB, MemDS, DBAccess, MyAccess;

type
  TDataModule1 = class(TDataModule)
    con_banco: TMyConnection;
    ds_paises: TMyDataSource;
    SQL_pais: TMyQuery;
    intgrfldSQL_paispais_id: TIntegerField;
    strngfldSQL_paispais_nome: TStringField;
    strngfldSQL_paispais_ddi: TStringField;
    strngfldSQL_paispais_sigla: TStringField;
    SQL_estado: TMyQuery;
    intgrfldSQL_estadoest_id: TIntegerField;
    strngfldSQL_estadoest_nome: TStringField;
    strngfldSQL_estadoest_uf: TStringField;
    intgrfldSQL_estadoest_pais: TIntegerField;
    ds_estados: TMyDataSource;
    SQL_cidade: TMyQuery;
    intgrfldSQL_cidadecid_id: TIntegerField;
    strngfldSQL_cidadecid_nome: TStringField;
    intgrfldSQL_cidadecid_estado: TIntegerField;
    strngfldSQL_cidadecid_ddd: TStringField;
    ds_cidades: TMyDataSource;
    SQL_cliente: TMyQuery;
    intgrfldSQL_clientecli_id: TIntegerField;
    strngfldSQL_clientecli_nome: TStringField;
    strngfldSQL_clientecli_cpf: TStringField;
    strngfldSQL_clientecli_sexo: TStringField;
    strngfldSQL_clientecli_telfixo: TStringField;
    strngfldSQL_clientecli_celular: TStringField;
    strngfldSQL_clientecli_logradouro: TStringField;
    strngfldSQL_clientecli_bairro: TStringField;
    intgrfldSQL_clientecli_cidade: TIntegerField;
    ds_clientes: TMyDataSource;
    SQL_fornecedor: TMyQuery;
    intgrfldSQL_fornecedorfor_id: TIntegerField;
    strngfldSQL_fornecedorfor_nome: TStringField;
    strngfldSQL_fornecedorfor_fone1: TStringField;
    strngfldSQL_fornecedorfor_fone2: TStringField;
    strngfldSQL_fornecedorfor_email: TStringField;
    intgrfldSQL_fornecedorfor_cidade: TIntegerField;
    ds_fornecedores: TMyDataSource;
    SQL_marca: TMyQuery;
    intgrfldSQL_marcamarca_id: TIntegerField;
    strngfldSQL_marcamarca_nome: TStringField;
    ds_marcas: TMyDataSource;
    SQL_produto: TMyQuery;
    intgrfldSQL_produtopro_id: TIntegerField;
    strngfldSQL_produtopro_nome: TStringField;
    strngfldSQL_produtopro_barra: TStringField;
    fltfldSQL_produtopro_custo: TFloatField;
    fltfldSQL_produtopro_preco: TFloatField;
    intgrfldSQL_produtopro_estoque: TIntegerField;
    intgrfldSQL_produtopro_marca: TIntegerField;
    strngfldSQL_produtopro_obs: TStringField;
    intgrfldSQL_produtopro_fornecedor: TIntegerField;
    ds_produtos: TMyDataSource;
    SQL_usuario: TMyQuery;
    intgrfldSQL_usuariouser_id: TIntegerField;
    strngfldSQL_usuariouser_nome: TStringField;
    strngfldSQL_usuariouser_login: TStringField;
    strngfldSQL_usuariouser_senha: TStringField;
    intgrfldSQL_usuariouser_tipo: TIntegerField;
    ds_usuarios: TMyDataSource;
    SQL_forma: TMyQuery;
    intgrfldSQL_formaforma_id: TIntegerField;
    strngfldSQL_formaforma_nome: TStringField;
    ds_forma: TMyDataSource;
    datafldSQL_clientecli_dataI: TDateTimeField;
    SQL_grupo: TMyQuery;
    ds_grupos: TMyDataSource;
    intgrfldSQL_grupogrupo_id: TIntegerField;
    strngfldSQL_grupogrupo_nome: TStringField;
    intgrfldSQL_produtopro_grupo: TIntegerField;
    intgrfldSQL_produtopro_unidade: TIntegerField;
    strngfldSQL_produtopro_referencia: TStringField;
    dateSQL_produtopro_dataCadastro: TDateTimeField;
    dateSQL_produtopro_dataAlteracao: TDateTimeField;
    dateSQL_produtopro_dataUltimaCompra: TDateTimeField;
    dateSQL_produtopro_dataUltimaVenda: TDateTimeField;
    floatSQL_produtopro_PrecoMinimo: TFloatField;
    floatSQL_produtopro_Comissao: TFloatField;
    strngfldSQL_produtopro_NomeGrupo: TStringField;
    SQL_funcionario: TMyQuery;
    intgrfldSQL_funcionariofunc_id: TIntegerField;
    strngfldSQL_funcionariofunc_nome: TStringField;
    strngfldSQL_funcionariofunc_cpf: TStringField;
    strngfldSQL_funcionariofunc_sexo: TStringField;
    strngfldSQL_funcionariofunc_telFixo: TStringField;
    strngfldSQL_funcionariofunc_celular: TStringField;
    strngfldSQL_funcionariofunc_logradouro: TStringField;
    strngfldSQL_funcionariofunc_numero: TStringField;
    strngfldSQL_funcionariofunc_bairro: TStringField;
    intgrfldSQL_funcionariofunc_cidade: TIntegerField;
    strngfldSQL_funcionariofunc_cargo: TStringField;
    floatSQL_funcionariofunc_salario: TFloatField;
    ds_funcionarios: TMyDataSource;
    dateSQL_funcionariofunc_dataI: TDateTimeField;
    intgrfldSQL_usuariouser_funcionario: TIntegerField;
    SQL_condicoes: TMyQuery;
    intgrfldSQL_condicoescond_id: TIntegerField;
    strngfldSQL_condicoescond_nome: TStringField;
    ds_condicoes: TMyDataSource;
    strngfldSQL_fornecedorfor_representante: TStringField;
    strngfldSQL_fornecedorfor_telefone: TStringField;
    strngfldSQL_clientecli_apelido: TStringField;
    strngfldSQL_clientecli_tipo: TStringField;
    strngfldSQL_clientecli_TelRecado: TStringField;
    strngfldSQL_clientecli_complemento: TStringField;
    strngfldSQL_clientecli_cep: TStringField;
    strngfldSQL_clientecli_rg: TStringField;
    intgrfldSQL_clientecli_condicao: TIntegerField;
    dateSQL_clientecli_DataAlteracao: TDateTimeField;
    strngfldSQL_clientecli_numero: TStringField;
    strngfldSQL_fornecedorfor_nomeFantasia: TStringField;
    strngfldSQL_fornecedorfor_logradouro: TStringField;
    strngfldSQL_fornecedorfor_numero: TStringField;
    strngfldSQL_fornecedorfor_complemento: TStringField;
    strngfldSQL_fornecedorfor_bairro: TStringField;
    strngfldSQL_fornecedorfor_cep: TStringField;
    strngfldSQL_fornecedorfor_cnpj: TStringField;
    strngfldSQL_fornecedorfor_inscEst: TStringField;
    intgrfldSQL_fornecedorfor_condicao: TIntegerField;
    dateSQL_fornecedorfor_dataCadastro: TDateTimeField;
    dateSQL_fornecedorfor_dataAlteracao: TDateTimeField;
    SQL_parcela: TMyQuery;
    intgrfldSQL_parcelaparc_condicao: TIntegerField;
    intgrfldSQL_parcelaparc_numero: TIntegerField;
    intgrfldSQL_parcelaparc_dias: TIntegerField;
    floatSQL_parcelaparc_percentual: TFloatField;
    intgrfldSQL_parcelaparc_forma: TIntegerField;
    ds_parcelas: TMyDataSource;
    SQL_imagens: TMyQuery;
    ds_imagens: TMyDataSource;
    SQL_imagenscod_imagem: TIntegerField;
    SQL_imagenscod_produto: TIntegerField;
    SQL_imagenscaminho_imagem: TStringField;
    SQL_transportadora: TMyQuery;
    SQL_transportadoratransp_id: TIntegerField;
    SQL_transportadoratransp_antt: TStringField;
    SQL_transportadoratransp_cnpj: TStringField;
    SQL_transportadoratransp_endereco: TStringField;
    SQL_transportadoratransp_cidade: TIntegerField;
    SQL_transportadoratransp_insc: TStringField;
    SQL_transportadoratransp_nome: TStringField;
    SQL_transportadoratransp_placa: TStringField;
    SQL_transportadoratransp_ufVeiculo: TStringField;
    SQL_transportadoratransp_uf: TStringField;
    SQL_transportadoratransp_fone: TStringField;
    ds_transportadoras: TMyDataSource;
    SQL_itenscompra: TMyQuery;
    SQL_itenscompraitemC_codProduto: TIntegerField;
    SQL_itenscompraitemC_codCompra: TIntegerField;
    SQL_itenscompraitemC_numero: TIntegerField;
    SQL_itenscompraitemC_nome: TStringField;
    SQL_itenscompraitemC_valorUnitario: TFloatField;
    SQL_itenscompraitemC_ncm: TStringField;
    SQL_itenscompraitemC_cst: TStringField;
    SQL_itenscompraitemC_cfop: TStringField;
    SQL_itenscompraitemC_qtde: TIntegerField;
    SQL_itenscompraitemC_vTotal: TFloatField;
    SQL_itenscompraitemC_baseICMS: TFloatField;
    SQL_itenscompraitemC_valorICMS: TFloatField;
    SQL_itenscompraitemC_valorIPI: TFloatField;
    SQL_itenscompraitemC_aliqICMS: TFloatField;
    SQL_itenscompraitemC_aliqIPI: TFloatField;
    ds_itenscompra: TMyDataSource;
    SQL_itenscompraitemC_unidade: TIntegerField;
    SQL_compras: TMyQuery;
    SQL_comprascompra_numeroNota: TIntegerField;
    SQL_comprascompra_codFornecedor: TIntegerField;
    SQL_comprascompra_serieNota: TIntegerField;
    SQL_comprascompra_tipoNota: TIntegerField;
    SQL_comprascompra_codTransportadora: TIntegerField;
    SQL_comprascompra_condPgto: TIntegerField;
    SQL_comprascompra_dataEmissao: TDateTimeField;
    SQL_comprascompra_dataChegada: TDateTimeField;
    SQL_comprascompra_baseCalculoICMS: TFloatField;
    SQL_comprascompra_valorICMS: TFloatField;
    SQL_comprascompra_baseCalculoICMSsubst: TFloatField;
    SQL_comprascompra_valorICMSsubst: TFloatField;
    SQL_comprascompra_valorTotalProdutos: TFloatField;
    SQL_comprascompra_valorFrete: TFloatField;
    SQL_comprascompra_valorSeguro: TFloatField;
    SQL_comprascompra_desconto: TFloatField;
    SQL_comprascompra_outrasDespAcessorias: TFloatField;
    SQL_comprascompra_valorTotalIPI: TFloatField;
    SQL_comprascompra_valorTotal: TFloatField;
    SQL_comprascompra_qtde: TIntegerField;
    SQL_comprascompra_placaVeiculo: TStringField;
    SQL_comprascompra_ufVeiculo: TStringField;
    SQL_comprascompra_especie: TStringField;
    SQL_comprascompra_marca: TStringField;
    SQL_comprascompra_numeracao: TStringField;
    SQL_comprascompra_pesoBruto: TFloatField;
    SQL_comprascompra_pesoLiquido: TFloatField;
    SQL_comprascompra_fretePorconta: TStringField;
    ds_compras: TMyDataSource;
    SQL_comprascompra_codCompra: TIntegerField;
    SQL_transportadoratransp_numero: TStringField;
    SQL_transportadoratransp_bairro: TStringField;
    SQL_veiculo: TMyQuery;
    SQL_veiculoveiculo_id: TIntegerField;
    SQL_veiculoveiculo_placa: TStringField;
    SQL_veiculoveiculo_uf: TIntegerField;
    SQL_veiculoveiculo_descricao: TStringField;
    ds_veiculos: TMyDataSource;
    SQL_transportadoratransp_veiculo: TIntegerField;
    SQL_comprascompra_veiculo: TIntegerField;
    SQL_itensvenda: TMyQuery;
    ds_itensvenda: TMyDataSource;
    SQL_itensvendaitemV_codProduto: TIntegerField;
    SQL_itensvendaitemV_codVenda: TIntegerField;
    SQL_itensvendaitemV_numero: TIntegerField;
    SQL_itensvendaitemV_nome: TStringField;
    SQL_itensvendaitemV_valorUnitario: TFloatField;
    SQL_itensvendaitemV_ncm: TStringField;
    SQL_itensvendaitemV_cst: TStringField;
    SQL_itensvendaitemV_unidade: TIntegerField;
    SQL_itensvendaitemV_cfop: TStringField;
    SQL_itensvendaitemV_qtde: TIntegerField;
    SQL_itensvendaitemV_vTotal: TFloatField;
    SQL_itensvendaitemV_baseICMS: TFloatField;
    SQL_itensvendaitemV_valorICMS: TFloatField;
    SQL_itensvendaitemV_valorIPI: TFloatField;
    SQL_itensvendaitemV_aliqICMS: TFloatField;
    SQL_itensvendaitemV_aliqIPI: TFloatField;
    SQL_vendas: TMyQuery;
    ds_vendas: TMyDataSource;
    SQL_vendasvenda_numeroNota: TIntegerField;
    SQL_vendasvenda_codCliente: TIntegerField;
    SQL_vendasvenda_serieNota: TIntegerField;
    SQL_vendasvenda_tipoNota: TIntegerField;
    SQL_vendasvenda_condPgto: TIntegerField;
    SQL_vendasvenda_codTransportadora: TIntegerField;
    SQL_vendasvenda_dataEmissao: TDateTimeField;
    SQL_vendasvenda_dataChegada: TDateTimeField;
    SQL_vendasvenda_baseCalculoICMS: TFloatField;
    SQL_vendasvenda_valorICMS: TFloatField;
    SQL_vendasvenda_baseCalculoICMSsubst: TFloatField;
    SQL_vendasvenda_valorICMSsubst: TFloatField;
    SQL_vendasvenda_valorTotalProdutos: TFloatField;
    SQL_vendasvenda_valorFrete: TFloatField;
    SQL_vendasvenda_valorSeguro: TFloatField;
    SQL_vendasvenda_desconto: TFloatField;
    SQL_vendasvenda_outrasDespAcessorias: TFloatField;
    SQL_vendasvenda_valorTotalIPI: TFloatField;
    SQL_vendasvenda_valorTotal: TFloatField;
    SQL_vendasvenda_qtde: TIntegerField;
    SQL_vendasvenda_placaVeiculo: TStringField;
    SQL_vendasvenda_ufVeiculo: TStringField;
    SQL_vendasvenda_especie: TStringField;
    SQL_vendasvenda_marca: TStringField;
    SQL_vendasvenda_numeracao: TStringField;
    SQL_vendasvenda_pesoBruto: TFloatField;
    SQL_vendasvenda_pesoLiquido: TFloatField;
    SQL_vendasvenda_fretePorconta: TStringField;
    SQL_vendasvenda_veiculo: TIntegerField;
    sql_contaPagar: TMyQuery;
    sql_contaPagarcontaP_id: TIntegerField;
    sql_contaPagarcontaP_dataCadastro: TDateTimeField;
    sql_contaPagarcontaP_codFornecedor: TIntegerField;
    sql_contaPagarcontaP_documento: TStringField;
    sql_contaPagarcontaP_vencimento: TDateTimeField;
    sql_contaPagarcontaP_valor: TFloatField;
    sql_contaPagarcontaP_numeroParcela: TIntegerField;
    sql_contaPagarcontaP_juros: TFloatField;
    sql_contaPagarcontaP_observacao: TStringField;
    sql_contaPagarcontaP_status: TIntegerField;
    sql_contaPagarcontaP_dataPagamento: TDateTimeField;
    sql_contaPagarcontaP_formaPagamento: TIntegerField;
    ds_contapagar: TMyDataSource;
    sql_contaPagarcontaP_codCompra: TIntegerField;
    SQL_vendasvenda_categoria: TStringField;
    SQL_formaforma_saldo: TFloatField;
    SQL_contaReceber: TMyQuery;
    SQL_contaRecebercontaR_id: TIntegerField;
    SQL_contaRecebercontaR_dataCadastro: TDateTimeField;
    SQL_contaRecebercontaR_codCliente: TIntegerField;
    SQL_contaRecebercontaR_documento: TStringField;
    SQL_contaRecebercontaR_vencimento: TDateTimeField;
    SQL_contaRecebercontaR_valor: TFloatField;
    SQL_contaRecebercontaR_numeroParcela: TIntegerField;
    SQL_contaRecebercontaR_juros: TFloatField;
    SQL_contaRecebercontaR_observacao: TStringField;
    SQL_contaRecebercontaR_status: TIntegerField;
    SQL_contaRecebercontaR_dataPagamento: TDateTimeField;
    SQL_contaRecebercontaR_formaPagamento: TIntegerField;
    SQL_contaRecebercontaR_codVenda: TIntegerField;
    ds_contasReceber: TMyDataSource;
    SQL_caixa: TMyQuery;
    ds_caixa: TMyDataSource;
    SQL_caixacaixa_data: TDateField;
    SQL_caixacaixa_valorInicial: TFloatField;
    SQL_caixacaixa_valorFinal: TFloatField;
    SQL_caixacaixa_saldo: TFloatField;
    SQL_fluxo: TMyQuery;
    SQL_fluxofluxo_id: TIntegerField;
    SQL_fluxofluxo_data: TDateField;
    SQL_fluxofluxo_valor: TFloatField;
    ds_fluxo: TMyDataSource;
    SQL_fluxofluxo_tipo: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.dfm}

end.
