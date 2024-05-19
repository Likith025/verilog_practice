//design code for full adder using two half adders
module fulladder(A,B,Cin,SUM,Cout);
    input A;
    input B;
    input Cin;
    output SUM;
    output Cout;
    
    wire w1;
    half_adder h1(A,B,w1,w2);
    half_adder h2(w1,Cin,SUM,w3);
    and a1(Cout,w2,w3);
endmodule

module half_adder(
    input a,
    input b,
    output sum,
    output carry
    );
    assign sum=a^b;
    assign carry=a&b;
endmodule

//testbench code
module fulladder_tb();
reg a,b,c;
wire sum,carry;
fulladder d1(.A(a),.B(b),.Cin(c),.SUM(sum),.Cout(carry));
//$monitor($time,"%b,%b,%b,%b",a,b,sum,carry);
initial
begin
$monitor($time,"%b ,%b ,%b ,%b ,%b ",a,b,c,sum,carry);
#150 $finish;
end
always 
begin
{a,b,c}=$urandom_range(0,7);
#10;
end
endmodule
