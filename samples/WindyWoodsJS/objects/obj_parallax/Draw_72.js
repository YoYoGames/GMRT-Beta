// Hi! This object, in this event, handles parallax.
// It's done in Draw Begin as that's when the camera position is updated. This way our parallax remains
// up to speed with the camera (and does not lag behind).
// The camera_get_view_x function gets the X position of the camera. We specify the view_camera[0] as its argument
// (which is our first and only camera).
// The position of the camera is stored in a local variable called '_camera_x'.
var _camera_x = camera_get_view_x(view_get_camera(0));

// We then run the layer_x function to change the X position of a layer.
// The layer is "Back_Trees2" and its position is 60% of the camera's X position (camera_x * 0.6).
// The higher this multiplier is, the "further" the layer appears, as it moves less as compared to the camera.
layer_x("Back_Trees2", _camera_x * 0.6);

// The "Back_Trees1" layer is positioned at camera_x * 0.7.
layer_x("Back_Trees1", _camera_x * 0.7);

// The "Back_Clouds" layer is positioned at camera_x * 0.8.
layer_x("Back_Clouds", _camera_x * 0.8);