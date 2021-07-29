//
//  Uri.swift
//  PiSymphony
//
//  Created by Ry Wiese on 7/28/21.
//

import Foundation

struct Uri: Codable {
    var fragment: String
    var host: String
    var path: String
    var query: Query
    var raw: String
    var scheme: String
}
