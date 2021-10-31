//
//  JSONNumberItem.swift
//  Argonaut
//
//  Created by Vincent Coetzee on 31/10/21.
//

import Cocoa

internal class JSONNumberItem: JSONElementItem
    {
    internal override var typeIcon: NSImage
        {
        NSImage(named: "JSONIconNumber")!
        }
        
    internal override var value: String
        {
        "\(self.number)"
        }
        
    private let number: NSNumber
    
    init(name: String,number: NSNumber)
        {
        self.number = number
        super.init(name: name)
        }
    }
