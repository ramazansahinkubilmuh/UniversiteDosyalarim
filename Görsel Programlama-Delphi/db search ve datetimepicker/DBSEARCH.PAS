{
          Technisoft Group presents:

          DB SEARCH 1.1b
          -----------------------
          written by Alexander Burlakov aka HUNTER - 1998
                     E-mail: Hunter@hptmts.tvcom.ru
                     URL: http://www.chat.ru/~hunterml/

          FREEWARE beta version full source included !!!

          Check my new and updated components on
                          http://www.chat.ru/~hunterml/
}

unit DBSearch;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, DbCtrls;

type
  TCustomSearchEdit = class(TCustomEdit)
  private
    { Private declarations }
    FDataLink: TFieldDataLink;
    FSearchOptions: TLocateOptions;
    procedure DataChange(Sender : Tobject);
    function GetDataSource : TDataSource;
    function GetDataField : string;
    procedure SetDataSource(Value : TDataSource);
    procedure SetDataField(const Value : string);
    procedure SetSearchOptions(const Value :TLocateOptions);
    procedure CMChanged(var Message: TMessage); message CM_CHANGED;
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property SearchOptions: TLocateOptions read FSearchOptions
             write SetSearchOptions default [loCaseInsensitive, loPartialKey];
  published
    { Published declarations }
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property DataField: string read GetDataField write SetDataField;
    property TabStop default True;
  end;

  TSearchEdit = class(TCustomSearchEdit)
  published
    property SearchOptions default [loCaseInsensitive, loPartialKey];
    property AutoSelect;
    property AutoSize;
    property BorderStyle;
    property CharCase;
    property Color;
    property Ctl3D;
    property DragCursor;
    property DragMode;
    property Enabled;
    property Font;
    property HideSelection;
    property ImeMode;
    property ImeName;
    property MaxLength;
    property OEMConvert;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PasswordChar;
    property PopupMenu;
    property ReadOnly;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Text;
    property Visible;
    property OnChange;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
  end;

procedure Register;

implementation

constructor TCustomSearchEdit.Create;
begin
  inherited Create(AOwner);
  FDataLink := TFieldDataLink.Create;
  FDataLink.Control := Self;
  FDataLink.OnDataChange := DataChange;
  FSearchOptions := [loCaseInsensitive, loPartialKey];
end;

destructor TCustomSearchEdit.Destroy;
begin
  FDataLink.Free;
  FDataLink := nil;
  inherited Destroy;
end;

procedure TCustomSearchEdit.DataChange(Sender: TObject);
begin
  if FDataLink.Field <> nil then
  begin
    if Screen.ActiveControl <> Self then
    begin
      if FDataLink.CanModify then
         Text := FDataLink.Field.Text
      else
      begin
        Text := FDataLink.Field.DisplayText;
      end;
      SelectAll;
    end;
  end else
  begin
    if csDesigning in ComponentState then
      Text := Name else
      Text := '';
  end;
end;

procedure TCustomSearchEdit.CMChanged;
begin
  if not ((csDesigning in ComponentState) and
         (csLoading in ComponentState)) then
  begin
    if Screen.ActiveControl = Self then
       FDataLink.DataSet.Locate(FDataLink.FieldName, Text,
       FSearchOptions);
  end;
end;

function TCustomSearchEdit.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

procedure TCustomSearchEdit.SetDataSource(Value: TDataSource);
begin
  FDataLink.DataSource := Value;
  if Value <> nil then Value.FreeNotification(Self);
end;

function TCustomSearchEdit.GetDataField: string;
begin
  Result := FDataLink.FieldName;
end;

procedure TCustomSearchEdit.SetDataField(const Value: string);
begin
  FDataLink.FieldName := Value;
end;

procedure TCustomSearchEdit.SetSearchOptions(const Value :TLocateOptions);
begin
  FSearchOptions := Value;
end;

procedure Register;
begin
  RegisterComponents('Technisoft', [TSearchEdit]);
end;

end.
