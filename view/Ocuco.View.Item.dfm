object FrmItem: TFrmItem
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Item'
  ClientHeight = 163
  ClientWidth = 261
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object EditName: TLabeledEdit
    Left = 16
    Top = 23
    Width = 201
    Height = 21
    EditLabel.Width = 27
    EditLabel.Height = 13
    EditLabel.Caption = 'Name'
    TabOrder = 0
  end
  object EditValue: TLabeledEdit
    Left = 16
    Top = 67
    Width = 105
    Height = 21
    EditLabel.Width = 26
    EditLabel.Height = 13
    EditLabel.Caption = 'Value'
    NumbersOnly = True
    TabOrder = 1
  end
  object btnOk: TButton
    Left = 96
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Ok'
    ModalResult = 1
    TabOrder = 2
  end
end
