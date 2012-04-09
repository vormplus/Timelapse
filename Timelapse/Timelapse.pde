import controlP5.*;

import processing.video.*;

Capture webcam;

int counter;

public int seconds = 30;
public String name = "timelapse";

String fileName;

boolean isRecording = false;

ControlP5 control;
ControlWindow controlWindow;
ControlTimer timer;
Textlabel timeLabel;
Textlabel infoLabel;

void setup()
{
    size( 1280, 720 );

    setupInterface();
    
    webcam = new Capture( this, width, height );
    
    counter = 0;
    
    fileName = "";
    // frameRate( 1 );
}

void draw()
{
    image( webcam, 0, 0 );
    
    timeLabel.setValue( timer.toString() );
    
    if ( !isRecording ) {
        timer.reset();
    }
    
    if ( isRecording ) {
        if ( timer.time() >= seconds * 1000 ) {
            fileName = "images/" + name + "-" + nf( counter, 5 ) + ".png";
            saveFrame( fileName );
            counter++;
            timer.reset();
            String info = "Last saved image: " + fileName;
            infoLabel.setValue( info );
        } 
    }
    
}

void captureEvent( Capture webcam )
{
    webcam.read();
}
