-- Component that will debounce the push buttons.
-- It takes an input DIN and 'debounces' it as an output QOUT.
ENTITY ButtonDebounce IS
	PORT (
        CLK : IN BIT; 
        DIN : IN BIT;
		QOUT : OUT BIT
    );
END ButtonDebounce;

ARCHITECTURE ButtonDebounceArchi OF ButtonDebounce IS
	SIGNAL Q1, Q2, Q3 : BIT;
BEGIN
	PROCESS (CLK)
	BEGIN
		IF CLK = '1' AND CLK'EVENT THEN
			Q1 <= DIN;
			Q2 <= Q1;
			Q3 <= Q2;
		END IF;
	END PROCESS;

	QOUT <= Q1 AND Q2 AND NOT Q3;

END ButtonDebounceArchi;