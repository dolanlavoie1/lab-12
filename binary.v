module binary(
    input w, clk, reset,
    output z,
    output [2:0] State
);

    wire [2:0] Next;
    
    dff zero(
        .Default(0),
        .reset(reset),
        .D(Next[0]),
        .clk(clk),
        .Q(State[0])
    );
    
    dff one(
        .Default(0),
        .reset(reset),
        .D(Next[1]),
        .clk(clk),
        .Q(State[1])
    );
    
    dff two(
        .Default(0),
        .reset(reset),
        .D(Next[2]),
        .clk(clk),
        .Q(State[2])
    );
    
    assign z = State[2] | (State[1] & ~State[0]);
    
    assign Next[0] = (~State[2] | ~w) & (~State[1] | State[0] | w) & (~State[1] | ~State[0] | ~w) & (State[1] | ~State[0] | w);
    assign Next[1] = (State[1] & ~State[0]) | (~State[1] & State[0]) & (~State[2] & ~State[1] & w);
    assign Next[2] = (State[2] & w) | (State[1] & State[0] & w);

endmodule
