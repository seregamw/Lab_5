object Form1: TForm1
  Left = 250
  Top = 263
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Database'
  ClientHeight = 297
  ClientWidth = 516
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 99
    Top = 173
    Width = 86
    Height = 13
    Caption = 'Execute Request:'
  end
  object Label2: TLabel
    Left = 141
    Top = 8
    Width = 39
    Height = 13
    Caption = 'Sort by:'
  end
  object Label3: TLabel
    Left = 8
    Top = 8
    Width = 46
    Height = 13
    Caption = 'Table list:'
  end
  object DBGrid1: TDBGrid
    Left = 223
    Top = 8
    Width = 280
    Height = 112
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
  end
  object ListBox1: TListBox
    Left = 8
    Top = 34
    Width = 121
    Height = 78
    ItemHeight = 13
    TabOrder = 1
    OnMouseUp = ListBox1MouseUp
  end
  object Button1: TButton
    Left = 205
    Top = 126
    Width = 70
    Height = 25
    Caption = 'Add'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 281
    Top = 126
    Width = 70
    Height = 25
    Caption = 'Delete'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 433
    Top = 126
    Width = 70
    Height = 25
    Caption = 'Update'
    TabOrder = 4
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 357
    Top = 126
    Width = 70
    Height = 25
    Caption = 'Save'
    TabOrder = 5
    OnClick = Button4Click
  end
  object Edit1: TEdit
    Left = 247
    Top = 165
    Width = 60
    Height = 21
    TabOrder = 6
  end
  object Edit2: TEdit
    Left = 313
    Top = 165
    Width = 60
    Height = 21
    TabOrder = 7
  end
  object Edit3: TEdit
    Left = 379
    Top = 165
    Width = 60
    Height = 21
    TabOrder = 8
  end
  object Edit4: TEdit
    Left = 445
    Top = 165
    Width = 60
    Height = 21
    TabOrder = 9
  end
  object Memo1: TMemo
    Left = 99
    Top = 192
    Width = 406
    Height = 76
    PopupMenu = PopupMenu1
    TabOrder = 10
  end
  object Button5: TButton
    Left = 8
    Top = 192
    Width = 75
    Height = 25
    Caption = 'Exec SQL'
    TabOrder = 11
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 141
    Top = 27
    Width = 35
    Height = 25
    Caption = 'DESC'
    TabOrder = 12
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 182
    Top = 27
    Width = 35
    Height = 25
    Caption = 'ASC'
    TabOrder = 13
    OnClick = Button7Click
  end
  object Button8: TButton
    Left = 8
    Top = 118
    Width = 121
    Height = 25
    Caption = 'Delete table'
    TabOrder = 14
    OnClick = Button8Click
  end
  object Button9: TButton
    Left = 60
    Top = 8
    Width = 69
    Height = 20
    Caption = 'Refresh'
    TabOrder = 15
    OnClick = Button9Click
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 278
    Width = 516
    Height = 19
    Panels = <
      item
        Width = 150
      end
      item
        Width = 50
      end>
  end
  object Button11: TButton
    Left = 8
    Top = 245
    Width = 75
    Height = 25
    Caption = 'Exit'
    TabOrder = 17
    OnClick = Button11Click
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=Base.mdb;Persist Se' +
      'curity Info=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 379
    Top = 221
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 411
    Top = 221
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 443
    Top = 221
  end
  object PopupMenu1: TPopupMenu
    Left = 344
    Top = 221
    object emplates1: TMenuItem
      AutoLineReduction = maAutomatic
      Caption = 'Templates:'
      Enabled = False
    end
    object Createtable1: TMenuItem
      Caption = 'Create table'
      OnClick = Createtable1Click
    end
    object Deletetable1: TMenuItem
      Caption = 'Delete table'
      OnClick = Deletetable1Click
    end
    object Insertdate1: TMenuItem
      Caption = 'Insert'
      OnClick = Insertdate1Click
    end
    object Update1: TMenuItem
      Caption = 'Update'
      OnClick = Update1Click
    end
    object Select1: TMenuItem
      Caption = 'Select'
      OnClick = Select1Click
    end
    object Delete1: TMenuItem
      Caption = 'Delete'
      OnClick = Delete1Click
    end
  end
  object MainMenu1: TMainMenu
    Left = 280
    Top = 224
    object Options1: TMenuItem
      Caption = 'Options'
      object AccountsManager1: TMenuItem
        Caption = 'Accounts Manager'
        Enabled = False
        OnClick = AccountsManager1Click
      end
      object Exit1: TMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 160
    Top = 224
  end
  object TrayIcon1: TTrayIcon
    Hint = 'By [Serega MoST]'
    PopupMenu = PopupMenu2
    OnClick = TrayIcon1Click
    Left = 112
    Top = 224
  end
  object PopupMenu2: TPopupMenu
    Left = 224
    Top = 224
    object Exit2: TMenuItem
      Caption = 'Exit'
      OnClick = Exit2Click
    end
  end
end
