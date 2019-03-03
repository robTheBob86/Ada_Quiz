with Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
package body Game_Status is

      protected body Game_Status_Type is
         entry Set_Game_Over (not_game_over : Boolean; player : Player_Type) when not game_over is
         begin
            if not not_game_over then
               game_over := True;
               Ada.Text_IO.Put_Line ("Player " & To_String (player.name) & " has answered wrong. GAME OVER");
            end if;
         end Set_Game_Over;

         function Get_Game_Over return Boolean is
         begin
            return game_over;
         end Get_Game_Over;

         procedure Set_Time_Out (player : Player_Type) is
         begin
            Ada.Text_IO.Put_Line ("Player " & To_String (player.name) & " has run out of time. GAME OVER");
            time_out := True;
         end Set_Time_Out;

         function Get_Time_Out return Boolean is
         begin
            return time_out;
         end Get_Time_Out;

         procedure Set_Question_Answered (qa : Boolean) is
         begin
            question_answered := qa;
         end Set_Question_Answered;

         function Get_Question_Answered return Boolean is
         begin
         return question_answered;
         end Get_Question_Answered;

         procedure Set_Answer (ans : Integer) is
         begin
            right_answer := ans;
         end Set_Answer;

         function Get_Answer return Integer is
         begin
            return right_answer;
         end Get_Answer;


      end Game_Status_Type;


end Game_Status;
