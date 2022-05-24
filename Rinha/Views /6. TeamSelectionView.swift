//
//  TeamSelectionView.swift
//  Rinha
//
//  Created by Bruno Imai on 12/05/22.
//

import SwiftUI

struct TeamSelectionView: View {
    
    @EnvironmentObject var coordinator: Coordinator
    
    @State var isUpperButtonSelected = false
    @State var isDownButtonSelected = false
    var isAnyButtonSelected: Bool {
        return isUpperButtonSelected || isDownButtonSelected
    }
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            VStack() {
                
                Spacer()
                ButtonStyle(text: "Select", onPress: {
                    coordinator.switchScreen(to: .queue)
                })
                    .offset(y: -40)
                    .disabled(!isAnyButtonSelected)
                    .opacity((isAnyButtonSelected ) ? 1 : 0.3)
                    
                    
            }
            Background(text: "Choose your Team!")
            VStack{
                Spacer()
                HStack() {
                    
                    BackButton().frame(width: 50, height: 50)
                        .offset(x: 30, y: 10)
                    Spacer()
                }
            }
            VStack {
                Spacer()
                Button(action: {
                    SessionManager.shared.firstTeam.append(QueueItem(imageName: SessionManager.shared.playerCharacter!.carouselImageSmall, isActive: true))
                    print("Button pressed!")
                    isUpperButtonSelected.toggle()
                    isDownButtonSelected = false
                }) {
                    ZStack {
                        Image("Wood-Top")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 424, height: 270)
                        Image("rat_upper_plank")
                            .resizable()
                            .scaledToFill()
                            .frame(height: 180)
                    }
                }
                .clipShape(TopRectangleButtonShape())
                .contentShape(TopRectangleButtonShape())
                .offset(x: 50,y: -50)
                .if(isUpperButtonSelected) { view in
                    view.shadow(color: .white.opacity(0.5), radius: 30.0, x: 10.0, y: 10.0)
                }
                
                Button(action: {
                    print("Button pressed!")
                    SessionManager.shared.secondTeam.append(QueueItem(imageName: SessionManager.shared.playerCharacter!.carouselImageSmall, isActive: true))
                    isDownButtonSelected.toggle()
                    isUpperButtonSelected = false
                }) {
                    ZStack {
                    Image("Wood-Bottom")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 400, height: 250)
                    Image("duck_under_plank")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 400, height: 250)
                            .offset(x: 10, y: -40)
                    }
                }
                .clipShape(BottomRectangleButtonShape())
                .contentShape(BottomRectangleButtonShape())
                .offset(y: -50)
                .if(isDownButtonSelected) { view in
                    view.shadow(color: .white.opacity(0.5), radius: 30.0, x: 10.0, y: 10.0)
                }
                Spacer()
                
            }
        }
    }
}

struct TeamSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TeamSelectionView()

        }
    }
}
