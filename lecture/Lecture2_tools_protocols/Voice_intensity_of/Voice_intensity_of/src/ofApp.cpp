#include "ofApp.h"

ofSoundStream s;
float amp=0, amp_cumulative=0;
int mediator=0;

//--------------------------------------------------------------
void ofApp::setup(){
    ofSetWindowShape(800, 600);
    auto devices = s.getMatchingDevices("default");
    ofSoundStreamSettings settings;
    if(!devices.empty()){
        settings.setInDevice(devices[0]);
    }
    settings.setInListener(this);
    settings.sampleRate = 48000;
    settings.numOutputChannels = 0;
    settings.numInputChannels = 1;
    settings.bufferSize = 256;
    s.setup(settings);

    s.start();
}

void ofApp::audioIn(ofSoundBuffer & input) {
    //cout << "Buffer Received" << endl;
    amp=0;
    for(int i=0;i<input.size();i++){
        amp+=input[i];
    }

    mediator++;
    amp_cumulative+=amp;

    cout << amp << endl;
}

void ofApp::audioOut( float * output, int bufferSize, int nChannels ) {
    cout << "Audio Out Called" << endl;
}

//--------------------------------------------------------------
void ofApp::update(){

}

//--------------------------------------------------------------
void ofApp::draw(){

    float mediated_amp = amp_cumulative/mediator;

    ofSetBackgroundColor(ofColor::white);
    ofFill();
    ofSetColor(ofColor::black);
    ofDrawRectangle(0, 0, 100, amp*100);

    amp_cumulative=0;
    mediator=0;
}

//--------------------------------------------------------------
void ofApp::keyPressed(int key){

}

//--------------------------------------------------------------
void ofApp::keyReleased(int key){

}

//--------------------------------------------------------------
void ofApp::mouseMoved(int x, int y ){

}

//--------------------------------------------------------------
void ofApp::mouseDragged(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::mousePressed(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::mouseReleased(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::mouseEntered(int x, int y){

}

//--------------------------------------------------------------
void ofApp::mouseExited(int x, int y){

}

//--------------------------------------------------------------
void ofApp::windowResized(int w, int h){

}

//--------------------------------------------------------------
void ofApp::gotMessage(ofMessage msg){

}

//--------------------------------------------------------------
void ofApp::dragEvent(ofDragInfo dragInfo){

}
