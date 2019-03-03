with Ada.Text_IO; use Ada.Text_IO;
with safe_addition; use safe_addition;
package body Players

is

   function init_player return Player_Type is

      new_player : Player_Type;


   begin

      Ada.Text_IO.Put_Line ("Creating a new player. Please enter your name:");
      new_player.name := To_Unbounded_String (Ada.Text_IO.Get_Line);
      return new_player;
   end init_player;


   procedure add_score (point : Natural; self : in out Player_Type) is



   begin
      self.score := safe_add (self.score, point);

   end add_score;



end Players;
