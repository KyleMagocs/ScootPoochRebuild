/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 0DA68B04
/// @DnDBreak : 1

/// @DnDArgument : "expr" "broken"
/// @DnDArgument : "not" "1"
if(!(broken))
{
	/// @DnDAction : YoYo Games.Instances.Sprite_Animation_Speed
	/// @DnDVersion : 1
	/// @DnDHash : 67F2D87A
	/// @DnDBreak : 1

	/// @DnDParent : 0DA68B04
	image_speed = 1;

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 63D26D2B
	/// @DnDParent : 0DA68B04
	/// @DnDArgument : "expr" "true"
	/// @DnDArgument : "var" "broken"
	broken = true;
}