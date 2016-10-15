require "collision"
require "controller"
require "update"
require "draw"
function love.load()
	failsound = love.audio.newSource("fail-sound.wav", "static")
	winsound = love.audio.newSource("win-sound.mp3", "static")
	gameRunning = 0
	love.mouse.setVisible(false)
	squareW = 40
	screenW = love.graphics.getWidth()
	screenH = love.graphics.getHeight()
	squares = {}
	score = 0
	screenWMid = screenW / 2
	screenHMid = screenH / 2
	x = screenWMid
	y = screenHMid
	gameover = false
	circleRadius = 10
	speed = 100
	t = 0
	randomMap(squareW, screenW, screenH, screenWMid, screenHMid)
end

function love.draw()
	drawMenu (gameRunning)	
	drawGame(r, g, b, x, y, circleRadius, squareW, score, squares)  
end
function love.update(dt)
	keyboardControll(dt, speed)
	gameover = collisionDetectionSquares()
	win = collisionDetectionBorders()

	if gameover then
		failsound:play()
		reset()
		score = 0
	end
	if win then
		winsound:play()
		score = score + 1
		reset()
	end

	changeSquare(squareW, screenW, screenH, screenWMid, screenHMid)

	t = colorChange(t, dt)

	drawGame(r, g, b, x, y, circleRadius, squareW, score, squares)

	drawMenu (gameRunning)

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