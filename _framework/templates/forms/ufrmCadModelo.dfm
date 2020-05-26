object frmModelo: TfrmModelo
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'CADASTRO MODELO'
  ClientHeight = 641
  ClientWidth = 984
  Color = clBtnFace
  Constraints.MinHeight = 680
  Constraints.MinWidth = 1000
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object stsMain: TStatusBar
    AlignWithMargins = True
    Left = 3
    Top = 619
    Width = 978
    Height = 19
    Panels = <
      item
        Width = 300
      end>
  end
  object pgcDados: TPageControl
    AlignWithMargins = True
    Left = 8
    Top = 8
    Width = 968
    Height = 536
    Margins.Left = 8
    Margins.Top = 8
    Margins.Right = 8
    Margins.Bottom = 8
    ActivePage = tbsDadosGerais
    Align = alClient
    TabOrder = 1
    object tbsDadosGerais: TTabSheet
      Caption = 'Dados Gerais'
    end
  end
  object pnlBotoesAcao: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 555
    Width = 978
    Height = 58
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object pnlGravarCancelar: TPanel
      Left = 713
      Top = 0
      Width = 265
      Height = 58
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitLeft = 712
      ExplicitTop = 1
      ExplicitHeight = 56
      object btnCancelar: TButton
        Tag = 1
        AlignWithMargins = True
        Left = 134
        Top = 6
        Width = 125
        Height = 46
        Margins.Top = 6
        Margins.Bottom = 6
        Align = alLeft
        Caption = '[F6] - Cancelar'
        ImageIndex = 2
        ImageMargins.Left = 5
        TabOrder = 0
        OnClick = btnCancelarClick
        ExplicitHeight = 44
      end
      object btnGravar: TButton
        AlignWithMargins = True
        Left = 3
        Top = 6
        Width = 125
        Height = 46
        Margins.Top = 6
        Margins.Bottom = 6
        Align = alLeft
        Caption = '[F5] - Gravar'
        ImageIndex = 1
        ImageMargins.Left = 5
        TabOrder = 1
        OnClick = btnGravarClick
        ExplicitHeight = 44
      end
    end
    object pnlAcoes: TPanel
      Left = 0
      Top = 0
      Width = 713
      Height = 58
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 711
      ExplicitHeight = 56
      object btnNovo: TButton
        AlignWithMargins = True
        Left = 3
        Top = 6
        Width = 125
        Height = 46
        Margins.Top = 6
        Margins.Bottom = 6
        Align = alLeft
        Caption = '[F2] - Novo'
        ImageIndex = 0
        ImageMargins.Left = 5
        TabOrder = 0
        OnClick = btnNovoClick
        ExplicitHeight = 44
      end
    end
  end
end
