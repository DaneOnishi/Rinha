//
//  PunchBagView.swift
//  Rinha
//
//  Created by Bruno Imai on 23/05/22.
//

import SwiftUI

struct PunchBagView: View {
    let music =  SFXMusicSingleton.shared
    
    @State var puncheCont = 0
    @State var sackPosition = "PunchSack"
    
    var body: some View {
        
        ZStack {
            Color("PunchBagMinigameColor")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image(sackPosition)
                    .resizable()
                    .frame(width: 200, height: 600)
                    .offset(y: 100)
                    .onTapGesture {
                        if puncheCont <= 100 {
                            if puncheCont % 2 == 0 {
                                sackPosition = "PunchSackLeft"
                            } else {
                                sackPosition = "PunchSackRight"
                            }
                            puncheCont += 1
                            music.playPunchSound()
                        }
                    }
                    .gesture(
                        TapGesture()
                            .onEnded ({
                                sackPosition = "PunchSack"
                            })
                    )
                    .overlay(alignment: .top) {
                        PunchConter(conter: $puncheCont)
                            .offset(y: 100)
                        
                    }
                    Spacer()
            }
            Background(text: "Punch the Punchbag 100 Times!", textSize: 14)
            
        }

    }
}

struct PunchBagView_Previews: PreviewProvider {
    static var previews: some View {
        PunchBagView()
    }
}
