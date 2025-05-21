/**
 * flip-flop D síncrono:
 * clk -> Clock do dispositivo
 * en -> Habilita ou desabilita o flip-flop 
 * d -> Entrada de dados
 * q -> Saída de dados
*/
module ff_d_sinc(input wire clk,
                 input wire en,
                 input wire reset,
                 input wire d,
                 output reg q);

   always @(posedge clk)
     begin
        if (reset)
          q <= 1'b0;

        else if (en)
          q <= d;
     end

endmodule