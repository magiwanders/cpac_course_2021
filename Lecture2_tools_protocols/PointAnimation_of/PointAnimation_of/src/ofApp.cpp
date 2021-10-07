#include "ofApp.h"

float offset=1;
ofColor c1, c2;
MyPoint * p1, * p2;

//--------------------------------------------------------------
void ofApp::setup(){
    ofSetWindowShape(800, 800);
    ofSetBackgroundColor(ofColor::white);
    ofSetFrameRate(60);

    c1 = ofColor(255, 204, 0);
    c2 = ofColor(255, 10, 0);

    p1 = new MyPoint(10-5, 10-5, 10, c1);
    p2 = new MyPoint(150-10, 300-10, 20, c2);

    p1->plot();
    p2->plot();

}

//--------------------------------------------------------------
void ofApp::update(){

}

//--------------------------------------------------------------
void ofApp::draw(){
    ofSetBackgroundColor(ofColor::white);
    p1->move(offset, offset+1);
    p1->plot();
    p2->plot();
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
