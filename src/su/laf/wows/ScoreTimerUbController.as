package su.laf.wows
{
	import fl.data.DataProvider;
	import lesta.components.BattleTeamScore;
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
	public class ScoreTimerUbController extends UbController
	{
		public var scoreInfoHolder:ScoreInfoHolder = new ScoreInfoHolder();

        public function ScoreTimerUbController() { }
		
		override public function init(params:Vector.<IUbExpression>): void {
			super.init(params);
			var arg1:* = params[0].eval(this.scope);
			
			//this.bannerChangeTimer = new Timer(arg1);
			//this.bannerChangeTimer.addEventListener(TimerEvent.TIMER, this.getRandomSSEItem);
			//this.bannerChangeTimer.start();
			
			// var holder: GameInfoHolder = GameInfoHolder.instance.getDataByID(
			
			
			// GameInfoHolder.UPDATE_BATTLE_MODE_INFO?
			GameInfoHolder.instance.addCallback(this, GameInfoHolder.BATTLE_MODE_INFO, function (battleModeInfo: BattleModeInfo):void {
				var items:Array = battleModeInfo.rewardForHoldMsg.split(" "); // "+ 3 каждые 4 секунды"
				var reward:int = parseInt(items[1], 10);
				var period:int = parseInt(items[3], 10);
				
				this.scoreInfoHolder.setHoldReward(reward, period);
				scope.copyDataFrom(this.scoreInfoHolder);
			});
			
			// GameInfoHolder.instance.addCallback(this, GameInfoHolder.BATTLE_TEAM_SCORE, function (battleTeamScore: BattleTeamScore) { });
			
			var dataHub: DataHub = ScoreTimerSingleton.instance.dataHub;
			if (dataHub == null) {
				trace("dataHub is null!");
				return;
			}
			
			var scoreFunc:Function = function(score: BattleTeamScore):void {
				this.scoreInfoHolder.setScore(score.allyScore, score.enemyScore);
				scope.copyDataFrom(this.scoreInfoHolder);
			};
			dataHub.getSingleEntity(ComponentClass.battleData).subscribe(
				ComponentClass.battleTeamScore,
				function(score: BattleTeamScore):void {
					score.evEnemyScoreChanged.addCallback(scoreFunc);
					score.evAllyScoreChanged.addCallback(scoreFunc);
				}, 
				function(score: BattleTeamScore):void {
					score.evEnemyScoreChanged.removeCallback(scoreFunc);
					score.evAllyScoreChanged.removeCallback(scoreFunc);
				}
			);
			
			var capturePointFunc:Function = function(entity: Entity, param2: int): void {
				var point:CapturePoint = entity.capturePoint;
				var progress:Progress = entity.progress;
				var relation:Relation = entity.relation;
				
				// TODO
			};
			dataHub.getCollection(ComponentClass.capturePoint).evAdded.addCallback(capturePointFunc);
			dataHub.getCollection(ComponentClass.capturePoint).evRemoved.addCallback(capturePointFunc);
		}

		/*
        override public function onParamsChanged(param1:Array, param2:Array) : void
        {
            super.onParamsChanged(param1, param2);
			
			scoreInfoHolder.setHoldReward(111, 222);
			
			scope.setProperty("testkey", "12345");
			//this.exportToScope(param2[0], param2[1]);
        }
		
		override public function free() : void
        {
            this.scoreInfoHolder = null;
            super.free();
        }

        override public function disable() : void
        {
            super.disable();
        }

        override public function enable() : void
        {
            this.onParamsChanged(null, currentParams);
            super.enable();
        }
		*/

		/*
        private function exportToScope(param1:String, param2:String) : void
        {
            if (!param1)
            {
                return;
            }
			
            var _loc_3:* = [];
            if (param2 != null)
            {
            }
			
            if (param2.length > 0)
            {
                _loc_3 = param2.split(",");
            }
			
            DatahubToUbScopeExporter.exportSingletonToScope(scope, param1, param1, this.scoreInfoHolder, _loc_3, this);
        }
		*/
	}
}
