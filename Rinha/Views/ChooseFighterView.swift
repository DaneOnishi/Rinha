//
//  ChooseFighterView.swift
//  Rinha
//
//  Created by Bruno Imai on 10/05/22.
//

import SwiftUI
import ACarousel

struct Item: Identifiable {
    let id = UUID()
    let image: Image
}
let roles = ["rato5", "rato1", "rato2", "rato3", "rato4"]

struct ChooseFighterView: View {

    let items: [Item] = roles.map { Item(image: Image($0)) }
    @State var currentIndex: Int = 0
    
    var body: some View {

        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            VStack {
                ZStack {
                 Image("Big-Character-Circle")
                        .resizable()
                        .frame(width: 345, height: 345)
                        .clipShape(Circle())
                    Image(roles[currentIndex])
                    .resizable()
                    .scaledToFill()
                    .frame(width: 233, height: 233, alignment: .bottom)
                    .clipShape(Circle())
                    .offset(y: 21)
                }
                
                
               ACarousel(roles, id: \.self,
                         index: $currentIndex, headspace: 120,
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
                Spacer()
                ButtonStyle()

            }
    

        }

    }

}



struct ChooseFighterView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseFighterView()
    }
}
