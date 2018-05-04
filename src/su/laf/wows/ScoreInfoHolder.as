package su.laf.wows
{
	import lesta.unbound.core.UbScope;
	
	/**
	 * @author ancient
	 */
	public class ScoreInfoHolder
	{
		public var winScore:int = 0;
		
		public var holdReward:int = 0;
		public var holdPeriod:int = 0;
		
		public var allyScore:int = 0;
		public var enemyScore:int = 0;
		
		public var allyPoints:int = 0;
		public var enemyPoints:int = 0;
		
		public var battleTimeLeft:int = 0;
		
		public var allyTimeLeft:int = 0;
		public var enemyTimeLeft:int = 0;
		
		public var allyTimeLeftStr:String = "--:--";
		public var enemyTimeLeftStr:String = "--:--";
		
		public var resultPrediction:int = 0;
		
		public function setPoints(allyPoints:int, enemyPoints:int):void
		{
			this.allyPoints = allyPoints;
			this.enemyPoints = enemyPoints;
		}
		
		public function setWinScore(winScore:int):void
		{
			this.winScore = winScore;
		}
		
		public function setBattleTimeLeft(battleTimeLeft:int):void
		{
			this.battleTimeLeft = battleTimeLeft;
		}
		
		public function setHoldReward(holdReward:int, holdPeriod:int):void
		{
			this.holdReward = holdReward;
			this.holdPeriod = holdPeriod;
		}
		
		public function setScore(allyScore:int, enemyScore:int):void
		{
			this.allyScore = allyScore;
			this.enemyScore = enemyScore;
		}
		
		public function updateCounters():void
		{
			this.updateTimeLeft();
			this.resultPrediction = this.getPrediction();
		}
		
		private function updateTimeLeft():void
		{
			this.allyTimeLeft = getRemainingSeconds(this.holdReward, this.holdPeriod, this.winScore, this.allyPoints, this.allyScore);
			this.enemyTimeLeft = getRemainingSeconds(this.holdReward, this.holdPeriod, this.winScore, this.enemyPoints, this.enemyScore);
			
			this.allyTimeLeftStr = formatSeconds(this.allyTimeLeft);
			this.enemyTimeLeftStr = formatSeconds(this.enemyTimeLeft);
		}
		
		private function getPrediction():int
		{
			if (this.allyTimeLeft > this.battleTimeLeft && this.enemyTimeLeft > this.battleTimeLeft)
			{
				var possiblePointIncome:Number = Math.floor(this.battleTimeLeft / this.holdPeriod) * this.holdReward;
				var allyFinalScore:Number = this.allyPoints * possiblePointIncome + this.allyScore;
				var enemyFinalScore:Number = this.enemyPoints * possiblePointIncome + this.enemyScore;
				
				if (allyFinalScore > enemyFinalScore)
				{
					return ResultPrediction.WIN_TIME;
				}
				else if (allyFinalScore < enemyFinalScore)
				{
					return ResultPrediction.LOSE_TIME;
				}
				else
				{
					return ResultPrediction.DRAW_TIME;
				}
			}
			else if (this.allyTimeLeft > this.battleTimeLeft && this.enemyTimeLeft <= this.battleTimeLeft)
			{
				return ResultPrediction.LOSE_SCORE;
			}
			else if (this.allyTimeLeft <= this.battleTimeLeft && this.enemyTimeLeft > this.battleTimeLeft)
			{
				return ResultPrediction.WIN_SCORE;
			}
			else // both <= battleTimeLeft
			{
				if (this.allyTimeLeft < this.enemyTimeLeft)
				{
					return ResultPrediction.WIN_SCORE;
				}
				else
				{
					return ResultPrediction.LOSE_SCORE;
				}
			}
		}
		
		public function updateScope(scope:UbScope):void
		{
			//trace("updateScope.winScore");
			scope.winScore = this.winScore;
			updateInScope(scope, "winScore");
			
			//trace("updateScope.holdReward");
			scope.holdReward = this.holdReward;
			updateInScope(scope, "holdReward");
			
			//trace("updateScope.holdPeriod");
			scope.holdPeriod = this.holdPeriod;
			updateInScope(scope, "holdPeriod");
			
			//trace("updateScope.allyScore");
			scope.allyScore = this.allyScore;
			updateInScope(scope, "allyScore");
			
			//trace("updateScope.enemyScore");
			scope.enemyScore = this.enemyScore;
			updateInScope(scope, "enemyScore");
			
			//trace("updateScope.allyPoints");
			scope.allyPoints = this.allyPoints;
			updateInScope(scope, "allyPoints");
			
			//trace("updateScope.enemyPoints");
			scope.enemyPoints = this.enemyPoints;
			updateInScope(scope, "enemyPoints");
			
			//trace("updateScope.battleTimeLeft");
			scope.battleTimeLeft = this.battleTimeLeft;
			updateInScope(scope, "battleTimeLeft");
			
			//trace("updateScope.allyTimeLeft");
			scope.allyTimeLeft = this.allyTimeLeft;
			updateInScope(scope, "allyTimeLeft");
			
			//trace("updateScope.enemyTimeLeft");
			scope.enemyTimeLeft = this.enemyTimeLeft;
			updateInScope(scope, "enemyTimeLeft");
			
			//trace("updateScope.allyTimeLeftStr");
			scope.allyTimeLeftStr = this.allyTimeLeftStr;
			updateInScope(scope, "allyTimeLeftStr");
			
			//trace("updateScope.enemyTimeLeftStr");
			scope.enemyTimeLeftStr = this.enemyTimeLeftStr;
			updateInScope(scope, "enemyTimeLeftStr");
			
			//trace("updateScope.resultPrediction");
			scope.resultPrediction = this.resultPrediction;
			updateInScope(scope, "resultPrediction");
		}
		
		public function updateScope2(scope:UbScope):void
		{
			scope.copyDataFrom(this);
			scope.update();
		}
		
		private static function updateInScope(scope:UbScope, key:String):void
		{
			scope.onEvent(key + UbScope.CHANGED, null, UbScope.EVENT_DIRECTION_NONE);
		}
		
		private static function getRemainingSeconds(holdReward:int, holdPeriod:int, teamWinScore:int, pointsCount:int, score:int):Number
		{
			if (pointsCount == 0)
			{
				return int.MAX_VALUE;
			}
			
			var incomePerTick:int = holdReward;
			var totalIncomePerSecond:Number = incomePerTick * pointsCount / holdPeriod;
			var scoreLeft:int = teamWinScore - score;
			return scoreLeft / totalIncomePerSecond;
		}
		
		private static function formatSeconds(value:int):String
		{
			if (value > 5999)
			{
				return "--:--";
			}
			
			var minutes:int = Math.floor(value / 60);
			var seconds:int = value - minutes * 60;
			
			var result:String = "";
			if (minutes < 10)
			{
				result += "0";
			}
			result += minutes + ":";
			if (seconds < 10)
			{
				result += "0";
			}
			result += seconds;
			return result;
		}
	}
}
