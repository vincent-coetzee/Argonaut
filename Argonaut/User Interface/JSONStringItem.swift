//
//  JSONStringItem.swift
//  Argonaut
//
//  Created by Vincent Coetzee on 31/10/21.
//

import Cocoa

internal class JSONStringItem: JSONElementItem
    {
    internal override var typeIcon: NSImage
        {
        NSImage(named: "JSONIconString")!
        }
        
    internal override var value: String
        {
        self.string
        }
        
    private let string: String
    
    init(name: String,string: NSString)
        {
        self.string = string as String
        super.init(name: name)
        }
    }
