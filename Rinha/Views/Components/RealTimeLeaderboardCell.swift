//
//  RealTimeLeaderboardCell.swift
//  Rinha
//
//  Created by Daniella Onishi on 23/05/22.
//

import SwiftUI

struct RealTimeLeaderboardCell: View {
    var userInfo: realTimeLeaderboardEntry
    var body: some View {
        ZStack {
            Image("Real-Time-Leaderboard")
                .resizable()
                .frame(width: 80, height: 80, alignment: .center)
            Text(userInfo.position.description)
                .padding(.leading, 4)
                .padding(.top, 60)
                .font(.custom("PressStart2P", size: 8))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
            
        }
    }
}

struct RealTimeLeaderboardCell_Previews: PreviewProvider {
    static var previews: some View {
        RealTimeLeaderboardCell(userInfo: realTimeLeaderboardEntry(position: 1, name: "Armando"))
    }
}
