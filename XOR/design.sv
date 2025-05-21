// Porta XOR
module xor_gate (a,b,y);
  input a,b;
  output y;
  
  // estrutural:
  wire      abar, bbar, t1, t2;
  not invA (abar, a);
  not invB (bbar, b);
  and and1 (t1, a, bbar);
  and and2 (t2, b, abar);
  or  or1 (y, t1, t2);

  // comportamental
  //assign y=a^b;
endmodule