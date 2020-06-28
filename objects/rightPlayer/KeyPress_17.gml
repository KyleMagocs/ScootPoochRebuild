/// @DnDAction : YoYo Games.Common.If_Expression
/// @DnDVersion : 1
/// @DnDHash : 7968FD87
/// @DnDArgument : "expr" "jumping"
/// @DnDArgument : "not" "1"
if(!(jumping))
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 569FF643
	/// @DnDParent : 7968FD87
	/// @DnDArgument : "expr" "true"
	/// @DnDArgument : "var" "jumping"
	jumping = true;

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 10671FBB
	/// @DnDParent : 7968FD87
	/// @DnDArgument : "expr" ".15"
	/// @DnDArgument : "var" "z_speed"
	z_speed = .15;

	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 08A34C89
	/// @DnDParent : 7968FD87
	/// @DnDArgument : "expr" "5"
	/// @DnDArgument : "expr_relative" "1"
	/// @DnDArgument : "var" "speed"
	speed += 5;
}