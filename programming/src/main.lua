local drawqueue, stepqueue

function love.load()
	print "Hello World :)"
	drawqueue = require"eventqueue".new("draw")
	stepqueue = require"eventqueue".new("update")
end

function love.quit()
	
end

function love.draw()
	drawqueue:runall()
end

function love.update(dt)
	stepqueue:runall(dt)
end

function love.keypressed(key, scancode, isrepeat)
	
end