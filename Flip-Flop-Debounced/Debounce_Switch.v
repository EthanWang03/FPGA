module Debounce_Switch
    (input i_Clk,
    input i_Switch,
    output o_Switch);

    parameter c_DEBOUNCE_LIMIT = 250000; // 10ms at 25MHz

    reg r_State = 1'b0;

    // 17 down to 0
    // 18 bit counter
    reg [17:0] r_Count = 0;

    always @(posedge i_Clk)
        begin
            // i_Switch is unfiltered 
            // r_State is filtered
            // if unfiltered != filtered then the switch is toggling 

            // wait 10ms between switch updates debouncing the switch 

            if (i_Switch !== r_State && r_Count < c_DEBOUNCE_LIMIT)
                begin
                    r_Count <= r_Count + 1; // Counter
                end
            
            else if (r_Count == c_DEBOUNCE_LIMIT)
                begin
                    r_Count <= 0;
                    r_State <= i_Switch;
                end
            
            else
                begin
                    r_Count <= 0;
                end
        end

    assign o_Switch = r_State;

endmodule