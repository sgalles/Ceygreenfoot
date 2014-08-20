

import ceylon.collection {
    HashSet
}
import ceylon.language {
    shared,
    true
}

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
    Scene,
    Node
}
import ceylonfx.scene.input {
    KeyEvent
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
import javafx.scene {
    JNode=Node
}
HashSet<String> keysDown = HashSet<String>();

shared abstract class World(
    shared Image? image = null,
    shared Integer width = 600,
    shared Integer height = 600,
    shared Integer cellSize = 1,
    shared Boolean bounded = true,
    shared Integer framesPerSecond = 60) {
 
    ActorManager actorManager = ActorManager();
 
    shared late Scene scene;
 
    late Timeline gameLoop;
 
    object nodeManager satisfies NodeManager{
     
        shared actual void add(Node<JNode> node) {
            scene.group.delegate.children.add(node.delegate);
        }
        
        shared actual void replace(Node<JNode> oldNode, Node<JNode> newNode) {
            value index = scene.group.delegate.children.indexOf(oldNode.delegate);
            "Unable to find provided node"
            assert(index != -1);
            scene.group.delegate.children.set(index, newNode.delegate);
        }
        
        
       
     
    }
     
     shared formal void initialize();
 
     shared void internalInitialize(){
        if(exists image){
            nodeManager.add(image.canvas);
        }
        
        scene.onKeyPressed = void(KeyEvent keyEvent){
            keysDown.add(keyEvent.delegate.code.name.lowercased);
        };
        scene.onKeyReleased = void(KeyEvent keyEvent){
            keysDown.remove(keyEvent.delegate.code.name.lowercased);
        };
        
        
        initialize();
     }
 
     
     shared void animate() {
     
         Duration oneFrameAmt = Duration(1000.0 / framesPerSecond);
     
         object oneFrame extends KeyFrame(oneFrameAmt, void(ActionEvent event){                         act();                        }) {}                  gameLoop = Timeline({oneFrame}, animationIndefinite);                  gameLoop.play();
     
     }
     
    
     shared void addObject(Actor actor, Location point){
         actor.point = point;
         //scene.group.delegate.children.add(actor.image.imageView.delegate);
         
         //nodeManager.add(actor.image.canvas);      
         actor.nodeManager = nodeManager;
         actor.nodeManager.add(actor.image.canvas);
         //actor.image.registerAddImageFunction(addImageFunction);
         actorManager.addActors(actor);
         actor.addedToWorld(this);
     }
     
     
     shared void act() {
         // TODO : mettre dans ActorManager
         for(actor in actorManager.allSprites){
             actor.act();
         }      
     }
     
     shared interface NodeManager{
         
         shared formal void add(Node<JNode> node);
         
         shared formal void replace(Node<JNode> oldNode, Node<JNode> newNode);
     }
     

}

shared alias Location => [Integer, Integer];


shared void animate(World() world) {
    
    value createdWorld = world();
    
    Scene createScene(){
        createdWorld.scene = Scene {
            dimension = [createdWorld.width.float, createdWorld.height.float];
        };
        
       
        createdWorld.internalInitialize();
        
       
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


shared Boolean isKeyDown(String keyName) => keysDown.contains(keyName.lowercased);
