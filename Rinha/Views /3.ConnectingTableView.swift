//
//  3.ConnectingTableView.swift
//  Rinha
//
//  Created by Daniella Onishi on 10/05/22.
//

import SwiftUI

struct __ConnectingTableView: View {
    @State var text: String = "..."
    var body: some View {
        VStack {
            ZStack {
                Image("Background-2")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack {
                    Image("Table")
                        .resizable()
                        .frame(width: 260, height: 227, alignment: .center)
                        .padding()
                    
                    SimpleAnimatedText("Connecting to table", charDuration: 0.06) {
                        text in
                        text.bold()
                            .foregroundColor(.white)
                        
                    }
                }
            }
        }
    }
}

struct __ConnectingTableView_Previews: PreviewProvider {
    static var previews: some View {
        __ConnectingTableView()
    }
}
