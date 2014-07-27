import ceygreenfoot {
    World,
    Actor,
    Image,
    animate,
    isKeyDown
}

import ceylonfx.scene.paint {
    Color,
    black,
    white
}

class Lander() extends Actor(Image("file:rocket.png")){
    
    late Moon moon;
    
    "Current speed"
    variable Float speed = 0.0;
    
    "Power of the rocket"
    Float thrust = -3.0;
    
    "The location"
    late variable Float altitude; 
    
    Float speedFactor = 10.0;
    
    shared actual void act() {
        processKeys();
        applyGravity();
        altitude += speed / speedFactor;
        y = altitude.integer;
     
    }
    
    shared actual void addedToWorld(World world){
        assert(is Moon world);
        this.moon = world;
        altitude = y.float;
    }
   
    
    shared void processKeys() {
       if(isKeyDown("down")) {
           speed+=thrust;
          // setImage(rocketWithThrust);
       } else {
          // setImage(rocket);
       }
    }
    
    shared void applyGravity() {
        speed += moon.gravity;
    }
}class Moon() extends World(Image("file:moon.png")){
    
    "Gravity of the moon"
    shared Float gravity = 1.6;
    
    "Color of the landing platform "
    shared Color landingColor = white;
    
    "Color of the landing platform "
    shared Color spaceColor = black;
    
    shared actual void initialize() {
        addObject(Lander(), [326, 100]);
    }
     
}

shared void run() { 
    animate(Moon);
}



