unit uFrmData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons;

type
  TFrmData = class(TForm)
    data_inicio: TDateTimePicker;
    data_fim: TDateTimePicker;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    dataInicio: TDate;
    dataFim: Tdate;
  end;

var
  FrmData: TFrmData;

implementation

{$R *.dfm}

procedure TFrmData.BitBtn1Click(Sender: TObject);
begin
  if self.data_inicio.Date > self.data_fim.Date then
      begin
         ShowMessage('Data de in�cio n�o pode ser superior � data final!');
         self.data_inicio.Date := self.data_fim.Date;
         self.data_inicio.SetFocus;
      end
  else
      begin
       self.dataInicio := data_inicio.Date;
       self.dataFim := data_fim.Date;
       close;
      end;

end;

procedure TFrmData.FormShow(Sender: TObject);
begin
   data_inicio.DateTime := date;
   data_fim.DateTime := date;
end;

end.
