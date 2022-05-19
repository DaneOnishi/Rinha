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
    
    @State var buttonText: String = "empty"
    
    var body: some View {
        
        VStack {
            NavigationLink(isActive: $navigated, destination: {
                EmptyView()
            }) {
                EmptyView()
            }
            
            ZStack(alignment: .top) {
                MyARView()
                
                VStack {
                    HStack {
                        Image("Score-Left")
                            .resizable()
                            .frame(width: 200, height: 110, alignment: .leading)
                        Image("Score-Right")
                            .resizable()
                            .frame(width: 200, height: 110, alignment: .trailing)
                        
                    }.padding(.top, 50)
                    Spacer()
                    
                    ZStack {
                        Image("Bottom-Component")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width, height: 150, alignment: .center)
                        HStack {
                            Button {
                            } label: {
                                Image("Cheer-Button")
                                    .resizable()
                                    .frame(width: 75, height: 75, alignment: .center)
                            }
                            
                            Button {
                            } label: {
                                Image("Magnet")
                                    .resizable()
                                    .frame(width: 60, height: 70, alignment: .center)
                            }
                            
                            Button {
                            } label: {
                                Image("Fan")
                                    .resizable()
                                    .frame(width: 60, height: 60, alignment: .center)
                            }
                            
                            Button {
                            } label: {
                                Image("Box")
                                    .resizable()
                                    .frame(width: 60, height: 60, alignment: .center)
                            }
                        }.padding(20)
                    }.padding(.bottom, 0)
                    
                }
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


