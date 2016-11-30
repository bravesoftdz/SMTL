unit uFrmCadastroProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastroPai, StdCtrls, uProduto, uController,
  uFrmConsultaMarca,uFrmConsultaFornecedor, uFrmConsultaGrupo, Buttons,
  ExtCtrls, ExtDlgs, jpeg, ucolecaoImagens, uimagem, ufrmConsultaImagem;

type
  TFrmCadastroProduto = class(TFrmCadastroPai)
    btn_habilitar: TButton;
    lbl_nome: TLabel;
    lbl_custo: TLabel;
    lbl_fone2: TLabel;
    lbl_email: TLabel;
    edt_nome: TEdit;
    edt_custo: TEdit;
    edt_preco: TEdit;
    edt_estoque: TEdit;
    lbl_1: TLabel;
    edt_barras: TEdit;
    edt_obs: TEdit;
    lbl_11: TLabel;
    lbl_cidade: TLabel;
    edt_codMarca: TEdit;
    edt_Marca: TEdit;
    btn_buscar: TButton;
    lbl_12: TLabel;
    edt_codFornecedor: TEdit;
    edt_Fornecedor: TEdit;
    btn_buscar1: TButton;
    lbl_data: TLabel;
    edt_data: TEdit;
    lbl_13: TLabel;
    edt_codGrupo: TEdit;
    edt_Grupo: TEdit;
    btn_buscar3: TButton;
    lbl1: TLabel;
    edt_dataAlteracao: TEdit;
    lbl2: TLabel;
    edt_unidade: TEdit;
    lbl3: TLabel;
    edt_referencia: TEdit;
    lbl4: TLabel;
    lbl5: TLabel;
    edt_dataUltimaCompra: TEdit;
    lbl6: TLabel;
    edt_dataUltimaVenda: TEdit;
    lbl7: TLabel;
    edt_precoMin: TEdit;
    lbl8: TLabel;
    edt2: TEdit;
    OPD: TOpenPictureDialog;
    Foto1: TImage;
    btn_foto1: TBitBtn;
    Foto2: TImage;
    Foto3: TImage;
    Foto4: TImage;
    Foto5: TImage;
    btn_foto2: TBitBtn;
    btn_foto3: TBitBtn;
    btn_foto4: TBitBtn;
    btn_foto5: TBitBtn;
    FOTOS: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    btn_excluir1: TButton;
    btn_excluir2: TButton;
    btn_excluir3: TButton;
    btn_excluir4: TButton;
    btn_excluir5: TButton;
    procedure btn_buscarClick(Sender: TObject);
    procedure btn_buscar1Click(Sender: TObject);
    procedure btn_habilitarClick(Sender: TObject);
    procedure edt_estoqueKeyPress(Sender: TObject; var Key: Char);
    procedure edt_precoKeyPress(Sender: TObject; var Key: Char);
    procedure edt_custoKeyPress(Sender: TObject; var Key: Char);
    procedure btn_buscar3Click(Sender: TObject);
    procedure edt_unidadeKeyPress(Sender: TObject; var Key: Char);
    procedure btn_foto1Click(Sender: TObject);
    procedure btn_foto2Click(Sender: TObject);
    procedure btn_foto3Click(Sender: TObject);
    procedure btn_foto4Click(Sender: TObject);
    procedure btn_foto5Click(Sender: TObject);
    procedure btn_excluir1Click(Sender: TObject);
    procedure btn_excluir2Click(Sender: TObject);
    procedure btn_excluir3Click(Sender: TObject);
    procedure btn_excluir4Click(Sender: TObject);
    procedure btn_excluir5Click(Sender: TObject);
    procedure Foto1DblClick(Sender: TObject);
    procedure Foto2DblClick(Sender: TObject);
    procedure Foto3DblClick(Sender: TObject);
    procedure Foto4DblClick(Sender: TObject);
    procedure Foto5DblClick(Sender: TObject);
    procedure edt_precoExit(Sender: TObject);
    procedure edt_precoMinExit(Sender: TObject);
    procedure edt2Exit(Sender: TObject);
    procedure edt_obsKeyPress(Sender: TObject; var Key: Char);
    procedure edt_custoExit(Sender: TObject);
  private
    { Private declarations }
    umProduto : Produto;
    umaColecaoImagens: ColecaoImagens;
    umTipoUsuario : Boolean;
    umFrmConsultaMarca: TFrmConsultaMarca;
    umFrmConsultaFornecedor : TFrmConsultaFornecedor;
    umFrmConsultaGrupo  : TFrmConsultaGrupo;
    umFrmConsultaImagem: TForm1;
  protected
        umController : controller;
        refGuardada: string;
        procedure Sair;  override;
        procedure Salvar; override;
        procedure CarregaEdit; override;
        procedure LimparCampos; override;
        procedure RestringeAcesso;
        procedure CarregaImagens;
        function verificaReal(texto: string): Boolean;
        function verificaInteiro(texto: string): Boolean;
        function validaCampos: Boolean;
        function verificaVirgula(texto: string): boolean;
        function duasCasas(texto: string): string;

  public
    { Public declarations }
        listaImagens: array[1..5] of string;
        procedure ConhecaObj(pObj : TObject; pController: controller); override;
        procedure SetConsultaMarca (pObj : TForm);
        procedure SetConsultaImagem (pObj : TForm);
        procedure SetConsultaGrupo (pObj : TForm);        
        procedure SetConsultaFornecedor (pObj : TForm);
        procedure DesabilitaCampos;
        procedure HabilitaCampos;
        procedure setTipoUsuario (pTipoUsuario: Boolean);
        function getTipoUsuario : Boolean;
end;

var
  FrmCadastroProduto: TFrmCadastroProduto;

implementation

{$R *.dfm}

{ TFrmCadastroProduto }

procedure TFrmCadastroProduto.CarregaEdit;
begin
  self.edt_cod.Text := IntToStr(umProduto.getCodigo);
  Self.edt_nome.Text := umProduto.getNome;
  Self.edt_data.Text := DateToStr(umProduto.getDataCadastro);
  Self.edt_dataAlteracao.Text := DateToStr(umProduto.getDataAlteracao);
  self.edt_dataUltimaCompra.Text := datetostr(umProduto.getDataUltimaCompra);
  self.edt_dataUltimaVenda.Text  := datetostr(umProduto.getDataUltimaVenda);
  self.edt_barras.Text := umProduto.getBarra;
  self.edt_custo.Text := FloatToStr(umProduto.getCusto);
  self.edt_preco.Text := FloatToStr(umProduto.getPreco);
  Self.edt_estoque.Text := IntToStr(umProduto.getEstoque);
  self.edt_obs.Text := umProduto.getObservacao;
  Self.edt_codMarca.Text := IntToStr(umProduto.getUmaMarca.getCodigo);
  self.edt_Marca.Text := umProduto.getUmaMarca.getNome;
  self.edt_codFornecedor.Text := IntToStr(umProduto.getUmFornecedor.getCodigo);
  self.edt_Fornecedor.Text := umProduto.getUmFornecedor.getNome;
  self.edt_Grupo.Text := umproduto.getUmGrupo.getNome;
  self.edt_codGrupo.Text := IntToStr(umProduto.getUmGrupo.getCodigo);
  self.edt_unidade.Text := IntToStr(umProduto.getUnidade);
  self.edt_referencia.Text := umProduto.getReferencia;
  self.edt_precoMin.Text := FloatToStr(umProduto.getPrecoMin);
  self.edt2.Text := FloatToStr(umProduto.getComissao);
  self.CarregaImagens;
end;

procedure TFrmCadastroProduto.RestringeAcesso;
begin
   if Self.getTipoUsuario = False then
   begin
    self.btn_habilitar.Visible := False;
    self.btn_salvar.Visible := False;
   end;
end;

procedure TFrmCadastroProduto.ConhecaObj(pObj: TObject;
  pController: controller);
begin
  umProduto := Produto (pObj);
  umaColecaoImagens := ColecaoImagens.CrieObjeto;
  umController := pController;
    Self.LimparCampos;
    self.edt_data.Text := DateToStr(Date);
    self.edt_dataAlteracao.Text := DateToStr(Date);
      if umProduto.getCodigo <> 0 then
                begin
                  umController.getControllerProduto.carregaImagens(umProduto,umaColecaoImagens);
                  refGuardada := umProduto.getReferencia;
                  Self.CarregaEdit;
                end;

      if Self.getTipoUsuario = True then
        begin
          self.btn_salvar.Visible := True;
          self.btn_habilitar.Visible := True;
        end;

      if self.getTipoUsuario = False then
          Self.RestringeAcesso;

      if self.btn_salvar.Caption = '&Salvar' then
        HabilitaCampos
      else
        DesabilitaCampos;
end;

procedure TFrmCadastroProduto.DesabilitaCampos;
begin
  Self.edt_nome.Enabled := False;
  self.edt_barras.Enabled := False;
  self.edt_preco.Enabled := False;
  self.edt_custo.Enabled := False;
  self.edt_obs.Enabled := False;
  Self.btn_buscar.Enabled := False;
  self.btn_buscar1.Enabled := False;
  Self.btn_buscar3.Enabled := False;

  self.edt_referencia.Enabled := false;
  self.edt_unidade.Enabled := False;
  self.edt_precoMin.Enabled := False;
  self.edt2.Enabled := false;

  btn_foto1.Enabled := false;
  btn_foto2.Enabled := false;
  btn_foto3.Enabled := false;
  btn_foto4.Enabled := false;
  btn_foto5.Enabled := false;

  btn_excluir1.Enabled := false;
  btn_excluir2.Enabled := false;
  btn_excluir3.Enabled := false;
  btn_excluir4.Enabled := false;
  btn_excluir5.Enabled := false;
end;

procedure TFrmCadastroProduto.HabilitaCampos;
begin
  Self.edt_nome.Enabled := True;
  self.edt_barras.Enabled := True;
  self.edt_preco.Enabled := True;
  self.edt_custo.Enabled := True;
  self.edt_obs.Enabled := True;
  Self.btn_buscar.Enabled := True;
  self.btn_buscar1.Enabled := True;
  Self.btn_buscar3.Enabled := True;
  self.edt_referencia.Enabled := True;
  self.edt_unidade.Enabled := True;
  self.edt_precoMin.Enabled := True;
  self.edt2.Enabled := True;
  btn_foto1.Enabled := True;
  btn_foto2.Enabled := True;
  btn_foto3.Enabled := True;
  btn_foto4.Enabled := True;
  btn_foto5.Enabled := True;
  btn_excluir1.Enabled := True;
  btn_excluir2.Enabled := True;
  btn_excluir3.Enabled := True;
  btn_excluir4.Enabled := True;
  btn_excluir5.Enabled := True;
end;

procedure TFrmCadastroProduto.LimparCampos;
begin
  self.refGuardada := '';
  self.edt_cod.Clear;
  self.edt_dataUltimaCompra.Clear;
  Self.edt_nome.Clear;
  self.edt_barras.Clear;
  self.edt_custo.Clear;
  self.edt_preco.Clear;
  Self.edt_estoque.Clear;
  self.edt_obs.Clear;
  Self.edt_codMarca.Clear;
  self.edt_Marca.Clear;
  self.edt_codFornecedor.Clear;
  self.edt_Fornecedor.Clear;
  self.edt_Grupo.Clear;
  Self.edt_codGrupo.Clear;
  self.edt_unidade.Clear;
  self.edt_precoMin.Clear;
  self.edt2.Clear;
  self.edt_referencia.Clear;
  foto1.Picture := nil;
  foto2.Picture := nil;
  foto3.Picture := nil;
  foto4.Picture := nil;
  foto5.Picture := nil;
end;

procedure TFrmCadastroProduto.Sair;
begin
  inherited;

end;

procedure TFrmCadastroProduto.Salvar;
var incluido, excluido, permitir : string;
selected, k : integer;
men : TForm;
begin
    if self.btn_salvar.Caption = '&Salvar' then
        begin
          if validaCampos = True then
              begin
                        self.edt_dataAlteracao.Text := DateToStr(Date);
                        umProduto.setNome(self.edt_nome.Text);
                        umProduto.setPreco(StrToFloat(self.edt_preco.Text));
                        umProduto.setObservacao(self.edt_obs.Text);
                        umProduto.setUnidade(StrToInt(edt_unidade.Text));
                        umProduto.setReferencia(edt_referencia.Text);
                        umProduto.setPrecoMin(StrToFloat(edt_precoMin.Text));
                        umProduto.setComissao(StrToFloat(edt2.Text));
                        umProduto.setDataAlteracao(StrToDate(self.edt_dataAlteracao.Text));
                        umProduto.setCusto(StrToFloat(self.edt_custo.Text));
                        umProduto.setEstoque(StrToInt(self.edt_estoque.Text));
                        umProduto.setBarra(self.edt_barras.Text);
                        umaColecaoImagens.organizaLista;

                permitir := umController.getcontrollerProduto.pesquisaSalvar(umproduto.getReferencia);
                  if (permitir = 'OK') or ( (permitir = 'EXISTE') and (refGuardada = umProduto.getReferencia)  ) then
                      begin
                            incluido :=  umController.getControllerProduto.salvaProduto(umProduto,umaColecaoImagens);
                                 if incluido = 'OK' then
                                    if umProduto.getCodigo = 0 then
                                      ShowMessage(umProduto.getNome + ' inclu�do com sucesso!')
                                    else
                                      ShowMessage(umProduto.getNome + ' alterado com sucesso!');
                           inherited
                      end
                  else
                     begin
                         ShowMessage('Produto com refer�ncia j� cadastrada!');
                         edt_referencia.SetFocus;
                     end;

              end;
        end
        else
            begin
               men := CreateMessageDialog('Deseja mesmo excluir o produto ' + QuotedStr(umProduto.getNome) + '?',mtCustom,[mbYes,mbAbort]);
               men.Caption := 'Confirma��o';
               men.Position := poDesktopCenter;
               selected := men.ShowModal;

                if selected = mrYes then
                  begin
                    For k :=1 to umaColecaoImagens.getQtd do
                     begin
                        umController.getControllerProduto.excluirImagem(umaColecaoImagens.getObj(k));
                     end;

                    excluido :=  umController.getControllerProduto.excluiProduto(umProduto);

                    if excluido = 'OK' then
                      begin
                       ShowMessage(QuotedStr(umProduto.getNome) + ' exclu�do com sucesso!')
                      end
                    else
                      Showmessage('N�o foi poss�vel excluir o produto! H� compras vinculadas a ele!');
                  inherited;
                  end;
            end;
end;

procedure TFrmCadastroProduto.SetConsultaFornecedor(pObj: TForm);
begin
   umFrmConsultaFornecedor := TFrmConsultaFornecedor (pObj);
end;

procedure TFrmCadastroProduto.SetConsultaMarca(pObj: TForm);
begin
   umFrmConsultaMarca := TFrmConsultaMarca (pObj);
end;

procedure TFrmCadastroProduto.btn_buscarClick(Sender: TObject);
begin
  umFrmConsultaMarca.ConhecaObj(umProduto.getUmaMarca,umController);
  umFrmConsultaMarca.btn_Sair.Caption := 'Selecionar';      umFrmConsultaMarca.ShowModal;
  Self.edt_codMarca.Text := IntToStr(umProduto.getumaMarca.getCodigo);
  Self.edt_Marca.Text := umProduto.getumaMarca.getNome;
  umFrmConsultaMarca.btn_Sair.Caption := 'Sair';
end;

procedure TFrmCadastroProduto.btn_buscar1Click(Sender: TObject);
begin
  umFrmConsultaFornecedor.ConhecaObj(umProduto.getUmFornecedor,umController);
  umFrmConsultaFornecedor.btn_Sair.Caption := 'Selecionar';
  umFrmConsultaFornecedor.ShowModal;
  Self.edt_codFornecedor.Text := IntToStr(umProduto.getUmFornecedor.getCodigo);
  Self.edt_Fornecedor.Text := umProduto.getUmFornecedor.getNome;
  umFrmConsultaFornecedor.btn_Sair.Caption := 'Sair';
end;

procedure TFrmCadastroProduto.btn_habilitarClick(Sender: TObject);
begin
  inherited;
  self.HabilitaCampos;
  self.btn_salvar.Enabled := true;
  self.btn_habilitar.Enabled := False;
end;

procedure TFrmCadastroProduto.edt_estoqueKeyPress(Sender: TObject;
  var Key: Char);
begin
    if not (Key in ['0'..'9',#16,#8,#9,#13,#20,#36,#37,#46,#107] ) or
     (Key in ['K','k']) then
      begin
          ShowMessage('Apenas n�meros!');
          Key := #0;
      end;
end;

procedure TFrmCadastroProduto.edt_precoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9',',',#16,#8,#9,#13,#20,#36,#37,#46,#107] ) or
     (Key in ['K','k']) then
      begin
          ShowMessage('Apenas n�meros e v�rgula!');
          Key := #0;
      end;
end;

procedure TFrmCadastroProduto.edt_custoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9',',',#16,#8,#9,#13,#20,#36,#37,#46,#107] ) or
     (Key in ['K','k']) then
      begin
          ShowMessage('Apenas n�meros e v�rgula!');
          Key := #0;
      end;
end;

function TFrmCadastroProduto.getTipoUsuario: Boolean;
begin
   Result := self.umTipoUsuario;
end;

procedure TFrmCadastroProduto.setTipoUsuario(pTipoUsuario: Boolean);
begin
   self.umTipoUsuario := pTipoUsuario;
end;

procedure TFrmCadastroProduto.btn_buscar3Click(Sender: TObject);
begin
  umFrmConsultaGrupo.ConhecaObj(umProduto.getUmGrupo,umController);
  umFrmConsultaGrupo.btn_Sair.Caption := 'Selecionar';
  umFrmConsultaGrupo.ShowModal;
  Self.edt_codGrupo.Text := IntToStr(umProduto.getumGrupo.getCodigo);
  Self.edt_Grupo.Text := umProduto.getUmGrupo.getNome;
  umFrmConsultaGrupo.btn_Sair.Caption := 'Sair';
end;

procedure TFrmCadastroProduto.SetConsultaGrupo(pObj: TForm);
begin
   umFrmConsultaGrupo := TFrmConsultaGrupo(pObj);
end;

function TFrmCadastroProduto.verificaReal(texto: string): Boolean;
begin
    try
       StrToFloat(texto);
       Result := True;
    except
       Result := False;
    end;
end;

procedure TFrmCadastroProduto.edt_unidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
    if not (Key in ['0'..'9',#16,#8,#9,#13,#20,#36,#37,#46,#107] ) or
     (Key in ['K','k']) then
      begin
          ShowMessage('Apenas n�meros!');
          Key := #0;
      end;
end;

function TFrmCadastroProduto.verificaInteiro(texto: string): Boolean;
begin
    try
      StrToInt(texto);
      Result := True;
    except
      Result:= False;
    end;
end;

function TFrmCadastroProduto.validaCampos: Boolean;
begin
     Result := False;
           if self.edt2.Text = '' then
            self.edt2.Text:= '0';

           if self.edt_precoMin.Text = '' then
            self.edt_precoMin.Text := self.edt_preco.Text;
            
                if (self.edt_nome.Text = '') then
                    begin
                      ShowMessage('Campo nome � obrigat�rio!');
                      self.edt_nome.SetFocus;
                    end
                else if (self.edt_unidade.Text = '') then
                    begin
                      ShowMessage('Campo unidade � obrigat�rio!');
                      self.edt_unidade.SetFocus;
                    end
                else if (self.edt_referencia.Text = '') then
                    begin
                      ShowMessage('Campo refer�ncia � obrigat�rio!');
                      self.edt_unidade.SetFocus;
                    end
                else if (Self.edt_preco.Text = '') then
                    begin
                      ShowMessage('Campo pre�o � obrigat�rio!');
                      self.edt_preco.SetFocus;
                    end

                else if (self.edt_Marca.Text = '') then
                    begin
                      ShowMessage('Campo marca � obrigat�rio!');
                      self.btn_buscar.SetFocus;
                    end
                else  if (self.edt_Fornecedor.Text = '') then
                    begin
                      ShowMessage('Campo fornecedor � obrigat�rio!');
                      self.btn_buscar1.SetFocus;
                    end
                else if (self.edt_Grupo.Text = '') then
                    begin
                      ShowMessage('Campo grupo � obrigat�rio!');
                      self.btn_buscar3.SetFocus;
                    end
                else if (verificaInteiro(self.edt_unidade.Text) = False) then
                    begin
                      ShowMessage('Por favor, digite um n�mero inteiro no campo "Unidade" ');
                      Self.edt_unidade.SetFocus;
                    end

                 else if (verificaReal(self.edt_preco.Text) = False) then
                    begin
                      ShowMessage('Valor digitado no pre�o de venda � inv�lido!' + #13 + 'Formato: 0,00 ou n�meros inteiros');
                      self.edt_preco.SetFocus;
                      self.edt_precoMin.Clear;
                    end

                 else if (verificaReal(self.edt_precoMin.Text) = False) then
                    begin
                      ShowMessage('Valor digitado no pre�o m�nimo � inv�lido!' + #13 + 'Formato: 0,00 ou n�meros inteiros');
                      self.edt_precoMin.SetFocus;
                    end

                 else if (verificaReal(self.edt2.Text) = False) then
                    begin
                      ShowMessage('Valor digitado na comiss�o � inv�lido!' + #13 + 'Formato: 0,00 ou n�meros inteiros');
                      self.edt2.SetFocus;
                    end

                 else
                    begin

                      if ( StrToFloat(edt_preco.Text) < StrToFloat(edt_precoMin.Text) ) then
                            edt_precoMin.Text := edt_preco.Text;

                      if self.edt_unidade.Text = '0' then
                            self.edt_unidade.Text := '1';

                      if Self.edt_custo.Text = '' then
                          self.edt_custo.Text := '0';

                      if Self.edt_estoque.Text = '' then
                          self.edt_estoque.Text := '0';

                      if self.edt_barras.Text = '' then
                                begin
                                  self.edt_barras.Text := FormatDateTime('ddmmyy',Date) + FormatDateTime('hhmmss',Time);
                                end;
                      Result := True;
                    end;  
end;

procedure TFrmCadastroProduto.btn_foto1Click(Sender: TObject);
var arquivo: string;
umaImagem: Imagem;
begin
 if OPD.Execute then
    begin
       //se estava vazio, faz isso
     if umaColecaoImagens.getObj(1) = nil then
        begin
          umaImagem:= Imagem.crieobj;
          umaImagem.setCodigo(0);
          umaImagem.setProduto(0);
        end
       else   //se nao estava vazio, seta na imagem o que veio da lista
        begin
          umaImagem:= Imagem.crieobj;
          umaImagem.setCodigo(umaColecaoImagens.getobj(1).getCodigo);
          umaImagem.setProduto(umaColecaoImagens.getobj(1).getProduto);
          umaColecaoImagens.exclui(1);
        end;

       //essa parte vale tanto pra novas, como pra editadas
       //carrega do arquivo, seta o caminho, e insere na lista
       Foto1.Picture.LoadFromFile(opd.FileName);
       arquivo:= OPD.FileName;
       umaImagem.setCaminho(arquivo);

       umaColecaoImagens.insere(umaImagem,1);
       opd.FileName := '';
    end;
end;

procedure TFrmCadastroProduto.btn_foto2Click(Sender: TObject);
var arquivo: string;
umaImagem: Imagem;
begin
 if OPD.Execute then
    begin
       //se estava vazio, faz isso
     if umaColecaoImagens.getObj(2) = nil then
        begin
          umaImagem:= Imagem.crieobj;
          umaImagem.setCodigo(0);
          umaImagem.setProduto(0);
        end
       else   //se nao estava vazio, seta na imagem o que veio da lista
        begin
          umaImagem:= Imagem.crieobj;
          umaImagem.setCodigo(umaColecaoImagens.getobj(2).getCodigo);
          umaImagem.setProduto(umaColecaoImagens.getobj(2).getProduto);
          umaColecaoImagens.exclui(2);
        end;

       //essa parte vale tanto pra novas, como pra editadas
       //carrega do arquivo, seta o caminho, e insere na lista
       Foto2.Picture.LoadFromFile(opd.FileName);
       arquivo:= OPD.FileName;
       umaImagem.setCaminho(arquivo);
       umaColecaoImagens.insere(umaImagem,2);
       opd.FileName := '';
    end;
end;

procedure TFrmCadastroProduto.btn_foto3Click(Sender: TObject);
var arquivo: string;
umaImagem: Imagem;
begin
 if OPD.Execute then
    begin
       //se estava vazio, faz isso
     if umaColecaoImagens.getObj(3) = nil then
        begin
          umaImagem:= Imagem.crieobj;
          umaImagem.setCodigo(0);
          umaImagem.setProduto(0);
        end
       else   //se nao estava vazio, seta na imagem o que veio da lista
        begin
          umaImagem:= Imagem.crieobj;
          umaImagem.setCodigo(umaColecaoImagens.getobj(3).getCodigo);
          umaImagem.setProduto(umaColecaoImagens.getobj(3).getProduto);
          umaColecaoImagens.exclui(3);
        end;

       //essa parte vale tanto pra novas, como pra editadas
       //carrega do arquivo, seta o caminho, e insere na lista
       Foto3.Picture.LoadFromFile(opd.FileName);
       arquivo:= OPD.FileName;
       umaImagem.setCaminho(arquivo);
       umaColecaoImagens.insere(umaImagem,3);
       opd.FileName := '';
    end;
end;

procedure TFrmCadastroProduto.btn_foto4Click(Sender: TObject);
var arquivo: string;
umaImagem: Imagem;
begin
 if OPD.Execute then
    begin
       //se estava vazio, faz isso
     if umaColecaoImagens.getObj(4) = nil then
        begin
          umaImagem:= Imagem.crieobj;
          umaImagem.setCodigo(0);
          umaImagem.setProduto(0);
        end
       else   //se nao estava vazio, seta na imagem o que veio da lista
        begin
          umaImagem:= Imagem.crieobj;
          umaImagem.setCodigo(umaColecaoImagens.getobj(4).getCodigo);
          umaImagem.setProduto(umaColecaoImagens.getobj(4).getProduto);
          umaColecaoImagens.exclui(4);
        end;

       //essa parte vale tanto pra novas, como pra editadas
       //carrega do arquivo, seta o caminho, e insere na lista
       Foto4.Picture.LoadFromFile(opd.FileName);
       arquivo:= OPD.FileName;
       umaImagem.setCaminho(arquivo); 

       umaColecaoImagens.insere(umaImagem,4);
       opd.FileName := '';
    end;
end;

procedure TFrmCadastroProduto.btn_foto5Click(Sender: TObject);
var arquivo: string;
umaImagem: Imagem;
begin
 if OPD.Execute then
    begin
       //se estava vazio, faz isso
     if umaColecaoImagens.getObj(5) = nil then
        begin
          umaImagem:= Imagem.crieobj;
          umaImagem.setCodigo(0);
          umaImagem.setProduto(0);
        end
       else   //se nao estava vazio, seta na imagem o que veio da lista
        begin
          umaImagem:= Imagem.crieobj;
          umaImagem.setCodigo(umaColecaoImagens.getobj(5).getCodigo);
          umaImagem.setProduto(umaColecaoImagens.getobj(5).getProduto);
          umaColecaoImagens.exclui(5);
        end;

       //essa parte vale tanto pra novas, como pra editadas
       //carrega do arquivo, seta o caminho, e insere na lista
       Foto5.Picture.LoadFromFile(opd.FileName);
       arquivo:= OPD.FileName;
       umaImagem.setCaminho(arquivo); 

       umaColecaoImagens.insere(umaImagem,5);
       opd.FileName := '';
    end;
end;

procedure TFrmCadastroProduto.CarregaImagens;
var k: integer;
imagemNil: Imagem;
begin
  if not umaColecaoImagens.vazia then
  begin
    //imagemNil := imagemNil.crieobj;
    imagemNil := nil;

    for k:=1 to umaColecaoImagens.getQtd do
    begin
      if k = 1 then
         try
          Foto1.Picture.LoadFromFile(umaColecaoImagens.getObj(k).getCaminho);
         except
          umController.getControllerProduto.excluirImagem(umaColecaoImagens.getObj(k));
          foto1.Picture := nil;
          umaColecaoImagens.setObj(imagemNil,k);
          umaColecaoImagens.setQtd(umaColecaoImagens.getQtd - 1);
         end;
      if k = 2 then
         try
          Foto2.Picture.LoadFromFile(umaColecaoImagens.getObj(k).getCaminho);
         except
         end;
      if k = 3 then
         try
          Foto3.Picture.LoadFromFile(umaColecaoImagens.getObj(k).getCaminho);
         except
         end;
      if k = 4 then
         try
          Foto4.Picture.LoadFromFile(umaColecaoImagens.getObj(k).getCaminho);
         except
         end;
      if k = 5 then
         try
          Foto5.Picture.LoadFromFile(umaColecaoImagens.getObj(k).getCaminho);
         except
         end;
    end;
  end;
end;

procedure TFrmCadastroProduto.btn_excluir1Click(Sender: TObject);
var imagemAux: Imagem;
men: Tform;
selected: integer;
begin
 if umaColecaoImagens.getObj(1) <> nil then
     begin
            begin
               men := CreateMessageDialog('Deseja mesmo excluir esta foto?',mtCustom,[mbYes,mbAbort]);
               men.Caption := 'Confirma��o';
               men.Position := poDefault;
               selected := men.ShowModal;

                if selected = mrYes then
                  begin
                   //   imagemAux := imagem.crieobj;
                      imagemAux := umaColecaoImagens.getObj(1);
                        try
                         umController.getControllerProduto.excluirImagem(imagemAux);
                        except
                        end;
                      umaColecaoImagens.exclui(1);
                      Foto1.Picture := nil;
                  end;
            end;
     end;
end;

procedure TFrmCadastroProduto.btn_excluir2Click(Sender: TObject);
var imagemAux: Imagem;
men: Tform;
selected: integer;
begin
 if umaColecaoImagens.getObj(2) <> nil then
     begin
            begin
               men := CreateMessageDialog('Deseja mesmo excluir esta foto?',mtCustom,[mbYes,mbAbort]);
               men.Caption := 'Confirma��o';
               men.Position := poDefault;
               selected := men.ShowModal;

                if selected = mrYes then
                  begin
                   //   imagemAux := imagem.crieobj;
                      imagemAux := umaColecaoImagens.getObj(2);
                       try
                        umController.getControllerProduto.excluirImagem(imagemAux);
                       except
                       end;
                      umaColecaoImagens.exclui(2);
                      Foto2.Picture := nil;
                  end;
            end;
     end;
end;

procedure TFrmCadastroProduto.btn_excluir3Click(Sender: TObject);
var imagemAux: Imagem;
men: Tform;
selected: integer;
begin
 if umaColecaoImagens.getObj(3) <> nil then
     begin
            begin
               men := CreateMessageDialog('Deseja mesmo excluir esta foto?',mtCustom,[mbYes,mbAbort]);
               men.Caption := 'Confirma��o';
               men.Position := poDefault;
               selected := men.ShowModal;

                if selected = mrYes then
                  begin
                    //  imagemAux := imagem.crieobj;
                      imagemAux := umaColecaoImagens.getObj(3);
                       try
                        umController.getControllerProduto.excluirImagem(imagemAux);
                       except
                       end;
                      umaColecaoImagens.exclui(3);
                      Foto3.Picture := nil;
                  end;
            end;
     end;
end;

procedure TFrmCadastroProduto.btn_excluir4Click(Sender: TObject);
var imagemAux: Imagem;
men: Tform;
selected: integer;
begin
 if umaColecaoImagens.getObj(4) <> nil then
     begin
            begin
               men := CreateMessageDialog('Deseja mesmo excluir esta foto?',mtCustom,[mbYes,mbAbort]);
               men.Caption := 'Confirma��o';
               men.Position := poDefault;
               selected := men.ShowModal;

                if selected = mrYes then
                  begin
                  //    imagemAux := imagem.crieobj;
                      imagemAux := umaColecaoImagens.getObj(4);
                        try
                          umController.getControllerProduto.excluirImagem(imagemAux);
                        except
                        end;
                      umaColecaoImagens.exclui(4);
                      Foto4.Picture := nil;
                  end;
            end;
     end;
end;

procedure TFrmCadastroProduto.btn_excluir5Click(Sender: TObject);
var imagemAux: Imagem;
men: Tform;
selected: integer;
begin
 if umaColecaoImagens.getObj(5) <> nil then
     begin
            begin
               men := CreateMessageDialog('Deseja mesmo excluir esta foto?',mtCustom,[mbYes,mbAbort]);
               men.Caption := 'Confirma��o';
               men.Position := poDefault;
               selected := men.ShowModal;

                if selected = mrYes then
                  begin
                   //   imagemAux := imagem.crieobj;
                      imagemAux := umaColecaoImagens.getObj(5);
                        try
                         umController.getControllerProduto.excluirImagem(imagemAux);
                        except
                        end;
                      umaColecaoImagens.exclui(5);
                      Foto5.Picture := nil;
                  end;
            end;
     end;
end;

procedure TFrmCadastroProduto.SetConsultaImagem(pObj: TForm);
begin
     umFrmConsultaImagem := TForm1 (pObj);
end;

procedure TFrmCadastroProduto.Foto1DblClick(Sender: TObject);
begin
  inherited;
   if umaColecaoImagens.getObj(1) <> nil then
    begin
      umFrmConsultaImagem.ConhecaObj(umaColecaoImagens.getObj(1),umaColecaoImagens);
      umFrmConsultaImagem.ShowModal;
    end;
end;

procedure TFrmCadastroProduto.Foto2DblClick(Sender: TObject);
begin
  inherited;
   if umaColecaoImagens.getObj(2) <> nil then
    begin
      umFrmConsultaImagem.ConhecaObj(umaColecaoImagens.getObj(2),umaColecaoImagens);
      umFrmConsultaImagem.ShowModal;
    end;
end;

procedure TFrmCadastroProduto.Foto3DblClick(Sender: TObject);
begin
  inherited;
   if umaColecaoImagens.getObj(3) <> nil then
    begin
      umFrmConsultaImagem.ConhecaObj(umaColecaoImagens.getObj(3),umaColecaoImagens);
      umFrmConsultaImagem.ShowModal;
    end;
end;

procedure TFrmCadastroProduto.Foto4DblClick(Sender: TObject);
begin
  inherited;
   if umaColecaoImagens.getObj(4) <> nil then
    begin
      umFrmConsultaImagem.ConhecaObj(umaColecaoImagens.getObj(4),umaColecaoImagens);
      umFrmConsultaImagem.ShowModal;
    end;
end;

procedure TFrmCadastroProduto.Foto5DblClick(Sender: TObject);
begin
  inherited;
   if umaColecaoImagens.getObj(5) <> nil then
    begin
      umFrmConsultaImagem.ConhecaObj(umaColecaoImagens.getObj(5),umaColecaoImagens);
      umFrmConsultaImagem.ShowModal;
    end;
end;

procedure TFrmCadastroProduto.edt_precoExit(Sender: TObject);
var aux : real;
begin
  inherited;
  if verificaReal(edt_preco.Text) then
  begin
    if not verificaVirgula(edt_preco.Text) then
       begin
         aux := strtofloat(edt_preco.Text);
         edt_preco.Text := floattostr(aux) + ',00';
       end;
    if strtofloat(edt_preco.Text) < 0 then
     edt_preco.Text := '0,00';
  end
  else if not (verificaReal(edt_preco.Text)) and (edt_preco.Text <> '') then
    begin
     ShowMessage('Apenas n�meros e v�rgula - Formato: o,oo ');
     edt_preco.Text := '0,00';
     edt_preco.SetFocus;
    end
  else
     edt_preco.Text := '0,00';

  edt_preco.Text := duasCasas(edt_preco.Text);
end;

function TFrmCadastroProduto.verificaVirgula(texto: string): boolean;
var k: integer;
begin
   result := false;
      for k := 1 to length(texto) do
        begin
           if texto[k] = ',' then
             begin
               Result := true;
               exit;
             end;
        end;
end;

procedure TFrmCadastroProduto.edt_precoMinExit(Sender: TObject);
var aux : real;
begin
  inherited;
  if verificaReal(edt_precoMin.Text) then
  begin
         aux := strtofloat(edt_precoMin.Text);
         if aux > strtofloat(edt_preco.Text) then
            begin
             ShowMessage('Voc� n�o pode inserir um valor maior que o pre�o do produto!');
             self.edt_precoMin.Text := edt_preco.Text;
             edt_precoMin.SetFocus;
            end
         else
             if not verificaVirgula(edt_precoMin.Text) then
                 edt_precoMin.Text := edt_precoMin.Text + ',00';
  if strtofloat(edt_precoMin.Text) < 0 then
     edt_precoMin.Text := '0,00';
  end
  else if not (verificaReal(edt_precoMin.Text)) and (edt_precoMin.Text <> '') then
    begin
     ShowMessage('Apenas n�meros e v�rgula - Formato: o,oo ');
     edt_precoMin.Text := '0,00';
     edt_precoMin.SetFocus;
    end
  else
     edt_precoMin.Text := '0,00';

  edt_precoMin.Text := duasCasas(edt_precoMin.Text);
end;

procedure TFrmCadastroProduto.edt2Exit(Sender: TObject);
var aux : real;
begin
  inherited;
  if verificaReal(edt2.Text) then
  begin
    if not verificaVirgula(edt2.Text) then
       begin
         aux := strtofloat(edt2.Text);
         edt2.Text := floattostr(aux) + ',00';
       end;

    if strtofloat(edt2.Text) > 100 then
       edt2.Text := '100,00';

     if strtofloat(edt2.Text) < 0 then
     edt2.Text := '0,00';
  end
  else if not (verificaReal(edt2.Text)) and (edt2.Text <> '') then
    begin
     ShowMessage('Apenas n�meros e v�rgula - Formato: o,oo ');
     edt2.Text := '0,00';
     edt2.SetFocus;
    end
  else
     edt2.Text := '0,00';

  edt2.Text := duasCasas(edt2.Text);
end;

procedure TFrmCadastroProduto.edt_obsKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
   if (Key = #13) then
      self.btn_salvar.Click;
end;

procedure TFrmCadastroProduto.edt_custoExit(Sender: TObject);
var aux : real;
begin
  inherited;
  if verificaReal(edt_custo.Text) then
  begin
    if not verificaVirgula(edt_custo.Text) then
       begin
         aux := strtofloat(edt_custo.Text);
         edt_custo.Text := floattostr(aux) + ',00';
       end;
     if strtofloat(edt_custo.Text) < 0 then
     edt_custo.Text := '0,00';
  end
  else if not (verificaReal(edt_custo.Text)) and (edt_custo.Text <> '') then
    begin
     ShowMessage('Apenas n�meros e v�rgula - Formato: o,oo ');
     edt_custo.Text := '0,00';
     edt_custo.SetFocus;
    end
  else
     edt_custo.Text := '0,00';

  edt_custo.Text := duasCasas(edt_custo.Text);
end;

function TFrmCadastroProduto.duasCasas(texto: string): string;
var numero: real;
texto2: string;
begin
  numero := strtofloat(texto);
  texto2 := FloatToStrF(numero,ffnumber,12,2);
  result := StringReplace(texto2,'.','',[rfReplaceAll]);
end;

end.
