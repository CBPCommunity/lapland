--[[
#Event queue
Calls a specified method of every object in the list.
This implementation uses arrays for the actual queue! Please
keep in mind that this is only fast when iterating and not so
fast when inserting/deleting elements other than from the
end of the queue. If at any point the game starts having
too many objects at the same time, a new implementation
using linked lists should be used instead. -- I do not expect this to ever happen in a VN though
--]]

local class = {} -- The actual class, duh
local __class = {__index=class} -- The metatable for all instances

function class.new(method) --> talbe
	return setmetatable({queue={}, method=method}, __class)
end

function class:runall(...) --> boolean
-- Runs specified method of every item
	local method = self.method
	for _,member in ipairs(self.queue) do
		member[method](...)
	end
	return true
end

function class:insert(element, location) --> integer
-- Insert item at given position or at the end (|warning| may run slow!)

	return location
		and table.insert(self.queue, location, element)
		or table.insert(self.queue, element)
		and #self.queue
end

function class:remove(element) --> boolean
-- Remove item (|Warning!| may run slow!)

	for index, value in ipairs(self.queue) do
		if value==element then
			table.remove(self.queue, index)
			return true
		end
	end
	return false
end

return class