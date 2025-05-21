`include "definicao.v"

/*

Deslocador de bits que gera a chave OTP:
 
 clk -> Clock do dispositivo
 en -> Habilita ou desabilita o módulo
 seed -> Semente geradora
 out -> output gerado pelo deslocamento
 
*/
module shifter(input wire clk,
               input wire                    reset,
               input wire                    en,
               input wire [7:0]              seed,
               output wire [`TEXT_SIZE_2 - 1:0] out);

  reg [`TEXT_SIZE_2 - 1:0] shift_reg;

   always @(posedge clk or posedge reset)
     begin
        if (reset)
          shift_reg <= {`TEXT_SIZE_2{seed}};

        else if (en)
          shift_reg <= {shift_reg[`TEXT_SIZE_2 - 9 : 8], shift_reg[`TEXT_SIZE_2 - 1 : 8]};
     end

   assign out = shift_reg;

endmodule 