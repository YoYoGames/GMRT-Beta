function drawTextShadow(_x, _y, _text, _color=c_white) {
  draw_text_color(_x + 1, _y + 1, _text, 0, 0, 0, 0, 1);
  draw_text_color(_x, _y, _text, _color, _color, _color, _color, 1);
}

var textHeight = string_height("M");

textScroll += (mouse_wheel_up() - mouse_wheel_down()) * textHeight;

var mouseX = window_mouse_get_x();
var mouseY = window_mouse_get_y();
var textX = 8;
var textY = textScroll + 8;
var titleColor = 0xffce73;
for (var i = 0; i < array_length(sections); ++i) {
  var section = sections[i];
  drawTextShadow(textX, textY, section.title, titleColor);
  textY += floor(textHeight * 1.5);
  var samples = section.samples;
  for (var j = 0; j < array_length(samples); ++j) {
    var sample = samples[j];
    var text = $"{sample}";
    var textWidth = string_width(text);
    if (mouseX > textX && mouseX < textX + textWidth
      && mouseY > textY && mouseY < textY + textHeight) {
      draw_rectangle(textX, textY, textX + textWidth, textY + textHeight, true);
      if (mouse_check_button_pressed(mb_left)) {
        createSample(sample);
      }
    }
    drawTextShadow(textX, textY, text);
    textY += textHeight;
  }
}
