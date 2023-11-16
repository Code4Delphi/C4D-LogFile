object C4DLogFileDemo01ViewMain: TC4DLogFileDemo01ViewMain
  Left = 0
  Top = 0
  Caption = 'Code4Delphi - LogFile - Demo'
  ClientHeight = 192
  ClientWidth = 615
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel9: TPanel
    Left = 0
    Top = 0
    Width = 615
    Height = 192
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    object Label3: TLabel
      Left = 24
      Top = 17
      Width = 44
      Height = 13
      Caption = 'Pasta log'
    end
    object btnAddLog: TButton
      Left = 24
      Top = 142
      Width = 115
      Height = 25
      Cursor = crHandPoint
      Caption = 'Add log'
      TabOrder = 4
      OnClick = btnAddLogClick
    end
    object edtTexto: TEdit
      Left = 24
      Top = 115
      Width = 560
      Height = 21
      TabOrder = 3
      Text = 'edtTexto'
    end
    object edtPastaLog: TEdit
      Left = 24
      Top = 32
      Width = 534
      Height = 21
      TabOrder = 0
      Text = 'C:\Temp\Logs'
    end
    object btnPastaImg: TPngBitBtn
      Left = 560
      Top = 31
      Width = 24
      Height = 23
      Cursor = crHandPoint
      Caption = '...'
      TabOrder = 1
      OnClick = btnPastaImgClick
    end
    object btnAbrirPasta: TButton
      Left = 24
      Top = 57
      Width = 115
      Height = 25
      Cursor = crHandPoint
      Caption = 'Abrir pasta'
      TabOrder = 2
      OnClick = btnAbrirPastaClick
    end
    object btnTeste: TButton
      Left = 138
      Top = 142
      Width = 115
      Height = 25
      Caption = 'Teste'
      TabOrder = 5
      OnClick = btnTesteClick
    end
  end
end
