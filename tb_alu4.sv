module tb_alu4;

    logic [3:0] a;
    logic [3:0] b;
    logic [2:0] op;
    logic [3:0] y;
    logic       zero;
    logic       carry;
    logic       borrow;

    alu4 dut (
        .a(a),
        .b(b),
        .op(op),
        .y(y),
        .zero(zero),
        .carry(carry),
        .borrow(borrow)
    );

    task automatic check_result(
        input logic [3:0] expected_y,
        input logic       expected_zero,
        input logic       expected_carry,
        input logic       expected_borrow
    );
        #1;
        if ({y, zero, carry, borrow} !==
            {expected_y, expected_zero, expected_carry, expected_borrow}) begin
            $error("FAIL op=%b a=%h b=%h: y=%h zero=%b carry=%b borrow=%b",
                   op, a, b, y, zero, carry, borrow);
            $fatal;
        end
    endtask

    initial begin
        a = 4'd15; b = 4'd1; op = 3'b000;
        check_result(4'd0, 1'b1, 1'b1, 1'b0); 

        a = 4'd3; b = 4'd5; op = 3'b001;
        check_result(4'd14, 1'b0, 1'b0, 1'b1);

        a = 4'b1100; b = 4'b1010; op = 3'b010;
        check_result(4'b1000, 1'b0, 1'b0, 1'b0); // AND

        a = 4'b1100; b = 4'b1010; op = 3'b011;
        check_result(4'b1110, 1'b0, 1'b0, 1'b0); // OR

        a = 4'b1100; b = 4'b1010; op = 3'b100;
        check_result(4'b0110, 1'b0, 1'b0, 1'b0); // XOR

        a = 4'd7; b = 4'd7; op = 3'b001;
        check_result(4'd0, 1'b1, 1'b0, 1'b0); // zero result

        $display("PASS: all ALU checks completed");
        $finish;
    end

endmodule
