
package body safe_addition with SPARK_Mode => ON
is
   --  score addition function with cheating protection: we know, that we give at most 5 points per question
   function safe_add (a, b : Natural) return Natural
   is
      res : Natural;

   begin

      if (b > 5) then -- cheating detected: question file has been manipulated
         return a;

      else

         if (a >= Natural'Last - b) then
            pragma  Assert (a >= Natural'Last - 5);
            return Natural'Last;
         end if;

         res := unsafe_add (a, b);
         return res;
      end if;



   end safe_add;

   function unsafe_add (a, b : Natural) return Natural is
   begin
      return a + b;
   end unsafe_add;

end safe_addition;
