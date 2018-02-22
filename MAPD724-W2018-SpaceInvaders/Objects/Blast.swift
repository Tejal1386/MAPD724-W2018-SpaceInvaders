//
//  Blast.swift
//  MAPD724-W2018-SpaceInvaders
//
//  Created by Tejal Patel on 2018-02-20.
//  Copyright © 2018 Centennial College. All rights reserved.
//

import SpriteKit

class Blast: GameObject {

    // Constructor
    init(){
        super.init(imageString: "blast", initialScale: 1.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func Start() {
        self.zPosition = 5
        self.Reset()
        self.dy = 5.0
    }
    
    override func Reset() {
        self.position.y = 700 + self.height!
        let randomX: Int = (randomSource?.nextInt(upperBound: Int(screenWidth! - self.width!)))! + Int(self.halfwidth!)
        self.position.x = CGFloat(randomX)
    }
    override func CheckBounds() {
        if(self.position.y <  (0 - self.height!))
        {
            self.Reset()
        }
    }
    
    override func Update() {
        self.position.y += self.dy! + 5
        self.CheckBounds()
    }
}
