unit uFrmCadastroFuncionario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastroPai, StdCtrls, uController, uFuncionario, uFrmConsultaCidade,
  Mask;

type
  TFrmCadastroFuncionario = class(TFrmCadastroPai)
    lbl_nome: TLabel;
    lbl_cpf: TLabel;
    lbl_sexo: TLabel;
    lbl_endereco: TLabel;
    lbl_fixo: TLabel;
    lbl_celular: TLabel;
    lbl_numero: TLabel;
    lbl_bairro: TLabel;
    lbl_cidade: TLabel;
    edt_nome: TEdit;
    edt_logradouro: TEdit;
    edt_numero: TEdit;
    edt_bairro: TEdit;
    edt_codCidade: TEdit;
    edt_cidade: TEdit;
    btn_buscar: TButton;
    lbl_data: TLabel;
    edt_data: TEdit;
    btn_habilitar: TButton;
    lbl1: TLabel;
    lbl2: TLabel;
    edt_salario: TEdit;
    edt_cpf: TMaskEdit;
    cb_cargo: TComboBox;
    edt_fixo1: TMaskEdit;
    edt_celular1: TMaskEdit;
    cb_nome: TComboBox;
    procedure btn_habilitarClick(Sender: TObject);
    procedure btn_buscarClick(Sender: TObject);
    procedure edt_cpfKeyPress(Sender: TObject; var Key: Char);
    procedure edt_numeroKeyPress(Sender: TObject; var Key: Char);
    procedure edt_sexoKeyPress(Sender: TObject; var Key: Char);
    procedure edt_salarioKeyPress(Sender: TObject; var Key: Char);
    procedure edt_salarioExit(Sender: TObject);
    procedure cb_cargoExit(Sender: TObject);
    procedure cb_cargoKeyPress(Sender: TObject; var Key: Char);
    procedure edt_fixo1KeyPress(Sender: TObject; var Key: Char);
    procedure edt_celular1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure cb_nomeExit(Sender: TObject);
    procedure cb_nomeKeyPress(Sender: TObject; var Key: Char);
    procedure edt_fixo1Exit(Sender: TObject);
    procedure edt_celular1Exit(Sender: TObject);
  private
    umFuncionario : Funcionario;
    umFrmConsultaCidade : TFrmConsultaCidade;

  protected
        umController : controller;
        cpfGuardado: string;
        procedure Sair;  override;
        procedure Salvar; override;
        procedure CarregaEdit; override;
        procedure LimparCampos; override;
        function isNumerico(texto: string): Boolean;
        function validaCampos: Boolean;
        function verificaReal(texto: string) : Boolean;
        function isCPF(CPF: string): Boolean;
        function verificaVirgula(texto: string): boolean;
        function validaTelefone(texto: string): Boolean;
        function validaCelular(texto: string): Boolean;
        function duasCasas(texto: string): string;     
  public
        procedure ConhecaObj(pObj : TObject; pController: controller); override;
        procedure SetConsultaCidade (pObj : TForm);
        procedure DesabilitaCampos;
        procedure HabilitaCampos;
end;

var
  FrmCadastroFuncionario: TFrmCadastroFuncionario;

implementation

{$R *.dfm}

{ TFrmCadastroFuncionario }

procedure TFrmCadastroFuncionario.CarregaEdit;
begin
  Self.edt_cod.Text         :=  IntToStr(umFuncionario.getCodigo);
  self.edt_data.Text        :=  DateToStr(umFuncionario.getDataI) ;
  self.edt_nome.Text        :=  umFuncionario.getNome;
  Self.edt_cpf.Text         :=  umFuncionario.getCPF;

  if umFuncionario.getSexo = 'M' then
     cb_nome.ItemIndex := 0
  else
     cb_nome.ItemIndex := 1;
     
 // Self.edt_sexo.Text        :=  umFuncionario.getSexo;
  self.edt_fixo1.Text        :=  umFuncionario.getTelFixo;
  self.edt_celular1.Text     :=  umFuncionario.getCelular;
  self.edt_logradouro.Text  :=  umFuncionario.getLogradouro;
  self.edt_numero.Text      :=  umFuncionario.getNumero;
  self.edt_bairro.Text      :=  umFuncionario.getBairro;
  self.edt_codCidade.Text   :=  IntToStr(umFuncionario.getUmaCidade.getCodigo);
  self.edt_cidade.Text      :=  umFuncionario.getUmaCidade.getCidade;

  if umFuncionario.getCargo = 'GERENTE' then
     cb_cargo.ItemIndex := 0
  else if umFuncionario.getCargo = 'VENDEDOR' then
     cb_cargo.ItemIndex := 1
  else
     cb_cargo.ItemIndex := 2;


  self.edt_salario.Text     :=  FloatToStr(umFuncionario.getSalario);
end;

procedure TFrmCadastroFuncionario.ConhecaObj(pObj: TObject;
  pController: controller);
begin
  umFuncionario := Funcionario (pObj);
  umController := pController;
    self.LimparCampos;
    self.edt_data.Text := DateToStr(Date);
      if umFuncionario.getCodigo <> 0 then
        begin
          cpfGuardado := umFuncionario.getCPF;
          Self.CarregaEdit;
        end;

      if Self.btn_salvar.Caption = '&Salvar' then
          HabilitaCampos;
          
      if Self.btn_salvar.Caption = 'Excluir' then
          DesabilitaCampos;
end;

procedure TFrmCadastroFuncionario.DesabilitaCampos;
begin
  self.edt_nome.Enabled := False;
  Self.edt_cpf.Enabled := False;
  self.cb_nome.Enabled := false;
  self.edt_fixo1.Enabled := False;
  self.edt_celular1.Enabled := False;
  self.edt_logradouro.Enabled := False;
  self.edt_numero.Enabled := False;
  self.edt_bairro.Enabled := False;
  self.cb_cargo.Enabled := False;
  Self.btn_buscar.Enabled := False;
  Self.edt_salario.Enabled := False;
end;

procedure TFrmCadastroFuncionario.HabilitaCampos;
begin
  self.edt_nome.Enabled := True;
  Self.edt_cpf.Enabled := True;
  self.cb_nome.Enabled := true;

  //Self.edt_sexo.Enabled := True;
  self.edt_fixo1.Enabled := True;
  self.edt_celular1.Enabled := True;
  self.edt_logradouro.Enabled := True;
  self.edt_numero.Enabled := True;
  self.edt_bairro.Enabled := True;
  self.cb_cargo.Enabled := true;

  Self.btn_buscar.Enabled := True;
  Self.edt_salario.Enabled := True;
end;

function TFrmCadastroFuncionario.isNumerico(texto: string): Boolean;
var
valor :  string; 
nr : integer;
c : integer;
tam, k: integer;
begin
     tam:= length(texto);
     for k:= 1 to tam do
       begin
         val(texto[k],nr,c);
            if c<>0 then
               begin
                  Result:= false;
                  exit;
               end;
         Result:= true;
       end;
 {     val(texto,nr,c);
      if c=0 then
      result := true
      else
      Result := false;   }
end;
procedure TFrmCadastroFuncionario.LimparCampos;
begin
  Self.edt_cod.Clear;
  self.edt_nome.Clear;
  Self.edt_cpf.Clear;
  self.cpfGuardado := '';
  self.cb_nome.ItemIndex := -1;
 // Self.edt_sexo.Clear;
  self.edt_fixo1.Clear;
  self.edt_celular1.Clear;
  self.edt_logradouro.Clear;
  self.edt_numero.Clear;
  self.edt_bairro.Clear;
  self.edt_codCidade.Clear;
  self.edt_cidade.Clear;
  self.cb_cargo.ItemIndex := -1;
  self.edt_salario.Clear;
end;

procedure TFrmCadastroFuncionario.Sair;
begin
  inherited;  
end;

procedure TFrmCadastroFuncionario.Salvar;
var incluido, excluido, permitir : string;
selected : integer;
men : TForm;
begin
        if self.btn_salvar.Caption = '&Salvar' then
          begin
                 if validaCampos = True then
                    begin
                        umFuncionario.setNome(Self.edt_nome.Text);
                        umFuncionario.setCPF(self.edt_cpf.Text);

                        if cb_nome.ItemIndex = 0 then
                           umFuncionario.setSexo('M')
                        else
                           umFuncionario.setSexo('F');

                        //umFuncionario.setSexo(self.edt_sexo.Text);
                        umFuncionario.setCelular(self.edt_celular1.Text);
                        umFuncionario.setTelFixo(self.edt_fixo1.Text);
                        umFuncionario.setLogradouro(self.edt_logradouro.Text);
                        umFuncionario.setNumero(self.edt_numero.Text);
                        umFuncionario.setBairro(self.edt_bairro.Text);
                       // umFuncionario.setCargo(self.edt_cargo.Text);
                        umFuncionario.setSalario(StrToFloat(self.edt_salario.text));
                        umFuncionario.setDataI(Date);

                           if cb_cargo.ItemIndex = 0 then
                              umFuncionario.setCargo('GERENTE')
                           else if cb_cargo.ItemIndex = 1 then
                              umFuncionario.setCargo('VENDEDOR')
                           else
                              umFuncionario.setCargo('AUXILIAR');

                 permitir := umcontroller.getcontrollerfuncionario.pesquisaSalvar(umFuncionario.getCPF);
                   if (permitir = 'OK') or ( (permitir = 'EXISTE') and (cpfGuardado = umFuncionario.getCPF)  ) then
                     begin
                        incluido :=  umController.getcontrollerFuncionario.salvaFuncionario(umFuncionario);
                             if incluido = 'OK' then
                                if umFuncionario.getCodigo = 0 then
                                  ShowMessage(umFuncionario.getNome + ' inclu�do com sucesso!')
                                else
                                  ShowMessage(umFuncionario.getNome + ' alterado com sucesso!');
                      inherited;
                     end
                   else
                     begin
                        ShowMessage('CPF j� cadastrado!');
                        self.edt_cpf.SetFocus;
                     end;
                 end;
          end
          else
            begin
               men := CreateMessageDialog('Deseja mesmo excluir o funcion�rio ' + QuotedStr(umFuncionario.getNome) + '?',mtCustom,[mbYes,mbAbort]);
               men.Caption := 'Confirma��o';
               men.Position := poDesktopCenter;
               selected := men.ShowModal;

                if selected = mrYes then
                  begin
                    permitir := umController.getcontrollerFuncionario.pesquisaDependencia(umFuncionario.getCodigo);
                      if permitir = 'OK' then
                         begin
                               excluido :=  umController.getControllerFuncionario.excluiFuncionario(umFuncionario);
                               ShowMessage(QuotedStr(umFuncionario.getNome) + ' exclu�do com sucesso!');
                         end
                      else
                               Showmessage('N�o foi poss�vel excluir o funcion�rio! H� usu�rios vinculados a ele!');
                  inherited;
                  end;
            end;
end;

procedure TFrmCadastroFuncionario.SetConsultaCidade(pObj: TForm);
begin
   umFrmConsultaCidade := TFrmConsultaCidade (pObj);
end;

procedure TFrmCadastroFuncionario.btn_habilitarClick(Sender: TObject);
begin
  self.HabilitaCampos;
  self.btn_salvar.Enabled := true;
  self.btn_habilitar.Enabled := False;
  Self.btn_buscar.Enabled := True;
end;

procedure TFrmCadastroFuncionario.btn_buscarClick(Sender: TObject);
begin
  umFrmConsultaCidade.ConhecaObj(umFuncionario.getUmaCidade,umController);
  umFrmConsultaCidade.btn_Sair.Caption := 'Selecionar';
  umFrmConsultaCidade.ShowModal;
  Self.edt_codCidade.Text := IntToStr(umFuncionario.getUmaCidade.getCodigo);
  Self.edt_cidade.Text := umFuncionario.getUmaCidade.getCidade;
  umFrmConsultaCidade.btn_Sair.Caption := 'Sair';
end;

procedure TFrmCadastroFuncionario.edt_cpfKeyPress(Sender: TObject;
  var Key: Char);
begin
      if not (Key in ['0'..'9',#16,#8,#9,#13,#20,#36,#37,#46,#107] ) or
     (Key in ['K','k']) then
      begin
          ShowMessage('Apenas n�meros!');
          Key := #0;
      end;
end;

procedure TFrmCadastroFuncionario.edt_numeroKeyPress(Sender: TObject;
  var Key: Char);
begin
{      if not (Key in ['0'..'9',#16,#8,#9,#13,#20,#36,#37,#46,#107] ) or
     (Key in ['K','k']) then
      begin
          ShowMessage('Apenas n�meros!');
          Key := #0;
      end; }
end;

procedure TFrmCadastroFuncionario.edt_sexoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['m','M','f','F',#8] ) then
      begin
          ShowMessage('Apenas "m" ou "f"');
          Key := #0;
      end;
end;

procedure TFrmCadastroFuncionario.edt_salarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9',',',#16,#8,#9,#13,#20,#36,#37,#46,#107] ) or
     (Key in ['K','k']) then
      begin
          ShowMessage('Apenas n�meros e v�rgula!');
          Key := #0;
      end;
end;

function TFrmCadastroFuncionario.validaCampos: Boolean;
begin
      Result := False;
              if self.edt_salario.Text = '' then
                  self.edt_salario.Text := '0'; 

              if (self.edt_nome.Text = '') then
                    begin
                      ShowMessage('O nome do funcion�rio � obrigat�rio!');
                      self.edt_nome.SetFocus;
                    end
              else if  (Self.edt_cpf.Text = '') then
                    begin
                      ShowMessage('O CPF do funcion�rio � obrigat�rio!');
                      self.edt_cpf.SetFocus;
                    end
              else if  (Self.edt_cidade.Text = '') then
                    begin
                      ShowMessage('A cidade do funcion�rio � obrigat�ria!');
                      self.btn_buscar.SetFocus;
                    end
              else if (Self.cb_nome.ItemIndex = -1) then
                    begin
                      ShowMessage('O sexo do funcion�rio � obrigat�rio!');
                      self.cb_nome.SetFocus;
                    end
              else if (self.cb_cargo.ItemIndex = -1) then
                    begin
                      ShowMessage('O cargo do funcion�rio � obrigat�rio!');
                      self.cb_cargo.SetFocus;
                    end
              else if (verificaReal(edt_salario.Text) = False) then
                    begin
                      ShowMessage('O valor do sal�rio foi digitado incorretamente!' + #13 + 'Use v�rgula para separar ou digite n�meros inteiros');
                      self.edt_salario.SetFocus;
                    end
              else
                begin
                    if (Self.edt_cpf.Text <> '') then
                      begin
                        if isCPF(edt_cpf.Text) = False then
                          begin
                            ShowMessage('CPF Inv�lido!');
                            Result := False;
                            Exit;
                          end
                        else
                            Result := True;
                      end;
                  Result := True;
                end;
end;

function TFrmCadastroFuncionario.verificaReal(texto: string): Boolean;
begin
    try
       StrToFloat(texto);
       Result:= True;
    except
        Result:= False;
    end;
end;

function TFrmCadastroFuncionario.isCPF(CPF: string): Boolean;
var dig10, dig11: string; s, i, r, peso: integer;
begin // length - retorna o tamanho da string (CPF � um n�mero formado por 11 d�gitos)
      if ((CPF = '00000000000') or (CPF = '11111111111') or
        (CPF = '22222222222') or (CPF = '33333333333') or
        (CPF = '44444444444') or (CPF = '55555555555') or
        (CPF = '66666666666') or (CPF = '77777777777') or
        (CPF = '88888888888') or (CPF = '99999999999') or
        (length(CPF) <> 11)) then
            begin
                isCPF := false;
                exit;
            end;

      try
          { *-- C�lculo do 1o. Digito Verificador --* }
          s := 0;

          peso := 10; for i := 1 to 9 do
                begin
                        s := s + (StrToInt(CPF[i]) * peso);
                        peso := peso - 1;
                end;

          r := 11 - (s mod 11);
          if ((r = 10) or (r = 11)) then
                  dig10 := '0'
          else
                str(r:1, dig10);
                // converte um n�mero no respectivo caractere num�rico
                { *-- C�lculo do 2o. Digito Verificador --* }
                s := 0; peso := 11;
            
          for i := 1 to 10 do
              begin
                s := s + (StrToInt(CPF[i]) * peso);
                peso := peso - 1;
              end;

          r := 11 - (s mod 11);

          if ((r = 10) or (r = 11)) then
              dig11 := '0'
          else
              str(r:1, dig11);

          { Verifica se os digitos calculados conferem com os digitos informados. }
          if ((dig10 = CPF[10]) and (dig11 = CPF[11])) then
              isCPF := true
          else
              isCPF := false;

      except
      isCPF := false
      end;    
end;

procedure TFrmCadastroFuncionario.edt_salarioExit(Sender: TObject);
var aux : real;
begin
  inherited;
  if verificaReal(edt_salario.Text) then
  begin
    if not verificaVirgula(edt_salario.Text) then
       begin
         aux := strtofloat(edt_salario.Text);
         edt_salario.Text := floattostr(aux) + ',00';
       end;
  end
  else if not (verificaReal(edt_salario.Text)) and (edt_salario.Text <> '') then
    begin
     ShowMessage('Apenas n�meros e v�rgula - Formato: o,oo ');
     edt_salario.Text := '0,00';
     edt_salario.SetFocus;
    end
  else
     edt_salario.Text := '0,00';

  edt_salario.Text := duasCasas(edt_salario.Text);
end;

function TFrmCadastroFuncionario.verificaVirgula(texto: string): boolean;
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

procedure TFrmCadastroFuncionario.cb_cargoExit(Sender: TObject);
begin
  inherited;
  if cb_cargo.ItemIndex < 0 then
     cb_cargo.ItemIndex := 0;
end;

procedure TFrmCadastroFuncionario.cb_cargoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
   key:=#0;
end;

procedure TFrmCadastroFuncionario.edt_fixo1KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
    if (Key = #32) or not (Key in ['0'..'9',#16,#8,#9,#13,#20,#27,#36,#37,#46,#107] ) then
      begin
          Key := #0;
          self.edt_fixo1.Clear;
      end;
end;

procedure TFrmCadastroFuncionario.edt_celular1KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
    if (Key = #32) or not (Key in ['0'..'9',#16,#8,#9,#13,#20,#27,#36,#37,#46,#107] ) then
      begin
          Key := #0;
          self.edt_celular1.Clear;
      end;
end;

procedure TFrmCadastroFuncionario.FormShortCut(var Msg: TWMKey;
  var Handled: Boolean);
var num1, num2: integer;
   begin
  inherited;
 if (ActiveControl = self.edt_fixo1) and (Msg.CharCode=9) then
      begin
      num1 := length(trim(edt_fixo1.Text));
        if (num1 > 0) and (num1 < 10 )then
           begin
             Msg.CharCode := 0;
             showMessage('Digite o telefone completo!');
             edt_fixo1.text := '';
           end;
      num1:= length(self.edt_fixo1.Text);
      if (  (isNumerico(self.edt_fixo1.Text) = false) and (num1 > 0 ) ) then
        begin
            ShowMessage('Apenas n�meros!');
            Msg.CharCode := 0;
            edt_fixo1.text := '';
            edt_fixo1.SetFocus;
        end;

      end;

    if (ActiveControl = self.edt_celular1) and (Msg.CharCode=9) then
      begin
         num1 := length(trim(edt_celular1.Text));
           if (num1 > 0) and (num1 < 10 )then
              begin
                Msg.CharCode := 0;
                showMessage('Digite o telefone completo!');
                edt_celular1.text := '';
              end;

         num1:= length(self.edt_celular1.Text);
         if (  (isNumerico(self.edt_celular1.Text) = false) and (num1 > 0 ) ) then
           begin
               ShowMessage('Apenas n�meros!');
               Msg.CharCode := 0;
               edt_celular1.text := '';
               edt_celular1.SetFocus;
           end;
      end;    
end;

procedure TFrmCadastroFuncionario.cb_nomeExit(Sender: TObject);
begin
  inherited;
  if cb_nome.ItemIndex < 0 then
     cb_nome.ItemIndex := 0;
end;

procedure TFrmCadastroFuncionario.cb_nomeKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
   key:=#0;
end;
procedure TFrmCadastroFuncionario.edt_fixo1Exit(Sender: TObject);
begin
inherited;
  if edt_fixo1.Text <> '' then
   if not validaTelefone(edt_fixo1.Text) then
    begin
      ShowMessage('Telefone inv�lido!');
      edt_fixo1.SetFocus;
    end;
end;

procedure TFrmCadastroFuncionario.edt_celular1Exit(Sender: TObject);
begin
inherited;
  if edt_celular1.Text <> '' then
   if not validaCelular(edt_celular1.Text) then
    begin
      ShowMessage('Celular inv�lido!');
      edt_celular1.SetFocus;
    end;
end;

function TFrmCadastroFuncionario.validaCelular(texto: string): Boolean;
begin
   result := true;
     if (texto [1] = '0') or (texto[3] = '0') or (texto[3] = '1') or (texto[3] = '2') or (texto[3] = '3') or (texto[3] = '4') or (texto[3] = '5') then
       Result := false;
end;

function TFrmCadastroFuncionario.validaTelefone(texto: string): Boolean;
begin
   result := true;
     if (texto [1] = '0') or (texto[3] = '0') or (texto[3] = '1') then
       Result := false;
end;

function TFrmCadastroFuncionario.duasCasas(texto: string): string;
var numero: real;
texto2: string;
begin
  numero := strtofloat(texto);
  texto2 := FloatToStrF(numero,ffnumber,12,2);
  result := StringReplace(texto2,'.','',[rfReplaceAll]);
end;

end.
