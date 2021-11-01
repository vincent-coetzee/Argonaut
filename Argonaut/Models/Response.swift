//
//  Response.swift
//  Argonaut
//
//  Created by Vincent Coetzee on 31/10/21.
//

import Foundation

///
/// Responses track responses from the server
///
public class Response
    {
    internal var group: Group
        {
        let main = Group(key: "Response")
        main.addChild(self.rawJSON,atKey: "data")
        return(main)
        }
        
    internal var rawJSON: NSDictionary
    
    init(rawJSON: NSDictionary)
        {
        self.rawJSON = rawJSON
        }
    }
