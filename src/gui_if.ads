with Gtk.Button; use Gtk.Button;
with Gtk.Window; use Gtk.Window; with Gtk.Box;         use Gtk.Box;
with Gtk.Label;       use Gtk.Label;
with Gtk.Widget; use Gtk.Widget;

use Gtk.Button;
package GUI_IF is

   procedure Start_question_screen;
   --  task type Single_Player_Task;
private
   procedure answer (Button : access Gtk_Button_Record'Class; ans : Integer);
   procedure handler_of_button1 (Button : access Gtk_Button_Record'Class);
   procedure handler_of_button2 (Button : access Gtk_Button_Record'Class);
   procedure handler_of_button3 (Button : access Gtk_Button_Record'Class);
   procedure handler_of_button4 (Button : access Gtk_Button_Record'Class);
   procedure handler_of_delete_event (Win : access Gtk_Widget_Record'Class);
   procedure handler_of_destroy_event (Win : access Gtk_Widget_Record'Class);


   Win          : Gtk_Window;
   Question_Label       : Gtk_Label;
    Box          : Gtk_Vbox; --outermost box, because window can only hold one object. Vbox, because question should later be above answers.
    Answers      : Gtk_Vbox; --box for all 4 answers
   Buttons : array (1 .. 4) of Gtk_Button;
   Answer_labels : array (1 .. 4) of Gtk_Label;
end GUI_IF;
