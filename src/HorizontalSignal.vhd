library IEEE;
use IEEE.NUMERIC_BIT.All;

-- Component that generates the HS Horizontal Signal to be used in the
-- VGA driver. Also it outputs the column count.
-- The input CLK is considered to be at 50MHz.
entity HorizontalSignal is
	port(
        CLK: in bit; 
		HS, HS_ON: out bit; 
        COLUM: out bit_vector(9 downto 0)
    );
end entity;

architecture HorizontalSignalarchi of HorizontalSignal is
component FFT
	port(CLK, T: in bit;
		Q: buffer bit);
end component;

signal count: integer range 0 to 799:=0; --50mhz->1_599
signal CLK25mhz: bit;

begin

    -- Obtain the CLK at 25MHZ, Dividing between 2.
	CLK25: FFT port map(CLK, '1', CLK25mhz);
	

	-- Process to make the count of the period HS of 32us
	process(CLK25mhz)
	begin
		if CLK25mhz'event and CLK25mhz='1' then
			if count=799 then --Period of 32 us    
				count<= 0;
			else 
				count<= count+1;
			end if;
		end if;
	end process;
	
	
	COLUM<= bit_vector(to_unsigned(count, 10));
	
	
	HS<= '0' when count<96
		else '1';
	
	HS_ON<= '1' when 144<=count and count<784
		else '0';
	
end architecture;
