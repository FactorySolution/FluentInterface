unit Ocuco.View.Client;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFrmClient = class(TForm)
    EditName: TLabeledEdit;
    EditCpf: TLabeledEdit;
    Ok: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmClient: TFrmClient;

implementation

{$R *.dfm}

end.
