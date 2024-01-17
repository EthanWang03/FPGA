module D_Flip_Flip
    // 25 mega hertz clock
    (input i_Clk,
    input i_Switch_1,
    output o_LED_1);

    reg r_LED_1 = 1'b0;
    reg r_Switch_1 = 1'b0;
    wire w_Switch_1;

    Debounce_Switch Instance
        (.i_Clk(i_Clk),
        .i_Switch(i_Switch_1),
        .o_Switch(w_Switch_1));

    // Falling edge clock
    always @(posedge i_Clk) begin

        // w_Switch_1 is i_Switch_1 after it is debounced
        r_Switch_1 <= w_Switch_1; // Creates a Register

        // if i_Switch_1 is low and r_Switch_1 is high
        // detects falling edge
        if(w_Switch_1 == 1'b0 && r_Switch_1 == 1'b1) begin

            // inverse the value of r_LED_1
            r_LED_1 <= ~r_LED_1;
        end
    end

    assign o_LED_1 = r_LED_1;

endmodule