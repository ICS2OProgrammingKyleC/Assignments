-- Title: Animating Images
-- Name: Kyle christensen
-- Course: ICS2O/3C
-- This program moves different images across the screen.

--hide status bar
display.setStatusBar(display.HiddenStatusBar)

--local variables for my images
local backgroundImage = display.newImageRect("Images/space.jpg", 2048, 1536)
local narutochan = display.newImageRect("Images/narutochan.png", 250, 250)
local sasuke = display.newImageRect("Images/sasuke.png", 350, 350)
local madara = display.newImageRect("Images/madara.png", 400, 400)
local scrollSpeed1 = 4
local scrollSpeed2 = 5

--set only narytochan to be transparent
sasuke.alpha = 0
narutochan.alpha = 1
madara.alpha = 0

--set the initial x and y position of narutochan, sasuke and madara
sasuke.x = display.contentWidth
sasuke.y = display.contentHeight*2/3

narutochan.x = 0
narutochan.y = display.contentHeight / 3

madara.x = 0
madara.y = 0

--Function: MoveSasuke
--Input: this function accepts an event listener
--output: none
--Description: This Function adds the scroll speed to the x-value of Sasuke
local function MoveSasuke(event)
	--add the scroll speed to the x-value of sasuke
	sasuke.x = sasuke.x - scrollSpeed1
	--change the transparency of sasuke so it fades out
	sasuke.alpha = sasuke.alpha + 0.01
	sasuke:scale(0.995, 0.995)
end

--MoveSasuke will be called over and over again 
Runtime:addEventListener("enterFrame", MoveSasuke)

--Function: MoveNarutochan
--Input: this function accepts an event listener
--output: none
--Description: This Function adds the scroll speed to the x-value of narutochan
local function MoveNarutochan(event)
	--add the scroll speed to the x-value of narutochan 
	narutochan.x = narutochan.x + scrollSpeed2
	--change the transparency of narutochan so it fades out
	narutochan.alpha = narutochan.alpha - 0.0000000009
end
Runtime:addEventListener("enterFrame", MoveNarutochan)

--Function: MoveMadara
--Input: this function accepts an event listener
--output: none
--Description: This Function adds the scroll speed to the x-value of madara
local function MoveMadara(event)
	--add the scroll speed to the x-value of madara
	madara.x = madara.x + scrollSpeed1
	madara.y = madara.y + scrollSpeed1
	--change the transparency of madara so it fades in
	madara.alpha = madara.alpha + 0.01
end
Runtime:addEventListener("enterFrame", MoveMadara)

--display text on screen that says "wassup boi"
textObjectSignature = display.newText("wassup Boi", 500, 500, nil, 50)
