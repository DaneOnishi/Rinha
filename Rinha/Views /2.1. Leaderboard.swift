//
//  Leaderboard.swift
//  Rinha
//
//  Created by Daniella Onishi on 20/05/22.
//

import SwiftUI
import RealityKit

struct Leaderboard: View {
   
    @State private var offset = CGSize.zero
    @State var textInput = ""
    let screenWidth = UIScreen.main.bounds.size.width
    @State var actualView: ShowView = .matchMaster
    @EnvironmentObject var coordinator: Coordinator
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            Background(text: "Leaderboard")
            
            VStack {
                    SegmentedView(actualView: $actualView)
            }
            .padding(.top, 100)
        }
        
    }
}

struct SegmentedView : View {
    var width = UIScreen.main.bounds.width
    @Binding var actualView: ShowView
    
    var body: some View{
        
        VStack(spacing: 0){
            
            AppBar2(actualView: $actualView)
            
            GeometryReader{g in
                
                HStack(spacing: 0){
                    
                    switch actualView {
                    case .matchMaster:
                        MatchMasterView(userList: [
                            LeaderboardEntry(user: "nana", points: 30, position: 1, state: "down.arrow")
                                ,
                            LeaderboardEntry(user: "nono", points: 32, position: 2, state: "up.arrow")
                        ])
                            .frame(width: g.frame(in : .global).width)
                            
                           
                    case .cheerUpGod:
                        MatchMasterView(userList: [
                            LeaderboardEntry(user: "Glub", points: 33, position: 1, state: "down.arrow"),
                            LeaderboardEntry(user: "Blob", points: 34, position: 2, state: "up.arrow")
                            ])
                            .frame(width: g.frame(in : .global).width)
                    }
                }
            }
        }
        .animation(.easeInOut)
        .edgesIgnoringSafeArea(.all)
    }
    
}

struct AppBar2 : View {
    var width = UIScreen.main.bounds.width
    @Binding var actualView: ShowView
    
    var body: some View{
        
        ZStack(alignment: .center) {
            Rectangle()
                .foregroundColor(.gray.opacity(0.1))
                .cornerRadius(100)
                .frame(width: UIScreen.main.bounds.width - 100, height: UIScreen.main.bounds.height / 17, alignment: .center)
                .padding(.top, 40)
            
            VStack(alignment: .center, content: {
                HStack{
                    Button(action: {
                        actualView = .matchMaster
                    }) {
                        
                        VStack(spacing: 8){
                            
                            ZStack(){
                                Rectangle()
                                    .fill(actualView == .matchMaster ? .white : .clear)
                                    .frame(width: 140, height: 40)
                                    .cornerRadius(100)
                                
                                Text("Match Master")
                                    .foregroundColor( actualView == .matchMaster ? Color("BackgroundColor") : .white.opacity(0.4))
                            }
                        }
                    }
                    
                    Button(action: {
                        actualView = .cheerUpGod
                        
                    }) {
                        
                        VStack(spacing: 8){
                            
                            ZStack(){
                                Rectangle()
                                    .fill(actualView == .cheerUpGod ? .white : .clear)
                                    .frame(width: 140, height: 40)
                                    .cornerRadius(100)
                                
                                Text("Cheer Up God")
                                    .foregroundColor(actualView == .cheerUpGod ? Color("BackgroundColor") : .white.opacity(0.4))
                            }
                        }
                    }
                }
            })
            .padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top) ?? 0 + 15)
            .padding(.horizontal)
        .padding(.bottom, 10)
        }
    }
}

enum ShowView {
    case matchMaster
    case cheerUpGod
}


struct Leaderboard_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Leaderboard()
            Leaderboard()
                .previewDevice("iPod touch (7th generation)")
        }
    }
}
