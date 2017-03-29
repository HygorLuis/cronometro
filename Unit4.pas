unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Mask,
  Vcl.Buttons;

type
  TForm4 = class(TForm)
    btnIncluirCli: TBitBtn;
    btnGravarCli: TBitBtn;
    btnCancelarCli: TBitBtn;
    edtNome: TEdit;
    medtCPFCNPJ: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtEmail: TEdit;
    medtFone: TMaskEdit;
    edtDDD: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    cboTipo: TComboBox;
    cboOperadora: TComboBox;
    GroupBox1: TGroupBox;
    btnIncluirEmail: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox2: TGroupBox;
    procedure btnIncluirCliClick(Sender: TObject);
    procedure btnGravarCliClick(Sender: TObject);
    procedure btnIncluirEmailClick(Sender: TObject);
  private
    var sIdCli: String;
  public
    ListEmail: TStringList;
    ListFone: TStringList;
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

uses Unit1, Unit2, Unit3;

procedure TForm4.btnIncluirEmailClick(Sender: TObject);
begin
  ListEmail.Add(edtEmail.Text);
  edtEmail.Clear;
end;

procedure TForm4.btnGravarCliClick(Sender: TObject);
var MyList: String;
begin
  Form1.ADOQuery1.Open;
  Form1.ADOQuery1.SQL.Clear;
  Form1.ADOQuery1.SQL.Add('INSERT INTO cliente VALUES (null, 29, "' +
  edtNome.Text + '", "' + medtCPFCNPJ.Text + '");');
  Form1.ADOQuery1.ExecSQL;
  Form1.ADOQuery1.Close;

  Form1.ADOQuery1.SQL.Clear;
  Form1.ADOQuery1.SQL.Add('select * from cliente ORDER BY idcliente DESC LIMIT 1;');
  Form1.ADOQuery1.Open;
  Form1.ADOQuery1.Active:=true;
  sIdCli:= IntToStr(Form1.ADOQuery1.FieldbyName('idcliente').value);
  Form1.ADOQuery1.Close;

  for MyList in ListEmail do
  begin
    Form1.ADOQuery1.Open;
    Form1.ADOQuery1.SQL.Clear;
    Form1.ADOQuery1.SQL.Add('INSERT INTO email VALUES (null, ' + sIdCli + ', "' + MyList + '");');
    Form1.ADOQuery1.ExecSQL;
    Form1.ADOQuery1.Close;
  end;


  {Form1.ADOQuery1.Open;
  Form1.ADOQuery1.SQL.Clear;
  Form1.ADOQuery1.SQL.Add('INSERT INTO telefone VALUES (null, ' +
  sIdCli + ', "' + edtEmail.Text + '");');
  Form1.ADOQuery1.ExecSQL;
  Form1.ADOQuery1.Close;}

  ShowMessage('Gravado com Sucesso!');
end;

procedure TForm4.btnIncluirCliClick(Sender: TObject);
begin
  edtNome.Clear;
  edtEmail.Clear;
  edtDDD.Clear;
  medtCPFCNPJ.Clear;
  medtFone.Clear;
  btnGravarCli.Enabled:= True;
  btnCancelarCli.Enabled:= True;
  btnIncluirCli.Enabled:= False;
end;

end.
