//
//  JSONGroupItem.swift
//  Argonaut
//
//  Created by Vincent Coetzee on 1/11/21.
//

import Cocoa

internal class JSONGroupItem: JSONElementItem
    {
    internal override var typeIcon: NSImage
        {
        NSImage()
        }
        
    internal override var value: String
        {
        "\(self.children.count) elements"
        }
        
    internal override var childCount: Int
        {
        self.children.count
        }
        
    internal override var isExpandable: Bool
        {
        self.children.count > 0
        }
        
    private let group: Group
    private var children: JSONElementItems = []
    
    internal init(name: String,group: Group)
        {
        self.group = group
        super.init(name: name)
        for (key,value) in self.group.kids
            {
            self.children.append(JSONElementItem.element(with: key as! String, from: value))
            }
        }
        
    internal override func child(atIndex: Int) -> JSONElementItem
        {
        return(self.children[atIndex])
        }
    }
