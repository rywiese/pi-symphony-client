//
//  SpeakerListView.swift
//  PiSymphony
//
//  Created by Ry Wiese on 11/28/20.
//

import SwiftUI

struct SpeakerListView: View {
    var backendClient: BackendClient
    var body: some View {
        List(backendClient.listSpeakers()) { speaker in
            SpeakerView(speaker: speaker, backendClient: backendClient)
        }
    }
}

struct SpeakerListView_Previews: PreviewProvider {
    static var previews: some View {
        SpeakerListView(backendClient: DummyBackendClient())
    }
}
