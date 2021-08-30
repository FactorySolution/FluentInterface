unit Ocuco.Model.Itens.Iterator;

interface

uses
  System.Generics.Collections,
  Ocuco.Model.Interfaces;

type
  TItensIterator = class(TInterfacedObject, IIterator<IItens>)
  private
    FCount: Integer;
    FList: TList<IItens>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IIterator<IItens>;

    function HasNext: Boolean;
    function Next: IItens;
    function addList(const Value: TList<IItens>): IIterator<IItens>;

  end;

  TPaymentIterator = class(TInterfacedObject, IIterator<IAddPayment>)
  private
    FCount: Integer;
    FList: TList<IAddPayment>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IIterator<IAddPayment>;

    function HasNext: Boolean;
    function Next: IAddPayment;
    function addList(const Value: TList<IAddPayment>): IIterator<IAddPayment>;

  end;

implementation

{ TItensIterator }

function TItensIterator.addList(const Value: TList<IItens>): IIterator<IItens>;
begin
  Result := Self;
  FList := Value;
end;

constructor TItensIterator.Create;
begin
  FCount := 0;
end;

destructor TItensIterator.Destroy;
begin

  inherited;
end;

function TItensIterator.HasNext: Boolean;
begin
  Result := not (FCount = FList.Count);
end;

class function TItensIterator.New: IIterator<IItens>;
begin
  Result := Self.Create;
end;

function TItensIterator.Next: IItens;
begin
  Result := FList[FCount];
  Inc(FCount);
end;


{ TPaymentIterator }

function TPaymentIterator.addList(
  const Value: TList<IAddPayment>): IIterator<IAddPayment>;
begin
  Result := Self;
  FList := Value;
end;

constructor TPaymentIterator.Create;
begin
  FCount := 0;
end;

destructor TPaymentIterator.Destroy;
begin

  inherited;
end;

function TPaymentIterator.HasNext: Boolean;
begin
  Result := not (FCount = FList.Count);
end;

class function TPaymentIterator.New: IIterator<IAddPayment>;
begin
  Result := Self.Create;
end;

function TPaymentIterator.Next: IAddPayment;
begin
  Result := FList[FCount];
  Inc(FCount);
end;

end.
