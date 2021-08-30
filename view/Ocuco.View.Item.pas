unit Ocuco.View.Item;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFrmItem = class(TForm)
    EditName: TLabeledEdit;
    EditValue: TLabeledEdit;
    btnOk: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmItem: TFrmItem;

implementation

{$R *.dfm}

end.
