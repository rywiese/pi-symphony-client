//
//  JsonRpcClient.swift
//  PiSymphony
//
//  Created by Ry Wiese on 7/28/21.
//

import Foundation

class JsonRpcClient {
    
    let httpRequester: HttpRequester = HttpRequester(
        hostname: "pi1",
        port: 1780
    )
    
    func getServerStatus() throws -> GetServerStatusResponse {
        try postWithResponse(
            request: GetServerStatusRequest()
        )
    }
    
    func muteClient(
        clientId: String
    ) throws {
        try post(
            request: MuteRequest(
                params: MuteParams(
                    id: clientId,
                    volume: Mute(
                        muted: true
                    )
                )
            )
        )
    }
    
    func unMuteClient(
        clientId: String
    ) throws {
        try post(
            request: MuteRequest(
                params: MuteParams(
                    id: clientId,
                    volume: Mute(
                        muted: false
                    )
                )
            )
        )
    }
    
    func post<S : Encodable>(
        request: S
    ) throws {
        try postWithData(request: request)
    }
    
    func postWithResponse<S : Encodable, T : Decodable>(
        request: S
    ) throws -> T {
        try JSONDecoder().decode(
            T.self,
            from: postWithData(request: request)
        )
    }
    
    func postWithData<S : Encodable>(
        request: S
    ) throws -> Data {
        try httpRequester.post(
            endpoint: "/jsonrpc",
            body: JSONEncoder().encode(request)
        )
    }
    
}
