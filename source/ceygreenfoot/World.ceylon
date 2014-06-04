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
 
    late Scene scene;
    Application {
         Stage {
             title = "";
             () => scene = Scene {
                 dimension = [worldWidth.float, worldHeight.float];
             };
         };
     };
     
     shared void animate() {
         
         
     }
     
     shared void addObject(Actor actor, Point point){
         value imageView = ImageView(actor.image.coreImage);
         scene.group.delegate.children.add(imageView.delegate);
     }
     
     
     shared formal void initialize();
     
    
     
 
}

shared alias Point => [Integer, Integer];

shared void animate(World() world) {
    
    value createdWorld = world();
    createdWorld.initialize();
    createdWorld.animate();
    
}
    