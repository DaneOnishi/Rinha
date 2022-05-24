//
//  SplashScreenView.swift
//  Rinha
//
//  Created by Daniella Onishi on 09/05/22.
//

import SwiftUI
import Lottie
import AVFoundation

struct SplashScreenView: View {
    @EnvironmentObject var coordinator: Coordinator
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            LottieView(lottieFile: "Fire")
                .frame(width: 150, height: 150, alignment: .center)
            Image("main_logo").renderingMode(.original).frame(width: 100, height: 100)
        }
        .edgesIgnoringSafeArea([.top, .bottom])
        .onAppear {
            SFXMusicSingleton.shared.playFireSound()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                coordinator.switchScreen(to: .mainMenu)
            }
        }
    }
}
    struct SplashScreenView_Previews: PreviewProvider {
        static var previews: some View {
            SplashScreenView()
        }
    }
