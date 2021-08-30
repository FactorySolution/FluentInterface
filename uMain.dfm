object FrmMain: TFrmMain
  Left = 0
  Top = 0
  Caption = 'Fluent Interface'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object mmCoupon: TMemo
    Left = 121
    Top = 8
    Width = 408
    Height = 283
    TabOrder = 0
  end
  object btnSell: TButton
    Left = 8
    Top = 16
    Width = 97
    Height = 25
    Caption = 'Full Sell'
    TabOrder = 1
    OnClick = btnSellClick
  end
  object btnAddClient: TButton
    Left = 8
    Top = 56
    Width = 97
    Height = 25
    Caption = '1 - Add Client'
    TabOrder = 2
    OnClick = btnAddClientClick
  end
  object btnAddItem: TButton
    Left = 8
    Top = 95
    Width = 97
    Height = 25
    Caption = '2 - Add Item'
    TabOrder = 3
    OnClick = btnAddItemClick
  end
  object btnAddPayment: TButton
    Left = 8
    Top = 135
    Width = 97
    Height = 25
    Caption = '3 - Add Payment'
    TabOrder = 4
    OnClick = btnAddPaymentClick
  end
  object btnFinishSell: TButton
    Left = 8
    Top = 175
    Width = 97
    Height = 25
    Caption = '4 - Finish Sell'
    TabOrder = 5
    OnClick = btnFinishSellClick
  end
end
