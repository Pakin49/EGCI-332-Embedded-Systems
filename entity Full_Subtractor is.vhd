entity Full_Subtractor is
    port( A,B,b_in : in std_logic,
    b_out,d : out std_logic);
end

architecure BEHAVIOR of Full_Subtractor is
    component Half_Addre is
        port (
            a,b : in std_logic
            c,s : out std_logic
            );
    end component;
    signal s1,s2,c1,c2,b1,c3;
    begin
        b1 <= not b;
        c3 = b_in NOR b_in;
        ha1 : Half_Adder port map(a,b1,s1,c1);
        ha2 : Half_Adder port map(s1,c3,c2,s2);
        b_out <= c1 or c2;
        d <= s2;
    end;

entity Half_Adder is
    port (
        a,b : in std_logic
        c,s : out std_logic
        );
end;

architecure BEHAVIOR of Half_Adder is
begin 
    c = a and b;
    s = a xor b;
end;
