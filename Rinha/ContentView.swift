//
//  ContentView.swift
//  Rinha
//
//  Created by Daniella Onishi on 09/05/22.
//

import SwiftUI
import SpriteKit

struct ContentView: View {
    @StateObject var coordinator = Coordinator()
    
    var doorScene = DoorsAnimation.buildDoorAnimationScene()
    
    var body: some View {
        ZStack {
            
            switch coordinator.currentScreen {
            case .splash:
                SplashScreenView()
            case .mainMenu:
                MainMenuView()
            case .leaderboard:
                Leaderboard()
            case .infoView:
                InformationView()
            case .connecting:
                __ConnectingTableView()
            case .chooseFighter:
                ChooseFighterView()
            case .setMatch:
                __SetMatchView(state: .noPlayer)
            case .teamSelection:
                TeamSelectionView()
            case .game:
                GameView(userList: [
                    realTimeLeaderboardEntry(position: 1, name: "Armando"),
                    realTimeLeaderboardEntry(position: 2, name: "Blob")
                ])
            }
            
            
            SpriteView(scene: doorScene, options: [.allowsTransparency])
                .ignoresSafeArea()
                .background(Color.clear)
                .allowsHitTesting(false)
        }.environmentObject(coordinator)
        .onAppear {
            coordinator.transitioner = doorScene
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
