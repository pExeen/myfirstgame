function reset()
	x, y = screenWMid, screenHMid
	randomMap(squareW, screenW, screenH, screenWMid, screenHMid)
	time= 0
end

function randomMap(squareW, screenW, screenH, screenWMid, screenHMid)
	for i=1 , 500 do
		ramdomSquare(i, squareW, screenW, screenH, screenWMid, screenHMid)
	end
end

function ramdomSquare(i, squareW, screenW, screenH, screenWMid, screenHMid)



	local rx = love.math.random (screenW / squareW) * squareW
	local ry = love.math.random (screenH / squareW) * squareW
	if collisionDetectionSquare( x, y, rx, ry, squareW) then
		rx = love.math.random (screenW / squareW) * squareW
		ry = love.math.random (screenH / squareW) * squareW
	end
	local r = rx*255/screenW
	local g = ry*255/screenH
	local b = love.math.random (255)
	squares[i] = {rx, ry, r, g, b}
end

function changeSquare(squareW, screenW, screenH, screenWMid, screenHMid)
	i = love.math.random(#squares)
	ramdomSquare(i,squareW, screenW, screenH, screenWMid, screenHMid)
end
function changeColor(dt)
	if time> 1 then
		setRandomColor()
		time= 0
	end
end
function setRandomColor()
	r = love.math.random (255)
	g = love.math.random (255)
	b = love.math.random (255)
end
