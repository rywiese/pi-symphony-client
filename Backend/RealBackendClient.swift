//
//  RealBackendClient.swift
//  PiSymphony
//
//  Created by Ry Wiese on 11/28/20.
//

import Foundation

struct RealBackendClient: BackendClient {
    let requestBuilder: RequestBuilder = RequestBuilder(hostname: "linuxbook", port: 3000)
    
    let session = URLSession.shared
    
    func listSpeakers() -> Array<Speaker> {
        do {
            let json = try JSONSerialization.jsonObject(with: requestBuilder.get(endpoint: "/speakers"), options: []) as? [[String: Any]]
            let speakers = json?.map { speakerJson -> Speaker in
                let id: String = (speakerJson["id"] as? String)!
                let isEnabled: Bool = (speakerJson["is_enabled"] as? Int)! == 1 ? true : false
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
