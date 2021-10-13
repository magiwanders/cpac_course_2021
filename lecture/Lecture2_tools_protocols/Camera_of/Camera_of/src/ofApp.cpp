#include "ofApp.h"

ofVideoGrabber v;

//--------------------------------------------------------------
void ofApp::setup(){
    ofSetWindowShape(640, 480);
    ofSetFrameRate(60);

    vector<ofVideoDevice> cameras = v.listDevices();

    if(cameras.size()==0){
        cout << "There are no cameras available for capture" << endl;
    } else {
        cout << "Available Cameras:" << endl;
        for(size_t i = 0; i < cameras.size(); i++){
            if(cameras[i].bAvailable){
                //log the device
                ofLogNotice() << cameras[i].id << ": " << cameras[i].deviceName;
            }else{
                //log the device and note it as unavailable
                ofLogNotice() << cameras[i].id << ": " << cameras[i].deviceName << " - unavailable ";
            }
        }
    }

    if (cameras[0].bAvailable) v.setDeviceID(0);
    v.initGrabber(640, 480);

}

//--------------------------------------------------------------
void ofApp::update(){
    v.update();

    if(v.isFrameNew()){
       ofPixels & pixels = v.getPixels();
    }
}

//--------------------------------------------------------------
void ofApp::draw(){
    v.draw(0, 0);
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
