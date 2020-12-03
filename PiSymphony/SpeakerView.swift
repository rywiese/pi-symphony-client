//
//  SpeakerView.swift
//  PiSymphony
//
//  Created by Ry Wiese on 11/28/20.
//

import SwiftUI

struct SpeakerView: View {
    @State var speaker: Speaker
    var backendClient: BackendClient
    var body: some View {
        Toggle(speaker.id, isOn: $speaker.isEnabled)
            .onChange(of: speaker.isEnabled, perform: { value in
                if value {
                    backendClient.enableSpeaker(id: speaker.id)
                } else {
                    backendClient.disableSpeaker(id: speaker.id)
                }
            })
            .padding()
    }
}

struct SpeakerView_Previews: PreviewProvider {
    static var previews: some View {
        SpeakerView(
            speaker: Speaker(id: "Living Room", isEnabled: true),
            backendClient: DummyBackendClient()
        )
    }
}
