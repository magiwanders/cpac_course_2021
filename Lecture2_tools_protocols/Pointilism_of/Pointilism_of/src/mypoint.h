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

    void plot(float size, ofColor c) {
        ofFill();
        ofSetColor(c, 128);
        ofDrawCircle(x, y, size/2);
    }

    void move(float newX, float newY) {
        x = newX;
        y = newY;
    }
};

#endif // MYPOINT_H
