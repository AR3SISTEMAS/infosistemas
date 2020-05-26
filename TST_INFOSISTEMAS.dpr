program TST_INFOSISTEMAS;

uses
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  ufrmCadModelo in '_framework\templates\forms\ufrmCadModelo.pas' {frmModelo},
  ufrmCadCliente in 'forms\ufrmCadCliente.pas' {frmCadCliente},
  udmUI in '_framework\rules\udmUI.pas' {dmUI: TDataModule},
  uClientes in 'rules\uClientes.pas',
  uEndereco in '_framework\rules\uEndereco.pas',
  uUtils in '_framework\rules\uUtils.pas',
  uEmail in '_framework\rules\uEmail.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10');
  Application.Title := 'Info Sistemas - Teste';
  Application.CreateForm(TfrmCadCliente, frmCadCliente);
  Application.Run;
end.
