unit ufrmCadCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmCadModelo, Vcl.ComCtrls,
  Vcl.ToolWin, Vcl.ExtCtrls, Vcl.StdCtrls, uClientes, uEndereco, uEmail;

type
  TfrmCadCliente = class(TfrmModelo)
    grpIdentificacao: TGroupBox;
    lblNome: TLabel;
    lblIdentidade: TLabel;
    lblCPF: TLabel;
    lblTelefone: TLabel;
    lblEmail: TLabel;
    edtNome: TEdit;
    edtIdentidade: TEdit;
    edtCPF: TEdit;
    edtTelefone: TEdit;
    edtEmail: TEdit;
    grpEndereco: TGroupBox;
    lblCEP: TLabel;
    lblLogradouro: TLabel;
    lblNumero: TLabel;
    lblComplemento: TLabel;
    lblBairro: TLabel;
    lblCidade: TLabel;
    lblEstado: TLabel;
    lblPais: TLabel;
    edtCEP: TEdit;
    edtLogradouro: TEdit;
    edtNumero: TEdit;
    edtComplemento: TEdit;
    edtBairro: TEdit;
    edtEstado: TEdit;
    edtCidade: TEdit;
    edtPais: TEdit;
    btnEmail: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure edtCEPExit(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnEmailClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    FCliente  : TCliente;
  public
    property Cliente: TCliente read FCliente;
  end;

var
  frmCadCliente: TfrmCadCliente;

implementation

{$R *.dfm}

procedure TfrmCadCliente.btnCancelarClick(Sender: TObject);
begin
  inherited;
  if FCliente.Valid = '' then //Cadastrou e abandounou sem nenhum cliente em mem�ria
    UI.SetForm(Self);
end;

procedure TfrmCadCliente.btnEmailClick(Sender: TObject);
begin
  if FCliente.Valid = '' then
  begin
    if FCliente.SaveXMLFile then
    begin
      Application.ProcessMessages;
      stsMain.Panels[0].Text := 'A G U A R D E !';
      stsMain.Repaint;
      pnlBotoesAcao.Enabled := False;
      try
        if FCliente.SendEmail then
          MSG.MsgBox('E-mail enviado com sucesso! ' + #13 + #13 + '=> Verifique a caixa de spam ou lixo eletr�nico se for o primeiro envio.');
      finally
        pnlBotoesAcao.Enabled := True;
        stsMain.Panels[0].Text := '';
      end;
    end;
  end
  else
  MSG.MsgBoxAlert('Nenhum cliente encontrado ou o cliente cadastrado n�o atende os requisitos para esta a��o!');
end;

procedure TfrmCadCliente.btnGravarClick(Sender: TObject);
Var LRetorno : string;
begin
  FCliente.Nome        := edtNome.Text;
  FCliente.Identidade  := edtIdentidade.Text;
  FCliente.CPF         := edtCPF.Text;
  FCliente.Telefone    := edtTelefone.Text;
  FCliente.Email       := edtEmail.Text;
  FCliente.CEP         := edtCEP.Text;
  FCliente.Logradouro  := edtLogradouro.Text;
  FCliente.Numero      := edtNumero.Text;
  FCliente.Complemento := edtComplemento.Text;
  FCliente.Bairro      := edtBairro.Text;
  FCliente.Cidade      := edtCidade.Text;
  FCliente.Estado      := edtEstado.Text;
  FCliente.Pais        := edtPais.Text;

  LRetorno := FCliente.Valid;
  if LRetorno = '' then
    inherited
  else
    MSG.MsgBoxAlert(LRetorno);
end;

procedure TfrmCadCliente.btnNovoClick(Sender: TObject);
begin
  inherited;
  FCliente.ClearClass;
  edtNome.SetFocus;
end;

procedure TfrmCadCliente.edtCEPExit(Sender: TObject);
Var LEndereco : TEndereco;
begin
  if FCliente.CEP <> edtCEP.Text then
  begin
    LEndereco := TEndereco.Create;
    LEndereco.CEP := edtCEP.Text;
    Application.ProcessMessages;
    stsMain.Panels[0].Text := 'PESQUISANDO CEP';
    stsMain.Repaint;
    try
      if LEndereco.GetCEP then
      begin
        edtLogradouro.Text := LEndereco.Logradouro;
        edtBairro.Text := LEndereco.Bairro;
        edtCidade.Text := LEndereco.Cidade;
        edtEstado.Text := LEndereco.Estado;
        edtPais.Text   := LEndereco.Pais;
        edtNumero.SetFocus;
        FCliente.CEP := edtCEP.Text;
      end;
    finally
      stsMain.Panels[0].Text := '';
    end;
  end;
end;

procedure TfrmCadCliente.FormCreate(Sender: TObject);
begin
  inherited;
  FCliente := TCliente.Create;
end;

procedure TfrmCadCliente.FormDestroy(Sender: TObject);
begin
  inherited;
  if FCliente <> nil then
    FreeAndNil(FCliente);
end;

procedure TfrmCadCliente.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if pnlBotoesAcao.Visible then
    if Key = VK_F3 then
      btnEmail.Click;
end;

procedure TfrmCadCliente.FormShow(Sender: TObject);
begin
  inherited;
  UI.Keyboard.SetMask(edtCPF, '###.###.###-##');
  UI.Keyboard.SetMask(edtCEP, '#####-###');
  UI.Keyboard.SetMaskPhone(edtTelefone);
end;

end.
