
`timescale 1ns/1ps

module tb_rca;

    reg clk;
    reg reset;
    reg [7:0] num1;
    reg [7:0] num2;
    wire [8:0] sum_out;

    rca uut (
        .num1(num1),
        .num2(num2),
        .sum_out(sum_out)
    );

    // Clock for waveform demonstration
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("rca.vcd");
        $dumpvars(0, tb_rca);

        $display("Time | Num1 | Num2 | Sum | Result");

        reset = 1;
        num1 = 0;
        num2 = 0;

        #10 reset = 0;

        num1 = 8'd10;
        num2 = 8'd20;
        #10;
        check_result();

        num1 = 8'd50;
        num2 = 8'd75;
        #10;
        check_result();

        num1 = 8'd100;
        num2 = 8'd155;
        #10;
        check_result();

        num1 = 8'd200;
        num2 = 8'd100;
        #10;
        check_result();

        num1 = 8'd255;
        num2 = 8'd255;
        #10;
        check_result();

        $finish;
    end

    task check_result;
        begin
            if (sum_out === ({1'b0, num1} + {1'b0, num2}))
                $display("%0t | %d | %d | %d | PASS",
                         $time, num1, num2, sum_out);
            else
                $display("%0t | %d | %d | %d | FAIL",
                         $time, num1, num2, sum_out);
        end
    endtask

endmodule
