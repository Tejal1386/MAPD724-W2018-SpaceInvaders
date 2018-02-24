
import SpriteKit

class Bullet: GameObject {
    // Constructor
    init(){
        super.init(imageString: "Bullet", initialScale: 0.5)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func Start() {
        self.zPosition = 3
       
    }
    
    override func Reset() {
        
    }
    override func CheckBounds() {
       
    }
    
    override func Update() {
      
    }
}
