unit Cheque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, Grids, DBGrids, ImgList, ActnList, Menus, ToolWin, ComCtrls,
  DateUtils;

type
  TFmCheques = class(TForm)
    DbgCheques: TDBGrid;
    MainMenu: TMainMenu;
    PopupMenu: TPopupMenu;
    ActionList: TActionList;
    ImageList: TImageList;
    ToolBar1: TToolBar;
    AcCreate: TAction;
    AcEdit: TAction;
    AcDelete: TAction;
    Adicionar1: TMenuItem;
    Remover1: TMenuItem;
    Editar1: TMenuItem;
    Opes1: TMenuItem;
    Adicionar2: TMenuItem;
    Editar2: TMenuItem;
    Remover2: TMenuItem;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    AcQuitar: TAction;
    AcEstornar: TAction;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    N1: TMenuItem;
    Quitar1: TMenuItem;
    AcEstornar1: TMenuItem;
    N2: TMenuItem;
    AcEstornar2: TMenuItem;
    AcEstornar3: TMenuItem;
    ToolButton7: TToolButton;
    AcQuitarUpdate: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AcCreateExecute(Sender: TObject);
    procedure AcEditExecute(Sender: TObject);
    procedure AcDeleteExecute(Sender: TObject);
    procedure AcQuitarExecute(Sender: TObject);
    procedure AcEstornarExecute(Sender: TObject);
    procedure AcQuitarUpdateExecute(Sender: TObject);
    procedure WriteExtornoOperationLog;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmCheques: TFmCheques;

implementation

uses Modulo, CreateCheque, BaixaCheque, BaixaChequeUpdate;

var
  FmCreateCheque: TFmCreateCheque;
  FmBaixaCheque: TFmBaixaCheque;
  FmBaixaChequeUpdate: TFmBaixaChequeUpdate;

{$R *.dfm}

procedure TFmCheques.AcCreateExecute(Sender: TObject);
begin
  FmCreateCheque := TFmCreateCheque.Create(Self);

  with FmCreateCheque, DmWinBank do
  begin
    IbtCheques.Insert;
    IbtChequesCNPJ.Value := IbtClientesCNPJ.Value;
    Caption := 'Adi��o de cheque para: ' + IbtClientesNOME.Value +
      ' - CPF/CNPJ: ' + IbtClientesCNPJ.Value;
    ShowModal;
  end;
end;

procedure TFmCheques.AcDeleteExecute(Sender: TObject);
begin
  with DmWinBank do
  begin
    if IbtChequesDATAPGTO.Value <> 0 then
      ShowMessage('N�o � poss�vel apagar cheques pagos, exstorne-o e tente novamente')
    else
      if(mrYes = MessageDlg('Tem certeza que deseja excluir o cheque?', mtConfirmation, [mbYes,mbNo], 0)) then
      try
        IbtCheques.Delete;
      except
        on e: Exception do
        begin
          if (pos('FOREIGN', e.Message) <> 0) then
            ShowMessage('J� h� cheques relacionados � este Banco')
          else
            ShowMessage('Erro no banco de dados:' + #13 + e.Message);
        end;
      end;
  end;
end;

procedure TFmCheques.AcEditExecute(Sender: TObject);
begin
  FmCreateCheque := TFmCreateCheque.Create(Self);

  with FmCreateCheque, DmWinBank do
  begin
    IbtCheques.Edit;
    Caption := 'Editar cheque';
    ShowModal;
  end;
end;

procedure TFmCheques.AcEstornarExecute(Sender: TObject);
begin
  with DmWinBank do
    if NOT IbtChequesDATAPGTO.IsNull then
      begin
        if mrYes = MessageDlg('Tem certeza que deseja extornar o cheque?', mtConfirmation, [mbYes,mbNo], 0) then
          begin
            IbtCheques.Edit;
            IbtChequesDATAPGTO.AsString := '';
            IbtChequesJUROSPAGOS.AsString := '';
            try
              IbtCheques.Post;
              WriteExtornoOperationLog;
            except
              on E: Exception do
              begin
                ShowMessage('Erro no banco de dados: ' + #13 + e.Message);
              end;
            end;
          end
      end
    else
      ShowMessage('Este cheque n�o est� pago para poder ser extornado, tente novamente');
end;

procedure TFmCheques.AcQuitarExecute(Sender: TObject);
begin
  with DmWinBank do
    if IbtChequesDATAPGTO.IsNull then
      begin
        FmBaixaCheque := TFmBaixaCheque.Create(Self);

        with FmBaixaCheque do
        begin
          IbtCheques.Edit;
          ShowModal;
        end;
      end
    else
      ShowMessage('Este cheque j� foi pago. Extorne-o e tente novamente');
end;

procedure TFmCheques.AcQuitarUpdateExecute(Sender: TObject);
begin
  with DmWinBank do
    if IbtChequesDATAPGTO.IsNull then
      begin
        FmBaixaChequeUpdate := TFmBaixaChequeUpdate.Create(Self);

        FmBaixaChequeUpdate.ShowModal;
      end
    else
      ShowMessage('Este cheque j� foi pago. Extorne-o e tente novamente');
end;

procedure TFmCheques.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFmCheques.WriteExtornoOperationLog;
var
  Log : TextFile;
  Agora: TDateTime;
  FileName, Line: String;
begin
  // Gravar no arquivo
  FileName := 'LogEstorno.txt';

  AssignFile(Log, FileName);

  if(NOT FileExists(FileName)) then
    FileCreate(FileName);

  Reset(Log);
  Append(log);

  Agora := Now();
  with DmWinBank do
    Line := Format('[%s] %s,%d,%d,%d,%d',
      [FormatDateTime('yyyy-mm-dd hh:nn:ss', Agora),
      IbtChequesCNPJ.Value,
      IbtChequesBANCO.Value,
      IbtChequesAGENCIA.Value,
      IbtChequesCONTA.Value,
      IbtChequesNUMERO.Value]
    );
  Writeln(Log, Line);

  CloseFile(log);
end;

end.
