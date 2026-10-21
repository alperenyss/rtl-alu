module alu4 (
    input  logic [3:0] a,
    input  logic [3:0] b,
    input  logic [2:0] op,
    output logic [3:0] y,
    output logic       zero,
    output logic       carry,
    output logic       borrow
);

    localparam logic [2:0] OP_ADD = 3'b000;
    localparam logic [2:0] OP_SUB = 3'b001;
    localparam logic [2:0] OP_AND = 3'b010;
    localparam logic [2:0] OP_OR  = 3'b011;
    localparam logic [2:0] OP_XOR = 3'b100;

    logic [4:0] full_result;

    always_comb begin
        y           = 4'b0000;
        full_result = 5'b00000;
        carry       = 1'b0;
        borrow      = 1'b0;

        case (op)
            OP_ADD: begin
                full_result = {1'b0, a} + {1'b0, b};
                y           = full_result[3:0];
                carry       = full_result[4];
            end
            OP_SUB: begin
                y      = a - b;
                borrow = (a < b);
            end
            OP_AND: y = a & b;
            OP_OR:  y = a | b;
            OP_XOR: y = a ^ b;
            default: y = 4'b0000;
        endcase

        zero = (y == 4'b0000);
    end

endmodule
