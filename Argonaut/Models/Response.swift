//
//  Response.swift
//  Argonaut
//
//  Created by Vincent Coetzee on 31/10/21.
//

import Foundation

public class Response
    {
    private unowned var request: Request?
    private var payload: NSDictionary
    
    init(request: Request,payload: NSDictionary)
        {
        self.request = request
        self.payload = payload
        }
    }
