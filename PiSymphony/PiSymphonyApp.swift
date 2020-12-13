//
//  PiSymphonyApp.swift
//  PiSymphony
//
//  Created by Ry Wiese on 11/28/20.
//

import SwiftUI

@main
struct PiSymphonyApp: App {
    var body: some Scene {
        WindowGroup {
            SpeakerListView(backendClient: RealBackendClient())
        }
    }
}
