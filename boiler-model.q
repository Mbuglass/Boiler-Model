//This file was generated from (Commercial) UPPAAL 4.0.14 (rev. 5615), May 2014

/*

*/
//NO_QUERY

/*

*/
s>100 --> Controller.Shutdown

/*

*/
(w<0 || w>100) --> Controller.Shutdown 

/*

*/
Controller.CheckingWater && Controller.x>=2500 --> Controller.Shutdown

/*

*/
Controller.CheckingSteam && Controller.x>=2500 --> Controller.Shutdown

/*
ALWAYS When the water level, w, is BELOW 14%, EITHER Pump1 OR Pump2 should be ENABLED
*/
A[] w<14 imply (pump1==1 || pump2 == 1)

/*
ALWAYS when the water level, w, is ABOVE 87% BOTH Pump1 AND Pump2 should be DISABLED
*/
A[] w>87 imply (pump1==0 && pump2 == 0)

/*
ALWAYS the system is NOT deadlocked
*/
A[] not deadlock

/*
EVENTUALLY the system will shutdown
*/
E<> Controller.Shutdown

/*
EVENTUALLY pump2 will be ENABLED
*/
E<> pump2==1

/*
EVENTUALLY pump1 will be ENABLED
*/
E<> pump1==1

/*
ALWAYS the steam level is below 89%
*/
A[] s<89

/*

*/
E[] !Controller.Shutdown

/*
is is NEVER the case that Pump1 AND Pump2 are ENABLED at the same time
*/
A[] !(pump1==1 && pump2==1)

/*
if a reset resquest is made, the system will reset
*/
rr == 1 --> Controller.Idle

/*
If the system has reset, a reset request must have been made by pressing the button - there is not other way the system was able to reset
*/
r==1 --> rr==1

/*

*/
sdr == 1 --> Controller.Shutdown

/*
ALWAYS water level, w, is between 0% and 100% i.e within safe operating levels
*/
A[] w>0 && w<100
