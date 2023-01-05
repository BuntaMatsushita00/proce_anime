
/**
 * Sample Avatar
 * 
 * 顔だけのサンプル
 */


class Avatar {
  String state;
  ArrayList<Clip> layers;

  Avatar() {
    this.state = "normal"; //"normal", "breath", "talk", "sleep", "smile", "anger", "surprised"

    layers = new ArrayList<Clip>();
    layers.add(new Clip("root", 0, 0, 0, 0));
    layers.add(new Clip("foot_l", 30, 152, -30, -23));
    layers.add(new Clip("leg_l", 50, 250, -6, -126));
    layers.add(new Clip("foot_r", -30, 152, 30, -23));
    layers.add(new Clip("leg_r", -50, 250, 6, -126));
    layers.add(new Clip("body", 0, 0, 0, 140));
    layers.add(new Clip("face", 0, -250, 0, 150));
    layers.add(new Clip("lip", 0, 70, 0, 0));
    layers.add(new Clip("eye_l", 40, -10, 0, 0));
    layers.add(new Clip("eye_r", -40, -10, 0, 0));
    layers.add(new Clip("eyebrow_l", 40, -30, 0, 0));
    layers.add(new Clip("eyebrow_r", -40, -30, 0, 0));
    //layers.add(new Clip("glass", 4, 18, 0, 0));



    this.getClip("body").setParent(this.getClip("root"));
    this.getClip("face").setParent(this.getClip("body"));
    this.getClip("lip").setParent(this.getClip("face"));
    this.getClip("eye_l").setParent(this.getClip("face"));
    this.getClip("eye_r").setParent(this.getClip("face"));
    this.getClip("eyebrow_l").setParent(this.getClip("face"));
    this.getClip("eyebrow_r").setParent(this.getClip("face"));
    this.getClip("leg_l").setParent(this.getClip("body"));
    this.getClip("foot_l").setParent(this.getClip("leg_l"));
    this.getClip("leg_r").setParent(this.getClip("body"));
    this.getClip("foot_r").setParent(this.getClip("leg_r"));
    //this.getClip("glass").setParent(this.getClip("face"));

    this.getClip("face").images.add(0, loadImage("face.png"));
    this.getClip("lip").images.add(0, loadImage("lip.png"));
    this.getClip("lip").images.add(1, loadImage("lip_open.png"));
    this.getClip("lip").images.add(2, loadImage("lip_anger.png"));
    this.getClip("lip").images.add(3, loadImage("lip_smile.png"));
    this.getClip("lip").images.add(4, loadImage("lip_surprised.png"));
    this.getClip("eye_l").images.add(0, loadImage("eye_l.png"));
    this.getClip("eye_l").images.add(1, loadImage("eye_l_anger.png"));
    this.getClip("eye_l").images.add(2, loadImage("eye_l_sleep.png"));
    this.getClip("eye_l").images.add(3, loadImage("eye_l_surprised.png"));
    this.getClip("eye_r").images.add(0, loadImage("eye_r.png"));
    this.getClip("eye_r").images.add(1, loadImage("eye_r_anger.png"));
    this.getClip("eye_r").images.add(2, loadImage("eye_r_sleep.png"));
    this.getClip("eye_r").images.add(3, loadImage("eye_r_surprised.png"));
    this.getClip("eyebrow_l").images.add(0, loadImage("eyebrow_l.png"));
    this.getClip("eyebrow_r").images.add(0, loadImage("eyebrow_r.png"));
    //this.getClip("glass").images.add(0, loadImage("glass.png"));
    this.getClip("body").images.add(0, loadImage("body.png"));
    this.getClip("leg_l").images.add(0, loadImage("leg_l.png"));
    this.getClip("foot_l").images.add(0, loadImage("foot_l.png"));
    this.getClip("leg_r").images.add(0, loadImage("leg_r.png"));
    this.getClip("foot_r").images.add(0, loadImage("foot_r.png"));

  }

  void draw(int x, int y) {
    switch(this.state) {
    case "nomal":
      this.normal();
      break;
    case "breath":
      this.breath();
      break;
    case "talk":
      this.talk();
      break;
    case "sleep":
      this.sleep();
      break;
    case "smile":
      this.smile();
      break;
    case "anger":
      this.anger();
      break;
    case "surprised":
      this.surprised();
      break;
    default:
      this.normal();
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

  void normal() {
    for (int i=0; i<layers.size(); i++) {
      layers.get(i).num = 0;
      layers.get(i).setRotation(0.0);
      layers.get(i).setScale(1.0, 1.0);
    }
    this.getClip("leg_l").setRotation(-PI/15.0);
    this.getClip("foot_l").setRotation(PI/20.0);
    this.getClip("leg_r").setRotation(PI/30.0);
    this.getClip("foot_r").setRotation(PI/20.0);
  }

  void breath() {
    for (int i=0; i<layers.size(); i++) {
      if (layers.get(i).name =="root") {
        if (frameCount % 4 < 2) {
          layers.get(i).setRotation(PI/100.0);
        } else {
          layers.get(i).setRotation(-PI/100.0);
        }
      }
    }
    this.getClip("leg_l").setRotation(-PI/2.0);
    this.getClip("foot_l").setRotation(-PI/4.0);
    this.getClip("leg_r").setRotation(PI/2.0);
    this.getClip("foot_r").setRotation(-PI/4.0);
  }

  void talk() {
    for (int i=0; i<layers.size(); i++) {
      layers.get(i).setScale(1.0, 1.0);
    }
    if (frameCount % 4 < 2) {
      this.getClip("lip").num = 0;
    } else {
      this.getClip("lip").num = 1;
    }
  }

  void sleep() {
    this.getClip("eye_l").num = 2;
    this.getClip("eye_r").num = 2;
  }

  void smile() {
    this.getClip("lip").num = 3;
    this.getClip("eye_l").num = 0;
    this.getClip("eye_r").num = 0;
    this.getClip("eyebrow_l").setRotation(PI/8.0);
    this.getClip("eyebrow_r").setRotation(-PI/8.0);
  }

  void anger() {
    this.getClip("lip").num = 2;
    this.getClip("eye_l").num = 1;
    this.getClip("eye_r").num = 1;
    this.getClip("eyebrow_l").setRotation(-PI/10.0);
    this.getClip("eyebrow_r").setRotation(PI/10.0);
  }

  void surprised() {
    this.getClip("lip").num = 4;
    this.getClip("lip").setScale(2.0, 2.0);
    this.getClip("eye_l").num = 3;
    this.getClip("eye_r").num = 3;
    this.getClip("eye_l").setScale(2.0, 2.0);
    this.getClip("eye_r").setScale(2.0, 2.0);
    this.getClip("eyebrow_l").setRotation(PI/8.0);
    this.getClip("eyebrow_r").setRotation(-PI/8.0);
  }
}