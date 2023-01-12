class Avatar {
  String state;
  ArrayList<Clip> layers;

  Avatar() {
    this.state = "normal"; //"normal", "breath", "talk", "sleep", "smile", "anger", "surprised"

    layers = new ArrayList<Clip>();
    layers.add(new Clip("root", 0, 0, 0, 0));
    layers.add(new Clip("body", 0, 0, 0, 0));
    layers.add(new Clip("mouce", 0, 0, 0, 0));


    this.getClip("body").setParent(this.getClip("root"));
    this.getClip("mouce").setParent(this.getClip("body"));

    this.getClip("body").images.add(0, loadImage("aho.png"));
    this.getClip("body").images.add(1, loadImage("majime.png"));
    this.getClip("mouce").images.add(0, loadImage("mouce_close.png"));
    this.getClip("mouce").images.add(1, loadImage("mouce_open.png"));
    this.getClip("mouce").images.add(2, loadImage("none.png"));
  }

  void draw(int x, int y) {
    switch(this.state) {
    case "aho":
      this.aho();
      break;
    case "majime":
      this.majime();
      break;
    case "talk":
      this.talk();
      break;
    default:
      this.aho();
      break;
    }
    this.layers.get(0).setTranslation(x, y);
    for (int i=0; i<layers.size(); i++) {
      layers.get(i).draw();
    }
  }

  Clip getClip(String name) {
    for (int i=0; i<layers.size(); i++) {
      if (layers.get(i).name == name) {
        return layers.get(i);
      }
    }
    return null;
  }

  void aho() {
    for (int i=0; i<layers.size(); i++) {
      layers.get(i).num = 0;
      layers.get(i).setRotation(0.0);
      layers.get(i).setScale(1.0, 1.0);
    }
  }

  void majime() {
    this.getClip("body").num = 1;
    this.getClip("mouce").num = 2;
    for (int i=0; i<layers.size(); i++) {
      layers.get(i).setScale(1.0, 1.0);
    }
  }

  void talk() {
    for (int i=0; i<layers.size(); i++) {
      layers.get(i).setScale(1.0, 1.0);
    }
    if (frameCount % 4 < 2) {
      this.getClip("mouce").num = 0;
    } else {
      this.getClip("mouce").num = 1;
    }
  }
}