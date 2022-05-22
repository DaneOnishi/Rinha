//
//  DojoScene.swift
//  Rinha
//
//  Created by Daniella Onishi on 16/05/22.
//

import Foundation
import SpriteKit

class DojoView: SKScene {
    
    enum DojoViewAction {
        case start
        case info
        case sound
        case settings
    }
    
    var actionPerformed: ((DojoViewAction, DojoView) -> ())?
    static func buildScene(actionPerformed: ((DojoViewAction, DojoView) -> ())?) -> DojoView {
        let scene = DojoView(fileNamed: "DojoScene")!
        scene.actionPerformed = actionPerformed
        scene.backgroundColor = .clear
        //scene.scaleMode = .aspectFit
        return scene
    }
    
    var base:SKSpriteNode!
    var dojo: SKSpriteNode!
    var startButton: SKSpriteNode!
    var settingsButton: SKSpriteNode!
    var infoButton: SKSpriteNode!
    var soundButton: SKSpriteNode!
    var dojoInitialPosition: CGPoint!
    var dojoFinalPosition: CGPoint!
    
    
    override func didMove(to view: SKView) {
        dojo = (childNode(withName: "Dojo") as! SKSpriteNode)
        base = (dojo.childNode(withName: "Base") as! SKSpriteNode)
        startButton = (childNode(withName: "Start Button") as! SKSpriteNode)
        settingsButton = (childNode(withName: "Settings Button") as! SKSpriteNode)
        infoButton = (childNode(withName: "Info Button") as! SKSpriteNode)
        soundButton = (childNode(withName: "Sound Button") as! SKSpriteNode)
        
        
        setupDojoAnimation()
    }
    
    
    
    func setupDojoAnimation() {
        dojoInitialPosition = CGPoint(x: 0, y: 40)
        dojo.position = dojoInitialPosition
        dojoFinalPosition = CGPoint(x: 0, y: 50)
        let move1 = SKAction.move(to: dojoFinalPosition, duration: 1.5)
        let move2 = SKAction.move(to: dojoInitialPosition, duration: 1.5)
        let sequenceRepeat = SKAction.repeatForever(SKAction.sequence([move1, move2]))
        dojo.run(sequenceRepeat)
    }
    
  
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    func touchDown(atPoint pos : CGPoint) {
        if infoButton.contains(pos) {
            actionPerformed?(.info, self)
        }
        
        if startButton.contains(pos) {
            actionPerformed?(.start, self)
        }
        
        if settingsButton.contains(pos) {
            actionPerformed?(.settings, self)
        }
        
        if soundButton.contains(pos) {
            actionPerformed?(.sound, self)
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        
    }
    
    func changeSoundButtonImage(to imageName: String) {
        soundButton.texture = SKTexture(imageNamed: imageName)
    }
    
}

