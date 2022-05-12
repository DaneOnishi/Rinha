//
//  MatchView.swift
//  Rinha
//
//  Created by Bruno Imai on 12/05/22.
//

import SwiftUI

struct MatchView: View {
    
    var challengerName : String = "Blob"
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Image("Second-Screen-Circle")
                    .resizable()
                    .frame(width: 300, height: 220, alignment: .center)
                Spacer()
                ButtonStyle(text: "Defy User!")
                ButtonStyle(text: "Watch match")
                Spacer()
            }
            
            Background(text: challengerName + " started a match! What you want to do?", textSize: 12)
            
            VStack{
                Spacer()
                HStack() {
                    BackButton().frame(width: 50, height: 50)
                        .offset(x: 17, y: 10)
                    Spacer()
                }
            }
        }
    }
}

struct MatchView_Previews: PreviewProvider {
    static var previews: some View {
        MatchView()
    }
}
