//
//  ButtonStyle.swift
//  Rinha
//
//  Created by Bruno Imai on 11/05/22.
//

import SwiftUI

struct Button: View {
    var body: some View {
        Button(action: {
            print("Button pressed!")
        }) {
            
            Image("Button")
                .resizable()
                .scaledToFill()
                .padding([.leading, .trailing], 16)
        }
        .frame(height: 124)
    }
    
}


struct ButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button()
    }
}
