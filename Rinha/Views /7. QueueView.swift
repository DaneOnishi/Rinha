//
//  QueueView.swift
//  Rinha
//
//  Created by Daniella Onishi on 21/05/22.
//

import SwiftUI

struct QueueView: View {
    var userList: [String] = ["", "", ""]
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            Background(text: "The match is about to start")
            
            VStack {
                HStack {
                    Image("Big-Character-Circle")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.width / 3, alignment: .leading)
                    Image("Big-Character-Circle")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.width / 3, alignment: .trailing)
                }
                
                
                
                HStack {
                    VStack {
                        ForEach(userList, id: \.self) { entry in
                            Image("Small-Chracter-Placeholder")
                                .resizable()
                                .frame(width: UIScreen.main.bounds.width / 4, height: UIScreen.main.bounds.width / 4, alignment: .leading)
                            
                        }
                    }.padding(.trailing, 40)
                    VStack {
                        ForEach(userList, id: \.self) { entry in
                            Image("Small-Chracter-Placeholder")
                                .resizable()
                                .frame(width: UIScreen.main.bounds.width / 4, height: UIScreen.main.bounds.width / 4, alignment: .trailing)
                            
                        }
                    }
                }
                .padding()
            }
        }
    }
}

enum state {
    case userActive
    case userInactive
    
    var isUserActive: String {
        switch self {
        case .userActive:
            return "Small-Chracter-Circle"
        case .userInactive:
            return "Small-Chracter-Placeholder"
        }
    }
}

struct QueueView_Previews: PreviewProvider {
    static var previews: some View {
        QueueView()
    }
}
