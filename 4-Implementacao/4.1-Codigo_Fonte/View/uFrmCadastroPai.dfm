object FrmCadastroPai: TFrmCadastroPai
  Left = 165
  Top = 124
  Width = 918
  Height = 483
  Caption = 'Cadastro'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  PixelsPerInch = 96
  TextHeight = 13
  object lbl__cod: TLabel
    Left = 40
    Top = 32
    Width = 52
    Height = 18
    Caption = 'C'#243'digo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object lbl_gerado: TLabel
    Left = 24
    Top = 80
    Width = 119
    Height = 13
    Caption = 'Gerado automaticamente'
  end
  object lbl_campos: TLabel
    Left = 32
    Top = 392
    Width = 102
    Height = 13
    Caption = '* Campos obrigat'#243'rios'
  end
  object edt_cod: TEdit
    Left = 40
    Top = 56
    Width = 89
    Height = 24
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
  end
  object btn_salvar: TButton
    Left = 680
    Top = 360
    Width = 75
    Height = 25
    Caption = '&Salvar'
    TabOrder = 1
    OnClick = btn_salvarClick
  end
  object btn_sair: TButton
    Left = 784
    Top = 360
    Width = 75
    Height = 25
    Caption = 'Sa&ir'
    TabOrder = 2
    OnClick = btn_sairClick
  end
end
