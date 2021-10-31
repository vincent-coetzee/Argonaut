//
//  Query.swift
//  Argonaut
//
//  Created by Vincent Coetzee on 31/10/21.
//

import Foundation

internal class Query
    {
    internal static func makeRandomQuery() throws -> Query
        {
        let name = RemoteServer.kServerURL
        let date = Date()
        let squad = Squad.makeRandomSquad()
        let data = try JSONEncoder().encode(squad)
        if let json = try JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary
            {
            let request = Request(method: "POST", url: URL(string: RemoteServer.kServerURL)!,payload: data,json: json)
            return(Query(name: name, date: date, request: request))
            }
        throw(RequestResult.convertingToJSONFailed)
        }
        
    internal static let dateFormatter =
        {
        () -> DateFormatter in
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
        return(formatter)
        }()
        
    internal var dateString: String
        {
        Self.dateFormatter.string(from: self.date)
        }
        
    internal let name: String
    internal let date: Date
    internal let request: Request
    internal var response: Response?
    
    init(name: String,date: Date,request: Request)
        {
        self.name = name
        self.date = date
        self.request = request
        }
    }

internal typealias Queries = Array<Query>
