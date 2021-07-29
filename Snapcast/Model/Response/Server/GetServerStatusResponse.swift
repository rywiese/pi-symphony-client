//
//  GetServerStatusResponse.swift
//  PiSymphony
//
//  Created by Ry Wiese on 7/28/21.
//

import Foundation

struct GetServerStatusResponse: Decodable {
    var id: Int
    var jsonrpc: String
    var result: GetServerStatusResult
}
