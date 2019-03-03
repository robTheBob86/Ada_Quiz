with Game_Status; use Game_Status;
with timer; use timer;
with Players; use Players;
with Question_IF; use Question_IF;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO;
with highscore_if; use highscore_if;
package body Single_Player_mode  is
   --------------------------------------- The Single Player Task ---------------------------------------
   --  This task runs concurrently to the GUI and interacts with it
   task body Single_Player_Task is
      --  Please note: It is actually an overkill, ahving a task in the single player task
      --  again, we do not need it in this moment. However, we can utilize the code like
      --  this for a multi-player mode, where we just intantiate two tasks like this,
      --  one for each player. Hence, this design is for upward compatibility rather than
      --  for solving the single-player problem

         ------------------------ Define and instantiate the task  ---------------------------

      file : constant String := "data/questions.txt";
      player1 : Player_Type;
      timer1 : Timer_Task;
      high : Score_Array;
      pragma Unreferenced (high);
   begin

      accept Start do
         parse_questions (To_Unbounded_String (file));
         player1 := init_player;
         Ada.Text_IO.Put_Line ("Welcome " & To_String (player1.name));
      end Start;

      -- this is kind of like the main procedure, serving the player with the questions
      while (not status.Get_Game_Over) loop
         if current_question_index >=  Integer (Question_Vectors.Length (all_questions)) then
            Ada.Text_IO.Put_Line ("Congratulations, you've mastered all questions!");
            exit;
         end if;
         timer1.start_timer;
         while (not status.Get_Question_Answered) loop
            delay 0.1;
         end loop;
         timer1.check_for_timeout (player1);

         if (all_questions (current_question_index).right_answer = status.Get_Answer) then
               add_score (all_questions (current_question_index).difficulty, player1);
               Ada.Text_IO.Put_Line ("The answer was correct. You current score is: " & Natural'Image (player1.score));
         else
               status.Set_Game_Over (False, player1);
               Ada.Text_IO.Put_Line ("Wrong answer. GAME OVER");
         end if;
         current_question_index := current_question_index + 1;
            status.Set_Question_Answered (False);


      end loop;
      save_score (player1);
      high := load_score;
   end Single_Player_Task;


end Single_Player_mode;
