//
//  Client.swift
//  PiSymphony
//
//  Created by Ry Wiese on 7/28/21.
//

import Foundation

struct Client: Codable {
    var config: Config
    var connected: Bool
    var host: Host
    var id: String
    var lastSeen: LastSeen
    var snapclient: SnapClient
}
