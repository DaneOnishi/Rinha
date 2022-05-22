//
//  SpecialEffectsView.swift
//  Rinha
//
//  Created by Daniella Onishi on 22/05/22.
//

import SwiftUI

struct SpecialEffectsView: View {
    var body: some View {
        ZStack {
            ForEach(0..<3) { i in
                let randomSize = CGFloat.random(in: 200...400)
                VStack {
                    LottieView(lottieFile: "Confetti", loopMode: .repeat(3))
                        .frame(width: randomSize, height: randomSize, alignment: .center)
                    
                }.padding(.top, CGFloat.random(in: -500...500))
                    .padding(.leading, CGFloat.random(in: -200...200))
                    .padding(.trailing, CGFloat.random(in: -200...200))
                    .padding(.bottom, CGFloat.random(in: -500...500))
            }
            
            ForEach(0..<3) { i in
                let randomSize = CGFloat.random(in: 200...400)
                VStack {
                    LottieView(lottieFile: "Fireworks", loopMode: .repeat(3))
                        .frame(width: randomSize, height: randomSize, alignment: .center)
                    
                }.padding(.top, CGFloat.random(in: -500...500))
                    .padding(.leading, CGFloat.random(in: -200...200))
                    .padding(.trailing, CGFloat.random(in: -200...200))
                    .padding(.bottom, CGFloat.random(in: -500...500))
            }
        }
    }
}

struct SpecialEffectsView_Previews: PreviewProvider {
    static var previews: some View {
        SpecialEffectsView()
    }
}
