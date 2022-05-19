//
//  TeamSelectionView.swift
//  Rinha
//
//  Created by Bruno Imai on 12/05/22.
//

import SwiftUI

struct TeamSelectionView: View {
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            VStack() {
                
                Spacer()
                ButtonStyle()
                    .offset(y: -40)
            }
            Background(text: "Choose your Team!")
            VStack{
                Spacer()
                HStack() {
                    
                    BackButton().frame(width: 50, height: 50)
                        .offset(x: 30, y: 10)
                    Spacer()
                }
            }
            VStack {
                Spacer()
                Button(action: {
                    print("Button pressed!")
                }) {
                    Image("Wood-Top")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 424, height: 270)
        
                }
                .clipShape(TopRectangleButtonShape())
                .contentShape(TopRectangleButtonShape())
                .offset(x: 50,y: -50)
                
                Button(action: {
                    print("Button pressed!")
                }) {
                    Image("Wood-Bottom")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 400, height: 250)
                }
                .clipShape(BottomRectangleButtonShape())
                .contentShape(BottomRectangleButtonShape())
                .offset(y: -50)
                Spacer()
                
            }
        }
    }
}

struct TeamSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TeamSelectionView()

        }
    }
}
