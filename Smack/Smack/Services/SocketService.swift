//
//  SocketService.swift
//  Smack
//
//  Created by 이주원 on 2018. 2. 19..
//  Copyright © 2018년 이주원. All rights reserved.
//

import UIKit
//import Foundation
import SocketIO

class SocketService: NSObject {
    static let instance = SocketService()
    var manager: SocketManagerSpec
    var socket: SocketIOClient
    
    override init() {
        // Socket.IO API 문서 참조함
        manager = SocketManager(socketURL: URL(string: BASE_URL)!, config: [.log(true), .compress])
        socket = manager.defaultSocket
        super.init()
    }
    // SocketIO Client 객체 생성. API가 Swift 4에 최적화되면서 달라져 강의 내용과는 다르게 해야 한다.
    // 강의에서의 코드: var socket: SocketIOClient = SocketIOClient(socketURL: URL(BASE_URL)!)
    
    
    func establishConnection() {
        socket.connect()
        print("소켓 연결됨")
    }
    
    func closeConnection() {
        socket.disconnect()
        print("소켓 연결 끊음")
    }
    
    func addChannel(channelName: String, channelDescription: String, completion: @escaping CompletionHandler) {
        // mac-chat-api를 보면서 코딩함. src/index.js 참조
        self.socket.emit("newChannel", channelName, channelDescription)
        completion(true)
    }
    
    func getChannel(completion: @escaping CompletionHandler) {
        // mac-chat-api를 보면서 코딩함. src/index.js 참조
        socket.on("channelCreated") { (dataArray, ack) in
            guard let channelName = dataArray[0] as? String else { return }
            guard let channelDesc = dataArray[1] as? String else { return }
            guard let channelId = dataArray[2] as? String else { return }
            
            let newChannel = Channel(_id: channelId, name: channelName, description: channelDesc, __v: 0)
            MessageService.instance.channels.append(newChannel)
            completion(true)
        }
    }
}
