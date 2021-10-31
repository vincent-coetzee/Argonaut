//
//  JSONArrayItem.swift
//  Argonaut
//
//  Created by Vincent Coetzee on 31/10/21.
//

import AppKit

internal class JSONArrayItem: JSONElementItem
    {
    internal override var typeIcon: NSImage
        {
        if let icon = NSImage(named: "JSONArrayIcon")
            {
            icon.isTemplate = true
            return(icon)
            }
        return(NSImage())
        }
        
    internal override var value: String
        {
        "\(self.array.count) items"
        }
        
    internal override var childCount: Int
        {
        self.array.count
        }
        
    internal override var isExpandable: Bool
        {
        self.array.count > 0
        }
        
    internal var children: JSONElementItems?
    internal var array: NSArray
    
    internal init(name: String,array: NSArray)
        {
        self.array = array
        super.init(name: name)
        }
        
    internal override func child(atIndex: Int) -> JSONElementItem
        {
        if children.isNil
            {
            var newKids = JSONElementItems()
            for index in 0..<self.array.count
                {
                newKids.append(JSONElementItem.element(with: "\(index)", from: array[index]))
                }
            self.children = newKids
            }
        return(self.children![atIndex])
        }
    }
