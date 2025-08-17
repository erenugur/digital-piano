// Name: Eren Ugur

`timescale 1ns / 1ps

module generatePWM (input CLK,          // 100 MHz clock
                    input [15:0] sw,
                    input [17:0] freqVal,   // Frequency
                    output audioOut);     // Audio output

    reg [18:0] freqCounter = 0;       // Counter for PWM
    reg audioOut2 = 0;         // Register variable for holding value for audio output

    always @(posedge CLK) begin
        if (sw != 16'd0) begin
            freqCounter <= freqCounter + 1;
            if (freqCounter >= freqVal) begin
                freqCounter <= 0;
                audioOut2 <= ~audioOut2;    // Toggles audioOut2 to create a 50% square PWM wave
            end
        end
        else begin
            freqCounter <= 0;
            audioOut2 <= 0;
        end
    end

    assign audioOut = audioOut2;  
endmodule

