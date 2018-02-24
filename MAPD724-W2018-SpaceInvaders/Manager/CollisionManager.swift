import CoreGraphics
import SpriteKit

class CollisionManager {
  
    init() {
        
    }
    
    //Collision of SpaceShip with AlienShip / Planet(Earth)
    public static func CheckCllision(scene: SKScene, object1: GameObject, object2: GameObject){
        if (CGPoint.Distance(P1: object1.position, P2: object2.position) < (object1.halfheight! + object2.halfheight!) ) {
            
            if(!object2.isColliding!){
                if (object2.name == "Planet2"){
                    scene.run(SKAction.playSoundFileNamed("score", waitForCompletion: false))
                    ScoreManager.Score += 15
                    
                    //Reset Score When achiev 1000 points and get extra life
                   if (ScoreManager.Score > 1000)
                   {
                    ScoreManager.Score = 0
                    ScoreManager.Lives += 1
                    }
                    
                }
                if (object2.name == "AlienShip3" || object2.name == "AlienShip2" ||  object2.name == "AlienShip1"){
                    scene.run(SKAction.playSoundFileNamed("blast", waitForCompletion: false))
                    ScoreManager.Lives -= 1
                }
             
                object2.isColliding = true
            }
        }
        else{
            object2.isColliding = false
        }
    }

    //Collision of bullet with AlienShip
    public static func Explosion(scene: SKScene, object1: GameObject, object2: GameObject) -> Int{
        
        if (CGPoint.Distance(P1: object1.position, P2: object2.position) < (object1.halfheight! + object2.height!) ) {
            
            
            
            if(!object2.isColliding!){
                
                if (object2.name == "AlienShip1" || object2.name == "AlienShip2" || object2.name == "AlienShip3" ){
                   ScoreManager.Score += 10
                    
                    //Reset Score When achiev 1000 points and get extra life
                    if (ScoreManager.Score > 1000)
                    {
                        ScoreManager.Score = 0
                        ScoreManager.Lives += 1
                    }
                 
                }
               
                object2.isColliding = true
                return 1
            }
        }
        else{
            object2.isColliding = false
            return 0
        }
        return 0
    
    }
}

