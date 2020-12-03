//
//  RealBackendClient.swift
//  PiSymphony
//
//  Created by Ry Wiese on 11/28/20.
//

import Foundation

struct RealBackendClient: BackendClient {
    let dummyBackendClient: BackendClient = DummyBackendClient()
    func listSpeakers() -> Array<Speaker> {
        // TODO
        dummyBackendClient.listSpeakers()
    }

    func enableSpeaker(id: String) {
        // TODO
        dummyBackendClient.enableSpeaker(id: id)
    }

    func disableSpeaker(id: String) {
        // TODO
        dummyBackendClient.disableSpeaker(id: id)
    }

}
