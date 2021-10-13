#include "ofApp.h"

#ifndef MYPOINT_H
#define MYPOINT_H


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

    void plot(float size, ofColor c){
        ofPath p;
        p.setFillColor(c);
        p.arc(x, y, size, size, 0, 360);
        p.draw();
    }

    void move(float newX, float newY) {
        x = newX;
        y = newY;
    }
};

#endif // MYPOINT_H
