import CoreGraphics
import SpriteKit

class CollisionManager {
    
    var blastSprite: Blast?
    
    init() {
        
    }
    
    public static func CheckCllision(scene: SKScene, object1: GameObject, object2: GameObject){
        if (CGPoint.Distance(P1: object1.position, P2: object2.position) < (object1.halfheight! + object2.halfheight!) ) {
            
            if(!object2.isColliding!){
                if (object2.name == "Planet2"){
                    scene.run(SKAction.playSoundFileNamed("yay", waitForCompletion: false))
                    ScoreManager.Score += 100
                }
                if (object2.name == "AlienShip3" || object2.name == "AlienShip2" ||  object2.name == "AlienShip1"){
                    scene.run(SKAction.playSoundFileNamed("thunder", waitForCompletion: false))
                    ScoreManager.Lives -= 1
                }
             
                object2.isColliding = true
            }
        }
        else{
            object2.isColliding = false
        }
    }

    public static func Explosion(scene: SKScene, object1: GameObject, object2: GameObject, object3: GameObject){
        if (CGPoint.Distance(P1: object1.position, P2: object2.position) < (object1.halfheight! + object2.halfheight!) ) {
            
           if(!object2.isColliding!){
                if (object2.name == "bullet"){
                    print("bullet")
                  
                //    object3.position = object1.position
                 //   scene.addChild(object3)
                    
                    scene.removeChildren(in: [object1])
                    
                    
                    //scene.run(SKAction.wait(forDuration: 2)) {
                      //  object3.removeFromParent()
                    //}
                    
                    
                   // scene.addChild(object1)
                  
                    
                }
            
                object2.isColliding = true
            }
        }
        else{
            object2.isColliding = false
        }
    }
}

