import ceylonfx.scene.image { ImageView }
shared abstract class Actor(shared Image image) {

    shared late World world;
    shared ImageView imageView = ImageView(image.coreImage);

    shared Integer x => imageView.delegate.x.integer;
    assign x {
        imageView.delegate.x = x.float;
    }
    
    shared Integer y => imageView.delegate.y.integer;
    assign y {
        imageView.delegate.y = y.float;
    }

    shared Point point => [x,y];
    assign point {
        x = point[0];
        y = point[1];
    }
    
    shared formal void act();
}