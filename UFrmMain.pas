unit UFrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.WinXCtrls, Vcl.Grids,
  Vcl.DBGrids, Data.Win.ADODB, Vcl.StdCtrls, Vcl.NumberBox, Vcl.Themes,
  Vcl.ControlList, Vcl.ExtCtrls, Vcl.DBCtrls, acDBGrid, Vcl.Mask, Vcl.ComCtrls;

type TSortType = (stASC, stDESC);

type
  TFrmMain = class(TForm)
    ADOConnect: TADOConnection;
    DBGrid: TDBGrid;
    ADOQuery: TADOQuery;
    OpenDialog: TOpenDialog;
    PanelEdit: TPanel;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBCmBoxShop: TDBComboBox;
    DBNavigator: TDBNavigator;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    StatusBar: TStatusBar;
    DSQ: TDataSource;
    PanelSearch: TPanel;
    lblEdSearch: TLabeledEdit;
    BtnSearch: TButton;
    ChBoxEditEnable: TCheckBox;
    BtnSearchClose: TButton;
    CmBoxVclStyle: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure CmBoxVclStyleSelect(Sender: TObject);
    procedure ChBoxEditEnableClick(Sender: TObject);
    procedure BtnSearchClick(Sender: TObject);
    procedure BtnSearchCloseClick(Sender: TObject);
    procedure DBEdit1Click(Sender: TObject);
    procedure DBGridTitleClick(Column: TColumn);
  private
    FFieldLastSorted: string;
    FSortingDirection: TSortType;
    procedure UpdateStatusBar;
    Procedure AddShops;
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;
  CurrDir: String;
  FileNameBase: String;
  ConnectString: string;

implementation

{$R *.dfm}

procedure TFrmMain.AddShops;
begin
  DSQ.Enabled := false;
  ADOQuery.SQL.Text := 'SELECT DISTINCT Shop_Name FROM shopping_data';
  ADOQuery.Open;
  ADOQuery.First;
  DBCmBoxShop.Items.Clear;
  while Not ADOQuery.Eof do
  begin
    DBCmBoxShop.Items.Add(ADOQuery.Fields[0].AsString);
    ADOQuery.Next;
  end;
  //DSQ.Enabled := true;
  //ShowMessage(IntToStr(ADOQuery.RecordCount) + ' ' + #13 + DBCmBoxShop.Items.Text);
end;

procedure TFrmMain.BtnSearchClick(Sender: TObject);
var
  find: string;
begin
  with ADOQuery do
  begin
    Close;
    SQL.Text := 'SELECT * FROM shopping_data ' +
      'WHERE (Date_to_buy LIKE :p1) ' +
      'OR (Product_Name LIKE :p2) ' +
      'OR (Count LIKE :p3) ' +
      'OR (Cost LIKE :p4) ' +
      'OR (Guarantee LIKE :p5) ' +
      'OR (Data_Guarantee LIKE :p6) ' +
      'OR (Shop_Name LIKE :p7)';
    Parameters.FindParam('p1').Value := '%'+lblEdSearch.Text+'%';
    Parameters.FindParam('p2').Value := '%'+lblEdSearch.Text+'%';
    Parameters.FindParam('p3').Value := '%'+lblEdSearch.Text+'%';
    Parameters.FindParam('p4').Value := '%'+lblEdSearch.Text+'%';
    Parameters.FindParam('p5').Value := '%'+lblEdSearch.Text+'%';
    Parameters.FindParam('p6').Value := '%'+lblEdSearch.Text+'%';
    Parameters.FindParam('p7').Value := '%'+lblEdSearch.Text+'%';
    Open;
    Sort := 'Product_Name ASC'
  end;
  UpdateStatusBar;
end;

procedure TFrmMain.BtnSearchCloseClick(Sender: TObject);
begin
  ADOQuery.SQL.Text := 'SELECT * FROM shopping_data';
  ADOQuery.Open;
  lblEdSearch.Clear;
  DSQ.Enabled := true;
  UpdateStatusBar;
end;

procedure TFrmMain.ChBoxEditEnableClick(Sender: TObject);
begin
  if ChBoxEditEnable.Checked then
  begin
    DBNavigator.Enabled := true;
    {DBGrid.Options      := [dgEditing,dgAlwaysShowEditor,dgTitles,dgIndicator,
                            dgColumnResize,dgColLines,dgRowLines,dgTabs,
                            dgAlwaysShowSelection,dgConfirmDelete,dgCancelOnExit,
                            dgTitleClick,dgTitleHotTrack];  }
    //DBGrid.ReadOnly     := false;
    //DBGrid.Enabled    := false;
    PanelEdit.Visible := true;
    DBGrid.Top        := 162;
    DBGrid.SelectedIndex := -1;

  end
    else
  begin
    DBNavigator.Enabled := false;
   { DBGrid.Options      := [dgTitles,dgIndicator,dgColumnResize,dgColLines,
                            dgRowLines,dgTabs,dgRowSelect,dgConfirmDelete,
                            dgCancelOnExit,dgTitleClick,dgTitleHotTrack]; }
   // DBGrid.ReadOnly     := true;
   //DBGrid.Enabled    := true;
   PanelEdit.Visible := false;
   DBGrid.Top        := 42;
   UpdateStatusBar;
  end;
end;

procedure TFrmMain.CmBoxVclStyleSelect(Sender: TObject);
begin
  TStyleManager.SetStyle(CmBoxVclStyle.Text);

end;

procedure TFrmMain.DBEdit1Click(Sender: TObject);
begin
  ShowMessage(IntToStr(DBGrid.SelectedRows.Count));
end;

procedure TFrmMain.DBGridTitleClick(Column: TColumn);
var
  SortParam: string;
begin
  if FFieldLastSorted = Column.FieldName then
  begin
    if FSortingDirection = stASC then
    begin
      SortParam := Column.FieldName + ' DESC';
      FSortingDirection := stDESC;
    end
    else
    begin
      SortParam := Column.FieldName + ' ASC';
      FSortingDirection := stASC;
    end;
  end
  else
  begin
    SortParam := Column.FieldName + ' DESC';
    FFieldLastSorted  := Column.FieldName;
    FSortingDirection := stDESC;
  end;
  ADOQuery.Sort := SortParam;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
var
  StyleName: string;
begin
  CurrDir := ExtractFileDir(Application.ExeName);
  for StyleName in TStyleManager.StyleNames do CmBoxVclStyle.Items.Add(StyleName);

  CmBoxVclStyle.ItemIndex := CmBoxVclStyle.Items.IndexOf('Sapphire Kamri');
  if CmBoxVclStyle.Text <> '' then TStyleManager.SetStyle(CmBoxVclStyle.Text);

  FileNameBase := CurrDir + '\ShoppingBase.mdb';
  ConnectString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+ FileNameBase + ';Persist Security Info=False';
  PanelEdit.Align      := alTop;
  PanelSearch.Align    := alTop;
  DBGrid.Align         := alClient;
  ADOConnect.ConnectionString := ConnectString;
  ADOConnect.Connected := true;
  ADOQuery.Active      := true;
  AddShops;
  BtnSearchCloseClick(Nil);
  UpdateStatusBar;
end;

procedure TFrmMain.UpdateStatusBar;
var
  i: Integer;
begin
  DSQ.Enabled := false;
  i := 0;
  ADOQuery.First;
  while ADOQuery.Eof = false do
  begin
    i := i + ADOQuery.FieldByName('Cost').AsInteger;
    ADOQuery.Next;
  end;
  ADOQuery.First;
  DSQ.Enabled := true;
  StatusBar.Panels[0].Text := 'Записей: ' + IntToStr(ADOQuery.RecordCount);
  StatusBar.Panels[1].Text := 'Сумма: ' + IntToStr(i);
end;

end.
