//ripple carry adder is designed using halfadder and fulladder designed earlier
module ripple_4(
    input [3:0] a,
    input [3:0] b,
    //input cin,
    output [3:0] sum,
    output carry
    );
    wire w1,w2,w3;
    fulladder f1(a[0],b[0],1'b0,sum[0],w1);
    fulladder f2(a[1],b[1],w1,sum[1],w2);
    fulladder f3(a[2],b[2],w2,sum[2],w3);
    fulladder f4(a[3],b[3],w3,sum[3],carry);
endmodule
//testbench to check functionality
module ripple_tb();
wire [3:0]sum;
wire carry;
reg [3:0]A,B;
ripple_4 r1(A,B,sum,carry);
initial
begin
$monitor("time=%0d,A=%d,B=%d,SUM=%d,carry=%d",$time,A,B,sum,carry);
#200;
$finish;

end
always 
begin
#10;A=$urandom_range(0,15);
B=$urandom_range(0,15);
end
endmodule
