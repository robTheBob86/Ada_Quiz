with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Ada.Containers.Vectors;

package Question_IF  is


   type Answer_Array is array (1 .. 4) of Unbounded_String;
   --  type Category_Type is (Real_Time_C, Esterel_C, Lustre_C, Ada_C, Model_Checking_C, Timing_Analysis_C);

   type Question_Type is record
      --  pretty self explaining, simply one single question.
      --  The diffculty is to have a gradually improving difficulty level
         question : Unbounded_String;
         answers : Answer_Array;
         right_answer : Natural range 1 .. 4;
         difficulty : Natural range 1 .. 5;
         --  category: Category_Type;

   end record;

   ---------------------------The Vectors------------------------------------

   package Question_Vectors is new Ada.Containers.Vectors
     (Index_Type   => Natural,
      Element_Type => Question_Type);

   use Question_Vectors;

   all_questions : Vector;
   current_question_index : Integer := 0;
   ----------------------------All the functions-----------------------------
   --  procedure parse_all_questions;
   procedure parse_questions (filepath : Unbounded_String);
   --  function select_question return Question_Type;



end Question_IF;
