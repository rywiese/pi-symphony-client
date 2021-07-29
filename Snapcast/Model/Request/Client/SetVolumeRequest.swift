//
//  SetVolumeRequest.swift
//  PiSymphony
//
//  Created by Ry Wiese on 7/29/21.
//

import Foundation

struct SetVolumeRequest: Encodable {
    let id: Int
    let jsonrpc: String
    let method: String
    let params: SetVolumeParams
}
