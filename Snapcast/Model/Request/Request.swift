//
//  SnapcastRequest.swift
//  PiSymphony
//
//  Created by Ry Wiese on 7/29/21.
//

import Foundation

class Request: Encodable {
    
    let id: Int
    let jsonrpc: String
    let method: String
    
    init(
        method: String
    ) {
        self.id = 1
        self.jsonrpc = "2.0"
        self.method = method
    }
}
