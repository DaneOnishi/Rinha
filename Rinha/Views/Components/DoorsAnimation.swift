//
//  DoorsAnimation.swift
//  Rinha
//
//  Created by Daniella Onishi on 17/05/22.
//

import SwiftUI
import SpriteKit

class DoorsAnimation: SKScene {
    var leftDoor: SKSpriteNode {
        childNode(withName: "Door-Left") as! SKSpriteNode
    }
    var rightDoor: SKSpriteNode {
        childNode(withName: "Door-Right") as! SKSpriteNode
    }
    var leftDoorInitialPosition: CGPoint!
    var leftDoorFinalPosition: CGPoint!
    var rightDoorInitialPosition: CGPoint!
    var rightDoorFinalPosition: CGPoint!
    
    
    override func didMove(to view: SKView) {
//        leftDoor = ()
//        rightDoor = ()
//        
//        leftDoor.size.height = size.height
//        leftDoor.size.width = size.width / 2
//        rightDoor.size.height = size.height
//        rightDoor.size.width = size.width / 2
        performDoorAnimation()
    }
    
    func moveLeftDoor() {
        leftDoorInitialPosition = CGPoint(x: -size.width, y: 0)
        leftDoorFinalPosition = CGPoint(x: -size.width/8, y: 0)
        leftDoor.position = leftDoorInitialPosition
        
        let move1 = SKAction.move(to: leftDoorFinalPosition, duration: 0.5)
        let move2 = SKAction.wait(forDuration: 0.5)
        let move3 = SKAction.move(to: leftDoorInitialPosition, duration: 0.5)
        
        let sequence = SKAction.sequence([move1, move2, move3])
        leftDoor.run(sequence)
    }
    
    func moveRightDoor() {
        rightDoorInitialPosition = CGPoint(x: size.width, y: 0)
        rightDoorFinalPosition = CGPoint(x: size.width / 8, y: 0)
        rightDoor.position = rightDoorInitialPosition
        
        let move1 = SKAction.move(to: rightDoorFinalPosition, duration: 0.5)
        let move2 = SKAction.wait(forDuration: 0.5)
        let move3 = SKAction.move(to: rightDoorInitialPosition, duration: 0.5)
        
        let sequence = SKAction.sequence([move1, move2, move3])
        rightDoor.run(sequence)
    }
    
    func performDoorAnimation() {
        moveLeftDoor()
        moveRightDoor()
    }
    
    override func update(_ currentTime: TimeInterval) {
        
    }
}

