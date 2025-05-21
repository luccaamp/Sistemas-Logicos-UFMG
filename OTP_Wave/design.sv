module xor_gate(a, b, out);
  input a, b;
  output out;
  assign out = a ^ b;
endmodule

module stream_cipher #(parameter BITS = 64)(
  input wire clk,
  input wire rst,
  input wire [BITS-1:0] message,
  input wire [BITS/2-1:0] otp,
  output reg [BITS-1:0] ciphered_message,
  output reg [BITS-1:0] deciphered_message
);

  reg [BITS-1:0] shift_register_out;

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      // Inicialização dos registros quando o sinal de reset é acionado
      ciphered_message <= 0;
      deciphered_message <= 0;
    end else begin
      // Lógica de cifragem
      shift_register_out <= message ^ {otp, {BITS/2{1'b0}}};
      ciphered_message <= shift_register_out;

      // Lógica de decifragem
      deciphered_message <= shift_register_out ^ {otp, {BITS/2{1'b0}}};
    end
  end

endmodule