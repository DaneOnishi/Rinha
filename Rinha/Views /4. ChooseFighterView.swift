//
//  ChooseFighterView.swift
//  Rinha
//
//  Created by Bruno Imai on 10/05/22.
//

import SwiftUI
import ACarousel
import Lottie

struct Item: Identifiable {
    let id = UUID()
    let image: Image
}

struct ChooseFighterView: View {
    let chars = Character.allCases.map { $0.carouselImageSmall }
    let charsGif = Character.allCases.map { $0.characterGif }
    
    let allCharacters = Character.allCases
    
    @State var currentIndex: Int = 0
    
    @EnvironmentObject var coordinator: Coordinator
    
    var frameList : [String] = []
    

    
    var body: some View {
        
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                ZStack {
                    Image("Big-Character-Circle")
                        .resizable()
                        .frame(width: 325, height: 325)
                        .clipShape(Circle())

                    GIFImage(name: charsGif[currentIndex])
                        .frame(width: 350, height: 350)
                        .scaledToFill()
                        .clipShape(Circle())
                        .offset(y: 19)
                }
                .padding(.top, 40)
                
                ACarousel(chars,
                          id: \.self,
                          index: $currentIndex,
                          headspace: 120,
                          sidesScaling: 0.98) { name in
                    
                    ZStack {
                        Image("Small-Chracter-Circle")
                            .resizable()
                            .frame(width: 138, height: 138)
                            .clipShape(Circle())
                        Image(name)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 120, height: 120, alignment: .bottom)
                            .clipShape(Circle())
                            .offset(y: 7)
                    }
                    .frame(height: 138)
                }
                
                ButtonStyle(text: "Choose") {
                    SessionManager.shared.playerCharacter = allCharacters[currentIndex]
                    coordinator.switchScreen(to: .setMatch)
                }

                Spacer()
                    .frame(height: 60)
                
            }
            .padding([.top], 50)
            
            Background(text: "Choose your Fighter", textSize: 14)
            VStack{
                Spacer()
                HStack() {
                    BackButton().frame(width: 50, height: 50)
                        .offset(x: 17, y: 10)
                    Spacer()
                }
            }
        }
    }
}



struct ChooseFighterView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseFighterView()
    }
}
