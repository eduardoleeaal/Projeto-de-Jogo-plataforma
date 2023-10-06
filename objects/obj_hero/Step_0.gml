/// @description Insert description here
// You can write your code in this editor


var _right = keyboard_check(ord("D"));
var _left = keyboard_check(ord("A"));
var _up = keyboard_check_pressed(vk_space);

var move = (_right - _left);

hsp = move * velocidade;

vsp += gravt;

if(place_meeting(x, y + 1, obj_floor) and _up){
	vsp -= 7;
}

if(place_meeting(x + hsp, y, obj_floor)){
	while(!place_meeting(x + sign(hsp), y, obj_floor)){
		x += sign(hsp);	
	}
	
	hsp = 0;
}

x += hsp;

if(place_meeting(x, y + vsp, obj_floor)){
	while(!place_meeting(x, y + sign(vsp), obj_floor)){
		y += sign(vsp);	
	}
	
	vsp = 0;
}

y += vsp;



//Animação
if (!place_meeting(x, y+1, obj_floor)){
	sprite_index = spr_hero_jump;
	image_speed = 0;
	if(sign(vsp) > 0){
		image_index = 1;
	}
	else {
		image_index = 0;
	}
}
else{
	image_speed = 1;
	
	if(hsp == 0){
	sprite_index = spr_hero_idle;	
	}
	else{
		sprite_index = spr_hero_run;
	}
}

if(hsp != 0) image_xscale = sign(hsp);


if(y > room_height){
	y = 0;
}
