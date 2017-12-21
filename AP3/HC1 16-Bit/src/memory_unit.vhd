-- ------------------------ --
--  THM CPU RA WS 2013/14   --
--                          --
--  Memory                  --
-- ------------------------ --
-- Authors: Matthias Roell, --
--          Fabian Stahl    --
-- Date:    06.02.2014      --
-- ------------------------ --

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity memory_unit is
    port(
        -- Control Input --
        clk           : in  std_logic;
        reset         : in  std_logic;
        memWrite      : in  std_logic;
        -- Data Input --
        address       : in  std_logic_vector(15 downto 0);
        accOut        : in  std_logic_vector(15 downto 0);
        -- Data Output  --
        memOut        : out std_logic_vector(15 downto 0)
    );
end memory_unit;

architecture rtl of memory_unit is

    type ram_type is array (31 downto 0) of std_logic_vector(15 downto 0);
	 
    signal ram          : ram_type;

    -- holds output address until next clk
    signal readAddress  : std_logic_vector(15 downto 0);

begin
    RAM_PROCESS : process(clk, reset)
    begin
        if reset = '1' then
		  
		  		-- GGT 8-Bit
				
				ram(0) <= "00000000" & "100" & "00000";	-- IN A			X
				ram(1) <= "00000000" & "001" & "11111";	-- STORE M(31) 	X
				ram(2) <= "00000000" & "100" & "00000";	-- IN A			Y
				ram(3) <= "00000000" & "001" & "11110";	-- STORE M(30) 	Y
				ram(4) <= "00000000" & "000" & "11111";	-- LOAD M(31)		
				ram(5) <= "00000000" & "001" & "11101";	-- STORE M(29)	
				ram(6) <= "00000000" & "011" & "11110";	-- SUB A - M(30) 	X - Y
				ram(7) <= "00000000" & "101" & "10001";	-- JZ M(17)
				ram(8) <= "00000000" & "110" & "01101";	-- JPOS M(13)
				ram(9) <= "00000000" & "000" & "11110";	-- LOAD M(30)
				ram(10) <= "00000000" & "011" & "11111";	-- SUB A - M(31)	Y - X
				ram(11) <= "00000000" & "001" & "11110";	-- STORE M(30)
				ram(12) <= "00000000" & "111" & "00100";	-- J M(4)
				ram(13) <= "00000000" & "000" & "11111";	-- LOAD M(31)
				ram(14) <= "00000000" & "011" & "11110";	-- SUB A - M(30)	X - Y
				ram(15) <= "00000000" & "001" & "11111";	-- STORE M(31)
				ram(16) <= "00000000" & "111" & "00100";	-- J M(4)
				ram(17) <= "00000000" & "000" & "11101";	-- LOAD M(29)
				ram(18) <= "00000000" & "100" & "00001";	-- OUT A
				ram(19) <= "00000000" & "111" & "00000";	-- J M(0)

				ram(29) <= "0000000000000000";				-- M(29) <= 0
				ram(30) <= "0000000000000000";				-- M(30) <= 0
				ram(31) <= "0000000000000000";				-- M(31) <= 0
				
				-- GGT 16-Bit				
				
--				ram(0) <= "0110" & "000000000000";			-- IN A			X
--				ram(1) <= "0010" & "000000011111";			-- STORE M(31) 	X
--				ram(2) <= "0110" & "000000000000";			-- IN A			Y
--				ram(3) <= "0010" & "000000011110";			-- STORE M(30) 	Y
--				ram(4) <= "0001" & "000000011111";			-- LOAD M(31)		
--				ram(5) <= "0010" & "000000011101";			-- STORE M(29)	
--				ram(6) <= "0100" & "000000011110";			-- SUB A - M(30) 	X - Y
--				ram(7) <= "0111" & "000000010001";			-- JZ M(17)
--				ram(8) <= "1000" & "000000001101";			-- JPOS M(13)
--				ram(9) <= "0001" & "000000011110";			-- LOAD M(30)
--				ram(10) <= "0100" & "000000011111";			-- SUB A - M(31)	Y - X
--				ram(11) <= "0010" & "000000011110";			-- STORE M(30)
--				ram(12) <= "1001" & "000000000100";			-- J M(4)
--				ram(13) <= "0001" & "000000011111";			-- LOAD M(31)
--				ram(14) <= "0100" & "000000011110";			-- SUB A - M(30)	X - Y
--				ram(15) <= "0010" & "000000011111";			-- STORE M(31)
--				ram(16) <= "1001" & "000000000100";			-- J M(4)
--				ram(17) <= "0001" & "000000011101";			-- LOAD M(29)
--				ram(18) <= "0110" & "000000000001";			-- OUT A
--				ram(19) <= "1001" & "000000000000";			-- J M(0)
--
--				ram(29) <= "0000000000000000";				-- M(29) <= 0
--				ram(30) <= "0000000000000000";				-- M(30) <= 0
--				ram(31) <= "0000000000000000";				-- M(31) <= 0
				

				
				-- Multi 8-Bit
				
--				ram(0) <= "00000000" & "100" & "00000";		-- IN A X
--				ram(1) <= "00000000" & "001" & "10100";		-- Store in M(20)
--				ram(2) <= "00000000" & "100" & "00000";		-- IN A Y
--				ram(3) <= "00000000" & "100" & "10101";		-- Store in M(21)
--				ram(4) <= "00000000" & "101" & "10001";		-- JZ 17
--				ram(5) <= "00000000" & "000" & "10110";		-- Load M(22)
--				ram(6) <= "00000000" & "010" & "10100";		-- Add Acc + M(20)
--				ram(7) <= "00000000" & "001" & "10110";		-- Store in M(22)
--				ram(8) <= "00000000" & "000" & "10101";		-- Load M(21)
--				ram(9) <= "00000000" & "011" & "10111";		-- Sub Acc- M(23)
--				ram(10) <= "00000000" & "111" & "00011";		-- Jum ram(3)
--
--				ram(17) <= "00000000" & "000" & "10110";		-- Load M(22)
--				ram(18) <= "00000000" & "100" & "00001";		-- Out
--				ram(20) <= "00000000" & "000" & "00000";		-- M(20) = 0
--				ram(21) <= "00000000" & "000" & "00000";		-- M(21) = 0
--				ram(22) <= "00000000" & "000" & "00000";		-- M(22) = 0
--				ram(23) <= "00000000" & "000" & "00001";		-- M(23) = 1

				-- Multi 16-Bit
				
--				ram(0) <= "0110" & "000000000000";		-- IN A X
--				ram(1) <= "0010" & "000000010100";		-- Store in M(20) X
--				ram(2) <= "0110" & "000000000000";		-- In A Y
--				ram(3) <= "0010" & "000000010101";		-- Store in M(21) Y
--				ram(4) <= "0111" & "000000010001";		-- Springe zur Ergebnis ausgabe wenn 0
--				ram(5) <= "0001" & "000000010110";		-- Load M(22)
--				ram(6) <= "0011" & "000000010100";		-- Addiere Acc + M(20)
--				ram(7) <= "0010" & "000000010110";		-- Store M(22)
--				ram(8) <= "0001" & "000000010101";		-- Load M(21)
--				ram(9) <= "0100" & "000000010111";		-- Sub A -M(23)
--				ram(10) <= "1001" & "000000000011",		-- Jump ram(3)
--
--
--				ram(17) <= "0001" & "000000010110";		-- Load M(22)
--				ram(18) <= "0110" & "000000000001"; 	-- Out
--				ram(20) <= "0000000000000000";			-- M(20) <= 0	X
--				ram(21) <= "0000000000000000";	 		-- M(21) <= 0	Y
--				ram(22) <= "0000000000000000"; 			-- M(22) <= 0	Ergebnis
--				ram(23) <= "0000000000000001"; 			-- M(23) <= 1	1
				
		  elsif rising_edge(clk) then
            -- Write data to memory
            if memWrite = '1' then
                ram(to_integer(unsigned(address))) <= accOut;
            end if;
            -- Store output adress
            readAddress <= address;
        end if;
    end process;

    -- Set output (updates on RAM_PROCESS through readAddress signal)
    memOut <= ram(to_integer(unsigned(readAddress)));

end;
