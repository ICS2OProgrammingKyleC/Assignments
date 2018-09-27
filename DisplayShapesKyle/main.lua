-----------------------------------------------------------------------------------------
--Title: DisplayingShapes
--Name: Kyle C 
--Course ICS2O/3C
--This pogram displays multiple shapes and their names

-- create my local variables
local mPolygon
local Polygon
-- set the background color of my sceen.
display.setDefault("background", 87/255, 255/255, 15/255)

-- to remove status bar 
display.setStatusBar(display.HiddenStatusBar)

-- draw the polygon that is half the width and height of the screen size.
myCircle = display.newCircle(852, 140, 130)