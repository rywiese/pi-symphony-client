//
//  Stream.swift
//  PiSymphony
//
//  Created by Ry Wiese on 7/28/21.
//

import Foundation

struct Stream: Codable {
    var id: String
    var meta: [String: String]
    var status: String
    var uri: Uri
}
