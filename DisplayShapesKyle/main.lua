-----------------------------------------------------------------------------------------
--Title: DisplayingShapes
--Name: Kyle C 
--Course ICS2O/3C
--This pogram displays multiple shapes and their names

-- create my local variables
local textSize = 50

-- set the background color of my screen.
display.setDefault("background", 87/255, 255/255, 15/255)

-- to remove status bar 
display.setStatusBar(display.HiddenStatusBar)

-- Draw the rounded rectangle
local myRoundedRect = display.newRoundedRect( 200, 480, 300, 100, 20 )

--set color of the rounded rectangle
myRoundedRect:setFillColor(255, 255, 0)

myRoundedRect.strokeWidth = 16

--set color of the rounded rectangle 
myRoundedRect:setStrokeColor( 0, 0, 0)

-- draw the polygon
local myPolygon
local vertices = { 0,-110, 105,-35, 43,16, 65,90, 0,45, }
myPolygon = display.newPolygon( 256, 192, vertices )
myPolygon.fill = { 1, 1, 0 }
myPolygon.strokeWidth = 16
myPolygon:setStrokeColor( 0, 0, 0 )

--text for rounded rectangle
textObject = display.newText("Rounded Rectangle", 250, 570, Arial, textSize )

--text for polygon
textObject = display.newText("Polygon", 250, 325, Arial, textSize )

-- draw the triangle
local verticesTriangle = {-100,-100, 100,-100, 0,100}
local myTriangle = display.newPolygon(700, 200, verticesTriangle)

-- set color for the triangle
myTriangle:setFillColor(255, 255, 0)

myTriangle.strokeWidth = 16

-- set the border color for triangle
myTriangle:setStrokeColor(0, 0, 0)

--text fo triangle
textObject = display.newText("Triangle", 700, 350, Arial, textSize )

-- by kyle
textObject = display.newText("By: Kyle", 780, 735, Arial, textSize )