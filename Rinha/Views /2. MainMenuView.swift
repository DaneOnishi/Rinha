//
//  MainMenuView.swift
//  Rinha
//
//  Created by Daniella Onishi on 09/05/22.
//

import SwiftUI
import AVFoundation
import SpriteKit

struct MainMenuView: View {
    
    @EnvironmentObject var coordinator: Coordinator
    
    @State private var isMusicRunning = true
    
    let music =  SFXMusicSingleton.shared
    
    var body: some View {
        ZStack {
            ZStack(alignment: .center) {
                Image("Background-2")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                
                
                VStack {
                    SpriteView(scene: DojoView.buildScene(actionPerformed: nil), options: [.allowsTransparency])
                        .background(Color.clear)
                }.padding(.bottom, 200)
                
                VStack {
                    Button {
                        coordinator.switchScreen(to: .connecting)
                    } label: {
                        Image("Start-Button")
                            .resizable()
                            .frame(width: 75, height: 75, alignment: .center)
                    }.padding(-37)
                    
                    HStack {
                        Button {
                            coordinator.switchScreen(to: .infoView)
                        } label: {
                            Image("Details-Button")
                                .resizable()
                                .frame(width: 75, height: 75, alignment: .center)
                        }
                        
                        Button {
                            coordinator.switchScreen(to: .leaderboard)
                        } label: {
                            Image("Details-Button")
                                .resizable()
                                .frame(width: 75, height: 75, alignment: .center)
                        }
                    }.padding(-3)
                    
                    Button {
                        if isMusicRunning {
                            music.pauseMenuMusic()
                        } else {
                            music.playMenuMusic()
                        }
                        
                        isMusicRunning.toggle()
                    } label: {
                        if isMusicRunning {
                            Image("No-Sound-Button")
                                .resizable()
                                .frame(width: 75, height: 75, alignment: .center)
                        } else {
                            Image("Sound-Button")
                                .resizable()
                                .frame(width: 75, height: 75, alignment: .center)
                        }
                        
                    }.padding(-37)
                }.padding(.top, 300)
            }
        }
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
