// testbench Porta XOR
module xorgate_tb;
  reg A,B;
  wire Y;
  
  xor_gate xorg( .a(A), .b(B), .y(Y) );
  
  initial
    begin
       $dumpfile("dump.vcd");
  		$dumpvars(1);
    end
  
  initial
    begin
      $display("\t\tTempo, A, B, output= Y");
      $monitor($time,"  ", A, B," output= ", Y);
      
      //bit #1
      A = 1'b0;
      B = 1'b0;
      
      #1
      //bit #2
      A = 1'b1;
      B = 1'b0;
      
      #1
      //bit #3
      A = 1'b1;
      B = 1'b1;
      
      #1
      //bit #4
      A = 1'b0;
      B = 1'b0;
      
      #1
      //bit #5
      A = 1'b0;
      B = 1'b0;
      
      #3
      A = 1'b1;
      B = 1'b0;
      
      #2
      A = 1'b1;
      B = 1'b1;
      
      #2
      A = 1'b0;
      B = 1'b0;
      
      #2
      A = 1'b1;
      B = 1'b1;
      
            
      #1
      A = 1'b1;
      B = 1'b0;
      
      #1
      A = 1'b0;
      B = 1'b1;
      
      #1
      A = 1'b1;
      B = 1'b0;
      
      #1
      A = 1'b0;
      B = 1'b1;
      
      #1
      A = 1'b1;
      B = 1'b0;
      
      #1
      A = 1'b0;
      B = 1'b1;
      
      #1
      A = 1'b1;
      B = 1'b0;
      
      #1
      A = 1'b0;
      B = 1'b1;
      
      #5
      $display("fim");
    end
endmodule