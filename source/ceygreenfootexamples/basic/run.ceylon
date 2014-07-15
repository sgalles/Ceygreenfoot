import ceygreenfoot {
    World,
    Actor,
    animate,
    Image
}

import ceylon.language {
    shared
}
class BasicActor() extends Actor(Image("file:rocket.png")){
    
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
    
}class BasicWorld() extends World(){
    
    shared actual void initialize() {
        addObject(BasicActor(), [300, 300]);
    }
     
}

shared void run() { 
    animate(BasicWorld);
}