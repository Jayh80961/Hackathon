
import java.util.Random;

class Platform {
  PVector pos;
  PImage platformImage;

  Platform(float x, float y) {
    pos = new PVector(x, y);
    // Load a random image for the platform
    Random rand = new Random();
    int imageIndex = rand.nextInt(4) + 1;
    platformImage = loadImage("platformUI" + imageIndex + ".png");
    platformImage.resize(50, 50);  // Resize the image to 50x50
  }

  void show() {
    image(platformImage, pos.x, pos.y);
  }

  boolean collide(PVector p) {
    if (p.x > pos.x && p.y > pos.y && p.x < pos.x + platformImage.width && p.y < pos.y + platformImage.height) {
      return true;
    }
    return false;
  }
}
=======
import java.util.Random;

class Platform {
  PVector pos;
  PImage platformImage;

  Platform(float x, float y) {
    pos = new PVector(x, y);
    // Load a random image for the platform
    Random rand = new Random();
    int imageIndex = rand.nextInt(4) + 1;
    platformImage = loadImage("platformUI" + imageIndex + ".png");
    platformImage.resize(50, 50);  // Resize the image to 50x50
  }

  void show() {
    image(platformImage, pos.x, pos.y);
  }

  boolean collide(PVector p) {
    if (p.x > pos.x && p.y > pos.y && p.x < pos.x + platformImage.width && p.y < pos.y + platformImage.height) {
      return true;
    }
    return false;
  }
}
>>>>>>> Stashed changes
