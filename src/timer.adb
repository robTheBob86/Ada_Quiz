with Game_Status; use Game_Status;
with Ada.Real_Time; use Ada.Real_Time;
with Players; use Players;

package body timer is


   task body Timer_Task is
      start_time : Time;
   begin
      loop
         select
            accept start_timer do
               start_time := Clock;
            end start_timer;
         or
            accept reset_time do
               start_time := Clock;
            end reset_time;
         or accept check_for_timeout (player : Player_Type) do
               if Clock - start_time >= Seconds (20) then
                  status.Set_Time_Out (player);
               end if;
         end check_for_timeout;
         or terminate;
         end select;


      end loop;

   end Timer_Task;

end timer;
