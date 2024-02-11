function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'note_bad' then --Check if the note on the chart is a Bullet Note
                   setPropertyFromGroup('unspawnNotes', i, 'texture', 'badMario_NOTE_assets'); --Change texture

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has penalties
			end
		end
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'note_bad' then
		characterPlayAnim('dad', 'shroom', true);
		characterPlayAnim('boyfriend', 'hit', true);
		setProperty('boyfriend.specialAnim', true);
		setProperty('dad.specialAnim', true);
		setProperty('health', getProperty('health')-0.2);
		runTimer('bleed', 0.2, 20);
    end
end

function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == 'note_bad' then
		characterPlayAnim('boyfriend', 'idle', true);
		setProperty('boyfriend.specialAnim', true);
		setProperty('dad.specialAnim', true);
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