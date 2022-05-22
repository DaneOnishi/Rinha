//
//  DoorsAnimation.swift
//  Rinha
//
//  Created by Daniella Onishi on 17/05/22.
//

import SwiftUI
import SpriteKit

class DoorsAnimation: SKScene {
    
    static func buildDoorAnimationScene() -> DoorsAnimation {
        let scene = DoorsAnimation(fileNamed: "Doors")!
        scene.scaleMode = .resizeFill
        scene.backgroundColor = .clear
        return scene
    }
    
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
    
}

extension DoorsAnimation: CoordinatorTransitioner {
    func triggerTransition(duration: Double, onStart: (() -> ())?, onMiddle: (() -> ())?, onEnd: (() -> ())?) {
        onStart?()
        
        rightDoorInitialPosition = CGPoint(x: size.width, y: 0)
        rightDoorFinalPosition = CGPoint(x: size.width / 2.65, y: 0)
        rightDoor.position = rightDoorInitialPosition
        
        let rightMove1 = SKAction.move(to: rightDoorFinalPosition, duration: duration/3)
        let rightMove2 = SKAction.wait(forDuration: duration/3)
        let rightMove3 = SKAction.move(to: rightDoorInitialPosition, duration: duration/3)
        
        let rightSequence = SKAction.sequence([rightMove1, rightMove2, rightMove3])
        rightDoor.run(rightSequence)
    
        leftDoorInitialPosition = CGPoint(x: -size.width, y: 0)
        leftDoorFinalPosition = CGPoint(x: -size.width / 2.65, y: 0)
        leftDoor.position = leftDoorInitialPosition
        
        let leftMove1 = SKAction.move(to: leftDoorFinalPosition, duration: duration/3)
        let leftMove2 = SKAction.wait(forDuration: duration/3)
        let leftMove3 = SKAction.move(to: leftDoorInitialPosition, duration: duration/3)
        
        let leftSequence = SKAction.sequence([leftMove2, leftMove3])
        
        leftDoor.run(leftMove1) {
            onMiddle?()
            
            self.leftDoor.run(leftSequence)
        }
    }
}

