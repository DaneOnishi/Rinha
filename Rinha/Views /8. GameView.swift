//
//  GameView.swift
//  Rinha
//
//  Created by Daniella Onishi on 19/05/22.
//

import Foundation
import SwiftUI
import SpriteKit
import RealityKit


struct GameView: View {
    
    @State var navigated = false
    @StateObject var vm = ARViewContainerViewModel()
    @State var isFanButtonEnabled = false
    @State var isMagnetButtonEnabled = false
    @State var isGoalButtonEnabled = false
    
    @State var rectangleOpen = false
    
    @State var buttonText: String = "empty"
    var countdownScene = CountdownScene.buildCountdownScene()
    var leaderboardScene = RealTimeLeaderboardScene.buildLeaderboardAnimation()
    
    var body: some View {
        
        VStack {
            NavigationLink(isActive: $navigated, destination: {
                EmptyView()
            }) {
                EmptyView()
            }
            
            ZStack(alignment: .center) {
                MyARView()
                    .edgesIgnoringSafeArea(.all)
                SpecialEffectsView()
                
                
//                    .edgesIgnoringSafeArea(.all)
                    
                
                
                VStack {
                    HStack {
                        Image("Score-Left")
                            .resizable()
                            .frame(width: 200, height: 115, alignment: .leading)
                        Image("Score-Right")
                            .resizable()
                            .frame(width: 200, height: 115, alignment: .trailing)
                        
                    }.padding(.top, 50)
                    Spacer()
                    
                    ZStack {
                        
                        Image("Bottom-Component")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width, height: 150, alignment: .center)
                            
                        HStack {
                            Button {
                                SFXMusicSingleton.shared.playCharacterSound(character: SessionManager.shared.character ?? .fish)
                            } label: {
                                Image("Cheer-Button")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 75, height: 75, alignment: .center)
                            }.padding(.leading, 20)
                                
                            
                            Button {
                            } label: {
                                Image("Magnet")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 80, height: 80, alignment: .center)
                            }.padding(5)
                                .disabled(isMagnetButtonEnabled)
                                .opacity((isMagnetButtonEnabled) ? 1 : 0.3)
                            
                            Button {
                            } label: {
                                Image("Fan")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 75, height: 75, alignment: .center)
                            }.padding(5)
                                .disabled(isFanButtonEnabled)
                                .opacity((isFanButtonEnabled) ? 1 : 0.3)

                            Button {
                            } label: {
                                Image("Box")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 75, height: 75, alignment: .center)
                            }.padding(.trailing, 20)
                                .disabled(isGoalButtonEnabled)
                                .opacity((isGoalButtonEnabled) ? 1 : 0.3)
                        }
                    }.padding(.bottom, 0)
                }
                
                
//                   SpriteView(scene: leaderboardScene, options: [.allowsTransparency])
//                       .ignoresSafeArea()
//                       .background(Color.clear)
                
                HStack {
                    Spacer()
                    ZStack(alignment: .leading) {
                        
                        ZStack(alignment: .topTrailing) {
                            Image("Menu-Leaderboard")
                                .resizable()
                                .frame(width: 136, height: 422, alignment: .trailing)
                                .onTapGesture {
                                    self.rectangleOpen.toggle()
                                }
                            
                            HStack(alignment: .top) {
                                VStack(alignment: .trailing) {
                                    Circle()
                                        .frame(width: 48, height: 48, alignment: .center)
                                        .foregroundColor(Color.red)
                                    Circle()
                                        .frame(width: 48, height: 48, alignment: .center)
                                        .foregroundColor(Color.red)
                                    Circle()
                                        .frame(width: 48, height: 48, alignment: .center)
                                        .foregroundColor(Color.blue)
                                        
                                }
                            }
                            .padding(.top, 70)
                            .padding(.trailing, 30)
                            
                            
                        }
                        
                        Image("Arrow-Button")
                            .animation(.easeInOut, value: self.rectangleOpen)
                            .rotationEffect(Angle(degrees: self.rectangleOpen ? 0 : 180))
                            .padding(.top, 22)
                            .padding(.leading, 8)
                    }
                    .padding(.trailing, self.rectangleOpen ? 0 : -80)
                    .animation(.easeInOut, value: self.rectangleOpen)
                    
                }
                
             
                SpriteView(scene: countdownScene, options: [.allowsTransparency])
                    .ignoresSafeArea()
                    .background(Color.clear)
                    .allowsHitTesting(false)
                
            }
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .onReceive(NotificationCenter.default.publisher(for: Notification.Name(rawValue: "ARViewNeedsNavigate"))) { _ in
            navigated = true
        }
    }
}


class ARViewContainerViewModel: ObservableObject {
    weak var view: ARView?
    
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}

