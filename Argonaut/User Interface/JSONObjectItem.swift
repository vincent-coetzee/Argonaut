//
//  JSONObjectItem.swift
//  Argonaut
//
//  Created by Vincent Coetzee on 31/10/21.
//

import Cocoa

internal class JSONObjectItem: JSONElementItem
    {
    internal override var typeIcon: NSImage
        {
        NSImage(named: "JSONIconObject")!
        }
        
    internal override var value: String
        {
        "\(self.children.count) fields"
        }
        
    internal override var childCount: Int
        {
        self.children.count
        }
        
    internal override var isExpandable: Bool
        {
        self.children.count > 0
        }
        
    private let dictionary: NSDictionary
    private var children: JSONElementItems = []
    
    internal init(name: String,dictionary: NSDictionary)
        {
        self.dictionary = dictionary
        super.init(name: name)
        for (key,value) in self.dictionary
            {
            self.children.append(JSONElementItem.element(with: key as! String, from: value))
            }
        }
        
    internal override func child(atIndex: Int) -> JSONElementItem
        {
        return(self.children[atIndex])
        }
    }
