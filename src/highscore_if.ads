

with Players; use Players;

with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package highscore_if is

   type Score_Array is array (1 .. 5) of Unbounded_String;
   type Extended_Score_Array is array (1 .. 6) of Unbounded_String;

   procedure save_score (player : Player_Type);
   function load_score return Score_Array;

private
   high_score_f : constant String := "data/highscore.txt";

end highscore_if;
