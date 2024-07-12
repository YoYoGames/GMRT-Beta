var mouseX = window_mouse_get_x();
var mouseY = window_mouse_get_y();
var textX = 8;
var textY = 8;
var textHeight = string_height("M");
for (var i = 0; i < array_length(samples); ++i) {
  var sample = samples[i];
  var text = $"{sample}";
  var textWidth = string_width(text);
  if (mouseX > textX && mouseX < textX + textWidth
    && mouseY > textY && mouseY < textY + textHeight) {
    draw_rectangle(textX, textY, textX + textWidth, textY + textHeight, true);

    if (mouse_check_button_pressed(mb_left)) {
      createSample(sample);
    }
  }
  draw_text(textX, textY, text);
  textY += textHeight;
}
