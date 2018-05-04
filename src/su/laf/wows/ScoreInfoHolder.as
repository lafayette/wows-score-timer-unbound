package su.laf.wows
{
	
	/**
	 * @author ancient
	 */
	public class ScoreInfoHolder
	{
		// public static var instance:ScoreInfoHolder = new ScoreInfoHolder();
		
		public var winScore:int = 0;
		
		public var holdReward:int = 0;
		public var holdPeriod:int = 0;
		
		public var allyScore:int = 0;
		public var enemyScore:int = 0;
		
		public var allyPoints:int = 0;
		public var enemyPoints:int = 0;
		
		public var allyTimeLeft:int = 0;
		public var enemyTimeLeft:int = 0;
		
		public function setWinScore(winScore:int):void
		{
			this.winScore = winScore;
			this.updateTimeLeft();
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
		
		public function setPoints(allyPoints:int, enemyPoints:int):void
		{
			this.allyPoints = allyPoints;
			this.enemyPoints = enemyPoints;
		}
		
		public function updateTimeLeft(): void
		{
			var allyTimeLeft:Number = getRemainingSeconds(this.holdReward, this.holdPeriod, this.winScore, this.allyPoints, this.allyScore);
			var enemyTimeLeft:Number = getRemainingSeconds(this.holdReward, this.holdPeriod, this.winScore, this.enemyPoints, this.enemyScore);
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
	}
}
