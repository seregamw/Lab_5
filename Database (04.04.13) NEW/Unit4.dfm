object Data: TData
  OldCreateOrder = False
  Height = 188
  Width = 235
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=Users.dat;Persist S' +
      'ecurity Info=False'
    LoginPrompt = False
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 16
    Top = 8
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 56
    Top = 8
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 96
    Top = 8
  end
end
