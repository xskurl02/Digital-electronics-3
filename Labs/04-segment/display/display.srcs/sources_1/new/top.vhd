----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.03.2021 16:02:28
-- Design Name: 
-- Module Name: top - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
    Port ( 
        SW : in STD_LOGIC_VECTOR (4-1 downto 0);
        CA : out STD_LOGIC;
        CB : out STD_LOGIC;
        CC : out STD_LOGIC;
        CD : out STD_LOGIC;
        CE : out STD_LOGIC;
        CF : out STD_LOGIC;
        CG : out STD_LOGIC;
        
        LED : out STD_LOGIC_VECTOR (8-1 downto 0);
        AN  : out STD_LOGIC_VECTOR (8-1 downto 0)
     );
        
end top;

architecture Behavioral of top is

begin
    --------------------------------------------------------------------
    -- Instance (copy) of hex_7seg entity
    hex2seg : entity work.hex_7seg
        port map(
            hex_i    => SW,
            
                       
            seg_o(6) => CA,
            seg_o(5) => CB,
            seg_o(4) => CC,
            seg_o(3) => CD,
            seg_o(2) => CE,
            seg_o(1) => CF,         
            seg_o(0) => CG
        );
        
        AN <= b"1111_0111";
        
        LED(3 downto 0) <= SW;
        
      
    
        -- Turn LED(4) on if input value is equal to 0, ie "0000"
        LED(4)  <= '1' when (SW = "0000") else '0';
         
        -- Turn LED(5) on if input value is greater than "1001"
        LED(5)  <= '1' when (SW > "1001") else '0';
        
        -- Turn LED(6) on if input value is odd, ie 1, 3, 5, ...
        LED(6) <= '1' when (SW = "0001" or SW = "0011" or SW = "0101" or SW = "0111" or SW = "1001" or SW = "1011" or SW = "1101" or SW = "1111") else '0';
        
        -- Turn LED(7) on if input value is a power of two, ie 1, 2, 4, or 8
        LED(7)  <= '1' when (SW = "0001" or SW = "0010" or SW = "0100" or SW = "1000") else '0';
    

end Behavioral;
