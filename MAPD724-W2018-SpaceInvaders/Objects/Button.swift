//
//  Button.swift
//  MAPD724-W2018-SpaceInvaders
//
//  Created by Tejal Patel on 2018-02-16.
//  Copyright © 2018 Centennial College. All rights reserved.
//

import SpriteKit

class Button: GameObject {
    // Constructor
    init(ImageString: String, InitialScale: CGFloat)
    {
        //Initialize the object with an image
        super.init(imageString: ImageString, initialScale: InitialScale)
        Start()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func CheckBounds() {
      
    }
    
    override func Start() {
        self.zPosition = 10
    }
    
    override func Update() {
       
    }
    
    func TouchMove(newPos: CGPoint){
        self.position = newPos
    }
    
    
}
