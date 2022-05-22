//
//  CountdownView.swift
//  Rinha
//
//  Created by Daniella Onishi on 22/05/22.
//

import SwiftUI
import SpriteKit
import AVFoundation

class CountdownScene: SKScene {
    
    static func buildCountdownScene() -> CountdownScene {
        let scene = CountdownScene(fileNamed: "Countdown")!
        scene.scaleMode = .resizeFill
        scene.backgroundColor = .clear
        return scene
    }
   
    var countdownNumberOne: SKSpriteNode {
        childNode(withName: "Countdown-Number-1") as! SKSpriteNode
    }
    
    var countdownNumberTwo: SKSpriteNode {
        childNode(withName: "Countdown-Number-2") as! SKSpriteNode
    }
    
    var countdownNumberThree: SKSpriteNode {
        childNode(withName: "Countdown-Number-3") as! SKSpriteNode
    }
    
    var start: SKSpriteNode {
        childNode(withName: "Start") as! SKSpriteNode
    }
    
    
    
    var initialPosition: CGPoint!
    var finalPosition: CGPoint!
    
    static func buildCountdownAnimation() -> CountdownScene {
        let scene = CountdownScene(fileNamed: "Countdown")!
        scene.scaleMode = .resizeFill
        scene.backgroundColor = .clear
        return scene
    }
    
   
    
    
    override func didMove(to view: SKView) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            
            self.setupNumberAnimation(number: self.countdownNumberOne)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.1) {
                self.setupNumberAnimation(number: self.countdownNumberTwo)
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.1) {
                self.setupNumberAnimation(number: self.countdownNumberThree)
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.1) {
                self.setupNumberAnimation(number: self.start)
            }
        }
        
       
    }
    
    func setupNumberAnimation(number: SKSpriteNode) {
        initialPosition = CGPoint(x: 0, y: 30)
        number.position = initialPosition
        finalPosition = CGPoint(x: 0, y: 0)

        let move1 = SKAction.move(to: finalPosition, duration: 0.5)
        move1.timingMode = .easeOut
        let fadeAlpha = SKAction.fadeAlpha(to: 0, duration: 0.25)
        fadeAlpha.timingMode = .easeOut
        
        
        
        let sequence = SKAction.sequence([move1, fadeAlpha])
        number.run(sequence)
    }
    
  
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    func touchDown(atPoint pos : CGPoint) {
      
    }
    
    override func update(_ currentTime: TimeInterval) {
        
    }
}


