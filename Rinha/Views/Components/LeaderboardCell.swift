//
//  LeaderboardCell.swift
//  Rinha
//
//  Created by Daniella Onishi on 21/05/22.
//

import SwiftUI

struct LeaderboardCell: View {
    
    var state: String = "up.arrow"
    var position: Int = 1
    var user: String = "Blob"
    var points: Int = 32
    
    let entry: LeaderboardEntry
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(width: UIScreen.main.bounds.width - 100, height: 50, alignment: .center)
                .foregroundColor(Color("Rose"))
                .cornerRadius(100)
            
            HStack(spacing: 34) {
                HStack {
                    Image(entry.state)
                    .foregroundColor(.white)
                    Text(entry.position.description)
                    .foregroundColor(.white)
                }.padding(.trailing, -15)
                HStack {
                ZStack {
                    Circle()
                        .frame(width: 40, height: 40, alignment: .center)
                    .foregroundColor(Color("Blanch-Rose"))
                    Circle()
                        .frame(width: 30, height: 30, alignment: .center)
                        .foregroundColor(.white)
                }
                
                    Text(entry.user)
                    .foregroundColor(.white)
                }
                
                Text(entry.points.description + " points")
                    .foregroundColor(.white)
                    .padding(.trailing, 40)
                
            }.padding(.horizontal)
        }.padding(.top, 30)
    }
}

struct LeaderboardCell_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardCell(entry: LeaderboardEntry(user: "Nonito", points: 3, position: 1, state: "up.arrow"))
    }
}
