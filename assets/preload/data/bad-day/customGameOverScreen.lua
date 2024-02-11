local deathcharacterName = 'bfbaddeath' --Character json file for the death animation
local deathSoundName = 'fnf_loss_sfx' --put in mods/sounds/
local deathloopSoundName = 'badover' --put in mods/music/
local deathendSoundName = 'badoverEND' --put in mods/music/

function onCreate()
    if stringStartsWith(version, '0.6') or stringStartsWith(version, '0.5') or stringStartsWith(version, '0.4') then
        setPropertyFromClass('GameOverSubstate', 'characterName', deathcharacterName); 
    	setPropertyFromClass('GameOverSubstate', 'deathSoundName', deathSoundName); 
    	setPropertyFromClass('GameOverSubstate', 'loopSoundName', deathloopSoundName); 
    	setPropertyFromClass('GameOverSubstate', 'endSoundName', deathendSoundName); 
	else
    	setPropertyFromClass('substates.GameOverSubstate', 'characterName', deathcharacterName);
    	setPropertyFromClass('substates.GameOverSubstate', 'deathSoundName', deathSoundName);
        setPropertyFromClass('substates.GameOverSubstate', 'loopSoundName', deathloopSoundName); 
    	setPropertyFromClass('substates.GameOverSubstate', 'endSoundName', deathendSoundName); 
	end
end