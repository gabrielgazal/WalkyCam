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
    var chatId: String?
    
    struct UserMessageModel: SocketData {
        let userSenderId: String
        let message: String
        let chatId: String
        
        func socketRepresentation() -> SocketData {
            return [
                "userSenderId": userSenderId,
                "message": message,
                "chatId": chatId
            ]
        }
    }
    
    struct ResponseMessage: Codable {
        let id: Int
        let userSender: String
        let sentAt: String
        let receivedBy: [String]
        let readedBy: [String]
        let deletedBy: [String]
        let message: String
        let deletedFor: [String]
        let reaction: [String]
        
        enum CodingKeys: String, CodingKey {
            case id = "_id"
            case userSender = "id_user_sender"
            case sentAt = "sent_at"
            case receivedBy = "received_by"
            case readedBy = "readed_by"
            case deletedBy = "deleted_by"
            case message
            case deletedFor = "deleted_for"
            case reaction
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
    
    func connect(username: String, userID: String, chatId: String) {
        self.username = username
        self.userId = userID
        self.chatId = chatId
        socket?.connect(withPayload: ["username": username])
    }
    
    func disconnect() {
        socket?.disconnect()
    }
    
    func sendMessage(_ message: String) {
        guard let userId = userId,
        let chatId = chatId else { return }
        let model = UserMessageModel(userSenderId: userId, message: message, chatId: chatId)
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
        socket?.on("receiveWalkyMessage") { [weak self] data, ack in
            guard let self = self else { return }
            
            guard let messageData = data.first as? [String: Any],
                  let answerMessage = messageData["answer_message"] as? [String: Any],
                  let firstMessage = answerMessage["message"] as? String else {
                return
            }
            completion(firstMessage)
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
