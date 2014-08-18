
import ceylonfx.scene.canvas {
    Canvas
}
import ceylonfx.scene.image {
    CeylonFxImage=Image
}


shared class Image(String filename) {
     
    late Anything(Image) addImageFunction; 
     
    CeylonFxImage image = CeylonFxImage(filename);
    shared Canvas canvas = Canvas([image.delegate.width, image.delegate.height]);  
    canvas.graphicsContext2D.delegate.drawImage(image.delegate, 0.0, 0.0);
    shared Integer width => canvas.delegate.width.integer;
    shared Integer height => canvas.delegate.height.integer;
    
    shared void registerAddImageFunction(Anything(Image) addImageFunction){
        this.addImageFunction = addImageFunction;
    }
    
    shared void drawImage(Image image, Location location){
        addImageFunction(image);
    }
    
}