with Ada.Text_IO; use Ada.Text_IO;

with Ada.Strings;


with Ada.Strings.Fixed; -- string operations

package body Question_IF is

   procedure parse_questions (filepath : in Unbounded_String) is

      F : File_Type;
      line, ans1, ans2, ans3, ans4 : Unbounded_String;
      new_question : Question_Type;

   begin

      Open (F, In_File, To_String (filepath));
      while not End_Of_File (F) loop
         line := To_Unbounded_String (Get_Line (F));

         if Ada.Strings.Fixed.Count (Source  => To_String (line), Pattern => "Question") > 0 then
            new_question.question := To_Unbounded_String (To_String (line)(10 .. To_String (line)'Length));

         elsif Ada.Strings.Fixed.Count (Source  => To_String (line), Pattern => "1. ") > 0 then
            ans1 := To_Unbounded_String (To_String (line)(3 .. To_String (line)'Length));
         elsif Ada.Strings.Fixed.Count (Source  => To_String (line), Pattern => "2. ") > 0 then
            ans2 := To_Unbounded_String (To_String (line)(3 .. To_String (line)'Length));
         elsif Ada.Strings.Fixed.Count (Source  => To_String (line), Pattern => "3. ") > 0 then
            ans3 := To_Unbounded_String (To_String (line)(3 .. To_String (line)'Length));
         elsif Ada.Strings.Fixed.Count (Source  => To_String (line), Pattern => "4. ") > 0 then
            ans4 := To_Unbounded_String (To_String (line)(3 .. To_String (line)'Length));

         elsif Ada.Strings.Fixed.Count (Source  => To_String (line), Pattern => "Right_Answer") > 0 then
            new_question.right_answer := Natural (Character'Pos (To_String (line)(15)) - 48); -- we go here in ASCII code
            new_question.answers := (ans1, ans2, ans3, ans4);
         elsif Ada.Strings.Fixed.Count (Source  => To_String (line), Pattern => "Difficulty") > 0 then
            --  Ada.Text_IO.Put(To_String(line)(11));
            new_question.difficulty := Natural (Character'Pos (To_String (line)(13)) - 48);
            all_questions.Append (new_question);
         end if;

      end loop;
      Close (F);

   end parse_questions;






   --  procedure

end Question_IF;
