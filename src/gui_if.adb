with Ada.Text_IO; use Ada.Text_IO;
with Gtk.Main;
with Question_IF;


use Question_IF;

with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Game_Status; use Game_Status;

package body GUI_IF is
   --  instantiate the single-player-mode

  --------------------------------------- Button Handlers ---------------------------------------
   procedure handler_of_button1 (Button : access Gtk_Button_Record'Class) is
  begin
      answer (Button, 1);
  end handler_of_button1;
   procedure handler_of_button2 (Button : access Gtk_Button_Record'Class) is
     begin
      answer (Button, 2);
     end handler_of_button2;
   procedure handler_of_button3 (Button : access Gtk_Button_Record'Class) is
     begin
      answer (Button, 3);
     end handler_of_button3;
   procedure handler_of_button4 (Button : access Gtk_Button_Record'Class) is
     begin
      answer (Button, 4);
     end handler_of_button4;

   procedure answer (Button : access Gtk_Button_Record'Class; ans : Integer) is -- this function will be huge, main work is done here
      pragma Unreferenced (Button);
   begin
      if ((status.Get_Game_Over) or (status.Get_Time_Out)) then
         Question_Label.Set_Label ("Game over");
         Buttons (1).Set_Sensitive (False);
         Buttons (2).Set_Sensitive (False);
         Buttons (3).Set_Sensitive (False);
         Buttons (4). Set_Sensitive(False);
      end if;

      status.Set_Answer (ans);
      status.Set_Question_Answered (True);
      while status.Get_Question_Answered loop
         delay 0.1;
      end loop;
      if (status.Get_Game_Over) or (current_question_index >= Integer (Question_Vectors.Length (all_questions))) then
         Question_Label.Set_Label ("Game over");
         Buttons (1).Set_Sensitive (False);
         Buttons (2).Set_Sensitive (False);
         Buttons (3).Set_Sensitive (False);
         Buttons (4). Set_Sensitive(False);
      else



         Question_Label.Set_Label (To_String (all_questions (current_question_index).question));
         Buttons (1).Set_Label (To_String (all_questions (current_question_index).answers (1)));
         Buttons (2).Set_Label (To_String (all_questions (current_question_index).answers (2)));
         Buttons (3).Set_Label (To_String (all_questions (current_question_index).answers (3)));
         Buttons (4).Set_Label (To_String (all_questions (current_question_index).answers (4)));

      end if;
   end answer;

   procedure handler_of_delete_event (Win : access Gtk_Widget_Record'Class) is
      pragma Unreferenced (Win);
   begin
      Gtk.Main.Main_Quit;
   end handler_of_delete_event;
   procedure handler_of_destroy_event (Win : access Gtk_Widget_Record'Class) is
      pragma Unreferenced (Win);
   begin
      Gtk.Main.Main_Quit;
   end handler_of_destroy_event;



   procedure Start_question_screen is


   --------------------------------------- Begin ---------------------------------------
   begin

      --  Initialize GtkAda.

      Gtk.Main.Init;
      --  Create a window with a size of 800 x 600
      Gtk_New (Win);
      Win.Set_Default_Size (800, 600);
      Win.Set_Title ("Ada Quiz");
      --  single box to organize content vertically
      Gtk_New_Vbox (Box);
      Win.Add (Box);

      --  Add a question
      Gtk_New (Question_Label, "Question");
      Question_Label.Set_Line_Wrap (True);
      Box.Add (Question_Label);
      --  Add
      Gtk_New_Vbox (Answers);
      Box.Add (Answers);
      for i in 1 .. 4 loop
         Gtk_New(Buttons (i));
         Answers.Add (Buttons (i));
         Gtk_New (Answer_labels (i), Integer'Image (i));
         Answer_labels (i).Set_Line_Wrap (True);
         Buttons (i).Add (Answer_labels (i));

      end loop;


      Buttons (1).On_Clicked (handler_of_button1'Access);
      Buttons (2).On_Clicked (handler_of_button2'Access);
      Buttons (3).On_Clicked (handler_of_button3'Access);
      Buttons (4).On_Clicked (handler_of_button4'Access);
      Win.On_Destroy (handler_of_destroy_event'Access);

      Question_Label.Set_Label (To_String (all_questions (current_question_index).question));
      Buttons (1).Set_Label (To_String (all_questions (current_question_index).answers (1)));
      Buttons (2).Set_Label (To_String (all_questions (current_question_index).answers (2)));
      Buttons (3).Set_Label (To_String (all_questions (current_question_index).answers (3)));
      Buttons (4).Set_Label (To_String (all_questions (current_question_index).answers (4)));




      --  Show the window
      Win.Show_All;
      --  Start the Gtk+ main loop
      Gtk.Main.Main; -- only left by using the Gtk.Main.Main_Quit function. Until then: Start everything with button press handles.

      Put_Line ("Thanks for playing");

   end Start_question_screen;




end GUI_IF;
