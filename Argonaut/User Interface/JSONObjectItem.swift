//
//  JSONObjectItem.swift
//  Argonaut
//
//  Created by Vincent Coetzee on 31/10/21.
//

import Foundation

internal class JSONObjectItem: JSONElementItem
    {
    private let dictionary: NSDictionary
    
    internal init(name: String,dictionary: NSDictionary)
        {
        self.dictionary = dictionary
        super.init(name: name)
        }
    }
