//
//  JSONElementItem.swift
//  Argonaut
//
//  Created by Vincent Coetzee on 31/10/21.
//

import AppKit

internal class JSONElementItem
    {
    internal class func element(with name: String,from element: Any) -> JSONElementItem
        {
        if element is NSDictionary
            {
            return(JSONObjectItem(name: name,dictionary: element as! NSDictionary))
            }
        return(JSONElementItem(name:""))
        }
        
    internal var typeIcon: NSImage
        {
        fatalError("This should have been overridden in a subclass.")
        }
        
    internal var value: String
        {
        fatalError("This should have been overridden in a subclass.")
        }
        
    internal var childCount: Int
        {
        0
        }
        
    internal var isExpandable: Bool
        {
        false
        }
        
    internal var name: String = ""
        
    internal init(name: String)
        {
        self.name = name
        }
        
    internal func child(atIndex: Int) -> JSONElementItem
        {
        fatalError("This should not have been called on this class.")
        }
    }

internal typealias JSONElementItems = Array<JSONElementItem>
