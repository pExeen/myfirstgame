function reset()
	x = screenWMid
	y = screenHMid
	gameover = false
	randomMap(squareW, screenW, screenH, screenWMid, screenHMid)
	t = 0
end

function randomMap(squareW, screenW, screenH, screenWMid, screenHMid)
	for i=1 , 500 do
		ramdomSquare(i, squareW, screenW, screenH, screenWMid, screenHMid) 
	end
end

function ramdomSquare(i, squareW, screenW, screenH, screenWMid, screenHMid)
	rr = love.math.random (255)
	rg = love.math.random (255)
	rb = love.math.random (255)


	rx = love.math.random (screenW / squareW) * squareW
	ry = love.math.random (screenH / squareW) * squareW 
	if collisionDetectionSquare( x, y, rx, ry, squareW) then
		rx = love.math.random (screenW / squareW) * squareW
		ry = love.math.random (screenH / squareW) * squareW 
	end	
	squares[i] = {rx, ry, rx*255/screenW, ry*255/screenH, rb}
end

function changeSquare(squareW, screenW, screenH, screenWMid, screenHMid)
	i = love.math.random(#squares)
	ramdomSquare(i,squareW, screenW, screenH, screenWMid, screenHMid) 
end
function colorChange(t, dt)
	if (t == 0) or (t > 1) then
		setRandomColor()
		t = 0.001
	end
	t = t + dt
	return t
end
function setRandomColor()
	r = love.math.random (255)
	g = love.math.random (255)
	b = love.math.random (255)
end