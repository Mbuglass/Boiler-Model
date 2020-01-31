# Boiler Model
A boiler model made using UPPAAL (2018)

Model is in .xml file, queries for validation are stored in .q file.

Makes use of steam and water level sensors to ensure water is always between the Min and Max level, and that steam never exceeds the Max level.
If either of these values falls outside the permitted limit, the boiler will shutdown.
Sensors must also respons within a permitted timeframe else the system will shutdown.
An emergency stop/reset button is also present to manually shutdown and reset the system 
>*Note: Emergency stop button should be disabled if attempting to carry out automated runs, else the system will shutdown frequently due to similated button presses*.
