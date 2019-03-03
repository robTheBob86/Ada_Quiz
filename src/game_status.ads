with Players; use Players;

package Game_Status is


      protected type Game_Status_Type is
         --  Most useful in multi-player mode
         entry Set_Game_Over (not_game_over : Boolean; player : Player_Type);
         function Get_Game_Over return Boolean;

         procedure Set_Time_Out (player : Player_Type);
         function Get_Time_Out return Boolean;

         procedure Set_Question_Answered (qa : Boolean);
         function Get_Question_Answered return Boolean;

         procedure Set_Answer (ans : Integer);
         function Get_Answer return Integer;

      private
         question_answered : Boolean := False;
         game_over : Boolean := False;
         time_out : Boolean := False;
         right_answer : Integer;
      end Game_Status_Type;


   --  initialize the just-declared status type
   status : Game_Status_Type;


end Game_Status;
