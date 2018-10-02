library IEEE;
use IEEE.NUMERIC_BIT.All;

-- A Flip-Flop T
-- In the rising edge of the CLK, if T equals 1, the
-- output Q is toggled.
entity FFT is
	port(CLK, T: in bit;
		Q: buffer bit);
end entity;

architecture FFTarchi of FFT is
begin
	process(CLK)
	begin
		if CLK'event AND CLK = '1' then
			if T='1' then
				Q<= not Q;
			end if;
		end if;
	end process;
end architecture; 