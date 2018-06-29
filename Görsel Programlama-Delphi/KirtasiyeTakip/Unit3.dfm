object Form3: TForm3
  Left = 373
  Top = 115
  Width = 928
  Height = 480
  Caption = #220'r'#252'nler'
  Color = clTeal
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 432
    Top = 48
    Width = 85
    Height = 20
    Caption = 'Barkod No'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 432
    Top = 80
    Width = 71
    Height = 20
    Caption = #220'r'#252'n Ad'#305
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 432
    Top = 112
    Width = 88
    Height = 20
    Caption = #220'r'#252'n Fiyat'#305
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object tbbarkodno: TEdit
    Left = 544
    Top = 48
    Width = 305
    Height = 21
    Color = clBtnHighlight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    Text = 'tbbarkodno'
  end
  object tburunadi: TEdit
    Left = 544
    Top = 80
    Width = 305
    Height = 21
    Color = clBtnHighlight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    Text = 'Edit1'
  end
  object tburunfiyati: TEdit
    Left = 544
    Top = 112
    Width = 305
    Height = 21
    Color = clBtnHighlight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    Text = 'Edit1'
  end
  object btnkaydet: TBitBtn
    Left = 544
    Top = 152
    Width = 89
    Height = 49
    Caption = 'Kaydet'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = btnkaydetClick
  end
  object btnsil: TBitBtn
    Left = 760
    Top = 152
    Width = 89
    Height = 49
    Caption = 'Sil'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = btnsilClick
  end
  object btncik: TBitBtn
    Left = 656
    Top = 224
    Width = 89
    Height = 49
    Caption = #199#305'k'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = btncikClick
  end
  object btnduzenle: TBitBtn
    Left = 656
    Top = 152
    Width = 89
    Height = 49
    Caption = 'D'#252'zenle'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = btnduzenleClick
  end
  object DBGrid2: TDBGrid
    Left = 304
    Top = 296
    Width = 705
    Height = 361
    Color = clHighlightText
    DataSource = Form1.datasourceurun
    FixedColor = clBtnHighlight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = DBGrid2CellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Barkodno'
        Width = 220
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Urunad'
        Width = 220
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Fiyat'
        Width = 220
        Visible = True
      end>
  end
end
