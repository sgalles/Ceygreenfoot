
shared abstract class Actor(shared Image image) {

    shared Integer x => image.imageView.delegate.x.integer;
    assign x {
        image.imageView.delegate.x = x.float;
    }
    
    shared Integer y => image.imageView.delegate.y.integer;
    assign y {
        image.imageView.delegate.y = y.float;
    }

    shared Location point => [x,y]; 
    assign point {
        x = point[0];
        y = point[1];
    }
    
    shared default void act(){}
    
    shared default void addedToWorld(World world){}
    
    
}