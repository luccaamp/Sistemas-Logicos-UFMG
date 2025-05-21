`include "definicao.v"

module OneTimePad (
  input wire clk,
  input wire [`TEXT_SIZE_2 - 1 : 0]  otp,
  input wire [`TEXT_SIZE_2 - 1 : 0]  mensagem,
  output wire [`TEXT_SIZE_2 - 1 : 0] resultadoCifrado
);

   assign resultadoCifrado = mensagem ^ otp;

endmodule
