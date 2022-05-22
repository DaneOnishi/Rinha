//
//  ImageOverlay.swift
//  Rinha
//
//  Created by Bruno Imai on 11/05/22.
//

import SwiftUI

struct ImageOverlay: View {
    var text : String
    var textSize : CGFloat = 16
    var color : String = "BackgroundColor"
    
    var body: some View {
        Text(text)
            .padding(6)
            .foregroundColor(Color(color))
            .font(.custom("PressStart2P", size: textSize))
            .multilineTextAlignment(.center)
    }
}

struct ImageOverlay_Previews: PreviewProvider {
    static var previews: some View {
        ImageOverlay(text: "asdasdasdasd sdfsd")

    }
}
