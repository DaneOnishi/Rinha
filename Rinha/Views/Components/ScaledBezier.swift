//
//  ScaledBezier.swift
//  Rinha
//
//  Created by Bruno Imai on 13/05/22.
//

import UIKit
import SwiftUI

struct BottomRectangleButtonShape: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: 50, y: 0))
        path.addLine(to: CGPoint(x: 0, y: 53.5))
        path.addLine(to: CGPoint(x: 376, y: 760.5))
        path.addLine(to: CGPoint(x: 376.5, y: 760))
        path.addLine(to: CGPoint(x: 1096.5, y: 377.5))
        path.addLine(to: CGPoint(x: 913.5, y: 33.5))
        path.addLine(to: CGPoint(x: 50, y: 0))
        path.close()
        return Path(path.cgPath).scaled(for: rect)
    }
}

struct TopRectangleButtonShape: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: 805.5, y: 1.5))
        path.addLine(to: CGPoint(x: 1, y: 143))
        path.addLine(to: CGPoint(x: 69, y: 526.5))
        path.addLine(to: CGPoint(x: 880, y: 825.5))
        path.addLine(to: CGPoint(x: 944.5, y: 789.5))
        path.addLine(to: CGPoint(x: 805.5, y: 1.5))
        path.close()
        return Path(path.cgPath).scaled(for: rect)
    }
}

extension Path {
    func scaled(for rect: CGRect) -> Path {
        let scaleX = rect.width/boundingRect.width
        let scaleY = rect.height/boundingRect.height
        let scale = min(scaleX, scaleY)
        return applying(CGAffineTransform(scaleX: scale, y: scale))
    }
}

