module Teste_One_Time_Pad #(parameter BITS = 64);
  
  // Mensagem de entrada e chave OTP:
  
  // Mensagem de 64 bits "trabalho"em ASCII
  reg [BITS-1:0] in = 64'b0111010001110010011000010110001001100001011011000110100001101111;
  
  // chave de 32 bits
  reg [BITS/2-1:0] otp = 32'b01100011011010010110111001100011;
  reg a, b;
  wire out;
  xor_gate xorg(.a(a), .b(b), .out(out));

  // Variáveis para armazenar a mensagem cifrada e decifrada
  reg [BITS-1:0] ciphered_message;
  reg [BITS-1:0] deciphered_message;

  // Inicialização para a geração de waveform
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1, a, b, out, ciphered_message, deciphered_message);
  end

  integer i;
  integer bits_per_group = 8;
  integer bits_counter = 0;

  // Processo de cifragem e decifragem
  initial begin
    $display("mensagem = %b (%s)", in, in);
    $display("chave = %b", otp);
    $display("mensagem cifrada = ");
    for(i = BITS-1; i >= 0; i = i - 1) begin
      a = in[i];
      b = (i >= BITS/2) ? otp[i-BITS/2] : otp[i];
      #1
      $write(out);

      // Armazena a mensagem cifrada
      ciphered_message[i] = out;

      bits_counter = bits_counter + 1;

      if (bits_counter == bits_per_group) begin
        //$write(" ");
        bits_counter = 0;
      end
    end

    $write("\n");

    // Exibe a mensagem decifrada
    $display("mensagem decifrada = ");
    for (i = BITS-1; i >= 0; i = i - 1) begin
      a = ciphered_message[i];
      b = (i >= BITS/2) ? otp[i-BITS/2] : otp[i];
      #1
      $write(out);

      // Armazena a mensagem decifrada
      deciphered_message[i] = out;

      bits_counter = bits_counter + 1;

      if (bits_counter == bits_per_group) begin
        //$write(" ");
        bits_counter = 0;
      end
    end
    
    $display("(%s)", deciphered_message);
    $finish();
  end
endmodule