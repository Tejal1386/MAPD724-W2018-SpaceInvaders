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

class GameOverScene: SKScene {
    
    //Game Variable
    var spaceSprite: Space?
    var spaceShipSprite: SpaceShip?
    var planetSprite: Planet?
    var alienShipSprite: AlienShip?
    var bulletSprite: Bullet?
    var buttonStartSprite: Button?
    var buttonInstructuinSprite: Button?
    var gameOverLabel: Label?
    var pressAnyKeyLabel: Label?
    
    override func didMove(to view: SKView) {
        screenWidth = frame.width
        screenHeight = frame.height
  
        //add space
        self.spaceSprite = Space()
        self.addChild(self.spaceSprite!)
        
        // add SpaceShip
        self.spaceShipSprite = SpaceShip()
        self.spaceShipSprite?.position = CGPoint(x: screenWidth! * 0.5, y: 120)
        self.addChild(self.spaceShipSprite!)
    
        //add button
        self.buttonStartSprite = Button(ImageString: "playagain", InitialScale: 1.7)
        self.buttonStartSprite?.name = "playagain"
        self.buttonStartSprite?.position = CGPoint(x: screenWidth! * 0.5, y: 280)
        self.addChild(self.buttonStartSprite!)
        
        
        //add gameOver Label
        self.gameOverLabel = Label(labelString: "Game Over", position: CGPoint(x: frame.width * 0.5 , y: (frame.height * 0.5) + 50), fontSize: 60.0, fontName: "Dock51", fontColor: SKColor.red, isCentered: true)
        self.addChild(self.gameOverLabel!)
   
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
      
    }
    
    func touchMoved(toPoint pos : CGPoint) {
       
    }
    
    func touchUp(atPoint pos : CGPoint) {

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
       
        if let touch = touches.first {
            
            let location = touch.location(in: self)
            
            let node = atPoint(location)
            
              if node.name == "playagain" {
                ScoreManager.Lives = 5
                ScoreManager.Score = 0
                
                if let view = self.view{
                    if let scene = SKScene(fileNamed: "GameScene") {
                        scene.scaleMode = .aspectFit
                        view.presentScene(scene)
                    }
                }
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
      
    }
}
