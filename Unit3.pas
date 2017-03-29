unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.Win.ADODB, Data.DB, Vcl.StdCtrls,
  Vcl.Buttons;

type
  TLogin = class(TForm)
    edtUsuario: TEdit;
    edtSenha: TEdit;
    btnEntrar: TBitBtn;
    btnFechar: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    ADOConnection1: TADOConnection;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    procedure btnEntrarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    iCodUsuario: integer;
    lStatus: array[0..2] of string;
  end;

var
  Login: TLogin;

implementation

{$R *.dfm}

uses Unit1, Unit2, Unit4;

procedure TLogin.btnEntrarClick(Sender: TObject);
begin
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('select * from usuario where Usuario = "' + edtUsuario.Text + '";');
  ADOQuery1.Open;
  ADOQuery1.Active:=true;

  if ((edtUsuario.Text = ADOQuery1.FieldByName('Usuario').Value) and (edtSenha.Text = ADOQuery1.FieldByName('Senha').Value)) then
  begin
    iCodUsuario:= ADOQuery1.FieldbyName('idUsuario').value;
    Form1.lListProjeto:= TStringList.Create;

    Form1.ADOTable1.Refresh;
    Form1.ADOTable1.First;
    while (not Form1.ADOTable1.Eof) do
    begin
      if ((Form1.ADOTable1.FieldByName('Excluir').AsString = '0') and (Form1.ADOTable1.FieldByName('idUsuario').AsString = IntToStr(Login.iCodUsuario))) then
      begin
        Form1.cboPesquisa.Items.Add(Form1.ADOTable1.FieldByName('NomeProjeto').AsString);
        Form1.lListProjeto.Add(Form1.ADOTable1.FieldByName('NomeProjeto').AsString);
      end;
      Form1.ADOTable1.Next;
    end;
    lStatus[0]:= 'Em Andamento';
    lStatus[1]:= 'Finalizado';
    lStatus[2]:= 'Cancelado';

    Form1.cboStatus.Items.Add('Em Andamento');
    Form1.cboStatus.Items.Add('Finalizado');
    Form1.cboStatus.Items.Add('Cancelado');
    Form1.cboStatus.Items.Add('Todos');

    Form1.cboStatus.Text:= 'Em Andamento';
    Form1.Show;
    Login.Hide;
  end
  else
    if ((edtUsuario.Text = ADOQuery1.FieldByName('Usuario').Value) and (edtSenha.Text <> ADOQuery1.FieldByName('Senha').Value)) then
    begin
      edtSenha.Clear;
      showmessage('Senha Iválida!');
    end
    else
    begin
      edtUsuario.Clear;
      edtSenha.Clear;
      showmessage('Usuário ou Senha Iválido!');
    end;
end;

procedure TLogin.btnFecharClick(Sender: TObject);
begin
  Close;
end;

end.
