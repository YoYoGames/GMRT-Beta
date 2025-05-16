// Run the Key Press - Escape key event in obj_game_manager so
// it resumes the game
//with (obj_game_manager)
//{
	//event_perform(ev_keypress, vk_escape);
//}
var gameManagerInst = instance_find(obj_game_manager, 0);
event_perform.call(gameManagerInst, ev_keypress, vk_escape);