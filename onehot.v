module onehot(
    input w, clk, reset,
    output z, A, B, C, D, E
);

    wire Anext, Bnext, Cnext, Dnext, Enext;

    dff Adff(
        .Default(1'b1),
        .D(Anext),
        .clk(clk),
        .Q(A),
        .reset(reset)
    );
    
    dff Bdff(
        .Default(1'b0),
        .D(Bnext),
        .clk(clk),
        .Q(B),
        .reset(reset)
    );
    
    dff Cdff(
        .Default(1'b0),
        .D(Cnext),
        .clk(clk),
        .Q(C),
        .reset(reset)
    );
    
    dff Ddff(
        .Default(1'b0),
        .D(Dnext),
        .clk(clk),
        .Q(D),
        .reset(reset)
    );
    
    dff Edff(
        .Default(1'b0),
        .D(Enext),
        .clk(clk),
        .Q(E),
        .reset(reset)
    );
    
    assign z = C | E;
    
    assign Anext = 0;
    assign Bnext = ~w & (A | D | E);
    assign Cnext = ~w & (B | C);
    assign Dnext = w & (A | B | C);
    assign Enext = w & (D | E);

endmodule 