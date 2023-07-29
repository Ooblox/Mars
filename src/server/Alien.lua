local Ts = game:GetService("TweenService")

local CreateClass = require(game.ReplicatedStorage.ModuleScripts.CreateClass)

local AlienExp = script.Parent
local Humanoid = script.Parent.Humanoid

local AlienClass = CreateClass(function(self)
	self.Speed = 5
	self.Climbing = false
	self.PlayingAnim = nil
	
	self.Move = function(MoveAmount)
		script.Parent.HumanoidRootPart.CFrame = CFrame.new(script.Parent.HumanoidRootPart.Position, script.Parent.HumanoidRootPart.Position + MoveAmount)
		Ts:Create(script.Parent.HumanoidRootPart, TweenInfo.new(MoveAmount.Magnitude/self.Speed, Enum.EasingStyle.Linear), {Position = script.Parent.HumanoidRootPart.Position + MoveAmount}):Play()
		
		self.PlayingAnim = script.Parent.Humanoid:LoadAnimation(script.Parent.Animations.Move)
		self.PlayingAnim:Play()
		
		wait(MoveAmount.Magnitude/self.Speed)
	
		if not self.Climbing then
			self.PlayingAnim:Stop()

		end
		
		self.DecideWhereToMove()
	end
	
	self.DetectNearbyPlayer = function()
		
	end
	
	self.DetectWallHit = function()
		
	end
	
	self.DecideWhereToMove = function()
		if self.DetectWallHit() then
			
		elseif self.DetectNearbyPlayer() then
			
		else
			self.Move(Vector3.new(math.random(-10, 10), 0, math.random(-10, 10)))
		end
		
	end
end)

local Alien = AlienClass.new()
Alien.DecideWhereToMove()