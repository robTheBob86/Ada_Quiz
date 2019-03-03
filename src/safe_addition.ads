package safe_addition with SPARK_Mode => ON
is

   function safe_add (a, b : Natural)  return Natural with Pre => (a >= 0) and (b >= 0), post => safe_add'Result >= a,
   Depends=> (safe_add'result=>(a,b));
   function unsafe_add (a, b : Natural) return Natural with pre => (b <= 5) and (a < Natural'Last - b), post => unsafe_add'Result = a + b,
   Depends=>(unsafe_add'result=>(a,b));

end safe_addition;
