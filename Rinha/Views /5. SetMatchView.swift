//
//  4.SetMatchView.swift
//  Rinha
//
//  Created by Daniella Onishi on 16/05/22.
//

import SwiftUI

struct __SetMatchView: View {
    
    @State var state: MatchState
    
    @EnvironmentObject var coordinator: Coordinator

    var body: some View {
        ZStack {
            Image("Background-Big")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
             
            VStack(spacing: 20) {
                SimpleAnimatedText(state.switchTitle, charDuration: 0.3, modifier: {
                    text in text .foregroundColor(.gray)
                        .font(.system(size: 12, weight: .bold, design: .rounded))
                })
                    
              
                .padding(10)
                ZStack {
                    Image("Circle")
                        .resizable()
                        .frame(width: 250, height: 225, alignment: .center)
                        .padding()
                    Image(SessionManager.shared.playerCharacter!.carouselImageSmall)
                        .resizable()
                        .frame(width: 200, height: 200, alignment: .center)
                        .offset(y: 10)
                }
                
                    ButtonStyle(text: state.switchButtonTitle) {
                        SessionManager.shared.player1 = SessionManager.shared.playerCharacter!
                        coordinator.switchScreen(to: .queue)
                    }.disabled(state == .twoPlayer)
                    .opacity((state == .twoPlayer ) ? 0.3 : 1)
                    
                    ButtonStyle(text: "Watch Match") {
                        coordinator.switchScreen(to: .teamSelection)
                    }
            }
        }
    }
}

struct SetMatchView_Previews: PreviewProvider {
    static var previews: some View {
        __SetMatchView(state: .noPlayer)
    }
}

enum MatchState {
    
    case noPlayer
    case onePlayer
    case twoPlayer
    
    var switchTitle: String {
        switch self {
        case .noPlayer:
            SessionManager.shared.matchState = .noPlayer
            return "There is no match happening right now"
        case .onePlayer:
            SessionManager.shared.matchState = .onePlayer
            return "blob has started a match, what do you want to do?"
        case .twoPlayer:
            SessionManager.shared.matchState = .twoPlayer
            return "blob vs. zlob is ready to start"
        default:
            return "Let's go garotas"
        }
    }
    
    var switchButtonTitle: String {
        switch self {
        case .noPlayer:
            return "Host"
        case .onePlayer:
            return "Defy User"
        case .twoPlayer:
            return "Defy User"
        }
    }
    
    var switchNavigation: some View {
        switch self {
        case .noPlayer:
            return EmptyView()
        case .onePlayer:
            return EmptyView()
        case .twoPlayer:
            return EmptyView()
        }
    }
    
}
