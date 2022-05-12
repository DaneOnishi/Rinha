//
//  Background.swift
//  Rinha
//
//  Created by Bruno Imai on 11/05/22.
//

import SwiftUI

struct Background: View {
    var text : String
    var textSize : CGFloat = 16
    
    var body: some View {
        ZStack (alignment: .top) {
            Image("Background-Frame")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .allowsHitTesting(false)
            
            ImageOverlay(text: text ,textSize: textSize)
                .frame(maxWidth: 210, minHeight: 70, alignment: .center)
        }
    }
}


struct Background_Previews: PreviewProvider {

    static var previews: some View {
        Background(text: "dbshjbbadshsbk")
    }
}
