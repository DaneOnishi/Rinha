//
//  2.1.2. LeaderboardCheerUpGodView.swift
//  Rinha
//
//  Created by Daniella Onishi on 21/05/22.
//

import SwiftUI

struct CheerUpGodView: View {
    var userList: [LeaderboardEntry] = [
        LeaderboardEntry(user: "Arnaldo", points: 12),
        LeaderboardEntry(user: "Armando", points: 34),
        LeaderboardEntry(user: "Sasha Meneghel", points: 23),
        LeaderboardEntry(user: "Tico", points: 0),
        LeaderboardEntry(user: "Blob Sampaio", points: 4)
    ]
    
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
                            ZStack(alignment: .leading) {
                                Rectangle()
                                    .frame(width: UIScreen.main.bounds.width - 60, height: 50, alignment: .center)
                                    .foregroundColor(.red)
                                    .cornerRadius(100)
                                
                                HStack(spacing: 34) {
                                    Text(entry.user)
                                        .foregroundColor(.white)
                                    Text(entry.points.description)
                                        .foregroundColor(.white)
                                        
                                }.padding(.horizontal)
                            }
                        }
                    }.padding(.top, 30)
                }
                
                
            }
        }
    }
}

struct __1_2__LeaderboardCheerUpGodView_Previews: PreviewProvider {
    static var previews: some View {
        CheerUpGodView()
    }
}
