/* The below code contains design for 4*1 mux using 2*1 mux and test bench to check functionality*/
//2*1 mux
module mux_2(
    input a,
    input b,
    output reg out,
    input sel
    );
   //assign out=(~sel&a)|(sel&b);
   always@(*)
   begin
   case (sel)
   1:out=b;
  0:out=a;
   
   endcase
   end
endmodule
//4*1
module mux_4( 
input a,b,c,d,
input  [1:0] sel,
output  out
);
wire w1,w2;
mux_2 m1(a,b,w1,sel[0]);
mux_2 m2(c,d,w2,sel[0]);
mux_2 m3(w1,w2,out,sel[1]);
endmodule
//testbench
module mux_4tb();
reg A,B,C,D;
wire OUT;
reg [1:0] SEL;
mux_4 m1(A,B,C,D,SEL,OUT);
initial 
begin
$monitor("%time A=%d  B=%d  C=%d   D=%d",$time,A,B,C,D);
#200 $finish;
end
always begin 
A=$urandom_range(0,1);
B=$urandom_range(0,1);
C=$urandom_range(0,1);
D=$urandom_range(0,1);
SEL=$urandom_range(0,3);
#10;
end
endmodule

