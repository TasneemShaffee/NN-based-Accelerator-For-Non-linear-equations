--------------------------------------------------------------------------------
--                          IntSquarer_24_comb_uid4
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca (2009)
--------------------------------------------------------------------------------
-- combinatorial

library ieee; 
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;
library work;
entity IntSquarer_24_comb_uid4 is
   port ( X : in  std_logic_vector(23 downto 0);
          R : out  std_logic_vector(47 downto 0)   );
end entity;

architecture arch of IntSquarer_24_comb_uid4 is
signal x0_16 :  std_logic_vector(17 downto 0);
signal x17_32 :  std_logic_vector(17 downto 0);
signal x17_32_shr :  std_logic_vector(17 downto 0);
signal p0 :  std_logic_vector(35 downto 0);
signal p1_x2 :  std_logic_vector(35 downto 0);
signal s1 :  std_logic_vector(35 downto 0);
signal p2 :  std_logic_vector(35 downto 0);
signal s2 :  std_logic_vector(35 downto 0);
begin
   x0_16 <= "0" & X(16 downto 0);
   x17_32 <= "00" & "000000000" & X(23 downto 17);
   x17_32_shr <= "0" & "000000000" & X(23 downto 17) & "0";
   p0 <= x0_16 * x0_16;
   p1_x2 <= x17_32_shr * x0_16;
   s1 <= p1_x2 + ( "00000000000000000" & p0(35 downto 17));
   p2 <= x17_32 * x17_32;
   s2 <= p2 + ( "00000000000000000" & s1(35 downto 17));
   R <= s2(13 downto 0) & s1(16 downto 0) & p0(16 downto 0);
end architecture;

--------------------------------------------------------------------------------
--                           IntAdder_33_f400_uid8
--                    (IntAdderAlternative_33_comb_uid12)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2010)
--------------------------------------------------------------------------------
-- combinatorial

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntAdder_33_f400_uid8 is
   port ( X : in  std_logic_vector(32 downto 0);
          Y : in  std_logic_vector(32 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(32 downto 0)   );
end entity;

architecture arch of IntAdder_33_f400_uid8 is
begin
   --Alternative
    R <= X + Y + Cin;
end architecture;

--------------------------------------------------------------------------------
--                                   FPsqr
--                        (FPSquare_8_23_23_comb_uid2)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca (2009)
--------------------------------------------------------------------------------
-- combinatorial

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity FPsqr is
   port ( X : in  std_logic_vector(8+23+2 downto 0);
          R : out  std_logic_vector(8+23+2 downto 0)   );
end entity;

architecture arch of FPsqr is
   component IntSquarer_24_comb_uid4 is
      port ( X : in  std_logic_vector(23 downto 0);
             R : out  std_logic_vector(47 downto 0)   );
   end component;

   component IntAdder_33_f400_uid8 is
      port ( X : in  std_logic_vector(32 downto 0);
             Y : in  std_logic_vector(32 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(32 downto 0)   );
   end component;

signal exc :  std_logic_vector(1 downto 0);
signal exp :  std_logic_vector(7 downto 0);
signal frac :  std_logic_vector(23 downto 0);
signal extExponent :  std_logic_vector(9 downto 0);
signal negBias :  std_logic_vector(9 downto 0);
signal extExpPostBiasSub :  std_logic_vector(9 downto 0);
signal sqrFrac :  std_logic_vector(47 downto 0);
signal sticky :  std_logic;
signal guard :  std_logic;
signal fracULP :  std_logic;
signal extExp :  std_logic_vector(9 downto 0);
signal finalFrac :  std_logic_vector(22 downto 0);
signal concatExpFrac :  std_logic_vector(32 downto 0);
signal addCin :  std_logic;
signal postRound :  std_logic_vector(32 downto 0);
signal excConcat :  std_logic_vector(3 downto 0);
signal excR :  std_logic_vector(1 downto 0);
begin
   exc <= X(33 downto 32);
   exp <= X(30 downto 23);
   frac <= "1" & X(22 downto 0);
   extExponent<="0" & exp & "0";
   negBias<="1110000000";
   extExpPostBiasSub <= extExponent + negBias + '1';
      FractionSquarer: IntSquarer_24_comb_uid4
      port map ( R => sqrFrac,
                 X => frac);
   sticky<='0' when sqrFrac(21 downto 0)="0000000000000000000000"else '1';
   guard <= sqrFrac(22) when sqrFrac(47)='0' else sqrFrac(23);
   fracULP<=sqrFrac(23) when sqrFrac(47)='0' else sqrFrac(24);
   extExp <= extExpPostBiasSub + sqrFrac(47);
   finalFrac<= sqrFrac(46 downto 24) when sqrFrac(47)='1' else 
      sqrFrac(45 downto 23);
   concatExpFrac <= extExp & finalFrac;
   addCin <= (guard and sticky) or (fracULP and guard and not(sticky));
   Rounding_Instance: IntAdder_33_f400_uid8
      port map ( Cin => addCin,
                 R => postRound,
                 X => concatExpFrac,
                 Y => "000000000000000000000000000000000");
   excConcat <= exc & postRound(32 downto 31);
   with excConcat select 
   excR<="00" when "0000",
      "00" when "0001",
      "00" when "0010",
      "00" when "0011",
      "01" when "0100",
      "10" when "0101",
      "00" when "0110",
      "00" when "0111",
      "10" when "1000",
      "10" when "1001",
      "10" when "1010",
      "10" when "1011",
      "11" when "1100",
      "11" when "1101",
      "11" when "1110",
      "11" when "1111",
      "11" when others;
   R <= excR &  "0"  & postRound(30 downto 23) & postRound(22 downto 0);
end architecture;

