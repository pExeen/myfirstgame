function collisionDetection()
	return (collisionDetectionBorders())  or (collisionDetectionSquares())
end

function collisionDetectionBorders()
	if (x <= circleRadius) 
		or (x >= screenW - circleRadius) 
		or (y <= circleRadius)
		or (y >= screenH - circleRadius) then
		return true
	end
	return false
end

function collisionDetectionSquares()
	for i=1, #squares do
		collision = collisionDetectionSquare(x, y, squares[i][1], squares[i][2], squareW)
		if collision then
			return true
		end
	end
	return false
end

function collisionDetectionSquare(x, y, squareX, squareY, squareW)
	if (x + circleRadius > squareX) 
		and (x - circleRadius < squareX + squareW) 
		and (y + circleRadius > squareY) 
		and (y - circleRadius < squareY + squareW) then
		return true
	end
	return false
end