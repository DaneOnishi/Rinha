//
//  LeaderboardEntry.swift
//  Rinha
//
//  Created by Daniella Onishi on 21/05/22.
//

import Foundation

struct LeaderboardEntry {
    let user: String
    let points: Int
    let position: Int
    let state: String
    
    var id: String {
        "\(user)_\(points)"
    }
}
