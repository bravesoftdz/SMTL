object DataModule1: TDataModule1
  OldCreateOrder = False
  Left = 358
  Top = 251
  Height = 416
  Width = 782
  object con_banco: TMyConnection
    Database = 'vendas'
    Username = 'root'
    Server = 'localhost'
    Connected = True
    Left = 24
    Top = 24
    EncryptedPassword = '8CFF86FF8CFF9BFF9DFF9EFF'
  end
  object ds_paises: TMyDataSource
    DataSet = SQL_pais
    Left = 24
    Top = 136
  end
  object SQL_pais: TMyQuery
    SQLInsert.Strings = (
      'INSERT INTO paises'
      '  (pais_nome, pais_ddi, pais_sigla)'
      'VALUES'
      '  (:pais_nome, :pais_ddi, :pais_sigla)')
    SQLDelete.Strings = (
      'DELETE FROM paises'
      'WHERE'
      '  pais_id = :Old_pais_id')
    SQLUpdate.Strings = (
      'UPDATE paises'
      'SET'
      
        '  pais_nome = :pais_nome, pais_ddi = :pais_ddi, pais_sigla = :pa' +
        'is_sigla'
      'WHERE'
      '  pais_id = :Old_pais_id')
    SQLRefresh.Strings = (
      'SELECT pais_nome, pais_ddi, pais_sigla FROM paises'
      'WHERE'
      '  pais_id = :pais_id')
    SQLLock.Strings = (
      'SELECT * FROM paises'
      'WHERE'
      '  pais_id = :Old_pais_id'
      'FOR UPDATE')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM paises')
    Connection = con_banco
    SQL.Strings = (
      'select * from paises')
    Left = 24
    Top = 88
    object intgrfldSQL_paispais_id: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'pais_id'
      Origin = 'paises.pais_id'
    end
    object strngfldSQL_paispais_nome: TStringField
      FieldName = 'pais_nome'
      Origin = 'paises.pais_nome'
      Size = 80
    end
    object strngfldSQL_paispais_ddi: TStringField
      FieldName = 'pais_ddi'
      Origin = 'paises.pais_ddi'
      Size = 5
    end
    object strngfldSQL_paispais_sigla: TStringField
      FieldName = 'pais_sigla'
      Origin = 'paises.pais_sigla'
      Size = 5
    end
  end
  object SQL_estado: TMyQuery
    SQLInsert.Strings = (
      'INSERT INTO estados'
      '  (est_nome, est_pais, est_uf)'
      'VALUES'
      '  (:est_nome, :est_pais, :est_uf)')
    SQLDelete.Strings = (
      'DELETE FROM estados'
      'WHERE'
      '  est_id = :Old_est_id')
    SQLUpdate.Strings = (
      'UPDATE estados'
      'SET'
      '  est_nome = :est_nome, est_pais = :est_pais, est_uf = :est_uf'
      'WHERE'
      '  est_id = :Old_est_id')
    SQLRefresh.Strings = (
      'SELECT est_nome, est_pais, est_uf FROM estados'
      'WHERE'
      '  est_id = :est_id')
    SQLLock.Strings = (
      'SELECT * FROM estados'
      'WHERE'
      '  est_id = :Old_est_id'
      'FOR UPDATE')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM estados')
    Connection = con_banco
    SQL.Strings = (
      'select * from estados')
    Left = 112
    Top = 88
    object intgrfldSQL_estadoest_id: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'est_id'
      Origin = 'estados.est_id'
    end
    object strngfldSQL_estadoest_nome: TStringField
      FieldName = 'est_nome'
      Origin = 'estados.est_nome'
      Size = 40
    end
    object strngfldSQL_estadoest_uf: TStringField
      FieldName = 'est_uf'
      Origin = 'estados.est_uf'
      Size = 3
    end
    object intgrfldSQL_estadoest_pais: TIntegerField
      FieldName = 'est_pais'
      Origin = 'estados.est_pais'
    end
  end
  object ds_estados: TMyDataSource
    DataSet = SQL_estado
    Left = 112
    Top = 136
  end
  object SQL_cidade: TMyQuery
    SQLInsert.Strings = (
      'INSERT INTO cidades'
      '  (cid_nome, cid_estado, cid_ddd)'
      'VALUES'
      '  (:cid_nome, :cid_estado, :cid_ddd)')
    SQLDelete.Strings = (
      'DELETE FROM cidades'
      'WHERE'
      '  cid_id = :Old_cid_id')
    SQLUpdate.Strings = (
      'UPDATE cidades'
      'SET'
      
        '  cid_nome = :cid_nome, cid_estado = :cid_estado, cid_ddd = :cid' +
        '_ddd'
      'WHERE'
      '  cid_id = :Old_cid_id')
    SQLRefresh.Strings = (
      'SELECT cid_nome, cid_estado, cid_ddd FROM cidades'
      'WHERE'
      '  cid_id = :cid_id')
    SQLLock.Strings = (
      'SELECT * FROM cidades'
      'WHERE'
      '  cid_id = :Old_cid_id'
      'FOR UPDATE')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM cidades')
    Connection = con_banco
    SQL.Strings = (
      'select * from cidades')
    Left = 200
    Top = 88
    object intgrfldSQL_cidadecid_id: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'cid_id'
      Origin = 'cidades.cid_id'
    end
    object strngfldSQL_cidadecid_nome: TStringField
      FieldName = 'cid_nome'
      Origin = 'cidades.cid_nome'
      Size = 60
    end
    object intgrfldSQL_cidadecid_estado: TIntegerField
      FieldName = 'cid_estado'
      Origin = 'cidades.cid_estado'
    end
    object strngfldSQL_cidadecid_ddd: TStringField
      FieldName = 'cid_ddd'
      Origin = 'cidades.cid_ddd'
      Size = 5
    end
  end
  object ds_cidades: TMyDataSource
    DataSet = SQL_cidade
    Left = 200
    Top = 136
  end
  object SQL_cliente: TMyQuery
    SQLInsert.Strings = (
      'INSERT INTO clientes'
      
        '  (cli_nome, cli_telfixo, cli_cpf, cli_logradouro, cli_numero, c' +
        'li_celular, cli_bairro, cli_cidade, cli_sexo, cli_dataI, cli_ape' +
        'lido, cli_tipo, cli_TelRecado, cli_complemento, cli_cep, cli_rg,' +
        ' cli_condicao, cli_DataAlteracao)'
      'VALUES'
      
        '  (:cli_nome, :cli_telfixo, :cli_cpf, :cli_logradouro, :cli_nume' +
        'ro, :cli_celular, :cli_bairro, :cli_cidade, :cli_sexo, :cli_data' +
        'I, :cli_apelido, :cli_tipo, :cli_TelRecado, :cli_complemento, :c' +
        'li_cep, :cli_rg, :cli_condicao, :cli_DataAlteracao)')
    SQLDelete.Strings = (
      'DELETE FROM clientes'
      'WHERE'
      '  cli_id = :Old_cli_id')
    SQLUpdate.Strings = (
      'UPDATE clientes'
      'SET'
      
        '  cli_nome = :cli_nome, cli_telfixo = :cli_telfixo, cli_cpf = :c' +
        'li_cpf, cli_logradouro = :cli_logradouro, cli_numero = :cli_nume' +
        'ro, cli_celular = :cli_celular, cli_bairro = :cli_bairro, cli_ci' +
        'dade = :cli_cidade, cli_sexo = :cli_sexo, cli_dataI = :cli_dataI' +
        ', cli_apelido = :cli_apelido, cli_tipo = :cli_tipo, cli_TelRecad' +
        'o = :cli_TelRecado, cli_complemento = :cli_complemento, cli_cep ' +
        '= :cli_cep, cli_rg = :cli_rg, cli_condicao = :cli_condicao, cli_' +
        'DataAlteracao = :cli_DataAlteracao'
      'WHERE'
      '  cli_id = :Old_cli_id')
    SQLRefresh.Strings = (
      
        'SELECT cli_nome, cli_telfixo, cli_cpf, cli_logradouro, cli_numer' +
        'o, cli_celular, cli_bairro, cli_cidade, cli_sexo, cli_dataI, cli' +
        '_apelido, cli_tipo, cli_TelRecado, cli_complemento, cli_cep, cli' +
        '_rg, cli_condicao, cli_DataAlteracao FROM clientes'
      'WHERE'
      '  cli_id = :cli_id')
    SQLLock.Strings = (
      'SELECT * FROM clientes'
      'WHERE'
      '  cli_id = :Old_cli_id'
      'FOR UPDATE')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM clientes')
    Connection = con_banco
    SQL.Strings = (
      'select * from clientes')
    Left = 288
    Top = 88
    object intgrfldSQL_clientecli_id: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'cli_id'
      Origin = 'clientes.cli_id'
    end
    object strngfldSQL_clientecli_nome: TStringField
      FieldName = 'cli_nome'
      Origin = 'clientes.cli_nome'
      Size = 70
    end
    object strngfldSQL_clientecli_cpf: TStringField
      FieldName = 'cli_cpf'
      Origin = 'clientes.cli_cpf'
      Size = 15
    end
    object strngfldSQL_clientecli_sexo: TStringField
      FieldName = 'cli_sexo'
      Origin = 'clientes.cli_sexo'
      Size = 2
    end
    object strngfldSQL_clientecli_telfixo: TStringField
      FieldName = 'cli_telfixo'
      Origin = 'clientes.cli_telfixo'
    end
    object strngfldSQL_clientecli_celular: TStringField
      FieldName = 'cli_celular'
      Origin = 'clientes.cli_celular'
    end
    object strngfldSQL_clientecli_logradouro: TStringField
      FieldName = 'cli_logradouro'
      Origin = 'clientes.cli_logradouro'
      Size = 80
    end
    object strngfldSQL_clientecli_bairro: TStringField
      FieldName = 'cli_bairro'
      Origin = 'clientes.cli_bairro'
      Size = 50
    end
    object intgrfldSQL_clientecli_cidade: TIntegerField
      FieldName = 'cli_cidade'
      Origin = 'clientes.cli_cidade'
    end
    object datafldSQL_clientecli_dataI: TDateTimeField
      FieldName = 'cli_dataI'
      Origin = 'clientes.cli_dataI'
    end
    object strngfldSQL_clientecli_apelido: TStringField
      FieldName = 'cli_apelido'
      Origin = 'clientes.cli_apelido'
      Size = 50
    end
    object strngfldSQL_clientecli_tipo: TStringField
      FieldName = 'cli_tipo'
      Origin = 'clientes.cli_tipo'
      Size = 10
    end
    object strngfldSQL_clientecli_TelRecado: TStringField
      FieldName = 'cli_TelRecado'
      Origin = 'clientes.cli_TelRecado'
    end
    object strngfldSQL_clientecli_complemento: TStringField
      FieldName = 'cli_complemento'
      Origin = 'clientes.cli_complemento'
      Size = 50
    end
    object strngfldSQL_clientecli_cep: TStringField
      FieldName = 'cli_cep'
      Origin = 'clientes.cli_cep'
      Size = 15
    end
    object strngfldSQL_clientecli_rg: TStringField
      FieldName = 'cli_rg'
      Origin = 'clientes.cli_rg'
    end
    object intgrfldSQL_clientecli_condicao: TIntegerField
      FieldName = 'cli_condicao'
      Origin = 'clientes.cli_condicao'
    end
    object dateSQL_clientecli_DataAlteracao: TDateTimeField
      FieldName = 'cli_DataAlteracao'
      Origin = 'clientes.cli_DataAlteracao'
    end
    object strngfldSQL_clientecli_numero: TStringField
      FieldName = 'cli_numero'
      Origin = 'clientes.cli_numero'
      Size = 15
    end
  end
  object ds_clientes: TMyDataSource
    DataSet = SQL_cliente
    Left = 288
    Top = 136
  end
  object SQL_fornecedor: TMyQuery
    SQLInsert.Strings = (
      'INSERT INTO fornecedores'
      
        '  (for_nome, for_fone1, for_fone2, for_email, for_cidade, for_re' +
        'presentante, for_telefone, for_nomeFantasia, for_logradouro, for' +
        '_numero, for_complemento, for_bairro, for_cep, for_cnpj, for_ins' +
        'cEst, for_condicao, for_dataCadastro, for_dataAlteracao)'
      'VALUES'
      
        '  (:for_nome, :for_fone1, :for_fone2, :for_email, :for_cidade, :' +
        'for_representante, :for_telefone, :for_nomeFantasia, :for_lograd' +
        'ouro, :for_numero, :for_complemento, :for_bairro, :for_cep, :for' +
        '_cnpj, :for_inscEst, :for_condicao, :for_dataCadastro, :for_data' +
        'Alteracao)')
    SQLDelete.Strings = (
      'DELETE FROM fornecedores'
      'WHERE'
      '  for_id = :Old_for_id')
    SQLUpdate.Strings = (
      'UPDATE fornecedores'
      'SET'
      
        '  for_nome = :for_nome, for_fone1 = :for_fone1, for_fone2 = :for' +
        '_fone2, for_email = :for_email, for_cidade = :for_cidade, for_re' +
        'presentante = :for_representante, for_telefone = :for_telefone, ' +
        'for_nomeFantasia = :for_nomeFantasia, for_logradouro = :for_logr' +
        'adouro, for_numero = :for_numero, for_complemento = :for_complem' +
        'ento, for_bairro = :for_bairro, for_cep = :for_cep, for_cnpj = :' +
        'for_cnpj, for_inscEst = :for_inscEst, for_condicao = :for_condic' +
        'ao, for_dataCadastro = :for_dataCadastro, for_dataAlteracao = :f' +
        'or_dataAlteracao'
      'WHERE'
      '  for_id = :Old_for_id')
    SQLRefresh.Strings = (
      
        'SELECT for_nome, for_fone1, for_fone2, for_email, for_cidade, fo' +
        'r_representante, for_telefone, for_nomeFantasia, for_logradouro,' +
        ' for_numero, for_complemento, for_bairro, for_cep, for_cnpj, for' +
        '_inscEst, for_condicao, for_dataCadastro, for_dataAlteracao FROM' +
        ' fornecedores'
      'WHERE'
      '  for_id = :for_id')
    SQLLock.Strings = (
      'SELECT * FROM fornecedores'
      'WHERE'
      '  for_id = :Old_for_id'
      'FOR UPDATE')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM fornecedores')
    Connection = con_banco
    SQL.Strings = (
      'select * from fornecedores')
    Left = 376
    Top = 88
    object intgrfldSQL_fornecedorfor_id: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'for_id'
      Origin = 'fornecedores.for_id'
    end
    object strngfldSQL_fornecedorfor_nome: TStringField
      FieldName = 'for_nome'
      Origin = 'fornecedores.for_nome'
      Size = 40
    end
    object strngfldSQL_fornecedorfor_fone1: TStringField
      FieldName = 'for_fone1'
      Origin = 'fornecedores.for_fone1'
    end
    object strngfldSQL_fornecedorfor_fone2: TStringField
      FieldName = 'for_fone2'
      Origin = 'fornecedores.for_fone2'
    end
    object strngfldSQL_fornecedorfor_email: TStringField
      FieldName = 'for_email'
      Origin = 'fornecedores.for_email'
      Size = 100
    end
    object intgrfldSQL_fornecedorfor_cidade: TIntegerField
      FieldName = 'for_cidade'
      Origin = 'fornecedores.for_cidade'
    end
    object strngfldSQL_fornecedorfor_representante: TStringField
      FieldName = 'for_representante'
      Origin = 'fornecedores.for_representante'
      Size = 100
    end
    object strngfldSQL_fornecedorfor_telefone: TStringField
      FieldName = 'for_telefone'
      Origin = 'fornecedores.for_telefone'
    end
    object strngfldSQL_fornecedorfor_nomeFantasia: TStringField
      FieldName = 'for_nomeFantasia'
      Origin = 'fornecedores.for_nomeFantasia'
      Size = 80
    end
    object strngfldSQL_fornecedorfor_logradouro: TStringField
      FieldName = 'for_logradouro'
      Origin = 'fornecedores.for_logradouro'
      Size = 80
    end
    object strngfldSQL_fornecedorfor_numero: TStringField
      FieldName = 'for_numero'
      Origin = 'fornecedores.for_numero'
      Size = 10
    end
    object strngfldSQL_fornecedorfor_complemento: TStringField
      FieldName = 'for_complemento'
      Origin = 'fornecedores.for_complemento'
      Size = 10
    end
    object strngfldSQL_fornecedorfor_bairro: TStringField
      FieldName = 'for_bairro'
      Origin = 'fornecedores.for_bairro'
      Size = 100
    end
    object strngfldSQL_fornecedorfor_cep: TStringField
      FieldName = 'for_cep'
      Origin = 'fornecedores.for_cep'
    end
    object strngfldSQL_fornecedorfor_cnpj: TStringField
      FieldName = 'for_cnpj'
      Origin = 'fornecedores.for_cnpj'
      Size = 30
    end
    object strngfldSQL_fornecedorfor_inscEst: TStringField
      FieldName = 'for_inscEst'
      Origin = 'fornecedores.for_inscEst'
      Size = 50
    end
    object intgrfldSQL_fornecedorfor_condicao: TIntegerField
      FieldName = 'for_condicao'
      Origin = 'fornecedores.for_condicao'
    end
    object dateSQL_fornecedorfor_dataCadastro: TDateTimeField
      FieldName = 'for_dataCadastro'
      Origin = 'fornecedores.for_dataCadastro'
    end
    object dateSQL_fornecedorfor_dataAlteracao: TDateTimeField
      FieldName = 'for_dataAlteracao'
      Origin = 'fornecedores.for_dataAlteracao'
    end
  end
  object ds_fornecedores: TMyDataSource
    DataSet = SQL_fornecedor
    Left = 376
    Top = 136
  end
  object SQL_marca: TMyQuery
    SQLInsert.Strings = (
      'INSERT INTO marcas'
      '  (marca_nome)'
      'VALUES'
      '  (:marca_nome)')
    SQLDelete.Strings = (
      'DELETE FROM marcas'
      'WHERE'
      '  marca_id = :Old_marca_id')
    SQLUpdate.Strings = (
      'UPDATE marcas'
      'SET'
      '  marca_nome = :marca_nome'
      'WHERE'
      '  marca_id = :Old_marca_id')
    SQLRefresh.Strings = (
      'SELECT marca_nome FROM marcas'
      'WHERE'
      '  marca_id = :marca_id')
    SQLLock.Strings = (
      'SELECT * FROM marcas'
      'WHERE'
      '  marca_id = :Old_marca_id'
      'FOR UPDATE')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM marcas')
    Connection = con_banco
    SQL.Strings = (
      'select * from marcas')
    Left = 208
    Top = 224
    object intgrfldSQL_marcamarca_id: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'marca_id'
      Origin = 'marcas.marca_id'
    end
    object strngfldSQL_marcamarca_nome: TStringField
      FieldName = 'marca_nome'
      Origin = 'marcas.marca_nome'
      Size = 40
    end
  end
  object ds_marcas: TMyDataSource
    DataSet = SQL_marca
    Left = 208
    Top = 272
  end
  object SQL_produto: TMyQuery
    SQLInsert.Strings = (
      'INSERT INTO produtos'
      
        '  (pro_nome, pro_barra, pro_preco, pro_marca, pro_obs, pro_forne' +
        'cedor, pro_grupo, pro_unidade, pro_referencia, pro_dataCadastro,' +
        ' pro_dataAlteracao, pro_PrecoMinimo, pro_Comissao, pro_NomeGrupo' +
        ')'
      'VALUES'
      
        '  (:pro_nome, :pro_barra, :pro_preco, :pro_marca, :pro_obs, :pro' +
        '_fornecedor, :pro_grupo, :pro_unidade, :pro_referencia, :pro_dat' +
        'aCadastro, :pro_dataAlteracao, :pro_PrecoMinimo, :pro_Comissao, ' +
        ':pro_NomeGrupo)')
    SQLDelete.Strings = (
      'DELETE FROM produtos'
      'WHERE'
      '  pro_id = :Old_pro_id')
    SQLUpdate.Strings = (
      'UPDATE produtos'
      'SET'
      
        '  pro_nome = :pro_nome, pro_barra = :pro_barra, pro_custo = :pro' +
        '_custo, pro_preco = :pro_preco, pro_estoque = :pro_estoque, pro_' +
        'marca = :pro_marca, pro_obs = :pro_obs, pro_fornecedor = :pro_fo' +
        'rnecedor, pro_grupo = :pro_grupo, pro_unidade = :pro_unidade, pr' +
        'o_referencia = :pro_referencia, pro_dataCadastro = :pro_dataCada' +
        'stro, pro_dataAlteracao = :pro_dataAlteracao, pro_dataUltimaComp' +
        'ra = :pro_dataUltimaCompra, pro_dataUltimaVenda = :pro_dataUltim' +
        'aVenda, pro_PrecoMinimo = :pro_PrecoMinimo, pro_Comissao = :pro_' +
        'Comissao, pro_NomeGrupo = :pro_NomeGrupo'
      'WHERE'
      '  pro_id = :Old_pro_id')
    SQLRefresh.Strings = (
      
        'SELECT pro_nome, pro_barra, pro_custo, pro_preco, pro_estoque, p' +
        'ro_marca, pro_obs, pro_fornecedor, pro_grupo, pro_unidade, pro_r' +
        'eferencia, pro_dataCadastro, pro_dataAlteracao, pro_dataUltimaCo' +
        'mpra, pro_dataUltimaVenda, pro_PrecoMinimo, pro_Comissao, pro_No' +
        'meGrupo FROM produtos'
      'WHERE'
      '  pro_id = :pro_id')
    SQLLock.Strings = (
      'SELECT * FROM produtos'
      'WHERE'
      '  pro_id = :Old_pro_id'
      'FOR UPDATE')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM produtos')
    Connection = con_banco
    SQL.Strings = (
      'select * from produtos')
    Left = 464
    Top = 88
    object intgrfldSQL_produtopro_id: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'pro_id'
      Origin = 'produtos.pro_id'
    end
    object strngfldSQL_produtopro_nome: TStringField
      FieldName = 'pro_nome'
      Origin = 'produtos.pro_nome'
      Size = 70
    end
    object strngfldSQL_produtopro_barra: TStringField
      FieldName = 'pro_barra'
      Origin = 'produtos.pro_barra'
      Size = 13
    end
    object fltfldSQL_produtopro_custo: TFloatField
      FieldName = 'pro_custo'
      Origin = 'produtos.pro_custo'
    end
    object fltfldSQL_produtopro_preco: TFloatField
      FieldName = 'pro_preco'
      Origin = 'produtos.pro_preco'
    end
    object intgrfldSQL_produtopro_estoque: TIntegerField
      FieldName = 'pro_estoque'
      Origin = 'produtos.pro_estoque'
    end
    object strngfldSQL_produtopro_obs: TStringField
      FieldName = 'pro_obs'
      Origin = 'produtos.pro_obs'
      Size = 255
    end
    object intgrfldSQL_produtopro_marca: TIntegerField
      FieldName = 'pro_marca'
      Origin = 'produtos.pro_marca'
    end
    object intgrfldSQL_produtopro_fornecedor: TIntegerField
      FieldName = 'pro_fornecedor'
      Origin = 'produtos.pro_fornecedor'
    end
    object intgrfldSQL_produtopro_grupo: TIntegerField
      FieldName = 'pro_grupo'
      Origin = 'produtos.pro_grupo'
    end
    object intgrfldSQL_produtopro_unidade: TIntegerField
      FieldName = 'pro_unidade'
      Origin = 'produtos.pro_unidade'
    end
    object strngfldSQL_produtopro_referencia: TStringField
      FieldName = 'pro_referencia'
      Origin = 'produtos.pro_referencia'
      Size = 50
    end
    object dateSQL_produtopro_dataCadastro: TDateTimeField
      FieldName = 'pro_dataCadastro'
      Origin = 'produtos.pro_dataCadastro'
    end
    object dateSQL_produtopro_dataAlteracao: TDateTimeField
      FieldName = 'pro_dataAlteracao'
      Origin = 'produtos.pro_dataAlteracao'
    end
    object dateSQL_produtopro_dataUltimaCompra: TDateTimeField
      FieldName = 'pro_dataUltimaCompra'
      Origin = 'produtos.pro_dataUltimaCompra'
    end
    object dateSQL_produtopro_dataUltimaVenda: TDateTimeField
      FieldName = 'pro_dataUltimaVenda'
      Origin = 'produtos.pro_dataUltimaVenda'
    end
    object floatSQL_produtopro_PrecoMinimo: TFloatField
      FieldName = 'pro_PrecoMinimo'
      Origin = 'produtos.pro_PrecoMinimo'
    end
    object floatSQL_produtopro_Comissao: TFloatField
      FieldName = 'pro_Comissao'
      Origin = 'produtos.pro_Comissao'
    end
    object strngfldSQL_produtopro_NomeGrupo: TStringField
      FieldName = 'pro_NomeGrupo'
      Origin = 'produtos.pro_NomeGrupo'
      Size = 50
    end
  end
  object ds_produtos: TMyDataSource
    DataSet = SQL_produto
    Left = 464
    Top = 136
  end
  object SQL_usuario: TMyQuery
    SQLInsert.Strings = (
      'INSERT INTO usuarios'
      
        '  (user_nome, user_login, user_senha, user_tipo, user_funcionari' +
        'o)'
      'VALUES'
      
        '  (:user_nome, :user_login, :user_senha, :user_tipo, :user_funci' +
        'onario)')
    SQLDelete.Strings = (
      'DELETE FROM usuarios'
      'WHERE'
      '  user_id = :Old_user_id')
    SQLUpdate.Strings = (
      'UPDATE usuarios'
      'SET'
      
        '  user_nome = :user_nome, user_login = :user_login, user_senha =' +
        ' :user_senha, user_tipo = :user_tipo, user_funcionario = :user_f' +
        'uncionario'
      'WHERE'
      '  user_id = :Old_user_id')
    SQLRefresh.Strings = (
      
        'SELECT user_nome, user_login, user_senha, user_tipo, user_funcio' +
        'nario FROM usuarios'
      'WHERE'
      '  user_id = :user_id')
    SQLLock.Strings = (
      'SELECT * FROM usuarios'
      'WHERE'
      '  user_id = :Old_user_id'
      'FOR UPDATE')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM usuarios')
    Connection = con_banco
    SQL.Strings = (
      'select * from usuarios')
    Left = 24
    Top = 224
    object intgrfldSQL_usuariouser_id: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'user_id'
      Origin = 'usuarios.user_id'
    end
    object strngfldSQL_usuariouser_nome: TStringField
      FieldName = 'user_nome'
      Origin = 'usuarios.user_nome'
      Size = 30
    end
    object strngfldSQL_usuariouser_login: TStringField
      FieldName = 'user_login'
      Origin = 'usuarios.user_login'
      Size = 30
    end
    object strngfldSQL_usuariouser_senha: TStringField
      FieldName = 'user_senha'
      Origin = 'usuarios.user_senha'
    end
    object intgrfldSQL_usuariouser_tipo: TIntegerField
      FieldName = 'user_tipo'
      Origin = 'usuarios.user_tipo'
    end
    object intgrfldSQL_usuariouser_funcionario: TIntegerField
      FieldName = 'user_funcionario'
      Origin = 'usuarios.user_funcionario'
    end
  end
  object ds_usuarios: TMyDataSource
    DataSet = SQL_usuario
    Left = 24
    Top = 272
  end
  object SQL_forma: TMyQuery
    SQLInsert.Strings = (
      'INSERT INTO forma'
      '  (forma_nome)'
      'VALUES'
      '  (:forma_nome)')
    SQLDelete.Strings = (
      'DELETE FROM forma'
      'WHERE'
      '  forma_id = :Old_forma_id')
    SQLUpdate.Strings = (
      'UPDATE forma'
      'SET'
      '  forma_nome = :forma_nome'
      'WHERE'
      '  forma_id = :Old_forma_id')
    SQLRefresh.Strings = (
      'SELECT forma_nome FROM forma'
      'WHERE'
      '  forma_id = :forma_id')
    SQLLock.Strings = (
      'SELECT * FROM forma'
      'WHERE'
      '  forma_id = :Old_forma_id'
      'FOR UPDATE')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM forma')
    Connection = con_banco
    SQL.Strings = (
      'select * from forma')
    Left = 296
    Top = 272
    object intgrfldSQL_formaforma_id: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'forma_id'
      Origin = 'forma.forma_id'
    end
    object strngfldSQL_formaforma_nome: TStringField
      FieldName = 'forma_nome'
      Origin = 'forma.forma_nome'
      Size = 30
    end
  end
  object ds_forma: TMyDataSource
    DataSet = SQL_forma
    Left = 296
    Top = 224
  end
  object SQL_grupo: TMyQuery
    SQLInsert.Strings = (
      'INSERT INTO grupos'
      '  (grupo_nome)'
      'VALUES'
      '  (:grupo_nome)')
    SQLDelete.Strings = (
      'DELETE FROM grupos'
      'WHERE'
      '  grupo_id = :Old_grupo_id')
    SQLUpdate.Strings = (
      'UPDATE grupos'
      'SET'
      '  grupo_nome = :grupo_nome'
      'WHERE'
      '  grupo_id = :Old_grupo_id')
    SQLRefresh.Strings = (
      'SELECT grupo_nome FROM grupos'
      'WHERE'
      '  grupo_id = :grupo_id')
    SQLLock.Strings = (
      'SELECT * FROM grupos'
      'WHERE'
      '  grupo_id = :Old_grupo_id'
      'FOR UPDATE')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM grupos')
    Connection = con_banco
    SQL.Strings = (
      'select * from grupos')
    Left = 552
    Top = 88
    object intgrfldSQL_grupogrupo_id: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'grupo_id'
      Origin = 'grupos.grupo_id'
    end
    object strngfldSQL_grupogrupo_nome: TStringField
      FieldName = 'grupo_nome'
      Origin = 'grupos.grupo_nome'
      Size = 50
    end
  end
  object ds_grupos: TMyDataSource
    DataSet = SQL_grupo
    Left = 552
    Top = 136
  end
  object SQL_funcionario: TMyQuery
    SQLInsert.Strings = (
      'INSERT INTO funcionarios'
      
        '  (func_nome, func_cpf, func_sexo, func_telFixo, func_celular, f' +
        'unc_logradouro, func_numero, func_bairro, func_cidade, func_carg' +
        'o, func_salario, func_dataI)'
      'VALUES'
      
        '  (:func_nome, :func_cpf, :func_sexo, :func_telFixo, :func_celul' +
        'ar, :func_logradouro, :func_numero, :func_bairro, :func_cidade, ' +
        ':func_cargo, :func_salario, :func_dataI)')
    SQLDelete.Strings = (
      'DELETE FROM funcionarios'
      'WHERE'
      '  func_id = :Old_func_id')
    SQLUpdate.Strings = (
      'UPDATE funcionarios'
      'SET'
      
        '  func_nome = :func_nome, func_cpf = :func_cpf, func_sexo = :fun' +
        'c_sexo, func_telFixo = :func_telFixo, func_celular = :func_celul' +
        'ar, func_logradouro = :func_logradouro, func_numero = :func_nume' +
        'ro, func_bairro = :func_bairro, func_cidade = :func_cidade, func' +
        '_cargo = :func_cargo, func_salario = :func_salario'
      'WHERE'
      '  func_id = :Old_func_id')
    SQLRefresh.Strings = (
      
        'SELECT func_nome, func_cpf, func_sexo, func_telFixo, func_celula' +
        'r, func_logradouro, func_numero, func_bairro, func_cidade, func_' +
        'cargo, func_salario, func_dataI FROM funcionarios'
      'WHERE'
      '  func_id = :func_id')
    SQLLock.Strings = (
      'SELECT * FROM funcionarios'
      'WHERE'
      '  func_id = :Old_func_id'
      'FOR UPDATE')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM funcionarios')
    Connection = con_banco
    SQL.Strings = (
      'select * from funcionarios')
    Left = 120
    Top = 224
    object intgrfldSQL_funcionariofunc_id: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'func_id'
      Origin = 'funcionarios.func_id'
    end
    object strngfldSQL_funcionariofunc_nome: TStringField
      FieldName = 'func_nome'
      Origin = 'funcionarios.func_nome'
      Size = 60
    end
    object strngfldSQL_funcionariofunc_cpf: TStringField
      FieldName = 'func_cpf'
      Origin = 'funcionarios.func_cpf'
    end
    object strngfldSQL_funcionariofunc_sexo: TStringField
      FieldName = 'func_sexo'
      Origin = 'funcionarios.func_sexo'
      Size = 1
    end
    object strngfldSQL_funcionariofunc_telFixo: TStringField
      FieldName = 'func_telFixo'
      Origin = 'funcionarios.func_telFixo'
    end
    object strngfldSQL_funcionariofunc_celular: TStringField
      FieldName = 'func_celular'
      Origin = 'funcionarios.func_celular'
    end
    object strngfldSQL_funcionariofunc_logradouro: TStringField
      FieldName = 'func_logradouro'
      Origin = 'funcionarios.func_logradouro'
      Size = 60
    end
    object strngfldSQL_funcionariofunc_numero: TStringField
      FieldName = 'func_numero'
      Origin = 'funcionarios.func_numero'
      Size = 5
    end
    object strngfldSQL_funcionariofunc_bairro: TStringField
      FieldName = 'func_bairro'
      Origin = 'funcionarios.func_bairro'
      Size = 60
    end
    object intgrfldSQL_funcionariofunc_cidade: TIntegerField
      FieldName = 'func_cidade'
      Origin = 'funcionarios.func_cidade'
    end
    object strngfldSQL_funcionariofunc_cargo: TStringField
      FieldName = 'func_cargo'
      Origin = 'funcionarios.func_cargo'
    end
    object floatSQL_funcionariofunc_salario: TFloatField
      FieldName = 'func_salario'
      Origin = 'funcionarios.func_salario'
    end
    object dateSQL_funcionariofunc_dataI: TDateTimeField
      FieldName = 'func_dataI'
      Origin = 'funcionarios.func_dataI'
    end
  end
  object ds_funcionarios: TMyDataSource
    DataSet = SQL_funcionario
    Left = 120
    Top = 272
  end
  object SQL_condicoes: TMyQuery
    SQLInsert.Strings = (
      'INSERT INTO condicoes'
      '  (cond_nome)'
      'VALUES'
      '  (:cond_nome)')
    SQLDelete.Strings = (
      'DELETE FROM condicoes'
      'WHERE'
      '  cond_id = :Old_cond_id')
    SQLUpdate.Strings = (
      'UPDATE condicoes'
      'SET'
      '  cond_nome = :cond_nome'
      'WHERE'
      '  cond_id = :Old_cond_id')
    SQLRefresh.Strings = (
      'SELECT cond_nome FROM condicoes'
      'WHERE'
      '  cond_id = :cond_id')
    SQLLock.Strings = (
      'SELECT * FROM condicoes'
      'WHERE'
      '  cond_id = :Old_cond_id'
      'FOR UPDATE')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM condicoes')
    Connection = con_banco
    SQL.Strings = (
      'select * from condicoes')
    Left = 392
    Top = 224
    object intgrfldSQL_condicoescond_id: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'cond_id'
      Origin = 'condicoes.cond_id'
    end
    object strngfldSQL_condicoescond_nome: TStringField
      FieldName = 'cond_nome'
      Origin = 'condicoes.cond_nome'
      Size = 60
    end
  end
  object ds_condicoes: TMyDataSource
    DataSet = SQL_condicoes
    Left = 392
    Top = 272
  end
  object SQL_parcela: TMyQuery
    SQLInsert.Strings = (
      'INSERT INTO parcelas'
      
        '  (parc_condicao, parc_numero, parc_dias, parc_percentual, parc_' +
        'forma)'
      'VALUES'
      
        '  (:parc_condicao, :parc_numero, :parc_dias, :parc_percentual, :' +
        'parc_forma)')
    SQLDelete.Strings = (
      'DELETE FROM parcelas'
      'WHERE'
      
        '  parc_condicao = :Old_parc_condicao AND parc_numero = :Old_parc' +
        '_numero')
    SQLUpdate.Strings = (
      'UPDATE parcelas'
      'SET'
      
        '  parc_condicao = :parc_condicao, parc_numero = :parc_numero, pa' +
        'rc_dias = :parc_dias, parc_percentual = :parc_percentual, parc_f' +
        'orma = :parc_forma'
      'WHERE'
      
        '  parc_condicao = :Old_parc_condicao AND parc_numero = :Old_parc' +
        '_numero')
    SQLRefresh.Strings = (
      
        'SELECT parc_condicao, parc_numero, parc_dias, parc_percentual, p' +
        'arc_forma FROM parcelas'
      'WHERE'
      '  parc_condicao = :parc_condicao AND parc_numero = :parc_numero')
    SQLLock.Strings = (
      'SELECT * FROM parcelas'
      'WHERE'
      
        '  parc_condicao = :Old_parc_condicao AND parc_numero = :Old_parc' +
        '_numero'
      'FOR UPDATE')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM parcelas')
    Connection = con_banco
    SQL.Strings = (
      'select * from parcelas')
    Left = 480
    Top = 224
    object intgrfldSQL_parcelaparc_condicao: TIntegerField
      FieldName = 'parc_condicao'
      Origin = 'parcelas.parc_condicao'
    end
    object intgrfldSQL_parcelaparc_numero: TIntegerField
      FieldName = 'parc_numero'
      Origin = 'parcelas.parc_numero'
    end
    object intgrfldSQL_parcelaparc_dias: TIntegerField
      FieldName = 'parc_dias'
      Origin = 'parcelas.parc_dias'
    end
    object floatSQL_parcelaparc_percentual: TFloatField
      FieldName = 'parc_percentual'
      Origin = 'parcelas.parc_percentual'
    end
    object intgrfldSQL_parcelaparc_forma: TIntegerField
      FieldName = 'parc_forma'
      Origin = 'parcelas.parc_forma'
    end
  end
  object ds_parcelas: TMyDataSource
    DataSet = SQL_parcela
    Left = 480
    Top = 272
  end
  object SQL_imagens: TMyQuery
    SQLInsert.Strings = (
      'INSERT INTO imagens'
      '  (cod_produto, caminho_imagem)'
      'VALUES'
      '  (:cod_produto, :caminho_imagem)')
    SQLDelete.Strings = (
      'DELETE FROM imagens'
      'WHERE'
      '  cod_imagem = :Old_cod_imagem')
    SQLUpdate.Strings = (
      'UPDATE imagens'
      'SET'
      '  caminho_imagem = :caminho_imagem'
      'WHERE'
      '  cod_imagem = :Old_cod_imagem')
    SQLRefresh.Strings = (
      'SELECT cod_produto, caminho_imagem FROM imagens'
      'WHERE'
      '  cod_imagem = :cod_imagem')
    SQLLock.Strings = (
      'SELECT * FROM imagens'
      'WHERE'
      '  cod_imagem = :Old_cod_imagem'
      'FOR UPDATE')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM imagens')
    Connection = con_banco
    SQL.Strings = (
      'select * from imagens')
    Active = True
    Left = 560
    Top = 224
    object SQL_imagenscod_imagem: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'cod_imagem'
      Origin = 'imagens.cod_imagem'
    end
    object SQL_imagenscod_produto: TIntegerField
      FieldName = 'cod_produto'
      Origin = 'imagens.cod_produto'
    end
    object SQL_imagenscaminho_imagem: TStringField
      FieldName = 'caminho_imagem'
      Origin = 'imagens.caminho_imagem'
      Size = 255
    end
  end
  object ds_imagens: TMyDataSource
    DataSet = SQL_imagens
    Left = 560
    Top = 280
  end
end