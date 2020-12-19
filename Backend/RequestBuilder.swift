//
//  RequestBuilder.swift
//  PiSymphony
//
//  Created by Ry Wiese on 12/13/20.
//

import Foundation

class RequestBuilder {
    var hostname: String
    var port: Int
    let session = URLSession.shared
    
    enum HttpError: Error {
        case notFoundError
        case unexpectedError
    }
    
    init(hostname: String, port: Int) {
        self.hostname = hostname
        self.port = port
    }
    
    func get(endpoint: String) -> Data {
        send(verb: "GET", endpoint: endpoint)
    }
    
    func put(endpoint: String) {
        send(verb: "PUT", endpoint: endpoint)
    }
    
    func send(verb: String, endpoint: String) -> Data {
        let url = URL(string: "http://\(hostname):\(port)\(endpoint)")
        var request = URLRequest(url: url!)
        request.httpMethod = verb
        var urlResponse: HTTPURLResponse? = nil
        var requestData: Data? = nil
        let semaphore = DispatchSemaphore.init(value: 0)
        let task = session.dataTask(with: request) { data, response, error in
            if error != nil {print(error)}
            urlResponse = response as! HTTPURLResponse
            requestData = data!
            semaphore.signal()
        }.resume()
        semaphore.wait()
        //if urlResponse?.statusCode == 404 { throw HttpError.notFoundError }
        //if urlResponse?.statusCode == 500 { throw HttpError.unexpectedError }
        return requestData!
    }
}
