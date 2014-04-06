class Button {
  
  void slider(){
  
    cp5.addSlider("time")
    .setPosition((displayWidth/2)-120, (displayHeight/10)*9)
      .setWidth(200)
        .setRange(5, 30) // values can range from big to small as well
          .setValue(timeSet)
            .setNumberOfTickMarks(6)
              .setSliderMode(Slider.FLEXIBLE)
                ;
  }
  
}
