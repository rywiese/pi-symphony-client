//
//  Query.swift
//  PiSymphony
//
//  Created by Ry Wiese on 7/28/21.
//

import Foundation

struct Query: Codable {
    var chunk_ms: String
    var codec: String
    var devicename: String
    var name: String
    var password: String
    var sampleformat: String
    var username: String
    var volume: String
}
