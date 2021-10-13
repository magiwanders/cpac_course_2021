#include "ofApp.h"
#include "mypoint.h"

ofImage i;
MyPoint * p;
int first = 5;

//--------------------------------------------------------------
void ofApp::setup(){
    ofSetWindowShape(1024, 576);
    ofSetFrameRate(60);
    ofSetBackgroundAuto(false);
    p = new MyPoint(0, 0, 0, ofColor::black);
    i.load("40704.jpg");
    ofSetBackgroundColor(ofColor::black);
}

//--------------------------------------------------------------
void ofApp::update(){
    p->move(ofGetMouseX(), ofGetMouseY());
}

//--------------------------------------------------------------
void ofApp::draw(){
    ofColor c = i.getColor(ofGetMouseX(), ofGetMouseY());
    int r = c.r;
    int g = c.g;
    int b = c.b;
    ofColor newC(r, g, b, 10);
    p->plot(20, newC);
    if (first==0) i.draw(0,0); //Has to be drawn only once, after 5 frames (why?)
    first--;
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
