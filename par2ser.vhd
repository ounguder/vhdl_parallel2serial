library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity par2ser is
generic( N : integer := 8);
port(
	data		: in std_logic_vector(N-1 downto 0);
	clk,en	: in std_logic;
	bit_out	: out std_logic
);

end entity;


architecture Behavioral of par2ser is
signal parallel_in      : std_logic_vector(N-1 downto 0 ) := (others=>'0');
signal count: integer range 0 to N;
begin


process(clk)

begin
	if(rising_edge(clk)) then
		if (en = '1') then
		   count <= count + 1;
            if(count = 7) then
                parallel_in <= data;
                count <= 0;
            end if;
            bit_out <=parallel_in(count);
		end if;
	end if;
end process;

end Behavioral;