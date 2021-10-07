#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){
    ofSetWindowShape(200, 200);
    ofSetBackgroundColor(ofColor::lightGray);
}

//--------------------------------------------------------------
void ofApp::update(){
}

//--------------------------------------------------------------
void ofApp::draw(){
    ofNoFill();
    ofPath p1, p2;

    p1.moveTo(85, 20);
    p1.lineTo(10, 10);
    p1.moveTo(90, 90);
    p1.lineTo(15, 80);
    p1.setFilled(false);
    p1.setStrokeWidth(1);
    p1.setStrokeColor(ofColor::red);
    p1.draw();

    p2.moveTo(85,20);
    p2.bezierTo(10, 10, 90, 90, 15, 80);
    p2.setFilled(false);
    p2.setStrokeWidth(1);
    p2.setStrokeColor(ofColor::black);
    p2.draw();

    ofBeginShape();
    for (int i=0; i<20; i++) {
        int y = i%2;
        ofVertex(i*10, 50+y*10);
        ofSetColor(ofColor::black);
    }
    ofEndShape();
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
