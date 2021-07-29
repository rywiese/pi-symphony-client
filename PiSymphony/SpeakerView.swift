//
//  SpeakerView.swift
//  PiSymphony
//
//  Created by Ry Wiese on 11/28/20.
//

import SwiftUI

struct SpeakerView: View {
    @State var speaker: Speaker
    let speakerService: SpeakerService
    var body: some View {
        Toggle(
            speaker.name,
            isOn: Binding<Bool>(
                get: { !speaker.isMuted },
                set: { bool in speaker.isMuted = !bool }
            )
        )
            .onChange(
                of: speaker.isMuted,
                perform: { value in
                    if value {
                        speakerService.muteSpeaker(
                            speakerId: speaker.id
                        )
                    } else {
                        speakerService.unmuteSpeaker(
                            speakerId: speaker.id
                        )
                    }
                }
            )
            .padding()
    }
}

struct SpeakerView_Previews: PreviewProvider {
    static var previews: some View {
        SpeakerView(
            speaker: Speaker(
                id: "1234",
                name: "Living Room",
                isConnected: true,
                isMuted: false,
                volume: 100
            ),
            speakerService: DummySpeakerService()
        )
    }
}
