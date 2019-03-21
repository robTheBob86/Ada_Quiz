# Real-Time Programming Languages Quiz

## Preface

### Authors
January 2019, Technical University of Munich
- ALSchauer: https://github.com/ALSchauer/
- robTheBob86: https://github.com/robTheBob86/


### Introduction

This piece of software is part of a small homework in a course aiming at teaching the 
basics of real-time programming languages. It is **written in Ada 2012, one module 
in SPARK**, and resembles a small quiz. 

Besides the username promt, which is by a command line interface, a GUI is being 
deployed as the communication interface between user and backend. The GUI
has been written utilizing **GTKAda**. It further comes along with the features 
following in the next section.

Please note that it ended up as it ended up due to time constraints, further 
features were planned such as multi-player and a complete GUI interface rather 
than a mix of terminal and GUI. Furthermore, this was our very first piece 
written in Ada, we came along with skills/experience in C/C++, Python and MATLAB. 


## Features

- GUI written in GTKAda
- Read and customize questions following the basic scheme
- Real-Time timer setting an upper limit on the answer time
- High-score list tracking the five best players
- Verified add-function written in SPARK (function safe_add in package safe_addtion)
- Multithreading (GUI, Game Logic and Timer concurrently)
- Protected objects to avoid race-conditions

The verification of the function in SPARK uses both pre- and postconditions and 
flow (depends) dependencies. Data dependecies (global) have not been used, because 
there exist no global data in this package.


## How to Use

When running, the command line interface promts a user-name. Write a user name 
and confirm pressing ENTER. 

Then the GUI starts, showing button 1 to 4 resembling the answers to the question
asked by the GUI. The user has 20 seconds (Timer) to asnwer this question, else 
the game will be over. A timeout will be indicated by a message in the terminal. 
A casual, non time-out, game over will occur on the first wrong answer. 

A score is kept throughout the run, and in the end the five best players will be 
shown. 

Questions can be added though the data/questions.txt file, please make sure however
to keep the structure of the example, as the parser is sensitive to the structure. 

## Troubleshooting

The program should run without any error, but in case there is one it is most 
likely linked to the **GTKAda, where the dependency has to be set**. Some dependencies
are set depending on the machine the program has been run in the quiz.gpr file. 
Please refer to the internet or other sources on how to set the dependencies according
to your system.

