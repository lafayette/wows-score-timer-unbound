package su.laf.wows 
{
	import lesta.dialogs.battle_window_new.HudElementController;
	
	/**
	 * @author ancient
	 */
	public class ScoreTimerDataController extends HudElementController
	{
		override protected function init():void {
			ScoreTimerSingleton.instance.dataHub = this.dataHub;
		}
	}
}