pathfindingModule = {} --  <-- module
local function getClosest(sPos,objs,maxDist) -- starting position (sPos) is a Vector3 value
	local dist
	local closestObj
	if maxDist == nil then
		dist = math.huge -- huge number
		else
		dist = maxDist
	end
	for _, o in pairs(objs)do -- gets all objects
		if (sPos - o.Position).Magnitude > dist then
			dist = (sPos - o.Position).Magitude
			closestObj = o	
		end
		wait(-.1) -- you can delete this if you want
	end
	return closestObj
end

local pathfindingService = game:GetService("PathfindingService")


	getClosestObject = function(objs ,position, lowest)
		local object = nil
		for _, o in pairs(objs:GetChildren())do
			if o:IsA("BasePart") then
					local distance = (o.Position - position).Magnitude
					if distance < lowest then
					lowest = distance
					object = o
					elseif o:IsA("Model") then
					if o.PrimaryPart then
					local distance = (o.PrimaryPart.Position - position).Magnitude
					if distance < lowest then
					lowest = distance
					object = o
					else
					local distance = (o[name].Position - position).Magnitude
					if distance < lowest then
					lowest = distance
					object = o
				end
			end
		end	
	end
	return object
end

pathfindingModule.createPath = function(pos1, pos2) -- note the positions are Vector3 values
	local point = nil
	local path = pathfindingService:CreatePath()

	-- Compute the path
	path:ComputeAsync(pos1,pos2)
	for _, waypoint in pairs(path:GetWaypoints())do
		point = waypoint
	end
	return point -- returns it as a variable
end

return pathfindingModule
