


float TWISTING = -70;
float WIGGLING = -3.60;
float TURNING = 70;

float SPINING = 32.39;
float MOVING = 0;
float SHAKING = 0;

int GROWTH= 0;

void ui() {
  controlP5 = new ControlP5(this);
  controlWindow = controlP5.addControlWindow("controlP5window", 100, 100, 445, 165);

  Slider s01 = controlP5.addSlider("TWISTING", -90, 90, 20, 20, 100, 10);
  s01.setWindow(controlWindow);

  Slider s02 = controlP5.addSlider("WIGGLING", -90, 90, 20, 40, 100, 10);
  s02.setWindow(controlWindow);

  Slider s03 = controlP5.addSlider("TURNING", -90, 90, 20, 60, 100, 10);
  s03.setWindow(controlWindow);

  Slider s05 = controlP5.addSlider("SPINING", -90, 90, 20, 90, 100, 10);
  s05.setWindow(controlWindow);

  Slider s06 = controlP5.addSlider("MOVING", -90, 90, 20, 110, 100, 10);
  s06.setWindow(controlWindow);

  Slider s07 = controlP5.addSlider("SHAKING", -90, 90, 20, 130, 100, 10);
  s07.setWindow(controlWindow);

  Slider s04 = controlP5.addSlider("GROWTH", 0, 19, 170, 20, 100, 10);
  s04.setWindow(controlWindow);

  Textlabel t01 = controlP5.addTextlabel("yeah", "Please use the Sliders to control the six different", 170, 62);
  t01.setWindow(controlWindow);
  Textlabel t02 = controlP5.addTextlabel("yeah", "ANGLES and the ITERATION process.  ", 170, 82);
  t02.setWindow(controlWindow);
  Textlabel t03 = controlP5.addTextlabel("yeah", "Use the Buttons on your Mouse to change the view ", 170, 102);
  t03.setWindow(controlWindow);
  Textlabel t04 = controlP5.addTextlabel("yeah", "and perspective of the Lindenmayer-System in 3D space. ", 170, 122);
  t04.setWindow(controlWindow);
   Textlabel t05 = controlP5.addTextlabel("yeah", "Use the key \"S\" to take a screenshot.", 170, 142);
  t05.setWindow(controlWindow);
}

