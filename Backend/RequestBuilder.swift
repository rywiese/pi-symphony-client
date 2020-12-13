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
    
    init(hostname: String, port: Int) {
        self.hostname = hostname
        self.port = port
    }
    
    func get(endpoint: String) {
        send(verb: "GET", endpoint: endpoint)
    }
    
    func put(endpoint: String) {
        send(verb: "PUT", endpoint: endpoint)
    }
    
    func send(verb: String, endpoint: String) {
        let url = URL(string: "http://\(hostname):\(port)\(endpoint)")
        var request = URLRequest(url: url!)
        request.httpMethod = verb
        let task = session.dataTask(with: request) { data, response, error in
            print(data!)
            print(response!)
        }
        task.resume()
    }
}
