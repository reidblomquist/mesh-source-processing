class Mesh {
  boolean initialized = false;
  int gridResolution = 15;
  int vertexLength = gridResolution * gridResolution;
  PVector[] vertices = new PVector[vertexLength];
  PVector[] uv = new PVector[vertexLength];
  Vector4[] tangents = new Vector4[vertexLength];
  Vector4 tangent = new Vector4(1.0, 0.0, 0.0, -1.0);
  int[] triangles = new int[gridResolution * gridResolution * 6];

  ArrayList<Polygon> mesh;

  Mesh() {
    if (initialized == false) {
      for (int i = 0, y = 0; y < gridResolution; y++) {
        for (int x = 0; x < gridResolution; x++, i++) {
          vertices[i] = new PVector( x, y, 0 );
          uv[i] = new PVector(x / gridResolution, y / gridResolution);
          tangents[i] = tangent;
        }
      }
    }

    for (int ti = 0, vi = 0, y= 0; y < gridResolution; y++, vi++) {
      for (int x = 0; x < gridResolution; x++, ti += 6, vi ++) {
        triangles[ti] = vi;
        triangles[ti + 3] = triangles[ti + 2] = vi + 1;
        triangles[ti + 4] = triangles[ti + 1] = vi + gridResolution + 1;
        triangles[ti + 5] = vi + gridResolution + 2;
      }
    }

    mesh = new ArrayList<Polygon>();

    for (int i = 0; i < vertexLength; i++) {
        Polygon p = new Polygon(vertices[i].x, vertices[i].y, vertices[i].z);
        mesh.add(p);
    }
  }

  void display() {
    for (Polygon poly : mesh) {
      poly.display();
    }
  }

  void sendMesh(PShape mesh) {
  }
}

class Polygon {
  PShape s;
  float x, y, z;

  Polygon(float x_, float y_, float z_) {
    s = createShape();
    x = x_;
    y = y_;
    z = z_;

    s.beginShape();
    s.fill(221, 4, 126);
    s.noStroke();
    s.vertex(x, y, z);
    s.endShape();
  }

  void display() {
    pushMatrix();
    translate(0, 0);
    shape(s);
    popMatrix();
  }
}
