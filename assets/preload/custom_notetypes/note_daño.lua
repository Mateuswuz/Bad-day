function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'note_daño' then --Check if the note on the chart is a Bullet Note
                   setPropertyFromGroup('unspawnNotes', i, 'texture', 'invisibleMario_NOTE_assets'); --Change texture

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has penalties
			end
		end
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'note_daño' then
    	playSound('bad-day/smw_shell_kick', 1);
		characterPlayAnim('dad', 'shell', true);
		characterPlayAnim('boyfriend', 'hit', true);
		setProperty('boyfriend.specialAnim', true);
		setProperty('dad.specialAnim', true);
		setProperty('health', getProperty('health')-0.1);
		runTimer('bleed', 0.2, 20);
    end
end

function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == 'note_daño' then
     	playSound('bad-day/smw_shell_kick', 1);
		characterPlayAnim('boyfriend', 'hit', true);
		characterPlayAnim('dad', 'shell', true);
		setProperty('boyfriend.specialAnim', true);
		setProperty('dad.specialAnim', true);
		setProperty('health', getProperty('health')-0.1);
		runTimer('bleed', 0.2, 20);
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	-- A loop from a timer you called has been completed, value "tag" is it's tag
	-- loops = how many loops it will have done when it ends completely
	-- loopsLeft = how many are remaining
	if loopsLeft >= 1 then
		setProperty('health', getProperty('health')-0.001);
	end
end