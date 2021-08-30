unit Ocuco.Model.Client;

interface

uses
  Ocuco.Model.Interfaces;

type
  TClient = class(TInterfacedObject, IClient)
  private
    [weak]
    FParent: ISell;
    FName: string;
    FCpf: string;
  public
    constructor Create; overload;
    constructor Create(const Parent: ISell); overload;

    destructor Destroy; override;

    class function New: IClient; overload;
    class function New(const Parent: ISell): IClient; overload;

    function Name(const Value: string): IClient;
    function Cpf(const Value: string): IClient;

    function EndClient: ISell;

    function GetName: string;
    function GetCpf: string;
  end;

implementation

{ TClient }

function TClient.EndClient: ISell;
begin
  Result := FParent;
end;

function TClient.Cpf(const Value: string): IClient;
begin
  Result := Self;
  FCpf := Value;
end;

constructor TClient.Create;
begin

end;

constructor TClient.Create(const Parent: ISell);
begin
  FParent := Parent;
end;

destructor TClient.Destroy;
begin

  inherited;
end;

function TClient.GetCpf: string;
begin
  Result := FCpf;
end;

function TClient.GetName: string;
begin
  Result := FName;
end;

function TClient.Name(const Value: string): IClient;
begin
  Result := Self;
  FName := Value;
end;

class function TClient.New(const Parent: ISell): IClient;
begin
  Result := Self.Create(Parent);
end;

class function TClient.New: IClient;
begin
  Result := Self.Create;
end;

end.
