class Clip {
  String name; //名前
  int tx, ty; //位置
  int rx, ry; //回転点
  float rad; //回転角（ラジアン）
  float sx, sy; //拡大縮小
  Clip parent; //親
  ArrayList<PImage> images;
  int num;

  Clip(String name, int tx, int ty, int rx, int ry) {
    this.name = name;
    this.tx = tx;
    this.ty = ty;
    this.rx = rx;
    this.ry = ry;
    this.rad = 0.0;
    this.sx = this.sy = 1.0;
    parent = null;
    images = new ArrayList<PImage>();
    num = 0;
  }

  void setParent(Clip parent) {
    this.parent = parent;
  }

  void setTranslation(int x, int y) {
    this.tx = x;
    this.ty = y;
  }

  void setRotation(float rad) {
    this.rad = rad;
  }

  void setScale(float x, float y) {
    this.sx = x;
    this.sy = y;
  }

  void draw() {
    Matrix T = this.getGlobalMatrix();
    resetMatrix();
    applyMatrix(T.m00, T.m01, T.m02, T.m10, T.m11, T.m12);
    if (images.size() > 0) {
      imageMode(CENTER);
      image(images.get(num), 0, 0);
    }
  }
  
  Matrix getMatrix(){
    Matrix m1 = new Matrix();
    Matrix m2 = new Matrix();
    Matrix m3 = new Matrix();
    Matrix m4 = new Matrix();
    Matrix m5 = new Matrix();
    
    m1.translate(this.tx, this.ty);
    m2.translate(this.rx, this.ry);
    m3.rotate(this.rad);
    m4.scale(this.sx, this.sy);    
    m5.translate(-this.rx, -this.ry);    
    
    Matrix r = new Matrix();
    r = r.multiply(m1);
    r = r.multiply(m2);
    r = r.multiply(m3);
    r = r.multiply(m4);
    r = r.multiply(m5);
   
    return r;
  }
  
  Matrix getGlobalMatrix(){
    Matrix g_T = new Matrix();
    Clip p_clip = this;
    while (p_clip != null) {
      Matrix T = p_clip.getMatrix();
      g_T = T.multiply(g_T);
      p_clip = p_clip.parent;
    }
    return g_T;
  }
}
