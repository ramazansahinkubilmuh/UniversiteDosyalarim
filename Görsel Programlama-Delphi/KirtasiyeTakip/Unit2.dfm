object Form2: TForm2
  Left = 266
  Top = 200
  Width = 429
  Height = 416
  Caption = 'Form2'
  Color = clTeal
  TransparentColorValue = clBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clMenuText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 40
    Top = 32
    Width = 337
    Height = 313
    TabOrder = 0
    object Label2: TLabel
      Left = 16
      Top = 56
      Width = 90
      Height = 13
      Caption = 'Tc Kimlik Numaras'#305
    end
    object Label3: TLabel
      Left = 16
      Top = 80
      Width = 19
      Height = 13
      Caption = 'Ad'#305'*'
    end
    object Label4: TLabel
      Left = 16
      Top = 112
      Width = 36
      Height = 13
      Caption = 'Soyad'#305'*'
    end
    object Label5: TLabel
      Left = 16
      Top = 136
      Width = 36
      Height = 13
      Caption = 'Telefon'
    end
    object Label6: TLabel
      Left = 16
      Top = 160
      Width = 27
      Height = 13
      Caption = 'Adres'
    end
    object Label1: TLabel
      Left = 16
      Top = 32
      Width = 55
      Height = 13
      Caption = 'M'#252#351'teri No*'
    end
    object Label7: TLabel
      Left = 24
      Top = 272
      Width = 214
      Height = 20
      Caption = '* Alanlar'#305' Bo'#351' Ge'#231'emezsiniz....'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object tbtcno: TEdit
      Left = 152
      Top = 56
      Width = 121
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
    object tbadi: TEdit
      Left = 152
      Top = 80
      Width = 121
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
    object tbsoyadi: TEdit
      Left = 152
      Top = 104
      Width = 121
      Height = 21
      Color = clBtnHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      Text = 'Edit1'
    end
    object tbtelefon: TEdit
      Left = 152
      Top = 128
      Width = 121
      Height = 21
      Color = clBtnHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      Text = 'Edit1'
    end
    object tbadres: TEdit
      Left = 152
      Top = 152
      Width = 121
      Height = 21
      Color = clBtnHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      Text = 'Edit1'
    end
    object btnkaydet: TBitBtn
      Left = 152
      Top = 192
      Width = 57
      Height = 49
      Caption = 'Kaydet'
      TabOrder = 6
      OnClick = btnkaydetClick
    end
    object btncik: TBitBtn
      Left = 216
      Top = 192
      Width = 57
      Height = 49
      Caption = #199#305'k'
      TabOrder = 7
      OnClick = btncikClick
    end
    object tbmno: TEdit
      Left = 152
      Top = 32
      Width = 121
      Height = 21
      Color = clBtnHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      Text = 'tbmno'
    end
  end
end
