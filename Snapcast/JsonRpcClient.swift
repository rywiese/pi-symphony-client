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
        do {
            print("Trying to get server status.")
            return try JSONDecoder().decode(
                GetServerStatusResponse.self,
                from: httpRequester.post(
                    endpoint: "/jsonrpc",
                    body: JSONEncoder().encode(GetServerStatusRequest())
                )
            )
        } catch let error {
            print("Failed to get server status. Error: \(error)")
            throw error
        }
    }
    
    func muteClient(
        clientId: String
    ) throws {
        try httpRequester.post(
            endpoint: "/jsonrpc",
            body: JSONEncoder().encode(
                SetVolumeRequest(
                    id: 0,
                    jsonrpc: "2.0",
                    method: "Client.SetVolume",
                    params: SetVolumeParams(
                        id: clientId,
                        volume: Volume(
                            muted: true,
                            percent: 100
                        )
                    )
                )
            )
        )
    }
    
    func unMuteClient(
        clientId: String
    ) throws {
        try httpRequester.post(
            endpoint: "/jsonrpc",
            body: JSONEncoder().encode(
                SetVolumeRequest(
                    id: 0,
                    jsonrpc: "2.0",
                    method: "Client.SetVolume",
                    params: SetVolumeParams(
                        id: clientId,
                        volume: Volume(
                            muted: false,
                            percent: 100
                        )
                    )
                )
            )
        )
    }
    
}
