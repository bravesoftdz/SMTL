inherited FrmCadastroCompra: TFrmCadastroCompra
  Left = 184
  Top = 103
  Width = 915
  Height = 588
  Caption = 'Nova Compra'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited lbl_campos: TLabel
    Left = 40
    Top = 488
  end
  object lbl_nome: TLabel [3]
    Left = 184
    Top = 32
    Width = 61
    Height = 18
    Caption = 'N'#250'mero*'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object lbl_1: TLabel [4]
    Left = 659
    Top = 128
    Width = 125
    Height = 18
    Caption = 'Data da Chegada'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object lbl2: TLabel [5]
    Left = 504
    Top = 32
    Width = 58
    Height = 18
    Caption = 'Modelo*'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object lbl3: TLabel [6]
    Left = 656
    Top = 32
    Width = 106
    Height = 18
    Caption = 'Data Emiss'#227'o*'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel [7]
    Left = 368
    Top = 32
    Width = 44
    Height = 18
    Caption = 'S'#233'rie*'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object lbl_12: TLabel [8]
    Left = 152
    Top = 128
    Width = 87
    Height = 18
    Caption = 'Fornecedor*'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel [9]
    Left = 440
    Top = 128
    Width = 81
    Height = 18
    Caption = 'Cond Pgto*'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel [10]
    Left = 368
    Top = 224
    Width = 40
    Height = 18
    Caption = 'Qtde*'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel [11]
    Left = 432
    Top = 224
    Width = 106
    Height = 18
    Caption = 'Pre'#231'o Unit'#225'rio*'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel [12]
    Left = 600
    Top = 224
    Width = 84
    Height = 18
    Caption = 'Pre'#231'o Total*'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object SpeedButton1: TSpeedButton [13]
    Left = 784
    Top = 248
    Width = 23
    Height = 22
    Caption = '+'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object SpeedButton2: TSpeedButton [14]
    Left = 816
    Top = 248
    Width = 23
    Height = 22
    Caption = '-'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel [15]
    Left = 104
    Top = 224
    Width = 61
    Height = 18
    Caption = 'Produto*'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel [16]
    Left = 56
    Top = 224
    Width = 30
    Height = 18
    Caption = 'Cod'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  inherited btn_salvar: TButton
    Left = 688
    Top = 480
  end
  inherited btn_sair: TButton
    Left = 792
    Top = 480
  end
  object edt_nome: TEdit
    Left = 176
    Top = 56
    Width = 153
    Height = 25
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 50
    ParentFont = False
    TabOrder = 3
  end
  object edt_barras: TEdit
    Left = 655
    Top = 152
    Width = 193
    Height = 25
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 20
    ParentFont = False
    TabOrder = 4
  end
  object edt_unidade: TEdit
    Left = 504
    Top = 56
    Width = 113
    Height = 25
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 50
    ParentFont = False
    TabOrder = 5
  end
  object edt_referencia: TEdit
    Left = 656
    Top = 56
    Width = 193
    Height = 25
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 20
    ParentFont = False
    TabOrder = 6
  end
  object Edit1: TEdit
    Left = 368
    Top = 56
    Width = 97
    Height = 25
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 50
    ParentFont = False
    TabOrder = 7
  end
  object edt_Fornecedor: TEdit
    Left = 104
    Top = 152
    Width = 225
    Height = 25
    CharCase = ecUpperCase
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 8
  end
  object btn_buscar1: TButton
    Left = 144
    Top = 184
    Width = 75
    Height = 25
    Caption = 'Buscar'
    TabOrder = 9
  end
  object Edit2: TEdit
    Left = 368
    Top = 152
    Width = 57
    Height = 25
    CharCase = ecUpperCase
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 10
  end
  object Edit3: TEdit
    Left = 432
    Top = 152
    Width = 185
    Height = 25
    CharCase = ecUpperCase
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 11
  end
  object Button1: TButton
    Left = 448
    Top = 184
    Width = 75
    Height = 25
    Caption = 'Buscar'
    TabOrder = 12
  end
  object Edit5: TEdit
    Left = 368
    Top = 248
    Width = 49
    Height = 25
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 50
    ParentFont = False
    TabOrder = 13
  end
  object Edit6: TEdit
    Left = 432
    Top = 248
    Width = 153
    Height = 25
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 20
    ParentFont = False
    TabOrder = 14
  end
  object Edit7: TEdit
    Left = 104
    Top = 248
    Width = 145
    Height = 25
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 50
    ParentFont = False
    TabOrder = 15
  end
  object Button2: TButton
    Left = 256
    Top = 248
    Width = 75
    Height = 25
    Caption = 'Buscar'
    TabOrder = 16
  end
  object Edit8: TEdit
    Left = 600
    Top = 248
    Width = 169
    Height = 25
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 20
    ParentFont = False
    TabOrder = 17
  end
  object ListView1: TListView
    Left = 48
    Top = 288
    Width = 793
    Height = 145
    Columns = <>
    TabOrder = 18
  end
  object edt_codFornecedor: TEdit
    Left = 48
    Top = 152
    Width = 49
    Height = 25
    CharCase = ecUpperCase
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 19
  end
  object Edit4: TEdit
    Left = 48
    Top = 248
    Width = 49
    Height = 25
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 50
    ParentFont = False
    TabOrder = 20
  end
end
