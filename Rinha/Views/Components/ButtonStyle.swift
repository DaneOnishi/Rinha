//
//  ButtonStyle.swift
//  Rinha
//
//  Created by Bruno Imai on 11/05/22.
//

import SwiftUI

struct ButtonStyle: View {
    @State var text = "Continue"
    @State var onPress: (() -> ())? = nil
    
    var body: some View {
        Button(action: {
            print("Button pressed!")
            onPress?()
            SFXMusicSingleton.shared.playPunchSound()
        }) {
            Image("Button")
                .resizable()
                .scaledToFill()
                .frame(minWidth: 220, minHeight: 80)
                .padding(.horizontal, 50)
                .overlay(ImageOverlay(text: text, color: "WhiteFontColor"), alignment: .center)
            
        }
        .frame(height: 100)
        .contentShape(Rectangle())
    }
}


struct ButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStyle()
    }
}
