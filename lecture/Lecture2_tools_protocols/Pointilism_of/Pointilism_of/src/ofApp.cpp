#include "ofApp.h"

int smallPoint, largePoint;
MyPoint *p;
ofImage i;

//--------------------------------------------------------------
void ofApp::setup(){
    ofSetWindowShape(1024, 576);
    ofSetFrameRate(60);

    i.load("40704.jpg");

    smallPoint = 4;
    largePoint = 40;
    ofColor c = ofColor(0, 0, 0);
    p = new MyPoint(10,10,20, c);

    ofSetBackgroundAuto(false);
    ofSetBackgroundColor(ofColor::white);
}

//--------------------------------------------------------------
void ofApp::update(){
}

//--------------------------------------------------------------
void ofApp::draw(){
    float pointillize = ofMap(ofGetMouseX(), 0, ofGetWidth(), smallPoint, largePoint);
    int x = (int)ofRandom(i.getWidth());
    int y = (int)ofRandom(i.getHeight());
    ofColor pix = i.getColor(x, y);
    p->move(x, y);
    p->plot(pointillize, pix);

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
