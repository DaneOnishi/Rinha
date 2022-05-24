//
//  ChooseFighterView.swift
//  Rinha
//
//  Created by Bruno Imai on 10/05/22.
//

import SwiftUI
import ACarousel
import AVFoundation

struct Item: Identifiable {
    let id = UUID()
    let image: Image
}

struct ChooseFighterView: View {
    let chars = Character.allCases.map { $0.carouselImageSmall }
    
    @State var currentIndex: Int = 0
    
    @EnvironmentObject var coordinator: Coordinator
    
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
                    Image(chars[currentIndex])
                        .resizable()
                        .scaledToFill()
                        .frame(width: 219, height: 219, alignment: .bottom)
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
                            .frame(width: 87, height: 87, alignment: .bottom)
                            .clipShape(Circle())
                            .offset(y: 7)
                    }
                    .frame(height: 138)
                    
                }
                
                ButtonStyle(text: "Choose") {
                    coordinator.switchScreen(to: .setMatch)
                }

                Spacer()
                    .frame(height: 60)
                
            }
            .padding([.top], 50)
            
            Background(text: "Choose your Fighter", textSize: 14)
            VStack{
                Spacer()
            }
        }
    }
}



struct ChooseFighterView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseFighterView()
    }
}
