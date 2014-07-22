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
    
    variable Integer xStep = 1;
    variable Integer yStep = 1;
   
    shared actual void act() {
       if(! 0 < x < world.width - image.width ){
           xStep *= -1;
       }
       if(! 0 < y < world.height - image.height ){
           yStep *= -1;
       }
       x += xStep;
       y += yStep;
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



