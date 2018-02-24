
import SpriteKit

class Blast: GameObject {

    // Constructor
    init(){
        super.init(imageString: "blast", initialScale: 1.0)
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
