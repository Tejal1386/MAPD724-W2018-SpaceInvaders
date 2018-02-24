/*
 Date: 23/2/2018
 FileName: GameScene.swift
 Auther's Name: Tejal Patel,Amandeep Sekhon, Mankiran Kaur
 Student ID: 300972812, 300976886, 300990016
 file discription:GameScene is a main scene of the game
 */
import SpriteKit
import GameplayKit
import UIKit
import AVFoundation

let screenSize = UIScreen.main.bounds
var screenWidth: CGFloat?
var screenHeight: CGFloat?

class GameScene: SKScene {
    
   
    //Game Variable
    var spaceSprite: Space?
    var spaceShipSprite: SpaceShip?
    var planet1Sprite: Planet?
    var planet2Sprite: Planet?
    var planet3Sprite: Planet?
    var alienShip1Sprite: AlienShip?
    var alienShip2Sprite: AlienShip?
    var alienShip3Sprite: AlienShip?
    var bulletSprite: Bullet?
    var blastSprite: Blast?
   
    var livesLabel: Label?
    var scoreLabel: Label?
    
    var value1: Int?
    var value2: Int?
    var value3: Int?
    
    override func didMove(to view: SKView) {
        
        screenWidth = frame.width
        screenHeight = frame.height
        
        //add space
        self.spaceSprite = Space()
        self.addChild(self.spaceSprite!)
        
        
        //add Spaceship
        self.spaceShipSprite = SpaceShip()
        self.spaceShipSprite?.name = "spaceship"
        self.spaceShipSprite?.position = CGPoint(x: screenWidth! * 0.5, y: 50)
        self.addChild(self.spaceShipSprite!)
        
        
       
        // add Planet2
        self.planet2Sprite = Planet(ImageString: "Planet2", InitialScale: 1.2)
        self.addChild(self.planet2Sprite!)
        
        // add Planet3
        self.planet3Sprite = Planet(ImageString: "Planet3", InitialScale: 1.0)
        self.addChild(self.planet3Sprite!)
        
    
        // add AlienShip1
        self.alienShip1Sprite = AlienShip(ImageString: "AlienShip1", InitialScale: 1.2)
        self.alienShip1Sprite?.name = "AlienShip1"
        self.addChild(self.alienShip1Sprite!)
        
        // add AlienShip1
        self.alienShip2Sprite = AlienShip(ImageString: "AlienShip2", InitialScale: 1.2)
        self.alienShip2Sprite?.name = "AlienShip2"
        self.addChild(self.alienShip2Sprite!)
        
        // add AlienShip1
        self.alienShip3Sprite = AlienShip(ImageString: "AlienShip3", InitialScale: 1.2)
        self.alienShip3Sprite?.name = "AlienShip3"
        self.addChild(self.alienShip3Sprite!)
        
        
        //add label
        livesLabel = Label(labelString: "Lives: 5", position: CGPoint(x: 20.0, y: frame.height - 20.0), fontSize: 30.0, fontName: "Dock51", fontColor: SKColor.yellow, isCentered: false)
        self.addChild(livesLabel!)
        
        //add label
        
        scoreLabel = Label(labelString: "Lives: 99999", position: CGPoint(x: frame.width * 0.5, y: frame.height - 20.0), fontSize: 30.0, fontName: "Dock51", fontColor: SKColor.yellow, isCentered: false)
        self.addChild(scoreLabel!)
        
        
      //background sound
        let engineSound = SKAudioNode(fileNamed: "background.mp3")
        self.addChild(engineSound)
        engineSound.autoplayLooped = true
        
       //preload Sounds
        do{
            let Sounds: [String] = ["blast", "score","bullet"]
            for sound in Sounds {
                let path: String = Bundle.main.path(forResource: sound, ofType: "mp3")!
                let url: URL = URL(fileURLWithPath: path)
                let player: AVAudioPlayer = try AVAudioPlayer(contentsOf: url)
                player.prepareToPlay()
            }
        }
        catch {
            
        }
    }
    
 
    
    func touchDown(atPoint pos : CGPoint) {
        self.spaceShipSprite?.TouchMove(newPos: CGPoint(x: pos.x, y: 50.0))
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        self.spaceShipSprite?.TouchMove(newPos: CGPoint(x: pos.x, y: 50.0))
    }
    
    func touchUp(atPoint pos : CGPoint) {
         self.spaceShipSprite?.TouchMove(newPos: CGPoint(x: pos.x, y: 50.0))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
        
                //add Bullet
                self.bulletSprite = Bullet()
                self.bulletSprite?.name = "bullet"
                self.run(SKAction.playSoundFileNamed("bullet", waitForCompletion: false))
                self.bulletSprite?.position = CGPoint(x: (spaceShipSprite?.position.x)! , y: 110)
                let action = SKAction.moveTo(y: self.size.height + 50, duration: 1.5)
                bulletSprite?.run(SKAction.repeatForever(action))
                self.addChild(self.bulletSprite!)
        
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
       
    }
    
   
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        self.spaceSprite?.Update()
        self.spaceShipSprite?.Update()
        self.planet1Sprite?.Update()
        self.planet2Sprite?.Update()
        self.planet3Sprite?.Update()
        self.alienShip1Sprite?.Update()
        self.alienShip2Sprite?.Update()
        self.alienShip3Sprite?.Update()
        self.bulletSprite?.Update()
       
        //Check Collision for SpaceShip and Planet(earth) to get 10 points
        CollisionManager.CheckCllision(scene: self, object1: spaceShipSprite!, object2: planet2Sprite!)
        
        //Check collision for alienShip and SpaceShip
        CollisionManager.CheckCllision(scene: self, object1: spaceShipSprite!, object2: alienShip1Sprite!)
        
        CollisionManager.CheckCllision(scene: self, object1: spaceShipSprite!, object2: alienShip2Sprite!)
        
        CollisionManager.CheckCllision(scene: self, object1: spaceShipSprite!, object2: alienShip3Sprite!)
        
        
        
        //Check Collision for Bullet and AlienShip
        if((self.bulletSprite) != nil){
         
        //Check Collision for Bullet and AlienShip1
        value1 =  CollisionManager.Explosion(scene: self, object1: bulletSprite!, object2: alienShip1Sprite!)
            if(value1 == 1){
                print("value1")
                alienShip1Sprite?.removeFromParent()
                  bulletSprite?.position.y = -1
                self.bulletSprite?.removeFromParent()
                
                self.run(SKAction.wait(forDuration: 0.1)) {
                    self.blastSprite?.removeFromParent()
                }
                
                // add alien
                self.alienShip1Sprite = AlienShip(ImageString: "AlienShip1", InitialScale: 1.2)
                self.alienShip1Sprite?.name = "AlienShip1"
                self.addChild(self.alienShip1Sprite!)
                value1 = value1! + 1
            }
        //Check Collision for Bullet and AlienShip2
        value2 =  CollisionManager.Explosion(scene: self, object1: bulletSprite!, object2: alienShip2Sprite!)
            if(value2 == 1){
                print("value2")
                alienShip2Sprite?.removeFromParent()
                bulletSprite?.position.y = -1
                self.bulletSprite?.removeFromParent()
                
                // add alien
                self.alienShip2Sprite = AlienShip(ImageString: "AlienShip2", InitialScale: 1.2)
                self.alienShip2Sprite?.name = "AlienShip2"
                self.addChild(self.alienShip2Sprite!)
                value2 = value2! + 1
            }
           
        //Check Collision for Bullet and AlienShip3
        value3 =  CollisionManager.Explosion(scene: self, object1: bulletSprite!, object2: alienShip3Sprite!)
       
      
        if(value3 == 1){
            print("value3")
            alienShip3Sprite?.removeFromParent()
              bulletSprite?.position.y = -1
             self.bulletSprite?.removeFromParent()
            
            //add blast
            self.blastSprite = Blast()
            blastSprite?.position = (alienShip3Sprite?.position)!
            self.addChild(self.blastSprite!)
            
            self.run(SKAction.wait(forDuration: 0.1)) {
                self.blastSprite?.removeFromParent()
               
            }
            // add alien
            self.alienShip3Sprite = AlienShip(ImageString: "AlienShip3", InitialScale: 1.2)
            self.alienShip3Sprite?.name = "AlienShip3"
            self.addChild(self.alienShip3Sprite!)
            value3 = value3! + 1
        }
        }
        
        
        //Update Labels for lives and Score
        
        if(ScoreManager.Lives > 0) {
            livesLabel?.text = "Lives: \( ScoreManager.Lives)"
            scoreLabel?.text = "Score: \( ScoreManager.Score)"
        }
        else
        {
            if let view = self.view{
                if let scene = SKScene(fileNamed: "GameOverScene") {
                    scene.scaleMode = .aspectFit
                    view.presentScene(scene)
                }
            }
        }
    }
}
