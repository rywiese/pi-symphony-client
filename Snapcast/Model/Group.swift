//
//  Group.swift
//  PiSymphony
//
//  Created by Ry Wiese on 7/28/21.
//

import Foundation

struct Group: Codable {
    var clients: [Client]
    var id: String
    var muted: Bool
    var name: String
    var stream_id: String
}
