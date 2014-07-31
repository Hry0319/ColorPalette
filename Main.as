package 
{
	import flash.display.Sprite;
	import flash.display.BitmapData;
	import flash.geom.ColorTransform;
	import flash.events.MouseEvent;
	import fl.controls.CheckBox;
	import fl.controls.Slider;
	import fl.controls.SliderDirection;

	public class Main extends Sprite
	{
		var bitmapData:BitmapData = new BitmapData(202,132);
		var colorTransform:ColorTransform = new ColorTransform();
		var hexColor:*;

		//this.colorPicker.spectrum.
		var s:Slider = new Slider();


		public function Main():void
		{
			s.move(264,179);
			s.liveDragging = true;
			s.addEventListener(SliderEvent.CHANGE, announceChange);

			addChild(s);
			bitmapData.draw(colorPicker.spectrum);
			colorPicker.spectrum.addEventListener(MouseEvent.MOUSE_MOVE, updateColorPicker);
			colorPicker.spectrum.addEventListener(MouseEvent.MOUSE_UP, setValue);
		}

		private function updateColorPicker(e:MouseEvent):void
		{
			hexColor = "0x" + bitmapData.getPixel(colorPicker.spectrum.mouseX,colorPicker.spectrum.mouseY).toString(16);
			colorTransform.color = hexColor;

			colorPicker.color.transform.colorTransform = colorTransform;
			colorPicker.colorHex.text = "#" + bitmapData.getPixel(colorPicker.spectrum.mouseX,colorPicker.spectrum.mouseY).toString(16).toUpperCase();
		}

		private function setValue(e:MouseEvent):void
		{
			colorPicker.selectedColor.transform.colorTransform = colorTransform;
			colorPicker.sColor.text = colorPicker.colorHex.text;
		}

		function announceChange(e:SliderEvent):void
		{
			//bitmapData.
		}

	}
}