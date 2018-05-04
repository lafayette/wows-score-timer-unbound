package su.laf.wows
{
	import lesta.components.BattleTeamScore;
	import lesta.components.CapturePoint;
	import lesta.components.Progress;
	import lesta.components.Relation;
	import lesta.constants.ComponentClass;
	import lesta.constants.PlayerRelation;
	import lesta.datahub.Collection;
	import lesta.datahub.DataHub;
	import lesta.datahub.Entity;
	import lesta.unbound.core.UbController;
	import lesta.unbound.expression.IUbExpression;
	import lesta.utils.GameInfoHolder;
	
	/**
	 * @author ancient
	 */
	public class ScoreTimerUbController extends UbController
	{
		public var scoreInfoHolder:ScoreInfoHolder = new ScoreInfoHolder();
		
		override public function init(params:Vector.<IUbExpression>):void
		{
			trace("ScoreTimerUbController.init");
			super.init(params);
			GameInfoHolder.instance.addCallback(this, GameInfoHolder.UPDATE_BATTLE_TIME, this.onUpdate);
		}
		
		override public function enable():void
		{
			super.enable();
			GameInfoHolder.instance.addCallback(this, GameInfoHolder.UPDATE_BATTLE_TIME, this.onUpdate);
		}
		
		override public function disable():void
		{
			GameInfoHolder.instance.removeCallback(this);
			super.disable();
		}
		
		override public function free():void
		{
			GameInfoHolder.instance.removeCallback(this);
			super.free();
		}
		
		private function onUpdate():void
		{
			var dataHub:DataHub = scope.dataHub as DataHub;
			if (dataHub == null)
			{
				trace("ScoreTimerUbController dataHub is null!");
				return;
			}
			
			var capturePoints:Array = this.getCapturePoints(dataHub);
			var holdReward:Array = this.getHoldReward();
			var score:BattleTeamScore = dataHub.getSingleEntity(ComponentClass.battleData).getComponent(ComponentClass.battleTeamScore) as BattleTeamScore;
			
			this.scoreInfoHolder.setPoints(capturePoints[0], capturePoints[1]);
			this.scoreInfoHolder.setWinScore(GameInfoHolder.instance.battleModeInfo.teamWinScore);
			this.scoreInfoHolder.setBattleTimeLeft(GameInfoHolder.instance.battleModeInfo.battleTimeLeft);
			this.scoreInfoHolder.setHoldReward(holdReward[0], holdReward[1]);
			this.scoreInfoHolder.setScore(score.allyScore, score.enemyScore);
			this.scoreInfoHolder.updateCounters();
			this.scoreInfoHolder.updateScope(this.scope);
		
			// scope.copyDataFrom(this.scoreInfoHolder.getDict());
			// trace("ScoreTimerUbController copyDataFrom " + this.scoreInfoHolder.winScore);
		}
		
		private function getCapturePoints(dataHub:DataHub):Array
		{
			var allyPoints:int = 0;
			var enemyPoints:int = 0;
			
			var pointsCol:Collection = dataHub.getCollection(ComponentClass.capturePoint)
			var capturePointEntity:Entity = null;
			for each (capturePointEntity in pointsCol.items)
			{
				var point:CapturePoint = capturePointEntity.capturePoint;
				var progress:Progress = capturePointEntity.progress;
				var relation:Relation = capturePointEntity.relation;
				
				if (point.bothInside || progress.value != 0)
				{
					// ignore contested points
					continue;
				}
				
				switch (relation.value)
				{
				case PlayerRelation.FRIEND: 
					allyPoints++;
					break;
				case PlayerRelation.ENEMY: 
					enemyPoints++;
					break;
				}
			}
			
			return [allyPoints, enemyPoints];
		}
		
		private function getHoldReward():Array
		{
			var holdReward:int = 0;
			var holdPeriod:int = 0;
			
			var holdRewardStr: String = GameInfoHolder.instance.battleModeInfo.rewardForHoldMsg;
			var expr: RegExp = /^[^0-9]+([0-9]+?)[^0-9]+([0-9]+?)[^0-9]+$/g;
			var result: Object = expr.exec(holdRewardStr);
			
			if (result != null) {
				holdReward = parseInt(result[1], 10);
				holdPeriod = parseInt(result[2], 10);
			} else {
				// Fallback
				var items:Array = holdRewardStr.split(" "); // "+ 3 каждые 4 секунды"
				holdReward = parseInt(items[1], 10);
				holdPeriod = parseInt(items[3], 10);
			}
			
			return [holdReward, holdPeriod];
		}
	}
}
