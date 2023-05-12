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
  C4D.LogFile,
  ShellAPI;

type
  TC4DLogFileDemo01ViewMain = class(TForm)
    btnAdd: TButton;
    edtTexto: TEdit;
    Label3: TLabel;
    edtPastaLog: TEdit;
    btnPastaImg: TPngBitBtn;
    btnAbrirPasta: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnPastaImgClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAbrirPastaClick(Sender: TObject);
  private
    procedure AddTextoTesteNoEdt;
    function SelecionaDiretorio(ADefaultFolder: String): String;
  public

  end;

var
  C4DLogFileDemo01ViewMain: TC4DLogFileDemo01ViewMain;

implementation

{$R *.dfm}

function TC4DLogFileDemo01ViewMain.SelecionaDiretorio(ADefaultFolder: String): String;
var
 LFileOpenDialog: TFileOpenDialog;
begin
   LFileOpenDialog := TFileOpenDialog.Create(nil);
   try
     LFileOpenDialog.Title   := 'Code4Delphi - Selecione uma pasta';;
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

procedure TC4DLogFileDemo01ViewMain.FormCreate(Sender: TObject);
begin
   ReportMemoryLeaksOnShutdown := True;
end;

procedure TC4DLogFileDemo01ViewMain.FormShow(Sender: TObject);
begin
   Self.AddTextoTesteNoEdt;
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

procedure TC4DLogFileDemo01ViewMain.btnAddClick(Sender: TObject);
begin
   if(DirectoryExists(edtPastaLog.Text))then
   begin
      //A PASTA PODE SER SETADA APENAS UMA VEZ (NO CREATE DO PROJETO POR EXEMPLO)
      C4DLogFile.SetDir(edtPastaLog.Text);
   end;

   C4DLogFile.AddLog('Linha 01: ' + edtTexto.Text);
   C4DLogFile.AddLog('Linha 02: ' + edtTexto.Text);
   Self.AddTextoTesteNoEdt;
end;

end.
