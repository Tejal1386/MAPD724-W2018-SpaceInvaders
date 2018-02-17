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

class GameInstructionScene: SKScene {
    
    //Game Variable
    var spaceSprite: Space?
    var spaceShipSprite: SpaceShip?
    var planetSprite: Planet?
    var alienShipSprite: AlienShip?
    var bulletSprite: Bullet?
    var buttonBackSprite: Button?
  
    var instructionLabel: Label?
    
    override func didMove(to view: SKView) {
        screenWidth = frame.width
        screenHeight = frame.height
  
        //add space
        self.spaceSprite = Space()
        self.addChild(self.spaceSprite!)
        
       
        //add button
        self.buttonBackSprite = Button(ImageString: "back button", InitialScale: 1.2)
        self.buttonBackSprite?.name = "ButtonBack"
        self.buttonBackSprite?.position = CGPoint(x: screenWidth! * 0.5, y: 80)
        self.addChild(self.buttonBackSprite!)
        
        
        
        //add gameOver Label
        self.instructionLabel = Label(labelString: "Instructions", position: CGPoint(x: frame.width * 0.5 , y: (frame.height * 0.5) + 250), fontSize: 50.0, fontName: "Dock51", fontColor: SKColor.red, isCentered: true)
        self.addChild(self.instructionLabel!)
   
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
            
            if node.name == "ButtonBack" {
                if let view = self.view{
                    if let scene = SKScene(fileNamed: "GameStartScene") {
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
