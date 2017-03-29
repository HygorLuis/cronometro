object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 356
  ClientWidth = 625
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 24
    Top = 160
    Width = 297
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Descricao'
  end
  object Label1: TLabel
    Left = 24
    Top = 99
    Width = 62
    Height = 13
    Caption = 'NomeProjeto'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 483
    Top = 268
    Width = 32
    Height = 13
    Caption = 'Tempo'
    FocusControl = DBEdit2
    Visible = False
  end
  object Label5: TLabel
    Left = 200
    Top = 99
    Width = 47
    Height = 13
    Caption = 'ValorHora'
    FocusControl = DBEdit4
  end
  object Label6: TLabel
    Left = 339
    Top = 231
    Width = 48
    Height = 13
    Caption = 'ValorTotal'
    FocusControl = DBEdit5
    Visible = False
  end
  object Label7: TLabel
    Left = 339
    Top = 268
    Width = 31
    Height = 13
    Caption = 'Excluir'
    FocusControl = DBEdit6
    Visible = False
  end
  object Label8: TLabel
    Left = 339
    Top = 311
    Width = 44
    Height = 13
    Caption = 'idUsuario'
    FocusControl = DBEdit7
    Visible = False
  end
  object Label4: TLabel
    Left = 483
    Top = 311
    Width = 39
    Height = 13
    Caption = 'idStatus'
    FocusControl = DBEdit3
    Visible = False
  end
  object DBMemoDescricao: TDBMemo
    Left = 24
    Top = 179
    Width = 297
    Height = 89
    DataField = 'Descricao'
    DataSource = DataSource1
    TabOrder = 0
  end
  object btnIncluir: TBitBtn
    Left = 56
    Top = 282
    Width = 75
    Height = 25
    Caption = 'Incluir'
    TabOrder = 1
    OnClick = btnIncluirClick
  end
  object btnGravar: TBitBtn
    Left = 137
    Top = 282
    Width = 75
    Height = 25
    Caption = 'Gravar'
    TabOrder = 2
    OnClick = btnGravarClick
  end
  object btnCancelar: TBitBtn
    Left = 218
    Top = 282
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 3
    OnClick = btnCancelarClick
  end
  object btnVoltar: TBitBtn
    Left = 8
    Top = 325
    Width = 75
    Height = 25
    Caption = 'Voltar'
    TabOrder = 4
    OnClick = btnVoltarClick
  end
  object DBEdit1: TDBEdit
    Left = 24
    Top = 115
    Width = 121
    Height = 21
    DataField = 'NomeProjeto'
    DataSource = DataSource1
    TabOrder = 5
  end
  object DBEdit2: TDBEdit
    Left = 483
    Top = 284
    Width = 121
    Height = 21
    DataField = 'Tempo'
    DataSource = DataSource1
    Enabled = False
    TabOrder = 6
    Visible = False
  end
  object DBEdit4: TDBEdit
    Left = 200
    Top = 115
    Width = 121
    Height = 21
    DataField = 'ValorHora'
    DataSource = DataSource1
    TabOrder = 7
  end
  object DBEdit5: TDBEdit
    Left = 339
    Top = 247
    Width = 121
    Height = 21
    DataField = 'ValorTotal'
    DataSource = DataSource1
    Enabled = False
    TabOrder = 8
    Visible = False
  end
  object DBEdit6: TDBEdit
    Left = 339
    Top = 287
    Width = 121
    Height = 21
    DataField = 'Excluir'
    DataSource = DataSource1
    Enabled = False
    TabOrder = 9
    Visible = False
  end
  object DBEdit7: TDBEdit
    Left = 339
    Top = 327
    Width = 121
    Height = 21
    DataField = 'idUsuario'
    DataSource = DataSource1
    Enabled = False
    TabOrder = 10
    Visible = False
  end
  object DBEdit3: TDBEdit
    Left = 483
    Top = 327
    Width = 134
    Height = 21
    DataField = 'idStatus'
    DataSource = DataSource1
    Enabled = False
    TabOrder = 11
    Visible = False
  end
  object ComboBox1: TComboBox
    Left = 100
    Top = 24
    Width = 145
    Height = 21
    TabOrder = 12
  end
  object btnIncluirCli: TBitBtn
    Left = 137
    Top = 51
    Width = 75
    Height = 25
    Caption = 'Incluir'
    TabOrder = 13
    OnClick = btnIncluirCliClick
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;Data Source=crono' +
      'metro'
    LoginPrompt = False
    Left = 576
    Top = 40
  end
  object ADOTable1: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'projeto'
    Left = 512
    Top = 40
    object ADOTable1idProjeto: TAutoIncField
      FieldName = 'idProjeto'
      ReadOnly = True
    end
    object ADOTable1NomeProjeto: TStringField
      FieldName = 'NomeProjeto'
      Size = 45
    end
    object ADOTable1Tempo: TTimeField
      FieldName = 'Tempo'
    end
    object ADOTable1Descricao: TStringField
      FieldName = 'Descricao'
      Size = 500
    end
    object ADOTable1ValorHora: TFloatField
      FieldName = 'ValorHora'
    end
    object ADOTable1ValorTotal: TFloatField
      FieldName = 'ValorTotal'
    end
    object ADOTable1Excluir: TIntegerField
      FieldName = 'Excluir'
    end
    object ADOTable1idUsuario: TIntegerField
      FieldName = 'idUsuario'
    end
    object ADOTable1idStatus: TIntegerField
      FieldName = 'idStatus'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 456
    Top = 40
  end
end
