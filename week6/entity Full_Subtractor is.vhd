-- Full Subtractor Entity
entity Full_Subtractor is
    port (
        A, B, b_in : in std_logic;
        b_out, d   : out std_logic
    );
end Full_Subtractor;

-- Full Subtractor Architecture
architecture BEHAVIOR of Full_Subtractor is
    component Half_Adder is
        port (
            a, b : in std_logic;
            c, s : out std_logic
        );
    end component;

    signal s1, s2, c1, c2, b1, c3 : std_logic;
begin
    b1 <= not B; -- Invert B
    c3 <= b_in; -- Use b_in directly as carry input

    -- First Half Adder
    ha1 : Half_Adder
        port map (
            a => A,
            b => b1,
            c => c1,
            s => s1
        );

    -- Second Half Adder
    ha2 : Half_Adder
        port map (
            a => s1,
            b => c3,
            c => c2,
            s => s2
        );

    -- Output assignments
    b_out <= c1 or c2; -- Borrow out
    d <= s2;           -- Difference
end BEHAVIOR;

-- Half Adder Entity
entity Half_Adder is
    port (
        a, b : in std_logic;
        c, s : out std_logic
    );
end Half_Adder;

-- Half Adder Architecture
architecture BEHAVIOR of Half_Adder is
begin
    c <= a and b; -- Carry
    s <= a xor b; -- Sum
end BEHAVIOR;
