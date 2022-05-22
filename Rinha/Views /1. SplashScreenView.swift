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
    @State var isMainMenuCalled = false
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .edgesIgnoringSafeArea(.all)
                LottieView(lottieFile: "Fire")
                    .frame(width: 150, height: 150, alignment: .center)
                
                NavigationLink(destination: MainMenuView(), isActive: $isMainMenuCalled, label: {
                    Image("main_logo").renderingMode(.original).frame(width: 100, height: 100)
                })
            }  .navigationBarHidden(true)
                .edgesIgnoringSafeArea([.top, .bottom])
        } .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.isMainMenuCalled.toggle()
            }
        }
    }
}
    
    struct SplashScreenView_Previews: PreviewProvider {
        static var previews: some View {
            SplashScreenView()
        }
    }
