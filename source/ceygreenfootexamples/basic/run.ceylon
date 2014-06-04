import ceygreenfoot {
    World,
    Actor,
    animate,
    Image
}

import ceylon.language {
    shared
}
class BasicActor() extends Actor(Image("foo.png")){
    
}class BasicWorld() extends World(){
    
    shared actual void initialize() {
        addObject(BasicActor(), [300, 300]);
    }
    
    
}


shared void run() { 
    animate(BasicWorld);
}