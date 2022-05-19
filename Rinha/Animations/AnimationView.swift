//
//  AnimationView.swift
//  Rinha
//
//  Created by Daniella Onishi on 16/05/22.
//

import SwiftUI

struct FrameAnimationView: View {
    @StateObject var vm: FrameAnimationOptions
    
    var body: some View {
        Image(vm.currentImage)
    }
}

class FrameAnimationOptions: ObservableObject {
    
    private var timer: Timer?
    var frameList: [String]
    var timePerFrame: Double
    private var lastIndex = 0
    
    @Published var currentImage = ""
    
    init(_ frameList: [String], timePerFrame: Double) {
        self.frameList = frameList
        self.timePerFrame = timePerFrame
        
        timer = Timer.scheduledTimer(withTimeInterval: self.timePerFrame, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            self.lastIndex = (self.lastIndex + 1) % self.frameList.count
            self.currentImage = self.frameList[self.lastIndex]
        }
    }
    
    deinit {
        timer?.invalidate()
    }
}
