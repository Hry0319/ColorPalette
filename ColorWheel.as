package 
{
	import flash.display.CapsStyle;
	import flash.display.GradientType;
	import flash.display.LineScaleMode;
	import flash.display.Sprite;
	import flash.geom.Matrix;
	import flash.display.Shape;


	public class ColorWheel extends Sprite
	{

		private static const DEFAULT_RADIUS:Number = 100;
		public function ColorWheel(nRadius:Number = DEFAULT_RADIUS,brightness:uint=0xffffff)
		{
			init(nRadius,brightness);
		}
		public function reDraw(nRadius:Number ,brightness:uint)
		{
			var nRadians:Number;
			var nR:Number;
			var nG:Number;
			var nB:Number;
			var nColor:Number;
			var objMatrix:Matrix;
			var nX:Number;
			var nY:Number;
			var iThickness:int;

			graphics.clear();
			iThickness = 1 + int(nRadius / 50);
			for (var i:int = 0; i < 360; i++)
			{
				nRadians = i * (Math.PI / 180);

				nR = Math.cos(nRadians) * 127 + 128 << 16;
				nG = Math.cos(nRadians + 2 * Math.PI / 3) * 127 + 128 << 8;
				nB = Math.cos(nRadians + 4 * Math.PI / 3) * 127 + 128;

				nColor = nR | nG | nB;

				nX = nRadius * Math.cos(nRadians) + 120;
				nY = nRadius * Math.sin(nRadians) + 120;

				objMatrix = new Matrix();

				objMatrix.tx = 120;
				objMatrix.ty = 120;

				objMatrix.createGradientBox(nRadius *2 , nRadius * 2 , nRadians, -nRadius + 120, -nRadius + 120);

				graphics.lineStyle(iThickness,0,1, false, LineScaleMode.NONE, CapsStyle.NONE);
				//trace(nColor);
				graphics.lineGradientStyle(GradientType.LINEAR, [brightness, nColor], [100,100], [127, 255], objMatrix);
				graphics.moveTo(120, 120);
				graphics.lineTo(nX, nY);

			}
		}
		public function init(nRadius:Number = DEFAULT_RADIUS,brightness:uint=0xffffff):void
		{
			var nRadians:Number;
			var nR:Number;
			var nG:Number;
			var nB:Number;
			var nColor:Number;
			var objMatrix:Matrix;
			var nX:Number;
			var nY:Number;
			var iThickness:int;

			graphics.clear();
			iThickness = 1 + int(nRadius / 50);
			for (var i:int = 0; i < 360; i++)
			{
				nRadians = i * (Math.PI / 180);

				nR = Math.cos(nRadians) * 127 + 128 << 16;
				nG = Math.cos(nRadians + 2 * Math.PI / 3) * 127 + 128 << 8;
				nB = Math.cos(nRadians + 4 * Math.PI / 3) * 127 + 128;

				nColor = nR | nG | nB;

				nX = nRadius * Math.cos(nRadians) + 120;
				nY = nRadius * Math.sin(nRadians) + 120;

				objMatrix = new Matrix();

				objMatrix.tx = 120;
				objMatrix.ty = 120;

				objMatrix.createGradientBox(nRadius *2 , nRadius * 2 , nRadians, -nRadius + 120, -nRadius + 120);

				graphics.lineStyle(iThickness,0,1, false, LineScaleMode.NONE, CapsStyle.NONE);
				//trace(nColor);
				graphics.lineGradientStyle(GradientType.LINEAR, [brightness, nColor], [100,100], [127, 255], objMatrix);
				graphics.moveTo(120, 120);
				graphics.lineTo(nX, nY);

			}

		}
	}
}