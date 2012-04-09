void setupInterface()
{
    // setup controlP5 + control window
    control = new ControlP5( this );
    control.setAutoDraw( false );
    
    control.setColorActive( color( 255, 0, 0 ) );
    control.setColorBackground( color( 64, 64, 64 ) );
    control.setColorForeground( color( 160, 160, 160 ) );
    control.setColorLabel( color( 255 ) );
    control.setColorValue( color( 255 ) );
    
    controlWindow = control.addControlWindow( "controlWindow", 800, 100, 300, 400 );
    controlWindow.setTitle( "Settings" );
    controlWindow.hideCoordinates();

    // add field for number of seconds
    Controller secondsSlider = control.addSlider( "seconds", 10, 120, 20, 20, 220, 20 );
    secondsSlider.setWindow( controlWindow );
    secondsSlider.setLabel( "Seconds"  );
    
    Slider s1 = (Slider)control.controller("seconds");
    s1.setNumberOfTickMarks( 12 );
    s1.snapToTickMarks( true );
    
    // add field for filename
    Controller nameField = control.addTextfield( "name", 20, 70, 260, 20 );
    nameField.setWindow( controlWindow );
    nameField.setLabel( "Filename" );
    
    // setup timer;
    timer = new ControlTimer();
    timer.setSpeedOfTime( 1 );
    
    timeLabel = control.addTextlabel( "timeLabel", "--", 60, 140 );
    timeLabel.setFont( ControlP5.synt24 );
    timeLabel.setHeight( 60 );
    timeLabel.setWindow( controlWindow );
    
    // add toggle button to start / pause recording
    Controller start = control.addToggle( "isRecording", isRecording, 20, 210, 260, 60 );
    start.setWindow( controlWindow );
    start.setLabel( "Start Recording" );
    
    // info label
    infoLabel = control.addTextlabel( "infoLabel", "--", 20, 340 );
    infoLabel.setWindow( controlWindow );

}
