//
//  JSONStringItem.swift
//  Argonaut
//
//  Created by Vincent Coetzee on 31/10/21.
//

import Foundation

internal class JSONStringItem: JSONElementItem
    {
    private let string: NSString
    
    init(name: String,string: NSString)
        {
        self.string = string
        super.init(name: name)
        }
    }
