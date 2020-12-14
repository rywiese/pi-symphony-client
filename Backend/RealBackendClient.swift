//
//  RealBackendClient.swift
//  PiSymphony
//
//  Created by Ry Wiese on 11/28/20.
//

import Foundation

struct RealBackendClient: BackendClient {
    let requestBuilder: RequestBuilder = RequestBuilder(hostname: "localhost", port: 3000)
    
    let hostUrl = "http://localhost:3000"
    
    let session = URLSession.shared
    
    let dummyBackendClient: BackendClient = DummyBackendClient()
    
    func listSpeakers() -> Array<Speaker> {
        do {
            let json = try JSONSerialization.jsonObject(with: requestBuilder.get(endpoint: "/speakers"), options: []) as? [[String: Any]]
            let speakers = json?.map { speakerJson -> Speaker in
                let id: String = (speakerJson["id"] as? String)!
                let isEnabledInt: Int = (speakerJson["is_enabled"] as? Int)!
                var isEnabled: Bool = false
                if (isEnabledInt == 1) {
                    isEnabled = true
                }
                return Speaker(id: id, isEnabled: isEnabled)
            }
            return speakers!
        } catch {
            return []
        }
    }

    func enableSpeaker(id: String) {
        requestBuilder.put(endpoint: "/speakers/\(encode(string: id))/enable")
    }

    func disableSpeaker(id: String) {
        requestBuilder.put(endpoint: "/speakers/\(encode(string: id))/disable")
    }

    func encode(string: String) -> String {
        return string.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!
    }
}
