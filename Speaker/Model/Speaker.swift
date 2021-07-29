//
//  Speaker.swift
//  PiSymphony
//
//  Created by Ry Wiese on 11/28/20.
//

import Foundation

struct Speaker: Hashable, Codable, Identifiable {
    let id: String
    let name: String
    let isConnected: Bool
    var isMuted: Bool
    let volume: Int
}
