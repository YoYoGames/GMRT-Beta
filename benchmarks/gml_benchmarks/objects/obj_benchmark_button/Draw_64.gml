
draw_set_font(TestFont);

if(hover){
	draw_set_colour(c_green);
}
else {
	draw_set_colour(c_black);
}

var text_width = string_width(benchmark.name);
var text_height = string_height("A");

draw_text(x + sprite_width/2 - text_width/2, y + sprite_height/2 - text_height/2, benchmark.name)

draw_set_colour(c_white);

draw_text(x + sprite_width + 30, y + sprite_height/2 - text_height/2, result_text);
