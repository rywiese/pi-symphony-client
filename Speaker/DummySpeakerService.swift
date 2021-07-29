//
//  DummySpeakerService.swift
//  PiSymphony
//
//  Created by Ry Wiese on 7/29/21.
//

import Foundation

class DummySpeakerService: SpeakerService {

    func listSpeakers() -> Array<Speaker> {
        print("Listing speakers.")
        return [
            Speaker(
                id: "1",
                name: "Living Room",
                isConnected: true,
                isMuted: false,
                volume: 100
            ),
            Speaker(
                id: "2",
                name: "Bedroom",
                isConnected: true,
                isMuted: false,
                volume: 100
            )
        ]
    }

    func muteSpeaker(speakerId: String) {
        print("Muting speaker \(speakerId)")
    }

    func unmuteSpeaker(speakerId: String) {
        print("Unmuting speaker \(speakerId)")
    }

}
