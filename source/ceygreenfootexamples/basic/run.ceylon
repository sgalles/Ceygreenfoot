import ceygreenfoot {
    World,
    Actor,
    Image,
    animate
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
        addObject(BasicActor(), [width/2, height/2]);
    }
     
}

shared void run() { 
    animate(BasicWorld);
}



