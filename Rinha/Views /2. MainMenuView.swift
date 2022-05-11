//
//  MainMenuView.swift
//  Rinha
//
//  Created by Daniella Onishi on 09/05/22.
//

import SwiftUI

struct MainMenuView: View {
    var body: some View {
        ZStack {
            Image("Background-Main")
                .resizable()
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
