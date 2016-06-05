import peasy.*;

boolean saveOne = false;

Mesh mesh;

PeasyCam camera;

void setup()
{
  size( 440, 440, P3D );
  camera = new PeasyCam(this, width/2, 300, 200, 500);
  mesh = new Mesh();
}

void draw()
{
  background(0);
  lights();
  smooth();

  /*translate( width/2, 20, -100 );*/
  //rotateY( radians( frameCount ));
  mesh.display();

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
