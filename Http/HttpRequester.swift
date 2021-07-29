//
//  HttpRequester.swift
//  PiSymphony
//
//  Created by Ry Wiese on 12/13/20.
//

import Foundation

class HttpRequester {
    let hostname: String
    let port: Int
    let session = URLSession.shared
    
    init(hostname: String, port: Int) {
        self.hostname = hostname
        self.port = port
    }

    func post(
        endpoint: String = "/",
        body: Data
    ) -> Data {
        send(
            verb: "POST",
            endpoint: endpoint,
            body: body
        )
    }
    
    func send(
        verb: String,
        endpoint: String,
        body: Data? = nil
    ) -> Data {
        let url = URL(string: "http://\(hostname):\(port)\(endpoint)")
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = verb
        urlRequest.httpBody = body
        urlRequest.setValue(
            "application/json",
            forHTTPHeaderField: "Content-Type"
        )
        return blockingSend(
            urlRequest: urlRequest
        )
    }
    
    func blockingSend(
        urlRequest: URLRequest
    ) -> Data {
        var urlResponseBody: Data? = nil
        let semaphore = DispatchSemaphore.init(value: 0)
        session
            .dataTask(with: urlRequest) { data, response, error in
                urlResponseBody = data
                semaphore.signal()
            }
            .resume()
        semaphore.wait()
        return urlResponseBody!
    }
}
