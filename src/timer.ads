with Players;

package timer is


   task type Timer_Task is
      entry start_timer;
      entry reset_time;
      entry check_for_timeout (player : Players.Player_Type);
   end Timer_Task;


end timer;
