Совмещение с другими модами
1. Скопировать gui\unbound\scoretimer.xml в res_mods\<версия игры>\gui\unbound\scoretimer.xml

2. Скопировать gui\flash\ScoreTimer.swf в res_mods\<версия игры>\gui\flash\ScoreTimer.swf

3. В res_mods\<версия игры>\gui\flash\USSExpressionsLoader.xml добавить строку <file path="ScoreTimer.swf"/> перед строкой <file path="USSExpressions.swf" />

4. В /res_mods/<версия игры>/gui/battle_elements.xml перед строкой </elementList> добавить следующее
<element name="unboundScoreTimer" class="lesta.libs.unbound.UnboundElement" url="ScoreTimer.swf">
	<properties config="../unbound/scoretimer.xml" rootElementId="ScoreTimer" hitTest = "true" />
</element>

5.В /res_mods/<версия игры>/gui/battle_elements.xml после строки <controllers> добавить следующее:
<controller class="lesta.dialogs.battle_window_controllers.UnboundElementController" clips="unboundScoreTimer"/>

6. Скопировать папку gui\scoretimer_icons в res_mods\<версия игры>\gui\scoretimer_icons



Сброс позиции
В preferences.xml найти строки с тегами <STEnemy> и <STAlly> (каждый встречается дважды) и удалить эти строки.

Пример до:
<IMPositionX>
	<IM>	1519.2000	</IM>
	<STEnemy>	1328.0000	</STEnemy>
	<STAlly>	1001.0000	</STAlly>
</IMPositionX>
<IMPositionY>
	<IM>	216.3000	</IM>
	<STEnemy>	95.0000	</STEnemy>
	<STAlly>	91.0000	</STAlly>
</IMPositionY>

Пример после:
<IMPositionX>
	<IM>	1519.2000	</IM>
</IMPositionX>
<IMPositionY>
	<IM>	216.3000	</IM>
</IMPositionY>
