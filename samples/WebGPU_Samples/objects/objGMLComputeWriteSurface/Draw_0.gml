if (surface_exists(surface)) {
  draw_surface(
    surface,
    floor((room_width - surface_get_width(surface)) / 2),
    floor((room_height - surface_get_height(surface)) / 2)
  );
}