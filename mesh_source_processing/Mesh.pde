class Mesh {
  PShape s;
  int zvc = 15;
  PVector[][] vertices = new PVector[zvc][zvc];
  boolean initialized = false;

  Mesh() {
    s = createShape();

    if (initialized == false) {
      for (int j = 0; j < zvc; j++) {
        for (int i = 0; i < zvc; i++) {
          vertices[i][j] = new PVector( i*40 + random(-10, 10), j*40 + random(-10, 10), random(-20, 20) );
        }
      }
    }

    for (int j = 0; j < (zvc - 1); j ++) {
      s.beginShape();
      s.fill(221, 4, 126);
      s.noStroke();
      for (int i = 0; i < zvc; i++) {
        s.vertex( vertices[i][j].x  , vertices[i][j].y  , vertices[i][j].z );
        s.vertex( vertices[i][j+1].x, vertices[i][j+1].y, vertices[i][j+1].z );
      }
      s.endShape();
    }
  }

  void display() {
    pushMatrix();
    translate(0, 0);
    shape(s);
    popMatrix();
  }

  void sendMesh(PShape mesh) {
  }
}
