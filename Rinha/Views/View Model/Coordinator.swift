//
//  Coordinator.swift
//  Rinha
//
//  Created by Daniella Onishi on 22/05/22.
//

import Foundation

protocol CoordinatorTransitioner: AnyObject {
    func triggerTransition(duration: Double, onStart: (() -> ())?, onMiddle: (() -> ())?, onEnd: (() -> ())?)
}

class Coordinator: ObservableObject {
    enum Screen {
        case splash
        case mainMenu
        case leaderboard
        case infoView
        case connecting
        case chooseFighter
        case setMatch
        case teamSelection
        case queue
        case game
    }
    
    @Published var currentScreen: Screen = .game
    
    var screenHistory: [Screen] = []
    
    weak var transitioner: CoordinatorTransitioner?
    
    func switchScreen(to newScreen: Screen, addCurrentToHistory: Bool = true) {
        transitioner?.triggerTransition(duration: 0.812733, onStart: nil, onMiddle: {
            if addCurrentToHistory {
                self.screenHistory.append(self.currentScreen)
            }
            self.currentScreen = newScreen
        }, onEnd: nil)
    }
    
    func switchBack() {
        guard let previousScreen = screenHistory.last else { return }
        screenHistory.removeLast()
        switchScreen(to: previousScreen, addCurrentToHistory: false)
    }
}
