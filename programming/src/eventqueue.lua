--[[
#Event queue
Calls a specified method of every object in the list
--]]

local class = {}
local __class = {__index=class}

function class.new(method)
-- Constructor
	return setmetatable({queue={}, method=method}, __class)
end

function class:runall(...)
-- Runs specified method of every item
	local method = self.method
	for _,member in ipairs(self.queue) do
		member[method](...)
	end
	return true
end

function class:insert(element, location)
-- Insert item at given position or at the end (may run slow)
	return location
		and table.insert(self.queue,location,element)
		or table.insert(self.queue,element)
end

function class:remove(element)
-- Remove item (may run slow)
	for index, value in ipairs(self.queue) do
		if value==element then
			table.remove(self.queue, index)
			return true
		end
	end
	return false
end

return class