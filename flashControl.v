// Name: Eren Ugur

`timescale 1ns / 1ps

module flashControl(input CLK,   // 100 MHz
                    input [20:0] address,    // 21-bit address
                    input [31:0] dataIn,
                    input writeEnable,
                    input requestCE,
                    output reg [31:0] dataOut,
                    output reg CE);

    reg [31:0] memory [0:2097151]; // 32-bit wide * 2,097,152 entries (the Flash I chose has 2M = 2,097,152 addresses)

    always @(posedge CLK) begin     // CITATION: I used ChatGPT for this Always block
        // Activating CE
        if (requestCE) begin
            CE <= 1'b1;
        end
        else begin
            CE <= 1'b0;
        end
    
        if (writeEnable) begin
            memory[address[20:0]] <= dataIn;  // Write operation
        end
        dataOut <= memory[address[20:0]];  // Read operation
    end
endmodule

