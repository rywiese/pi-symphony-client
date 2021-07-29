//
//  SnapServer.swift
//  PiSymphony
//
//  Created by Ry Wiese on 7/28/21.
//

import Foundation

struct SnapServer: Codable {
    var controlProtocolVersion: Int
    var name: String
    var protocolVersion: Int
    var version: String
}
