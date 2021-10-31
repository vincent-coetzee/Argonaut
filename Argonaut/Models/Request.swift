//
//  Request.swift
//  Argonaut
//
//  Created by Vincent Coetzee on 31/10/21.
//

import Foundation

internal class Request
    {
    public let index = UUID()
    
    public let url: URL
    public let payload: Data
    public let json: NSDictionary
    public var headers: Array<String>
    public let method: String
    
    init(method: String,url: URL,payload: Data,json: NSDictionary,headers: Array<String> = [])
        {
        self.method = method
        self.url = url
        self.payload = payload
        self.headers = headers
        self.json = json
        }
    }
