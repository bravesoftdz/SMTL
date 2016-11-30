unit uFrmCadastroContaPagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastroPai, StdCtrls, ComCtrls, Buttons, uContaPagar, uController, uFrmConsultafornecedor, uFrmConsultaForma, uFrmCadastroCompra, uCompra;

type
  TFrmCadastroContaPagar = class(TFrmCadastroPai)
    lbl_cidade: TLabel;
    lbl_ddd: TLabel;
    lbl_estado: TLabel;
    edt_documento: TEdit;
    edt_observacao: TEdit;
    edt_CodFornecedor: TEdit;
    edt_fornecedor: TEdit;
    btn_buscar: TButton;
    label_dataInclusao: TLabel;
    edt_dataCadastro: TEdit;
    data_vencimento: TDateTimePicker;
    lbl3: TLabel;
    Label17: TLabel;
    edt_Valor: TEdit;
    Label27: TLabel;
    edt_numeroParcela: TEdit;
    Label1: TLabel;
    edt_juros: TEdit;
    lbl2: TLabel;
    cb_status: TComboBox;
    lbl_1: TLabel;
    data_pagamento: TDateTimePicker;
    label_forma: TLabel;
    edt_codForma: TEdit;
    edt_forma: TEdit;
    btn_buscar2: TSpeedButton;
    btn_verCompra: TButton;
    SpeedButton1: TSpeedButton;
    btn_limpar: TButton;
    procedure btn_buscarClick(Sender: TObject);
    procedure btn_buscar2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edt_ValorExit(Sender: TObject);
    procedure edt_jurosExit(Sender: TObject);
    procedure btn_verCompraClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_limparClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    umaContaPagar : ContaPagar;
    umaCompra: Compra;
    umFrmConsultaFornecedor : TFrmConsultaFornecedor;
    umFrmConsultaForma : TFrmConsultaForma;
    umFrmCadastroCompra: TFrmCadastroCompra;
  protected
        umController : controller;
        docGuardado: string;
        dataGuardada: string;
        procedure Sair;  override;
        procedure Salvar; override;
        procedure CarregaEdit; override;
        procedure LimparCampos; override;
        function validaCampos: Boolean;
        function verificaInteiro(texto: string): Boolean;
        function verificaReal(texto: string): Boolean;
        function verificaVirgula(texto: string): boolean;
        function duasCasas(texto: string): string;
  public
    { Public declarations }
        procedure ConhecaObj(pObj : TObject; pController: controller); override;
        procedure SetConsultaFornecedor (pObj : TForm);
        procedure SetConsultaForma (pObj : TForm);
        procedure SetFormCad (pObj: TForm);
        procedure HabilitaCampos;
        procedure DesabilitaCampos;
  end;

var
  FrmCadastroContaPagar: TFrmCadastroContaPagar;

implementation

uses uControllerContaPagar;

{$R *.dfm}

{ TFrmCadastroContaPagar }

procedure TFrmCadastroContaPagar.CarregaEdit;
begin
  inherited;
  self.edt_cod.Text := inttostr(umaContaPagar.getCodigo);
  self.edt_documento.Text := umaContaPagar.getDocumento;

   if umaContaPagar.getStatus = 0 then
       self.cb_status.ItemIndex := 0
   else
       self.cb_status.ItemIndex := 1;

  self.edt_Valor.Text := floattostr(umaContaPagar.getValor);
  self.data_vencimento.DateTime := umaContaPagar.getDataVencimento;
  self.edt_juros.Text := floattostr(umaContaPagar.getJuros);
  self.edt_numeroParcela.Text := inttostr(umaContaPagar.getNumeroParcela);
  self.edt_observacao.Text := umaContaPagar.getObservacao;

  if umaContaPagar.getumFornecedor.getCodigo = 0 then
     begin
        self.edt_CodFornecedor.Clear;
        self.edt_fornecedor.Clear;
        self.btn_buscar.Enabled := false;
     end
  else
    begin
       self.edt_CodFornecedor.Text := inttostr(umaContaPagar.getumFornecedor.getCodigo);
       self.edt_fornecedor.Text := umaContaPagar.getumFornecedor.getNome;
    end;

  self.edt_codForma.Text := inttostr(umaContaPagar.getumaForma.getCodigo);
  self.edt_forma.Text := umaContaPagar.getumaForma.getNome;
  self.data_pagamento.DateTime := umaContaPagar.getDataPagamento;
  self.edt_dataCadastro.Text := Datetostr(umaContaPagar.getDataCadastro);

  if umaContaPagar.getStatus = 0 then
      begin
         self.data_pagamento.Visible := false;
         self.lbl_1.Visible := false;
         self.SpeedButton1.Enabled := true;
      end
  else
      begin
         self.SpeedButton1.Enabled := false;
         self.data_pagamento.Visible := true;
         self.lbl_1.Visible := true;
      end;

  if (umaContaPagar.getCodCompra = 0) and (self.btn_salvar.Caption <> '&Excluir') then
    begin
     btn_verCompra.Enabled := false;
     self.btn_salvar.Visible := True;
     self.HabilitaCampos;
    end
  else if (umaContaPagar.getCodCompra <> 0) and (self.btn_salvar.Caption <> '&Excluir') then
    begin
     btn_verCompra.Enabled := true;
     self.btn_salvar.Caption := '';
     self.btn_salvar.Visible := false;
     self.btn_salvar.Enabled := false;
     self.DesabilitaCampos;
    end;
end;

procedure TFrmCadastroContaPagar.ConhecaObj(pObj: TObject;
  pController: controller);
begin
   umaContaPagar := ContaPagar (pObj);
   umController := pController;
   self.LimparCampos;

      if umaContaPagar.getCodigo <> 0 then
        begin
          self.docGuardado := umaContaPagar.getDocumento;
          self.dataGuardada := Datetostr(umaContaPagar.getDataVencimento);
          self.CarregaEdit;
        end;

      if self.btn_salvar.Caption = '&Salvar' then
         self.HabilitaCampos
      else if self.btn_salvar.Caption = '&Excluir' then
        begin
         self.DesabilitaCampos;
         self.btn_verCompra.Enabled := false;
        end
      else 
        begin
         self.DesabilitaCampos;
         self.btn_verCompra.Enabled := true;
        end;
end;

procedure TFrmCadastroContaPagar.DesabilitaCampos;
begin
   self.edt_documento.Enabled := false;
   self.data_vencimento.Enabled := false;
   self.btn_buscar.Enabled := false;
   self.btn_buscar2.Enabled := false;
   self.edt_Valor.Enabled := false;
   self.edt_juros.Enabled := false;
   self.edt_observacao.Enabled := false;
end;

procedure TFrmCadastroContaPagar.HabilitaCampos;
begin
   self.edt_documento.Enabled := true;
   self.data_vencimento.Enabled := true;
   self.btn_buscar.Enabled := true;
   self.btn_buscar2.Enabled := true;
   self.edt_Valor.Enabled := true;
   self.edt_juros.Enabled := true;
   self.edt_observacao.Enabled := true;
   self.btn_salvar.Caption := '&Salvar';
   self.btn_salvar.Enabled := true;
end;

procedure TFrmCadastroContaPagar.LimparCampos;
begin
  self.docGuardado := '';
  self.dataGuardada := '';
  self.edt_cod.Clear;
  self.edt_documento.Clear;
  self.cb_status.ItemIndex := 0;
  self.edt_Valor.text := '0,00';
  self.data_vencimento.DateTime := Date;
  self.edt_juros.Text := '0,00';
  self.edt_numeroParcela.Text := '1';
  self.edt_observacao.Clear;
  self.edt_CodFornecedor.Clear;
  self.edt_fornecedor.Clear;
  self.edt_codForma.Clear;
  self.edt_forma.Clear;
  self.data_pagamento.DateTime := Date;
  self.edt_dataCadastro.Text := Datetostr(Date);
end;

procedure TFrmCadastroContaPagar.Sair;
begin
  inherited;

end;

procedure TFrmCadastroContaPagar.Salvar;
var incluido, excluida, permitir, dataV  : string;
selected : integer;
men : TForm;
begin
        if self.btn_salvar.Caption = '&Salvar' then
          begin
                 if validaCampos = True then
                    begin
                      umaContaPagar.setDocumento(self.edt_documento.Text);
                       if cb_status.ItemIndex = 0 then
                           umaContaPagar.setStatus(0)
                       else
                           umaContaPagar.setStatus(1);

                       umaContaPagar.setValor(strtofloat(self.edt_Valor.Text));
                       umaContaPagar.setDataVencimento(self.data_vencimento.DateTime);
                       umaContaPagar.setJuros(strtofloat(self.edt_juros.Text));
                       umaContaPagar.setNumeroParcela(strtoint(edt_numeroParcela.Text));
                       umaContaPagar.setObservacao(edt_observacao.Text);
                     //  umaContaPagar.setDataPagamento(data_pagamento.DateTime);
                       umaContaPagar.setDataCadastro(strtodate(edt_dataCadastro.Text));
                       dataV:= Datetostr(umaContaPagar.getDataVencimento);
                       permitir := umController.getControllerContaPagar.pesquisaSalvar(umaContaPagar.getDocumento,dataV);

                         if (permitir = 'OK') or ( (permitir = 'EXISTE') and ( (docGuardado = umaContaPagar.getDocumento) and (dataGuardada = datetostr(umaContaPagar.getDataVencimento)) )  ) then
                           begin
                                incluido :=  umController.getControllerContaPagar.salvaContaPagar(umaContaPagar);
                                     if incluido = 'OK' then
                                        if umaContaPagar.getCodigo = 0 then
                                          ShowMessage('Conta inclu�da com sucesso!')
                                        else
                                          ShowMessage('Conta alterada com sucesso!');
                              inherited;
                           end
                         else
                           begin
                             ShowMessage('Conta a pagar j� cadastrada!');
                             self.edt_documento.SetFocus;
                           end;
                    end;
          end
          else
            begin
             men := CreateMessageDialog('Deseja mesmo excluir a conta a pagar ' + QuotedStr(umaContaPagar.getDocumento) + '?',mtCustom,[mbYes,mbAbort]);
             men.Caption := 'Confirma��o';
             men.Position := poDesktopCenter;
             selected := men.ShowModal;

             if selected = mrYes then
                begin
                  if (cb_status.ItemIndex = 0) and (umaContaPagar.getCodCompra = 0) then
                     permitir := 'OK'
                  else if (cb_status.ItemIndex = 1) and (umaContaPagar.getCodCompra = 0) then
                     permitir := 'NAO'
                  else
                     permitir := 'COMPRA';

                              if permitir = 'OK' then
                                  begin
                                   excluida :=  umController.getcontrollerContaPagar.excluiContaPagar(umaContaPagar);
                                   ShowMessage(QuotedStr(umaContaPagar.getDocumento) + ' exclu�da com sucesso!')
                                  end

                              else if permitir = 'NAO' then
                                  Showmessage('N�o � poss�vel excluir uma conta j� paga!')
                              else
                                  ShowMessage('N�o � poss�vel excluir uma conta gerada atrav�s de compra!');
                inherited;
                end;
            end;
end;

procedure TFrmCadastroContaPagar.SetConsultaForma(pObj: TForm);
begin
  umFrmConsultaForma := TFrmConsultaForma (pObj);
end;

procedure TFrmCadastroContaPagar.SetConsultaFornecedor(pObj: TForm);
begin
  umFrmConsultaFornecedor := TFrmConsultaFornecedor (pObj);
end;

function TFrmCadastroContaPagar.validaCampos: Boolean;
begin
      Result:= False;
        if (self.edt_documento.Text = '') then
            begin
              ShowMessage('O documento � obrigat�rio!');
              self.edt_documento.SetFocus;
            end
        else if (Self.edt_Valor.Text = '') then
            begin
              ShowMessage('O valor � obrigat�rio!');
              self.edt_Valor.SetFocus;
            end
        else if (Self.edt_codForma.Text = '') then
            begin
              ShowMessage('A conta para pagamento � obrigat�rio!');
            end
        else
            Result:= True;
end;

function TFrmCadastroContaPagar.verificaInteiro(texto: string): Boolean;
begin
    try
      StrToInt(texto);
      Result := True;
    except
      Result:= False;
    end;
end;

function TFrmCadastroContaPagar.verificaReal(texto: string): Boolean;
begin
    try
       StrToFloat(texto);
       Result := True;
    except
       Result := False;
    end;
end;

function TFrmCadastroContaPagar.verificaVirgula(texto: string): boolean;
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

procedure TFrmCadastroContaPagar.btn_buscarClick(Sender: TObject);
begin
  umFrmConsultafornecedor.ConhecaObj(umaContaPagar.getumFornecedor,umController);
  umFrmConsultafornecedor.btn_Sair.Caption := 'Selecionar';
  umFrmConsultafornecedor.ShowModal;
  Self.edt_CodFornecedor.Text := IntToStr (umaContaPagar.getumFornecedor.getCodigo);
  self.edt_fornecedor.Text := umaContaPagar.getumFornecedor.getNome;
  umFrmConsultafornecedor.btn_Sair.Caption := 'Sair';
end;

procedure TFrmCadastroContaPagar.btn_buscar2Click(Sender: TObject);
begin
  umFrmConsultaForma.ConhecaObj(umaContaPagar.getumaforma,umController);
  umFrmConsultaForma.btn_Sair.Caption := 'Selecionar';
  umFrmConsultaForma.ShowModal;
  Self.edt_codForma.Text := IntToStr (umaContaPagar.getumaforma.getCodigo);
  self.edt_forma.Text := umaContaPagar.getumaforma.getNome;
  umFrmConsultaForma.btn_Sair.Caption := 'Sair';
end;

procedure TFrmCadastroContaPagar.FormShow(Sender: TObject);
begin
  inherited;
  if umaContaPagar.getCodigo = 0 then
   begin
    self.data_pagamento.DateTime := date;
    self.data_vencimento.DateTime := date;
    self.edt_dataCadastro.Text := datetostr(Date);
   end;
end;

function TFrmCadastroContaPagar.duasCasas(texto: string): string;
var numero: real;
texto2: string;
begin
  numero := strtofloat(texto);
  texto2 := FloatToStrF(numero,ffnumber,12,2);
  result := StringReplace(texto2,'.','',[rfReplaceAll]);
end;

procedure TFrmCadastroContaPagar.edt_ValorExit(Sender: TObject);
var aux : real;
begin
  inherited;
  if verificaReal(edt_Valor.Text) then
  begin
    if not verificaVirgula(edt_Valor.Text) then
       begin
         aux := strtofloat(edt_Valor.Text);
         edt_Valor.Text := floattostr(aux) + ',00';
       end;

     if strtofloat(edt_Valor.Text) < 0 then
     edt_Valor.Text := '0,00';
  end
  else if not (verificaReal(edt_Valor.Text)) and (edt_Valor.Text <> '') then
    begin
     ShowMessage('Apenas n�meros e v�rgula - Formato: o,oo ');
     edt_Valor.Text := '0,00';
     edt_Valor.SetFocus;
    end
  else
     edt_Valor.Text := '0,00';

  edt_Valor.Text := duasCasas(edt_Valor.Text);
end;


procedure TFrmCadastroContaPagar.edt_jurosExit(Sender: TObject);
var aux : real;
begin
  inherited;
  if verificaReal(edt_juros.Text) then
  begin
    if not verificaVirgula(edt_juros.Text) then
       begin
         aux := strtofloat(edt_juros.Text);
         edt_juros.Text := floattostr(aux) + ',00';
       end;
     if strtofloat(edt_juros.Text) > 100 then
     edt_juros.Text := '100,00';

     if strtofloat(edt_juros.Text) < 0 then
     edt_juros.Text := '0,00';
  end
  else if not (verificaReal(edt_juros.Text)) and (edt_juros.Text <> '') then
    begin
     ShowMessage('Apenas n�meros e v�rgula - Formato: o,oo ');
     edt_juros.Text := '0,00';
     edt_juros.SetFocus;
    end
  else
     edt_juros.Text := '0,00';

  edt_juros.Text := duasCasas(edt_juros.Text);
end;

procedure TFrmCadastroContaPagar.SetFormCad(pObj: TForm);
begin
    umFrmCadastroCompra := TFrmCadastroCompra (pObj);
end;

procedure TFrmCadastroContaPagar.btn_verCompraClick(Sender: TObject);
begin
  inherited;
  umaCompra := Compra.crieobj;
  umController.getControllerCompra.carregaCompraPorCodigo(umaContaPagar.getCodCompra,umaCompra);
  umFrmCadastroCompra.ConhecaObj(umaCompra,umController);
  umFrmCadastroCompra.DesabilitaCampos;
  umFrmCadastroCompra.Caption := 'Ver detalhes compra via Conta a pagar';
  umFrmCadastroCompra.ShowModal;
  umFrmCadastroCompra.Caption := 'Nova Compra';
  umFrmCadastroCompra.HabilitaCampos;
end;

procedure TFrmCadastroContaPagar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  self.HabilitaCampos;
end;

procedure TFrmCadastroContaPagar.btn_limparClick(Sender: TObject);
begin
 if self.umaContaPagar.getCodCompra = 0 then
 begin
  self.edt_CodFornecedor.Clear;
  self.edt_fornecedor.Clear;
  self.umaContaPagar.getumFornecedor.setNome('');
  self.umaContaPagar.getumFornecedor.setCodigo(0);
 end;
end;

procedure TFrmCadastroContaPagar.SpeedButton1Click(Sender: TObject);
var selected : integer;
men : TForm;
begin
  if cb_status.ItemIndex = 0 then
     begin
                 men := CreateMessageDialog('Deseja mesmo dar baixa na conta?',mtCustom,[mbYes,mbAbort]);
                 men.Caption := 'Confirma��o';
                 men.Position := poScreenCenter;
                 selected := men.ShowModal;

                  if selected = mrYes then
                    begin
                      self.btn_salvar.Caption := '&Salvar';
                      cb_status.ItemIndex := 1;
                      umaContaPagar.setDataPagamento(Date);

                      //mudar valor na conta que foi mexida, nesse caso, subtrair o valor pago
                      umController.getControllerForma.alteraSaldo(umaContaPagar.getumaForma.getCodigo,umaContaPagar.getValor,1);

                      //altera o caixa se for na conta caixa local
                      if umaContaPagar.getumaForma.getCodigo = 2 then
                       begin
                        umController.getControllerCaixa.movimentarCaixa(umaContaPagar.getValor,1);
                        umController.getControllerFluxo.SalvarFluxo('SA�DA',umaContaPagar.getValor);
                       end;

                      self.btn_salvar.Click;
                    end;
     end;
end;

end.
