program FluentInterface;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {FrmMain},
  Ocuco.Model.Interfaces in 'domain\model\Ocuco.Model.Interfaces.pas',
  Ocuco.Model.Client in 'domain\model\Ocuco.Model.Client.pas',
  Ocuco.Model.Itens in 'domain\model\Ocuco.Model.Itens.pas',
  Ocuco.Model.Payment in 'domain\model\Ocuco.Model.Payment.pas',
  Ocuco.Model.Sell in 'domain\model\Ocuco.Model.Sell.pas',
  Ocuco.Model.Itens.Iterator in 'domain\model\Ocuco.Model.Itens.Iterator.pas',
  Ocuco.View.Client in 'view\Ocuco.View.Client.pas' {FrmClient},
  Ocuco.View.Item in 'view\Ocuco.View.Item.pas' {FrmItem},
  Ocuco.View.Payment in 'view\Ocuco.View.Payment.pas' {FrmPayment};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
