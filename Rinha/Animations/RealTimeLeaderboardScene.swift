//
//  RealTimeLeaderboardScene.swift
//  Rinha
//
//  Created by Daniella Onishi on 23/05/22.
//


import SwiftUI
import SpriteKit
import AVFoundation

class RealTimeLeaderboardScene: SKScene {
    
    static func buildLeaderboardAnimation() -> RealTimeLeaderboardScene {
        let scene = RealTimeLeaderboardScene(fileNamed: "RealTimeLeaderboard")!
        scene.scaleMode = .resizeFill
        scene.backgroundColor = .clear
        return scene
    }
   
    var sideMenu: SKSpriteNode {
        childNode(withName: "Menu-Leaderboard") as! SKSpriteNode
    }
    
    var arrowButton: SKSpriteNode {
        sideMenu.childNode(withName: "Arrow-Button") as! SKSpriteNode
    }
    
    var initialPosition: CGPoint!
    var finalPosition: CGPoint!
    var isArrowButtonPressed = false
    
    static func buildCountdownAnimation() -> CountdownScene {
        let scene = CountdownScene(fileNamed: "Countdown")!
        scene.scaleMode = .resizeFill
        scene.backgroundColor = .clear
        return scene
    }
    
   
    
    
    override func didMove(to view: SKView) {
        

       
    }
    
    func openMenuAnimation() {
        initialPosition = CGPoint(x: 243, y: 0)
        sideMenu.position = initialPosition
        finalPosition = CGPoint(x: 93, y: 0)

        let move1 = SKAction.move(to: finalPosition, duration: 0.5)
        sideMenu.run(move1)
        
        let moveArrow = SKAction.rotate(toAngle: 0, duration: 0.5)
        arrowButton.run(moveArrow)
    }
    
    func closeMenuAnimation() {
        initialPosition = CGPoint(x: 93, y: 0)
        sideMenu.position = initialPosition
        finalPosition = CGPoint(x: 243, y: 0)

        let move1 = SKAction.move(to: finalPosition, duration: 0.5)
        sideMenu.run(move1)
        
        let moveArrow = SKAction.rotate(toAngle: .pi, duration: 0.5)
        arrowButton.run(moveArrow)
    }
    
    
  
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    func touchDown(atPoint pos : CGPoint) {
        
        
        if arrowButton.contains(sideMenu.convert(pos, from: self)) {
            isArrowButtonPressed = !isArrowButtonPressed
            
            if isArrowButtonPressed {
                openMenuAnimation()
            } else if !isArrowButtonPressed {
                closeMenuAnimation()
            }
        }
       
    }
    
    override func update(_ currentTime: TimeInterval) {
    }
}




