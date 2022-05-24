//
//  WebSocketClient.swift
//  mDNS_Browser
//
//  Created by Thiago Medeiros on 09/05/22.
//

import Foundation
import Network

class WebSocketClient: NSObject, ObservableObject {
    
    @Published var connectState: String = ""
    
    private var socket: NWWebSocket?
    
    //MARK: - This is settimng up a new connection once the service is identified/selected
    ///Now we just have to receive incoming data
    func bonjourToSocket(called: String, serviceTCPName: String, serviceDomain: String) {
        guard !called.isEmpty else { return }
        self.socket = NWWebSocket(name: called, port: 2177)
        
        self.socket?.delegate = self
        
        self.socket?.connect()
    }
    
    func sendTestSocket() {
        self.socket?.send(string: "New host connected")
    }
    
    func sendMessage() {
        self.socket?.send(string: "fanUp")
    }
    
    enum TableMessages: String {
        case fanUp
    }
    
}

extension WebSocketClient: WebSocketConnectionDelegate {
    func webSocketDidConnect(connection: WebSocketConnection) {
        print("Connected to WS server")
        self.connectState = "Connection state: Connected"
    }
    
    func webSocketDidDisconnect(connection: WebSocketConnection, closeCode: NWProtocolWebSocket.CloseCode, reason: Data?) {
        print("Disconnected from WS server")
        self.connectState = "Connection state: Disconnected"
    }
    
    func webSocketViabilityDidChange(connection: WebSocketConnection, isViable: Bool) {
        print("New WS connection viability \(isViable)")
    }
    
    func webSocketDidAttemptBetterPathMigration(result: Result<WebSocketConnection, NWError>) {
        print("Connection path migrated: \(result)")
    }
    
    func webSocketDidReceiveError(connection: WebSocketConnection, error: NWError) {
        print("WS connection error \(error.localizedDescription)")
        connection.disconnect(closeCode: .privateCode(4001))
    }
    
    func webSocketDidReceivePong(connection: WebSocketConnection) {
        print("WS connection pong!")
    }
    
    func webSocketDidReceiveMessage(connection: WebSocketConnection, string: String) {
        print("New WS message: \(string)")
    }
    
    func webSocketDidReceiveMessage(connection: WebSocketConnection, data: Data) {
        print("New WS message: \(data)")
    }
}
