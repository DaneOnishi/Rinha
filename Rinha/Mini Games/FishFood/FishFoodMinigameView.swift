//
//  FishFoodMinigameView.swift
//  Rinha
//
//  Created by Bruno Imai on 18/05/22.
//

import SwiftUI
import SpriteKit
import CoreData

struct FishFoodMinigameView: View {

    var scene: GameScene {
        let scene = GameScene()
        scene.size = CGSize(width: 300, height: 400)
        scene.scaleMode = .fill
        return scene
    }

    @State var fishImage : String = "fishSmall"
    
    var body: some View {
        
        var foodEaten = 0
        
        ZStack {
            Color("FishMinigameColor")
                .edgesIgnoringSafeArea(.all)

            SpriteView(scene: scene, options: [.allowsTransparency])
            
                .ignoresSafeArea()
                .onShake {
                    FishManager.Shared.hasShaken = true
                    foodEaten += 1
                    
                    if foodEaten > 10 && foodEaten < 20{
                        fishImage = "fishMid"
                    } else if foodEaten >= 20 {
                        fishImage = "fishBig"
                    }
                    
                }
            
            VStack {
                HStack(alignment: .top) {
                    Spacer()
                    Image("foodPot")
                        .rotationEffect(Angle(degrees: 180))
//                        .offset(y: -110)
                    Spacer()
                }
                Spacer()
                ZStack {
                    Image(fishImage)
                    Image("sea")
                        .padding(.top, 130)
                        .offset(y: 10)
                }
            }
            Background(text: "Shake to feed the Fish!", textSize: 14)
        }
    }
    
    
}

class GameScene: SKScene {
    
    var win = false
    
    var hasShaken = false
    
    var foodEaten = 0
    
    let music =  SFXMusicSingleton.shared

    let fish = SKSpriteNode()
    var foodInScreen : [SKSpriteNode] = []
    
    func spawnFood() {
        print("Spawnei")
        let foodDrop = SKSpriteNode(imageNamed: "foodDrop")
        foodDrop.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: foodDrop.size.width,height: foodDrop.size.height))
        foodDrop.position = CGPoint(x:self.frame.midX, y:self.frame.maxY - 75)
        foodInScreen.append(foodDrop)
        self.addChild(foodDrop)
        
    }
    
    override func didMove(to view: SKView) {
        self.backgroundColor = .clear
        fish.position = CGPoint(x:self.frame.midX, y:self.frame.minY)
        self.addChild(fish)
        
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        physicsWorld.gravity = CGVector(dx: 0, dy: -1.62)
        
        print("INICIO")
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        hasShaken = FishManager.Shared.hasShaken
        
        if hasShaken {
            FishManager.Shared.hasShaken = false
            spawnFood()
        }
        
        foodInScreen = foodInScreen.filter{$0.name != "remove"}
        
        for food in foodInScreen {
            if fish.intersects(food) {
                food.name = "remove"
                music.playBiteSound()
                food.removeFromParent()
                foodEaten += 1
                print(foodEaten)
            }
        }
    }
}

struct FishFoodMinigameView_Previews: PreviewProvider {
    static var previews: some View {
        FishFoodMinigameView()
    }
}
