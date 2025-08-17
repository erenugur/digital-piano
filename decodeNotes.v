// Name: Eren Ugur

`timescale 1ns / 1ps

module decodeNotes (input [15:0] sw,    // 16 slide switches
                    output reg [17:0] freqVal,  // Frequency value
                    output reg [6:0] letter,    // Letter of musical note
                    output reg [6:0] number);   // Octave of musical note
    
    // Always block that determines the frequency value and displays 
    // the note corresponding to the active switch on the seven-segment display
    always @(sw) begin
        casez (sw)
            16'b???????????????1: begin
                                    freqVal = 18'd47778;  // Note: C6
                                    letter = 7'b0110001; // C
                                    number = 7'b0100000; // 6
                                 end
            16'b??????????????10: begin
                                    freqVal = 18'd50619;  // Note: B5 
                                    letter = 7'b1100000; // B
                                    number = 7'b0100100; // 5
                                 end
            16'b?????????????100: begin
                                    freqVal = 18'd56818;  // Note: A5
                                    letter = 7'b0001000; // A
                                    number = 7'b0100100; // 5
                                 end
            16'b????????????1000: begin
                                    freqVal = 18'd63776;  // Note: G5
                                    letter = 7'b0000100; // G
                                    number = 7'b0100100; // 5
                                 end
            16'b???????????10000: begin
                                    freqVal = 18'd71633;  // Note: F5
                                    letter = 7'b0111000; // F
                                    number = 7'b0100100; // 5
                                 end
            16'b??????????100000: begin
                                    freqVal = 18'd75843;  // Note: E5
                                    letter = 7'b0110000; // E
                                    number = 7'b0100100; // 5
                                 end
            16'b?????????1000000: begin
                                    freqVal = 18'd85131;  // Note: D5
                                    letter = 7'b1000010; // D
                                    number = 7'b0100100; // 5
                                 end
            16'b????????10000000: begin
                                    freqVal = 18'd95556;  // Note: C5
                                    letter = 7'b0110001; // C
                                    number = 7'b0100100; // 5
                                 end
            16'b???????100000000: begin
                                    freqVal = 18'd101239; // Note: B4
                                    letter = 7'b1100000; // B
                                    number = 7'b1001100; // 4
                                 end
            16'b??????1000000000: begin
                                    freqVal = 18'd113636; // Note: A4
                                    letter = 7'b0001000; // A
                                    number = 7'b1001100; // 4
                                 end
            16'b?????10000000000: begin
                                    freqVal = 18'd127552; // Note: G4
                                    letter = 7'b0000100; // G
                                    number = 7'b1001100; // 4
                                 end
            16'b????100000000000: begin
                                    freqVal = 18'd143173; // Note: F4
                                    letter = 7'b0111000; // F
                                    number = 7'b1001100; // 4
                                 end
            16'b???1000000000000: begin
                                    freqVal = 18'd151686; // Note: E4
                                    letter = 7'b0110000; // E
                                    number = 7'b1001100; // 4
                                 end
            16'b??10000000000000: begin
                                    freqVal = 18'd170262; // Note: D4
                                    letter = 7'b1000010; // D
                                    number = 7'b1001100; // 4
                                 end
            16'b?100000000000000: begin
                                    freqVal = 18'd191113; // Note: C4
                                    letter = 7'b0110001; // C
                                    number = 7'b1001100; // 4
                                 end
            16'b1000000000000000: begin
                                    // freqVal = 18'd10;     // For testbench purposes
                                    freqVal = 18'd202429; // Note: B3
                                    letter = 7'b1100000; // B
                                    number = 7'b0000110; // 3
                                 end
            default: begin
                        freqVal = 1'd0;     // No sound
                        letter = 7'b1111111; // No letter
                        number = 7'b1111111; // No octave
                     end
        endcase
    end
    
endmodule
