import ddf.minim.*;  //minimライブラリのインポート

Minim minim;
AudioPlayer konnichiwa;
AudioPlayer konnahuuni;

Avatar avatar;
PImage backscreen;

void setup() {
  noCursor();
  frameRate(10);
  size(1280, 720);
  avatar = new Avatar();
  minim = new Minim(this);  //初期化
  // konnichiwa = minim.loadFile("01_konnichiwa.mp3");
  // konnahuuni = minim.loadFile("02_konnahuuni.mp3");
  backscreen = loadImage("backgroundNoon.png");
}

void draw() {
  background(backscreen);
  avatar.draw(mouseX, mouseY);
}

void keyPressed() {
  switch(key) {
  case '1':
    //noon aho
    avatar.state = "normal";
    break;
  case '2':
    //noon aho talk
    avatar.state = "talk";
    break;
  case '3':
    //noon majime
    avatar.state = "sleep";
    break;
  case '4':
    //
    avatar.state = "smile";
    break;
  case '5':
    avatar.state = "anger";
    break;
  case '6':
    avatar.state = "surprised";
    konnahuuni.play();
    break;
  case '0':
  default:
    avatar.state = "normal";
    break;
  }
}
