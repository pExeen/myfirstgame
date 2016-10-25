require "collision"
require "controller"
require "update"
require "draw"
function love.load()
	setRandomColor()
	failsound = love.audio.newSource"fail-sound.wav"
	winsound = love.audio.newSource"win-sound.mp3"
	gameRunning = 0
	love.mouse.setVisible(false)
	squareW = 40
	screenW, screenH = love.graphics.getDimensions()
	squares = {}
	squareW = screenH / 27
	score = 0
	screenWMid, screenHMid = screenW / 2, screenH / 2
	x , y = screenWMid, screenHMid
	circleRadius = squareW / 4
	speed = 100
	t = 0
	randomMap(squareW, screenW, screenH, screenWMid, screenHMid)
end

function love.draw()
	drawMenu (gameRunning)	
	drawGame(r, g, b, x, y, circleRadius, squareW, score, squares)  
end
function love.update(dt)
	t = t + dt

	keyboardControll(dt, speed)

	changeSquare(squareW, screenW, screenH, screenWMid, screenHMid)

	changeColor(dt)

	updateCollision()

end

function love.keypressed(k)
	if k == 'escape' then
		if gameRunning == 1 then
			gameRunning = 0
		else
  			love.event.quit()
  		end
	end
	if k == 'r' then
  		reset()
	end
	if k == 'lshift' then
		speed = speed * 3
	end
	if k == 'return' then
		menu = 0
		gameRunning = 1
	end
end

function love.keyreleased(key)
	if key == "lshift" then
		speed = 100
	end
end

function gameover()
	failsound:play()
	reset()
	score = 0
end

function win()
	winsound:play()
	score = score + 1
	reset()
end