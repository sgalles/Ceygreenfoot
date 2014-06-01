import ceylonfx.scene {
    Scene
}
import ceylonfx.stage { Stage }
import ceylonfx.application { Application }


shared abstract class World(
    shared Integer worldWidth = 600,
    shared Integer worldHeight = 600,
    shared Integer cellSize = 1,
    shared Boolean bounded = true) {
 
 
    Application {
         Stage {
             title = "";
             () => Scene {
                 dimension = [worldWidth.float, worldHeight.float];
             };
         };
     };
     
    
 
}
    