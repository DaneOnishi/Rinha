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
    
    var character: Character?
    
    var firstTeam: [QueueItem] = []
    var secondTeam: [QueueItem] = []
}
