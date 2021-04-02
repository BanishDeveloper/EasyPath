pathfindingModule = {} --  <-- module
local pathfindingService = game:GetService("PathfindingService")



getClosestObject = function(objs ,position, lowest, name) -- positions are vectors
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
