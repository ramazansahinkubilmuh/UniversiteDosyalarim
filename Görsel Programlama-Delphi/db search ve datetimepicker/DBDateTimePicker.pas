unit DBDateTimePicker;

interface

(*
 *              Argus Software Pty Ltd License Notice
 *
 * The contents of this file are subject to the Argus Software Pty Ltd
 * License Version 1.0 (the "License"). You may not use this file except
 * in compliance with the License. A copy of the License is available at
 * http://www.argussoftware.net/license/license_agreement.html
 *
 * The Original Code is argus. The Initial Developer of the Original
 * Code is Argus Software Pty Ltd, All Rights Reserved.
 *)

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls
  , Db
  , DBCtrls
  ;

type
  TDBDateTimePicker = class(TDateTimePicker)
  private
    FDataLink: TFieldDataLink;
    FFocused: Boolean;
    FCaption: TCaption;
    function  GetText(): TCaption;
    procedure SetText(const Value: TCaption);
    procedure DataChange(Sender: TObject);
    function GetDataField: string;
    function GetDataSource: TDataSource;
    function GetField: TField;
    function GetReadOnly: Boolean;
    procedure SetDataField(const Value: string);
    procedure SetDataSource(Value: TDataSource);
    procedure SetFocused(Value: Boolean);
    procedure SetReadOnly(Value: Boolean);
    procedure UpdateData(Sender: TObject);
    procedure WMCut(var Message: TMessage); message WM_CUT;
    procedure WMPaste(var Message: TMessage); message WM_PASTE;
    procedure WMUndo(var Message: TMessage); message WM_UNDO;
    procedure CMEnter(var Message: TCMEnter); message CM_ENTER;
    procedure CMExit(var Message: TCMExit); message CM_EXIT;
    procedure CMGetDataLink(var Message: TMessage); message CM_GETDATALINK;
  protected
    procedure Change; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure Loaded; override;
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function ExecuteAction(Action: TBasicAction): Boolean; override;
    function UpdateAction(Action: TBasicAction): Boolean; override;
    function UseRightToLeftAlignment: Boolean; override;
    property Field: TField read GetField;
  published
    // can we use TControl Caption ??? (use WM_SETTEXT and Paint; virtual)
    // fast solution
    property Caption: TCaption read GetText write SetText;

    property Anchors;
    property AutoSize;
    property BiDiMode;
    property Color;
    property Constraints;
    property Ctl3D;
    property DataField: string read GetDataField write SetDataField;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property Font;
    property ImeMode;
    property ImeName;
    property ParentBiDiMode;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ReadOnly: Boolean read GetReadOnly write SetReadOnly default False;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnChange;
    property OnContextPopup;                     
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDock;
    property OnStartDrag;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Argus', [TDBDateTimePicker]);
end;

{ TDBDateTimePicker }

constructor TDBDateTimePicker.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  ControlStyle := ControlStyle + [csReplicatable];
  FDataLink := TFieldDataLink.Create;
  FDataLink.Control := Self;
  FDataLink.OnDataChange := DataChange;
  FDataLink.OnUpdateData := UpdateData;
end;

destructor TDBDateTimePicker.Destroy;
begin
  FDataLink.Free;
  FDataLink := nil;

  inherited Destroy;
end;

procedure TDBDateTimePicker.Change;
begin
  FDataLink.Edit;
  inherited Change;
  FDataLink.Modified;
end;

procedure TDBDateTimePicker.CMEnter(var Message: TCMEnter);
begin
  SetFocused(True);
  inherited;
end;

procedure TDBDateTimePicker.CMExit(var Message: TCMExit);
begin
  try
    FDataLink.UpdateRecord;
  except
    SetFocus;
    raise;
  end;

  SetFocused(False);
  //CheckCursor;
  DoExit;
end;

procedure TDBDateTimePicker.CMGetDataLink(var Message: TMessage);
begin
  Message.Result := Integer(FDataLink);
end;

procedure TDBDateTimePicker.DataChange(Sender: TObject);
begin
  if not assigned( FDataLink.Field ) then exit;

  if ( DataSource.DataSet.State in [dsEdit, dsInsert] ) then begin
    if ShowCheckbox then begin
      if Checked then
        DateTime := FDataLink.Field.AsDateTime
      else begin
        DateTime := 0;//DateTime := SysUtils.Now();
        Checked := false;
      end;
    end else begin
      Enabled := DataSource.DataSet.Active;

      if Enabled then
        DateTime := FDataLink.Field.AsDateTime
      else
        DateTime := SysUtils.Now();
        //DateTime := Trunc( SysUtils.Date );

      if (csDesigning in ComponentState) then begin
        // design time

      end else begin
        // run time
        if Enabled and ( Date < 1 ) then
          FDataLink.Field.AsDateTime := Trunc( SysUtils.Date() );
      end;
    end;
  end else begin
  	DateTime := FDataLink.Field.AsDateTime;
    if ShowCheckbox then
      Checked  := not FDataLink.Field.IsNull;
  end;
end;

procedure TDBDateTimePicker.UpdateData(Sender: TObject);
begin
  //ValidateEdit;

	if ( DataSource.DataSet.State in [dsEdit, dsInsert] ) then begin
    if ShowCheckbox then begin
      if Checked then
        FDataLink.Field.AsDateTime := DateTime//Trunc( Date )
      else begin
        DateTime := 0;//DateTime := SysUtils.Now();
        FDataLink.Field.Clear();
        Checked := false;
      end;
    end else begin
      FDataLink.Field.AsDateTime := DateTime//Trunc( Date )
    end;
  end;
end;

function TDBDateTimePicker.ExecuteAction(Action: TBasicAction): Boolean;
begin
  Result :=
  	inherited ExecuteAction(Action) or
    (FDataLink <> nil) and
    FDataLink.ExecuteAction(Action);
end;

function TDBDateTimePicker.GetDataField: string;
begin
  Result := FDataLink.FieldName;
end;

function TDBDateTimePicker.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

function TDBDateTimePicker.GetField: TField;
begin
  Result := FDataLink.Field;
end;

function TDBDateTimePicker.GetReadOnly: Boolean;
begin
  Result := FDataLink.ReadOnly;
end;

procedure TDBDateTimePicker.KeyDown(var Key: Word; Shift: TShiftState);
var
	MyKeyDown : TKeyEvent;
begin
  inherited KeyDown(Key, Shift);

  if (Key = VK_DELETE) or ((Key = VK_INSERT) and (ssShift in Shift)) then
    FDataLink.Edit;
	if not ReadOnly and
  	(key in [vk_up,vk_down,vk_left,vk_right,vk_end,vk_home,vk_prior,vk_next]) and
		Fdatalink.Edit then
		inherited KeyDown(Key,Shift)
	else begin
		MyKeyDown := OnKeyDOwn;
		if Assigned(MyKeyDown) then
    	MyKeyDOwn(Self, key, shift);
	end;
end;

procedure TDBDateTimePicker.Loaded;
begin
  inherited Loaded;

  //ResetMaxLength;
  if (csDesigning in ComponentState) then DataChange(Self);
end;

procedure TDBDateTimePicker.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);

  if (Operation = opRemove) and
  	 (FDataLink <> nil) and
     (AComponent = DataSource) then
  	DataSource := nil;
end;

procedure TDBDateTimePicker.SetDataField(const Value: string);
begin
  FDataLink.FieldName := Value;
end;

procedure TDBDateTimePicker.SetDataSource(Value: TDataSource);
begin
  if not (FDataLink.DataSourceFixed and (csLoading in ComponentState)) then
    FDataLink.DataSource := Value;
  if Value <> nil then Value.FreeNotification(Self);
end;

procedure TDBDateTimePicker.SetFocused(Value: Boolean);
begin
  if FFocused <> Value then begin
    FFocused := Value;
  end;
end;

procedure TDBDateTimePicker.SetReadOnly(Value: Boolean);
begin
  FDataLink.ReadOnly := Value;
end;

function TDBDateTimePicker.UpdateAction(Action: TBasicAction): Boolean;
begin
  Result := inherited UpdateAction(Action) or (FDataLink <> nil) and
    FDataLink.UpdateAction(Action);
end;

function TDBDateTimePicker.UseRightToLeftAlignment: Boolean;
begin
  Result := DBUseRightToLeftAlignment(Self, Field);
end;

procedure TDBDateTimePicker.WMCut(var Message: TMessage);
begin
  FDataLink.Edit;
  inherited;
end;

procedure TDBDateTimePicker.WMPaste(var Message: TMessage);
begin
  FDataLink.Edit;
  inherited;
end;

procedure TDBDateTimePicker.WMUndo(var Message: TMessage);
begin
  FDataLink.Edit;
  inherited;
end;

function TDBDateTimePicker.GetText(): TCaption;
begin
  Result := FCaption;
end;

procedure TDBDateTimePicker.SetText(const Value: TCaption);
begin
  FCaption := Value;
end;

end.
