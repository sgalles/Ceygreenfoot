
import ceylonfx.scene.canvas {
    Canvas
}
import ceylonfx.scene.image {
    CeylonFxImage=Image
}


shared class Image(String filename) {
     
    shared CeylonFxImage ceylonFxImage = CeylonFxImage(filename);
     // TODO make the canvas creation lazy
    shared Canvas canvas = Canvas([ceylonFxImage.delegate.width, ceylonFxImage.delegate.height]);  
    canvas.graphicsContext2D.delegate.drawImage(ceylonFxImage.delegate, 0.0, 0.0);
    shared Integer width => ceylonFxImage.delegate.width.integer;
    shared Integer height => ceylonFxImage.delegate.height.integer;
    

    shared void drawImage(Image image, Location location){
        //addImageFunction(image);
        canvas.graphicsContext2D.delegate.drawImage(image.ceylonFxImage.delegate, 0.0, 0.0);
    }
    
}