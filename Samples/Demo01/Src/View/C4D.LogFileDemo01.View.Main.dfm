object C4DLogFileDemo01ViewMain: TC4DLogFileDemo01ViewMain
  Left = 0
  Top = 0
  Caption = 'Code4Delphi - LogFile - Demo'
  ClientHeight = 155
  ClientWidth = 610
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
  object Label3: TLabel
    Left = 24
    Top = 17
    Width = 44
    Height = 13
    Caption = 'Pasta log'
  end
  object btnAdd: TButton
    Left = 24
    Top = 114
    Width = 113
    Height = 25
    Cursor = crHandPoint
    Caption = 'Add log'
    TabOrder = 0
    OnClick = btnAddClick
  end
  object edtTexto: TEdit
    Left = 24
    Top = 91
    Width = 534
    Height = 21
    TabOrder = 1
    Text = 'edtTexto'
  end
  object edtPastaLog: TEdit
    Left = 24
    Top = 32
    Width = 534
    Height = 21
    TabOrder = 2
    Text = 'C:\Temp\Logs'
  end
  object btnPastaImg: TPngBitBtn
    Left = 560
    Top = 31
    Width = 24
    Height = 23
    Cursor = crHandPoint
    Caption = '...'
    TabOrder = 3
    OnClick = btnPastaImgClick
  end
  object btnAbrirPasta: TButton
    Left = 24
    Top = 57
    Width = 113
    Height = 25
    Cursor = crHandPoint
    Caption = 'Abrir pasta'
    TabOrder = 4
    OnClick = btnAbrirPastaClick
  end
end
