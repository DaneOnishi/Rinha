//
//  WinnerCard.swift
//  Rinha
//
//  Created by Daniella Onishi on 20/05/22.
//

import SwiftUI

struct WinnerCard: View {
    var user: String = "User"
    
    var body: some View {
        ZStack {
            Image("Winner-Card")
                .resizable()
                .frame(width: UIScreen.main.bounds.width - 40, height: UIScreen.main.bounds.height / 1.7, alignment: .center)
            Text("\(user) Wins")
                .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 5.2)
                .foregroundColor(.white)
        }
    }
}

struct WinnerCard_Previews: PreviewProvider {
    static var previews: some View {
        WinnerCard()
    }
}
