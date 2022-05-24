//
//  AnimatedText+.swift
//  Rinha
//
//  Created by Daniella Onishi on 10/05/22.
//

import Foundation
import SwiftUI

@available (iOS 14.0, macOS 10.16, *)
public struct AnimatedText: View {
    
    var charDuration: Double
    @Binding var input: String
    @State var string: String
    @State var isUpdating: Bool
    @State var nextValue: String?
    var textModifier: (Text)->(Text)
    
    public init(_ input: Binding<String>, charDuration: Double, modifier: @escaping (Text)->(Text)) {
        self._input = input
        
        self._string = State(initialValue: input.wrappedValue)
        self._isUpdating = State(initialValue: false)
        self.charDuration = charDuration
        self.textModifier = modifier
        
    }
    
    public var body: some View {
        HStack(alignment: .center, spacing: 0) {
            ForEach(Array(string.enumerated()), id: \.0) { (n, ch) in
                self.textModifier(Text(String(ch)))
                
            }
        }.onChange(of: input) { newValue in
            if self.string != newValue && !self.isUpdating{
                self.nextValue = newValue
                self.isUpdating = true
                animateStringChange(newValue: newValue)
            }
            
            if let nextValue = self.nextValue, nextValue != newValue && self.isUpdating {
                self.string = nextValue
                self.nextValue = newValue
                animateStringChange(newValue: newValue)
            }
        }
    }
    
    func animateStringChange(newValue: String) {
        DispatchQueue.main.async {
            self.string.removeAll()
            
            for (i, c) in newValue.enumerated() {
                DispatchQueue.main.asyncAfter(deadline: .now() + charDuration * Double(i)) {
                    self.string.append(c)
                }
            }
        }
    }
    
}


@available (iOS 14.0, macOS 10.16, *)
public struct SimpleAnimatedText: View {
    
    var charDuration: Double
    @State var string: String
    var nextValue: String?
    var textModifier: (Text)->(Text)
    var loop: Bool = false
    
    public init(_ input: String, charDuration: Double, loop: Bool = false, modifier: @escaping (Text)->(Text)) {
        
        self._string = State(initialValue: "")
        self.charDuration = charDuration
        self.textModifier = modifier
        self.loop = loop
        
        self.nextValue = input
    }
    
    public var body: some View {
        HStack(alignment: .center, spacing: 0) {
            ForEach(Array(string.enumerated()), id: \.0) { (n, ch) in
                self.textModifier(Text(String(ch)))
            }
        }.onAppear {
            animateStringChange(newValue: nextValue ?? "")
        }
    }
    
    func animateStringChange(newValue: String) {
        DispatchQueue.main.async {
            self.string.removeAll()
            
            for (i, c) in newValue.enumerated() {
                DispatchQueue.main.asyncAfter(deadline: .now() + charDuration * Double(i)) {
                    self.string.append(c)
                }
            }
        }
    }
    
}

public extension String {
    subscript(i: Int) -> String {
        return String(self[index(startIndex, offsetBy: i)])
    }
}
