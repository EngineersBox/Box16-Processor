/*
 * Generated by Digital. Don't modify this file!
 * Any changes will be lost if this file is regenerated.
 */

module CompUnsigned #(
    parameter Bits = 1
)
(
    input [(Bits -1):0] a,
    input [(Bits -1):0] b,
    output \> ,
    output \= ,
    output \<
);
    assign \> = a > b;
    assign \= = a == b;
    assign \< = a < b;
endmodule


module data_hazard_forwarding (
  input I_3,
  input I_2,
  input I_1,
  input I_0,
  output [1:0] ForwardE
);
  assign ForwardE[0] = ((I_3 & ~ I_1 & I_0) | (I_3 & ~ I_2 & I_0));
  assign ForwardE[1] = (I_2 & I_1);
endmodule

module Mux_2x1_NBits #(
    parameter Bits = 2
)
(
    input [0:0] sel,
    input [(Bits - 1):0] in_0,
    input [(Bits - 1):0] in_1,
    output reg [(Bits - 1):0] out
);
    always @ (*) begin
        case (sel)
            1'h0: out = in_0;
            1'h1: out = in_1;
            default:
                out = 'h0;
        endcase
    end
endmodule


module hazard_unit (
  input [15:0] RA1D,
  input [15:0] RA2D,
  input [15:0] WA3E,
  input MemtoRegE,
  input PCSrcD,
  input PCSrcE,
  input PCSrcM,
  input PCSrcW,
  input BranchTakenE,
  input RegWriteM,
  input RegWriteW,
  input [15:0] RA1E,
  input [15:0] RA2E,
  input [15:0] WA3M,
  input [15:0] WA3W,
  input ALUSrcE,
  output StallF,
  output StallD,
  output FlushD,
  output FlushE,
  output [1:0] ForwardBE,
  output [1:0] ForwardAE
);
  wire s0;
  wire s1;
  wire StallD_temp;
  wire s2;
  wire s3;
  wire s4;
  wire s5;
  wire s6;
  wire [1:0] s7;
  wire [1:0] s8;
  wire s9;
  wire s10;
  wire s11;
  wire s12;
  // Match1D_E
  CompUnsigned #(
    .Bits(16)
  )
  CompUnsigned_i0 (
    .a( RA1D ),
    .b( WA3E ),
    .\= ( s0 )
  );
  // Match2DE
  CompUnsigned #(
    .Bits(16)
  )
  CompUnsigned_i1 (
    .a( RA2D ),
    .b( WA3E ),
    .\= ( s1 )
  );
  assign s2 = (PCSrcM | PCSrcE | PCSrcD);
  // Match1_EM
  CompUnsigned #(
    .Bits(16)
  )
  CompUnsigned_i2 (
    .a( WA3M ),
    .b( RA1E ),
    .\= ( s3 )
  );
  // Match1_EW
  CompUnsigned #(
    .Bits(16)
  )
  CompUnsigned_i3 (
    .a( WA3W ),
    .b( RA1E ),
    .\= ( s4 )
  );
  // Match2_EM
  CompUnsigned #(
    .Bits(16)
  )
  CompUnsigned_i4 (
    .a( WA3M ),
    .b( RA2E ),
    .\= ( s5 )
  );
  // Match2_EW
  CompUnsigned #(
    .Bits(16)
  )
  CompUnsigned_i5 (
    .a( WA3W ),
    .b( RA2E ),
    .\= ( s6 )
  );
  CompUnsigned #(
    .Bits(16)
  )
  CompUnsigned_i6 (
    .a( RA2E ),
    .b( 16'b0 ),
    .\< ( s11 )
  );
  CompUnsigned #(
    .Bits(16)
  )
  CompUnsigned_i7 (
    .a( RA1E ),
    .b( 16'b0 ),
    .\< ( s12 )
  );
  assign StallD_temp = ((s0 | s1) & MemtoRegE);
  assign FlushD = (PCSrcW | s2 | BranchTakenE);
  data_hazard_forwarding data_hazard_forwarding_i8 (
    .I_3( s4 ),
    .I_2( s3 ),
    .I_1( RegWriteM ),
    .I_0( RegWriteW ),
    .ForwardE( s7 )
  );
  data_hazard_forwarding data_hazard_forwarding_i9 (
    .I_3( s6 ),
    .I_2( s5 ),
    .I_1( RegWriteM ),
    .I_0( RegWriteW ),
    .ForwardE( s8 )
  );
  assign s9 = (s12 | ALUSrcE);
  assign s10 = (s11 | ALUSrcE);
  assign StallF = (s2 | StallD_temp);
  assign FlushE = (BranchTakenE | StallD_temp);
  Mux_2x1_NBits #(
    .Bits(2)
  )
  Mux_2x1_NBits_i10 (
    .sel( s9 ),
    .in_0( s7 ),
    .in_1( 2'b0 ),
    .out( ForwardAE )
  );
  Mux_2x1_NBits #(
    .Bits(2)
  )
  Mux_2x1_NBits_i11 (
    .sel( s10 ),
    .in_0( s8 ),
    .in_1( 2'b0 ),
    .out( ForwardBE )
  );
  assign StallD = StallD_temp;
endmodule
