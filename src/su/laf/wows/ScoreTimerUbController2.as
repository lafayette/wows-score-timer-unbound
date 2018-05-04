package su.laf.wows
{
	import fl.data.DataProvider;
	import lesta.components.BattleTeamScore;
	import lesta.components.BattleTimer;
	import lesta.components.CapturePoint;
	import lesta.components.Progress;
	import lesta.components.Relation;
	import lesta.constants.ComponentClass;
	import lesta.datahub.DataHub;
	import lesta.datahub.Entity;
	import lesta.structs.BattleModeInfo;
	import lesta.structs.GameInfo;
	import lesta.unbound.core.UbController;
	import lesta.unbound.expression.IUbExpression;
	import lesta.utils.GameInfoHolder;
	
	/**
	 * @author ancient
	 */
	public class ScoreTimerUbController2 extends UbController
	{
		public var scoreInfoHolder:ScoreInfoHolder = new ScoreInfoHolder();
		
		override public function init(params:Vector.<IUbExpression>):void
		{
			super.init(params);
			
			GameInfoHolder.instance.addCallback(this, GameInfoHolder.UPDATE_BATTLE_TIME, function():void
			{
				trace("ScoreTimerUbController2 UPDATE_BATTLE_TIME");
				
				/*
				   if (gameInfoHolder.battleModeInfo.battleState != PreBattleState.STARTED)
				   {
				   return;
				   }
				 */
				
				var dataHub:DataHub = ScoreTimerSingleton.instance.dataHub;
				if (dataHub == null)
				{
					trace("ScoreTimerUbController2 dataHub is null!");
					return;
				}
				
				var items:Array = GameInfoHolder.instance.battleModeInfo.rewardForHoldMsg.split(" "); // "+ 3 каждые 4 секунды"
				var holdReward:int = parseInt(items[1], 10);
				var holdPeriod:int = parseInt(items[3], 10);
				
				var score:BattleTeamScore = this.dataHub.getSingleEntity(ComponentClass.battleData).getComponent(ComponentClass.battleTeamScore) as BattleTeamScore;
				
				this.scoreInfoHolder.setWinScore(gameInfoHolder.battleModeInfo.teamWinScore);
				this.scoreInfoHolder.setHoldReward(holdReward, holdPeriod);
				this.scoreInfoHolder.setScore(score.allyScore, score.enemyScore);
				this.scoreInfoHolder.updateTimeLeft();
				
				scope.copyDataFrom(this.scoreInfoHolder);
			});
		}
	}
}
