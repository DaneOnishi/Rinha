//
//  InformationView.swift
//  Rinha
//
//  Created by Daniella Onishi on 13/05/22.
//

import SwiftUI
import ACarousel


struct InformationView: View {
    
    let chars = Character.allCases.map { $0.characterInfoImage }
    let charNames = Character.allCases.map { $0.characterTagImage }
    @State var currentIndex: Int = 0
    @EnvironmentObject var coordinator: Coordinator
    
    let sessionManager = SessionManager.shared
//    var characters: [CharacterInformation] = [
//        CharacterInformation(character: "", name: "Rata Loka", text: ""),
//        CharacterInformation(character: "Llhama Nhaca", name: "Llama Nhaca", text: ""),
//        CharacterInformation(character: "Peixano", name: "Peixano", text: ""),
//        CharacterInformation(character: "Braba", name: "Braba", text: "")
//    ]
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                ZStack {
                    Image(chars[$currentIndex.wrappedValue])
                        .resizable()
                        .frame(width: 400, height: 400)
                }

                
                ACarousel(charNames,
                          id: \.self,
                          index: $currentIndex,
                          headspace: 45,
                          sidesScaling: 0.98) { name in

                        Image(name)
                            .resizable()

                            .scaledToFill()
                            .frame(width: 87, height: 87, alignment: .bottom)
                            .offset(y: 7)

                }
                Spacer()
                    .frame(height: 60)
            }
            .padding([.top], 50)
            
           
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
