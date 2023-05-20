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
void setup(){
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
      displayAchievementPopup("Achievement Unlocked", "Becoming the pro...(completed 5 levels)");
    }
    if (stack >= 10 && stack < 15) {
      displayAchievementPopup("Achievement Unlocked", "You became the pro!(completed 10 levels)");
    }
    if (stack >= 15 && stack < 20) {
      displayAchievementPopup("Achievement Unlocked", "The way to glory...(completed 20 levels)");
    }
    if (stack >= 20 && stack < 25) {
      displayAchievementPopup("Achievement Unlocked", "Almost there....(completed 25 levels)");
    }
    if (stack >= 25 && stack < 30) {
      displayAchievementPopup("Achievement Unlocked", "How is it possible!(completed 30 levels)");
    }
    if (stack >= 30 && stack < 40) {
      displayAchievementPopup("Achievement Unlocked", "How is it possible!(completed 30 levels)");
    }
    if (stack >= 40 && stack < 50) {
      displayAchievementPopup("Achievement Unlocked", "Did not expect you to get this....!(completed 40 levels)");
    }
    if (stack >= 50) {
      displayAchievementPopup("Achievement Unlocked", "WHAT ARE YOU!!!!(completed over 50 levels/final achievement)");
    }
     stack = 0;
  }
  if(pos.x>width){
    setup();
    stack+=1;
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
}
void keyPressed(){
  if(key=='a'){
   moving = -walk; 
  }
  if(key=='d'){
   moving = walk; 
  }
  if(key==' '){
    if(iscolliding){
      vel.y-=20;
    }
  }
  if(key == '1'){
    displayPopup("Achievement Unlocked", "How did you find it out!(typed 1 on keyboard)");
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
  int popupDuration = 3000; // 3 seconds
  
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
      
      textSize(15);
      text(achievementMessage, achievementPopupX + achievementPopupWidth/2, achievementPopupY + achievementPopupHeight/2);
    }
  }
}
