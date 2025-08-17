// Name: Eren Ugur

`timescale 1ns / 1ps

module tb_digitalPiano;

    // Variables for digitalPiano instance
    reg CLK;
    reg [15:0] sw;
    wire audioOut;
    wire [3:0] select;
    wire [6:0] segments;
    
    // Variables for flashControl instance
    reg [20:0] address1;
    reg [31:0] dataIn1;
    reg writeEnable1;
    reg requestFlashCE;
    wire [31:0] dataOut1;
    wire flashCE;
    
    // Variables for SRAMControl instance
    reg [12:0] address2;
    reg [31:0] dataIn2;
    reg writeEnable2;
    reg requestSramCE;
    wire [31:0] dataOut2;
    wire sramCE;
    
    initial CLK = 0;
    always #5 CLK = ~CLK;
    
    digitalPiano U00 (.CLK(CLK), 
                      .sw(sw), 
                      .audioOut(audioOut), 
                      .select(select), 
                      .segments(segments));
                      
    flashControl U01 (.CLK(CLK),
                      .address(address1),
                      .dataIn(dataIn1),
                      .writeEnable(writeEnable1),
                      .requestCE(requestFlashCE),
                      .dataOut(dataOut1),
                      .CE(flashCE));
                      
    SRAMControl U02 (.CLK(CLK),
                     .address(address2),
                     .dataIn(dataIn2),
                     .writeEnable(writeEnable2),
                     .requestCE(requestSramCE),
                     .dataOut(dataOut2),
                     .CE(sramCE));
                      
    initial begin
        address1 = 20'd35; 
        dataIn1 = 31'd12;
        
        address2 = 20'd50; 
        dataIn2 = 31'd21;
        
        writeEnable1 = 1'b1;
        requestFlashCE = 1'b1;
        
        writeEnable2 = 1'b1;
        requestSramCE = 1'b1;
        
        sw = 16'b0000000000000000;
        #20
        sw = 16'b1000000000000000;
        #20
        sw = 16'b1100000000000000;
        #20
        sw = 16'b1110000000000000;
        #20
        sw = 16'b1111000000000000;
        #20
        sw = 16'b1111100000000000;
        #20
        sw = 16'b1111110000000000;
        #20
        sw = 16'b1111111000000000;
        #20
        sw = 16'b1111111100000000;
        #20
        sw = 16'b1111111110000000;
        #20
        sw = 16'b1111111111000000;
        #20
        sw = 16'b1111111111100000;
        #20
        sw = 16'b1111111111110000;
        #20
        sw = 16'b1111111111111000;
        #20
        sw = 16'b1111111111111100;
        #20
        sw = 16'b1111111111111110;
        #20
        sw = 16'b1111111111111111;
        #20
        $finish;
    end


endmodule
