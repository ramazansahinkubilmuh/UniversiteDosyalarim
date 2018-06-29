object Form4: TForm4
  Left = 192
  Top = 116
  Width = 742
  Height = 490
  Caption = 'Stok'
  Color = clTeal
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 400
    Top = 48
    Width = 76
    Height = 20
    Caption = #220'r'#252'n Se'#231
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 400
    Top = 96
    Width = 118
    Height = 20
    Caption = 'Stok Adedi Gir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 32
    Top = 208
    Width = 156
    Height = 25
    Caption = 'Ba'#351'lang'#305#231' Tarihi'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 424
    Top = 208
    Width = 103
    Height = 25
    Caption = 'Biti'#351' Tarihi'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 280
    Top = 272
    Width = 124
    Height = 25
    Caption = 'Stok Giri'#351'leri'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 920
    Top = 272
    Width = 128
    Height = 25
    Caption = 'Stok '#199#305'k'#305#351'lar'#305
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object tbstokadedi: TEdit
    Left = 576
    Top = 96
    Width = 185
    Height = 21
    Color = clBtnHighlight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    Text = 'tbstokadedi'
  end
  object DBGrid1: TDBGrid
    Left = 32
    Top = 312
    Width = 633
    Height = 337
    Color = clHighlightText
    DataSource = DataSource1
    FixedColor = clBtnHighlight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    PopupMenu = PopupMenu1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Id'
        Width = 145
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Barkodno'
        Width = 145
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'StokAdet'
        Width = 145
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tarih'
        Width = 145
        Visible = True
      end>
  end
  object btnkaydet: TBitBtn
    Left = 576
    Top = 144
    Width = 89
    Height = 41
    Caption = 'Kaydet'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = btnkaydetClick
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 576
    Top = 48
    Width = 185
    Height = 21
    Color = clBtnHighlight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    KeyField = 'Barkodno'
    ListField = 'Urunad'
    ListSource = Form1.datasourceurun
    ParentFont = False
    TabOrder = 3
  end
  object DBDateTimePicker1: TDBDateTimePicker
    Left = 208
    Top = 208
    Width = 186
    Height = 33
    Date = 42353.064401863430000000
    Time = 42353.064401863430000000
    Color = clBtnHighlight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
  end
  object btnfiltrele: TBitBtn
    Left = 824
    Top = 208
    Width = 129
    Height = 33
    Caption = 'G'#246'ster'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = btnfiltreleClick
  end
  object btncik: TBitBtn
    Left = 672
    Top = 144
    Width = 89
    Height = 41
    Caption = #199#305'k'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = btncikClick
  end
  object DBDateTimePicker2: TDBDateTimePicker
    Left = 576
    Top = 208
    Width = 186
    Height = 33
    Date = 42353.064401863430000000
    Time = 42353.064401863430000000
    Color = clBtnHighlight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
  end
  object DBGrid2: TDBGrid
    Left = 672
    Top = 312
    Width = 633
    Height = 337
    Color = clBtnHighlight
    DataSource = Form1.datasourcecikis
    FixedColor = clBtnHighlight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Id'
        Width = 145
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Barkodno'
        Width = 145
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'StokAdet'
        Width = 145
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tarih'
        Width = 145
        Visible = True
      end>
  end
  object btnstokgirisrapor: TBitBtn
    Left = 456
    Top = 264
    Width = 121
    Height = 33
    Caption = 'Raporla'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    OnClick = btnstokgirisraporClick
  end
  object btnstokcikisrapor: TBitBtn
    Left = 1072
    Top = 272
    Width = 121
    Height = 33
    Caption = 'Raporla'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 10
    OnClick = btnstokcikisraporClick
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 560
    Top = 16
  end
  object Table1: TTable
    TableName = 'D:\KirtasiyeTakip\stokgiris.db'
    Left = 600
    Top = 16
  end
  object Query1: TQuery
    Left = 632
    Top = 16
  end
  object PopupMenu1: TPopupMenu
    Left = 152
    Top = 256
    object StokSil1: TMenuItem
      Caption = 'Stok Sil'
      OnClick = StokSil1Click
    end
  end
end
