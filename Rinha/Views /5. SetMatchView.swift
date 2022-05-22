//
//  4.SetMatchView.swift
//  Rinha
//
//  Created by Daniella Onishi on 16/05/22.
//

import SwiftUI

struct __SetMatchView: View {
    
    @State private var isHostButtonPressed = false
    @State private var isJoinButtonPressed = false
    @State private var isWatchMatchButtonPressed = false
    @State var state: MatchState

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
                
                Image("Circle")
                    .resizable()
                    .frame(width: 250, height: 225, alignment: .center)
                    .padding()
                
                Button {
                    isHostButtonPressed.toggle()
                } label: {
                    Image("Button")
                        .resizable()
                        .frame(width: 250, height: 90, alignment: .center)
                }
                
                MainButton(text: state.switchButtonTitle) {
                    print("Ravier")
                }
                .frame(width: 250)
            }
        }
    }
}

struct __SetMatchView_Previews: PreviewProvider {
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
            return "There is no match happening right now"
        case .onePlayer:
            return "blob has started a match, what do you want to do?"
        case .twoPlayer:
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
            return "U can't"
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