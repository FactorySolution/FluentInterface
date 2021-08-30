object FrmPayment: TFrmPayment
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Payment'
  ClientHeight = 156
  ClientWidth = 269
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
  object EditPaymentType: TLabeledEdit
    Left = 8
    Top = 32
    Width = 177
    Height = 21
    EditLabel.Width = 69
    EditLabel.Height = 13
    EditLabel.Caption = 'Payment Type'
    TabOrder = 0
  end
  object EditValue: TLabeledEdit
    Left = 8
    Top = 72
    Width = 105
    Height = 21
    EditLabel.Width = 26
    EditLabel.Height = 13
    EditLabel.Caption = 'Value'
    NumbersOnly = True
    TabOrder = 1
  end
  object BtnOk: TButton
    Left = 94
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Ok'
    ModalResult = 1
    TabOrder = 2
  end
end
