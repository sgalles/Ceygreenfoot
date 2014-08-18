
shared abstract class Actor(shared Image image) {
    
    Integer xOffset = image.width/2;
    Integer yOffset = image.height/2;
    
    object img {
        value d = image.canvas.delegate;
        shared Integer x => d.translateX.integer;
        assign x{
            d.translateX = x.float;
        }
        shared Integer y => d.translateY.integer;
        assign y{
            d.translateY = y.float;
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