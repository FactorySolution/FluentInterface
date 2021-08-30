unit Ocuco.Model.Payment;

interface

uses
  System.Generics.Collections,
  Ocuco.Model.Interfaces;

type
  TPayment = class(TInterfacedObject, IPayment, IAddPayment)
  private
    [weak]
    FParent: ISell;
    FPayment: TDictionary<string, Currency>;
    FValue: Currency;
    FPaymentType: string;
  public
    constructor Create(const Parent: ISell); overload;
    constructor Create; overload;

    destructor Destroy; override;

    class function New(const Parent: ISell): IPayment; overload;
    class function New: IPayment; overload;

    // IPayment
    function Add: IAddPayment;
    function ListPayments: TDictionary<string,Currency>;
    function EndPayment: ISell;

    // IPayments
    function PaymentType(const Value: string): IAddPayment;
    function Value(const Value: Currency): IAddPayment;
    function EndAddPayment: IPayment;
    function GetValue: Currency;
    function GetPaymentType: string;
  end;

implementation

{ TPayment }

function TPayment.Add: IAddPayment;
begin
  Result := Self;
end;

constructor TPayment.Create(const Parent: ISell);
begin
  FPayment := TDictionary<string, Currency>.Create;
  FParent := Parent;
end;

constructor TPayment.Create;
begin
  Create(nil);
end;

destructor TPayment.Destroy;
begin
  FPayment.Free;
  inherited;
end;

function TPayment.EndPayment: ISell;
begin
  Result := FParent;
end;

function TPayment.GetPaymentType: string;
begin
  Result := FPaymentType;
end;

function TPayment.GetValue: Currency;
begin
  Result := FValue;
end;

function TPayment.EndAddPayment: IPayment;
begin
  Result := Self;
  FPayment.Add(FPaymentType, FValue);
end;

function TPayment.ListPayments: TDictionary<string, Currency>;
begin
  Result := FPayment;
end;

class function TPayment.New: IPayment;
begin
  Result := Self.Create;
end;

class function TPayment.New(const Parent: ISell): IPayment;
begin
  Result := Self.Create(Parent);
end;

function TPayment.PaymentType(const Value: string): IAddPayment;
begin
  Result := Self;
  FPaymentType := Value;
end;

function TPayment.Value(const Value: Currency): IAddPayment;
begin
  Result := Self;
  FValue := Value;
end;

end.
