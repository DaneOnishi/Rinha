//
//  MainButton.swift
//  Rinha
//
//  Created by Daniella Onishi on 16/05/22.
//

import SwiftUI

struct RoundedCorner: InsettableShape {
    var insetAmount = 0.0
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: corners, cornerRadii: CGSize(width:
                                                                                    radius, height: radius))
        return Path(path.cgPath)
    }
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var roundedCorner = self
        roundedCorner.insetAmount += amount
        
        return roundedCorner
    }
}

struct MainButton: View {
    var text: String = ""
    let strokeWidth: CGFloat = 16
    
    var action: (() -> Void)? = nil
    
    var body: some View {
        Button {
            action?()
        } label: {
            Text(text)
                .padding(30)
                .frame(maxWidth: .infinity)
                .background(Color.brown)
                .clipShape(Capsule())
                .foregroundColor(.white)
                .overlay(
                    Capsule()
                        .strokeBorder(
                            LinearGradient(colors: [.red, .blue], startPoint: .leading, endPoint: .trailing),
                            lineWidth: strokeWidth
                        )
                )
                .overlay(
                    Capsule()
                        .strokeBorder(
                            LinearGradient(colors: [.pink, .green], startPoint: .leading, endPoint: .trailing),
                            lineWidth: strokeWidth / 2
                        )
                )
        }
        
    }
}

struct MainButton_Previews: PreviewProvider {
    static var previews: some View {
        MainButton(text: "Thiago Onishi Ravier")
    }
}
