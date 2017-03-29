object Login: TLogin
  Left = 0
  Top = 0
  Caption = 'Login'
  ClientHeight = 201
  ClientWidth = 239
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
    Left = 24
    Top = 27
    Width = 43
    Height = 13
    Caption = 'Usu'#225'rio: '
  end
  object Label2: TLabel
    Left = 24
    Top = 70
    Width = 37
    Height = 13
    Caption = 'Senha: '
  end
  object edtUsuario: TEdit
    Left = 67
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object edtSenha: TEdit
    Left = 67
    Top = 67
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
  end
  object btnEntrar: TBitBtn
    Left = 89
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Entrar'
    TabOrder = 2
    OnClick = btnEntrarClick
  end
  object btnFechar: TBitBtn
    Left = 8
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Fechar'
    TabOrder = 3
    OnClick = btnFecharClick
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;Data Source=crono' +
      'metro'
    LoginPrompt = False
    Left = 8
    Top = 168
  end
  object ADOTable1: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'usuario'
    Left = 48
    Top = 168
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 88
    Top = 168
  end
  object ADOQuery1: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    DataSource = DataSource1
    Parameters = <>
    SQL.Strings = (
      'select * from usuario')
    Left = 128
    Top = 168
  end
end
