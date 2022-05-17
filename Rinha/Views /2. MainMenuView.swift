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
    @State private var startGame = false
    @State private var isMusicRunning = true
    @State private var showInfo = false
    @State private var showSettings = false
    
    
    static func buildDoorAnimationScene() -> DoorsAnimation {
        let scene = DoorsAnimation(fileNamed: "Doors")!
        scene.scaleMode = .resizeFill
        return scene
    }
    let music =  SFXMusicSingleton.shared
    var doorsScene = Self.buildDoorAnimationScene()
    
    var body: some View {
        ZStack {
            NavigationView {
                ZStack(alignment: .center) {
                    Image("Background-2")
                        .resizable()
                        .edgesIgnoringSafeArea(.all)
                    
                    Image("Circle")
                        .resizable()
                        .frame(width: 150, height: 150, alignment: .center)
                    
                    VStack {
                        SpriteView(scene: DojoView.buildScene(actionPerformed: { action, scene in
                            switch action {
                            case .start:
                                startGame = true
                            case .sound:
                                if isMusicRunning {
                                    music.pauseMenuMusic()
                                    scene.changeSoundButtonImage(to: "No-Sound-Button")
                                } else {
                                    music.playMenuMusic()
                                    scene.changeSoundButtonImage(to: "Sound-Button")
                                }
                                isMusicRunning.toggle()
                                
                                
                                
                            case .info:
                                doorsScene.performDoorAnimation()
                            case .settings:
                                showSettings = true
                            }
                        }), options: [.allowsTransparency])
                        .background(Color.clear)
                        
                    }//.frame(width: 385/1.5, height: 470/1.5, alignment: .center)
                    
                    
                    VStack {
                                            Button {
                                                startGame.toggle()
                                            } label: {
                                                Image("Start-Button")
                                                    .resizable()
                                                    .frame(width: 75, height: 75, alignment: .center)
                                            }.padding(-37)
                        
                                            HStack {
                                                Button {
                                                    showInfo.toggle()
                                                } label: {
                                                    Image("Details-Button")
                                                        .resizable()
                                                        .frame(width: 75, height: 75, alignment: .center)
                                                }
                        
                                                Button {
                                                    showSettings.toggle()
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
                        
                        
                        NavigationLink(isActive: $startGame) {
                            __ConnectingTableView()
                        } label: {
                            EmptyView()
                        }
                        
                        NavigationLink(isActive: $showInfo) {
                            InformationView()
                        } label: {
                            EmptyView()
                        }
                        
                        NavigationLink(isActive: $showSettings) {
                            __ConnectingTableView()
                        } label: {
                            EmptyView()
                        }
                    }.padding(.top, 500)
                }.onAppear{
                    
                    music.playMenuMusic()
                    
                }
            }
            
            
                SpriteView(scene: doorsScene, options: [.allowsTransparency])
                .ignoresSafeArea()
                .background(Color.clear)
//                .scaledToFill()
                .allowsHitTesting(false)
//                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
        
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
