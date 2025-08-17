// Name: Eren Ugur

`timescale 1ns / 1ps

module SRAMControl(input CLK,   // 100 MHz clock
                   input [12:0] address,    // 13-bit address
                   input [31:0] dataIn,
                   input writeEnable,
                   input requestCE,
                   output reg [31:0] dataOut,
                   output reg CE);

    reg [31:0] memory [0:8191];  // 32-bit wide * 8192 entries (the SRAM I chose has 8K = 8192 addresses)

    always @(posedge CLK) begin     // CITATION: I used ChatGPT for this Always block
        // Activating CE
        if (requestCE) begin
            CE <= 1'b1;
        end
        else begin
            CE <= 1'b0;
        end
    
        if (writeEnable) begin
            memory[address[12:0]] <= dataIn;  // Write operation
        end
        dataOut <= memory[address[12:0]];  // Read operation
    end
endmodule
