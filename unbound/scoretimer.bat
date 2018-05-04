@echo off

cls

title xml2as: ScoreTimer
"./dist/xml2as.exe" -i scoretimer.xml -n ScoreTimer -f "C:/mods/xml2as/FlexSDK"

echo Copying scoretimer.xml
copy /v /y /b "./scoretimer.xml" "C:\Games\World_of_Warships_RU_TESTS\res_mods\0.7.4.0\gui\unbound\scoretimer.xml"

echo Copying ScoreTimer.swf
copy /v /y /b "./ScoreTimer.swf" "C:\Games\World_of_Warships_RU_TESTS\res_mods\0.7.4.0\gui\unbound\flash\ScoreTimer.swf"

echo Copying ScoreTimer.swf (temporary)
copy /v /y /b "./ScoreTimer.swf" "C:\Games\World_of_Warships_RU_TESTS\res_mods\0.7.4.0\gui\flash\ScoreTimer.swf"

echo Completed: %DATE% %TIME%
