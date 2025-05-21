`include "definicao.v"
`include "shifter.v"

module TesteOneTimePad;
  reg clk;
  reg reset;
  reg enable;
  reg [7:0] seed;
  reg [`TEXT_SIZE_2 - 1 : 0] mensagem;
  wire [`TEXT_SIZE_2 - 1 : 0] resultadoCifrado;
  wire [`TEXT_SIZE_2 - 1 : 0] resultadoDescifrado;
  wire [`TEXT_SIZE_2 - 1 : 0] otp_out;
  
  // Instanciando shifter register
  shifter sh (.clk(clk), .reset(reset), .en(enable), .seed(seed), .out(otp_out));
  
  // Instanciando OneTimePad
  OneTimePad cifrador (.clk(clk), .otp(otp_out), .mensagem(mensagem), .resultadoCifrado(resultadoCifrado));
  
  OneTimePad descifrador (.clk(clk), .otp(otp_out), .mensagem(resultadoCifrado), .resultadoCifrado(resultadoDescifrado));
  
  
  initial
    begin
      clk = 0;
      reset = 1;
      enable = 1;
      seed = 8'b00110011;

      #3 reset = 0;
      enable = 1;
       
       
      mensagem = `TEXT_2;
      #10 $finish;
    end

  always @(posedge clk)
    begin
      $display("mensagem (em texto): \n%s\n", mensagem);
      $display("mensagem cifrada (em texto): %s\n", resultadoCifrado);
      $display("mensagem descifrada (em texto): \n%s", resultadoDescifrado);
  end

   always
     begin
        #10 clk = !clk;
     end

   initial
     begin
        $dumpfile("waveform.vcd");
        $dumpvars();
        #5 reset = 0;
        #5 enable = 1;
     end

endmodule