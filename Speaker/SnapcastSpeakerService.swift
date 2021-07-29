//
//  SnapcastSpeakerService.swift
//  PiSymphony
//
//  Created by Ry Wiese on 7/29/21.
//

import Foundation

class SnapcastSpeakerService : SpeakerService {

    let jsonRpcClient: JsonRpcClient
    
    init(
        jsonRpcClient: JsonRpcClient
    ) {
        self.jsonRpcClient = jsonRpcClient
    }

    func listSpeakers() -> Array<Speaker> {
        do {
            print("Listing speakers.")
            return try jsonRpcClient
                .getServerStatus()
                .result
                .server
                .groups
                .map { group -> Speaker in
                    let client = group.clients.first!
                    return Speaker(
                        id: client.id,
                        name: client.host.name,
                        isConnected: client.connected,
                        isMuted: client.config.volume.muted,
                        volume: client.config.volume.percent
                    )
                }
                .filter { speaker -> Bool in
                    speaker.isConnected
                }
        } catch let error {
            print("Failed to list speakers. Error:")
            print(error)
            return []
        }
    }
    
    func muteSpeaker(
        speakerId: String
    ) {
        do {
            print("Muting speaker \(speakerId).")
            try jsonRpcClient.muteClient(
                clientId: speakerId
            )
        } catch let error {
            print("Failed to mute speaker \(speakerId). Error:")
            print(error)
            // TODO: Who should handle these errors
        }
    }
    
    func unmuteSpeaker(
        speakerId: String
    ) {
        do {
            print("Unmuting speaker \(speakerId).")
            try jsonRpcClient.unMuteClient(
                clientId: speakerId
            )
        } catch let error {
            print("Failed to unmute speaker \(speakerId). Error:")
            print(error)
            // TODO: Who should handle these errors
        }
    }

}
