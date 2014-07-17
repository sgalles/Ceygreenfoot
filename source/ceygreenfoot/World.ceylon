
import ceylonfx.animation {
    Timeline,
    KeyFrame
}
import ceylonfx.application {
    Application
}
import ceylonfx.event {
    ActionEvent
}
import ceylonfx.scene {
    Scene
}
import ceylonfx.stage {
    Stage
}
import ceylonfx.util {
    Duration
}

import javafx.animation {
    JAnimation=Animation {
        animationIndefinite=INDEFINITE
    }
}
shared abstract class World(
    shared Integer width = 640,
    shared Integer height = 480,
    shared Integer cellSize = 1,
    shared Boolean bounded = true,
    shared Integer framesPerSecond = 60) {
 
    ActorManager actorManager = ActorManager();
 
    shared late Scene scene;
 
    late Timeline gameLoop;
 
     
    
     shared formal void initialize();
    
 
     
     shared void animate() {
     
         
         Duration oneFrameAmt = Duration(1000.0 / framesPerSecond);
     
         object oneFrame extends KeyFrame(oneFrameAmt, void(ActionEvent event){                         act();                        }) {}                  gameLoop = Timeline({oneFrame}, animationIndefinite);                  gameLoop.play();
     
     }
     
     shared void addObject(Actor actor, Point point){
         actor.world = this;
         actor.point = point;
         scene.group.delegate.children.add(actor.imageView.delegate);
         actorManager.addActors(actor);
         
     }
     
     
     shared void act() {
         // TODO : mettre dans ActorManager
         for(actor in actorManager.allSprites){
             actor.act();
         }
         
     }

}

shared alias Point => [Integer, Integer];

shared void animate(World() world) {
    
    value createdWorld = world();
    
    Scene createScene(){
        createdWorld.scene = Scene {
            dimension = [createdWorld.width.float, createdWorld.height.float];
        };
        
        createdWorld.initialize();
       
        return createdWorld.scene;
    }
    
    Application {
        Stage {
            title = "";
            createScene; 
        };
    };
    
    createdWorld.animate();
  
}

    