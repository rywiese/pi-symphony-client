//
//  BackendClient.swift
//  PiSymphony
//
//  Created by Ry Wiese on 11/29/20.
//

import Foundation

protocol BackendClient {
    func listSpeakers() -> Array<Speaker>
    func enableSpeaker(id: String) -> Void
    func disableSpeaker(id: String) -> Void
}
