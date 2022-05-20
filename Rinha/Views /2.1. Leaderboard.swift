//
//  Leaderboard.swift
//  Rinha
//
//  Created by Daniella Onishi on 20/05/22.
//

import SwiftUI
import RealityKit

struct Leaderboard: View {
    var userList: [String] = ["Arnaldo", "Armando", "Truco", "Tobby", "Amanda", "Sasha Meneghel", "Blob Sampaio"]
    var body: some View {
        ZStack {
            Background(text: "Leaderboard")
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
                }.padding(.top, 200)
                ScrollView {
                    VStack {
                        ForEach(userList, id: \.self) { user in
                            ZStack {
                                Rectangle()
                                    .frame(width: UIScreen.main.bounds.width - 60, height: 50, alignment: .center)
                                    .foregroundColor(.red)
                                    .cornerRadius(100)
                                
                                Text(user)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                }.padding(.top, 50)
                    
                
            }
        }
    }
}

struct Leaderboard_Previews: PreviewProvider {
    static var previews: some View {
        Leaderboard()
    }
}
