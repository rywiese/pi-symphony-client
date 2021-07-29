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
        var request = URLRequest(url: url!)
        request.httpMethod = verb
        request.httpBody = body
        request.setValue(
            "application/json",
            forHTTPHeaderField: "Content-Type"
        )
        var urlResponse: HTTPURLResponse? = nil
        var responseBody: Data? = nil
        let semaphore = DispatchSemaphore.init(value: 0)
        let task = session.dataTask(with: request) { data, response, error in
            if error != nil {print(error)}
            urlResponse = response as! HTTPURLResponse
            if urlResponse?.statusCode != nil {print("status code: \(urlResponse?.statusCode)")}
            responseBody = data!
            semaphore.signal()
        }.resume()
        semaphore.wait()
        print(urlResponse)
        return responseBody!
    }
}
