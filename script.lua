if car.isAIControlled then
  return nil
end

local diffMode = 0
local un_extraB = car.extraB
local messageTime = 0

function script.update(dt)

	local data = ac.accessCarPhysics()

		if car.extraB ~= un_extraB and diffMode <= 2 then
			diffMode = diffMode + 1
			un_extraB = car.extraB
			messageTime = 0
		end
	
		if diffMode > 2 then
			diffMode = 0
		end

		if diffMode == 0 and messageTime <= 0.5 then
			ac.setMessage("Mode", 'Normal') 
			messageTime = messageTime + dt
		elseif diffMode == 1 and messageTime <= 0.5 then
			ac.setMessage("Mode", 'Track')
			messageTime = messageTime + dt
		elseif diffMode == 2 and messageTime <= 0.5 then
			ac.setMessage("Mode", 'Sport')
			messageTime = messageTime + dt
		end

	data.controllerInputs[0]=diffMode

end