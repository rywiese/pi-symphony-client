//
//  SpeakerListView.swift
//  PiSymphony
//
//  Created by Ry Wiese on 11/28/20.
//

import SwiftUI

struct SpeakerListView: View {
    let speakerService: SpeakerService
    var body: some View {
        List(
            speakerService.listSpeakers()
        ) { speaker in
            SpeakerView(
                speaker: speaker,
                speakerService: speakerService
            )
        }
    }
}

struct SpeakerListView_Previews: PreviewProvider {
    static var previews: some View {
        SpeakerListView(
            speakerService: DummySpeakerService()
        )
    }
}
