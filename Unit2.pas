unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  Vcl.DBCtrls, Vcl.Mask, Data.Win.ADODB;

type
  TForm2 = class(TForm)
    Label3: TLabel;
    DBMemoDescricao: TDBMemo;
    btnIncluir: TBitBtn;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    btnVoltar: TBitBtn;
    ADOConnection1: TADOConnection;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    ADOTable1idProjeto: TAutoIncField;
    ADOTable1NomeProjeto: TStringField;
    ADOTable1Tempo: TTimeField;
    ADOTable1Descricao: TStringField;
    ADOTable1ValorHora: TFloatField;
    ADOTable1ValorTotal: TFloatField;
    ADOTable1Excluir: TIntegerField;
    ADOTable1idUsuario: TIntegerField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    ADOTable1idStatus: TIntegerField;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    ComboBox1: TComboBox;
    btnIncluirCli: TBitBtn;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnIncluirCliClick(Sender: TObject);
  private

  public

  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses Unit1, Unit3, Unit4;

procedure TForm2.btnVoltarClick(Sender: TObject);
var
MyList: string;
begin
  Form1.Show;
  Form1.lListProjeto.Clear;
  Form1.ADOTable1.Refresh;
  ADOTable1.First;
  while (not ADOTable1.Eof) do
  begin
    Form1.lListProjeto.Add(ADOTable1NomeProjeto.AsString);
    ADOTable1.Next;
  end;

  for MyList in Form1.lListProjeto do
  begin
    Form1.cboPesquisa.ItemIndex:= Form1.cboPesquisa.Items.IndexOf(MyList);
    if (Form1.cboPesquisa.ItemIndex > -1) then Continue;
    Form1.cboPesquisa.Items.Add(MyList)
  end;

  Form2.Hide;
end;

procedure TForm2.btnCancelarClick(Sender: TObject);
begin
ADOTable1.Cancel;

btnIncluir.Enabled:= True;
btnVoltar.Enabled:= True;
btnGravar.Enabled:= False;
btnCancelar.Enabled:= False;
Form2.DBMemoDescricao.Enabled:= False;
end;

procedure TForm2.btnGravarClick(Sender: TObject);
begin
ADOTable1.Post;

btnIncluir.Enabled:= True;
btnVoltar.Enabled:= True;
btnGravar.Enabled:= False;
btnCancelar.Enabled:= False;
Form2.DBMemoDescricao.Enabled:= False;

showmessage('Gravado com Sucesso!');
end;

procedure TForm2.btnIncluirClick(Sender: TObject);
begin
ADOTable1.Insert;
DBEdit2.Text:= '00:00:00';
DBEdit3.Text:= '1';
DBEdit5.Text:= '0';
DBEdit6.Text:= '0';
DBEdit7.Text:= IntToStr(Login.iCodUsuario);

btnGravar.Enabled:= True;
btnCancelar.Enabled:= True;
Form2.DBMemoDescricao.Enabled:= True;
btnVoltar.Enabled:= False;
btnIncluir.Enabled:= False;
end;

procedure TForm2.btnIncluirCliClick(Sender: TObject);
begin
  Form4.Show;
  Form4.btnIncluirCli.Enabled:= True;
  Form4.btnGravarCli.Enabled:= False;
  Form4.btnCancelarCli.Enabled:= False;
  Form4.ListEmail:= TStringList.Create;
  Form4.ListFone:= TStringList.Create;
  Form2.Hide;
end;

end.
