object Form5: TForm5
  Left = 319
  Top = 131
  Width = 949
  Height = 480
  Caption = 'Kasa'
  Color = clTeal
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 152
    Top = 96
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
  object Label1: TLabel
    Left = 672
    Top = 96
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
  object GroupBox4: TGroupBox
    Left = 144
    Top = 232
    Width = 985
    Height = 353
    Caption = 'G'#252'nl'#252'k Sat'#305#351'lar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object DBGrid4: TDBGrid
      Left = 32
      Top = 24
      Width = 929
      Height = 305
      Color = clBtnHighlight
      DataSource = Form1.datasourcesatislar
      FixedColor = clBtnHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clCream
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          ButtonStyle = cbsEllipsis
          Expanded = False
          FieldName = 'Mno'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Width = 220
          Visible = True
        end
        item
          ButtonStyle = cbsEllipsis
          Expanded = False
          FieldName = 'Barkodno'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Width = 220
          Visible = True
        end
        item
          ButtonStyle = cbsEllipsis
          Expanded = False
          FieldName = 'Fiyat'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Width = 220
          Visible = True
        end
        item
          ButtonStyle = cbsEllipsis
          Expanded = False
          FieldName = 'Tarih'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Width = 220
          Visible = True
        end>
    end
  end
  object DBDateTimePicker1: TDBDateTimePicker
    Left = 352
    Top = 96
    Width = 289
    Height = 33
    Date = 42353.042970706020000000
    Time = 42353.042970706020000000
    Color = clBtnHighlight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clCream
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object btnfiltre: TBitBtn
    Left = 552
    Top = 184
    Width = 137
    Height = 33
    Caption = 'G'#246'ster'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = btnfiltreClick
  end
  object btncik: TBitBtn
    Left = 712
    Top = 184
    Width = 137
    Height = 33
    Caption = #199#305'k'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = btncikClick
  end
  object DBDateTimePicker2: TDBDateTimePicker
    Left = 832
    Top = 96
    Width = 289
    Height = 33
    Date = 42353.042970706020000000
    Time = 42353.042970706020000000
    Color = clBtnHighlight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clCream
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
  end
  object btnsatisraporla: TBitBtn
    Left = 400
    Top = 184
    Width = 137
    Height = 33
    Caption = 'Raporla'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = btnsatisraporlaClick
  end
end
