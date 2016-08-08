unit uFrmCadastroPais;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastroPai, StdCtrls, uPais, uController;

type
  TFrmCadastroPais = class(TFrmCadastroPai)
    lbl_pais: TLabel;
    lbl__sigla: TLabel;
    lbl__DDI: TLabel;
    edt_pais: TEdit;
    edt__sigla: TEdit;
    edt__ddi: TEdit;
    lbl1: TLabel;
    procedure edt__siglaKeyPress(Sender: TObject; var Key: Char);
    procedure edt__ddiKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    umPais: Pais;
    umController : controller;
  protected
    procedure Sair;  override;
    procedure Salvar; override;
    procedure CarregaEdit; override;
    procedure LimparCampos; override;
    function validaCampos: Boolean;
    function verificaInteiro(texto: string): Boolean;

  public
    { Public declarations }
        procedure ConhecaObj(pObj : TObject; pController: controller); override;
        procedure DesabilitaEdit;
        procedure HabilitaEdit;
end;

var
  FrmCadastroPais: TFrmCadastroPais;

implementation

{$R *.dfm}

{ TFrmCadastroPais }
          
procedure TFrmCadastroPais.CarregaEdit;
var i: Integer;
aux: string;
begin
  self.edt_pais.Text := umPais.getPais;
  self.edt__sigla.Text := umPais.getSigla;

  aux := umPais.getDDI;
    if (aux <> '') then
      for i:=0 to Length(aux) do
          begin
            aux[i] := aux[i+1];
          end;
  self.edt__ddi.Text := aux;

  self.edt_cod.Text := IntToStr(umPais.getCodigo);
end;

procedure TFrmCadastroPais.ConhecaObj(pObj: TObject; pController: controller);
begin
    umPais := pais (pObj);
    umController := pController;
    self.LimparCampos;
      if umPais.getCodigo <> 0 then
        begin
          Self.CarregaEdit;
        end;

      if self.btn_salvar.Caption = '&Salvar' then
        self.HabilitaEdit
      else
        self.DesabilitaEdit;
end;

procedure TFrmCadastroPais.LimparCampos;
begin
  self.edt_pais.Clear;
  self.edt__sigla.Clear;
  self.edt__ddi.Clear;
  self.edt_cod.Clear;
end;

procedure TFrmCadastroPais.Sair;
begin
  inherited; 
end;

procedure TFrmCadastroPais.Salvar;
var incluido, excluido, permitir : string;
selected : integer;
men : TForm;
begin
      if self.btn_salvar.Caption = '&Salvar' then
       begin
            if validaCampos = True then
                begin
                    umPais.setPais(self.edt_pais.Text);
                    umPais.setDDI(self.edt__ddi.Text);
                    umPais.setSigla(self.edt__sigla.Text);
                    incluido := umController.getControllerPais.salvaPais(umPais);
                       if incluido = 'OK' then
                          if umPais.getCodigo = 0 then
                            ShowMessage(umPais.getPais + ' inclu�do com sucesso!')
                          else
                            ShowMessage(umPais.getPais + ' alterado com sucesso!');
                    inherited;
                end;
       end
       else
          begin
               men := CreateMessageDialog('Deseja mesmo excluir o pa�s ' + QuotedStr(umPais.getPais) + '?',mtCustom,[mbYes,mbAbort]);
               men.Caption := 'Confirma��o';
               men.Position := poDesktopCenter;
               selected := men.ShowModal;

             if selected = mrYes then
                begin
                  permitir := umController.getControllerPais.pesquisaDependencia(umPais.getCodigo);
                          if permitir = 'OK' then
                              begin
                               excluido :=  umController.getControllerPais.excluiPais(umPais);
                                    ShowMessage(QuotedStr(umPais.getPais) + ' exclu�do com sucesso!')
                              end
                          else
                              ShowMessage('N�o foi poss�vel excluir! H� estados vinculados a esse pa�s');
                  inherited;
                end;

          end;
end;

procedure TFrmCadastroPais.edt__siglaKeyPress(Sender: TObject;
  var Key: Char);
begin
   if not ( Key in ['A'..'Z','a'..'z','+',#16,#8,#9,#13,#20,#36,#37,#46,#107] )
    then
      begin
          ShowMessage('Apenas letras!');
          Key := #0;
      end;
end;

procedure TFrmCadastroPais.edt__ddiKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9',#16,#8,#9,#13,#20,#36,#37,#46,#107] ) or
     (Key in ['K','k']) then
      begin
          ShowMessage('Apenas n�meros!');
          Key := #0;
      end;
end;

procedure TFrmCadastroPais.DesabilitaEdit;
begin
  self.edt_pais.Enabled := False;
  self.edt__sigla.Enabled := False;
  self.edt__ddi.Enabled := False;
end;

procedure TFrmCadastroPais.HabilitaEdit;
begin
  self.edt_pais.Enabled := True;
  self.edt__sigla.Enabled := True;
  self.edt__ddi.Enabled := True;
end;

function TFrmCadastroPais.validaCampos: Boolean;
var aux: string;
begin
    Result:= False;
      if (self.edt_pais.Text  = '')  then
              begin
                 ShowMessage('O nome do pa�s � obrigat�rio!');
                 self.edt_pais.SetFocus;
              end
      else if (self.edt__sigla.Text = '') then
              begin
                 ShowMessage('A sigla do pa�s � obrigat�ria!');
                 self.edt__sigla.SetFocus;
              end
      else if (self.edt__ddi.Text <> '') and (verificaInteiro(self.edt__ddi.Text) = False) then
              begin
                 ShowMessage('Apenas n�meros s�o permitidos no campo DDI!');
                 self.edt__ddi.SetFocus;
              end
      else
            begin
              if (self.edt__ddi.Text <> '') and (Pos('+',self.edt__ddi.Text) = 0) then
                     begin
                         aux := self.edt__ddi.Text;
                         self.edt__ddi.Text := '+' + aux;
                     end;
               Result := True;
            end;
end;

function TFrmCadastroPais.verificaInteiro(texto: string): Boolean;
begin
    try
      StrToInt(texto);
      Result := True;
    except
      Result:= False;
    end;
end;

end.
