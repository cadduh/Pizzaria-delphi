unit consulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.jpeg;

type
  TForm1 = class(TForm)
    background: TPanel;
    nomeTLabel: TLabel;
    nomeTEdit: TEdit;
    enderecoTEdit: TEdit;
    enderecoTLabel: TLabel;
    telefoneTEdit: TEdit;
    telefoneTLabel: TLabel;
    dadosDoClienteTLabel: TLabel;
    pedidosTLabel: TLabel;
    calabresaTCheckBox: TCheckBox;
    frangoCatupiryTCheckbox: TCheckBox;
    portuguesaTCheckBox: TCheckBox;
    mussarelaTCheckBox: TCheckBox;
    saboresTLabel: TLabel;
    brotoTCheckBox: TCheckBox;
    tamanhoNormalTCheckBox: TCheckBox;
    tamanhoTLabel: TLabel;
    bordaNormalTCheckBox: TCheckBox;
    bordaTLabel: TLabel;
    recheadaTCheckBox: TCheckBox;
    procurarButton: TButton;
    Button1: TButton;
    totalLabel: TLabel;
    Image1: TImage;
    procedure procurarButtonClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public

  end;

var
  Form1: TForm1;
  total,calabresaValor,mussarelaValor,portuguesaValor,frangoCatupiry,brotoValor,recheadaValor,quantidadePizza: double;

implementation

{$R *.dfm}

uses formulario, calc;


procedure TForm1.Button1Click(Sender: TObject);
begin
  calculadora1 := Tcalculadora1.Create(self);
  calculadora1.Show;
end;

procedure TForm1.procurarButtonClick(Sender: TObject);
begin
   calabresaValor := 40.00;
   mussarelaValor := 38.00;
   portuguesaValor := 41.00;
   frangoCatupiry  := 41.00;
   brotoValor := (40*2)/3;
   recheadaValor := 5.00;

   if Cadastro.calabresa then begin
      calabresaTCheckBox.Checked := true;
      total := total + calabresaValor;
      quantidadePizza := quantidadePizza + 1;
   end;
   if Cadastro.mussarela then begin
      mussarelaTCheckBox.Checked := true;
      total := total + mussarelaValor;
      quantidadePizza := quantidadePizza + 1;
   end;
   if Cadastro.portuguesa then begin
      portuguesaTCheckBox.Checked := true;
      total := total + portuguesaValor;
   end;
   if Cadastro.frangoCatupiry then begin
      frangoCatupiryTCheckbox.Checked := true;
      total := total + frangoCatupiry;
   end;
   if Cadastro.normalTamanho then begin
      tamanhoNormalTCheckBox.Checked := true;
   end;
   if Cadastro.broto then begin
       brotoTCheckBox.Checked := true;
   end;
   if Cadastro.normalBorda then begin
       bordaNormalTCheckBox.Checked := true;
   end;
   if Cadastro.recheada then begin
       recheadaTCheckBox.Checked := true;
       total := total + recheadaValor;
   end;

   nomeTEdit.Text := Cadastro.nomeDoCliente;
   telefoneTEdit.Text := Cadastro.telefoneDoCliente;
   enderecoTEdit.Text := Cadastro.endereco;

   totalLabel.Caption := 'Total :'+ floatToStr(total);
end;

end.
