//
//  ShakeDetection.swift
//  Rinha
//
//  Created by Bruno Imai on 22/05/22.
//

import SwiftUI

public extension Notification.Name {
  static let shakeEnded = Notification.Name("ShakeEnded")
}

public extension UIWindow {
  override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
    if motion == .motionShake {
      NotificationCenter.default.post(name: .shakeEnded, object: nil)
    }
    super.motionEnded(motion, with: event)
  }
}

struct ShakeDetector: ViewModifier {
  let onShake: () -> Void

  func body(content: Content) -> some View {
    content
      .onAppear() // this has to be here because of a SwiftUI bug
      .onReceive(NotificationCenter.default.publisher(for: .shakeEnded)) { _ in
        onShake()
          print("chaqualhei")
      }
  }
}

extension View {
  func onShake(perform action: @escaping () -> Void) -> some View {
    self.modifier(ShakeDetector(onShake: action))
  }
}
