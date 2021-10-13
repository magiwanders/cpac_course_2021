#include "ofApp.h"

bool blocked;
int x, y;

float randomW(){
    float val = rand() % ofGetWidth();
    return val;
}

float randomH(){
    float val = rand() % ofGetHeight();
    return val;
}

//--------------------------------------------------------------
void ofApp::setup(){
    ofSetWindowShape(400, 400);
    ofSetBackgroundAuto(false);
    ofSetBackgroundColor(ofColor::white);
    ofSetFrameRate(10);
    blocked = false;
    x=0;y=0;
}

//--------------------------------------------------------------
void ofApp::update(){
    if(!blocked) {
        x = randomW();
        y = randomH();
        ofFill();
        ofSetColor(ofColor::red, 200);
        ofDrawCircle(x, y, 5);
        ofSetColor(ofColor::green, 100);
        ofDrawRectangle(x+10, y+10, 30, 50);
        ofNoFill();
        ofSetColor(ofColor::black);
        ofDrawCircle(x, y, 5);
        ofDrawRectangle(x+10, y+10, 30, 50);
    }
}

//--------------------------------------------------------------
void ofApp::draw(){

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
    blocked = !blocked;
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
