import ceylonfx.application {
    Application
}
import ceylonfx.scene {
    Scene
}
import ceylonfx.scene.image {
    ImageView,
    CoreImage=Image
}
import ceylonfx.stage {
    Stage
}




shared abstract class World(
    shared Integer worldWidth = 600,
    shared Integer worldHeight = 600,
    shared Integer cellSize = 1,
    shared Boolean bounded = true) {
 
    shared late Scene scene;
    
     
     shared void animate() {
         
         
     }
     
     shared void addObject(Actor actor, Point point){
         value imageView = ImageView(actor.image.coreImage);
         imageView.delegate.x = point[0].float;
         imageView.delegate.y = point[1].float;
         scene.group.delegate.children.add(imageView.delegate);
     }
     
     
     shared formal void initialize();
     
    
     
 
}

shared alias Point => [Integer, Integer];

shared void animate(World() world) {
    
    value createdWorld = world();
    
    Scene createScene(){
        createdWorld.scene = Scene {
            dimension = [createdWorld.worldWidth.float, createdWorld.worldHeight.float];
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
    