#include "ofApp.h"

float offset = 1;
ofColor c1, c2, c3;
MyPoint *p1, *p2, *p3;

//--------------------------------------------------------------
void ofApp::setup(){
    ofSetWindowShape(800, 800);
//    ofSetBackgroundAuto(false);
//    ofSetBackgroundColor(ofColor::white);
    ofSetFrameRate(60);

    c1 = ofColor(255, 204, 0);
    c2 = ofColor(255, 10, 0);
    c3 = ofColor(0, 10, 255);

    p1 = new MyPoint(10, 10, 10, c1);
    p2 = new MyPoint(150, 300, 20, c2);
    p3 = new MyPoint(0, 0, 20, c3);
}

//--------------------------------------------------------------
void ofApp::update(){

}

//--------------------------------------------------------------
void ofApp::draw(){
    ofSetBackgroundColor(ofColor::white);
    p1->move(ofGetMouseX(), ofGetMouseY());
    p1->plot();
    p2->move(ofGetMouseY(), ofGetMouseX());
    p2->plot();
    p3->resize(ofGetMouseX());
    p3->plot();
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
