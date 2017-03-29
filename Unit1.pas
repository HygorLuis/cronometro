unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.DBLookup, Vcl.Buttons, Vcl.Menus, Data.DB, Data.Win.ADODB, Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    btnIniciarHora: TBitBtn;
    lblTempo: TLabel;
    Timer1: TTimer;
    MemoDescricao: TMemo;
    btnGravarHora: TBitBtn;
    btnIncluir: TBitBtn;
    btnAlterarDescricao: TBitBtn;
    btnGravarDescricao: TBitBtn;
    edtValorTotal: TEdit;
    Label1: TLabel;
    cboPesquisa: TComboBox;
    Label2: TLabel;
    btnCancelarDescricao: TBitBtn;
    Label3: TLabel;
    btnCancelarHora: TBitBtn;
    ADOConnection1: TADOConnection;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    cboStatus: TComboBox;
    procedure Timer1Timer(Sender: TObject);
    procedure btnIniciarHoraClick(Sender: TObject);
    procedure btnGravarHoraClick(Sender: TObject);
    procedure btnAlterarDescricaoClick(Sender: TObject);
    procedure btnGravarDescricaoClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure cboPesquisaChange(Sender: TObject);
    procedure btnCancelarDescricaoClick(Sender: TObject);
    procedure btnCancelarHoraClick(Sender: TObject);
    procedure cboStatusChange(Sender: TObject);
  private
    TimeNOW: TDateTime;
    INICIO: TDateTime;
    iCodProjeto: integer;
    dValorTotal: double;
  public
     lListProjeto: TStringList;
  end;

var
  Form1: TForm1;

implementation

uses Unit2, Unit3;
{$R *.dfm}

procedure Pesquisa();
begin
    Form1.ADOQuery1.SQL.Clear;
    Form1.ADOQuery1.SQL.Add('select * from projeto where NomeProjeto like "%' + Form1.cboPesquisa.Text + '%" and idUsuario = ' + IntToStr(Login.iCodUsuario) + ';');
    Form1.ADOQuery1.Open;
    Form1.ADOQuery1.Active:=true;
end;

procedure TForm1.btnGravarHoraClick(Sender: TObject);
begin
  ADOQuery1.Close;
  ADOQuery1.Open;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('UPDATE projeto SET Tempo = "' + FormatDateTime('HH:MM:SS', INICIO) + '", ' +
                     'ValorTotal = ' + StringReplace(FloatToStr(dValorTotal), ',','.', [rfReplaceAll]) +
                     ' WHERE idProjeto = ' + IntToStr(iCodProjeto) + ' and idUsuario = ' + IntToStr(Login.iCodUsuario) + ';');
  ADOQuery1.ExecSQL;
  Pesquisa();

  btnIniciarHora.Caption := 'Iniciar';
  btnGravarHora.Enabled:= False;
  btnCancelarHora.Enabled:= False;
  lblTempo.Font.Color:= clBlack;
  ShowMessage('Gravado com Sucesso!');
end;

procedure TForm1.btnIniciarHoraClick(Sender: TObject);
begin
  if ((btnIniciarHora.Caption = 'Iniciar') or (btnIniciarHora.Caption = 'Continuar')) then
  begin
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('select * from projeto where NomeProjeto like "%' + cboPesquisa.Text + '%" and idUsuario = ' + IntToStr(Login.iCodUsuario) + ';');
    ADOQuery1.Open;
    ADOQuery1.Active:=true;

    lblTempo.Font.Color:= clGreen;
    TimeNOW := Now;
    Timer1.Enabled := True;
    btnIniciarHora.Caption := 'Pausar';
    btnCancelarHora.Enabled:= False;
    btnGravarHora.Enabled:= False;
  end
  else
  begin
    lblTempo.Font.Color:= clBlue;
    INICIO := StrToDateTime(lblTempo.Caption);
    Timer1.Enabled := False;
    btnIniciarHora.Caption := 'Continuar';
    btnCancelarHora.Enabled:= True;
    btnGravarHora.Enabled:= True;
  end;
end;

procedure TForm1.btnAlterarDescricaoClick(Sender: TObject);
begin
  MemoDescricao.Enabled:= True;
  btnGravarDescricao.Enabled:= true;
  btnCancelarDescricao.Enabled:= true;
  btnAlterarDescricao.Enabled:= false;
end;

procedure TForm1.btnCancelarDescricaoClick(Sender: TObject);
begin
  Pesquisa();
  MemoDescricao.Clear;
  MemoDescricao.Lines.Add(ADOQuery1.FieldByName('Descricao').Value);
  btnAlterarDescricao.Enabled:= true;
  btnGravarDescricao.Enabled:= false;
  btnCancelarDescricao.Enabled:= false;
  MemoDescricao.Enabled:= false;
end;

procedure TForm1.btnCancelarHoraClick(Sender: TObject);
begin
  Pesquisa();

  INICIO:= ADOQuery1.FieldByName('Tempo').Value;
  dValorTotal:= ADOQuery1.FieldByName('ValorTotal').Value;
  lblTempo.Caption:= TimeToStr(INICIO);
  edtValorTotal.Text:= FormatFloat('0.00', dValorTotal);
  lblTempo.Font.Color:= clBlack;
  btnIniciarHora.Caption := 'Iniciar';

  btnIniciarHora.Enabled:= true;
  btnGravarHora.Enabled:= false;
  btnCancelarHora.Enabled:= false;
end;

procedure TForm1.btnGravarDescricaoClick(Sender: TObject);
begin
  ADOQuery1.Open;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('UPDATE projeto SET Descricao = "' + MemoDescricao.Lines.Text +
                    '" WHERE idProjeto = ' + IntToStr(iCodProjeto) + ' and idUsuario = ' + IntToStr(Login.iCodUsuario) + ';');
  ADOQuery1.ExecSQL;
  ADOQuery1.Close;

  Pesquisa();

  btnAlterarDescricao.Enabled:= true;
  btnGravarDescricao.Enabled:= false;
  btnCancelarDescricao.Enabled:= false;
  MemoDescricao.Enabled:= false;
  ShowMessage('Gravado com Sucesso!');
end;

procedure TForm1.btnIncluirClick(Sender: TObject);
begin
Form2.Show;
Form2.ADOTable1.Insert;
Form2.btnIncluir.Enabled:= False;
Form2.btnVoltar.Enabled:= False;
Form2.btnGravar.Enabled:= True;
Form2.btnCancelar.Enabled:= True;
Form2.DBMemoDescricao.Enabled:= True;
Form2.DBEdit2.Text:= '00:00:00';
Form2.DBEdit3.Text:= '1';
Form2.DBEdit5.Text:= '0';
Form2.DBEdit6.Text:= '0';
Form2.DBEdit7.Text:= IntToStr(Login.iCodUsuario);
Form1.Hide;
end;

procedure TForm1.cboPesquisaChange(Sender: TObject);
begin
  cboPesquisa.ItemIndex:= cboPesquisa.Items.IndexOf(cboPesquisa.Text);
  if (cboPesquisa.ItemIndex > -1) then
  begin
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('select * from projeto where NomeProjeto like "%' + cboPesquisa.Text + '%" and idUsuario = ' + IntToStr(Login.iCodUsuario) + ';');
    ADOQuery1.Open;
    ADOQuery1.Active:=true;

    INICIO:= ADOQuery1.FieldbyName('Tempo').value;
    iCodProjeto:= ADOQuery1.FieldbyName('idProjeto').value;
    dValorTotal:= ADOQuery1.FieldbyName('ValorTotal').value;

    btnIniciarHora.Enabled:= True;
    btnAlterarDescricao.Enabled:= True;
    Label2.Font.Color:= clGreen;
    Label2.Caption:= 'Projeto encontrado!';
    lblTempo.Caption:= TimeToStr (INICIO);
    edtValorTotal.Text:= FormatFloat('0.00', dValorTotal);
    MemoDescricao.Clear;
    MemoDescricao.Lines.Add(ADOQuery1.FieldbyName('Descricao').value);
  end
  else
  begin
    btnIniciarHora.Enabled:= False;
    btnAlterarDescricao.Enabled:= False;
    Label2.Font.Color:= clRed;
    Label2.Caption:= 'Projeto não encontrado!';
    INICIO:= 0;
    iCodProjeto:= 0;
    dValorTotal:= 0;
    lblTempo.Caption:= TimeToStr (INICIO);
    edtValorTotal.Text:= FormatFloat('0.00', dValorTotal);
    MemoDescricao.Clear;
  end;
end;

procedure TForm1.cboStatusChange(Sender: TObject);
begin
case cboStatus.ItemIndex of
  0:
  begin
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('select * from projeto where idUsuario = ' + IntToStr(Login.iCodUsuario) + ' and idStatus = 1;');
    ADOQuery1.Open;
    ADOQuery1.Active:=true;

    cboPesquisa.Clear;
    ADOQuery1.Refresh;
    ADOQuery1.First;
    while (not ADOQuery1.Eof) do
    begin
      cboPesquisa.Items.Add(ADOQuery1.FieldByName('NomeProjeto').AsString);
      lListProjeto.Add(ADOQuery1.FieldByName('NomeProjeto').AsString);
      ADOQuery1.Next;
    end;
  end;

  1:
  begin
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('select * from projeto where idUsuario = ' + IntToStr(Login.iCodUsuario) + ' and idStatus = 2;');
    ADOQuery1.Open;
    ADOQuery1.Active:=true;

    cboPesquisa.Clear;
    ADOQuery1.Refresh;
    ADOQuery1.First;
    while (not ADOQuery1.Eof) do
    begin
      cboPesquisa.Items.Add(ADOQuery1.FieldByName('NomeProjeto').AsString);
      lListProjeto.Add(ADOQuery1.FieldByName('NomeProjeto').AsString);
      ADOQuery1.Next;
    end;
  end;

  2:
  begin
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('select * from projeto where idUsuario = ' + IntToStr(Login.iCodUsuario) + ' and idStatus = 3;');
    ADOQuery1.Open;
    ADOQuery1.Active:=true;

    cboPesquisa.Clear;
    ADOQuery1.Refresh;
    ADOQuery1.First;
    while (not ADOQuery1.Eof) do
    begin
      cboPesquisa.Items.Add(ADOQuery1.FieldByName('NomeProjeto').AsString);
      lListProjeto.Add(ADOQuery1.FieldByName('NomeProjeto').AsString);
      ADOQuery1.Next;
    end;
  end;

  3:
  begin
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('select * from projeto where idUsuario = ' + IntToStr(Login.iCodUsuario) + ';');
    ADOQuery1.Open;
    ADOQuery1.Active:=true;

    cboPesquisa.Clear;
    ADOQuery1.Refresh;
    ADOQuery1.First;
    while (not ADOQuery1.Eof) do
    begin
      cboPesquisa.Items.Add(ADOQuery1.FieldByName('NomeProjeto').AsString);
      lListProjeto.Add(ADOQuery1.FieldByName('NomeProjeto').AsString);
      ADOQuery1.Next;
    end;
  end;
end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
lblTempo.Caption := FormatDateTime('HH:MM:SS', INICIO + NOW - TimeNOW);
dValorTotal:=  StrToTime(lblTempo.Caption) * ADOQuery1.FieldbyName('ValorHora').value * 24;

edtValorTotal.Text:= FormatFloat('0.00', dValorTotal);
end;

end.
