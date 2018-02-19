//
//  GameScene.swift
//  MAPD724-W2018-SpaceInvaders
//
//  Created by Tejal Patel on 2018-02-12.
//  Copyright © 2018 Centennial College. All rights reserved.
//

import SpriteKit
import GameplayKit
import UIKit
import AVFoundation

let screenSize = UIScreen.main.bounds
var screenWidth: CGFloat?
var screenHeight: CGFloat?

class GameScene: SKScene {
    
    //Game Variable
    //Game Variable
    var spaceSprite: Space?
    var spaceShipSprite: SpaceShip?
    var planet1Sprite: Planet?
    var planet2Sprite: Planet?
    var planet3Sprite: Planet?
    var alienShip1Sprite: [AlienShip] = []
     var alienShip2Sprite: AlienShip?
     var alienShip3Sprite: AlienShip?
    var bulletSprite: Bullet?
    var buttonStartSprite: Button?
    var buttonInstructuinSprite: Button?
    var gameOverLabel: Label?
    var pressAnyKeyLabel: Label?
    var livesLabel: Label?
    var scoreLabel: Label?
    
    
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
        
        // add Planet1
        self.planet1Sprite = Planet(ImageString: "Planet1", InitialScale: 1.2)
        self.addChild(self.planet1Sprite!)
        
        // add Planet2
        self.planet2Sprite = Planet(ImageString: "Planet2", InitialScale: 1.2)
        self.addChild(self.planet2Sprite!)
        
        // add Planet3
        self.planet3Sprite = Planet(ImageString: "Planet3", InitialScale: 1.0)
        self.addChild(self.planet3Sprite!)
        
      
        //add clouds
        for index in 0...2{
            let alienship: AlienShip = AlienShip(ImageString: "AlienShip" + String(index+1), InitialScale: 1.0)
            alienShip1Sprite.append(alienship)
            self.addChild(alienShip1Sprite[index])
        }
        
        
        //add label
        
        livesLabel = Label(labelString: "Lives: 5", position: CGPoint(x: 20.0, y: frame.height - 20.0), fontSize: 30.0, fontName: "Dock51", fontColor: SKColor.yellow, isCentered: false)
        self.addChild(livesLabel!)
        
        //add label
        
        scoreLabel = Label(labelString: "Lives: 99999", position: CGPoint(x: frame.width * 0.5, y: frame.height - 20.0), fontSize: 30.0, fontName: "Dock51", fontColor: SKColor.yellow, isCentered: false)
        self.addChild(scoreLabel!)
        
        
    /*    //background sound
        let engineSound = SKAudioNode(fileNamed: "engine.mp3")
        self.addChild(engineSound)
        engineSound.autoplayLooped = true
        
        //preload Sounds
        do{
            let Sounds: [String] = ["thunder", "yay"]
            for sound in Sounds {
                let path: String = Bundle.main.path(forResource: sound, ofType: "mp3")!
                let url: URL = URL(fileURLWithPath: path)
                let player: AVAudioPlayer = try AVAudioPlayer(contentsOf: url)
                player.prepareToPlay()
            }
        }
        catch {
            
        } */
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
        
        if let touch = touches.first {
            
            let location = touch.location(in: self)
            
            let node = atPoint(location)
            
            if node.name == "spaceship" {
               /* if let view = self.view{
                    if let scene = SKScene(fileNamed: "GameStartScene") {
                        scene.scaleMode = .aspectFit
                        view.presentScene(scene)
                    }
                }*/
            }
        }
        
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
        //self.alienShip1Sprite.Update()
        
        for alienship in alienShip1Sprite{
            alienship.Update()
          CollisionManager.CheckCllision(scene: self, object1: spaceShipSprite!, object2: alienship)
            
        }
        //Update Labels
        
        if(ScoreManager.Lives > 0) {
            livesLabel?.text = "Lives: \( ScoreManager.Lives)"
            scoreLabel?.text = "Score: \( ScoreManager.Score)"
        }
        else
        {
            /*if let view = self.view{
                if let scene = SKScene(fileNamed: "GameOverScene") {
                    scene.scaleMode = .aspectFit
                    view.presentScene(scene)
                }
            }*/
        }
    }
}
