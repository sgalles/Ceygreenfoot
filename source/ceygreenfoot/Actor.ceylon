
shared abstract class Actor(shared Image image) {
    
    Integer xOffset = image.width/2;
    Integer yOffset = image.height/2;
    
    object img {
        value d = image.imageView.delegate;
        shared Integer x => d.x.integer;
        assign x{
            d.x = x.float;
        }
        shared Integer y => d.y.integer;
        assign y{
            d.y = y.float;
        }
    }

    shared Integer x => img.x + xOffset;
    assign x {
        img.x = x - xOffset;
    }
     
    shared Integer y => img.y + yOffset;
    assign y {
        img.y = y - xOffset;
    } 
  
    shared Location point => [x,y]; 
    assign point {
        x = point[0];
        y = point[1];
    }
    
    shared default void act(){}
    
    shared default void addedToWorld(World world){}
    
    
}