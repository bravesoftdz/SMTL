unit uFrmCadastroContaReceber;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastroPai, StdCtrls, ComCtrls, Buttons, uContaReceber, uController, uFrmConsultacliente, uFrmConsultaForma, uFrmCadastroVenda, uVenda;

type
  TFrmCadastroContaReceber = class(TFrmCadastroPai)
    lbl_cidade: TLabel;
    lbl_ddd: TLabel;
    lbl_estado: TLabel;
    label_dataInclusao: TLabel;
    lbl3: TLabel;
    Label17: TLabel;
    Label27: TLabel;
    Label1: TLabel;
    lbl2: TLabel;
    lbl_1: TLabel;
    label_forma: TLabel;
    btn_buscar2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    edt_documento: TEdit;
    edt_observacao: TEdit;
    edt_CodFornecedor: TEdit;
    edt_fornecedor: TEdit;
    btn_buscar: TButton;
    edt_dataCadastro: TEdit;
    data_vencimento: TDateTimePicker;
    edt_Valor: TEdit;
    edt_numeroParcela: TEdit;
    edt_juros: TEdit;
    cb_status: TComboBox;
    data_pagamento: TDateTimePicker;
    edt_codForma: TEdit;
    edt_forma: TEdit;
    btn_verCompra: TButton;
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
    umaContaReceber : ContaReceber;
    umaVenda: Venda;
    umFrmConsultaCliente : TFrmConsultaCliente;
    umFrmConsultaForma : TFrmConsultaForma;
    umFrmCadastroVenda: TFrmCadastroVenda;
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
        procedure SetConsultaCliente (pObj : TForm);
        procedure SetConsultaForma (pObj : TForm);
        procedure SetFormCad (pObj: TForm);
        procedure HabilitaCampos;
        procedure DesabilitaCampos;
  end;
  { TFrmCadastroContaReceber }

implementation

uses uControllerContaReceber;

{$R *.dfm}

{ TFrmCadastroContaReceber }

procedure TFrmCadastroContaReceber.CarregaEdit;
begin
  inherited;
  self.edt_cod.Text := inttostr(umaContaReceber.getCodigo);
  self.edt_documento.Text := umaContaReceber.getDocumento;

   if umaContaReceber.getStatus = 0 then
       self.cb_status.ItemIndex := 0
   else
       self.cb_status.ItemIndex := 1;

  self.edt_Valor.Text := floattostr(umaContaReceber.getValor);
  self.data_vencimento.DateTime := umaContaReceber.getDataVencimento;
  self.edt_juros.Text := floattostr(umaContaReceber.getJuros);
  self.edt_numeroParcela.Text := inttostr(umaContaReceber.getNumeroParcela);
  self.edt_observacao.Text := umaContaReceber.getObservacao;
  self.edt_CodFornecedor.Text := inttostr(umaContaReceber.getumCliente.getCodigo);
  self.edt_fornecedor.Text := umaContaReceber.getumCliente.getNome;
  self.edt_codForma.Text := inttostr(umaContaReceber.getumaForma.getCodigo);
  self.edt_forma.Text := umaContaReceber.getumaForma.getNome;
  self.data_pagamento.DateTime := umaContaReceber.getDataPagamento;
  self.edt_dataCadastro.Text := Datetostr(umaContaReceber.getDataCadastro);

  if umaContaReceber.getStatus = 0 then
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

  if (umaContaReceber.getCodVenda <> 0) and (self.btn_salvar.Caption <> '&Excluir') then
    begin
     btn_verCompra.Enabled := true;
     self.btn_salvar.Caption := '';
     self.btn_salvar.Visible := false;
     self.btn_salvar.Enabled := false;
     self.DesabilitaCampos;
    end;
end;

procedure TFrmCadastroContaReceber.ConhecaObj(pObj: TObject;
  pController: controller);
begin
   umaContaReceber := ContaReceber (pObj);
   umController := pController;
   self.LimparCampos;

      if umaContaReceber.getCodigo <> 0 then
        begin
          self.docGuardado := umaContaReceber.getDocumento;
          self.dataGuardada := Datetostr(umaContaReceber.getDataVencimento);
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

procedure TFrmCadastroContaReceber.DesabilitaCampos;
begin
   self.edt_documento.Enabled := false;
   self.data_vencimento.Enabled := false;
   self.btn_buscar.Enabled := false;
   self.btn_buscar2.Enabled := false;
   self.edt_Valor.Enabled := false;
   self.edt_juros.Enabled := false;
   self.edt_observacao.Enabled := false;
end;

function TFrmCadastroContaReceber.duasCasas(texto: string): string;
var numero: real;
texto2: string;
begin
  numero := strtofloat(texto);
  texto2 := FloatToStrF(numero,ffnumber,12,2);
  result := StringReplace(texto2,'.','',[rfReplaceAll]);
end;

procedure TFrmCadastroContaReceber.HabilitaCampos;
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

procedure TFrmCadastroContaReceber.LimparCampos;
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

procedure TFrmCadastroContaReceber.Sair;
begin
  inherited;

end;

procedure TFrmCadastroContaReceber.Salvar;
var incluido, excluida, permitir, dataV  : string;
selected : integer;
men : TForm;
begin
        if self.btn_salvar.Caption = '&Salvar' then
          begin
                 if validaCampos = True then
                    begin
                      umaContaReceber.setDocumento(self.edt_documento.Text);
                       if cb_status.ItemIndex = 0 then
                           umaContaReceber.setStatus(0)
                       else
                           umaContaReceber.setStatus(1);

                       umaContaReceber.setValor(strtofloat(self.edt_Valor.Text));
                       umaContaReceber.setDataVencimento(self.data_vencimento.DateTime);
                       umaContaReceber.setJuros(strtofloat(self.edt_juros.Text));
                       umaContaReceber.setNumeroParcela(strtoint(edt_numeroParcela.Text));
                       umaContaReceber.setObservacao(edt_observacao.Text);
                     //  umaContaPagar.setDataPagamento(data_pagamento.DateTime);
                       umaContaReceber.setDataCadastro(strtodate(edt_dataCadastro.Text));
                       dataV:= Datetostr(umaContaReceber.getDataVencimento);
                       permitir := umController.getControllerContaReceber.pesquisaSalvar(umaContaReceber.getDocumento,dataV);

                         if (permitir = 'OK') or ( (permitir = 'EXISTE') and ( (docGuardado = umaContaReceber.getDocumento) and (dataGuardada = datetostr(umaContaReceber.getDataVencimento)) )  ) then
                           begin
                                incluido :=  umController.getControllerContaReceber.salvaContaReceber(umaContaReceber);
                                     if incluido = 'OK' then
                                        if umaContaReceber.getCodigo = 0 then
                                          ShowMessage('Conta inclu�da com sucesso!')
                                        else
                                          ShowMessage('Conta alterada com sucesso!');
                              inherited;
                           end
                         else
                           begin
                             ShowMessage('Conta a receber j� cadastrada!');
                             self.edt_documento.SetFocus;
                           end;
                    end;
          end
          else
            begin
             men := CreateMessageDialog('Deseja mesmo excluir a conta a receber ' + QuotedStr(umaContaReceber.getDocumento) + '?',mtCustom,[mbYes,mbAbort]);
             men.Caption := 'Confirma��o';
             men.Position := poDesktopCenter;
             selected := men.ShowModal;

             if selected = mrYes then
                begin
                  if (cb_status.ItemIndex = 0) and (umaContaReceber.getCodVenda = 0) then
                     permitir := 'OK'
                  else if (cb_status.ItemIndex = 1) and (umaContaReceber.getCodVenda = 0) then
                     permitir := 'NAO'
                  else
                     permitir := 'VENDA';

                              if permitir = 'OK' then
                                  begin
                                   excluida :=  umController.getcontrollerContaReceber.excluiContaReceber(umaContaReceber);
                                   ShowMessage(QuotedStr(umaContaReceber.getDocumento) + ' exclu�da com sucesso!')
                                  end

                              else if permitir = 'NAO' then
                                  Showmessage('N�o � poss�vel excluir uma conta j� paga!')
                              else
                                  ShowMessage('N�o � poss�vel excluir uma conta gerada atrav�s de venda!');
                inherited;
                end;
            end;
end;

procedure TFrmCadastroContaReceber.SetConsultaCliente(pObj: TForm);
begin
   umFrmConsultaCliente := TFrmConsultaCliente (pObj);
end;

procedure TFrmCadastroContaReceber.SetConsultaForma(pObj: TForm);
begin
  umFrmConsultaForma := TFrmConsultaForma (pObj);
end;

procedure TFrmCadastroContaReceber.SetFormCad(pObj: TForm);
begin
  umFrmCadastroVenda := TFrmCadastroVenda (pObj);
end;

function TFrmCadastroContaReceber.validaCampos: Boolean;
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
        else if (Self.edt_CodFornecedor.Text = '') then
            begin
              ShowMessage('O cliente � obrigat�rio!');
              self.btn_buscar.SetFocus;
            end
        else if (Self.edt_codForma.Text = '') then
            begin
              ShowMessage('A conta para pagamento � obrigat�rio!');

            end
        else
            Result:= True;
end;

function TFrmCadastroContaReceber.verificaInteiro(texto: string): Boolean;
begin
    try
      StrToInt(texto);
      Result := True;
    except
      Result:= False;
    end;
end;

function TFrmCadastroContaReceber.verificaReal(texto: string): Boolean;
begin
    try
       StrToFloat(texto);
       Result := True;
    except
       Result := False;
    end;
end;

function TFrmCadastroContaReceber.verificaVirgula(texto: string): boolean;
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

procedure TFrmCadastroContaReceber.btn_buscarClick(Sender: TObject);
begin
  umFrmConsultaCliente.ConhecaObj(umaContaReceber.getumCliente,umController);
  umFrmConsultaCliente.btn_Sair.Caption := 'Selecionar';
  umFrmConsultaCliente.ShowModal;
  Self.edt_CodFornecedor.Text := IntToStr (umaContaReceber.getumCliente.getCodigo);
  self.edt_fornecedor.Text := umaContaReceber.getumCliente.getNome;
  umFrmConsultaCliente.btn_Sair.Caption := 'Sair';
end;

procedure TFrmCadastroContaReceber.btn_buscar2Click(Sender: TObject);
begin
  umFrmConsultaForma.ConhecaObj(umaContaReceber.getumaforma,umController);
  umFrmConsultaForma.btn_Sair.Caption := 'Selecionar';
  umFrmConsultaForma.ShowModal;
  Self.edt_codForma.Text := IntToStr (umaContaReceber.getumaforma.getCodigo);
  self.edt_forma.Text := umaContaReceber.getumaforma.getNome;
  umFrmConsultaForma.btn_Sair.Caption := 'Sair';
end;

procedure TFrmCadastroContaReceber.FormShow(Sender: TObject);
begin
  inherited;
  if umaContaReceber.getCodigo = 0 then
   begin
    self.data_pagamento.DateTime := date;
    self.data_vencimento.DateTime := date;
    self.edt_dataCadastro.Text := datetostr(Date);
   end;
end;

procedure TFrmCadastroContaReceber.edt_ValorExit(Sender: TObject);
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

procedure TFrmCadastroContaReceber.edt_jurosExit(Sender: TObject);
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

procedure TFrmCadastroContaReceber.btn_verCompraClick(Sender: TObject);
begin
  inherited;
  umaVenda := Venda.crieobj;
  umController.getControllerVenda.carregaVendaPorCodigo(umaContaReceber.getCodVenda,umaVenda);
  umFrmCadastroVenda.ConhecaObj(umaVenda,umController);
  umFrmCadastroVenda.DesabilitaCampos;
  umFrmCadastroVenda.Caption := 'Ver detalhes venda via Conta a receber';
  umFrmCadastroVenda.ShowModal;
  umFrmCadastroVenda.Caption := 'Nova Venda';
  umFrmCadastroVenda.HabilitaCampos;
end;

procedure TFrmCadastroContaReceber.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  self.HabilitaCampos;
end;

procedure TFrmCadastroContaReceber.btn_limparClick(Sender: TObject);
begin
 if self.umaContaReceber.getCodVenda = 0 then
 begin
  self.edt_CodFornecedor.Clear;
  self.edt_fornecedor.Clear;
  self.umaContaReceber.getumCliente.setNome('');
  self.umaContaReceber.getumCliente.setCodigo(0);
 end;
end;

procedure TFrmCadastroContaReceber.SpeedButton1Click(Sender: TObject);
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
                      umaContaReceber.setDataPagamento(Date);

                      //altera o saldo da respectiva conta do pagamento
                      umController.getControllerForma.alteraSaldo(umaContaReceber.getumaForma.getCodigo,umaContaReceber.getValor,0);

                      //altera o caixa se for na conta caixa local
                      if umaContaReceber.getumaForma.getCodigo = 2 then
                       begin
                        umController.getControllerCaixa.movimentarCaixa(umaContaReceber.getValor,0);
                        umController.getControllerFluxo.SalvarFluxo('ENTRADA',umaContaReceber.getValor);
                       end;

                      self.btn_salvar.Click;
                    end;
     end;
end;

end.
