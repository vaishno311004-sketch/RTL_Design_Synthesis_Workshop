
module rca (
    input  [7:0] num1,
    input  [7:0] num2,
    output [8:0] sum_out
);

    wire [8:0] carry;
    assign carry[0] = 1'b0;

    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin : adder
            assign sum_out[i] = num1[i] ^ num2[i] ^ carry[i];

            assign carry[i+1] =
                (num1[i] & num2[i]) |
                (carry[i] & (num1[i] ^ num2[i]));
        end
    endgenerate

    assign sum_out[8] = carry[8];

endmodule
