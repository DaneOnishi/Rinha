//
//  LottieView.swift
//  Rinha
//
//  Created by Daniella Onishi on 19/05/22.
//


import SwiftUI
import Lottie
 
struct LottieView: UIViewRepresentable {
    let lottieFile: String
    let loopMode: LottieLoopMode
 
    let animationView = AnimationView()
    
    init(lottieFile: String, loopMode: LottieLoopMode = .playOnce) {
        self.lottieFile = lottieFile
        self.loopMode = loopMode
    }
 
    func makeUIView(context: Context) -> some UIView {
        let view = UIView(frame: .zero)
 
        animationView.animation = Animation.named(lottieFile)
        animationView.contentMode = .scaleAspectFit
        animationView.play()
        animationView.loopMode = loopMode
 
        view.addSubview(animationView)
 
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        animationView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
 
        return view
    }
 
    func updateUIView(_ uiView: UIViewType, context: Context) {
 
    }
}
