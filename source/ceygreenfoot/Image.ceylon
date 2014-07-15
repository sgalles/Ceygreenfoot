
import ceylonfx.scene.image {
    CoreImage=Image
}

shared class Image(String filename) {
    
    shared CoreImage coreImage = CoreImage(filename);
    shared Integer width => coreImage.delegate.width.integer;
    shared Integer height => coreImage.delegate.height.integer;
    
}