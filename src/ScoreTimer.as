package
{
	import flash.display.Sprite;
	import flash.utils.Dictionary;
	import flash.utils.getTimer;
	import su.laf.wows.ScoreTimerUbController;

	public class ScoreTimer extends Sprite
	{
		private var controller: ScoreTimerUbController;
		public function ScoreTimer()
		{
		}

		public function doInitialize(expressions:Dictionary, requestedProperties:Dictionary, rootRequestedProperties:Dictionary):String
		{
			var eProp: Dictionary = null; // Expression properties
			var emptyRP: Dictionary = new Dictionary(); // Empty Requested Props
			var expr: Dictionary = expressions; // shorthand alias
			var rp: Dictionary = requestedProperties; // shorthand alias
			var key:String = '';

			//-----------------------------------------------------
			//EXPRESSION
			key = " 'IMPosition'";
			expr[key] = function(scope:Object):*
			{
				return 'IMPosition';
			};
			//REQUESTED PROPS
			rp[key] = emptyRP;

			//-----------------------------------------------------
			//EXPRESSION
			key = " 'STAlly'";
			expr[key] = function(scope:Object):*
			{
				return 'STAlly';
			};
			//REQUESTED PROPS
			rp[key] = emptyRP;

			//-----------------------------------------------------
			//EXPRESSION
			key = " 'STEnemy'";
			expr[key] = function(scope:Object):*
			{
				return 'STEnemy';
			};
			//REQUESTED PROPS
			rp[key] = emptyRP;

			//-----------------------------------------------------
			//EXPRESSION
			key = " 'url:../scoretimer_icons/point_ally_' + allyCounterPoint + '.png'";
			expr[key] = function(scope:Object):*
			{
				return (('url:../scoretimer_icons/point_ally_' + scope.allyCounterPoint) + '.png');
			};
			//REQUESTED PROPS
			eProp = new Dictionary();
			eProp['allyCounterPoint']= 1; 
			rp[key] = eProp;

			//-----------------------------------------------------
			//EXPRESSION
			key = " 'url:../scoretimer_icons/point_enemy_' + enemyCounterPoint + '.png'";
			expr[key] = function(scope:Object):*
			{
				return (('url:../scoretimer_icons/point_enemy_' + scope.enemyCounterPoint) + '.png');
			};
			//REQUESTED PROPS
			eProp = new Dictionary();
			eProp['enemyCounterPoint']= 1; 
			rp[key] = eProp;

			//-----------------------------------------------------
			//EXPRESSION
			key = " 'userPrefsCollection'";
			expr[key] = function(scope:Object):*
			{
				return 'userPrefsCollection';
			};
			//REQUESTED PROPS
			rp[key] = emptyRP;

			//-----------------------------------------------------
			//EXPRESSION
			key = " (resultPrediction >= 2) && (resultPrediction <= 3) ? '0xFF66FFC1' : '0xFFFFFFFF'";
			expr[key] = function(scope:Object):*
			{
				return ((Boolean(Boolean(scope.resultPrediction >= 2) && Boolean(scope.resultPrediction <= 3))) ? ('0xFF66FFC1') : ('0xFFFFFFFF'));
			};
			//REQUESTED PROPS
			eProp = new Dictionary();
			eProp['resultPrediction']= 1; 
			rp[key] = eProp;

			//-----------------------------------------------------
			//EXPRESSION
			key = " (resultPrediction >= 2) && (resultPrediction <= 3) ? 'filled' : 'empty'";
			expr[key] = function(scope:Object):*
			{
				return ((Boolean(Boolean(scope.resultPrediction >= 2) && Boolean(scope.resultPrediction <= 3))) ? ('filled') : ('empty'));
			};
			//REQUESTED PROPS
			eProp = new Dictionary();
			eProp['resultPrediction']= 1; 
			rp[key] = eProp;

			//-----------------------------------------------------
			//EXPRESSION
			key = " (resultPrediction >= 4) && (resultPrediction <= 5) ? '0xFFFF3300' : '0xFFFFFFFF'";
			expr[key] = function(scope:Object):*
			{
				return ((Boolean(Boolean(scope.resultPrediction >= 4) && Boolean(scope.resultPrediction <= 5))) ? ('0xFFFF3300') : ('0xFFFFFFFF'));
			};
			//REQUESTED PROPS
			eProp = new Dictionary();
			eProp['resultPrediction']= 1; 
			rp[key] = eProp;

			//-----------------------------------------------------
			//EXPRESSION
			key = " (resultPrediction >= 4) && (resultPrediction <= 5) ? 'filled' : 'empty'";
			expr[key] = function(scope:Object):*
			{
				return ((Boolean(Boolean(scope.resultPrediction >= 4) && Boolean(scope.resultPrediction <= 5))) ? ('filled') : ('empty'));
			};
			//REQUESTED PROPS
			eProp = new Dictionary();
			eProp['resultPrediction']= 1; 
			rp[key] = eProp;

			//-----------------------------------------------------
			//EXPRESSION
			key = " (userPrefs.IMPositionX.STAlly == null)  ? ((stageSize.x/2) - 130 - 80) : userPrefs.IMPositionX.STAlly";
			expr[key] = function(scope:Object):*
			{
				return ((Boolean(scope.getPropertySecure(['userPrefs','IMPositionX','STAlly']) == null)) ? ((((scope.getPropertySecure(['stageSize','x']) / 2) - 130) - 80)) : (scope.getPropertySecure(['userPrefs','IMPositionX','STAlly'])));
			};
			//REQUESTED PROPS
			eProp = new Dictionary();
			eProp['stageSize']= 1; eProp['userPrefs']= 1; 
			rp[key] = eProp;

			//-----------------------------------------------------
			//EXPRESSION
			key = " (userPrefs.IMPositionX.STEnemy == null)  ? ((stageSize.x/2) + 130) : userPrefs.IMPositionX.STEnemy";
			expr[key] = function(scope:Object):*
			{
				return ((Boolean(scope.getPropertySecure(['userPrefs','IMPositionX','STEnemy']) == null)) ? (((scope.getPropertySecure(['stageSize','x']) / 2) + 130)) : (scope.getPropertySecure(['userPrefs','IMPositionX','STEnemy'])));
			};
			//REQUESTED PROPS
			eProp = new Dictionary();
			eProp['stageSize']= 1; eProp['userPrefs']= 1; 
			rp[key] = eProp;

			//-----------------------------------------------------
			//EXPRESSION
			key = " (userPrefs.IMPositionY.STAlly == null)  ? '50' :  userPrefs.IMPositionY.STAlly";
			expr[key] = function(scope:Object):*
			{
				return ((Boolean(scope.getPropertySecure(['userPrefs','IMPositionY','STAlly']) == null)) ? ('50') : (scope.getPropertySecure(['userPrefs','IMPositionY','STAlly'])));
			};
			//REQUESTED PROPS
			eProp = new Dictionary();
			eProp['userPrefs']= 1; 
			rp[key] = eProp;

			//-----------------------------------------------------
			//EXPRESSION
			key = " (userPrefs.IMPositionY.STEnemy == null)  ? '50' :  userPrefs.IMPositionY.STEnemy";
			expr[key] = function(scope:Object):*
			{
				return ((Boolean(scope.getPropertySecure(['userPrefs','IMPositionY','STEnemy']) == null)) ? ('50') : (scope.getPropertySecure(['userPrefs','IMPositionY','STEnemy'])));
			};
			//REQUESTED PROPS
			eProp = new Dictionary();
			eProp['userPrefs']= 1; 
			rp[key] = eProp;

			//-----------------------------------------------------
			//EXPRESSION
			key = " 0";
			expr[key] = function(scope:Object):*
			{
				return 0;
			};
			//REQUESTED PROPS
			rp[key] = emptyRP;

			//-----------------------------------------------------
			//EXPRESSION
			key = " 0.4";
			expr[key] = function(scope:Object):*
			{
				return 0.4;
			};
			//REQUESTED PROPS
			rp[key] = emptyRP;

			//-----------------------------------------------------
			//EXPRESSION
			key = " 0.6";
			expr[key] = function(scope:Object):*
			{
				return 0.6;
			};
			//REQUESTED PROPS
			rp[key] = emptyRP;

			//-----------------------------------------------------
			//EXPRESSION
			key = " ['userPrefsEntity.userPrefs.evUserPrefsChanged']";
			expr[key] = function(scope:Object):*
			{
				return ['userPrefsEntity.userPrefs.evUserPrefsChanged'];
			};
			//REQUESTED PROPS
			rp[key] = emptyRP;

			//-----------------------------------------------------
			//EXPRESSION
			key = " allyCounterColor";
			expr[key] = function(scope:Object):*
			{
				return scope.allyCounterColor;
			};
			//REQUESTED PROPS
			eProp = new Dictionary();
			eProp['allyCounterColor']= 1; 
			rp[key] = eProp;

			//-----------------------------------------------------
			//EXPRESSION
			key = " enemyCounterColor";
			expr[key] = function(scope:Object):*
			{
				return scope.enemyCounterColor;
			};
			//REQUESTED PROPS
			eProp = new Dictionary();
			eProp['enemyCounterColor']= 1; 
			rp[key] = eProp;

			//-----------------------------------------------------
			//EXPRESSION
			key = " userPrefsCollection[0].id";
			expr[key] = function(scope:Object):*
			{
				return scope.getPropertySecure(['userPrefsCollection',0,'id']);
			};
			//REQUESTED PROPS
			eProp = new Dictionary();
			eProp['userPrefsCollection']= 1; 
			rp[key] = eProp;

			//-----------------------------------------------------
			//EXPRESSION
			key = " userPrefsEntity.userPrefs.userPrefs";
			expr[key] = function(scope:Object):*
			{
				return scope.getPropertySecure(['userPrefsEntity','userPrefs','userPrefs']);
			};
			//REQUESTED PROPS
			eProp = new Dictionary();
			eProp['userPrefsEntity']= 1; 
			rp[key] = eProp;

			//-----------------------------------------------------
			//EXPRESSION
			key = " { }";
			expr[key] = function(scope:Object):*
			{
				return {};
			};
			//REQUESTED PROPS
			rp[key] = emptyRP;

			//-----------------------------------------------------
			//EXPRESSION
			key = " {alpha: 0}";
			expr[key] = function(scope:Object):*
			{
				return {alpha: 0};
			};
			//REQUESTED PROPS
			rp[key] = emptyRP;

			//-----------------------------------------------------
			//EXPRESSION
			key = " {alpha: 1}";
			expr[key] = function(scope:Object):*
			{
				return {alpha: 1};
			};
			//REQUESTED PROPS
			rp[key] = emptyRP;

			//-----------------------------------------------------
			//EXPRESSION
			key = "'STAllyDragZone'";
			expr[key] = function(scope:Object):*
			{
				return 'STAllyDragZone';
			};
			//REQUESTED PROPS
			rp[key] = emptyRP;

			//-----------------------------------------------------
			//EXPRESSION
			key = "'STAllyPositionX'";
			expr[key] = function(scope:Object):*
			{
				return 'STAllyPositionX';
			};
			//REQUESTED PROPS
			rp[key] = emptyRP;

			//-----------------------------------------------------
			//EXPRESSION
			key = "'STAllyPositionY'";
			expr[key] = function(scope:Object):*
			{
				return 'STAllyPositionY';
			};
			//REQUESTED PROPS
			rp[key] = emptyRP;

			//-----------------------------------------------------
			//EXPRESSION
			key = "'STEnemyDragZone'";
			expr[key] = function(scope:Object):*
			{
				return 'STEnemyDragZone';
			};
			//REQUESTED PROPS
			rp[key] = emptyRP;

			//-----------------------------------------------------
			//EXPRESSION
			key = "'STEnemyPositionX'";
			expr[key] = function(scope:Object):*
			{
				return 'STEnemyPositionX';
			};
			//REQUESTED PROPS
			rp[key] = emptyRP;

			//-----------------------------------------------------
			//EXPRESSION
			key = "'STEnemyPositionY'";
			expr[key] = function(scope:Object):*
			{
				return 'STEnemyPositionY';
			};
			//REQUESTED PROPS
			rp[key] = emptyRP;

			//-----------------------------------------------------
			//EXPRESSION
			key = "'ScoreTimerView'";
			expr[key] = function(scope:Object):*
			{
				return 'ScoreTimerView';
			};
			//REQUESTED PROPS
			rp[key] = emptyRP;

			//-----------------------------------------------------
			//EXPRESSION
			key = "'addedToStage'";
			expr[key] = function(scope:Object):*
			{
				return 'addedToStage';
			};
			//REQUESTED PROPS
			rp[key] = emptyRP;

			//-----------------------------------------------------
			//EXPRESSION
			key = "'allyCounterColor'";
			expr[key] = function(scope:Object):*
			{
				return 'allyCounterColor';
			};
			//REQUESTED PROPS
			rp[key] = emptyRP;

			//-----------------------------------------------------
			//EXPRESSION
			key = "'allyCounterPoint'";
			expr[key] = function(scope:Object):*
			{
				return 'allyCounterPoint';
			};
			//REQUESTED PROPS
			rp[key] = emptyRP;

			//-----------------------------------------------------
			//EXPRESSION
			key = "'alpha'";
			expr[key] = function(scope:Object):*
			{
				return 'alpha';
			};
			//REQUESTED PROPS
			rp[key] = emptyRP;

			//-----------------------------------------------------
			//EXPRESSION
			key = "'backgroundImage'";
			expr[key] = function(scope:Object):*
			{
				return 'backgroundImage';
			};
			//REQUESTED PROPS
			rp[key] = emptyRP;

			//-----------------------------------------------------
			//EXPRESSION
			key = "'enemyCounterColor'";
			expr[key] = function(scope:Object):*
			{
				return 'enemyCounterColor';
			};
			//REQUESTED PROPS
			rp[key] = emptyRP;

			//-----------------------------------------------------
			//EXPRESSION
			key = "'enemyCounterPoint'";
			expr[key] = function(scope:Object):*
			{
				return 'enemyCounterPoint';
			};
			//REQUESTED PROPS
			rp[key] = emptyRP;

			//-----------------------------------------------------
			//EXPRESSION
			key = "'textColor'";
			expr[key] = function(scope:Object):*
			{
				return 'textColor';
			};
			//REQUESTED PROPS
			rp[key] = emptyRP;

			//-----------------------------------------------------
			//EXPRESSION
			key = "'userPrefs'";
			expr[key] = function(scope:Object):*
			{
				return 'userPrefs';
			};
			//REQUESTED PROPS
			rp[key] = emptyRP;

			//-----------------------------------------------------
			//EXPRESSION
			key = "'userPrefsEntity'";
			expr[key] = function(scope:Object):*
			{
				return 'userPrefsEntity';
			};
			//REQUESTED PROPS
			rp[key] = emptyRP;

			//-----------------------------------------------------
			//EXPRESSION
			key = "CC.userPrefs";
			expr[key] = function(scope:Object):*
			{
				return scope.getPropertySecure(['CC','userPrefs']);
			};
			//REQUESTED PROPS
			eProp = new Dictionary();
			eProp['CC']= 1; 
			rp[key] = eProp;

			//-----------------------------------------------------
			//EXPRESSION
			key = "STAllyPositionX";
			expr[key] = function(scope:Object):*
			{
				return scope.STAllyPositionX;
			};
			//REQUESTED PROPS
			eProp = new Dictionary();
			eProp['STAllyPositionX']= 1; 
			rp[key] = eProp;

			//-----------------------------------------------------
			//EXPRESSION
			key = "STAllyPositionY";
			expr[key] = function(scope:Object):*
			{
				return scope.STAllyPositionY;
			};
			//REQUESTED PROPS
			eProp = new Dictionary();
			eProp['STAllyPositionY']= 1; 
			rp[key] = eProp;

			//-----------------------------------------------------
			//EXPRESSION
			key = "STEnemyPositionX";
			expr[key] = function(scope:Object):*
			{
				return scope.STEnemyPositionX;
			};
			//REQUESTED PROPS
			eProp = new Dictionary();
			eProp['STEnemyPositionX']= 1; 
			rp[key] = eProp;

			//-----------------------------------------------------
			//EXPRESSION
			key = "STEnemyPositionY";
			expr[key] = function(scope:Object):*
			{
				return scope.STEnemyPositionY;
			};
			//REQUESTED PROPS
			eProp = new Dictionary();
			eProp['STEnemyPositionY']= 1; 
			rp[key] = eProp;

			//-----------------------------------------------------
			//EXPRESSION
			key = "allyTimeLeftStr";
			expr[key] = function(scope:Object):*
			{
				return scope.allyTimeLeftStr;
			};
			//REQUESTED PROPS
			eProp = new Dictionary();
			eProp['allyTimeLeftStr']= 1; 
			rp[key] = eProp;

			//-----------------------------------------------------
			//EXPRESSION
			key = "enemyTimeLeftStr";
			expr[key] = function(scope:Object):*
			{
				return scope.enemyTimeLeftStr;
			};
			//REQUESTED PROPS
			eProp = new Dictionary();
			eProp['enemyTimeLeftStr']= 1; 
			rp[key] = eProp;

			//-----------------------------------------------------
			//EXPRESSION
			key = "su.laf.wows.ScoreTimerUbController";
			expr[key] = function(scope:Object):*
			{
				return scope.getPropertySecure(['su','laf','wows','ScoreTimerUbController']);
			};
			//REQUESTED PROPS
			eProp = new Dictionary();
			eProp['su']= 1; 
			rp[key] = eProp;

			//-----------------------------------------------------
			//EXPRESSION
			key = "true";
			expr[key] = function(scope:Object):*
			{
				return true;
			};
			//REQUESTED PROPS
			rp[key] = emptyRP;

			return '93a466969fa78ddd257ebdd7820c84fc';

		}
	}
}