import ceygreenfoot {
    World,
    Actor,
    Image,
    animate
}

import ceylonfx.scene.paint {
    Color,
    black,
    white
}

class Lander() extends Actor(Image("file:rocket.png")){
    
    late Moon moon;
    
    late variable Float altitude; 
    
    variable Float speed = 0.0;
    
    Float speedFactor = 10.0;
    
    shared actual void addedToWorld(World moon){
        assert(is Moon moon);
        this.moon = moon;
        altitude = y.float;
    }
   
    shared actual void act() {
       applyGravity();
       altitude += speed / speedFactor;
       y = altitude.integer;
       
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



