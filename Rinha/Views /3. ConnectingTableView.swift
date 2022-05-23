//
//  3.ConnectingTableView.swift
//  Rinha
//
//  Created by Daniella Onishi on 10/05/22.
//

import SwiftUI

struct __ConnectingTableView: View {
    @State var text: String = "..."
    @EnvironmentObject var coordinator: Coordinator
    
    private let serviceType   = "_airhockey._tcp"
    private let netDomain = "local."
    @State private var deviceName: String = ""
    
    @StateObject var bonjourBrowser = mCastBrowser()
    @StateObject var wsClient = WebSocketClient()
    
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
                    
                    SimpleAnimatedText("Connecting to table...", charDuration: 0.06) { text in
                        text.bold()
                            .foregroundColor(.white)
                    }
                    
                    Text(wsClient.connectState)
                }
            }
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                coordinator.switchScreen(to: .chooseFighter)
            }
        }
        .onAppear {
            self.bonjourBrowser.scan(typeOf: serviceType, domain: netDomain)
        }
        .onChange(of: self.bonjourBrowser.devices) { newDevices in
            let newDevice = newDevices.last!
            self.deviceName = newDevice.device
            
            self.wsClient.bonjourToSocket(called: self.deviceName, serviceTCPName: serviceType, serviceDomain: netDomain)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                print("Sending test socket")
                self.wsClient.sendTestSocket()
            }
        }
    }
}

struct __ConnectingTableView_Previews: PreviewProvider {
    static var previews: some View {
        __ConnectingTableView()
    }
}
