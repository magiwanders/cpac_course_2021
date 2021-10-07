#ifndef MYPOINT_H
#define MYPOINT_H
#include "ofApp.h"

class MyPoint
{
private:
    float x, y, size;
    ofColor c;
public:
    MyPoint(float x, float y, float size, ofColor c){
        this->x = x;
        this->y = y;
        this->size = size;
        this->c = c;
    }

    void plot() {
        ofFill();
        ofSetColor(c);
        ofDrawRectangle(x, y, size, size);
    }

    void move(float newX, float newY) {
        x = newX;
        y = newY;
    }

    void resize(float newSize) {
        size = newSize;
    }

};

#endif // MYPOINT_H
