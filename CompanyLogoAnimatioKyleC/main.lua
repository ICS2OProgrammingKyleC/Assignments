-- Title: CompanyLogoAnimation
-- Name: Your Name
-- Course: ICS2O/3C
-- This program makes my company logo fly across the screen and there is a sound when it happens

--hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--local variables for my images
local backgroundImage = display.newImageRect("Images/Pink.jpg", 2048, 1536)

--background sound
local correctSound = audio.loadSound("Sounds/correctSound.mp3")
local correctSoundChannel

-- global variables 
local scrollSpeed = 3
local scrollSpeed2 = 6

 --displays text on the screen at position x = 500 and y = 500 with
--a deafult font style and font size of 50
textObject = display.newText( "Go Go Little Pink", 950, 500, nil, 90 )

--Sets the color of the text
textObject:setTextColor(255/255, 94/255, 220/255)

-- character image with width and height 
local companyLogo = display.newImageRect("Images/companyLogo.png", 400, 400)

--correct sound
local pinkSound = audio.loadSound("Sounds/pinkSound.mp3")
local pinkSoundChannel

--set the initial x and y position of companyLogo and text
companyLogo.x = 0
companyLogo.y = display.contentHeight / 3

--Function: MoveLogo
--Input: this function accepts an event listener
--Output: none
--Description: This function adds the scroll speed to the x-value of the logo
local function MoveLogo(event)
	--add the scroll speed to the x-value of the logo
	companyLogo.x = companyLogo.x + scrollSpeed

	--change the transparency of the logo every time it so fast that it fades out
	companyLogo.alpha = companyLogo.alpha - 0.000000000000008
end

--Function: MoveLogo
--Input: this function accepts an event listener
--Output: none
--Description: This function adds the scroll speed to the x-value of the logo
local function MoveText(event)
	--add the scroll speed to the x-value of the logo
	textObject.x = textObject.x - scrollSpeed2

	--change the transparency of the logo every time it so fast that it fades out
	textObject.alpha = textObject.alpha + 0.1
end

--Movelogo and text will be called over and over again
Runtime:addEventListener("enterFrame", MoveLogo)
Runtime:addEventListener("enterFrame", MoveText)
pinkSoundChannel = audio.play(pinkSound)