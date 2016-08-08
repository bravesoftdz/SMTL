unit uFrmCadastroMarca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastroPai, StdCtrls, uController, uMarca;

type
  TFrmCadastroMarca = class(TFrmCadastroPai)
    lbl_pais: TLabel;
    edt_marca: TEdit;
  private
    { Private declarations }
    umaMarca : Marca;
    umController : controller;
    
  protected
    procedure Sair;  override;
    procedure Salvar; override;
    procedure CarregaEdit; override;
    procedure LimparCampos; override;

  public
    { Public declarations }
    procedure ConhecaObj(pObj : TObject; pController: controller); override;
    procedure DesabilitaCampos;
    procedure HabilitaCampos;
  end;

var
  FrmCadastroMarca: TFrmCadastroMarca;

implementation

{$R *.dfm}

{ TFrmCadastroMarca }

procedure TFrmCadastroMarca.CarregaEdit;
begin
  Self.edt_cod.Text:= IntToStr(umaMarca.getCodigo);
  self.edt_marca.Text := umaMarca.getNome;
end;

procedure TFrmCadastroMarca.ConhecaObj(pObj: TObject;
  pController: controller);
begin
  inherited;
  umaMarca := Marca(pObj);
  umController := pController;
  self.LimparCampos;
    if umaMarca.getCodigo <> 0 then
        begin
            Self.CarregaEdit;
        end;

    if self.btn_salvar.Caption = '&Salvar' then
      HabilitaCampos
    else
      DesabilitaCampos;
end;

procedure TFrmCadastroMarca.DesabilitaCampos;
begin
    self.edt_marca.Enabled := False;
end;

procedure TFrmCadastroMarca.HabilitaCampos;
begin
  self.edt_marca.Enabled := True;
end;

procedure TFrmCadastroMarca.LimparCampos;
begin
  Self.edt_cod.Clear;
  self.edt_marca.Clear;
end;

procedure TFrmCadastroMarca.Sair;
begin
  inherited;
end;

procedure TFrmCadastroMarca.Salvar;
var incluido, permitir : string;
selected : integer;
men : TForm;
begin
        if Self.btn_salvar.Caption = '&Salvar' then
           begin
                if (self.edt_marca.Text  = '') then
                begin
                   ShowMessage('O nome da marca � obrigat�rio!');
                   self.edt_marca.SetFocus;
                end
              else
                  begin
                      umaMarca.setNome(self.edt_marca.Text);
                      incluido := umController.getControllerMarca.salvaMarca(umaMarca);
                         if incluido = 'OK' then
                            if umaMarca.getCodigo = 0 then
                              ShowMessage(umaMarca.getNome + ' inclu�da com sucesso!')
                            else
                              ShowMessage(umaMarca.getNome + ' alterada com sucesso!');
                      inherited;
                  end;
           end
           else
              begin
                 men := CreateMessageDialog('Deseja mesmo excluir a marca ' + QuotedStr(umaMarca.getNome) + '?',mtCustom,[mbYes,mbAbort]);
                 men.Caption := 'Confirma��o';
                 men.Position := poDesktopCenter;
                 selected := men.ShowModal;
                 
                  if selected = mrYes then
                    begin
                        permitir := umController.getControllerMarca.pesquisaDependencia(umaMarca.getCodigo);
                          if permitir = 'OK' then
                             begin
                              umController.getControllerMarca.excluiMarca(umaMarca);
                              ShowMessage(QuotedStr(umaMarca.getNome) + ' exclu�da com sucesso!')
                             end
                          else
                             Showmessage('N�o foi poss�vel excluir a marca! H� produtos vinculados a ela!');
                    inherited;
                    end;
              end;
end;

end.
