object FrmMain: TFrmMain
  Left = 0
  Top = 0
  Caption = 'Shopping Base'
  ClientHeight = 805
  ClientWidth = 967
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid: TDBGrid
    Left = 8
    Top = 190
    Width = 951
    Height = 571
    Align = alCustom
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DSQ
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Key'
        Visible = False
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Date_to_buy'
        Title.Alignment = taCenter
        Title.Caption = #1044#1072#1090#1072' '#1087#1086#1082#1091#1087#1082#1080
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Product_Name'
        Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1090#1086#1074#1072#1088#1072
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 247
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Count'
        Title.Alignment = taCenter
        Title.Caption = #1045#1076#1080#1085#1080#1094#1099
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 92
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Cost'
        Title.Alignment = taCenter
        Title.Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 172
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Guarantee'
        Title.Alignment = taCenter
        Title.Caption = #1043#1072#1088#1072#1085#1090#1080#1103
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Data_Guarantee'
        Title.Alignment = taCenter
        Title.Caption = #1048#1089#1090#1077#1082#1072#1077#1090' '#1075#1072#1088#1072#1085#1090#1080#1103
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Shop_Name'
        Title.Alignment = taCenter
        Title.Caption = #1052#1072#1075#1072#1079#1080#1085
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 80
        Visible = True
      end>
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 786
    Width = 967
    Height = 19
    Panels = <
      item
        Text = #1057#1090#1088#1086#1082':'
        Width = 150
      end
      item
        Text = #1057#1091#1084#1084#1072':'
        Width = 150
      end>
    ExplicitWidth = 951
  end
  object PanelEdit: TPanel
    Left = 0
    Top = 71
    Width = 1065
    Height = 113
    Align = alCustom
    TabOrder = 1
    Visible = False
    DesignSize = (
      1065
      113)
    object Label1: TLabel
      Left = 16
      Top = 17
      Width = 75
      Height = 13
      Caption = #1044#1072#1090#1072' '#1087#1086#1082#1091#1087#1082#1080':'
    end
    object Label2: TLabel
      Left = 137
      Top = 17
      Width = 91
      Height = 13
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1090#1086#1074#1072#1088#1072':'
    end
    object Label3: TLabel
      Left = 409
      Top = 17
      Width = 49
      Height = 13
      Caption = #1045#1076#1080#1085#1080#1094#1099':'
    end
    object Label4: TLabel
      Left = 481
      Top = 17
      Width = 58
      Height = 13
      Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100':'
    end
    object Label5: TLabel
      Left = 553
      Top = 17
      Width = 52
      Height = 13
      Caption = #1043#1072#1088#1072#1085#1090#1080#1103':'
    end
    object Label6: TLabel
      Left = 768
      Top = 17
      Width = 46
      Height = 13
      Caption = #1052#1072#1075#1072#1079#1080#1085':'
    end
    object Label7: TLabel
      Left = 625
      Top = 17
      Width = 102
      Height = 13
      Caption = #1048#1089#1090#1077#1082#1072#1077#1090' '#1075#1072#1088#1072#1085#1090#1080#1103':'
    end
    object DBEdit1: TDBEdit
      Left = 16
      Top = 36
      Width = 113
      Height = 21
      DataField = 'Date_to_buy'
      DataSource = DSQ
      TabOrder = 0
      OnClick = DBEdit1Click
    end
    object DBEdit3: TDBEdit
      Left = 137
      Top = 36
      Width = 266
      Height = 21
      DataField = 'Product_Name'
      DataSource = DSQ
      TabOrder = 1
    end
    object DBEdit2: TDBEdit
      Left = 409
      Top = 36
      Width = 66
      Height = 21
      DataField = 'Count'
      DataSource = DSQ
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 481
      Top = 36
      Width = 66
      Height = 21
      DataField = 'Cost'
      DataSource = DSQ
      TabOrder = 3
    end
    object DBEdit5: TDBEdit
      Left = 553
      Top = 36
      Width = 66
      Height = 21
      DataField = 'Guarantee'
      DataSource = DSQ
      TabOrder = 4
    end
    object DBCmBoxShop: TDBComboBox
      Left = 768
      Top = 36
      Width = 122
      Height = 21
      DataField = 'Shop_Name'
      DataSource = DSQ
      Items.Strings = (
        'DNS'
        'Technopoint')
      TabOrder = 5
    end
    object DBNavigator: TDBNavigator
      Left = 16
      Top = 72
      Width = 240
      Height = 25
      DataSource = DSQ
      Anchors = [akLeft, akBottom]
      Enabled = False
      TabOrder = 6
    end
    object DBEdit6: TDBEdit
      Left = 625
      Top = 36
      Width = 137
      Height = 21
      DataSource = DSQ
      TabOrder = 7
    end
  end
  object PanelSearch: TPanel
    Left = 0
    Top = 8
    Width = 1065
    Height = 66
    Align = alCustom
    TabOrder = 3
    DesignSize = (
      1065
      66)
    object lblEdSearch: TLabeledEdit
      Left = 16
      Top = 28
      Width = 225
      Height = 21
      EditLabel.Width = 34
      EditLabel.Height = 13
      EditLabel.Caption = #1055#1086#1080#1089#1082':'
      TabOrder = 0
    end
    object BtnSearch: TButton
      Left = 247
      Top = 26
      Width = 75
      Height = 25
      Caption = #1048#1089#1082#1072#1090#1100
      TabOrder = 1
      OnClick = BtnSearchClick
    end
    object ChBoxEditEnable: TCheckBox
      Left = 455
      Top = 32
      Width = 113
      Height = 17
      Caption = #1056#1077#1078#1080#1084' '#1074#1074#1086#1076#1072
      TabOrder = 2
      OnClick = ChBoxEditEnableClick
    end
    object BtnSearchClose: TButton
      Left = 328
      Top = 26
      Width = 75
      Height = 25
      Caption = #1057#1073#1088#1086#1089
      TabOrder = 3
      OnClick = BtnSearchCloseClick
    end
    object CmBoxVclStyle: TComboBox
      Left = 802
      Top = 15
      Width = 233
      Height = 21
      Style = csDropDownList
      Anchors = [akTop, akRight]
      TabOrder = 4
      OnSelect = CmBoxVclStyleSelect
    end
  end
  object ADOConnect: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Users\USER\Deskt' +
      'op\shop_hard.mdb;Persist Security Info=False;'
    KeepConnection = False
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 248
    Top = 272
  end
  object ADOQuery: TADOQuery
    Connection = ADOConnect
    CursorType = ctStatic
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      'SELECT *'
      'FROM shopping_data')
    Left = 344
    Top = 280
  end
  object OpenDialog: TOpenDialog
    Left = 528
    Top = 280
  end
  object DSQ: TDataSource
    DataSet = ADOQuery
    Left = 440
    Top = 280
  end
end
