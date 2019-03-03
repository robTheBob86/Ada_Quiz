with Ada.Text_IO;

with GUI_IF; use GUI_IF;
with Single_Player_mode; use Single_Player_mode;
procedure Main is

   sp_mode : Single_Player_Task;

begin
   Ada.Text_IO.Put_Line ("Welcome to the RTPL Quiz.");
   sp_mode.start;  -- logic of the game
   Start_question_screen;  -- gtk window of the game
end Main;

