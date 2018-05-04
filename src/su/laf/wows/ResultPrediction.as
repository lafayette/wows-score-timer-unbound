package su.laf.wows
{
	
	/**
	 * @author ancient
	 */
	public class ResultPrediction
	{
		public static const DRAW_TIME:int = 1;
		public static const WIN_TIME:int = 2;
		public static const WIN_SCORE:int = 3;
		public static const LOSE_TIME:int = 4;
		public static const LOSE_SCORE:int = 5;
		
		public static function getString(predictionId:int):String
		{
			switch (predictionId)
			{
			case DRAW_TIME: 
				return 'DRAW_TIME';
				break;
			case WIN_TIME: 
				return 'WIN_TIME';
				break;
			case WIN_SCORE: 
				return 'WIN_SCORE';
				break;
			case LOSE_TIME: 
				return 'LOSE_TIME';
				break;
			case LOSE_SCORE: 
				return 'LOSE_SCORE';
				break;
			default: 
				return 'UNDEFINED';
			}
		}
	}
}
