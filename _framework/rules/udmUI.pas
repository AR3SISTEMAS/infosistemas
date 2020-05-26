unit udmUI;

interface

uses
  System.SysUtils, System.Classes, Forms, Vcl.StdCtrls, Dialogs, Vcl.Graphics, Windows,
  System.ImageList, Vcl.ImgList, Vcl.Controls;

type
  ///<summary>TKeyboard - CLASSE PARA TRATAMENTO DE ENTRADAS</summary>
  TKeyBoard = class
  private
    procedure KeyPressOnlyNumbers (Sender: TObject; var Key: Char);
    procedure OnKeyPressMask(Sender: TObject; var Key: Char);
    procedure OnKeyUpMask(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure OnKeyPressPhone(Sender: TObject; var Key: Char);
  public
    procedure SetMask(AComponent: TComponent; AMask : String);
    procedure SetMaskPhone(AComponent: TComponent);
  end;

  TdmUI = class(TDataModule)
    imgGerais: TImageList;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FKeyboard : TKeyboard;
  public
    property Keyboard : TKeyboard read FKeyboard write FKeyboard;
    procedure SetForm(const AForm : TForm);
  end;

var
  dmUI: TdmUI;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmUI }

procedure TdmUI.DataModuleCreate(Sender: TObject);
begin
  FKeyboard := TKeyBoard.Create;
end;

procedure TdmUI.DataModuleDestroy(Sender: TObject);
begin
  if FKeyboard <> nil then
    FreeAndNil(FKeyboard);
end;

procedure TdmUI.SetForm(const AForm: TForm);
Var I   : Integer;
begin
  for I := 0 to AForm.ComponentCount - 1 do
  begin
    if AForm.Components[I] is TEdit then
    begin
      TEdit(AForm.Components[I]).Clear;
      if TEdit(AForm.Components[I]).CharCase = ecNormal then
        TEdit(AForm.Components[I]).CharCase := ecUpperCase;
    end;
  end;
end;

{ TKeyBoard }
procedure TKeyBoard.KeyPressOnlyNumbers(Sender: TObject; var Key: Char);
begin
  if not (Key in ['A'..'Z', 'a'..'z', #13, #8, #9])then
    Key := #0;
end;

procedure TKeyBoard.OnKeyPressMask(Sender: TObject; var Key: Char);
Var lMask : String;
begin
  if Sender is TEdit then
  begin
    lMask := TEdit(Sender).HelpKeyword;
    TEdit(Sender).MaxLength := Length(lMask);
    if Length(lMask) > 0 then
    begin
      if (Copy(lMask, TEdit(Sender).SelStart + 1, 1) = '#') and not (Key in ['0'..'9', #8, #9, #13]) then
        Key := #0;
      if (Copy(lMask, TEdit(Sender).SelStart + 1, 1) = '@') and not (Key in ['A'..'Z', 'a'..'z', #8, #9, #13]) then
        Key := #0;
      if (Copy(lMask, TEdit(Sender).SelStart + 1, 1) <> Char(Key)) and (Copy(lMask, TEdit(Sender).SelStart + 1, 1) <> '#') and (Copy(lMask, TEdit(Sender).SelStart + 1, 1) <> '@') and not (Key in [#8, #9, #13]) then
        Key := #0;
    end;
  end;
end;

procedure TKeyBoard.OnKeyPressPhone(Sender: TObject; var Key: Char);
  const AActionKey = [#13, #8, #9];

  function FindChar(const AChar : Char) : Boolean;
  begin
    Result := (Pos(AChar, TEdit(Sender).Text) > 0) and (Key = AChar);
    if Result then
      Key := #0;
  end;
begin
  if (FindChar('(')) or FindChar(')') or FindChar('-') then Exit;
  if not ((Key in ['0'..'9']) or (key in AActionKey)) then
    Key := #0;

  TEdit(Sender).MaxLength := 14;
  if Copy(TEdit(Sender).Text, 6, 1) = '9' then
    TEdit(Sender).MaxLength := 15;

  if not (Key in AActionKey) and (Length(TEdit(Sender).Text) = 4) then
  begin
     TEdit(Sender).Text := TEdit(Sender).Text + ')' + Key;
     Key := #0;
     TEdit(Sender).SelStart := Length(TEdit(Sender).Text) + 1;
     Exit;
  end;
  if not (Key in AActionKey) and (Length(TEdit(Sender).Text) = 9) and (Copy(TEdit(Sender).Text, 6, 1) <> '9') then
  begin
     TEdit(Sender).Text := TEdit(Sender).Text + '-' + Key;
     Key := #0;
     TEdit(Sender).SelStart := Length(TEdit(Sender).Text) + 1;
     Exit;
  end;
  if not (Key in AActionKey) and (Length(TEdit(Sender).Text) = 10) and (Copy(TEdit(Sender).Text, 6, 1) = '9') then //H�fen para celular
  begin
     TEdit(Sender).Text := TEdit(Sender).Text + '-' + Key;
     Key := #0;
     TEdit(Sender).SelStart := Length(TEdit(Sender).Text) + 1;
     Exit;
  end;
  if (Copy(TEdit(Sender).Text, 0, 1) <> '(') and (Length(TEdit(Sender).Text) = 0) and not (Key in AActionKey) then
  begin
     if Key = '0' then
       TEdit(Sender).Text := '(0'
     else
       TEdit(Sender).Text := '(0' + Key;
     Key := #0;
     TEdit(Sender).SelStart := Length(TEdit(Sender).Text) + 1;
  end;
end;

procedure TKeyBoard.OnKeyUpMask(Sender: TObject; var Key: Word; Shift: TShiftState);
Var lMask : String;
begin
  if Sender is TEdit then
  begin
    lMask := TEdit(Sender).HelpKeyword;
    if (not (Key in [VK_BACK, VK_LEFT, VK_RIGHT, VK_HOME, VK_END])) and (Length(lMask) > 0 ) then
    begin
      if (Copy(lMask, Length(TEdit(Sender).Text)+ 1, 1) <> '#') and (Copy(lMask, TEdit(Sender).SelStart + 1, 1) <> '#') and (Copy(lMask, TEdit(Sender).SelStart + 1, 1) <> '@') then
      begin
        TEdit(Sender).Text     := TEdit(Sender).Text + Copy(lMask, Length(TEdit(Sender).Text) + 1, 1);
        TEdit(Sender).SelStart := Length(TEdit(Sender).Text);
      end;
    end;
  end;
end;

procedure TKeyBoard.SetMask(AComponent: TComponent; AMask: String);
begin
  if AComponent is TEdit then
  begin
    TEdit(AComponent).HelpKeyword := AMask;
    TEdit(AComponent).OnKeyPress  := OnKeyPressMask;
    TEdit(AComponent).OnKeyUp     := OnKeyUpMask;
  end;
end;

procedure TKeyBoard.SetMaskPhone(AComponent: TComponent);
begin
  if AComponent is TEdit then
  begin
    TEdit(AComponent).OnKeyPress := OnKeyPressPhone;
  end;
end;


end.