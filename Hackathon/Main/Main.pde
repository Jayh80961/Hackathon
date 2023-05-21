ArrayList <Platform> p;
PVector pos;
PVector vel;
boolean iscolliding = false;
float moving = 0;
float walk = 4;
import java.awt.event.KeyListener;
int stack = 0;
PImage backgroundImage;
PImage astronautImage;
int cnt = 0;
int keep=0;
void setup(){
  cnt+=1;
  backgroundImage = loadImage("JWST_hero.jpeg");
  astronautImage = loadImage("AstronautUI.png");
  astronautImage.resize(50, 50);
  p = new ArrayList <Platform>();
  float y=height/2;
  float ory = y; 
  for(int i=0;i<width/60;i++){
     p.add(new Platform(i*100, y));
     y+=random(-100,100);
  } 
  pos = new PVector(20,ory);
  vel = new PVector();
  if(cnt==1){
    displayStart("Instructions", "Use 'A' and 'D' keys to move. Press Space to jump on platforms. (There are achievements, and easter-eggs) *Press A to continue");
  }
  
} 
void settings(){
  size(800,600);
}
void draw(){
  image(backgroundImage, 0, 0);
  iscolliding = false;
  for(Platform i:p){
    i.show();
    if(i.collide(pos)){
      iscolliding = true;
      pos.y=i.pos.y;
    }
  }
  if(pos.y>height){
     setup(); 
     displayPopup("Game Over", "You completed the total of " + stack + " levels.");
     if (stack >= 5 && stack < 10) {
      displayAchievementPopup("Achievement Unlocked", "Novice Astronaut.(completed 5 levels)");
    }
    if (stack >= 10 && stack < 20) {
      displayAchievementPopup("Achievement Unlocked", "Pro Astronaut!(completed 10 levels)");
    }
    if (stack >= 20 && stack < 25) {
      displayAchievementPopup("Achievement Unlocked", "Planet finder...(completed 20 levels)");
    }
    if (stack >= 25 && stack < 30) {
      displayAchievementPopup("Achievement Unlocked", "Planet Harvester(completed 25 levels)");
    }
    if (stack >= 30 && stack < 40) {
      displayAchievementPopup("Achievement Unlocked", "Planet Conquerer(completed 30 levels)");
    }
    if (stack >= 40 && stack < 50) {
      displayAchievementPopup("Achievement Unlocked", "(completed 40 levels)");
    }
    if (stack >= 50) {
      displayAchievementPopup("Achievement Unlocked", "WHAT ARE YOU!!!!(completed over 50 levels/final achievement?)");
    }
    if (stack >= 100) {
      displayAchievementPopup("Achievement Unlocked", "...Press 1 for easter-egg (completed over 100 levels/final achievement.)");
    }
     stack = 0;
  }
  if(pos.x>width){
    setup();
    stack+=10;
  }
  fill(255,255,255);
  stroke(0);
  image(astronautImage, pos.x - 15, pos.y - 20);
  if(!iscolliding){
    vel.y+=0.2;
  }
  vel.y+=0.2;
  pos.add(vel);
  pos.x+=moving;
  vel.mult(0.9);
  
  fill(255);
  textSize(20);
  text("Stage Scores: " + stack, 10, 30);
  updatePopup();
  updateAchievementPopup();
  updatePop();
}
void keyPressed(){
  if(key=='a'){
    if(keep ==1){
       moving = -walk;  
    }
  }
  if(key=='d'){
   moving = walk; 
  }
  if(key==' '){
    if(iscolliding){
      vel.y-=20;
    }
  }
  if(key == 'i'){
    displayStart("Instructions", "Use 'A' and 'D' keys to move. Press Space to jump on platforms. (There are achievements, and easter-eggs) *Press A to continue");
  }
  if(key == '1'){
    displayAchievementPopup("Achievement Unlocked", "How did you find it out!(typed 1 on keyboard)");
  }
}
void keyReleased(){
  if(key=='a'){
   moving = 0; 
  }
  if(key=='d'){
   moving = 0; 
  }
}

int popupStart;
boolean displayPop = false;
String popupTit;
String popupMess;

void displayStart(String title, String message) {
  int popupWidth = 600;
  int popupHeight = 600;
  int popupX = width/2 - popupWidth/2;
  int popupY = height/2 - popupHeight/2;

  popupTit = title;
  popupMess = message;
  popupStart = millis();
  displayPop = true;
}

void updatePop() {
  int popupDuration = 20000; // 3 seconds
  if(key=='a'){
    popupDuration = 0;
    keep = 1;
  }
  if (displayPop) {
    int elapsedTime = millis() - popupStart;
    
    if (elapsedTime >= popupDuration) {
      displayPop = false;
    } else {
      int popupWidth = 800;
      int popupHeight = 600;
      int popupX = width/2 - popupWidth/2;
      int popupY = height/2 - popupHeight/2;
  
      fill(255);
      rect(popupX, popupY, popupWidth, popupHeight);
      
      fill(0);
      textAlign(CENTER, CENTER);
      textSize(20);
      text(popupTit, popupX + popupWidth/2, popupY + 30);
      
      textSize(10);
      text(popupMess, popupX + popupWidth/2, popupY + popupHeight/2);
    }
  }
}


int popupStartTime;
boolean displayPopup = false;
String popupTitle;
String popupMessage;

void displayPopup(String title, String message) {
  int popupWidth = 300;
  int popupHeight = 150;
  int popupX = width/2 - popupWidth/2;
  int popupY = height/2 - popupHeight/2;

  popupTitle = title;
  popupMessage = message;
  popupStartTime = millis();
  displayPopup = true;
}

void updatePopup() {
  int popupDuration = 2000; // 3 seconds
  
  if (displayPopup) {
    int elapsedTime = millis() - popupStartTime;
    
    if (elapsedTime >= popupDuration) {
      displayPopup = false;
    } else {
      int popupWidth = 330;
      int popupHeight = 150;
      int popupX = width/2 - popupWidth/2;
      int popupY = height/2 - popupHeight/2;
  
      fill(255);
      rect(popupX, popupY, popupWidth, popupHeight);
      
      fill(0);
      textAlign(CENTER, CENTER);
      textSize(24);
      text(popupTitle, popupX + popupWidth/2, popupY + 30);
      
      textSize(18);
      text(popupMessage, popupX + popupWidth/2, popupY + popupHeight/2);
    }
  }
}
int achievementPopupStartTime;
boolean displayAchievementPopup = false;
String achievementTitle;
String achievementMessage;

void displayAchievementPopup(String title, String message) {
  int achievementPopupWidth = 400;
  int achievementPopupHeight = 120;
  int achievementPopupX = width - achievementPopupWidth - 20;
  int achievementPopupY = 20;

  achievementTitle = title;
  achievementMessage = message;
  achievementPopupStartTime = millis();
  displayAchievementPopup = true;
}

void updateAchievementPopup() {
  int achievementPopupDuration = 2000; // 2 seconds
  
  if (displayAchievementPopup) {
    int elapsedTime = millis() - achievementPopupStartTime;
    
    if (elapsedTime >= achievementPopupDuration) {
      displayAchievementPopup = false;
    } else {
      int achievementPopupWidth = 400;
      int achievementPopupHeight = 120;
      int achievementPopupX = width - achievementPopupWidth - 20;
      int achievementPopupY = 20;
  
      fill(255);
      rect(achievementPopupX, achievementPopupY, achievementPopupWidth, achievementPopupHeight);
      
      fill(0);
      textAlign(CENTER, CENTER);
      textSize(15);
      text(achievementTitle, achievementPopupX + achievementPopupWidth/2, achievementPopupY + 30);
      
      textSize(10);
      text(achievementMessage, achievementPopupX + achievementPopupWidth/2, achievementPopupY + achievementPopupHeight/2);
    }
  }
}
