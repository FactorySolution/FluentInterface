unit Ocuco.View.Payment;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFrmPayment = class(TForm)
    EditPaymentType: TLabeledEdit;
    EditValue: TLabeledEdit;
    BtnOk: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPayment: TFrmPayment;

implementation

{$R *.dfm}

end.
