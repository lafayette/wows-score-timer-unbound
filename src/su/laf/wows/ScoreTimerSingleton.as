package su.laf.wows 
{
	import lesta.datahub.DataHub;
	/**
	 * ...
	 * @author ancient
	 */
	public class ScoreTimerSingleton 
	{
		public static var instance:ScoreTimerSingleton = new ScoreTimerSingleton();
		public var dataHub: DataHub = null;
	}
}