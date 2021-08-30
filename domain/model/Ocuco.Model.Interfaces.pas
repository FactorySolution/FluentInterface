unit Ocuco.Model.Interfaces;

interface

uses
  System.Generics.Collections;

type
  // Forward declaration
  IDisplay = interface;
  IClient = interface;
  IItens = interface;
  IAddPayment = interface;
  IPayment = interface;
  IIterator<T> = interface;

  TEvMsg = procedure(Value: string) of object;

  ISell = interface
    ['{4417B2CC-02B9-4B8D-A876-33C75E69C261}']
    function AddDisplay: IDisplay;
    function AddClient(const Value: IClient): ISell; overload;
    function AddClient: IClient; overload;
    function AddItem(const Value: IItens): ISell;
    function AddPayment: IPayment; overload;
    function AddPayment(const Value: IAddPayment): ISell; overload;
    function Itens: IIterator<IItens>;
    function Payments: IIterator<IAddPayment>;
    procedure EndSell;
  end;

  IDisplay = interface
    ['{51CCF750-96DF-42D8-9568-659C5C30EB6C}']
    function Coupon(Value: TEvMsg): IDisplay;
    function EndDisplay: ISell;
  end;

  IClient = interface
    ['{589D6AF6-A472-4839-B408-A54000041BDA}']
    function Name(const Value: string): IClient;
    function Cpf(const Value: string): IClient;
    function GetName: string;
    function GetCpf: string;

    function EndClient: ISell;
  end;

  IItens = interface
    ['{C1983979-A3BE-4B23-8A5F-1EDB7D283EF2}']
    function AddValue(const Value: Integer): IItens;
    function AddName(const Value: string): IItens;
    function GetValue: Integer;
    function GetName: string;
  end;

  IPayment = interface
    ['{E46C0A61-E68D-462C-AA68-BEBFC9DD5FCA}']
    function Add: IAddPayment;
    function ListPayments: TDictionary<string,Currency>;
    function EndPayment: ISell;
  end;

  IAddPayment = interface
    ['{28A61173-23DD-4E73-815E-5C0B3852A2C0}']
    function Value(const Value: Currency): IAddPayment;
    function PaymentType(const Value: string): IAddPayment;

    function GetValue: Currency;
    function GetPaymentType: string;

    function EndAddPayment: IPayment;
  end;

  IIterator<T>= interface
    ['{C5CDF010-FC21-42D9-A89A-30E5C457928A}']
    function Next: T;
    function HasNext: Boolean;
    function addList(const Value: TList<T>): IIterator<T>;
  end;

implementation

end.
