class Mesh {
  PShape mesh;
  boolean initialized = false;
  int gridResolution = 15;
  int vertexLength = gridResolution * gridResolution;
  PVector[] vertices = new PVector[vertexLength];
  PVector[] uv = new PVector[vertexLength];
  Vector4[] tangents = new Vector4[vertexLength];
  Vector4 tangent = new Vector4(1.0, 0.0, 0.0, -1.0);
  int[] triangles = new int[gridResolution * gridResolution * 6];

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
      mesh = createShape();
    }
  }

  void display() {
    pushMatrix();
    mesh.beginShape();
    mesh.fill(221, 4, 126);
    mesh.noStroke();
    for (int i = 0; i < vertexLength; i++) {
        mesh.vertex(vertices[i].x, vertices[i].y, vertices[i].z);
    }
    mesh.endShape();
    popMatrix();
  }

  void sendMesh(PShape mesh) {
  }
}
