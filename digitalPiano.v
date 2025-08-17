// Name: Eren Ugur

`timescale 1ns / 1ps

module digitalPiano (input CLK,             // 100 MHz clock
                     input [15:0] sw,       // 16 Switches
                     output audioOut,         // Audio output
                     output [3:0] select,       // Used to select 1 of the 4 digits on the seven-segment display
                     output [6:0] segments);    // Represents the actual 1-digit output value

    wire [17:0] freqVal;    // Frequency value
    wire [6:0] letter;      // Letter of musical note
    wire [6:0] number;      // Octave of musical note

    decodeNotes DUT1 (.sw(sw),              // Instance of decodeNotes module
                      .freqVal(freqVal),
                      .letter(letter),
                      .number(number));

    generatePWM DUT2 (.CLK(CLK),            // Instance of generatePWM module
                      .sw(sw),
                      .freqVal(freqVal),
                      .audioOut(audioOut));
    
    digitDisplay DUT3 (.CLK(CLK),           // Instance of digitDisplay module
                       .letter(letter),
                       .number(number),
                       .select(select),
                       .segments(segments));

endmodule
