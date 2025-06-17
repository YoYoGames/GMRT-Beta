// Draw the instance itself.
draw_self();

// This section draws the text stored in the 'text' variable, initialised in the Variable Definitions window.
// This changes the font to ft_hud.
draw_set_font(ft_hud);

// This changes the alignment to center-middle.
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// This changes the colour for the text drawn in the next action.
draw_set_colour(0xFF1F529B);

// This draws the text.
draw_text(this.x, this.y, string(this.text));

// This resets the colour to white.
draw_set_colour(c_white);

// This resets the alignments to their default values.
draw_set_halign(fa_left);
draw_set_valign(fa_top);