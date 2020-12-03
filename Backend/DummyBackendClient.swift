//
//  DummyBackendClient.swift
//  PiSymphony
//
//  Created by Ry Wiese on 11/29/20.
//

import Foundation

struct DummyBackendClient: BackendClient {
    func listSpeakers() -> Array<Speaker> {
        return [
            Speaker(id: "Desk", isEnabled: true),
            Speaker(id: "Bedside", isEnabled: true),
            Speaker(id: "Bathroom", isEnabled: true),
            Speaker(id: "Living Room", isEnabled: false),
            Speaker(id: "Kitchen", isEnabled: false)
        ]

    }
    
    func enableSpeaker(id: String) -> Void {
        print("Enabling speaker \(id)")
    }
    
    func disableSpeaker(id: String) -> Void {
        print("Disabling speaker \(id)")
    }

}
