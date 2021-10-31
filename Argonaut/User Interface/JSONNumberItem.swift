//
//  JSONNumberItem.swift
//  Argonaut
//
//  Created by Vincent Coetzee on 31/10/21.
//

import Foundation

internal class JSONNumberItem: JSONElementItem
    {
    private let number: NSNumber
    
    init(name: String,number: NSNumber)
        {
        self.number = number
        super.init(name: name)
        }
    }
