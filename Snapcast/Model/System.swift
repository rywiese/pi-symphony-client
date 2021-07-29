//
//  System.swift
//  PiSymphony
//
//  Created by Ry Wiese on 7/28/21.
//

import Foundation

struct System: Codable {
    var groups: [Group]
    var server: Server
    var streams: [Stream]
}
