import ddf.minim.*;  //minimライブラリのインポート

Minim minim;
AudioPlayer konnichiwa;
AudioPlayer konnahuuni;

Avatar avatar;
PImage backscreen;
PImage backscreen1;
PImage backscreen2;
PImage backscreen3;
void setup() {
  noCursor();
  frameRate(10);
  size(1280, 720);
  avatar = new Avatar();
  minim = new Minim(this);  //初期化
  backscreen1 = loadImage("backgroundNoon.png");
  backscreen2 = loadImage("backgroundAfternoon.png");
  backscreen3 = loadImage("backgroundNight.png");
  backscreen = backscreen1;
}

void draw() {
  background(backscreen);
  avatar.draw(mouseX, mouseY);
}

void keyPressed() {
  switch(key) {
  case '1':
    //noon humajime
    avatar.state = "humajime";
    break;
  case '2':
    //noon humajime talk
    avatar.state = "humajime talk";
    break;
  case '3':
    //noon majime
    avatar.state = "majime";
    break;
  case '4':
    //
    avatar.state = "none";
    break;
  case '5':
    backscreen = backscreen1;
  case '6':
    backscreen = backscreen2;
  case '7':
    backscreen = backscreen3;
  default:
    avatar.state = "normal";
    break;
  }
}
