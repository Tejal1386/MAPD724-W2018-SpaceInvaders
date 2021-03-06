
import SpriteKit

class Button: GameObject {
    // Constructor
    init(ImageString: String, InitialScale: CGFloat)
    {
        //Initialize the object with an image
        super.init(imageString: ImageString, initialScale: InitialScale)
        Start()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func CheckBounds() {
      
    }
    
    override func Start() {
        self.zPosition = 10
    }
    
    override func Update() {
       
    }
    
    func TouchMove(newPos: CGPoint){
        self.position = newPos
    }
    
    
}
