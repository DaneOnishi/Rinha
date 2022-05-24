//
//  PunchConter.swift
//  Rinha
//
//  Created by Bruno Imai on 23/05/22.
//

import SwiftUI

struct PunchConter: View {
    
    @Binding var conter : Int
    
    var body: some View {
        Image("PunchCounter")
            .resizable()
            .frame(width: 200, height: 100, alignment: .center)
            .overlay(alignment: .center) { ImageOverlay(text: String(conter), textSize: 24, color: "WhiteFontColor") }
    }
}


