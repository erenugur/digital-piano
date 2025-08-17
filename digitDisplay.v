// Name: Eren Ugur

`timescale 1ns / 1ps

module digitDisplay(input CLK,  // 100 MHz clock
                    input [6:0] letter,     // Letter of musical note
                    input [6:0] number,     // Octave of musical note
                    output reg [3:0] select,    // Used for selecting digit on 7 segment display
                    output reg [6:0] segments); // Represents the segments of a single digit

    reg digitIndex = 0;
    reg [19:0] msCounter = 0;

    // Always block that displays digits on 7 segment display 
    always @(posedge CLK) begin
        // 5 ms delay between presenting the letter & octave
        if (msCounter == 499999) begin
            if (digitIndex == 0) begin
                digitIndex <= 1;
            end
            else begin
                digitIndex <= 0;
            end
            msCounter <= 0;
        end
        else begin
            msCounter <= msCounter + 1;
        end
        
        // Case statement that chooses whether to display number (octave) or letter
        case(digitIndex)
            1'b0: begin
                    select <= 4'b1110;
                    segments <= number;
                  end
            1'b1: begin
                    select <= 4'b1101;
                    segments <= letter;
                  end
        endcase
    end
endmodule
