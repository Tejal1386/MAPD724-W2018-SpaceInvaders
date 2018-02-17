//
//  Bullet.swift
//  MAPD724-W2018-SpaceInvaders
//
//  Created by Tejal Patel on 2018-02-17.
//  Copyright © 2018 Centennial College. All rights reserved.
//

import SpriteKit

class Bullet: GameObject {
    // Constructor
    init(){
        super.init(imageString: "Bullet", initialScale: 1.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func CheckBounds() {
       
    }
    
    override func Start() {
        self.zPosition = 2
    }
    
    override func Update() {
       
    }
    
    func TouchMove(newPos: CGPoint){
        self.position = newPos
    }
}
