//
//  ChooseFighterView.swift
//  Rinha
//
//  Created by Bruno Imai on 10/05/22.
//

import SwiftUI

struct ChooseFighterView: View {
    @State private var index = 0
       var body: some View {
           VStack{
               TabView(selection: $index) {
                   ForEach((0..<3), id: \.self) { index in
                       CardView()
                   }
               }
               .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
               HStack(spacing: 2) {
                   ForEach((0..<3), id: \.self) { index in
                       Circle()
                           .fill(index == self.index ? Color.purple : Color.purple.opacity(0.5))
                           .frame(width: 20, height: 20)

                   }
               }
               .padding()
               
               HStack(spacing: 2) {
                   ForEach((0..<3), id: \.self) { index in
                       Rectangle()
                           .fill(index == self.index ? Color.purple : Color.purple.opacity(0.5))
                           .frame(width: 20, height: 20)

                   }
               }
               .padding()
               
               HStack(spacing: 2) {
                   ForEach((0..<3), id: \.self) { index in
                       Rectangle()
                           .fill(index == self.index ? Color.purple : Color.purple.opacity(0.5))
                           .frame(width: 30, height: 5)

                   }
               }
               .padding()
               
               HStack(spacing: 2) {
                   ForEach((0..<3), id: \.self) { index in
                       Rectangle()
                           .fill(index == self.index ? Color.purple : Color.purple.opacity(0.5))
                           .frame(height: 5)
                   }
               }
               .padding()
           }
           .frame(height: 200)
       }
   }


struct CardView: View{
   var body: some View{
       Rectangle()
           .fill(Color.pink)
           .frame(height: 200)
           .border(Color.black)
           .padding()
   }
}

struct ChooseFighterView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseFighterView()
    }
}
