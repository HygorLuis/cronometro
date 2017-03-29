object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 297
  ClientWidth = 563
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblTempo: TLabel
    Left = 382
    Top = 28
    Width = 156
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Tempo'
  end
  object Label1: TLabel
    Left = 136
    Top = 136
    Width = 46
    Height = 13
    Caption = 'Descricao'
  end
  object Label2: TLabel
    Left = 8
    Top = 8
    Width = 547
    Height = 13
    Alignment = taCenter
    AutoSize = False
  end
  object Label3: TLabel
    Left = 425
    Top = 136
    Width = 17
    Height = 13
    Caption = 'R$:'
  end
  object btnIniciarHora: TBitBtn
    Left = 382
    Top = 47
    Width = 75
    Height = 25
    Caption = 'Iniciar'
    Enabled = False
    TabOrder = 0
    OnClick = btnIniciarHoraClick
  end
  object MemoDescricao: TMemo
    Left = 18
    Top = 112
    Width = 279
    Height = 129
    Enabled = False
    TabOrder = 1
  end
  object btnGravarHora: TBitBtn
    Left = 463
    Top = 47
    Width = 75
    Height = 25
    Caption = 'Gravar'
    Enabled = False
    TabOrder = 2
    OnClick = btnGravarHoraClick
  end
  object btnIncluir: TBitBtn
    Left = 120
    Top = 81
    Width = 75
    Height = 25
    Caption = 'Incluir'
    TabOrder = 3
    OnClick = btnIncluirClick
  end
  object btnAlterarDescricao: TBitBtn
    Left = 16
    Top = 247
    Width = 75
    Height = 25
    Caption = 'Alterar'
    Enabled = False
    TabOrder = 4
    OnClick = btnAlterarDescricaoClick
  end
  object btnGravarDescricao: TBitBtn
    Left = 120
    Top = 247
    Width = 75
    Height = 25
    Caption = 'Gravar'
    Enabled = False
    TabOrder = 5
    OnClick = btnGravarDescricaoClick
  end
  object edtValorTotal: TEdit
    Left = 448
    Top = 133
    Width = 73
    Height = 21
    Alignment = taCenter
    Enabled = False
    TabOrder = 6
  end
  object cboPesquisa: TComboBox
    Left = 88
    Top = 54
    Width = 139
    Height = 21
    TabOrder = 7
    OnChange = cboPesquisaChange
  end
  object btnCancelarDescricao: TBitBtn
    Left = 222
    Top = 247
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    Enabled = False
    TabOrder = 8
    OnClick = btnCancelarDescricaoClick
  end
  object btnCancelarHora: TBitBtn
    Left = 425
    Top = 78
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    Enabled = False
    TabOrder = 9
    OnClick = btnCancelarHoraClick
  end
  object cboStatus: TComboBox
    Left = 104
    Top = 27
    Width = 105
    Height = 21
    TabOrder = 10
    OnChange = cboStatusChange
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 360
    Top = 136
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;Data Source=crono' +
      'metro'
    LoginPrompt = False
    Left = 504
    Top = 248
  end
  object ADOTable1: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'projeto'
    Left = 448
    Top = 248
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 400
    Top = 248
  end
  object ADOQuery1: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from projeto')
    Left = 344
    Top = 248
  end
end
