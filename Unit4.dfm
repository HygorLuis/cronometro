object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'Form4'
  ClientHeight = 462
  ClientWidth = 701
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 26
    Top = 21
    Width = 121
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Nome'
  end
  object Label2: TLabel
    Left = 178
    Top = 21
    Width = 121
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'CPF/CNPJ'
  end
  object Label4: TLabel
    Left = 40
    Top = 208
    Width = 73
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Tipo'
  end
  object Label5: TLabel
    Left = 42
    Top = 261
    Width = 39
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'DDD'
  end
  object Label6: TLabel
    Left = 87
    Top = 261
    Width = 121
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Fone'
  end
  object GroupBox2: TGroupBox
    Left = 26
    Top = 184
    Width = 263
    Height = 137
    Caption = 'Contato'
    TabOrder = 13
  end
  object GroupBox1: TGroupBox
    Left = 26
    Top = 89
    Width = 207
    Height = 57
    Caption = 'Email'
    TabOrder = 10
  end
  object btnIncluirCli: TBitBtn
    Left = 61
    Top = 403
    Width = 75
    Height = 25
    Caption = 'Incluir'
    TabOrder = 0
    OnClick = btnIncluirCliClick
  end
  object btnGravarCli: TBitBtn
    Left = 142
    Top = 403
    Width = 75
    Height = 25
    Caption = 'Gravra'
    TabOrder = 1
    OnClick = btnGravarCliClick
  end
  object btnCancelarCli: TBitBtn
    Left = 223
    Top = 403
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 2
  end
  object edtNome: TEdit
    Left = 26
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object medtCPFCNPJ: TMaskEdit
    Left = 178
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 4
    Text = ''
  end
  object edtEmail: TEdit
    Left = 42
    Top = 111
    Width = 121
    Height = 21
    TabOrder = 5
  end
  object medtFone: TMaskEdit
    Left = 87
    Top = 280
    Width = 121
    Height = 21
    TabOrder = 6
    Text = ''
  end
  object edtDDD: TEdit
    Left = 42
    Top = 280
    Width = 39
    Height = 21
    TabOrder = 7
  end
  object cboTipo: TComboBox
    Left = 42
    Top = 227
    Width = 71
    Height = 21
    TabOrder = 8
  end
  object cboOperadora: TComboBox
    Left = 142
    Top = 227
    Width = 105
    Height = 21
    TabOrder = 9
  end
  object btnIncluirEmail: TBitBtn
    Left = 176
    Top = 109
    Width = 41
    Height = 25
    Caption = '+'
    TabOrder = 11
    OnClick = btnIncluirEmailClick
  end
  object BitBtn2: TBitBtn
    Left = 230
    Top = 278
    Width = 41
    Height = 25
    Caption = '+'
    TabOrder = 12
  end
end
