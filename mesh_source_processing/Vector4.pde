public class Vector4
{
  public Vector4()
  {
    xyz[0] = 0;
    xyz[1] = 0;
    xyz[2] = 0;
    xyz[3] = 0;
  }

  public Vector4(double x, double y, double z, double w)
  {
    xyz[0] = x;
    xyz[1] = y;
    xyz[2] = z;
    xyz[3] = w;
  }

  public Vector4(double[] array)
  {
    if(array.length != 4)
      throw new RuntimeException("Must create vector with 3 element array");

    xyz[0] = array[0];
    xyz[1] = array[1];
    xyz[2] = array[2];
    xyz[3] = array[3];
  }

  public double[] array()
  {
    return (double[])xyz.clone();
  }

  public Vector4 add(Vector4 rhs)
  {
    return new Vector4(
      xyz[0] + rhs.xyz[0],
      xyz[1] + rhs.xyz[1],
      xyz[2] + rhs.xyz[2],
      xyz[3] + rhs.xyz[3]);
  }

  public Vector4 sub(Vector4 rhs)
  {
    return new Vector4(
      xyz[0] - rhs.xyz[0],
      xyz[1] - rhs.xyz[1],
      xyz[2] - rhs.xyz[2],
      xyz[3] - rhs.xyz[3] );
  }

  public Vector4 neg()
  {
    return new Vector4(-xyz[0], -xyz[1], -xyz[2], -xyz[3]);
  }

  public Vector4 mul(double c)
  {
    return new Vector4(c*xyz[0], c*xyz[1], c*xyz[2], c*xyz[3]);
  }

  public Vector4 div(double c)
  {
    return new Vector4(xyz[0]/c, xyz[1]/c, xyz[2]/c, xyz[3]/c);
  }

  public double dot(Vector4 rhs)
  {
    return xyz[0]*rhs.xyz[0] +
      xyz[1]*rhs.xyz[1] +
      xyz[2]*rhs.xyz[2] +
      xyz[3]*rhs.xyz[3];
  }

  public double norm()
  {
    return dot(this);
  }

  public Vector4 normalize()
  {
    return this.div(norm());
  }

  /*package*/ double xyz[] = new double[4];
}
