unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,

  Ocuco.Model.Interfaces;

type
  TFrmMain = class(TForm)
    mmCoupon: TMemo;
    btnSell: TButton;
    btnAddClient: TButton;
    btnAddItem: TButton;
    btnAddPayment: TButton;
    btnFinishSell: TButton;
    procedure btnSellClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAddClientClick(Sender: TObject);
    procedure btnAddItemClick(Sender: TObject);
    procedure btnAddPaymentClick(Sender: TObject);
    procedure btnFinishSellClick(Sender: TObject);
  private
    { Private declarations }
    FSell: ISell;
    procedure doCoupon(Value: string);
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

uses
  Ocuco.Model.Sell,
  Ocuco.Model.Itens,
  Ocuco.View.Client,
  Ocuco.View.Item,
  Ocuco.View.Payment,
  Ocuco.Model.Client,
  Ocuco.Model.Payment;

{$R *.dfm}

procedure TFrmMain.btnAddItemClick(Sender: TObject);
var
  LFrmItem: TFrmItem;
begin
  LFrmItem := TFrmItem.Create(nil);
  try
    if LFrmItem.ShowModal = mrOk then
    begin
      FSell.AddItem(TItens.New.
        AddValue(StrToIntDef(LFrmItem.EditValue.Text, 0)).
        AddName(LFrmItem.EditName.Text));
    end;
  finally
    FreeAndNil(LFrmItem);
  end;
end;

procedure TFrmMain.btnAddPaymentClick(Sender: TObject);
var
  LFrmPayment: TFrmPayment;
begin
  LFrmPayment := TFrmPayment.Create(nil);
  try
    if LFrmPayment.ShowModal = mrOk then
    begin
      FSell.AddPayment(
        TPayment.New.
          Add.
            Value(StrToIntDef(LFrmPayment.EditValue.Text, 0)).
            PaymentType(LFrmPayment.EditPaymentType.Text)
        );
    end;
  finally
    FreeAndNil(LFrmPayment);
  end;
end;

procedure TFrmMain.btnFinishSellClick(Sender: TObject);
begin
  FSell.EndSell;
end;

procedure TFrmMain.btnSellClick(Sender: TObject);
begin
  TSell.New
    .AddDisplay
      .Coupon(doCoupon)
    .EndDisplay
    .AddClient.
      Name('Oliveira').
      Cpf('1233445').
    EndClient
    .AddItem(TItens.New.AddValue(10).AddName('Andre'))
    .AddItem(TItens.New.AddValue(5).AddName('Luiz'))
    .AddItem(TItens.New.AddValue(2).AddName('Oliveira'))
    .AddPayment
      .Add
        .Value(10)
        .PaymentType('Cash')
      .EndAddPayment
      .Add
        .Value(15)
        .PaymentType('CreditCard')
      .EndAddPayment
      .Add
        .Value(15)
        .PaymentType('Ticket')
      .EndAddPayment
    .EndPayment
    .EndSell;
end;

procedure TFrmMain.btnAddClientClick(Sender: TObject);
var
  FClient: TFrmClient;
begin
  FClient := TFrmClient.Create(nil);
  try
    if FClient.ShowModal = mrOk then
    begin
      FSell.
        AddClient(TClient.
          New.
            Name(FClient.EditName.Text).
            Cpf(FClient.EditCpf.Text)
          );
    end;
  finally
    FreeAndNil(FCLient);
  end;
end;

procedure TFrmMain.doCoupon(Value: string);
begin
  mmCoupon.Lines.Add(Value);
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  FSell := TSell.New.AddDisplay.Coupon(doCoupon).EndDisplay;
end;

end.
