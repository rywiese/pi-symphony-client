//
//  GetServerStatusRequest.swift
//  PiSymphony
//
//  Created by Ry Wiese on 7/29/21.
//

import Foundation

class GetServerStatusRequest: Request {

    init() {
        super.init(
            method: "Server.GetStatus"
        )
    }

}
