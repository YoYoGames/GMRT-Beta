if (error != "") {
  draw_set_halign(fa_center);
  draw_set_valign(fa_middle);
  draw_text(room_width / 2, room_height / 2, $"Error: {error}");
  draw_set_halign(fa_left);
  draw_set_valign(fa_top);
} if (surface_exists(surface)) {
  draw_surface(
    surface,
    floor((room_width - surface_get_width(surface)) / 2),
    floor((room_height - surface_get_height(surface)) / 2)
  );
}
