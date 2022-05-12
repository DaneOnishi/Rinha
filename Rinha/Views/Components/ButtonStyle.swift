//
//  ButtonStyle.swift
//  Rinha
//
//  Created by Bruno Imai on 11/05/22.
//

import SwiftUI

struct ButtonStyle: View {
    @State var text = "Continue"
    var body: some View {
        Button(action: {
            print("Button pressed!")
        }) {
            Image("Button")
                .resizable()
                .scaledToFill()
                .frame(minWidth: 260, minHeight: 100)
                .padding(50)
                .overlay(ImageOverlay(text: text, color: "WhiteFontColor"), alignment: .center)
        }
        .frame(height: 124)
    }
    
    
}


struct ButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStyle()
    }
}
