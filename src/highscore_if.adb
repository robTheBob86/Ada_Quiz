with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; 



package body highscore_if is

   function load_score return Score_Array is

      arr : Score_Array;
      index : Integer := 1;
      F : File_Type;
      line : Unbounded_String;

   begin

      Open (F, In_File, high_score_f);

      while not End_Of_File (F) loop
         line := To_Unbounded_String (Get_Line (F));
         if index <= 5 then
            arr (index) := line;
            index := index + 1;
         end if;
      end loop;
       Close(F);
      return arr;
   end load_score;


   procedure save_score (player : Player_Type) is

      function find_score (line : in out Unbounded_String) return Natural is

         --  NOTE: This function is also good to verify with SPARK
         index : Natural := 0;
         --  0 and 9 in ASCII code table; we want to find score by comparing relations
         lower : constant Natural := 48;
         upper : constant Natural := 57;
         pragma Unreferenced (upper);

         new_line : Unbounded_String;

      begin

         loop -- we will return anyways
            if (Character'Pos (To_String (line)(Length (line) - index)) >= lower) and (Character'Pos (To_String (line)(Length (line) - index)) >= lower) then
               index := index + 1;
            else
               index := index - 1; -- we went one too far
               new_line := To_Unbounded_String (Slice (line, Length (line) - index, Length (line)));
               return Natural'Value (To_String (new_line));
            end if;
         end loop;
      end find_score;


      arr : Score_Array; -- read the array
      aux_arr : Extended_Score_Array; -- has one more, for sorting
      found : Boolean := False;

      current_score : Natural;

      F : File_Type;

   begin

      arr := load_score;
      for index in reverse 1 .. 5 loop
         --  in this loop we sort the players score into the array
         current_score := find_score (arr (index));
         if current_score < player.score then
            aux_arr (index + 1) := arr (index);

            if index = 1 then
               aux_arr (index) := player.name & To_Unbounded_String (player.score'Image);
            end if;

         else
            if (not found) and (index /= 1) then
               aux_arr (index + 1) := player.name & To_Unbounded_String (player.score'Image);
               aux_arr (index) := arr (index);

               found := True;
            else
               aux_arr (index) := arr (index);
            end if;
         end if;
      end loop;

      Open (F, Out_File, high_score_f);

      for i in 1 .. 5 loop
         Put_Line (F, To_String (aux_arr (i)));
         Put_Line (To_String (aux_arr (i)));
      end loop;

       Close(F);

   end save_score;


end highscore_if;
