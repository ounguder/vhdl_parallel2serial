library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity par2ser_tb is
generic( N : integer := 8);
end entity;

architecture test of par2ser_tb is
constant t_clock : time := 10 ns;

component par2ser generic( N : integer := 8);
port(
	data		: in std_logic_vector(N-1 downto 0);
	clk,en	: in std_logic;
	bit_out	: out std_logic
);
end component;
	signal data: std_logic_vector( 7 downto 0);
	signal clk: std_logic := '0';
	signal en: std_logic := '0';
	signal bit_out: std_logic;

begin

uut: par2ser port map(
			data => data,
			clk => clk,
			en => en,
			bit_out => bit_out);
			
	clocking: process
		begin
			clk <= '0';
			wait for t_clock/2;
			clk <= '1';
			wait for t_clock/2;
		end process;
		
	inputing: process
		begin
		wait for 10 ns;
		data <= "10101010";
		wait for 200 ns;
		data <= "11110000";
		wait for 200 ns;
		data <= "00001111";
		wait for 50 ns;
		data <= "00110011";
		wait for 200 ns;
		data <= "11111111";
		wait for 50 ns;
		data <= "11001100";
		wait for 200 ns;
		data <= "01010011";
		wait for 200 ns;
		data <= "10101100";
		wait;
		
		end process;
			
		
	enabling: process
		begin
			wait for 10 ns;
			en <= '1';
			wait;
		end process;

end architecture;