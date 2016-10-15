function drawGame(r, g, b, x, y, circleRadius, squareW, score, squares)
	if gameRunning == 1 then
		love.graphics.setNewFont(14)
		love.graphics.print ( "Score : "..score, 0, 0)
		love.graphics.setColor(r, g, b)
		love.graphics.circle("fill", x, y, circleRadius, 100) -- Draw white circle with 100 segments.
		for i=1, #squares do
			love.graphics.setColor(squares[i][3],  squares[i][4], squares[i][5])
			love.graphics.rectangle("fill", squares[i][1], squares[i][2], squareW, squareW)
		end
	end
end

function drawMenu (menu)
	if gameRunning == 0 then
		love.graphics.setColor(r, g, b)
		love.graphics.setNewFont(40)
		love.graphics.print("Press ENTER to play or ESC to quit", screenWMid - 350, screenHMid)
	end
end