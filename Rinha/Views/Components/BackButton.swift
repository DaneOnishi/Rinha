//
//  Back-Button.swift
//  Rinha
//
//  Created by Bruno Imai on 12/05/22.
//

import SwiftUI

struct BackButton: View {
    @EnvironmentObject var coordinator: Coordinator
    
    var body: some View {
        Button(action: {
            print("Button pressed!")
            coordinator.switchBack()
        }) {
            Image("Back-Button")
                .resizable()
        }
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton()
    }
}
