unit Ocuco.Model.Itens;

interface

uses
  System.Generics.Collections,
  Ocuco.Model.Interfaces;

type
  TItens = class(TInterfacedObject, IItens)
  private
    FValue: Integer;
    FName: string;
  public
    constructor Create;
    destructor Destroy; override;

    class function New: IItens;

    function AddValue(const Value: Integer): IItens;
    function AddName(const Value: string): IItens;
    function GetValue: Integer;
    function GetName: string;

  end;

implementation

{ TItens }

function TItens.AddName(const Value: string): IItens;
begin
  Result := Self;
  FName := Value;
end;

function TItens.AddValue(const Value: Integer): IItens;
begin
  Result := Self;
  FValue := Value;
end;

constructor TItens.Create;
begin
  FName  := '';
  FValue := 0;
end;

destructor TItens.Destroy;
begin

  inherited;
end;

function TItens.GetName: string;
begin
  Result := FName;
end;

function TItens.GetValue: Integer;
begin
  Result := FValue;
end;

class function TItens.New: IItens;
begin
  Result := Self.Create;
end;

end.
