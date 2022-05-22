//
//  InformationView.swift
//  Rinha
//
//  Created by Daniella Onishi on 13/05/22.
//

import SwiftUI
import ACarousel


struct InformationView: View {
    
    let chars = Character.allCases.map { $0.carouselImageSmall }
    @State var currentIndex: Int = 0
    
    var characters: [CharacterInformation] = [
        CharacterInformation(character: "", name: "Rata Loka", text: ""),
        CharacterInformation(character: "Llhama Nhaca", name: "Llama Nhaca", text: ""),
        CharacterInformation(character: "Peixano", name: "Peixano", text: ""),
        CharacterInformation(character: "Braba", name: "Braba", text: "")
    ]
    
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
//                    Image(roles[currentIndex])
//                        .resizable()
//                        .scaledToFill()
//                        .frame(width: 219, height: 219, alignment: .bottom)
//                        .clipShape(Circle())
//                        .offset(y: 19)
                }
                .padding(.top, 40)
                
//                ACarousel(roles, id: \.self,
//                          index: $currentIndex, headspace: 120,
//                          sidesScaling: 0.98) { name in
//                    ZStack {
//                        Image("Small-Chracter-Circle")
//                            .resizable()
//                            .frame(width: 138, height: 138)
//                            .clipShape(Circle())
//                        Image(name)
//                            .resizable()
//                            .scaledToFill()
//                            .frame(width: 87, height: 87, alignment: .bottom)
//                            .clipShape(Circle())
//                            .offset(y: 7)
//                    }
//                    .frame(height: 138)
//                }
                Spacer()
                    .frame(height: 60)
            }
            .padding([.top], 50)
            
            Background(text: "Know your character", textSize: 14)
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


struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView()
    }
}
