-- Name: Kyle Christensen
-- Course: ICS2O/3C
-- This program makes a Math quiz for young children.

--hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--sets the background colour
display.setDefault("background", 98/255, 126/255, 255/255)

--------------------------------------------------------
-- LOCAL VARIABLES
--------------------------------------------------------
--create variables for the timer
local totalSeconds = 15
local secondsLeft = 15
local clockText
local countDownTimer
local gameOver
local lives = 3
local youWin

--create other local variables 
local questionObject
local correctObject
local incorrectObject
local numericField
local randomNumber1
local randomNumber2
local randomOperator
local userAnswer
local incorrectAnswer
local correctAnswer
local pointsTextObject
local numberOfPoints = 0

--------------------------------------------------------
-- SOUNDS
--------------------------------------------------------
--correct sound
local correctSound = audio.loadSound("Sounds/correctSound.mp3")
local correctSoundChannel
--Incorrect Sound
local wrongSound = audio.loadSound("Sounds/wrongSound.mp3")
local wrongSoundChannel
--gameover
local GameOver = audio.loadSound("Sounds/GameOver.mp3")
local GameOverChannel
--you win
local youWin = audio.loadSound("Sounds/youWin.mp3")
local youWinChannel


--------------------------------------------------------
-- LOCAL FUNCTIONS
--------------------------------------------------------
local function UpdateHearts()
 if (lives == 3) then
      heart1.isVisible = true
      heart2.isVisible = true
      heart3.isVisible = true

     elseif (lives == 3) then
      heart1.isVisible = true
      heart2.isVisible = true
      heart3.isVisible = true
  
     elseif (lives == 2) then
      heart1.isVisible = true
      heart2.isVisible = true
      heart3.isVisible = false

     elseif (lives == 1) then
      heart1.isVisible = true
      heart2.isVisible = false
      heart3.isVisible = false

     elseif (lives == 0) then
      heart1.isVisible = false
      heart2.isVisible = false
      heart3.isVisible = false
      gameOver.isVisible = true
      GameOverChannel = audio.play(GameOver)
      numericField.isVisible = false
      pointsTextObject.isVisible = false
      questionObject.isVisible = false
     end
end
-------------------------------------------------------------
local function UpdateTime()
 -- decrement the number of sounds left
 secondsLeft = secondsLeft - 1
 --display the number of seconds left in the
 --clock object
 clockText.text = secondsLeft .. ""
 if (secondsLeft == 0 ) then
  --reset the  number of seconds left 
  secondsLeft = totalSeconds
  lives = lives - 1
  --***IF THERE ARE NO LIVES LEFT, PLAY A LOSE SOUND,
  --SHOW A "YOU LOSE IMAGE AND CANCEL THE TIMER, REMOVE
  --REMOVE THE THIRD HEART BY MAKIND IT INVISIBLE
     UpdateHearts()
  --*** CALL THE FUNCTION TO ASK A NEW QUESTION
 end
end
------------------------------------------------------------------------
--function that calls the timer
local function StartTime()
 -- create a countdown timer that loops infinitely
 countDownTimer = timer.performWithDelay( 1600, UpdateTime, 0)
end

-- local functions 
local function AskQuestion()
 --generate 2 random numbers between a max. and a min. number
 randomOperator = math.random(1,4)
 randomNumber1 = math.random(1,20)
 randomNumber2 = math.random(1,20)
 randomNumber3 = math.random(1,10)
 randomNumber4 = math.random(1,100)


  if (randomOperator == 1) then
  questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = "
   correctAnswer = randomNumber1 - randomNumber2
 
  --create question in text object
 elseif (randomOperator == 2) then
    correctAnswer = randomNumber1 + randomNumber2
    questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

  --create question in text object
 elseif (randomOperator == 3) then
   correctAnswer = randomNumber1 * randomNumber2
    questionObject.text = randomNumber1 .. " * " .. randomNumber2 .. " = "

  --create question in text object
 elseif (randomOperator == 4) then
    correctAnswer = randomNumber1 / randomNumber2
    questionObject.text = randomNumber1 .. " / " .. randomNumber2 .. " = "

 end 
end

local function YouWin( )
    -- monitor points till they reach 5
  if (numberOfPoints == 5) then
    -- display the you win screen
    youWin.isVisible = true

    --make the the unneeded objets invisible
    clockText.isVisible = false
    pointsTextObject.isVisible = false
    questionObject.isVisible = false
    numericField.isVisible = false
    --play youwin sound
    youWinSoundChannel = audio.play(youWinSound)

  end
end

local function HideCorrect()
 correctObject.isVisible = false
 AskQuestion()
end
local function HideIncorrect()
 incorrectObject.isVisible = false 
 AskQuestion()
end


local function NumericFieldListener( event )
 --User begins editing "numericFeild"
 if ( event.phase == "began" ) then
  --clear text field 
  event.target.text = ""
 elseif event.phase == "submitted" then
  -- when the answer is submitted (enter key is pressed) set user input bto user's answer
  userAnswer = tonumber(event.target.text)
  --if the user's answer and the correct answer and the correct answer are the same:
  if (userAnswer == correctAnswer) then
      --correct object is vible when the answer is right
   		correctObject.isVisible = true 
      --the correct sound channel plays when the answer is correct
   		correctSoundChannel = audio.play(correctSound)
      -- hides correct for two seconds after it is called 
   		timer.performWithDelay(2000,HideCorrect)
      -- the number of points updates when the answer is right
   		numberOfPoints = numberOfPoints + 1
   		-- you win function is called
      YouWin()
      -- the text field is cleared and reset
      event.target.text = ""
      -- amount of seconds is reset 
   		secondsLeft = totalSeconds
      -- create increasing points in the text object
      pointsTextObject.text = "Points = ".. numberOfPoints
  elseif (userAnswer ~= correctAnswer) then
      --the incorrect text shows up after you get a wrong answer
   		incorrectObject.isVisible = true
      -- the wrong sound channel shows up after you get the answer wrong
   		wrongSoundChannel = audio.play(wrongSound)
      -- your lives decrease when you get the answer wrong
   		lives = lives - 1
      -- your lives are updated to show the amount you have left
   		UpdateHearts()


      -- this tells you the correct answer when you are wrong
      incorrectObject.text = "The correct answer is " .. correctAnswer
   		-- this makes the timer have a delay
      timer.performWithDelay(2000,HideIncorrect)
   		-- clears the text feild and make a new one 
      event.target.text = ""
      -- resets the timer
      secondsLeft = totalSeconds   
  end
 end
end
------------------------------------------------------------
--OBJECTS CREATION
------------------------------------------------------------
--create the lives to display on the screen
heart1 = display.newImageRect("Images/hearts.png", 100,100)
heart1.x = display.contentWidth * 7 / 8
heart1.y = display.contentHeight * 1 / 7
heart2 = display.newImageRect("Images/hearts.png", 100, 100)
heart2.x = display.contentWidth * 6 / 8
heart2.y = display.contentHeight * 1 / 7
heart3 = display.newImageRect("Images/hearts.png", 100, 100)
heart3.x = display.contentWidth * 5 / 8
heart3.y = display.contentHeight * 1 / 7

--display the timer on the screen
clockText = display.newText(secondsLeft, 520, 680, nil, 190)
clockText:setFillColor( 144/255, 234/255, 86/255 )
--create and display game over on the screen
gameOver = display.newImageRect("Images/gameOver.png", display.contentWidth, display.contentHeight)
gameOver.anchorX = 0
gameOver.anchorY = 0
gameOver.isVisible = false

--create and display game over on the screen
youWin = display.newImageRect("Images/youWin.png", display.contentWidth, display.contentHeight)
youWin.anchorX = 0
youWin.anchorY = 0
youWin.isVisible = false

-- create points box and make it visible
pointsTextObject = display.newText( "Points = ".. numberOfPoints, 800, 385, nil, 50 )
pointsTextObject:setTextColor(24/255, 119/255, 25/255)

-- display a question and sets the color 
questionObject = display.newText("", display.contentWidth/3, display.contentHeight/2, nil, 80)
questionObject:setTextColor(10/255, 10/255, 70/255)

-- create the correct  text object and make it invisible
correctObject = display.newText("Ayy Correct", display.contentWidth/2, 250, nil, 60)
correctObject:setTextColor(10/255, 50/255, 226/255)
correctObject.isVisible = false

-- create the incorrect  text object and make it invisible
incorrectObject = display.newText("Incorrect boii", display.contentWidth/2, 250, nil, 50)
incorrectObject:setTextColor(4/255, 224/255, 19/255)
incorrectObject.isVisible = false
-----------------------------------------------------------
-- CREATE THE NUMERIC FIELD 
------------------------------------------------------------
numericField = native.newTextField(display.contentWidth/3, display.contentHeight*2/3, 150, 150)
numericField.inputType = "default"
--add the event listener fo the numeric field
numericField:addEventListener( "userInput", NumericFieldListener)
---------------------------------------------------------
-- FUNCTION CALLS
----------------------------------------------------------
-- call the function to ask the Question
AskQuestion()
StartTime()