// Random Walker (No Vectors)
// Daniel Shiffman <http://www.shiffman.net>
// The Nature of Code

// A random walker class!

class Walker {
  PVector location;
  ArrayList<PVector> history;
  
  float WEIGHT = 100;


  Walker() {
    location = new PVector(width/2, height/2);
    history = new ArrayList<PVector>();
  }

  void display() {
    stroke(0);
    fill(175);
    rectMode(CENTER);
    rect(location.x, location.y, 16, 16);

    beginShape();
    stroke(0);
    noFill();
    for (PVector v: history) {
      vertex(v.x, v.y);
    }
    endShape();
  }

  // Randomly move up, down, left, right, or stay in one place
  void walk() {
    PVector vel = new PVector(WEIGHT*random(-1, 1), WEIGHT*random(-1, 1));
    location.add(vel);

    // Stay on the screen
    location.x = constrain(location.x, 0, width-1);
    location.y = constrain(location.y, 0, height-1);


    history.add(location.get());
    if (history.size() > 1000) {
      history.remove(0);
    }
  }
}
