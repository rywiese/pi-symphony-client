//
//  SnapcastRequestWithParams.swift
//  PiSymphony
//
//  Created by Ry Wiese on 7/29/21.
//

import Foundation

class RequestWithParams<T: Params>: Request {
    let params: T
    
    init(
        method: String,
        params: T
    ) {
        self.params = params
        super.init(method: method)
    }

}
