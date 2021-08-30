unit Ocuco.Model.Sell;

interface

uses
  Ocuco.Model.Interfaces,
  System.Generics.Collections;

type
  TSell = class(TInterfacedObject, ISell, IDisplay)
  private
    FMsgDisplay: TEvMsg;

    FItens: TList<IItens>;
    FPayments: TList<IAddPayment>;

    FItensIterator: IIterator<IItens>;
    FPaymentIterator: IIterator<IAddPayment>;

    // To use on the same Context or Method;
    FPayment: IPayment;
    FClient: IClient;
    procedure doMsg(const Value: string);
  public
    constructor Create;
    destructor Destroy; override;

    class function New: ISell;
    // ISell
    function AddDisplay: IDisplay;
    function AddClient(const Value: IClient): ISell; overload;
    function AddClient: IClient; overload;
    function AddItem(const Value: IItens):ISell;
    function Itens: IIterator<IItens>;
    function Payments: IIterator<IAddPayment>;
    function AddPayment: IPayment; overload;
    function AddPayment(const Value: IAddPayment): ISell; overload;
    procedure EndSell;


    // IDisplay
    function Coupon(Value: TEvMsg): IDisplay;
    function EndDisplay: ISell;

  end;

implementation

uses
  Ocuco.Model.Client,
  Ocuco.Model.Itens,
  Ocuco.Model.Payment,
  Ocuco.Model.Itens.Iterator,

  System.SysUtils;

{ TSell }

function TSell.AddClient: IClient;
begin
  FClient := TClient.New(Self);
  Result := FClient;
end;

function TSell.AddItem(const Value: IItens): ISell;
begin
  Result := Self;
  FItens.Add(Value);
end;

function TSell.AddPayment(const Value: IAddPayment): ISell;
begin
  Result := Self;
  FPayments.Add(value);
end;

function TSell.AddClient(const Value: IClient): ISell;
begin
  Result := Self;
  FClient := Value;
end;

function TSell.Coupon(Value: TEvMsg): IDisplay;
begin
  Result := Self;
  FMsgDisplay := Value;
end;

constructor TSell.Create;
begin
  FItensIterator   := TItensIterator.New;
  FPaymentIterator := TPaymentIterator.New;
  FItens    := TList<IItens>.Create;

  FPayments := TList<IAddPayment>.Create;
end;

destructor TSell.Destroy;
begin
  FreeAndNil(FItens);
  FreeAndNil(FPayments);
  inherited;
end;

function TSell.AddDisplay: IDisplay;
begin
  Result := Self;
end;

procedure TSell.doMsg(const Value: string);
begin
  if Assigned(FMsgDisplay) then
    FMsgDisplay(Value);
end;

function TSell.EndDisplay: ISell;
begin
  Result := Self;
end;

procedure TSell.EndSell;
var
  PaymentType: TPair<string, Currency>;
  LItem: IItens;
  LPayment: IAddPayment;
begin
  if Assigned(FClient) then
  begin
    doMsg('Client');
    doMsg('Name: ' + FClient.GetName);
    doMsg('Cpf: ' + FClient.GetCpf);
  end;

  while Self.Itens.HasNext do
  begin
    LItem := Self.Itens.Next;
    doMsg(Format('Item: %s | Value %d', [LItem.GetName, LItem.GetValue]));
  end;

  if Assigned(FPayment) then
  begin
    for PaymentType in FPayment.ListPayments do
      doMsg(Format('%s : %s',[PaymentType.Key, FormatCurr('R$ #,##0.00' ,PaymentType.Value)]));
  end else
  begin
    while Self.Payments.HasNext do
    begin
      LPayment := Self.Payments.Next;
      doMsg(Format('%s : %s',[LPayment.GetPaymentType, FormatCurr('R$ #,##0.00' ,LPayment.GetValue)]));
    end;
  end;
end;

function TSell.Itens: IIterator<IItens>;
begin
  Result := FItensIterator.addList(FItens);
end;

class function TSell.New: ISell;
begin
  Result := Self.Create;
end;

function TSell.Payments: IIterator<IAddPayment>;
begin
  Result := FPaymentIterator.addList(FPayments);
end;

function TSell.AddPayment: IPayment;
begin
  FPayment := TPayment.New(Self);
  Result := FPayment;
end;

end.
