//
//  2.1.2. LeaderboardCheerUpGodView.swift
//  Rinha
//
//  Created by Daniella Onishi on 21/05/22.
//

import SwiftUI


struct CheerUpGodView: View {
    var userList: [LeaderboardEntry]
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    HStack {
                        Image("Small-Chracter-Circle")
                            .resizable()
                            .frame(width: 100, height: 100, alignment: .leading)
                            .padding(.leading, 40)
                        Image("Small-Chracter-Circle")
                            .resizable()
                            .frame(width: 150, height: 150, alignment: .leading)
                            .padding(-10)
                        
                        Image("Small-Chracter-Circle")
                            .resizable()
                            .frame(width: 100, height: 100, alignment: .leading)
                            .padding(.trailing, 40)
                    }.padding(.top, 32)
                    
                    VStack {
                        ForEach(userList, id: \.id) { entry in
                            LeaderboardCell(entry: entry)
                            
                        }
                    }
                }
            }
        }
    }
}
    
    struct __1_2__LeaderboardCheerUpGodView_Previews: PreviewProvider {
        static var previews: some View {
            CheerUpGodView(userList: [
                LeaderboardEntry(user: "Ratatoing", points: 13, position: 1, state: "down.arrow"),
                LeaderboardEntry(user: "Blob", points: 12, position: 2, state: "up.arrow")
                ])
        }
    }
