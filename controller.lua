function keyboardControll(dt,speed)
	if love.keyboard.isDown("right") or love.keyboard.isDown("d") then
		x = x + speed * dt
	end
	if love.keyboard.isDown("left") or love.keyboard.isDown("a") then
		x = x - speed * dt
	end
	if love.keyboard.isDown("down") or love.keyboard.isDown("s") then
		y = y + speed * dt
	end
	if love.keyboard.isDown("up") or love.keyboard.isDown("w") then
		y = y - speed * dt
	end
end
