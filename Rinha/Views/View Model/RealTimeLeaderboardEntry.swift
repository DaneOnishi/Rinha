//
//  RealTimeLeaderboardEntry.swift
//  Rinha
//
//  Created by Daniella Onishi on 24/05/22.
//

import Foundation

struct realTimeLeaderboardEntry {
    var position : Int
    var name: String
    
    var id: String {
        "\(name)_\(position)"
    }
}
