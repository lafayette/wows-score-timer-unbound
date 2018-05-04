@echo off

title sign score_timer_unbound

set USER_ID=9

for /R %%g in (.\\bin\\*.swf) do (
	echo %%g
	SignSWF.exe -s 2 -u %USER_ID% -k ./private_key9.txt -i "%%g"
)

REM echo Copying score_timer_unbound.swf
REM copy /v /y /b "D:\mods\score_timer_unbound\bin\score_timer_unbound.swf" "C:\Games\World_of_Warships_RU_TESTS\res_mods\0.7.4.1\gui\flash\score_timer_unbound.swf"


echo Copying ScoreTimer.swf
copy /v /y /b "D:\mods\score_timer_unbound\bin\score_timer_unbound.swf" "C:\Games\World_of_Warships_RU\res_mods\0.7.9.1\gui\flash\ScoreTimer.swf"
REM copy /v /y /b "D:\mods\score_timer_unbound\bin\score_timer_unbound.swf" "C:\Games\World_of_Warships_RU\res_mods\0.7.9.1\gui\unbound\flash\ScoreTimer.swf"
