//
//  ChatBotClient.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 28/06/24.
//

import Foundation
import SocketIO

class ChatBotClient: NSObject {
    static let shared = ChatBotClient()
    
    var manager: SocketManager?
    var socket: SocketIOClient?
    var username: String?
    var userId: String?
    
    struct UserMessageModel: SocketData {
        let userId: String
        let userMessage: String
        let connectionId: String
        
        func socketRepresentation() -> SocketData {
            return [
                "userId": userId,
                "userMessage": userMessage,
                "connectionId": connectionId
            ]
        }
    }
    
    override init() {
        super.init()
        configureClient()
    }
    
    private func configureClient() {
        if let url = URL(string: "https://meet.walkycam.com:2096") {
            manager = SocketManager(socketURL: url)
            socket = manager?.defaultSocket
        }
    }
    
    func connect(username: String, userID: String) {
        self.username = username
        self.userId = userID
        socket?.connect(withPayload: ["username": username])
    }
    
    func disconnect() {
        socket?.disconnect()
    }
    
    func sendMessage(_ message: String) {
        guard let userId = userId,
        let socketId = socket?.sid else { return }
        let model = UserMessageModel(userId: userId, userMessage: message, connectionId: socketId)
        print(model)
        socket?.emit("sendWalkyMessage", model)
    }
    
    func sendUsername(_ username: String) {
        socket?.emit("sendUsername", username)
    }
    
    struct Response: Decodable {
        let message: String
    }
    
    func receiveMessage(_ completion: @escaping (String) -> Void) {
        socket?.on("receiveWalkyMessage") { data, ack in
            print(data)
            
            if let messageData = data.first as? [String: Any],
               let chatData = messageData["chat"] as? [String: Any],
               let messages = chatData["messages"] as? [[String: Any]],
               let firstMessage = messages.first,
               let message = firstMessage["message"] as? String {
                completion(message)
            }
        }
    }

    
    func receiveNewUser(_ completion: @escaping (String, [String:String]) -> Void) {
        socket?.on("receiveNewUser") { data, _ in
            if let username = data[0] as? String,
               let users = data[1] as? [String:String] {
                completion(username, users)
            }
        }
    }
}
