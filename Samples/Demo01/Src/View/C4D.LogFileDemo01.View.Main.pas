unit C4D.LogFileDemo01.View.Main;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.Buttons,
  PngBitBtn,
  ShellAPI, Vcl.ExtCtrls;

type
  TC4DLogFileDemo01ViewMain = class(TForm)
    Panel9: TPanel;
    Label3: TLabel;
    btnAddLog: TButton;
    edtTexto: TEdit;
    edtPastaLog: TEdit;
    btnPastaImg: TPngBitBtn;
    btnAbrirPasta: TButton;
    btnTeste: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnAddLogClick(Sender: TObject);
    procedure btnPastaImgClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAbrirPastaClick(Sender: TObject);
    procedure btnTesteClick(Sender: TObject);
  private
    procedure AddTextoTesteNoEdt;
    function SelecionaDiretorio(const ADefaultFolder: string): string;
  public

  end;

var
  C4DLogFileDemo01ViewMain: TC4DLogFileDemo01ViewMain;

implementation

uses
  C4D.LogFile;

{$R *.dfm}

procedure TC4DLogFileDemo01ViewMain.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
  edtPastaLog.Text := ExtractFilePath(ParamStr(0)) + '\Logs\';
end;

procedure TC4DLogFileDemo01ViewMain.FormShow(Sender: TObject);
begin
  Self.AddTextoTesteNoEdt;
end;

function TC4DLogFileDemo01ViewMain.SelecionaDiretorio(const ADefaultFolder: string): string;
var
  LFileOpenDialog: TFileOpenDialog;
begin
  LFileOpenDialog := TFileOpenDialog.Create(nil);
  try
    LFileOpenDialog.Title := 'Code4Delphi - Selecione uma pasta';;
    LFileOpenDialog.Options := [fdoPickFolders];

    if(not ADefaultFolder.Trim.IsEmpty)and(System.SysUtils.DirectoryExists(ADefaultFolder))then
      LFileOpenDialog.DefaultFolder := ADefaultFolder;

    if(not LFileOpenDialog.Execute)then
      Exit(ADefaultFolder);

    Result := IncludeTrailingPathDelimiter(LFileOpenDialog.FileName).Trim;
  finally
    LFileOpenDialog.Free;
  end;
end;

procedure TC4DLogFileDemo01ViewMain.btnPastaImgClick(Sender: TObject);
begin
  edtPastaLog.Text := Self.SelecionaDiretorio(edtPastaLog.Text);
end;

procedure TC4DLogFileDemo01ViewMain.AddTextoTesteNoEdt;
begin
  edtTexto.Text := 'Texto teste com acentos ÈÍ„Á‡Ì: ' + DateTimeToStr(Now);
end;

procedure TC4DLogFileDemo01ViewMain.btnAbrirPastaClick(Sender: TObject);
begin
  if(not DirectoryExists(edtPastaLog.Text))then
    raise Exception.Create('Pasta informada n„o pode ser encontrada');

  ShellExecute(Application.Handle, nil, PWideChar(edtPastaLog.Text), '', nil, SW_ShowNormal);
end;

procedure TC4DLogFileDemo01ViewMain.btnAddLogClick(Sender: TObject);
begin
  //A PASTA PODE SER SETADA APENAS UMA VEZ (NO CREATE DO PROJETO POR EXEMPLO)
  TC4DLogFile.GetInstance.SetDir(edtPastaLog.Text);

  TC4DLogFile.GetInstance
    .AddLog('Linha 01: ' + edtTexto.Text)
    .AddLog('Linha 02: ' + edtTexto.Text);
  Self.AddTextoTesteNoEdt;
end;

procedure TC4DLogFileDemo01ViewMain.btnTesteClick(Sender: TObject);
//var
//  LC4DLogFile: TC4DLogFile;
begin
  //LC4DLogFile := TC4DLogFile(TC4DLogFile.NewInstance);
  //LC4DLogFile.SetDir(edtPastaLog.Text).AddLog('Linha XXX Nova Instancia: ' + edtTexto.Text)
end;

end.
