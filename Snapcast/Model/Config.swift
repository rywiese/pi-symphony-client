//
//  Config.swift
//  PiSymphony
//
//  Created by Ry Wiese on 7/28/21.
//

import Foundation

struct Config: Codable {
    var instance: Int
    var latency: Int
    var name: String
    var volume: Volume
}
