//
//  SpeakerService.swift
//  PiSymphony
//
//  Created by Ry Wiese on 7/29/21.
//

import Foundation

protocol SpeakerService {

    func listSpeakers() -> Array<Speaker>
    
    func muteSpeaker(speakerId: String)
    
    func unmuteSpeaker(speakerId: String)

}
