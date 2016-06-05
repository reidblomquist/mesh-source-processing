import processing.opengl.*;
import peasy.*;


boolean saveOne = false;

int zvc = 15;

PVector[][] vertices = new PVector[zvc][zvc];

PeasyCam camera;

float vectorCount = 0;

void setup()
{
    size( 440, 440, OPENGL );
    camera = new PeasyCam(this, width/2, 300, 200, 500);

    for (int j = 0; j < zvc; j++) {
      vectorCount++;
        for (int i = 0; i < zvc; i++) {
            vectorCount++;
            vertices[i][j] = new PVector( i*40 + random(-10, 10), j*40 + random(-10, 10), random(-20, 20) );
        }
    }
}

void draw()
{

    background(0);
    lights();
    fill(221, 4, 127);
    noStroke();
    smooth();

    translate( width/2, 20, -100 );
    //rotateY( radians( frameCount ));

    pushMatrix();
    translate( -width/2, 0 );

    for (int j = 0; j < (zvc - 1); j ++) {
        beginShape(TRIANGLE_STRIP);
        for (int i = 0; i < zvc; i++) {
            vertex( vertices[i][j].x  , vertices[i][j].y  , vertices[i][j].z );
            vertex( vertices[i][j+1].x, vertices[i][j+1].y, vertices[i][j+1].z );
        }
        endShape();

    }

    popMatrix();

    if (saveOne) {
        saveFrame("images/"+getClass().getSimpleName()+"-####.png");
        saveOne = false;
    }
}

void keyPressed()
{
    if (key == 's') {
        saveOne = true;
    }
}

public class Mesh {
  public void makeGradientPlaneBuffer() {

  }

  public void makeGradientPlane() {

  }
}
