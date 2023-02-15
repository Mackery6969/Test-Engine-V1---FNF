package handlers;

import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxSpriteGroup;
import flixel.math.FlxMath;
import flixel.FlxG;
import flixel.util.FlxColor;
import handlers.ClientPrefs;

/* Rewrote this a bit.
class MenuItem extends FlxSpriteGroup
{
	public var targetY:Float = 0;
	public var week:FlxSprite;
	private var isFlashing:Bool = false;
	public var flashingInt:Int = 0;

	public function new(x:Float, y:Float, weekNum:Int = 0)
	{
		super(x, y);

		week = new FlxSprite().loadGraphic(Files.image('storymenu/week$weekNum'));
		add(week);

		week.updateHitbox();
	}

	public function startFlashing():Void
	{
		isFlashing = true;
	}

	// if it runs at 60fps, fake framerate will be 6
	// if it runs at 144 fps, fake framerate will be like 14, and will update the graphic every 0.016666 * 3 seconds still???
	// so it runs basically every so many seconds, not dependant on framerate??
	// I'm still learning how math works thanks whoever is reading this lol
	var fakeFramerate:Int = Math.round((1 / FlxG.elapsed) / 10);

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		y = FlxMath.lerp(y, (targetY * 120) + 480, 0.17);

		if (isFlashing)
			flashingInt += 1;

		if (flashingInt % fakeFramerate >= Math.floor(fakeFramerate / 2))
			week.color = 0xFF33ffff;
		else
			week.color = FlxColor.WHITE;
	}
}*/


class MenuItem extends FlxSprite {
	public var targetY:Int = 0;
	public var flashingInt:Int = 0;
	public var flashColor:FlxColor = 0xFFFFFFFF;

	public function new(x:Float, y:Float, image:String) {
		super(x, y, Files.image("menus/storymenu/" + image));
	}

	//I also don't understand this.
	var fakeFramerate:Int = Math.round((1 / FlxG.elapsed) / 10);
	override function update(elapsed:Float) {
		super.update(elapsed);
		y = FlxMath.lerp(y, (targetY * 120) + 480, 0.17);
	
		if (ClientPrefs.flashingLights)
		{
			if (flashColor == 0xFFFFFFFF) return;
			flashingInt = (flashingInt + 1) % fakeFramerate;
		
			color = (flashingInt >= Math.floor(fakeFramerate / 2)) ? flashColor : 0xFFFFFFFF;
		}
	}
}