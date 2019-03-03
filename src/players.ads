with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package Players

is



   type Player_Type is record
      --  the two constant types should be initialized upon creating a player
      --  we give a function for this to connect to the interface
      name : Unbounded_String;
      score : Natural := 0;
   end record;

   function init_player return Player_Type;
   procedure add_score (point : Natural; self : in out Player_Type);

end Players;
