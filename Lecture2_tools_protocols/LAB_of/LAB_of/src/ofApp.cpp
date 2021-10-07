#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){
    ofSetWindowShape(700, 700);
    ofSetBackgroundColor(ofColor::black);
}

//--------------------------------------------------------------
void ofApp::update(){

}

//--------------------------------------------------------------
void ofApp::draw(){
    ofSetBackgroundColor(ofColor::grey);

    ofPath p;
    p.setFillColor(ofColor::darkGreen);
    p.setStrokeColor(ofColor::white);
    p.setStrokeWidth(1);
    p.arc(ofGetMouseX(), ofGetMouseY(), 15, 15, 0, 360);
    p.draw();

    ofPath q;
    q.setFillColor(ofColor::red);
    q.setStrokeColor(ofColor::red);
    q.setStrokeWidth(1);
    q.arc(400, 400, 15, 15, 0, 360);
    q.draw();

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
