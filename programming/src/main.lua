local drawqueue, stepqueue

function love.load()
	print "Entering love.load()"
	
	drawqueue = require"eventqueue".new("draw")
	stepqueue = require"eventqueue".new("update")
	
	print "Leaving love.load()"
end

function love.update(dt)
	stepqueue:runall(dt)
end

-- No game logic here please!
function love.draw()
	drawqueue:runall()
end

function love.quit()
	
end