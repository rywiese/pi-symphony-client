//
//  Speaker.swift
//  PiSymphony
//
//  Created by Ry Wiese on 11/28/20.
//

import Foundation

struct Speaker: Hashable, Codable, Identifiable {
    var id: String
    var isEnabled: Bool
}
