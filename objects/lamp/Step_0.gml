/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 0B32AEAE
/// @DnDArgument : "expr" "(image_index == image_number)"
if((image_index == image_number))
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 767EF690
	/// @DnDParent : 0B32AEAE
	/// @DnDArgument : "var" "image_speed"
	image_speed = 0;

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 29165255
	/// @DnDParent : 0B32AEAE
	/// @DnDArgument : "expr" "image_number-1"
	/// @DnDArgument : "var" "image_index"
	image_index = image_number-1;
}