@echo off

cls

title xml2as: ScoreTimer
"./dist/xml2as.exe" -i scoretimer.xml -n ScoreTimer -f "D:/mods/xml2as/FlexSDK"

echo Copying scoretimer.xml
copy /v /y /b "./scoretimer.xml" "C:\Games\World_of_Warships_RU_TESTS\res_mods\0.7.4.1\gui\unbound\scoretimer.xml"

echo Copying ScoreTimer.swf (temporary)
copy /v /y /b "./ScoreTimer.as" "D:\mods\score_timer_unbound\src\ScoreTimer.as"

echo Completed: %DATE% %TIME%
