//
//  Request.swift
//  Argonaut
//
//  Created by Vincent Coetzee on 31/10/21.
//

import Foundation

internal typealias StringDictionary = Dictionary<String,String>
internal typealias HeaderTuple = (key: String,value: String)

///
/// Requests track data sent to the server
/// 
internal class Request
    {
    public var group: Group
        {
        let main = Group(key: "Request")
        main.addChild(self.url.absoluteString,atKey: "URL")
        main.addChild(self.method,atKey: "Method")
        let group = Group(key: "Headers")
        main.addChild(group)
        for header in self.headers
            {
            group.addChild(header.value,atKey: header.key)
            }
        let body = Group(key: "Body")
        main.addChild(body)
        for (key,value) in rawJSON
            {
            body.addChild(value,atKey: key as! String)
            }
        return(main)
        }
        
    public let url: URL
    public let payload: Data
    public let rawJSON: NSDictionary
    public var headers: Array<HeaderTuple> = []
    public let method: String
    
    init(method: String,url: URL,payload: Data,rawJSON: NSDictionary,headers: Array<HeaderTuple> = [])
        {
        self.method = method
        self.url = url
        self.payload = payload
        self.headers = headers
        self.rawJSON = rawJSON
        }
    }
