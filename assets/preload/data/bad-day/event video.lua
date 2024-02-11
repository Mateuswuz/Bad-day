function onStepHit()
if curStep== 1 then
startVideo('BadIntro');
setProperty('inCutscene', false);
addLuavideo('forgottenscene', false);
end
if curStep== 12 then
setProperty('camGame.visible', true);
setProperty('camHUD.visible', true);
end
end