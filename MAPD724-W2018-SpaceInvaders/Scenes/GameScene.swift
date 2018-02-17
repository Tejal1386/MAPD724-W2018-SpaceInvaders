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
    var planetSprite: Planet?
    var alienShipSprite: AlienShip?
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
      
        //add label
        
        livesLabel = Label(labelString: "Lives: 5", position: CGPoint(x: 20.0, y: frame.height - 20.0), fontSize: 30.0, fontName: "Dock51", fontColor: SKColor.yellow, isCentered: false)
        self.addChild(livesLabel!)
        
        //add label
        
        scoreLabel = Label(labelString: "Lives: 99999", position: CGPoint(x: frame.width * 0.5, y: frame.height - 20.0), fontSize: 30.0, fontName: "Dock51", fontColor: SKColor.yellow, isCentered: false)
        self.addChild(scoreLabel!)
        
        
        //background sound
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
