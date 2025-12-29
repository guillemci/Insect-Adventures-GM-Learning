// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function constants(){
	global.player = {
		//velocitats de desplaçament x
		WALK_SPEED: 3,
		SPRINT_SPEED: 4.2,
		EXTENDED_JUMP_SPEED: 6,
		NO_MOVE: 0,
		
		//velocitats de desplaçament y
		//+y
		NORMAL_GRAVITY: 0.4,
		EXTENDED_JUMP_PUSH: 1.7,
		JUMP_COUNTER_GRAVITY: 1.3,
		GROUND_GRAVITY: 0,
		
		//-y
		NORMAL_JUMP: 6.6, //ja que 6.6 * 5 (height 5) = 33 pixels (aproximadament 2 blocs d'altura (32 px))
		EXTENDED_JUMP: 1

	}
}