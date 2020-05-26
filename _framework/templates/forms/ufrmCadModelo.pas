unit ufrmCadModelo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ToolWin, udmUI, uUtils;

type
  TfrmModelo = class(TForm)
    stsMain: TStatusBar;
    pgcDados: TPageControl;
    tbsDadosGerais: TTabSheet;
    pnlBotoesAcao: TPanel;
    pnlGravarCancelar: TPanel;
    btnCancelar: TButton;
    btnGravar: TButton;
    pnlAcoes: TPanel;
    btnNovo: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    FUI  : TdmUI;
    FMSG : TMSG;
    procedure HidePanelAction;
    procedure SetMSG(const Value: TMSG);
    procedure SetUI(const Value: TdmUI);
  public
    property UI  : TdmUI read FUI write SetUI;
    property MSG : TMSG read FMSG write SetMSG;
  end;

var
  frmModelo: TfrmModelo;

implementation

{$R *.dfm}


procedure TfrmModelo.btnCancelarClick(Sender: TObject);
begin
  if FMSG.MsgBoxConfirmDefNo('Cancelar a inclusão do registro?') then
    HidePanelAction;
end;

procedure TfrmModelo.btnGravarClick(Sender: TObject);
begin
  FMSG.MsgBox('Dados gravados com sucesso!');
  HidePanelAction;
end;

procedure TfrmModelo.btnNovoClick(Sender: TObject);
begin
  pnlGravarCancelar.Visible := True;
  pnlAcoes.Visible := False;
  FUI.SetForm(Self);
  pgcDados.ActivePageIndex := 0;
  pgcDados.Enabled         := True;
end;

procedure TfrmModelo.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if pnlGravarCancelar.Visible then
  begin
    FMSG.MsgBoxAlert('Atenção o fomulário encontra-se em edição! Por gentileza cancele ou grave antes de fechar');
    CanClose := False;
  end;
end;

procedure TfrmModelo.FormCreate(Sender: TObject);
begin
  FUI  := TdmUI.Create(Self);
  FMSG := TMSG.Create;
  HidePanelAction;
end;

procedure TfrmModelo.FormDestroy(Sender: TObject);
begin
  if FUI <> nil then
    FreeAndNil(FUI);
  if FMSG <> nil then
    FreeAndNil(FMSG);
end;

procedure TfrmModelo.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_F2) and (pnlAcoes.Visible) then
    btnNovo.Click;

  if pnlGravarCancelar.Visible then
  begin
    if Key = VK_F5 then
      btnGravar.Click;
    if Key = VK_F6 then
      btnCancelar.Click;
  end;
end;

procedure TfrmModelo.FormShow(Sender: TObject);
begin
  FUI.SetForm(Self);
  btnNovo.Click;
end;

procedure TfrmModelo.HidePanelAction;
begin
  pnlGravarCancelar.Visible  := False;
  pnlAcoes.Visible := True;
  pgcDados.Enabled := False;
end;

procedure TfrmModelo.SetMSG(const Value: TMSG);
begin
  FMSG := Value;
end;

procedure TfrmModelo.SetUI(const Value: TdmUI);
begin
  FUI := Value;
end;

end.
