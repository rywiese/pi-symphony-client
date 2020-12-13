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
        requestBuilder.get(endpoint: "/speakers")
        return dummyBackendClient.listSpeakers()
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
