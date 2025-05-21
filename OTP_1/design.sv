`include "definicao.v"

module OneTimePad(
  input [`TEXT_SIZE - 1:0] mensagem,
  output wire [`TEXT_SIZE - 1:0] mensagemCifrada
);
  reg [`CHAVE_SIZE - 1:0] cifra = `CHAVE;
  
  assign mensagemCifrada = mensagem ^ cifra;
endmodule
