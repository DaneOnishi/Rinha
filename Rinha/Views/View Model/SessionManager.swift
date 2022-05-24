//
//  SessionManager.swift
//  Rinha
//
//  Created by Daniella Onishi on 21/05/22.
//

import Foundation

class SessionManager {
    static let shared = SessionManager()
    private init() {}
    
    var playerCharacter: Character?
    
    var matchState : MatchState?
    
    var player1: Character = Character(rawValue: "rat")!
    var player2: Character = Character(rawValue: "duck")!
    
    var firstTeam: [QueueItem] = []
    var secondTeam: [QueueItem] = []
}
