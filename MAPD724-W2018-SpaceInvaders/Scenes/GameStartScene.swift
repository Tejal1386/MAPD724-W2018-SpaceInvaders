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

class GameStartScene: SKScene {
    
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
        
        // add Bullet
        self.bulletSprite = Bullet()
        self.bulletSprite?.position = CGPoint(x: screenWidth! * 0.5, y: 180)
        self.addChild(self.bulletSprite!)
       
        // add Bullet
        self.bulletSprite = Bullet()
        self.bulletSprite?.position = CGPoint(x: screenWidth! * 0.5, y: 240)
        self.addChild(self.bulletSprite!)
        
        
        // add AlienShip1
        self.alienShipSprite = AlienShip(ImageString: "AlienShip1", InitialScale: 1.0)
        self.alienShipSprite?.position = CGPoint(x: (screenWidth! * 0.5) + 70, y: 500)
        self.addChild(self.alienShipSprite!)
        
        // add AlienShip2
        self.alienShipSprite = AlienShip(ImageString: "AlienShip2", InitialScale: 1.0)
        self.alienShipSprite?.position = CGPoint(x: (screenWidth! * 0.5) - 70, y: 570)
        self.addChild(self.alienShipSprite!)
        
        // add AlienShip3
        self.alienShipSprite = AlienShip(ImageString: "AlienShip3", InitialScale: 1.2)
        self.alienShipSprite?.position = CGPoint(x: (screenWidth! * 0.5) - 50, y: 340)
        self.addChild(self.alienShipSprite!)
        
        
        // add Planet1
        self.planetSprite = Planet(ImageString: "Planet1", InitialScale: 1.2)
        self.planetSprite?.position = CGPoint(x: (screenWidth! * 0.5) - 120, y: 450)
        self.addChild(self.planetSprite!)
        
        // add Planet2
        self.planetSprite = Planet(ImageString: "Planet2", InitialScale: 1.2)
        self.planetSprite?.position = CGPoint(x: (screenWidth! * 0.5) + 70, y: 320)
        self.addChild(self.planetSprite!)
        
        // add Planet3
        self.planetSprite = Planet(ImageString: "Planet3", InitialScale: 1.0)
        self.planetSprite?.position = CGPoint(x: (screenWidth! * 0.5) - 100, y: 200)
        self.addChild(self.planetSprite!)
        
        //add button
        self.buttonStartSprite = Button(ImageString: "start-button", InitialScale: 1.7)
        self.buttonStartSprite?.name = "StartButton"
        self.buttonStartSprite?.position = CGPoint(x: screenWidth! * 0.5, y: 280)
        self.addChild(self.buttonStartSprite!)
        
        
       //add button
        self.buttonInstructuinSprite = Button(ImageString: "instructions", InitialScale: 1.0)
        self.buttonInstructuinSprite?.name = "InstructionButton"
        self.buttonInstructuinSprite?.position = CGPoint(x: screenWidth! * 0.5, y: 50)
        self.addChild(self.buttonInstructuinSprite!)
        
        //add gameOver Label
        self.gameOverLabel = Label(labelString: "Space Invaders", position: CGPoint(x: frame.width * 0.5 , y: (frame.height * 0.5) + 50), fontSize: 40.0, fontName: "Dock51", fontColor: SKColor.red, isCentered: true)
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
            
              if node.name == "StartButton" {
                if let view = self.view{
                    if let scene = SKScene(fileNamed: "GameScene") {
                        scene.scaleMode = .aspectFit
                        view.presentScene(scene)
                    }
                }
              }else  if node.name == "InstructionButton" {
                if let view = self.view{
                    if let scene = SKScene(fileNamed: "GameInstructionScene") {
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
