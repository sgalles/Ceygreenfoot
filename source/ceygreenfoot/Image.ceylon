
import ceylonfx.scene.image {
    CeylonFxImage=Image,
    ImageView
}

shared class Image(String filename) {
    
    shared ImageView imageView = ImageView(CeylonFxImage(filename));
    shared Integer width => imageView.delegate.image.width.integer;
    shared Integer height => imageView.delegate.image.height.integer;
    
}