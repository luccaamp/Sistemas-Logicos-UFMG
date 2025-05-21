`include "definicao.v"

module testeOneTimePad();
  integer i;
  reg [`TEXT_SIZE - 1:0] mensagem = `TEXT_0;
  wire [`TEXT_SIZE - 1:0] resultadoCifrado;
  wire [`TEXT_SIZE - 1:0] resultadoDescifrado;
  
  OneTimePad cifrador(.mensagem(mensagem),
                      .mensagemCifrada(resultadoCifrado));
  
  OneTimePad descifrador(.mensagem(resultadoCifrado),
                         .mensagemCifrada(resultadoDescifrado));
  
  initial begin
    $display("mensagem original:   %b (%0s)",  mensagem, mensagem);
    
    #1; // Aguardar um ciclo
    $display("mensagem cifrada:    %b (%0s)",  resultadoCifrado,  resultadoCifrado);
    $display("mensagem descifrada: %b (%0s)", resultadoDescifrado, resultadoDescifrado);
    $finish;
  end
  
endmodule