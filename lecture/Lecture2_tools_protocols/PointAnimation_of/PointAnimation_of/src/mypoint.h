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
    };

    void plot() {
        ofFill();
        ofSetColor(c);
        ofDrawRectangle(x-size/2, y-size/2, size, size);
    }

    void move(float xoff, float yoff) {
        x += xoff;
        y += yoff;
    }
};

#endif // MYPOINT_H
