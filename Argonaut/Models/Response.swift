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
    internal var json: NSDictionary
    
    init(json: NSDictionary)
        {
        self.json = json
        }
    }
