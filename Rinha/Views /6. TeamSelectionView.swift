//
//  TeamSelectionView.swift
//  Rinha
//
//  Created by Bruno Imai on 12/05/22.
//

import SwiftUI
import AVFoundation

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
                    coordinator.switchScreen(to: .game)
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
                    print("Button pressed!")
                    isUpperButtonSelected.toggle()
                    isDownButtonSelected = false
                }) {
                    Image("Wood-Top")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 424, height: 270)
                }
                .clipShape(TopRectangleButtonShape())
                .contentShape(TopRectangleButtonShape())
                .offset(x: 50,y: -50)
                .if(isUpperButtonSelected) { view in
                    view.shadow(color: .white.opacity(0.5), radius: 30.0, x: 10.0, y: 10.0)
                }
                
                Button(action: {
                    print("Button pressed!")
                    isDownButtonSelected.toggle()
                    isUpperButtonSelected = false
                }) {
                    Image("Wood-Bottom")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 400, height: 250)
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
