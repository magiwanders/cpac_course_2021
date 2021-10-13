#include "ofApp.h"

float offset=5;
ofColor c;
MyPoint * p1;

//--------------------------------------------------------------
void ofApp::setup(){
    ofSetWindowShape(800, 800);
    ofSetBackgroundAuto(false);
    ofSetBackgroundColor(ofColor::white);
    ofSetFrameRate(10);

    c = ofColor(255, 204, 0);

    p1 = new MyPoint(10, 10, 10, c);

    p1->plot();

}

//--------------------------------------------------------------
void ofApp::update(){

}

//--------------------------------------------------------------
void ofApp::draw(){
    p1->move(offset, offset+10);
    p1->plot();
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
