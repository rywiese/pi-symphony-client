//
//  GetServerStatusRequest.swift
//  PiSymphony
//
//  Created by Ry Wiese on 7/29/21.
//

import Foundation

struct GetServerStatusRequest: Encodable {
    let id: Int = 0
    let jsonrpc: String = "2.0"
    let method: String = "Server.GetStatus"
}
