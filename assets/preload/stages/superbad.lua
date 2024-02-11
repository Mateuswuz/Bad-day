function onCreate()
	-- background shit
	makeLuaSprite('stageback', 'mario/BadMario/lumpy', -240, -150);
	scaleObject('stageback', 1.6,1.6);
	
	makeLuaSprite('sofa', 'mario/BadMario/couch', -300, 0);
	scaleObject('sofa', 1.6,1.6);

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
	end
	
	addLuaSprite('stageback', false);
	addLuaSprite('sofa', false);
	
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end