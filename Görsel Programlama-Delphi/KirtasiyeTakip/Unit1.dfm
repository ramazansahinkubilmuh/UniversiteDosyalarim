object Form1: TForm1
  Left = 275
  Top = 104
  Width = 863
  Height = 567
  HorzScrollBar.Position = 103
  Caption = 'Form1'
  Color = clTeal
  TransparentColorValue = clBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clMenuText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = -63
    Top = 176
    Width = 62
    Height = 13
    Caption = 'M'#252#351'teri No'
  end
  object Label2: TLabel
    Left = -63
    Top = 200
    Width = 53
    Height = 13
    Caption = 'Tc Kimlik'
  end
  object Label3: TLabel
    Left = 193
    Top = 176
    Width = 19
    Height = 13
    Caption = 'Ad'#305
  end
  object Label4: TLabel
    Left = 193
    Top = 200
    Width = 39
    Height = 13
    Caption = 'Soyad'#305
  end
  object Label7: TLabel
    Left = 737
    Top = 176
    Width = 62
    Height = 13
    Caption = 'M'#252#351'teri No'
  end
  object Label8: TLabel
    Left = 737
    Top = 200
    Width = 61
    Height = 13
    Caption = 'Barkod No'
  end
  object Label9: TLabel
    Left = 777
    Top = 584
    Width = 131
    Height = 20
    Caption = #220'r'#252'n Adedi    : 0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label10: TLabel
    Left = 777
    Top = 608
    Width = 131
    Height = 20
    Caption = 'Toplam Tutar : 0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object GroupBox1: TGroupBox
    Left = 151
    Top = 24
    Width = 739
    Height = 89
    TabOrder = 0
    object btnmusterikayit: TBitBtn
      Left = 16
      Top = 16
      Width = 89
      Height = 57
      Caption = 'M'#252#351'teri Kay'#305't'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnmusterikayitClick
    end
    object btnmusteriduzenle: TBitBtn
      Left = 112
      Top = 16
      Width = 105
      Height = 57
      Caption = 'M'#252#351'teri D'#252'zenle'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnmusteriduzenleClick
    end
    object btnmusterisil: TBitBtn
      Left = 232
      Top = 16
      Width = 89
      Height = 57
      Caption = 'M'#252#351'teri Sil'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnmusterisilClick
    end
    object btnkasa: TBitBtn
      Left = 536
      Top = 16
      Width = 89
      Height = 57
      Caption = 'Kasa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = btnkasaClick
    end
    object btncikis: TBitBtn
      Left = 640
      Top = 16
      Width = 89
      Height = 57
      Caption = #199#305'k'#305#351
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = btncikisClick
    end
    object btnurunekle: TBitBtn
      Left = 328
      Top = 16
      Width = 89
      Height = 57
      Caption = #220'r'#252'nler'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = btnurunekleClick
    end
    object btnstok: TBitBtn
      Left = 432
      Top = 16
      Width = 89
      Height = 57
      Caption = 'Stok'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      OnClick = btnstokClick
    end
  end
  object GroupBox2: TGroupBox
    Left = -63
    Top = 232
    Width = 433
    Height = 193
    Caption = 'M'#252#351'teri Listesi'
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 8
      Top = 24
      Width = 417
      Height = 153
      Color = clHighlightText
      DataSource = datasourcemusteri
      FixedColor = clBtnHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      PopupMenu = PopupMenu1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clMenuText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Expanded = False
          FieldName = 'Mno'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Tcno'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Adi'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Soyadi'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Telefon'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Adres'
          Width = 75
          Visible = True
        end>
    end
  end
  object GroupBox3: TGroupBox
    Left = 385
    Top = 232
    Width = 329
    Height = 193
    Caption = #220'r'#252'n Listesi'
    TabOrder = 2
    object DBGrid2: TDBGrid
      Left = 8
      Top = 24
      Width = 305
      Height = 161
      Color = clHighlightText
      DataSource = datasourceurunlistele
      FixedColor = clBtnHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      PopupMenu = PopupMenu2
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clMenuText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Expanded = False
          FieldName = 'Barkodno'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Urunad'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Fiyat'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Adet'
          Width = 60
          Visible = True
        end>
    end
  end
  object GroupBox4: TGroupBox
    Left = 737
    Top = 232
    Width = 393
    Height = 193
    Caption = 'G'#252'nl'#252'k Sat'#305#351'lar'
    TabOrder = 3
    object DBGrid4: TDBGrid
      Left = 16
      Top = 24
      Width = 361
      Height = 153
      Color = clHighlightText
      DataSource = datasourcesatislar
      FixedColor = clBtnHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      PopupMenu = PopupMenu3
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clMenuText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Expanded = False
          FieldName = 'Mno'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Barkodno'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Fiyat'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Tarih'
          Width = 70
          Visible = True
        end>
    end
  end
  object GroupBox5: TGroupBox
    Left = 329
    Top = 480
    Width = 433
    Height = 153
    Caption = 'Sepetim'
    TabOrder = 4
    object DBGrid3: TDBGrid
      Left = 16
      Top = 16
      Width = 401
      Height = 129
      Color = clHighlightText
      DataSource = datasourcesepet
      FixedColor = clBtnHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      PopupMenu = PopupMenu4
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clMenuText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Expanded = False
          FieldName = 'Mno'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Barkodno'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Fiyat'
          Width = 100
          Visible = True
        end>
    end
  end
  object btnsepeteekle: TBitBtn
    Left = 161
    Top = 488
    Width = 113
    Height = 41
    Caption = 'Sepete Ekle'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = btnsepeteekleClick
  end
  object btnsepettencikar: TBitBtn
    Left = 161
    Top = 536
    Width = 113
    Height = 41
    Caption = 'Sepetten '#199#305'kar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = btnsepettencikarClick
  end
  object btnsatisyap: TBitBtn
    Left = 161
    Top = 584
    Width = 113
    Height = 41
    Caption = 'Sat'#305#351' Yap'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnClick = btnsatisyapClick
  end
  object SearchEdit1: TSearchEdit
    Left = 42
    Top = 174
    Width = 121
    Height = 21
    DataSource = datasourcemusteri
    DataField = 'Mno'
    Color = clBtnHighlight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    Text = 'SearchEdit1'
  end
  object SearchEdit2: TSearchEdit
    Left = 42
    Top = 199
    Width = 121
    Height = 21
    DataSource = datasourcemusteri
    DataField = 'Tcno'
    Color = clBtnHighlight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    Text = 'SearchEdit2'
  end
  object SearchEdit3: TSearchEdit
    Left = 250
    Top = 174
    Width = 121
    Height = 21
    DataSource = datasourcemusteri
    DataField = 'Adi'
    Color = clBtnHighlight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 10
    Text = 'SearchEdit3'
  end
  object SearchEdit4: TSearchEdit
    Left = 250
    Top = 198
    Width = 121
    Height = 21
    DataSource = datasourcemusteri
    DataField = 'Soyadi'
    Color = clBtnHighlight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
    Text = 'SearchEdit4'
  end
  object SearchEdit7: TSearchEdit
    Left = 826
    Top = 174
    Width = 121
    Height = 21
    DataSource = datasourcesatislar
    DataField = 'Mno'
    Color = clBtnHighlight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 12
    Text = 'SearchEdit1'
  end
  object SearchEdit8: TSearchEdit
    Left = 826
    Top = 198
    Width = 121
    Height = 21
    DataSource = datasourcesatislar
    DataField = 'Barkodno'
    Color = clBtnHighlight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 13
    Text = 'SearchEdit1'
  end
  object datasourceurun: TDataSource
    DataSet = tableurun
    Left = 669
    Top = 304
  end
  object datasourcesatislar: TDataSource
    DataSet = tablesatislar
    Left = 1001
    Top = 298
  end
  object datasourcesepet: TDataSource
    DataSet = tablesepet
    Left = 681
    Top = 552
  end
  object tableurun: TTable
    TableName = 'D:\KirtasiyeTakip\urunler.db'
    Left = 685
    Top = 344
  end
  object tablesatislar: TTable
    TableName = 'D:\KirtasiyeTakip\satis.db'
    Left = 961
    Top = 306
  end
  object tablesepet: TTable
    TableName = 'D:\KirtasiyeTakip\sepet.db'
    Left = 561
    Top = 544
  end
  object Queryurun: TQuery
    Left = 621
    Top = 304
  end
  object Querysatislar: TQuery
    Left = 1041
    Top = 306
  end
  object Querysepet: TQuery
    Left = 713
    Top = 552
  end
  object datasourceurunlistele: TDataSource
    DataSet = Queryurunlistele
    Left = 645
    Top = 344
  end
  object Queryurunlistele: TQuery
    SQL.Strings = (
      
        'SELECT urunler.Barkodno,urunler.Urunad,urunler.Fiyat, SUM(stokgi' +
        'ris.StokAdet) as Adet from urunler.db as urunler,stokgiris.db as' +
        ' stokgiris where urunler.Barkodno=stokgiris.Barkodno group by st' +
        'okgiris.Barkodno,urunler.Urunad,urunler.Fiyat,urunler.Barkodno')
    Left = 609
    Top = 346
  end
  object datasourcecikis: TDataSource
    DataSet = tablecikis
    Left = 869
    Top = 483
  end
  object tablecikis: TTable
    TableName = 'D:\KirtasiyeTakip\stokcikis.db'
    Left = 869
    Top = 510
  end
  object Querycikis: TQuery
    Left = 869
    Top = 539
  end
  object MainMenu1: TMainMenu
    BiDiMode = bdLeftToRight
    ParentBiDiMode = False
    Left = 112
    Top = 190
    object Mteriler1: TMenuItem
      Caption = 'M'#252#351'teriler'
      object MteriKayt1: TMenuItem
        Caption = 'M'#252#351'teri Kay'#305't'
        OnClick = MteriKayt1Click
      end
      object MteriDzenle1: TMenuItem
        Caption = 'M'#252#351'teri D'#252'zenle'
        OnClick = MteriDzenle1Click
      end
      object MteriSil1: TMenuItem
        Caption = 'M'#252#351'teri Sil'
        OnClick = MteriSil1Click
      end
    end
    object rnler1: TMenuItem
      Caption = #220'r'#252'nler'
      object rnEkle1: TMenuItem
        Caption = #220'r'#252'n Ekle'
        OnClick = rnEkle1Click
      end
    end
    object Stok1: TMenuItem
      Caption = 'Stok'
      object StokEkle2: TMenuItem
        Caption = 'Stok Ekle'
        OnClick = StokEkle2Click
      end
    end
    object Kasa1: TMenuItem
      Caption = 'Kasa'
      object SatlarListele1: TMenuItem
        Caption = 'Sat'#305#351'lar'#305' Listele'
        OnClick = SatlarListele1Click
      end
    end
    object k1: TMenuItem
      Caption = #199#305'k'#305#351
      OnClick = k1Click
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 568
    Top = 346
    object rnler2: TMenuItem
      Caption = #220'r'#252'nler'
      OnClick = rnler2Click
    end
    object StokEkle1: TMenuItem
      Caption = 'Stoklar'
      OnClick = StokEkle1Click
    end
  end
  object PopupMenu3: TPopupMenu
    Left = 936
    Top = 348
    object Kasa2: TMenuItem
      Caption = 'Kasa'
      OnClick = Kasa2Click
    end
  end
  object PopupMenu4: TPopupMenu
    Left = 480
    Top = 538
    object SepeteEkle1: TMenuItem
      Caption = 'Sepete Ekle'
      OnClick = SepeteEkle1Click
    end
    object Sepettenkar1: TMenuItem
      Caption = 'Sepetten '#199#305'kar'
      OnClick = Sepettenkar1Click
    end
    object SatOnayla1: TMenuItem
      Caption = 'Sat'#305#351#305' Onayla'
      OnClick = SatOnayla1Click
    end
  end
  object Querymusteri: TQuery
    Left = 269
    Top = 352
  end
  object tablemusteri: TTable
    TableName = 'D:\KirtasiyeTakip\musteriler.db'
    Left = 245
    Top = 312
  end
  object PopupMenu1: TPopupMenu
    Left = 208
    Top = 314
    object YeniMteri1: TMenuItem
      Caption = 'Yeni M'#252#351'teri'
      OnClick = YeniMteri1Click
    end
    object MteriDzenle2: TMenuItem
      Caption = 'M'#252#351'teri D'#252'zenle'
      OnClick = MteriDzenle2Click
    end
    object MteriSil2: TMenuItem
      Caption = 'M'#252#351'teri Sil'
      OnClick = MteriSil2Click
    end
  end
  object datasourcemusteri: TDataSource
    DataSet = tablemusteri
    Left = 221
    Top = 360
  end
end
